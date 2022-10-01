; Fast RND
;
; An 8-bit pseudo-random number generator,
; using a similar method to the Spectrum ROM,
; - without the overhead of the Spectrum ROM.
;
; R = random number seed
; an integer in the range [1, 256]
;
; R -> (33*R) mod 257
;
; S = R - 1
; an 8-bit unsigned integer
org #4000
run #4000

 ld a, (seed)
 ld b, a 

 rrca ; multiply by 32
 rrca
 rrca
 xor #1f

 add a, b
 sbc a, 255 ; carry

 ld (seed), a
 ret

seed:
db #01