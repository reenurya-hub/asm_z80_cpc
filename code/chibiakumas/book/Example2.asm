org &4000
run &4000
;;
;;
   ld de, &0010		;; Xpos (in pixels)
   ld hl, &00a0 	;; Ypos (in pixels)
   ;;
   call   &bc1d		;; Scr Dot Position - Returns address in HL
   ;;
   ld de, TestSprite    ;; Sprite Source
   ld b, 8              ;; Lines
;;
SpriteNextLine:
   push hl		
      ld a, (de)		;; Source Byte
      ld (hl),a		;; Screen Destination
      ;;
      inc de		;; INC Source (Sprite) Address
      inc hl		;; INC Dest (Screen) Address
      ;;
      ld a, (de)
      ld (hl),a
      ;;
      inc de
      inc hl
      ;;
   pop hl
   call &bc26		;; Scr Next Line (Alter HL to move down a line)
      ;;
   djnz SpriteNextLine	;; Repeat for next line
      ;;
;;ret			;; Return to basic
jr $
;;
;; Each byte holds 4 pixels,
;; The top nibble is bitplane 0
;; The bottom nibble is bitplane 1
TestSprite:			;; Test Smiley
   db %00110000,%11000000	;; 8 line sprite
   db %01110000,%11100000	;; 8 pixels per line
   db %11110010,%11110100
   db %11110000,%11110000
   db %11110000,%11110000
   db %11010010,%10110100
   db %01100001,%01101000
   db %00110000,%11000000