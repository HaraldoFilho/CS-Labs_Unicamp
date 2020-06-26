#!/bin/bash
#./tb_rege
ghdl -r tb_reg --vcd=reg.vcd
gtkwave reg.vcd &
