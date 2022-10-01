;;evenodd1.asm
org &4000
run &4000
;;ld a,#5
;;and a,1
ld a,#4
rrca
ld a,a
jr $
