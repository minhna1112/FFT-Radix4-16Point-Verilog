`timescale 1ns/1ns;

module TLC_1;

reg signed [31:0] in_data_real;
reg signed [31:0] in_data_im;
reg clk, reset;

wire signed [31:0] delay_12_real, delay_8_real, delay_4_real, delay_0_real;
wire signed [31:0] delay_12_im, delay_8_im, delay_4_im, delay_0_im;

wire signed [31:0] output_0_real, output_1_real, output_2_real, output_3_real;
wire signed [31:0] output_0_im, output_1_im, output_2_im, output_3_im;

wire [1:0] q_real, q_im;

signalSelect s1(in_data_real, clk, reset, delay_12_real, delay_8_real, delay_4_real, delay_0_real, q_real);
signalSelect s2(in_data_im, clk, reset, delay_12_im, delay_8_im, delay_4_im, delay_0_im, q_im);`

linearCombTypeA lcA(delay_12_real, delay_8_real, delay_4_real, delay_0_real, delay_12_im, delay_8_im, delay_4_im, delay_0_im, output_0_real, output_0_im);
linearCombTypeB lcB(delay_12_real, delay_8_real, delay_4_real, delay_0_real, delay_12_im, delay_8_im, delay_4_im, delay_0_im, output_1_real, output_1_im);
linearCombTypeC lcC(delay_12_real, delay_8_real, delay_4_real, delay_0_real, delay_12_im, delay_8_im, delay_4_im, delay_0_im, output_2_real, output_2_im);
linearCombTypeD lcD(delay_12_real, delay_8_real, delay_4_real, delay_0_real, delay_12_im, delay_8_im, delay_4_im, delay_0_im, output_3_real, output_3_im);    
                                                                                                                                                                                                                                                                                                                                         


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
    #45 in_data_real <= 32'b0;
    #100 in_data_real <=32'b00111111100000000000000000000000;
    #100 in_data_real <=32'b01000000000000000000000000000000;
    #100 in_data_real <=32'b01000000010000000000000000000000;
    #100 in_data_real <=32'b01000000100000000000000000000000;
    #100 in_data_real <=32'b01000000101000000000000000000000;
    #100 in_data_real <=32'b01000000110000000000000000000000;
    #100 in_data_real <=32'b01000000111000000000000000000000;
    #100 in_data_real <=32'b01000001000000000000000000000000;
    #100 in_data_real <=32'b01000001000100000000000000000000;
    #100 in_data_real <=32'b01000001001000000000000000000000;
    #100 in_data_real <=32'b01000001001100000000000000000000;
    #100 in_data_real <=32'b01000001010000000000000000000000;
    #100 in_data_real <=32'b01000001010100000000000000000000;
    #100 in_data_real <=32'b01000001011000000000000000000000;
    #100 in_data_real <=32'b01000001011100000000000000000000;
end

initial begin
    //in_data <= 32'd99;
    #45 in_data_im <= 32'b0;
    #100 in_data_im <=32'b00111111100000000000000000000000;
    #100 in_data_im <=32'b01000000000000000000000000000000;
    #100 in_data_im <=32'b01000000010000000000000000000000;
    #100 in_data_im <=32'b01000000100000000000000000000000;
    #100 in_data_im <=32'b01000000101000000000000000000000;
    #100 in_data_im <=32'b01000000110000000000000000000000;
    #100 in_data_im <=32'b01000000111000000000000000000000;
    #100 in_data_im <=32'b01000001000000000000000000000000;
    #100 in_data_im <=32'b01000001000100000000000000000000;
    #100 in_data_im <=32'b01000001001000000000000000000000;
    #100 in_data_im <=32'b01000001001100000000000000000000;
    #100 in_data_im <=32'b01000001010000000000000000000000;
    #100 in_data_im <=32'b01000001010100000000000000000000;
    #100 in_data_im <=32'b01000001011000000000000000000000;
    #100 in_data_im <=32'b01000001011100000000000000000000;
end

endmodule