# Magpie_M1A — simulation runner
#
#   make lint              # Verilator lint of the core (top = cpu_m1_top)
#   make verilator TB=...  # build + run a unit testbench with Verilator (open source)
#   make vcs       TB=...  # build + run a unit testbench with Synopsys VCS (licensed)
#   make clean
#
# TB defaults to tb_alu_unit; pick any testbench name from ../dv/tb/.

TB     ?= tb_alu_unit
FILES  := files.f
TB_SRC := ../dv/tb/$(TB).v

.PHONY: lint verilator vcs clean

lint:
	verilator --lint-only -Wall -f $(FILES) --top-module cpu_m1_top

verilator:
	verilator --binary -j 0 -Wno-fatal -Wno-lint -f $(FILES) $(TB_SRC) \
	          --top-module $(TB) -o $(TB)
	./obj_dir/$(TB)

vcs:
	vcs -full64 -sverilog -f $(FILES) $(TB_SRC) -top $(TB) -o simv_$(TB)
	./simv_$(TB)

clean:
	rm -rf obj_dir simv_* *.daidir csrc *.vcd *.fst *.log
