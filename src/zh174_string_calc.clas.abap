CLASS zh174_string_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add
      IMPORTING
        VALUE(number) TYPE string
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_string_calc IMPLEMENTATION.

  METHOD add.
    SPLIT number AT ',' INTO TABLE DATA(number_tab).
    result = REDUCE #( INIT r = 0 FOR wa IN number_tab NEXT
                       r = r + wa ).
  ENDMETHOD.

ENDCLASS.
