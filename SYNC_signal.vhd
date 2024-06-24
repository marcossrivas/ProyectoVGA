library ieee;
use ieee.std_logic_1164.all;

entity SYNC_signal is
generic(
	a : integer := 2;
	b : integer := 3;
	c : integer := 4;
	d : integer := 5
	);
port(
	---- TEST -----
	--counter : out integer;
	--counter_end : out std_logic;
	
	---------------
	clk : in std_logic;
	reset : in std_logic;
	enable_in : in std_logic;
	enable_out_1 : out std_logic;
	enable_out_2 : out std_logic;
	VGA_sync : out std_logic;
	VGA_blank : out std_logic
	
	);
	
end entity;


architecture Behave of SYNC_signal is 

---- STATE MACHINE SIGNALS -----------
type STATE_MACHINE is (reset_state, A_state, B_state, C_state, D_state);
signal state : STATE_MACHINE;
signal nextState : STATE_MACHINE;
------------------------------------

---- ALGORITHM SIGNALS ---------------


--------------------------------------

---- CONTROL [COUNTER] 	SIGNALS------

signal CNT_ENABLE : std_logic;
signal CNT_END: std_logic;

------------------------------------------

begin

	-- Reset and Sync

	process(clk, reset)
	
	begin

		if reset = '0' then

			state <= reset_state;

		elsif rising_edge(clk) and enable_in = '1' then
			
				state <= nextState;
			 
		end if;
	end process;

	-- 	Logic

	process(state, nextState, CNT_END)
	begin

		case state is
			when reset_state => 
			
				CNT_ENABLE <= '0';
					
				nextState <= A_state;
				
				VGA_sync <= '0';
				VGA_blank <= '0';
				
			when A_state => 
			
				CNT_ENABLE <= '1';
				
				if CNT_END = '1' then
					
					nextState <= B_state;
				
				else
				
					nextState <= A_STATE;
	
				end if;
				
				VGA_sync <= '0';
				VGA_blank <= '0';
	
			when B_state =>
			
				CNT_ENABLE <= '1';
				
				if CNT_END = '1' then
					
					nextState <= C_state;
				
				else
				
					nextState <= B_STATE;
	
				end if;
				
				VGA_sync <= '1';
				VGA_blank <= '0';

			when C_state => 
			
				CNT_ENABLE <= '1';
				
				if CNT_END = '1' then
					
					nextState <= D_state;
				
				else
				
					nextState <= C_STATE;
	
				end if;
				
				VGA_sync <= '1';
				VGA_blank <= '1';
		
			when D_state =>
			
				CNT_ENABLE <= '1';
				
				if CNT_END = '1' then
					
					nextState <= A_state;
				
				else
				
					nextState <= D_STATE;
	
				end if;
				
				VGA_sync <= '1';
				VGA_blank <= '0';
		
		end case;

	end process;
	
	------------------------------
		-- Counter
	
	process(clk, reset, CNT_ENABLE, enable_in)
	variable cnt : integer;
	begin
	if reset = '0' or CNT_ENABLE = '0' then
		cnt := 0;
		CNT_END <= '0';	
		--counter <= cnt;
		--counter_end <= CNT_END;
		enable_out_1 <= '0';
		enable_out_2 <= '0';
	elsif rising_edge(clk) and CNT_ENABLE = '1' and enable_in = '1' then
		cnt := cnt + 1;
		--counter <= cnt;
		enable_out_1 <= '0';
		enable_out_2 <= '1';
		if cnt = a or cnt = a + b or cnt = a + b + c then
			CNT_END <= '1';
		else
			CNT_END <= '0';
		end if;
	if cnt = a + b + c + d then 
		CNT_END <= '1';
		enable_out_1 <= '1';
		enable_out_2 <= '1';
		cnt := 0;
	end if;
	--counter_end <= CNT_END;
	end if; 


  end process;
end architecture Behave;