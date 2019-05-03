library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    reset_n : in  std_logic;
    clk     : in  std_logic;
    output      : out std_logic_vector(9 downto 0)); 
end counter;


architecture bhv of counter is
  signal value : unsigned(9 downto 0);
begin

  process(clk)
  begin
    if reset_n = '0' then
      value <= (others => '0');
    elsif rising_edge(clk) then
      value <= value + 1;
      if value = 1000 then
        value <= (others => '0');
      end if;
      
    end if;
  end process;

  output <= std_logic_vector(value);
  
end bhv;