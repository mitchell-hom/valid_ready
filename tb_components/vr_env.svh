class vr_env extends uvm_env;
	`uvm_component_utils(vr_env);

	// declarations
	vr_agent Iagent;

	// constructor
	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	// phases
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		Iagent = vr_agent::type_id::create("Iagent", this);
	endfunction : build_phase

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction : connect_phase
endclass : vr_env
