class vr_agent extends uvm_agent;
	`uvm_component_utils(vr_agent);

	// declarations
	vr_drv Idrv;
	vr_mon Imon;
	uvm_analysis_port #(vr_tx) mon_ap;
	uvm_sequencer #(vr_tx) Iseq;

	// constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	// phases
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		// instantiate
		mon_ap = new("mon_ap", this);
		Idrv = vr_drv::type_id::create("Idrv", this);
		Imon = vr_mon::type_id::create("Imon", this);
		Isqr  = uvm_sequencer#(vr_tx)::type_id::create("Isqr", this);
	endfunction : build_phase	

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
      
		// connect ports
		Idrv.seq_item_port.connect(Isqr.seq_item_export);
		Imon.mon_ap.connect(mon_ap);
	endfunction : connect_phase
endclass : vr_agent
