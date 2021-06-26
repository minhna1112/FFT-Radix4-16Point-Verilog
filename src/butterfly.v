module BUTTERFLY_STAGE_1 #(
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

  reg  signed [31:0]  phase_factor1_real;  // For input B
  reg  signed [31:0]  phase_factor1_imag;  // For input B
  reg  signed [31:0]  phase_factor2_real;  // For input C
  reg  signed [31:0]  phase_factor2_imag;  // For input C
  reg  signed [31:0]  phase_factor3_real;  // For input D
  reg  signed [31:0]  phase_factor3_imag;  // For input D

    //Assign real phase factor 1, 2, 3
  always @(mux_1_out) begin
      case (mux_1_out)
        2'b00:  phase_factor1_real = para0001;
        2'b01:  phase_factor1_real = para9239;
        2'b10:  phase_factor1_real = para7071;
        2'b11:  phase_factor1_real = para3827;
      endcase
  end

    always @(mux_1_out) begin
      case (mux_1_out)
        2'b00:  phase_factor2_real = para0001;
        2'b01:  phase_factor2_real = para7071;
        2'b10:  phase_factor2_real = para0000;
        2'b11:  phase_factor2_real = para7071_n;
      endcase
  end

    always @(mux_1_out) begin
      case (mux_1_out)
        2'b00:  phase_factor3_real = para0001;
        2'b01:  phase_factor3_real = para3827;
        2'b10:  phase_factor3_real = para7071_n;
        2'b11:  phase_factor3_real = para9239_n;
      endcase
  end

    //Assign imag phase factor 1,2,3
    always @(mux_1_out) begin
      case (mux_1_out)
        2'b00:  phase_factor1_imag = para0000;
        2'b01:  phase_factor1_imag = para3827;
        2'b10:  phase_factor1_imag = para7071;
        2'b11:  phase_factor1_imag = para9239;
      endcase
  end

    always @(mux_1_out) begin
      case (mux_1_out)
        2'b00:  phase_factor2_imag = para0000;
        2'b01:  phase_factor2_imag = para7071;
        2'b10:  phase_factor2_imag = para0001;
        2'b11:  phase_factor2_imag = para7071;
      endcase
  end

  always @(mux_1_out) begin
      case (mux_1_out)
        2'b00:  phase_factor3_imag = para0000;
        2'b01:  phase_factor3_imag = para9239;
        2'b10:  phase_factor3_imag = para7071;
        2'b11:  phase_factor3_imag = para3827_n;
      endcase
  end

    //Linear combinations
  wire signed [31:0] lc_0_real, lc_0_imag;
  wire signed [31:0] lc_1_real, lc_1_imag;
  wire signed [31:0] lc_2_real, lc_2_imag;
  wire signed [31:0] lc_3_real, lc_3_imag;

  linearCombTypeA lcA (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_0_real, lc_0_imag);

  linearCombTypeB lcB (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_1_real, lc_1_imag);

  linearCombTypeC lcC (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_2_real, lc_2_imag);

  linearCombTypeD lcD (input_0_real, input_1_real, input_2_real, input_3_real, input_0_im, input_1_im, input_2_im, input_3_im, lc_3_real, lc_3_imag);

  complexMul cmA(lc_0_real, lc_0_imag, para0001, para0000, output_0_real, output_0_im);                     
  complexMul cmB(lc_1_real, lc_1_imag, phase_factor1_real, phase_factor1_imag, output_1_real, output_1_im);
  complexMul cmC(lc_2_real, lc_2_imag, phase_factor2_real, phase_factor2_imag, output_2_real, output_2_im);
  complexMul cmD(lc_3_real, lc_3_imag, phase_factor3_real, phase_factor3_imag, output_3_real, output_3_im);


endmodule
