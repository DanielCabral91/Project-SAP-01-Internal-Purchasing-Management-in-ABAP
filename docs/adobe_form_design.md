# Adobe Form Design

## SAP objects

- Interface: `ZIF_AC08_FINAL_AC27`
- Form: `ZAF_AC08_FINAL_AC27`
- Print class: `ZCL_AC08_PRINT_AC27`
- Method: `PRINT_DOCUMENT`

The prior implementation used a table-style interface for the displayed documents. In this reconstruction the table parameter is named:

`IT_DOCUMENTOS`

with rows corresponding to `ZAC08_FINAL_AC27`.

## Document fields

- `DOCUMENT_ID`
- `REQUESTER`
- `DOC_DATE`
- `MATERIAL`
- `QUANTITY`
- `UNIT`
- `STATUS`
- `URGENT`

## Layout

The exercise requires:

- logo or styled text;
- header;
- body;
- footer;
- PDF generation when the user chooses Print.

The original mockup showed a document title, creation date, tabular request list, automatic-generation note, collaborator line, and page number.

## Reconstruction limitation

Adobe Forms contain SFP context and layout metadata that cannot be recreated faithfully from an ABAP class alone. The class in `src/` shows the expected orchestration pattern (`FP_JOB_OPEN`, generated form function module, `FP_JOB_CLOSE`) but has not been reactivated in a live SAP system.
