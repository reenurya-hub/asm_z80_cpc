;;DE 8 A 0 CONTADOR 1
;;DE 4F A 0 CONTADOR 2
;;SI CONTADOR 2 ES PAR ENTONCES INDEX1 SI NO INDEX2
;;intercambiar index
;;Añadir 8 a hl
;;platman1.asm
org &4000
run &4000
;;realizar modulo con add luego and
;ld a, #4
;ld b, #4
;add a,b
;and a,2
ld a,a
ld a,#1
and a,2
jr $
;; START PROGRAM
;;call &bc14     ;; cls
;;ld hl, #c000   ;; initial position video mem.
;;ld a
;;ld (hl),
;; END PROGRAM
