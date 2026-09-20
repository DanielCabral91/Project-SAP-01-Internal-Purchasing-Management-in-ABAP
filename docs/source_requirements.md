# Source requirements extracted from the AC08 brief

The supplied AC08 final exercise requires an end-to-end ABAP solution for internal purchasing management.

The solution must demonstrate:

- ABAP Dictionary objects;
- custom Z table;
- SM30 / TMG;
- classic report;
- selection screen with radio buttons;
- screens and GUI status;
- custom-table and standard-table access;
- validations;
- ALV presentation;
- functions;
- classes;
- modular processing with FORMs / PERFORMs;
- Adobe Form PDF generation.

The brief also requires three processing modes:

- all documents;
- urgent documents;
- open documents (`N` and `P`).

For open documents, the brief requires a screen-based ALV using `CL_ALV_GUI_GRID`. The other modes use `CL_SALV_TABLE`.

The urgent action updates the `URGENT` field through a function module and returns `S` or `E`.

This repository does not include the original training PDF itself.
