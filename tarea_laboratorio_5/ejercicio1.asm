org 100h

    section .text

    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX
    XOR CL, CL 

    MOV SI, 0
    MOV DI, 0


    MOV DL, 25
    MOV byte[200h], 10
    MOV byte[201h], 12
    MOV byte[202h], 14
    MOV byte[203h], 16


    call modotexto

    modotexto:
        MOV AH, 0h ;activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET

    movercursor:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV BH, 0h 
        INT 10h
        RET

    escribircaracter:
        MOV AH, 0Ah ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL ; denotamos el caracter a escribir en pantalla
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET
    
    siguientefila:
        MOV SI, 0
        MOV DI, 0
        INC DH
        INC DH
        MOV DL, 25
        RET

    primernombre: 
        MOV DH, [200h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 2
        JB primernombre
        call siguientefila
        jmp segundonombre


    segundonombre:
        MOV DH, [201h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 7 
        JB segundonombre
        call siguientefila
        jmp primerapellido

    primerapellido:
        MOV DH, [202h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 12
        JB primerapellido
        call siguientefila
        jmp segundoapellido      

    segundoapellido:
        MOV DH, [203h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 17
        JB segundoapellido
        call siguientefila
        jmp esperartecla

    esperartecla:
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h

    section .data

    name DB 'Jose Francisco Ceron Ponzeand'


