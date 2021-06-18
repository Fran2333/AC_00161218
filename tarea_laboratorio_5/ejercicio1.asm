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


    MOV DL, 35
    MOV byte[200h], 20
    MOV byte[201h], 22
    MOV byte[202h], 24
    MOV byte[203h], 26


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
        MOV DL, 35
        RET

    primernombre: 
        MOV DH, [200h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 9 
        JB primernombre
        call siguientefila
        jmp esperartecla


    segundonombre:
        MOV DH, [201h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 17 
        JB segundonombre
        call siguientefila
        jmp esperartecla

    primerapellido:
        MOV DH, [202h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 26 
        JB primerapellido
        call siguientefila
        jmp esperartecla        

    segundoapellido:
        MOV DH, [203h]
        call movercursor ;llamada a mover cursor 
        MOV CL, [name+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter ; Llamada a escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP SI, 33
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


