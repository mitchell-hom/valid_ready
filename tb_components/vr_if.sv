interface vr_if(input bit CLK);
	logic VALID;
	logic READY;
	logic DATA;

	clocking drv_cb @(posedge CLK);
		// drives after all evaluations, etc. have happened
		default input #1step output #0;

		output VALID, DATA;
	endclocking : drv_cb

	clocking mon_cb @(posedge CLK);
		// samples 1 timestep before clock edge
		default input #1step output #0;

		input VALID, READY, DATA;
	endclocking : mon_cb
endinterface : vr_if
