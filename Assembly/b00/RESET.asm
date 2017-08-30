; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; RESET vector, the main program loop, and calls to the main     ;
; loop go here.                                                  ;

;-------Start of RESET routine
N_VECTOR_RESET:
E_VECTOR_RESET:
DATA_008000:        SEI                       ;Set interrupt disable flag
                    STZ.w $4200               ;Disable NMI, IRQ, and auto-joypad read
                    STZ.w $420C               ;HDMA Disabled
                    STZ.w $420B               ;DMA Disabled
                    STZ.w $2140               ;\
                    STZ.w $2141               ; |SPC ports disabled
                    STZ.w $2142               ; |
                    STZ.w $2143               ;/
                    LDA.b #$80                ;\Forced blank
                    STA.w $2100               ;/
                    CLC                       ;\Native mode
                    XCE                       ;/
                    REP   #$38                ;16-bit AXY; non-decimal mode
                    LDA.w #$0000              ;\Direct page: $0000
                    TCD                       ;/
                    LDA.w #$01FF              ;\Stack pointer: $01FF
                    TCS                       ;/
                    SEP   #$30                ;8-bit AXY
                    LDA.b #$00                ;\
                    PHA                       ; |Program bank: $00
                    PLB                       ;/
                    LDA.w $213F               ;\
                    BIT.b #$10                ; |Make sure PAL bit is clear, otherwise show
                    BEQ   +                   ; |error message (incompatible SNES)
                    JMP.w CODE_0093C7         ;/

-                   JML.l CODE_009641         ;Show error message (Pirated game)

+                   JSR.w CODE_0083B6         ;Initialize RAM, DMA, SPC engine, and hardware registers
                    LDA.b #$00                ;\
                    STA.l $701FF0             ; |Clear "show gameplay demo" flag and initialize to SMB1 demo
                    STA.l $701FF2             ;/
                    REP   #$20                ;16-bit A
                    LDA.w #$8000              ;\
                    STA.w $0150               ; |[]Does nothing
                    STA.w $0152               ; |
                    STZ.w $0154               ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$81                ;\Enable NMI and auto-joypad read
                    STA.w $4200               ;/
                    STA.w $1C                 ;Wait timer for flash of Mario logo
                    JSR.w CODE_008C1B         ;Check battery save data
                    NOP                       ;\[]Removed code
                    NOP                       ;/Likely was a BRA instruction to ignore copier checks
                    LDA.b #$AA                ;\
                    STA.l $702000             ; |Copier checks
                    CMP.l $700000             ; |
                    BNE   -                   ; |If SRAM is not properly mirrored,
                    LDA.b #$55                ; |show anti-piracy message
                    STA.l $702000             ; |
                    CMP.l $700000             ; |
                    BNE   -                   ;/

;-------Main program loop
CODE_00807D:        LDA.w $0122               ;\Wait for "Main program loop initialize" flag to be
                    BEQ   CODE_00807D         ;/set during NMI.
                    JSR.w CODE_0086CC         ;Get controller data for this frame
                    CLI                       ;Clear interrupt disable flag
                    INC.b $FD                 ;Frame counter increment
                    LDX.b $E0                 ;\
                    LDA.w DATA_00883D,x       ; |Clear OAM low table depending on game state index
                    BEQ   +                   ; |
                    JSR.w CODE_008719         ;/
+                   JSL.l CODE_0080C7         ;Update game depending on game state
                    LDX.b $E0                 ;\
                    LDA.w DATA_00883D,x       ; |Update OAM high table depending on game state index
                    BEQ   +                   ; |
                    JSR.w CODE_008773         ;/
+                   STZ.w $0122               ;Signal that main program loop has finished
                    JMP.w CODE_00807D         ;Loop the game

;-------Low byte of game state pointers
PNTR_0080A6:        db CODE_009BC0                     ;#$00: Intro screen and Hall screen
                    db CODE_00A2D8                     ;#$01: Initialize Game Select screen
                    db CODE_00A39B                     ;#$02: Game Select screen
                    db CODE_00B1CE                     ;
                    db CODE_00B440                     ;
                    db CODE_00B2A5                     ;
                    db CODE_00A2C5                     ;Fade out screen, prepare for gameplay
                    db CODE_0089F9                     ;Load SPC data of selected game
                    db CODE_0081A0                     ;#$08: Play select game
                    db CODE_00822B                     ;#$09: Play game demo
                    db $00                             ;[]Unused

;-------high byte of game state pointers
PNTR_0080B1:        db CODE_009BC0>>8
                    db CODE_00A2D8>>8
                    db CODE_00A39B>>8
                    db CODE_00B1CE>>8
                    db CODE_00B440>>8
                    db CODE_00B2A5>>8
                    db CODE_00A2C5>>8
                    db CODE_0089F9>>8
                    db CODE_0081A0>>8
                    db CODE_00822B>>8
                    db $00

;-------bank byte of game state pointers
PNTR_0080BC:        db CODE_009BC0>>$10
                    db CODE_00A2D8>>$10
                    db CODE_00A39B>>$10
                    db CODE_00B1CE>>$10
                    db CODE_00B440>>$10
                    db CODE_00B2A5>>$10
                    db CODE_00A2C5>>$10
                    db CODE_0089F9>>$10
                    db CODE_0081A0>>$10
                    db CODE_00822B>>$10
                    db $00

;-------Update game depending on game state
CODE_0080C7:        LDX.b $E0                 ;\
                    LDA.l PNTR_0080A6,x       ; |$00:00E0 determines the game state.
                    STA.b $03                 ; |We will jump to whatever routine
                    LDA.l PNTR_0080B1,x       ; |we need depending on what the game
                    STA.b $04                 ; |state is.
                    LDA.l PNTR_0080BC,x       ; |
                    STA.b $05                 ;/
                    JML.w [$0003]             ;Jump to game routine

;-------Quit from current gameplay and go back to Hall Screen
CODE_0080DE:        JSL.l CODE_00882E         ;Forced blank + HDMA-Disable
                    STZ.w $4200               ;Disable interrupts
                    LDA.b #$00                ;\
                    PHA                       ; |Program bank: $00:0000
                    PLB                       ;/
                    SEI                       ;Set interrupt flag
                    STZ.w $4200               ;\No interrupts or HDMA
                    STZ.w $420C               ;/
                    REP   #$20                ;\
                    LDA.w #$01FF              ; |Stack pointer: $01FF
                    TCS                       ;/
                    SEP   #$20                ;8-bit A
                    STZ.b $60                 ;\
                    STZ.b $61                 ; |
                    STZ.b $62                 ; |Clear sound effects and music
                    STZ.b $63                 ; |
                    STZ.w $2140               ; |
                    STZ.w $2141               ; |
                    STZ.w $2142               ; |
                    STZ.w $2143               ;/
                    LDA.b #$F0                ;\[?]Mute SFX panel 2
                    STA.w $2141               ;/
                    JSR.w CODE_0083B6         ;
                    STZ.b $E0                 ;\
                    LDA.b #$03                ; |
                    STA.b $E1                 ;/
                    LDA.b #$01                ;
                    STA.w $0100               ;
                    LDA.b #$01                ;
                    STA.w $0124               ;
                    LDA.b #$00                ;
                    STA.l $701FF2             ;
                    STA.l $7FFF00             ;
                    LDA.b #$81                ;
                    STA.w $4200               ;
                    STA.w $1C                 ;
                    JMP.w CODE_00807D         ;

;-------Quit from current game demo and go back to Hall Screen (exact same code as above)
CODE_008139:        JSL.l CODE_00882E         ;Forced blank + HDMA-Disable
                    STZ.w $4200               ;Disable interrupts
                    LDA.b #$00                ;\
                    PHA                       ; |Set program bank to $00
                    PLB                       ;/
                    SEI                       ;Set interrupt flag
                    STZ.w $4200               ;\Disable interrupts and HDMA
                    STZ.w $420C               ;/
                    REP   #$20                ;\
                    LDA.w #$01FF              ; |Stack pointer: $01FF
                    TCS                       ; |
                    SEP   #$20                ;/
                    STZ.b $60                 ;\
                    STZ.b $61                 ; |
                    STZ.b $62                 ; |
                    STZ.b $63                 ; |
                    STZ.w $2140               ; |Clear sound effects and music
                    STZ.w $2141               ; |
                    STZ.w $2142               ; |
                    STZ.w $2143               ; |
                    LDA.b #$F0                ; |Mute SFX panel 2?
                    STA.w $2141               ;/
                    JSR.w CODE_0083B6         ;
                    STZ.b $E0                 ;
                    LDA.b #$03                ;
                    STA.b $E1                 ;
                    LDA.b #$01                ;
                    STA.w $0100               ;
                    LDA.b #$01                ;
                    STA.w $0124               ;
                    LDA.b #$00                ;
                    STA.l $701FF2             ;
                    STA.l $7FFF00             ;
                    LDA.b #$81                ;
                    STA.w $4200               ;
                    STA.w $1C                 ;
                    JMP.w CODE_00807D         ;