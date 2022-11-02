module asip(input logic clk, rst , input logic [23:0]  inst,input logic[47:0] rdMemData, input[7:0] color, output logic[15:0] PC,
				output logic [47:0] resultW, memWD, outputDataForTxt, A, output logic [15:0] outputAddrForTxt, output logic memWriteM, stallF);
				
	logic aluSrc, immSrc, aluZero,negative, memToReg, ra2Src,ra1Src, regWriteE, PCSrcE,memToRegE, 
	PCS, regW, memWriteSrc,memWriteE,
	PCSrcM, regWriteM,memToRegM,PCSrcW, regWriteW,memToRegW , flagUpdate, aluSrc1, aluSrc2, zeroToAlu;
	logic [1:0] regSrc, aluControl;
	logic [3:0] WA3E,WA3M,WA3W, opcodeE;
	logic [47:0] RD, WD, srcB, AluOutW, postAluRes;

	
	controlUnit controller(clk, rst, inst[23:20], aluSrc, immSrc,memToReg,ra2Src,ra1Src, PCS, regW, 
									memWriteSrc,flagUpdate,aluSrc1, aluSrc2, zeroToAlu, aluControl);
	
	
	hazardUnit hazardU( PCS, PCSrcE, PCSrcM, PCSrcW, stallF);
	
	
	datapath datapath(clk,rst,stallF,flagUpdate,regW,regWriteW,aluSrc, PCS,immSrc,memToReg,memWriteSrc,ra2Src,ra1Src,PCSrcW,
							aluSrc1, aluSrc2, zeroToAlu,
							aluControl,inst,WA3W,resultW, color,srcB, postAluRes,PC, aluZero,negative, regWriteE, PCSrcE,
							memToRegE, memWriteE, WA3E);
	
	
	
	registerAALU regALU(postAluRes,srcB, WA3E, clk,rst, PCSrcE, regWriteE, memWriteE,memToRegE,
	A, WD, WA3M, PCSrcM, regWriteM, memWriteM,memToRegM);
	
	//Asignando el dato a escribir en la ram
	assign memWD=WD;
	
	assign outputDataForTxt= memWriteM ? memWD : 48'b0;
	assign outputAddrForTxt= memWD ? A : 16'b0;
	
	
	registerAMem regMem(rdMemData, A, WA3M, clk,rst, PCSrcM, regWriteM,memToRegM, 
	RD, AluOutW, WA3W, PCSrcW, regWriteW,memToRegW );
	
	//Mux entre MemData y ALU revisar
	//assign AluOutWExtended = {32'b0, AluOutW[15:0]};
	mux2a1 #(48) muxMemALU(RD, AluOutW, memToRegW, resultW);
	
endmodule 