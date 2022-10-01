;;sirve para mas de dos posiciones de logo
;;testlog9_0.asm ok ok ok okokok segunda forma
.cls 	equ &BC14	;; Clear screen
org &4000
run &4000
;;
call cls		;; clear screen
ld hl, #c020
ld a,#01
call loopgg
jr $
;;
loopgg:
   ld bc,logo
   ld e,#08
   call loopg
   ld de, #c050
   add hl,de
   ;second 8 row group pixels
   ld e,#08
   call loopg
   ld de,#cfb0
   add hl,de
   ld e,#01
   call looperase1
   ;;waint until 'down' logo
   ;ld b,#cc
   ;call wait
   ;ld de, #ff60
   ;add hl,de
   ;ld e,#08
   ;call looperase1
   ;ld de, #c050
   ;add hl,de
   ;ld e,#08
   ;call looperase1
   ;ld de, #c050
   ;add hl,de
   dec a
jr nz, loopgg
ret
;;

;;
looperase1:
   ld d,#0b
   call looperase2
   ld bc,#07f5 ;;800 next row - 0b last column
   add hl,bc
   dec e
jr nz, looperase1
ret
;;
looperase2:
   ld (hl), #00
   inc l
   dec d
jr nz,looperase2
ret
;;
loopg:
   ld d,#0b
   call loop
   push bc
   ld bc,#07f5 ;;800 next row - 0b last column
   add hl,bc
   pop bc 
   dec e
jr nz, loopg
ret
;;
loop:
   push af
   ld a, (bc)
   ld (hl), a
   pop af
   inc l
   inc c
   dec d
jr nz,loop
ret
;;
logo:
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #FC, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88
db #FD, #F5, #FB, #F5, #FE, #FF, #F3, #F3, #FB, #FD, #88
db #FD, #F9, #FB, #FD, #F0, #F8, #F4, #FA, #F1, #F1, #88
db #FD, #F1, #FA, #FD, #F6, #FF, #F4, #FB, #F9, #F1, #88
db #FD, #F9, #FA, #F5, #F2, #F1, #F4, #FA, #F1, #F1, #88
db #FD, #F5, #FA, #F5, #FE, #FF, #F3, #F2, #F1, #F1, #88
db #FC, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
ret
;;
wait:
   halt
   dec b
jr nz,wait
ret