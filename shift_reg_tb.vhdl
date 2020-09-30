library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg_tb is
end shift_reg_tb;


architecture behavioural of shift_reg_tb is


component shift_reg
port ( clock: in std_logic;
	   clear: in std_logic;
	   load: in std_logic;
	   dati: in std_logic_vector(8 downto 0);
	   y: out std_logic_vector(8 downto 0);
	   bit_out: out std_logic);
end component;

signal clk,clear_t,load_t,bit_out_t: std_logic;
signal dati_t,y_t : std_logic_vector(8 downto 0);

constant clk_period: time := 4 ns;

begin

uut: shift_reg port map(clk,clear_t,load_t,dati_t,y_t,bit_out_t);

clk_process: process
begin
	clk<='0';
	wait for clk_period/2;
	clk<='1';
	wait for clk_period/2;
end process;

stim_proc: process
begin
	clear_t<='0';
	load_t<='0';
	wait for 2 ns;
	clear_t<='1';
	wait for 2 ns;
	clear_t<='0';
	wait for 2 ns;
	load_t<='1';
	wait for 7 ns;
	dati_t<="000000100";
	wait for 2 ns;
	load_t<='0';
	
	wait for 300 ns;
	
	
	assert false
	report "fine"
	severity failure;
	
	
end process;




end behavioural;