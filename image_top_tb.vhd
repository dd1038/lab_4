----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 10:03:44 PM
-- Design Name: 
-- Module Name: image_top_tb - Behavioral
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

entity image_top_tb is
--  Port ( );
end image_top_tb;

architecture Behavioral of image_top_tb is
    component image_top is
      Port ( clk:in STD_LOGIC;
             hs, vs: out STD_LOGIC;
             R,B: out STD_LOGIC_VECTOR(4 downto 0);
             G: out STD_LOGIC_VECTOR(5 downto 0));
    end component;

    signal tb_clk,tb_hs,tb_vs,tb_vid: std_logic:='0';
    signal tb_r,tb_b: std_logic_vector(4 downto 0):=(others=>'0');
    signal tb_g: std_logic_vector(5 downto 0):=(others=>'0');
begin

    clk_gen_proc: process
    begin

        wait for 4 ns;
        tb_clk <= '1';

        wait for 4 ns;
        tb_clk <= '0';

    end process clk_gen_proc;


    dut:image_top
        Port map( clk=>tb_clk,
             hs=>tb_hs,
              vs=>tb_vs,
             R=>tb_r,
             B=>tb_b,
             G=>tb_g);
end Behavioral;