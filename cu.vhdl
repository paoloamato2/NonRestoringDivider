library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cu_divisore is
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
end cu_divisore;

architecture behavioural of cu_divisore is

TYPE stato is (inattivo,carica_operandi,scorri,sottrai,aggiungi,correggi);
signal stato_corrente: stato := inattivo;
signal stato_prossimo: stato := inattivo;
signal val_count: std_logic_vector(1 downto 0);
signal abilita_cont,cnt_0,cnt_or_sign,clear_n: std_logic;

component counter_mod4
port( clock: in std_logic;
      clear_n: in std_logic;
	  abilita: in std_logic;
	  conteggio: out std_logic_vector(1 downto 0));
end component;


begin
	clear_n <= not clear;
	cnt_or_sign <= '1' when (( to_integer ( unsigned ( val_count )) > 0) or s = '1') else '0';
	cnt_0 <= '1' when ( to_integer ( unsigned ( val_count )) = 0) else '0' ;
	c4: counter_mod4 port map(clock,clear_n,abilita_cont,val_count);
	
	proc: process(clock)
	begin
		if clock'event and clock='0' then
			stato_corrente<=stato_prossimo;
		end if;
	end process;
	
	proc2: process(stato_corrente,abilita,s)
	begin
		if stato_corrente=inattivo then
			if abilita='1' then
				stato_prossimo<=carica_operandi;
			else
				stato_prossimo<=inattivo;
			end if;
			abilita_SAQ<='0';
			sel_SAQ<='0';
			abilita_M<='0';
			abilita_cont<='0';
			load<='0';
			set_q<='0';
			sub<='0';
		elsif stato_corrente=carica_operandi then
			stato_prossimo<=scorri;
			abilita_SAQ<='1';
			abilita_M<='1';
			sel_SAQ<='0';
			abilita_cont<='0';
			set_q<='0';
			load<='1';
			sub<='0';
		elsif stato_corrente=scorri then
			if s='1' then
				stato_prossimo<=aggiungi;
			else
				stato_prossimo<=sottrai;
			end if;
			abilita_SAQ<='1';
			sel_SAQ<='0';
			abilita_cont<='0';
			abilita_M<='0';
			set_q<='0';
			load<='0';
			sub<='0';
		elsif stato_corrente=sottrai then
			if cnt_0='0' then
				stato_prossimo<=scorri;
			elsif cnt_0='1' and s='1' then
				stato_prossimo<=correggi;
			else
				stato_prossimo<=inattivo;
			end if;
			abilita_SAQ<='1';
			abilita_M<='0';
			abilita_cont<='1';
			sel_SAQ<='1';
			set_q<='1';
			load<='1';
			sub<='1';
		elsif stato_corrente=aggiungi then
			if cnt_0='0' then
				stato_prossimo<=scorri;
			elsif cnt_0='1' and s='1' then 
				stato_prossimo<=correggi;
			else
				stato_prossimo<=inattivo;
			end if;
			abilita_SAQ<='1';
			abilita_M<='0';
			abilita_cont<='1';
			sel_SAQ<='1';
			set_q<='1';
			load<='1';
			sub<='0';
		elsif stato_corrente=correggi then
			stato_prossimo<=inattivo;
			abilita_SAQ<='1';
			abilita_M<='0';
			abilita_cont<='0';
			sel_SAQ<='1';
			set_q<='0';
			load<='1';
			sub<='0';
			
		end if;
			
	end process;

end behavioural;