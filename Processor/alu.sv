module alu#(parameter WIDTH=3)(input [WIDTH:0] a, input [WIDTH:0] b, input [1:0] opCode, input ci, 
							output logic [WIDTH:0] out, output logic  cero, negativo);

logic [WIDTH:0] outMult;
logic [WIDTH:0] outDiv;
logic [WIDTH:0] outSum;
logic coWire, acarreoWire, ceroWire;
logic  coSum;

logic [WIDTH:0] setToZero;
logic [WIDTH+1:0]outSub;
logic [WIDTH+1:0]outSubToPos;
logic [WIDTH+1:0] aSub;
logic [WIDTH+1:0] bSub;
logic coSub;






//Instancia Suma

nbit_full_adder #(WIDTH) sum_instance(a,b,ci,outSum,coSum);

//Instancia Multiplicación

nbit_multiplier #(WIDTH) multInst(a,b,outMult);

//Instancia División

nbit_divider #(WIDTH) divInst(a,b,outDiv);

//Instancia Resta

comp2 #(WIDTH) c_instance(a,b,bSub,aSub);

nbit_full_adder #(WIDTH+1) sub_instance(aSub,bSub,ci,outSub,coSub);


////



always @(*)begin
case(opCode)



2'b00: begin
	out=outSum;
	
	//Bandera cero
	cero= out ? 1'b0: 1'b1;
	negativo=1'b0;



	end

2'b01: begin
	out=outMult;
	
	//Bandera cero
	cero= out ? 1'b0: 1'b1;
	negativo=1'b0;

	
	end
	

2'b10: begin
	out=outDiv;
	
	//Bandera cero
	cero= out ? 1'b0: 1'b1;
	negativo=1'b0;


	
	end
	




2'b11:begin
	//Resultado positivo o cero
	if(outSub[WIDTH+1]==0)begin 
		
		out=outSub[WIDTH:0];
		
		//Bandera cero
		cero= out ? 1'b0: 1'b1;
		negativo=1'b0;
	end
	
	//Resultado es negativo 
	else if(outSub[WIDTH+1]==1)begin
		negativo=1'b1;
		setToZero= 0;
		out=setToZero;
		cero= 1'b1;
	end

end

default:begin 
	  out=2'b00;
	  
	  cero=1'b0;
	  negativo=1'b0;

		  end


endcase

end	
endmodule
