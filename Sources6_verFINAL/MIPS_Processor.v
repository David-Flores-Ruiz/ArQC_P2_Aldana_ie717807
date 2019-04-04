/******************************************************************
* Description
*	This is the top-level of a MIPS processor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 32
)

(
	// Inputs
	input clk,
	input reset,
	input [7:0] PortIn,
	// Output
	output [31:0] ALUResultOut,
	output [31:0] PortOut
);
//******************************************************************/
//******************************************************************/
assign  PortOut = 0;

//******************************************************************/
//******************************************************************/
// Data types to connect modules
wire BranchNE_wire;
wire BranchEQ_wire;
wire RegDst_wire;
wire NotZeroANDBrachNE;
wire ZeroANDBrachEQ;
wire MemtoReg_wire; // Cable sale de Control y es mi selector de MUx despés de RAM
wire MemWrite_wire; // Bandera de escritura RAM
wire MemRead_wire;  // Bandera de lectura RAM
wire [31:0] BranchAddr_wire;		 // Se shiftea 2 a la Izq.
wire [31:0] BranchAddrToMux_wire; // Se le suma el PC_4
wire [31:0] PC_4OrBranchAddr_wire;// Dirección del PC aumentada "normal" o por "branch"
wire [31:0] JumpAddr_wire;		// Para dirección de JumpAddr
wire [31:0] PC4OrBranchAddr_OR_JumpAddr_wire;	// Salida del MUX PC4 or Branch or Jump
wire [31:0] ALUOrRam_AND_RegA_wire;		// ALU o RAM o ra para escribir en el RegisterFile
wire [31:0] PC4OrBranchOrJump_OR_RegA_wire;
wire BranchEQOrBranchNE_wire;
wire ORForBranch;
wire ALUSrc_wire;
wire RegWrite_wire;
wire Zero_wire;
wire Jump_wire;
wire Jal_wire;
wire Jr_wire;
wire Jump_OR_Jal_wire;
wire [3:0] ALUOp_wire;			// Lo cambiamos de 3bits a 4bits
wire [3:0] ALUOperation_wire;
wire [4:0] WriteRegister_wire;
wire [4:0] WriteRegisterFINAL_wire;	// Registro final a escribir
wire [4:0] Direction_RA_wire;			// Tiene la $ra address return
wire [31:0] MUX_PC_wire;		// Declaré el wire "pero no se usa"
wire [31:0] PC_wire;				// Declaré el wire
wire [31:0] Instruction_wire;
wire [31:0] ReadData1_wire;
wire [31:0] ReadData2_wire;
wire [31:0] InmmediateExtend_wire;
wire [31:0] ReadData2OrInmmediate_wire;
wire [31:0] ALUResult_wire;
wire [31:0] PC_4_wire;
wire [31:0] InmmediateExtendAnded_wire;
wire [31:0] ALUResultOrRamData_wire;	// Salida de MUX después de Ram
wire [31:0] RamData_wire;				// Salida de la RAM

integer ALUStatus;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
ControlUnit
(
	.OP(Instruction_wire[31:26]),
	.RegDst(RegDst_wire),
	.BranchNE(BranchNE_wire),
	.BranchEQ(BranchEQ_wire),
	.MemtoReg(MemtoReg_wire),	//Añadi mi selector para MUX después de RAM
	.MemWrite(MemWrite_wire),	// Bandera para escribir en RAM
	.MemRead(MemRead_wire),		// Bandera para leer de la RAM
	.ALUSrc(ALUSrc_wire),			// Añadí la coma final
	.RegWrite(RegWrite_wire),
	.Jump(Jump_wire),	// selector de jump
	.Jal(Jal_wire),	// selector de jal
	.ALUOp(ALUOp_wire)
);
//

////////// Señal de Brach ////////
ANDGate	
ANDBeq_minusZero
(							// Si es instruccion beq & la salida de la ALU es Zero hay que hacer BRANCH_EQ
	.A(BranchEQ_wire),
	.B(Zero_wire),		// Zero_wire = 1 cuando la resta es igual a 0
	.C(ZeroANDBrachEQ)
);
//
ANDGate
ANDBne_Zero
(							// Si es instruccion bne & la salida de la ALU es "NO" es Zero hay que hacer BRANCH_NE
	.A(BranchNE_wire),
	.B(~Zero_wire),
	.C(NotZeroANDBrachNE)
);
// OR para detectar si hubo uno de los 2 branches //
assign BranchEQOrBranchNE_wire = ZeroANDBrachEQ | NotZeroANDBrachNE;	
//
//////////////////////////////////
PC_Register			// Añadimos la instacia del...
#(						//... Contador de Programa
	.N(32)
)
ProgramCounter

(
	.clk(clk),
	.reset(reset),
	.NewPC(PC4OrBranchOrJump_OR_RegA_wire),	// Entra la salida del Sumador de 4bytes "futuro cambio con Branch la salida del MUX"
	.PCValue(PC_wire)		// La salida del PC va a la ROM
);
//


ProgramMemory
#(
	.MEMORY_DEPTH(128)			//	.MEMORY_DEPTH(MEMORY_DEPTH) cte???
)
ROMProgramMemory
(
	.Address(PC_wire),
	.Instruction(Instruction_wire)
);
//


Adder32bits
PC_Puls_4
(
	.Data0(PC_wire),
	.Data1(4),
	
	.Result(PC_4_wire)
);
//

////////// Sumador para BranchAddress //////////
Adder32bits
PC_BranchAddr
(
	.Data0(BranchAddr_wire),
	.Data1(PC_4_wire),
	
	.Result(BranchAddrToMux_wire)
);
//

////////// Mux para PC_4 o BranchAddress //////////
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForPC_4AndBranchAddr
(			// Escoge el segundo operando:
	.Selector(BranchEQOrBranchNE_wire),
	.MUX_Data0(PC_4_wire),					// PC normal
	.MUX_Data1(BranchAddrToMux_wire),	//	PC + Branch
	
	.MUX_Output(PC_4OrBranchAddr_wire)
);
//
//////////////////////////////////////////////////////////////
assign JumpAddr_wire = {  PC_4_wire[31:28], {Instruction_wire[25:0], 2'b00}	};

assign Jump_OR_Jal_wire = Jump_wire | Jal_wire;
////////// Mux para PC_4ORBranchAddress OR JumpAddr //////////
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForPC4ORBranchAddr_AND_JumpAddr
(
	.Selector(Jump_OR_Jal_wire),
	.MUX_Data0(PC_4OrBranchAddr_wire),	// PC+4_OR_BranchAddr
	.MUX_Data1(JumpAddr_wire - 32'h_0040_0000),	//	JumpAddr
	
	.MUX_Output(PC4OrBranchAddr_OR_JumpAddr_wire)
);
//

////////// Mux para PC_4ORBranchAddressORJumpAddr OR $ra //////////
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForPC4ORBranchAddrORJumpAddr_AND_RegA
(
	.Selector(Jr_wire),	// Sale de ALUControl
	.MUX_Data0(PC4OrBranchAddr_OR_JumpAddr_wire),	// PC+4_OR_BranchAddr OR JumpAddr
	.MUX_Data1(ReadData1_wire),	//	$ra, para regresar el PC y está en rs
	
	.MUX_Output(PC4OrBranchOrJump_OR_RegA_wire) // Para sacar el $ra
);
//
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(				// Escoge el registro de destino:
	.Selector(RegDst_wire),	
	.MUX_Data0(Instruction_wire[20:16]),	// rt -> Format_I
	.MUX_Data1(Instruction_wire[15:11]),	// rd -> Rormat_R
	
	.MUX_Output(WriteRegister_wire)

);
//
/////////////////////////////////
assign Direction_RA_wire = 5'b1_1111; // direccion de $ra = 31 hex = 11111 bin
/////////////////////////////////
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType_AND_RegA
(				// Escoge el registro de destino:
	.Selector(Jal_wire),	
	.MUX_Data0(WriteRegister_wire),	// rt -> Format_I   o   rd -> Rormat_R
	.MUX_Data1(Direction_RA_wire),			// dirección de $ra
	
	.MUX_Output(WriteRegisterFINAL_wire)

);
//


RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWrite_wire),
	.WriteRegister(WriteRegisterFINAL_wire),	// Registro FINAL 
	.ReadRegister1(Instruction_wire[25:21]),
	.ReadRegister2(Instruction_wire[20:16]),
	.WriteData(ALUOrRam_AND_RegA_wire),	// CAMBIAR POR SALIDA DE 3 MUXes -> YA!!!
	.ReadData1(ReadData1_wire),	// rs
	.ReadData2(ReadData2_wire)		// rt
);
//

SignExtend
SignExtendForConstants
(   
	.DataInput(Instruction_wire[15:0]),
   .SignExtendOutput(InmmediateExtend_wire)
);
////// Inmmediate_ShiftLeft_2bits  //////
assign BranchAddr_wire = InmmediateExtend_wire << 2;
/////////////////////////////////////////

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(			// Escoge el segundo operando:
	.Selector(ALUSrc_wire),
	.MUX_Data0(ReadData2_wire),			// Registro B = rt
	.MUX_Data1(InmmediateExtend_wire),	//	Registro B = Inmediato
	
	.MUX_Output(ReadData2OrInmmediate_wire)

);
//

ALUControl
ArithmeticLogicUnitControl
(
	.ALUOp(ALUOp_wire),
	.ALUFunction(Instruction_wire[5:0]),
	.Jr(Jr_wire),
	.ALUOperation(ALUOperation_wire)

);
//

ALU
ArithmeticLogicUnit 
(
	.ALUOperation(ALUOperation_wire),
	.A(ReadData1_wire),
	.B(ReadData2OrInmmediate_wire),
	.shamt(Instruction_wire[10:6]),	// los bits del 10:6 de shamt para hacer sll y srl
	.Zero(Zero_wire),
	.ALUResult(ALUResult_wire)
);
//

///////// 	RAM	//////////	Instanciar: DataMemory.v
DataMemory 
#(	
	.DATA_WIDTH(32),		// (8) Mis datos del MIPS son de 32bits
	.MEMORY_DEPTH(1024)	// (1024)...localidades se ajustan a HANOI
)
RAMDataMemory					// nombre de la instancia
(
	.WriteData(ReadData2_wire),	// Rt para escribirlo si uso SW
	.Address(ALUResult_wire	& 32'h0000_FFFF),	// La suma de Rs(dirección) + SignExt(cte.offset) es mi ...
	.MemWrite(MemWrite_wire),						// ...dirección de 32bits; con mascara para dejar solo los 16 bits LSB
	.MemRead(MemRead_wire),
	.clk(clk),
	.ReadData(RamData_wire)	// Dato de RAM
);
////////////////////////////

//////// MUX sw O lw ///////
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForALUResultAndRamData
(			// Escoge el segundo operando:
	.Selector(MemtoReg_wire),	// Bandera de Control
	.MUX_Data0(ALUResult_wire),// Registro B = rt
	.MUX_Data1(RamData_wire),	//	Dato de RAM
	
	.MUX_Output(ALUResultOrRamData_wire)

);
////////////////////////////

//////// MUX para $ra ///////
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForALUResultORRamData_AND_RegA
(			// Escoge el segundo operando:
	.Selector(Jal_wire),	// Bandera de Control
	.MUX_Data0(ALUResultOrRamData_wire),// ALU o RAM
	.MUX_Data1(PC_4_wire),				// PC + 8
	
	.MUX_Output(ALUOrRam_AND_RegA_wire)	// ALU RAM RegA

);
////////////////////////////

assign ALUResultOut = ALUResult_wire;


endmodule

