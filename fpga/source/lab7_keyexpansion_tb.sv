//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: testbench for the keyexpansion module
//  this is just to double check the latency through visualization

module lab7_keyexpansion_tb();
	
	logic clk;
	logic [3:0] round;
	logic [127:0] key;
	logic [31:0] lastword, word0, word1, word2, word3;
	
	lab7_keyexpansion keyexpansion(.clk(clk), .round(round), .key(key), .lastword(lastword), .word0(word0), .word1(word1), .word2(word2), .word3(word3));
	
	always begin
		clk=1; #5;
		clk=0; #5;
	end
	
	initial begin
		#10;
		round=4'b0000;
		key = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
		lastword = 32'b0;
		#60;
		
		assert (word0 == 32'h2b7e1516)
			$display("PASSED! round0 word0 correct");
		else
			$error("FAILED! round0 word0 incorrect");
		assert (word1 == 32'h28aed2a6)
			$display("PASSED! round0 word1 correct");
		else
			$error("FAILED! round0 word1 incorrect");
		assert (word2 == 32'habf71588)
			$display("PASSED! round0 word2 correct");
		else
			$error("FAILED! round0 word2 incorrect");
		assert (word3 == 32'h09cf4f3c)
			$display("PASSED! round0 word3 correct");
		else
			$error("FAILED! round0 word3 incorrect");
		#10;		
		round=4'b0001;
		lastword = 32'h09_cf_4f_3c;
		#60;
		assert (word0 == 32'ha0fafe17)
			$display("PASSED! round1 word0 correct");
		else
			$error("FAILED! round1 word0 incorrect");
		assert (word1 == 32'h88542cb1)
			$display("PASSED! round1 word1 correct");
		else
			$error("FAILED! round1 word1 incorrect");
		assert (word2 == 32'h23a33939)
			$display("PASSED! round1 word2 correct");
		else
			$error("FAILED! round1 word2 incorrect");
		assert (word3 == 32'h2a6c7605)
			$display("PASSED! round1 word3 correct");
		else
			$error("FAILED! round1 word3 incorrect");
		#10;
		
		$stop;
	end
		
endmodule		
		
		