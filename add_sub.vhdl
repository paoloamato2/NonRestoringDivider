library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub is
port ( a: in std_logic_vector(4 downto 0);
	   b: in std_logic_vector(4 downto 0);
	   sub: in std_logic;
	   y: out std_logic_vector(4 downto 0);
	   c_out: out std_logic);
end add_sub;

architecture structural of add_sub is

component full_adder
port ( a: in std_logic;
	   b: in std_logic;
	   c_in: in std_logic;
	   s: out std_logic;
	   c_out: out std_logic );
end component;

signal c: std_logic_vector(5 downto 0);
signal b_comp: std_logic_vector(4 downto 0);

begin

c(0) <= sub;

b_comp(0) <= b(0) xor sub;
b_comp(1) <= b(1) xor sub;
b_comp(2) <= b(2) xor sub;
b_comp(3) <= b(3) xor sub;
b_comp(4) <= b(4) xor sub;

fa1: full_adder port map(a(0),b_comp(0),sub,y(0),c(1));
fa2: full_adder port map(a(1),b_comp(1),c(1),y(1),c(2));
fa3: full_adder port map(a(2),b_comp(2),c(2),y(2),c(3));
fa4: full_adder port map(a(3),b_comp(3),c(3),y(3),c(4));
fa5: full_adder port map(a(4),b_comp(4),c(4),y(4),c(5));


c_out<=c(5);

end structural;