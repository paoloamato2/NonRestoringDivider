library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub_tb is

end add_sub_tb;


architecture behavioural of add_sub_tb is

component add_sub
port ( a: in std_logic_vector(4 downto 0);
	   b: in std_logic_vector(4 downto 0);
	   sub: in std_logic;
	   y: out std_logic_vector(4 downto 0);
	   c_out: out std_logic);
end component;

signal ingr1,ingr2,uscita: std_logic_vector(4 downto 0);
signal sub_t,c_out_t: std_logic;

begin

uut: add_sub port map(ingr1,ingr2,sub_t,uscita,c_out_t);

stim_proc: process
begin
	sub_t<='0';
	wait for 2 ns;
	ingr1<="00111"; --7
	ingr2<="00011"; --3;
	wait for 2 ns;
	sub_t<='1';
	wait for 4 ns;
	wait;
end process;


end behavioural;