CLASS zh174_leap_year DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check
      IMPORTING
        number        TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_leap_year IMPLEMENTATION.

  METHOD check.
    IF number = 4.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
