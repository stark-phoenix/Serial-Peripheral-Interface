module piso(clock, reset, in_piso, out_piso);
  input clock, reset;
  input [7:0] in_piso;
  output reg out_piso;
  reg [7:0] temp;
  always @(posedge clock)
    begin
      if(reset == 1) begin
        temp <= in_piso;     //reset sets the temp back to input
      end
      else begin
        out_piso = temp[7];   //out_piso shows the MSB of temp variable        
        temp <= {temp[6:0], 1'd0};   //temp is left shifted by 1
      end
    end
endmodule
