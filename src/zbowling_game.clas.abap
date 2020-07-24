CLASS zbowling_game DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_frame,
             roll_1 TYPE i,
             roll_2 TYPE i,
             roll_3 TYPE i,
             score  TYPE i,
           END OF ty_frame,
           ty_frame_tab TYPE STANDARD TABLE OF ty_frame.
    METHODS get_total_score
      RETURNING
        VALUE(score) TYPE i.
    METHODS add_role
      IMPORTING
        VALUE(pins) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS x TYPE i VALUE 10.
    DATA frame TYPE i VALUE 1.
    DATA frame_tab TYPE ty_frame_tab.
    METHODS check_for_strike
      IMPORTING
        VALUE(pins_to_add) TYPE i
        check_frame        TYPE i DEFAULT 2.
    METHODS check_for_spare_or_strike
      IMPORTING
        VALUE(pins_to_add) TYPE i.
ENDCLASS.

CLASS zbowling_game IMPLEMENTATION.

  METHOD get_total_score.
    score = REDUCE #( INIT sum = 0 FOR f IN frame_tab NEXT sum = sum + f-score ).
  ENDMETHOD.

  METHOD add_role.
    IF frame < 11.
      "First 10 frames
      IF NOT line_exists( frame_tab[ frame ] ).
        "first throw in frame
        APPEND VALUE ty_frame( roll_1 = pins
                               score  = pins ) TO frame_tab.
        check_for_spare_or_strike( pins ).

        IF pins = x.
          "strike
          check_for_strike( pins_to_add = pins check_frame = 2 ).
          frame += 1.
        ENDIF.

      ELSE.
        "second throw in frame
        frame_tab[ frame ]-roll_2 = pins.
        frame_tab[ frame ]-score += pins.
        check_for_strike( pins_to_add = pins check_frame = 1 ).
        frame += 1.
      ENDIF.

    ELSE.
      "virtual 11th frame for 2nd and 3rd roll in 10th frame
      IF frame_tab[ frame - 1 ]-roll_2 IS INITIAL.
        "strike in 1st throw 10th frame -> now 2nd throw
        frame_tab[ frame - 1 ]-roll_2 = pins.
        frame_tab[ frame - 1 ]-score += pins.
        IF frame_tab[ frame - 2 ]-roll_1 = x.
          "strike in second last frame -> add next two throws
          frame_tab[ frame - 2 ]-score += pins.
        ENDIF.
      ELSE.
        "3rd  throw in 10th frame
        frame_tab[ frame - 1 ]-roll_3 = pins.
        frame_tab[ frame - 1 ]-score += pins.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD check_for_strike.

    IF frame > check_frame AND frame_tab[ frame - check_frame ]-roll_1 = x.
      "strike in check_frame -> add pins from next two throws
      frame_tab[ frame - check_frame ]-score += pins_to_add.
    ENDIF.

  ENDMETHOD.


  METHOD check_for_spare_or_strike.

    IF frame > 1 AND frame_tab[ frame - 1 ]-score = x.
      "strike or spare in last frame -> add next throw
      frame_tab[ frame - 1 ]-score += pins_to_add.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
