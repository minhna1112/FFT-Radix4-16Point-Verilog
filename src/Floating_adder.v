module Floating_adder(
    input wire [31:0] a,
    input wire [31:0] b,
    input ctrl,	// 0- add , 1-subtract
	 input enable,
    output wire [31:0] ans
    );
	
	reg [31:0] val_b,val_s; //bigger and smaller
	reg [23:0] aligned;
	reg [31:0] result;
	reg [24:0] sum,sum_norm;
	reg [4:0] lead0;	//leading zeros can be go up to 23
	reg sig_a, sig_b;
	reg is_greater;
	integer i;
	
	always @ (*) begin
		if(enable) begin
			sig_a = a[31];
			sig_b = (ctrl)? ~b[31] : b[31];	//ctrl sign 1 means value will invert
	// 1st stage - sort to find the bigger number		
			if(a[30:0] > b[30:0]) begin
				val_b = a;
				val_s = b;
				is_greater = 1'b1; 
			end else begin
				val_b = b;
				val_s = a;
				is_greater = 1'b0;
			end
	// 2nd stage - align small number		
			aligned = {1'b1,val_s[22:0]} >> (val_b[30:23] - val_s[30:23]);
	// 3rd stage - perform add/sub operation		
			if(sig_a == sig_b) begin
				sum = {2'b01,val_b[22:0]} + aligned;
			end else begin
				sum = {2'b01,val_b[22:0]} - aligned;
			end		
	// 4th stage - normalizing
			if (sum[23])
				lead0 = 0;
			else if (sum[22])
				lead0 = 1;
			else if (sum[21])
				lead0 =2;
			else if (sum[20])
				lead0 =3;
			else if (sum[19])
				lead0 =4;
			else if (sum[18])
				lead0 =5;
			else if (sum[17])
				lead0 =6;
			else if (sum[16])
				lead0 =7;
			else if (sum[15])
				lead0 =8;
			else if (sum[14])
				lead0 =9;
			else if (sum[13])
				lead0 =10;
			else if (sum[12])
				lead0 =11;
			else if (sum[11])
				lead0 =12;
			else if (sum[10])
				lead0 =13;
			else if (sum[9])
				lead0 =14;
			else if (sum[8])
				lead0 =15;
			else if (sum[7])
				lead0 =16;
			else if (sum[6])
				lead0 =17;
			else if (sum[5])
				lead0 =18;
			else if (sum[4])
				lead0 =19;
			else if (sum[3])
				lead0 =20;
			else if (sum[2])
				lead0 =21;
			else if (sum[1])
				lead0 =22;
			else
				lead0 =23;
			
			sum_norm = sum << lead0;	//shift the mantissa
	// 5th stage - setting the result
			if(sum[24]) begin
				result[30:23] = val_b[30:23] + 1'b1;
				result[22:0] = sum[23:1];
			end else begin
				
				if(lead0 > val_b[30:23]) begin	//number too small should throw underflow exception if mantissa not equal to zero
					result[30:0] = 0;
				end else begin
					result[30:23] = val_b[30:23] - lead0;
					result[22:0] = sum_norm[22:0];
				end
			end
			//result[31] = val_b[31];
			
			//Real sign!!!
			result[31] = (a[31] & is_greater) | ( (~is_greater) & (ctrl ^ b[31]) );
			//Add symmetrical case
			if(a[30:0] == b[30:0]) begin
				if (ctrl) begin
					if (a[31]==b[31]) begin
						result = 32'b0;		
					end
				end
				else begin
					if (a[31]!=b[31]) begin
						result = 32'b0;		
					end
				end
			end

		end else
			result = 0;
	end
	
	assign ans = result;
	
endmodule
