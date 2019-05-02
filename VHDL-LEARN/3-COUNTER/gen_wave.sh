#!/bin/bash
export DISPLAY=:0

rm work-obj93.cf

rm ual.ghw

ghdl -a counter.vhd

ghdl -a counter_tb.vhd

ghdl -e counter_tb

ghdl -r counter_tb --wave=counter.ghw

open -a gtkwave counter.ghw 
