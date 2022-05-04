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
name_lenght: .word 12
lastname: .asciiz "Apellido"
lastname_lenght: .word 12



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


.global calcular_caracteres

@@ suponemos que r0 es el valor de la cadena
calcular_caracteres:
    @@ lee una cadena de texto y encuentra la cantidad de caracteres
    
    



