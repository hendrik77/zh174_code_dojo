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

*    Negative numbers
*    DATA neg_numbers TYPE STANDARD TABLE OF i.
    DATA neg_numbers TYPE string.
*    Runtime Error <CONVT_NO_NUMBER> - strange because did not used to happen here but in the REDUCE - check on S4 onPrem
    LOOP AT result_tab ASSIGNING FIELD-SYMBOL(<neg_number>) WHERE table_line < 0.
      neg_numbers = neg_numbers && ', ' && <neg_number>.
    ENDLOOP.
    IF neg_numbers IS NOT INITIAL.
      neg_numbers = substring( val = neg_numbers len = strlen( neg_numbers ) ).
    ENDIF.

    "First step & Many numbers & Custom separators
    TRY.
        result = REDUCE #( INIT r = 0 FOR wa IN result_tab NEXT
                           r = r + wa ).
      CATCH cx_sy_conversion_no_number INTO DATA(cx).
        DATA(faulty_separator) = substring_from( val = cx->value regex = '\D+' ).
        faulty_separator = substring_before( val = faulty_separator regex = '\d' ).

        DATA(place) = find( val = numbers sub = faulty_separator ).

        RAISE EXCEPTION TYPE zcx_h174_str_calc
          MESSAGE ID zh174_str_calc
          NUMBER '002'
          WITH separator faulty_separator place.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
