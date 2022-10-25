module condLogic(input logic clk, reset, flagUpdate,aluZero, PCS, regW, memWriteSrc, 
						input logic [3:0] opcodeE,
						output logic PCSrc, RegWrite, memWrite, postAluMuxSel);

					
	//logic [1:0] FlagWrite;
	logic zeroFlag, branchType, branchCond;
	
	
	
	flopenr #(1)flagreg1(clk, reset,flagUpdate, aluZero, zeroFlag);
	//flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

	assign memWrite = memWriteSrc & ~zeroFlag;
	assign RegWrite = regW & ~zeroFlag;
	
	//If branchCond is true and ALUresult is zero set to 1 
	assign branchCond= (opcodeE==4'b1001) ? ~zeroFlag : 1'b0;///Not equal
	//If there is a branch set PCSrc to 1, else to branchCond result
	//It is not possible to make a branch to memory position zero
	assign branchType= (opcodeE==4'b1000) ? ~zeroFlag : branchCond; 
	assign PCSrc = PCS & branchType;
	
	assign postAluMuxSel= (opcodeE==4'b1001) ? PCSrc : 1'b0;
	
	
endmodule 