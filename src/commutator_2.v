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
    output reg signed [31:0] output_3
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
  reg[1:0] mux_2_out;

always @(posedge clk ) begin
    if (mux_1_out == 2'b00)
        counter_2 <= 3'b000;
    else
        counter_2 = counter_2 + 2'b001;
end
  
always @(mux_1_out)
begin
    case(mux_1_out)
      2'b00: R0  <= data_in_0;
      2'b01: R1  <= data_in_0;
      2'b10: R2  <= data_in_0;
      2'b11: R3  <= data_in_0;
    endcase
end

always @(mux_1_out)
begin
    case(mux_1_out)
      2'b00: R4  <= data_in_1;
      2'b01: R5  <= data_in_1;
      2'b10: R6  <= data_in_1;
      2'b11: R7  <= data_in_1;
    endcase
end

always @(mux_1_out)
begin
    case(mux_1_out)
      2'b00: R8  <= data_in_2;
      2'b01: R9  <= data_in_2;
      2'b10: R10  <= data_in_2;
      2'b11: R11  <= data_in_2;
    endcase
end

always @(mux_1_out)
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



endmodule


// module commutStage2 (
//     input wire clk,
//     input wire reset,
//     input wire [1:0] mux_1_out,


//     input wire signed [31:0] data_in_0,
//     input wire signed [31:0] data_in_1,
//     input wire signed [31:0] data_in_2,
//     input wire signed [31:0] data_in_3,

//     output reg signed [31:0] output_0,
//     output reg signed [31:0] output_1,
//     output reg signed [31:0] output_2,
//     output reg signed [31:0] output_3
// );

//   reg [31:0] R0;
//   reg [31:0] R1;
//   reg [31:0] R2;
//   reg [31:0] R3;
//   reg [31:0] R4;
//   reg [31:0] R5;
//   reg [31:0] R6;
//   reg [31:0] R7;
//   reg [31:0] R8;
//   reg [31:0] R9;
//   reg [31:0] R10;
//   reg [31:0] R11;
//   reg [31:0] R12;
//   reg [31:0] R13;
//   reg [31:0] R14;
//   reg [31:0] R15;

// //   // This always part controls signal counter. 
// //   always @ ( negedge clk  or posedge reset) begin
// //     if ( reset )
// //       counter <= 4'b1111;
// //     else if (counter == 4'b1111)
// //       counter <= 4'b0;
// //     else
// //       counter <= counter + 4'b0001;
// //   end

// always @(counter)begin

//     case(counter)
//       4'b0000: R0  <= data_in_1;
//       4'b0001: R1  <= data_in_1;
//       4'b0010: R2  <= data_in_1;
//       4'b0011: R3  <= data_in_1;
//       4'b0100: R4  <= data_in_1;
//       4'b0101: R5  <= data_in_1;
//       4'b0110: R6  <= data_in_1;
//       4'b0111: R7  <= data_in_1;
//       4'b1000: R8  <= data_in_1;
//       4'b1001: R9  <= data_in_1;
//       4'b1010: R10 <= data_in_1;
//       4'b1011: R11 <= data_in_1;
//       4'b1100: R12 <= data_in_1;
//       4'b1101: R13 <= data_in_1;
//       4'b1110: R14 <= data_in_1;
//       4'b1111: R15 <= data_in_1;
//     endcase
//   end
  
// endmodule