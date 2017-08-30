; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; NMI vector goes here as well as uncalled vectors               ;

;-------NMI Pointers, based on current game.
PNTR_0082CE:        dw CODE_0082FF            ;Into and Hall Screen and Game Select
                    dw CODE_00834E            ;SMB1
                    dw CODE_008353            ;SMB:TLL
                    dw CODE_008358            ;SMB2
                    dw CODE_00835D            ;SMB3

;-------Start of NMI routine
N_VECTOR_NMI:       SEI                       ;Set interrupt flag
                    REP   #$30                ;16-bit AXY flag
                    PHA                       ;\
                    PHX                       ; |Preserve registers
                    PHY                       ; |
                    PHD                       ; |
                    LDA.w #$0000              ;\|Direct page: $0000
                    TCD                       ;/|
                    PHB                       ; |
                    PHK                       ;\|Data bank = Program bank
                    PLB                       ;/|
                    LDA.b $00                 ;\|Preserve word at $00:0000
                    PHA                       ;/
                    SEP   #$30                ;8-bit AXY
                    LDA.l $7FFF00             ;\
                    TAX                       ; |Jump to NMI routines of the current game
                    JSR.w (PNTR_0082CE,x)     ;/
                    REP   #$30                ;16-bit XY
                    PLA                       ;\
                    STA.w $00                 ;/|Recover word at $00:0000
                    PLB                       ;\|Recover registers
                    PLD                       ; |
                    PLY                       ; |
                    PLX                       ; |
                    PLA                       ;/

N_VECTOR_COP:
N_VECTOR_ABORT:
E_VECTOR_COP:
E_VECTOR_BRK:
E_VECTOR_ABORT:
E_VECTOR_NMI:       RTI                       ;Called by unused vectors

;-------NMI routine during intro, hall screen, and game select screen
CODE_0082FF:        LDA.b #$01                ;\
                    XBA                       ; |Direct page: $0100
                    LDA.b #$00                ; |
                    TCD                       ;/
                    LDA.w $4210               ;Read to enable NMI
                    LDA.b $0100               ;\Set screen brightness from mirror
                    STA.w $2100               ;/
                    STZ.w $420C               ;Disable HDMA
                    LDA.b $0122               ;\Ensures that the main program loop has cycled
                    BNE   +                   ;/at least once
                    INC.b $0122               ;Set "main loop initialize" flag
                    PHD                       ;Push direct page
                    JSR.w CODE_0088C3         ;[?]
                    SEP   #$30                ;8-bit AXY
                    PLD                       ;Recover direct page
+                   JSR.w CODE_00841A         ;Write hardware mirrors to appropriate registers
                    JSR.w CODE_0087CC         ;[?]SFX
                    LDX.b #$81                ;Enable NMI and auto-joypad read
                    LDA.b $0124               ;\Enable IRQ flag. If set, IRQ-related
                    BEQ   +                   ;/registers will be activated.
                    AND.b #$FE                ;\[?]Serves no purpose
                    STA.b $0121               ;/
                    LDA.w $4211               ;Read to enable IRQ
                    LDA.b $0125               ;\
                    STA.w $4209               ; |Set IRQ V-timer
                    STZ.w $420A               ;/
                    STZ.w $4207               ;\Clear IRQ H-timer
                    STZ.w $4208               ;/
                    LDX.b #$A1                ;Enable NMI, IRQ (V-timer), and auto-joypad read
+                   STX.w $4200               ;Set interrupt enable flags (#$81 or #$A1)
                    LDA.b $0100               ;\Set screen brightness from mirror (again?)
                    STA.w $2100               ;/
                    LDA.b $0120               ;\Set HDMA Enable from mirror
                    STA.w $420C               ;/
                    RTS                       ;

CODE_00834E:        JSL.l CODE_038003         ;\NMI for SMB1
                    RTS                       ;/

CODE_008353:        JSL.l CODE_0D8003         ;\NMI for SMB:TLL
                    RTS                       ;/

CODE_008358:        JSL.l CODE_118003         ;\NMI for SMB2
                    RTS                       ;/

CODE_00835D:        JSL.l CODE_208003         ;\NMI for SMB3
                    RTS                       ;/