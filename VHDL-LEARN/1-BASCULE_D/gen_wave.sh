#!/bin/bash

ghdl -a bascule_d.vhd

ghdl -a bascule_d_tb.vhd

ghdl -e bascule_d_tb

ghdl -r bascule_d_tb --wave=bascule_d.ghw'

gtkwave bascule_d.ghw&

rm work-obj93.cf
