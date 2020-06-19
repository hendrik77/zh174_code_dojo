*inspired by:
*https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/abap
CLASS zh174_gilded_rose DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.
    TYPES:
      tt_items TYPE STANDARD TABLE OF REF TO zh174_gilded_rose_item WITH EMPTY KEY.
    METHODS:
      constructor
        IMPORTING it_items TYPE tt_items,
      update_quality.

  PRIVATE SECTION.
    DATA:
      mt_items TYPE tt_items.
ENDCLASS.



CLASS zh174_gilded_rose IMPLEMENTATION.
 METHOD constructor.
    mt_items = it_items.
  ENDMETHOD.

  METHOD update_quality.

    LOOP AT mt_items INTO DATA(lo_item).
      IF lo_item->mv_name <> |Aged Brie| AND
         lo_item->mv_name <> |Backstage passes to a TAFKAL80ETC concert|.
        IF lo_item->mv_quality > 0.
          IF lo_item->mv_name <> |Sulfuras, Hand of Ragnaros|.
            lo_item->mv_quality = lo_item->mv_quality - 1.
          ENDIF.
        ENDIF.
      ELSE.
        IF lo_item->mv_quality < 50.
          lo_item->mv_quality = lo_item->mv_quality + 1.

          IF lo_item->mv_name = |Backstage passes to a TAFKAL80ETC concert|.
            IF lo_item->mv_sell_in < 11.
              IF lo_item->mv_quality < 50.
                lo_item->mv_quality = lo_item->mv_quality + 1.
              ENDIF.
            ENDIF.

            IF lo_item->mv_sell_in < 6.
              IF lo_item->mv_quality < 50.
                lo_item->mv_quality = lo_item->mv_quality + 1.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.

      IF lo_item->mv_name <> |Sulfuras, Hand of Ragnaros|.
        lo_item->mv_sell_in = lo_item->mv_sell_in - 1.
      ENDIF.

      IF lo_item->mv_sell_in < 0.
        IF lo_item->mv_name <> |Aged Brie|.
          IF lo_item->mv_name <> |Backstage passes to a TAFKAL80ETC concert|.
            IF lo_item->mv_quality > 0.
              IF lo_item->mv_name <> |Sulfuras, Hand of Ragnaros|.
                lo_item->mv_quality = lo_item->mv_quality - 1.
              ENDIF.
            ENDIF.
          ELSE.
            lo_item->mv_quality = lo_item->mv_quality - lo_item->mv_quality.
          ENDIF.
        ELSE.
          IF lo_item->mv_quality < 50.
            lo_item->mv_quality = lo_item->mv_quality + 1.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

