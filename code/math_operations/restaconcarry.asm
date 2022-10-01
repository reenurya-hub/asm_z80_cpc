org &4000
run &4000
;;Restar de 0x0201 el valor 0x01fc CON CARRY 
ld de, #0201
ld a,e
sub #fc		;; a-=e = a- 0xfc = 0x01 - 0xfc (CON carry)
ld e,a          ;; e = a = (0x01 - 0xfc)
ld a,d          ;; a = d = 0x02
sbc #01		;; a-=01 = 0x02 - 0x01 
ld d,a		;; e = a = (0x02 - 0x01) 
;;El valor de restar 0x01fc de 0x0201 es 0x0005 CORRECTO 
;;
;;Restar de 0x0201 el valor 0x01fc SIN CARRY 
ld de, #0201
ld a,e
sub #fc		;; a-=e = a- 0xfc = 0x01 - 0xfc (sin carry)
ld e,a          ;; e = a = (0x01 - 0xfc)
ld a,d          ;; a = d = 0x02
sub #01		;; a-=01 = 0x02 - 0x01 
ld d,a		;; e = a = (0x02 - 0x01) pero no tiene en cuenta el carry
jr$		;; Valor errado en de = 0x0105