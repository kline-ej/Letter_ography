module proj(
	// INPUTS
	// 50MHz clock
	input CLOCK_50,
	
	// buttons
	input [3:0] KEY,
	
	// switches
	input [9:0] SW,
	
	// OUTPUTS	
	// leds
	output [9:0] LEDR,
	
	// hex displays
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	
	// vga outputs
	output [7:0] VGA_R,	// red
	output [7:0] VGA_G,	// green
	output [7:0] VGA_B,	// blue
	output VGA_CLK,		// clock
	output VGA_BLANK_N,
	output VGA_SYNC_N,
	output VGA_HS,			// horizontal sync
	output VGA_VS			// vertical sync
);

wire clk;
assign clk = CLOCK_50;

wire rst;
assign rst = KEY[0];

wire [3:0] screen;
assign screen = SW[3:0];

frame_writer fw(
	// INPUTS
	.clk(clk),
	.rst(rst),
	.screen(screen),
	
	// OUTPUTS
	// leds
	.LEDR(LEDR),
	
	// hex displays
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	
	// vga outputs
	.VGA_R(VGA_R),	// red
	.VGA_G(VGA_G),	// green
	.VGA_B(VGA_B),	// blue
	.VGA_CLK(VGA_CLK),		// clock
	.VGA_BLANK_N(VGA_BLANK_N),
	.VGA_SYNC_N(VGA_SYNC_N),
	.VGA_HS(VGA_HS),			// horizontal sync
	.VGA_VS(VGA_VS)			// vertical sync
);

wire [3:0] key_falling_edges;
key_rising_edge detect_press0(.clk(clk), .rst(rst), .key_raw(KEY[0]), .key1_falling_edge(key_falling_edges[0]));
key_rising_edge detect_press1(.clk(clk), .rst(rst), .key_raw(KEY[1]), .key1_falling_edge(key_falling_edges[1]));
key_rising_edge detect_press2(.clk(clk), .rst(rst), .key_raw(KEY[2]), .key1_falling_edge(key_falling_edges[2]));
key_rising_edge detect_press3(.clk(clk), .rst(rst), .key_raw(KEY[3]), .key1_falling_edge(key_falling_edges[3]));

endmodule