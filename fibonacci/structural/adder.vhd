-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
	generic(
		n: integer
	);
	port(
		a: in std_logic_vector(n-1 downto 0);
		b: in std_logic_vector(n-1 downto 0);
		ci: in std_logic;
		co: out std_logic;
		s: out std_logic_vector(n-1 downto 0)
	);
end adder;

architecture structural of adder is
	signal c: std_logic_vector(n downto 0);
	
	component full_adder is
	port(
		a, b, ci: in std_logic;
		s, co: out std_logic
	);
	end component;
	
begin
	u: for i in n-1 downto 0 generate
		ui: full_adder port map(a=>a(i), b=>b(i), co=>c(i+1), ci=>c(i), s=>s(i));
	end generate;

	co <= c(n);
	c(0) <= ci;

end structural;

