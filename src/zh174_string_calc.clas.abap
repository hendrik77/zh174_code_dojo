CLASS zh174_string_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add
      IMPORTING
                VALUE(number) TYPE string
      RETURNING
                VALUE(result) TYPE i
      RAISING   zcx_h174_str_calc.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_string_calc IMPLEMENTATION.

  METHOD add.
    "Missing number in last position
    IF strlen( number ) > 0 AND
     ( substring( off = strlen( number ) - 1 len = 1 val = number ) = |,| OR
       substring( off = strlen( number ) - 1 len = 1 val = number ) = cl_abap_char_utilities=>newline ).
      RAISE EXCEPTION TYPE zcx_h174_str_calc MESSAGE ID 'ZH174_STR_CALC' NUMBER '001'." WITH 'Number expected but EOF found.'.
    ENDIF.

    "Newline as separator
    DATA result_tab TYPE STANDARD TABLE OF string.
    SPLIT number AT cl_abap_char_utilities=>newline INTO TABLE DATA(number_tab).
    LOOP AT number_tab ASSIGNING FIELD-SYMBOL(<num>).
      IF  <num> CS |,|.
        SPLIT <num> AT ',' INTO TABLE DATA(comma_tab).
        APPEND LINES OF comma_tab TO result_tab.
      ELSE.
        APPEND <num> TO result_tab.
      ENDIF.
    ENDLOOP.

    "First step & Many numbers
    result = REDUCE #( INIT r = 0 FOR wa IN result_tab NEXT
                       r = r + wa ).
  ENDMETHOD.

ENDCLASS.
