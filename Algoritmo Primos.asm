ADDI $8,  $0, 2
ADDI $9,  $0, 100
ADDI $4,  $0, 0
ADDI $5,  $0, 0
SUB  $13, $8, $9
BGTZ $13, 21
ADDI $6,  $0, 2
ADDI $7,  $0, 1
SLT  $13, $6, $8
BEQ  $13, $0, 9
ADD  $11, $8, $0
SUB  $11, $11, $6
SLT  $14, $11, $6
BEQ  $14, $0, -3
BEQ  $11, $0, 1
J    17
ADDI $7,  $0, 0
ADDI $6,  $6, 1
J    8
BEQ  $7,  $0, 5
ADD  $14, $5, $5
ADD  $14, $14, $14
ADD  $12, $4, $14
SW   $8, 0($12)
ADDI $5, $5, 1
ADDI $8, $8, 1
J    4
J    27