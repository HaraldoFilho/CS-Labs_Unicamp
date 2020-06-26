#!/bin/bash
ghdl -a --ieee=synopsys ../../../vhdl/mux2.vhd
ghdl -a --ieee=synopsys tb_mux2.vhd
ghdl -e --ieee=synopsys tb_mux2
