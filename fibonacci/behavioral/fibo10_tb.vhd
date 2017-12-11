-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY fibo10_tb IS
END fibo10_tb;
 
ARCHITECTURE behavior OF fibo10_tb IS 
 
    COMPONENT fibo
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : out  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fibo PORT MAP (
          clk => clk,
          rst => rst,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rst <= '1';
      wait for 200 ns;	
		rst <= '0';
      wait;
   end process;

END;
