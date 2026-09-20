# Reconstruction Notes

## Directly preserved from the original AC08 work

The repository preserves the main naming and architecture used during the exercise:

- `ZAC08_FINAL_AC27`
- includes `_TOP`, `_SCR`, `_F01`, `_C01`, `_PBO`, `_PAI`
- local class `LCL_APPL`
- methods `PROCESS_ALL`, `PROCESS_URG`, `PROCESS_OPEN`
- Screen `0100`
- Custom Control `CC_ALV`
- GUI status `STATUS_0100`
- `CL_SALV_TABLE`
- `CL_GUI_ALV_GRID`
- `ZAC08_SET_URGENT_AC27`
- `ZIF_AC08_FINAL_AC27`
- `ZAF_AC08_FINAL_AC27`
- `ZCL_AC08_PRINT_AC27`
- method `PRINT_DOCUMENT`

## Reconstructed rather than exported

Because SAP GUI access is no longer available, these files are not an abapGit export of the original system.

The following parts are reconstructed from the exercise specification and prior implementation structure:

- exact ABAP source formatting;
- detailed selection queries;
- error messages;
- Screen 0100 command implementation;
- Adobe Form call orchestration;
- GitHub/abaplint integration.

## What is not claimed

This repository does not claim:

- current SAP activation;
- current successful SE38 execution;
- live SM30 maintenance;
- active Screen Painter or GUI status objects;
- active Adobe Form generation;
- runtime integration testing.

That distinction is intentional so the portfolio remains technically honest.
