# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Dirk\Grad_School\525.742.8VL_SOC\HW\Module4\Lab4\vitis\lab4_system\_ide\scripts\systemdebugger_lab4_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Dirk\Grad_School\525.742.8VL_SOC\HW\Module4\Lab4\vitis\lab4_system\_ide\scripts\systemdebugger_lab4_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B049F4A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B049F4A-23727093-0"}
fpga -file D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module4/Lab4/vitis/lab4/_ide/bitstream/toplevel_lab4.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module4/Lab4/vitis/toplevel_lab4/export/toplevel_lab4/hw/toplevel_lab4.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module4/Lab4/vitis/lab4/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module4/Lab4/vitis/lab4/Debug/lab4.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
