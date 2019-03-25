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
	input [2:0] ALUOp,			// Viene asignado de ALUControl
	input [5:0] ALUFunction,	// Viene directo de la ROM
	output [3:0] ALUOperation

);
//

							  // 9'ALUOp_FUNCT;   tipo I y J no tiene FUNCT 
localparam R_Type_AND    = 9'b111_100100;
localparam R_Type_OR     = 9'b111_100101;
localparam R_Type_NOR    = 9'b111_100111;
localparam R_Type_ADD    = 9'b111_100000;
localparam R_Type_SUB	 = 9'b111_100010;	// Funct = 22H aquí corregí el Funct porque en simulación salia mal la resta  la ALU sacaba el valor 0 (por default)
localparam R_Type_SLL	 = 9'b111_000000; // Funct = 00H
localparam R_Type_SRL	 = 9'b111_000010; // Funct = 02H

localparam I_Type_ADDI   = 9'b100_xxxxxx;
localparam I_Type_ORI    = 9'b101_xxxxxx;
localparam I_Type_ANDI	 = 9'b110_xxxxxx; // AluOp = 110
localparam I_Type_LUI    = 9'b011_xxxxxx;	// los primeros 3 bits deben coincidir con el ALUOp de Control.v

reg [3:0] ALUControlValues;
wire [8:0] Selector;

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
		default: ALUControlValues = 4'b1001;
	endcase
end
//

assign ALUOperation = ALUControlValues;

endmodule
//alucontrol