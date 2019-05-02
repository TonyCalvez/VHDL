
#!/bin/bash

ghdl -a dff.vhd
echo 'VHDL compiled, Binary generated!'
echo '================================'

ghdl -a dff_tb.vhd
echo 'Testbench compiled, Binary generated!'
echo '================================'

ghdl -e dff_tb
echo 'Elaboration completed!'
echo '================================'

ghdl -r dff_tb --wave=dff.ghw
echo 'Waveform generated!'
echo '================================'

open -a gtkwave dff.ghw 