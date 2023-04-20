module sipo(clock, reset, in_sipo, out_sipo);
  input clock, reset;
  input reg in_sipo;
  output reg [7:0] out_sipo;
  reg [7:0] temp;
  always @(posedge clock)
    begin
      if(reset == 1) begin
        temp <= 8'b0;         //temp gets cleared of the input data
      end
      else begin
        out_sipo <= temp;     
        temp = {temp[6:0], in_sipo};  //temp gets MSB first and shifts the data in it to left 
      end
    end        
endmodule
