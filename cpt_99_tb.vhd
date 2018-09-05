-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity cpt_99_tb is
end cpt_99_tb;

-------------------------------------------------------------------------------

architecture bhe of cpt_99_tb is


signal s_reset   : std_logic ; 
signal s_bp  : std_logic ; 
signal s_ten_seg   : std_logic_vector(6 downto 0) ; 
signal s_one_seg   : std_logic_vector(6 downto 0) ; 
-----------------
constant HALF_PERIOD : time := 20 ns;
signal s_clk: std_logic :='0';
signal running  : boolean :=true;
-----------------
begin  
  
  DUT: entity work.cpt_99(archi)
    
    port map (
      clk     => s_clk,
      reset   => s_reset,
      bp      =>    s_bp,
      ten_seg => s_ten_seg  ,   
      one_seg => s_one_seg
      );

    
    s_clk          <= not(s_clk) after HALF_PERIOD when running else '0'; 
 

test: process
variable i : integer range 0 to 15;
begin
  wait until rising_edge(s_clk);
   --s_ena  <= '0';
  for i in 0 to 10 loop
    wait until rising_edge(s_clk);
    s_bp  <= '1';
  end loop;
  i:=0;
  for i in 0 to 50 loop
    wait until rising_edge(s_clk);
  end loop;
  running <= false;
  wait;
end process;
end bhe;