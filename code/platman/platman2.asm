;;DE 8 A 0 CONTADOR 1
;;DE 4F A 0 CONTADOR 2
;;SI CONTADOR 2 ES PAR ENTONCES INDEX1 SI NO INDEX2
;;intercambiar index
;;Añadir 8 a hl
;;platman1.asm
org &4000
run &4000
;; START MAIN
   ld hl, #c780 ;start position of tile
   ld b, #08	;times to paint floor of bricks
   call loop1
jr $
;; END MAIN
loop1:
   ld c, #50	; times to paint brick
   ld e,l
   call looph
   ld a,h
   add a, #08
   ld h,a
   ld l,e
   dec b
jr nz, loop1
;
looph:
call valoddeven
inc l
dec c
jr nz, looph
ret
;
valoddeven:
ld a,b
rrca
call c, pntodd
ld a,b
rrca
call nc, pntevn
ret
;
pntodd:
;db #fe
ld (hl),#fe
ret
;
pntevn:
;db #fb
ld (hl),#fb
ret

;; START PROGRAM
;;call &bc14     ;; cls
;;ld hl, #c000   ;; initial position video mem.
;;ld a
;;ld (hl),

