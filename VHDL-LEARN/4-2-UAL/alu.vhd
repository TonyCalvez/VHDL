library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity alu is
  port (
  	clk		: in  std_logic;
	a 		: in signed(3 downto 0);
	b 		: in signed(3 downto 0);
 	sel 	: in std_logic_vector(2 downto 0);
 	result 	: out signed(3 downto 0)
 	);
end entity ;

architecture rising_edge of alu is

begin

	basc_proc : process(clk)
	begin
		case sel is 
			when "000" => 
				result<= a + b; --addition 
			when "001" => 
				result<= a - b; --subtraction 
			when "010" => 
				result<= a - 1; --sub 1 
			when "011" => 
				result<= a + 1; --add 1 
			when "100" => 
				result<= a and b; --AND gate 
			when "101" => 
				result<= a or b; --OR gate 
			when "110" => 
				result<= not a ; --NOT gate 
			when "111" => 
				result<= a xor b; --XOR gate 
			when others =>
				NULL;
		end case;
	
	end process;
	
end rising_edge;