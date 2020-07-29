"! <p class="shorttext synchronized" lang="en">https://ccd-school.de/coding-dojo/</p>
"! https://ccd-school.de/coding-dojo/class-katas/galgenmaennchen/
"! https://www.codewars.com/kata/56832fb41676465e82000030
CLASS zh174_cl_hangman DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zh174_if_hangman.
    ALIASES guess FOR zh174_if_hangman~guess.
    ALIASES set_word FOR zh174_if_hangman~set_word.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS letter_not_found TYPE i VALUE -1.
    DATA word  TYPE string.
    DATA state TYPE string.
    DATA missed_letters TYPE string.
    METHODS format
      IMPORTING
        unformated_state      TYPE string
      RETURNING
        VALUE(formated_state) TYPE string.
ENDCLASS.

CLASS zh174_cl_hangman IMPLEMENTATION.

  METHOD guess.
    IF state = word.
      result = |The game has ended.|.
      RETURN.
    ENDIF.
    DATA(offset) = 0.
    DATA(count) = count( val = word sub = letter ).
    IF count <> 0.
      DO count TIMES.
        offset = find( val = word sub = letter off = offset ).
        state = replace( val = state off = offset len = 1 with = letter ).
      ENDDO.
    ELSE.
      missed_letters = COND #( WHEN missed_letters IS INITIAL THEN  ` # ` ELSE missed_letters )
                       && CONV string( letter ).
    ENDIF.

    result = COND #( WHEN state = word THEN |You found the word! ({ word })|
                     when strlen( missed_letters ) > 6 + 3 then |You got hung! The word was { word }.|
                     ELSE format( state ) && missed_letters ).
  ENDMETHOD.


  METHOD set_word.
    me->word = word.
    state = repeat( val = '_' occ = strlen( word ) ).
  ENDMETHOD.


  METHOD format.
    formated_state = COND #( WHEN strlen( unformated_state ) > 1
                     THEN REDUCE #( INIT r = unformated_state "add space between all letters
                                    FOR j = 1 UNTIL j > strlen( unformated_state ) - 1
                                    NEXT r = insert( val = r sub = ` ` off = j * 2 - 1 ) )
                     ELSE unformated_state ).
  ENDMETHOD.


ENDCLASS.
