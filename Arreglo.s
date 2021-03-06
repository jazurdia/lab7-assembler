/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
*	Daniel Cabrera
*	Javier Azurdia
* Arreglo.s
 ----------------------------------------------- */
 
.data
.align 2

cantidad_Leche: .word 20
precio_Leche: .word 18
cantidad_Solicitada_Leche: .word 0

cantidad_Galletas: .word 32
precio_Galletas: .word 25
cantidad_Solicitada_Galletas: .word 0

cantidad_Mantequilla: .word 15
precio_Mantequilla: .word 10
cantidad_Solicitada_Mantequilla: .word 0

cantidad_Queso: .word 15
precio_Queso: .word 35
cantidad_Solicitada_Queso: .word 0

cantidad_Pan: .word 20
precio_Pan: .word 4
cantidad_Solicitada_Pan: .word 0

cantidad_Jalea: .word 18
precio_Jalea: .word 26
cantidad_Solicitada_Jalea: .word 0

cantidad_Yogurt: .word 35
precio_Yogurt: .word 8
cantidad_Solicitada_Yogurt: .word 0

cantidad_Manzana: .word 35
precio_Manzana: .word 19
cantidad_Solicitada_Manzana: .word 0

nombre: .asciz "                   "
op: .byte ' '
cantidad: .word 0
total: .word 0

formatoNum:	.asciz "%d"
formatoC:	.asciz "%c"
formatoS:	.asciz " %s"
formatoNombre: .asciz "Ingrese su nombre: "
formatoError: .asciz "Ha ocurrido un error"
formatoIngreso: .asciz "Ingrese el numero del alimento que desea comprar: "
formatoAlimento: .asciz "Ingrese la cantidad de producto que desea: "
formatoMenu: .asciz "Menu: \n1. Leche\n2. P. Galletas\n3. Mantequilla\n4. Queso\n5. Uni. Pan\n6. Jalea \n7. Uni. Yogurt\n8. Lb. Manzana\n9. Salir"


formatoSalida1: .asciz "Nombre del cliente: %s \n"
formatoSalida2: .asciz "Producto		Precio		Cantidad		SubTotal\n"
formatoLeche: .asciz "Leche			Q.18		%d			"
formatoGalleta: .asciz "\nGalletas		Q.25		%d			"
formatoMantequilla: .asciz "\nMantequilla		Q.10		%d			"
formatoQueso: .asciz "\nQueso			Q.35		%d			"
formatoPan: .asciz "\nPan			Q.4		%d			"
formatoJalea: .asciz "\nJalea			Q.26		%d			"
formatoYogurt: .asciz "\nYogurt			Q.8		%d			"
formatoManzana: .asciz "\nManzana			Q.19		%d			"
formatoTotal: .asciz "\n\nTotal a pagar: %d\n"

.text
.align 2
.global main
.type main,%function

main:
	stmfd sp!,{lr}
	ldr r0, =formatoNombre
	bl puts

	ldr r0, =formatoS
	ldr r1, =nombre
	bl scanf
	

	
menu:
	ldr r0, =formatoMenu
	bl puts

	ldr r0,=formatoIngreso
	bl puts
	
	ldr r0, =formatoNum
	ldr r1, =op
	bl scanf
	
	ldr r4, =op
	ldr r4,[r4]
	cmp r4,#1
	beq opLeche

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#2
	beq opGalleta

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#3
	beq opMantequilla

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#4
	beq opQueso

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#5
	beq opPan

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#6
	beq opJalea

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#7
	beq opYogurt

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#8
	beq opManzana

	ldr r4,=op
	ldr r4,[r4]
	cmp r4,#9
	beq salir
	


opLeche:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Leche
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	
	cmp r5, r1
	blt Error
	
	
	ldr r5, =cantidad_Leche
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Leche
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Leche
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Leche
	str r6,[r8]

	ldr r7, =precio_Leche
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opGalleta:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Galletas
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	
	ldr r5, =cantidad_Galletas
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Galletas
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Galletas
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Galletas
	str r6,[r8]

	ldr r7, =precio_Galletas
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opMantequilla:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Mantequilla
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	
	
	ldr r5, =cantidad_Mantequilla
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Mantequilla
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Mantequilla
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Mantequilla
	str r6,[r8]

	ldr r7, =precio_Mantequilla
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opQueso:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Queso
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	
	
	ldr r5, =cantidad_Queso
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Queso
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Queso
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Queso
	str r6,[r8]

	ldr r7, =precio_Queso
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opPan:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Pan
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	
	
	ldr r5, =cantidad_Pan
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Pan
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Pan
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Pan
	str r6,[r8]

	ldr r7, =precio_Pan
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opJalea:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Jalea
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	
	
	ldr r5, =cantidad_Jalea
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Jalea
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Jalea
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Jalea
	str r6,[r8]

	ldr r7, =precio_Jalea
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opYogurt:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Yogurt
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	

	ldr r5, =cantidad_Yogurt
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Yogurt
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Yogurt
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Yogurt
	str r6,[r8]

	ldr r7, =precio_Yogurt
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

opManzana:
	ldr r0, =formatoAlimento
	bl puts

	ldr r0, =formatoNum
	ldr r1, =cantidad
	bl scanf

	ldr r5, =cantidad_Manzana
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	
	cmp r5, r1
	blt Error
	
	
	ldr r5, =cantidad_Manzana
	ldr r5, [r5]
	ldr r1, =cantidad
	ldr r1, [r1]
	sub r5, r1
	ldr r5, =cantidad_Manzana
	str r1, [r5]

	
	ldr r1, =cantidad
	ldr r1, [r1]
	ldr r6, =cantidad_Solicitada_Manzana
	ldr r6, [r6]
	add r6, r1
	ldr r8, =cantidad_Solicitada_Manzana
	str r6,[r8]

	ldr r7, =precio_Leche
	ldr r7, [r7]
	ldr r12, =total
	ldr r12,[r12]
	mul r10, r6, r7
	add r12,r10
	ldr r11, =total
	str r12, [r11]

	b menu

Error:
	ldr r0, =formatoError
	bl puts
	b menu

	
salir:

	
	ldr r0, =formatoSalida1
	ldr r1, =nombre
	bl printf

	ldr r0, =formatoSalida2
	bl printf

	@@ Ciclo de Leche
	ldr r0, =formatoLeche
	ldr r1, =cantidad_Solicitada_Leche
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Leche
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Leche
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Galletas
	ldr r0, =formatoGalleta
	ldr r1, =cantidad_Solicitada_Galletas
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Galletas
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Galletas
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Mantequilla
	ldr r0, =formatoMantequilla
	ldr r1, =cantidad_Solicitada_Mantequilla
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Mantequilla
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Mantequilla
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Queso
	ldr r0, =formatoQueso
	ldr r1, =cantidad_Solicitada_Queso
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Queso
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Queso
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Pan
	ldr r0, =formatoPan
	ldr r1, =cantidad_Solicitada_Pan
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Pan
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Pan
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Jalea 
	ldr r0, =formatoJalea
	ldr r1, =cantidad_Solicitada_Jalea
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Jalea
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Jalea
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Yogurt
	ldr r0, =formatoYogurt
	ldr r1, =cantidad_Solicitada_Yogurt
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Yogurt
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Yogurt
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Ciclo de Manzana
	ldr r0, =formatoManzana
	ldr r1, =cantidad_Solicitada_Manzana
	ldr r1, [r1]
	bl printf

	ldr r0, =formatoNum
	ldr r2, =precio_Manzana
	ldr r2, [r2]
	ldr r1, =cantidad_Solicitada_Manzana
	ldr r1, [r1]
	mul r1, r1, r2
	bl printf

	@@ Total
	ldr r0, =formatoTotal
	ldr r1, =total
	ldr r1, [r1]
	bl printf


	mov r0, #0
	mov r3, #0
	
	ldmfd sp!,{lr}
	bx lr
