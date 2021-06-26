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

wire signed [31:0] tmp_1, tmp_2, tmp_3, tmp_4;

//o_r = a_r + b_r + c_r +d_r
Floating_adder a1(input_0_real, input_1_real, 1'b0, 1'b1, tmp_1); 
Floating_adder a2(tmp_1, input_2_real, 1'b0, 1'b1, tmp_2);
Floating_adder a3(tmp_2, input_3_real, 1'b0, 1'b1, output_real);

//o_i = a_i + b_i + c_i +d_i
Floating_adder a4(input_0_im, input_1_im, 1'b0, 1'b1, tmp_3);
Floating_adder a5(tmp_3, input_2_im, 1'b0, 1'b1, tmp_4);
Floating_adder a6(tmp_4, input_3_im, 1'b0, 1'b1, output_imag);

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

wire signed [31:0] tmp_1, tmp_2, tmp_3, tmp_4;

//o_r = a_r + b_i - c_r - d_i
Floating_adder a1(input_0_real, input_1_imag, 1'b0, 1'b1, tmp_1); 
Floating_adder a2(tmp_1, input_2_real, 1'b1, 1'b1, tmp_2);
Floating_adder a3(tmp_2, input_3_imag, 1'b1, 1'b1, output_real);

//o_i = a_i - b_r - c_i + d_r
Floating_adder a4(input_0_imag, input_1_real, 1'b1, 1'b1, tmp_3);
Floating_adder a5(tmp_3, input_2_imag, 1'b1, 1'b1, tmp_4);
Floating_adder a6(tmp_4, input_3_real, 1'b0, 1'b1, output_imag);

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

wire [31:0] tmp_1, tmp_2, tmp_3, tmp_4;

//o_r = a_r - b_r + c_r  - d_r
Floating_adder a1(.a(input_0_real), .b(input_1_real), .ctrl(1'b1), .enable(1'b1), .ans(tmp_1)); 
Floating_adder a2(tmp_1, input_2_real, 1'b0, 1'b1, tmp_2);
Floating_adder a3(tmp_2, input_3_real, 1'b1, 1'b1, output_real);

//o_i = a_i - b_i + c_i  - d_i
Floating_adder a4(input_0_imag, input_1_imag, 1'b1, 1'b1, tmp_3);
Floating_adder a5(tmp_3, input_2_imag, 1'b0, 1'b1, tmp_4);
Floating_adder a6(tmp_4, input_3_imag, 1'b1, 1'b1, output_imag);

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

wire signed [31:0] tmp_1, tmp_2, tmp_3, tmp_4;

//o_r = a_r - b_i - c_r + d_i
Floating_adder a1(input_0_real, input_1_imag, 1'b1, 1'b1, tmp_1); 
Floating_adder a2(tmp_1, input_2_real, 1'b1, 1'b1, tmp_2);
Floating_adder a3(tmp_2, input_3_imag, 1'b0, 1'b1, output_real);

//o_i = a_i + b_r - c_i - d_r
Floating_adder a4(input_0_imag, input_1_real, 1'b0, 1'b1, tmp_3);
Floating_adder a5(tmp_3, input_2_imag, 1'b1, 1'b1, tmp_4);
Floating_adder a6(tmp_4, input_3_real, 1'b1, 1'b1, output_imag);

endmodule