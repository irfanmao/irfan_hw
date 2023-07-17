class mem_agent #(mem_pkg :: mem_param P) extends  uvm_agent;
// factory registration 
 `uvm_component_utils(mem_agent)
// agent components handle 
 mem_config     mem_cfg        ;
 mem_sequencer  mem_vseqr;     
 mem_monitor    mem_mon  ;
 mem_driver     mem_drv   ;
 mem_coverage   mem_cov ; 

	// Constructor
	function new(string name = "mem_agent", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	// build phase function 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase)
		this.mem_mon  = mem_monitor   :: type_id :: create( "mem_mon   " , this );
		this.mem_cov  = mem_coverage  :: type_id :: create( "mem_cov   " , this );
        this.mem_csqr = mem_sequencer :: type_id :: create( "mem_csqr  " , this ); 
        this.mem_drv  = mem_driver    :: type_id :: create( "mem_drv   " , this );
	// get config from test
	if (!uvm_config_db#(mem_config   ):: get(this, "", "mem_cfg", mem_cfg)) begin
		`uvm_fatal(get_type_name(), $sformatf("Unable to get mem_cfg from test"))
	end
	endfunction : build_phase
	// connect phase
    function void connect_phase(uvm_phase phase);
    	super.connect_phase(phase);
    	if (this.mem_cfg.mem_uvc_type == "UVM_ACTIVE") begin // TODO : check what to do for back pressure
    		this.mem_drv.seq_item_port.connect(this.mem_vseqr.seq_item_export);
    	end	
    endfunction : connect_phase
endclass : mem_agent