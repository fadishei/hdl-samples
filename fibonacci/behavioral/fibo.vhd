-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fibo is
	generic (n: integer := 10);
	port(
		clk, rst: in std_logic;
		q: out std_logic_vector(n-1 downto 0)
	);
end fibo;

architecture behav of fibo is
		signal r0, r1: std_logic_vector(n-1 downto 0);
begin
	process(rst, clk)
	begin
		if rst = '1' then
			r0 <= (others => '0');
			r1 <= (0=>'1', others=>'0');
		elsif rising_edge(clk) then
			r0 <= r1;
			r1 <= std_logic_vector(unsigned(r0) + unsigned(r1));
		end if;
	end process;
	q <= r1;
end behav;

