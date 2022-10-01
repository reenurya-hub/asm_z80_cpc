;
; This is a simple program which is designed to print "inline"
; strings.
;
; Of course such a thing is a little crazy, as it really messes
; with disassemblers, but it's still a cute hack.
;
org 4000
run 4000

   call trint
   db "This is a test!\n$"

   call trint
   db "As you can see we're printing INLINE strings!\n$"

   halt


;
; This routine is designed to be CALLed, when it is invoked
; the address of the next instruction will be placed on the
; stack, which means we can find the address of the string to
; print from there.
;
; We print each character until we find a '$' character, then
; jmp back to the location after that.
;
ld hl,#c000
trint:
   ;
   ; The return address, i.e. the instruction after our call, will be
   ; on the stack.  In our case we know that points to the string to be
   ; printed.
   ;

print_loop:
   pop hl

   ;
   ; Load the character in the hl-register into A.
   ;
   ld a,(hl)

   ;
   ; Bump to the next.
   ;
   inc hl

   ;
   ; Since we've incremented the HL register we're either
   ; going to get the next character - or the address to
   ; which we should return.  Push it onto the stack either way.
   ;
   push hl

   ;
   ; Is the character '$'?  If so we return - because we've
   ; just stored the next address on the stack we'll go to
   ; the correct location.
   ;
   cp '$'

   ;
   ; Return if we're done.
   ;
   ret z

   ;
   ; Otherwise output the single character, and start again.
   ;
   out (4001),a
   jp print_loop