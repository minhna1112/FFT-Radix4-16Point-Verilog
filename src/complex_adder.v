module complexAdder (
    input wire signed [31:0] a_real,
    input wire signed [31:0] a_im,
    
    input wire signed [31:0] b_real,
    input wire signed [31:0] b_im,

    
    output wire signed [31:0] c_real,
    output wire signed [31:0] c_im
);

realAdder32 s_real(a_real, b_real, c_real);
realAdder32 s_im(a_im, b_im, c_im);

endmodule

module testCPAdd;

reg signed [31:0] a_real, b_real, a_im, b_im ;
wire signed [31:0]  c_real, c_im;

complexAdder a1(a_real, a_im, b_real, b_im, c_real, c_im);

    
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