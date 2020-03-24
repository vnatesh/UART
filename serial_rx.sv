module serial_rx(   input           clk_in,
                    input           rst_in,
                    input            data_in,
                    output logic [6:0] seg,
                    output logic [3:0] an, 
                    output logic dp);
    
    parameter DIVISOR = 10000; //treat this like a constant!!
    parameter DATA_WIDTH = 8;
    parameter START_BIT = 0;
    parameter STOP_BIT = 1;
    parameter IND_WIDTH = $clog2(DATA_WIDTH);
    parameter COUNT_WIDTH = $clog2(DIVISOR);

    parameter HALF_PULSE = DIVISOR/2; // 434

    // states
    parameter S_WAIT = 0;
    parameter S_START = 1;
    parameter S_RECEIVE = 2;
    parameter S_STOP = 3;

    logic [COUNT_WIDTH-1 : 0] count;
    logic [IND_WIDTH-1 : 0] ind;
    logic [DATA_WIDTH-1 : 0] shift_reg; // temporarily store output (arrives bit by bit in serial)
                                        // in a shift register so we may send all 8 bits at one
                                        // time (in 8 parallel bit lanes to the seven_seg). Shift reg acts as a buffer (good practice)
    logic [1:0] state;
    logic [DATA_WIDTH-1 : 0] synch_reg; // synchronization register to handle metastability...schematic shows that it
                                        // seems to add an extra RAMB18E1 block which acts as a buffer after the shift reg.

    ascii_to_seven_seg my_converter( 
                    .ascii_in(synch_reg), 
                    .hex_out(seg),
                    .an(an),
                    .dp(dp));


    always_ff @(posedge clk_in) begin
       synch_reg <= shift_reg;
    end


    always_ff @(posedge clk_in) begin
        if(rst_in) begin
            state <= S_WAIT;
            ind <= 0;
            count <= 0;
            shift_reg <= 0;
      
        end else begin

            case(state)

                S_STOP : begin
                    if(count < DIVISOR) begin
                        count <= count + 1;
                    end else begin
                        state <= S_WAIT;
                        count <= 0;
                    end
                end

                S_RECEIVE : begin
                    if(count < DIVISOR) begin
                        count <= count + 1;
                    end else begin
                        shift_reg[ind] <= data_in;
                        count <= 0;
                        
                        if(ind == DATA_WIDTH - 1) begin
                            state <= S_STOP;
                        end else begin
                            ind <= ind + 1;
                        end
                    end
                end

                S_WAIT : begin
                    if(data_in == 0) begin
                        if(count < HALF_PULSE) begin
                            count <= count + 1;
                        end else begin
                            state <= S_RECEIVE;
                            ind <= 0;
                            count <= 0;
                        end
                    end
                end

               default : begin
                  state <= S_WAIT;
               end

            endcase
        end
    end

endmodule
