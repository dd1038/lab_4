----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 08:34:36 PM
-- Design Name: 
-- Module Name: vga_ctrl_tb - Behavioral
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

entity vga_ctrl_tb is
end vga_ctrl_tb;

architecture Behavioral of vga_ctrl_tb is

component vga_ctrl is

port (

clk, en: in std_logic;
hs, vs, vid: out std_logic


);

end component;

signal clk, en :std_logic;
signal hs, vs, vid: std_logic;

begin

dut: vga_ctrl

port map (

clk => clk,
en => en,
hs => hs,
vs => vs,
vid => vid

);

process
begin

wait for 4 ns;
clk <= '1';
wait for 4 ns;
clk <= '0';


end process;


process
begin

en <= '1';
wait;

end process;


end Behavioral;
      