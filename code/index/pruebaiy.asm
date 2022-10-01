org &4000
run &4000
ld iy,(sprdata)
push iy
pop hl

.sprdata:
dw &c000, &d802, &f004

.pointer:
dw #0000