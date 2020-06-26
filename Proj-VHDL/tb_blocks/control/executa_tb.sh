#!/bin/bash
#./tb_controle
ghdl -r tb_control --vcd=Control.vcd
gtkwave Control.vcd &
