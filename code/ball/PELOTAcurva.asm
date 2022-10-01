org #4000			
run #4000			

;;1
ld hl,#E780
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#E7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#E7			;;HL vuelve a apuntar a la primera fila
;;2
ld hl,#C780
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#CF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#CF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;3
ld hl,#E730
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#E7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#E7			;;HL vuelve a apuntar a la primera fila
;;4
ld hl, #c730
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#cF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#cF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;5
ld hl, #EEE1
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#F6			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#FE			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld hL,#C731			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld hL,#EEE1			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#F6			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#FE			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld hL,#C731			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#EE			;;HL vuelve a apuntar a la primera fila
;;6
ld hl, #E6E2
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EE			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#F6			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#FE			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#E6			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EE			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#F6			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#FE			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#E6			;;HL vuelve a apuntar a la primera fila
;;7
LD HL,#EEE3
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#F6			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#FE			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld hL,#C733			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld hL,#EEE3			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#F6			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#FE			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld hL,#C733			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#EE			;;HL vuelve a apuntar a la primera fila
;;
LD HL,#C734
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#CF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#CF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
LD HL,#E735
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#E7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
LD HL,#C785
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#CF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#CF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#D7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#DF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#C7			;;HL vuelve a apuntar a la primera fila
;;
LD HL,#E785
;;
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#EF			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#F7			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#FF			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#E7			;;HL vuelve a apuntar a la primera fila
;;
ld b,#CC
call espera
;;
;;
; ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
; ld h,#EF			;;HL apunta a la segunda fila de pixeles
; ld (hl),#00			;;Segunda fila de la pelota
; ld h,#F7			;;HL apunta a la tercera fila de pixeles
; ld (hl),#00			;;Tercera fila de la pelota
; ld h,#FF			;;HL apunta a la cuarta fila de pixeles
; ld (hl),#00			;;Cuarta fila de pixeles
JR $





espera:			
   halt			        ;;Espera de 1/300 milisegundos
   dec b			;;Un halt menos para terminar
 jr nz,espera			;;Saltara a halt si quedan repeticiones <> 0
ret			
