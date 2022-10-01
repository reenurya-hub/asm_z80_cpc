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
.PrintChar 		equ &BB5A
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
;;-------------------------------------------------;;
;; Pinta pixeles amarillos extremo izquierdo       ;;
;;-------------------------------------------------;;
;;
ld hl, #C000
ld d,  #19
.pinta0x80grupos8filas_1:
   ld e, #08
   .pinta0x80izqgrup8_1:
   ld(hl), #80
   ld bc,#0800
   add hl, bc
   dec e
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
.pinta0x80grupos8filas_2:
   ld e, #08
   .pinta0x80izqgrup8_2:
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
.pintaf0inf:
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
.pintaf0sup:
ld (hl), #F0
inc hl
dec a
jr nz, pintaf0sup
;;

jr $