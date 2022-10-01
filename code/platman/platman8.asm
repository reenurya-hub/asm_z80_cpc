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
   ld hl, #c730 	;pintaman
   ld a, l
   ld (posl),a
   ld a, h
   ld (posh),a
   ld bc, mandata	;pintaman
   ld e, #08		;pintaman
   call manram		;pintaman
   ;;pop hl
.mainloop
     call move
     ld a,66				;; Check if ESC has been Pressed
     call &bb1e			;; Routine to Check for Key Pressed
     jr z,mainloop
     ret
;; END MAIN
.loop1:
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
.looph:
call valoddeven
inc l
dec c
jr nz, looph
ret
;
.valoddeven:
ld a,b
rrca
call c, pntodd
ld a,b
rrca
call nc, pntevn
ret
;
.pntodd:
;db #fe
ld (hl),#fe
ret
;
.pntevn:
;db #fb
ld (hl),#fb
ret
;
.mandata:
   db #30,#80,#30,#80,#10,#00,#f0,#e0
   db #10,#00,#20,#80,#40,#40,#80,#20
ret
;;
.manram:
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
move:
;ld a,8	;; Was Left Arrow Key Pressed?
;ld a,1	;; Was Right Arrow Key Pressed?
;ld a,0	;; Was Up Arrow Key Pressed?
;ld a,2	;; Was Down Arrow Key Pressed?
   ld a,1
   call &bb1e			
   jr nz,moveright
   ld a,8
   call &bb1e			
   jr nz,moveleft
   ld a,0
   call &bb1e			
   jr nz,moveup
 ret
;;
.moveright:
   ld a,(posh)		;recupera hl
   ld h,a		;recupera hl
   ld a,(posl)		;recupera hl
   ld l,a		;recupera hl
   cp #7e
   jr z, move
   ld a,#20
   call wait
   ld e,#08
   call delman
   ld a,(posh)		;recupera hl
   ld h,a		;recupera hl
   ld a,(posl)		;recupera hl
   ld l,a		;recupera hl
   inc l		;guarda nuevo l
   ld a,l		;guarda nuevo l
   ld (posl),a
   ld e, #08		;pintaman
   ld bc, mandata	;pintaman
   ld e, #08		;pintaman
   call manram		;pintaman 
   call move
ret
;;
;;
.moveleft:
   ld a,(posh)		;recupera hl
   ld h,a		;recupera hl
   ld a,(posl)		;recupera hl
   ld l,a		;recupera hl
   cp #30
   jr z, move
   ld a,#20
   call wait
   ld e,#08
   call delman
   ld a,(posh)		;recupera hl
   ld h,a		;recupera hl
   ld a,(posl)		;recupera hl
   ld l,a		;recupera hl
   dec l
   ld a,l		;guarda nuevo l
   ld (posl),a		;guarda nuevo l
   ld e, #08		;pintaman
   ld bc, mandata	;pintaman
   ld e, #08		;pintaman
   call manram		;pintaman 
   call move
ret
;;
.moveup:
   ld a,(posh)		;recupera hl
   ld h,a		;recupera hl
   ld a,(posl)		;recupera hl
   ld l,a		;recupera hl
   ld a,#20
   call wait
   ld e,#08
   call delman
   ;ld a,(posh)		;recupera hl
   ;ld h,a		;recupera hl
   ld h,#c6
   ld a,(posl)		;recupera hl
   ld b, #50
   sub b
   ld l,a		;recupera hl
   ;inc l
   ld a,l		;guarda nuevo l
   ld (posl),a		;guarda nuevo l
   ld e, #08		;pintaman
   ld bc, mandata	;pintaman
   ld e, #08		;pintaman
   call manram		;pintaman 
   call move
ret
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
;;
wait:
   halt
   dec a
jr nz,wait
ret
;;
posh:
db #00
ret
posl:
db #00
ret
