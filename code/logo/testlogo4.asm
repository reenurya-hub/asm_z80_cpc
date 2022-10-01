;; Kingsoft Logo
.cls 	equ &BC14	;; Clear screen
;;
org &4000		;; Start of code
run &4000		;; Start of execution
;;
call cls		;; clear screen
;;
ld hl,#c000     ;; init memory video
ld bc,logo_1    ;; init memory logo
ld e,#08
call loopg
;;
ld hl,#c050     ;; init memory video
ld bc,logo_2    ;; init memory logo
ld e,#08
call loopg2
jr $
;

;
loopg:
ld d,#0b
call loop
ld a,h
add a,#08
ld h,a
ld l,#00
dec e
jr nz, loopg
loopg2:
ld d,#0b
call loop
ld a,h
add a,#08
ld h,a
ld l,#50
dec e
jr nz, loopg2
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
logo_1:
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #FC, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88
db #FD, #F5, #FB, #F5, #FE, #FF, #F3, #F3, #FB, #FD, #88
db #FD, #F9, #FB, #FD, #F0, #F8, #F4, #FA, #F1, #F1, #88
logo_2:
db #FD, #F1, #FA, #FD, #F6, #FF, #F4, #FB, #F9, #F1, #88
db #FD, #F9, #FA, #F5, #F2, #F1, #F4, #FA, #F1, #F1, #88
db #FD, #F5, #FA, #F5, #FE, #FF, #F3, #F2, #F1, #F1, #88
db #FC, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88						
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00