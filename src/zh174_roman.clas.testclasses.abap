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
      latin_1to3 FOR TESTING RAISING cx_static_check,
      latin_10 FOR TESTING RAISING cx_static_check,
      latin_11 FOR TESTING RAISING cx_static_check,
      latin_14 FOR TESTING RAISING cx_static_check,
      latin_12 FOR TESTING RAISING cx_static_check,
      latin_13 FOR TESTING RAISING cx_static_check,
      latin_0 FOR TESTING RAISING cx_static_check,
      latin_26 FOR TESTING RAISING cx_static_check,
      latin_16 FOR TESTING RAISING cx_static_check,
      latin_20 FOR TESTING RAISING cx_static_check,
      latin_30 FOR TESTING RAISING cx_static_check,
      latin_50 FOR TESTING RAISING cx_static_check,
      latin_100 FOR TESTING RAISING cx_static_check,
*      latin_99 FOR TESTING RAISING cx_static_check,
      latin_369 FOR TESTING RAISING cx_static_check,
*      latin_90 FOR TESTING RAISING cx_static_check,
    latin_40 FOR TESTING RAISING cx_static_check.
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
  METHOD latin_10.
    latin_x( ln = 10 rn = |X| ).
  ENDMETHOD.
  METHOD latin_11.
    latin_x( ln = 11 rn = |XI| ).
  ENDMETHOD.
  METHOD latin_12.
    latin_x( ln = 12 rn = |XII| ).
  ENDMETHOD.
  METHOD latin_13.
    latin_x( ln = 13 rn = |XIII| ).
  ENDMETHOD.
  METHOD latin_14.
    latin_x( ln = 14 rn = |XIV| ).
  ENDMETHOD.
  METHOD latin_0.
    latin_x( ln = 0 rn = || ).
  ENDMETHOD.
  METHOD latin_16.
    latin_x( ln = 16 rn = |XVI| ).
  ENDMETHOD.
  METHOD latin_20.
    latin_x( ln = 20 rn = |XX| ).
  ENDMETHOD.
  METHOD latin_26.
    latin_x( ln = 26 rn = |XXVI| ).
  ENDMETHOD.
  METHOD latin_30.
    latin_x( ln = 30 rn = |XXX| ).
  ENDMETHOD.
  METHOD latin_50.
    latin_x( ln = 50 rn = |L| ).
  ENDMETHOD.
  METHOD latin_100.
    latin_x( ln = 100 rn = |C| ).
  ENDMETHOD.
  METHOD latin_40.
    latin_x( ln = 40 rn = |XL| ).
  ENDMETHOD.
*  METHOD latin_99.
*    latin_x( ln = 99 rn = |XCIX| ).
*  ENDMETHOD.
  METHOD latin_369.
    latin_x( ln = 369 rn = |CCCLXIX| ).
  ENDMETHOD.

  METHOD latin_x.
    cl_abap_unit_assert=>assert_equals( msg = |{ ln } = { rn }| exp = rn act = cut->to_roman( ln ) ).
  ENDMETHOD.

  METHOD setup.
    cut = NEW  zh174_roman( ).
  ENDMETHOD.



ENDCLASS.
