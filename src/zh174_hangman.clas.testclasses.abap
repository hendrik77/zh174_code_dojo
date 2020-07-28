CLASS ltcl_hangman DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: hangman TYPE REF TO zh174_hangman.
    METHODS:
      guess_y FOR TESTING RAISING cx_static_check,
      guess_s_word_y FOR TESTING RAISING cx_static_check,
    guess_letter_from_word FOR TESTING RAISING cx_static_check,
    guess_s_word_yy FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_hangman IMPLEMENTATION.

  METHOD guess_y.
    hangman->set_word( 'y' ).
    cl_abap_unit_assert=>assert_equals( msg = 'y -> y' exp = |y| act = hangman->guess( |y| ) ).
  ENDMETHOD.

  METHOD guess_s_word_y.
    hangman->set_word( 'y' ).
    cl_abap_unit_assert=>assert_equals( msg = 's -> _' exp = |_| act = hangman->guess( |s| ) ).
  ENDMETHOD.

  METHOD guess_s_word_yy.
    hangman->set_word( 'yy' ).
    cl_abap_unit_assert=>assert_equals( msg = 's -> _ _' exp = |_ _| act = hangman->guess( |s| ) ).
  ENDMETHOD.

  METHOD guess_letter_from_word.
    hangman->set_word( |sysko| ).
*    cl_abap_unit_assert=>assert_equals( msg = 'guess y from sysko -> s _ y _ _ _' exp = |_ y _ _ _| act = hangman->guess( |y| )  ) .
  ENDMETHOD.

  METHOD setup.
    hangman = NEW zh174_hangman( ).
  ENDMETHOD.



ENDCLASS.
