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
    METHODS constructor.
    METHODS to_latin
      IMPORTING
        VALUE(roman_number) TYPE string
      RETURNING
        VALUE(latin_number) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF lookup_type,
             latin TYPE i,
             roman TYPE string,
           END OF lookup_type,
           lookup_table_type TYPE STANDARD TABLE OF lookup_type WITH KEY latin.
    DATA: lookup_table TYPE zh174_roman=>lookup_table_type.
ENDCLASS.



CLASS zh174_roman IMPLEMENTATION.

  METHOD to_roman.

    LOOP AT lookup_table ASSIGNING FIELD-SYMBOL(<lookup>).
      IF latin_number >= <lookup>-latin.
        roman_number = <lookup>-roman && to_roman( latin_number - <lookup>-latin ).
        RETURN.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD constructor.
    lookup_table = VALUE lookup_table_type( ( latin = 1000 roman = |M|  )
                                            ( latin = 500  roman = |D|  )
                                            ( latin = 400  roman = |CD| )
                                            ( latin = 100  roman = |C|  )
                                            ( latin = 90   roman = |XC| )
                                            ( latin = 50   roman = |L|  )
                                            ( latin = 40   roman = |XL| )
                                            ( latin = 10   roman = |X|  )
                                            ( latin = 9    roman = |IX| )
                                            ( latin = 5    roman = |V|  )
                                            ( latin = 4    roman = |IV| )
                                            ( latin = 1    roman = |I|  ) ).
  ENDMETHOD.


  METHOD to_latin.

    latin_number = COND #(
      WHEN find( val = roman_number sub = 'M' ) = 0 THEN 1000 + to_latin( substring( val = roman_number off = 1 ) )
      WHEN find( val = roman_number sub = 'M' ) > 0 THEN 900  + to_latin( substring( val = roman_number off = 2 ) )
      WHEN find( val = roman_number sub = 'D' ) = 0 THEN 500  + to_latin( substring( val = roman_number off = 1 ) )
      WHEN find( val = roman_number sub = 'D' ) > 0 THEN 400  + to_latin( substring( val = roman_number off = 2 ) )
      WHEN find( val = roman_number sub = 'C' ) = 0 THEN 100  + to_latin( substring( val = roman_number off = 1 ) )
      WHEN find( val = roman_number sub = 'C' ) > 0 THEN 90   + to_latin( substring( val = roman_number off = 2 ) )
      WHEN find( val = roman_number sub = 'L' ) > 0 THEN 40   + to_latin( substring( val = roman_number off = 2 ) )
      WHEN find( val = roman_number sub = 'L' ) = 0 THEN 50   + to_latin( substring( val = roman_number off = 1 ) )
      WHEN find( val = roman_number sub = 'X' ) = 0 THEN 10   + to_latin( substring( val = roman_number off = 1 ) )
      WHEN find( val = roman_number sub = 'X' ) > 0 THEN 9
      WHEN find( val = roman_number sub = 'V' ) = 0 THEN 5    + to_latin( substring( val = roman_number off = 1 ) )
      WHEN find( val = roman_number sub = 'V' ) > 0 THEN 4
      WHEN find( val = roman_number sub = 'I' ) = 0 THEN 1    + to_latin( substring( val = roman_number off = 1 ) ) ).
  ENDMETHOD.

ENDCLASS.

