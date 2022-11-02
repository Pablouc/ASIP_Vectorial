module controlUnit(input logic clk, rst, input logic[3:0] opcode, 
					output logic aluSrc, immSrc,memToReg,ra2Src,ra1Src, PCS, regW, memWriteSrc, flagUpdate,aluSrc1, aluSrc2, zeroToAlu,
					output logic [1:0]  aluControl);
						
			
	decoder deco(opcode, regW, aluSrc, PCS, immSrc,flagUpdate,memToReg,memWriteSrc,ra2Src,
					ra1Src,aluSrc1, aluSrc2, zeroToAlu, aluControl);


endmodule 