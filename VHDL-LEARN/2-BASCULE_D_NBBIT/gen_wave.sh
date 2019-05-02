#!/bin/bash
export DISPLAY=:0

rm work-obj93.cf

rm bascule_d_nbbits.ghw

ghdl -a bascule_d_nbbits.vhd

ghdl -a bascule_d_nbbits_tb.vhd

ghdl -e bascule_d_nbbits_tb

ghdl -r bascule_d_nbbits_tb --wave=bascule_d_nbbits.ghw

gtkwave bascule_d_nbbits.ghw&
