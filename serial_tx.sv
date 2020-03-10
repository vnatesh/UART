module serial_tx(   input           clk_in,
                    input           rst_in,
                    input           trigger_in,
                    input [7:0]     val_in,
                    output logic    data_out);
    
    parameter DIVISOR = 868; //treat this like a constant!!
    parameter DATA_WIDTH = 8;
    parameter START_BIT = 0;
    parameter STOP_BIT = 1;
    parameter IND_WIDTH = $clog2(DATA_WIDTH);
    parameter COUNT_WIDTH = $clog2(DIVISOR);

    // states
    parameter S_WAIT = 0;
    parameter S_START = 1;
    parameter S_TRANSMIT = 2;
    parameter S_STOP = 3;

    logic [COUNT_WIDTH-1 : 0] count;
    logic [IND_WIDTH-1 : 0] ind;
    logic [DATA_WIDTH-1 : 0] shift_reg; // temporarily store input (arrives in 8 parallel bit lanes from sw[7:0])
                                        // in a shift register so we may send each of the 8 bits one
                                        // at a time (in serial). Shift reg acts as a buffer (good practice)
    logic [1:0] state;
    logic out;

    assign data_out = out;

    always_ff @(posedge clk_in) begin
        if(rst_in) begin
            state <= S_WAIT;
            out <= 1;
            ind <= 0;
            count <= 0;
            shift_reg <= 0;
      
        end else begin

            if(count < DIVISOR) begin
                count <= count + 1;
            
            end else begin

                case(state)

                    S_TRANSMIT : begin
                        out <= shift_reg[ind];
                        count <= 0;

                        if(ind == DATA_WIDTH - 1) begin
                            state <= S_STOP;
                        end else begin
                            ind <= ind + 1;
                        end
                    end

                    S_STOP : begin
                        state <= S_WAIT;
                        out <= STOP_BIT;
                        count <= 0;
                    end

                    S_WAIT : begin
                        if(trigger_in) begin
                            state <= S_START;
                            count <= 0;
                        end
                    end

                    S_START : begin
                        state <= S_TRANSMIT;
                        out <= START_BIT;
                        ind <= 0;
                        count <= 0;
                        shift_reg <= val_in;
                    end

                   default : begin
                      state <= S_WAIT;
                   end

                endcase
            end
        end
    end

endmodule