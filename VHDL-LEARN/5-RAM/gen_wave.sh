#!/bin/bash
export DISPLAY=:0

rm work-obj93.cf

rm ual.ghw

ghdl -a ram.vhd

ghdl -a ram_tb.vhd

ghdl -e ram_tb

ghdl -r ram_tb --wave=ram.ghw

open -a gtkwave ram.ghw 
