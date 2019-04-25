onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top del MIPS}
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate -divider ControlUnit
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/OP
add wave -noupdate -radix binary -childformat {{{/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[3]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[2]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[1]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[3]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[2]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[1]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ControlUnit/ALUOp[0]} {-height 15 -radix hexadecimal}} /MIPS_Processor_TB/DUV/ControlUnit/ALUOp
add wave -noupdate -radix binary -childformat {{{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[5]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[4]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[3]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[2]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[1]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[0]} -radix binary}} -subitemconfig {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[5]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[4]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[3]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[2]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[1]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction[0]} {-height 15 -radix binary}} /MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUFunction
add wave -noupdate -radix binary -childformat {{{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[9]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[8]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[7]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[6]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[5]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[4]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[3]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[2]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[1]} -radix binary} {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[0]} -radix binary}} -subitemconfig {{/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[9]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[8]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[7]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[6]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[5]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[4]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[3]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[2]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[1]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector[0]} {-height 15 -radix binary}} /MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/Selector
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUControlValues
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnitControl/ALUOperation
add wave -noupdate -divider ProgramCounter
add wave -noupdate /MIPS_Processor_TB/DUV/PC_wire
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/PC_4_wire
add wave -noupdate -divider PIPELINE
add wave -noupdate -label {IF/ID salidas concatendas} /MIPS_Processor_TB/DUV/Reg1_IF_ID/DataOutput
add wave -noupdate -label {ID/EX salidas concatendas} /MIPS_Processor_TB/DUV/Reg2_ID_EX/DataOutput
add wave -noupdate -label {EX/MEM salidas concatendas} /MIPS_Processor_TB/DUV/Reg3_EX_MEM/DataOutput
add wave -noupdate -label {MEM/WB salidas concatendas} /MIPS_Processor_TB/DUV/Reg4_MEM_WB/DataOutput
add wave -noupdate -color Cyan -radix hexadecimal /MIPS_Processor_TB/DUV/Instruction_wire
add wave -noupdate -divider IF/ID
add wave -noupdate /MIPS_Processor_TB/DUV/IF_ID_PC4_wire
add wave -noupdate -color Cyan /MIPS_Processor_TB/DUV/IF_ID_Instruction_wire
add wave -noupdate -divider ID/EX
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_PC4_wire
add wave -noupdate -color Cyan /MIPS_Processor_TB/DUV/ID_EX_Instruction_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_RD1_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_RD2_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_SignExt_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_rt_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_rd_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_RegWrite_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_MemtoReg_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_MemWrite_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_MemRead_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_RegDst_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_ALUSrc_wire
add wave -noupdate /MIPS_Processor_TB/DUV/ID_EX_ALUOp_wire
add wave -noupdate -divider EX/MEM
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_PC4_wire
add wave -noupdate -color Cyan /MIPS_Processor_TB/DUV/EX_MEM_Instruction_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_ALUResult_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_RD2_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_WriteRegister_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_RegWrite_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_MemtoReg_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_MemWrite_wire
add wave -noupdate /MIPS_Processor_TB/DUV/EX_MEM_MemRead_wire
add wave -noupdate -divider MEM/WB
add wave -noupdate /MIPS_Processor_TB/DUV/MEM_WB_RamData_wire
add wave -noupdate -color Cyan /MIPS_Processor_TB/DUV/MEM_WB_Instruction_wire
add wave -noupdate /MIPS_Processor_TB/DUV/MEM_WB_ALUResult_wire
add wave -noupdate /MIPS_Processor_TB/DUV/MEM_WB_WriteRegister_wire
add wave -noupdate /MIPS_Processor_TB/DUV/MEM_WB_RegWrite_wire
add wave -noupdate /MIPS_Processor_TB/DUV/MEM_WB_MemtoReg_wire
add wave -noupdate -divider JUMPS
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/JumpAddr_wire
add wave -noupdate -radix binary -childformat {{{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[31]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[30]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[29]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[28]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[27]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[26]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[25]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[24]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[23]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[22]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[21]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[20]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[19]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[18]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[17]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[16]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[15]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[14]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[13]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[12]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[11]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[10]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[9]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[8]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[7]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[6]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[5]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[4]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[3]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[2]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[1]} -radix binary} {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[0]} -radix binary}} -subitemconfig {{/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[31]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[30]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[29]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[28]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[27]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[26]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[25]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[24]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[23]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[22]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[21]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[20]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[19]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[18]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[17]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[16]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[15]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[14]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[13]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[12]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[11]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[10]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[9]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[8]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[7]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[6]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[5]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[4]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[3]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[2]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[1]} {-height 15 -radix binary} {/MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire[0]} {-height 15 -radix binary}} /MIPS_Processor_TB/DUV/PC4OrBranchAddr_OR_JumpAddr_wire
add wave -noupdate -label Mascara_JumpAddr -radix binary /MIPS_Processor_TB/DUV/MUX_ForPC4ORBranchAddr_AND_JumpAddr/MUX_Data1
add wave -noupdate -divider Registros
add wave -noupdate -label {        at} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_1
add wave -noupdate -color Yellow -label {        t0} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_8
add wave -noupdate -color Yellow -label {        t1} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_9
add wave -noupdate -color Yellow -label {        t2} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_10
add wave -noupdate -color Yellow -label {        t3} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_11
add wave -noupdate -color Yellow -label {        t4} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_12
add wave -noupdate -color Yellow -label {        t5} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_13
add wave -noupdate -color Yellow -label {        t6} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_14
add wave -noupdate -color Yellow -label {        t7} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_15
add wave -noupdate -color {Orange Red} -label {        s0} /MIPS_Processor_TB/DUV/Register_File/Register_s0/DataOutput
add wave -noupdate -color {Orange Red} -label {        s1} /MIPS_Processor_TB/DUV/Register_File/Register_s1/DataOutput
add wave -noupdate -color {Orange Red} -label {        s2} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_18
add wave -noupdate -color {Orange Red} -label {        s3} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_19
add wave -noupdate -color Cyan -label {       $sp} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_29
add wave -noupdate -color Green -label {       $ra} /MIPS_Processor_TB/DUV/Register_File/MUXRegister1/Data_31
add wave -noupdate -divider ROM
add wave -noupdate /MIPS_Processor_TB/DUV/ROMProgramMemory/rom
add wave -noupdate -color {Medium Blue} -itemcolor Blue /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/A
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/B
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/shamt
add wave -noupdate /MIPS_Processor_TB/DUV/ArithmeticLogicUnit/ALUResult
add wave -noupdate -divider {DataMem RAM}
add wave -noupdate /MIPS_Processor_TB/DUV/RAMDataMemory/ram
add wave -noupdate /MIPS_Processor_TB/DUV/RAMDataMemory/Address
add wave -noupdate /MIPS_Processor_TB/DUV/RAMDataMemory/WriteData
add wave -noupdate /MIPS_Processor_TB/DUV/RamData_wire
add wave -noupdate /MIPS_Processor_TB/DUV/RAMDataMemory/ReadData
add wave -noupdate /MIPS_Processor_TB/DUV/RAMDataMemory/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/RAMDataMemory/MemRead
add wave -noupdate -divider Branches
add wave -noupdate /MIPS_Processor_TB/DUV/BranchEQOrBranchNE_wire
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Fin {43 ps} 0 Cyan Cyan} {Cursor {20 ps} 0 Yellow Yellow} {Inicio {3 ps} 0 {Orange Red} {Orange Red}}
quietly wave cursor active 3
configure wave -namecolwidth 120
configure wave -valuecolwidth 77
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {14 ps}
