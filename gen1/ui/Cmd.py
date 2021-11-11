# File:		Cmd.py
# Author: 	Lei Kuang
# Date:		07th Nov 2019
# @ Imperial College London

# Debug Commands for Firmware
# Microblaze <-> UART <-> Host

# ----------------------------------------------------------------
# Import
# ----------------------------------------------------------------
import serial
import serial.tools.list_ports

import time
import struct

# ----------------------------------------------------------------
# User-defined Commands
# ----------------------------------------------------------------
# Function:                             0x0??? + 0xXXXX + 0xXXXX
# Function + Parameter 1:               0x1??? + 0x???? + 0xXXXX
# Function + Parameter 1 + Parameter 2: 0x2??? + 0x???? + 0x????

# - User-defined Command Table
command_table = \
{   
    # --------------------------------------------------------------------------------------------------------------------------
    # System & Testing
    "get_version":                      0x0000, 

    # --------------------------------------------------------------------------------------------------------------------------
    # GPIO
    "led_set":                          0x2100,     # LED Control

    # --------------------------------------------------------------------------------------------------------------------------
    # - System Commands (DO NOT Modify)
    "quit":                             0x0F00,     # System cmd: Quit the command interface
    "list_cmd":                         0x0F01,     # System cmd: List all commands
    "list_serial":                      0x0F10,     # System cmd: List serial port
    "close_serial":                     0x0F11,     # System cmd: Close current serial port
    "open_serial":                      0x1F12,     # System cmd: Open serial port COM [par1]
}

command_list = []
for (key, value) in command_table.items():
    command_list.append(key)

# - User Command Interface
class Debug_Command(object):
    
    # Assign pyqtSignal directly to those variables instead of connecting
    # - to minimize the module dependicies required
    status_s    = None  # Signal for status indicating
    console_s   = None  # Signal for console print
    msgbox_s    = None  # Signal for msgbox print

    def __init__(self):
        self.serial_obj         = None  # Instance
        self.serial_port        = None  # COM Port
        self.serial_connected   = False # State
        self.serial_ready       = True  # Mutex
        self.serial_timeout     = 1000000
        self.udp_mode           = False

    def set_timeout(self, time_cnt):
        self.serial_timeout = time_cnt

    def is_connected(self):
        return self.serial_connected
  
    # Print information
    def print(self, message):
        if(self.console_s == None):
            print(message,  end='')
        else:
            self.console_s.emit(message)
    
    # Status inidicator, True: busy, False: idle
    def status(self, state):
        if(self.status_s != None):
            self.status_s.emit(state)
    
    # Error nitification
    def error(self, msg):
        if(self.msgbox_s != None):
            self.msgbox_s.emit(msg)
        else:
            print(msg)
            
    def clear(self):
        self.serial_obj.read(self.serial_obj.inWaiting())
    
    def byte_available(self):
        return self.serial_obj.inWaiting()
        
    def read_byte(self, num):
        return self.serial_obj.read(num)

    # List serial ports
    def list_serial(self, show=False):
        self.status(True)
        #--------------------------------
        port_list = []
        port_name = []
        # List available serial port
        ports = serial.tools.list_ports.comports()
        for port in ports:
            self.print('(%-5s) %s\n' % (port.device, port.description))
        #--------------------------------
        self.status(False)
        return (port_name, port_list)

    # Connect to serial port
    def open_serial(self, port='COM6'):
        self.status(True)
        self.serial_port = port
        self.print('S: Open serial port %s, ' % self.serial_port)
        # Delay for bluetooth SPP
        time.sleep(1)
        try:
            self.serial_obj = serial.Serial(self.serial_port, baudrate = 115200, timeout=30)
            self.serial_obj.set_buffer_size(16*1024*1024)
            self.print('Successful\n')
            self.serial_connected = True
        except Exception as e:
            self.print('Failded\n')
            e_msg = str(e)
            if('OSError' in e_msg):
                self.error('Timeout !\nMake sure device is powered on\n')
            elif('PermissionError' in e_msg):
                self.error('Serial port is currently occupied by another UI')
            else:
                self.error('Unknown error')
            self.status(False)
            raise SystemError
        else:
            self.status(False)
    
    # Close current serial port
    def close_serial(self):
        self.print('S: Close serial port %s, ' % self.serial_port)
        if(self.serial_connected):
            self.serial_obj.close()
            self.print('Successful\n')
            self.serial_obj = None
            self.serial_connected = False
            self.serial_ready = True
        else:
            self.print('No serial port connected\n')    # ? Close serial before opening
    
    # Decode command
    def decode_cmd(self, input_cmd):
        cmd = input_cmd.split(' ')
        # Decode function
        try:
            func = command_table[cmd[0]]
        except:
            self.print("S: No such command '%s'\n" % cmd[0])
            return None
        n_para = func>>12
        if(n_para==0):
            return (func, None, None)
        # Decode parameter 1
        try:
            par1 = int(cmd[1], 0)
        except ValueError:
            self.print("S: Invalid parameter '%s', must be a number\n" % cmd[1])
            return None
        except IndexError:
            self.print("S: Command '%s' requires %s parameter(s)\n" % (cmd[0], 'a' if n_para==1 else "two"))
            return None
        if(n_para == 1):
            return (func, par1, None)
        # Decode parameter 2
        try:
            par2 = int(cmd[2], 0)
        except ValueError:
            self.print("S: Invalid parameter '%s', must be a number\n" % cmd[2])
            return None
        except IndexError:
            self.print("S: Command '%s' requires two parameters\n" % cmd[0])
            return None
        return (func, par1, par2)

    # Execute command
    def execute_cmd(self, input_cmd):
        cmd_decoded = self.decode_cmd(input_cmd)
        if(cmd_decoded==None):
            return None
        else:
            (func, par1, par2) = cmd_decoded

        # System command
        if((func>>8)&0x0F == 0x0F):
            if(func==0x0F00):
                if(self.console_s==None):
                    cmd = input("Are you sure to quit ? y/n: ")
                    if(cmd.lower()=='y'):
                        quit(0)
                else:
                    self.print("S: Invalid cmd for UI\n")
            if(func==0x0F01):
                for (index, command) in enumerate(command_list):
                    self.print(('[%-2d] ' % index) + command + '\n')
            if(func==0x0F10):
                self.list_serial(show=True)
            if(func==0x0F11):
                self.close_serial()
            if(func==0x1F12):
                self.open_serial('COM' + str(par1))
            return None

        # MCU Command
        # - Check connectivity
        if(self.serial_connected!=True):
            self.print('S: Serial port not connected\n')    # ? Serial not connected
            self.error('Serial port not connected\n')
            raise SystemError

        # - Encode to binary
        cmd_send = struct.pack(">H", func)
        cmd_send = cmd_send + struct.pack(">H", par1 if par1!=None else 0x00)
        cmd_send = cmd_send + struct.pack(">H", par2 if par2!=None else 0x00)
        
        # - Check if leave udp mode
        if(self.udp_mode and func!=0x0DFF):
            self.error("Serial: UDP Mode, must stop readout first")
            raise RuntimeError

        # ----------------------------------------------------------------
        # Entre critical region (Mutual Exclusion)
        # - Wait until serial is ready
        while(not self.serial_ready):
            pass
        self.serial_ready = False
        self.status(True)
        # ----------------------------------------------------------------
        # - Clear buffer
        self.clear()
        
        # - Send encoded command to MCU
        try:
            self.serial_obj.write(cmd_send)
            # - Enter slave mode
            if(func==0x0DFF):
                self.udp_mode = False
                self.status(False)
                self.serial_ready = True
                return
            if((func>>8)==0x0D):
                self.udp_mode = True
        except:
            self.error("Serial: Write Command Failed")    # ? Cable unplugged after opening the serial
            self.status(False)
            self.serial_ready = True
            raise SystemError

        # Read Response v1...Not efficient...
        rdata_all = ''
        timeout_cnt = 0
        # - Check if end of message else dynamically print
        while(True):
            try:
                # - Check if data available
                numBytes = self.serial_obj.inWaiting()
                if(numBytes!=0):
                    timeout_cnt = 0
                    # - Read a number of bytes
                    rdata = self.serial_obj.read(numBytes)
                    # - Decode as utf-8
                    rdata = str(rdata, encoding = 'utf-8')
                    # - Append characters
                    rdata_all = rdata_all + rdata
                    # - Check if end flag
                    if(rdata_all.find("$")!=-1):
                        break
                    else:
                        self.print(rdata_all)
                        rdata_all = ''
            except:
                self.error("Serial: Read Message Failed")
                self.status(False)
                self.serial_ready = True
                raise RuntimeError 
            # - Check if timeout
            else:
                timeout_cnt = timeout_cnt + 1
                if(timeout_cnt==self.serial_timeout):
                    self.error('Serial: Timeout')
                    self.status(False)
                    self.serial_ready = True
                    raise TimeoutError

        # - Print remaining messgaes
        endflag = rdata_all.find("$")
        if(rdata_all[ : endflag]!=''):
            self.print(rdata_all[ : endflag])
        rdata_all = rdata_all[endflag : ]

        # - Check if end of transmission
        timeout_cnt = 0
        while(rdata_all[-1]!="#"):
            try:
                numBytes = self.serial_obj.inWaiting()
                if(numBytes!=0):
                    timeout_cnt = 0
                    rdata = self.serial_obj.read(numBytes)
                    rdata = str(rdata, encoding = 'utf-8')
                    rdata_all = rdata_all + rdata
            except:
                self.error("Serial: Read Message Failed")
                self.status(False)
                self.serial_ready = True
                raise RuntimeError
            else:
                timeout_cnt = timeout_cnt + 1
                if(timeout_cnt==self.serial_timeout):
                    self.error("Serial: Timeout")   # ? No end flag '#' in firmware
                    self.status(False)
                    self.serial_ready = True
                    raise TimeoutError

        # - Decode returned data
        try:
            if(rdata_all[1]!="["):
                data = int(rdata_all[1:-1]) if rdata_all!='$#' else None
            else:
                # "[1,2,3]" -> [1,2,3]
                dict = {'dataList': []}
                exec('dataList=%s' % rdata_all[1:-1],  dict)
                data = dict['dataList']
        except:
            self.error('Serial: Decoding Failed')
            raise SystemError

        # ----------------------------------------------------------------
        # Leave critical region
        self.status(False)
        self.serial_ready = True
        # ----------------------------------------------------------------
        return data

if __name__ == "__main__":
    mcu_debug = Debug_Command()
    mcu_debug.print("\n")
    mcu_debug.print("---- Command Line Interface for General Platform ----\n")
    mcu_debug.print("---- S: Message from system\n")
    mcu_debug.print("---- M: Message from MCU\n")
    mcu_debug.print("S: type your command, e.g., 'list_serial'\n\n")
    mcu_debug.print("S: scanning the serial port... wait !\n")
    mcu_debug.execute_cmd('list_serial')

    while(True):
        time.sleep(0.01)
        input_cmd = input(">> ")
        try:
            res = mcu_debug.execute_cmd(input_cmd.lower())
        except TimeoutError:
            mcu_debug.print("S: Timeout.\n")
        except:
            pass
