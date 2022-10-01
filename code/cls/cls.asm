;; cls
org &4000
run &4000
;;
ld hl,#c050
ld a,#0b
call loop_grp
jr$
;;
loop_grp:
   ld d,#08
   call loop_8
   ld bc,#c850
   add hl,bc
   dec a
jr nz,loop_grp
ret
;;
loop_8:
   ld e,#4f
   call cls
   ld bc,#07b1
   add hl,bc
   dec d
jr nz,loop_8
push af
ld a,h
sub a,#08
ld h,a
pop af
ret
;;
cls:
   ld (hl),#00
   inc hl
   dec e
jr nz, cls
ret