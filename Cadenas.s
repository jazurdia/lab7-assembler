/***
* Organización de Computadoras y Assembler 
* Universidad Del Valle de Guatemala
* Autores: Alejandro Azurdia y Daniel Cabrera
* Carnet: 21242 y *****
* Fecha: 4 de Mayo de 2022
***/

.data
.align 2

name: .asciz "Nombre"
lastname: .asciz "Apellido"
ultimaLetraNombre: .asciz "a"
ultimaLetraApellido: .asciz "a"

formatoN: .asciz "%s"
formato2: .asciz "%d"

vocalesnombre: .word 0
vocalesapellido: .word 0
letrasnombre: .word 0
letrasapellido: .word 0


@@ mensajes
msj_nombre: .asciz "Ingresa el nombre de bebe: "
msj_apellido: .asciz "Ingresa el apellido de bebe: "   
msj_puntuacion: .asciz "Puntuacion: "

.text
.align 2
.global main
	.type main, %function
main:
    stmfd sp!, {lr}

    @@ leer nombre
    ldr r0, =msj_nombre
    bl puts

    ldr r0, =formatoN
    ldr r1, =name
    bl scanf

    mov r0, #0
    mov r1, #0
    
    @@ leer apellido
    ldr r0, =msj_leyendo_apellido
    bl puts

    ldr r0, =formatoN
    ldr r1, =lastname
    bl scanf

    mov r0, #0
    mov r1, #0

    @@ contadores:
    mov r5, #0 @@vocales en nombre
    mov r9, #0 @@vocales en apellido

    bl comparadorv2_1
    bl comparadorv2_2

    bl comparador3
    bl comparador4
    
    ldr r0, =msj_puntuacion
    bl puts

    ldr r0, =formato2
    ldr r1, =puntuacion
    bl printf

    ldmfd sp!, {lr}
    @@ salida


    comparadorv2_1: @@ encuentra la cantidad de letras en nombre
    ldr r2, =name
    ldr r2, [r2] @@ cadena de texto del nombre
    ldr r3, =letrasnombre 
    ldr r3, [r3] @@ contador de letras en nombre
    
    add r3, r3, #1

    ldrb r4, [r2, #4]
    cmp r4, #"Z"
    bne comparadorv2_1

    ldr r5, =letrasnombre
    str r3, [r5]
    
    bx lr

    comparadorv2_2: @@ encuentra la cantidad de letras en nombre
    ldr r2, =lastname
    ldr r2, [r2] @@ cadena de texto del nombre
    ldr r3, =letrasapellido 
    ldr r3, [r3] @@ contador de letras en nombre
    
    add r3, r3, #1

    ldrb r4, [r2, #4]
    cmp r4, #"Z
    bne comparadorv2_1

    ldr r5, =letrasapellido
    str r3, [r5]
    
    bx lr
    
    comparador3: @@ encuentra la cantidad de vocales en Nombre
    ldr r2, =name
    ldr r2, [r2] @@ cadena de texto del nombre
    ldr r3, =vocalesnombre
    ldr r3, [r3] @@ contador de vocales en nombre

    @@add r2, r2, r3
    
    ldrb r3, [r2, #4]
    cmp r3, #'a'
    addeq r5, r5, #1 @@ si es vocal
    cmp r3, #'e'
    addeq r5, r5, #1
    cmp r3, #'i'
    addeq r5, r5, #1
    cmp r3, #'o'
    addeq r5, r5, #1
    cmp r3, #'u'
    addeq r5, r5, #1
    cmp r3, #'A'
    addeq r5, r5, #1
    cmp r3, #'E'
    addeq r5, r5, #1
    cmp r3, #'I'
    addeq r5, r5, #1
    cmp r3, #'O'
    addeq r5, r5, #1
    cmp r3, #'U'
    addeq r5, r5, #1
    
    add r3, r3, #4
    cmp r3, #"Z
    bne comparador3



    ldr r4, =vocalesnombre
    str r3, [r4]

    bx lr

    comparador4: @@ encuentra la cantidad de vocales en Apellido
    ldr r2, =lastname
    ldr r2, [r2] @@ cadena de texto del nombre
    ldr r3, =vocalesapellido
    ldr r3, [r3] @@ contador de vocales en nombre

    @@add r2, r2, r3
    ldrb r3, [r2, #4]
    cmp r3, #'a'
    addeq r9, r9, #1
    cmp r3, #'e'
    addeq r9, r9, #1
    cmp r3, #'i'
    addeq r9, r9, #1
    cmp r3, #'o'
    addeq r9, r9, #1
    cmp r3, #'u'
    addeq r9, r9, #1
    cmp r3, #'A'
    addeq r9, r9, #1
    cmp r3, #'E'
    addeq r9, r9, #1
    cmp r3, #'I'
    addeq r9, r9, #1
    cmp r3, #'O'
    addeq r9, r9, #1
    cmp r3, #'U'
    addeq r9, r9, #1

    add r3, r3, #4
    cmp r3, #"Z
    bne comparador4

    ldr r4, =vocalesapellido
    str r3, [r4]


    bx lr

puntuador:
    ldr r3, =letrasnombre
    ldr r4, =letrasapellido
    ldr r5, =vocalesnombre
    ldr r6, =vocalesapellido

    ldr r8, =ultimaLetraNombre
    ldr r9, =ultimaLetraApellido

    mov r7, #0 @@ contador de puntuacion

    cmp r3, r4
    addeq r7, r7, #1 @@ si son iguales

    cmp r5, r6
    addeq r7, r7, #1 @@ si son iguales

    cmp r8, r9
    addeq r7, r7, #1 @@ si son iguales

    bx lr










    
    



