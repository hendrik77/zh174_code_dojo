class ltcl_leap_year definition final for testing
  duration short
  risk level harmless.

  private section.
    DATA leap_year TYPE REF TO zh174_leap_year.
    methods:
      devisible_by_4 for testing raising cx_static_check.
endclass.


class ltcl_leap_year implementation.

  method devisible_by_4.
    cl_abap_unit_assert=>assert_equals( msg = '4 is devisible by 4' exp = abap_true act = leap_year->check( 4 ) ).
  endmethod.

endclass.
