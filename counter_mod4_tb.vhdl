library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_mod4_tb is

end counter_mod4_tb;


architecture behavioural of counter_mod4_tb is

component counter_mod4
port( clock: in std_logic;
      clear_n: in std_logic;
	  abilita: in std_logic;
	  conteggio: out std_logic_vector(1 downto 0));
end component;

constant clk_period: time := 4 ns;
signal clk,clear_t,abilita_t: std_logic;
signal count: std_logic_vector(1 downto 0);

begin 

uut: counter_mod4 port map(clk,clear_t,abilita_t,count);

clk_process: process
begin
	clk<='1';
	wait for clk_period/2;
	clk<='0';
	wait for clk_period/2;
end process;

stim_proc: process
begin
	clear_t<='0';
	abilita_t<='0';
	wait for 7 ns;
	clear_t<='1';
	wait for 3 ns;
	abilita_t<='1';
	wait for 30 ns;
	abilita_t<='0';
	wait for 300 ns;
	assert false
	report "fine"
	severity failure;
end process;

end behavioural;
