# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\Dirk\Grad_School\525.742.8VL_SOC\HW\Module2\lab2\vitis\toplevel_lab2\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\Dirk\Grad_School\525.742.8VL_SOC\HW\Module2\lab2\vitis\toplevel_lab2\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {toplevel_lab2}\
-hw {D:\Dirk\Grad_School\525.742.8VL_SOC\HW\Module2\lab2\vitis\toplevel_lab2.xsa}\
-out {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {toplevel_lab2}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
bsp reload
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
bsp reload
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
bsp reload
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
bsp reload
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
platform config -updatehw {D:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module2/lab2/vitis/toplevel_lab2.xsa}
platform generate -domains 
