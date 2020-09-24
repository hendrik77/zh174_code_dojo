CLASS ltcl_stats_calc DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      verify_sequence_elements FOR TESTING RAISING cx_static_check,
      verify_sequence_length_eq_4 FOR TESTING RAISING cx_static_check,
      minimum_value_minus_2 FOR TESTING RAISING cx_static_check,
      minmum_value_6 FOR TESTING RAISING cx_static_check,
      maximum_value_92 FOR TESTING RAISING cx_static_check,
      average_value FOR TESTING RAISING cx_static_check,
      print_statistics FOR TESTING RAISING cx_static_check,
      average_value_2 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_stats_calc IMPLEMENTATION.

  METHOD verify_sequence_elements.
    DATA(stats) = NEW zh174_calc_stats( sequence_string =  |6, 9, 15, -2, 92, 11| ).

    DATA(number_of_elements) = stats->get_number_of_elements( ).

    cl_abap_unit_assert=>assert_equals( msg = 'number of elements in seqence = 6' exp = 6 act = number_of_elements ).
  ENDMETHOD.

  METHOD verify_sequence_length_eq_4.
    DATA(stats) = NEW zh174_calc_stats( sequence_string =  |6, 9, 15, -2| ).

    DATA(number_of_elements) = stats->get_number_of_elements( ).

    cl_abap_unit_assert=>assert_equals( msg = 'number of elements in seqence = 4' exp = 4 act = number_of_elements ).
  ENDMETHOD.

  METHOD minimum_value_minus_2.
    DATA(stats) = NEW zh174_calc_stats( sequence_string = |6, 9, 15, -2, 92, 11| ).

    DATA(minmum_value) = stats->get_minimum_value( ).

    cl_abap_unit_assert=>assert_equals( msg = 'minimum value = -2' exp = -2 act = minmum_value ).
  ENDMETHOD.

  METHOD minmum_value_6.
    DATA(stats) = NEW zh174_calc_stats( sequence_string = |6, 9, 15, 11| ).

    DATA(minmum_value) = stats->get_minimum_value( ).

    cl_abap_unit_assert=>assert_equals( msg = 'minimum value = 6' exp = 6 act = minmum_value ).
  ENDMETHOD.

  METHOD maximum_value_92.
    DATA(stats) = NEW zh174_calc_stats( sequence_string = |6, 9, 15, -2, 92, 11| ).

    DATA(maximum_value) = stats->get_maximum_value( ).

    cl_abap_unit_assert=>assert_equals( msg = 'maximum value = 92' exp = 92 act = maximum_value ).
  ENDMETHOD.

  METHOD average_value.
    DATA(stats) = NEW zh174_calc_stats( sequence_string = |6, 9, 15, -2, 92, 11| ).

    DATA(average_value) = stats->get_average_value( ).

    cl_abap_unit_assert=>assert_equals( msg = 'avverage value = 21.833333' exp = '21.833333' act = average_value ).
  ENDMETHOD.

  METHOD average_value_2.
    DATA(stats) = NEW zh174_calc_stats( sequence_string = |2, 2, 2, 2| ).

    DATA(average_value) = stats->get_average_value( ).

    cl_abap_unit_assert=>assert_equals( msg = 'avverage value = 2' exp = '2' act = average_value ).
  ENDMETHOD.

  METHOD print_statistics.
    DATA(stats) = NEW zh174_calc_stats( |6, 9, 15, -2, 92, 11| ).

    DATA(stats_string) = stats->process( ).

    DATA(expected_stats_string) = |o) minimum value = -2\n| &&
                                  |o) maximum value = 92\n| &&
                                  |o) number of elements in the sequence = 6\n| &&
                                  |o) average value = 21.833333|.
    cl_abap_unit_assert=>assert_equals( msg = 'print stats for sequence' exp = expected_stats_string act = stats_string ).
  ENDMETHOD.

ENDCLASS.
