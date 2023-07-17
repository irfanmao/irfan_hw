

// import uvm_pkg and uvm_macros
import uvm_pkg::*;

package mem_pkg;	 

struct {
    int  AWIDTH = 8 ;
    int  DWIDTH = 8 ;
	} mem_param;

// include agent files 

	`include "mem_seq_item.sv"
	`include "mem_config.sv"
	`include "mem_sequencer.sv"
	`include "mem_base_sequence.sv"
	`include "mem_driver.sv"
	`include "mem_monitor.sv"
	`include "mem_coverage.sv"
	`include "mem_agent.sv"

endpackage : mem_pkg