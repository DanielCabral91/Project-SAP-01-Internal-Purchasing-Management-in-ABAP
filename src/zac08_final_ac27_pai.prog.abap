" Portfolio reconstruction: exact original source unavailable.
*---------------------------------------------------------------------*
* Screen 0100 - PAI module
*---------------------------------------------------------------------*

MODULE user_command_0100 INPUT.
  CASE gv_ok_code.
    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
      CLEAR gv_ok_code.
      LEAVE TO SCREEN 0.

    WHEN 'PRINT'.
      CLEAR gv_ok_code.
      PERFORM print_current_data.

    WHEN 'URGENT'.
      CLEAR gv_ok_code.
      PERFORM mark_selected_urgent.

    WHEN OTHERS.
      CLEAR gv_ok_code.
  ENDCASE.
ENDMODULE.
