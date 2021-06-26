module commutStage2 (
    input wire clk,
    input wire reset,
    input wire [1:0] mux_1_out,


    input wire signed [31:0] data_in_0,
    input wire signed [31:0] data_in_1,
    input wire signed [31:0] data_in_2,
    input wire signed [31:0] data_in_3,

    output reg signed [31:0] output_0,
    output reg signed [31:0] output_1,
    output reg signed [31:0] output_2,
    output reg signed [31:0] output_3,

    output reg [1:0] mux_2_out
);
    
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
  
  reg[2:0] counter_2;

always @(posedge clk ) begin
    if (mux_1_out == 2'b00)
        counter_2 <= 3'b000;
    else
        counter_2 = counter_2 + 3'b001;
end
  
always @(counter_2)
begin
    case(mux_1_out)
      2'b00: R0  <= data_in_0;
      2'b01: R1  <= data_in_0;
      2'b10: R2  <= data_in_0;
      2'b11: R3  <= data_in_0;
    endcase
end

always @(counter_2)
begin
    case(mux_1_out)
      2'b00: R4  <= data_in_1;
      2'b01: R5  <= data_in_1;
      2'b10: R6  <= data_in_1;
      2'b11: R7  <= data_in_1;
    endcase
end

always @(counter_2)
begin
    case(mux_1_out)
      2'b00: R8  <= data_in_2;
      2'b01: R9  <= data_in_2;
      2'b10: R10  <= data_in_2;
      2'b11: R11  <= data_in_2;
    endcase
end

always @(counter_2)
begin
    case(mux_1_out)
      2'b00: R12  <= data_in_3;
      2'b01: R13 <= data_in_3;
      2'b10: R14  <= data_in_3;
      2'b11: R15  <= data_in_3;
    endcase
end

always @(counter_2) begin
    case (counter_2)
    3'b011: output_0 <= R0;
    3'b100: output_0 <= R4;
    3'b101: output_0 <= R8;
    3'b110: output_0 <= R12;
    endcase
end

always @(counter_2) begin
    case (counter_2)
    3'b011: output_1 <= R1;
    3'b100: output_1 <= R5;
    3'b101: output_1 <= R9;
    3'b110: output_1 <= R13;
    endcase
end

always @(counter_2) begin
    case (counter_2)
    3'b011: output_2 <= R2;
    3'b100: output_2 <= R6;
    3'b101: output_2 <= R10;
    3'b110: output_2 <= R14;
    endcase
end

always @(counter_2) begin
    case (counter_2)
    3'b011: output_3 <= data_in_0;
    3'b100: output_3 <= data_in_1;
    3'b101: output_3 <= data_in_2;
    3'b110: output_3 <= data_in_3;
    endcase
end

always @(counter_2) begin
    case (counter_2)
    3'b011: mux_2_out <= 2'b00;
    3'b100: mux_2_out <= 2'b01;
    3'b101: mux_2_out <= 2'b10;
    3'b110: mux_2_out <= 2'b11;
    endcase
end


endmodule

