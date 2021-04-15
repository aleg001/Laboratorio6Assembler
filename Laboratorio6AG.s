/* Alejandro Gomez 20347 */
/* Programa realizado para el laboratorio 6 */
/* UVG 2021 - Assembler */
/* 14/04/21 */

.text
.align 2
.global main
.type main,%function

main:

    /* 
    Los primeros casos mostrados corresponden a operaciones aritmeticas:
    suma, resta, multiplicacion.
    Posteriormente a operadores logicos:
    and, or, eor
    Y de corrimiento de bits.
    */

	stmfd sp!, {lr}	/* SP = R13 link register */
	
	/* Operaciones aritmeticas: Suma */
	ldr r0,=valor1
	ldr r1,[r0]
	
	ldr r0,=valor2
	ldr r2,[r0]

    /* Se realiza proceso de suma */
	adc r3,r1,r2
	
	ldr r0,= suma
	str r3,[r0]
	
	ldr r0, = formato
	mov r1,r3

    /* El valor es mostrado */
	bl printf


    /* Operaciones aritmeticas: Resta */

    ldr r0,=valor1
	ldr r1,[r0]
	
	ldr r0,=valor2
	ldr r2,[r0]

    /* Se realiza el proceso correspondiente a resta */
	subs r3,r1,r2
	
	ldr r0,=resta
	str r3,[r0]

    /* Se toma en cuenta si el valor es menos que 0 */
    cmp r3, #0 
    /* El valor es mostrado */
    blt mPrint
    bge mmPrint
    
    /* En caso sea asi, se muestra que es menos */
    mPrint: 

        ldr r0,=pNegativo
        mov r1,r3
        /* El valor es mostrado */
        bl printf


    /* El "else", en caso sea más grande. */
    mmPrint: 
        
        ldr r0,=pPositivo
        mov r1,r3
        /* El valor es mostrado */
        bl printf

    /* Operaciones aritmeticas: Multiplicacion */
    multiplicacion:

        ldr r0,= valor1
        ldr r1,[r0]
        
        ldr r0,= valor2
        ldr r2,[r0]

        mul r3,r1,r2
        
        ldr r0,=multiplication
        str r3,[r0]
        
        ldr r0,=pMulti
        mov r1,r3
        /* El valor es mostrado */
        bl printf

    /* Operadores logicos: AND */
    
    ldr r0,=valor1
	ldr r1,[r0]
	
	ldr r0,=valor2
	ldr r2,[r0]

	and r3,r1,r2
	
	ldr r0,=andd
	str r3,[r0]
	
	ldr r0,=pAND
	mov r1,r3
    /* El valor es mostrado */
	bl printf


    /* Operadores logicos: OR */

    ldr r0,=valor1
	ldr r1,[r0]
	
	ldr r0,=valor2
	ldr r2,[r0]

	orr r3,r1,r2
	
	ldr r0,=or
	str r3,[r0]
	
	ldr r0,=pOR
	mov r1,r3
    /* El valor es mostrado */
	bl printf

    /* Operadores logicos: EOR */

    ldr r0,=valor1
	ldr r1,[r0]
	
	ldr r0,=valor2
	ldr r2,[r0]

	eor r3,r1,r2
	
	ldr r0,=xor
	str r3,[r0]
	
	ldr r0,=pEOR
	mov r1,r3
    /* El valor es mostrado */
	bl printf

    /* Operadores logicos: Corrimiento de bit */

    ldr r0,=valor1
	ldr r1,[r0]
	
	ldr r0,=valor2
	ldr r2,[r0]
    
    ror r3, r1, r2

    ldr r0,=corrBit
	str r3,[r0]
	
	ldr r0,=pCorr
	mov r1,r3
    /* El valor es mostrado */
	bl printf


    /* Output */
	mov r0, #0
	mov r3, #0

    /* SP = R13 link register */
	ldmfd sp!, {lr}	
	bx lr

.data
.align 2

/* Se presenta los prints segun sea el caso */

/* Print de la suma */
formato:
	.asciz "La suma de 8 y 9 da: %d\n"

/* Print de resta */
pResta: 
    .asciz "La resta de 8 y 9 es %d\n"

/* Print si es negativo */
pNegativo: 
    .asciz "Negativo\n"

/* Print si es positivo */
pPositivo: 
    .asciz "Positivo\n"

/* Print de la multiplicacion */
pMulti: 
    .asciz "La multiplicacion de 8 y 9 da %d\n"

/* Print para el AND */
pAND: 
    .asciz "AND de 8 y 9 da %d\n"

/* Print para el OR */
pOR: 
    .asciz "OR de 8 y 9 da %d\n"

/* Print para Extensive OR */
pEOR: 
    .asciz "Exclusive OR de 8 y 9 da %d\n"

/* Print para corrimiento de bit */
pCorr: 
    .asciz "Corrimiento de bit 8 a derecha 9 veces es %d\n"


/* Valores para los espacios de memoria */
valor1:
	.word 9
valor2:
	.word 8
suma:
	.word 0
resta:
    .word 0
multiplication: 
    .word 0
andd: 
    .word 0
or: 
    .word 0
xor: 
    .word 0
corrBit: 
    .word 0
