-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fibo is
	generic (n: integer := 10);
	port(
		clk, rst: in std_logic;
		q: buffer std_logic_vector(n-1 downto 0)
	);
end fibo;

architecture structural of fibo is
	component adder is
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
	end component;
	
	component reg_zero is
		generic (n: integer);
		port (
				clk, rst: in std_logic;
				d: in std_logic_vector(n-1 downto 0);
				q: out std_logic_vector(n-1 downto 0)
				);
	end component;
	
	component reg_one is
		generic (n: integer);
		port (
				clk, rst: in std_logic;
				d: in std_logic_vector(n-1 downto 0);
				q: buffer std_logic_vector(n-1 downto 0)
				);
	end component;
	
	signal s, t: std_logic_vector(n-1 downto 0);
begin
	u1: reg_one generic map(n) port map(q=>q, d=>s, clk=>clk,rst=>rst);
	u2: reg_zero generic map(n) port map(q=>t, d=>q, clk=>clk,rst=>rst);
	u3: adder generic map(n) port map(a=>q, b=>t, s=>s, ci=>'0');
end structural;

