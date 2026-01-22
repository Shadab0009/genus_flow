set current_design counter
create_clock -name clk -period 6 -waveform {0 3} [get_ports clk]
set_input_delay 0.6 -clock clk [get_ports * -filter {direction == in}]
set_output_delay 0.6 -clock clk [get_ports * -filter {direction == out}]
set_max_fanout 5 [current_design]
set_max_transition 0.6 [current_design]
