;; Kingsoft Logo
.cls 	equ &BC14	;; Clear screen
;;
org &4000		;; Start of code
run &4000		;; Start of execution
;;
call cls		;; clear screen
ld hl,#c000     ;; init memory video
ld bc,logo_1    ;; init memory logo
;;
;;
call loopg
jr $
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
db #ff, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #F0, #f0, #ff
db #f0, #Ff, #Ff, #Ff, #Ff, #Ff, #Ff, #Ff, #Ff, #ff, #f0
db #44, #44, #44, #44, #44, #44, #44, #44, #44, #44, #44
db #55, #55, #55, #55, #55, #55, #55, #55, #55, #55, #55