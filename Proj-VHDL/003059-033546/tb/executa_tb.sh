#!/bin/bash
ghdl -r tb_mips --vcd=mips.vcd
gtkwave mips.vcd &
