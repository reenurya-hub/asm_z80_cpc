Org &4000
Run &4000
;; START PROGRAM
;; cls
   call &bc14
   ld hl, #c780
   ld bc, #0800
   ld e,#04
   call looptile
   ld hl, #c731
   call man
   ld hl, #c787
   ld e,#04
   call looptile
   ld bc, posjump
   ;run jump
   ld d, #06
   call jump
   jr $
;; END PROGRAM
;;
;; START ROUT LOOPTILE
looptile:
   ld a, #04
   push hl
   call tile
   pop hl
   inc l
   dec e
   jr nz, looptile
ret
;;
;; END ROUT LOOPTILE
;;
;; START ROUT TILE
;;
tile:
   ld (hl),#fe
   add hl, bc
   ld (hl),#fb
   add hl, bc
   dec a
   jr nz, tile
ret
;;
;; END ROUT TILE
;;
;; START ROUT MAN
;;
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
;;
;; END ROUT MAN
;;
;; START ROUT JUMP
;;
jump:
   ld a,(bc)
   ld l,a
   inc c
   ld a,(bc)
   ld h,a
   push hl
   inc c
   call man
   ld a,#20
   call wait
   pop hl
   call erase
   dec d
   jr nz,jump
ret
;;
;; END ROUT JUMP
;;
;; START ROUT POSJUMP
;;
posjump:
;; high jump (7 pos in d)
   ;db #92,#c6,#f3,#c5,#04,#c5,#06,#c5
   ;db #f7,#c5,#98,#c6,#39,#c7
;; low jump (6 pos in d)
   db #e2,#c6,#93,#c6,#95,#c6,#97,#c6
   db #e8,#c6,#39,#c7
ret
;;
;; END ROUT POSJUMP
;;
;; START ROUT WAIT
;;
wait:
   halt
   dec a
jr nz,wait
ret
;;
;; END ROUT WAIT
;;
;; START ROUT ERASE
;;
erase:
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   ld (hl),#00
   inc l
   ld (hl),#00
ret
;; END ROUT ERASE
;;END OF CODE