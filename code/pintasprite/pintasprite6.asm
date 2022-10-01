;pintasprite6
;optimizado
org &4000
run &4000
;; START PROGRAM
   ;; cls
   call &bc14
   ;; initial position
   ld hl, #c780
   ld bc, #0800
   ;; paint floor tile 1
   ld e,#04
   call looptile
   ;; paint floor tile 2
   ld hl, #c787
   ld e,#04
   call looptile
   ;; paint person 
   ;; sprite (man)
   ld hl, #c731
   push hl
   call man
   ;; wait a time
   ;; to animate man
   pop hl
   ld a,#20
   call wait
   ;; erase initial 
   ;; state of man
   ld bc, #0800
   ld e,#08
   call delman
   ;; jump man
   ld bc, posjump
   ld d, #06
   call jump
   ;; paint final
   ;; state of man
   ld hl, #c739
   call man
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
   ld a,#ff
   call wait
   pop hl
   ld e,#08
   call delman
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
;; START ROUT DELMAN
;;
delman:
   ld (hl),#00
   inc l
   ld (hl),#00
   dec l
   ld a, h
   add a,#08
   ld h,a
   dec e
   jr nz, delman
ret
;; END ROUT DELMAN
;;END OF CODE