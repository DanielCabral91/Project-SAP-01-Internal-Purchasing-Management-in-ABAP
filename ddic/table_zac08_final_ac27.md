# DDIC — Table `ZAC08_FINAL_AC27`

The training brief required a custom transparent table for internal material requests.

| Field | Key | Type / reference | Meaning |
|---|---:|---|---|
| `MANDT` | Yes | `MANDT` | Client |
| `DOCUMENT_ID` | Yes | `ZDE_AC08_ID_DOC_AC27` | Document number |
| `REQUESTER` | No | `UNAME` | Created/requested by |
| `DOC_DATE` | No | `ERDAT` | Creation date |
| `MATERIAL` | No | `MATNR` | Material code |
| `QUANTITY` | No | `MENGE_D` | Quantity |
| `UNIT` | No | `MEINS` | Unit of measure |
| `STATUS` | No | `ZDE_AC08_STATUS_AC27` | Document status |
| `URGENT` | No | `ZDE_AC08_URG_AC27` | Urgency flag |

## Required table settings from the exercise

- Delivery class: `C`
- Table logging: enabled
- Table Maintenance Generator: One Step
- Function group: `ZGF_AC08_FINAL_AC27`
- Authorization group: `&NC&`

The generated SM30 maintenance artefacts are SAP repository objects and are therefore documented rather than reproduced as plain text source.
