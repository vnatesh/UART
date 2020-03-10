module top_level(   input               clk,
                    input [7:0]        sw,
                    input               btnC,
                    input               btnD,
                    input               RsRx,
                    output logic RsTx,
                    output logic [15:0] led,
                    output logic [6:0] seg,
                    output logic [3:0] an, 
                    output logic dp
    );
    
    logic               clean;
    logic               old_clean;
    assign led = sw;
    // assign RsTx = 0; //just assign this to be 0
    
    always_ff @(posedge clk)begin
        old_clean <= clean;  //for rising edge detection
    end
    
    debounce my_deb(.clk_in(clk), 
                    .rst_in(btnD),
                    .bouncey_in(btnC), 
                    .clean_out(clean));
    
    serial_tx my_tx(.clk_in(clk), 
                    .rst_in(btnD), 
                    .trigger_in(clean & ~old_clean),
                    .val_in(sw),
                    .data_out(RsTx));

    serial_rx my_rx(.clk_in(clk), 
                    .rst_in(btnD), 
                    .data_in(RsRx),
                    .seg(seg),
                    .an(an),
                    .dp(dp));
       
endmodule//top_level

