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

    roman_number = COND #(
                           WHEN latin_number = 4 THEN |IV|
                           WHEN latin_number = 9 THEN |IX|
                           WHEN latin_number >= 10 THEN REDUCE #( INIT r = |X|
                                                                  FOR i = 0 WHILE i < latin_number DIV 10
                                                                  NEXT r = r && to_roman( latin_number - 10 ) )
*                                                                     COND #(
*                                                                    WHEN latin_number > i * 10 THEN ||
*                                                                    ELSE to_roman( latin_number - i *  10 ) ) )
                           WHEN latin_number >= 5 THEN REDUCE #( INIT r = |V|
                                                                 FOR i = 0 WHILE i < latin_number DIV 5
                                                                 NEXT r = r && to_roman( latin_number - 5 ) )
                           WHEN latin_number >= 1 THEN REDUCE #( INIT r = ||
                                                                 FOR i = 0 WHILE i < latin_number DIV 1
                                                                 NEXT r = r && |I| )
                        ).


  ENDMETHOD.

ENDCLASS.
