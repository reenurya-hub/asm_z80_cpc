; guardamemvideo6.asm
; Programa guarda en memoria direccion 
; memoria de video 
; la recupera y pinta el sprite
org &4000
run &4000
ld bc, posvid	;BC=vr inic posvid
ld d, #16
;;
;; INICIO - Programa Principal
loop:
ld a, (bc)		;A = valor en BC
ld l, a		;L = valor de A
inc c		;sig reg posvid
ld a,(bc)		;A = valor en BC
ld h,a		;H = valor de A
inc c		;sig reg posvid
push hl		;pila = HL
call pinta		;llama pintar pixel
;;pop hl		;HL = pila
ld a, #20
;push hl
call espera
;pop hl
call borra
dec d
jr nz,loop
JR $
;; FIN - Programa Principal
; valor pos mem vid
.posvid:
db #80, #ff,   #80, #f7, #80, #ef, #80, #e7
db #80, #df,  #80, #d7, #80, #cf, #80, #c7
db #31, #ff,   #32, #f7, #33, #ef
db #34, #ef,  #35, #f7, #36, #ff
db #87, #c7, #87, #cf, #87, #d7, #87, #df
db #87, #e7, #87, #ef, #87, #f7, #87, #ff
ret
;pinta sprite en HL
.pinta:
ld (hl), #88
.espera:
   halt
   dec ajr nz,espera
ret
borra:
ld (hl), #00
ret