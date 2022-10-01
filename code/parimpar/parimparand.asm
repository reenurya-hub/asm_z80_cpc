;;parimparand.asm
;;uses 'and'
;;validate:bit'zero'
;;paint 3 sprites
org &4000
run &4000
;;
ld hl, #c000
ld a, 1
and &01
call z, paint
ld a, 2
and &01
call z, paint
ld a, 3
and &01
call z, paint
ld a, 4
and &01
call z, paint
ld a, 5
and &01
call z, paint
ld a, 6
and &01
call z, paint
jr $
paint:
ld (hl),#ff
inc l
inc l
ret