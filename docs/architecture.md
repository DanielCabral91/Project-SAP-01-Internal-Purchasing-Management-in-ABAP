# Architecture

```text
Selection Screen
      |
      v
INITIALIZATION / validation / dynamic screen handling
      |
      v
LCL_APPL
  |        |         |
  |        |         +--> PROCESS_OPEN --> Screen 0100 --> CL_GUI_ALV_GRID
  |        |
  |        +------------> PROCESS_URG  --> CL_SALV_TABLE
  |
  +---------------------> PROCESS_ALL  --> CL_SALV_TABLE

Screen 0100 actions
  |
  +--> URGENT --> ZAC08_SET_URGENT_AC27 --> UPDATE ZAC08_FINAL_AC27
  |
  +--> PRINT  --> ZCL_AC08_PRINT_AC27
                     |
                     v
               ZAF_AC08_FINAL_AC27
                     |
                     v
                    PDF
```

## Separation of responsibilities

- `_SCR`: user input.
- `_F01`: validation, screen modification, shared command forms.
- `_C01`: application/data-selection logic.
- `_PBO`: Screen 0100 setup and grid creation.
- `_PAI`: Screen 0100 commands.
- Function module: database update for urgent flag.
- Global print class: Adobe Form orchestration.

This is a reconstruction of the SAP design, not a repository export from an active system.
