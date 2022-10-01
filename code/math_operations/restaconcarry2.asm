org &4000
run &4000
;; En este caso el valor de restar #01 - #ff es - #FE
ld a,#01		;;guarda en A valor #01
sbc #ff			;; resta con carry a A el valor #FF
cpl			;; invierte el valor de A, resultado FE
jr $
