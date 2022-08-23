org &4000	;start of program
run &4000	;run program
;
ld hl, #f0f0	;load two group of pixels
ld (#c000), hl	;load video memory
ld hl, #0f0f
ld (#c800), hl
ld hl, #ffff
ld (#d000), hl
ld hl, #f0f0
ld (#d800), hl
ld hl, #0f0f
ld (#e000), hl
ld hl, #ffff
ld (#e800), hl
ld hl, #f0f0
ld (#f000), hl
ld hl, #0f0f
ld (#f800), hl
jr $		;Jump to same instruction