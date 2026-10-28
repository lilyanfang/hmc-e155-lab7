//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: this module XORs the current state with the round key

module lab7_addroundkey(input  logic [127:0] s,
						input  logic [127:0] key,
						input  logic [3:0]   round,
						input  logic [31:0]  lastword,
						input  logic         clk,
						output logic [31:0]  word3,
						output logic [127:0] ns);
				
	//ns_r,c = (s_r,c)^(w_4*round+c)
	
	logic [31:0] word0, word1, word2;
	
	lab7_keyexpansion keyexpansion(clk, round, key, lastword, word0, word1, word2, word3);
	
	//column 0
	assign ns[127:96] = (s[127:96])^word0;

	//column 1
	assign ns[95:64] = (s[95:64])^word1;
	
	//column 2
	assign ns[63:32] = (s[63:32])^word2;
	
	//coulmn 3
	assign ns[31:0] = (s[31:0])^word3;
	
endmodule