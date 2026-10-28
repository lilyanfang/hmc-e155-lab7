//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/18/2026
//	Description: this module shifts the rows of
//	an 128 bit input following the AES standard

module lab7_shiftrows(input  logic [127:0] s,
					  output  logic [127:0] ns);
	
	
	//ns_r,c = s_r,c+r
	
	//column 0
	assign ns[127:120] = s[127:120];
	assign ns[119:112] = s[87:80];
	assign ns[111:104] = s[47:40];
	assign ns[103:96] = s[7:0];

	//column 1
	assign ns[95:88] = s[95:88];
	assign ns[87:80] = s[55:48];
	assign ns[79:72] = s[15:8];
	assign ns[71:64] = s[103:96];
	
	//column 2
	assign ns[63:56] = s[63:56];
	assign ns[55:48] = s[23:16];
	assign ns[47:40] = s[111:104];
	assign ns[39:32] = s[71:64];
	
	//coulmn 3
	assign ns[31:24] = s[31:24];
	assign ns[23:16] = s[119:112];
	assign ns[15:8] = s[79:72];
	assign ns[7:0] = s[39:32];
	
endmodule