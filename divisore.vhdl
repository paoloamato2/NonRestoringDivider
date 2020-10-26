library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisore is
port( dividendo: in std_logic_vector(3 downto 0);
	  divisore: in std_logic_vector(3 downto 0);
	  clock: in std_logic;
	  abilita: in std_logic;
	  clear: in std_logic;
	  quoziente: out std_logic_vector(3 downto 0);
	  resto: out std_logic_vector(3 downto 0);
	  errore: out std_logic);
end divisore;


architecture structural of divisore is

component cu_divisore
port( clock: in std_logic;
	  clear: in std_logic;
	  abilita: in std_logic;
	  s: in std_logic;
	  abilita_SAQ: out std_logic;
	  abilita_M: out std_logic;
	  load: out std_logic;
	  sub: out std_logic;
	  set_q: out std_logic;
	  sel_SAQ: out std_logic);
end component;


component registro
port ( clock: in std_logic;
	   clear: in std_logic;
	   dati: in std_logic_vector(3 downto 0);
	   y: out std_logic_vector(3 downto 0));
end component;

component shift_reg
port ( clock: in std_logic;
	   clear: in std_logic;
	   load: in std_logic;
	   dati: in std_logic_vector(8 downto 0);
	   y: out std_logic_vector(8 downto 0);
	   bit_out: out std_logic);
end component;


component add_sub
port ( a: in std_logic_vector(4 downto 0);
	   b: in std_logic_vector(4 downto 0);
	   sub: in std_logic;
	   y: out std_logic_vector(4 downto 0);
	   c_out: out std_logic);
end component;

component ff_et_rising
port ( d: in std_logic;
	   abilitazione: in std_logic;
	   clear: in std_logic;
	   y: out std_logic );
end component;

signal risultato: std_logic_vector(4 downto 0);
signal M_1: std_logic_vector(4 downto 0);
signal a: std_logic_vector(4 downto 0);
signal Q: std_logic_vector(3 downto 0);
signal carica_saq,saq: std_logic_vector(8 downto 0);
signal M: std_logic_vector(3 downto 0);
signal abilita_SAQ,abilita_M: std_logic;
signal load: std_logic;
signal sub: std_logic;
signal s: std_logic;
signal sel_SAQ: std_logic;
signal set_q: std_logic;
signal clock_M,clock_and_load,clock_SAQ: std_logic;

begin
errore<='1' when M="0000" else '0';
clock_M <= clock and abilita_M;
clock_SAQ <= clock and abilita_SAQ;
clock_and_load <= clock and load;
M_1<= '0'&M;

carica_saq <= risultato (4 downto 0) & Q (3 downto 1) & ( not ( risultato (4)) and set_q ) when sel_SAQ='1' else
			"00000"&dividendo when sel_SAQ='0' else
			"XXXXXXXXX";
a<=saq(8 downto 4);
Q<=saq(3 downto 0);
quoziente<=Q;
resto<=a(3 downto 0);

cu: cu_divisore port map(clock,clear,abilita,s,abilita_SAQ,abilita_M,load,sub,set_q,sel_SAQ);
add: add_sub port map(a,M_1,sub,risultato,open);
reg1: registro port map(clock_M,clear,divisore,M);
ff: ff_et_rising port map(risultato(4),clock_and_load,clear,s);
reg2: shift_reg port map(clock_SAQ,clear,load,carica_saq,SAQ,open);
end structural;