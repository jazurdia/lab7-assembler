/***
* Organización de Computadoras y Assembler 
* Universidad Del Valle de Guatemala
* Autores: Alejandro Azurdia y Daniel Cabrera
* Carnet: 21242 y *****
* Fecha: 4 de Mayo de 2022
***/

.data
.align 2

name: .asciiz "Nombre"
name_lenght: .word 0
lastname: .asciiz "Apellido"
lastname_lenght: .word 12

formatoN: .asciiz "%s"

@@ mensajes
msj_nombre: .asciiz "Ingresa el nombre de bebe: "
msj_apellido: .asciiz "Ingresa el apellido de bebe: "
msj_leyendo_nombre: .asciiz "leyendo nombre"
msj_leyendo_apellido: .asciiz "leyendo apellido"
msj_num_nom: .asciiz "El nombre tiene esta cantidad de caracteres: "
msj_num_ape: .asciiz "El apellido tiene esta cantidad de caracteres: "


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
    ldr r1, =name_lenght
    bl scanf

    mov r0, #0
    mov r1, #0
    
    @@ leer apellido
    ldr r0, =msj_leyendo_apellido
    bl puts

    ldr r0, =formatoN
    ldr r1, =lastname_lenght
    bl scanf

    mov r0, #0
    mov r1, #0

    @@ contadores:
    mov r5, #0 @@vocales en nombre
    mov r6, #0 @@letras en nombre
    mov r9, #0 @@vocales en apellido
    mov r10, #0 @@letras en apellido

    comparador1: @@ encuentra la cantidad de letras en Nombre
    ldr r2, =name
    ldr r3, =name_lenght
    add r2, r2, r3
    ldrb r3, [r2]
    cmp r3, #0
    bne comparador1

    comparador2: @@ encuentra la cantidad de letras en Apellido
    ldr r2, =lastname
    ldr r3, =lastname_lenght
    add r2, r2, r3
    ldrb r3, [r2]
    cmp r3, #0
    bne comparador2

    comparador3: @@ encuentra la cantidad de vocales en Nombre
    ldr r2, =name
    ldr r3, =name_lenght
    add r2, r2, r3
    ldrb r3, [r2]
    cmp r3, #'a'
    addeq r5, r5, #1
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
    cmp r3, #' '
    bne comparador3

    comparador4: @@ encuentra la cantidad de vocales en Apellido
    ldr r2, =lastname
    ldr r3, =lastname_lenght
    add r2, r2, r3
    ldrb r3, [r2]
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
    cmp r3, #' '
    bne comparador4










    
    



