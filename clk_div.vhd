library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
	port	(	clk: in  std_logic ;
				clkOut	: out std_logic
	);
end clk_div;

architecture uno of clk_div is 
begin 
	process (clk)
		variable cnt : integer range 1 to 500; --freq
	begin
		if rising_edge(clk) then
			if cnt = 500 then
				cnt := 1;
			else
			cnt := cnt + 1;
			end if;
		end if;
		if cnt = 1 then
			clkOut <= '1';
		else
			clkOut <= '0';
		end if;	
	end process;
end uno;