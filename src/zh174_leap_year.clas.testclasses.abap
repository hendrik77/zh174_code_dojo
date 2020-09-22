CLASS ltcl_leap_year DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA leap_year TYPE REF TO zh174_leap_year.
    METHODS:
      typical_leap_year FOR TESTING RAISING cx_static_check,
      common_year FOR TESTING RAISING cx_static_check,
      atypical_common_year FOR TESTING RAISING cx_static_check,
    atypical_leyp_year FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_leap_year IMPLEMENTATION.

  METHOD typical_leap_year.
    cl_abap_unit_assert=>assert_true( msg = '4 is divisible by 4' act = leap_year->check( 4 ) ).
    cl_abap_unit_assert=>assert_true( msg = '8 is divisible by 4' act = leap_year->check( 8 ) ).
    cl_abap_unit_assert=>assert_true( msg = '1996 is divisible by 4' act = leap_year->check( 1996 ) ).
  ENDMETHOD.

  METHOD common_year.
    cl_abap_unit_assert=>assert_false( msg = '5 is not divisible by 4' act = leap_year->check( 5 ) ).
    cl_abap_unit_assert=>assert_false( msg = '2001 is not divisible by 4' act = leap_year->check( 2001 ) ).
  ENDMETHOD.

  METHOD atypical_common_year.
    cl_abap_unit_assert=>assert_false( msg = '1900 is an atypical common year' act = leap_year->check( 1900 ) ).
  ENDMETHOD.

  METHOD atypical_leyp_year.
    cl_abap_unit_assert=>assert_true( msg = '2000 is an atypical leap year' act = leap_year->check( 2000 ) ).
  ENDMETHOD.

  METHOD setup.

    leap_year = NEW #( ).

  ENDMETHOD.

ENDCLASS.
