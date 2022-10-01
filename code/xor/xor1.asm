org &4000
run &4000
ld a, #F0	;;Guarda el valor de F0 en A
ld b, #FF
xor b		;;El valor de A cambia a 0F al hacer XOR con B
jr $