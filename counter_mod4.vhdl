library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_mod4 is
port( clock: in std_logic;
      clear_n: in std_logic;
	  abilita: in std_logic;
	  conteggio: out std_logic_vector(1 downto 0));
end counter_mod4;

architecture behavioural of counter_mod4 is

component ff_t
port( clock: in std_logic;
	  clear: in std_logic;
	  y: out std_logic := '0');
end component;

signal clock0,clock1,clock2,clock3,clock_r: std_logic;
signal and1,and2,and3: std_logic;

begin
	clock_r<=clock and abilita;
	and1 <= (clock0 and clock_r) and abilita;
	and2 <= (clock1 and clock0 and clock_r) and abilita;
	and3 <= (clock2 and clock1 and clock0 and clock_r) and abilita;
	
	c0: ff_t port map(clock_r,clear_n,clock0);
	c1: ff_t port map(and1,clear_n,clock1);
	

	conteggio<=clock1&clock0;


end behavioural;