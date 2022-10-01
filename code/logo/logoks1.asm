;;------------------------------------------------------------------------;;
;;              CONVENCIONES                                              ;;
;;------------------------------------------------------------------------;;
;; REGISTROS A PARA PASAR DATOS DE MEMORIA A HL
;; HL PARA MEMORIA DE VIDEO
;; BC PARA GUARDAR VALOR DE 2 BYTES
;; DE PARA GUARDAR VALOR DE 2 BYTES
;; F0 = TODOS AMARILLOS
;; 80 = AMARILLO, FONDO, FONDO, FONDO
;; 
;;------------------------------------------------------------------------;;
;;		DEFINICION DE POSICIONES DE PANTALLA			  ;;	
;;------------------------------------------------------------------------;;
.cls 			equ &BC14	;;Rutina firmware limpia pantalla
.esqsupizq 		equ &C000	;;Esquina superior izquierda pantalla
.sigfilaesqsupizq	equ &C800	;;Siguiente fila abajo esquina superior izquierda pantalla
PrintChar 		equ &BB5A
;; .esqsupder		equ &C04F	;;Esquina superior derecha pantalla
;; .esqinfizq		equ &FF80	;;Esquina inferior izquierda pantalla
;; .esqinfder		equ &FFCF	;;Esquina inferior derecha pantalla
;; .mitextizq		equ &DBC0	;;Mitad extrema izquierda
;; .mitextder		equ &DC0F	;;Mitad extrema derecha
;; .mitcentsup		equ &C027	;;Mitad central superior
;; .mitcentmed		equ &DBE7	;;Mitad central media
;; .mitcentinf		equ &FFA7	;;Mitad central inferior
;;
;;
org &4000		;Inicio datos de memoria
run &4000		;Inicio ejecucion del programa
;;------------------------------------------------------------------------;;
;;		PARTE PRINCIPAL DEL PROGRAMA				  ;;
;;------------------------------------------------------------------------;;
;;
;; db #00, #08, #B0, #37		;;Memoria en posicion 4000
call cls
;;
;;
;;-------------------------------------------------;;
;; Pinta logo KINGSOFT en la mitad de la pantalla  ;;
;;-------------------------------------------------;;
;;
;; Linea 1:
;; 00 FF FF FF FF FF FF FF FF 88 00
;;
ld hl, #DBE3
ld (hl),#00
inc hl
;;
ld a , #08
.pinta8_1:
ld (hl), #FF
inc hl
dec a
jr nz, pinta8_1
ld (hl),#88
inc hl
ld (hl),#00
;;
;; Linea 2:
;; 33 FF FF FF FF FF FF FF FF EE 00
;;
ld hl, #E3E3
ld (hl),#33
inc hl
;;
ld a , #08
.pinta8_2:
ld (hl), #FF
inc hl
dec a
jr nz, pinta8_2
ld (hl),#EE
inc hl
ld (hl),#00
;;
;; Linea 3:
;; 33 F0 F0 F0 F0 F0 F0 F0 F0 E6 00
;;
ld hl, #EBE3
ld (hl),#33
inc hl
;;
ld a , #08
.pinta8_3:
ld (hl), #F0
inc hl
dec a
jr nz, pinta8_3
;;
ld (hl),#E6
inc hl
ld (hl),#00
;;
;; Linea 4:
;; FC F0 F0 F0 F0 F0 F0 F0 F0 F1 88
;;
ld hl, #F3E3
ld (hl),#FC
inc hl
;;
ld a , #08
.pinta8_4:
ld (hl), #F0
inc hl
dec a
jr nz, pinta8_4
;;
ld (hl),#F1
inc hl
ld (hl),#88
;;
;; Linea 5:
;; FD F5 FB F5 FE FF F3	F3 FB FD 88
;;
ld hl, #FBE3
ld (hl),#FD
inc hl
ld (hl),#F5
inc hl
ld (hl),#FB
inc hl
ld (hl),#F5
inc hl
ld (hl),#FE
inc hl
ld (hl),#FF
inc hl
ld (hl),#F3
inc hl
ld (hl),#F3
inc hl
ld (hl),#FB
inc hl
ld (hl),#FD
inc hl
ld (hl),#88
;;
;; Linea 6:
;; FD F9 FB FD F0 F8 F4	FA F1 F1 88
;;
ld hl, #C433
ld (hl),#FD
inc hl
ld (hl),#F9
inc hl
ld (hl),#FB
inc hl
ld (hl),#FD
inc hl
ld (hl),#F0
inc hl
ld (hl),#F8
inc hl
ld (hl),#F4
inc hl
ld (hl),#FA
inc hl
ld (hl),#F1
inc hl
ld (hl),#F1
inc hl
ld (hl),#88
;;
;; Linea 7:
;; FD F1 FA FD F6 FF F4 FB F9 F1 88
;;
ld hl, #CC33
ld (hl),#FD
inc hl
ld (hl),#F1
inc hl
ld (hl),#FA
inc hl
ld (hl),#FD
inc hl
ld (hl),#F6
inc hl
ld (hl),#FF
inc hl
ld (hl),#F4
inc hl
ld (hl),#FB
inc hl
ld (hl),#F9
inc hl
ld (hl),#F1
inc hl
ld (hl),#88
;;
;; Linea 8:
;; FD F9 FA F5 F2 F1 F4 FA F1 F1 88
;;
ld hl, #D433
ld (hl),#FD
inc hl
ld (hl),#F9
inc hl
ld (hl),#FA
inc hl
ld (hl),#F5
inc hl
ld (hl),#F2
inc hl
ld (hl),#F1
inc hl
ld (hl),#F4
inc hl
ld (hl),#FA
inc hl
ld (hl),#F1
inc hl
ld (hl),#F1
inc hl
ld (hl),#88
;;
;; Linea 9:
;; FD F5 FA F5 FE FF F3 F2 F1 F1 88
;;
ld hl, #DC33
ld (hl),#FD
inc hl
ld (hl),#F5
inc hl
ld (hl),#FA
inc hl
ld (hl),#F5
inc hl
ld (hl),#FE
inc hl
ld (hl),#FF
inc hl
ld (hl),#F3
inc hl
ld (hl),#F2
inc hl
ld (hl),#F1
inc hl
ld (hl),#F1
inc hl
ld (hl),#88
;;
;; Linea 10:
;; FC FD F0 F0 F0 F0 F0 F0 F0 F1 88						
;;
ld hl, #E433
ld (hl),#FC
inc hl
;;
ld a , #08
.pinta8_10:
ld (hl), #F0
inc hl
dec a
jr nz, pinta8_10
;;
ld (hl),#F1
inc hl
ld (hl),#88
;;
;; Linea 11:
;; 33 F0 F0 F0 F0 F0 F0 F0 F0 E6 00
;;
ld hl, #EC33
ld (hl),#33
inc hl
;;
ld a , #08
.pinta8_11:
ld (hl), #F0
inc hl
dec a
jr nz, pinta8_11
;;
ld (hl),#E6
inc hl
ld (hl),#00
;;
;; Linea 12
;; 33 FF FF FF FF FF FF FF FF EE 00
;;
ld hl, #F433
ld (hl),#33
inc hl
;;
ld a , #08
.pinta8_12:
ld (hl), #FF
inc hl
dec a
jr nz, pinta8_12
;;
ld (hl),#EE
inc hl
ld (hl),#00
;;
;; Linea 13:
;; 00 FF FF FF FF FF FF FF FF 88 00
;;
ld hl, #FC33
ld (hl),#00
inc hl
;;
ld a , #08
.pinta8_13:
ld (hl), #FF
inc hl
dec a
jr nz, pinta8_13
;;
ld (hl),#88
inc hl
ld (hl),#00
ld b,#FF		;;Contador para 16 halts
esperar:
   halt			;;Espera de 1/300 milisegundos
   halt
   dec b		;;Un halt menos para terminar
 jr nz,esperar			;;Saltara a halt si quedan repeticiones <> 0
;;
;;
;;
;; call cls
ld hl, #DBE3
ld b, #0B
borra1:
ld (hl),#00
inc hl
dec b
jr nz, borra1
;;
;;
;;
ld hl, #E3E3
ld b, #0B
borra2:
ld (hl),#00
inc hl
dec b
jr nz, borra2
;;
;;
;;
ld hl, #EBE3
ld b, #0B
borra3:
ld (hl),#00
inc hl
dec b
jr nz, borra3
;;
;;
;;
ld hl, #F3E3
ld b, #0B
borra4:
ld (hl),#00
inc hl
dec b
jr nz, borra4
;;
;;
;;
ld hl, #FBE3
ld b, #0B
borra5:
ld (hl),#00
inc hl
dec b
jr nz, borra5
;;
;;
;;
ld hl, #C433
ld b, #0B
borra6:
ld (hl),#00
inc hl
dec b
jr nz, borra6
;;
;;
;;
ld hl, #CC33
ld b, #0B
borra7:
ld (hl),#00
inc hl
dec b
jr nz, borra7
;;
;;
;;
ld hl, #D433
ld b, #0B
borra8:
ld (hl),#00
inc hl
dec b
jr nz, borra8
;;
;;
;;
ld hl, #DC33
ld b, #0B
borra9:
ld (hl),#00
inc hl
dec b
jr nz, borra9
;;
;;
;;
ld hl, #E433
ld b, #0B
borra10:
ld (hl),#00
inc hl
dec b
jr nz, borra10
;;
;;
;;
ld hl, #EC33
ld b, #0B
borra11:
ld (hl),#00
inc hl
dec b
jr nz, borra11
;;
;;
;;
ld hl, #F433
ld b, #0B
borra12:
ld (hl),#00
inc hl
dec b
jr nz, borra12
;;
;;
;;
ld hl, #FC33
ld b, #0B
borra13:
ld (hl),#00
inc hl
dec b
jr nz, borra13
;;
;;
;;
jr $