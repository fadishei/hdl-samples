-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr5 is
	port (
		clk, rst: in std_logic;
		q: out std_logic
	);
end lfsr5;

architecture structural of lfsr5 is
	component dff is
		port (
			d, clk, rst: in std_logic;
			q: out std_logic);
	end component;
	signal s: std_logic_vector(5 downto 0);
begin
	u1: for i in 4 downto 0 generate
		u2: dff port map(d=>s(i+1), q=>s(i), clk=>clk, rst=>rst);
	end generate;

	s(5) <= s(0) xnor s(2);
	q <= s(0);
end structural;

