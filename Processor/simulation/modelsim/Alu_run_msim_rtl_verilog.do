transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/ROM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/RAM.v}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/nbit_full_adder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/nbit_multiplier.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/nbit_divider.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/regFile.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/alu.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/adder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/extendSign.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/processor.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/asip.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/controlUnit.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/decoder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/mux2a1.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/datapath.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/condLogic.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/ffNextValue.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/processor_tb.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/hazardUnit.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/comp2.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/mux3a1.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/registerarom.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/registerareg.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/registeraalu.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/registeramem.sv}

vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/TEC/II\ Semestre\ 2022/Arqui\ II/Proyecto\ 2/ASIP_Vectorial/Processor {C:/Users/Pablo/Desktop/TEC/II Semestre 2022/Arqui II/Proyecto 2/ASIP_Vectorial/Processor/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  test1

add wave *
view structure
view signals
run -all
