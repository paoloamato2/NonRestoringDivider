library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--flip flop tipo D

entity ff_et_rising is
port ( d: in std_logic;
	   abilitazione: in std_logic;
	   clear: in std_logic;
	   y: out std_logic );
end ff_et_rising;

architecture behavioural of ff_et_rising is

begin
	proc: process(abilitazione)
	begin
		if clear='1' then
			y<='0';
		elsif abilitazione'event and abilitazione='1' then
			y<=d after 0.5 ns;
		end if;
	end process;

end behavioural;