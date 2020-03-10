`timescale 1ns / 1ps
module serial_rx_tb;
    logic clk;
    logic rst;
    logic data_in;
    logic[6:0] seg;
    logic [3:0] an;
    logic dp;

    serial_rx my_serial(    .clk_in(clk),
                            .rst_in(rst),
                            .data_in(data_in),
                            .seg(seg),
                            .an(an),
                            .dp(dp));
   
    always begin
        #0.5;
        clk = !clk;
     end

     initial begin
        clk = 0;
        rst = 0;
        data_in = 0;
        #868;
        data_in = 0;
        #868;
        data_in = 1;
        #868;
        data_in = 0;
        #868;
        data_in = 1;
        #868;
        data_in = 1;
        #868;
        data_in = 1;
        #868;
        data_in = 1;
        #868;
        data_in = 0;
        #868;
        data_in = 1;
        #500;  //as you run it...should see 10101010 show up ont eh data out line
     end
endmodule
