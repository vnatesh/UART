module ascii_to_seven_seg( 
	input [7:0] ascii_in,
	output logic [6:0] hex_out,
	output logic [3:0] an,
	output logic dp
 	);

	assign dp = 1'b1;
	assign an = 4'b0111;

	always @(*) begin
		case(ascii_in)
			//////////<---MSB-LSB<---
			//////////////gfedcba////////////////////////////////////////////              a
			48 : hex_out = 7'b1000000;////0000												   __					
			49 : hex_out = 7'b1111001;////0001												f/	  /b
			50 : hex_out = 7'b0100100;////0010												  g
			//                                                                           __	
			51 : hex_out = 7'b0110000;////0011										 	 e /   /c
			52 : hex_out = 7'b0011001;////0100												 __
			53 : hex_out = 7'b0010010;////0101                                               d  
			54 : hex_out = 7'b0000010;////0110
			55 : hex_out = 7'b1111000;////0111
			56 : hex_out = 7'b0000000;////1000
			57 : hex_out = 7'b0010000;////1001
			default : hex_out = 7'b0000000; // U
		endcase
	end
endmodule






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

			// 8'd32	: hex_out = 7'b1111111;
			// 8'd33	: hex_out = 7'b1111001;
			// 8'd34	: hex_out = 7'b1011101;
			// 8'd35	: hex_out = 7'b0000001;
			// 8'd36	: hex_out = 7'b0010010;
			// 8'd37	: hex_out = 7'b0101101;
			// 8'd38	: hex_out = 7'b0111001;
			// 8'd39	: hex_out = 7'b1011111;
			// 8'd40	: hex_out = 7'b1010110;
			// 8'd41	: hex_out = 7'b1110100;
			// 8'd42	: hex_out = 7'b1011110;
			// 8'd43	: hex_out = 7'b0001111;
			// 8'd44	: hex_out = 7'b1101111;
			// 8'd45	: hex_out = 7'b0111111;
			// 8'd46	: hex_out = 7'b1111111;
			// 8'd47	: hex_out = 7'b0101101;
			8'd48	: hex_out = 7'b1000000;
			8'd49	: hex_out = 7'b1111001;
			8'd50	: hex_out = 7'b0100100;
			8'd51	: hex_out = 7'b0110000;
			8'd52	: hex_out = 7'b0011001;
			8'd53	: hex_out = 7'b0010010;
			8'd54	: hex_out = 7'b0000010;
			8'd55	: hex_out = 7'b1111000;
			8'd56	: hex_out = 7'b0000000;
			8'd57	: hex_out = 7'b0010000;
			// 8'd58	: hex_out = 7'b1110110;
			// 8'd59	: hex_out = 7'b1110010;
			// 8'd60	: hex_out = 7'b0011110;
			// 8'd61	: hex_out = 7'b0110111;
			// 8'd62	: hex_out = 7'b0111100;
			// 8'd63	: hex_out = 7'b0101100;
			// 8'd64	: hex_out = 7'b0100000;
			// 8'd65	: hex_out = 7'b0001000;
			// 8'd66	: hex_out = 7'b0000011;
			// 8'd67	: hex_out = 7'b1000110;
			// 8'd68	: hex_out = 7'b0100001;
			// 8'd69	: hex_out = 7'b0000110;
			// 8'd70	: hex_out = 7'b0001110;
			// 8'd71	: hex_out = 7'b1000010;
			// 8'd72	: hex_out = 7'b0001001;
			// 8'd73	: hex_out = 7'b1001111;
			// 8'd74	: hex_out = 7'b1100001;
			// 8'd75	: hex_out = 7'b0001010;
			// 8'd76	: hex_out = 7'b1000111;
			// 8'd77	: hex_out = 7'b1101010;
			// 8'd78	: hex_out = 7'b1001000;
			// 8'd79	: hex_out = 7'b1000000;
			// 8'd80	: hex_out = 7'b0001100;
			// 8'd81	: hex_out = 7'b0010100;
			// 8'd82	: hex_out = 7'b1001100;
			// 8'd83	: hex_out = 7'b0010010;
			// 8'd84	: hex_out = 7'b0000111;
			// 8'd85	: hex_out = 7'b1000001;
			// 8'd86	: hex_out = 7'b1000001;
			// 8'd87	: hex_out = 7'b1010101;
			// 8'd88	: hex_out = 7'b0001001;
			// 8'd89	: hex_out = 7'b0010001;
			// 8'd90	: hex_out = 7'b0100100;
			// 8'd91	: hex_out = 7'b1000110;
			// 8'd92	: hex_out = 7'b0011011;
			// 8'd93	: hex_out = 7'b1110000;
			// 8'd94	: hex_out = 7'b1011100;
			// 8'd95	: hex_out = 7'b1110111;
			// 8'd96	: hex_out = 7'b1111101;
			8'd97	: hex_out = 7'b0100000;
			8'd98	: hex_out = 7'b0000011;
			8'd99	: hex_out = 7'b0100111;
			8'd100	: hex_out = 7'b0100001;
			8'd101	: hex_out = 7'b0000100;
			8'd102	: hex_out = 7'b0001110;
			8'd103	: hex_out = 7'b0010000;
			8'd104	: hex_out = 7'b0001011;
			8'd105	: hex_out = 7'b1101111;
			8'd106	: hex_out = 7'b1110011;
			8'd107	: hex_out = 7'b0001010;
			8'd108	: hex_out = 7'b1001111;
			8'd109	: hex_out = 7'b1101011;
			8'd110	: hex_out = 7'b0101011;
			8'd111	: hex_out = 7'b0100011;
			8'd112	: hex_out = 7'b0001100;
			8'd113	: hex_out = 7'b0011000;
			8'd114	: hex_out = 7'b0101111;
			// 8'd115	: hex_out = 7'b0010010;
			// 8'd116	: hex_out = 7'b0000111;
			// 8'd117	: hex_out = 7'b1100011;
			// 8'd118	: hex_out = 7'b1100011;
			// 8'd119	: hex_out = 7'b1101011;
			// 8'd120	: hex_out = 7'b0001001;
			// 8'd121	: hex_out = 7'b0010001;
			// 8'd122	: hex_out = 7'b0100100;
			// 8'd123	: hex_out = 7'b0111001;
			// 8'd124	: hex_out = 7'b1001111;
			// 8'd125	: hex_out = 7'b0001111;
			// 8'd126	: hex_out = 7'b1111110;
			// 8'd127	: hex_out = 7'b1111111;

			default : hex_out = 7'b0000000; // U

		endcase
	end
endmodule







// module ascii_to_seven_seg( 
// 	input logic [7:0] ascii_in,
// 	output logic [6:0] hex_out,
// 	output logic [3:0] an,
// 	output logic dp
//  	);


// 	assign dp = 1'b1;
// 	assign an = 4'b0111;

//     assign hex_out = (ascii_in==32) ? 7'b1111111 :
// 			(ascii_in==33) ? 7'b1111001 :
// 			(ascii_in==34) ? 7'b1011101 :
// 			(ascii_in==35) ? 7'b0000001 :
// 			(ascii_in==36) ? 7'b0010010 :
// 			(ascii_in==37) ? 7'b0101101 :
// 			(ascii_in==38) ? 7'b0111001 :
// 			(ascii_in==39) ? 7'b1011111 :
// 			(ascii_in==40) ? 7'b1010110 :
// 			(ascii_in==41) ? 7'b1110100 :
// 			(ascii_in==42) ? 7'b1011110 :
// 			(ascii_in==43) ? 7'b0001111 :
// 			(ascii_in==44) ? 7'b1101111 :
// 			(ascii_in==45) ? 7'b0111111 :
// 			(ascii_in==46) ? 7'b1111111 :
// 			(ascii_in==47) ? 7'b0101101 :
// 			(ascii_in==48) ? 7'b1000000 :
// 			(ascii_in==49) ? 7'b1111001 :
// 			(ascii_in==50) ? 7'b0100100 :
// 			(ascii_in==51) ? 7'b0110000 :
// 			(ascii_in==52) ? 7'b0011001 :
// 			(ascii_in==53) ? 7'b0010010 :
// 			(ascii_in==54) ? 7'b0000010 :
// 			(ascii_in==55) ? 7'b1111000 :
// 			(ascii_in==56) ? 7'b0000000 :
// 			(ascii_in==57) ? 7'b0010000 :
// 			(ascii_in==58) ? 7'b1110110 :
// 			(ascii_in==59) ? 7'b1110010 :
// 			(ascii_in==60) ? 7'b0011110 :
// 			(ascii_in==61) ? 7'b0110111 :
// 			(ascii_in==62) ? 7'b0111100 :
// 			(ascii_in==63) ? 7'b0101100 :
// 			(ascii_in==64) ? 7'b0100000 :
// 			(ascii_in==65) ? 7'b0001000 :
// 			(ascii_in==66) ? 7'b0000011 :
// 			(ascii_in==67) ? 7'b1000110 :
// 			(ascii_in==68) ? 7'b0100001 :
// 			(ascii_in==69) ? 7'b0000110 :
// 			(ascii_in==70) ? 7'b0001110 :
// 			(ascii_in==71) ? 7'b1000010 :
// 			(ascii_in==72) ? 7'b0001001 :
// 			(ascii_in==73) ? 7'b1001111 :
// 			(ascii_in==74) ? 7'b1100001 :
// 			(ascii_in==75) ? 7'b0001010 :
// 			(ascii_in==76) ? 7'b1000111 :
// 			(ascii_in==77) ? 7'b1101010 :
// 			(ascii_in==78) ? 7'b1001000 :
// 			(ascii_in==79) ? 7'b1000000 :
// 			(ascii_in==80) ? 7'b0001100 :
// 			(ascii_in==81) ? 7'b0010100 :
// 			(ascii_in==82) ? 7'b1001100 :
// 			(ascii_in==83) ? 7'b0010010 :
// 			(ascii_in==84) ? 7'b0000111 :
// 			(ascii_in==85) ? 7'b1000001 :
// 			(ascii_in==86) ? 7'b1000001 :
// 			(ascii_in==87) ? 7'b1010101 :
// 			(ascii_in==88) ? 7'b0001001 :
// 			(ascii_in==89) ? 7'b0010001 :
// 			(ascii_in==90) ? 7'b0100100 :
// 			(ascii_in==91) ? 7'b1000110 :
// 			(ascii_in==92) ? 7'b0011011 :
// 			(ascii_in==93) ? 7'b1110000 :
// 			(ascii_in==94) ? 7'b1011100 :
// 			(ascii_in==95) ? 7'b1110111 :
// 			(ascii_in==96) ? 7'b1111101 :
// 			(ascii_in==97) ? 7'b0100000 :
// 			(ascii_in==98) ? 7'b0000011 :
// 			(ascii_in==99) ? 7'b0100111 :
// 			(ascii_in==100) ? 7'b0100001 :
// 			(ascii_in==101) ? 7'b0000100 :
// 			(ascii_in==102) ? 7'b0001110 :
// 			(ascii_in==103) ? 7'b0010000 :
// 			(ascii_in==104) ? 7'b0001011 :
// 			(ascii_in==105) ? 7'b1101111 :
// 			(ascii_in==106) ? 7'b1110011 :
// 			(ascii_in==107) ? 7'b0001010 :
// 			(ascii_in==108) ? 7'b1001111 :
// 			(ascii_in==109) ? 7'b1101011 :
// 			(ascii_in==110) ? 7'b0101011 :
// 			(ascii_in==111) ? 7'b0100011 :
// 			(ascii_in==112) ? 7'b0001100 :
// 			(ascii_in==113) ? 7'b0011000 :
// 			(ascii_in==114) ? 7'b0101111 :
// 			(ascii_in==115) ? 7'b0010010 :
// 			(ascii_in==116) ? 7'b0000111 :
// 			(ascii_in==117) ? 7'b1100011 :
// 			(ascii_in==118) ? 7'b1100011 :
// 			(ascii_in==119) ? 7'b1101011 :
// 			(ascii_in==120) ? 7'b0001001 :
// 			(ascii_in==121) ? 7'b0010001 :
// 			(ascii_in==122) ? 7'b0100100 :
// 			(ascii_in==123) ? 7'b0111001 :
// 			(ascii_in==124) ? 7'b1001111 :
// 			(ascii_in==125) ? 7'b0001111 :
// 			(ascii_in==126) ? 7'b1111110 :
// 			(ascii_in==127) ? 7'b1111111 : 7'b0000000;
// endmodule





