org &8000
;;run &8000 se puede cambiar por call &8000 en basic
   ld hl,&0000
   ld de,&c000
   ld bc,&4000
   ldir
ret