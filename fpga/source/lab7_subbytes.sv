//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description:  module to perform the subbytes function
//  it takes in 16 state bytes and uses sbox to transform them

module lab7_subbytes(input  logic 		  clk,
					 input  logic [127:0] s,
					 output logic [127:0] ns);
	
	
	lab7_sboxsync sbox1(s[127:120], clk, ns[127:120]);
	lab7_sboxsync sbox2(s[119:112], clk, ns[119:112]);
	lab7_sboxsync sbox3(s[111:104], clk, ns[111:104]);
	lab7_sboxsync sbox4(s[103:96], clk, ns[103:96]);
	lab7_sboxsync sbox5(s[95:88], clk, ns[95:88]);
	lab7_sboxsync sbox6(s[87:80], clk, ns[87:80]);
	lab7_sboxsync sbox7(s[79:72], clk, ns[79:72]);
	lab7_sboxsync sbox8(s[71:64], clk, ns[71:64]);
	lab7_sboxsync sbox9(s[63:56], clk, ns[63:56]);
	lab7_sboxsync sbox10(s[55:48], clk, ns[55:48]);
	lab7_sboxsync sbox11(s[47:40], clk, ns[47:40]);
	lab7_sboxsync sbox12(s[39:32], clk, ns[39:32]);
	lab7_sboxsync sbox13(s[31:24], clk, ns[31:24]);
	lab7_sboxsync sbox14(s[23:16], clk, ns[23:16]);
	lab7_sboxsync sbox15(s[15:8], clk, ns[15:8]);
	lab7_sboxsync sbox16(s[7:0], clk, ns[7:0]);

endmodule