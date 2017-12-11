-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr5 is
	port (
		clk, rst: in std_logic;
		q: out std_logic
	);
end lfsr5;

architecture behavioral of lfsr5 is
	signal s: std_logic_vector(4 downto 0);
begin
	process(clk, rst)
	begin
		if rst ='1' then 
			s <= "00000";
		elsif rising_edge(clk) then
			s(0) <= s(1);
			s(1) <= s(2);
			s(2) <= s(3);
			s(3) <= s(4);
			s(4) <= s(0) xnor s(2);
		end if;
	end process;
	
	q <= s(0);
	
end behavioral;

