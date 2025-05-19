`timescale 1ns / 1ps

module MEMI_tb;
    // Entrada
    reg [31:0] DR;      // Dirección de lectura

    // Salida
    wire [31:0] INS;    // Instrucción leída

    // Instanciar el módulo bajo prueba
    MEMI uut (
        .DR(DR),
        .INS(INS)
    );

    // Estímulos
    initial begin
        // Esperar que se cargue la memoria desde el archivo
        #5;

        // Probar diferentes direcciones (múltiplos de 4)
        DR = 32'd0;
        #10;

        DR = 32'd4;
        #10;

        DR = 32'd8;
        #10;

        DR = 32'd12;
        #10;

        DR = 32'd100;
        #10;

        // Finalizar simulación
        #10;
        $finish;
    end

endmodule

