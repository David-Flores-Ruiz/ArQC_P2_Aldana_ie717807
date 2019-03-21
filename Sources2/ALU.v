/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add
*		sub
*		or
*		and
*		nor
* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/

module ALU 
(
	input [3:0] ALUOperation,
	input [31:0] A,
	input [31:0] B,
	input [5:0] shamt,	// nuevo: para SLL y SRL
	output reg Zero,
	output reg [31:0]ALUResult
);
//

localparam AND = 4'b0000;		//# PDF: Debe coincidir con la Cte. en ALUControl.v
localparam OR  = 4'b0001;		//# "	"			
localparam NOR = 4'b0010;		//# "	"
localparam ADD = 4'b0011;
localparam SUB = 4'b0100;
localparam LUI = 4'b0101;		// Es el ALUOperation de ALUControl.v
localparam SLL = 4'b0110;		// 6d
localparam SRL = 4'b0111;		// 7d
   
   always @ (A or B or ALUOperation)
     begin
		case (ALUOperation)
		  AND: //# and
		   ALUResult= A & B;
		  OR:  //# or
		   ALUResult= A | B;
		  NOR: //# nor
		   ALUResult= ~(A|B);
		  ADD: // add
			ALUResult= A + B;
		  SUB: // sub
			ALUResult= A - B;
		  LUI: //lui
		   ALUResult={B[15:0],16'H0000};	// recorre los 16bits y concatena 16 zeros
		  SLL:
			ALUResult= B << shamt;	// sll
		  SRL:
			ALUResult= A >> shamt;	// srl
		default:
			ALUResult= 0;
		endcase // case(control)
		Zero = (ALUResult==0) ? 1'b1 : 1'b0;
     end // always @ (A or B or control)
endmodule // alu