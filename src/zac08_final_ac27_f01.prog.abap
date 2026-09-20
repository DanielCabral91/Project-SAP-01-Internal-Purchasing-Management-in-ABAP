" Portfolio reconstruction: exact original source unavailable.
*---------------------------------------------------------------------*
* FORMs
*---------------------------------------------------------------------*

FORM default_values.
  DATA lv_first_day TYPE sy-datum.

  lv_first_day = sy-datum.
  lv_first_day+6(2) = '01'.

  CLEAR s_date[].
  s_date-sign   = 'I'.
  s_date-option = 'BT'.
  s_date-low    = lv_first_day.
  s_date-high   = sy-datum.
  APPEND s_date.

  IF p_user IS INITIAL.
    p_user = sy-uname.
  ENDIF.
ENDFORM.


FORM check_data.
  DATA lv_document_id TYPE zac08_final_ac27-document_id.

  " In urgent-only mode block 1 is hidden and its filters are not validated.
  IF rb_urg = abap_true.
    RETURN.
  ENDIF.

  IF s_doc[] IS NOT INITIAL.
    SELECT SINGLE document_id
      FROM zac08_final_ac27
      WHERE document_id IN @s_doc
      INTO @lv_document_id.

    IF sy-subrc <> 0.
      MESSAGE 'No document found for the selected document range' TYPE 'E'.
    ENDIF.
  ENDIF.

  IF p_user IS NOT INITIAL.
    SELECT SINGLE requester
      FROM zac08_final_ac27
      WHERE requester = @p_user
      INTO @DATA(lv_requester).

    IF sy-subrc <> 0.
      MESSAGE 'Requester not found in the internal request table' TYPE 'E'.
    ENDIF.
  ENDIF.

  " Reconstructed standard-table access:
  " the brief requires reading the Z table plus a standard SAP table,
  " but it does not identify which standard table was used originally.
  IF s_mat[] IS NOT INITIAL.
    SELECT SINGLE matnr
      FROM mara
      WHERE matnr IN @s_mat
      INTO @DATA(lv_matnr).

    IF sy-subrc <> 0.
      MESSAGE 'No selected material was found in MARA' TYPE 'E'.
    ENDIF.
  ENDIF.
ENDFORM.


FORM modify_screen.
  LOOP AT SCREEN.
    IF screen-group1 = 'SEL'.
      IF rb_urg = abap_true.
        screen-active = 0.
      ELSE.
        screen-active = 1.
      ENDIF.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
ENDFORM.


FORM print_current_data.
  IF gt_requests IS INITIAL.
    MESSAGE 'No displayed data available for printing' TYPE 'I'.
    RETURN.
  ENDIF.

  zcl_ac08_print_ac27=>print_document(
    EXPORTING
      it_documentos = gt_requests ).
ENDFORM.


FORM mark_selected_urgent.
  " The exact row-selection implementation depends on the Screen 0100 grid
  " configuration. The following flow documents the intended interaction.

  DATA:
    lt_rows TYPE lvc_t_row,
    ls_row  TYPE lvc_s_row,
    lv_result TYPE c LENGTH 1.

  IF go_grid IS NOT BOUND.
    MESSAGE 'ALV grid is not available' TYPE 'I'.
    RETURN.
  ENDIF.

  go_grid->get_selected_rows(
    IMPORTING
      et_index_rows = lt_rows ).

  READ TABLE lt_rows INTO ls_row INDEX 1.
  IF sy-subrc <> 0.
    MESSAGE 'Select one row first' TYPE 'I'.
    RETURN.
  ENDIF.

  READ TABLE gt_requests ASSIGNING FIELD-SYMBOL(<ls_request>)
    INDEX ls_row-index.
  IF sy-subrc <> 0.
    MESSAGE 'Selected row could not be read' TYPE 'E'.
  ENDIF.

  CALL FUNCTION 'ZAC08_SET_URGENT_AC27'
    EXPORTING
      iv_document_id = <ls_request>-document_id
      iv_urgent      = gc_urgent
    IMPORTING
      ev_result      = lv_result.

  IF lv_result = 'S'.
    <ls_request>-urgent = gc_urgent.
    go_grid->refresh_table_display( ).
    MESSAGE 'Document marked as urgent' TYPE 'S'.
  ELSE.
    MESSAGE 'Urgent update failed' TYPE 'E'.
  ENDIF.
ENDFORM.
