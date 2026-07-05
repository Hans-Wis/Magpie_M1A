# fpga — FPGA build

Reference FPGA build for the **Digilent PYNQ-Z2** (Xilinx Zynq-7020) using **Vivado**.

`pynq_z2/`:

- `system_pynq_m1.v` — FPGA top: the core plus on-chip memory and a small UART harness.
- `synth_pynq.tcl` / `synth_pynq.xdc` — Vivado synthesis/implementation script and constraints.
- `Makefile` — builds firmware and drives Vivado (`VIVADO`, `RISCV_PREFIX` overridable).
- `firmware.c` / `firmware.S` / `firmware.lds` / `hex32.py` — bring-up firmware and hex packer.
- `tb_system_pynq_m1.v` — system-level testbench.

```bash
cd fpga/pynq_z2
make            # build firmware + run Vivado synth/impl
```

Requires Vivado and a RISC-V bare-metal GCC (`riscv-none-elf-`) on `PATH`. Reported target:
~85 MHz on the PYNQ-Z2. Build products (`*.bit`, `*.dcp`) are not committed.
