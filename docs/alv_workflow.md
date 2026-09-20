# ALV Workflow

## `PROCESS_ALL`

Reads matching records from `ZAC08_FINAL_AC27` and displays them with `CL_SALV_TABLE`.

## `PROCESS_URG`

Reads records with `URGENT = 'X'` and displays them with `CL_SALV_TABLE`.

## `PROCESS_OPEN`

Reads matching records with status:

- `N` — New
- `P` — In Processing

The resulting internal table is passed to Screen 0100, where it is displayed using `CL_GUI_ALV_GRID`.

## Print and urgent actions

The exercise requires printing of displayed data. The reconstructed Screen 0100 includes `PRINT`.

The urgent button is represented as `URGENT` and delegates the database update to the required function module.
