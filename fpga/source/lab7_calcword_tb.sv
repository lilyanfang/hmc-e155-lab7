//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: testbench for the calcword module
//  It tests the process for a single word calc

module lab7_calcword_tb();
	logic clk;
	logic [31:0] temp, wordin, wordout;
	logic [3:0]  round;
	logic round4;
	
	
	lab7_calcword dut(.clk(clk), .temp(temp), .wordin(wordin), .round(round), .round4(round4), .wordout(wordout));
	
	always begin
		clk=1; #5;
		clk=0; #5;
	end
	
	initial begin 
		#10
		temp = 32'h09_cf_4f_3c;
		wordin = 32'h2b_7e_15_16;
		round = 4'b0001;
		round4 = 1;
		#40
		
		assert (wordout == 32'ha0_fa_fe_17)
			$display("PASSED! 0mod4 word correct");
		else
			$error("FAILED! 0mod4 word incorrect");
		#10;
		
		#10
		temp = 32'hf2_c2_95_f2;
		wordin = 32'h88_54_2c_b1;
		round = 4'b0010;
		round4 = 0;
		#40
		
		assert (wordout == 32'h7a_96_b9_43)
			$display("PASSED! not 0mod4 word correct");
		else
			$error("FAILED! not 0mod4 word incorrect");
		#10;
		
		$stop;
	end
endmodule