org &4000
run &4000
ld hl,sprdata
ld e,(hl)
inc hl
ld d,(hl)
inc hl
push hl
ex de,hl
ld (hl),#ff
pop hl
ld e,(hl)
inc hl
ld d,(hl)
inc hl
push hl
ex de,hl
ld (hl),#ff
pop hl
ld e,(hl)
inc hl
ld d,(hl)
inc hl
push hl
ex de,hl
ld (hl),#ff
pop hl
.sprdata:
dw &c000, &d802, &f004