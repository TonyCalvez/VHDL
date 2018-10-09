-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity pwm_task_logic_testbench is
end pwm_task_logic_testbench;

-------------------------------------------------------------------------------
architecture testbench of pwm_task_logic_testbench is
---------------- pwm_register_file
signal s_resetn             : std_logic;
signal s_avalon_chip_select : std_logic;
signal s_address            : std_logic_vector (1 downto 0);
signal s_writep             : std_logic;
signal s_write_data         : std_logic_vector (31 downto 0);
signal s_readp              : std_logic;

----------------- pwm_task_logic
signal s_pwm_enable         : std_logic;
signal s_clock_divide       : std_logic_vector (31 downto 0);
signal s_duty_cycle         : std_logic_vector (31 downto 0);
signal s_pwm_out            : std_logic;


-----------------
constant HALF_PERIOD        : time := 1 ns;
signal s_clk                : std_logic :='0';
signal running              : boolean :=true;
-----------------
begin  
  
  DUT1: entity work.pwm_register_file(syn)
    
    port map (
      CLK                 => s_clk,
      RESETN              => s_resetn,
      PWM_ENABLE          => s_pwm_enable,
      CHIP_SELECT         => s_avalon_chip_select,
      ADDRESS             => s_address,
      WRITEP              => s_writep,
      WRITE_DATA          => s_write_data,
      READP               => s_readp
    );

  DUT2: entity work.pwm_task_logic(syn)
    
    port map (
      CLK                 => s_clk,
      RESETN              => s_resetn,
      PWM_ENABLE          => s_pwm_enable,
      CLOCK_DIVIDE        => s_clock_divide,
      DUTY_CYCLE          => s_duty_cycle,
      PWM_OUT             => s_pwm_out
    );
      
	  s_clk                   <= not(s_clk) after HALF_PERIOD when running else '0';
    s_resetn                <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
    s_pwm_enable            <= '0', '1' after 20 ns, '0' after 90 ns;
    s_clock_divide          <= x"00000000", x"00000001" after 30 ns, x"00000010" after 40 ns, x"00000011" after 50 ns, x"00000000" after 90 ns;
    s_duty_cycle            <= x"00000000";

    s_avalon_chip_select    <= '0', '1' after 110 ns;
    s_writep                <= '0', '1' after 120 ns;
    s_address               <= "00";

    s_write_data            <= x"00000000", x"00000001" after 130 ns, x"00000011" after 140 ns, x"00000100" after 150 ns;

    s_readp                 <= '1';  
-----------------    
    


  	
end testbench;
