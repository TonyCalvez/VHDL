library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity bascule_d_gen is
	generic (nb_bit : natural := 8);
  port (
  	reset_n : in  std_logic;	
	clk		: in  std_logic;
	input	: in  std_logic_vector(nb_bit-1 downto 0);
	output  : out std_logic_vector(nb_bit-1 downto 0)
  );
end entity ; -- bascule_d_gen

architecture using_rising_edge of bascule_d_gen is
	signal data : std_logic_vector(nb_bit-1 downto 0);
begin

	basc_gen_proc : process(reset_n, clk) --need to use processes to describe registers
	begin		 		 				  --only async reset and clock are necessary
		
		if reset_n = '0' then			--active low
			data <= (others => '0');  --all bits to '0'
		elsif rising_edge(clk) then		--or : clk ' event and clk = '1'
			data <= input;
		end if;
	end process;
	
	output <= data;
	
end using_rising_edge ; -- arch