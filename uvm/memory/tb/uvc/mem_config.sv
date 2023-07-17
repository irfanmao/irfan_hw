class mem_config#(mem_pkg::mem_param P) extends  uvm_object;

	bit mem_cov_en ;
	uvm_active_passive_enum is_active ;

	// handle to interface

	virtual mem_if#(.AWIDTH(P.AWIDTH), .DWIDTH(P.DWIDTH)) mem_vif;

	`uvm_object_utils_begin (mem_config)
	`uvm_object_utils_end

	// Constructor
	function new(string name = "mem_config");
		super.new(name);
	endfunction : new

endclass : mem_config