-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
	port(
		a, b, ci: in std_logic;
		s, co: out std_logic
	);
end full_adder;

architecture mixed of full_adder is
	component half_adder is
	port(
		a,b: in std_logic;
		s, co: out std_logic);
	end component;

	signal s1, c1, c2: std_logic;
begin
	u1: half_adder port map(a=>a, b=>b, s=>s1, co=>c1);
	u2: half_adder port map(a=>s1, b=>ci, s=>s, co=>c2);
	co <= c1 or c2;
end mixed;



















