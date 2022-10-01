; guardamemvideo4.asm
; Programa guarda en memoria direccion 
; memoria de video 
; la recupera y pinta el sprite
org &4000
run &4000
ld bc, posvid	;BC=vr inic posvid
ld d, #08
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
pop hl		;HL = pila
dec d
jr nz,loop
JR $
;; FIN - Programa Principal
; valor pos mem vid
.posvid:
db #01, #c0, 02, #c8, 03, #d0, #04, #d8 
db #05, #e0, #06, #e8, #07, #f0, #08, #f8
ret
;pinta sprite en HL
.pinta:
ld (hl), #FF
inc l
ld (hl), #FF
inc l
ld (hl), #FF
ret