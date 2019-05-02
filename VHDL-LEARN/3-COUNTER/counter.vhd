library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter is
  port (
  	reset_n   : in  std_logic;
	clk		  : in  std_logic;
	enable	  : in 	std_logic;
	up 		  : out unsigned(3 downto 0)

  ) ;
end entity ;

architecture simulation_counter of counter is
begin
	counter_proc : process(clk)
	begin		 		  			
	 up <= 0000;	 
     for up in 0 to 1000 loop
     	up <= unsigned(up) + 1;
       	wait until rising_edge(enable);
     end loop;
	end process;
end simulation_counter ; -- arch