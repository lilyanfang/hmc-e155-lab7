//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: testbench for the addroundkey module
//  this is just to double check the latency through visualization

module lab7_addroundkey_tb();
	
	logic clk;
	logic [127:0] s, ns, key;
	logic [3:0] round;
	logic [31:0] lastword, word3;
	
	
	lab7_addroundkey addroundkey(.s(s), .key(key), .round(round), .lastword(lastword), .clk(clk), .word3(word3), .ns(ns));
	
	always begin
		clk=1; #5;
		clk=0; #5;
	end
	
	initial begin
		#10;
		round=4'b0001;
		key = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
		lastword = 32'h09_cf_4f_3c;
		s = 128'h046681e5_e0cb199a_48f8d37a_2806264c;
		#60;
		
		assert (ns[31:0] == 32'h026a5049)
			$display("PASSED! ns[31:0] correct");
		else
			$error("FAILED! ns[31:0] incorrect");
			
		assert (ns[63:32] == 32'h6b5bea43)
			$display("PASSED! ns[63:32] correct");
		else
			$error("FAILED! ns[63:32] incorrect");
			
		assert (ns[95:64] == 32'h689f352b)
			$display("PASSED! ns[95:64] correct");
		else
			$error("FAILED! ns[95:64] incorrect");
			
		assert (ns[127:96] == 32'ha49c7ff2)
			$display("PASSED! ns[127:96] correct");
		else
			$error("FAILED! ns[127:96] incorrect");
	end
	
endmodule