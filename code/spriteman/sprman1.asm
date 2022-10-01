org &4000
run &4000
;; START PROGRAM
call &bc14 ;; cls
;; position mandata
ld bc, mandata
ld e, #08
call manram
jr $
mandata:
db #30,#80,#30,#80,#10,#00,#f0,#e0
db #10,#00,#20,#80,#40,#40,#80,#20
ret
manram:
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
jr nz,manram
ret