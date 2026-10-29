class vr_drv extends uvm_driver #(vr_tx);
	`uvm_component_utils(vr_drv)

	// constructor
  	function new(string name, uvm_component parent); 
		super.new(name, parent);
	endfunction

	// phases
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// try to retrieve virtual interface; if not, throw error
		if (!uvm_config_db#(virtual vr_if)::get(this, "", "vr_if", vif)) begin
			`uvm_fatal("DRIVER_NO_VIF", "Could not retrieve virtual interface in driver")
		end
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
		vr_tx tx;

		forever begin
			// synchronize
			@(vif.drv_cb);

			seq_item_port.get_next_item(tx);
			vif.VALID <= tx.VALID;
			vif.DATA <= tx.DATA
			seq_item_port.item_done();
		end // forever
	endtask : run_phase 
endclass : vr_drv
