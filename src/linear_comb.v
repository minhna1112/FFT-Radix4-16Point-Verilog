module linearCombTypeA (
    input wire signed [31:0] input_0_real,
    input wire signed [31:0] input_1_real,
    input wire signed [31:0] input_2_real,
    input wire signed [31:0] input_3_real,
    
    input wire signed [31:0] input_0_im,
    input wire signed [31:0] input_1_im,
    input wire signed [31:0] input_2_im,
    input wire signed [31:0] input_3_im,
    
    output wire signed [31:0] output_real,
    output wire signed [31:0] output_imag
);

wire signed [32:0] tmp_real;
wire signed [32:0] tmp_imag;

assign tmp_real = input_0_real + input_1_real + input_2_real + input_3_real;
assign tmp_imag = input_0_im + input_1_im + input_2_im + input_3_im;
assign output_real = tmp_real[32:1];
assign output_imag = tmp_imag[32:1];


endmodule

module linearCombTypeB (
    input wire signed [31:0] input_0_real,
    input wire signed [31:0] input_1_real,
    input wire signed [31:0] input_2_real,
    input wire signed [31:0] input_3_real,
    
    input wire signed [31:0] input_0_imag,
    input wire signed [31:0] input_1_imag,
    input wire signed [31:0] input_2_imag,
    input wire signed [31:0] input_3_imag,
    
    output wire signed [31:0] output_real,
    output wire signed [31:0] output_imag
);

wire signed [32:0] tmp_real;
wire signed [32:0] tmp_imag;

assign tmp_real = input_0_real + input_1_imag - input_2_real - input_3_imag;
assign tmp_imag = input_0_imag - input_1_real - input_2_imag + input_3_real;
assign output_real = tmp_real[32:1];
assign output_imag = tmp_imag[32:1];


endmodule


module linearCombTypeC (
    input wire signed [31:0] input_0_real,
    input wire signed [31:0] input_1_real,
    input wire signed [31:0] input_2_real,
    input wire signed [31:0] input_3_real,
    
    input wire signed [31:0] input_0_imag,
    input wire signed [31:0] input_1_imag,
    input wire signed [31:0] input_2_imag,
    input wire signed [31:0] input_3_imag,
    
    output wire signed [31:0] output_real,
    output wire signed [31:0] output_imag
);

wire signed [32:0] tmp_real;
wire signed [32:0] tmp_imag;

assign tmp_real = input_0_real - input_1_real + input_2_real - input_3_real;
assign tmp_imag = input_0_imag - input_1_imag + input_2_imag - input_3_imag;
assign output_real = tmp_real[32:1];
assign output_imag = tmp_imag[32:1];


endmodule

module linearCombTypeD (
    input wire signed [31:0] input_0_real,
    input wire signed [31:0] input_1_real,
    input wire signed [31:0] input_2_real,
    input wire signed [31:0] input_3_real,
    
    input wire signed [31:0] input_0_imag,
    input wire signed [31:0] input_1_imag,
    input wire signed [31:0] input_2_imag,
    input wire signed [31:0] input_3_imag,
    
    output wire signed [31:0] output_real,
    output wire signed [31:0] output_imag
);

wire signed [32:0] tmp_real;
wire signed [32:0] tmp_imag;

assign tmp_real = input_0_real - input_1_imag - input_2_real + input_3_imag;
assign tmp_imag = input_0_imag + input_1_real - input_2_imag - input_3_real;
assign output_real = tmp_real[32:1];
assign output_imag = tmp_imag[32:1];

endmodule