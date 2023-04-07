onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib proc_system_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {proc_system.udo}

run -all

quit -force
