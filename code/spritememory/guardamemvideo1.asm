;guardamemvideo1.asm
; programa que guarda en memoria una direccion de memoria de video y un sprite
; y pinta el sprite en esa direccion de memoria de video que fue almacenada
org &4000
run &4000
ld bc, (valor)	;carga en registro BC el valor de la memoria de video
ld h, b		;carga en registro H valor de registro B (C0)
ld l, c		;carga en registro L valor de registro C (01)
ld a,(sprite)	;carga en registro A el valor del sprite (FF)
ld (hl), a		;carga en el contenido de registro HL el valor del registro A
jr $
.valor:		;guarda el valor de la memoria de video C001
db #01,#C0
ret
.sprite:		;guarda el valor del sprite
db #FF
ret