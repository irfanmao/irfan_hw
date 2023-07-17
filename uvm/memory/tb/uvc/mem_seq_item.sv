class mem_seq_item # (mem_pkg :: mem_param P ) extends  uvm_sequence_item;
  //---------------------------------------
  //data and control fields
  //---------------------------------------
  rand logic [P.AWIDTH - 1:0] addr  ;
  rand logic                  wr_en ;
  rand logic                  rd_en ;
  rand logic [P.DWIDTH - 1:0] wdata ;
       logic [P.DWIDTH - 1:0] rdata ;

  // factory registration
  `uvm_object_utils_begin (mem_seq_item)
  `uvm_field_int(addr , UVM_ALL_ON)
  `uvm_field_int(wr_en, UVM_ALL_ON)
  `uvm_field_int(rd_en, UVM_ALL_ON)
  `uvm_field_int(wdata, UVM_ALL_ON)
  `uvm_field_int(rdata, UVM_ALL_ON)
  `uvm_object_utils_end
/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "mem_seq_item");
		super.new(name);
	endfunction : new
   // constraints
  constraint wr_rd_c { wr_en != rd_en; }; 

endclass : mem_seq_item