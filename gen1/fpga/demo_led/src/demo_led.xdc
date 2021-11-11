# --------------------------------------------------------------
# Clock
# --------------------------------------------------------------
create_clock -period        5.000       [get_ports clk_p]
set_property PACKAGE_PIN    R4          [get_ports clk_p]
set_property IOSTANDARD     DIFF_SSTL15 [get_ports clk_p]

# --------------------------------------------------------------
# Button
# --------------------------------------------------------------
# - BUT1 (Labelled on the PCB)
set_property  PACKAGE_PIN   J17         [get_ports but1]
set_property  IOSTANDARD    LVCMOS33    [get_ports but1]
# - BUT2
set_property  PACKAGE_PIN   K17         [get_ports but2]
set_property  IOSTANDARD    LVCMOS33    [get_ports but2]

# --------------------------------------------------------------
# LEDs
# --------------------------------------------------------------
# - LED3 (Labelled on the PCB)
set_property  PACKAGE_PIN   M16         [get_ports led[3]]
set_property  IOSTANDARD    LVCMOS33    [get_ports led[3]]
# - LED4
set_property  PACKAGE_PIN   M15         [get_ports led[2]]
set_property  IOSTANDARD    LVCMOS33    [get_ports led[2]]
# - LED5
set_property  PACKAGE_PIN   K16         [get_ports led[1]]
set_property  IOSTANDARD    LVCMOS33    [get_ports led[1]]
# - LED6
set_property  PACKAGE_PIN   L16         [get_ports led[0]]
set_property  IOSTANDARD    LVCMOS33    [get_ports led[0]]

# --------------------------------------------------------------
# On-board Configuration Memory
# --------------------------------------------------------------
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4    [current_design]
set_property CONFIG_MODE SPIx4                  [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 12     [current_design]