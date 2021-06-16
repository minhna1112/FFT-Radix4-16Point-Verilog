`timescale 1ns/1ns;

module TSS;

reg signed [31:0] in_data;
reg clk, reset;

wire signed [31:0] delay_12, delay_8, delay_4, delay_0;

signalSelect s1(in_data, clk, reset, delay_12, delay_8, delay_4, delay_0);

initial begin
    clk <=1;
    forever #50 clk <= ~clk;
end

initial begin
    reset <=1;
    #25 reset <=0;
end

initial begin
    //in_data <= 32'd99;
    #45 in_data <= 32'd0;
    #100 in_data <=32'd1;
    #100 in_data <=32'd2;
    #100 in_data <=32'd3;
    #100 in_data <=32'd4;
    #100 in_data <=32'd5;
    #100 in_data <=32'd6;
    #100 in_data <=32'd7;
    #100 in_data <=32'd8;
    #100 in_data <=32'd9;
    #100 in_data <=32'd10;
    #100 in_data <=32'd11;
    #100 in_data <=32'd12;
    #100 in_data <=32'd13;
    #100 in_data <=32'd14;
    #100 in_data <=32'd15;
end

endmodule