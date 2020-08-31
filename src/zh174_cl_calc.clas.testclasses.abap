CLASS ltcl_calc DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: calc TYPE REF TO zh174_cl_calc.
    METHODS:
      add_2_2_eq_4 FOR TESTING RAISING cx_static_check,
      add_2_1_eq_3 FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_calc IMPLEMENTATION.

  METHOD add_2_2_eq_4.
    cl_abap_unit_assert=>assert_equals( msg = '2+2=4' exp = 4 act = calc->add( num1 = 2 num2 = 2 ) ).
  ENDMETHOD.

  METHOD add_2_1_eq_3.
    cl_abap_unit_assert=>assert_equals( msg = '2+1=3' exp = 3 act = CALC->add( num1 = 2 num2 = 1 ) ).
  ENDMETHOD.

  METHOD setup.
    calc = NEW zh174_cl_calc( ).
  ENDMETHOD.

ENDCLASS.
