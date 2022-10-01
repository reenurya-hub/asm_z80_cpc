org &8000
run &8000
   ld hl, &0000		;; initial position to copy bytes
   ld de, &c000		;; destination position (memory video) to copy bytes
   ld bc, &4000		;; 'times' to copy from hl to de (memory video size 16Kb)
   ldir			;; load (hl), increment (hl,de), repeat (bc)
ret