; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Code for Intro and Hall Screen sequence goes here.             ;

;-------Hall screen states
PNTR_009B80:        dw CODE_009C3A            ;#$00: Initialize intro logo
                    dw CODE_009C7A            ;#$01: Fade in intro logo
                    dw CODE_009C8A            ;#$02: Flash intro logo
                    dw CODE_009CB6            ;#$03: Fade out intro logo
                    dw CODE_009D48            ;#$04: Fade in Hall Screen
                    dw CODE_009D5E            ;#$05: Run Hall Screen in first dark mode
                    dw CODE_009F01            ;#$06: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$07: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$08: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$09: Stay in previous mode for one more frame
                    dw CODE_009EF9            ;#$0A: Run Hall Screen in first normal mode
                    dw CODE_009DC6            ;#$0B: []Run Hall Screen in a normal mode. This method is never called
                    dw CODE_009E16            ;#$0C: Update Hall Screen to be in normal mode
                    dw CODE_009EAC            ;#$0D: Update Hall Screen to be in dark mode
                    dw CODE_009E16            ;#$0E: Update Hall Screen to be in normal mode
                    dw CODE_009EAC            ;#$0F: Update Hall Screen to be in dark mode
                    dw CODE_009E16            ;#$10: Update Hall Screen to be in normal mode
                    dw CODE_009EAC            ;#$11: Update Hall Screen to be in dark mode
                    dw CODE_009E16            ;#$12: Update Hall Screen to be in normal mode
                    dw CODE_009EAC            ;#$13: Update Hall Screen to be in dark mode
                    dw CODE_009F01            ;#$14: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$15: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$16: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$17: Stay in previous mode for one more frame
                    dw CODE_009F01            ;#$18: Stay in previous mode for one more frame
                    dw CODE_009F04            ;#$19: Initialize second Hall Screen dark mode
                    dw CODE_009E5C            ;#$1A: Animate Hall Screen during second dark mode
                    dw CODE_009F14            ;#$1B: Animate Hall Screen during second normal mode
                    dw CODE_009F6D            ;#$1C: Run Hall Screen in second normal mode
                    dw CODE_009F85            ;#$1D: Fade out second Hall Screen normal mode, prepare for demo play
                    dw CODE_009F9C            ;#$1E: Automatically shine "ALL-STARS" text in Hall Screen, play "Screen down" SFX
                    dw CODE_009FF1            ;#$1F: Run triangle screen-out effect

;-------Hall Screen sequence
CODE_009BC0:        LDA.b $E1                 ;\
                    ASL   A                   ; |Jump to subroutine depending on the current
                    TAX                       ; |Hall Screen state.
                    JSR.w (PNTR_009B80,x)     ;/
                    LDA.b $E1                 ;\
                    CMP.b #$04                ; |Don't upload logo until Hall Screen is fading in
                    BCC   .end                ;/
                    JSR.w CODE_00A0E3         ;Upload "Super Mario All-Stars" logo in Hall Screen
                    LDA.b $E1                 ;\
                    CMP.b #$05                ; |Poll controller data during when Hall Screen is active
                    BCC   .end                ; |until we fade to GAME SELECT screen
                    CMP.b #$1E                ; |
                    BCS   .end                ;/
                    LDA.b $F0                 ;\
                    ORA.b $F1                 ; |Sets a flag for the start button
                    ORA.b $27                 ; |being pressed on either controller
                    AND.b #$10                ; |
                    STA.b $27                 ;/
                    LDA.b $27                 ;\Wait until start button is pressed
                    BEQ   .end                ;/
                    REP   #$20                ;16-bit A
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (lit up)
                    LDA.w #DATA_02CA00        ; |
                    LDY.b #DATA_02CA00>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$25                ;\
                    STA.w $011D               ; |Fixed color data
                    LDA.b #$4D                ; |r = $05
                    STA.w $011E               ; |g = $0D
                    LDA.b #$95                ; |b = $15
                    STA.w $011F               ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    JSR.w CODE_00B683         ;Initialize BG1 tilemap for Hall Screen
                    LDA.b #$50                ;\
                    STA.b $E3                 ; |Set timer to be in next subgame mode
                    STZ.b $E4                 ;/
                    LDA.b #$0C                ;\Set delay timer for showing shine across ALL-STARS logo
                    STA.b $22                 ;/when in next subgame mode
                    STZ.b $23                 ;
                    LDA.b #$1E                ;\Set subgame mode to #$1E
                    STA.b $E1                 ;/
                    LDA.b #$11                ;\Stop "chattering voices" SFX
                    STA.w $60                 ;/
                    LDA.b #$29                ;\Play "start button pressed" confirmation SFX
                    STA.w $63                 ;/
.end                RTL                       ;

;-------Initialize intro logo
CODE_009C3A:        LDA.b #$00                ;\Clear "show gameplay demo" flag
                    STA.l $701FF2             ;/
                    STZ.b $E7                 ;[]Does nothing
                    REP   #$20                ;16-bit A
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (lit up)
                    LDA.w #DATA_02CA00        ; |
                    LDY.b #DATA_02CA00>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\
                    STA.l $7F9000             ; |Set backdrop color to black ([]$7F:9000 is unused)
                    STA.l $7F9200             ;/
                    SEP   #$20                ;8-bit A
                    INC.w $0AC0               ;Set "Update palette" flag
                    LDA.b #$10                ;\Enable OBJ for main screen
                    STA.w $0117               ;/
                    LDA.b #$20                ;\Enable color math on backdrop
                    STA.w $011C               ;/
                    STZ.w $0100               ;Black out the screen
                    INC.b $E1                 ;Go to next submode

;-------Fade in intro logo
CODE_009C7A:        JSR.w CODE_00A02B         ;Write OAM data for intro logo sprite
                    INC.w $0100               ;\
                    LDA.w $0100               ; |Incrementally increase screen brightness
                    CMP.b #$0F                ; |to maximum
                    BNE   CODE_009C89         ;/
                    INC.b $E1                 ;Go to next submode
CODE_009C89:        RTS                       ;

;-------Flash intro logo
CODE_009C8A:        LDA.b $1C                 ;\
                    CMP.b #$61                ; |Wait 32 frames after reset (#$81-#$61)
                    BNE   +                   ;/
                    LDA.b #$01                ;\
                    STA.w $63                 ; |Play blink SFX ($63) and set "flash" flag ($24)
                    STA.b $24                 ;/
                    LDA.b #$02                ;\Initialize number of frames to show
                    STA.b $22                 ;/current logo flash palette
                    STZ.b $23                 ;Initialize the flash state
+                   JSR.w CODE_00A02B         ;Write OAM data for intro logo sprite
                    LDA.b $24                 ;\
                    BEQ   +                   ; |Update logo palette if "flash" flag is set
                    JSR.w CODE_00A0A6         ;/
+                   DEC.b $1C                 ;\Wait for intro wait timer to end
                    BNE   CODE_009C89         ;/
                    INC.b $E1                 ;Go to next submode
                    LDA.b #$F0                ;\
                    STA.b $1D                 ; |[]Does nothing
                    STZ.b $21                 ;/
                    BRA   CODE_009CB6         ;Begin screen fade out

CODE_009CB5:        RTS                       ;Called by next subroutine

;-------Fade out intro logo
CODE_009CB6:        STZ.b $22                 ;Reset animation timer
                    LDA.b #$01                ;\Set animation flag
                    STA.b $24                 ;/
                    JSR.w CODE_00A02B         ;Write OAM data for intro logo sprite
                    DEC.w $0100               ;\Wait for the screen to fade out
                    BNE   CODE_009CB5         ;/
                    LDA.b #$80                ;\
                    STA.w $2100               ; |Force blank
                    STA.w $0100               ;/
                    JSR.w CODE_00B683         ;Initialize BG1 tilemap for Hall Screen
                    REP   #$20                ;16-bit A
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (dark)
                    LDA.w #DATA_02C800        ; |
                    LDY.b #DATA_02C800>>$10   ; |Source: $02:C800
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    LDY.b #$80                ;\
                    STY.w $2115               ; |Upload sprite GFX (Super Mario All-Stars logo)
                    LDA.w #$C000>>1           ; |
                    STA.w $2116               ; |VRAM: $C000
                    LDA.w #$1801              ; |Source: $02:A000
                    STA.w $4300               ; |Size: 0x2000 bytes
                    LDA.w #DATA_02A000        ; |
                    STA.w $4302               ; |
                    LDY.b #DATA_02A000>>$10   ; |
                    STY.w $4304               ; |
                    LDA.w #$2000              ; |
                    STA.w $4305               ; |
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$02                ;\Set BG2 as Main Screen
                    STA.w $0117               ;/
                    LDA.b #$11                ;\Set BG1 and OBJ as Subscreen
                    STA.w $0118               ;/
                    LDA.b #$02                ;\Color math: add subscreen
                    STA.w $011B               ;/
                    LDA.b #$20                ;\Enable color addition on backdrop
                    STA.w $011C               ;/
                    LDA.b #$21                ;\
                    STA.w $011D               ; |Set fixed color data
                    LDA.b #$49                ; |r = #$01
                    STA.w $011E               ; |g = #$09
                    LDA.b #$91                ; |b = #$1E
                    STA.w $011F               ;/
                    LDA.b #$3E                ;\Set music to "Intro chatter (American)"
                    STA.w $60                 ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    STZ.w $0100               ;Black out the screen
                    INC.b $E1                 ;Set Hall Screen to next game mode

;-------Fade in Hall Screen
CODE_009D48:        INC.w $0100               ;\
                    LDA.w $0100               ; |Fade in the Hall Screen
                    CMP.b #$0F                ; |
                    BNE   .end                ;/
                    REP   #$20                ;16-bit A
                    LDA.w #$011A              ;\Initialize first timer to be in dark mode
                    STA.b $E3                 ;/
                    SEP   #$20                ;8-bit A
                    INC.b $E1                 ;Set Hall Screen to next game mode
.end                RTS                       ;

;-------Run Hall Screen in first dark mode
CODE_009D5E:        REP   #$20                ;16-bit A
                    LDA.b $E3                 ;\
                    CMP.w #$0020              ; |Stop tilemap animation for last 32 (0x20) frames
                    BCC   +                   ;/
                    SEP   #$20                ;8-bit A
                    JSR.w CODE_00B63F         ;Animate BG1 tilemap for Hall Screen
+                   REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   CODE_009DC3         ;/
                    SEP   #$20                ;8-bit A
                    JSR.w CODE_00B683         ;Initialize BG1 tilemap for Hall Screen
                    REP   #$20                ;16-bit A
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (lit up)
                    LDA.w #DATA_02CA00        ; |
                    LDY.b #DATA_02CA00>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$25                ;\
                    STA.w $011D               ; |Set fixed color data
                    LDA.b #$4D                ; |r = #$05
                    STA.w $011E               ; |g = #$0D
                    LDA.b #$95                ; |b = #$15
                    STA.w $011F               ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    REP   #$20                ;16-bit A
                    LDA.w #$0445              ;\Set timer for first normal mode
                    STA.b $E3                 ;/
                    LSR   A                   ;\
                    CLC                       ; |Set wait timer to set next shine delay
                    ADC.w #$0010              ; |$0225 = ($E3 << 1) + #$10
                    STA.w $0225               ;/
                    SEP   #$20                ;8-bit A
                    INC.b $E1                 ;Go to next submode
                    LDA.b #$11                ;\Stop music (intro chatter)
                    STA.w $60                 ;/
CODE_009DC3:        SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Run hall screen in normal mode
;--------This method is never called, deprecated by CODE_009EF9, which loads the intro music first then skips this code
CODE_009DC6:        JSR.w CODE_00BD8D         ;Add shine effect across "ALL-STARS" text in Hall Screen.
                    REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   CODE_009DC3         ;/
                    SEP   #$20                ;8-bit A
                    JSR.w CODE_00B683         ;Initialize BG1 tilemap for Hall Screen
                    REP   #$20                ;16-bit A
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (dark)
                    LDA.w #DATA_02C800        ; |
                    LDY.b #DATA_02C800>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$21                ;\
                    STA.w $011D               ; |Set fixed color data
                    LDA.b #$49                ; |r = $01
                    STA.w $011E               ; |g = $09
                    LDA.b #$91                ; |b = $11
                    STA.w $011F               ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    REP   #$20                ;16-bit A
                    LDA.w #$0002              ;\Set timer for next mode
                    STA.b $E3                 ;/
                    SEP   #$20                ;8-bit A
                    INC.b $E1                 ;Go to next submode
                    SEP   #$20                ;8-bit A (again?)
                    RTS                       ;

;-------Update Hall Screen to be in normal mode
CODE_009E16:        JSR.w CODE_00BD8D         ;Add shine effect across "ALL-STARS" text in Hall Screen.
                    REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   .end                ;/
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (lit up)
                    LDA.w #DATA_02CA00        ; |
                    LDY.b #DATA_02CA00>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    LDA.w #$0004              ;\Set timer for next mode
                    STA.b $E3                 ;/
                    LDA.w #$0025              ;\
                    STA.w $011D               ; |Fixed color data
                    LDA.w #$004D              ; |r = $05
                    STA.w $011E               ; |g = $0D
                    LDA.w #$0095              ; |b = $15
                    STA.w $011F               ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    INC.b $E1                 ;Go to next submode
.end                SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Animate Hall Screen during second dark mode
CODE_009E5C:        JSR.w CODE_00B63F         ;Animate BG1 tilemap for Hall Screen
                    REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   .end                ;/
                    LDA.w #$0060              ;\Set flash delay timer for intro logo
                    STA.b $22                 ;/
                    STZ.b $23                 ;Reset flash state index
                    STZ.w $0204               ;[]Tilemap index for animating Birdo's eyes in Hall Screen (unused)
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (lit up)
                    LDA.w #DATA_02CA00        ; |
                    LDY.b #DATA_02CA00>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    LDA.w #$003E              ;\Set number of frames to run next mode
                    STA.b $E3                 ;/
                    LDA.w #$0025              ;\
                    STA.w $011D               ; |Fixed color data
                    LDA.w #$004D              ; |r = $05
                    STA.w $011E               ; |g = $0D
                    LDA.w #$0095              ; |b = $15
                    STA.w $011F               ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    INC.b $E1                 ;Go to next submode
.end                SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Update Hall Screen to be in dark mode
CODE_009EAC:        REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   .end                ;/
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (dark)
                    LDA.w #DATA_02C800        ; |
                    LDY.b #DATA_02C800>>$10   ; |Source: $02:C800
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    LDA.w #$0002              ;
                    LDX.b $E1                 ;\
                    CPX.b #$13                ; |Wait until Hall Screen is in last blink
                    BNE   +                   ;/
                    LDX.b #$11                ;\Play SFX (Intro chatter)
                    STX.w $0060               ;/
+                   STA.b $E3                 ;
                    SEP   #$20                ;8-bit A
                    INC.w $0AC0               ;Set "Update palette" flag
                    INC.b $E1                 ;Go to next submode
                    LDA.b #$21                ;\
                    STA.w $011D               ; |Fixed color data
                    LDA.b #$49                ; |r = $01
                    STA.w $011E               ; |g = $09
                    LDA.b #$91                ; |b = $11
                    STA.w $011F               ;/
.end                SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Run Hall Screen in first normal mode
CODE_009EF9:        JSR.w CODE_008A8E         ;Load intro music, set Hall Screen to next game mode
                    LDA.b #$01                ;\Play Hall Screen intro music
                    STA.w $62                 ;/

;-------Stay in previous mode for one more frame
CODE_009F01:        INC.b $E1                 ;Set Hall Screen to next game mode
                    RTS                       ;

;-------Initialize second Hall Screen dark mode
CODE_009F04:        JSR.w CODE_00B63F         ;Animate BG1 tilemap for Hall Screen
                    JSR.w CODE_008AE7         ;Load SPC-700 music for Hall Screen second dark mode
                    REP   #$20                ;16-bit A
                    LDA.w #$00FA              ;\Set timer for next Hall Screen mode
                    STA.b $E3                 ;/
                    SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Animate Hall Screen during second normal mode
CODE_009F14:        JSR.w CODE_00BD8D         ;Add shine effect across "ALL-STARS" text in Hall Screen.
                    JSR.w CODE_00B63F         ;Animate BG1 tilemap for Hall Screen
                    REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   .end                ;/
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Palette data during Hall Screen (lit up)
                    LDA.w #DATA_02CA00        ; |
                    LDY.b #DATA_02CA00>>$10   ; |Source: $02:CA00
                    STA.b $02                 ; |Size: 0x200 bytes
                    STY.b $04                 ; |Destination: $7F:9200
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\Set backdrop color to black
                    STA.l $7F9200             ;/
                    LDA.w #$0025              ;\
                    STA.w $011D               ; |Fixed color data
                    LDA.w #$004D              ; |r = $05
                    STA.w $011E               ; |g = $0D
                    LDA.w #$0095              ; |b = $15
                    STA.w $011F               ;/
                    LDA.w #$0390              ;\Set number of frames to run next mode
                    STA.b $E3                 ;/
                    LSR   A                   ;\
                    CLC                       ; |Set wait timer to set next shine delay
                    ADC.w #$0020              ; |$0225 = ($E3 >> 1) + #$20
                    STA.w $0225               ;/
                    SEP   #$20                ;8-bit A
                    INC.w $0AC0               ;Set "Update palette" flag
                    LDA.b #$80                ;\Set delay timer for Mario making eye contact
                    STA.w $0211               ;/
                    JSR.w CODE_008A8E         ;Load intro music to SPC-700, set Hall Screen to next mode
.end                SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Run Hall Screen in second normal mode
CODE_009F6D:        JSR.w CODE_00BD8D         ;Add shine effect across "ALL-STARS" text in Hall Screen.
                    JSR.w CODE_00B62B         ;Mario looks at player after timer finishes in Hall Screen
                    REP   #$20                ;16-bit A
                    DEC.b $E3                 ;\Wait for this mode to end
                    BNE   CODE_009F82         ;/
                    SEP   #$20                ;8-bit A
                    INC.b $E1                 ;Go to next submode
                    LDA.b #$80                ;\[?]Stop music from playing
                    STA.w $62                 ;/
CODE_009F82:        SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Fade out second Hall Screen normal mode, prepare for demo play
CODE_009F85:        DEC.w $0100               ;\Fade out the hall screen
                    BNE   CODE_009F82         ;/
                    LDA.b #$00                ;\
                    STA.w $2100               ; |Black out the screen
                    STA.w $0100               ;/
                    JSR.w CODE_008ABC         ;
                    STZ.b $E1                 ;Reset Hall Screen mode
                    LDA.b #$09                ;\Set game mode to play game demo
                    STA.b $E0                 ;/
                    RTS                       ;

;-------Automatically shine "ALL-STARS" text in Hall Screen, play "Screen down" SFX
CODE_009F9C:        JSR.w CODE_00BD8D         ;Add shine effect across "ALL-STARS" text in Hall Screen.
                    DEC.b $E3                 ;\Wait for this mode to finish
                    BNE   .end                ;/
                    LDA.b #$40                ;\Play SFX (Screen down)
                    STA.w $63                 ;/
                    INC.b $E1                 ;Go to next submode
.end                RTS                       ;

;-------Triangle fading GFX offsets
DATA_009FAB:        dw DATA_029000+$000,DATA_029000+$020,DATA_029000+$040,DATA_029000+$060
                    dw DATA_029000+$080,DATA_029000+$0A0,DATA_029000+$0C0,DATA_029000+$0E0
                    dw DATA_029000+$100,DATA_029000+$120,DATA_029000+$140,DATA_029000+$160
                    dw DATA_029000+$180,DATA_029000+$1A0,DATA_029000+$1C0,DATA_029000+$1E0
                    dw DATA_029000+$200,DATA_029000+$220,DATA_029000+$240,DATA_029000+$260
                    dw DATA_029000+$280,DATA_029000+$2A0,DATA_029000+$2C0,DATA_029000+$2E0
                    dw DATA_029000+$300,DATA_029000+$320,DATA_029000+$340,DATA_029000+$360
                    dw DATA_029000+$380,DATA_029000+$3A0,DATA_029000+$3C0,DATA_029000+$3E0
                    dw DATA_029000+$400,DATA_029000+$400,DATA_029000+$400

;-------Run triangle screen-out effect
CODE_009FF1:        LDA.b $FD                 ;\
                    LSR   A                   ; |Wait for frame counter to be an even number
                    BCS   .end                ;/
                    REP   #$20                ;16-bit A
                    LDX.b $E3                 ;\
                    LDA.l DATA_009FAB,x       ; |Get triangle fading GFX offset
                    STA.b $E5                 ;/
                    INX                       ;\
                    INX                       ; |Increment offset index
                    STX.b $E3                 ;/
                    CPX.b #$23<<1             ;\Repeat 35 (0x23) times
                    BNE   .end                ;/
                    INC.b $E0                 ;Set next program mode
                    STZ.b $E1                 ;Clear program submode value
                    STZ.b $E3                 ;Clear program submode timer
                    LDA.w #$0080              ;\Force blank
                    STA.w $0100               ;/
.end                SEP   #$20                ;8-bit A
                    RTS                       ;

;-------Intro logo tilemap
DATA_00A017:        db $00,$02,$04,$06
					db $20,$22,$24,$26
                    db $08,$0A,$0C,$0E
					db $28,$2A,$2C,$2E
                    db $40,$42,$44,$46

;-------Write intro logo to OAM mirror
CODE_00A02B:        LDY.b #$00                ;\Clear X and Y registers
                    TYX                       ;/
                    LDA.b #$50                ;\Starting Y-position
                    STA.b $00                 ;/
-                   LDA.b #$60                ;\Starting X-position
                    STA.b $01                 ;/
--                  LDA.b $01                 ;\X-position
                    STA.w $0800,y             ;/
                    LDA.b $00                 ;\Y-position
                    STA.w $0800+1,y           ;/
                    LDA.w DATA_00A017,x       ;\Sprite tile number
                    STA.w $0800+2,y           ;/
                    INX                       ;Increment sprite tile number source index
                    LDA.b #$2E                ;\Priority: 2, Palette: 7
                    STA.w $0800+3,y           ;/
                    PHY                       ;Push Y index
                    TYA                       ;\
                    LSR   A                   ; |Divide Y index by 4
                    LSR   A                   ; |
                    TAY                       ;/
                    LDA.b #$02                ;\Render as a large sprite (16x16)
                    STA.w $0A20,y             ;/
                    PLY                       ;Recover Y index
                    INY                       ;\
                    INY                       ; |Add 4 to Y index
                    INY                       ; |
                    INY                       ;/
                    LDA.b $01                 ;\
                    CLC                       ; |Repeat along X
                    ADC.b #$10                ; |(width is #$40)
                    STA.b $01                 ; |
                    CMP.b #$40+$60            ; |
                    BCC   --                  ;/
                    LDA.b $00                 ;\
                    CLC                       ; |Repeat along Y
                    ADC.b #$10                ; |(height is #$50)
                    STA.b $00                 ; |
                    CMP.b #$50+$50            ; |
                    BCC   -                   ;/
                    RTS                       ;

;-------Number of frames each flash state lasts
DATA_00A072:        db $02,$02,$02,$02         ;

;-------Palette values for intro logo flags
DATA_00A076:        dw $7FFF,$2BBC,$43FF,$171C ;
                    dw $7FFF,$2BBC,$171C,$2BBC
                    dw $7FFF,$0A59,$171C,$2BBC
                    dw $53FF,$171C,$0A59,$53FF
                    dw $171C,$0A59,$53FF,$7FFF
                    dw $2BBC,$53FF,$171C,$0A59

;-------Update logo palette by flash state
CODE_00A0A6:        LDA.b $23                 ;\
                    ASL   A                   ; |Initialize palette src index (Y) by flash state ($23)
                    STA.b $00                 ; |
                    ASL   A                   ; |Y = 6 * $23
                    CLC                       ; |
                    ADC.b $00                 ; |
                    TAY                       ;/
                    LDX.b #$00                ;Initialize palette dest index
-                   LDA.w DATA_00A076,y       ;\
                    STA.l $7F9200+$1EC,x      ; |Add new color values for logo sprite
                    LDA.w DATA_00A076+$18,y   ; |
                    STA.l $7F9200+$1FA,x      ;/
                    INY                       ;Increment palette src index
                    INX                       ;Increment palette dest index
                    CPX.b #$06                ;\Repeat for six colors
                    BCC   -                   ;/
                    INC.w $0AC0               ;Set "Upload palette" flag
                    DEC.b $22                 ;\Decrease "flash frame" timer
                    BNE   .end                ;/
                    INC.b $23                 ;Go to next "flash state"
                    LDX.b $23                 ;\
                    CPX.b #$04                ; |The intro logo has 4 flash states
                    BCC   +                   ;/
                    STZ.b $23                 ;\
                    STZ.b $22                 ; |Clear values. The intro logo will stay in its
                    STZ.b $24                 ; |initial state for the rest of the intro now.
                    BRA   .end                ;/
+                   LDA.w DATA_00A072,x       ;\Load "flash frame" duration for next "flash frame"
                    STA.b $22                 ;/
.end                RTS                       ;

;-------Upload "Super Mario All-Stars" logo in Hall Screen to OAM mirror
CODE_00A0E3:        LDA.b #$48                ;\Set initial X-coordinate of
                    STA.b $00                 ;/Nintendo copyright text
                    LDY.b #$00                ;\Initialize index registers
                    TYX                       ;/
-                   LDA.b $00                 ;\X-coordinate of Nintendo copyright text
                    STA.w $0800+$180,y        ;/
                    LDA.b #$C8                ;\Y-coordinate of Nintendo copyright text
                    STA.w $0800+$181,y        ;/
                    TYA                       ;\
                    LSR   A                   ; |The tile number is ($00:0000 >> 1) | #$C0
                    ORA.b #$C0                ; |Very clever Nintendo...
                    STA.w $0800+$182,y        ;/
                    LDA.b #$22                ;\Palette: 1, Sprite Priority: 2
                    STA.w $0800+$183,y        ;/
                    LDA.b #$02                ;\Set as a large sprite (16x16)
                    STA.w $0A20+$60,x         ;/
                    INY                       ;\
                    INY                       ; |Increase Y to next sprite
                    INY                       ; |
                    INY                       ;/
                    LDA.b $00                 ;\
                    CLC                       ; |Increase X position 16 (0x10) pixels
                    ADC.b #$10                ; |
                    STA.b $00                 ;/
                    INX                       ;\
                    CPX.b #$07                ; |Increase high table index and loop until done
                    BNE   -                   ;/

                    PHB                       ;Push data bank
                    PHK                       ;\Data bank = program bank
                    PLB                       ;/
                    STZ.b $00                 ;\Initialize index for OAM high table
                    STZ.b $01                 ;/
                    STZ.b $02                 ;\Initialize index for OAM low table
                    STZ.b $03                 ;/
                    REP   #$10                ;16-bit XY
                    LDY.w #$0000              ;Initialize Y-index
-                   LDX.b $02                 ;\
                    LDA.w DATA_00A1A7,x       ; |Load OAM data for title logo until
                    CMP.b #$FF                ; |terminating byte ($FF) is reached
                    BEQ   +                   ;/
                    SEC                       ;\
                    SBC.b #$08                ; |Subtract 8 pixels and set as X-coordinate of sprite
                    STA.w $0800,y             ;/
                    LDA.w DATA_00A1A7+1,x     ;\Set Y-coordinate of sprite
                    STA.w $0800+1,y           ;/
                    LDA.w DATA_00A1A7+2,x     ;\Set tile number of sprite
                    STA.w $0800+2,y           ;/
                    LDA.w DATA_00A1A7+3,x     ;\Set tile properties of sprite
                    STA.w $0800+3,y           ;/
                    LDX.b $00                 ;\
                    LDA.b #$02                ; |Set as a large sprite (16x16)
                    STA.w $0A20,x             ;/
                    INY                       ;\
                    INY                       ; |Set Y to index next sprite
                    INY                       ; |
                    INY                       ;/
                    REP   #$20                ;16-bit A
                    INC.b $00                 ;Increment OAM high table to next sprite
                    INC.b $02                 ;\
                    INC.b $02                 ; |Increment OAM low table to next sprite
                    INC.b $02                 ; |
                    INC.b $02                 ;/
                    SEP   #$20                ;8-bit A
                    BRA   -                   ;Loop

+                   STZ.w $0002               ;\Initialize index for OAM low table
                    STZ.w $0003               ;/
-                   INY                       ;\
                    INY                       ; |Set Y to index next sprite
                    INY                       ; |
                    INY                       ;/
                    INC.b $00                 ;Increment OAM high table to next sprite
                    LDX.b $02                 ;\
                    LDA.w DATA_00A248,x       ; |Load OAM data for title logo until
                    CMP.b #$FF                ; |terminating byte ($FF) is reached
                    BEQ   +                   ;/
                    SEC                       ;\
                    SBC.b #$08                ; |Subtract 8 pixels and set as X-coordinate of sprite
                    STA.w $0800,y             ;/
                    LDA.w DATA_00A248+1,x     ;\Set Y-coordinate of sprite
                    STA.w $0800+1,y           ;/
                    LDA.w DATA_00A248+2,x     ;\Set tile number of sprite
                    STA.w $0800+2,y           ;/
                    LDA.w DATA_00A248+3,x     ;\Set tile properties of sprite
                    STA.w $0800+3,y           ;/
                    LDX.b $00                 ;\
                    LDA.b #$00                ; |Set as a small sprite (8x8)
                    STA.w $0A20,x             ;/
                    REP   #$20                ;16-bit A
                    INC.b $02                 ;\
                    INC.b $02                 ; |Increment OAM low table to next sprite
                    INC.b $02                 ; |
                    INC.b $02                 ;/
                    SEP   #$20                ;8-bit A
                    BRA   -                   ;loop

+                   SEP   #$10                ;8-bit XY
                    PLB                       ;Recover data bank
                    RTS                       ;

;-------"Super Mario All-Stars" logo OAM tilemap for 16x16 sprites
DATA_00A1A7:        db $38,$20,$00,$02,$48,$20,$02,$02 ;All data is copied to the OAM mirror
                    db $58,$20,$04,$02,$68,$20,$06,$02 ;until the terminating byte $FF is reached
                    db $78,$20,$08,$02,$38,$38,$44,$00
                    db $48,$30,$22,$00,$58,$30,$24,$00
                    db $68,$30,$26,$00,$78,$30,$28,$00
                    db $38,$48,$68,$00,$48,$40,$46,$00
                    db $58,$40,$48,$00,$68,$40,$4A,$02
                    db $78,$40,$4C,$00,$28,$58,$80,$00
                    db $38,$58,$82,$00,$48,$50,$6A,$00
                    db $58,$50,$6C,$00,$68,$50,$6E,$00
                    db $98,$10,$8A,$02,$A8,$10,$8C,$02
                    db $B8,$10,$8E,$02,$88,$20,$0A,$02
                    db $98,$20,$0C,$02,$A8,$20,$0E,$02
                    db $B8,$20,$20,$02,$88,$30,$2A,$00
                    db $98,$30,$2C,$00,$A8,$30,$2E,$00
                    db $B8,$30,$40,$00,$C8,$30,$42,$00
                    db $88,$40,$4E,$00,$98,$40,$60,$00
                    db $A8,$40,$62,$00,$B8,$40,$64,$00
                    db $C8,$40,$66,$00,$B8,$50,$84,$00
                    db $C8,$50,$86,$00,$D8,$50,$88,$02
                    db $FF

;-------"Super Mario All-Stars" logo OAM tilemap for 8x8 sprites
DATA_00A248:        db $38,$18,$A0,$02,$40,$18,$A1,$02 ;All data is copied to the OAM mirror
                    db $48,$18,$A2,$02,$50,$18,$A3,$02 ;until the terminating byte $FF is reached
                    db $58,$18,$A4,$02,$60,$18,$A5,$02
                    db $68,$18,$A6,$02,$70,$18,$A7,$02
                    db $78,$18,$A8,$02,$80,$18,$A9,$02
                    db $38,$30,$AF,$02,$40,$30,$B0,$02
                    db $30,$38,$B1,$00,$30,$40,$B2,$00
                    db $30,$48,$B3,$00,$30,$50,$B4,$00
                    db $78,$50,$B6,$00,$80,$50,$B7,$00
                    db $48,$60,$BE,$00,$88,$18,$AA,$02
                    db $90,$18,$AB,$02,$C8,$18,$AC,$02
                    db $C8,$20,$AD,$02,$C8,$28,$AE,$02
                    db $D8,$48,$B5,$00,$88,$50,$B8,$00
                    db $90,$50,$B9,$00,$98,$50,$BA,$00
                    db $A0,$50,$BB,$00,$A8,$50,$BC,$00
                    db $B0,$50,$BD,$00
                    db $FF