`timescale 1ns/1ns

module  TMul;

reg clk, reset;

real a;
real b;
wire [63:0] out;

reg a_stb, b_stb, z_ack;

wire z_stb, a_ack, b_ack; 

initial begin
    a_stb = 1;
    b_stb = 1;
    z_ack = 1;
end

//initial begin
//    z_stb = 1'b1;
//   a_ack = 1'b1;
//    b_ack = 1'b1;
//end

double_multiplier s1 (a, b, a_stb, b_stb, z_ack, clk, reset, out, z_stb, a_ack, b_ack);

initial begin //Toggle clock
    clk <= 1'b0;
    forever  #5 clk <= ~clk;
end

initial begin// toggle reset
    reset <= 1'b1; 
    #50 reset <= 1'b0;
    //#4 reset = 1;
end

initial begin
    a= 0.0;
    #100 a <= 1.0;
    #100 a <= 2.5;
    #100 a <= 4.24;
    #100 a <= 5.35;
end

initial begin
    b= 0.0;
    #105 b <= 0.1;
    #100 b <= 5.2;
    #100 b <= 4.42;
    #100 b <= 53.5;
end


initial begin
    $monitor("a= %f, b= %f, out= %b", a, b, out);
end
endmodule