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

ENDCLASS.
