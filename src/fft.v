module FFT_R4_16p (
    input wire clk, reset,
    input wire signed [31:0] in_data_real,
    input wire signed [31:0] in_data_im,
    output wire signed [31:0] bf2_output_0_real, bf2_output_1_real, bf2_output_2_real, bf2_output_3_real,
    output wire signed [31:0] bf2_output_0_im, bf2_output_1_im, bf2_output_2_im, bf2_output_3_im

);
    
wire signed [31:0] delay_12_real, delay_8_real, delay_4_real, delay_0_real;
wire signed [31:0] delay_12_im, delay_8_im, delay_4_im, delay_0_im;

wire [1:0] q_real, q_im;

wire signed [31:0] bf1_output_0_real, bf1_output_1_real, bf1_output_2_real, bf1_output_3_real;
wire signed [31:0] bf1_output_0_im, bf1_output_1_im, bf1_output_2_im, bf1_output_3_im;

wire signed [31:0] comm2_output_0_real, comm2_output_1_real, comm2_output_2_real, comm2_output_3_real;
wire signed [31:0] comm2_output_0_im, comm2_output_1_im, comm2_output_2_im, comm2_output_3_im;

wire [1:0] mux_2_out_real, mux_2_out_im;

signalSelect s1(in_data_real, clk, reset, delay_12_real, delay_8_real, delay_4_real, delay_0_real, q_real);
signalSelect s2(in_data_im, clk, reset, delay_12_im, delay_8_im, delay_4_im, delay_0_im, q_im);    
                                                                                                                                                                                                                                                                                                                                         
BUTTERFLY_STAGE_1 BF1(q_real, delay_12_real, delay_8_real, delay_4_real, delay_0_real, 
delay_12_im, delay_8_im, delay_4_im, delay_0_im, 
bf1_output_0_real, bf1_output_1_real, bf1_output_2_real, bf1_output_3_real, 
bf1_output_0_im, bf1_output_1_im, bf1_output_2_im, bf1_output_3_im);

commutStage2 COMM2_real(clk, reset, q_real, 
bf1_output_0_real, bf1_output_1_real, bf1_output_2_real, bf1_output_3_real, 
comm2_output_0_real, comm2_output_1_real, comm2_output_2_real, comm2_output_3_real, mux_2_out_real );
commutStage2  COMM2_im(clk, reset, q_real, 
bf1_output_0_im, bf1_output_1_im, bf1_output_2_im, bf1_output_3_im, 
comm2_output_0_im, comm2_output_1_im, comm2_output_2_im, comm2_output_3_im, mux_2_out_im);

BUTTERFLY_STAGE_2 BF2 (mux_2_out_real, comm2_output_0_real, comm2_output_1_real, comm2_output_2_real, comm2_output_3_real, 
comm2_output_0_im, comm2_output_1_im, comm2_output_2_im, comm2_output_3_im,
bf2_output_0_real, bf2_output_1_real, bf2_output_2_real, bf2_output_3_real, 
bf2_output_0_im, bf2_output_1_im, bf2_output_2_im, bf2_output_3_im);

endmodule