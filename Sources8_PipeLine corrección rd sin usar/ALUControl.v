/******************************************************************
* Description
*	This is the control unit for the ALU. It receves an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module ALUControl
(
	input [3:0] ALUOp,			// Viene asignado de ALUControl
	input [5:0] ALUFunction,	// Viene directo de la ROM
	output reg Jr,	//¿Porqué de tipo Reg?
	output [3:0] ALUOperation

);
//

							  // 10'ALUOp_FUNCT;   tipo I y J no tiene FUNCT 
localparam R_Type_AND    = 10'b1111_100100;
localparam R_Type_OR     = 10'b1111_100101;
localparam R_Type_NOR    = 10'b1111_100111;
localparam R_Type_ADD    = 10'b1111_100000;
localparam R_Type_SUB	 = 10'b1111_100010; // Funct = 22H aquí corregí el Funct porque en simulación salia mal la resta  la ALU sacaba el valor 0 (por default)
localparam R_Type_SLL	 = 10'b1111_000000; // Funct = 00H
localparam R_Type_SRL	 = 10'b1111_000010; // Funct = 02H
localparam R_Type_JR		 = 10'b1111_001000; // JR Funct = 08H

localparam I_Type_ADDI   = 10'b0001_xxxxxx;
localparam I_Type_ORI    = 10'b0010_xxxxxx;
localparam I_Type_ANDI	 = 10'b0011_xxxxxx; // AluOp = 110
localparam I_Type_LUI    = 10'b0100_xxxxxx; // los primeros 4 bits deben coincidir con el ALUOp de Control.v

localparam I_Type_SW		 = 10'b0101_xxxxxx;
localparam I_Type_LW		 = 10'b0110_xxxxxx;

localparam I_Type_BEQ	 = 10'b0111_xxxxxx; // ALUOp = 7
localparam I_Type_BNE	 = 10'b1000_xxxxxx; // ALUOp = 8

//localparam J_Type_JUMP	 = 10'b1001_xxxxxx; // ALUOp = 9
//localparam J_Type_JAL		 = 10'b1010_xxxxxx; // ALUOp = 10


reg [3:0] ALUControlValues;
wire [9:0] Selector;

assign Selector = {ALUOp, ALUFunction};

always@(Selector)begin
	casex(Selector)
		R_Type_AND:    ALUControlValues = 4'b0000;	//# PDF: definí cte. arbitraria para "and" hacia ALU.v
		I_Type_ANDI:	ALUControlValues = 4'b0000;
		R_Type_OR: 		ALUControlValues = 4'b0001;	//# "	"
		I_Type_ORI:		ALUControlValues = 4'b0001;
		R_Type_NOR:		ALUControlValues = 4'b0010;	//# "	"
		R_Type_ADD:		ALUControlValues = 4'b0011;	//
		I_Type_ADDI:	ALUControlValues = 4'b0011;
		R_Type_SUB:		ALUControlValues = 4'b0100;
		I_Type_LUI: 	ALUControlValues = 4'b0101;	// definí cte. arbitraria para "lui" hacia ALU.v
		R_Type_SLL:		ALUControlValues = 4'b0110;	// definí cte. 6d
		R_Type_SRL:		ALUControlValues = 4'b0111;	// definí cte. 7d
		
		I_Type_SW:		ALUControlValues = 4'b0011;// Sw pone a sumar ALU
		I_Type_LW:		ALUControlValues = 4'b0011;// Lw	pone a sumar ALU
		
		I_Type_BEQ:		ALUControlValues = 4'b0100;// Beq pone a restar ALU para poder compararlos
		I_Type_BNE:		ALUControlValues = 4'b0100;// Bne pone a restar ALU para poder compararlos
		
		default: ALUControlValues = 4'b1001;
	endcase
	Jr = (Selector==R_Type_JR)? 1'b1 : 1'b0;	// Bandera para selector de Mux
end														// Es igual a 1 sólo en instrucción JR
//

assign ALUOperation = ALUControlValues;

endmodule
//alucontrol