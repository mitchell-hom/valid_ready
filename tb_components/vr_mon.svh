class vr_mon extends uvm_monitor;
	`uvm_component_utils(vr_mon)

	// delcarations
	uvm_analysis_port #(vr_tx) mon_ap;
	virtual vr_if vif;

	// constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
		mon_ap = new("mon_ap", this);
	endfunction

	// phases
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// try to retrieve interface
		if (!uvm_config_db#(virtual vr_if)::get(this, "", "vr_if", vif)) begin
			`uvm_fatal("MONITOR_NO_VIF", "Could not retrieve virtual interface in monitor")
		end
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
		vr_tx tx;

		forever begin
			// synchronize 
			@(vif.mon_cb);

			// get data from interface
			tx = vr_tx::type_id::create("tx");
			tx.VALID = vif.mon_cb.VALID;
			tx.READY = vif.mon_cb.READY;
			tx.DATA = vif.mon_cb.DATA;

			// write to analysis port
			mon_ap.write(tx);
		end // forever
	endtask : run_phase
endclass : vr_mon
