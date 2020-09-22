CLASS ltcl_leap_year DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA leap_year TYPE REF TO zh174_leap_year.
    METHODS:
      devisible_by_4 FOR TESTING RAISING cx_static_check,
    not_devisible_by_4 FOR TESTING RAISING cx_static_check,
    setup.
ENDCLASS.


CLASS ltcl_leap_year IMPLEMENTATION.

  METHOD devisible_by_4.
    cl_abap_unit_assert=>assert_true( msg = '4 is devisible by 4' act = leap_year->check( 4 ) ).
  ENDMETHOD.

  METHOD not_devisible_by_4.
    cl_abap_unit_assert=>assert_false( msg = 'msg' act = leap_year->check( 5 ) ).
  ENDMETHOD.


  METHOD setup.

    leap_year = NEW #( ).

  ENDMETHOD.

ENDCLASS.
