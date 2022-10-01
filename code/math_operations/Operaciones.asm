ORG &4000
RUN &4000
LD HL,#0000
ld c,#a3
ld a,#A2
and a		;;Resetear el flag carry
cp c
jp c, carry	;;Cuando C es mayor que A se va por carry
cp c
jp z, igual	;;Cuando C es igual a A se va por igual
cp c
jp nc,nocarry 	;;Cuando C es menor o igual a A se va por nocarry
carry: 		;;C-A pero se debe (swapear) los registros para que no de negativo
ld h,a
ld l,c
ld a,l
ld c,h
sub h
nocarry:	;;A-C
sub c
igual:		;; Da cero no hay que hacer operacion
ld h,#00
;; OTRAS OPERACIONES:
;; con sub da una resta de c-a si a es menor da el negativo (en este caso fb)
;;sub c
;; con xor c da una resta de c-a cuando c es mayor, si c es menor da resultado
;; con el flag S en 1
;;xor c    ;; puede servir para calculo
;; con or c a se suma el valor de c 
;;or c
;; CON CP C NO HACE NADA
;;CP c
;; con and c no hace nada
;; and c
jr $