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
.cls 			equ &BC14	;; Rutina firmware limpia pantalla
.esqsupizq 		equ &C000	;; Esquina superior izquierda pantalla
.sigfilaesqsupizq	equ &C800	;; Siguiente fila abajo esquina superior izquierda pantalla
.printchar 		equ &BB5A	;; Rutina firmware pinta caracter pantalla
.leertecla              equ &BB1E	;; Rutina firmware para leer la tecla
;; .esqsupder		equ &C04F	;; Esquina superior derecha pantalla
;; .esqinfizq		equ &FF80	;; Esquina inferior izquierda pantalla
;; .esqinfder		equ &FFCF	;; Esquina inferior derecha pantalla
;; .mitextizq		equ &DBC0	;; Mitad extrema izquierda
;; .mitextder		equ &DC0F	;; Mitad extrema derecha
;; .mitcentsup		equ &C027	;; Mitad central superior
;; .mitcentmed		equ &DBE7	;; Mitad central media
;; .mitcentinf		equ &FFA7	;; Mitad central inferior
;;
;;
;;------------------------------------------------------------------------;;
;;		PARTE PRINCIPAL DEL PROGRAMA                              ;;
;;------------------------------------------------------------------------;;
;;
org &4000		;Inicio datos de memoria
run &4000		;Inicio ejecucion del programa
;;
;;
;;
;;-------------------------------------------------;;
;; LLAMADO DE RUTINAS PRINCIPALES DEL JUEGO        ;;
;;                                                 ;;
;;-------------------------------------------------;;
;call &bb6c
call cls
call pintalogo
call borralogo
call presentacion
call continuar1
call pintamarco
;;
;;
;;
ld hl,#d002
looprep:
call nivel1
ld a,66
call leertecla
jp z,looprep		;; Mientras no se presione Espacio (47) no
;;
;;
;;
call continuar2


jr $
;;
;;------------------------------------------------------------------------;;
;;		FIN DEL PROGRAMA                                          ;;
;;------------------------------------------------------------------------;;
;;
;;
;;
;;-------------------------------------------------;;
;; Pinta logo KINGSOFT en la mitad de la pantalla  ;;
;;-------------------------------------------------;;
.pintalogo:
;;
;; Linea 1:
;; 00 FF FF FF FF FF FF FF FF 88 00
;;
ld hl, #DBE3
ld (hl),#00
inc hl
;;
ld a , #08				
ld b , #FF
call pinta4pix8lins
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
;;
ld a , #08
ld b , #FF
call pinta4pix8lins
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
ld b , #F0
call pinta4pix8lins
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
ld b , #F0
call pinta4pix8lins
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
ld b , #F0
call pinta4pix8lins
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
ld b , #F0
call pinta4pix8lins
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
ld b , #FF
call pinta4pix8lins
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
ld b , #FF
call pinta4pix8lins
;;
ld (hl),#88
inc hl
ld (hl),#00
;;
;;
;; Rutina de espera entre pintar logo y borrarlo
;;
;;
ld b,#FF		;; Contador para 16 halts
esperar:
   halt			;; Espera de 1/300 milisegundos
   halt			;; Halt doble
   dec b		;; Un halt menos para terminar
 jr nz,esperar		;;Saltara a halt si quedan repeticiones <> 0
;;
;;
;;
ret			;; FIN DE PINTALOGO.
;;
;;
;;
;;-------------------------------------------------;;
;; Borra logo KINGSOFT de la pantalla              ;;
;;-------------------------------------------------;;
.borralogo:
;; call cls
ld hl, #DBE3		;; Posiciona HL en posicion pintada mem. video
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
ret				;; FIN DE BORRALOGO.
;;
;;
;;
;;--------------------------------------;;
;;	ESCRIBE PRESENTACION            ;;
;;--------------------------------------;;
presentacion:
;;call cls
call &bb6c			;;Limpia pantalla para modo texto
ld hl,texto
ld b,#ED
call printstring
;;ret
;;
;;
;;
ld hl,texto2
ld b,#21
call printstring
;;
ret				;; FIN DE RUTINA PRESENTACION
;;--------------------------------------;;
;;	CONTINUA DESPUES DE PRESENTACION;;
;;--------------------------------------;;
.continuar1:
ld a,18
call leertecla			
jr z,continuar1			;; Mientras no se presione Enter (18) no
call limpiapantalla		;; se llama a limpia pantalla
ret
;;
.limpiapantalla:
call cls
;;call &bb6c
ret
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
.texto:
;;  D   (_) A  (_)  R   (_) T   (_) F   (_) A   (_) L  (_)  L  [15]
db #44,#80,#41,#80,#52,#80,#54,#80,#46,#80,#41,#80,#4C,#80,#4C ;;0F
;; Enter-Nva line [2]
db #0D,#0A ;;11
;; Enter-Nva line [2]
db #0D,#0A ;;13
;;  J   u   e   g   o   (_) d   e   (_) h   a   b   i   l   i   d   a  d    (_) y   (_) p   u   n   t   e   r   i   a [29]   .
db #4A,#75,#65,#67,#6F,#80,#64,#65,#80,#68,#61,#62,#69,#6C,#69,#64,#61,#64,#80,#79,#80,#70,#75,#6E,#74,#65,#72,#69,#61,#2E ;;31
;; Enter-Nva line [2]
db #0D,#0A ;;33
;; Enter-Nva linea [2]
db #0D,#0A ;;35
;;  U   n   (_) d   a   r   d   o   (_) s   e   (_) m   u   e   v   e   (_) l   a   d   o   (_) a   (_) l   a   d   o   .  [30] 
db #55,#6E,#80,#64,#61,#72,#64,#6F,#80,#73,#65,#80,#6D,#75,#65,#76,#65,#80,#6C,#61,#64,#6F,#80,#61,#80,#6C,#61,#64,#6F,#2E ;;53
;; Enter-Nva linea [2]
db #0D,#0A ;;55
;;  O   b   j   e   t   i   v   o   :   (_) t   e   n   e   r   (_) p   r   e   c   i   s   i   o   n [24]
db #4F,#62,#6A,#65,#74,#69,#76,#6F,#3A,#80,#74,#65,#6E,#65,#72,#80,#70,#72,#65,#63,#69,#73,#69,#6F,#6E ;;6E
;; Enter-Nva linea [2]
db #0D,#0A ;;70
;;  p   a   r   a   (_) d   i   s   p   a   r   a   r   (_) h   a   c   i   a   (_)  e   l  (_) b   l   a   n   c   o [29]
db #70,#61,#72,#61,#80,#64,#69,#73,#70,#61,#72,#61,#72,#80,#68,#61,#63,#69,#61,#80,#65,#6C,#80,#62,#6C,#61,#6E,#63,#6F ;;8D
;; Enter-Nva linea [2]
db #0D,#0A ;;8F
;;  d   e   (_) l   a   (_) p   a   n   t   a   l   l   a   . [14]
db #64,#65,#80,#6C,#61,#80,#70,#61,#6E,#74,#61,#6C,#6C,#61,#2E ;;9E
;;Enter-Nva linea [2]
db #0D,#0A ;;A0
;;  P   r   e   p   a   r   a   ,   (_) a   p   u   n   t   a   (_) y   (_) d   i   s   p   a   r   a   (_) c   o   n   (_) E   S   P   A   C   I   O [37]
db #50,#72,#65,#70,#61,#72,#61,#2C,#80,#61,#70,#75,#6E,#74,#61,#80,#79,#80,#64,#69,#73,#70,#61,#72,#61,#80,#63,#6F,#6E,#80,#45,#53,#50,#41,#43,#49,#4F ;;C5
;;Enter-Nva linea [2]
db #0D,#0A ;;C7
;; C   a   d   a   (_) n   i   v   e   l   (_) i   n   c   r   e   m   e   n   t   a   (_) l   a  (_)  d   i   f   i   c   u   l   t   a   d   . [36]
db #43,#61,#64,#61,#80,#6E,#69,#76,#65,#6C,#80,#69,#6E,#63,#72,#65,#6D,#65,#6E,#74,#61,#80,#6C,#61,#80,#64,#69,#66,#69,#63,#75,#6C,#74,#61,#64,#2E ;;EB
;;Enter-Nva linea [2]
db #0D,#0A ;;ED
;;
ret
;;
;;
;;
.texto2:
;;Enter-Nva linea [2]
db #0D,#0A ;;02
;;Enter-Nva linea [2]
db #0D,#0A ;;04
;;  P   r   e   s   i   o   n   a   (_) "   E   n   t   e   r   "   (_) [17]
db #50,#72,#65,#73,#69,#6F,#6E,#61,#80,#22,#45,#6E,#74,#65,#72,#22,#80 ;;15
;;  p   a   r   a   (_) s   e   g   u   i   r   ! [12]
db #70,#61,#72,#61,#80,#73,#65,#67,#75,#69,#72,#21 ;;21
;;Enter-Nva linea [2]
;;db #0D,#0A ;;27
ret
;;
;;
.pinta4pix8lins:
ld (hl), b
inc hl
dec a
jr nz, pinta4pix8lins
ret
;;
.printstring:
ld a,(hl)
call printchar
inc hl
dec b
jr nz, printstring
ret
;;
.pintamarco:
;;-------------------------------------------------;;
;; Pinta pixeles amarillos extremo izquierdo       ;;
;;-------------------------------------------------;;
;;
ld hl, #C000
ld d,  #19
.pinta0x80grupos8filas_1
   ld e, #08
   .pinta0x80izqgrup8_1
   ld(hl), #80
   ld bc,#0800
   add hl, bc
   dec e
   ;;jp p, pinta0x80izqgrup8_1
   jr nz, pinta0x80izqgrup8_1
ld a, h
sub #08
ld h, a
ld bc, #C850
add hl, bc
dec d
jr nz, pinta0x80grupos8filas_1
;;
;;-------------------------------------------------;;
;; Pinta pixeles amarillos extremo derecho         ;;
;;-------------------------------------------------;;
;;						
ld hl, #C04F						
ld d,  #19						
.pinta0x80grupos8filas_2						
   ld e, #08						
   .pinta0x80izqgrup8_2						
   ld(hl), #10						
   ld bc,#0800						
   add hl, bc						
   dec e   						
   jr nz, pinta0x80izqgrup8_2						
ld a, h						
sub #08						
ld h, a						
ld bc, #C850						
add hl, bc						
dec d						
jr nz, pinta0x80grupos8filas_2						
;;						
;;-------------------------------------------------;;						
;; Pinta pixeles amarillos parte inferior pantalla ;;						
;;-------------------------------------------------;;						
;;						
ld hl, #FF80						
ld a , #50						
.pintaf0inf						
ld (hl), #F0						
inc hl						
dec a						
jr nz, pintaf0inf						
;;						
;;-------------------------------------------------;;						
;; Pinta pixeles amarillos parte superior pantalla ;;						
;;-------------------------------------------------;;						
;;						
ld hl, esqsupizq						
ld a , #50						
.pintaf0sup						
ld (hl), #F0						
inc hl						
dec a						
jr nz, pintaf0sup						
;;
;; PRUEBAS EN LA PARTE INFERIOR DE LA PANTALLA					
ld hl, #f7A7
ld (hl), #FF
inc hl
ld (hl), #FF
;;
ld hl, #ffA7
ld (hl), #FF
inc hl
ld (hl), #FF
;;
ld hl, #f7A5
ld (hl), #0F
inc hl
ld (hl), #0F
;;
ld hl, #fFA5
ld (hl), #0F
inc hl
ld (hl), #0F
;;
ld hl, #f7A9
ld (hl), #0F
inc hl
ld (hl), #0F
;;
ld hl, #fFA9
ld (hl), #0F
inc hl
ld (hl), #0F
;
ret

nivel1:
;; esto se debe colocar en una rutina
ld hl,#d002
ld c,#4c
loop1:
call dibujar
 ld b,#10
call esperar1
call borrar
inc hl
dec c
jr nz,loop1
call dibujar
ld c,#4c
loop2:
call dibujar
ld b,#10
call esperar1
call borrar
dec hl
dec c
jr nz, loop2
call dibujar
ret


.dibujar:
ld (hl),#66
ld h,#D0
ld (hl),#66
ld h,#D8
ld (hl),#66
ld h,#E0
ld (hl),#66
ld h,#E8
ld (hl),#66
ld h,#F0
ld (hl),#66
ld h,#F8
ret
.esperar1:
   halt
   dec b
 jr nz,$-2
ret
.borrar:
ld (hl),#00
ld h,#D0
ld (hl),#00
ld h,#D8
ld (hl),#00
ld h,#E0
ld (hl),#00
ld h,#E8
ld (hl),#00
ld h,#F0
ld (hl),#00
ld h,#F8
ret
.continuar2:
ld a,#2b
ret