library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--mod 2 counter

entity ff_t is
port( clock: in std_logic;
	  clear: in std_logic;
	  y: out std_logic := '0');
end ff_t;

architecture behavioural of ff_t is

signal valore: std_logic;

begin
	proc: process(clock,clear)
	begin
		if clear='0' then
			valore <= '0';
		elsif clock='0' and clock'event then
			valore <= not valore;
		end if;
	end process;
	
	y<=valore;

end behavioural;