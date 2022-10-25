SET R0, 0x05
SET R1, 0x00

ciclo:
ADD R1, R0
DEC R0
JZ fin
JMP ciclo

fin: 
JMP fin
