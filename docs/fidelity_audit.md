# Fidelity Audit

This repository distinguishes what is supported by the supplied AC08 exercise, what was recovered from prior work, and what had to be reconstructed after SAP GUI access was lost.

## Status legend

- **CONFIRMED_FROM_BRIEF** — directly specified by the supplied AC08 final-exercise document. Where the document uses a trainee placeholder, `AC27` is substituted.
- **RECOVERED_FROM_PRIOR_WORK** — preserved from the implementation work previously developed, but not uniquely specified by the supplied brief.
- **RECONSTRUCTED** — written for this portfolio reconstruction because the original SAP repository source/export is unavailable.

The machine-readable matrix is in `docs/provenance_matrix.csv`.

## Main findings

### Confirmed by the supplied brief

The following are strongly grounded in the source exercise:

- DDIC status domain and the N/P/C/A model;
- the three required data elements;
- custom table fields;
- delivery class C and logging;
- TMG/SM30 One Step design;
- selection-screen fields and radio-button modes;
- include naming pattern;
- required report events;
- local class `LCL_APPL`;
- `PROCESS_ALL`, `PROCESS_URG`, `PROCESS_OPEN`;
- `CL_SALV_TABLE` and `CL_ALV_GUI_GRID`;
- urgent-update function module contract;
- Adobe Form interface, form and global print class requirements.

### Recovered from prior implementation work

The repository keeps:

- Screen `0100`;
- custom control `CC_ALV`;
- GUI status `STATUS_0100`.

These are not all prescribed by exact name in the brief, so they are not labeled as brief-confirmed.

### Reconstructed now

The following source-level details are portfolio reconstructions:

- exact SQL statements;
- exact FORM implementations;
- exact PBO/PAI code;
- exact message texts;
- the standard-table lookup choice (`MARA`);
- the precise Adobe Forms orchestration code;
- GitHub/abaplint configuration;
- text mockups.

## Critical boundary

This repository is **not** an abapGit export and does **not** claim byte-for-byte identity with the original SAP system.

The original Screen Painter metadata, GUI-status repository metadata, TMG-generated objects, DDIC activation metadata and Adobe Form layout/context are not available as original exports.

## Result of the audit

The project is suitable as a transparent portfolio reconstruction when described as such. It must not be presented as the original complete SAP repository or as currently activated/runtime-tested in SAP.
