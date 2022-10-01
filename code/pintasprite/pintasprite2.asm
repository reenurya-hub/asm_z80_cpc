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