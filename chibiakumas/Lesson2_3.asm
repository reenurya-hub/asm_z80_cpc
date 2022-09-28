ScreenSize equ &4000
org &8200
run &8200			;; not in original code (run directly)
   ld a, %00001111		;; 0f all pixels in cyan
FillAgain:
   ld hl, &c000			;; initial position increments with ldir
   ld de, &c000+1		;; destination position increments with ldir
   ld bc, ScreenSize-1		;; 'times' to 'move' position
   ld (hl),a			;; load a in memory address pointed in hl
   ldir				;; (l)oa(d), (i)ncrement, (r)epeat bc times from hl to de
   dec a			;; decrement a (colour from 0f to 00 cyan pixels)
   cp 255			;; if a = ff (255) then
   jp nz, FillAgain		;; jump to FillAgain if not zero (nz)