# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Thu Jan 22 16:39:08 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 4.0 -waveform {0.0 2.0} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {count[0]}]
set_max_fanout 5.000 [current_design]
set_max_transition 0.4 [current_design]
