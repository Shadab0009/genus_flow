set current_design counter
create_clock -name clk -period 2 -waveform {0 1} [get_ports clk]
set_input_delay 0.2 -clock clk [get_ports * -filter {direction == in}]
set_output_delay 0.2 -clock clk [get_ports * -filter {direction == out}]
set_max_fanout 5 [current_design]
set_max_transition 0.2 [current_design]
