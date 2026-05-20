// sequence detection of pattern "0110"
module seq_detector(
  input clk,rst,
  input x,
  output reg z
);
  parameter s0=0, s1=1, s2=2, s3=3;
  reg [1:0]ps;
  always@(posedge clk or posedge rst)
    begin 
      if(rst)
        ps<=s0;
      else
        begin
          case(ps)
            s0:
              begin
                ps <= x? s0:s1;
              end
            s1:
              begin
                ps <= x? s2:s1;
              end
            s2:
              begin
                ps <= x? s3:s1;
              end
            s3:
              begin
                ps <= x? s0:s1;
              end
          endcase
        end
    end
  always@(ps,x)
    begin
      case(ps)
        s0: z = x? 0:0;
        s1: z = x? 0:0;
        s2: z = x? 0:0;
        s3: z = x? 0:1;
      endcase
    end
endmodule
