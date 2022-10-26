module processor(input logic clk, reset, input[3:0] btn, output logic[15:0]  pc, output logic [23:0]inst,output logic [47:0] result, 
						output logic [63:0] data, output logic enable);

	
	logic [23:0] instrD;
	logic [47:0] rdMemData,memWD, outputDataForTxt, value,A;
	logic [15:0]  outputAddrForTxt, addr;
	logic memWriteM, stallF, counter;
	
	ROM meminstructions(pc,clk, inst);

	registerAROM reg1(inst,clk, reset, stallF,instrD);
	
	asip myProcessor(clk,reset, instrD,rdMemData, pc,result,memWD,outputDataForTxt, A,outputAddrForTxt,memWriteM, stallF);
	 
	RAM memdata(A[15:0],~clk, memWD, memWriteM, rdMemData);
	
	assign data={outputAddrForTxt, outputDataForTxt};
	assign enable= (outputAddrForTxt!=15'b0) & (outputDataForTxt!=23'b0) ? 1'b1 : 1'b0;
	
	


endmodule 
