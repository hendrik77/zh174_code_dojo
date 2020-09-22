CLASS zh174_leap_year DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check
      IMPORTING
        number        TYPE i
      RETURNING
        value(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_leap_year IMPLEMENTATION.

  METHOD check.
    result = abap_true.
  ENDMETHOD.

ENDCLASS.
