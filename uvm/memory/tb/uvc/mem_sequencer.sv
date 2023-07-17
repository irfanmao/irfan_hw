class mem_sequencer extends  uvm_sequencer(mem_seq_item);
 // factory registeration  
	`uvm_component_utils(mem_sequencer)

	// Constructor
	function new(string name = "mem_sequencer", uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

	// build phase

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);	
	endfunction : build_phase

endclass : mem_sequencer