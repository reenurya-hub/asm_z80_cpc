;pintasprite7
;optimizado
org &4000
run &4000
;; START PROGRAM
   ;; cls
   call &bc14
   ;; initial position
   ld bc, #0800
   ;; *** paint floor tile 1
   ld hl, #c780
   ld e,#04
   call looptile
   ;; *** paint floor tile 2
   ld hl, #c787
   ld e,#04
   call looptile
   ;; *** call manram
   ld hl, #c731
   push hl
   ld bc, mandata
   ld e, #08
   call manram
   pop hl
   ;; *** prejump
   ;; wait a time
   ld a,#20
   call wait
   ;;push hl
   ld bc, #0800
   ld e,#08
   call delman

;; HASTA AQUI BORRA EL MAN
;; LUEGO VIENE EL SALTO
;; RECUPERA EL HL CON EL POP
;; PERO NO LO NECESITA
;; PORQUE AHORA TRABAJA
;; CON LAS POSICIONES DE POSJUMP
   ;; *** jump man
   ;;pop hl
   ld bc, posjump
   ld d, #06
   call jump
   ;; *** paint final
   ;; state of man
   ld hl, #c739
   ld bc, mandata
   ld e, #08
   call manram
   jr $
;; END PROGRAM
;;
;; START ROUT JUMP
;;
jump:
;; BC NO SE DEBE TOCAR
;; PORQUE TRAE EL POSJUMP
;; PERO BC TAMBIEN LO USA MANDATA
;; BC ES LA DIRECCION DONDE GUARDA POSJUMP
;; A VA GUARDANDO CADA INDICE Y SE LO PASA A H Y L

   ld a, (bc)
   ld l,a
   inc c
   ld a, (bc)
   ld h,a
;; GUARDAR EL BC EN UN INDICE
;; EN MEMORIA
;; Y PASARSELO LUEGO 
;; MAS ABAJO
ld a,c
ld (indexl),a
ld a,b
ld (indexh),a
   ;; *** erase man
   ld e, #08
   ld bc, mandata
   push hl
   call manram	;;b,c,h,l,a,e manram no controla hl
   ;; *** wait erase man
   pop hl
   ld a,#ff		
   call wait		;;a
   push hl
   ld e,#08
   call delman	;;h,l,a,e
   pop hl
   ;; go across posjump (bc)
ld a, (indexl)
ld c, a
ld a, (indexh)
ld b, a
inc c
   dec d
   jr nz,jump
ret
;;
;; END ROUT JUMP
;;

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
mandata:
   db #30,#80,#30,#80,#10,#00,#f0,#e0
   db #10,#00,#20,#80,#40,#40,#80,#20
ret
;;
manram:
   ld a, (bc)
   ld (hl), a
   inc l
   inc c
   ld a, (bc)
   ld (hl), a
   inc c
   dec l
   ld a, h
   add a,#08
   ld h,a
   dec e
jr nz,manram
ret
;;
indexl:
db #00
indexh:
db #00
ret
