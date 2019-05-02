library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter is
	PORT (
	clk 		: in std_logic;
	input 		: in std_logic;
	output 		: out std_logic_vector(3 downto 0)
	);
end counter;
architecture bhv of counter is
 signal s_output : unsigned(3 downto 0);
 begin
 process (clk)
 	begin
 		if rising_edge(clk) then
	 		if (input = '1') then
	 			if s_output >= "1000" then
	 				s_output <= "0000";
	 			else
	 				s_output <= s_output + 1;
	 			end if;
	 		end if;
 		end if;
 		output <= std_logic_vector(s_output);
 	end process;
 end;