#!/bin/bash
ghdl -a ../vhdl/pkg_mips.vhd
ghdl -a ../vhdl/mux2.vhd
ghdl -a ../vhdl/signext.vhd
ghdl -a ../vhdl/control.vhd
ghdl -a ../vhdl/alu.vhd
ghdl -a --ieee=synopsys ../vhdl/rf.vhd
ghdl -a --ieee=synopsys ../vhdl/reg.vhd
ghdl -a --ieee=synopsys ../vhdl/mips.vhd
ghdl -a --ieee=synopsys tb_mips.vhd
ghdl -e --ieee=synopsys tb_mips
