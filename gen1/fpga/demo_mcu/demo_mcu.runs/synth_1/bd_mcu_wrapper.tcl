# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 5
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tfgg484-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir F:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.cache/wt [current_project]
set_property parent.project_path F:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib F:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/hdl/bd_mcu_wrapper.v
add_files F:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/bd_mcu.bd
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_microblaze_0_0/bd_mcu_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_microblaze_0_0/bd_mcu_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_microblaze_0_0/bd_mcu_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_dlmb_v10_0/bd_mcu_dlmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_dlmb_v10_0/bd_mcu_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_ilmb_v10_0/bd_mcu_ilmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_ilmb_v10_0/bd_mcu_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_dlmb_bram_if_cntlr_0/bd_mcu_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_ilmb_bram_if_cntlr_0/bd_mcu_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_lmb_bram_0/bd_mcu_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_mdm_1_0/bd_mcu_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_mdm_1_0/bd_mcu_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_rst_clk_wiz_1_100M_0/bd_mcu_rst_clk_wiz_1_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_rst_clk_wiz_1_100M_0/bd_mcu_rst_clk_wiz_1_100M_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_rst_clk_wiz_1_100M_0/bd_mcu_rst_clk_wiz_1_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_axi_uartlite_0_0/bd_mcu_axi_uartlite_0_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_axi_uartlite_0_0/bd_mcu_axi_uartlite_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_axi_uartlite_0_0/bd_mcu_axi_uartlite_0_0.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_xbar_0/bd_mcu_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_axi_gpio_0_0/bd_mcu_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_axi_gpio_0_0/bd_mcu_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_axi_gpio_0_0/bd_mcu_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all F:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/bd_mcu_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_microblaze_0_0/data/mb_bootloop_le.elf]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/General_Readout_Platform/gen1/fpga/demo_mcu/src/demo_mcu.xdc
set_property used_in_implementation false [get_files F:/General_Readout_Platform/gen1/fpga/demo_mcu/src/demo_mcu.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top bd_mcu_wrapper -part xc7a100tfgg484-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef bd_mcu_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file bd_mcu_wrapper_utilization_synth.rpt -pb bd_mcu_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
