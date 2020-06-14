CLASS zh174_roman DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS to_roman
      IMPORTING
        VALUE(latin_number) TYPE i
      RETURNING
        VALUE(roman_number) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_roman IMPLEMENTATION.



  METHOD to_roman.

    roman_number = COND #( WHEN latin_number < 4
                           THEN REDUCE #( INIT r = ||
                                          FOR i = 1 UNTIL i > latin_number
                                          NEXT r = r && |I| )
                           ELSE |IV|  ).

  ENDMETHOD.

ENDCLASS.
