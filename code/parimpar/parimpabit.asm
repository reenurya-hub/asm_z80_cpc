;;parimparand.asm
;;uses 'bit'
;;validate:bit'zero'
;;paint 3 sprites
org &4000
run &4000
;;
ld hl, #c000
ld a, 1
nop
bit 0,a
call z, paint
ld a, 2
nop
bit 0,a
call z, paint
ld a, 3
nop
bit 0,a
call z, paint
ld a, 4
nop
bit 0,a
call z, paint
ld a, 5
nop
bit 0,a
call z, paint
ld a, 6
nop
bit 0,a
call z, paint
jr $
paint:
ld (hl),#ff
inc l
inc l
ret