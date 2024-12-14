module key_rising_edge(
	input clk,
	input rst,
	input key_raw,
	output key1_falling_edge
);

// Registers for edge detection
reg key1_ff1, key1_ff2;  // Flip-flops for synchronizing and detecting edge

// Edge detection logic
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        key1_ff1 <= 1'b1;  // Initialize to default high (button not pressed)
        key1_ff2 <= 1'b1;
    end else begin
        key1_ff1 <= key_raw;  // First flip-flop captures the button state
        key1_ff2 <= key1_ff1;  // Second flip-flop latches the first's output
    end
end

assign key1_falling_edge = (key1_ff2 & ~key1_ff1);  // Falling edge detected when FF2 is 1 and FF1 is 0

endmodule