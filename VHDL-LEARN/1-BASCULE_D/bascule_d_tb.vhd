-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 02/05/2019 18:28
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bascule_d_tb is
end entity;

architecture bhv of bascule_d_tb is

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

  signal input  : std_logic;
  signal output : std_logic;

begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset_n <= '0','1' after 10 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  dut : entity work.bascule_d(simulation)
        
        port map (
          clk    => clk   ,
          input  => input ,
          output => output
        );

  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
  stim : process
   begin
     report "running testbench for bascule_d(simulation)";
     report "waiting for asynchronous reset";
     wait until reset_n='1';
     wait_cycles(1);
     report "applying stimuli...";
     input <= '0','1' after 100 ns, '0' after 200 ns;
     wait_cycles(1);
     report "end of simulation";
     running <=false;
     wait;
   end process;

end bhv;
