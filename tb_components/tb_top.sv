`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"
import vr_env_pkg::*;

module tb_top;
	logic clk;
  
  	// clock generation at specified frequency
  	always #(4) clk =~ clk;

	// component declarations
	vr_if Iif(clk);
	vr Idut(.CLK(vif.CLK),
		.VALID(vif.VALID),
		.READY(vif.READY),
		.DATA(vif.DATA));
	vr_test Itest;
  
  	// run verification
  	initial begin
      		uvm_config_db#(virtual vr_if)::set(null, "*", "vr_if", Iif);
		run_test("vr_test");
    	end

  	// initialize values
  	initial begin
		clk = 0;
    	end      	

	// write wave data to output file
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(); 
	end 
endmodule : tb_top
