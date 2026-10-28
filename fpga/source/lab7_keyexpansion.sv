//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: This module performs the key expansion


module lab7_keyexpansion(input  logic         clk,
						 input  logic [3:0]   round,
						 input  logic [127:0] key,
						 input  logic [31:0]  lastword,
						 output logic [31:0]  word0, 
						 output logic [31:0]  word1, 
						 output logic [31:0]  word2, 
						 output logic [31:0]  word3);
						 
	logic [31:0] w0, w1, w2, w3;
	logic [31:0] wordold4, wordold1, wordold2, wordold3;
	logic [31:0] buffer1, buffer2, buffer3, buffer4;
	assign w0 = key[127:96];
	assign w1 = key[95:64];
	assign w2 = key[63:32];
	assign w3 = key[31:0];
	
	
	
	
	lab7_calcword calcword1(clk, lastword, w0, wordold1, round, 1'b1, word0);
	lab7_calcword calcword2(clk, word0, w1, wordold2, round, 1'b0, word1);
	lab7_calcword calcword3(clk, word1, w2, wordold3, round, 1'b0, word2);
	lab7_calcword calcword4(clk, word2, w3, wordold4, round, 1'b0, word3);
	
	always_ff @(posedge clk) begin
		buffer1<=word0;
		wordold1<=buffer1;
		buffer2<=word1;
		wordold2<=buffer2;
		buffer3<=word2;
		wordold3<=buffer3;
		buffer4<=word3;
		wordold4<=buffer4;
	end
	

endmodule