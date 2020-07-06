class ltcl_string_calc definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      add_1_1 for testing raising cx_static_check.
endclass.


class ltcl_string_calc implementation.

  method add_1_1.
    data(calc) = NEW zh174_string_calc( ).
    cl_abap_unit_assert=>assert_equals( msg = '1,1 = 2' exp = 2 act = calc->add( |1,1| ) ).
  endmethod.

endclass.
