library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity bascule_d is
  port (
	clk		: in  std_logic;
	input	: in  std_logic;
	output  : out std_logic
  ) ;
end entity ;

architecture rising_edge of bascule_d is

begin

	basc_proc : process(clk)
	begin
		
		if rising_edge(clk) then
			output <=input;
		end if;
	
	end process;
	
end rising_edge;