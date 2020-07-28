CLASS ltcl_hangman DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: hangman TYPE REF TO zh174_hangman.
    METHODS:
      guess_y FOR TESTING RAISING cx_static_check,
      guess_s_word_y FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_hangman IMPLEMENTATION.

  METHOD guess_y.
    hangman->set_word( 'y' ).
    cl_abap_unit_assert=>assert_equals( msg = 'y -> y' exp = |y| act = hangman->guess( |y| ) ).
  ENDMETHOD.

  METHOD guess_s_word_y.
    hangman->set_word( 'y' ).
    cl_abap_unit_assert=>assert_equals( msg = 's -> ' exp = |_| act = hangman->guess( |s| ) ).
  ENDMETHOD.

  METHOD setup.
    hangman = NEW zh174_hangman( ).
  ENDMETHOD.



ENDCLASS.
