# lint — RTL lint / CDC / RDC

Two lint flows are used:

- **Verilator** (open source) — fast structural lint, run from the repository root:

  ```bash
  verilator --lint-only -Wall -f rtl/filelist.f --top-module cpu_m1_top
  ```

- **Synopsys Spyglass** (licensed) — sign-off lint plus CDC/RDC. Configuration lives in
  `spyglass/`:
  - `run_spyglass.tcl` — lint (`lint/lint_rtl`, STARC policy) run script.
  - `magpie_m1_lint_waivers.awl` — reviewed lint waivers.
  - `cdc_rdc_xprop.sgdc` + `magpie_m1_cdc_rdc_xprop_waivers.awl` — CDC/RDC constraints and waivers.

  Run from the repository root with Spyglass on `PATH` (`SPYGLASS_HOME` set); the run script reads
  `rtl/filelist.f`. Reported status on the frozen RTL: 0 lint errors, 0 CDC, 0 RDC.
