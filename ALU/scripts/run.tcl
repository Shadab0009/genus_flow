
if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"

set DESIGN simple_alu
set SYN_EFF medium 
set MAP_EFF medium
set OPT_EFF medium

set RELEASE [lindex [get_db program_version] end]
set _OUTPUTS_PATH OUTPUT/outputs_${RELEASE}
set _REPORTS_PATH OUTPUT/reports_${RELEASE}

if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}


set rtlDir ../RTL 

set_db init_lib_search_path {. ../../LIB/Nangate45/} 
set_db script_search_path { . ../scripts/} 
set_db init_hdl_search_path {. } 

set_db max_cpus_per_server 8 

set_db syn_generic_effort $SYN_EFF 
set_db syn_map_effort $MAP_EFF 
set_db syn_opt_effort $OPT_EFF 

set_db information_level 9 
# set_db pbs_mmmc_flow true

set_db tns_opto true 
set_db lp_insert_clock_gating true


## Reading in MMMC defination file and lef files
read_mmmc ../scripts/mmmc.tcl

read_physical -lefs { \
   ../../LEF/gsclib045_v3.5/lef/gsclib045_tech.lef
}



# Reading hdl files, initialize the database and elaborating them
read_hdl "../simple_alu.v"
elaborate $DESIGN
#read_def ../DEF/dtmf.def

init_design
time_info init_design
check_design -unresolved

## Set the innovus executable to be used for placement and routing
## set_db innovus_executable  <Innovus Executables>


####################################################################################################
## Synthesizing the design
####################################################################################################

syn_generic

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

## generate reports to save the Innovus stats
write_snapshot -innovus -directory $_OUTPUTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH
puts "Runtime & Memory after syn_opt"
time_info OPT

## write out the final database
write_db -to_file ${DESIGN}.db

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

#quit
