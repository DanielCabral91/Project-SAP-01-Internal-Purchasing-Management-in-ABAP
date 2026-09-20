REPORT zac08_final_ac27.

*---------------------------------------------------------------------*
* Portfolio reconstruction of AC08 final exercise.
* Not runtime-verified in a live SAP system.
*---------------------------------------------------------------------*

INCLUDE zac08_final_ac27_top.
INCLUDE zac08_final_ac27_scr.
INCLUDE zac08_final_ac27_c01.
INCLUDE zac08_final_ac27_f01.
INCLUDE zac08_final_ac27_pbo.
INCLUDE zac08_final_ac27_pai.

INITIALIZATION.
  PERFORM default_values.

AT SELECTION-SCREEN.
  PERFORM check_data.

AT SELECTION-SCREEN OUTPUT.
  PERFORM modify_screen.

START-OF-SELECTION.
  IF rb_all = abap_true.
    lcl_appl=>process_all( ).
  ELSEIF rb_urg = abap_true.
    lcl_appl=>process_urg( ).
  ELSEIF rb_open = abap_true.
    lcl_appl=>process_open( ).
  ENDIF.
