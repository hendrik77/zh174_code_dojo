*"* use this source file for your ABAP unit test classes
CLASS ltcl_numeral DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: cut TYPE REF TO zh174_roman.
    METHODS:
      latin_4 FOR TESTING RAISING cx_static_check,
      latin_5 FOR TESTING RAISING cx_static_check,
      latin_6to8 FOR TESTING RAISING cx_static_check,
      latin_9 FOR TESTING RAISING cx_static_check,
      latin_1to3 FOR TESTING RAISING cx_static_check.
    METHODS setup.
    METHODS latin_x
      IMPORTING VALUE(ln) TYPE i
                VALUE(rn) TYPE string.
ENDCLASS.


CLASS ltcl_numeral IMPLEMENTATION.

  METHOD latin_1to3.
    latin_x( ln = 1 rn = |I| ).
    latin_x( ln = 2 rn = |II| ).
    latin_x( ln = 3 rn = |III| ).
  ENDMETHOD.
  METHOD latin_4.
    cl_abap_unit_assert=>assert_equals( msg = '4 = IV' exp = 'IV' act = cut->to_roman( 4 ) ).
  ENDMETHOD.
  METHOD latin_5.
    cl_abap_unit_assert=>assert_equals( msg = '5 = V' exp = 'V' act = cut->to_roman( 5 ) ).
  ENDMETHOD.
  METHOD latin_6to8.
    latin_x( ln = 6 rn = |VI| ).
    latin_x( ln = 7 rn = |VII| ).
    latin_x( ln = 8 rn = |VIII| ).
  ENDMETHOD.
  METHOD latin_9.
    latin_x( ln = 9 rn = |IX| ).
  ENDMETHOD.


  METHOD latin_x.
    cl_abap_unit_assert=>assert_equals( msg = |{ ln } = { rn }| exp = rn act = cut->to_roman( ln ) ).
  ENDMETHOD.

  METHOD setup.
    cut = NEW  zh174_roman( ).
  ENDMETHOD.



ENDCLASS.
