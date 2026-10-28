//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: this is the core module for the AES
//  It contains both the datapath and the controller

module lab7_aescore(input  logic         clk, 
                   input  logic         load,
					input  logic [127:0] key, 
					input  logic [127:0] plaintext, 
					output logic         done, 
					output logic [127:0] cyphertext);

    logic [127:0] s, ssubbytes, sshiftrows, smixcolumns, snew, ns;
	logic [3:0] round;
	logic [9:0] count;
	logic [31:0] lastword, word3, wordbuffer;

					  
	assign s = (round==4'b0000)?plaintext:cyphertext;
	
	lab7_counter #(.WIDTH(9), .MAX(1024)) counter(clk, 1'b1, load, count);
	
	assign round = ((count/2)-1);
	
	lab7_subbytes subbytes(clk, s, ssubbytes);
	lab7_shiftrows shiftrows(ssubbytes, sshiftrows);
	lab7_mixcolumns mixcolumns(sshiftrows, smixcolumns);

	
	always_comb
		case (round)
			4'h0: snew = s;
			4'ha: snew = sshiftrows;
			default: snew = smixcolumns;
		endcase
	
	lab7_addroundkey addroundkey(snew, key, round, lastword, clk, word3, ns);
	
	always_ff @(posedge clk) begin
		cyphertext<=ns;
		wordbuffer<=word3;
		lastword<=wordbuffer;
		if (count==10'h017) done<=1;
	end
	
	 
	
    
endmodule