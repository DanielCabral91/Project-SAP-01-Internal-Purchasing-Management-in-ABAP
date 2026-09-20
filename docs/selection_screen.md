# Selection Screen

## Block 1 — Selection data

- document number: `SELECT-OPTIONS s_doc`
- material: `SELECT-OPTIONS s_mat`
- requester: `PARAMETERS p_user`
- record date: `SELECT-OPTIONS s_date`

At initialization, the date range is set from the first day of the current month through the execution date.

## Block 2 — Processing type

- `RB_OPEN`: open documents
- `RB_URG`: urgent documents
- `RB_ALL`: all documents

When urgent mode is selected, the first block is hidden through `AT SELECTION-SCREEN OUTPUT`.

## Validation

The reconstruction checks whether requested document IDs and requester values are represented in `ZAC08_FINAL_AC27`.

These checks are representative and would need activation/runtime validation against the actual DDIC and data in a live SAP system.
