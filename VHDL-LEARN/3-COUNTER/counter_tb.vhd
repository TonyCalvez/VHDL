-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 29/04/2019 18:56
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;

architecture bhv of counter_tb is

  constant HALF_PERIOD : time := 5 ns;

  signal clk     : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal sreset  : std_logic := '0';
  signal running : boolean   := true;
  signal output  : std_logic_vector(9 downto 0);

  procedure wait_cycles(n : natural) is
   begin
     for i in 1 to n loop
       wait until rising_edge(clk);
     end loop;
   end procedure;     

begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset_n <= '0','1' after 10 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  dut : entity work.counter(bhv)
        
        port map (
          reset_n => reset_n,
          clk     => clk    ,
          output      => output     
        );

  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
  stim : process
   begin
    reset_n <= '0';--inactif
    
    for i in 0 to 100 loop
      wait until rising_edge(clk);
    end loop;

    reset_n <= '1';--actif
    report "now active!";
    
    for i in 0 to 1010 loop
      wait until rising_edge(clk);
    end loop;
    running <= false;
    wait;
   end process;

end bhv;
