#!/bin/bash
#./tb_signexte
ghdl -r tb_signext --vcd=signext.vcd
gtkwave signext.vcd &
