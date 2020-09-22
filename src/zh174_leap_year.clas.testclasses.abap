CLASS ltcl_leap_year DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA leap_year TYPE REF TO zh174_leap_year.
    METHODS:
      devisible_by_4 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_leap_year IMPLEMENTATION.

  METHOD devisible_by_4.
    leap_year = NEW #( ).
    cl_abap_unit_assert=>assert_equals( msg = '4 is devisible by 4' exp = abap_true act = leap_year->check( 4 ) ).
  ENDMETHOD.

ENDCLASS.
