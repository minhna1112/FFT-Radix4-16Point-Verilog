module testFloatSubtractor;
    reg  [31:0 ] a, b;
    wire [31:0] c;

    initial begin
        //a <= 32'b00111111100110011001100110011010;    //-1.2
        a <= 32'b00111111010011001100110011001101; //0.8
    end

    initial begin
        b <= 32'b10111111010011001100110011001101; //-0.8
    
    end
    
    initial begin
        $monitor("c = %b", c);    
    end
    
    Floating_adder s1(b, a, 1'b0, 1'b1, c);
    

endmodule