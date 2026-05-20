`timescale 1ns/1ps
module tb_seq_detector;
  reg clk,rst,x;
  wire z;
  
  seq_detector uut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .z(z)
  );
  
  always #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("baaka.vcd");
      $dumpvars(0,tb_seq_detector);
      $monitor($time,"x=%b,z=%b",x,z);
      clk = 1'b0;
      rst = 1'b1;
      #15 rst = 1'b0;
    end
  initial 
    begin
      //clk = 1'b0;
      //rst = 1'b1;
      //#5 rst = 1'b0;
      #12 x=0; #10 x=1; #10 x=0; #10 x=1; #10 x=1; #10 x=0; #10 x=1; #10 x=1;
      #10 x=0; #10 x=1; #10 x=0;
      #10 $finish;
    end
endmodule
