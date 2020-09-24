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
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA sequence TYPE string_table.
ENDCLASS.

CLASS zh174_calc_stats IMPLEMENTATION.

  METHOD constructor.
    SPLIT sequence_string AT |,| INTO TABLE me->sequence.
  ENDMETHOD.

  METHOD get_number_of_elements.
    number = lines( sequence ).
  ENDMETHOD.

ENDCLASS.
