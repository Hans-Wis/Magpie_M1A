# sim — simulation

Simulation run infrastructure for the Magpie_M1A core and its testbenches.

- `files.f` — simulation filelist (core RTL, paths relative to this directory).
- `Makefile` — build/run targets for **Verilator** (open source) and **Synopsys VCS** (licensed).

## Quick start

```bash
# Lint the core
make lint

# Build and run a unit testbench (open source)
make verilator TB=tb_alu_unit

# Same with VCS (licensed)
make vcs TB=tb_div_unit
```

`TB` selects any testbench in [`../dv/tb/`](../dv/tb). The unit testbenches are self-checking and
print `PASS`/`FAIL`. The Spike per-commit lockstep testbenches (`tb_spike_lockstep`,
`tb_riscvdv_lockstep`) additionally require a Spike build and the lockstep driver, which are not
included in this release.
