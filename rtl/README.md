# rtl — synthesizable RTL

The Magpie_M1A core and its reference SoC, in Verilog-2001 / SystemVerilog.

- `filelist.f` — core compile order (top = `cpu_m1_top`).
- Core units: `core`, `ifu`, `bp`, `ras`, `cdec` (IF); `idu`, `rfu`, `csr`, `trigger` (ID);
  `alu`, `bmu`, `mul`, `div`, `lsu`, `forward`, `hazard` (EX); plus `pmp`, `dtcm`.
- Tops: `cpu_m1_top` (native `valid/ready`), `cpu_m1_axil_top` (AXI4-Lite via `axil_bridge`).
- `soc/` — reference SoC: `cpu_m1_soc_top`, `addr_decoder`, `clint`, `plic`, `uart`, `dm`, `dtm`,
  boot ROM / SRAM / BRAM adapters, and FPGA/ASIC integration tops.

Lint from the repository root:

```bash
verilator --lint-only -Wall -f rtl/filelist.f --top-module cpu_m1_top
```
