#!/bin/bash
ghdl -a --ieee=synopsys ../../../vhdl/rf.vhd
ghdl -a --ieee=synopsys tb_rf.vhd
ghdl -e --ieee=synopsys tb_rf
