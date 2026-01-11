module dpram #(
    parameter ADDR_WIDTH = 6,
    parameter DATA_WIDTH = 8)
    (
    input clk,
    input we_a, we_b,
    input [ADDR_WIDTH-1:0] addr_a, addr_b,
    input [DATA_WIDTH-1:0] din_a, din_b,
    output reg [DATA_WIDTH-1:0] dout_a, dout_b
    );
    
    
    reg[DATA_WIDTH-1:0] mem [(1<<ADDR_WIDTH)-1:0];
    
    always@(posedge clk)begin
        if (we_a)begin
            mem[addr_a] <= din_a;
        end
            dout_a <= mem[addr_a];
     end  
          
            
            
    always@(posedge clk )begin
        if (we_b)begin
           mem[addr_b] <= din_b;
         end
           dout_b <= mem[addr_b];
     end
     
     
endmodule   
  
            