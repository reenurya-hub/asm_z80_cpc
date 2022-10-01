;;sirve para mas de dos posiciones de logo
.cls 	equ &BC14	;; Clear screen
org &4000
run &4000
;
call cls		;; clear screen
ld hl, #c020
ld a,l
ld (posl),a
ld a,#05
call loopgg
jr $
;
loopgg:
   ld (cont),a
   push hl
   ld bc,logo_1
   ld e,#08
   call loopg
   pop hl
   push bc
   ld bc,#0050
   add hl,bc
   pop bc
   ld a,l
   ld (posl),a
   push hl
   ld bc,logo_2
   ld e,#08
   call loopg
   pop hl
   push bc
   ld bc,#0050
   add hl,bc
   pop bc
   ld a,l
   ld (posl),a
   ld a,(cont)
   dec a
jr nz, loopgg
ret
;
loopg:
   ld d,#0b
   call loop
   ld a,h
   add a,#08
   ld h,a
   ld a,(posl)
   ld l,a
   dec e
jr nz, loopg
ret
;
loop:
   ld a, (bc)
   ld (hl), a
   inc l
   inc c
   dec d
jr nz,loop
ret
;
logo_1:
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #FC, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88
db #FD, #F5, #FB, #F5, #FE, #FF, #F3, #F3, #FB, #FD, #88
db #FD, #F9, #FB, #FD, #F0, #F8, #F4, #FA, #F1, #F1, #88
ret
logo_2:
db #FD, #F1, #FA, #FD, #F6, #FF, #F4, #FB, #F9, #F1, #88
db #FD, #F9, #FA, #F5, #F2, #F1, #F4, #FA, #F1, #F1, #88
db #FD, #F5, #FA, #F5, #FE, #FF, #F3, #F2, #F1, #F1, #88
db #FC, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
ret
posl:
db #00
ret
cont:
db #00
ret