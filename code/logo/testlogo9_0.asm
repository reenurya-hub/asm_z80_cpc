;;sirve para mas de dos posiciones de logo
;;testlog9_0.asm ok ok ok
.cls 	equ &BC14	;; Clear screen
org &4000
run &4000
;
call cls		;; clear screen
ld hl, #c020
ld a,#05
call loopgg
jr $
;
loopgg:
   ld bc,logo_1
   ld (poslogo1),bc
   ld e,#08
   call loopg
   ld bc,logo_2
   ld (poslogo1),bc
   ld e,#08
   call loopg
   dec a
jr nz, loopgg
ret
;
loopg:
   ld d,#0b
   call loop
   ld bc,#fff5
   add hl,bc
   ld bc,#0800
   add hl,bc
   dec e
jr nz, loopg
ld bc, #c050
add hl,bc
ret
;
loop:
   ld bc,(poslogo1)
   push af
   ld a, (bc)
   ld (hl), a
   pop af
   inc l
   inc c
   ld (poslogo1),bc
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
poslogo1:
dw #00
ret
