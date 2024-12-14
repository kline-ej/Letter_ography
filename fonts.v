module fonts (
input [7:0]char,
input [2:0]row,
output reg [4:0]pixels
);


always @ (*)
	case (char)
		8'd0: // Space
			case (row)
				3'd0: pixels = 5'b00000;
				3'd1: pixels = 5'b00000;
				3'd2: pixels = 5'b00000;
				3'd3: pixels = 5'b00000;
				3'd4: pixels = 5'b00000;
			endcase 
		8'd65: // A
			case (row)
				3'd0: pixels = 5'b01100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b11110;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b10010;
			endcase
		8'd66: // B
			case (row)
				3'd0: pixels = 5'b11100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b11100;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b11100;
			endcase
		8'd67: // C
			case (row)
				3'd0: pixels = 5'b01100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b10000;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b01100;
			endcase
		8'd68: // D
			case (row)
				3'd0: pixels = 5'b11100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b10010;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b11100;
			endcase
		8'd69: // E
			case (row)
				3'd0: pixels = 5'b11110;
				3'd1: pixels = 5'b10000;
				3'd2: pixels = 5'b11100;
				3'd3: pixels = 5'b10000;
				3'd4: pixels = 5'b11110;
			endcase
		8'd70: // F
			case (row)
				3'd0: pixels = 5'b11110;
				3'd1: pixels = 5'b10000;
				3'd2: pixels = 5'b11100;
				3'd3: pixels = 5'b10000;
				3'd4: pixels = 5'b10000;
			endcase
		8'd71: // G
			case (row)
				3'd0: pixels = 5'b01110;
				3'd1: pixels = 5'b10000;
				3'd2: pixels = 5'b10011;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b01100;
			endcase
		8'd72: // H
			case (row)
				3'd0: pixels = 5'b10010;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b11110;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b10010;
			endcase
		8'd73: // I
			case (row)
				3'd0: pixels = 5'b01110;
				3'd1: pixels = 5'b00100;
				3'd2: pixels = 5'b00100;
				3'd3: pixels = 5'b00100;
				3'd4: pixels = 5'b01110;
			endcase
		8'd74: // J
			case (row)
				3'd0: pixels = 5'b11110;
				3'd1: pixels = 5'b00010;
				3'd2: pixels = 5'b00010;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b01100;
			endcase
		8'd75: // K
			case (row)
				3'd0: pixels = 5'b10010;
				3'd1: pixels = 5'b10100;
				3'd2: pixels = 5'b11000;
				3'd3: pixels = 5'b10100;
				3'd4: pixels = 5'b10010;
			endcase
		8'd76: // L
			case (row)
				3'd0: pixels = 5'b10000;
				3'd1: pixels = 5'b10000;
				3'd2: pixels = 5'b10000;
				3'd3: pixels = 5'b10000;
				3'd4: pixels = 5'b11110;
			endcase
		8'd77: // M
			case (row)
				3'd0: pixels = 5'b10001;
				3'd1: pixels = 5'b11011;
				3'd2: pixels = 5'b10101;
				3'd3: pixels = 5'b10101;
				3'd4: pixels = 5'b10001;
			endcase
		8'd78: // N
			case (row)
				3'd0: pixels = 5'b10010;
				3'd1: pixels = 5'b11010;
				3'd2: pixels = 5'b10110;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b10010;
			endcase
		8'd79: // 0
			case (row)
				3'd0: pixels = 5'b01100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b10010;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b01100;
			endcase
		8'd80: // P
			case (row)
				3'd0: pixels = 5'b11100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b11100;
				3'd3: pixels = 5'b10000;
				3'd4: pixels = 5'b10000;
			endcase
		8'd81: // Q
			case (row)
				3'd0: pixels = 5'b01100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b10110;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b01101;
			endcase
		8'd82: // R
			case (row)
				3'd0: pixels = 5'b11100;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b11100;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b10010;
			endcase
		8'd83: // S
			case (row)
				3'd0: pixels = 5'b00111;
				3'd1: pixels = 5'b01000;
				3'd2: pixels = 5'b01100;
				3'd3: pixels = 5'b00010;
				3'd4: pixels = 5'b11100;
			endcase
		8'd84: // T
			case (row)
				3'd0: pixels = 5'b01110;
				3'd1: pixels = 5'b00100;
				3'd2: pixels = 5'b00100;
				3'd3: pixels = 5'b00100;
				3'd4: pixels = 5'b00100;
			endcase
		8'd85: // U
			case (row)
				3'd0: pixels = 5'b10010;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b10010;
				3'd3: pixels = 5'b10010;
				3'd4: pixels = 5'b11110;
			endcase
		8'd86: // V
			case (row)
				3'd0: pixels = 5'b10010;
				3'd1: pixels = 5'b10010;
				3'd2: pixels = 5'b10010;
				3'd3: pixels = 5'b01100;
				3'd4: pixels = 5'b01000;
			endcase
		8'd87: // W
			case (row)
				3'd0: pixels = 5'b10001;
				3'd1: pixels = 5'b10101;
				3'd2: pixels = 5'b10101;
				3'd3: pixels = 5'b11011;
				3'd4: pixels = 5'b10001;
			endcase
		8'd88: // X
			case (row)
				3'd0: pixels = 5'b10001;
				3'd1: pixels = 5'b01010;
				3'd2: pixels = 5'b00100;
				3'd3: pixels = 5'b01010;
				3'd4: pixels = 5'b10001;
			endcase
		8'd89: // Y
			case (row)
				3'd0: pixels = 5'b10001;
				3'd1: pixels = 5'b10001;
				3'd2: pixels = 5'b01110;
				3'd3: pixels = 5'b00100;
				3'd4: pixels = 5'b00100;
			endcase
		8'd90: // Z
			case (row)
				3'd0: pixels = 5'b01111;
				3'd1: pixels = 5'b00010;
				3'd2: pixels = 5'b00100;
				3'd3: pixels = 5'b01000;
				3'd4: pixels = 5'b11110;
			endcase
		8'd32: // Space
			case (row)
				3'd0: pixels = 5'b00000;
				3'd1: pixels = 5'b00000;
				3'd2: pixels = 5'b00000;
				3'd3: pixels = 5'b00000;
				3'd4: pixels = 5'b00000;
			endcase
		8'd46: // .
			case (row)
				3'd0: pixels = 5'b00000;
				3'd1: pixels = 5'b00000;
				3'd2: pixels = 5'b00000;
				3'd3: pixels = 5'b00000;
				3'd4: pixels = 5'b00100;
			endcase
		8'd33: // !
			case (row)
				3'd0: pixels = 5'b00100;
				3'd1: pixels = 5'b00100;
				3'd2: pixels = 5'b00100;
				3'd3: pixels = 5'b00000;
				3'd4: pixels = 5'b00100;
			endcase
		8'd63: // ?
			case (row)
				3'd0: pixels = 5'b11110;
				3'd1: pixels = 5'b00001;
				3'd2: pixels = 5'b01110;
				3'd3: pixels = 5'b00000;
				3'd4: pixels = 5'b01000;
			endcase
		endcase

endmodule

