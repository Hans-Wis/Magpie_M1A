# dv — design verification

Verification IP for the Magpie_M1A core. Simulation run scripts live in [`../sim/`](../sim).

- `tb/` — self-checking unit testbenches (one per block) plus the Spike / riscv-dv lockstep
  testbench stubs.
- `tests/` — directed assembly programs (`smoke_directed.S`, `fence_directed.S`).
- `cov/` — functional-coverage bind (`cpu_m1_func_cov_bind.sv`), coverage-metric extraction
  (`cov_metrics.py`), and toggle/structural coverage waivers.
- `vplan/` — verification plan, feature-freeze list, and sign-off checklist.
- `fixtures/` — committed, toolchain-free test programs.

**Correctness authority** is Spike per-commit lockstep. The full lockstep/riscv-dv toolchain
(Verilator/VCS + Spike drivers) is not included in this release; the unit testbenches run
standalone under Verilator or VCS (see [`../sim/`](../sim)).
