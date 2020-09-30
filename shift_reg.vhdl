library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
port ( clock: in std_logic;
	   clear: in std_logic;
	   load: in std_logic;
	   dati: in std_logic_vector(8 downto 0);
	   y: out std_logic_vector(8 downto 0);
	   bit_out: out std_logic);
end shift_reg;

architecture behavioural of shift_reg is
signal y_int: std_logic_vector(8 downto 0) :="000000000";
begin
y<=y_int;
	proc: process(clock,clear)
	begin
		if clear='1' then
			y_int<="000000000";
		elsif clock'event and clock='1' then
			if load='1' then
				y_int<=dati;
			elsif load='0' then
				
				--  y_int(7 downto 0) <= y_int(8 downto 1); -- per lo shift left
				 -- bit_out<=y_int(8);
				 
				 -- y_int(8) <= '0';
				 
					y_int(8 downto 1) <= y_int(7 downto 0);
					y_int(0) <= '0';
				
			end if;
		end if;
	end process;
end behavioural;