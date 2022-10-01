;; c000,c800,d000,d800
org #4000
run inicio
;; 
poshl: db #00,#00
;; INICIO DEL PROGRAMA PRINCIPAL
inicio:
   call &BC14
   ld hl,#C000 
   call dibujar
continua2:
;;		
jr $
;; FIN DEL PROGRAMA PRINCIPAL
;;
;; INICIO DE LAS RUTINAS DE USUARIO
dibujar:
   ld d,#07
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
   ld d,#07
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
   ld d,#07				;; veces en que va a pintar el grupo pixels
   ld bc,#0800				;; sumatoria para siguiente linea
   call pintar2				;; llamado a pintar
   ;;push hl 				;; guarda en pila valor de h1
   ;;
   ld b,#ff			
   call esperar				;; llamado a esperar
   ;;
   ;;pop hl				;; recupera de pila valor hl
   ;;ld h,#c0  
   ld d,#07				;; veces en que va a devolverse
   ld bc,#f800				;; sumatoria del negativo de 0800 para devolverse
   retrocede:
   add hl,bc				;, suma (o resta) el negativo
   dec d
   jr nz,retrocede
   ld d,#07
   ld bc,#0800
   call borrar				;;llamado a borrar
;; nuveo ajuste   
   ld bc,#c850
   add hl,bc				;; siguiente linea pasados los 8
   ld d,#07				;; veces en que va a pintar el grupo pixels
   ld bc,#0800				;; sumatoria para siguiente linea
   call pintar2				;; llamado a pintar
   ;;push hl				;; guarda en pila valode hl
   ld b,#ff
   call esperar
   ;; aqui debe devolverse 4 veces para empezar a borrar
   ld d,#07				;; veces en que va a devolverse
   ld bc,#f800				;; sumatoria del negativo de 0800 para devolverse
   retrocede2:
   add hl,bc				;, suma (o resta) el negativo
   dec d
   jr nz,retrocede2
   ;; fin de devolverse
   ld d,#07				;; veces en que va a pintar el grupo pixels
   ld bc,#0800				;; sumatoria para siguiente linea
   call borrar
   ;;pop hl
   ld bc,#c850
   add hl,bc				;; siguiente linea pasados los 8
   ld d,#07				;; veces en que va a pintar el grupo pixels
   ld bc,#0800				;; sumatoria para siguiente linea
   call pintar2				;; llamado a pintar
   ld d,#07				;; veces en que va a devolverse
   ld bc,#f800				;; sumatoria del negativo de 0800 para devolverse
   retrocede3:
   add hl,bc				;, suma (o resta) el negativo
   dec d
   jr nz,retrocede3
   ld b,#ff
   call esperar
   ld d,#07				;; veces en que va a pintar el grupo pixels
   ld bc,#0800				;; sumatoria para siguiente linea
   call borrar
   ld bc,#c850
   add hl,bc				;; siguiente linea pasados los 8
   ld d,#07				;; veces en que va a pintar el grupo pixels
   ld bc,#0800				;; sumatoria para siguiente linea
   call pintar2				;; llamado a pintar

   ;;
;;   ld h,#e0  
;;   ld (hl),#60
;;   ld h,#e8
;;   ld (hl),#60
;;   ld h,#f0
;;   ld (hl),#60
;;   ld h,#f8
;;   ld (hl),#60
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
;;
pintar2:
   ld (hl),#60
   add hl,bc
   dec d
   jr nz,pintar2
ret
;;
borrar:
   ld (hl),#00
   add hl,bc
   dec d
   jr nz,borrar
ret
;; FIN DE LAS RUTINAS DE USUARIO