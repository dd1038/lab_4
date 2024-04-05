----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 05:51:51 PM
-- Design Name: 
-- Module Name: pixel_pusher - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pixel_pusher is
    Port ( clk, en, vs,vid :in std_logic;
         pixelsig: in std_logic_vector(7 downto 0);
         hcount:in std_logic_vector(9 downto 0);
         R,B: out std_logic_vector(4 downto 0);
         G: out std_logic_vector(5 downto 0);
         addr: out std_logic_vector(17 downto 0)
        );
end pixel_pusher;

architecture Behavioral of pixel_pusher is
    signal hcounter: std_logic_vector(17 downto 0):= (others => '0');
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if (en = '1') then
                if (vid = '1') then
                    if (unsigned(hcount) < 480) then
                        hcounter<= std_logic_vector(unsigned(hcounter) + 1);
                    elsif (vs = '0') then
                        hcounter <= (others => '0');
                    end if;
                end if;
            end if;
            if (en = '1') then
                if (vid = '1') then
                    if (unsigned(hcount) < 480) then
                        R <= pixelsig(7 downto 5) & "00";
                        G <= pixelsig(4 downto 2) & "000";
                        B <= pixelsig(1 downto 0) & "000";
                    else
                        R <= (others => '0');
                        G <= (others => '0');
                        B <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
        addr <= hcounter;
    end process;





end Behavioral;
