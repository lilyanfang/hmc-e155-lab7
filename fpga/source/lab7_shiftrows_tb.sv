//	Written By: Lily Anfang
//	Email: lanfang@g.hmc.edu
//	Date: 10/18/2026
//	Description: testbench for the shiftbytes module
//	input and output test vectors are from the AES
//	standard Appendix B row 1 values for after 
//	SubBytes and after ShiftRows

module lab7_shiftrows_tb();
	logic clk;
	logic [127:0] s, ns;
	
	lab7_shiftrows dut(.s(s), .ns(ns));
	
	always begin
		clk=1; #5;
		clk=0; #5;
	end
	
	initial begin 
		#10
		s = 128'hd42711ae_e0bf98f1_b8b45de5_1e415230;
		#10
		
		assert (ns == 128'hd4bf5d30_e0b452ae_b84111f1_1e2798e5)
			$display("PASSED! Rows shifted correctly");
		else
			$error("FAILED! Rows shifted incorrectly");
		#10;
		$stop;
	end
endmodule