
module UnidadDeControl (
    input  wire [5:0]  OpCode,
    output reg         RegDst,
    output reg         Branch,
    output reg         MemRead,
    output reg         MemToReg,
    output reg  [2:0]  ALUOp,
    output reg         MemWrite,
    output reg         ALUSrc,
    output reg         RegWrite,
    // Nuevas señales de control para instrucciones tipo J
    output reg         Jump,
    output reg         JumpAndLink
);

always @(*) begin
    // Valores por defecto
    MemToReg    = 1'b0;
    MemWrite    = 1'b0;
    ALUOp       = 3'b000;
    RegWrite    = 1'b0;
    RegDst      = 1'b0;
    Branch      = 1'b0;
    MemRead     = 1'b0;
    ALUSrc      = 1'b0;
    Jump        = 1'b0;      // Por defecto no hay salto
    JumpAndLink = 1'b0;      // Por defecto no es JAL
	
	// Nota: Como 'subi' no existe como instrucción oficial en MIPS
	// Se utiliza 'addi' con un inmediato negativo

    case (OpCode)
        6'b000000: begin // R-type
            RegWrite = 1'b1;
            RegDst   = 1'b1;
            ALUOp    = 3'b010;
        end
        6'b001000: begin // Addi
            ALUSrc   = 1'b1;
            RegWrite = 1'b1;
            ALUOp    = 3'b000;
        end
        6'b001101: begin // Ori
            ALUSrc   = 1'b1;       
            RegWrite = 1'b1;
            ALUOp    = 3'b101;
        end
        6'b001100: begin // Andi    
            ALUSrc   = 1'b1;
            RegWrite = 1'b1;
            ALUOp    = 3'b100;
        end
        6'b001010: begin // Slti
            ALUSrc   = 1'b1;       
            RegWrite = 1'b1;
            ALUOp    = 3'b111;
        end
        6'b100011: begin // lw
            RegWrite  = 1'b1;
            ALUOp     = 3'b000;
            ALUSrc    = 1'b1;
            MemRead   = 1'b1;
            MemToReg  = 1'b1;
        end
        6'b101011: begin // sw
            ALUOp     = 3'b000;
            ALUSrc    = 1'b1;
            MemWrite  = 1'b1;
        end
        6'b000100: begin // beq
            Branch = 1'b1;
            ALUOp  = 3'b001;
        end
        6'b000101: begin // bne
            Branch = 1'b1;
            ALUOp  = 3'b001;
        end
        6'b000111: begin // bgtz
            Branch = 1'b1;
            ALUOp  = 3'b110;
        end
        // Nuevas instrucciones tipo J
        6'b000010: begin // J (Jump)
            Jump = 1'b1;
        end
        6'b000011: begin // JAL (Jump and Link)
            Jump = 1'b1;
            JumpAndLink = 1'b1;
            RegWrite = 1'b1;    // Necesitamos escribir en $ra (registro 31)
        end
    endcase
end
endmodule