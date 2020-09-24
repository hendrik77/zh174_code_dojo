CLASS ltcl_stats_calc DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      verify_sequence_elements FOR TESTING RAISING cx_static_check,
      verify_sequence_length_eq_4 FOR TESTING RAISING cx_static_check.
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

ENDCLASS.
