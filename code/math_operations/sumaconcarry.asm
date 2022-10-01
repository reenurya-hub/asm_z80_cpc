org &4000
run &4000
;;Sumar con acarreo a 0x01ff el valor 0x07fc
ld de, #01ff
ld a, #fc
add e		;; a+=e 
ld e,a          ;; e = a = e + 0xfc
ld a,d          ;; a = d
adc #07		;; Asi sumaria a A el valor de d (01) con el carry = 9 exacto
ld d,a		;; Valor correcto: #01FF + #07FC = #09FC
;;
;;Sumar sin acarreo da un valor inexacto
;ld de, #01ff
;ld a, #fc
;add e		;; a+=e      
;ld e,a         ;; e = a = e + 0xfc  asigna el resultado de la suma en a
;ld a,d         ;; a = d  (carga el nuevo valor)
;add #07	;; Asi sumaria a A el valor de d (01) sin el carry = 8 inexacto
jr $