        org     200h
        section .text


        mov     byte [200h], "J"
        mov     byte [201h], "F"
        mov     byte [202h], "C"
        mov     byte [203h], "P"
        
        ;direccionamiento directo
        mov     AX, [200h]

        ;Direccionamiento indirecto
        mov     BX, [201h]
        mov     CX, BX    

        ;Direccionamiento indirecto mas indice
        mov     BP, 200h
        mov     SI, 002h
        mov     DX, [BP+SI]

        ;Direccionamiento relativo por registro
        mov     DI, [BP+003h]

        int     20h