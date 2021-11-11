connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-HS1 210512180081"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-HS1 210512180081"} -index 0
dow F:/General_Readout_Platform/gen1/fpga/demo_mcu/demo_mcu.sdk/demo_mcu/Debug/demo_mcu.elf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-HS1 210512180081"} -index 0
con
