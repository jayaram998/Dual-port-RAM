// Dual Port RAM module design

module dual_port_ram(
  input [7:0] data_a, data_b, //input data
  input [5:0] addr_a, addr_b, //Port A and Port B address
  input we_a, we_b, //write enable for Port A and Port B
  input clk, //clk
  output reg [7:0] q_a, q_b //output data at Port A and Port B
);
  
  reg [7:0] ram [63:0]; //8*64 bit ram

 
  always @ (posedge clk)
    begin
      if(we_a)
        ram[addr_a] <= data_a;
      else
        q_a <= ram[addr_a]; 
    end
  
  always @ (posedge clk)
    begin
      if(we_b)
        ram[addr_b] <= data_b;
      else
        q_b <= ram[addr_b]; 
    end
  
endmodule
