CLASS zh174_bowling_game DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_frame,
             throw_1 TYPE i,
             throw_2 TYPE i,
             throw_3 TYPE i,
             score   TYPE i,
           END OF ty_frame,
           ty_frame_tab TYPE STANDARD TABLE OF ty_frame.
    "! <p class="shorttext synchronized" lang="en">Calculate total score of the game.</p>
    "! Calcualtes the total score of the game at the time of the method call.
    "! @parameter score | <p class="shorttext synchronized" lang="en">Score fo the game.</p>
    METHODS get_total_score
      RETURNING
        VALUE(score) TYPE i.
    METHODS add_throw
      IMPORTING
        VALUE(pins) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS x TYPE i VALUE 10.
    DATA frame TYPE i VALUE 1.
    DATA frame_tab TYPE ty_frame_tab.
    "! <p class="shorttext synchronized" lang="en">Check past frames for strike/spare -> add pins from actual</p>
    "! Checks if in a past frame a strike or spare occured, in which case the pins of the actual throw have to be added to the past frame.
    "! @parameter pins_to_add | <p class="shorttext synchronized" lang="en">pins from actual frame</p>
    "! @parameter frame_to_check | <p class="shorttext synchronized" lang="en">frame that should be checked</p>
    METHODS check_frame
      IMPORTING
        VALUE(pins_to_add) TYPE i
        VALUE(frame_to_check) TYPE i.
ENDCLASS.

CLASS zh174_bowling_game IMPLEMENTATION.

  METHOD get_total_score.
    score = REDUCE #( INIT sum = 0 FOR f IN frame_tab NEXT sum = sum + f-score ).
  ENDMETHOD.

  METHOD add_throw.
    IF frame <= 10.
      "First 10 frames
      IF NOT line_exists( frame_tab[ frame ] ).
        "first throw in frame
        APPEND VALUE ty_frame( throw_1 = pins
                               score   = pins ) TO frame_tab.
        check_frame( pins_to_add = pins frame_to_check = frame - 1  ).

        IF pins = x. "strike
          check_frame( pins_to_add = pins frame_to_check = frame - 2 ).
          frame += 1.
        ENDIF.

      ELSE.
        "second throw in frame
        frame_tab[ frame ]-throw_2 = pins.
        frame_tab[ frame ]-score  += pins.
        check_frame( pins_to_add = pins frame_to_check = frame - 1 ).
        frame += 1.
      ENDIF.

    ELSE.
      "virtual 11th frame for possible 2nd and 3rd throw in 10th frame
      IF frame_tab[ frame - 1 ]-throw_2 IS INITIAL.
        "strike in 1st throw 10th frame -> now add 2nd throw
        frame_tab[ frame - 1 ]-throw_2 = pins.
        frame_tab[ frame - 1 ]-score  += pins.
        "strike in second last frame -> add next two throws
        check_frame( pins_to_add = pins frame_to_check = frame - 2 ).
      ELSE.
        "3rd  throw in 10th frame
        frame_tab[ frame - 1 ]-throw_3 = pins.
        frame_tab[ frame - 1 ]-score  += pins.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD check_frame.
    " check if frame to be checked exists
    CHECK frame_to_check > 0.

    IF frame_tab[ frame_to_check ]-throw_1 = x.
      "strike in check_frame -> add pins from next two throws
      frame_tab[ frame_to_check ]-score += pins_to_add.
    ELSEIF frame_tab[ frame_to_check ]-score = 10 AND ( frame - frame_to_check ) = 1.
      "spare in last frame -> add next throw
      frame_tab[ frame - 1 ]-score += pins_to_add.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
