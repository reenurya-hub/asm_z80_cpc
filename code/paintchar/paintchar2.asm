;;paintchar2.asm
org &4000
run &4000
;; START PROGRAM
call &bc14     ;; cls
ld hl, #c000   ;; initial position video mem.
ld bc, charpix ;; initial position to charpix
ld e,#08
call looph 
Jr $
;; END PROGRAM
;; ROUTINES
looph:
ld d, #06
push hl
call paintpix
pop hl
ld a, h
add a,#08
ld h,a
dec e
jr nz,looph
ret
;;
paintpix:
ld a, (bc)
ld (hl),a
inc l
inc c
dec d
jr nz, paintpix
ret
;;left to right 
charpix:
;; row 1
Db #00, #00, #e0, #00, #00,#00
;; row 2
Db #00, #00, #e0,#00,#00,#00
;; row 3
Db #70,#80,#70,#c0,#30,#c0
;; row 4
Db #00,#c0,#60,#60,#60,#60
;;row 5
Db #70,#c0,#60,#60,#60,#00
;; row 6
db #c0,#c0,#60,#60,#60,#60
;; row 7
Db #70,#60,#b0,#c0,#30,#c0
;; row 8
Db #00,#00,#00,#00,#00,#00
ret
