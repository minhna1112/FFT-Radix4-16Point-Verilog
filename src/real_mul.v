module realMul32 (
    input wire signed [31:0] a,
    input wire signed [31:0] b,
    output wire signed [31:0] c
);

wire signed [63:0] tmp;

assign tmp = a*b;
assign c = tmp[63:32];

endmodule

//Test bench
module testRealMul32;
    reg signed [31:0] a, b;

    wire signed [31:0] out;

    realMul32 m1(a, b, out);

    initial begin
    
        a = 32'b01000000000110011001100110011010; //2.4
        b = 32'b01000000011011001100110011001101; //3.7
    end

    initial begin
        $monitor("a= %b, b=%b, out=  %b", a,b, out);       
    end

endmodule