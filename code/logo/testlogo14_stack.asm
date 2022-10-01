;; testlogo.asm
;;
.cls 	equ &BC14	;; Clear screen
org &4000
run &4000
;;
call cls
ld hl, #c020		;; initial position of video
ld a,#05		;; times logo down		
call loop1		;; call main loop
jr $
;;
loop1:
   ld bc,logo		;; initial position of logo
			;; bc remains until logo
			;; is fully painted
   ld e,#08
   call loop_paint
   ld de, #c050
   add hl,de
			;; the second 8 row group pixels
   ld e,#08
   call loop_paint
   ld de,#c050
   add hl,de
   			;; wait until 'down' logo
   ld b,#a0
   call wait
   ld de, #ff60         ;; recover hl position 
			;; to 'erase' upward logo
   add hl,de
   ld e,#08
   call loop_erase1	;; call to 'erase' pixels
			;; from logo
			;; (it could be optimized in one calling)
   ld de, #c050
   add hl,de
   ld e,#08
   call loop_erase1
   ld de, #c050
   add hl,de
   dec a
jr nz, loop1
ld bc,logo		;; repaint logo
ld e,#08                
call loop_paint
ld de, #c050
add hl,de
ld e,#08
call loop_paint
ret
;;
loop_paint:
   ld d,#0b
   call loop_logo	;; call to paint logo
   push bc		;; save bc in stack
			;; for using adding in bc
   ld bc,#07f5 		;; 800 for next row (minus) 0b last column
   add hl,bc
   pop bc 
   dec e
jr nz, loop_paint
ret
;;
loop_logo:		;; finally 'paints' logo
                        ;; in memory video
   push af		;; save 'a' register
			;; because is used
			;; as counter in main loop
   ld a, (bc)
   ld (hl), a
   pop af
   inc hl;;inc l
   inc bc;;inc c
   dec d
jr nz,loop_logo
ret
;;
loop_erase1:		;; row by row in mode 1 video
   ld d,#0b		
   call loop_erase2
   ld bc,#07f5 		;;800 next row - 0b last column
   add hl,bc
   dec e
jr nz,loop_erase1
ret
;;
loop_erase2:		;; column by column in mode 1 video
   ld (hl), #00	
   inc hl;;inc l
   dec d
jr nz,loop_erase2
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