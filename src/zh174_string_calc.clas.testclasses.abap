CLASS ltcl_string_calc DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: calc TYPE REF TO zh174_string_calc.
    METHODS:
      add_1_1 FOR TESTING RAISING cx_static_check,
      add_empty_string FOR TESTING RAISING cx_static_check,
      newline_seperator FOR TESTING RAISING cx_static_check,
      exeption_last_char FOR TESTING RAISING cx_static_check,
      cust_sep_semicolon FOR TESTING RAISING cx_static_check,
      cust_sep_line FOR TESTING RAISING cx_static_check,
      cust_sep_sep FOR TESTING RAISING cx_static_check,
      cust_sep_err FOR TESTING RAISING cx_static_check,
    cust_sep_err2 FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_string_calc IMPLEMENTATION.
  METHOD setup.
    calc = NEW zh174_string_calc( ).
  ENDMETHOD.

  METHOD add_1_1.
    cl_abap_unit_assert=>assert_equals( msg = '1,1 = 2' exp = 2 act = calc->add( |1,1| ) ).
  ENDMETHOD.

  METHOD add_empty_string.
    cl_abap_unit_assert=>assert_equals( msg = '' exp = 0 act = calc->add( || ) ).
  ENDMETHOD.

  METHOD newline_seperator.
    cl_abap_unit_assert=>assert_equals( msg = '1\n2,3 -> 6' exp = 6 act = calc->add( |1\n2,3| ) ).
  ENDMETHOD.

  METHOD exeption_last_char.
    TRY.
        calc->add( |1,2,| ).
      CATCH zcx_h174_str_calc INTO DATA(cx_str_calc).
        cl_abap_unit_assert=>assert_equals( msg = 'msg'
                                            exp = |Number expected but EOF found.|
                                            act = cx_str_calc->get_text( ) ).
    ENDTRY.
  ENDMETHOD.

  METHOD cust_sep_semicolon.
    cl_abap_unit_assert=>assert_equals( msg = |"//;\n1;2" should return ""3| exp = 3 act = calc->add( |//;\n1;2| ) ).
  ENDMETHOD.

  METHOD cust_sep_line.
    cl_abap_unit_assert=>assert_equals( msg = |"//!\n1!2!3" should return "6"| exp = 6 act = calc->add( |//!\n1!2!3| ) ).
  ENDMETHOD.

  METHOD cust_sep_sep.
    cl_abap_unit_assert=>assert_equals( msg = |"//sep\n2sep3" should return "5"| exp = 5 act = calc->add( |//sep\n2sep3| ) ).
  ENDMETHOD.

  METHOD cust_sep_err.
    "//|\n1|2,3" is invalid and should return the message "'|' expected but ',' found at position 3."
    TRY.
        calc->add( |//!\n1!2,3| ).
      CATCH zcx_h174_str_calc INTO DATA(cx_str_calc).
        cl_abap_unit_assert=>assert_equals( msg = `"//!\n1!2,3" is invalid and should return the message "'|' expected but ',' found at position 3."`
                                            exp =  `'!' expected but ',' found at position 3`
                                            act = cx_str_calc->get_text( ) ).
    ENDTRY.
  ENDMETHOD.

  METHOD cust_sep_err2.
    TRY.
        calc->add( |//d\n1d2d3b3| ).
      CATCH zcx_h174_str_calc INTO DATA(cx_str_calc).
        cl_abap_unit_assert=>assert_equals( msg = `d - b error at pos 5`
                                            exp =  `'d' expected but 'b' found at position 5`
                                            act = cx_str_calc->get_text( ) ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
