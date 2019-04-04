/******************************************************************
* Description
*	This is control unit for the MIPS processor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module Control
(
	input [5:0]OP,		// Para el Opcode del greensheet de las instrucciones
	
	output RegDst,
	output BranchEQ,
	output BranchNE,
	output MemRead,
	output MemtoReg,
	output MemWrite,
	output ALUSrc,
	output RegWrite,
	output Jump,
	output Jal,
	output [3:0]ALUOp
);
//

localparam R_Type = 0;
localparam I_Type_ADDI = 6'h_08;
localparam I_Type_ORI  = 6'h_0d;
localparam I_Type_ANDI = 6'h_0c; // andi tiene 0c hex en Opcode
localparam I_Type_LUI  = 6'h_0f;	// el OPCODE según mi greensheet es lui -> 0fH
localparam I_Type_SW	  = 6'h_2b;	// sw opcode: 2b hex
localparam I_Type_LW	  = 6'h_23; // lw opcode: 23 hex

localparam I_Type_BEQ  = 6'h_04; // beq opcode: 04 hex
localparam I_Type_BNE  = 6'h_05; // bne opcode: 05 hex

localparam J_Type_JUMP = 6'h_02; // jump opcode: 2 hex
localparam J_Type_JAL  = 6'h_03; // jal opcode:  3 hex

reg [13:0] ControlValues;	// 1 bit más grande para el ALUOp  +  2 bits para: Jump y Jal

always@(OP) begin
	casex(OP)						  // 14'banderas_____ALUOp;
		R_Type:       ControlValues= 14'b1_001_00_00__00__1111;
		I_Type_ADDI:  ControlValues= 14'b0_101_00_00__00__0001;
		I_Type_ORI:	  ControlValues= 14'b0_101_00_00__00__0010;
		I_Type_ANDI:  ControlValues= 14'b0_101_00_00__00__0011;	// asigno mis banderas y el...
		I_Type_LUI:   ControlValues= 14'b0_101_00_00__00__0100; //...ALUOp arbitrario hacia localparam de ALUControl.v
		
		I_Type_SW:	  ControlValues= 14'bx_1xx_01_00__00__0101;	// Sw escribe en RAM
		I_Type_LW:	  ControlValues= 14'b0_111_10_00__00__0110;	// LW lee de RAM y escribe en Register File
		
		I_Type_BEQ:	  ControlValues= 14'bx_0xx_00_01__00__0111;	// ALUOp = 7
		I_Type_BNE:	  ControlValues= 14'bx_0xx_00_10__00__1000;	// ALUOp = 8
		
		J_Type_JUMP:  ControlValues= 14'bx_xxx_00_00__10__1001;	// ALUOp = 9
		J_Type_JAL:   ControlValues= 14'bx_xx1_00_00__01__1010;	// ALUOp = 10
		default:															
			ControlValues= 14'b0000000000000;
		endcase
end	
//
	
assign RegDst   = ControlValues[13];// Selector para Escribir en: 0 = rt,  1 = rd
assign ALUSrc   = ControlValues[12];	//# 2do operando de ALU: 0=rt, 1=Inmediato  
assign MemtoReg = ControlValues[11];	//# Selector para Dato a escribir en el RegFile: 0 = "siempre AluResult" , 1 = lw
assign RegWrite = ControlValues[10];	//# Bandera para escribir en Register File
assign MemRead  = ControlValues[9]; // Señal para que en: 1 = leer en RAM -> lw
assign MemWrite = ControlValues[8]; // Señal para que en: 1 = escribe en RAM -> sw
assign BranchNE = ControlValues[7]; 	//# BNE
assign BranchEQ = ControlValues[6];		//# BEQ

assign Jump = ControlValues[5];	// se pone en 1 si es JUMP
assign Jal  = ControlValues[4];	// se pone en 1 si es JAL

assign ALUOp = ControlValues[3:0];
// los índices de ControlValues se desplazan 1 al incrementar espacio para ALUOp
endmodule
//control

