class vr_seq extends uvm_sequence #(vr_tx);
	`uvm_object_utils(vr_seq)

	// declarations
	vr_tx tx;

	// constructor
	function new (string name="vr_seq");
		super.new(name);
	endfunction

	task body();
		mk_tr(0, 8'b0000_0001);
		mk_tr(1, 8'b0000_0001);
	endtask : body

	task mk_tr(bit valid, bit data);
		tx = vr_tx::type_id::create("tx");
            	start_item(tx);
		tx.VALID = valid;
		tx.DATA = data;
		finish_item(tx);
	endtask : mk_tr
endclass : vr_seq
