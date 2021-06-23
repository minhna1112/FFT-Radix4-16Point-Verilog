module signalSelect (
    input wire signed [31:0] data_in_1,


    input wire clk,
    input wire reset,

    output reg signed [31:0] output_0,
    output reg signed [31:0] output_1,
    output reg signed [31:0] output_2,
    output reg signed [31:0] output_3,

    output reg [1:0] q_flag
);

  reg [3:0] counter;

  reg [31:0] R0;
  reg [31:0] R1;
  reg [31:0] R2;
  reg [31:0] R3;
  reg [31:0] R4;
  reg [31:0] R5;
  reg [31:0] R6;
  reg [31:0] R7;
  reg [31:0] R8;
  reg [31:0] R9;
  reg [31:0] R10;
  reg [31:0] R11;
  reg [31:0] R12;
  reg [31:0] R13;
  reg [31:0] R14;
  reg [31:0] R15;


// This always part controls signal counter. 
  always @ ( negedge clk  or posedge reset) begin
    if ( reset )
      counter <= 4'b1111;
    else if (counter == 4'b1111)
      counter <= 4'b0;
    else
      counter <= counter + 4'b0001;
  end

  always @(counter)begin

    case(counter)
      4'b0000: R0  <= data_in_1;
      4'b0001: R1  <= data_in_1;
      4'b0010: R2  <= data_in_1;
      4'b0011: R3  <= data_in_1;
      4'b0100: R4  <= data_in_1;
      4'b0101: R5  <= data_in_1;
      4'b0110: R6  <= data_in_1;
      4'b0111: R7  <= data_in_1;
      4'b1000: R8  <= data_in_1;
      4'b1001: R9  <= data_in_1;
      4'b1010: R10 <= data_in_1;
      4'b1011: R11 <= data_in_1;
      4'b1100: R12 <= data_in_1;
      4'b1101: R13 <= data_in_1;
      4'b1110: R14 <= data_in_1;
      4'b1111: R15 <= data_in_1;
    endcase
  end

always @ ( posedge clk  ) begin
    case ( counter )
      4'b1100: output_0  <= R0;
      4'b1101: output_0  <=  R1;
      4'b1110: output_0  <=  R2;
      4'b1111: output_0  <=  R3;
    endcase
end
    
always @ ( posedge clk ) begin
    case ( counter )
      4'b1100: output_1 <= R4;
      4'b1101: output_1 <=  R5;
      4'b1110: output_1 <=  R6;
      4'b1111: output_1 <=  R7;
    endcase
end

always @ ( posedge clk ) begin
    case ( counter )
      4'b1100: output_2  <= R8;
      4'b1101: output_2 <=  R9;
      4'b1110: output_2  <=  R10;
      4'b1111: output_2 <=  R11;
    endcase
end

always @ ( posedge clk  ) begin
    case ( counter )
      4'b1100: output_3 <= R12;
      4'b1101: output_3 <=  R13;
      4'b1110: output_3 <=  R14;
      4'b1111: output_3 <=  R15;
    endcase

end

always @ ( output_0  ) begin
    case ( counter )
      4'b1100: q_flag <= 2'b00;
      4'b1101: q_flag <= 2'b01;
      4'b1110: q_flag <= 2'b10;
      4'b1111: q_flag <= 2'b11;
    endcase

end


    
endmodule