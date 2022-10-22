SET R0, n
SET R1, 0x00

ciclo:
ADD R1, R0
DEC R0
JZ fin
JMP ciclo

fin: instruccion invalida
