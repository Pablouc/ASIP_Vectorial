module registerAReg(input logic [47:0] rd1, rd2, input logic [3:0] ra3, opcode, input logic [47:0] extend, 
			input logic clk,rst, regWrite, aluSrc, PCSrc,memToReg, memWrite, flagUpdate,aluSrc1, aluSrc2, zeroToAlu,
			input logic [1:0]  aluControl, output logic [47:0] SrcA, SrcB, 
			output logic [3:0] WA3E,opcodeE, output logic [47:0] ExtImm, output logic regWriteE, aluSrcE, PCSrcE,memToRegE, 
			memWriteE,flagUpdateE,aluSrc1E, aluSrc2E, zeroToAluE,
			output logic [1:0]  aluControlE);
	always_ff @(posedge clk, posedge rst) 
	   if (rst) PCSrcE<=0;
		else begin       
       SrcA <= rd1;
		 SrcB <= rd2;
		 ExtImm <= extend;
		 WA3E <= ra3;
		 opcodeE<=opcode;
		 regWriteE <= regWrite;
		 aluSrcE <= aluSrc;
		 PCSrcE <= PCSrc;
		 memToRegE <= memToReg;
		 memWriteE <= memWrite;
		 flagUpdateE <= flagUpdate;
		 aluSrc1E <= aluSrc1;
		 aluSrc2E <= aluSrc2;
		 zeroToAluE <= zeroToAlu;
		 aluControlE <= aluControl;
		 //assign MemWrite = MemW & zeroFlag; any flag
	end
endmodule 