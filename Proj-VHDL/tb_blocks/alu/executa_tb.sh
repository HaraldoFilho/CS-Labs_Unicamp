#!/bin/bash
./tb_alu
ghdl -r tb_ALU --vcd=ALU.vcd
gtkwave ALU.vcd &
