ORG &4000
RUN &4000
;;
and a			;, reinicia los flags
LD A, #01		
AND #02			;; En este caso el valor de A cambia a 0
and a
LD A, #01
AND #03			;; En este caso el valor da 1
AND A
LD A, #01
AND #02			;; En este caso el valor da 0
AND A			
LD A, #01		;; Valor 1
AND #01
JR $