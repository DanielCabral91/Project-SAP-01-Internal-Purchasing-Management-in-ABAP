" Portfolio reconstruction: exact original source unavailable.
FUNCTION zac08_set_urgent_ac27.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_DOCUMENT_ID) TYPE ZDE_AC08_ID_DOC_AC27
*"     VALUE(IV_URGENT)      TYPE ZDE_AC08_URG_AC27
*"  EXPORTING
*"     VALUE(EV_RESULT)      TYPE CHAR1
*"----------------------------------------------------------------------

  CLEAR ev_result.

  UPDATE zac08_final_ac27
    SET urgent = @iv_urgent
    WHERE document_id = @iv_document_id.

  IF sy-subrc = 0.
    COMMIT WORK AND WAIT.
    ev_result = 'S'.
  ELSE.
    ROLLBACK WORK.
    ev_result = 'E'.
  ENDIF.

ENDFUNCTION.
