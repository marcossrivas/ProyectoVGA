library verilog;
use verilog.vl_types.all;
entity SYNC_signal is
    port(
        counter         : out    vl_logic_vector(31 downto 0);
        counter_end     : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable_in       : in     vl_logic;
        enable_out      : out    vl_logic;
        VGA_sync        : out    vl_logic;
        VGA_blank       : out    vl_logic
    );
end SYNC_signal;
