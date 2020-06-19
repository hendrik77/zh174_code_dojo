CLASS ltcl_fizz_buzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: fizz_buzz TYPE REF TO zh174_fizz_buzz.
    METHODS:
      input_3_fizz FOR TESTING RAISING cx_static_check,
      input_4 FOR TESTING RAISING cx_static_check,
      input_6_fizz FOR TESTING RAISING cx_static_check,
      input_5_buzz FOR TESTING RAISING cx_static_check,
      input_10_buzz FOR TESTING RAISING cx_static_check,
    input_15_fizzbuzz FOR TESTING RAISING cx_static_check.
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

  METHOD input_6_fizz.
    cl_abap_unit_assert=>assert_equals( msg = '6 -> Fizz' exp = |Fizz| act = fizz_buzz->input( 6 ) ).
  ENDMETHOD.

  METHOD input_5_buzz.
    cl_abap_unit_assert=>assert_equals( msg = '5 -> Buzz' exp = |Buzz| act = fizz_buzz->input( 5 ) ).
  ENDMETHOD.

  METHOD input_10_buzz.
    cl_abap_unit_assert=>assert_equals( msg = '10 -> Buzz' exp = |Buzz| act = fizz_buzz->input( 10 ) ).
  ENDMETHOD.

  METHOD input_15_fizzbuzz.
    cl_abap_unit_assert=>assert_equals( msg = '15 -> FizzBuzz' exp = |FizzBuzz| act = fizz_buzz->input( 15 ) ).
  ENDMETHOD.

ENDCLASS.
