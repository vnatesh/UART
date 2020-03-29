module ascii_to_seven_seg( 
	input logic [7:0] ascii_in,
	output logic [6:0] hex_out,
	output logic [3:0] an,
	output logic dp
 	);


	assign dp = 1'b1;
	assign an = 4'b0111;


	always @(*) begin
		case(ascii_in)

			32	: hex_out = 7'b1111111;
			33	: hex_out = 7'b1111001;
			34	: hex_out = 7'b1011101;
			35	: hex_out = 7'b0000001;
			36	: hex_out = 7'b0010010;
			37	: hex_out = 7'b0101101;
			38	: hex_out = 7'b0111001;
			39	: hex_out = 7'b1011111;
			40	: hex_out = 7'b1010110;
			41	: hex_out = 7'b1110100;
			42	: hex_out = 7'b1011110;
			43	: hex_out = 7'b0001111;
			44	: hex_out = 7'b1101111;
			45	: hex_out = 7'b0111111;
			46	: hex_out = 7'b1111111;
			47	: hex_out = 7'b0101101;
			48	: hex_out = 7'b1000000;
			49	: hex_out = 7'b1111001;
			50	: hex_out = 7'b0100100;
			51	: hex_out = 7'b0110000;
			52	: hex_out = 7'b0011001;
			53	: hex_out = 7'b0010010;
			54	: hex_out = 7'b0000010;
			55	: hex_out = 7'b1111000;
			56	: hex_out = 7'b0000000;
			57	: hex_out = 7'b0010000;
			58	: hex_out = 7'b1110110;
			59	: hex_out = 7'b1110010;
			60	: hex_out = 7'b0011110;
			61	: hex_out = 7'b0110111;
			62	: hex_out = 7'b0111100;
			63	: hex_out = 7'b0101100;
			64	: hex_out = 7'b0100000;
			65	: hex_out = 7'b0001000;
			66	: hex_out = 7'b0000011;
			67	: hex_out = 7'b1000110;
			68	: hex_out = 7'b0100001;
			69	: hex_out = 7'b0000110;
			70	: hex_out = 7'b0001110;
			71	: hex_out = 7'b1000010;
			72	: hex_out = 7'b0001001;
			73	: hex_out = 7'b1001111;
			74	: hex_out = 7'b1100001;
			75	: hex_out = 7'b0001010;
			76	: hex_out = 7'b1000111;
			77	: hex_out = 7'b1101010;
			78	: hex_out = 7'b1001000;
			79	: hex_out = 7'b1000000;
			80	: hex_out = 7'b0001100;
			81	: hex_out = 7'b0010100;
			82	: hex_out = 7'b1001100;
			83	: hex_out = 7'b0010010;
			84	: hex_out = 7'b0000111;
			85	: hex_out = 7'b1000001;
			86	: hex_out = 7'b1000001;
			87	: hex_out = 7'b1010101;
			88	: hex_out = 7'b0001001;
			89	: hex_out = 7'b0010001;
			90	: hex_out = 7'b0100100;
			91	: hex_out = 7'b1000110;
			92	: hex_out = 7'b0011011;
			93	: hex_out = 7'b1110000;
			94	: hex_out = 7'b1011100;
			95	: hex_out = 7'b1110111;
			96	: hex_out = 7'b1111101;
			97	: hex_out = 7'b0100000;
			98	: hex_out = 7'b0000011;
			99	: hex_out = 7'b0100111;
			100	: hex_out = 7'b0100001;
			101	: hex_out = 7'b0000100;
			102	: hex_out = 7'b0001110;
			103	: hex_out = 7'b0010000;
			104	: hex_out = 7'b0001011;
			105	: hex_out = 7'b1101111;
			106	: hex_out = 7'b1110011;
			107	: hex_out = 7'b0001010;
			108	: hex_out = 7'b1001111;
			109	: hex_out = 7'b1101011;
			110	: hex_out = 7'b0101011;
			111	: hex_out = 7'b0100011;
			112	: hex_out = 7'b0001100;
			113	: hex_out = 7'b0011000;
			114	: hex_out = 7'b0101111;
			115	: hex_out = 7'b0010010;
			116	: hex_out = 7'b0000111;
			117	: hex_out = 7'b1100011;
			118	: hex_out = 7'b1100011;
			119	: hex_out = 7'b1101011;
			120	: hex_out = 7'b0001001;
			121	: hex_out = 7'b0010001;
			122	: hex_out = 7'b0100100;
			123	: hex_out = 7'b0111001;
			124	: hex_out = 7'b1001111;
			125	: hex_out = 7'b0001111;
			126	: hex_out = 7'b1111110;
			127	: hex_out = 7'b1111111;
			default : hex_out = 7'b0000000; // U
		endcase
	end
endmodule
