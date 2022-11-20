LOAD R5, [0xF1] # BOCINA: guardamos en R5 lo que hay en 0xF1 (inicialmente 2)
LOAD R4, 0x0F # MOTOR: guardamos el valor q cambia a vel.max en R4
LOAD R3, 0x0C # MOTOR: guardamos el valor q cambia a vel.curva en R3
STR 0xF0, R4 # MOTOR: vel.max es la velocidad inicial

Idea: mapeamos la lectura del sensor a una direccion, si es 0x01 se interrumpe, si es 0x00 no

main:
	CMP R7, 0x20 # Comprueba si se atravesaron 32 curvas
	JZ inc
	JMP main

inc:
	MOV R5, R6 # Resetea el registro que cuenta las vueltas
	INC R5 # Incrementa la intensidad de la bocina
	STR 0xF1, R5 
	JMP main

rai:
	LOAD R0, [0xF0] # guarda la velocidad en R0 para poder comparar
	CMP R0, R3 # si vel.actual es igual a la vel.curva, si es igual significa q paso una curva
	JZ poscurva
	STR 0xF0, 0x0C # si no salto es que vel.actual = vel.max, por lo tanto viene una curva
	IRET

poscurva:
	INC R7 # se atraveso una curva
	STR 0xF0, R4 # se incrementa la vel
	IRET
