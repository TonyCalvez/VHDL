#!/bin/bash
export DISPLAY=:0

rm work-obj93.cf

rm ual.ghw

ghdl -a ual.vhd

ghdl -a ual_tb.vhd

ghdl -e ual_tb

ghdl -r ual_tb --wave=ual.ghw

gtkwave ual.ghw&
