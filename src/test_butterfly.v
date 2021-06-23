`timescale 1ns/1ns;

module TBF_1;

reg signed [31:0] in_data_real;
reg signed [31:0] in_data_im;
reg clk, reset;

wire signed [31:0] delay_12_real, delay_8_real, delay_4_real, delay_0_real;
wire signed [31:0] delay_12_im, delay_8_im, delay_4_im, delay_0_im;

wire signed [31:0] output_0_real, output_1_real, output_2_real, output_3_real;
wire signed [31:0] output_0_im, output_1_im, output_2_im, output_3_im;

wire [1:0] q_real, q_im;

signalSelect s1(in_data_real, clk, reset, delay_12_real, delay_8_real, delay_4_real, delay_0_real, q_real);
signalSelect s2(in_data_im, clk, reset, delay_12_im, delay_8_im, delay_4_im, delay_0_im, q_im);

BUTTERFLY_STAGE_1 bf1(q_real, delay_12_real, delay_8_real, delay_4_real, delay_0_real, delay_12_im, delay_8_im, delay_4_im, delay_0_im, output_0_real, output_1_real, output_2_real, output_3_real, output_0_im, output_1_im, output_2_im, output_3_im);



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
    #45 in_data_real <= 32'd0;
    #100 in_data_real <=32'd1;
    #100 in_data_real <=32'd2;
    #100 in_data_real <=32'd3;
    #100 in_data_real <=32'd4;
    #100 in_data_real <=32'd5;
    #100 in_data_real <=32'd6;
    #100 in_data_real <=32'd7;
    #100 in_data_real <=32'd8;
    #100 in_data_real <=32'd9;
    #100 in_data_real <=32'd10;
    #100 in_data_real <=32'd11;
    #100 in_data_real <=32'd12;
    #100 in_data_real <=32'd13;
    #100 in_data_real <=32'd14;
    #100 in_data_real <=32'd15;
end

initial begin
    //in_data <= 32'd99;
    #45 in_data_im <= 32'd0;
    #100 in_data_im <=32'd1;
    #100 in_data_im <=32'd2;
    #100 in_data_im <=32'd3;
    #100 in_data_im <=32'd4;
    #100 in_data_im <=32'd5;
    #100 in_data_im <=32'd6;
    #100 in_data_im <=32'd7;
    #100 in_data_im <=32'd8;
    #100 in_data_im <=32'd9;
    #100 in_data_im <=32'd10;
    #100 in_data_im <=32'd11;
    #100 in_data_im <=32'd12;
    #100 in_data_im <=32'd13;
    #100 in_data_im <=32'd14;
    #100 in_data_im <=32'd15;
end

endmodule