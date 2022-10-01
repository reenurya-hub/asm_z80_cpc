     org &4000
     run &4000


.conkey		equ &bb1e
   
     ld a,0
     call &bc0e
     ld bc,&0101
     call &bc38
     call setcolors
     call initialise
     ld hl,(xpos)
     call findcolumn
     ld (scradr),hl
     ex de,hl		;;  ld de,(scradr) <- ex de,hl is more efficent way to get something from HL to DE.
     ld hl,sprdata 
     ld b,8
     ld c,15
     call disspr
.mainloop
     call control
     ld a,66				;; Check if ESC has been Pressed
     call conkey			;; Routine to Check for Key Pressed
     jr z,mainloop			;; Return to Mainloop if ESC has not been pressed
     call &bc02				;; Otherwise Proceed to Exit, Reset Colours
     ld a,2				;; And Return
     call &bc0e				;; To Mode 2.
     ret				;; Return to BASIC if called from there.
;; .conkey
;;     call &bb1e			;; Disabled cause there's no real need to have
;;     ret				;; as a routine plus save a byte :)
.setcolors
     ld hl,sprcolor			;; Address to INK Colours
     ld a,0				;; PEN Number
.colloop
     ld c,(hl)				;; Contents of INKs is stored into C
     ld b,c				;; and B Registers.
     push af				;; Protect PEN Number Value
     push hl				;; And the Address to the INK Colours
     call &bc32				;; SCR SET INK
     pop hl				;; Restore Address to the INK Colours
     pop af				;; Restore PEN Number Value
     inc hl				;; Point to next address for INKS
     inc a				;; Increase PEN Number
     cp 10				;; Has PEN 15 been reached?
     jr c,colloop			;; Jump to Loop if value hasn't been reached.


  .control
     ld a,8				;; Was Left Arrow Key Pressed?
     call conkey			;; KM TEST KEY
     jr nz,moveleft			;; Proceed to moveleft if it has
     ld a,1				;; Was Right Arrow Key Pressed?
     call conkey			;; KM TEST KEY
     jr nz,moveright			;; Proceed to moveright if it has
     ld a,0				;; Was Up Arrow Key Pressed?
     call conkey			;; KM TEST KEY
     jr nz,moveup			;; Proceed to moveup if it has
     ld a,2				;; Was Down Arrow Key Pressed?
     call conkey			;; KM TEST KEY
     jp nz,movedown			;; Proceed To movedown if it has.
;;    ld a,66
;;    call conkey
;;    jr nz,exit
     ret
  .moveleft
     ld a,&0				;; Does Accumulator = 0
     ld hl,(xpos)
     cp h				;; Check with XPOS
     jp nz,doleft			;; Only Move if possible.
  .showleft
     ld hl,(xpos)			;; New Position of XPOS
     call findcolumn			;; Convert XPOS into Screen Address
     ld (scradr),hl			;; Store New Screen Address
     ex de,hl	;;    ld de,(scradr)	;; Put this into DE
     ld hl,sprdata			;; Sprite address to HL
     ld b,8				;; Length
     ld c,15				;; Width
     call disspr			;; Display Sprite
     ret
  .doleft
     ld hl,(xpos)			;; Proceed to Decrease XPOS
     dec h
     ld (xpos),hl			;; Store new value to XPOS.
     jp showleft			;; And proceed to Display in New Position.
  .moveright
     ld a,&46
     ld hl,(xpos)
     cp h
     jp nz,doright
  .showright
     ld hl,(xpos)
     call findcolumn
     ld (scradr),hl
     ex de,hl 		;; ld de,(scradr)
     ld hl,sprdata
     ld b,8
     ld c,15
     call disspr
     ret
  .doright
     ld hl,(xpos)
     inc h
     ld (xpos),hl
     jp showright
  .moveup
     ld a,&0
     ld hl,(xpos)
     cp l
     jp nz,doup
  .showup
     ld hl,(xpos)
     call findcolumn
     ld (scradr),hl
     ex de,hl		;;  ld de,(scradr)
     ld hl,sprdata 
     ld b,8
     ld c,15
     call disspr
     ret
  .doup
     ld hl,(xpos)
     dec l
     ld (xpos),hl
     jp showup
  .movedown
     ld a,&b6
     ld hl,(xpos)
     cp l
     jp nz,dodown
  .showdown
     ld hl,(xpos)
     call findcolumn
     ld (scradr),hl
     ex de,hl		;;  ld de,(scradr)
     ld hl,sprdata
     ld b,8
     ld c,15
     call disspr
     ret
  .dodown
     ld hl,(xpos)
     inc l
     ld (xpos),hl
     jp showdown


  .findcolumn
                                ;; H = x coordinate (0-79)
                                ;; L = y coordinate (0-199)
                                ;; HL = screen address (top-left of sprite)


     push bc                    ;; store BC because we are modifying it in this
                                ;; routine
     push de                    ;; store DE because we are modifying it in this
                                ;; routine
     ld c,h                     ;; store x coordinate in C register
     ld h,0                     ;; L = y coordinate, H = 0
     add hl,hl                  ;; double L. Now L is a byte offset from the
                                ;; start of the table pointing to the
                                ;; entry corresponding to screen Y
                                ;; coordinate. We double because each entry
                                ;; is two bytes.
     ld de,table                ;; base of table
     add hl,de                  ;; add offset to base to get actual address in
                                ;; memory of the table entry
     ld a,(hl)
     inc hl
     ld h,(hl)
     ld l,a                     ;; HL = value from table. it is the screen
                                ;; address for the start of this line
                                ;; corresponding to the Y coordinate
     ld b,0                     ;; BC = x coordinate as a 16-bit value. C = x
                                ;; coordinate
     add hl,bc                  ;; add on X coordinate
                                ;; HL = final screen coordinate for x,y position


     pop de                     ;; restore registers we used
     pop bc
     ret


.initialise			;; Routine to Setup Screen Addresses to Table.
     ld de,table
     ld hl,&c000
     ld b,&19
.next
     push bc
     push hl
     ld b,&8
.loop
     push bc
     ld a,l
     ld (de),a
     inc de
     ld a,h
     ld (de),a
     inc de
     ld bc,&800
     add hl,bc
     pop bc
     djnz loop
     pop hl
     ld bc,&50
     add hl,bc
     pop bc
     djnz next
     ret


.disspr
				;; Entry Conditions:
				;;
				;; DE = Sprite Address to display sprite at
				;; HL = Sprite Location
				;; B = Sprite Width
				;; C = Sprite Height


     LD A,B
     LD (p1+1),A
.loop1
     PUSH DE
.p1   
     LD B,&0
.loop2
     LDI
     INC C
     DJNZ loop2
     POP DE


     LD A,D        ;;
     ADD &8        ;;
     LD D,A        ;;
     JR NC,end     ;;     
     LD A,E        ;; Step down a line
     ADD &50       ;;
     LD E,A        ;;
     LD A,D        ;;
     ADC &C0       ;;
     LD D,A        ;;


.end 
     DEC C
     JR NZ,loop1
     RET


  .table
     defs 400		;; 200 scanlines * 2 for the size of each entry.
  .scradr
     defw &c000
  .xpos
     defb &00
  .ypos
     defb &00
  .scrrow
     defb 0
  .sprcolor
     defb 0,26,0,6,3,15,18,1,2,20,0
  .sprdata
     defb 12,12,12,12,12,12,12,12
     defb 8,0,0,0,0,0,0,4
     defb 8,0,&54,&fc,0,0,0,4
     defb 8,0,&a9,3,&a8,0,0,4
     defb 8,0,&f0,&f0,&a0,0,0,4
     defb 8,&44,&f0,&a0,&a0,0,0,4
     defb 8,&44,&e4,&70,&a0,0,0,4
     defb 8,&44,&b0,&10,&20,0,0,4
     defb 8,&44,&b0,0,0,0,0,4
     defb 8,0,&e4,&30,&20,&68,0,4
     defb 8,0,&83,&e9,&83,&16,&80,4
     defb 8,&41,&d6,&fc,&a8,&68,0,4
     defb 8,0,&56,&56,2,0,0,4
     defb 8,0,&c3,&41,&82,0,0,4
     defb 8,0,0,0,0,0,0,4
     defb 12,12,12,12,12,12,12,12