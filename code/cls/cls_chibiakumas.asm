ScreenSize equ &4000
org &8000
run &8000 ;;se puede cambiar por call &8000 en basic
   ld hl,&c000
   ld de,&c000+1
   ld bc,ScreenSize-1
   ld (hl),0
   ldir
jr $