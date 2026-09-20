# Known Runtime Gaps

The following items require a live SAP system before this reconstruction can be described as deployable:

1. Activate the DDIC domain, data elements and custom table in SE11.
2. Generate and test the TMG/SM30 maintenance dialog.
3. Confirm the `MARA` lookup against materials available in the target client.
4. Create/activate Screen 0100 in Screen Painter.
5. Create/activate `STATUS_0100` and the expected function codes.
6. Confirm the `CC_ALV` custom-control name.
7. Activate the function group and function module.
8. Create the SFP interface and Adobe Form.
9. Verify the generated Adobe Form function-module signature.
10. Run SAP syntax checks, extended program checks and end-to-end tests.

Static analysis outside SAP cannot validate these repository-dependent objects.
