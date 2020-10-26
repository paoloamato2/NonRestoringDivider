library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisore_tb is

end divisore_tb;



architecture behavioural of divisore_tb is
component divisore
port( dividendo: in std_logic_vector(3 downto 0);
	  divisore: in std_logic_vector(3 downto 0);
	  clock: in std_logic;
	  abilita: in std_logic;
	  clear: in std_logic;
	  quoziente: out std_logic_vector(3 downto 0);
	  resto: out std_logic_vector(3 downto 0);
	  errore: out std_logic);
end component;

constant clk_period: time := 4 ns;
signal dividendo_t,divisore_t: std_logic_vector(3 downto 0);
signal clk,abilita_t,clear_t,errore_t: std_logic;
signal quoziente_t,resto_t: std_logic_vector(3 downto 0);

begin

uut: divisore port map(dividendo_t,divisore_t,clk,abilita_t,clear_t,quoziente_t,resto_t,errore_t);

clk_process: process
begin
	clk<='1';
	wait for clk_period/2;
	clk<='0';
	wait for clk_period/2;
end process;

stim_proc: process
begin

	wait for 2 ns;
	clear_t<='1';
	wait for 2 ns;
	clear_t<='0';
	dividendo_t<="0111"; --15
	divisore_t<="0011"; --14
	wait for 4 ns;
	abilita_t<='1';
	wait for 24 ns;
	abilita_t<='0';
	
	
	
	wait for 150 ns;
	
	assert quoziente_t="0010"
	report "errore nel quoziente"
	severity failure;
	
	assert resto_t="0001"
	report "errore nel resto"
	severity failure;
	
	assert false
	report "fine"
	severity failure;
	

end process;



end behavioural;