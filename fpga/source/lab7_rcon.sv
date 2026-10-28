//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/17/2026
//	Description: This is the module for finding the Rcon value


module lab7_rcon(input  logic [3:0]  round,
				 output logic [31:0] r);
	always_comb
		case (round)
			4'h1: r = 32'h0100_0000;
			4'h2: r = 32'h0200_0000;
			4'h3: r = 32'h0400_0000;
			4'h4: r = 32'h0800_0000;
			4'h5: r = 32'h1000_0000;
			4'h6: r = 32'h2000_0000;
			4'h7: r = 32'h4000_0000;
			4'h8: r = 32'h8000_0000;
			4'h9: r = 32'h1b00_0000;
			4'ha: r = 32'h3600_0000;
			default: r = 32'h0;
		endcase
		
endmodule
