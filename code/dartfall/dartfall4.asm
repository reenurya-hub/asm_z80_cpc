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
;;--------------------------------------;;
;;		LIMPIA PANTALLA PARA MODO TEXTO ;;
;;--------------------------------------;;
call &bb6c
;;--------------------------------------;;
;;		ESCRIBE PRESENTACION            ;;
;;--------------------------------------;;
;; 40 CARACTERES ANCHO X 20 LARGO
;;Linea1
;; D   (_) A  (_)  R   (_) T   (_) F   (_) A   (_) L   (_) L
;;#44,#80,#41,#80,#52,#80,#54,#80,#46,#80,#41,#80,#4C,#80,#4C
ld a,#44
call PrintChar
ld a,#80
call PrintChar
ld a,#41
call PrintChar
ld a,#80
call PrintChar
ld a,#52
call PrintChar
ld a,#80
call PrintChar
ld a,#54
call PrintChar
ld a,#80
call PrintChar
ld a,#46
call PrintChar
ld a,#80
call PrintChar
ld a,#41
call PrintChar
ld a,#80
call PrintChar
ld a,#4C
call PrintChar
ld a,#80
call PrintChar
ld a,#4C
call PrintChar
;; Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;; Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;;Linea 4
;; J   u   e   g   o   (_) d   e   (_) h   a   b   i   l   i   d   a  d    (_) y   (_) p   u   n   t   e   r   i   a   .
;;#4A,#75,#65,#67,#6F,#80,#64,#65,#80,#68,#61,#62,#69,#6C,#69,#64,#61,#64,#80,#79,#80,#70,#75,#6E,#74,#65,#72,#69,#61,#90
ld a,#4A
call PrintChar
ld a,#75
call PrintChar
ld a,#65
call PrintChar
ld a,#67
call PrintChar
ld a,#6F
call PrintChar
ld a,#80
call PrintChar
ld a,#64
call PrintChar
ld a,#65
call PrintChar
ld a,#68
call PrintChar
ld a,#61
call PrintChar
ld a,#62
call PrintChar
ld a,#69
call PrintChar
ld a,#6C
call PrintChar
ld a,#69
call PrintChar
ld a,#64
call PrintChar
ld a,#61
call PrintChar
ld a,#64
call PrintChar
ld a,#80
call PrintChar
ld a,#79
call PrintChar
ld a,#80
call PrintChar
ld a,#70
call PrintChar
ld a,#75
call PrintChar
ld a,#6E
call PrintChar
ld a,#74
call PrintChar
ld a,#65
call PrintChar
ld a,#72
call PrintChar
ld a,#69
call PrintChar
ld a,#61
call PrintChar
ld a,#90
;;
;; Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;; Linea 6
;; U   n   (_) d   a   r   d   o   (_) s   e   (_) m   u   e   v   e   (_) d   e   (_) l   a   d   o   (_) a   (_) l   a   d   o 
;;#55,#6E,#80,#64,#61,#72,#64,#6F,#80,#73,#65,#80,#6D,#75,#65,#76,#65,#80,#64,#65,#80,#6C,#61,#64,#6F,#80,#61,#80,#6C,#61,#64,#6F
;; Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;, Linea 8
;; y   (_) el  (_) o   b   j   e   t   i   v   o   (_) e   s   (_) t   e   n   e   r   (_) p   r   e   c   i   s   i   o   n 
;;#79,#80,#65,#80,#6F,#62,#6A,#65,#74,#69,#76,#6F,#80,#65,#73,#80,#74,#65,#6E,#65,#72,#80,#70,#72,#65,#63,#69,#73,#69,#6F,#6E
;; Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;; Linea 10
;; p   a   r   a   (_) d   i   s   (_) p   a   r   a   r   l   o   (_) h   a   c   i   a   l   a   p   a   r   t   e   (_) i   n   f   e   r   i   o   r
;;#70,#61,#72,#61,#80,#64,#69,#73,#80,#70,#61,#72,#61,#72,#6C,#6F,#80,#68,#61,#63,#69,#61,#6C,#61,#70,#61,#72,#74,#65,#80,#69,#6E,#66,#65,#72,#69,#6F,#6E
;; Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;; Linea 12
;; d   e   (_) l   a   (_) p   a   n   t   a   l   l   a   .
;;#64,#65,#80,#6C,#61,#80,#70,#61,#6E,#74,#61,#6C,#6C,#61,#90
;;Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;;Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;; Linea 15:
;; P   r   e   p   a   r   a   ,   (_) a   p   u   n   t   a   (_) y   (_) d   i   s   p   a   r   a   (_) c   o   n   (_) E   S   P   A   C   I   O
;;#50,#72,#65,#70,#61,#72,#61,#2C,#80,#61,#70,#75,#6E,#74,#61,#80,#79,#80,#64,#69,#73,#70,#61,#72,#61,#80,#63,#6F,#6E,#80,#45,#53,#50,#41,#43,#49,#4F,
;;Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;;Linea 17:
;;C    a   d   a   (_) n   i   v   e   l   (_) i   n   c   r   e   m   e   n   t   a   (_) l   a  (_)  d   i   f   i   c   u   l   t   a   d   .
;;#43,#61,#64,#61,#80,#6E,#69,#76,#65,#6C,#80,#69,#6E,#63,#72,#65,#6D,#65,#6E,#74,#61,#80,#6C,#61,#80,#64,#69,#66,#69,#63,#75,#6C,#74,#61,#64,#90
;;Enter-Nva linea
;;#0D,#0A
ld a,#0D
call PrintChar
ld a,#0A
call PrintChar
;; P   r   e   s   i   o   n   a   (_) c   u   a   l   q   u   i   e   r   (_) t   e   c   l   a   (_) p   a   r   a   s   e   g   u   i   r   !
;;#50,#72,#65,#73,#69,#6F,#6E,#61,#80,#63,#75,#61,#6C,#70,#75,#69,#65,#72,#80,#74,#65,#63,#6C,#61,#80,#70,#61,#72,#61,#73,#65,#67,#75,#69,#72,#21
ld a,#44
call PrintChar
;;
;;
;;
;;ld b,#FF		;;Contador para 16 halts
;;esperar2:
;;   halt			;;Espera de 1/300 milisegundos
;;   halt
;;   dec b		;;Un halt menos para terminar
;; jr nz,esperar2			;;Saltara a halt si quedan repeticiones <> 0
;;
;;call cls
;;ld hl, #c000
;;ld (hl), #ff
;;
;;
;;
jr $