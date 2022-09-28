ScreenSize equ &4000	;;define symbol or constant ScreenSize value &4000
org &8100		
run &8100
   ld hl, &c000		;; initial position of hl
   ld de, &c000+1	;; destination to copy bytes (add constant value 1)
   ld bc, ScreenSize-1	;; 'times' to repeat loads (substract constant value 1 to ScreenSize)
   ld (hl), 0		;; load value 0x00 in memory video (clear pixels)
   ldir			;; load, increment, repeat
jr $			;; jump to same position to jr $