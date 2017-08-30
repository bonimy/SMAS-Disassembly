; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; SPC-700 program uploads go here                                ;

;-------Pointer to SPC data upload routines
PNTR_0089F1:        dw CODE_008B17            ;SMB1
                    dw CODE_008B17            ;SMB:TLL
                    dw CODE_008B27            ;SMB2
                    dw CODE_008B37            ;SMB3

;-------Load SPC data of selected game
CODE_0089F9:        SEI                       ;Set IRQ disable flag
                    STZ.w $4200               ;Disable interrupts
                    STZ.w $420C               ;Disable HDMA
                    STZ.w $2140               ;\
                    STZ.w $2142               ; |Disable SFX ports
                    STZ.w $2143               ; |
                    LDA.b #$FF                ; |
                    STA.w $2141               ;/
                    LDA.b $D0                 ;\
                    ASL   A                   ; |Set X as a word index by selected game
                    TAX                       ;/
                    JSR.w (PNTR_0089F1,x)     ;Upload SPC data of selected game
                    REP   #$20                ;16-bit A
                    LDX.b #$01<<1             ;Set pointer index for palette src
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Upload "Game Select" palette
                    LDA.w PNTR_0088BF,x       ; |
                    LDY.b #$02                ; |Source: $3C:B400
                    STA.b $02                 ; |Dest: $7F:9000
                    STY.b $04                 ; |Size: 0x200 bytes
                    LDA.w #$9000              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$9200              ;\
                    LDY.b #$7F                ; |Copy buffer to $7F:9200 as well.
                    JSL.l CODE_00866D         ;/
                    LDA.w #$0000              ;\
                    STA.l $7F8000             ; |Set #$0000 to $7F:8000
                    DEC   A                   ; |and #$FFFF to $7F:8002
                    STA.l $7F8002             ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$81                ;\Enable interrupts
                    STA.w $4200               ;/
                    INC.b $E0                 ;Set next game mode index
                    RTL                       ;

CODE_008A4F:        REP   #$20                ;16-bit A
                    LDA.w #$0400              ;\
                    STA.b $00                 ; |DMA SPC-700 data to RAM, part 1 of 2
                    LDA.w #DATA_07FC00        ; |
                    STA.b $02                 ; |Source: $07:FC00
                    LDY.b #DATA_07FC00>>$10   ; |Destination: $7F:0000
                    STY.b $04                 ; |Size: 0x400 bytes
                    LDA.w #$0000              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    LDA.w #$8000              ;\
                    STA.b $00                 ; |DMA SPC-700 data to RAM, part 2 of 2
                    LDA.w #DATA_3B8000        ; |
                    STA.b $02                 ; |Source: $3B:8000
                    LDY.b #DATA_3B8000>>$10   ; |Destination: $7F:0400
                    STY.b $04                 ; |Size: 0x8000 bytes
                    LDA.w #$0400              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    SEP   #$20                ;8-bit A
                    STZ.b $00                 ;\
                    LDA.b #$00                ; |
                    STA.b $01                 ; |SPC-700 data source: $7F:0000
                    LDA.b #$7F                ; |
                    STA.b $02                 ;/
                    JMP.w CODE_008BAC         ;Upload SPC engine + SMAS hall and menu audio data

;-------Load intro music to SPC-700, set Hall Screen to next mode
CODE_008A8E:        SEI                       ;Set interrupt disable flag
                    STZ.w $4200               ;Disable NMI, IRQ, and auto-joypad read
                    STZ.w $420C               ;HMDA Disable
                    STZ.w $2140               ;\
                    LDA.b #$FF                ; |Disable all audio ports
                    STA.w $2141               ; |Decrement $2141
                    STZ.w $2142               ; |
                    STZ.w $2143               ;/
                    STZ.b $00                 ;\
                    LDA.b #DATA_0B8000>>8     ; |
                    STA.b $01                 ; |SPC-700 data source: $0B:8000
                    LDA.b #DATA_0B8000>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC data
                    LDA.b #$81                ;\Enable NMI and auto-joypad read
                    STA.w $4200               ;/
                    INC.b $E1                 ;Go to next submode
                    LDA.b #$12                ;\[?]Play intro music
                    STA.b $60                 ;/
                    RTS                       ;

;-------[?]Load SPC-700 data for Game Select screen
CODE_008ABC:        SEI                       ;Set interrupt disable flag
                    STZ.w $4200               ;Disable NMI, IRQ, and auto-joypad read
                    STZ.w $420C               ;HMDA Disable
                    STZ.w $420B               ;DMA Disable
                    STZ.w $2140               ;\
                    LDA.b #$FF                ; |Disable all audio ports
                    STA.w $2141               ; |Decrement $2141
                    STZ.w $2142               ; |
                    STZ.w $2143               ;/
                    STZ.b $00                 ;\
                    LDA.b #DATA_0B8000>>8     ; |
                    STA.b $01                 ; |SPC-700 data source: $0B:8000
                    LDA.b #DATA_0B8000>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC data
                    LDA.b #$81                ;\Enable NMI and auto-joypad read
                    STA.w $4200               ;/
                    RTS                       ;

;-------Load SPC-700 music for Hall Screen second dark mode
CODE_008AE7:        SEI                       ;Set interrupt disable flag
                    STZ.w $4200               ;Disable NMI, IRQ, and auto-joypad read
                    STZ.w $420C               ;HMDA Disable
                    STZ.w $2140               ;\
                    LDA.b #$FF                ; |Disable all audio ports
                    STA.w $2141               ; |Decrement $2141
                    STZ.w $2142               ; |
                    STZ.w $2143               ;/
                    LDA.b #DATA_3BA251        ;\
                    STA.b $00                 ; |SPC-700 data source: $3B:A251
                    LDA.b #DATA_3BA251>>8     ; |
                    STA.b $01                 ; |
                    LDA.b #DATA_3BA251>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC data
                    LDA.b #$81                ;\Enable NMI and auto-joypad read
                    STA.w $4200               ;/
                    INC.b $E1                 ;Go to next submode
                    LDA.b #$3E                ;\[?]Play SFX (intro chatter American)
                    STA.b $60                 ;/
                    RTS                       ;

CODE_008B17:        LDA.b #DATA_1F8000        ;\
                    STA.b $00                 ; |
                    LDA.b #DATA_1F8000>>8     ; |
                    STA.b $01                 ; |SPC-700 data source: $1F:8000
                    LDA.b #DATA_1F8000>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC-700 data
                    RTS                       ;

CODE_008B27:        LDA.b #DATA_1FC000        ;\
                    STA.b $00                 ; |
                    LDA.b #DATA_1FC000>>8     ; |
                    STA.b $01                 ; |SPC-700 data source: $1F:C000
                    LDA.b #DATA_1FC000>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC-700 data
                    RTS                       ;

CODE_008B37:        LDA.b #DATA_0C8000        ;\
                    STA.b $00                 ; |
                    LDA.b #DATA_0C8000>>8     ; |SPC-700 data source: $0C:8000
                    STA.b $01                 ; |
                    LDA.b #DATA_0C8000>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC-700 data
                    RTS                       ;

CODE_008B47:        SEI                       ;
                    STZ.w $4200               ;
                    STZ.w $420C               ;
                    LDA.b #$FF                ;
                    STA.w $2141               ;
                    LDA.b #DATA_0C8000        ;\
                    STA.b $00                 ; |
                    LDA.b #DATA_0C8000>>8     ; |SPC-700 data source: $0C:8000
                    STA.b $01                 ; |
                    LDA.b #DATA_0C8000>>$10   ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC-700 data
                    RTL                       ;

CODE_008B63:        SEI                       ;
                    STZ.w $4200               ;
                    STZ.w $420C               ;
                    LDA.b #$FF                ;
                    STA.w $2141               ;
                    REP   #$20                ;
                    LDA.w #$2800              ;\
                    STA.b $00                 ; |
                    LDA.w #DATA_07C000        ; |
                    STA.b $02                 ; |SPC-700 data to RAM:
                    LDY.b #DATA_07C000>>$10   ; |Source: $07:C000
                    STY.b $04                 ; | Dest.: $7F:0000
                    LDA.w #$0000              ; | Size: $2800 bytes
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    SEP   #$20                ;\
                    LDA.b #$00                ; |
                    STZ.b $00                 ; |SPC-700 data source: $7F:0000
                    LDA.b #$00                ; | 
                    STA.b $01                 ; |
                    LDA.b #$7F                ; |
                    STA.b $02                 ;/
                    JSR.w CODE_008BAC         ;Upload SPC-700 data
                    REP   #$20                ;\
                    LDA.w #$C000              ; |
                    STA.b $00                 ; |Clear $7F0000-$
                    LDA.w #$0000              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00868E         ; |
                    SEP   #$20                ;/
                    RTL                       ;

;-------Upload SPC data routine
CODE_008BAC:        PHP                       ;Push processor status register
                    REP   #$30                ;16-bit AXY
                    LDY.w #$0000              ;Initialize source index
                    LDA.w #$BBAA              ;\
-                   CMP.w $2140               ; |Wait for SPC-700 to be ready
                    BNE   -                   ;/
                    SEP   #$20                ;8-bit A
                    LDA.b #$CC                ;\Let SPC-700 know that SNES is ready
                    BRA   ++                  ;/

-                   LDA.b [$00],y             ;\
                    INY                       ; |Get byte to copy
                    XBA                       ;/
                    LDA.b #$00                ;Initialize counter
                    BRA   +                   ;

--                  XBA                       ;\
                    LDA.b [$00],y             ; |Get byte to copy
                    INY                       ; |
                    XBA                       ;/
---                 CMP.w $2140               ;\Wait for register to echo
                    BNE   ---                 ;/
                    INC   A                   ;Increment SPC-700 counter
+                   REP   #$20                ;16-bit A
                    STA.w $2140               ;Copy the next byte
                    SEP   #$20                ;8-bit A
                    DEX                       ;\Copy more bytes until X is zero
                    BNE   --                  ;/
--                  CMP.w $2140               ;\Wait for register to echo
                    BNE   --                  ;/
--                  ADC.b #$03                ;\Tells SPC-700 that copy segment is done
                    BEQ   --                  ;/
++                  PHA                       ;Push A to stack
                    REP   #$20                ;16-bit A
                    LDA.b [$00],y             ;Get number of bytes to copy
                    INY                       ;\Increment index to next word
                    INY                       ;/
                    TAX                       ;Transfer number of bytes to copy to X register
                    LDA.b [$00],y             ;Get SPC-700 destination address
                    INY                       ;\Increment index to next word
                    INY                       ;/
                    STA.w $2142               ;Set SPC-700 destination address
                    SEP   #$20                ;8-bit A
                    CPX.w #$0001              ;\
                    LDA.b #$00                ; |Store $01 to $2141 if X is nonzero.
                    ROL   A                   ; |Otherwise, store $00.
                    STA.w $2141               ;/
                    ADC.b #$7F                ;Will set overflow flag if X was nonzero
                    PLA                       ;\Tell SPC-700 to prepare a copy
                    STA.w $2140               ;/
--                  CMP.w $2140               ;\Wait for register to echo
                    BNE   --                  ;/
                    BVS   -                   ;Begin copying if X was nonzero
                    STZ.w $2140               ;\
                    STZ.w $2141               ; |Initialize SPC-700 execution
                    STZ.w $2142               ; |
                    STZ.w $2143               ;/
                    PLP                       ;Restore processor status register
                    RTS                       ;