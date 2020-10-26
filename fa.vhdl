library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port ( a: in std_logic;
	   b: in std_logic;
	   c_in: in std_logic;
	   s: out std_logic;
	   c_out: out std_logic );
end full_adder;
	   
architecture structural of full_adder is

component half_adder
port ( a: in std_logic;
	   b: in std_logic;
	   s: out std_logic;
	   c_out: out std_logic );
end component;

signal out_s: std_logic;
signal out_c: std_logic;
signal temp: std_logic;
begin
	ha1: half_adder
	port map(a,b,out_s,out_c);
	
	ha2: half_adder
	port map(out_s,c_in,s,temp);

	c_out <= temp or out_c;
end structural;