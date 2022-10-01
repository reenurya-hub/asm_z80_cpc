;;
init    equ &4000
printch equ &bb5a
cls     equ &bc14 
;;
org init
run init
;;
   call cls ;clear screen
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