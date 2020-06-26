#!/bin/bash
ghdl -a --ieee=synopsys ../../../vhdl/reg.vhd
ghdl -a --ieee=synopsys tb_reg.vhd
ghdl -e --ieee=synopsys tb_reg
