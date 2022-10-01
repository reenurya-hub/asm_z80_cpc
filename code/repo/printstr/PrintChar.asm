ThinkPositive equ 1
PrintChar equ &bb5a

org &8100
run &8100
	ld hl, Introduction
	call PrintString
	call NewLine
	ld hl,Message
	call PrintString
;ret
jr $
PrintString
	ld a, (hl)
	cp 255
	ret z
	inc hl
	call PrintChar
jr PrintString

Introduction:
	db 'Pensamiento del dia...',255

ifdef ThinkPositive
	Message: 	db 'Z80 es increible!!',255
else
	Message:	db '6510 apesta!', 255
endif

NewLine:
	ld a,13
	call PrintChar
	ld a,10
	call PrintChar
ret