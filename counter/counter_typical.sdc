set current_design counter
create_clock -name clk -period 4 -waveform {0 2} [get_ports clk]
set_input_delay 0.4 -clock clk [get_ports * -filter {direction == in}]
set_output_delay 0.4 -clock clk [get_ports * -filter {direction == out}]
set_max_fanout 5 [current_design]
set_max_transition 0.4 [current_design]
