module finite_state_machine( input rstn,
  input sys_clk,
  input t_start, 
  input [reg_width-1:0] d_in,
  input [counter_width:0] t_size,
  output reg [reg_width-1:0] d_out,
  input miso, 
  output wire mosi,
  output wire spi_clk,
  output reg cs);
   reg [reg_width-1:0] mosi_d;
    reg [reg_width-1:0] miso_d;
    reg [counter_width:0] count;
    reg [2:0] state;
  parameter reg_width = 8;
  parameter counter_width = $clog2(reg_width);
  parameter reset = 0, idle = 1, load = 2, transact = 3, unload = 4;
  always @(state)
begin
    case (state)
        reset:
        begin
            d_out <= 0;
            miso_d <= 0;
            mosi_d <= 0;
            count <= 0;
            cs <= 1;
        end
        idle:
        begin
            d_out <= d_out;
            miso_d <= 0;
            mosi_d <= 0;
            count <= 0;
            cs <= 1;
        end
        load:
        begin
            d_out <= d_out;
            miso_d <= 0;
            mosi_d <= d_in;
            count <= t_size;
            cs <= 0;
        end
        transact:
        begin
            cs <= 0;
        end
        unload:
        begin
            d_out <= miso_d;
            miso_d <= 0;
            mosi_d <= 0;
            count <= count;
            cs <= 0;
        end

        default:
            state = reset;
    endcase
end
  
  always @(posedge sys_clk)
begin
    if (!rstn)
        state = reset;
    else
        case (state)
            reset:
                state = idle;
            idle:
                if (t_start)
                    state = load;
            load:
                if (count != 0)
                    state = transact;
                else
                    state = reset;
            transact:
                if (count != 0)
                    state = transact;
                else
                    state = unload;
            unload:
                if (t_start)
                    state = load;
                else
                    state = idle;
        endcase
end
 
