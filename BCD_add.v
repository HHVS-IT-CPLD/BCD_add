module BCD_add (
	input  [3:0] A,
	input  [3:0] B,
	input        Cin,
	output [3:0] Sum,
	output       Cout
);

	// 5-bit 二進位加總結果，十進位範圍為 0~19
	wire [4:0] bin_sum;

	// 當二進位加總大於 9 時，需要進行 BCD 修正
	wire need_correction;

	assign bin_sum = A + B + Cin;

	assign need_correction = (bin_sum > 5'd9); 
	// 判斷是否需要進行 BCD 修正, 因為 9 的二進位表示為 1001 (4 位)，所以需要比較 5 位的 bin_sum 是否大於 9
	// 5'd9 是 5 位二進位表示的 9，因為 bin_sum 是 5 位，所以需要比較 5 位的值；這種語法的說明是：5 位二進位表示的 9，即 00000 1001。



	// BCD 修正：若大於 9，則加上 6 (0110)
	// 修正後最高位為 Cout，低 4 位為 Sum
	assign {Cout, Sum} = need_correction ? (bin_sum + 5'd6) : bin_sum;

endmodule
