library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity ual is
  port(
    a, b : in  signed(3 downto 0);	
    op   : in  std_logic_vector(2 downto 0);						
    res  : out signed(4 downto 0)	
    );
end entity;

architecture rtl of ual is
  signal a_int, b_int: SIGNED (7 downto 0);
  signal pdt_int: SIGNED (15 downto 0);
begin
  
  ual_proc : process(a, b, op)
  begin
    res <= (others =>'0'); --all bits to '0'
    case op is
      --when "000" =>		--+
      --  res <= (a(3) & a) + (b(3) & b);
      --when "001" =>		---
      --  res <= (a(3) & a) - (b(3) & b);
      --when "010" =>		--*
      --  a_int <= signed(a); -- appel à une fonction de conversion
      --  b_int <= signed(b);
      --  pdt_int <= a_int * b_int; 
      --  res <= signed(pdt_int); 

      --when "011" =>		--and
      --  res <= signed(a) and signed(b);
      -- when "100" =>		--or										
      --  res <= signed(a) or signed(b);
      -- when "101" =>		--xor
      --  res <= signed(a) xor signed(b);
      --when "111" =>		--not
      --  res <= not(a);
      when others =>	--all other operations have no effect
        null;
    end case;
  end process;

end rtl;
