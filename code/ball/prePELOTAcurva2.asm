org #4000			
run #4000
;;
ld d,#09
ld hl, (posiciones)	;; guarda el valor de (posiciones)
ld (hl), #0f		;; pinta
ld hl, posiciones	;; guarda la direccion 
inc l			;; incrementa una vez
ld (posiciones+1),hl    	;; carga hl en (poshl)			
ld (hl), #0f       	;; carga el valor de poshl) en hl
;;ld hl, bc	        ;; guarda el valor de (posiciones)
;;ld (hl), #0f		;; pinta
;;inc a			;; pasa al siguiente byte
;;ld hl, (posiciones)	;; guarda el valor de (posiciones)
;;ld (hl), #0f		;; pinta
;;inc a			;; pasa al siguiente byte
JR $
;;
posiciones:
;;  401B   401C   
dw #C050, #C051, #C052, #C053, #C054, #C055, #C056, #C057, #C058, #C059
ret
poshl:
dw #0000
RET
