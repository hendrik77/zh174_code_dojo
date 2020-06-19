class ltcl_fizz_buzz definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      input_3_fizz for testing raising cx_static_check.
endclass.


class ltcl_fizz_buzz implementation.

  method input_3_fizz.
    data(Fizz_buzz) = new zh174_fizz_buzz( ).
    cl_abap_unit_assert=>assert_equals( msg = '3 -> Fizz' exp = |Fizz| act = fizz_buzz->input( 3 ) ).
  endmethod.

endclass.
