*& Test Code - Currently Broken
CLASS ltc_gilded_rose DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS:
      foo FOR TESTING.
ENDCLASS.

CLASS ltc_gilded_rose IMPLEMENTATION.

  METHOD foo.
    DATA(lt_items) = VALUE zh174_gilded_rose=>tt_items( ( NEW #( iv_name    = |foo|
                                                               iv_sell_in = 0
                                                               iv_quality = 0 ) ) ).

    DATA(lo_app) = NEW zh174_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                   act = CAST zh174_gilded_rose_item( lt_items[ 1 ] )->mv_name
                   exp = |fixme| ).
  ENDMETHOD.

ENDCLASS.
