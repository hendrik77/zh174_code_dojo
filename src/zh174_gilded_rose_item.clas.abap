CLASS zh174_gilded_rose_item  DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING iv_name    TYPE string
                  iv_sell_in TYPE i
                  iv_quality TYPE i,
      description
        RETURNING VALUE(rv_string) TYPE string.
    DATA:
      mv_name    TYPE string,
      mv_sell_in TYPE i,
      mv_quality TYPE i.
ENDCLASS.

CLASS zh174_gilded_rose_item IMPLEMENTATION.

  METHOD constructor.
    mv_name    = iv_name.
    mv_sell_in = iv_sell_in.
    mv_quality = iv_quality.
  ENDMETHOD.

  METHOD description.
    rv_string = |{ mv_name }, { mv_sell_in }, { mv_quality }|.
  ENDMETHOD.

ENDCLASS.
