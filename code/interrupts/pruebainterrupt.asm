org &4000
run &4000

call removeinterrupthandler
ld hl,#c000
ld (hl),#ff
jr $


removeinterrupthandler:
DI
LD HL,(#0039)
EX DE,HL
IM 1
LD HL, #C9FB
LD (#0038),HL
EI
EX DE,HL
RET