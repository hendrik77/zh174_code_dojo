INTERFACE zh174_if_hangman PUBLIC.

  METHODS guess
    IMPORTING
      VALUE(letter) TYPE c
    RETURNING
      VALUE(result) TYPE string.
  METHODS set_word
    IMPORTING
      word TYPE string.

ENDINTERFACE.
