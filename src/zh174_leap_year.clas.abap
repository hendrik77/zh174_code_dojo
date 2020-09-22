CLASS zh174_leap_year DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_leap_year IMPLEMENTATION.

  METHOD check.
    IF year MOD 4 = 0.
      IF year MOD 100 = 0.
        IF year MOD 400 = 0.
          result = abap_true.
        ELSE.
          result = abap_false.
        ENDIF.
      ELSE.
        result = abap_true.
      ENDIF.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
