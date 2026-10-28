//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: this module perfoms RotWord

module lab7_rotword(input  logic [31:0] wordin,
					output logic [31:0] wordout);
					
	assign wordout[31:8] = wordin[23:0];
	assign wordout[7:0] = wordin[31:24];
endmodule