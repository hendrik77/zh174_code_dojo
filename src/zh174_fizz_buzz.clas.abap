CLASS zh174_fizz_buzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    METHODS fizz_buzz
      RETURNING
        VALUE(text) TYPE string.
    METHODS input
      IMPORTING
        value(input)  TYPE i
      RETURNING
        value(output) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_fizz_buzz IMPLEMENTATION.
  METHOD fizz_buzz.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( fizz_buzz( ) ).
  ENDMETHOD.


  METHOD input.
    output = |Fizz|.
  ENDMETHOD.

ENDCLASS.
