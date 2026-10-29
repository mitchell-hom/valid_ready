class vr_tx extends uvm_sequence_item;
	// not doing random bc we're not verifying, just investigating
	bit CLK;
	bit VALID;
	bit READY;
	bit [7:0] DATA;

	`uvm_object_utils_begin(vr_tx)
		`uvm_field_int(VALID);
		`uvm_field_int(READY);
		`uvm_field_int(DATA);
	`uvm_object_utils_end

	// constructor
	function new(string name="vr_tx");
		super.new(name);
	endfunction : new
endclass : vr_tx;
