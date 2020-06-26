#!/bin/bash
ghdl -a ../../../vhdl/alu.vhd
ghdl -a tb_alu.vhd
ghdl -e tb_alu
