module condLogic(input logic clk, reset, flagUpdate,aluZero,negative1, PCS, regW, memWriteSrc, 
						input logic [3:0] opcodeE,
						output logic PCSrc, RegWrite, memWrite, postAluMuxSel);

					
	//logic [1:0] FlagWrite;
	logic zeroFlag, branchType, branchCond, negativeFlag, BCNDcondition;
	
	
	
	flopenr #(1)flagreg1(clk, reset,flagUpdate,negative1, aluZero, zeroFlag, negativeFlag);
	//flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

	assign memWrite = memWriteSrc & ~zeroFlag;
	assign RegWrite = regW & ~zeroFlag;
	
	//Setting conditional branch, check zeroFlag and negativeFlag
	assign BCNDcondition = (zeroFlag && ~negativeFlag) ? 1'b1 : 1'b0;
	//If branchCond is true and ALUresult is zero set to 1 
	assign branchCond= (opcodeE==4'b1001) ? BCNDcondition : 1'b0;///Not equal
	//If there is a branch set PCSrc to 1, else to branchCond result
	//It is not possible to make a branch to memory position zero
	assign branchType= (opcodeE==4'b1000) ? ~zeroFlag : branchCond; 
	assign PCSrc = PCS & branchType;
	
	assign postAluMuxSel= (opcodeE==4'b1001) ? PCSrc : 1'b0;
	
	
endmodule 