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
ENDCLASS.

CLASS zbowling_game IMPLEMENTATION.

  METHOD get_total_score.
    score = REDUCE #( INIT sum = 0 FOR f IN frame_tab NEXT sum = sum + f-score ).
  ENDMETHOD.

  METHOD add_role.
    IF frame < 11.
      IF pins = x. "Strike

        APPEND VALUE #( score = pins roll_1 = x ) TO frame_tab.
        IF frame > 1 AND frame_tab[ frame - 1 ]-score = x.
          frame_tab[ frame - 1 ]-score += pins.
        ENDIF.
        IF frame > 2 AND frame_tab[ frame - 2 ]-roll_1 = x.
          "strike in second last frame -> add next two throws
          frame_tab[ frame - 2 ]-score += pins.
        ENDIF.
        frame += 1.

      ELSE. "no Strike
        IF NOT line_exists( frame_tab[ frame ] ).
          "first throw in frame
          APPEND VALUE ty_frame( roll_1 = pins
                                 score  = pins ) TO frame_tab.
          IF frame > 1 AND frame_tab[ frame - 1 ]-score = x.
            "strike or spare in last frame -> add next throw
            frame_tab[ frame - 1 ]-score += pins.
          ENDIF.

        ELSE.
          "second throw in frame
          frame_tab[ frame ]-roll_2 = pins.
          frame_tab[ frame ]-score += pins.
          IF frame > 1 AND frame_tab[ frame - 1 ]-roll_1 = x.
            "strike in last frame -> add next two throws
            frame_tab[ frame - 1 ]-score += pins.
          ENDIF.
          frame += 1.
        ENDIF.
      ENDIF.

    ELSE.
      IF frame_tab[ frame - 1 ]-roll_2 IS INITIAL.
        frame_tab[ frame - 1 ]-roll_2 = pins.
        frame_tab[ frame - 1 ]-score += pins.
        IF frame_tab[ frame - 2 ]-roll_1 = x.
          "strike in second last frame -> add next two throws
          frame_tab[ frame - 2 ]-score += pins.
        ENDIF.
      ELSE.
        frame_tab[ frame - 1 ]-roll_3 = pins.
        frame_tab[ frame - 1 ]-score += pins.
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
