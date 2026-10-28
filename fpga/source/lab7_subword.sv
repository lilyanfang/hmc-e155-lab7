//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: This module performs the subword logic
// ****need to change to be sync


module lab7_subword(input  logic clk,
					input  logic [31:0] wordin,
					output logic [31:0] wordout);
					
	lab7_sbox sboxa(wordin[31:24], wordout[31:24]);
	lab7_sbox sboxb(wordin[23:16], wordout[23:16]);
	lab7_sbox sboxc(wordin[15:8], wordout[15:8]);
	lab7_sbox sboxd(wordin[7:0], wordout[7:0]);
	
endmodule


