CLASS zh174_gilded_rose_fixture DEFINITION public FINAL.
  PUBLIC SECTION.
  INTERFACES
      if_oo_adt_classrun.

ENDCLASS.

CLASS zh174_gilded_rose_fixture IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |OMGHAI!| ).

    DATA(lt_items) = VALUE zh174_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |+5 Dexterity Vest|
                                 iv_sell_in = 10
                                 iv_quality = 20 ) )
                        ( NEW #( iv_name    = |Aged Brie|
                                 iv_sell_in = 2
                                 iv_quality = 0 ) )
                        ( NEW #( iv_name    = |Elixir of the Mongoose|
                                 iv_sell_in = 5
                                 iv_quality = 7 ) )
                        ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                 iv_sell_in = 0
                                 iv_quality = 80 ) )
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 15
                                 iv_quality = 20 ) )
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 10
                                 iv_quality = 49 ) )
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 5
                                 iv_quality = 49 ) )
                        "This conjured item does not work properly yet
                        ( NEW #( iv_name    = |Conjured Mana Cake|
                                 iv_sell_in = 3
                                 iv_quality = 6 ) ) ).

    DATA(lo_app) = NEW zh174_gilded_rose( it_items = lt_items ).

    DATA(lv_days) = 2.
    out->get( data = lv_days name = |Number of Days?| ).

    DO lv_days TIMES.
      out->write( |-------- day { sy-index } --------| ).
      out->write( |Name, Sell_In, Quality| ).
      LOOP AT lt_items INTO DATA(lo_item).
        out->write( lo_item->description( ) ).
      ENDLOOP.
      lo_app->update_quality( ).
    ENDDO.
  ENDMETHOD.

ENDCLASS.
