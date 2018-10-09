-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity pwm_task_logic_testbench is
end pwm_task_logic_testbench;

-------------------------------------------------------------------------------
architecture testbench of pwm_task_logic_testbench is

signal s_resetn             : std_logic;
signal s_avalon_chip_select : std_logic;
signal s_address            : std_logic_vector (1 downto 0);
signal s_writep             : std_logic;
signal s_write_data         : std_logic_vector (31 downto 0);
signal s_readp              : std_logic;
signal s_pwm_out            : std_logic;
-----------------
constant HALF_PERIOD : time := 20 ns;
signal s_clk: std_logic :='0';
signal running  : boolean :=true;
-----------------
begin  
  
  DUT: entity work.pwm_register_file(syn)
    
    port map (
      CLK                 => s_clk,
      RESETN              => s_resetn,
      CHIP_SELECT         => s_avalon_chip_select,
      ADDRESS             => s_address,
      WRITEP              => s_writep,
      WRITE_DATA          => s_write_data,
      READP               => s_readp
    );


      
	  s_clk                   <= not(s_clk) after HALF_PERIOD when running else '0';
    s_resetn                <= '0', '1' after 50 ns;
    s_avalon_chip_select   <= '0', '1' after 75 ns; 
    s_address               <= "00", "01" after 100 ns, "10" after 125 ns, "11" after 150 ns;
    s_writep                <= '1', '0' after 175 ns;
    s_write_data            <= x"00000000", x"00000001" after 200 ns, x"00000010" after 225 ns, x"00000011" after 250 ns, x"00000100" after 275 ns;
    s_readp                 <= '1';  
  	
end testbench;
