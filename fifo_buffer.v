module fifo_buffer( clk, dataIn, read, write, enable, dataOut, reset, empty, full); 
input  clk, read, write, enable, reset;
output  empty, full;
input  [31:0]    dataIn;
output reg [31:0] dataOut; 
reg [2:0] Count = 0; 
reg [31:0] FIFO [0:7]; 
reg [2:0] readCounter = 0, writeCounter = 0; 
assign empty = (Count==0)? 1'b1:1'b0; 
assign full = (Count==8)? 1'b1:1'b0; 
always @ (posedge Clk) 
begin 
 if (enable==0); 
 else begin 
  if (reset) begin 
   readCounter = 0; 
   writeCounter = 0; 
  end 
  else if (read ==1'b1 && Count!=0) begin 
   dataOut  = FIFO[readCounter]; 
   readCounter = readCounter+1; 
  end 
  else if (write==1'b1 && Count<8) begin
   FIFO[writeCounter]  = dataIn; 
   writeCounter  = writeCounter+1; 
  end 
  else; 
 end 
 if (writeCounter==8) 
  writeCounter=0; 
 else if (readCounter==8) 
  readCounter=0; 
 else;
 if (readCounter > writeCounter) begin 
  Count=readCounter-writeCounter; 
 end 
 else if (writeCounter > readCounter) 
  Count=writeCounter-readCounter; 
 else;
end 
endmodule
