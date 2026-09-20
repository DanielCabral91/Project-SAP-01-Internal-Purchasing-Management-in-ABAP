# Standard-table access

The AC08 brief explicitly requires reading both the custom Z table and a standard SAP table, but the supplied document does not identify which standard table the original implementation used.

To avoid inventing an unsupported historical claim, this portfolio reconstruction makes the choice explicit:

- custom table: `ZAC08_FINAL_AC27`;
- reconstructed standard-table access: `MARA`.

`MARA` is used in `FORM CHECK_DATA` to validate whether at least one material selected through `S_MAT` exists in the material master.

## Provenance

**Status: RECONSTRUCTED**

This implementation satisfies the architectural requirement without claiming that `MARA` was the exact standard table used in the original training-system source.
