class mem_base_sequence #(mem_package::mem_param P) extends  uvm_sequence#(mem_pkg::mem_seq_item item);

	`uvm_component_utils(mem_base_sequence)

	// Constructor
	function new(string name = "mem_base_sequence");
		super.new(name);
	endfunction : new
  virtual task body();
  mem_seq_item item;
  this.item = mem_seq_item :: type_id :: create("item", this);

  for (int i = 0; i < this.send_item; i++) begin
  	mem_seq_item.start_item();
  	if (!this.mem_seq_item.randamize()) begin
  		`uvm_fatal (get_type_name(), $sformatf("Unable the randamize the sequence item"))
  	end
  	mem_seq_item.finish_item();
  end
  	
  endtask : body

endclass : mem_base_sequence