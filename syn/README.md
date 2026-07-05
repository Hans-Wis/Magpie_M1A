# syn — ASIC synthesis

Reference logic synthesis with **Synopsys Design Compiler**, targeting **TSMC 28 nm (28HPC+)**.

- `run_dc.tcl` — DC-shell script: reads `rtl/filelist.f`, applies a single-clock constraint
  (`target_period_ns`), runs `compile_ultra`, and writes QoR / area / timing / power reports.

Requirements (not included — proprietary):

- A Design Compiler license.
- A TSMC 28 nm standard-cell library. Point the `PDK_DB` environment variable at the `.db`
  timing library before running:

  ```bash
  export PDK_DB=/path/to/tcbn28hpcplus...tt0p9v25c.db
  dc_shell -f syn/run_dc.tcl        # run from the repository root
  ```

Indicative trial result on the frozen RTL: ~700 MHz (WNS 0), ≈80.7 kGE, ~14 mW. This is a
synthesis trial, not a production sign-off.
