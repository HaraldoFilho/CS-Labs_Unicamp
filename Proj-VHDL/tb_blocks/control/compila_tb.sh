#!/bin/bash
ghdl -a --ieee=synopsys ../../../vhdl/control.vhd
ghdl -a --ieee=synopsys tb_control.vhd
ghdl -e --ieee=synopsys tb_control
