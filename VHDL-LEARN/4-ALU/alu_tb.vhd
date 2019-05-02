-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 02/05/2019 15:46
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end entity;

architecture bhv of alu_tb is

  constant HALF_PERIOD : time := 5 ns;

  signal clk     : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal sreset  : std_logic := '0';
  signal running : boolean   := true;

  procedure wait_cycles(n : natural) is
   begin
     for i in 1 to n loop
       wait until rising_edge(clk);
     end loop;
   end procedure;

  signal a      : signed(3 downto 0);
  signal b      : signed(3 downto 0);
  signal sel    : std_logic_vector(2 downto 0);
  signal result : signed(3 downto 0);

begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset_n <= '0','1' after 666 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  dut : entity work.alu(rising_edge)
        
        port map (
          clk    => clk   ,
          a      => a     ,
          b      => b     ,
          sel    => sel   ,
          result => result
        );

  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
  stim : process
   begin
     report "running testbench for alu(rising_edge)";
     report "waiting for asynchronous reset";
     wait until reset_n='1';
     wait_cycles(100);
     report "applying stimuli...";
      a <= "0001";
      b <= "1111";
      sel <= "000";
      wait for 100 ns;
      sel <= "001";
      wait for 100 ns;
      sel <= "010";
      wait for 100 ns;
      sel <= "011";
      wait for 100 ns;
      sel <= "100";
      wait for 100 ns;
      sel <= "101";
      wait for 100 ns;
      sel <= "110";
      wait for 100 ns;
      sel <= "111";
     wait_cycles(100);
     report "end of simulation";
     running <=false;
     wait;
   end process;

end bhv;
