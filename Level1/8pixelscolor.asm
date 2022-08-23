org &4000	;start of program
run &4000	;run program
;
ld a, #80	;load color pixel
ld (#c000), a	;load video memory
ld a, #08
ld (#c800), a
ld a, #88
ld (#d000), a
ld a, #80
ld (#d800), a
ld a, #08
ld (#e000), a
ld a, #88
ld (#e800), a
ld a, #80
ld (#f000), a
ld a, #08
ld (#f800), a
jr $		;Jump to same instruction