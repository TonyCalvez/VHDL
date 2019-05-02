library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	

entity ram is
  port( 
     reset_n : in  std_logic;
     clk     : in  std_logic;
     wr      : in  std_logic;
     address : in  unsigned(7 downto 0);
     datain  : in  std_logic_vector(7 downto 0);
     dataout : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of ram is
  type memory_type is array(0 to 127) of std_logic_vector(7 downto 0);
  signal mem    :   memory_type;
  signal addr_r :   unsigned(7 downto 0);
begin

  ram_proc : process(reset_n,clk)
   begin
    
	if reset_n='0' then
      for i in 0 to 127 loop
        mem(i) <= (others => '0');
      end loop;
      addr_r <= to_unsigned(0,8);
    
	elsif rising_edge(clk) then
      if wr='1' then
        mem(to_integer(unsigned(address))) <= datain;
      end if;
      addr_r <= address;
    end if;
  end process;

  dataout <= mem(to_integer(addr_r));

end rtl;

