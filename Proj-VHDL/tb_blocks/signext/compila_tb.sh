#!/bin/bash
ghdl -a --ieee=synopsys ../../../vhdl/signext.vhd
ghdl -a --ieee=synopsys tb_signext.vhd
ghdl -e --ieee=synopsys tb_signext
