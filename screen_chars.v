module screen_chars(
	input clk,
	input [3:0] screen,		// 0-15
	input [4:0] char_y,	// 0-23
	input [4:0] char_x,	// 0-31
	output reg [7:0] char
);

reg [13:0] address;
wire [7:0] q_data;

chars_rom the_chars_map(
	.address(address),
	.clock(clk),
	.q(q_data)
);

parameter SCR_ROWS = 24;
parameter SCR_COLS = 32;
parameter SCR_BLK_SIZE = SCR_ROWS * SCR_COLS;	// 768

// calculate the memory address
always@(*) begin
	address = screen * SCR_BLK_SIZE + char_x * SCR_ROWS + char_y;
end

always@(posedge clk) begin
	char <= q_data;  // Register the data from the ROM
end

endmodule