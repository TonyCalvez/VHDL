-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity pwm_task_logic_testbench is
end pwm_task_logic_testbench;

-------------------------------------------------------------------------------
architecture testbench of pwm_task_logic_testbench is

signal s_pwm_enable   : std_logic;
signal s_resetn       : std_logic;
signal s_clock_divide : std_logic_vector (31 downto 0);
signal s_duty_cycle   : std_logic_vector (31 downto 0);
signal s_pwm_out      : std_logic;
-----------------
constant HALF_PERIOD : time := 20 ns;
signal s_clk: std_logic :='0';
signal running  : boolean :=true;
-----------------
begin  
  
  DUT: entity work.pwm_task_logic(syn)
    
    port map (
      validwirte = 1,
      duty
      writedutycycle => 1,
	    CLK          => s_clk,
	    pwm_enable   => s_pwm_enable,
	    resetn       => s_resetn,
	    clock_divide => s_clock_divide,
      duty_cycle   => s_duty_cycle,
	    pwm_out      => s_pwm_out
    );

      
	  s_clk          	<= not(s_clk) after HALF_PERIOD when running else '0';
    s_resetn       <= '0', '1' after 50 ns; 
  	s_pwm_enable   	<= '0', '1' after 75 ns; 
  	
  	s_clock_divide    <= x"00000000" after 150 ns, x"00000001" after 200 ns, x"00000002" after 250 ns, x"00000003" after 300 ns;
  	s_duty_cycle      <= x"00000000" after 075 ns, x"00000001" after 150 ns, x"00000002" after 250 ns, x"00000003" after 300 ns;
  
test: process
variable i : integer range 0 to 15;
begin
  wait until rising_edge(s_clk);
   s_pwm_enable  <= '0';
  for i in 0 to 10 loop
    wait until rising_edge(s_clk);
    s_pwm_enable  <= '1';
  end loop;
  i:=0;
  for i in 0 to 10 loop
    wait until rising_edge(s_clk);
  end loop;
  running <= false;
  wait;
end process;
end testbench;