org &4000
run &4000
;;
ld hl,#4444
ld de,#cccc
EX DE,HL
SBC HL,DE
EX DE,HL
JR $