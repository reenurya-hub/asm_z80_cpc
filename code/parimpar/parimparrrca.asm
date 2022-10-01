;;parimparrrca.asm
;;uses 'bit'
;;validate:bit'zero'
;;paint 3 sprites
org &4000
run &4000
;;
ld hl, #c000
ld a, 1
nop
rrca
call c, paint
ld a, 2
nop
rrca
call c, paint
ld a, 3
nop
rrca
call c, paint
ld a, 4
nop
rrca
call c, paint
ld a, 5
nop
rrca
call c, paint
ld a, 6
nop
rrca
call c, paint
jr $
paint:
ld (hl),#ff
inc l
inc l
ret