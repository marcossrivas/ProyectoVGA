library verilog;
use verilog.vl_types.all;
entity SYNC_signal_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        enable_in       : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SYNC_signal_vlg_sample_tst;
