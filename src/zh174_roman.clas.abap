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

    roman_number = COND #( WHEN latin_number >= 500 THEN |D|  && to_roman( latin_number - 500 )
                           WHEN latin_number >= 400 THEN |CD| && to_roman( latin_number - 400 )
                           WHEN latin_number >= 100 THEN |C|  && to_roman( latin_number - 100 )
                           WHEN latin_number >= 90  THEN |XC| && to_roman( latin_number - 90 )
                           WHEN latin_number >= 50  THEN |L|  && to_roman( latin_number - 50 )
                           WHEN latin_number >= 40  THEN |XL| && to_roman( latin_number - 40 )
                           WHEN latin_number >= 10  THEN |X|  && to_roman( latin_number - 10 )
                           WHEN latin_number >= 9   THEN |IX| && to_roman( latin_number - 9 )
                           WHEN latin_number >= 5   THEN |V|  && to_roman( latin_number - 5 )
                           WHEN latin_number >= 4   THEN |IV| && to_roman( latin_number - 4 )
                           WHEN latin_number >  0   THEN |I|  && to_roman( latin_number - 1 )
                           else || ).


  ENDMETHOD.

ENDCLASS.
