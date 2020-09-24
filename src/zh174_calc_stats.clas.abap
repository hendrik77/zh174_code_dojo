CLASS zh174_calc_stats DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        sequence_string TYPE string.
    METHODS get_number_of_elements
      RETURNING
        VALUE(number) TYPE i.
    METHODS get_minimum_value
      RETURNING
        VALUE(minimum_value) TYPE i.
    METHODS get_maximum_value
      RETURNING
        VALUE(maximum_value) TYPE i.
    METHODS get_average_value
      RETURNING
        VALUE(average) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA sequence TYPE string_table.

ENDCLASS.

CLASS zh174_calc_stats IMPLEMENTATION.

  METHOD constructor.
    "remove blanks and split at comma into internal table
    SPLIT sequence_string AT |,| INTO TABLE sequence.
  ENDMETHOD.

  METHOD get_number_of_elements.
    number = lines( sequence ).
  ENDMETHOD.


  METHOD get_minimum_value.
    minimum_value = REDUCE #( INIT min = CONV i( sequence[ 1 ] )
                              FOR number IN sequence FROM 2
                              NEXT min = COND #( WHEN min < CONV i( number )
                                                 THEN min
                                                 ELSE CONV i( number ) ) ).
  ENDMETHOD.


  METHOD get_maximum_value.
    maximum_value = REDUCE #( INIT max = CONV i( sequence[ 1 ] )
                              FOR number IN sequence FROM 2
                              NEXT max = COND #( WHEN max > CONV i( number )
                                                 THEN max
                                                 ELSE CONV i( number ) ) ).
  ENDMETHOD.


  METHOD get_average_value.

    DATA(sum) = REDUCE i( INIT i = 0
                          FOR n IN sequence
                          NEXT i = i + n ).
    average = round( val = sum / lines( sequence ) dec = 6 ).
  ENDMETHOD.

ENDCLASS.
