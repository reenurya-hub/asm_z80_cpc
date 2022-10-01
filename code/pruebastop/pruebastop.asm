org #4000
run inicio
 
posh: db #00
posl: db #00

inicio:
 ld hl,#C000 

call dibujar
;continuar:
; ld a,(posh)
; ld h,a
; ld a,(posl)
; ld l,a
; ld (hl),#60
; ld h,#C8
; ld (hl),#60
; ld h,#D0
; ld (hl),#60
; ld h,#D8
; ld (hl),#60
 
continua2:
		
jr $


dibujar:
 ;;ld (hl),#60
 ld (hl),#66
 ld h,#C8
 ;;ld (hl),#F6
 ld (hl),#66
 ld h,#D0
 ;;ld (hl),#F6
 ld (hl),#66
 ld h,#D8
 ;;ld (hl),#60
 ld (hl),#66
 ld h,#C0
ld a,h
ld (posh),a
ld a,l
ld (posl),a
push hl
call requiere 


 ld b,#10
   call esperar
;esperar:
 ;  halt
 ;  dec b
 ;jr nz,esperar

pop hl
 ld (hl),#00
 ld h,#C8
 ld (hl),#00
 ld h,#D0
 ld (hl),#00
 ld h,#D8
 ld (hl),#00
 ld h,#C0

 inc hl

jr dibujar
;;ret			;fin de dibujar


requiere:
ld a,18
call &BB1E			
;;jr nz, dibujar2			;; Mientras no se presione Enter (18) no
jr nz, continuar
ret


esperar:
   halt
   dec b
 jr nz,esperar
ret

;;dibujar2:
 ;;ld b,#10 
;; call continuar
;;RET
continuar:
 ld a,(posh)
 ld h,a
 ld a,(posl)
 ld l,a
 ld (hl),#60
 ld h,#C8
 ld (hl),#60
 ld h,#D0
 ld (hl),#60
 ld h,#D8
 ld (hl),#60
 push hl 

 ld b,#30
 call esperar

 pop hl
 ld h,#c0  
 ld (hl),#00
 ld h,#C8
 ld (hl),#00
 ld h,#D0
 ld (hl),#00
 ld h,#D8
 ld (hl),#00

 ;ld b,#10
 ;call esperar
 
 ld h,#e0  
 ld (hl),#60
 ld h,#e8
 ld (hl),#60
 ld h,#f0
 ld (hl),#60
 ld h,#f8
 ld (hl),#60


call continua2
ret