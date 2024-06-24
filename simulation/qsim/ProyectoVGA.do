onerror {quit -f}
vlib work
vlog -work work ProyectoVGA.vo
vlog -work work ProyectoVGA.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mainVGA_vlg_vec_tst
vcd file -direction ProyectoVGA.msim.vcd
vcd add -internal mainVGA_vlg_vec_tst/*
vcd add -internal mainVGA_vlg_vec_tst/i1/*
add wave /*
run -all
