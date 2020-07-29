CLASS ltcl_hangman DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: hangman TYPE REF TO zh174_cl_hangman.
    METHODS:
      guess_y FOR TESTING RAISING cx_static_check,
      guess_s_word_y FOR TESTING RAISING cx_static_check,
      guess_letter_from_word FOR TESTING RAISING cx_static_check,
      guess_s_word_yyy FOR TESTING RAISING cx_static_check,
      guess_y_word_yz FOR TESTING RAISING cx_static_check,
      guess_z_word_yz FOR TESTING RAISING cx_static_check,
      guess_2nd_letter FOR TESTING RAISING cx_static_check,
      game_has_ended FOR TESTING RAISING cx_static_check,
      seven_misses_leads_to_hanging FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_hangman IMPLEMENTATION.

  METHOD guess_y.
    hangman->set_word( 'y' ).
    cl_abap_unit_assert=>assert_equals( msg = 'y -> y' exp = |You found the word! (y)| act = hangman->guess( |y| ) ).
  ENDMETHOD.

  METHOD guess_s_word_y.
    hangman->set_word( 'y' ).
    cl_abap_unit_assert=>assert_equals( msg = 's -> _' exp = |_ # s| act = hangman->guess( |s| ) ).
  ENDMETHOD.

  METHOD guess_s_word_yyy.
    hangman->set_word( 'yyy' ).
    cl_abap_unit_assert=>assert_equals( msg = 's -> _ _ _' exp = |_ _ _ # s| act = hangman->guess( |s| ) ).
  ENDMETHOD.

  METHOD guess_y_word_yz.
    hangman->set_word( 'yz' ).
    cl_abap_unit_assert=>assert_equals( msg = 'y -> y _' exp = |y _| act = hangman->guess( |y| ) ).
  ENDMETHOD.

  METHOD guess_z_word_yz.
    hangman->set_word( 'yz' ).
    cl_abap_unit_assert=>assert_equals( msg = 'z -> _ z' exp = |_ z| act = hangman->guess( |z| ) ).
  ENDMETHOD.

  METHOD guess_letter_from_word.
    hangman->set_word( |sysko| ).
    cl_abap_unit_assert=>assert_equals( msg = 'guess y from sysko -> _ y _ _ _' exp = |_ y _ _ _| act = hangman->guess( |y| )  ) .
  ENDMETHOD.

  METHOD guess_2nd_letter.
    hangman->set_word( |sysko| ).
    hangman->guess( |y| ).
    cl_abap_unit_assert=>assert_equals( msg = 'guess y,k from sysko' exp = |_ y _ k _| act = hangman->guess( |k| ) ).
  ENDMETHOD.

  METHOD game_has_ended.
    hangman->set_word( |y| ).
    hangman->guess( |y| ).
    cl_abap_unit_assert=>assert_equals( msg = 'game ended' exp = |The game has ended.| act = hangman->guess( |y| ) ).
  ENDMETHOD.

  METHOD seven_misses_leads_to_hanging.
    hangman->set_word( |x| ).
    DO 6 TIMES.
      hangman->guess( |y| ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( msg = 'hung' exp = |You got hung! The word was x.| act = hangman->guess( |y| ) ).
  ENDMETHOD.

  METHOD setup.
    hangman = NEW zh174_cl_hangman( ).
  ENDMETHOD.



ENDCLASS.
