" Portfolio reconstruction: exact original source unavailable.
*---------------------------------------------------------------------*
* Global declarations
*---------------------------------------------------------------------*

TABLES zac08_final_ac27.

TYPES ty_t_requests TYPE STANDARD TABLE OF zac08_final_ac27
                    WITH EMPTY KEY.

DATA:
  gt_requests  TYPE ty_t_requests,
  go_container TYPE REF TO cl_gui_custom_container,
  go_grid      TYPE REF TO cl_gui_alv_grid,
  gv_ok_code   TYPE sy-ucomm.

CONSTANTS:
  gc_status_new       TYPE c LENGTH 1 VALUE 'N',
  gc_status_process   TYPE c LENGTH 1 VALUE 'P',
  gc_status_completed TYPE c LENGTH 1 VALUE 'C',
  gc_status_cancelled TYPE c LENGTH 1 VALUE 'A',
  gc_urgent           TYPE c LENGTH 1 VALUE 'X'.
