set root [file normalize "../.."]

read_verilog -sv [file join $root rtl/def.vh]
read_verilog -sv [file join $root rtl/rfu.v]
read_verilog -sv [file join $root rtl/alu.v]
read_verilog -sv [file join $root rtl/idu.v]
read_verilog -sv [file join $root rtl/ifu.v]
read_verilog -sv [file join $root rtl/lsu.v]
read_verilog -sv [file join $root rtl/csr.v]
read_verilog -sv [file join $root rtl/mul.v]
read_verilog -sv [file join $root rtl/div.v]
read_verilog -sv [file join $root rtl/forward.v]
read_verilog -sv [file join $root rtl/hazard.v]
read_verilog -sv [file join $root rtl/bp.v]
read_verilog -sv [file join $root rtl/ras.v]
read_verilog -sv [file join $root rtl/cdec.v]
read_verilog -sv [file join $root rtl/core.v]
read_verilog -sv [file join $root rtl/cpu_m1_top.v]
read_verilog -sv [file join $root rtl/axil_bridge.v]
read_verilog -sv [file join $root rtl/cpu_m1_axil_top.v]
read_verilog -sv [file join $root rtl/soc/axil_bootrom.v]
read_verilog -sv [file join $root rtl/soc/axil_dp_bram.v]
read_verilog -sv system_pynq_m1.v
read_xdc synth_pynq.xdc

synth_design -part xc7z020clg400-1 -top system_pynq_m1
opt_design
place_design
phys_opt_design
route_design

report_utilization -file utilization.rpt
report_timing_summary -file timing.rpt

write_checkpoint -force system_pynq_m1.dcp
write_bitstream -force system_pynq_m1.bit
