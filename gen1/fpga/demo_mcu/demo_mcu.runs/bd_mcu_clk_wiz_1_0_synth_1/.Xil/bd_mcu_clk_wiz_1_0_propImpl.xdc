set_property SRC_FILE_INFO {cfile:f:/General_Platform/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0.xdc rfile:../../../demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.05
