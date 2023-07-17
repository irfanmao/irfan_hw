 module memory #(mem_pkg::mem_param P)(
 	input                        clk   ,    // Clock
 	input                        rst   ,  // Asynchronous reset active low
    input       [P.AWIDTH - 1:0] addr  ,
    input                        wr_en ,
    input                        rd_en ,
    input       [P.DWIDTH - 1:0] wdata ,
    output reg  [P.DWIDTH - 1:0] rdata 
 );

    reg [P.DWIDTH - 1:0] mem_reg [2**P.AWIDTH];
 always_ff @(posedge clk or negedge rst) begin
 	if(~rst) begin
      for (int i = 0; i < 2**P.AWIDTH; i++) begin
 	  	mem_reg [i]   <= P.DWIDTH'd0 ;
 	  end
 	   	rdata         <= P.DWIDTH'd0 ;
 	end else if (wr_en) begin
 		mem_reg[addr] <= wdata       ;
 		rdata         <= P.DWIDTH'd0 ;
 	end else if (rd_en) begin
        rdata         <= mem_reg[addr] ;
 	end begin
 		 mem_reg <= mem_reg ;
 	end
 end
 endmodule : memory