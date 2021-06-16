module FAST_MUL (
    input wire signed [63:0] X, //First Real part
    input wire signed [63:0] Y, //First Im part
    input wire signed [63:0] L, //Second Real part
    input wire signed [63:0] M, //Second Im part
    output wire signed [63:0] A, //Real output
    output wire signed [63:0] B //Im output 
);

wire signed [127:0] tmp_1, tmp_2, tmp_3, o_real, o_imag;

assign tmp_1 = (L-M)*Y;
assign tmp_2 = (L+M)*X;
assign tmp_3 = L*(X-Y);

assign o_real = tmp_1 + tmp_3;
assign o_imag = tmp_2 - tmp_3;

assign A = o_real[127:64];
assign B = o_imag[127:64];

endmodule