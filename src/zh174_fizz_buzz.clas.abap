CLASS zh174_fizz_buzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    METHODS fizz_buzz
      IMPORTING
        VALUE(count) TYPE i
      RETURNING
        VALUE(text)  TYPE string.
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
    DO count TIMES.
      text = text && input( sy-index ) && cl_abap_char_utilities=>newline.
    ENDDO.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( fizz_buzz( 100 ) ).
  ENDMETHOD.


  METHOD input.
    output = COND #( WHEN input MOD 3 = 0 AND input MOD 5 = 0 THEN |FizzBuzz|
                     WHEN input MOD 3 = 0 THEN |Fizz|
                     WHEN input MOD 5 = 0 THEN |Buzz|
                     ELSE input ) .
    output = condense( output ). "needed due to added space during conversion '4 ' -> '4'
  ENDMETHOD.

ENDCLASS.
