library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff is
  generic ( N : natural := 4);
  port (
  clk,reset  : in std_logic;
  ENTREE     : in  std_logic_vector (N-1 downto 0);
  SORTIE   : out std_logic_vector (N-1 downto 0)
);
end entity;

architecture rtl of dff is
  
begin  -- 
  P1:process(clk,reset
  )
  begin
  if reset='0' then
      SORTIE <= (others => '0');
  elsif rising_edge(clk) then
    SORTIE <= ENTREE;
  end if;
end process;

end rtl;