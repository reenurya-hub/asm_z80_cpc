;;evenodd1.asm
org &4000
run &4000
ld hl, #c000
ld b,#4f
call loop
jr $
;;
loop:
ld a,b
and a,#2
jr z,even
ld a,b
and a,#1
jr nz,odd
inc l
dec b
jr nz, loop
;;ret
;; par
even:
ld (hl),#ff
ret
;; impar
odd:
ld (hl),#f0
ret