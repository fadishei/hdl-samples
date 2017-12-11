-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
	port (
		d, clk, rst: in std_logic;
		q: out std_logic);
end dff;

architecture behavioral of dff is
begin
	process(rst, clk)
	begin
		if rst = '1' then
			q <= '0';
		elsif rising_edge(clk) then
		--elsif clk'event and clk='1' then
			q <= d;
		end if;
	end process;

end behavioral;

