"! <p class="shorttext synchronized" lang="en">https://ccd-school.de/coding-dojo/</p>
"! https://ccd-school.de/coding-dojo/class-katas/galgenmaennchen/
"! https://www.codewars.com/kata/56832fb41676465e82000030
CLASS zh174_hangman DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS guess
      IMPORTING
        VALUE(letter) TYPE string
      RETURNING
        VALUE(result) TYPE string.
    METHODS get_word RETURNING VALUE(r_word) TYPE string.
    METHODS set_word IMPORTING word TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS letter_not_found TYPE i VALUE -1.
    DATA word  TYPE string.
    DATA state TYPE string.
ENDCLASS.



CLASS zh174_hangman IMPLEMENTATION.

  METHOD guess.
    DATA(offset) = 0.
    DO count( val = word sub = letter ) TIMES.
      offset = find( val = word sub = letter off = offset ).

      state = replace( val = state off = offset len = 1 with = letter ).

    ENDDO.
    result = state.
  ENDMETHOD.

  METHOD get_word.
    r_word = me->word.
  ENDMETHOD.

  METHOD set_word.
    me->word = word.
    state = replace( val = word with = '_' len = strlen( word ) ).
  ENDMETHOD.

ENDCLASS.
