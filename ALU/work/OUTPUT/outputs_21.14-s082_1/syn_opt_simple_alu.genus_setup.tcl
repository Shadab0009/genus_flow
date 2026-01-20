################################################################################
#
# Genus(TM) Synthesis Solution setup file
# Created by Genus(TM) Synthesis Solution 21.14-s082_1
#   on 01/20/2026 15:32:11
#
# This file can only be run in Genus Common UI mode.
#
################################################################################


# This script is intended for use with Genus(TM) Synthesis Solution version 21.14-s082_1


# Remove Existing Design
################################################################################
if {[::legacy::find -design design:simple_alu] ne ""} {
  puts "** A design with the same name is already loaded. It will be removed. **"
  delete_obj design:simple_alu
}


# To allow user-readonly attributes
################################################################################
::legacy::set_attribute -quiet force_tui_is_remote 1 /


# Source INIT Setup file
################################################################################
source OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.genus_init.tcl
read_metric -id current OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.metrics.json

phys::read_script OUTPUT/outputs_21.14-s082_1/syn_opt_simple_alu.g.gz
puts "\n** Restoration Completed **\n"


# Data Integrity Check
################################################################################
# program version
if {"[string_representation [::legacy::get_attribute program_version /]]" != "21.14-s082_1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden program_version: 21.14-s082_1  current program_version: [string_representation [::legacy::get_attribute program_version /]]"
}
# license
if {"[string_representation [::legacy::get_attribute startup_license /]]" != "Genus_Synthesis"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden license: Genus_Synthesis  current license: [string_representation [::legacy::get_attribute startup_license /]]"
}
# slack
set _slk_ [::legacy::get_attribute slack design:simple_alu]
if {[regexp {^-?[0-9.]+$} $_slk_]} {
  set _slk_ [format %.1f $_slk_]
}
if {$_slk_ != "415.6"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden slack: 415.6,  current slack: $_slk_"
}
unset _slk_
# multi-mode slack
if {"[string_representation [::legacy::get_attribute slack_by_mode design:simple_alu]]" != "{{mode:simple_alu/view_wcl_slow 415.6} {mode:simple_alu/view_wcl_fast 1851.4} {mode:simple_alu/view_wcl_typical 1975.5}}"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden slack_by_mode: {{mode:simple_alu/view_wcl_slow 415.6} {mode:simple_alu/view_wcl_fast 1851.4} {mode:simple_alu/view_wcl_typical 1975.5}}  current slack_by_mode: [string_representation [::legacy::get_attribute slack_by_mode design:simple_alu]]"
}
# tns
set _tns_ [::legacy::get_attribute tns design:simple_alu]
if {[regexp {^-?[0-9.]+$} $_tns_]} {
  set _tns_ [format %.0f $_tns_]
}
if {$_tns_ != "0"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden tns: 0,  current tns: $_tns_"
}
unset _tns_
# cell area
set _cell_area_ [::legacy::get_attribute cell_area design:simple_alu]
if {[regexp {^-?[0-9.]+$} $_cell_area_]} {
  set _cell_area_ [format %.0f $_cell_area_]
}
if {$_cell_area_ != "0"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden cell area: 0,  current cell area: $_cell_area_"
}
unset _cell_area_
# net area
set _net_area_ [::legacy::get_attribute net_area design:simple_alu]
if {[regexp {^-?[0-9.]+$} $_net_area_]} {
  set _net_area_ [format %.0f $_net_area_]
}
if {$_net_area_ != "307"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden net area: 307,  current net area: $_net_area_"
}
unset _net_area_
# library domain count
if {[llength [::legacy::find /libraries -library_domain *]] != "3"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden # library domains: 3  current # library domains: [llength [::legacy::find /libraries -library_domain *]]"
}
