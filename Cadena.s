/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organizacion de computadoras y Assembler
* Lab 7 grupo covid
* Alejandro Azurdia 21242
* Diego Cabrera 
 ----------------------------------------------- */
.data
.align 2
entrada:
    .asciz " %s"

fn:
    .asciz ""

ln:
    .asciz ""

msjnombre:
    .asciz "Nombre: "
msjapellido:
    .asciz "Apellido: "

formato:
    .asciz "Puntaje: %d\n"

.text
.align 2
.global main
.type main, %function

main:
    stmfd sp!, {lr}

    ldr r0,=msj nombre
    bl puts
    bl obtener1
    ldr r3,=fn @@ r7 es nombre
    

    ldr r0,=msjapellido
    bl puts
    bl obtener2
    ldr r4,=ln @@ r8 es apellido

    @@ contadores
    mov r7, #0 @@ vocales en nombre
    mov r8, #0 @@ letras en nombre
    mov r9, #0 @@ vocales en apellido
    mov r10, #0 @@ letras en apellido
    
    ldr r6, #0 @@ puntaje
    bl compare_nombre
    bl print

obtener1:
    push {lr}
    //leer nombre
    ldr r0,=entrada
    ldr r1,=nombre
    bl scanf
    pop {pc}

obtener2:
    push {lr}
    //leer apellido
    ldr r0,=entrada
    ldr r1,=apellido
    bl scanf
    pop {pc}

compare_nombre:
    //r4 contiene cantidad de letras
    add r8,#1
    ldrb r1,[r3],#1 
    cmp r1,#0x00
    beq compare_apellido
    cmp r1,#97
    addeq r7, #1
    cmp r1,#101
    addeq r7, #1
    cmp r1,#105
    addeq r7, #1
    cmp r1,#111
    addeq r7, #1
    cmp r1,#117
    addeq r7, #1
    cmp r1,#65
    addeq r7, #1
    cmp r1,#69
    addeq r7, #1
    cmp r1,#73
    addeq r7, #1
    cmp r1,#79
    addeq r7, #1
    cmp r1,#85
    addeq r7, #1
    b compare_nombre   

compare_apellido:
    //r10 contiene cantidad de letras
    add r10,#1
    ldrb r1,[r8],#1
    cmp r1,#0x00
    beq comparar
    cmp r1,#97
    addeq r9, #1
    cmp r1,#101
    addeq r9, #1
    cmp r1,#105
    addeq r9, #1
    cmp r1,#111
    addeq r9, #1
    cmp r1,#117
    addeq r9, #1
    cmp r1,#65
    addeq r9, #1
    cmp r1,#69
    addeq r9, #1
    cmp r1,#73
    addeq r9, #1
    cmp r1,#79
    addeq r9, #1
    cmp r1,#85
    addeq r9, #1
    b compare_apellido

comparar:
    cmp r7,r9
    addeq r6,#1
    cmp r8,r10
    addeq r6,#1
    b letraFinal

letraFinal:
    ldrb r1,[r3],#1
    ldrb r2,[r4],#1
    cmp r1,r2
    addeq r6,#1
    str r6,[r5]
    ldr r0,=formato
    ldr r1,=fortuna
    ldr r1,[r1]
    bl printf
    b fin

fin:
    mov r0, #0
    mov r3, #0
    ldmfd sp!, {lr}    @@/ R13 = SP
    bx lr

