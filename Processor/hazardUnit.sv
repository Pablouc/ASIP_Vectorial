module hazardUnit(input logic pcSrc, pcSrcE, pcSrcM, pcSrcW, 
						output logic stallF); //, stallD, stallE, stallM );

						

						//(pcSrc == 1'b1) |
assign stallF = (( (pcSrcE == 1'b1) | (pcSrcM == 1'b1)) & (pcSrcW != 1'b1)) ? 1'b1 : 1'b0;
			


endmodule
  