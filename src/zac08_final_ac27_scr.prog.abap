" Portfolio reconstruction: exact original source unavailable.
*---------------------------------------------------------------------*
* Selection screen
*---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.

SELECT-OPTIONS:
  s_doc  FOR zac08_final_ac27-document_id MODIF ID sel,
  s_mat  FOR zac08_final_ac27-material    MODIF ID sel,
  s_date FOR zac08_final_ac27-doc_date    MODIF ID sel.

PARAMETERS p_user TYPE syuname OBLIGATORY MODIF ID sel.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-b02.

PARAMETERS:
  rb_open RADIOBUTTON GROUP prc DEFAULT 'X' USER-COMMAND mode,
  rb_urg  RADIOBUTTON GROUP prc,
  rb_all  RADIOBUTTON GROUP prc.

SELECTION-SCREEN END OF BLOCK b2.
