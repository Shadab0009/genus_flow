################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 01/20/2026 15:32:11
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}
::legacy::set_attribute -quiet init_mmmc_version 2 /

read_mmmc OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.mmmc.tcl

read_physical -lef {/home/shadab/shadab/genus_flow/ALU/work/../../LEF/gsclib045_v3.5/lef/gsclib045_tech.lef}

read_netlist OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.v.gz

init_design -skip_sdc_read
