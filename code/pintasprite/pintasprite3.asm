Org &4000
Run &4000
call &bc14
ld hl, #c780
ld bc, #0800
ld e,#04
call loopext
ld hl, #c731
call man
ld hl, #c787
ld e,#04
call loopext
ld bc, possalt
ld d, #06	;recorre possalt
call salto
Jr $
loopext:
ld a, #04
push hl
call loop
pop hl
inc l
dec e
jr nz, loopext
ret
loop:
ld (hl),#fe
add hl, bc
ld (hl),#fb
add hl, bc
dec a
jr nz, loop
ret
man:
ld (hl),#30
inc l
ld (hl),#80
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#30
inc l
ld (hl),#80
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#10
inc l
ld (hl),#00
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#F0
inc l
ld (hl),#E0
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#10
inc l
ld (hl),#00
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#20
inc l
ld (hl),#80
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#40
inc l
ld (hl),#40
dec l
ld a, h
add a,#08
ld h,a
ld (hl),#80
inc l
ld (hl),#20
ret
;;
salto:
ld a,(bc)
ld l,a
inc c
ld a,(bc)
ld h,a
inc c
call man
dec d
jr nz,salto
ret
;;
possalt:
;; salto alto (7 posi en d)
;db #92,#c6,#f3,#c5,#04,#c5,#06,#c5
;db #f7,#c5,#98,#c6,#39,#c7
;; salto bajo (6 posi en d)
db #e2,#c6,#93,#c6,#95,#c6,#97,#c6
db #e8,#c6,#39,#c7
ret
