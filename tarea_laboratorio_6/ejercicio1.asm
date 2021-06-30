org 100h
        section .text

        mov DX, msg1
        call EscribirCadena
        
        MOV BP, frase
        call leeCadena

        call EsperarTecla
        int 20h
        
        
        EscribirCadena:
                mov 	AH, 09h
                int 	21h                             
                ret

        leeCadena:
                xor     SI, SI       
                xor     DI, DI
        while:  
                call    EsperarTecla    
                cmp     AL, 0x0D        
                je      cadena            
                mov     [BP+SI], AL   
                inc     SI              
                jmp     while           

        cadena:
                xor     SI, SI
                xor     DI, DI
        
        for:
                mov AL, [BP+SI]
                cmp AL, [clave+SI]
                je bandera2
                jne bandera1

        bandera2:
                cmp SI, 4
                je mensaje2
                inc SI
                jmp for
        
        bandera1:
                mov DX, msg3
                call EscribirCadena
                jmp exit

        mensaje2:
                MOV DX, msg2
                call EscribirCadena
                jmp exit

        EsperarTecla:
                mov     AH, 01h         
                int     21h
                ret

                  exit:
                mov byte [BP+SI], "$"
                ret

        section .data

        frase times 10 db " "
        msg1 db	"clave:", "$"		
        msg2 db "Bienvenido", "$"
        msg3 db "Incorrecto", "$"
        clave db "fran", "$"
