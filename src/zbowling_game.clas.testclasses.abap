CLASS ltcl_bowling_game DEFINITION DEFERRED.
CLASS zbowling_game DEFINITION LOCAL FRIENDS ltcl_bowling_game.
CLASS ltcl_bowling_game DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: game TYPE REF TO zbowling_game.
    METHODS:
      add_roll_1 FOR TESTING RAISING cx_static_check,
      add_roll_14 FOR TESTING RAISING cx_static_check,
      add_roll_644 FOR TESTING RAISING cx_static_check,
      gutter_game FOR TESTING RAISING cx_static_check,
      one_pin_each_game FOR TESTING RAISING cx_static_check,
      golden_game FOR TESTING RAISING cx_static_check,
      add_roll_x11 FOR TESTING RAISING cx_static_check,
      nine_strikes FOR TESTING RAISING cx_static_check,
      kata_game FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_bowling_game IMPLEMENTATION.

  METHOD setup.
    game = NEW zbowling_game( ).
  ENDMETHOD.

  METHOD add_roll_1.
    game->add_throw( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = '1 totalScore' exp = 1 act = game->get_total_score(  ) ).
    cl_abap_unit_assert=>assert_equals( msg = 'frame score = 1' exp = 1 act = game->frame_tab[ 1 ]-score ).
  ENDMETHOD.

  METHOD add_roll_14.
    game->add_throw( 1 ).
    game->add_throw( 4 ).
    cl_abap_unit_assert=>assert_equals( msg = '1,4 -> 5' exp = 5 act = game->get_total_score( ) ).
    cl_abap_unit_assert=>assert_equals( msg = 'frame score = 5' exp = 5 act = game->frame_tab[ 1 ]-score ).
  ENDMETHOD.

  METHOD add_roll_644.
    game->add_throw( 6 ).
    game->add_throw( 4 ).
    game->add_throw( 4 ).
    cl_abap_unit_assert=>assert_equals( msg = 'spare (6+4) + 4 -> Total Score = 18' exp = 18 act = game->get_total_score( ) ).
    cl_abap_unit_assert=>assert_equals( msg = 'spare (6+4) + 4 -> Frame Score = 14' exp = 14 act = game->frame_tab[ 1 ]-score ).
  ENDMETHOD.

  METHOD add_roll_x11.
    game->add_throw( 10 ).
    game->add_throw( 1 ).
    game->add_throw( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = '10,1,1 -> frame 1 = 12' exp = 12 act = game->frame_tab[ 1 ]-score ).
  ENDMETHOD.
  METHOD gutter_game.
    DO 20 TIMES.
      game->add_throw( 0 ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( msg = 'gutter game 20x0 => 0' exp = 0 act = game->get_total_score( ) ).
  ENDMETHOD.

  METHOD one_pin_each_game.
    DO 20 TIMES.
      game->add_throw( 1 ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( msg = 'game 20x1 => 20' exp = 20 act = game->get_total_score( ) ).
  ENDMETHOD.

  METHOD golden_game.
    DO 12 TIMES.
      game->add_throw( 10 ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( msg = 'golden game 12 strike => 300' exp = 300 act = game->get_total_score( ) ).
  ENDMETHOD.

  METHOD nine_strikes.
    DO 9 TIMES.
      game->add_throw( 10 ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( msg = '9 strike => 240' exp = 240 act = game->get_total_score( ) ).
  ENDMETHOD.

  METHOD kata_game.
    SPLIT |1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6| AT ',' INTO TABLE DATA(kata_game) IN CHARACTER MODE.
    LOOP AT kata_game INTO DATA(roll).
      game->add_throw( CONV #( roll ) ).
    ENDLOOP.
    cl_abap_unit_assert=>assert_equals( msg = 'kata => 133' exp = 133 act = game->get_total_score( ) ).
  ENDMETHOD.

ENDCLASS.
