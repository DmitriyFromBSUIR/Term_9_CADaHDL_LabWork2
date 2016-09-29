----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2016 21:21:09
-- Design Name: 
-- Module Name: JK_trigger - jk_trigger_Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JK_trigger is
    Port (
            CLK, RST, J, K : in std_logic;
	        Q, nQ : out std_logic
	        );
end JK_trigger;

architecture jk_trigger_Behavioral of JK_trigger is

        signal FF:std_logic;		-- Flip Flop main data
		signal CHG:std_logic;		-- Change symbol
begin
		process(CLK,RST,CHG)
		begin
			if (RST = '1') THEN
				FF <= '0';
			elsif (CLK'event and CLK = '1') THEN
				CHG <= '1' after 1 ns;
			end if;
			if (CHG = '1') then
				if J = '0' and K = '1' then
					FF <= '0';
				elsif J = '1' and K = '0' then
					FF <= '1';
				elsif J = '1' and K = '1' then
					FF <= not FF;
				elsif J = '0' and K = '0' then
					FF <= FF;
				end if;
				CHG <= '0' after 1 ns;
			end if;     
		end process;
		Q <= FF after 1 ns;
		nQ <= not FF ;--after 1 ns;

end jk_trigger_Behavioral;
