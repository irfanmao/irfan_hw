class mem_coverage extends  uvm_subscriber;

	`uvm_component_utils(mem_coverage)
    mem_seq_item mem_seq_item_q [$];
	// Constructor
	function new(string name = "mem_coverage", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		// get config
       if (!uvm_config_db #(mem_config)::get(this, "", "mem_cfg", mem_cfg)) begin
       	`uvm_fatal (get_type_name(), $sformatf("Unable to get mem_config from Test"))
       end
	endfunction : build_phase

   virtual task main_phase(uvm_phase phase);
   	super.main_phase (phase);
   		`uvm_info (get_type_name(), $sformatf("Size of mem_seq_item_q is : %d" , mem_seq_item_q.size()), UVM_LOW)
   endtask : main_phase
   function  write(mem_seq_item mem_seq_item_h);
   	  mem_seq_item_q.push();
   endfunction : write
endclass : mem_coverage