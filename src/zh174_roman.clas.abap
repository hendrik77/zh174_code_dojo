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

    roman_number = COND #( WHEN latin_number < 4 THEN REDUCE #( INIT r = ||
                                                                FOR i = 0 UNTIL i >= latin_number
                                                                NEXT r = r && |I| )
                           WHEN latin_number = 4 THEN |IV|
                           WHEN latin_number = 5 THEN |V|
                           WHEN latin_number = 9 THEN |IX|
                           WHEN latin_number = 10 then |X|
                           WHEN latin_number > 10 THEN REDUCE #( INIT r = |X|
                                                                FOR i = 10 UNTIL i >= latin_number
                                                                NEXT r = r && |I| )
                           WHEN latin_number > 5 THEN REDUCE #( INIT r = |V|
                                                                FOR i = 5 UNTIL i >= latin_number
                                                                NEXT r = r && |I| )

                        ).


  ENDMETHOD.

ENDCLASS.
