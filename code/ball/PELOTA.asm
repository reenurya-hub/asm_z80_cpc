org #4000			
run #4000			
 			;;Pelota de 4x4 pixeles
 ld hl,#C000 			;;HL apunta a los 4 primeros pixeles de la pantalla
call dibujar			;;
dibujar:			
 ld (hl),#60			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#C8			;;HL apunta a la segunda fila de pixeles
 ld (hl),#F6			;;Segunda fila de la pelota
 ld h,#D0			;;HL apunta a la tercera fila de pixeles
 ld (hl),#F6			;;Tercera fila de la pelota
 ld h,#D8			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#60			;;Cuarta fila de pixeles
 ld h,#C0			;;HL vuelve a apuntar a la primera fila
 			;;
			;;Pequenia espera
 ld b,#10			;;Contador para 16 halts
esperar:			
   halt			;;Espera de 1/300 milisegundos
   dec b			;;Un halt menos para terminar
 jr nz,esperar			;;Saltara a halt si quedan repeticiones <> 0
			;;
			;;Borra la pelota
 ld (hl),#00			;;Primera fila de la pelota dos pixeles amarillos
 ld h,#C8			;;HL apunta a la segunda fila de pixeles
 ld (hl),#00			;;Segunda fila de la pelota
 ld h,#D0			;;HL apunta a la tercera fila de pixeles
 ld (hl),#00			;;Tercera fila de la pelota
 ld h,#D8			;;HL apunta a la cuarta fila de pixeles
 ld (hl),#00			;;Cuarta fila de pixeles
 ld h,#C0			;;HL vuelve a apuntar a la primera fila
 			;;
 inc hl			;;HL apunte a un byte mas a la derecha para mover a la pelota
			
			
 jr dibujar			
