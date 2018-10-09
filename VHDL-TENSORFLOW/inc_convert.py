from myhdl import Signal, ResetSignal, modbv

from inc import HelloWorld

def convert_HelloWorld(hdl):
    """Convert inc block to Verilog or VHDL."""

    hellotovdhl = HelloWorld()

    hellotovdhl.convert(hdl=hdl)

convert_HelloWorld(hdl='VHDL')