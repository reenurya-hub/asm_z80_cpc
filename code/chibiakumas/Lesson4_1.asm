PrintChar equ &BB5A
WaitChar  equ &BB06
;;
org &8000
;;run &8000
   call WaitChar
   call PrintChar
   push af
      ld a, '|'
      push af
      call PrintChar
         ld a, 'x'
         call PrintChar
      pop af
      call PrintChar
   pop af
   call PrintChar
ret