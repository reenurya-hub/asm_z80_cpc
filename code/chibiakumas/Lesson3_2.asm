org &8000
   ld a, (&9000)
   ld bc, (&9001)
   ;;
   cp 0
   jr z, MathAdd
   cp 1
   jr z, MathSub
   cp 2
   jr z, MathMult
   cp 3
   jr z, MathDiv
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
MathAdd:
   ld a, c
   add b
jr SaveResult
;;
MathMult:
   ld a, b
   cp 0
   jr z, SaveResult
   ld a, 0
MathMultAgain:
   add c
   djnz MathMultAgain
jr SaveResult
;;
MathDiv:
   ld a, c
   cp 0
   jr z, SaveResult
   ld d, 0
MathDivAgain:
   sub b
   inc d
   jp nc, MathDivAgain
   dec d
   ld a, d
jr SaveResult