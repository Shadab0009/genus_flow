set current_design simple_alu
create_clock -name VIR_CLK -period 10 -waveform {0 5}
set_input_delay 1.5 -clock VIR_CLK [get_ports * -filter {direction == in}]
set_output_delay 1.5 -clock VIR_CLK [get_ports * -filter {direction == out}]
set_max_fanout 5 [current_design]
set_max_transition 1.5 [current_design]
#set_max_transition -fall 0.5 [current_design]
