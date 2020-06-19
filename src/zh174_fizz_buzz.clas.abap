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
        VALUE(input)  TYPE i
      RETURNING
        VALUE(output) TYPE string.
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
    output = COND #( WHEN input MOD 3 = 0 THEN |Fizz|
                     WHEN input MOD 5 = 0 THEN |Buzz|
                     ELSE input ) .
    output = condense( output ). "needed due to added space during conversion '4 ' -> '4'
  ENDMETHOD.

ENDCLASS.
