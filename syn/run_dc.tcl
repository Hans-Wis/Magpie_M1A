set top_name cpu_m1_top
set target_period_ns 1.43
set target_library_path "$::env(PDK_DB)"

set_app_var search_path [list . rtl [file dirname $target_library_path]]
set_app_var target_library [list $target_library_path]
set_app_var link_library [concat "*" [list $target_library_path] [list dw_foundation.sldb]]
set_app_var synthetic_library [list dw_foundation.sldb]
set_app_var hdlin_enable_vpp true
set_app_var hdlin_infer_multibit default_all

file mkdir reports db work logs
define_design_lib WORK -path work

analyze -format sverilog -vcs "-f rtl/filelist.f"
elaborate $top_name
current_design $top_name
link
check_design > reports/check_design.rpt

create_clock -name clk -period $target_period_ns [get_ports clk]
set_clock_uncertainty 0.05 [get_clocks clk]
set_input_delay 0.10 -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 0.10 -clock clk [all_outputs]
set_driving_cell -lib_cell BUFFD1BWP40P140 [remove_from_collection [all_inputs] [get_ports clk]]
set_load 0.01 [all_outputs]

compile_ultra

report_qor > reports/qor.rpt
report_area -hierarchy > reports/area.rpt
report_timing -delay_type max -max_paths 20 -nworst 5 > reports/timing.rpt
report_power -analysis_effort low > reports/power.rpt
report_constraint -all_violators > reports/constraints.rpt
write -format ddc -hierarchy -output db/${top_name}.ddc
write -format verilog -hierarchy -output db/${top_name}.mapped.v

quit
