CLASS zh174_fibonacci DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS for
      IMPORTING
        n                 TYPE i
      RETURNING
        VALUE(fib_number) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zh174_fibonacci IMPLEMENTATION.

  METHOD for.
    fib_number = SWITCH #( n WHEN 1 THEN 0
                             WHEN 2 THEN 1
                             ELSE for( n - 1 ) + for( n - 2 ) ).
  ENDMETHOD.

ENDCLASS.
