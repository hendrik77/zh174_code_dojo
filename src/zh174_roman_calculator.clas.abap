CLASS zh174_roman_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add
      IMPORTING
        num1 TYPE string
        num2 TYPE string
      RETURNING
        VALUE(sum)  TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_roman_calculator IMPLEMENTATION.

  METHOD add.
*   IVXLCDM - roman numbers
    DATA(converter) = NEW zh174_roman(  ).
    sum = converter->to_roman( converter->to_latin( num1 ) + converter->to_latin( num2 ) ).
  ENDMETHOD.

ENDCLASS.
