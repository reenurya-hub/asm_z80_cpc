org #4000			
run #4000
;;
ld d,#09
ld hl,posiciones	;; obtiene la direccion de memoria de posiciones
ld (poshl),hl		;; guarda en poshl el valor de hl (dir mem. posiciones)
ld a, (poshl)		;; carga en a el valor de (poshl), los dos ultimos digitos
inc a			;; incrementa a (mueve una posicion)
ld (poshl),a



ld hl,(posiciones)	;; asigna a HL la posicion que va a tomar
ld (hl),#ff
ld hl,(posiciones+2)
ld (hl),#ff
ld hl,(posiciones+2)
ld (hl),#ff

;;ld hl,a
;;call recorre			

JR $

recorre:
ld a,(hl)
ld (hl),60
ld bc, #0800
add hl, bc
ld (hl), #F6
add hl, bc
ld (hl), #F6
add hl, bc
ld (hl), #60
;;ld a, #03
;;call borra
inc a
dec d
jr nz, recorre
ret

borra:
ld (hl), #00
add hl,bc
dec a
jp p, borra
ret

poshl: dw #0000
ret

posiciones:
dw #E780, #C780, #E730, #C731, #E6E2, #E6E3, #C734, #E735, #C785, #E785
RET


espera:			
   halt			        ;;Espera de 1/300 milisegundos
   dec b			;;Un halt menos para terminar
 jr nz,espera			;;Saltara a halt si quedan repeticiones <> 0
ret			
