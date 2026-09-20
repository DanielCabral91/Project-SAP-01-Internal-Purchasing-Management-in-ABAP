" Portfolio reconstruction: exact original source unavailable.
*---------------------------------------------------------------------*
* Screen 0100 - PBO modules
*---------------------------------------------------------------------*

MODULE status_0100 OUTPUT.
  SET PF-STATUS 'STATUS_0100'.
  SET TITLEBAR 'TITLE_0100'.
ENDMODULE.


MODULE display_alv OUTPUT.
  IF go_container IS NOT BOUND.
    CREATE OBJECT go_container
      EXPORTING
        container_name = 'CC_ALV'.

    CREATE OBJECT go_grid
      EXPORTING
        i_parent = go_container.

    go_grid->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZAC08_FINAL_AC27'
      CHANGING
        it_outtab        = gt_requests ).
  ENDIF.
ENDMODULE.
