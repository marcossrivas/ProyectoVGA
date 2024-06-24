library ieee;
use ieee.std_logic_1164.all;

entity mainVGA is
port(
---	 TEST SIGNALS  ---------
--CE_011 : out std_logic;
--CE_022 : out std_logic;
--counter : out integer;
-------------------------------

--- INPUT SIGNALS -------------------
	--RED_in : in std_logic_vector(5 downto 0);
	--GREEN_in : in std_logic_vector(5 downto 0);
	--BLUE_in : in std_logic_vector(5 downto 0);
	reset : in std_logic;
	clk : in std_logic;
-------------------------------------

--- OUTPUT SIGNALS ---------------------------
	
	--RED_out : out std_logic_vector(9 downto 0);
	--GREEN_out : out std_logic_vector(9 downto 0);
	--BLUE_out : out std_logic_vector(9 downto 0);
	VGA_HS : out std_logic;
	VGA_VS : out std_logic;
	VGA_BLANK_HS : out std_logic;
	VGA_BLANK_VS : out std_logic;
	VGA_SYNC : out std_logic;
	VGA_CLK : out std_logic
	
);

end entity;

architecture Behave of mainVGA is
---- COMPONENTS DECLARATION --------
component clk_div is 
	port	(	clk: in  std_logic ;
				clkOut	: out std_logic
	);
end component clk_div;
-------------------------------------
component SYNC_signal is 
generic(
	a : integer;
	b : integer;
	c : integer;
	d : integer
	);
port(
	--counter : out integer;
	clk : in std_logic;
	reset : in std_logic;
	enable_out_1 : out std_logic;
	enable_out_2 : out std_logic;
	enable_in : in std_logic;
	VGA_sync : out std_logic;
	VGA_blank : out std_logic
	);
end component SYNC_signal;
----------------------------------------

---- STATE MACHINE SIGNALS -----------
------------------------------------
---- ALGORITHM SIGNALS ---------------

--------------------------------------
---- COMPONENTS SIGNALS -----

signal clkDiv : std_logic;
signal CE_01 : std_logic;
signal CE_02 : std_logic;
signal VGA_HS_signal : std_logic;
signal VGA_VS_signal : std_logic;
signal VGA_BLANK_HS_signal : std_logic;
signal VGA_BLANK_VS_signal : std_logic;

-----------------------------
begin

clockdiv : clk_div port map(clk=>clk, clkOut=>clkDiv);

VGAHS : SYNC_signal generic map(a=>96,b=>48,c=>640,d=>16)
							port map(clk=>clkDiv,reset=>reset, enable_in => '1', enable_out_1=> CE_01, VGA_sync => VGA_HS_signal, VGA_blank => VGA_BLANK_HS_signal );
VGAVS : SYNC_signal generic map(a=>2,b=>33,c=>480,d=>10)
							port map(clk=>clkDiv,reset=>reset, enable_in => CE_01,enable_out_2=> CE_02, VGA_sync => VGA_VS_signal, VGA_blank => VGA_BLANK_VS_signal);
							
--RED_out <= "0000000000";
--GREEN_out <= "0000000000";
--BLUE_out <= "0000000000";

--CE_011 <= CE_01;
----CE_022 <= CE_02;

VGA_SYNC <= '1';
VGA_CLK <= clkDiv;

process(CE_02)
begin

if CE_02 = '1' then
	VGA_HS <= VGA_HS_signal;
	VGA_VS <= VGA_VS_signal; 
	VGA_BLANK_HS <= VGA_BLANK_HS_signal; 
	VGA_BLANK_VS <= VGA_BLANK_VS_signal;
else
	VGA_HS <= '0';
	VGA_VS <= '0';
	VGA_BLANK_HS <= '0';
	VGA_BLANK_VS <= '0';
	end if;
end process;

end architecture;

	
	
	