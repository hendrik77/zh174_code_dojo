CLASS ltcl_fizz_buzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: fizz_buzz TYPE REF TO zh174_fizz_buzz.
    METHODS:
      input_3_fizz FOR TESTING RAISING cx_static_check,
      input_4 FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_fizz_buzz IMPLEMENTATION.
  METHOD setup.
    fizz_buzz = NEW zh174_fizz_buzz( ).
  ENDMETHOD.

  METHOD input_3_fizz.
    cl_abap_unit_assert=>assert_equals( msg = '3 -> Fizz' exp = |Fizz| act = fizz_buzz->input( 3 ) ).
  ENDMETHOD.

  METHOD input_4.
    cl_abap_unit_assert=>assert_equals( msg = '4 -> 4' exp = |4| act = fizz_buzz->input( 4 ) ).
  ENDMETHOD.

ENDCLASS.
