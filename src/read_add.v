module realAdder64 (
    input wire signed [31:0] a,
    input wire signed [31:0] b,
    output wire signed [31:0] c
);

wire signed [32:0] tmp;

assign tmp = a +b;
assign c = tmp[32:1];

endmodule

module testRealAdder64;
    reg signed [31:0] a, b;

    wire signed [31:0] out;

    realAdder64 a1(a, b, out);

    initial begin
    
        a = 32'b0 10000000 00110011001100110011010; //2.4
        b = 32'b0 10000000 11011001100110011001101; //3.7
                ///0 10000001 10000110011001100110011; //6.1
                //0 10000000 10000110011001100110011;
    end

    initial begin
        $monitor("a= %b, b=%b, out=  %b", a,b, out);       
    end

endmodule