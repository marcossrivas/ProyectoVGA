library verilog;
use verilog.vl_types.all;
entity SYNC_signal_vlg_check_tst is
    port(
        counter         : in     vl_logic_vector(31 downto 0);
        counter_end     : in     vl_logic;
        enable_out      : in     vl_logic;
        VGA_blank       : in     vl_logic;
        VGA_sync        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SYNC_signal_vlg_check_tst;
