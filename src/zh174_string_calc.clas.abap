CLASS zh174_string_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add
      IMPORTING
                VALUE(numbers) TYPE string
      RETURNING
                VALUE(result)  TYPE i
      RAISING   zcx_h174_str_calc.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS zh174_str_calc TYPE string VALUE 'ZH174_STR_CALC' ##NO_TEXT.
ENDCLASS.



CLASS zh174_string_calc IMPLEMENTATION.

  METHOD add.
    "Custom separators
    DATA(separator) = |,|. "default
    IF strlen( numbers ) > 2 AND substring( val = numbers len = 2 ) = '//'.
      separator = substring_before( val = numbers sub = cl_abap_char_utilities=>newline ).
      separator = substring_after( val = separator sub = '//' ).
      numbers = substring_after( val = numbers  sub = cl_abap_char_utilities=>newline ).
    ENDIF.

    "Missing number in last position
    IF strlen( numbers ) > 0 AND
     ( substring( off = strlen( numbers ) - 1 len = 1 val = numbers ) = separator OR
       substring( off = strlen( numbers ) - 1 len = 1 val = numbers ) = cl_abap_char_utilities=>newline ).
      RAISE EXCEPTION TYPE zcx_h174_str_calc MESSAGE ID zh174_str_calc NUMBER '001'." WITH 'Number expected but EOF found.'.
    ENDIF.

    "Newline as separator
    DATA result_tab TYPE STANDARD TABLE OF string.
    SPLIT numbers AT cl_abap_char_utilities=>newline INTO TABLE DATA(number_tab).
    LOOP AT number_tab ASSIGNING FIELD-SYMBOL(<num>).
      IF  <num> CS separator.
        SPLIT <num> AT separator INTO TABLE DATA(separator_tab).
        APPEND LINES OF separator_tab TO result_tab.
      ELSE.
        APPEND <num> TO result_tab.
      ENDIF.
    ENDLOOP.

    "First step & Many numbers
    TRY.
        result = REDUCE #( INIT r = 0 FOR wa IN result_tab NEXT
                           r = r + wa ).
      CATCH cx_sy_conversion_no_number INTO DATA(cx).
        DATA(sep) = substring_from( val = cx->value regex = '\D+' ).
        sep = substring_before( val = sep regex = '\d' ).
*        DATA place TYPE i.
        data(place) = find( val = numbers sub = sep ).

        RAISE EXCEPTION TYPE zcx_h174_str_calc
          MESSAGE ID zh174_str_calc
          NUMBER '002'
          WITH separator sep place.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
