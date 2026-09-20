# Screen 0100

The original AC08 work used:

- Screen: `0100`
- Custom Control: `CC_ALV`
- GUI status: `STATUS_0100`
- ALV class: `CL_GUI_ALV_GRID`

## PBO

1. Set GUI status.
2. Set title bar.
3. Create `CL_GUI_CUSTOM_CONTAINER`.
4. Create `CL_GUI_ALV_GRID`.
5. Bind `GT_REQUESTS` using structure `ZAC08_FINAL_AC27`.

## PAI

Function codes represented in the reconstruction:

- `BACK`
- `EXIT`
- `CANCEL`
- `PRINT`
- `URGENT`

`URGENT` obtains the selected grid row and calls `ZAC08_SET_URGENT_AC27`.

The actual Screen Painter layout and GUI status are SAP repository metadata and are not represented by a plain ABAP file.
