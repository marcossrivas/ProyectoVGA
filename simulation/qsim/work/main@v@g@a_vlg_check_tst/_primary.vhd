library verilog;
use verilog.vl_types.all;
entity mainVGA_vlg_check_tst is
    port(
        VGA_BLANK_HS    : in     vl_logic;
        VGA_BLANK_VS    : in     vl_logic;
        VGA_CLK         : in     vl_logic;
        VGA_HS          : in     vl_logic;
        VGA_SYNC        : in     vl_logic;
        VGA_VS          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end mainVGA_vlg_check_tst;
