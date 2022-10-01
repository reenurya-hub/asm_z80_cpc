org &8000
   ld a, (&9000)
   ld bc, (&9001)
   ;;
   cp 0
   jr z, MathAdd
   cp 1
   jr z, MathSub
   ;;
   ld a, 0
SaveResult:
   ld (&9003), a
ret
;;
MathSub:
   ld a, c
   sub b
jr SaveResult
;;
MathAdd
   ld a, c
   add b
jr SaveResult
