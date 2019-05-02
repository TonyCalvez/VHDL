#!/bin/bash
export DISPLAY=:0

rm work-obj93.cf

rm bascule_d_gen.ghw

ghdl -a bascule_d.vhd

ghdl -a bascule_d_tb.vhd

ghdl -e bascule_d_tb

ghdl -r bascule_d_tb --wave=bascule_d.ghw

gtkwave bascule_d.ghw&
