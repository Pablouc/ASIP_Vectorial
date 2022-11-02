//en los registros RGB necesito los valores 0, 63, 191 y 255
//Rout = Rin1 + [(Rin2-cont) - Rin1]*αin_registro
//r10 = αin
//r1 contador de fila
//r2 cont de posicion de memoria
//r4 = Rin2
//r5 = Rin1
//r6 vector lleno de 1's, se carga desde ram
//r7 resultado parcial y final
//r8 parcial para sumar 1
//r9 ceros
//r14 aumenta 1 cada fila, para terminar el algoritmo

//inicialice r1 en 50 para comparar
addi r1 r1 50

//stalls
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


//inicialice r6 lleno de 1's
//ld r6 r6 0
add r9 r9 r9

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//Llama al algoritmo
br 55

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//Casos de αin, todas van a 23 luego del resultado
//**********************************************************************************************

//αin=0  por 0
mult r7 r7 r9 

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


br 115

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//αin=25 por 1/4
div r7 r7 r12

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

br 115

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//αin=75 por 3/4
div r7 r7 r12

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

mult r7 r7 r13

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


br 115

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//αin=1 no hace nada, por 1 
br 115

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//Algoritmo
//**********************************************************************************************
addi r2 r2 1

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//cargue rin(r5) desde la direccion de memoria r2 
ld r5 r2 0

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//(Rin2 - cont) 
sub r7 r4 r6

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//[(Rin2-cont) - Rin1]
sub r7 r7 r5

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


//Saltos para [(Rin2-cont) - Rin1]*αin_registro
//**********************************************************************************************


//para comparar con α=0 
addi r3 r3 0

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//salte a la instruccion 3
bcnd r3 r10 15

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//para comparar con α=25
addi r3 r3 25 

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//salte a la instruccion 5
bcnd r3 r10 25

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//para comparar con α=75, 75=25+50 
addi r3 r3 50 

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


//salte a la instruccion 7
bcnd r3 r10 35

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//para comparar con α=100, 100=75+25 
addi r3 r3 25 

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//salte a la instruccion 10
bcnd r3 r10 50

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


//Rin1 + [(Rin2-cont) - Rin1]*αin_registro
//**********************************************************************************************
add r7 r7 r5

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//cargar Rout (r7) en la dirección de memoria (r2)
store r7 r2 0

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//resetear registros no quemados
mult r7 r7 r9

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


subi r3 r3 r3

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9






//si ya termino la fila
bcnd r1 r2 55

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//operaciones si ya termino la fila
// equivale a r6+=1 en vectorial
//ld r8 r6 0

add r14 r14 r6

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//sumar 50 al contador de la fila para que lo alcance en la siguiente fila
addi r1 r1 50

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9


//exit
bcnd r14 r11 180

add r9 r9 r9
add r9 r9 r9
add r9 r9 r9
add r9 r9 r9

//posicion con el algoritmo
br 55



