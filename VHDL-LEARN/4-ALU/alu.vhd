library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity alu is
  port (
  	clk		: in  std_logic;
	a 		: in signed(3 downto 0);
	b 		: in signed(3 downto 0);
 	sel 	: in std_logic_vector(2 downto 0);
 	result 	: out signed(7 downto 0)
 	);
end entity ;

architecture rising_edge of alu is
signal y1_int, y2_int : signed(3 downto 0);


begin

	basc_proc : process(clk)
	begin
		case sel is 
			when "000" => 
				result<= a + b; --addition 
			when "001" => 
				result<= a - b; --subtraction 
			when "010" =>
				y1_int <= a;
				y2_int <= b;
				result <= signed(y1_int) * signed(y2_int);
			when "011" => 
				result<= a and b; --AND gate 
			when "100" => 
				result<= a or b; --OR gate
			when "101" => 
				result<= a xor b; --XOR gate 
			when "110" => 
				result<= not a ; --NOT gate 
			when others =>
				NULL;
		end case;
	
	end process;
	
end rising_edge;