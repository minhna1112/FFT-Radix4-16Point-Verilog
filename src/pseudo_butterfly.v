module PSEU_BUTTERFLY_STAGE_1 #(
    parameter para0000   = 32'b00000000000000000000000000000000, //sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
    parameter para3827   = 32'b00111110110000111111000101000001,  //sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
    parameter para3827_n = 32'b10111110110000111111000101000001, // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8) = sin(9pi/8)
    parameter para7071   = 32'b00111111001101010000010010000001,  //sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
    parameter para7071_n = 32'b10111111001101010000010010000001, // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
    parameter para9239   = 32'b00111111011011101101001010001001, //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
    parameter para9239_n = 32'b10111111011011101101001010001001, // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8) = cos(9pi/8)
    parameter para0001   = 32'b00111111100000000000000000000000, //  1.0000. sin(4pi/8) = sin(4pi/8) = cos(0pi/8) = - cos(8pi/8)
    parameter para0001_n = 32'b10111111100000000000000000000000 // -1.0000.
) (
    input wire[1:0] mux_1_out,
    input wire signed [31:0] input_0_real,
    input wire signed [31:0] input_1_real,
    input wire signed [31:0] input_2_real,
    input wire signed [31:0] input_3_real,
    
    input wire signed [31:0] input_0_im,
    input wire signed [31:0] input_1_im,
    input wire signed [31:0] input_2_im,
    input wire signed [31:0] input_3_im,
    
    output wire signed [31:0] output_0_real,
    output wire signed [31:0] output_1_real,
    output wire signed [31:0] output_2_real,
    output wire signed [31:0] output_3_real,
    
    output wire signed [31:0] output_0_im,
    output wire signed [31:0] output_1_im,
    output wire signed [31:0] output_2_im,
    output wire signed [31:0] output_3_im

);

assign output_0_real = input_0_real;
assign output_1_real = input_1_real;
assign output_2_real = input_2_real;
assign output_3_real = input_3_real;

assign output_0_im = input_0_im;
assign output_1_im = input_1_im;
assign output_2_im = input_2_im;
assign output_3_im = input_3_im;

endmodule