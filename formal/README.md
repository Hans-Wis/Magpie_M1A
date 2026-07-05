# formal — formal property verification

Block-level formal proofs using **SymbiYosys** (open source, Yosys + SMT solver), with the same
SystemVerilog assertions also runnable under Verilator.

- `*_assert_bind.sv` — SVA properties bound to a block (`alu`, `csr`, `forward`, `lsu`, `rfu`).
- `*.sby` — SymbiYosys job files (`prove` mode).
- `run_sby.sh` — run all SymbiYosys proofs (requires `sby` on `PATH`).
- `run_verilator_asserts.sh` — exercise the same assertions in Verilator simulation.

```bash
./formal/run_sby.sh                  # SymbiYosys proofs
./formal/run_verilator_asserts.sh    # Verilator assertion run
```
