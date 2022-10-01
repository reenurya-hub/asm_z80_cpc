;pintasprite8
;optimizado
org &4000
run &4000
;; START PROGRAM
   ;; cls
   call &bc14
   ld hl, #c000
   ld bc, chars
   ld d
   push bc 
   ld e, #08
   call pintach
   pop bc
   jr $
chars:
;;a
db #00,#00,#00,#00,#70,#80,#00,#c0
db #70,#c0,#c0,#c0,#70,#60,#00,#00
;;b
db #e0,#00,#e0,#00,#70,#c0,#60,#60
db #60,#60,#60,#60,#b0,#c0,#00,#00
;;c
db #00,#00,#00,#00,#30,#c0,#60,#60
db #60,#00,#60,#60,#30,#c0,#00,#00
;;d
db #10,#c0,#00,#c0,#70,#c0,#c0,#c0
db #c0,#c0,#c0,#c0,#70,#60,#00,#00
ret
;;
pintach:
   ld a, (bc)
   ld (hl), a
   inc l
   inc c
   ld a, (bc)
   ld (hl), a
   inc c
   dec l
   ld a, h
   add a,#08
   ld h,a
   dec e
jr nz,pintach
ret
;;
indexl:
db #00
indexh:
db #00
ret
startjump:
ld a,18
call &bb1e			
jr z,startjump		;; Mientras no se presione Enter (18) no
ret
manj:
db #30,#80,#30,#80,#10,#e0,#10,#00
db #10,#e0,#20,#80,#50,#80,#50,#00
ret
