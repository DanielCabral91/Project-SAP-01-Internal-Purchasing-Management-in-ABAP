" Portfolio reconstruction: exact original source unavailable.
*---------------------------------------------------------------------*
* Local application class
*---------------------------------------------------------------------*

CLASS lcl_appl DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      process_all,
      process_urg,
      process_open.

  PRIVATE SECTION.
    CLASS-METHODS:
      select_all
        RETURNING VALUE(rt_requests) TYPE ty_t_requests,
      select_urgent
        RETURNING VALUE(rt_requests) TYPE ty_t_requests,
      select_open
        RETURNING VALUE(rt_requests) TYPE ty_t_requests,
      display_salv
        IMPORTING it_requests TYPE ty_t_requests.
ENDCLASS.


CLASS lcl_appl IMPLEMENTATION.

  METHOD process_all.
    gt_requests = select_all( ).
    display_salv( gt_requests ).
  ENDMETHOD.


  METHOD process_urg.
    gt_requests = select_urgent( ).
    display_salv( gt_requests ).
  ENDMETHOD.


  METHOD process_open.
    gt_requests = select_open( ).

    IF gt_requests IS INITIAL.
      MESSAGE 'No open documents found' TYPE 'I'.
      RETURN.
    ENDIF.

    CALL SCREEN 0100.
  ENDMETHOD.


  METHOD select_all.
    SELECT *
      FROM zac08_final_ac27
      WHERE document_id IN @s_doc
        AND material    IN @s_mat
        AND requester   =  @p_user
        AND doc_date    IN @s_date
      INTO TABLE @rt_requests.
  ENDMETHOD.


  METHOD select_urgent.
    SELECT *
      FROM zac08_final_ac27
      WHERE urgent = @gc_urgent
      INTO TABLE @rt_requests.
  ENDMETHOD.


  METHOD select_open.
    SELECT *
      FROM zac08_final_ac27
      WHERE document_id IN @s_doc
        AND material    IN @s_mat
        AND requester   =  @p_user
        AND doc_date    IN @s_date
        AND status      IN ( @gc_status_new, @gc_status_process )
      INTO TABLE @rt_requests.
  ENDMETHOD.


  METHOD display_salv.
    DATA lo_salv TYPE REF TO cl_salv_table.

    IF it_requests IS INITIAL.
      MESSAGE 'No matching documents found' TYPE 'I'.
      RETURN.
    ENDIF.

    TRY.
        cl_salv_table=>factory(
          IMPORTING
            r_salv_table = lo_salv
          CHANGING
            t_table      = it_requests ).

        lo_salv->get_functions( )->set_all( abap_true ).
        lo_salv->get_columns( )->set_optimize( abap_true ).
        lo_salv->display( ).

      CATCH cx_salv_msg INTO DATA(lx_salv).
        MESSAGE lx_salv->get_text( ) TYPE 'E'.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
