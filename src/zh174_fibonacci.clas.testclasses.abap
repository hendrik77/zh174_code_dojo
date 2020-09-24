CLASS ltcl_fibonacci DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA fibonacci TYPE REF TO zh174_fibonacci.
    METHODS:
      fib_for_1 FOR TESTING RAISING cx_static_check,
      fib_for_2 FOR TESTING RAISING cx_static_check,
      fib_for_3 FOR TESTING RAISING cx_static_check,
      fib_for_4 FOR TESTING RAISING cx_static_check,
      fib_for_5 FOR TESTING RAISING cx_static_check,
      fib_for_7 FOR TESTING RAISING cx_static_check,
      fib_for_10 FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_fibonacci IMPLEMENTATION.

  METHOD fib_for_1.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 1' exp = 0 act = fibonacci->for( 1 ) ).
  ENDMETHOD.

  METHOD fib_for_2.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 2' exp = 1 act = fibonacci->for( 2 ) ).
  ENDMETHOD.

  METHOD fib_for_3.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 3' exp = 1 act = fibonacci->for( 3 ) ).
  ENDMETHOD.

  METHOD fib_for_4.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 4' exp = 2 act = fibonacci->for( 4 ) ).
  ENDMETHOD.

  METHOD fib_for_5.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 5' exp = 3 act = fibonacci->for( 5 ) ).
  ENDMETHOD.

  METHOD fib_for_7.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 7' exp = 8 act = fibonacci->for( 7 ) ).
  ENDMETHOD.

  METHOD fib_for_10.
    cl_abap_unit_assert=>assert_equals( msg = 'fibonacci n = 10' exp = 34 act = fibonacci->for( 10 ) ).
  ENDMETHOD.

  METHOD setup.
    fibonacci = NEW #( ).
  ENDMETHOD.

ENDCLASS.
