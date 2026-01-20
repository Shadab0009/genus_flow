################################################################################
#
# Innovus setup file
# Created by Genus(TM) Synthesis Solution 21.14-s082_1
#   on 01/20/2026 15:32:11
#
################################################################################
#
# Genus(TM) Synthesis Solution setup file
# This file can only be run in Innovus Common UI mode.
#
################################################################################


# Version Check
###########################################################

      namespace eval ::genus_innovus_version_check { 
        set minimum_version 21
        set maximum_version 22
        regexp {\d\d} [get_db program_version] this_version
        puts "Checking Innovus major version against Genus expectations ..."
        if { $this_version < $minimum_version || $this_version > $maximum_version } {
          error "**ERROR: this operation requires Innovus major version to be between '$minimum_version' and '$maximum_version'."
        }
      }
    
set _t0 [clock seconds]
puts [format  {%%%s Begin Genus to Innovus Setup (%s)} \# [clock format $_t0 -format {%m/%d %H:%M:%S}]]
set_db read_physical_allow_multiple_port_pin_without_must_join true
set_db must_join_all_ports true
set_db timing_cap_unit 1pf
set_db timing_time_unit 1ns


# Design Import
################################################################################
source -quiet /home/install/GENUS211/tools.lnx86/lib/cdn/rc/edi/innovus_procs_common_ui.tcl
## Reading FlowKit settings file
source OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.flowkit_settings.tcl

source OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.invs_init.tcl

# Reading metrics file
################################################################################
read_metric -id current OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.metrics.json

## Reading common preserve file for dont_touch and dont_use preserve settings
source -quiet OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.preserve.tcl

## Reading Innovus Mode attributes file
pqos_eval {rcp::read_taf OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.mode_attributes.taf.gz}


# Mode Setup
################################################################################
source OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.mode


# MSV Setup
################################################################################

# Source cell padding from Genus
################################################################################
source -quiet OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.cell_pad.tcl 


# Reading write_name_mapping file
################################################################################

      if { [is_attribute -obj_type port original_name] &&
           [is_attribute -obj_type pin original_name] &&
           [is_attribute -obj_type pin is_phase_inverted]} {
        source OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.wnm_attrs.tcl
      }
    

# Reading NDR file
source OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.ndr.tcl

# Reading Instance Attributes file
pqos_eval { rcp::read_taf OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.inst_attributes.taf.gz}

# Reading minimum routing layer data file
################################################################################
pqos_eval {rcp::load_min_layer_file OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.min_layer {M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11} {1 2 3 4 5 6 7 8 9 10 11}}
eval_legacy {set edi_pe::pegConsiderMacroLayersUnblocked 1}
eval_legacy {set edi_pe::pegPreRouteWireWidthBasedDensityCalModel 1}

      set _t1 [clock seconds]
      puts [format  {%%%s End Genus to Innovus Setup (%s, real=%s)} \# [clock format $_t1 -format {%m/%d %H:%M:%S}] [clock format [expr {28800 + $_t1 - $_t0}] -format {%H:%M:%S}]]
    
