;;paintchar2.asm
org &4000
run &4000
;; START PROGRAM
call &bc14     ;; cls
ld hl, #c000   ;; initial position video mem.
ld bc, charpix ;; initial position to charpix
ld e,#06
call looph 
Jr $
;; END PROGRAM
;; ROUTINES
looph:
ld d, #08
push hl
call paintpix
pop hl
inc l
dec e
jr nz,looph
ret
;;
paintpix:
ld a, (bc)
ld (hl),a
ld a, h
add a,#08
ld h,a
inc c
dec d
jr nz, paintpix
ret
;;left to right 
charpix:
;;col1
Db #00,#00,#70,#00,#70,#c0,#70,#00
;;col2
Db #00,#00,#80,#c0,#c0,#c0,#60,#00
;;col3
db #e0,#e0,#70,#60,#60,#60,#b0,#00
;;col4
Db #00,#00,#c0,#60,#60,#60,#c0,#00
;;col5
Db #00,#00,#30,#60,#60,#60,#30,#00
;;col6
Db #00,#00,#c0,#60,#00,#60,#c0,#00
ret
