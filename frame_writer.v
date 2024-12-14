module frame_writer(
	// INPUTS
	input clk,
	input rst,
	input [3:0] screen,
	
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

wire [9:0] leds;
assign LEDR[9:0] = leds;

// VGA DRIVER
wire active_pixels; // is on when we're in the active draw space
wire frame_done;
wire [9:0]x; // current x
wire [9:0]y; // current y - 10 bits = 1024 ... a little bit more than we need

/* the 3 signals to set to write to the picture */
reg [14:0] the_vga_draw_frame_write_mem_address;
reg [23:0] the_vga_draw_frame_write_mem_data;
reg the_vga_draw_frame_write_a_pixel;

// instantiate frame driver
vga_frame_driver vfd(
	.clk(clk),
	.rst(rst),

	.active_pixels(active_pixels),
	.frame_done(frame_done),

	.x(x),
	.y(y),

	.VGA_BLANK_N(VGA_BLANK_N),
	.VGA_CLK(VGA_CLK),
	.VGA_HS(VGA_HS),
	.VGA_SYNC_N(VGA_SYNC_N),
	.VGA_VS(VGA_VS),
	.VGA_B(VGA_B),
	.VGA_G(VGA_G),
	.VGA_R(VGA_R),

	/* writes to the frame buf - you need to figure out how x and y or other details provide a translation */
	.the_vga_draw_frame_write_mem_address(the_vga_draw_frame_write_mem_address),
	.the_vga_draw_frame_write_mem_data(the_vga_draw_frame_write_mem_data),
	.the_vga_draw_frame_write_a_pixel(the_vga_draw_frame_write_a_pixel)
);

reg [14:0] index; // from 0 - 19200

reg [5:0] S;
reg [5:0] NS;

parameter START    = 6'd0,
		  FOR_INIT = 6'd1,
		  FOR_COND = 6'd2,
		  FOR_INC  = 6'd3,
		  DRAW = 6'd4,
		  DONE     = 6'd5;

// State Register
always @(posedge clk or negedge rst) begin
  if (rst == 1'b0)    // reset is active low
		S <= START;
  else
		S <= NS;
end

// Next State Logic
always @(*) begin
  case (S)
		START:    NS = FOR_INIT;
		FOR_INIT: NS = FOR_COND;
		FOR_COND: NS = (index < 19200) ? DRAW : DONE;
		DRAW: NS = FOR_INC;
		FOR_INC: NS = FOR_COND;
		DONE:     NS = DONE; // Loop back to START after done
		default:  NS = START;
  endcase
end

wire [7:0] virtual_x;
wire [6:0] virtual_y;

assign virtual_x = index / 120;
assign virtual_y = index % 120;

wire [4:0] char_mat_x;
wire [4:0] char_mat_y;

assign char_mat_x = virtual_x / 5;
assign char_mat_y = virtual_y / 5;

wire [2:0] font_x;
wire [2:0] font_y;

assign font_x = virtual_x % 5;
assign font_y = (virtual_y - 1) % 5;

wire[7:0] char;

screen_chars(
	.clk(clk),
	.screen(screen),		// 0-15
	.char_y(char_mat_y),	// 0-23
	.char_x(char_mat_x),	// 0-31
	.char(char)
);

wire [4:0] pixels;

fonts (
	.char(char),
	.row(font_y),
	.pixels(pixels)
);


// Output / State Actions
always @(posedge clk or negedge rst) begin
  if (rst == 1'b0) begin
		index <= 15'd0;
  end else begin
		case (S)
			 START: begin
				  // no action, next cycle goes to FOR_INIT
			 end
			 FOR_INIT: begin
				  index <= 15'd0;  // reset the index to 0
			 end
			 FOR_COND: begin
				  // no change to index, just checking condition
			 end
			 FOR_INC: begin
				  // increment the index
				  the_vga_draw_frame_write_a_pixel <= 1'b0;
				  index <= index + 1'd1;
			 end
			 DRAW: begin
				the_vga_draw_frame_write_mem_address <= virtual_x * 120 + virtual_y;
				if (pixels[4 - font_x])
				begin
					the_vga_draw_frame_write_mem_data <= 24'hFFFFFF;
				end
				else
				begin
					the_vga_draw_frame_write_mem_data <= 24'h000000;
				end
				the_vga_draw_frame_write_a_pixel <= 1'b1;
			 end
			 DONE: begin
				  // no change, next cycle goes to START
			 end
			 default: index <= index;
		endcase
  end
end

// Assign the lower 8 LEDs to show the index value
assign leds[4:0] = pixels;

three_decimal_vals_w_neg hd(
	.val(font_y),
	.seg7_neg_sign(HEX3),
	.seg7_dig0(HEX0),
	.seg7_dig1(HEX1),
	.seg7_dig2(HEX2)
);

endmodule