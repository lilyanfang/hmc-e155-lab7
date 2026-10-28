//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/27/2026
//	Description: This is the subbytes module

module lab7_subbytes_tb();
    logic clk;
	logic [127:0] s, ns; 

	lab7_subbytes dut(.clk(clk), .s(s), .ns(ns));
    
	always begin
		clk=1; #5;
		clk=0; #5;
	end
	
	initial begin 
		s = 128'ha49c7ff2689f352b6b5bea43026a5049;
		#10
		assert (ns == 128'h49ded289_45db96f1_7f39871a_7702533b)
			$display("PASSED! next state correct");
		else
			$error("FAILED! next state incorrect");
		
		#10;
		$stop;
	end
endmodule
	