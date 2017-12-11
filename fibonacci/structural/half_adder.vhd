-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
	port(
		a,b: in std_logic;
		s, co: out std_logic);
end half_adder;

architecture structural of half_adder is

begin
	s <= a xor b;
	co <= a and b;
end structural;

