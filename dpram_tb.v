`timescale 1ns / 1ps

module dpram_tb;

    parameter ADDR_WIDTH =6;
    parameter DATA_WIDTH = 8;
    
    reg clk;
    reg we_a, we_b;
    reg [ADDR_WIDTH-1:0] addr_a, addr_b;
    reg [DATA_WIDTH-1:0] din_a , din_b;
    wire [DATA_WIDTH-1:0] dout_a, dout_b;
    
    
    dpram #(ADDR_WIDTH, DATA_WIDTH) uut (.clk(clk),
    .we_a(we_a),.we_b(we_b),.addr_a(addr_a),.addr_b(addr_b),
    .din_a(din_a),.din_b(din_b),.dout_a(dout_a),.dout_b(dout_b));
    
// clock generation (100 MHz)
    always #5 clk = ~clk;

    initial begin
    
    clk=0;
    we_a=0; addr_a=0; din_a=0;
    we_b=0; addr_b=0; din_b=0;
    
  #20;
  
  
// write data using  PORT- A

    @(posedge clk );
    addr_a = 6'd10; din_a = 8'hAA; we_a=1;     // Port-A writing

// write data in Port B , read from Port A
    
    @(posedge clk)
    we_a=0;                                      // Port -A in read mode
    addr_b = 6'd20; din_b = 8'hBB; we_b=1;      // Port-B writing
    
//readig from both Port in the diff location

    @(posedge clk)
    we_b=0;
    addr_a= 6'd10;
    addr_b= 6'd20;
    
 #10; 
// Wait for output to stabilize
        $display("Time %t: Reading Port A (Addr 10) = %h, Port B (Addr 20) = %h", $time, dout_a, dout_b);

// reading from both port at the same location

    @(posedge clk)
    addr_a= 6'd10;
    addr_b= 6'd10;
    
 #10;
 
 $display("Time %t: Both Ports reading Address 10: dout_a=%h, dout_b=%h", $time, dout_a, dout_b);


// Case: Simultaneous Write to same location
    @(posedge clk);
    addr_a <= 6'd30; din_a <= 8'h55; we_a <= 1;
    addr_b <= 6'd30; din_b <= 8'h65; we_b <= 1;

    @(posedge clk);
    we_a <= 0; we_b <= 0; // Stop writing
    



#50;
$finish;

 end 
endmodule



