# --------------------------------------------------------------
# Clock
# --------------------------------------------------------------
create_clock -period        5.000       [get_ports CLK_clk_p]
set_property PACKAGE_PIN    R4          [get_ports CLK_clk_p]
set_property IOSTANDARD     DIFF_SSTL15 [get_ports CLK_clk_p]

# --------------------------------------------------------------
# Reset Button on the Core Board
# --------------------------------------------------------------
set_property  PACKAGE_PIN   T6          [get_ports NRST]
set_property  IOSTANDARD    LVCMOS33    [get_ports NRST]

# --------------------------------------------------------------
# Button
# --------------------------------------------------------------
## - BUT1 (Labelled on the PCB)
#set_property  PACKAGE_PIN   J17         [get_ports but1]
#set_property  IOSTANDARD    LVCMOS33    [get_ports but1]
## - BUT2
#set_property  PACKAGE_PIN   K17         [get_ports but2]
#set_property  IOSTANDARD    LVCMOS33    [get_ports but2]

# --------------------------------------------------------------
# LEDs
# --------------------------------------------------------------
# - LED3 (Labelled on the PCB)
set_property  PACKAGE_PIN   M16         [get_ports LED[3]]
set_property  IOSTANDARD    LVCMOS33    [get_ports LED[3]]
# - LED4
set_property  PACKAGE_PIN   M15         [get_ports LED[2]]
set_property  IOSTANDARD    LVCMOS33    [get_ports LED[2]]
# - LED5
set_property  PACKAGE_PIN   K16         [get_ports LED[1]]
set_property  IOSTANDARD    LVCMOS33    [get_ports LED[1]]
# - LED6
set_property  PACKAGE_PIN   L16         [get_ports LED[0]]
set_property  IOSTANDARD    LVCMOS33    [get_ports LED[0]]

# --------------------------------------------------------------
# GPIOs
# --------------------------------------------------------------
## - GPIO1 (Labelled on the PCB)
#set_property  PACKAGE_PIN   AB10        [get_ports led[3]]
#set_property  IOSTANDARD    LVCMOS33    [get_ports led[3]]
## - GPIO2
#set_property  PACKAGE_PIN   AA10        [get_ports led[2]]
#set_property  IOSTANDARD    LVCMOS33    [get_ports led[2]]
## - GPIO3
#set_property  PACKAGE_PIN   AA11        [get_ports led[1]]
#set_property  IOSTANDARD    LVCMOS33    [get_ports led[1]]
## - GPIO4
#set_property  PACKAGE_PIN   W10         [get_ports led[0]]
#set_property  IOSTANDARD    LVCMOS33    [get_ports led[0]]
## - GPIO5
#set_property  PACKAGE_PIN   AA15        [get_ports led[3]]
#set_property  IOSTANDARD    LVCMOS33    [get_ports led[3]]
# - GPIO6
set_property  PACKAGE_PIN   AB15        [get_ports UART_rxd]
set_property  IOSTANDARD    LVCMOS33    [get_ports UART_rxd]
# - GPIO7
set_property  PACKAGE_PIN   Y16         [get_ports UART_txd]
set_property  IOSTANDARD    LVCMOS33    [get_ports UART_txd]
# - GPIO8
set_property  PACKAGE_PIN   AA16        [get_ports UART_gnd]
set_property  IOSTANDARD    LVCMOS33    [get_ports UART_gnd]

# --------------------------------------------------------------
# I2C
# --------------------------------------------------------------
# - DAC I2C
set_property  PACKAGE_PIN   H18         [get_ports I2C_DAC_scl_io]
set_property  IOSTANDARD    LVCMOS33    [get_ports I2C_DAC_scl_io]
set_property  PACKAGE_PIN   H17         [get_ports I2C_DAC_sda_io]
set_property  IOSTANDARD    LVCMOS33    [get_ports I2C_DAC_sda_io]

# --------------------------------------------------------------
# On-board Configuration Memory
# --------------------------------------------------------------
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4    [current_design]
set_property CONFIG_MODE SPIx4                  [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 12     [current_design]