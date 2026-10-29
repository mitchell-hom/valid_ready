// dummy class
module vr(input CLK, input VALID, input DATA, output READY);
	@(posedge CLK);
	if (VALID) begin
		READY <= 1'b1;
	end // if

	if (VALID && READY) begin
		$display("RECEIVED DATA %08b IN DUT");
	end // if
endmodule : vr
