//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: This module calculates a single word
//  for the key expansion

module lab7_calcword(input  logic 		 clk,
					 input  logic [31:0] temp,
					 input  logic [31:0] wordin,
					 input  logic [31:0] wordold,
					 input  logic [3:0]  round,
					 input  logic 		 round4,
					 output logic [31:0] wordout);
					 
	logic [31:0] temp1, temp2, temp3, tempnew, r;
	
	lab7_rotword rotword(temp, temp1);
	lab7_subword subword(clk, temp1, temp2);
	lab7_rcon rcon(round, r);
	assign temp3 = r^temp2; 
	assign tempnew = round4?temp3:temp;
	assign wordout = (round==0)?wordin:(wordold^tempnew);
endmodule	
	
	
	