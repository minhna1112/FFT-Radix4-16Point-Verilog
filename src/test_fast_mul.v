module TEST_FM;
    //reg signed [31:0] in_1_real, in_1_imag;
    //reg signed [31:0] in_2_real, in_2_imag;

    //real in_1_real, in_1_imag;
    //real in_2_real, in_2_imag;
    
    real in_1_real, in_1_imag;
    real in_2_real, in_2_imag;

    wire signed [63:0] out_real, out_imag;

    initial begin
        in_1_real = 3.5;
        in_1_imag = 2.5;

        in_2_real = 2.5;
        in_2_imag = 3.5;
    end

    FAST_MUL fm1(in_1_real, in_1_imag, in_2_real, in_2_imag, out_real, out_imag);

    initial begin
        $monitor("a= %b, b= %b", out_real, out_imag);
    end

endmodule