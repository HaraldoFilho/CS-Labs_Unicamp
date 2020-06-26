#!/bin/bash
ghdl -a pkg_mips.vhd
ghdl -a mux2.vhd
ghdl -a signext.vhd
ghdl -a control.vhd
ghdl -a alu.vhd
ghdl -a --ieee=synopsys rf.vhd
ghdl -a --ieee=synopsys reg.vhd
ghdl -a --ieee=synopsys mips.vhd
ghdl -e --ieee=synopsys mips
