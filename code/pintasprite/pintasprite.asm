;pintasprite.asm
ORG &4000
RUN &4000
;;
call &bc14
ld hl, #c000
call sprite
ld hl, #c055
call sprite
ld hl, #c0aa
call sprite
jr $
;;
sprite:
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