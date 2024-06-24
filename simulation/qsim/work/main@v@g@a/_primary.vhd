library verilog;
use verilog.vl_types.all;
entity mainVGA is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        VGA_HS          : out    vl_logic;
        VGA_VS          : out    vl_logic;
        VGA_BLANK_HS    : out    vl_logic;
        VGA_BLANK_VS    : out    vl_logic;
        VGA_SYNC        : out    vl_logic;
        VGA_CLK         : out    vl_logic
    );
end mainVGA;
