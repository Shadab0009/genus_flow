set current_design simple_alu
create_clock -name VIR_CLK -period 7 -waveform {0 3.5}
set_input_delay 0.95 -clock VIR_CLK [get_ports * -filter {direction == in}]
set_output_delay 0.95 -clock VIR_CLK [get_ports * -filter {direction == out}]
set_max_fanout 5 [current_design]
set_max_transition 0.95 [current_design]
#set_max_transition -fall 0.5 [current_design]
