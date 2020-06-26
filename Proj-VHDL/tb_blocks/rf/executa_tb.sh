#!/bin/bash
#./tb_rfe
ghdl -r tb_rf --vcd=rf.vcd
gtkwave rf.vcd &
