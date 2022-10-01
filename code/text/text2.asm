;;
init    equ &4000       ;; initial memory address
printch equ &bb5a       ;; print character by charatet on screen
clsscr  equ &bb6c       ;; clear screen for text
setcolt equ &bb6f	;; define column in text mode
setrowt equ &bb72       ;; define row in text mode
;;
org init
run init
;;
   call clsscr
   ld a,1
   call setcolt
   ld a,0
   call setrowt
   ld hl, text1
   call printstr
   call newline
   ld hl,text2
   call printstr
jr $
;;
printstr
   ld a, (hl)
   cp 0
   ret z
   inc hl
   call printch
jr printstr
;;
text1:
   db 'Reinaldo Enrique Urquijo Yanez',0
;;
text2:
   db 'Programando en Z80',0
;;
newline:
   ld a,13
   call printch
   ld a,10
   call printch
ret