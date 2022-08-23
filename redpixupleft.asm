org &4000     ;start of program
run &4000     ;point of run program
ld a,#88      ;3e 88        (4000)
ld (#c000),a  ;32 00 c0     (4002)
jr #4005      ;18 fe        (4005)