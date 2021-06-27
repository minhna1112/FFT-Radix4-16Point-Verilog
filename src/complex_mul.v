module complexMul (
    input wire signed [31:0] a_real, //X
    input wire signed [31:0] a_im, //Y
    
    input wire signed [31:0] b_real, //L
    input wire signed [31:0] b_im, //M

    
    output wire signed [31:0] c_real, //A
    output wire signed [31:0] c_im //B
);

wire signed [31:0] tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6;

Floating_adder s1(b_real, b_im, 1'b1, 1'b1, tmp_1);  //L-M
Floating_adder s2(a_real, a_im, 1'b1, 1'b1, tmp_2);  //X-Y
Floating_adder s3(b_real, b_im, 1'b0, 1'b1, tmp_3);  //L+M

Multi_Sing_float m1(tmp_1, a_im, 1'b1, tmp_4); //(L-M)*Y
Multi_Sing_float m2(tmp_3, a_real, 1'b1, tmp_5); //(L+M)*X
Multi_Sing_float m3(tmp_2, b_real, 1'b1, tmp_6); // (X-Y)*L 

Floating_adder s4(tmp_4, tmp_6, 1'b0, 1'b1, c_real);  //(L-M)*Y+(X-Y)*L
Floating_adder s5(tmp_5, tmp_6, 1'b1, 1'b1, c_im); //(L+M)*X-(X-Y)*L


endmodule

