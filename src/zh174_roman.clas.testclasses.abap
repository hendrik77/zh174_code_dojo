*"* use this source file for your ABAP unit test classes
CLASS ltcl_numeral DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: cut TYPE REF TO zh174_roman.
    METHODS:
      latin_1 FOR TESTING RAISING cx_static_check,
      latin_2 FOR TESTING RAISING cx_static_check,
      latin_4 FOR TESTING RAISING cx_static_check,
    latin_3 FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_numeral IMPLEMENTATION.
  METHOD latin_1.
    cl_abap_unit_assert=>assert_equals( msg = '1 = I' exp = 'I' act = cut->to_roman( 1 ) ).
  ENDMETHOD.
  METHOD latin_2.
    cl_abap_unit_assert=>assert_equals( msg = '2 = II' exp = 'II' act = cut->to_roman( 2 ) ).
  ENDMETHOD.
  METHOD latin_3.
    cl_abap_unit_assert=>assert_equals( msg = '3 = III' exp = 'III' act = cut->to_roman( 3 ) ).
  ENDMETHOD.
  METHOD latin_4.
    cl_abap_unit_assert=>assert_equals( msg = '4 = IV' exp = 'IV' act = cut->to_roman( 4 ) ).
  ENDMETHOD.

  METHOD setup.
    cut = NEW  zh174_roman( ).
  ENDMETHOD.



ENDCLASS.
