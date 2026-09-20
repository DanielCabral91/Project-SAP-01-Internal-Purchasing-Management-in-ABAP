" Portfolio reconstruction: exact original source unavailable.
CLASS zcl_ac08_print_ac27 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_t_documentos TYPE STANDARD TABLE OF zac08_final_ac27
                          WITH EMPTY KEY.

    CLASS-METHODS print_document
      IMPORTING
        it_documentos TYPE ty_t_documentos.
ENDCLASS.


CLASS zcl_ac08_print_ac27 IMPLEMENTATION.

  METHOD print_document.
    DATA:
      lv_form_fm      TYPE rs38l_fnam,
      ls_outputparams TYPE sfpoutputparams,
      ls_docparams    TYPE sfpdocparams.

    " Reconstructed implementation pattern.
    " Requires active SFP interface ZIF_AC08_FINAL_AC27 and form
    " ZAF_AC08_FINAL_AC27 in a live SAP system.

    CALL FUNCTION 'FP_JOB_OPEN'
      CHANGING
        ie_outputparams = ls_outputparams
      EXCEPTIONS
        cancel          = 1
        usage_error     = 2
        system_error    = 3
        internal_error  = 4
        OTHERS          = 5.

    IF sy-subrc <> 0.
      MESSAGE 'Could not open Adobe Forms print job' TYPE 'E'.
    ENDIF.

    CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
      EXPORTING
        i_name     = 'ZAF_AC08_FINAL_AC27'
      IMPORTING
        e_funcname = lv_form_fm.

    IF sy-subrc <> 0 OR lv_form_fm IS INITIAL.
      CALL FUNCTION 'FP_JOB_CLOSE'.
      MESSAGE 'Adobe Form function module could not be resolved' TYPE 'E'.
    ENDIF.

    " IT_DOCUMENTOS is the reconstructed table parameter for the SFP
    " interface used by the list-style form.
    CALL FUNCTION lv_form_fm
      EXPORTING
        /1bcdwb/docparams = ls_docparams
        it_documentos     = it_documentos
      EXCEPTIONS
        usage_error       = 1
        system_error      = 2
        internal_error    = 3
        OTHERS            = 4.

    CALL FUNCTION 'FP_JOB_CLOSE'.

    IF sy-subrc <> 0.
      MESSAGE 'Adobe Form generation failed' TYPE 'E'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
