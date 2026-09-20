# SAP ABAP Internal Purchasing Management

Portfolio reconstruction of the **AC08 Final Exercise — Internal Purchasing Management**.

The original work was developed during formal ABAP training in an SAP GUI environment. SAP GUI access is no longer available, so this repository reconstructs the project from the supplied exercise specification and preserved implementation context.

> **Repository status:** reconstructed portfolio project. It is **not** an abapGit export of the original training system and is **not currently activated or runtime-tested in a live SAP system**.

## What this project demonstrates

- ABAP Dictionary design;
- custom Z table and status domain;
- TMG / SM30 maintenance design;
- classic executable report;
- selection screen with dynamic radio-button behavior;
- modular includes and FORMs;
- local application class;
- `CL_SALV_TABLE`;
- Screen 0100 with `CL_GUI_ALV_GRID`;
- custom urgent-flag update function module;
- standard-table access (`MARA`) in the reconstruction;
- Adobe Form print architecture;
- static source analysis with abaplint.

## Fidelity labels

This repository uses three provenance labels:

| Label | Meaning |
|---|---|
| `CONFIRMED_FROM_BRIEF` | Directly supported by the supplied AC08 exercise |
| `RECOVERED_FROM_PRIOR_WORK` | Preserved from prior implementation work but not uniquely specified by the brief |
| `RECONSTRUCTED` | Rebuilt for the portfolio because the original SAP repository source/export is unavailable |

See [`docs/fidelity_audit.md`](docs/fidelity_audit.md) and [`docs/provenance_matrix.csv`](docs/provenance_matrix.csv).

## Business scenario

A logistics department needs an internal tool to manage material purchase requests. The solution supports consultation, status-based processing, urgent marking, ALV display and printable output.

## Core flow

```text
Selection Screen
      |
      v
INITIALIZATION / CHECK_DATA / MODIFY_SCREEN
      |
      v
LCL_APPL
  |        |         |
  |        |         +--> PROCESS_OPEN --> Screen 0100 --> CL_GUI_ALV_GRID
  |        |
  |        +------------> PROCESS_URG  --> CL_SALV_TABLE
  |
  +---------------------> PROCESS_ALL  --> CL_SALV_TABLE

Screen 0100
  |
  +--> URGENT --> ZAC08_SET_URGENT_AC27
  |
  +--> PRINT  --> ZCL_AC08_PRINT_AC27
                     |
                     v
               ZAF_AC08_FINAL_AC27
                     |
                     v
                    PDF
```

## Main objects

| Object | Name | Provenance |
|---|---|---|
| Status domain | `ZD_AC08_STATUS_AC27` | Confirmed from brief |
| Status data element | `ZDE_AC08_STATUS_AC27` | Confirmed from brief |
| Document ID data element | `ZDE_AC08_ID_DOC_AC27` | Confirmed from brief |
| Urgent data element | `ZDE_AC08_URG_AC27` | Confirmed from brief |
| Custom table | `ZAC08_FINAL_AC27` | Confirmed from brief |
| Report | `ZAC08_FINAL_AC27` | Confirmed from brief |
| TMG function group | `ZGF_AC08_FINAL_AC27` | Confirmed from brief template |
| Urgent function module | `ZAC08_SET_URGENT_AC27` | Confirmed from brief |
| Adobe interface | `ZIF_AC08_FINAL_AC27` | Confirmed from brief |
| Adobe Form | `ZAF_AC08_FINAL_AC27` | Confirmed from brief |
| Print class | `ZCL_AC08_PRINT_AC27` | Confirmed from brief |
| Screen | `0100` | Recovered from prior work |
| Custom Control | `CC_ALV` | Recovered from prior work |
| GUI status | `STATUS_0100` | Recovered from prior work |

## Processing modes

- `RB_OPEN` — only status `N` or `P`; Screen 0100 + `CL_GUI_ALV_GRID`.
- `RB_URG` — urgent requests only; default SALV display.
- `RB_ALL` — all requests matching the selection criteria; default SALV display.

## Data

Two datasets are deliberately separated:

### `data/exercise_example_data.csv`

The 10 fictional rows shown in the supplied AC08 exercise. The source example does not provide urgency marks, so `URGENT` remains blank.

### `data/synthetic_demo_data.csv`

A portfolio fixture derived from the same fictional scenario, with three `URGENT = X` values added only so the urgent-processing path can be demonstrated.

No real company, user, purchasing, or production SAP data are included.

## Repository structure

```text
.
├── README.md
├── abaplint.json
├── package.json
├── .github/workflows/abaplint.yml
├── src/
├── ddic/
├── data/
├── docs/
└── mockups/
```

## Static analysis

This repository pins `@abaplint/cli` to an exact version and runs it through GitHub Actions.

Static analysis is useful for source-level parser checks, but it does **not** replace:

- SE11 activation;
- SE38/SE80 syntax checks against the real DDIC;
- Screen Painter validation;
- GUI-status validation;
- TMG generation;
- SFP activation;
- runtime and integration tests.

See [`docs/known_runtime_gaps.md`](docs/known_runtime_gaps.md).

## Important implementation note

The supplied brief requires access to both a Z table and a standard SAP table but does not identify the exact standard table used in the lost original source. This reconstruction uses `MARA` for material-master validation and labels that choice as **RECONSTRUCTED**.

## What is not claimed

This repository does not claim:

- byte-for-byte identity with the original SAP project;
- current activation in SAP;
- successful current execution in SE38;
- current SM30 availability;
- active original Screen Painter or GUI-status metadata;
- active Adobe Form generation.

That boundary is intentional and is part of the portfolio's technical integrity.
