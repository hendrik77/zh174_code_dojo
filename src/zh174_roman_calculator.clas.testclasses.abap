CLASS ltcl_roman_calc DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: calc TYPE REF TO zh174_roman_calculator.
    METHODS:
      add_I_I FOR TESTING RAISING cx_static_check,
      add_ii_i FOR TESTING RAISING cx_static_check,
      add_ii_ii FOR TESTING RAISING cx_static_check,
      add_iii_ii FOR TESTING RAISING cx_static_check,
      add_xx_ii FOR TESTING RAISING cx_static_check,
      add_C_xx FOR TESTING RAISING cx_static_check,
      add_xx_x FOR TESTING RAISING cx_static_check,
      add_xx_xx FOR TESTING RAISING cx_static_check,
      add_xxx_xxx FOR TESTING RAISING cx_static_check,
      add_v_v FOR TESTING RAISING cx_static_check,
      add_iv_v FOR TESTING RAISING cx_static_check,
      add_v_vi FOR TESTING RAISING cx_static_check,
      add_iv_vi FOR TESTING RAISING cx_static_check,
      add_iii_iii FOR TESTING RAISING cx_static_check,
      add_i_ii FOR TESTING RAISING cx_static_check,
      add_ii_x FOR TESTING RAISING cx_static_check,
      setup,
      add_x_y_equals_z
        IMPORTING
          x TYPE string
          y TYPE string
          z TYPE string.
ENDCLASS.


CLASS ltcl_roman_calc IMPLEMENTATION.

  METHOD setup.
    calc = NEW zh174_roman_calculator( ).
  ENDMETHOD.

  METHOD add_I_I.
    add_x_y_equals_z( x = |I| y = |I| z = |II| ).
  ENDMETHOD.

  METHOD add_II_I.
    add_x_y_equals_z( x = |II| y = |I| z = |III| ).
  ENDMETHOD.
  METHOD add_I_II.
    add_x_y_equals_z( x = |I| y = |II| z = |III| ).
  ENDMETHOD.
  METHOD add_II_II.
    add_x_y_equals_z( x = |II| y = |II| z = |IV| ).
  ENDMETHOD.

  METHOD add_III_II.
    add_x_y_equals_z( x = |III| y = |II| z = |V| ).
  ENDMETHOD.
  METHOD add_III_III.
    add_x_y_equals_z( x = |III| y = |III| z = |VI| ).
  ENDMETHOD.
  METHOD add_XX_II.
    add_x_y_equals_z( x = |XX| y = |II| z = |XXII| ).
  ENDMETHOD.
  METHOD add_II_X.
    add_x_y_equals_z( x = |II| y = |X| z = |XII| ).
  ENDMETHOD.
  METHOD add_XX_X.
    add_x_y_equals_z( x = |XX| y = |X| z = |XXX| ).
  ENDMETHOD.
  METHOD add_XX_XX.
    add_x_y_equals_z( x = |XX| y = |XX| z = |XL| ).
  ENDMETHOD.
  METHOD add_V_V.
    add_x_y_equals_z( x = |V| y = |V| z = |X| ).
  ENDMETHOD.
  METHOD add_IV_V.
    add_x_y_equals_z( x = |IV| y = |V| z = |IX| ).
  ENDMETHOD.
  METHOD add_V_VI.
    add_x_y_equals_z( x = |V| y = |VI| z = |XI| ).
  ENDMETHOD.
  METHOD add_IV_VI.
    add_x_y_equals_z( x = |IV| y = |VI| z = |X| ).
  ENDMETHOD.
  METHOD add_XXX_XXX.
    add_x_y_equals_z( x = |XXX| y = |XXX| z = |LX| ).
  ENDMETHOD.


  METHOD add_C_XX.
    add_x_y_equals_z( x = |C| y = |XX| z = |CXX| ).
  ENDMETHOD.

  METHOD add_x_y_equals_z.
    cl_abap_unit_assert=>assert_equals( msg = |{ x } + { y } = { z }| exp = z act = calc->add( num1 = x num2 = y ) ).
  ENDMETHOD.

ENDCLASS.
