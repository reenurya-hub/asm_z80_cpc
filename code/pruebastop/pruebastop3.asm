;; c000,c800,d000,d800
org #4000
run inicio
;; 
poshl: db #00,#00
;; INICIO DEL PROGRAMA PRINCIPAL
inicio:
   ld hl,#C000 
   call dibujar
continua2:
;;		
jr $
;; FIN DEL PROGRAMA PRINCIPAL
;;
;; INICIO DE LAS RUTINAS DE USUARIO
dibujar:
   ld d,#03
   ld bc,#0800
   call pintar
   ;;
   ld h,#C0			;; Se posiciona al principio del sprite
   ld (poshl),hl		;; El contenido de HL se carga en poshl
   ;;
   push hl
   call disparo 
   ;;
   ld b,#10
   call esperar
   ;;
   pop hl
   ;;
   ld d,#03
   ld bc,#0800
   call borrar
   ;;
   ld h,#C0
   inc hl
jr dibujar			;; Bucle infinito para mover el sprite
;;
disparo:
   ld a,47
   call &BB1E			;; Rutina para obtener tecla
   jr nz, caida			;; Mientras no se presione ESPACIO no para sprite
ret
;;
esperar:
   halt
   dec b
 jr nz,esperar
ret
;;
caida:
   ld hl,(poshl)			;; El contenido de poshl se carga en hl
   ld d,#03
   ld bc,#0800
   call pintar
   push hl 
   ;;
   ld b,#30
   call esperar
   ;;
   pop hl
   ld h,#c0  
   ld d,#03
   ld bc,#0800
   call borrar
   ;;
   ld h,#e0  
   ld (hl),#60
   ld h,#e8
   ld (hl),#60
   ld h,#f0
   ld (hl),#60
   ld h,#f8
   ld (hl),#60
   ;;
call continua2
ret
;;
pintar:
   ld (hl),#66
   add hl,bc
   dec d
   jr nz,pintar
ret
;;
borrar:
   ld (hl),#00
   add hl,bc
   dec d
   jr nz,borrar
ret
;; FIN DE LAS RUTINAS DE USUARIO