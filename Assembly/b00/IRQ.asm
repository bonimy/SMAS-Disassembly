; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; IRQ vector goes here                                           ;

PNTR_008362:        dw CODE_00838B                          ;\
                    dw CODE_0083A2                          ; |
                    dw CODE_0083A7                          ; | IRQ Pointers, based on current game.
                    dw CODE_0083AC                          ; |
                    dw CODE_0083B1                          ;/

N_VECTOR_IRQ:
E_VECTOR_IRQ:       REP   #$30                ;16-bit AXY
                    PHA                       ;\
                    PHX                       ; |Preserve register states
                    PHY                       ; |
                    PHD                       ; |
                    LDA.w #$0000              ;\|Direct page: $0100
                    TCD                       ;/|
                    PHB                       ; |
                    PHK                       ;\|Data bank = Program bank
                    PLB                       ;/
                    SEP   #$30                ;8-bit AXY
                    LDA.l $7FFF00             ;\
                    TAX                       ; |Execute IRQ based on current game
                    JSR.w (PNTR_008362,x)     ;/
                    REP   #$30                ;16-bit AXY
                    PLB                       ;\
                    PLD                       ; |Recover register states
                    PLY                       ; |
                    PLX                       ; |
                    PLA                       ;/
                    RTI                       ;

CODE_00838B:        LDA.w $4211               ;\Wait for IRQ flag to be set
                    BPL   +                   ;/
-                   BIT.w $4212               ;\Make sure we are not in V-blank
                    BVC   -                   ;/
                    LDA.w $0214               ;\ 
                    STA.w $210D               ; |Set BG1 H-scroll for IRQ
                    LDA.w $0215               ; |
                    STA.w $210D               ; |
+                   RTS                       ;/

CODE_0083A2:        JSL.l CODE_038006         ;\IRQ for SMB1
                    RTS                       ;/

CODE_0083A7:        JSL.l CODE_0D8006         ;\IRQ for SMB:TLL
                    RTS                       ;/

CODE_0083AC:        JSL.l CODE_118006         ;\IRQ for SMB2
                    RTS                       ;/

CODE_0083B1:        JSL.l CODE_208006         ;\IRQ for SMB3
                    RTS                       ;/