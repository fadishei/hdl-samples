-- Copyright (C) 2017-2018 Hamid Fadishei, University of Bojnord, fadishei AT yahoo . com
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY lfsr5_tb IS
END lfsr5_tb;
 
ARCHITECTURE behavior OF lfsr5_tb IS 
 
    COMPONENT lfsr5
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal q : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lfsr5 PORT MAP (
          clk => clk,
          rst => rst,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
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
