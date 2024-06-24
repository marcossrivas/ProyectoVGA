-- RGB DATA PROCESS -- 

library ieee;
use ieee.std_logic_1164.all;

entity RGB_data is 
port(

	RED_color_A : in std_logic_vector(5 downto 0);
	GREEN_color_A : in std_logic_vector(5 downto 0);
	BLUE_color_A : in std_logic_vector(5 downto 0);
	RED_color_B : in std_logic_vector(5 downto 0);
	GREEN_color_B : in std_logic_vector(5 downto 0);
	BLUE_color_B : in std_logic_vector(5 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	
	RED_out : out std_logic_vector(5 downto 0);
	GREEN_out : out std_logic_vector(5 downto 0);
	BLUE_out : out std_logic_vector(5 downto 0)
);
end entity;
architecture Behavior of RGB_data is 
begin

end architecture;
	

	