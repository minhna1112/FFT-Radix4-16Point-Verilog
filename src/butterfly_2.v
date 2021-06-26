module BUTTERFLY_STAGE_2  (
    input wire[1:0] mux_2_out,
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
   //Linear combinations
  wire signed [31:0] lc_0_real, lc_0_imag;
  wire signed [31:0] lc_1_real, lc_1_imag;
  wire signed [31:0] lc_2_real, lc_2_imag;
  wire signed [31:0] lc_3_real, lc_3_imag;

  linearCombTypeA lcA (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_0_real, lc_0_imag);

  linearCombTypeB lcB (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_1_real, lc_1_imag);

  linearCombTypeC lcC (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_2_real, lc_2_imag);

  linearCombTypeD lcD (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_3_real, lc_3_imag);

  assign output_0_real = lc_0_real;
  assign output_1_real = lc_1_real;
  assign output_2_real = lc_2_real;
  assign output_3_real = lc_3_real;

  assign output_0_im = lc_0_imag;
  assign output_1_im = lc_1_imag;
  assign output_2_im = lc_2_imag;
  assign output_3_im = lc_3_imag;
  
endmodule