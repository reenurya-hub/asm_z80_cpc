org &4000
run &4000
ld hl, #AAAA
ld de, #BCFD
push de		;; coloca el valor de los registros DE en la pila
ex (sp),hl	;; intercambia el valor de la pila con HL
push hl		;; coloca el valor de HL en la pila
ld de, #0000	
pop de		;; carga el valor de la pila en registro DE
jr $