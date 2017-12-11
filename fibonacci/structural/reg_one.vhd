-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg_one is
	generic (n: integer);
	port (
			clk, rst: in std_logic;
			d: in std_logic_vector(n-1 downto 0);
			q: buffer std_logic_vector(n-1 downto 0)
			);
end reg_one;

architecture Behavioral of reg_one is
begin
	process(clk, rst)
	begin
		if rst = '1' then
			q <= (0 => '1', others => '0');
		elsif rising_edge(clk) then
			q <= d;
		end if;
	end process;

end Behavioral;

