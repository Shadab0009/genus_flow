# Cadence Genus(TM) Synthesis Solution, Version 21.14-s082_1, built Jun 23 2022 14:32:08

# Date: Thu Jan 22 12:01:29 2026
# Host: ra01 (x86_64 w/Linux 3.10.0-1160.119.1.el7.x86_64) (6cores*12cpus*1physical cpu*Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz 12288KB)
# OS:   CentOS Linux release 7.9.2009 (Core)

source ../scripts/run.tcl
set_db lp_insert_discrete_clock_gating_logic true
syn_generic
report_clock_gating
pwdf
pwd
gui_show
pwd
gvim ../scripts/run.tcl
write_snapshot -directory $_OUTPUTS_PATH -tag syn_generic
report_summary -directory $_REPORTS_PATH
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
syn_map
write_snapshot -directory $_OUTPUTS_PATH -tag syn_map
report_summary -directory $_REPORTS_PATH
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
syn_opt
write_snapshot -innovus -directory $_OUTPUTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH
puts "Runtime & Memory after syn_opt"
time_info OPT
write_db -to_file ${DESIGN}.db
puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
check_design -all
check_timing_intent
exit
