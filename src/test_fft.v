module TB_FFT;

reg signed [31:0] in_data_real;
reg signed [31:0] in_data_im;
reg clk, reset;

wire signed [31:0] bf2_output_0_real, bf2_output_1_real, bf2_output_2_real, bf2_output_3_real;
wire signed [31:0] bf2_output_0_im, bf2_output_1_im, bf2_output_2_im, bf2_output_3_im;

FFT_R4_16p F1(.clk(clk), .reset(reset), 
.in_data_real(in_data_real), .in_data_im(in_data_im),
.bf2_output_0_real(bf2_output_0_real),
.bf2_output_1_real(bf2_output_1_real),
.bf2_output_2_real(bf2_output_2_real),
.bf2_output_3_real(bf2_output_3_real),
.bf2_output_0_im(bf2_output_0_im),
.bf2_output_1_im(bf2_output_1_im),
.bf2_output_2_im(bf2_output_2_im),
.bf2_output_3_im(bf2_output_3_im));

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