if [file exists work] {vdel -all}
vlib work

echo "tb_topModule=tbench_top"
echo "-----------"
echo "TopModule: Memory"
echo "-----------"
echo "Running Simulation"

#transcript file clog.txt
vlog -f compile_sv.f 
#vsim tbench_top -voptargs=+acc+UVM_TESTNAME=mem_wr_rd_test -l test.log

#log /* -r
#run -all