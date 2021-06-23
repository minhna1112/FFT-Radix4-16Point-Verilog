module complexMul (
    input wire signed [31:0] a_real,
    input wire signed [31:0] a_im,
    
    input wire signed [31:0] b_real,
    input wire signed [31:0] b_im,

    
    output wire signed [31:0] c_real,
    output wire signed [31:0] c_im
);

wire signed [31:0] tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6;

realSub32 s1(b_real, b_im, tmp_1);//L-M
realSub32 s2(a_real, a_im, tmp_2); // X-Y
realAdder32 s3(b_real, b_im, tmp_3); //L+M

realMul32 m1(tmp_1, a_im, tmp_4); //(L-M)*Y
realMul32 m2(tmp_3, a_real, tmp_5); //(L+M)*X
realMul32 m3(tmp_2, b_real, tmp_6); // (X-Y)*L;

realAdder32 s4(tmp_4, tmp_6, c_real);
realSub32 s5(tmp_5, tmp_6, c_im);

endmodule

module testCPMul;

reg signed [31:0] a_real, b_real, a_im, b_im ;
wire signed [31:0]  c_real, c_im;

complexMul a1(a_real, a_im, b_real, b_im, c_real, c_im);

    
initial begin
    a_real = 32'b01000000000110011001100110011010;
    b_real  = 32'b01000000011011001100110011001101;
    a_im  = 32'b01000000011011001100110011001101;
    b_im = 32'b01000000000110011001100110011010;
end

initial begin
    $monitor("c= %b + %b i ", c_real, c_im);
end

endmodule