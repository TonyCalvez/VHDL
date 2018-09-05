library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cpt_99 is
port(
clk,reset,bp	: in std_logic;
ten_seg 		:out std_logic_vector(6 downto 0);  -- affichage dizaines
one_seg 		: out std_logic_vector(6 downto 0)  -- affichage unit�es
);
end cpt_99;

architecture archi of cpt_99 is
type etat is (init,one,compte,decompte);
signal state :etat;
signal diz4	:	std_logic_vector(3 downto 0);
signal unit4		:	std_logic_vector(3 downto 0);
--signal clki 	:	std_logic;
signal PRESCALER	: std_logic_vector(25 downto 0);
signal cnt_one_enable : std_logic;		-- ""diviseur de fréquence"
begin
decounter : process (CLK,reset)
	begin
		if rising_edge(CLK) then
			if RESET = '0' then
				PRESCALER <= (others => '0');
			--elsif PRESCALER = "10000000000000000000000000" then
			elsif PRESCALER = "000000000000000000000010" then
				PRESCALER <= (others => '0');--"0000000000000000000000000"
			else
				PRESCALER <= PRESCALER + '1';	
			end if; 
			--if PRESCALER = "10000000000000000000000000" then
			if PRESCALER = "0000000000000000000000010" then
				CNT_ONE_ENABLE <= '1';  --cnt_one_enable = '1' que tous les n coups d'horloge
			else
				CNT_ONE_ENABLE <= '0';
			end if;
		end if;
	end process;
P1:process(clk,reset,bp)
begin
  if reset='0' then 
     unit4 <= "0000";
     diz4 <= "0000";
     state <= init;
  elsif rising_edge(clk) then 
		case state is
		when init =>  
					   state <= one;
		when one => if bp ='1' then unit4 <= "0001";
					diz4 <= "0000";
					state <= compte;
					else unit4 <= "1001";
					     diz4 <= "1001";
					state <= decompte;
					end if;
		when compte => 	if cnt_one_enable='1'then
							if unit4 <= "1001" then unit4 <= "0000";
							diz4 <= (diz4 + '1');
								if diz4 <= "1001" then diz4 <= "0000";
									unit4<="0";
									end if;
							else unit4<=unit4+'1';
							end if;	
						end if;


		when decompte => if cnt_one_enable='1' then
							if unit4 <= "0000" then unit4 <= "1001";
							 diz4 <= (diz4 - '1');
								if diz4 <= "000" then diz4 <= "1001";
									unit4<="1001";
									end if;
							else unit4<=unit4 - '1';
							end if;
						end if;		
		end case;
  end if;
end process;


--count4 <= temp4;
--------- DECODER SEGMENT ONE ------------
	decoder_seg_one : process(unit4)
	begin  
		case unit4 is

			when "0000" => one_seg <= "0000001";
			when "0001" => one_seg <= "1001111";
			when "0010" => one_seg <= "0010010";
			when "0011" => one_seg <= "0000110";
			when "0100" => one_seg <= "1001100";
			when "0101" => one_seg <= "0100100";
			when "0110" => one_seg <= "0100000";
			when "0111" => one_seg <= "0001111";
			when "1000" => one_seg <= "0000000";
			when "1001" => one_seg <= "0000100";

			when others => one_seg <= "0000001";

		end case;
	end process;	
	 decoder_seg_ten : process(diz4)
	begin
		case diz4 is
			when "0000" => ten_SEG <= "0000001";
			when "0001" => ten_SEG <= "1001111";
			when "0010" => ten_SEG <= "0010010";
			when "0011" => ten_SEG <= "0000110";
			when "0100" => ten_SEG <= "1001100";
			when "0101" => ten_SEG <= "0100100";
			when "0110" => ten_SEG <= "0100000";
			when "0111" => ten_SEG <= "0001111";
			when "1000" => ten_SEG <= "0000000";
			when "1001" => ten_SEG <= "0000100";

			when others => ten_SEG <= "0000001";
			--	
			--
		end case;
	end process;		
end archi;  
