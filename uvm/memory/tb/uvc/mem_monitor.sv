class mem_monitor #(mem_pkg::mem_param P) extends  uvm_monitor;

	`uvm_component_utils(mem_monitor)

	// Constructor
	function new(string name = "mem_monitor", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

  function void build_phase(uvm_phase phase);
   super.build(phase);  	
   // get config
   if (!uvm_config_db #(mem_config ::get(this, "", "mem_cfg",  mem_cfg))) begin
   	`uvm_fatal(get_type_name(), $sformatf("Unable to get mem_config from test"))
   end
  endfunction : build_phase

  virtual task main_phase(uvm_phase phase);
  	   mem_seq_item mem_seq_item_h
  	   super.main_phase (phase);
       forever begin
       	   sample_data ();
       end
  endtask : main_phase

  virtual task sample_data();
     @(posedge mem_config .vif.clk);
     `uvm_info(get_type_name(), $sformatf("write_data: %s", mem_config .sprint()), UVM_DEBUG)  	
  endtask : sample_data

endclass : mem_monitor