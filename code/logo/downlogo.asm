;; Kingsoft Logo
.cls 	equ &BC14	;; Clear screen
;;
org &4000		;; Start of code
run &4000		;; Start of execution
;;
call cls
ld hl,logo_1		;; load logo_1 initial position
ld (pos),hl		;; load in pos hl (position logo_1)
ld hl, #c000	
push hl		;manda direccion video c000
ld e,#0b
ld hl,logo_1
call loop
jr $
loop:

ld hl,(pos)		;;load in hl content (pos)
pop hl			;; load hl
push de
ex de,hl
ld (hl),e
inc l
pop de
push hl

ld b,(hl) 	;guarda lo de hl
pop hl    	;recupera c000 en hl
ld (hl),b 	;guarda en c000 lo de b
inc l		;c001
push hl		;manda c001

djnz loop
ret
;;
logo_1:
db #ff, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
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
db #FC, #FD, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F1, #88						
db #33, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E6, #00
db #33, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #EE, #00
db #00, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF, #88, #00
db #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
pos:
dw #0000

