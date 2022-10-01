org #4000
run inicio
;; Estas posiciones variables en memoria comienzan en 4000
posh: db #00
posl: db #00
inicio:
   ld hl,#C000
   ld a,h		;; El contenido de h se carga en a
   ld (posh),a		;; El contenido de a se carga en (posh)
   ld a,l		;; El contenido de l se carga en a
   ld (posl),a		;; El contenido de a se carga en (posl)
jr $