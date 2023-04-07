onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+ila_dac_test -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ila_dac_test xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {ila_dac_test.udo}

run -all

endsim

quit -force
