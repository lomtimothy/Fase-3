`timescale 1ns / 1ps

module JumpAddress_tb;
    reg  [31:0] PCplus4;
    reg  [25:0] JumpField;
    wire [31:0] JumpAddr;

    // Instancia
    JumpAddress uut (
        .PCplus4(PCplus4),
        .JumpField(JumpField),
        .JumpAddr(JumpAddr)
    );

    initial begin
        // Caso 1
        PCplus4 = 32'd4;
        JumpField = 26'd10;
        #10;

        // Caso 2
        PCplus4 = 32'd16;
        JumpField = 26'd50;
        #10;

        // Caso 3
        PCplus4 = 32'd32;
        JumpField = 26'd99;
        #10;

        // Fin de la simulación
        #10;
        $finish;
    end
endmodule

