module spi_master(
  input rstn,
  input sys_clk,
  input [reg_width-1:0] d_out,
  output reg [reg_width-1:0] d_in,
  output wire miso,
  input wire mosi,
  output wire spi_clk,
  input [counter_width:0] t_size,
  input t_start);
  wire cs = 1;
  wire mosi_d;
  reg [2:0] state;
  finite_state_machine fsm(
    .rstn(rstn),
    .sys_clk(sys_clk),
    .t_start(t_start),
    .d_in(d_out),
    .t_size(t_size),
    .d_out(d_in),
    .miso(miso),
    .mosi(mosi_d),
    .spi_clk(spi_clk),
    .cs(cs)
  )
  assign mosi = mosi_d;
endmodule
