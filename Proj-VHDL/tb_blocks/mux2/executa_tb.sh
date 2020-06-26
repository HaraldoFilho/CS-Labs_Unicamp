#!/bin/bash
#./tb_mux2e
ghdl -r tb_mux2 --vcd=mux2.vcd
gtkwave mux2.vcd &
