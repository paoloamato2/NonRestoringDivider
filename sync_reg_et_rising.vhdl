library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity registro is
port ( clock: in std_logic;
	   clear: in std_logic;
	   dati: in std_logic_vector(3 downto 0);
	   y: out std_logic_vector(3 downto 0));
end registro;

architecture behavioural of registro is
begin
	proc: process(clock)
	begin
		if clear='1' then
			y<="0000";
		elsif clock'event and clock='1' then
			y<=dati;
		end if;
	end process;
end behavioural;