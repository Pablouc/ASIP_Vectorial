module datapath(input logic clk, rst,stallF,flagUpdate, regWrite,regWriteW, aluSrc, PCSrc, immSrc,memToReg, memWrite,
					ra2Src,ra1Src,PCSrcW, aluSrc1, aluSrc2, zeroToAlu,
					input logic [1:0]  aluControl,input logic [23:0] inst,input logic [3:0] WA3W,
					input logic [47:0] resultW,output logic [47:0] srcB,postAluResult, output logic [15:0] PC, output logic zeroFlag,negative1, 
					regWriteE, PCSrcE,memToRegE, memWriteE, output logic [3:0] WA3E );
	
	logic zero1, zero2, zero3, zero4, zero5, zero6, negative2, negative3, negative4, negative5, negative6;
	logic [47:0] srcA,aluResult, rd1,rd2, extImm, srcBAlu, extImmE;
	logic [7:0] srcAlu_B1, srcAlu_A1, srcAlu_A2,srcAlu_B2, srcAlu_A3,srcAlu_B3, srcAlu_A4,srcAlu_B4, srcAlu_A5,srcAlu_A1_1,srcAlu_B1_1,
					srcAlu_B5, srcAlu_A6,srcAlu_B6,aluResult1, aluResult2, aluResult3, aluResult4, aluResult5, aluResult6;
	logic [15:0] pcNext, resultWwire, pcPlus1;
	logic [3:0] ra2, ra1, opcodeE;
	logic [1:0] aluControlE;
	logic aluSrcE,ci,  PCSrcE1, regWriteE1, memWriteE1,postAluMuxSel, flagUpdateE, aluSrc1E, aluSrc2E, zeroToAluE;
	
	//llamando al register file
	regFile regfile(clk, PC, regWriteW, ra1,ra2,WA3W,resultW, rd1, rd2);
	
	
	// next PC logic
	adder #(16)pcAdder(PC, 16'b1 , pcPlus1);
	assign resultWwire=resultW[15:0];
	mux2a1 #(16) muxPcSrc(pcPlus1,resultWwire ,PCSrcW, pcNext);
	ffNextValue #(16) pcRegister(clk, rst,stallF, pcNext, PC);
	
	//Extensión de signo
	extendSign extSign(inst [11:0], immSrc,  extImm);
	
	//Mux entrada primer operando register file
	mux2a1 #(4) muxA1RegFile(inst[15:12],inst[19:16] ,ra1Src , ra1);
	
	//Mux entrada segundo operando register file
	mux2a1 #(4) muxA2RegFile(inst[11:8],inst[19:16] ,ra2Src , ra2);
	
	//register
	registerAReg regARefFile(rd1,rd2,inst[19:16],inst[23:20], extImm,clk,rst, regWrite, aluSrc, PCSrc,memToReg, memWrite,flagUpdate,
					aluSrc1, aluSrc2, zeroToAlu,aluControl,srcA,srcB, WA3E,opcodeE, extImmE,regWriteE1, aluSrcE, 
					PCSrcE1,memToRegE, memWriteE1,flagUpdateE,aluSrc1E, aluSrc2E, zeroToAluE,aluControlE);
					
	//Control Condicional
	condLogic conditional(clk, rst, flagUpdateE,zeroFlag,negative1, PCSrcE1, regWriteE1,memWriteE1, opcodeE, PCSrcE, regWriteE,
								memWriteE, postAluMuxSel);
	
	
	//Seleccionando las entradas para las ALUs.
		
	//ALU1//B
	muxAlu1B #(8) muxALU1B(srcB[7:0], 8'b0, srcA[7:0], zeroToAluE,opcodeE, srcAlu_B1);
	
	//A																	 
	mux2a1 #(8) muxALU1A(srcA[7:0], extImmE[7:0], aluSrcE, srcAlu_A1);
	
	
	//ALU2
	//B
	mux3a1 #(8) muxALU2B(srcB[15:8], srcB[7:0], aluSrc2E, zeroToAluE, srcAlu_B2);
	//A
	mux2a1 #(8) muxALU2A(srcA[15:8], 8'b0, aluSrc1E, srcAlu_A2);
	
	//ALU3
	//B
	mux3a1 #(8) muxALU3B(srcB[23:16], srcB[7:0], aluSrc2E, zeroToAluE, srcAlu_B3);
	//A
	mux2a1 #(8) muxALU3A(srcA[23:16], 8'b0, aluSrc1E, srcAlu_A3);
	
	//ALU4
	//B
	mux3a1 #(8) muxALU4B(srcB[31:24], srcB[7:0], aluSrc2E, zeroToAluE, srcAlu_B4);
	//A
	mux2a1 #(8) muxALU4A(srcA[31:24], 8'b0, aluSrc1E, srcAlu_A4);
	
	//ALU5
	//B
	mux3a1 #(8) muxALU5B(srcB[39:32], srcB[7:0], aluSrc2E, zeroToAluE, srcAlu_B5);
	//A
	mux2a1 #(8) muxALU5A(srcA[39:32], 8'b0, aluSrc1E, srcAlu_A5);
	
	//ALU6
	//B
	mux3a1 #(8) muxALU6B(srcB[47:40], srcB[7:0], aluSrc2E, zeroToAluE, srcAlu_B6);
	//A
	mux2a1 #(8) muxALU6A(srcA[47:40], 8'b0, aluSrc1E, srcAlu_A6);
	
	
	
	//mux para cambiar las entradas de la ALU a-b por b-a 
	//Solo para hacer subbi
	muxAluParams #(8) muxALU1Params(srcAlu_A1,srcAlu_B1, opcodeE,srcAlu_A1_1,srcAlu_B1_1);
	//Creando las 6 instancias de ALU
	
	//El parametro debe ir en 7 no 8.
	alu #(7) alu_instance1(srcAlu_A1_1,srcAlu_B1_1,aluControlE,1'b0,aluResult1, zero1, negative1);
	
	alu #(7) alu_instance2(srcAlu_A2,srcAlu_B2,aluControlE,1'b0,aluResult2, zero2, negative2);
	
	alu #(7) alu_instance3(srcAlu_A3,srcAlu_B3,aluControlE,1'b0,aluResult3, zero3, negative3);
	
	alu #(7) alu_instance4(srcAlu_A4,srcAlu_B4,aluControlE,1'b0,aluResult4, zero4, negative4);
	
	alu #(7) alu_instance5(srcAlu_A5,srcAlu_B5,aluControlE,1'b0,aluResult5, zero5, negative5);
	
	alu #(7) alu_instance6(srcAlu_A6,srcAlu_B6,aluControlE,1'b0,aluResult6, zero6, negative6);
	
	//Concatenating the result of the 6 ALUs
	assign aluResult= {aluResult6, aluResult5, aluResult4, aluResult3, aluResult2, aluResult1};
	
	//AND evaluation of all ALUs to check zero flag
	assign zeroFlag = (zero1 && zero2 && zero3 && zero4 && zero5 && zero6) ? 1'b1 : 1'b0;
	
	
	//aluRes es para el pc.
	//assign postAluRes= postAluResult[15:0];
	//assign data = srcB;
	
	
	//Mux para elegir entre la ALU y el Inmediato
	mux2a1 #(48) muxPostALU(aluResult, extImmE, postAluMuxSel, postAluResult);
		
	
	
endmodule
