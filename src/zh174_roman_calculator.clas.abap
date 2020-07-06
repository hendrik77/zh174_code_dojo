CLASS zh174_roman_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add
      IMPORTING
        VALUE(num1) TYPE string
        VALUE(num2) TYPE string
      RETURNING
        VALUE(sum)  TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_roman_calculator IMPLEMENTATION.

  METHOD add.
*   IVXLCDM - roman numbers
    DATA(converter) = NEW zh174_roman(  ).
    IF converter->to_latin( num1 ) < converter->to_latin( num2 ).
      DATA(temp) = num1.
      num1 = num2.
      num2 = temp.
    ENDIF.

    sum = num1 && num2.

    DATA(count_i) = count( val = sum sub = `I` ).
    DATA(count_x) = count( val = sum sub = `X` ).
    DATA(count_c) = count( val = sum sub = `C` ).
    DATA(count_v) = count( val = sum sub = `V` ).
    DATA(count_l) = count( val = sum sub = `L` ).
    DATA(count_d) = count( val = sum sub = `D` ).

    sum = COND #( WHEN count_I = 4 THEN |IV|
                  WHEN count_I >= 5 THEN |V| && repeat(  val = |I| occ = count_I - 5 )
                  WHEN count_v = 2 AND count_i = 2 THEN |X|
                  WHEN count_v = 2 and num1 cs 'I' then |IX|
                  WHEN count_x = 4 THEN |XL|
                  WHEN count_x = 5 THEN |L|
                  WHEN count_x = 6 THEN |LX|
                  ELSE sum ).
  ENDMETHOD.

ENDCLASS.
