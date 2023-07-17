class mem_driver #(mem_pkg::mem_param P) extends  uvm_driver #(mem_pkg :: mem_seq_item mem_seq_item_h);

	`uvm_component_utils(mem_driver)
    // mem config handle
    mem_config mem_cfg ;
	// Constructor
	function new(string name = "mem_driver", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	//get config
	if (!uvm_config_db#(mem_config)::get(this, "", "mem_cfg", mem_cfg)) begin
		`uvm_fatal(get_type_name(), $sformatf("Unable to get mem_config from test"))
	end
endfunction : build_phase

virtual task main_phase(uvm_phase phase);
  mem_seq_item mem_seq_item_h ; 
  super.main_phase(phase);
  forever begin
  	seq_item_port.get_next_item(this.mem_seq_item_h);
  	if (this.mem_cfg.is_active == "UVM_ACTIVE") begin
  		if (this.mem_seq_item.rw_en) begin
  			write_data();
  		end else if (this.mem_seq_item.rd_en)begin
			read_data();
		  end
  	end
  	seq_item_port.finish_item();
  end

endtask : main_phase

	virtual task write_data();
		@(posedge mem_config.vif.clk);
		`uvm_info(get_type_name(), $sformatf("write_data %s",mem_config.sprint()),UVM_DEBUG)
	endtask : write_data

	virtual task	read_data();
		@(posedge mem_config.vif.clk);
		`uvm_info(get_type_name(), $sformatf("read_data %s",mem_config.sprint()),UVM_DEBUG)
	endtask: read_data

endclass : mem_driver