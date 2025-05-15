module JumpAddress(
    input  wire [31:0] PCplus4,
    input  wire [25:0] JumpField,
    output wire [31:0] JumpAddr
);

    // La dirección de salto para instrucciones J se calcula:
    // - Tomando los 4 bits más significativos de PC+4 (bits 31-28)
    // - Concatenándolos con los 26 bits del campo de dirección de la instrucción
    // - Desplazando 2 bits a la izquierda (multiplicando por 4)
    assign JumpAddr = {PCplus4[31:28], JumpField, 2'b00};

endmodule
