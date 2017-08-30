; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $048000
    fillbyte $FF : fill   $8000

ORG $048000
CODE_048000:        PHD                       ;Push direct page
                    LDA.b #$24                ;\
                    STA.b $00                 ;/
                    STZ.w $2115               ;Increment after writing $2118; increment by 1; no remapping
                    REP   #$20                ;16-bit A
                    LDA.w #$4300              ;\Direct page: $4300
                    TCD                       ;/
                    LDA.w #$1000>>1           ;\
                    STA.w $2116               ; |Write #$24 to low byte in BG2 VRAM tilemap
                    LDA.w #$08,$2118          ; |
                    STA.b $4300               ; |Base register: $2118 (VRAM Data Write low byte)
                    STZ.b $4302               ; |Writing mode: 4 regs write once
                    STZ.b $4304               ; |Source: $00:0000 (constant value #$24)
                    LDA.w #$0400              ; |Dest: VRAM $1000
                    STA.b $4305               ; |Size: 0x0400 bytes
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    STA.b $4305               ;\
                    LDA.w #$1000>>1           ; |Write #$00 to high byte in BG2 VRAM tilemap
                    STA.w $2116               ; |
                    STZ.w $0000               ; |Base register: $2119 (VRAM Data Write high byte)
                    LDX.b #$80                ; |Writing mode: 4 regs write once
                    STX.w $2115               ; |Source: $00:0000 (constant value #$00)
                    LDX.b #$2119              ; |Dest: VRAM $1000
                    STX.b $4301               ; |Size: 0x0400 bytes
                    STY.w $420B               ;/
                    LDX.b #$24                ;\
                    STX.w $0000               ; |Write #$24 to low byte in BG1 VRAM tilemap
                    STZ.w $2115               ; |
                    LDA.w #$0000>>1           ; |Base register: $2118 (VRAM Data Write low byte)
                    STA.w $2116               ; |Writing mode: 4 regs write once
                    LDA.w #$08,$2118          ; |Source: $00:0000 (constant value #$24)
                    STA.b $4300               ; |Dest: VRAM $0000
                    STZ.b $4302               ; |Size: 0x0800 bytes
                    STZ.b $4304               ; |
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/ 
                    STA.b $4305               ;\
                    LDA.w #$0000              ; |Write #$00 to high byte in BG1 VRAM tilemap
                    STA.w $2116               ; |
                    STZ.w $0000               ; |Base register: $2119 (VRAM Data Write high byte)
                    LDX.b #$80                ; |Writing mode: 4 regs write once
                    STX.w $2115               ; |Source: $00:0000 (constant value #$00)
                    LDX.b #$2119              ; |Dest: VRAM $0000
                    STX.b $4301               ; |Size: 0x0800 bytes
                    STY.w $420B               ;/
                    LDX.b #$28                ;\
                    STX.w $0000               ; |Write #$28 to low byte in BG3 VRAM tilemap
                    STZ.w $2115               ; |
                    LDA.w #$B0F0>>1           ; |Base register: $2118 (VRAM Data Write low byte)
                    STA.w $2116               ; |Writing mode: 4 regs write once
                    LDA.w #$08,$2118          ; |Source: $00:0000 (constant value #$00)
                    STA.b $4300               ; |Dest: VRAM $B0F0
                    STZ.b $4302               ; |Size: 0x0788 bytes
                    STZ.b $4304               ; |
                    LDA.w #$0788              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    STA.b $05                 ;\
                    LDA.w #$B0F0>>1           ; |Write #$00 to high byte in BG3 VRAM tilemap
                    STA.w $2116               ; |
                    STZ.w $0000               ; |Base register: $2119 (VRAM Data Write high byte)
                    LDX.b #$80                ; |Writing mode: 4 regs write once
                    STX.w $2115               ; |Source: $00:0000 (constant value #$00)
                    LDX.b #$2119              ; |Dest: VRAM $B0F0
                    STX.b $4301               ; |Size: 0x0788 bytes
                    STY.w $420B               ;/
                    SEP   #$20                ;8-bit A
                    PLD                       ;Recover direct page
                    RTL                       ;

CODE_0480AE:        LDA.b #$28                ;\
                    STA.b $00                 ; |Clear entire layer 3 tilemap with 28 00 28 00 etc
                    STZ.w $2115               ; |Tilemap is located at $B000-$B3FF
                    REP   #$20                ; |
                    LDA.w #$5800              ; |Format: Tile, properties, tile, etc
                    STA.w $2116               ; |
                    LDA.w #$1808              ; |Clears tilemap by fixed DMA.
                    STA.w $4300               ; |
                    STZ.w $4302               ; |Only runs during game loading
                    STZ.w $4304               ; |
                    LDA.w #$0200              ; |
                    STA.w $4305               ; |
                    LDY.b #$01                ; |
                    STY.w $420B               ; |
                    STA.w $4305               ; |
                    LDA.w #$5800              ; |
                    STA.w $2116               ; |
                    SEP   #$20                ; |
                    STZ.b $00                 ; |
                    LDA.b #$80                ; |
                    STA.w $2115               ; |
                    LDA.b #$19                ; |
                    STA.w $4301               ; |
                    STY.w $420B               ; |
                    RTL                       ;/

CODE_0480EF:        PHD                       ;
                    LDA.b #$27                ;
                    STA.b $00                 ;
                    STZ.w $2115               ;
                    REP   #$20                ;
                    LDA.w #$4300              ;
                    TCD                       ;
                    LDA.w #$0000              ;
                    STA.w $2116               ;
                    LDA.w #$1808              ;
                    STA.b $00                 ;
                    STZ.b $02                 ;
                    STZ.b $04                 ;
                    LDA.w #$0400              ;
                    STA.b $05                 ;
                    LDY.b #$01                ;
                    STY.w $420B               ;
                    STA.b $05                 ;
                    LDA.w #$0000              ;
                    STA.w $2116               ;
                    LDX.b #$0C                ;
                    STX.w $0000               ;
                    LDX.b #$80                ;
                    STX.w $2115               ;
                    LDX.b #$19                ;
                    STX.b $01                 ;
                    STY.b $0B                 ;
                    LDX.b #$24                ;
                    STX.w $0000               ;
                    STZ.w $2115               ;
                    LDA.w #$0800              ;
                    STA.w $2116               ;
                    STZ.b $02                 ;
                    STZ.b $04                 ;
                    LDA.w #$0400              ;
                    STA.b $05                 ;
                    STY.w $420B               ;
                    STA.b $05                 ;
                    LDA.w #$0800              ;
                    STA.w $2116               ;
                    SEP   #$20                ;
                    STZ.w $0000               ;
                    LDA.b #$80                ;
                    STA.w $2115               ;
                    LDA.b #$19                ;
                    STA.b $01                 ;
                    STY.w $420B               ;
                    PLD                       ;
                    RTL                       ;

;-------[?]SFX Mirrors
CODE_048163:        LDA.w $1600               ;
                    BNE   ++                  ;
                    LDA.w $2140               ;
                    CMP.w $1604               ;
                    BEQ   +                   ;
                    INC.w $160A               ;
                    LDA.w $160A               ;
                    CMP.b #$03                ;
                    BCC   +++                 ;
+                   LDA.b #$00                ;
++                  STA.w $2140               ;
                    STA.w $1604               ;
                    STZ.w $160A               ;
+++                 LDA.w $1601               ;
                    BNE   ++                  ;
                    LDA.w $2141               ;
                    AND.b #$0F                ;
                    CMP.w $1605               ;
                    BEQ   +                   ;
                    INC.w $160B               ;
                    LDA.w $160B               ;
                    CMP.b #$03                ;
                    BCC   +++                 ;
+                   LDA.b #$00                ;
++                  STA.w $2141               ;
                    AND.b #$0F                ;
                    STA.w $1605               ;
                    STZ.w $160B               ;
+++                 LDA.w $1602               ;
                    BEQ   .sub2               ;
                    LDY.b #$04                ;
                    STY.w $160C               ;
                    STA.w $2142               ;
                    CMP.b #$F0                ;
                    BCS   .loop               ;
                    STA.w $1606               ;
.loop               LDA.w $1603               ;
                    BNE   .sub1               ;
                    LDA.w $2143               ;
                    AND.b #$7F                ;
                    CMP.w $1607               ;
                    BEQ   +                   ;
                    INC.w $160D               ;
                    LDA.w $160D               ;
                    CMP.b #$03                ;
                    BCC   .clear1             ;
+                   LDA.b #$00                ;
                    STA.w $2143               ;
                    STA.w $1607               ;
                    STZ.w $160D               ;
                    BRA   .clear1             ;

.sub1               STA.w $1607               ;
                    CMP.b #$01                ;
                    BEQ   +                   ;
                    CMP.b #$05                ;
                    BEQ   +                   ;
                    CMP.b #$06                ;
                    BEQ   +                   ;
                    CMP.b #$4A                ;
                    BNE   .clear2             ;
+                   ORA.w $160F               ;
                    STA.w $2143               ;
                    LDA.w $160F               ;
                    EOR.b #$80                ;
                    STA.w $160F               ;
                    STZ.w $160D               ;
.clear1             STZ.w $1600               ;
                    STZ.w $1601               ;
                    STZ.w $1602               ;
                    STZ.w $1603               ;
                    RTL                       ;

.clear2             STA.w $2143               ;
                    STZ.w $1600               ;
                    STZ.w $1601               ;
                    STZ.w $1602               ;
                    STZ.w $1603               ;
                    RTL                       ;

.sub2               LDY.w $2142               ;
                    CPY.w $1606               ;
                    BNE   .loop               ;
                    DEC.w $160C               ;
                    LDA.w $160C               ;
                    BNE   .loop               ;
                    INC.w $160C               ;
                    STA.w $2142               ;
                    BRA   .loop               ;

                    db $00,$00,$00,$00,$31,$00,$00,$00
                    db $00,$00,$10,$00,$20,$00,$30,$00

                    db $31,$00,$31,$00,$31,$00,$31,$00
                    db $10,$00,$10,$00,$10,$00,$10,$00

CODE_04825E:        STZ.w $420C               ;
                    STZ.w $1203               ;Disable HDMA channels
                    STZ.w $1207               ;main screen window mask designation: null
                    STZ.w $1208               ;sub screen window mask designation: null
                    STZ.w $1204               ;window mask settings for bg1/2: null
                    STZ.w $1205               ;^for bg3/4: null
                    STZ.w $1206               ;^for OBJ and color window: null
                    STZ.w $1209               ;Color addition select: null
                    LDX.b #$20                ;\CGADSUB: Enable color math on backdrop
                    STX.w $120A               ;/
                    CMP.b #$FF                ;\
                    BNE   CODE_048280         ; |If there's a HDMA gradient, execute the gradient code
                    RTL                       ;/

CODE_048280:        PHB                       ;\
                    PHK                       ; |DB = PB
                    PLB                       ;/
                    STA.b $00                 ;HDMA gradient type goes into $00. See $7E00F1 for types
                    ASL   A                   ;
                    TAY                       ;
                    PHY                       ;
                    LDA.w $824E,y             ;
                    STA.b $01                 ;
                    LDX.w $823E,y             ;
                    LDY.b #$00                ;
CODE_048292:        LDA.w $83AC,x             ;\
                    STA.w $1520,y             ; |
                    LDA.w $840E,x             ; |
                    STA.w $1560,y             ; |Copy indirect HDMA pointers to RAM until you're done
                    LDA.w $8470,x             ; |
                    STA.w $15A0,y             ; |
                    INX                       ; |
                    INY                       ; |
                    CPY.b $01                 ; |
                    BNE   CODE_048292         ;/
                    PLY                       ;
                    LDA.w $8256,y             ;
                    STA.b $01                 ;
                    LDX.w $8246,y             ;
                    LDY.b #$00                ;
CODE_0482B5:        LDA.w $84D2,x             ;
                    STA.w $1400,y             ;
                    LDA.w $8512,x             ;
                    STA.w $1460,y             ;
                    LDA.w $8552,x             ;
                    STA.w $14C0,y             ;
                    INX                       ;
                    INY                       ;
                    CPY.b $01                 ;
                    BNE   CODE_0482B5         ;

                    REP   #$10                ;16-bit XY.
                    LDX.w #$3240              ;\Base reg: $2132 (direct color data)
                    STX.w $4350               ; |1 reg write once, indirect pointers
                    STX.w $4360               ; |We are setting up 3 HDMA channels it seems
                    STX.w $4370               ;/
                    LDX.w #$1520              ;\
                    STX.w $4352               ; |
                    LDX.w #$1560              ; |
                    STX.w $4362               ; |DMA source: $00:1520
                    LDX.w #$15A0              ; |            $00:1560
                    STX.w $4372               ; |            $00:15A0
                    LDA.b #$00                ; |
                    STA.w $4354               ; |
                    STA.w $4364               ; |
                    STA.w $4374               ;/
                    LDA.b #$00                ;\
                    STA.w $4357               ; |
                    LDA.b #$00                ; |
                    STA.w $4367               ; |Indirect HDMA bank bytes: $00
                    LDA.b #$00                ; |
                    STA.w $4377               ;/
                    LDA.b #$01                ;\Timer to move the gradient up and down(water)
                    STA.w $15E0               ;/Set to 1 so it doesn't keep moving up-down.
                    LDA.b $00                 ;
                    CMP.b #$02                ;
                    BNE   CODE_048357         ;
                    LDX.w #$2841              ;\Base reg: $2128. Indirect pointers.
                    STX.w $4340               ;/2 regs write once (Window 2 L+R position)
                    LDX.w #$83A5              ;\
                    STX.w $4342               ; |
                    LDA.b #$04                ; |DMA source: $04:83A5
                    STA.w $4344               ; |
                    LDA.b #$04                ; |
                    STA.w $4347               ;/
                    LDA.b #$17                ;\Window mask designation for main screen
                    STA.w $1207               ;/Everything except BG4
                    STZ.w $1208               ;Window mask designation for sub screen: none
                    STZ.w $1204               ;\Window Mask Settings for BG1/2/3/4
                    STZ.w $1205               ;/
                    LDA.b #$80                ;\Enable window 2 for BG1/BG3/OBJ
                    STA.w $1206               ;/
                    LDA.b #$10                ;\Prevent color math outside window
                    STA.w $1209               ;/
                    LDA.b #$33                ;\Enable color math on OBJ & Backdrop & BG1/2
                    STA.w $120A               ;/
                    LDA.b #$F0                ;\Enable HDMA channels 7/6/5/4
                    STA.w $1203               ;/
                    STZ.w $1000               ;\Background color: black
                    STZ.w $1001               ;/
                    INC.w $1200               ;
                    SEP   #$10                ;8-bit XY
                    PLB                       ;pull program bank
                    RTL                       ;return

CODE_048357:        LDA.b #$E0                ;\Enable HDMA channels 7/6/5
                    STA.w $1203               ;/
                    SEP   #$10                ;8-bit XY
                    PLB                       ;pull program bank
                    RTL                       ;return

                    db $00,$03,$06,$09,$09,$06,$03,$00

                    db $0C,$0C,$0C,$1C,$0C,$0C,$0C,$1C ;The very small pauses between going up and down 1 time
                                                       ;in the underwater HDMA wavy gradient effect

                    db $01,$01,$01,$01,$FF,$FF,$FF,$FF

CODE_048378:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    DEC.w $15E0               ;
                    BNE   CODE_0483A3         ;
                    LDX.w $15E2               ;
                    LDA.w $8368,x             ;
                    STA.w $15E0               ;
                    LDY.w $8360,x             ;
                    LDA.w $1520,y             ;
                    CLC                       ;
                    ADC.w $8370,x             ;
                    STA.w $1520,y             ;
                    STA.w $1560,y             ;
                    STA.w $15A0,y             ;
                    INX                       ;
                    TXA                       ;
                    AND.b #$07                ;
                    STA.w $15E2               ;
CODE_0483A3:        PLB                       ;
                    RTL                       ;

                    db $27,$92,$85,$02,$94,$85,$00     ;Unknown

                    db $40,$00,$14,$08,$01,$14,$08,$02 ;Red indirect pointers. Scanline - ram address (word) - scanline - etc
                    db $14,$08,$03,$14,$06,$04,$14,$06
                    db $05,$14,$06,$06,$14,$06,$07,$14
                    db $08,$08,$14,$04,$09,$14,$04,$0A
                    db $14,$04,$0B,$14,$04,$0C,$14,$04
                    db $0D,$14,$03,$0E,$14,$01,$0F,$14
                    db $00,$20,$00,$14,$02,$01,$14,$02
                    db $02,$14,$03,$03,$14,$03,$04,$14
                    db $04,$05,$14,$04,$06,$14,$05,$07
                    db $14,$06,$08,$14,$07,$09,$14,$08
                    db $0A,$14,$09,$0B,$14,$0A,$0C,$14
                    db $0B,$0D,$14,$0C,$0E,$14,$01,$0F
                    db $14,$00

                    db $40,$60,$14,$08,$61,$14,$08,$62 ;green indirect pointers
                    db $14,$08,$63,$14,$06,$64,$14,$06
                    db $65,$14,$06,$66,$14,$06,$67,$14
                    db $08,$68,$14,$04,$69,$14,$04,$6A
                    db $14,$04,$6B,$14,$04,$6C,$14,$04
                    db $6D,$14,$03,$6E,$14,$01,$6F,$14
                    db $00,$20,$60,$14,$02,$61,$14,$02
                    db $62,$14,$03,$63,$14,$03,$64,$14
                    db $04,$65,$14,$04,$66,$14,$05,$67
                    db $14,$06,$68,$14,$07,$69,$14,$08
                    db $6A,$14,$09,$6B,$14,$0A,$6C,$14
                    db $0B,$6D,$14,$0C,$6E,$14,$01,$6F
                    db $14,$00

                    db $40,$C0,$14,$08,$C1,$14,$08,$C2 ;blue indirect pointers
                    db $14,$08,$C3,$14,$06,$C4,$14,$06
                    db $C5,$14,$06,$C6,$14,$06,$C7,$14
                    db $08,$C8,$14,$04,$C9,$14,$04,$CA
                    db $14,$04,$CB,$14,$04,$CC,$14,$04
                    db $CD,$14,$03,$CE,$14,$01,$CF,$14
                    db $00,$20,$C0,$14,$02,$C1,$14,$02
                    db $C2,$14,$03,$C3,$14,$03,$C4,$14
                    db $04,$C5,$14,$04,$C6,$14,$05,$C7
                    db $14,$06,$C8,$14,$07,$C9,$14,$08
                    db $CA,$14,$09,$CB,$14,$0A,$CC,$14
                    db $0B,$CD,$14,$0C,$CE,$14,$01,$CF
                    db $14,$00

                    db $2A,$2B,$2C,$2D,$2E,$2F,$30,$31 ;red intensity stuff. Actual data of $2132
                    db $32,$33,$34,$35,$36,$37,$38,$38 ;bgrc cccc
                    db $27,$26,$25,$24,$23,$22,$21,$20
                    db $20,$20,$20,$20,$20,$20,$20,$20
                    db $38,$2B,$2A,$29,$28,$27,$26,$25
                    db $24,$23,$22,$21,$20,$20,$20,$20
                    db $3A,$3B,$3C,$3D,$3E,$3F,$3F,$3F
                    db $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F

                    db $51,$52,$53,$54,$55,$56,$57,$58 ;green intensity stuff
                    db $59,$5A,$5B,$5C,$5D,$5E,$5F,$5F
                    db $47,$46,$45,$44,$43,$42,$41,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $5F,$51,$50,$4F,$4E,$4D,$4C,$4B
                    db $4A,$49,$48,$47,$46,$45,$44,$43
                    db $5F,$5F,$5F,$5F,$5F,$5F,$5F,$5F
                    db $5F,$5F,$5F,$5F,$5F,$5F,$5F,$5F

                    db $94,$95,$96,$97,$98,$99,$9A,$9B ;blue intensity stuff
                    db $9C,$9D,$9E,$9F,$9F,$9F,$9F,$9F
                    db $8D,$8C,$8B,$8A,$89,$88,$87,$86
                    db $85,$84,$83,$82,$81,$80,$80,$80
                    db $9F,$9C,$9B,$9A,$99,$98,$97,$96
                    db $95,$94,$93,$92,$91,$90,$8F,$8E
                    db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
                    db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F

                    db $FF,$00,$00,$FF                 ;???

CODE_048596:        INC.w $075A               ;\ Increase lives by 1 & make sure
                    LDA.w $075A               ; |it doesn't get past 128.
                    CMP.b #$80                ; |
                    BCC   CODE_0485A5         ; |
                    LDA.b #$7F                ; |
                    STA.w $075A               ; |
CODE_0485A5:        RTL                       ;/

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF

CODE_048600:        LDA.w $1680               ;
                    BMI   CODE_048629         ;
                    BNE   CODE_048619         ;
                    LDX.w $0753               ;
                    LDA.w $0FF6,x             ;
                    AND.b #$10                ;
                    BEQ   CODE_048629         ;
                    INC.w $1680               ;
                    LDA.b #$43                ;
                    STA.w $1600               ;
CODE_048619:        DEC.w $0B9A               ;
                    DEC.w $0B9A               ;
                    LDA.w $0B9A               ;
                    BPL   CODE_048629         ;
                    LDA.b #$0D                ;
                    STA.w $0772               ;
CODE_048629:        RTL                       ;

CODE_04862A:        JSL.l CODE_05DE31         ;
                    JSL.l CODE_05EB5A         ;
                    LDA.b #$22                ;
                    STA.w $1204               ;
                    LDA.b #$02                ;
                    STA.w $1205               ;
                    INC.w $0772               ;
                    RTL                       ;

CODE_048640:        LDA.w $2140               ;
                    BNE   CODE_04864F         ;
                    LDA.b #$0C                ;
                    STA.w $0772               ;
                    LDA.b #$80                ;
                    STA.w $1680               ;
CODE_04864F:        RTL                       ;

CODE_048650:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.w $0753               ;
                    LDA.w $0FF6,y             ;
                    AND.b #$2C                ;
                    BEQ   CODE_04866D         ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
                    LDA.w $0F06               ;
                    EOR.b #$10                ;
                    STA.w $0F06               ;
CODE_04866D:        LDY.b #$03                ;
CODE_04866F:        LDA.w $86DB,y             ;
                    STA.w $0800,y             ;
                    DEY                       ;
                    BPL   CODE_04866F         ;
                    LDA.w $0801               ;
                    CLC                       ;
                    ADC.w $0F06               ;
                    STA.w $0801               ;
                    INC.w $0B78               ;
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ORA.b #$02                ;
                    STA.w $0C00               ;
                    LDY.w $0753               ;
                    LDX.b #$00                ;
                    LDA.w $0FF6,y             ;
                    AND.b #$10                ;
                    BEQ   CODE_0486D7         ;
                    LDA.b #$29                ;
                    STA.w $1603               ;
                    STZ.w $075B               ;
                    STZ.w $075E               ;
                    STZ.w $0760               ;
                    STZ.w $075C               ;
                    LDA.w $0F06               ;
                    BEQ   CODE_0486B8         ;
                    STZ.w $075F               ;
CODE_0486B8:        LDA.w $86D9,y             ;
                    TAX                       ;
                    LDY.b #$07                ;
CODE_0486BE:        STZ.w $07DA,x             ;
                    STZ.w $07CE,x             ;
                    INX                       ;
                    DEY                       ;
                    BNE   CODE_0486BE         ;
                    LDX.b #$02                ;
                    LDA.w $0F06               ;
                    BNE   CODE_0486D7         ;
                    LDA.b #$04                ;
                    STA.w $075A               ;
                    INC.w $075D               ;
CODE_0486D7:        PLB                       ;
                    RTL                       ;

                    db $00,$06,$50,$6C,$0C,$2B ;Unreachable?

CODE_0486DF:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    REP   #$30                ;
                    LDX.w #$0000              ;
CODE_0486E7:        LDA.w $86FD,x             ;
                    STA.w $1702,y             ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    INX                       ;
                    CMP.w #$FFFF              ;
                    BNE   CODE_0486E7         ;
                    STY.w $1700               ;
                    SEP   #$30                ;
                    PLB                       ;
                    RTL                       ;

                    dw $CD09,$0F00,$02A1,$02A2
                    dw $02A3,$02A4,$02A5,$02A6
                    dw $02A7,$02A8,$0D0A,$0700
                    dw $02A9,$02AA,$02AB,$02AC
                    dw $FFFF

CODE_04871F:        LDA.w $0B9A               ;
                    CMP.b #$30                ;
                    BCC   CODE_048727         ;
                    RTL                       ;

CODE_048727:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHD                       ;
                    REP   #$30                ;
                    LDA.w #$0B00              ;
                    TCD                       ;
                    STZ.b $84                 ;
                    STZ.b $8E                 ;
                    STZ.b $90                 ;
                    STZ.b $92                 ;
                    LDA.b $9A                 ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.l DATA_009780,x       ;
                    STA.b $94                 ;
                    LDA.w #$0078              ;
                    STA.b $96                 ;
                    LDA.w #$00B0              ;
                    STA.b $98                 ;
CODE_048750:        LDA.w #$0100              ;
                    STA.b $80                 ;
                    STA.b $82                 ;
                    LDA.b $90                 ;
                    INC   A                   ;
                    CMP.b $9A                 ;
                    BCS   CODE_048794         ;
                    LDA.b $92                 ;
                    CLC                       ;
                    ADC.b $94                 ;
                    STA.b $92                 ;
                    XBA                       ;
                    AND.w #$00FF              ;
                    LSR   A                   ;
                    SEP   #$30                ;
                    TAX                       ;
                    LDA.l DATA_0096FF,x       ;
                    STA.w $4202               ;
                    LDA.b $9A                 ;
                    STA.w $4203               ;
                    NOP                       ;
                    NOP                       ;
                    NOP                       ;
                    NOP                       ;
                    LDA.w $4217               ;
                    STA.b $88                 ;
                    STZ.b $89                 ;
                    REP   #$30                ;
                    LDA.b $88                 ;
                    CLC                       ;
                    ADC.b $98                 ;
                    STA.b $82                 ;
                    LDA.b $98                 ;
                    SEC                       ;
                    SBC.b $88                 ;
                    STA.b $80                 ;
CODE_048794:        LDA.b $96                 ;
                    SEC                       ;
                    SBC.b $90                 ;
                    DEC   A                   ;
                    ASL   A                   ;
                    STA.b $84                 ;
                    TAX                       ;
                    LDA.b $80                 ;
                    TAY                       ;
                    BMI   CODE_0487B2         ;
                    AND.w #$FF00              ;
                    BEQ   CODE_0487B5         ;
                    CMP.w #$0100              ;
                    BNE   CODE_0487B2         ;
                    LDY.w #$00FF              ;
                    BRA   CODE_0487B5         ;

CODE_0487B2:        LDY.w #$0000              ;
CODE_0487B5:        TYA                       ;
                    AND.w #$00FF              ;
                    STA.b $86                 ;
                    LDA.b $82                 ;
                    TAY                       ;
                    AND.w #$FF00              ;
                    BEQ   CODE_0487C6         ;
                    LDY.w #$00FF              ;
CODE_0487C6:        TYA                       ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    ORA.b $86                 ;
                    STA.b $86                 ;
                    CPX.w #$01C0              ;
                    BCS   CODE_0487E0         ;
                    CMP.w #$FFFF              ;
                    BNE   CODE_0487DC         ;
                    LDA.w #$00FF              ;
CODE_0487DC:        STA.l $7FF000,x           ;
CODE_0487E0:        LDA.b $96                 ;
                    CLC                       ;
                    ADC.b $90                 ;
                    DEC   A                   ;
                    ASL   A                   ;
                    STA.b $8E                 ;
                    CMP.w #$01C0              ;
                    BCS   CODE_0487FD         ;
                    TAX                       ;
                    LDA.b $86                 ;
                    CMP.w #$FFFF              ;
                    BNE   CODE_0487F9         ;
                    LDA.w #$00FF              ;
CODE_0487F9:        STA.l $7FF000,x           ;
CODE_0487FD:        INC.b $90                 ;
                    LDA.b $84                 ;
                    CMP.w #$01C0              ;
                    BCC   CODE_04880D         ;
                    LDA.b $8E                 ;
                    CMP.w #$01C0              ;
                    BCS   CODE_048810         ;
CODE_04880D:        JMP.w CODE_048750         ;

CODE_048810:        SEP   #$30                ;
                    INC.b $9A                 ;
                    PLD                       ;
                    PLB                       ;
                    RTL                       ;

CODE_048817:        SEP   #$10                ;
                    LDX.b #$00                ;
CODE_04881B:        STZ.w $05D0,x             ;
                    STZ.w $05E0,x             ;
                    STZ.w $05F0,x             ;
                    STZ.w $0600,x             ;
                    STZ.w $0610,x             ;
                    STZ.w $0620,x             ;
                    STZ.w $0630,x             ;
                    STZ.w $0640,x             ;
                    STZ.w $0650,x             ;
                    STZ.w $0660,x             ;
                    STZ.w $0670,x             ;
                    STZ.w $0680,x             ;
                    STZ.w $0690,x             ;
                    INX                       ;
                    TXA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_04881B         ;
                    LDA.b #$68                ;
                    STA.w $0640               ;
                    STA.w $0641               ;
                    STA.w $0642               ;
                    STA.w $0673               ;
                    STA.w $0674               ;
                    STA.w $0675               ;
                    STA.w $0676               ;
                    STA.w $0649               ;
                    STA.w $064A               ;
                    STA.w $064B               ;
                    STA.w $064C               ;
                    STA.w $064D               ;
                    STA.w $064E               ;
                    LDA.b #$01                ;
                    STA.w $0EC9               ;
                    RTL                       ;

                    db $58,$43,$00,$09,$16,$20,$0A,$20
                    db $1B,$20,$12,$20,$18,$20,$FF

                    db $58,$43,$00,$09,$15,$20,$1E,$20
                    db $12,$20,$10,$20,$12,$20,$FF

CODE_048895:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.w $0753               ;
                    BNE   CODE_0488AE         ;
                    LDX.b #$00                ;
CODE_0488A0:        LDA.w $8877,x             ;
                    STA.w $1702,y             ;
                    INY                       ;
                    INX                       ;
                    CMP.b #$FF                ;
                    BNE   CODE_0488A0         ;
                    BRA   CODE_0488BC         ;

CODE_0488AE:        LDX.b #$00                ;
CODE_0488B0:        LDA.w $8886,x             ;
                    STA.w $1702,y             ;
                    INY                       ;
                    INX                       ;
                    CMP.b #$FF                ;
                    BNE   CODE_0488B0         ;
CODE_0488BC:        PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0488BF:        STZ.b $F6                 ;Flag for vertically extendable objects
                    REP   #$30                ;Accumulator 16-bit - Index 16-bit
                    LDA.w $0EEC               ;
                    STA.b $F3                 ;
                    STZ.b $F7                 ;
CODE_0488CA:        LDX.b $F3                 ;
                    SEP   #$20                ;
                    LDA.l $048949,x           ;
                    CLC                       ;
                    ROL   A                   ;
                    ROL   A                   ;
                    AND.b #$01                ;
                    STA.b $F5                 ;
                    LDA.l $04894A,x           ;
                    ASL   A                   ;
                    REP   #$21                ;
                    LDX.b $F7                 ;
                    ADC.b $F5                 ;
                    AND.w #$00FF              ;
                    CMP.w #$0080              ;
                    BCC   CODE_0488EF         ;
                    ORA.w #$FF00              ;
CODE_0488EF:        CLC                       ;
                    ADC.w $0EFD               ;
                    CLC                       ;
                    ADC.w #$0008              ;The change in position of the flow.
                    STA.l $7F2000,x           ;
                    LDA.b $F3                 ;
                    CLC                       ;
                    ADC.w #$0010              ;The frequency of the waving.
                    AND.w #$01FF              ;
                    STA.b $F3                 ;
                    INC.b $F7                 ;
                    INC.b $F7                 ;
                    LDA.b $F7                 ;
                    CMP.w #$0040              ;
                    BNE   CODE_0488CA         ;
                    LDA.w $0EEC               ;
                    CLC                       ;
                    ADC.w #$0004              ;The waving speed.
                    AND.w #$01FF              ;
                    STA.w $0EEC               ;
                    SEP   #$30                ;
                    PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$20                ;
                    LDY.b #$3E                ;
CODE_048929:        LDA.w $2000,y             ;
                    STA.w $2040,y             ;
                    STA.w $2080,y             ;
                    STA.w $20C0,y             ;
                    STA.w $2100,y             ;
                    STA.w $2140,y             ;
                    STA.w $2180,y             ;
                    STA.w $21C0,y             ;
                    DEY                       ;
                    DEY                       ;
                    BPL   CODE_048929         ;
                    SEP   #$20                ;
                    PLB                       ;
                    RTL                       ;

                    dw $0000,$FFFA,$FFF4,$FFEE ;HDMA underwater wavy table
                    dw $FFE7,$FFE1,$FFDB,$FFD5 ;uses one addition-subtraction instruction only
                    dw $FFCF,$FFC8,$FFC2,$FFBC
                    dw $FFB6,$FFB0,$FFAA,$FFA4
                    dw $FF9F,$FF99,$FF93,$FF8D
                    dw $FF88,$FF82,$FF7D,$FF78
                    dw $FF72,$FF6D,$FF68,$FF63
                    dw $FF5E,$FF59,$FF55,$FF50
                    dw $FF4B,$FF47,$FF43,$FF3F
                    dw $FF3B,$FF37,$FF33,$FF2F
                    dw $FF2C,$FF28,$FF25,$FF22
                    dw $FF1F,$FF1C,$FF19,$FF16
                    dw $FF14,$FF12,$FF0F,$FF0D
                    dw $FF0C,$FF0A,$FF08,$FF07
                    dw $FF05,$FF04,$FF03,$FF02
                    dw $FF02,$FF01,$FF01,$FF01
                    dw $FF01,$FF01,$FF01,$FF01
                    dw $FF02,$FF02,$FF03,$FF04
                    dw $FF05,$FF07,$FF08,$FF0A
                    dw $FF0C,$FF0D,$FF0F,$FF12
                    dw $FF14,$FF16,$FF19,$FF1C
                    dw $FF1F,$FF22,$FF25,$FF28
                    dw $FF2C,$FF2F,$FF33,$FF37
                    dw $FF3B,$FF3F,$FF43,$FF47
                    dw $FF4B,$FF50,$FF55,$FF59
                    dw $FF5E,$FF63,$FF68,$FF6D
                    dw $FF72,$FF78,$FF7D,$FF82
                    dw $FF88,$FF8D,$FF93,$FF99
                    dw $FF9F,$FFA4,$FFAA,$FFB0
                    dw $FFB6,$FFBC,$FFC2,$FFC8
                    dw $FFCF,$FFD5,$FFDB,$FFE1
                    dw $FFE7,$FFEE,$FFF4,$FFFA
                    dw $0000,$0006,$000C,$0012
                    dw $0019,$001F,$0025,$002B
                    dw $0031,$0038,$003E,$0044
                    dw $004A,$0050,$0056,$005C
                    dw $0061,$0067,$006D,$0073
                    dw $0078,$007E,$0083,$0088
                    dw $008E,$0093,$0098,$009D
                    dw $00A2,$00A7,$00AB,$00B0
                    dw $00B5,$00B9,$00BD,$00C1
                    dw $00C5,$00C9,$00CD,$00D1
                    dw $00D4,$00D8,$00DB,$00DE
                    dw $00E1,$00E4,$00E7,$00EA
                    dw $00EC,$00EE,$00F1,$00F3
                    dw $00F4,$00F6,$00F8,$00F9
                    dw $00FB,$00FC,$00FD,$00FE
                    dw $00FE,$00FF,$00FF,$00FF
                    dw $00FF,$00FF,$00FF,$00FF
                    dw $00FE,$00FE,$00FD,$00FC
                    dw $00FB,$00F9,$00F8,$00F6
                    dw $00F4,$00F3,$00F1,$00EE
                    dw $00EC,$00EA,$00E7,$00E4
                    dw $00E1,$00DE,$00DB,$00D8
                    dw $00D4,$00D1,$00CD,$00C9
                    dw $00C5,$00C1,$00BD,$00B9
                    dw $00B5,$00B0,$00AB,$00A7
                    dw $00A2,$009D,$0098,$0093
                    dw $008E,$0088,$0083,$007E
                    dw $0078,$0073,$006D,$0067
                    dw $0061,$005C,$0056,$0050
                    dw $004A,$0044,$003E,$0038
                    dw $0031,$002B,$0025,$001F
                    dw $0019,$0012,$000C,$0006

CODE_048B49:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    BRA   CODE_048B59         ;

CODE_048B4E:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $0EDC               ;
                    BEQ   CODE_048B85         ;
                    JSR.w CODE_048C77         ;
CODE_048B59:        PHX                       ;
                    PHY                       ;
                    LDA.w $0ED6               ;
                    AND.b #$80                ;
                    STA.w $0ED6               ;
                    LDA.b $5C                 ;
                    BNE   CODE_048B72         ;
                    JSR.w CODE_048C28         ;
                    LDA.b #$06                ;
                    STA.w $0773               ;
                    JMP.w CODE_048B7E         ;

CODE_048B72:        CMP.b #$01                ;
                    BNE   CODE_048B83         ;
                    JSR.w CODE_048B87         ;
                    LDA.b #$01                ;
                    STA.w $0ED4               ;
CODE_048B7E:        LDA.b #$01                ;
                    STA.w $0EDE               ;
CODE_048B83:        PLY                       ;
                    PLX                       ;
CODE_048B85:        PLB                       ;
                    RTL                       ;

CODE_048B87:        REP   #$30                ;
                    LDA.w #$000E              ;
                    STA.b $F7                 ;
                    LDA.w $0ED9               ;
                    STA.b $00                 ;
                    LDA.l $7F2000             ;
                    TAX                       ;
                    LDA.b $F3                 ;
                    XBA                       ;
                    STA.l $7F2002,x           ;
                    INC   A                   ;
                    STA.l $7F203C,x           ;
CODE_048BA4:        PHX                       ;
                    LDX.b $00                 ;
                    LDA.l $7F3000,x           ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    PLX                       ;
                    LDA.w $BD09,y             ;
                    STA.l $7F2004,x           ;
                    LDA.w $BD0B,y             ;
                    STA.l $7F2006,x           ;
                    LDA.w $BD0D,y             ;
                    STA.l $7F203E,x           ;
                    LDA.w $BD0F,y             ;
                    STA.l $7F2040,x           ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $00                 ;
                    DEC.b $F7                 ;
                    BNE   CODE_048BA4         ;
                    LDA.l $7F2000             ;
                    TAX                       ;
                    LDA.w #$FFFF              ;
                    STA.l $7F2076,x           ;
                    LDA.l $7F2000             ;
                    CLC                       ;
                    ADC.w #$0074              ;
                    STA.l $7F2000             ;
                    LDA.w $0ED9               ;
                    INC   A                   ;
                    AND.w #$000F              ;
                    BNE   CODE_048C0F         ;
                    LDA.w $0ED9               ;
                    AND.w #$FFF0              ;
                    CLC                       ;
                    ADC.w #$00E0              ;
                    STA.w $0ED9               ;
                    BRA   CODE_048C12         ;

CODE_048C0F:        INC.w $0ED9               ;
CODE_048C12:        LDA.w $0ED9               ;
                    CMP.w #$0A80              ;
                    BCC   CODE_048C1D         ;
                    STZ.w $0ED9               ;
CODE_048C1D:        LDA.b $F3                 ;
                    CLC                       ;
                    ADC.w #$0200              ;
                    STA.b $F3                 ;
                    SEP   #$30                ;
                    RTS                       ;

CODE_048C28:        REP   #$30                ;
                    LDX.w $1A00               ;
                    LDA.b $F3                 ;
                    STA.w $1A02,x             ;
                    CLC                       ;
                    ADC.w #$0100              ;
                    STA.w $1A08,x             ;
                    CLC                       ;
                    ADC.w #$0100              ;
                    STA.b $F3                 ;
                    LDA.w #$0100              ;
                    STA.w $1A04,x             ;
                    STA.w $1A0A,x             ;
                    LDA.b $F3                 ;
                    AND.w #$0200              ;
                    BNE   CODE_048C57         ;
                    LDA.w #$2C2C              ;
                    LDY.w #$2C2D              ;
                    BRA   CODE_048C5D         ;

CODE_048C57:        LDA.w #$2C2E              ;
                    LDY.w #$2C2F              ;
CODE_048C5D:        STA.w $1A06,x             ;
                    TYA                       ;
                    STA.w $1A0C,x             ;
                    LDA.w #$FFFF              ;
                    STA.w $1A0E,x             ;
                    LDA.w $1A00               ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    STA.w $1A00               ;
                    SEP   #$30                ;
                    RTS                       ;

CODE_048C77:        REP   #$30                ;
                    LDA.w $0EEE               ;
                    CLC                       ;
                    ADC.w #$0120              ;
                    XBA                       ;
                    STA.b $F3                 ;
                    SEP   #$30                ;
CODE_048C85:        LDA.b $F3                 ;
                    AND.b #$01                ;
                    BNE   CODE_048C8F         ;
                    LDA.b #$58                ;
                    BRA   CODE_048C91         ;

CODE_048C8F:        LDA.b #$5C                ;
CODE_048C91:        STA.b $F3                 ;
                    LDA.b $F4                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.b $F4                 ;
                    RTS                       ;

;Portion of gate at brown castle 8x8 tilemap at level end. Give priority so Mario goes behind the scenes.

;Small castle
DATA_048C9E:        db $00,$00,$80,$07,$62,$2E,$72,$2E ;$00,$00,$80,$07. Those byte combinations are unknown
                    db $73,$2E,$72,$2E,$00,$00,$80,$07 ;Remaining: Tile, properties, tile, properties, etc.
                    db $63,$2E,$73,$2E,$72,$2E,$73,$2E
                    db $00,$00,$80,$07,$64,$2E,$74,$2E
                    db $4E,$2E,$74,$2E,$FF,$FF

;Big castle
DATA_048CC4:        db $00,$00,$80,$07,$73,$2E,$72,$2E
                    db $73,$2E,$72,$2E,$00,$00,$80,$07
                    db $72,$2E,$73,$2E,$72,$2E,$73,$2E
                    db $00,$00,$80,$07,$5E,$2E,$66,$2E
                    db $67,$6E,$66,$AE,$FF,$FF

                    dw DATA_048C9E ;small castle
                    dw DATA_048CC4 ;big castle

CODE_048CEE:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.b #$04                ;
                    STA.b $F5                 ;
                    LDA.w $0EE6               ;
                    AND.b #$01                ;
                    ASL   A                   ;
                    REP   #$30                ;
                    AND.w #$0002              ;
                    TAY                       ;
                    LDA.w $8CEA,y             ;
                    STA.b $F3                 ;
                    LDX.w $1700               ;
                    LDY.w #$0000              ;
CODE_048D0C:        LDA.b [$F3],y             ;
                    STA.w $1702,x             ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    INX                       ;
                    CMP.w #$FFFF              ;
                    BNE   CODE_048D0C         ;
                    LDX.w $1700               ;
                    LDA.w $0EF4               ;
                    AND.w #$0020              ;
                    BEQ   CODE_048D31         ;
                    LDA.w $0EF4               ;
                    AND.w #$0FDF              ;
                    EOR.w #$0400              ;
                    STA.w $0EF4               ;
CODE_048D31:        LDA.w $0EF4               ;
                    CLC                       ;
                    ADC.w #$02C1              ;
                    AND.w #$0FDF              ;
                    TAY                       ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    TYA                       ;
                    INY                       ;
                    TYA                       ;
                    AND.w #$0020              ;
                    BEQ   CODE_048D50         ;
                    TYA                       ;
                    AND.w #$0FDF              ;
                    EOR.w #$0400              ;
                    TAY                       ;
CODE_048D50:        TYA                       ;
                    XBA                       ;
                    STA.w $170E,x             ;
                    INY                       ;
                    TYA                       ;
                    XBA                       ;
                    STA.w $171A,x             ;
                    LDA.w $1700               ;
                    CLC                       ;
                    ADC.w #$0024              ;
                    STA.w $1700               ;
                    SEP   #$30                ;
                    STZ.w $0EE6               ;
                    LDA.b #$06                ;
                    STA.w $0773               ;
                    PLB                       ;
                    RTL                       ;

CODE_048D71:        LDY.w $1A00               ;
                    LDA.w $19F8,y             ;
                    CMP.w #$0024              ;
                    BEQ   CODE_048D81         ;
                    CMP.w #$10A4              ;
                    BNE   CODE_048DC1         ;
CODE_048D81:        LDA.w $0ECE               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_048D8C         ;
                    JMP.w CODE_048E14         ;

CODE_048D8C:        INC.w $0ECE               ;
                    LDX.w $1700               ;
                    LDA.w $0ECC               ;
                    DEC   A                   ;
                    AND.w #$041F              ;
                    CLC                       ;
                    ADC.w #$0340              ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    LDA.w #$0780              ;
                    STA.w $1704,x             ;
                    LDA.w #$0A0D              ;
                    STA.w $1706,x             ;
                    LDA.w #$0A1D              ;
                    STA.w $1708,x             ;
                    LDA.w #$0A0F              ;
                    STA.w $170A,x             ;
                    LDA.w #$0A1F              ;
                    STA.w $170C,x             ;
                    BRA   CODE_048E06         ;

CODE_048DC1:        CMP.w #$0A08              ;
                    BNE   CODE_048E14         ;
                    LDA.w $0ECF               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_048E14         ;
                    STZ.w $0ECE               ;
                    LDA.b $43                 ;
                    BNE   CODE_048DDA         ;
                    LDA.w $0ECC               ;
                    BEQ   CODE_048E14         ;
CODE_048DDA:        LDX.w $1700               ;
                    LDA.w $0ECC               ;
                    CLC                       ;
                    ADC.w #$0340              ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    LDA.w #$0780              ;
                    STA.w $1704,x             ;
                    LDA.w #$0A0C              ;
                    STA.w $1706,x             ;
                    LDA.w #$0A1C              ;
                    STA.w $1708,x             ;
                    LDA.w #$0A0E              ;
                    STA.w $170A,x             ;
                    LDA.w #$0A1E              ;
                    STA.w $170C,x             ;
CODE_048E06:        LDA.w #$FFFF              ;
                    STA.w $170E,x             ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    STA.w $1700               ;
CODE_048E14:        RTL                       ;

CODE_048E15:        PHB                       ;\
                    PHK                       ; |Setup program bank
                    PLB                       ;/
                    INY                       ;\Pass level header
                    INY                       ;/
                    LDA.b $FA                 ;\
                    STA.b $F3                 ; |
                    LDA.b $FB                 ; |Copy low, high and bank bytes
                    STA.b $F4                 ; |of the level objects pointer.
                    LDA.b $FC                 ; |
                    STA.b $F5                 ;/
                    LDA.b [$F3],y             ;\Load level objects
                    REP   #$20                ; |16-bit A
                    AND.w #$007F              ; |Filter
                    TAX                       ; |to index
                    SEP   #$20                ;/ 8-bit A. was the register width change really needed
                    LDA.w $8E43,x             ;\
                    STA.b $00                 ; |Load indirect pointers for object handling
                    LDA.w $8E44,x             ; |
                    STA.b $01                 ; |
                    SEP   #$10                ;/ 8-bit XY
                    LDX.b $9E                 ;Sprite index in X
                    LDY.b $F7                 ;
                    JMP.w ($0000)             ;

                    dw CODE_048EB5
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EBB
                    dw CODE_048EA5
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048F44 ;related to castles at level end/begin?
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048FD2
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_04901B
                    dw CODE_04903E
                    dw CODE_04907A
                    dw CODE_0490A0
                    dw CODE_0490C2
                    dw CODE_0490EB
                    dw CODE_049121
                    dw CODE_04915C
                    dw CODE_04917E
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_0491B3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3
                    dw CODE_048EA3

CODE_048EA3:        PLB                       ;
                    RTL                       ;

CODE_048EA5:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDX.b $07                 ;
                    LDA.b #$00                ;
                    STA.w $06A1,x             ;
                    PLB                       ;
                    RTL                       ;

CODE_048EB5:        LDX.b #$00                ;
                    LDY.b #$0F                ;
                    BRA   CODE_048ECE         ;

CODE_048EBB:        TXA                       ;
                    PHA                       ;
                    LDX.b #$01                ;
                    LDY.b #$0F                ;
                    LDA.b #$44                ;
                    JSL.l CODE_03AD0B         ;
                    PLA                       ;
                    TAX                       ;
                    JSR.w CODE_0491C0         ;
                    LDX.b #$01                ;
CODE_048ECE:        LDA.b #$40                ;
                    JSL.l CODE_03AD0B         ;
                    PLB                       ;
                    RTL                       ;

                    db $00,$00,$00,$DF,$C6,$C5,$DE,$00 ;small castle/top of big castle map16 tilemap
                    db $00,$00,$00,$00,$00,$D4,$DB,$DA
                    db $D0,$00,$00,$00,$00,$00,$E3,$E2
                    db $C7,$C4,$E1,$E0,$00,$00,$00,$00
                    db $D4,$D3,$CD,$CC,$D1,$D0,$00,$00
                    db $E6,$00,$D9,$D8,$DD,$DC,$D6,$D5

                    db $E5,$E4,$CB,$CA,$C9,$C8,$C7,$C4 ;bottom of big castle tilemap.
                    db $C3,$C2,$C1,$C0,$D4,$D3,$D2,$CD ;first 2 bytes are for the leftmost flag, which
                    db $CC,$CD,$CC,$D2,$D1,$D0,$D9,$D8 ;belongs to the top.
                    db $D7,$DD,$DC,$DD,$DC,$D7,$D6,$D5
                    db $D9,$D8,$D7,$D7,$D7,$D7,$D7,$D7
                    db $D6,$D5,$D9,$D8,$CF,$CE,$CF,$CE
                    db $CF,$CE,$D6,$D5,$D9,$D8,$DD,$DC
                    db $DD,$DC,$DD,$DC,$D6,$D5

CODE_048F44:        JSR.w CODE_0491C0         ;
                    STY.b $07                 ;
                    STZ.w $0EE7               ;
                    TYA                       ;
                    BNE   CODE_048F51         ;
                    LDY.b #$08                ;
CODE_048F51:        INY                       ;
                    JSL.l CODE_03AD13         ;
                    PHX                       ;
                    LDY.w $1300,x             ;
                    LDX.b $07                 ;
                    LDA.b #$16                ;
                    STA.b $06                 ;
CODE_048F60:        LDA.w $8ED6,y             ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    LDA.b $06                 ;
                    BEQ   CODE_048F72         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$0A                ;
                    TAY                       ;
                    DEC.b $06                 ;
CODE_048F72:        CPX.b #$0B                ;
                    BNE   CODE_048F60         ;
                    PLX                       ;
                    LDA.b $07                 ;
                    BEQ   CODE_048F83         ;
                    LDA.w $1300,x             ;
                    BNE   CODE_048F83         ;
                    STZ.w $06AB               ;
CODE_048F83:        LDA.w $0725               ;
                    BEQ   CODE_048FBF         ;
                    LDA.w $1300,x             ;
                    CMP.b #$05                ;
                    BNE   CODE_048FBF         ;
                    JSL.l CODE_03AD1B         ;
                    PHA                       ;
                    JSL.l CODE_03AD23         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $021A,x             ;
                    LDA.w $0725               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LDA.b #$90                ;
                    STA.w $0238,x             ;
                    LDA.b #$31                ;
                    STA.b $1C,x               ;
                    INC.w $0EE7               ;
                    LDA.b $07                 ;
                    BEQ   CODE_048FBF         ;
                    INC.w $0EE7               ;
CODE_048FBF:        LDA.w $0725               ;
                    BEQ   CODE_048FD0         ;
                    LDA.w $06AC               ;
                    CMP.b #$56                ;
                    BNE   CODE_048FD0         ;
                    LDA.b #$FB                ;
                    STA.w $06AC               ;
CODE_048FD0:        PLB                       ;
                    RTL                       ;

CODE_048FD2:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDA.w $06A1               ;
                    STA.b $F3                 ;
                    CMP.b #$65                ;
                    BEQ   CODE_048FE5         ;
                    DEC   A                   ;
                    BRA   CODE_048FE6         ;

CODE_048FE5:        INC   A                   ;
CODE_048FE6:        STA.b $F4                 ;
                    LDA.b $07                 ;
                    TAY                       ;
                    AND.b #$01                ;
                    BEQ   CODE_048FFA         ;
CODE_048FEF:        LDA.b $F4                 ;
                    STA.w $06A1,y             ;
                    DEC.w $1300,x             ;
                    BMI   CODE_049007         ;
                    INY                       ;
CODE_048FFA:        LDA.b $F3                 ;
                    STA.w $06A1,y             ;
                    DEC.w $1300,x             ;
                    BMI   CODE_049007         ;
                    INY                       ;
                    BRA   CODE_048FEF         ;

CODE_049007:        PLB                       ;
                    RTL                       ;

                    db $07,$07,$06,$05,$04,$03,$02,$01 ;Y-length of the 'cemented stairs' segments.
                    db $00                             ;1 byte more means 1 additional block down

                    db $03,$03,$04,$05,$06,$07,$08,$09 ;Y-PLACEMENT of the cemented stair blocks relative from the top
                    db $0A                             ;1 Byte more means 16 pixels lower

CODE_04901B:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    BCC   CODE_049029         ;
                    LDA.b #$09                ;
                    STA.w $0734               ;
CODE_049029:        DEC.w $0734               ;
                    LDY.w $0734               ;
                    LDX.w $9012,y             ;
                    LDA.w $9009,y             ;
                    TAY                       ;
                    LDA.b #$64                ;
                    JSL.l CODE_03AD0B         ;
                    PLB                       ;
                    RTL                       ;

CODE_04903E:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
                    LDA.w $1300,x             ;
                    BNE   CODE_04905F         ;
                    LDA.b #$F3                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    LDA.w $06A1,y             ;
                    BNE   CODE_049069         ;
                    LDA.b #$F4                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    BRA   CODE_049069         ;

CODE_04905F:        LDA.w $06A1,y             ;
                    BNE   CODE_049073         ;
                    LDA.b #$F5                ;
                    STA.w $06A1,y             ;
CODE_049069:        LDA.w $06A1,y             ;
                    BNE   CODE_049073         ;
                    LDA.b #$F6                ;
                    STA.w $06A1,y             ;
CODE_049073:        INY                       ;
                    CPY.b #$0D                ;
                    BNE   CODE_049069         ;
                    PLB                       ;
                    RTL                       ;

CODE_04907A:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
                    LDA.b #$67                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    INY                       ;
CODE_04908A:        LDA.w $06A1,y             ;
                    CMP.b #$65                ;
                    BEQ   CODE_049095         ;
                    CMP.b #$66                ;
                    BNE   CODE_04909E         ;
CODE_049095:        LDA.b #$67                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04908A         ;

CODE_04909E:        PLB                       ;
                    RTL                       ;

CODE_0490A0:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
                    LDA.b #$F7                ;
                    STA.w $06A1,y             ;
                    INY                       ;
CODE_0490AF:        LDA.w $06A1,y             ;
                    CMP.b #$EB                ;
                    BEQ   CODE_0490C0         ;
                    LDA.b #$F8                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    CPY.b #$0D                ;
                    BNE   CODE_0490AF         ;
CODE_0490C0:        PLB                       ;
                    RTL                       ;

CODE_0490C2:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
                    LDA.w $06A1,y             ;
                    CMP.b #$FC                ;
                    BEQ   CODE_0490D7         ;
                    LDA.b #$F9                ;
                    STA.w $06A1,y             ;
CODE_0490D7:        INY                       ;
CODE_0490D8:        LDA.w $06A1,y             ;
                    CMP.b #$F0                ;
                    BEQ   CODE_0490E9         ;
                    LDA.b #$FA                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    CPY.b #$0D                ;
                    BNE   CODE_0490D8         ;
CODE_0490E9:        PLB                       ;
                    RTL                       ;

CODE_0490EB:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
                    LDA.w $1300,x             ;
                    BNE   CODE_049105         ;
                    LDA.b #$02                ;
                    STA.w $06A1,y             ;
                    LDA.b #$ED                ;
                    STA.w $06A2,y             ;
                    BRA   CODE_04911F         ;

CODE_049105:        LDA.w $06A1,y             ;
                    CMP.b #$68                ;
                    BNE   CODE_049110         ;
                    LDA.b #$EE                ;
                    BRA   CODE_049112         ;

CODE_049110:        LDA.b #$EB                ;
CODE_049112:        STA.w $06A1,y             ;
                    LDA.b #$EC                ;
                    STA.w $06A2,y             ;
                    LDA.b #$69                ;
                    STA.w $06AD               ;
CODE_04911F:        PLB                       ;
                    RTL                       ;

CODE_049121:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
                    LDA.w $1300,x             ;
                    BNE   CODE_049150         ;
                    LDA.w $06A1,y             ;
                    CMP.b #$68                ;
                    BNE   CODE_04913A         ;
                    LDA.b #$F2                ;
                    BRA   CODE_04913C         ;

CODE_04913A:        LDA.b #$F0                ;
CODE_04913C:        STA.w $06A1,y             ;
                    LDA.b #$F1                ;
                    STA.w $06A2,y             ;
CODE_049144:        INY                       ;
                    CPY.b #$0C                ;
                    BEQ   CODE_04915A         ;
                    LDA.b #$69                ;
                    STA.w $06A2,y             ;
                    BRA   CODE_049144         ;

CODE_049150:        LDA.b #$03                ;
                    STA.w $06A1,y             ;
                    LDA.b #$EF                ;
                    STA.w $06A2,y             ;
CODE_04915A:        PLB                       ;
                    RTL                       ;

CODE_04915C:        JSR.w CODE_0491C0         ;
                    JSL.l CODE_03AD13         ;
                    LDY.b $07                 ;
CODE_049165:        LDA.b #$71                ;
                    STA.w $06A1,y             ;
                    INY                       ;
                    DEC.w $1300,x             ;
                    BPL   CODE_049165         ;
                    PLB                       ;
                    RTL                       ;

                    db $19,$18,$00,$00,$19,$22,$21,$20 ;Level X-2 'go to the surface' pipe tilemap
                    db $19,$25,$24,$23                 ;

CODE_04917E:        LDY.b #$03                ;
                    JSL.l CODE_03AD13         ;
                    JSR.w CODE_0491C0         ;
                    DEY                       ;
                    DEY                       ;
                    STY.b $05                 ;
                    LDY.w $1300,x             ;
                    STY.b $06                 ;
                    LDX.b $05                 ;
                    INX                       ;
                    LDA.w $9172,y             ;
                    CMP.b #$00                ;
                    BEQ   CODE_0491A3         ;
                    LDX.b #$00                ;
                    LDY.b $05                 ;
                    JSL.l CODE_03AD0B         ;
                    CLC                       ;
CODE_0491A3:        LDY.b $06                 ;
                    LDA.w $9176,y             ;
                    STA.w $06A1,x             ;
                    LDA.w $917A,y             ;
                    STA.w $06A2,x             ;
                    PLB                       ;
                    RTL                       ;

CODE_0491B3:        JSR.w CODE_0491C0         ;
                    LDX.b #$02                ;
                    LDA.b #$77                ;
                    JSL.l CODE_03AD0B         ;
                    PLB                       ;
                    RTL                       ;

CODE_0491C0:        PHX                       ;
                    REP   #$30                ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDY.w $1305,x             ;
                    INY                       ;
                    LDA.b [$F3],y             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $07                 ;
                    LDA.b [$F3],y             ;
                    AND.b #$0F                ;
                    SEP   #$10                ;
                    TAY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_0491DD:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    REP   #$30                ;
                    LDX.w #$0000              ;
                    LDY.w $1A00               ;
                    LDA.w $0EC3               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_049200         ;
CODE_0491F1:        LDA.w $9CC7,x             ;
                    STA.w $1A02,y             ;
                    INC   A                   ;
                    BEQ   CODE_04920F         ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_0491F1         ;

CODE_049200:        LDA.w $9C55,x             ;
                    STA.w $1A02,y             ;
                    INC   A                   ;
                    BEQ   CODE_04920F         ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_049200         ;

CODE_04920F:        LDX.w #$0000              ;
CODE_049212:        LDA.w $9D59,x             ;
                    STA.w $1A02,y             ;
                    INC   A                   ;
                    BEQ   CODE_049221         ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_049212         ;

CODE_049221:        STY.w $1A00               ;
                    LDA.w #$B623              ;
                    STA.b $02                 ;
                    LDX.w #$00A0              ;
                    LDY.w #$0000              ;
                    JSR.w CODE_049724         ;
                    JSR.w CODE_049724         ;
                    JSR.w CODE_049724         ;
                    STZ.w $0EFD               ;
                    STZ.w $0EEE               ;
                    SEP   #$30                ;
                    LDA.b #$06                ;
                    STA.w $0773               ;
                    STZ.w $0ED1               ;
                    STZ.w $210F               ;
                    STZ.w $210F               ;
                    STZ.w $2111               ;
                    STZ.w $2111               ;
                    LDA.b #$17                ;
                    STA.w $120B               ;
                    LDA.b #$0A                ;
                    STA.w $99               ;
                    STA.w $0E20               ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
                    JSL.l CODE_05E6B1         ;
                    LDA.b #$FF                ;
                    STA.w $0E66               ;
                    STZ.w $0ED2               ;
                    STZ.w $0ED3               ;
                    STZ.w $2110               ;
                    STZ.w $2110               ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

                    db $68,$04,$14,$05,$1A,$0D,$70,$06
                    db $76,$00,$00,$00,$18,$0B,$70,$06
                    db $02,$0F,$02,$0F,$9C,$0B,$70,$06
                    db $68,$04,$14,$05,$E0,$08,$70,$06
                    db $82,$01,$82,$01,$1A,$0D,$70,$06
                    db $68,$04,$68,$04,$9C,$0B,$70,$06
                    db $82,$01,$00,$00,$18,$0B,$70,$06
                    db $68,$04,$82,$01,$C6,$02,$56,$07
                    db $00,$01,$02,$03,$01,$01,$01,$01
                    db $01

                    db $02,$03,$0E,$06,$05,$08,$10,$06
                    db $27,$27,$27,$06,$02,$03,$0D,$06
                    db $05,$05,$0E,$06,$2B,$2B,$2B,$06
                    db $05,$08,$10,$06,$02,$05,$0C,$04

CODE_0492E7:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $0E1A               ;
                    BEQ   CODE_0492F4         ;
                    STZ.w $0E1A               ;
CODE_0492F4:        LDA.b #$80                ;
                    STA.w $1602               ;
                    LDY.w $0E21               ;
                    DEY                       ;
                    LDA.w $92C7,y             ;
                    PHA                       ;
                    AND.b #$1F                ;
                    STA.b $99                 ;
                    PLA                       ;
                    AND.b #$E0                ;
                    STA.w $0E23               ;
                    LDA.b #$01                ;
                    STA.w $0774               ;
                    STA.w $0ED6               ;
                    JSL.l CODE_05E6B1         ;
                    STZ.w $0EC9               ;
                    STZ.w $0EF0               ;
                    STZ.w $0ECA               ;
                    STZ.w $130F               ;
                    STZ.w $0EDF               ;
                    INC.w $0ECE               ;
                    STZ.w $0ECF               ;
                    STZ.w $0ED1               ;
                    STZ.w $0B9A               ;
                    STZ.w $1680               ;
                    STZ.w $1681               ;
                    STZ.w $0EDC               ;
                    JSL.l CODE_0480EF         ;
                    LDX.w $0753               ;
                    STX.w $0EC3               ;
                    LDA.l DATA_03BD2A,x       ;
                    JSL.l CODE_039CF1         ;
                    LDY.w $1700               ;
                    LDA.w $16F6,y             ;
                    BNE   CODE_04935A         ;
                    LDA.b #$28                ;
                    STA.w $16F6,y             ;
CODE_04935A:        LDA.w $077A               ;
                    BEQ   CODE_0493B4         ;
                    LDA.w $0761               ;
                    BMI   CODE_0493B4         ;
                    REP   #$20                ;
                    LDA.w #$7258              ;
                    STA.w $1702,y             ;
                    LDA.w #$0700              ;
                    STA.w $1704,y             ;
                    LDA.w #$2028              ;
                    STA.w $1706,y             ;
                    SEP   #$20                ;
                    LDA.w $075F               ;
                    INC   A                   ;
                    STA.w $1708,y             ;
                    LDA.b #$20                ;
                    STA.w $1709,y             ;
                    STA.w $170B,y             ;
                    STA.w $170D,y             ;
                    LDA.b #$24                ;
                    STA.w $170A,y             ;
                    LDA.w $075C               ;
                    INC   A                   ;
                    STA.w $170C,y             ;
                    LDA.b #$FF                ;
                    STA.w $170E,y             ;
                    REP   #$20                ;
                    TYA                       ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    STA.w $1700               ;
                    TAY                       ;
                    SEP   #$20                ;
                    LDA.w $07FC               ;
                    BEQ   CODE_0493B4         ;
                    LDA.b #$2A                ;
                    STA.w $16FA,y             ;
CODE_0493B4:        LDA.b #$06                ;
                    STA.w $0773               ;
                    REP   #$30                ;
                    STZ.w $0ECB               ;
                    STZ.w $1310               ;
                    STZ.w $1312               ;
                    LDY.w $1A00               ;
                    LDA.w #$C709              ;
                    STA.w $1A02,y             ;
                    LDA.w #$12C0              ;
                    STA.w $1A04,y             ;
                    LDA.w #$30A2              ;
                    STA.w $1A06,y             ;
                    LDA.w #$D809              ;
                    STA.w $1A08,y             ;
                    LDA.w #$12C0              ;
                    STA.w $1A0A,y             ;
                    LDA.w #$70A2              ;
                    STA.w $1A0C,y             ;
                    LDA.w #$A809              ;
                    STA.w $1A0E,y             ;
                    LDA.w #$1E40              ;
                    STA.w $1A10,y             ;
                    LDA.w #$3078              ;
                    STA.w $1A12,y             ;
                    LDA.w #$080B              ;
                    STA.w $1A14,y             ;
                    LDA.w #$1E40              ;
                    STA.w $1A16,y             ;
                    LDA.w #$B078              ;
                    STA.w $1A18,y             ;
                    TYA                       ;
                    CLC                       ;
                    ADC.w #$0018              ;
                    TAY                       ;
                    LDX.w #$0000              ;
CODE_049418:        LDA.w $9DAD,x             ;
                    STA.w $1A02,y             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    INC   A                   ;
                    BNE   CODE_049418         ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $0E21               ;
                    DEC   A                   ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $927E,x             ;
                    TAX                       ;
CODE_049434:        LDA.w $9DEB,x             ;
                    STA.w $1A02,y             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    INC   A                   ;
                    BNE   CODE_049434         ;
                    LDA.w $0E22               ;
                    AND.w #$00FF              ;
                    CMP.w #$0011              ;
                    BNE   CODE_04945E         ;
                    DEY                       ;
                    DEY                       ;
                    LDX.w #$0000              ;
CODE_049451:        LDA.w $AD6F,x             ;
                    STA.w $1A02,y             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    INC   A                   ;
                    BNE   CODE_049451         ;
CODE_04945E:        LDA.w $0E22               ;
                    AND.w #$00F0              ;
                    BEQ   CODE_049483         ;
                    LDA.w $0E22               ;
                    AND.w #$00FF              ;
                    CMP.w #$0016              ;
                    BEQ   CODE_049483         ;
                    DEY                       ;
                    DEY                       ;
                    LDX.w #$0000              ;
CODE_049476:        LDA.w $AD9B,x             ;
                    STA.w $1A02,y             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    INC   A                   ;
                    BNE   CODE_049476         ;
CODE_049483:        STY.w $1A00               ;
                    SEP   #$30                ;
                    JSR.w CODE_0495E2         ;
                    DEC.w $073C               ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
                    STZ.w $1000               ;
                    STZ.w $1001               ;
                    LDA.w $0756               ;
                    STA.b $EB                 ;
                    LDA.b #$01                ;
                    STA.w $0756               ;
                    LDA.w $0E22               ;
                    AND.b #$F0                ;
                    BEQ   CODE_0494AC         ;
                    LDA.b #$04                ;
CODE_0494AC:        STA.w $0744               ;
                    LDA.w $0E22               ;
                    CMP.b #$02                ;
                    BNE   CODE_0494BB         ;
                    LDA.b #$03                ;
                    STA.w $0744               ;
CODE_0494BB:        JSL.l CODE_049A88         ;
                    DEC.w $1200               ;
                    LDA.b $EB                 ;
                    STA.w $0756               ;
                    STZ.w $0E22               ;
                    LDA.b #$17                ;
                    STA.w $120B               ;
                    LDA.b #$06                ;
                    STA.w $0773               ;
                    STZ.w $0E20               ;
                    STZ.w $0EDE               ;
                    STZ.w $0ED2               ;
                    STZ.w $0ED3               ;
                    STZ.w $2110               ;
                    STZ.w $2110               ;
                    PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0494EA:        LDA.b $9B                 ;
                    BEQ   CODE_049513         ;
                    STZ.b $9B                 ;
                    LDA.b $9C                 ;
                    STA.w $071C               ;
                    STA.w $073F               ;
                    LDA.b $9D                 ;
                    STA.w $071A               ;
                    REP   #$20                ;
                    LDA.b $9C                 ;
                    LSR   A                   ;
                    STA.w $0EFD               ;
                    LSR   A                   ;
                    STA.w $0EEE               ;
                    STA.w $0ED7               ;
                    SEP   #$20                ;
                    LDA.w $5C               ;
                    BNE   CODE_049513         ;
CODE_049513:        LDA.w $0EFE               ;
                    AND.b #$01                ;
                    STA.w $0EF6               ;
                    STZ.w $0EFC               ;
                    STZ.w $0EF8               ;
                    JSL.l CODE_058000         ;
                    JSR.w CODE_049B96         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_049563         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    LDA.w $0ED1               ;
                    BEQ   CODE_049563         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
                    JSR.w CODE_049BBC         ;
CODE_049563:        RTS                       ;

                    db $F8,$00,$20,$F8,$F0,$20,$00

CODE_04956B:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_0494EA         ;
                    STZ.w $0ED2               ;
                    STZ.w $0ED3               ;
                    LDA.b $5C                 ;
                    BEQ   CODE_049594         ;
                    CMP.b #$01                ;
                    BNE   CODE_04958B         ;
                    LDA.w $DB               ;
                    CMP.b #$0A                ;
                    BEQ   CODE_04958B         ;
                    LDA.b #$F8                ;
                    STA.w $0ED2               ;
CODE_04958B:        LDA.b #$06                ;
                    STA.w $1209               ;
                    LDX.b #$11                ;
                    BRA   CODE_0495C0         ;

CODE_049594:        REP   #$20                ;
                    LDA.w #$0F42              ;
                    STA.w $4320               ;
                    LDA.w #$9564              ;
                    STA.w $4322               ;
                    LDX.b #$04                ;
                    STX.w $4324               ;
                    LDY.b #$7F                ;
                    STY.w $4327               ;
                    SEP   #$20                ;
                    STZ.w $0EEC               ;
                    STZ.w $0EF3               ;
                    LDA.w $1203               ;
                    ORA.b #$04                ;
                    STA.w $1203               ;
                    LDA.b #$00                ;
                    LDX.b #$17                ;
CODE_0495C0:        STX.w $120B               ;
                    STA.w $120C               ;
                    STZ.w $0ED9               ;
                    LDA.b #$1F                ;
                    STA.w $0EF2               ;
                    LDA.w $0ED1               ;\If starry night BG flag is set
                    BEQ   CODE_0495DD         ;/
                    LDA.b #$AF                ;\
                    STA.w $0EF2               ;/Set IRQ V-timer to AF
                    LDA.b #$02                ;\
                    STA.w $0EDE               ;/Enable IRQ
CODE_0495DD:        JSR.w CODE_0495E2         ;
                    PLB                       ;
                    RTL                       ;

CODE_0495E2:        LDA.w $0E65               ;
                    BEQ   CODE_0495EE         ;
                    STA.b $DB                 ;
                    STZ.w $0E65               ;
                    BRA   CODE_04960A         ;

CODE_0495EE:        LDA.b $DB                 ;
                    CMP.b #$0C                ;
                    BNE   CODE_04960A         ;
                    STA.w $0E65               ;
                    LDA.w $075F               ;
                    BEQ   CODE_049606         ;
                    CMP.b #$03                ;
                    BEQ   CODE_049606         ;
                    LDA.b #$01                ;
                    STA.b $DB                 ;
                    BRA   CODE_04960A         ;

CODE_049606:        LDA.b #$19                ;
                    STA.b $DB                 ;
CODE_04960A:        REP   #$30                ;
                    LDA.b $DB                 ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    STY.b $06                 ;
                    STZ.b $02                 ;
CODE_04961A:        LDY.b $06                 ;
                    LDA.w $97CD,y             ;
                    AND.w #$00FF              ;
                    INY                       ;
                    STY.b $06                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $AE3F,x             ;
                    TAY                       ;
                    LDX.b $02                 ;
                    LDA.w #$0007              ;
                    STA.b $04                 ;
CODE_049632:        LDA.w $AEC3,y             ;
                    STA.w $1000,x             ;
                    LDA.w $AED3,y             ;
                    STA.w $1010,x             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    DEC.b $04                 ;
                    BPL   CODE_049632         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $02                 ;
                    CMP.w #$01E0              ;
                    BNE   CODE_04961A         ;
                    LDA.w $02F8               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_049699         ;
                    LDA.w $0753               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_049699         ;
                    LDY.w #$0000              ;
                    LDX.w #$00E0              ;
CODE_049668:        LDA.w $9679,y             ;
                    STA.w $1000,x             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    CPY.w #$0020              ;
                    BNE   CODE_049668         ;
                    BRA   CODE_049699         ;

                    dw $772F,$7FFF,$14A5,$57F0 ;\
                    dw $0340,$0200,$46BF,$365D ; |Bonus room Luigi background palette
                    dw $25BB,$04EF,$0D73,$4F7F ; |
                    dw $7F0F,$4E06,$001E,$0012 ;/

CODE_049699:        LDA.b $42                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0EEE               ;
                    AND.w #$FF00              ;
                    XBA                       ;
                    STA.b $F3                 ;
                    LDA.w $075F               ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    CMP.w #$000C              ;
                    BCC   CODE_0496B5         ;
                    LDA.w #$0000              ;
CODE_0496B5:        CLC                       ;
                    ADC.b $F3                 ;
                    STA.b $F3                 ;
                    STZ.w $0ED9               ;
CODE_0496BD:        LDA.b $F3                 ;
                    BEQ   CODE_0496CF         ;
                    LDA.w $0ED9               ;
                    CLC                       ;
                    ADC.w #$00E0              ;
                    STA.w $0ED9               ;
                    DEC.b $F3                 ;
                    BRA   CODE_0496BD         ;

CODE_0496CF:        LDA.w $0EEE               ;
                    AND.w #$00F0              ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.w $0ED9               ;
                    STA.w $0ED9               ;
                    CMP.w #$0A80              ;
                    BCC   CODE_0496E8         ;
                    STZ.w $0ED9               ;
CODE_0496E8:        SEP   #$30                ;
                    JSR.w CODE_04973C         ;
                    LDA.w $0EDC               ;
                    BEQ   CODE_04971B         ;
                    LDA.w $0EEF               ;
                    STA.b $F3                 ;
                    LDA.w $0EEE               ;
                    STA.b $F4                 ;
                    JSR.w CODE_048C85         ;
                    LDA.b #$13                ;
                    STA.b $F5                 ;
CODE_049703:        JSL.l CODE_048B49         ;
                    LDA.b $F4                 ;
                    CMP.b #$A0                ;
                    BCC   CODE_049717         ;
                    LDA.b $F3                 ;
                    EOR.b #$04                ;
                    STA.b $F3                 ;
                    LDA.b #$80                ;
                    STA.b $F4                 ;
CODE_049717:        DEC.b $F5                 ;
                    BNE   CODE_049703         ;
CODE_04971B:        LDA.b #$01                ;
                    STA.w $1200               ;
                    INC.w $073C               ;
                    RTS                       ;

CODE_049724:        LDA.w #$0004              ;
                    STA.b $04                 ;
                    LDA.w #$0010              ;
                    STA.b $00                 ;
CODE_04972E:        LDA.b [$02],y             ;
                    STA.w $1000,x             ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    INX                       ;
                    DEC.b $00                 ;
                    BNE   CODE_04972E         ;
                    RTS                       ;

CODE_04973C:        PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    LDX.b #$00                ;
CODE_049743:        STZ.w $3000,x             ;
                    STZ.w $3100,x             ;
                    STZ.w $3200,x             ;
                    STZ.w $3300,x             ;
                    STZ.w $3400,x             ;
                    STZ.w $3500,x             ;
                    STZ.w $3600,x             ;
                    STZ.w $3700,x             ;
                    STZ.w $3800,x             ;
                    STZ.w $3900,x             ;
                    STZ.w $3A00,x             ;
                    DEX                       ;
                    BNE   CODE_049743         ;
                    PLB                       ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.b #$7F                ;
                    STA.b $F5                 ;
                    STZ.b $F6                 ;
                    REP   #$30                ;
                    LDA.w #$3000              ;
                    STA.b $F3                 ;
                    LDY.w #$0000              ;
                    STZ.b $F8                 ;
CODE_04977D:        LDX.b $F8                 ;
                    LDA.w $B683,x             ;
                    CMP.w #$FFFF              ;
                    BEQ   CODE_0497C9         ;
                    BPL   CODE_049793         ;
                    PHA                       ;
                    LDA.b $F3                 ;
                    CLC                       ;
                    ADC.w #$00E0              ;
                    STA.b $F3                 ;
                    PLA                       ;
CODE_049793:        PHA                       ;
                    AND.w #$00FF              ;
                    TAY                       ;
                    PLA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    LDA.w #$0000              ;
                    ROL   A                   ;
                    STA.b $F6                 ;
                    SEP   #$20                ;
                    INX                       ;
                    LDA.w $B683,x             ;
                    AND.b #$3F                ;
                    STA.b $F7                 ;
CODE_0497AB:        LDA.b $F7                 ;
                    STA.b [$F3],y             ;
                    LDA.b $F6                 ;
                    BEQ   CODE_0497C1         ;
                    TYA                       ;
                    AND.b #$F0                ;
                    CMP.b #$D0                ;
                    BEQ   CODE_0497C1         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    BRA   CODE_0497AB         ;

CODE_0497C1:        REP   #$20                ;
                    INC.b $F8                 ;
                    INC.b $F8                 ;
                    BRA   CODE_04977D         ;

CODE_0497C9:        SEP   #$30                ;
                    PLB                       ;
                    RTS                       ;

                    dw $0100,$0302,$1004,$1211
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$1004,$1211
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$031B,$3904,$1211
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$3604,$3706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$2E06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$0706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$3604,$3706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$4135,$3604,$3706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$0731
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$3806
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$3A04,$3B06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$2B06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$0706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$4034,$3D04,$2D06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$1904,$1A06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0326,$0528,$2A29
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$3604,$3706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$3604,$3706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$2726,$0528,$2A29
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$0706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$4034,$3D04,$2D06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$0504,$3C06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$4135,$3D04,$2D06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$0302,$1904,$1A06
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$4135,$3604,$3706
                    dw $0908,$0B0A,$0D0C,$0F0E
                    dw $0100,$1413,$1504,$1606
                    dw $1708,$0B0A,$180C,$0F0E
                    dw $0100,$1413,$1504,$1606
                    dw $1708,$0B0A,$180C,$0F0E
                    dw $0100,$1413,$1904,$1A06
                    dw $1708,$0B0A,$180C,$0F0E
                    dw $0100,$1C1B,$1D04,$1F1E
                    dw $2008,$0B0A,$210C,$0F0E
                    dw $0100,$1C1B,$1D04,$1F1E
                    dw $2008,$0B0A,$210C,$0F0E
                    dw $0100,$1C1B,$1D04,$1F1E
                    dw $2008,$0B0A,$210C,$0F0E
                    dw $0100,$1C1B,$1D04,$1F1E
                    dw $2008,$0B0A,$210C,$0F0E
                    dw $0100,$1C1B,$1D04,$1F1E
                    dw $2008,$0B0A,$210C,$0F0E
                    dw $0100,$1C1B,$2F04,$301E
                    dw $2008,$0B0A,$210C,$0F0E

                    dw $7FF8,$7FF8,$0000,$0000
                    dw $3908,$7FF8,$3908,$3908

                    dw $0000,$7FFF,$0C63,$0155
                    dw $1A1C,$1B3E,$2D9C,$3ABF
                    dw $0000,$152F,$0014,$0C19
                    dw $1C9F,$762E,$5D68,$44E6
                    dw $0000,$7FFF,$0C63,$0155
                    dw $1A1C,$1B3E,$2D9C,$3ABF
                    dw $0000,$152F,$1E60,$3304
                    dw $4388,$7655,$7190,$58CA
                    dw $0000,$7FFF,$0C63,$0155
                    dw $1A1C,$1B3E,$2D9C,$3ABF
                    dw $0000,$152F,$3ED9,$4F5D
                    dw $639F,$0D9F,$001D,$0015
                    dw $0000,$7FFF,$0C63,$0155
                    dw $1A1C,$1B3E,$2D9C,$3ABF
                    dw $0000,$152F,$3ED9,$4F5D
                    dw $639F,$0352,$02AD,$0208

CODE_049A7D:        LDA.w $0E22               ;
                    BEQ   CODE_049A85         ;
                    JMP.w CODE_049B34         ;

CODE_049A85:        INC.w $073C               ;
CODE_049A88:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.w $0744               ;
                    BNE   CODE_049A93         ;
                    LDA.b $BA                 ;
CODE_049A93:        REP   #$30                ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $0743               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_049AB7         ;
                    LDA.w $0744               ;
                    AND.w #$0004              ;
                    BNE   CODE_049AB7         ;
                    LDA.w $075A               ;
                    AND.w #$0080              ;
                    BNE   CODE_049AB7         ;
                    LDA.w #$522A              ;
                    BRA   CODE_049ABA         ;

CODE_049AB7:        LDA.w $99ED,y             ;
CODE_049ABA:        STA.w $1000               ;
                    AND.w #$001F              ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    STA.w $0EE0               ;
                    LDA.w $1000               ;
                    AND.w #$03E0              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    XBA                       ;
                    CLC                       ;
                    ADC.w #$0040              ;
                    STA.w $0EE1               ;
                    LDA.w $1000               ;
                    AND.w #$7C00              ;
                    LSR   A                   ;
                    LSR   A                   ;
                    XBA                       ;
                    CLC                       ;
                    ADC.w #$0080              ;
                    STA.w $0EE2               ;
                    STZ.w $1000               ;
                    BRA   CODE_049AF9         ;

                    LDA.w #$00E0              ;
                    STA.w $0EE0               ;
                    STA.w $0EE1               ;
                    STA.w $0EE2               ;
CODE_049AF9:        SEP   #$30                ;
                    LDA.w $0254               ;
                    BNE   CODE_049B32         ;
                    LDY.b #$00                ;
                    LDA.w $0753               ;
                    BEQ   CODE_049B09         ;
                    LDY.b #$20                ;
CODE_049B09:        LDA.w $0756               ;
                    CMP.b #$02                ;
                    BNE   CODE_049B15         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$40                ;
                    TAY                       ;
CODE_049B15:        REP   #$20                ;
                    LDX.b #$00                ;
CODE_049B19:        LDA.w $99FD,y             ;
                    STA.w $11E0,x             ;
                    LDA.w $9A0D,y             ;
                    STA.w $11F0,x             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    CPX.b #$10                ;
                    BNE   CODE_049B19         ;
                    SEP   #$20                ;
                    INC.w $1200               ;
CODE_049B32:        PLX                       ;
                    PLB                       ;
CODE_049B34:        RTL                       ;

CODE_049B35:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    PHA                       ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_049B47         ;
                    ASL.b $00                 ;
CODE_049B47:        LDA.w $0EFD               ;
                    CLC                       ;
                    ADC.b $00                 ;
                    AND.b #$F0                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0EF7               ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.b $00                 ;
                    BNE   CODE_049B6E         ;
                    LDA.w $0EF6               ;
                    BEQ   CODE_049B67         ;
                    STZ.w $0EF6               ;
                    LDA.b #$14                ;
                    BRA   CODE_049B7B         ;

CODE_049B67:        LDA.b #$10                ;
                    STA.w $0EF6               ;
                    BRA   CODE_049B7B         ;

CODE_049B6E:        LDA.w $0EFE               ;
                    AND.b #$01                ;
                    BEQ   CODE_049B79         ;
                    LDA.b #$10                ;
                    BRA   CODE_049B7B         ;

CODE_049B79:        LDA.b #$14                ;
CODE_049B7B:        STA.b $01                 ;
                    LDA.w $0EFE               ;
                    AND.b #$0F                ;
                    LDX.b $00                 ;
                    BNE   CODE_049B87         ;
                    INC   A                   ;
CODE_049B87:        INC   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $0EF8               ;
                    JSR.w CODE_049BBC         ;
                    PLA                       ;
                    PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_049B96:        LDA.w $0EFD               ;
                    AND.b #$F0                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0EF7               ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.w $0EFE               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $0EF8               ;
                    LDA.w $0EFE               ;
                    AND.b #$01                ;
                    BEQ   CODE_049BB7         ;
                    LDA.b #$14                ;
                    BRA   CODE_049BB9         ;

CODE_049BB7:        LDA.b #$10                ;
CODE_049BB9:        STA.b $01                 ;
                    RTS                       ;

CODE_049BBC:        REP   #$30                ;
                    LDA.w #$0004              ;
                    STA.w $0EFA               ;
                    LDA.b $BA                 ;
                    AND.w #$00FF              ;
                    CMP.w #$0003              ;
                    BNE   CODE_049BD1         ;
                    ASL.w $0EFA               ;
CODE_049BD1:        LDA.l $7F0000             ;
                    TAY                       ;
CODE_049BD6:        LDA.b $00                 ;
                    AND.w #$0020              ;
                    BEQ   CODE_049BE8         ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.w #$0400              ;
                    AND.w #$1400              ;
                    STA.b $00                 ;
CODE_049BE8:        TYX                       ;
                    LDA.b $00                 ;
                    SEC                       ;
                    SBC.w #$0800              ;
                    STA.l $7F0002,x           ;
                    LDA.w #$0020              ;
                    STA.b $02                 ;
                    TXY                       ;
                    LDA.w $0EF7               ;
                    AND.w #$0040              ;
                    BEQ   CODE_049C0E         ;
                    LDA.w #$0800              ;
                    CLC                       ;
                    ADC.w $0EF7               ;
                    AND.w #$FF00              ;
                    STA.w $0EF7               ;
CODE_049C0E:        LDX.w $0EF7               ;
                    STX.b $04                 ;
CODE_049C13:        LDA.l $7E2000,x           ;
                    TYX                       ;
                    STA.l $7F0004,x           ;
                    INY                       ;
                    INY                       ;
                    LDA.b $04                 ;
                    CLC                       ;
                    ADC.w #$0040              ;
                    STA.b $04                 ;
                    TAX                       ;
                    DEC.b $02                 ;
                    BPL   CODE_049C13         ;
                    TYX                       ;
                    LDA.w #$0024              ;
                    STA.l $7F0000,x           ;
                    INC.w $0EF7               ;
                    INC.w $0EF7               ;
                    INC.b $00                 ;
                    DEC.w $0EFA               ;
                    BNE   CODE_049BD6         ;
                    TYA                       ;
                    STA.l $7F0000             ;
                    TAX                       ;
                    LDA.w #$FFFF              ;
                    STA.l $7F0002,x           ;
                    SEP   #$30                ;
                    LDA.b #$01                ;
                    STA.w $0EF9               ;
                    RTS                       ;

                    dw $8D0A,$0B00,$0024,$0024
                    dw $1E45,$1E46,$1E47,$0024
                    dw $AD0A,$0B00,$1E4A,$1E4B
                    dw $1E48,$1E49,$1E59,$0024
                    dw $CD0A,$0B00,$1E5A,$1E5B
                    dw $1E69,$1E6A,$1E6F,$0024
                    dw $ED0A,$0B00,$0024,$1E6B
                    dw $1E4C,$1E4D,$1E4E,$1E4F
                    dw $0D0B,$0B00,$0024,$0024
                    dw $1E5C,$1E5D,$1E5E,$1E5F
                    dw $2D0B,$0B00,$0024,$1E7A
                    dw $1E6C,$1E6D,$1E6E,$0024
                    dw $4D0B,$0B00,$0024,$1E7B
                    dw $1E7C,$1E7D,$1E7E,$0024
                    dw $FFFF

                    dw $4D0A,$0B00,$0024,$1680
                    dw $1681,$1682,$0024,$0024
                    dw $6D0A,$0B00,$0024,$1683
                    dw $1684,$1685,$0024,$0024
                    dw $8D0A,$0B00,$0024,$1686
                    dw $1687,$1688,$0024,$0024
                    dw $AD0A,$0B00,$0024,$1689
                    dw $168A,$168B,$168C,$0024
                    dw $CD0A,$0B00,$0024,$168D
                    dw $168E,$168F,$1690,$0024
                    dw $ED0A,$0B00,$1691,$1692
                    dw $1693,$1694,$1695,$0024
                    dw $0D0B,$0B00,$1696,$1697
                    dw $1698,$1699,$0024,$0024
                    dw $2D0B,$0B00,$0024,$169A
                    dw $169B,$169C,$0024,$0024
                    dw $4D0B,$0B00,$0024,$169D
                    dw $169E,$169F,$16A0,$0024
                    dw $FFFF

                    dw $F30A,$0900,$1A40,$1A41
                    dw $1A42,$1A43,$1A44,$130B
                    dw $1100,$1A50,$1A51,$1A52
                    dw $1A53,$1A54,$1A55,$1A56
                    dw $1A57,$1A58,$330B,$1100
                    dw $1A60,$1A61,$1A62,$1A63
                    dw $1A64,$1A65,$1A66,$1A67
                    dw $1A68,$530B,$1300,$1A70
                    dw $1A71,$1A72,$1A73,$1A74
                    dw $1A75,$1A76,$1A77,$1A78
                    dw $1A79,$FFFF

                    dw $C801,$1E40,$0024,$E801
                    dw $1E40,$0024,$0802,$1E40
                    dw $0024,$2802,$1E40,$0024
                    dw $4802,$1E40,$0024,$6802
                    dw $1E40,$0024,$8802,$1E40
                    dw $0024,$A802,$1E40,$0024
                    dw $C802,$1E40,$0024,$E802
                    dw $1E40,$0024,$FFFF

                    dw $E801,$1F00,$18EC,$18ED
                    dw $18EE,$18EF,$18EC,$18ED
                    dw $18EE,$18EF,$18EC,$18ED
                    dw $18EE,$18EF,$18EC,$18ED
                    dw $18EE,$18EF,$4C02,$0B80
                    dw $1D4A,$1D5A,$1D4A,$1D5A
                    dw $1082,$1084,$4D02,$0B80
                    dw $1D4B,$1D5B,$1D4B,$1D5B
                    dw $1083,$1085,$080A,$1E40
                    dw $1900,$280A,$1E40,$1900
                    dw $480A,$1E40,$1901,$680A
                    dw $1E40,$1901,$880A,$1E40
                    dw $1901,$A80A,$1E40,$1901
                    dw $C80A,$1E40,$1901,$E80A
                    dw $1E40,$1901,$FFFF,$CA09
                    dw $0900,$1DDF,$1DC3,$1DC0
                    dw $1DC1,$1DCA,$EA09,$0B00
                    dw $1DDC,$1DD3,$1DD0,$1DD1
                    dw $1DDA,$1DDB,$090A,$0D00
                    dw $1DDD,$1DE2,$1DE3,$1DE0
                    dw $1DE1,$1DE2,$1DF8,$290A
                    dw $0D00,$1DDE,$1DF2,$1DF3
                    dw $1DF0,$1DF1,$1DF2,$1DF3
                    dw $490A,$1B00,$1DE9,$1DC6
                    dw $1DC7,$1DC4,$1DC5,$1DC6
                    dw $1DC7,$1DE8,$0024,$0024
                    dw $1DE9,$1DEA,$1DEB,$1DE8
                    dw $690A,$1B00,$1DF9,$1DD6
                    dw $1DD7,$1DD4,$1DD5,$1DD6
                    dw $1DD7,$1DF8,$0024,$0024
                    dw $1DF9,$1DFA,$1DFB,$1DF8
                    dw $890A,$1B00,$1DE5,$1DE6
                    dw $1DE7,$1DE4,$1DE5,$1DE6
                    dw $1DE7,$1DE4,$0024,$0024
                    dw $1DE5,$1DE6,$1DE7,$1DE4
                    dw $A90A,$1B00,$1DF5,$1DF6
                    dw $1DF7,$1DF4,$1DF5,$1DF6
                    dw $1DF7,$1DF4,$0024,$0024
                    dw $1DF5,$1DF6,$1DF7,$1DF4
                    dw $C802,$1F00,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$E802,$1F00
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $FFFF,$CA09,$0900,$1DDF
                    dw $1DC3,$1DC0,$1DC1,$1DCA
                    dw $EA09,$0B00,$1DDC,$1DD3
                    dw $1DD0,$1DD1,$1DDA,$1DDB
                    dw $090A,$0D00,$1DDD,$1DE2
                    dw $1DE3,$1DE0,$1DE1,$1DE2
                    dw $1DF8,$290A,$0D00,$1DDE
                    dw $1DF2,$1DF3,$1DF0,$1DF1
                    dw $1DF2,$1DF3,$490A,$1B00
                    dw $1DE9,$1DC6,$1DC7,$1DC4
                    dw $1DC5,$1DC6,$1DC7,$1DE8
                    dw $0024,$0024,$1DE9,$1DEA
                    dw $1DEB,$1DE8,$690A,$1B00
                    dw $1DF9,$1DD6,$1DD7,$1DD4
                    dw $1DD5,$1DD6,$1DD7,$1DF8
                    dw $0024,$0024,$1DF9,$1DFA
                    dw $1DFB,$1DF8,$890A,$1B00
                    dw $1DE5,$1DE6,$1DE7,$1DE4
                    dw $1DE5,$1DE6,$1DE7,$1DE4
                    dw $0024,$0024,$1DE5,$1DE6
                    dw $1DE7,$1DE4,$A90A,$1B00
                    dw $1DF5,$1DF6,$1DF7,$1DF4
                    dw $1DF5,$1DF6,$1DF7,$1DF4
                    dw $0024,$0024,$1DF5,$1DF6
                    dw $1DF7,$1DF4,$0A02,$0B80
                    dw $08B8,$08BA,$08BA,$08BC
                    dw $0CBE,$0CBE,$0B02,$0B80
                    dw $08B9,$08BB,$08BB,$08BD
                    dw $0CBF,$0CBF,$9202,$0700
                    dw $1214,$1215,$1214,$1215
                    dw $B202,$0700,$1216,$1217
                    dw $1216,$1217,$C802,$1F00
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $E802,$1F00,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$FFFF,$C809
                    dw $1F00,$1DC2,$1DC3,$1DC0
                    dw $1DC1,$1DC2,$1DC3,$1DC0
                    dw $1DC1,$1DC2,$1DC3,$1DC0
                    dw $1DC1,$1DC2,$1DC3,$1DC0
                    dw $1DC1,$E809,$1F00,$1DD2
                    dw $1DD3,$1DD0,$1DD1,$1DD2
                    dw $1DD3,$1DD0,$1DD1,$1DD2
                    dw $1DD3,$1DD0,$1DD1,$1DD2
                    dw $1DD3,$1DD0,$1DD1,$080A
                    dw $1F00,$1DE2,$1DE1,$1DE2
                    dw $1DE1,$1DE2,$1DE1,$1DE2
                    dw $1DE1,$1DE2,$1DE1,$1DE2
                    dw $1DE1,$1DE2,$1DE1,$1DE2
                    dw $1DE1,$280A,$1F00,$1DD2
                    dw $1DD1,$1DE4,$1DE5,$1DD2
                    dw $1D82,$1D83,$1D84,$1D85
                    dw $1D80,$1D81,$1DD1,$1DE4
                    dw $1DE5,$1DD2,$1DD1,$480A
                    dw $1F00,$1DE2,$1DE1,$1DF4
                    dw $1DF5,$1DE2,$1DDC,$1DDD
                    dw $1DDE,$1DDF,$1D90,$1D91
                    dw $1DE1,$1DF4,$1DF5,$1DE2
                    dw $1DE1,$680A,$1F00,$1DD2
                    dw $1DD1,$1DD8,$1DE8,$1DD2
                    dw $1DEC,$1DED,$1DEE,$1DEF
                    dw $1DA0,$1DA1,$1DD1,$1DD8
                    dw $1DE8,$1DD2,$1DD1,$880A
                    dw $1F00,$1DE2,$1DE1,$1DE2
                    dw $1DE1,$1DE2,$1DFC,$1DFD
                    dw $1DFE,$1DFF,$1DB0,$1DB1
                    dw $1DE1,$1DE2,$1DE1,$1DE2
                    dw $1DE1,$A80A,$1F00,$1DF0
                    dw $1DF1,$1DF2,$1DF3,$1DF0
                    dw $1DF1,$1DF2,$1DF3,$1DF0
                    dw $1DF1,$1DF2,$1DF3,$1DF0
                    dw $1DF1,$1DF2,$1DF3,$0A02
                    dw $0B80,$08B8,$08BA,$08BA
                    dw $08BC,$0CBE,$0CBE,$0B02
                    dw $0B80,$08B9,$08BB,$08BB
                    dw $08BD,$0CBF,$0CBF,$9202
                    dw $0700,$1214,$1215,$1214
                    dw $1215,$B202,$0700,$1216
                    dw $1217,$1216,$1217,$C802
                    dw $1F00,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$E802,$1F00,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$FFFF
                    dw $EB01,$0300,$10D6,$10D7
                    dw $0A02,$0700,$10D8,$10D9
                    dw $10DA,$10DB,$2A02,$0700
                    dw $10DC,$10DD,$10DE,$10DF
                    dw $5302,$0700,$1501,$1502
                    dw $1503,$1504,$7202,$0B00
                    dw $1510,$1511,$150A,$1505
                    dw $1514,$1515,$9102,$0D00
                    dw $1506,$1516,$150A,$1512
                    dw $150A,$150A,$150D,$B002
                    dw $0F00,$1506,$1516,$150A
                    dw $150A,$9512,$1519,$150A
                    dw $151D,$C802,$1F00,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$E802
                    dw $1F00,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$FFFF,$C801,$1E40
                    dw $0C47,$CD01,$0700,$0868
                    dw $0869,$0897,$086A,$E801
                    dw $0D80,$0C45,$0C47,$0C45
                    dw $0C47,$0C45,$0C47,$0C45
                    dw $E901,$1D00,$1D32,$1D33
                    dw $1D30,$1D31,$8864,$8865
                    dw $8866,$8867,$1D32,$1D33
                    dw $1D30,$1D31,$1D32,$1D33
                    dw $1D30,$0902,$1D00,$1D02
                    dw $1D03,$1D00,$1D01,$8860
                    dw $8861,$8862,$8863,$1D02
                    dw $1D03,$1D48,$1D49,$1D4A
                    dw $1D4B,$1D00,$2902,$1D00
                    dw $153A,$1D13,$1D10,$1D11
                    dw $1D12,$1D13,$1D10,$1D11
                    dw $1D12,$1D13,$1D58,$1D59
                    dw $1D5A,$1D5B,$1D10,$4902
                    dw $1D00,$1D22,$1D23,$1D20
                    dw $1D21,$1D22,$1D23,$1D20
                    dw $1D21,$1D22,$1D23,$1D68
                    dw $1D69,$1D6A,$1D6B,$1D20
                    dw $6902,$1D00,$1D32,$1D33
                    dw $151D,$151D,$1D32,$1D33
                    dw $1D30,$1D31,$1D32,$1D33
                    dw $1D78,$1D79,$1D7A,$1D7B
                    dw $1D30,$8902,$1D00,$1D02
                    dw $1D03,$1528,$1529,$1D02
                    dw $1D03,$1D00,$1D01,$1D02
                    dw $1D03,$1D00,$1D01,$1D02
                    dw $1D03,$1D00,$A902,$1D00
                    dw $1D12,$1D13,$1D10,$1D11
                    dw $1D12,$1D13,$1D10,$1D11
                    dw $1D12,$1D13,$1D10,$1D11
                    dw $1D12,$1D13,$1D10,$C802
                    dw $1F00,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$E802,$1F00,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$FFFF
                    dw $C801,$1F00,$09E6,$09E7
                    dw $09E8,$09E9,$09E6,$09E7
                    dw $09E8,$09E9,$09E6,$09E7
                    dw $09E8,$09E9,$09E6,$09E7
                    dw $09E8,$09E9,$E801,$1F00
                    dw $09F6,$09F7,$09F8,$09F9
                    dw $09F6,$09F7,$09F8,$09F9
                    dw $09F6,$09F7,$09F8,$09F9
                    dw $09F6,$09F7,$09F8,$09F9
                    dw $080A,$1E40,$1534,$280A
                    dw $1E40,$1534,$480A,$1E40
                    dw $1534,$680A,$1E40,$1534
                    dw $880A,$1E40,$1534,$A80A
                    dw $1E40,$1534,$CB0A,$1840
                    dw $1534,$EB0A,$0E40,$1534
                    dw $0B0A,$0EC0,$1536,$0C0A
                    dw $0EC0,$1537,$0D0A,$0EC0
                    dw $1528,$130A,$0CC0,$1536
                    dw $140A,$0CC0,$1537,$150A
                    dw $0CC0,$1528,$C802,$1F00
                    dw $09CA,$09CB,$09CA,$09C3
                    dw $0024,$0024,$0024,$0024
                    dw $09C0,$09CB,$09CA,$09C3
                    dw $189B,$189C,$189B,$189C
                    dw $E802,$1F00,$09DA,$09DB
                    dw $09DA,$09D3,$18E0,$18E1
                    dw $18E0,$18E1,$09D0,$09DB
                    dw $09DA,$09D3,$189D,$189E
                    dw $189D,$189E,$FFFF,$C809
                    dw $1E40,$1534,$E809,$1E40
                    dw $1534,$080A,$1E40,$1534
                    dw $280A,$1E40,$1534,$480A
                    dw $1E40,$1534,$680A,$1E40
                    dw $1534,$880A,$1E40,$1534
                    dw $A80A,$1E40,$1534,$CB0A
                    dw $1840,$1534,$EB0A,$0E40
                    dw $1534,$CE09,$09C0,$1536
                    dw $CF09,$09C0,$1537,$6E0A
                    dw $0300,$9526,$9527,$8D0A
                    dw $0700,$9524,$9516,$9517
                    dw $9518,$AD0A,$0700,$1532
                    dw $1522,$1522,$1523,$D209
                    dw $0B00,$1DA8,$1DA9,$1D8A
                    dw $1D8B,$5DA9,$1DAC,$F209
                    dw $0B00,$1DA8,$1DB9,$1DB9
                    dw $1DB9,$1DBA,$1DAC,$120A
                    dw $0B00,$1DA8,$1D89,$1D8A
                    dw $1D8B,$5D89,$1D9C,$320A
                    dw $0B00,$1DA8,$1D99,$1D9A
                    dw $1D9B,$5D99,$1DAC,$520A
                    dw $0B00,$1DA8,$1DA9,$1D8A
                    dw $1D8B,$5DA9,$1DAC,$720A
                    dw $0B00,$1DB8,$1DB9,$1DB9
                    dw $1DB9,$1DB9,$1DBA,$E909
                    dw $0700,$1DB0,$1DB1,$5DB1
                    dw $5DB0,$090A,$0700,$1DB2
                    dw $1CE8,$1CE9,$5DB2,$290A
                    dw $0700,$1DB3,$1CEA,$1CEB
                    dw $5DB3,$490A,$0700,$1D34
                    dw $1D8E,$1D8F,$1D34,$C80A
                    dw $1F00,$1510,$1511,$1510
                    dw $1511,$1510,$1511,$1510
                    dw $1511,$1510,$1511,$1510
                    dw $1511,$1510,$1511,$1510
                    dw $1511,$E80A,$1F00,$1520
                    dw $1521,$1520,$1521,$1520
                    dw $1521,$1520,$1521,$1520
                    dw $1521,$1520,$1521,$1520
                    dw $1521,$1520,$1521,$C802
                    dw $1F00,$09CA,$09CB,$09CA
                    dw $09C3,$0024,$0024,$0024
                    dw $0024,$09C0,$09CB,$09CA
                    dw $09C3,$189B,$189C,$189B
                    dw $189C,$E802,$1F00,$09DA
                    dw $09DB,$09DA,$09D3,$18E0
                    dw $18E1,$18E0,$18E1,$09D0
                    dw $09DB,$09DA,$09D3,$189D
                    dw $189E,$189D,$189E,$FFFF
                    dw $0802,$0B00,$186B,$182C
                    dw $186C,$186D,$186E,$186F
                    dw $2802,$0B00,$1870,$182D
                    dw $1871,$1872,$1873,$1874
                    dw $4A02,$0300,$1875,$1876
                    dw $6A02,$09C0,$189F,$6B02
                    dw $09C0,$589F,$5002,$0B00
                    dw $186B,$182C,$186C,$186D
                    dw $186E,$186F,$7002,$0B00
                    dw $1870,$182D,$1871,$1872
                    dw $1873,$1874,$9202,$0300
                    dw $1875,$1876,$B202,$0300
                    dw $189F,$589F,$C802,$1F00
                    dw $186B,$182C,$186C,$186D
                    dw $186E,$182C,$186C,$186D
                    dw $186E,$182C,$186C,$186D
                    dw $186E,$182C,$186C,$186F
                    dw $E802,$1F00,$1870,$182D
                    dw $1871,$1872,$1873,$182D
                    dw $1871,$1872,$1873,$182D
                    dw $1871,$1872,$1873,$182D
                    dw $1873,$1874,$CA09,$0B00
                    dw $1DCA,$1DCB,$1DCC,$1DCD
                    dw $1DCE,$1DCF,$EA09,$0B00
                    dw $1DDA,$1DDB,$1DDC,$1DDD
                    dw $1DDE,$1DDF,$0C0A,$0B80
                    dw $1DF2,$1DE2,$1DE2,$1DE2
                    dw $1DE2,$1DE2,$0D0A,$0B80
                    dw $1DF3,$1DE3,$1DE3,$1DE3
                    dw $1DE3,$1DE3,$F109,$0B00
                    dw $1DCA,$1DCB,$1DCC,$1DCD
                    dw $1DCE,$1DCF,$110A,$0B00
                    dw $1DDA,$1DDB,$1DDC,$1DDD
                    dw $1DDE,$1DDF,$330A,$0B80
                    dw $1DF2,$1DE2,$1DE2,$1DE2
                    dw $1DE2,$1DE2,$340A,$0B80
                    dw $1DF3,$1DE3,$1DE3,$1DE3
                    dw $1DE3,$1DE3,$FFFF,$0802
                    dw $0B00,$186B,$182C,$186C
                    dw $186D,$186E,$186F,$2802
                    dw $0B00,$1870,$182D,$1871
                    dw $1872,$1873,$1874,$5002
                    dw $0B00,$186B,$182C,$186C
                    dw $186D,$186E,$186F,$7002
                    dw $0B00,$1870,$182D,$1871
                    dw $1872,$1873,$1874,$C802
                    dw $1F00,$186B,$182C,$186C
                    dw $186D,$186E,$182C,$186C
                    dw $186D,$186E,$182C,$186C
                    dw $186D,$186E,$182C,$186C
                    dw $186F,$E802,$1F00,$1870
                    dw $182D,$1871,$1872,$1873
                    dw $182D,$1871,$1872,$1873
                    dw $182D,$1871,$1872,$1873
                    dw $182D,$1873,$1874,$CA09
                    dw $0B00,$1DCA,$1DCB,$1DCC
                    dw $1DCD,$1DCE,$1DCF,$EA09
                    dw $0B00,$1DDA,$1DDB,$1DDC
                    dw $1DDD,$1DDE,$1DDF,$0C0A
                    dw $0B80,$1DF2,$1DE2,$1DE2
                    dw $1DE2,$1DE2,$1DE2,$0D0A
                    dw $0B80,$1DF3,$1DE3,$1DE3
                    dw $1DE3,$1DE3,$1DE3,$F109
                    dw $0B00,$1DCA,$1DCB,$1DCC
                    dw $1DCD,$1DCE,$1DCF,$110A
                    dw $0B00,$1DDA,$1DDB,$1DDC
                    dw $1DDD,$1DDE,$1DDF,$330A
                    dw $0B80,$1DF2,$1DE2,$1DE2
                    dw $1DE2,$1DE2,$1DE2,$340A
                    dw $0B80,$1DF3,$1DE3,$1DE3
                    dw $1DE3,$1DE3,$1DE3,$FFFF
                    dw $C802,$0300,$0CAB,$0CAD
                    dw $E802,$0300,$0CAC,$0CAE
                    dw $CA02,$1B40,$3221,$AA02
                    dw $0100,$0881,$AB02,$1940
                    dw $2A20,$0E0A,$0F80,$1DE0
                    dw $1DF0,$1DC3,$1DD3,$1DE3
                    dw $1DF3,$1DC1,$1DE2,$0F0A
                    dw $0F80,$1DE1,$5DF0,$1DC4
                    dw $1DD4,$1DE4,$1DF4,$1DD0
                    dw $1DF2,$4D0A,$0100,$1DC2
                    dw $500A,$0100,$1DC5,$CD0A
                    dw $0100,$1DC0,$D00A,$0100
                    dw $1DD1,$540A,$0B80,$15CA
                    dw $15F1,$15C6,$15D6,$15E6
                    dw $15F6,$550A,$0B80,$15CB
                    dw $55F1,$15C7,$15D7,$15E7
                    dw $15F7,$FFFF,$0902,$1300
                    dw $104B,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$1050,$2902,$1300
                    dw $104C,$104E,$104F,$104A
                    dw $104F,$104A,$104F,$104A
                    dw $104E,$1051,$4D02,$0780
                    dw $1204,$1210,$1200,$1210
                    dw $4E02,$0780,$1207,$1213
                    dw $1203,$1213,$C802,$1F00
                    dw $104B,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$1050
                    dw $E802,$1F00,$104C,$104E
                    dw $104F,$104A,$104F,$104A
                    dw $104F,$104A,$104F,$104A
                    dw $104F,$104A,$104F,$104A
                    dw $104E,$1051,$EA09,$0100
                    dw $1CC0,$F609,$0100,$1CC4
                    dw $D509,$0100,$1CC1,$CF09
                    dw $0100,$1CC6,$150A,$0100
                    dw $1CC2,$710A,$0100,$1CC5
                    dw $360A,$0100,$1CC5,$500A
                    dw $0100,$1CC4,$540A,$0100
                    dw $1CC7,$770A,$0100,$1CC3
                    dw $6F0A,$0100,$1CC4,$930A
                    dw $0100,$1CC2,$890A,$0100
                    dw $1CC5,$6B0A,$0100,$1CC1
                    dw $480A,$0100,$1CC0,$FFFF
                    dw $0902,$1300,$104B,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$1050
                    dw $2902,$1300,$104C,$104E
                    dw $104F,$104A,$104F,$104A
                    dw $104F,$104A,$104E,$1051
                    dw $4D02,$0780,$1204,$1210
                    dw $1200,$1210,$4E02,$0780
                    dw $1207,$1213,$1203,$1213
                    dw $C802,$1F00,$104B,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$1050,$E802,$1F00
                    dw $104C,$104E,$104F,$104A
                    dw $104F,$104A,$104F,$104A
                    dw $104F,$104A,$104F,$104A
                    dw $104F,$104A,$104E,$1051
                    dw $FFFF,$0902,$1300,$104B
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $1050,$2902,$1300,$104C
                    dw $104E,$104F,$104A,$104F
                    dw $104A,$104F,$104A,$104E
                    dw $1051,$4D02,$0780,$1204
                    dw $1210,$1200,$1210,$4E02
                    dw $0780,$1207,$1213,$1203
                    dw $1213,$C802,$1F00,$104B
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$104D,$104D
                    dw $104D,$104D,$1050,$E802
                    dw $1F00,$104C,$104E,$104F
                    dw $104A,$104F,$104A,$104F
                    dw $104A,$104F,$104A,$104F
                    dw $104A,$104F,$104A,$104E
                    dw $1051,$680A,$1F00,$1DD4
                    dw $1DD5,$1DC1,$1DC2,$1CCA
                    dw $1CCB,$1CCA,$1CCB,$1CCA
                    dw $1CCB,$1CCA,$1CCB,$1DC0
                    dw $1DD1,$1DD2,$1DD3,$880A
                    dw $1F00,$1DE8,$1DE9,$1DEA
                    dw $1DEB,$1DE0,$1DE1,$1DE4
                    dw $1DE5,$1DE0,$1DE1,$1DE4
                    dw $1DE5,$1DE8,$1DE9,$1DEA
                    dw $1DEB,$A80A,$1F00,$1DF8
                    dw $1DF9,$1DFA,$1DFB,$1DF0
                    dw $1DF1,$1DF4,$1DF5,$1DF0
                    dw $1DF1,$1DF4,$1DF5,$1DF8
                    dw $1DF9,$1DFA,$1DFB,$C80A
                    dw $1F00,$1DC8,$1DC9,$1DCA
                    dw $1DCB,$1DE2,$1DE3,$1DE6
                    dw $1DE7,$1DE2,$1DE3,$1DE6
                    dw $1DE7,$1DC8,$1DC9,$1DCA
                    dw $1DCB,$E80A,$1F00,$1DD8
                    dw $1DD9,$1DDA,$1DDB,$1DF2
                    dw $1DF3,$1DF6,$1DF7,$1DF2
                    dw $1DF3,$1DF6,$1DF7,$1DD8
                    dw $1DD9,$1DDA,$1DDB,$FFFF
                    dw $8A02,$0B00,$1214,$1215
                    dw $1214,$1215,$1214,$1215
                    dw $AA02,$0B00,$1216,$1217
                    dw $1216,$1217,$1216,$1217
                    dw $4C02,$0780,$08B8,$08BC
                    dw $0CBE,$0CBE,$4D02,$0780
                    dw $08B9,$08BD,$0CBF,$0CBF
                    dw $F301,$0300,$10D6,$10D7
                    dw $1202,$0700,$10D8,$10D9
                    dw $10DA,$10DB,$3202,$0700
                    dw $10DC,$10DD,$10DE,$10DF
                    dw $C802,$1F00,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$0A08,$0A09
                    dw $0A08,$0A09,$E802,$1F00
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $0A18,$0A19,$0A18,$0A19
                    dw $FFFF,$0A02,$0B80,$08B8
                    dw $08BA,$08BA,$08BC,$0CBE
                    dw $0CBE,$0B02,$0B80,$08B9
                    dw $08BB,$08BB,$08BD,$0CBF
                    dw $0CBF,$9202,$0700,$1214
                    dw $1215,$1214,$1215,$B202
                    dw $0700,$1216,$1217,$1216
                    dw $1217,$C802,$1F00,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$0A08
                    dw $0A09,$0A08,$0A09,$E802
                    dw $1F00,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$0A18,$0A19,$0A18
                    dw $0A19,$FFFF

                    dw $EB01,$0240,$0024,$0A02
                    dw $0640,$0024,$2A02,$0640
                    dw $0024,$5302,$0640,$0024
                    dw $7202,$0A40,$0024,$9102
                    dw $0C40,$0024,$B002,$0E40
                    dw $0024,$FFFF

                    dw $EB09,$0900,$1CC0,$0024
                    dw $1CC5,$0024,$1CC3,$0C0A
                    dw $0500,$1CC2,$0024,$1CC1
                    dw $290A,$0100,$1CC2,$4B0A
                    dw $0100,$1CC1,$140A,$0100
                    dw $1CC5,$530A,$0700,$1CC3
                    dw $0024,$1CC4,$0024,$680A
                    dw $1F00,$15C6,$15C7,$15C8
                    dw $15C9,$15CA,$15CB,$1CC6
                    dw $15CD,$15C6,$15C7,$15C8
                    dw $15C9,$15CA,$15CB,$15CC
                    dw $15CD,$880A,$1F00,$15D6
                    dw $15D7,$15D8,$15D9,$15DA
                    dw $15DB,$15DC,$15DD,$15D6
                    dw $15D7,$15D8,$15D9,$15DA
                    dw $15DB,$15DC,$15DD,$A80A
                    dw $1F00,$15E6,$15E7,$15E8
                    dw $15E9,$15EA,$15EB,$15EC
                    dw $15ED,$15E6,$15E7,$15E8
                    dw $15E9,$15EA,$15EB,$15EC
                    dw $15ED,$FFFF

                    dw $0000,$0020,$0040,$0060
                    dw $0080,$00A0,$00C0,$00E0
                    dw $0100,$0120,$0140,$0160
                    dw $0180,$01A0,$01C0,$01E0
                    dw $0200,$0220,$0240,$0260
                    dw $0280,$02A0,$02C0,$02E0
                    dw $0300,$0320,$0340,$03A0
                    dw $03E0,$03C0,$03E0,$0420
                    dw $0360,$0380,$02E0,$02E0
                    dw $02E0,$02E0,$0500,$0520
                    dw $0540,$0560,$0580,$05C0
                    dw $05E0,$0600,$0620,$0640
                    dw $0660,$0740,$0780,$07A0
                    dw $0460,$04A0,$04C0,$04E0
                    dw $05A0,$0680,$06A0,$06C0
                    dw $06E0,$0700,$0400,$0720
                    dw $0440,$0480

                    dw $42DD,$7FFF,$1084,$3800 ;THIS TABLE AND THE NEXT ONE LOOKS LIKE PALETTE DATA
                    dw $7708,$035F,$0259,$3800

                    dw $7708,$7FFF,$73B9,$6335
                    dw $7708,$7FFF,$722B,$65C8
                    dw $7708,$7FFF,$1084,$1BDF
                    dw $027F,$0139,$1ADA,$0DF3
                    dw $050D,$4F7F,$3298,$15B1
                    dw $3FFF,$45BF,$20D4,$2D3A
                    dw $7BAF,$7FFF,$1084,$57F3
                    dw $0340,$01A0,$0000,$0000
                    dw $0000,$04D0,$0554,$11D8
                    dw $125C,$2BAA,$3800,$0A62
                    dw $7BAF,$7FFF,$0842,$2B30
                    dw $14B8,$0D3F,$029F,$035F
                    dw $0008,$008E,$1575,$1A3A
                    dw $3F5F,$5AD6,$2529,$3DEF
                    dw $7BAF,$7FFF,$1084,$7FB8
                    dw $72B0,$32FC,$2256,$11CF
                    dw $054B,$09E6,$1AAB,$2B30
                    dw $3BB4,$287F,$000E,$0015
                    dw $7BAF,$376D,$1084,$22A9
                    dw $219B,$1538,$04B4,$0470
                    dw $040C,$21C2,$3246,$3EA9
                    dw $4B0C,$534E,$01C3,$1646
                    dw $772F,$7FFF,$1084,$729F
                    dw $51B8,$30B0,$7E97,$6DB0
                    dw $54EA,$294A,$4210,$5EF7
                    dw $6F7B,$571F,$251C,$3E3F
                    dw $7BAF,$7FFF,$1084,$778C
                    dw $6F4A,$6708,$5EC6,$5684
                    dw $4E42,$21C2,$3246,$42CA
                    dw $4F2D,$6372,$1084,$1084
                    dw $45BC,$7FFF,$14A5,$01A5
                    dw $0249,$02CD,$4631,$5AD6
                    dw $0000,$0351,$0019,$011F
                    dw $061F,$129F,$017A,$0113
                    dw $45BC,$7FFF,$14A5,$008D
                    dw $0112,$19D9,$2A9E,$36FF
                    dw $0000,$7FFF,$0813,$2D9B
                    dw $465F,$539F,$1B9F,$1A5F
                    dw $45BC,$7FFF,$14A5,$013B
                    dw $027F,$179F,$0135,$265E
                    dw $0000,$0C9B,$0135,$261D
                    dw $42DF,$6ADF,$4A1D,$28FA
                    dw $734E,$7FFF,$14A5,$3D84
                    dw $5229,$27BF,$31BB,$3ABF
                    dw $0000,$152F,$355D,$525F
                    dw $169B,$1C9F,$0C19,$0C19
                    dw $45BC,$7FFF,$14A5,$013B
                    dw $027F,$179F,$0135,$265E
                    dw $0000,$0C9B,$0220,$0EE0
                    dw $23A0,$6ADF,$4A1D,$28FA
                    dw $45BC,$7FFF,$14A5,$0203
                    dw $0F0A,$2BF1,$0135,$265E
                    dw $0000,$3F5F,$294A,$4631
                    dw $6318,$1A3A,$1575,$008E
                    dw $45BC,$7FFF,$14A5,$0055
                    dw $0C3E,$3D9F,$0135,$265E
                    dw $0000,$42DF,$4025,$74D2
                    dw $7EB2,$261D,$1557,$00AF
                    dw $45BC,$7FFF,$14A5,$0111
                    dw $0DB9,$22DD,$2D9C,$3ABF
                    dw $0000,$0000,$14EC,$1DD4
                    dw $369A,$20BC,$1096,$000F
                    dw $7F92,$7FFF,$1084,$5B0C
                    dw $568A,$5208,$4DA6,$4944
                    dw $44E2,$0887,$14EA,$214D
                    dw $298F,$2936,$0831,$1CD3
                    dw $7F92,$7FFF,$1084,$722B
                    dw $65C8,$5D86,$7F36,$6DB0
                    dw $54EA,$294A,$4210,$5EF7
                    dw $6F7B,$52FF,$35BC,$469C
                    dw $7F92,$7FFF,$0000,$0A1F
                    dw $011D,$0013,$0000,$0000
                    dw $0000,$0887,$14EA,$214D
                    dw $298F,$4280,$2940,$35E0
                    dw $772F,$7FFF,$1084,$57F0
                    dw $0340,$01A0,$1BDF,$027F
                    dw $0139,$3CE1,$5186,$662B
                    dw $7AD0,$2BAA,$3800,$0A62
                    dw $772F,$7FFF,$1084,$0000
                    dw $0000,$0000,$1ADA,$0DF3
                    dw $050D,$3961,$4E06,$62AB
                    dw $7750,$5AD6,$2529,$3DEF
                    dw $772F,$7FFF,$0000,$264E
                    dw $49EC,$41AA,$3968,$3126
                    dw $28E4,$1C41,$28A3,$3506
                    dw $3D48,$0525,$0D88,$19EB
                    dw $772F,$6739,$0000,$2CC5
                    dw $3D89,$3DCD,$4E51,$2EF8
                    dw $1E74,$1C41,$28A3,$3506
                    dw $3D48,$4210,$2108,$318C
                    dw $45BC,$7FFF,$14A5,$2CE0
                    dw $41A3,$5648,$6AED,$7F71
                    dw $0000,$7FFF,$3013,$4D9B
                    dw $625F,$539F,$1B9F,$1A5F
                    dw $45BC,$7FFF,$14A5,$1E22
                    dw $2F01,$3FE0,$0135,$1A9F
                    dw $0000,$7750,$294A,$4631
                    dw $6318,$62AB,$4E06,$3961
                    dw $772F,$7FFF,$1084,$3B1F
                    dw $035F,$029F,$11D7,$0153
                    dw $00CF,$0000,$0000,$0000
                    dw $0000,$0000,$0000,$0000
                    dw $772F,$7FFF,$14A5,$05BF
                    dw $001E,$0017,$46BF,$365D
                    dw $25BB,$04EF,$0D73,$4F7F
                    dw $7F0F,$0000,$0000,$0000
                    dw $45BC,$7FFF,$14C5,$256D
                    dw $3A12,$4A96,$5B1A,$6B9E
                    dw $0000,$7FFF,$210E,$35B7
                    dw $4E79,$539F,$1B9F,$1A5F
                    dw $45BC,$7FFF,$14A5,$1E22
                    dw $2F01,$3FE0,$0135,$1A9F
                    dw $0000,$5B1A,$294A,$4631
                    dw $6318,$4A96,$3A12,$256D
                    dw $7708,$7FFF,$1084,$57F3
                    dw $0340,$01A0,$0000,$0000
                    dw $0000,$1D28,$2DAC,$3E30
                    dw $4EB4,$2BAA,$3800,$0A62
                    dw $7708,$15EF,$114C,$012E
                    dw $00EC,$00AA,$090A,$1D63
                    dw $1521,$0864,$10A6,$18E8
                    dw $212A,$296C,$31AE,$39F0
                    dw $7708,$7FFF,$1084,$097F
                    dw $005A,$000F,$7E97,$6DB0
                    dw $54EA,$256D,$3A12,$4A96
                    dw $5B1A,$571F,$251C,$3E3F
                    dw $7BAF,$7FFF,$1084,$0000
                    dw $0000,$0000,$0000,$0000
                    dw $0000,$294A,$4210,$5EF7
                    dw $6F7B,$5AD6,$2529,$3DEF
                    dw $7708,$7FFF,$3DAD,$314A
                    dw $24E7,$01F6,$0192,$012F
                    dw $00AC,$0864,$10A6,$18E8
                    dw $212A,$296C,$0088,$00CA
                    dw $7BAF,$7FFF,$0842,$2B30
                    dw $14B8,$0D3F,$029F,$035F
                    dw $0008,$008E,$1575,$1A3A
                    dw $3F5F,$6F7B,$5AD6,$3DEF
                    dw $7708,$7FFF,$1084,$77BD
                    dw $5EF7,$3DEF,$1BDF,$027F
                    dw $0139,$0492,$0D17,$25DD
                    dw $3A7F,$6F7B,$3800,$5294
                    dw $3908,$7FFF,$0842,$2B30
                    dw $14B8,$0D3F,$029F,$035F
                    dw $0008,$008E,$1575,$1A3A
                    dw $3F5F,$6F7B,$5AD6,$3DEF
                    dw $7708,$7FFF,$1084,$77BD
                    dw $5EF7,$3DEF,$1BDF,$027F
                    dw $0139,$0492,$0D17,$25DD
                    dw $3A7F,$6F7B,$3800,$5294
                    dw $3908,$4D4B,$18C6,$4509
                    dw $4D2D,$44EB,$3CA9,$7FFF
                    dw $73B9,$21C2,$3246,$42CA
                    dw $4F2D,$6372,$30C3,$3904
                    dw $3C63,$7F7B,$7E73,$5D6B
                    dw $6FFB,$4FF3,$2EEB,$0DE3
                    dw $3FFF,$1EF7,$0A52,$01CE
                    dw $6F7F,$4E7F,$2D77,$0C75
                    dw $7708,$7FFF,$1084,$57F3
                    dw $0340,$01A0,$1BDF,$027F
                    dw $0139,$04D0,$0554,$11D8
                    dw $125C,$2BAA,$3800,$0A62
                    dw $7708,$7FFF,$1084,$0000
                    dw $0000,$0000,$1ADA,$0DF3
                    dw $050D,$008E,$1575,$1A3A
                    dw $3F5F,$5AD6,$2529,$3DEF
                    dw $7708,$7FFF,$1084,$7FB8
                    dw $72B0,$32FC,$2256,$11CF
                    dw $054B,$5AD6,$6739,$739C
                    dw $7FFF,$287F,$000E,$0015
                    dw $7BAF,$7FFF,$1084,$5B5B
                    dw $46D7,$435F,$32DF,$225B
                    dw $11D7,$01B3,$0A37,$1ABB
                    dw $2F5F,$1D3C,$0034,$0CB8
                    dw $7BAF,$7FFF,$1CE7,$4EFF
                    dw $42BF,$53FF,$479D,$3B3A
                    dw $2ED7,$2E7E,$3ADF,$473F
                    dw $4B9F,$0000,$0000,$0000
                    dw $7BAF,$7F38,$216D,$7FBF
                    dw $7F38,$5B3B,$4AB7,$3A33
                    dw $29AF,$2A13,$3A97,$4B1B
                    dw $5B9E,$76B4,$69C9,$7230
                    dw $7BAF,$7FFF,$1084,$2B96
                    dw $1713,$3B9D,$12F8,$0A74
                    dw $01F0,$2A03,$3A87,$4B0B
                    dw $576E,$6BB3,$020B,$028F
                    dw $7BAF,$130F,$05C5,$0A8B
                    dw $01F8,$0172,$010D,$7FFF
                    dw $73B9,$21C2,$3246,$3EA9
                    dw $4B0C,$5FB1,$0589,$0A29
                    dw $7BAF,$7FFF,$1084,$7FFF
                    dw $6FD9,$7FFF,$777B,$66F7
                    dw $5673,$4E7F,$5EFF,$6F7F
                    dw $7FFF,$6372,$4ED1,$5F55
                    dw $7BAF,$7FFF,$1907,$5B57
                    dw $577C,$46F8,$3674,$25F0
                    dw $156C,$296D,$39F1,$4A75
                    dw $5AF9,$6B7D,$3A4F,$4AD3
                    dw $7708,$15EF,$114C,$012E
                    dw $00EC,$00AA,$090A,$1D63
                    dw $1521,$0C63,$14A3,$1CE5
                    dw $2527,$2D69,$35AB,$3DED
                    dw $7708,$0C63,$1CE5,$2D69
                    dw $2527,$1D0B,$18EA,$10A8
                    dw $0866,$0C63,$14A3,$1CE5
                    dw $2527,$2D69,$00D6,$015A
                    dw $7F92,$7FFF,$0842,$4631
                    dw $3DEF,$35AD,$2D6B,$2529
                    dw $1CE7,$10EA,$1D4D,$29B0
                    dw $3613,$3208,$1942,$25A5
                    dw $7F92,$7FFF,$29F8,$67FF
                    dw $4BDF,$3B7E,$331B,$26B8
                    dw $1A55,$2E79,$3ADC,$473F
                    dw $539F,$4F1F,$365B,$42BE
                    dw $7F92,$7FFF,$29F8,$6BFF
                    dw $5FFC,$53B9,$4756,$3AF3
                    dw $2E90,$2E79,$3ADC,$473F
                    dw $539F,$4F1F,$365B,$42BE
                    dw $7BAF,$7FFF,$1084,$29F9
                    dw $1975,$1A98,$0E15,$0191
                    dw $010D,$184D,$20D1,$2955
                    dw $31D9,$3A5D,$006E,$08F1
                    dw $7BAF,$02D4,$1084,$7FFF
                    dw $3E99,$2E15,$1D91,$092E
                    dw $00AA,$21C2,$3246,$3EA9
                    dw $4B0C,$534E,$6739,$739C
                    dw $45BC,$7FFF,$0C63,$40C0
                    dw $5565,$65E9,$4631,$5AD6
                    dw $0000,$766D,$0012,$101A
                    dw $311F,$367A,$21D5,$0D30
                    dw $7708,$7FFF,$1084,$53BF
                    dw $033E,$025C,$4A5F,$315F
                    dw $001D,$004A,$04B2,$0A1C
                    dw $133D,$677F,$017C,$0019
                    dw $1084,$7FFF,$04CA,$0155
                    dw $1A1C,$1B3E,$2DFF,$471F
                    dw $56B5,$1173,$1242,$3329
                    dw $1C9F,$0C18,$79E6,$5144
                    dw $7BAF,$7FFF,$1084,$53BF
                    dw $033E,$025C,$0000,$0000
                    dw $0000,$1058,$015F,$0E1F
                    dw $140E,$02BF,$017C,$0019
                    dw $1084,$7FFF,$0C63,$0113
                    dw $11DA,$1B3E,$2DFF,$471F
                    dw $5EF7,$152F,$0012,$0C19
                    dw $1C9F,$762D,$7189,$5905

                    dw $04D0,$20B1,$23C1,$14D1
                    dw $0492,$23A2,$14B2,$47C2
                    dw $2083,$1493,$47A3,$0474
                    dw $1484,$4794,$0455,$0965
                    dw $0675,$4785,$17D5,$2046
                    dw $1456,$0C66,$1476,$4786
                    dw $17C6,$14D6,$2147,$0157
                    dw $4767,$10B7,$14C7,$2248
                    dw $0858,$1A68,$4778,$13B8
                    dw $1559,$1B69,$4779,$10A9
                    dw $14B9,$204A,$145A,$476A
                    dw $18AA,$224B,$085B,$476B
                    dw $109B,$14AB,$065C,$476C
                    dw $178C,$029C,$055D,$086D
                    dw $477D,$198D,$039D,$1AAD
                    dw $08BD,$226E,$087E,$478E
                    dw $199E,$2FAE,$11BE,$08CE
                    dw $217F,$478F,$19CF,$A060
                    dw $1470,$4780,$2161,$2C71
                    dw $4781,$2162,$2D72,$4782
                    dw $0563,$0873,$1A83,$4793
                    dw $2274,$0B84,$2294,$08A4
                    dw $47B4,$21A5,$47B5,$05A6
                    dw $08B6,$47C6,$22B7,$08C7
                    dw $07D7,$2018,$2928,$22C8
                    dw $08D8,$2009,$1419,$0C29
                    dw $0939,$05D9,$210A,$2C1A
                    dw $072A,$0A3A,$210B,$2D1B
                    dw $072B,$0A3B,$220C,$081C
                    dw $1A2C,$2B3C,$221D,$0B2D
                    dw $A0D0,$20A1,$63B1,$14D1
                    dw $0482,$2392,$14A2,$47B2
                    dw $0433,$2343,$0953,$2063
                    dw $2373,$1483,$4793,$2024
                    dw $0234,$4744,$0C54,$1464
                    dw $2225,$0335,$4745,$0536
                    dw $0846,$4756,$2037,$1947
                    dw $0857,$4767,$0428,$1438
                    dw $4748,$2229,$0839,$4749
                    dw $053A,$104A,$145A,$476A
                    dw $1A8A,$109A,$14AA,$203B
                    dw $144B,$475B,$1A7B,$0B8B
                    dw $219B,$109C,$213C,$014C
                    dw $475C,$0A7C,$008C,$059C
                    dw $08AC,$1ABC,$08CC,$053D
                    dw $084D,$075D,$1A6D,$0B7D
                    dw $22AD,$0BBD,$06CD,$1ADD
                    dw $224E,$245E,$0B6E,$05CE
                    dw $0BDE,$84B0,$23C0,$29D0
                    dw $20A1,$47B1,$2082,$0F92
                    dw $14A2,$47B2,$2013,$0923
                    dw $0473,$0283,$4793,$2004
                    dw $1414,$0724,$2934,$1574
                    dw $0384,$4794,$2105,$0115
                    dw $0725,$0A35,$0465,$4775
                    dw $1885,$0506,$0816,$1A26
                    dw $0B36,$0666,$1076,$1186
                    dw $0896,$47A6,$2217,$0B27
                    dw $2167,$1877,$4787,$2058
                    dw $1468,$1978,$0888,$4798
                    dw $1AA8,$08B8,$0439,$0F49
                    dw $1459,$4769,$1189,$1F99
                    dw $1BA9,$19B9,$08C9,$272A
                    dw $283A,$474A,$08AA,$13CA
                    dw $223B,$084B,$475B,$1A6B
                    dw $087B,$11AB,$1CBB,$08CB
                    dw $054C,$245C,$0B6C,$057C
                    dw $088C,$479C,$19CC,$228D
                    dw $089D,$47AD,$059E,$08AE
                    dw $1ABE,$08CE,$07DE,$22AF
                    dw $0BBF,$05CF,$0BDF,$A0D0
                    dw $2091,$29A1,$20C1,$14D1
                    dw $0472,$2382,$1492,$0CA2
                    dw $0FB2,$14C2,$07D2,$2043
                    dw $0953,$2063,$1473,$4783
                    dw $0434,$1444,$0C54,$1D64
                    dw $1474,$4784,$2025,$1435
                    dw $2C45,$4755,$2226,$0836
                    dw $2D46,$4756,$0537,$0847
                    dw $4757,$1797,$2EA7,$2248
                    dw $0858,$1A68,$4778,$1088
                    dw $1498,$0CA8,$1559,$1B69
                    dw $4779,$1889,$0199,$204A
                    dw $145A,$476A,$198A,$089A
                    dw $1AAA,$214B,$015B,$476B
                    dw $199B,$1BAB,$054C,$085C
                    dw $476C,$225D,$256D,$287D
                    dw $478D,$227E,$088E,$1A9E
                    dw $08AE,$07BE,$1ACE,$08DE
                    dw $058F,$0B9F,$05AF,$24BF
                    dw $0BCF,$05DF,$84A1,$09B1
                    dw $20D1,$0402,$2312,$2922
                    dw $2092,$14A2,$0CB2,$0FC2
                    dw $14D2,$2103,$2C13,$0A23
                    dw $2063,$2373,$2683,$2893
                    dw $01A3,$47B3,$2104,$2D14
                    dw $0A24,$2054,$1464,$4774
                    dw $1194,$08A4,$0505,$2415
                    dw $0B25,$2155,$0165,$4775
                    dw $2256,$0866,$4776,$1786
                    dw $1496,$0567,$0877,$1987
                    dw $0897,$47A7,$2068,$1478
                    dw $4788,$1198,$08A8,$0459
                    dw $1469,$2C79,$4789,$18A9
                    dw $225A,$086A,$2D7A,$478A
                    dw $19AA,$08BA,$226B,$087B
                    dw $478B,$11BB,$1BCB,$08DB
                    dw $227C,$088C,$479C,$1AAC
                    dw $08BC,$19DC,$058D,$249D
                    dw $0BAD,$05BD,$08CD,$07DD
                    dw $22CE,$08DE,$22DF,$A0D0
                    dw $04B1,$0FC1,$14D1,$20A2
                    dw $14B2,$47C2,$0493,$47A3
                    dw $2194,$01A4,$47B4,$2295
                    dw $08A5,$47B5,$22A6,$08B6
                    dw $47C6,$0477,$0987,$15B7
                    dw $08C7,$07D7,$2068,$1478
                    dw $0C88,$0998,$20A8,$14B8
                    dw $19C8,$08D8,$2049,$0F59
                    dw $1469,$4779,$0C99,$14A9
                    dw $043A,$144A,$475A,$063B
                    dw $474B,$202C,$143C,$2C4C
                    dw $475C,$222D,$083D,$2D4D
                    dw $475D,$1A7D,$088D,$053E
                    dw $474E,$1A6E,$0B7E,$158E
                    dw $089E,$224F,$085F,$0C6F
                    dw $237F,$148F,$199F,$08AF
                    dw $47BF,$A040,$1450,$4760
                    dw $19A0,$1CB0,$08C0,$07D0
                    dw $2031,$1441,$4751,$2132
                    dw $4742,$0152,$2233,$0843
                    dw $4753,$0544,$0854,$4764
                    dw $2045,$1455,$4765,$0436
                    dw $0E46,$1456,$4766,$1776
                    dw $1486,$2027,$4737,$1067
                    dw $1477,$0528,$2438,$0848
                    dw $4758,$1868,$0549,$1059
                    dw $1469,$2C79,$4789,$225A
                    dw $086A,$2D7A,$478A,$056B
                    dw $087B,$478B,$227C,$088C
                    dw $1A9C,$24AC,$08BC,$47CC
                    dw $058D,$0B9D,$22BD,$08CD
                    dw $07DD,$05CE,$08DE,$22DF
                    dw $A0D2,$2053,$0963,$04C3
                    dw $14D3,$0444,$1454,$0C64
                    dw $2374,$0984,$0494,$09A4
                    dw $05C4,$08D4,$2035,$1445
                    dw $4755,$1075,$0E85,$1495
                    dw $0CA5,$29B5,$20C5,$14D5
                    dw $2136,$4746,$1476,$0CB6
                    dw $14C6,$2027,$4737,$0157
                    dw $0528,$0838,$4748,$10A8
                    dw $2EB8,$2239,$0849,$1A59
                    dw $0869,$4779,$1799,$14A9
                    dw $0CB9,$054A,$0B5A,$226A
                    dw $087A,$178A,$149A,$47AA
                    dw $046B,$147B,$198B,$089B
                    dw $47AB,$056C,$247C,$178C
                    dw $149C,$47AC,$047D,$148D
                    dw $479D,$217E,$478E,$2C9E
                    dw $217F,$478F,$2D9F,$8570
                    dw $0880,$4790,$2071,$1981
                    dw $0891,$1AA1,$08B1,$47C1
                    dw $0452,$0F62,$1472,$4782
                    dw $1992,$1BA2,$19B2,$08C2
                    dw $2043,$0253,$4763,$19C3
                    dw $08D3,$0544,$0354,$4764
                    dw $19D4,$2255,$1B65,$4775
                    dw $0566,$0876,$4786,$2277
                    dw $0887,$1A97,$08A7,$47B7
                    dw $0588,$0B98,$05A8,$08B8
                    dw $47C8,$22B9,$08C9,$07D9
                    dw $05CA,$0BDA,$8420,$2330
                    dw $0940,$2011,$1421,$0731
                    dw $0C41,$0951,$2112,$0122
                    dw $0732,$0742,$0A52,$0513
                    dw $0823,$0733,$0743,$0B53
                    dw $04A3,$23B3,$09C3,$2224
                    dw $2434,$0B44,$2094,$14A4
                    dw $07B4,$17C4,$0FD4,$2085
                    dw $1495,$47A5,$14C5,$2286
                    dw $0896,$47A6,$2067,$0977
                    dw $0487,$1397,$47A7,$2058
                    dw $1468,$0C78,$1488,$1398
                    dw $47A8,$0449,$1459,$4769
                    dw $1789,$1499,$2CA9,$064A
                    dw $475A,$198A,$089A,$2DAA
                    dw $203B,$144B,$475B,$199B
                    dw $08AB,$213C,$474C,$105C
                    dw $2E6C,$107C,$148C,$109C
                    dw $14AC,$053D,$104D,$145D
                    dw $0C6D,$147D,$478D,$149D
                    dw $064E,$475E,$2C6E,$054F
                    dw $085F,$2D6F,$477F,$A250
                    dw $0860,$4770,$0661,$4771
                    dw $2052,$1162,$1F72,$0882
                    dw $4792,$2153,$4763,$1983
                    dw $1F93,$08A3,$0554,$0864
                    dw $4774,$19A4,$08B4,$2265
                    dw $0875,$4785,$13B5,$0676
                    dw $4786,$11B6,$08C6,$0467
                    dw $1477,$2C87,$4797,$19C7
                    dw $08D7,$2268,$0878,$2D88
                    dw $4798,$11D8,$0579,$0889
                    dw $4799,$207A,$148A,$479A
                    dw $227B,$248B,$089B,$47AB
                    dw $219C,$47AC,$1ABC,$08CC
                    dw $229D,$24AD,$2BBD,$22CD
                    dw $08DD,$05DE,$FFFF,$085C
                    dw $085C,$085C,$085C,$0855
                    dw $0856,$0855,$4856,$0854
                    dw $0853,$0855,$0856,$0855
                    dw $4856,$4854,$0853,$085C
                    dw $0857,$0857,$0854,$4857
                    dw $4854,$085C,$4857,$4857
                    dw $4854,$0857,$0854,$0853
                    dw $0853,$0853,$0853,$0853
                    dw $0853,$4854,$0853,$8850
                    dw $8851,$0853,$8852,$0853
                    dw $C852,$0853,$8852,$0853
                    dw $C852,$C850,$C851,$0853
                    dw $8854,$0853,$0853,$C854
                    dw $4854,$C857,$4857,$8858
                    dw $0858,$0853,$0853,$8857
                    dw $0857,$8854,$0854,$0853
                    dw $085B,$085B,$0854,$485B
                    dw $4854,$8853,$485B,$0853
                    dw $8854,$4854,$0853,$485B
                    dw $4854,$085B,$0854,$0854
                    dw $0853,$0853,$0853,$4857
                    dw $4854,$0857,$485B,$4857
                    dw $085B,$0857,$0854,$0859
                    dw $0858,$085A,$0853,$485A
                    dw $0853,$085A,$0853,$485A
                    dw $0853,$4859,$4858,$0853
                    dw $0853,$0853,$C854,$C854
                    dw $C85B,$C85B,$0853,$C854
                    dw $4854,$C85B,$485B,$885B
                    dw $085B,$8854,$0854,$C854
                    dw $0853,$8854,$0853,$0853
                    dw $0853,$C858,$4858,$0851
                    dw $0850,$0852,$0853,$4852
                    dw $0853,$0852,$0853,$4852
                    dw $0853,$4851,$4850,$8850
                    dw $0850,$0853,$0853,$0853
                    dw $0853,$C850,$4850,$C854
                    dw $085B,$C857,$4857,$8857
                    dw $0857,$8854,$485B,$085C
                    dw $0857,$085C,$4857,$0854
                    dw $0853,$4854,$0853,$8857
                    dw $085C,$8854,$8857,$C854
                    dw $C857,$8854,$8857,$C854
                    dw $C857,$C857,$085C,$0853
                    dw $0853,$0855,$0856,$0855
                    dw $4856,$0853,$0853,$8858
                    dw $8859,$0853,$885A,$0853
                    dw $C85A,$C858,$C859

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ;Empty
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF

                    db $26,$AC,$26,$26,$26,$72,$72,$72
                    db $13,$59,$8B

;level number and type handler. only run when you beat 8-4?

CODE_04C00B:        PHB                       ;\
                    PHK                       ; |Setup program bank
                    PLB                       ;/
                    JSL.l CODE_04C01F         ;\Jump to level loading routine
                    STA.w $0750               ;/Store the output (level number) here
                    AND.b #$60                ;AND the output with $60 (01100000 c)
                    ASL   A                   ;*2 (11000000 c)
                    ROL   A                   ;*2 with carry (10000000 C)
                    ROL   A                   ;*2 with carry (00000001 C)
                    ROL   A                   ;*2 with carry (00000011 c)
                    STA.b $5C                 ;Store in map type. This means that bits 6 and 5 are the map type!
                    PLB                       ;\Restore original program bank
                    RTL                       ;/

CODE_04C01F:        PHB                       ;\
                    PHK                       ; |Setup program bank again.
                    PLB                       ;/
                    LDY.w $075F               ;\Load world.
                    CPY.b #$08                ; |If it is smaller than world 08
                    BCC   CODE_04C034         ;/go setup normal level.
                    STZ.w $0760               ;Store zero to current level
                    STZ.w $075C               ;Store zero to written number of current level
                    LDY.b #$00                ;\
                    STY.w $075F               ;/Store zero to current world
CODE_04C034:        LDA.w $C11C,y             ;\Load indexes to the level number table
                    CLC                       ; |clear carry flag
                    ADC.w $0760               ; |add current level to it
                    TAY                       ; |use it as index
                    LDA.w $C124,y             ;\|Load the level number
                    PLB                       ; |return it
                    RTL                       ;/

CODE_04C041:        PHB                       ;\
                    PHK                       ; |Setup program bank.
                    PLB                       ;/
                    STZ.b $BA                 ;Store zero to current bg palette and music
                    LDA.w $0750               ;\Load level number
                    AND.b #$60                ; |
                    ASL   A                   ; |Make bit 5 and 6 of the level number
                    ROL   A                   ; |into bit 0 and 1.
                    ROL   A                   ; |Values range from 0-3
                    ROL   A                   ; |Store into map type
                    STA.b $5C                 ;/(00 underwater, 01 ground, 02 underground, 03 castle)
                    TAY                       ;Transfer A to Y to use it as an index.
                    LDA.w $0750               ;\Load level number again
                    AND.b #$1F                ; |AND with $1F to get the level number WITHOUT map type
                    STA.w $074F               ;/Store into a RAM address to hold it.
                    LDA.w $C148,y             ;\ 
                    CLC                       ; |Load the map type offsets
                    ADC.w $074F               ; |Add the offsets with level number
                    TAY                       ;/| Use it as an index again...
                    LDA.w $C14C,y             ;\|
                    STA.b $FD                 ; |Load pointers to enemy data
                    LDA.w $C16E,y             ; |in $FD-$FF
                    STA.b $FE                 ; |
                    LDA.b #$04                ; |$FF is a constant: #$04
                    STA.b $FF                 ;/
                    LDY.b $5C                 ;\Load map type again
                    LDA.w $C190,y             ; |
                    CLC                       ; |Load something again
                    ADC.w $074F               ; |add the level number to it
                    TAY                       ; |Use it as an index
                    STA.b $DB                 ;/Store it in the layer 2 background.
                    CMP.b #$1C                ;\If it is a castle, change BG palette and music to
                    BCS   CODE_04C08C         ;/Black and Castle (Also changes ground tileset) ($03)
                    CMP.b #$19                ;\If it is an underground (bonus room),change BG palette and music to
                    BCS   CODE_04C08E         ;/Black and underground ($02)
                    CMP.b #$03                ;\If it is any minor background, change BG palette and music to
                    BCS   CODE_04C090         ;/Light Blue and ground ($01)
                    CMP.b #$02                ;\If it is any underwater stage, change BG palette and music to
                    BCC   CODE_04C092         ;/Light Blue and Underwater ($00)
CODE_04C08C:        INC.b $BA                 ;\
CODE_04C08E:        INC.b $BA                 ; |Set BG palette and music
CODE_04C090:        INC.b $BA                 ;/
CODE_04C092:        LDA.w $C194,y             ;\
                    STA.b $FA                 ; |
                    LDA.w $C1B6,y             ; |Setup the pointer of the level header
                    STA.b $FB                 ; |and the level object data.
                    LDA.b #$04                ; |24-bits pointer at $FA
                    STA.b $FC                 ;/ Bank is constant: $04
                    LDY.b #$00                ;\
                    LDA.b [$FA],y             ; |Load level haeder
                    PHA                       ;/ Push it into A
                    AND.b #$07                ;\Get the background bits.
                    CMP.b #$04                ; |If it is 04 or smaller
                    BCC   CODE_04C0B2         ;/ Branch
                    AND.b #$04                ;\Filter bit 2
                    STA.w $0744               ;/Store into "BG is lower than 3" flag
                    LDA.b #$00                ;\
CODE_04C0B2:        STA.w $0741               ;/If BG is lower than 3, use nothing for layer 1 background
                    PLA                       ;\Pull level header's first byte
                    PHA                       ;/...then push it again.
                    AND.b #$38                ;\Filter Mario's starting Y position
                    LSR   A                   ; |
                    LSR   A                   ; |>> 3
                    LSR   A                   ; |so the value is between 0-7 instead of whatever.
                    STA.w $0710               ;/Store into Mario's starting position.
                    PLA                       ;Pull level header again.
                    AND.b #$C0                ;Filter the time bits.
                    CLC                       ;\Clear carry flag
                    ROL   A                   ; |<<3 so the value is between 0-3.
                    ROL   A                   ; |
                    ROL   A                   ; |Store into starting timer
                    STA.w $0715               ;/
                    INY                       ;Increase Y.
                    LDA.b [$FA],y             ;Load level header byte 2.
                    PHA                       ;Push it into A.
                    AND.b #$0F                ;\Filter floor set
                    STA.w $0727               ;/Store it into Floor Set RAM address
                    PLA                       ;Pull A
                    PHA                       ;Push A
                    AND.b #$30                ;\Filter ground set and palette bits
                    LSR   A                   ; |
                    LSR   A                   ; |>>4 so that the value ranges from 00-03
                    LSR   A                   ; |
                    LSR   A                   ; |
                    CMP.b #$01                ;/
                    BNE   CODE_04C0E0         ;(If the result is not 01 (Orange and mushroom)
                    LDA.b #$00                ;\and unnecessary LDA.
CODE_04C0E0:        STA.w $0742               ;/Store bits into ground set and palette RAM address.
                    PLA                       ;\Pull level header byte 2 from the stack.
                    AND.b #$C0                ; |
                    CLC                       ; |Filter ground set
                    ROL   A                   ; |make the last 2 bits the first 2 bits.
                    ROL   A                   ; |
                    ROL   A                   ; |
                    CMP.b #$03                ; |If ground set is clouds, branch.
                    BNE   CODE_04C0F3         ;/
                    STA.w $0743               ;Store bits into "Cloud terrain type override flag"
                    LDA.b #$00                ;\set ground set to none, if ground set is clouds
CODE_04C0F3:        STA.w $0733               ;/otherwise store as normal.
                    JSR.w CODE_04C10B         ;Handle vine growing in the start of level?
                    LDA.b $FA                 ;\
                    CLC                       ; |
                    ADC.b #$02                ; |Increase the pointer by 2 so we don't
                    STA.b $FA                 ; |need to bother with Y indexing later.
                    LDA.b $FB                 ; |
                    ADC.b #$00                ; |
                    STA.b $FB                 ;/
                    STZ.w $0EE8               ;Store zero to "Counter for the screen's X-pos in 16x16"
                    PLB                       ;Pull program bank
                    RTL                       ;And return

CODE_04C10B:        LDA.w $0743               ;if cloud terrain type override flag is set
                    BNE   CODE_04C116         ;branch.
                    LDA.b $DB                 ;\
                    CMP.b #$12                ; |If layer 2 background is not "Mushrooms"
                    BNE   CODE_04C11B         ;/ Return.
CODE_04C116:        LDA.b #$01                ;\Grow a vine in the start of level flag?
                    STA.w $0236               ;/
CODE_04C11B:        RTS                       ;

                    db $00,$05,$0A,$0E,$13,$17,$1B,$20 ; "Levels per world". Actually indexes to the next tables

                    db $25,$29,$C0,$26,$60             ; "World 1 Levels" They get stored in $7E:0750

                    db $28,$29,$01,$27,$62             ; "World 2 Levels"

                    db $24,$35,$20,$63                 ; "World 3 Levels"

                    db $22,$29,$41,$2C,$61             ; "World 4 Levels"

                    db $2A,$31,$26,$62                 ; "World 5 Levels"

                    db $2E,$23,$2D,$60                 ; "World 6 Levels"

                    db $33,$29,$01,$27,$64             ; "World 7 Levels"

                    db $30,$32,$21,$65                 ; "World 8 Levels"

                    db $1F,$06,$1C,$00                 ; "Map type offsets"

                    db $D8,$FF,$18,$47,$72,$87         ; The castle levels sprites offset low

                    db $C1,$E6,$03,$11,$38,$69,$87,$A4 ; The grassland levels sprites offset low
                    db $B9,$E3,$E4,$08,$11,$36,$59,$62
                    db $63,$9D,$C8,$F6,$12,$1B

                    db $40,$6D,$9B                     ; The underground levels sprites offset low

                    db $C8,$D9,$03                     ; The underwater levels sprites offset low

                    db $C1,$C1,$C2,$C2,$C2,$C2,$C2,$C2 ; Enemy address high bytes
                    db $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
                    db $C3,$C4,$C4,$C4,$C4,$C4,$C4,$C4
                    db $C4,$C4,$C5,$C5,$C5,$C5,$C5,$C5
                    db $C5,$C6

                    db $00,$03,$19,$1C                 ; indexes to the next 4 types tables

                    db $08,$71,$0D                     ; The Underwater levels objects offset low

                    db $0B,$74,$C3,$1B,$B0,$2F,$9A,$F1 ; The grassland levels objects offset low
                    db $7A,$E7,$F1,$35,$4A,$BB,$28,$A3
                    db $D5,$6D,$EB,$6B,$CA,$F5

                    db $2D,$D2,$76                     ; The underground levels objects offset low

                    db $17,$D2,$FA,$D8,$D4,$01         ; The castle levels objects offset low

                    db $D6,$D6,$D7,$CC,$CC,$CC,$CD,$CD ; Objects address high bytes
                    db $CE,$CE,$CE,$CF,$CF,$CF,$D0,$D0
                    db $D0,$D1,$D1,$D1,$D2,$D2,$D3,$D3
                    db $D3,$D4,$D4,$D5,$C6,$C6,$C7,$C8
                    db $C9,$CB

;SMB1 LEVEL SPRITE DATA. Ends with FF.

                    db $76,$DD,$BB,$4C,$EA,$1D,$1B,$CC          ; 1-4 & 6-4, Level #60
                    db $56,$5D,$16,$9D,$C6,$1D,$36,$9D
                    db $C9,$1D,$04,$DB,$49,$1D,$84,$1B
                    db $C9,$5D,$88,$95,$0F,$08,$30,$4C
                    db $78,$2D,$A6,$28,$90,$B5,$FF

                    db $0F,$03,$56,$1B,$C9,$1B,$0F,$07          ; 4-4, Level #61
                    db $36,$1B,$AA,$1B,$48,$95,$0F,$0A
                    db $2A,$1B,$5B,$0C,$78,$2D,$90,$B5
                    db $FF

                    db $0B,$8C,$4B,$4C,$77,$5F,$EB,$0C          ; 2-4, Level #62
                    db $BD,$DB,$19,$9D,$75,$1D,$7D,$5B
                    db $D9,$1D,$3D,$DD,$99,$1D,$26,$9D
                    db $5A,$2B,$8A,$2C,$CA,$1B,$20,$95
                    db $7B,$5C,$DB,$4C,$1B,$CC,$3B,$CC
                    db $78,$2D,$A6,$28,$90,$B5,$FF

                    db $0B,$8C,$3B,$1D,$8B,$1D,$AB,$0C          ; 3-4, Level #63
                    db $DB,$1D,$0F,$03,$65,$1D,$6B,$1B
                    db $05,$9D,$0B,$1B,$05,$9B,$0B,$1D
                    db $8B,$0C,$1B,$8C,$70,$15,$7B,$0C
                    db $DB,$0C,$0F,$08,$78,$2D,$A6,$28
                    db $90,$B5,$FF

                    db $27,$A9,$4B,$0C,$68,$29,$0F,$06          ; 7-4, Level #64
                    db $77,$1B,$0F,$0B,$60,$15,$4B,$8C
                    db $78,$2D,$90,$B5,$FF

                    db $0F,$03,$8E,$65,$E1,$BB,$38,$6C          ; 8-4, Level #65
                    db $A8,$3E,$E5,$E7,$0F,$08,$0B,$02
                    db $2B,$02,$5E,$65,$E1,$BB,$0E,$DB
                    db $0E,$BB,$8E,$DB,$0E,$FE,$65,$EC
                    db $0F,$0D,$4E,$65,$E1,$0F,$0E,$4E
                    db $02,$E0,$0F,$10,$FE,$E5,$E1,$1B
                    db $85,$7B,$0C,$5B,$95,$78,$2D,$D0
                    db $B5,$FF

                    db $A5,$86,$E4,$28,$18,$A8,$45,$83          ; 3-3, Level #20
                    db $69,$03,$C6,$29,$9B,$83,$16,$A4
                    db $88,$24,$E9,$28,$05,$A8,$7B,$28
                    db $24,$8F,$C8,$03,$E8,$03,$46,$A8
                    db $85,$24,$C8,$24,$FF

                    db $EB,$8E,$0F,$03,$FB,$05,$17,$85          ; 8-3, Level #21
                    db $DB,$8E,$0F,$07,$57,$05,$7B,$05
                    db $9B,$80,$2B,$85,$FB,$05,$0F,$0B
                    db $1B,$05,$9B,$05,$FF

                    db $2E,$C2,$66,$E2,$11,$0F,$07,$02          ; 4-1, Level #22
                    db $11,$0F,$0C,$12,$11,$FF

                    db $0E,$C2,$A8,$AB,$00,$BB,$8E,$6B          ; 6-2, Level #23
                    db $82,$DE,$00,$A0,$33,$86,$43,$06
                    db $3E,$B4,$A0,$CB,$02,$0F,$07,$7E
                    db $42,$A6,$83,$02,$0F,$0A,$3B,$02
                    db $CB,$37,$0F,$0C,$E3,$0E,$FF

                    db $9B,$8E,$CA,$0E,$EE,$42,$44,$5B          ; 3-1, Level #24
                    db $86,$80,$B8,$1B,$80,$50,$BA,$10
                    db $B7,$5B,$00,$17,$85,$4B,$05,$FE
                    db $34,$40,$B7,$86,$C6,$06,$5B,$80
                    db $83,$00,$D0,$38,$5B,$8E,$8A,$0E
                    db $A6,$00,$BB,$0E,$C5,$80,$F3,$00
                    db $FF

                    db $1E,$C2,$00,$6B,$06,$8B,$86,$63          ; 1-1, Level #25
                    db $B7,$0F,$05,$03,$06,$23,$06,$4B
                    db $B7,$BB,$00,$5B,$B7,$FB,$37,$3B
                    db $B7,$0F,$0B,$1B,$37,$FF

                    db $2B,$D7,$E3,$03,$C2,$86,$E2,$06          ; 1-3 & 5-3, Level #26
                    db $76,$A5,$A3,$8F,$03,$86,$2B,$57
                    db $68,$28,$E9,$28,$E5,$83,$24,$8F
                    db $36,$A8,$5B,$03,$FF

                    db $0F,$02,$78,$40,$48,$CE,$F8,$C3          ; 2-3 & 7-3, Level #27
                    db $F8,$C3,$0F,$07,$7B,$43,$C6,$D0
                    db $0F,$8A,$C8,$50,$FF

                    db $85,$86,$0B,$80,$1B,$00,$DB,$37          ; 2-1, Level #28
                    db $77,$80,$EB,$37,$FE,$2B,$20,$2B
                    db $80,$7B,$38,$AB,$B8,$77,$86,$FE
                    db $42,$20,$49,$86,$8B,$06,$9B,$80
                    db $7B,$8E,$5B,$B7,$9B,$0E,$BB,$0E
                    db $9B,$80,$FF

                    db $0B,$80,$60,$38,$10,$B8,$C0,$3B          ; 5-1, Level #2A
                    db $DB,$8E,$40,$B8,$F0,$38,$7B,$8E
                    db $A0,$B8,$C0,$B8,$FB,$00,$A0,$B8
                    db $30,$BB,$EE,$42,$88,$0F,$0B,$2B
                    db $0E,$67,$0E,$FF

                    db $0A,$AA,$0E,$28,$2A,$0E,$31,$88          ; Sky Bonus Area (Day), Level #2B
                    db $FF

                    db $C7,$83,$D7,$03,$42,$8F,$7A,$03          ; 4-3, Level #2C
                    db $05,$A4,$78,$24,$A6,$25,$E4,$25
                    db $4B,$83,$E3,$03,$05,$A4,$89,$24
                    db $B5,$24,$09,$A4,$65,$24,$C9,$24
                    db $0F,$08,$85,$25,$FF

                    db $CC,$A5,$B5,$A8,$07,$A8,$76,$28          ; 6-3, Level #2D
                    db $CC,$25,$65,$A4,$A9,$24,$E5,$24
                    db $19,$A4,$0F,$07,$95,$28,$E6,$24
                    db $19,$A4,$D7,$29,$16,$A9,$58,$29
                    db $97,$29,$FF

                    db $0F,$02,$02,$11,$0F,$07,$02,$11          ; 6-1, Level #2E
                    db $FF

                    db $FF                        ; 4-2 Warp Zone, Level #2F

                    db $2B,$82,$AB,$38,$DE,$42,$E2,$1B          ; 8-1, Level #30
                    db $86,$EB,$3B,$DB,$80,$8B,$B8,$1B
                    db $82,$FB,$B8,$7B,$80,$FB,$3C,$5B
                    db $80,$7B,$B8,$1B,$8E,$CB,$0E,$1B
                    db $8E,$0F,$0D,$2B,$3B,$BB,$B8,$EB
                    db $82,$4B,$B8,$BB,$38,$3B,$B7,$BB
                    db $02,$0F,$13,$1B,$00,$CB,$80,$6B
                    db $BC,$FF

                    db $7B,$80,$AE,$00,$80,$8B,$8E,$E8          ; 5-2, Level #31
                    db $05,$F9,$86,$17,$86,$16,$85,$4E
                    db $2B,$80,$AB,$8E,$87,$85,$C3,$05
                    db $8B,$82,$9B,$02,$AB,$02,$BB,$86
                    db $CB,$06,$D3,$03,$3B,$8E,$6B,$0E
                    db $A7,$8E,$FF

                    db $29,$8E,$52,$11,$83,$0E,$0F,$03          ; 8-2, Level #32
                    db $9B,$0E,$2B,$8E,$5B,$0E,$CB,$8E
                    db $FB,$0E,$FB,$82,$9B,$82,$BB,$02
                    db $FE,$42,$E8,$BB,$8E,$0F,$0A,$AB
                    db $0E,$CB,$0E,$F9,$0E,$88,$86,$A6
                    db $06,$DB,$02,$B6,$8E,$FF

                    db $AB,$CE,$DE,$42,$C0,$CB,$CE,$5B          ; 7-1, Level #33
                    db $8E,$1B,$CE,$4B,$85,$67,$45,$0F
                    db $07,$2B,$00,$7B,$85,$97,$05,$0F
                    db $0A,$92,$02,$FF

                    db $0A,$AA,$0E,$24,$4A,$1E,$23,$AA          ; Sky Bonus Area (Night), Level #34
                    db $FF

                    db $1B,$80,$BB,$38,$4B,$BC,$EB,$3B          ; 3-2, Level #35
                    db $0F,$04,$2B,$00,$AB,$38,$EB,$00
                    db $CB,$8E,$FB,$80,$AB,$B8,$6B,$80
                    db $FB,$3C,$9B,$BB,$5B,$BC,$FB,$00
                    db $6B,$B8,$FB,$38,$FF

                    db $0B,$86,$1A,$06,$DB,$06,$DE,$C2          ; 1-2, Level #C0
                    db $02,$F0,$3B,$BB,$80,$EB,$06,$0B
                    db $86,$93,$06,$F0,$39,$0F,$06,$60
                    db $B8,$1B,$86,$A0,$B9,$B7,$27,$BD
                    db $27,$2B,$83,$A1,$26,$A9,$26,$EE
                    db $25,$0B,$27,$B4,$FF

                    db $0F,$02,$1E,$2F,$60,$E0,$3A          ; 4-2, Level #C1
                    db $A5,$A7,$DB,$80,$3B,$82,$8B,$02
                    db $FE,$42,$68,$70,$BB,$25,$A7,$2C
                    db $27,$B2,$26,$B9,$26,$9B,$80,$A8
                    db $82,$B5,$27,$BC,$27,$B0,$BB,$3B
                    db $82,$87,$34,$EE,$25,$6B,$FF

                    db $1E,$A5,$0A,$2E,$28,$27,$2E,$33          ; Underground Bonus Area, Level #C2
                    db $C7,$0F,$03,$1E,$40,$07,$2E,$30
                    db $E7,$0F,$05,$1E,$24,$44,$0F,$07
                    db $1E,$22,$6A,$2E,$23,$AB,$0F,$09
                    db $1E,$41,$68,$1E,$2A,$8A,$2E,$23
                    db $A2,$2E,$32,$EA,$FF

                    db $3B,$87,$66,$27,$CC,$27,$EE,$31          ; Underwater Bonus Area, Level #00
                    db $87,$EE,$23,$A7,$3B,$87,$DB,$07
                    db $FF

                    db $0F,$01,$2E,$25,$2B,$2E,$25,$4B          ; 2-2 & 7-2, Level #01
                    db $4E,$25,$CB,$6B,$07,$97,$47,$E9
                    db $87,$47,$C7,$7A,$07,$D6,$C7,$78
                    db $07,$38,$87,$AB,$47,$E3,$07,$9B
                    db $87,$0F,$09,$68,$47,$DB,$C7,$3B
                    db $C7,$FF

                    db $47,$9B,$CB,$07,$FA,$1D,$86,$9B          ; 8-4 Underwater, Level #02
                    db $3A,$87,$56,$07,$88,$1B,$07,$9D
                    db $2E,$65,$F0,$FF

;SMB1 LEVEL OBJECT DATA. Ends with FD.
 
                    db $9B,$07,$0F,$52,$32,$0F,$63,$32 ; 1-4 & 6-4, Level #60
                    db $0F,$74,$32,$CF,$80,$36,$CE,$03
                    db $DC,$51,$EE,$07,$FF,$80,$38,$7F
                    db $30,$B4,$74,$0A,$7E,$06,$7F,$20
                    db $34,$9F,$80,$36,$9E,$0A,$CE,$06
                    db $DF,$80,$38,$E4,$00,$E8,$0A,$FF
                    db $80,$36,$FE,$0A,$2E,$89,$3F,$70
                    db $38,$4E,$0B,$5F,$10,$34,$54,$0A
                    db $14,$8A,$C4,$0A,$34,$8A,$7F,$71
                    db $3A,$7F,$20,$34,$7E,$06,$C7,$0A
                    db $0F,$10,$B4,$02,$0A,$47,$0A,$8F
                    db $10,$34,$82,$0A,$C7,$0A,$0E,$87
                    db $1F,$10,$34,$7F,$20,$34,$7F,$A1
                    db $3A,$7F,$80,$36,$7E,$02,$A7,$02
                    db $B3,$02,$D7,$02,$E3,$02,$07,$82
                    db $13,$02,$3E,$06,$3F,$A1,$3C,$4F
                    db $80,$38,$7F,$A1,$3A,$7F,$80,$36
                    db $7E,$02,$AE,$07,$AF,$A1,$3C,$BF
                    db $80,$38,$BF,$10,$34,$FE,$0A,$FF
                    db $20,$34,$FF,$80,$36,$0D,$C4,$CD
                    db $43,$CE,$09,$DE,$0B,$DF,$70,$38
                    db $DD,$42,$EF,$20,$34,$FF,$20,$34
                    db $FF,$A1,$3A,$FF,$70,$36,$FE,$02
                    db $5D,$C7,$FD

                    db $5B,$07,$0F,$52,$32,$0F,$63,$32 ; 4-4, Level #61
                    db $0F,$74,$32,$5E,$0A,$5F,$20,$34
                    db $6F,$80,$36,$68,$64,$9F,$80,$38
                    db $AF,$80,$36,$CE,$06,$DF,$80,$38
                    db $FF,$A1,$3A,$FF,$80,$36,$FE,$02
                    db $0D,$01,$1E,$0E,$24,$63,$34,$63
                    db $44,$63,$54,$63,$64,$63,$74,$63
                    db $7E,$02,$94,$63,$B4,$63,$D4,$63
                    db $F4,$63,$14,$E3,$2E,$0E,$34,$63
                    db $44,$63,$54,$63,$5E,$02,$64,$35
                    db $88,$72,$BE,$0E,$C4,$63,$D4,$63
                    db $E4,$63,$F4,$63,$04,$E3,$14,$63
                    db $24,$63,$34,$63,$44,$63,$54,$63
                    db $64,$63,$74,$63,$84,$63,$94,$63
                    db $A4,$63,$B4,$63,$C4,$63,$D4,$63
                    db $E4,$63,$F4,$63,$0D,$04,$04,$63
                    db $14,$63,$24,$63,$34,$63,$44,$63
                    db $54,$63,$64,$63,$74,$63,$84,$63
                    db $94,$63,$A4,$63,$AE,$02,$CE,$08
                    db $CF,$A1,$3C,$CD,$4B,$DF,$10,$34
                    db $DF,$80,$38,$FF,$A1,$3A,$FF,$80
                    db $36,$FF,$20,$34,$FE,$02,$0D,$05
                    db $68,$31,$7E,$0A,$7F,$B0,$36,$96
                    db $31,$A9,$63,$A8,$33,$D5,$30,$EE
                    db $02,$E6,$62,$F4,$61,$FF,$B0,$38
                    db $04,$B1,$08,$3F,$44,$33,$94,$63
                    db $A4,$31,$E4,$31,$04,$BF,$08,$3F
                    db $04,$BF,$08,$3F,$CD,$4B,$03,$E4
                    db $0E,$03,$1F,$10,$34,$2E,$01,$2F
                    db $10,$34,$7E,$06,$7F,$A1,$3C,$8F
                    db $00,$34,$8F,$80,$38,$BE,$02,$BF
                    db $A1,$3A,$BF,$80,$36,$DE,$06,$DF
                    db $A1,$3C,$EF,$80,$38,$FE,$0A,$FF
                    db $80,$36,$0D,$C4,$CD,$43,$CE,$09
                    db $DF,$70,$38,$DE,$0B,$DD,$42,$EF
                    db $20,$34,$FF,$20,$34,$FE,$02,$FF
                    db $A1,$3A,$FF,$70,$36,$5D,$C7,$FD

                    db $9B,$07,$0F,$52,$32,$0F,$63,$32 ; 2-4 & 5-4, Level #62
                    db $0F,$74,$32,$FF,$80,$36,$FF,$00
                    db $34,$FE,$00,$27,$B1,$65,$32,$75
                    db $0A,$71,$00,$B7,$31,$0F,$80,$B8
                    db $1F,$A1,$3A,$1F,$80,$36,$1E,$04
                    db $2F,$00,$34,$57,$3B,$BB,$0A,$17
                    db $8A,$27,$3A,$6F,$30,$34,$73,$0A
                    db $7B,$0A,$D7,$0A,$E7,$3A,$3B,$8A
                    db $97,$0A,$FE,$08,$FF,$A1,$3C,$0F
                    db $80,$B8,$24,$0A,$2E,$00,$2F,$10
                    db $34,$3E,$40,$3F,$80,$36,$38,$64
                    db $6F,$F0,$00,$9F,$F0,$00,$BE,$43
                    db $C8,$0A,$CF,$80,$38,$CE,$07,$DF
                    db $10,$34,$FE,$07,$2E,$81,$2F,$10
                    db $34,$2F,$A1,$3A,$2F,$80,$36,$66
                    db $42,$6A,$42,$79,$0A,$BE,$00,$BF
                    db $B0,$36,$C8,$64,$F8,$64,$FF,$80
                    db $38,$0F,$80,$B6,$08,$64,$2E,$07
                    db $3F,$10,$34,$3F,$80,$38,$7F,$A1
                    db $3A,$7F,$80,$36,$7E,$03,$9E,$07
                    db $9F,$A1,$3C,$AF,$80,$38,$BF,$A1
                    db $3A,$BF,$80,$36,$BE,$03,$DE,$07
                    db $DF,$A1,$3C,$EF,$80,$38,$FE,$0A
                    db $FF,$20,$34,$FF,$80,$36,$03,$A5
                    db $0D,$44,$CD,$43,$CE,$09,$DF,$70
                    db $38,$DD,$42,$DE,$0B,$EF,$20,$34
                    db $FE,$02,$FF,$20,$34,$FF,$A1,$3A
                    db $FF,$70,$36,$5D,$C7,$FD

                    db $9B,$07,$0F,$52,$32,$0F,$63,$32 ; 3-4, Level #63
                    db $0F,$74,$32,$FF,$20,$34,$FF,$80
                    db $36,$FE,$06,$0C,$81,$0C,$51,$2F
                    db $80,$38,$39,$0A,$4F,$80,$36,$5C
                    db $01,$5C,$51,$7F,$80,$38,$89,$0A
                    db $9F,$80,$36,$AC,$01,$AC,$51,$CF
                    db $80,$38,$D9,$0A,$EF,$80,$36,$FC
                    db $01,$FC,$51,$1F,$80,$B8,$2E,$03
                    db $3F,$10,$34,$3F,$A1,$3A,$3F,$80
                    db $36,$A7,$01,$B7,$00,$C7,$01,$DF
                    db $20,$34,$DF,$B0,$36,$DE,$0A,$FE
                    db $02,$0F,$B0,$B8,$4E,$03,$5F,$10
                    db $34,$5F,$A2,$34,$63,$0A,$69,$0A
                    db $7E,$02,$7F,$20,$34,$EE,$03,$FF
                    db $10,$34,$FF,$A2,$34,$03,$8A,$09
                    db $0A,$1E,$02,$1F,$20,$34,$EE,$03
                    db $FF,$10,$34,$FF,$A2,$34,$03,$8A
                    db $09,$0A,$14,$42,$1E,$02,$1F,$20
                    db $34,$7F,$B0,$36,$7E,$0A,$9E,$07
                    db $AF,$20,$34,$AF,$80,$38,$FE,$0A
                    db $FF,$20,$34,$FF,$80,$36,$2E,$86
                    db $3F,$80,$38,$5E,$0A,$5F,$80,$36
                    db $8E,$06,$9F,$80,$38,$BE,$0A,$BF
                    db $80,$36,$EE,$07,$EF,$80,$38,$FF
                    db $10,$34,$3E,$83,$3F,$A1,$3A,$3F
                    db $80,$36,$5E,$07,$5F,$A1,$3C,$6F
                    db $80,$38,$FE,$0A,$FF,$20,$34,$FF
                    db $80,$36,$0D,$C4,$41,$52,$51,$52
                    db $CD,$43,$CE,$09,$DF,$70,$38,$DE
                    db $0B,$DD,$42,$EF,$20,$34,$FE,$02
                    db $FF,$20,$34,$FF,$A1,$3A,$FF,$70
                    db $36,$5D,$C7,$FD

                    db $5B,$07,$0F,$52,$32,$0F,$63,$32 ; 7-4, Level #64
                    db $0F,$74,$32,$FE,$0A,$FF,$20,$34
                    db $FF,$80,$36,$AE,$86,$BF,$80,$38
                    db $BE,$07,$CF,$20,$34,$FF,$20,$34
                    db $FF,$A1,$3A,$FF,$80,$36,$FE,$02
                    db $0D,$02,$27,$32,$46,$61,$55,$62
                    db $5E,$0E,$64,$39,$65,$39,$66,$39
                    db $67,$39,$04,$E3,$1E,$02,$14,$63
                    db $68,$3C,$74,$3A,$7D,$4B,$5E,$8E
                    db $64,$39,$65,$39,$66,$39,$67,$39
                    db $7D,$4B,$04,$B7,$05,$37,$06,$37
                    db $07,$37,$7E,$02,$84,$62,$94,$61
                    db $A4,$31,$BD,$4B,$CE,$06,$CF,$A1
                    db $3C,$DF,$80,$38,$FF,$A1,$3A,$FF
                    db $80,$36,$FE,$02,$0D,$06,$34,$31
                    db $3E,$0A,$3F,$B0,$36,$64,$32,$75
                    db $0A,$7B,$61,$A4,$33,$AE,$02,$BF
                    db $B0,$38,$DE,$0E,$E4,$35,$E5,$35
                    db $E6,$35,$E7,$35,$3E,$82,$64,$32
                    db $78,$32,$B4,$36,$C8,$36,$DD,$4B
                    db $44,$B2,$58,$32,$94,$63,$A4,$3E
                    db $BA,$30,$C9,$61,$CE,$06,$CF,$A1
                    db $3C,$DF,$80,$38,$DD,$4B,$CE,$86
                    db $DD,$4B,$FE,$02,$FF,$A1,$3A,$FF
                    db $80,$36,$2E,$86,$2F,$A1,$3C,$3F
                    db $80,$38,$5E,$02,$5F,$A1,$3A,$5F
                    db $80,$36,$7E,$06,$7F,$A1,$3C,$8F
                    db $80,$38,$FE,$02,$FF,$A1,$3A,$FF
                    db $80,$36,$1E,$86,$1F,$A1,$3C,$2F
                    db $80,$38,$3E,$02,$3F,$A1,$3A,$3F
                    db $80,$36,$5E,$06,$5F,$A1,$3C,$6F
                    db $80,$38,$7E,$02,$7F,$A1,$3A,$7F
                    db $80,$36,$9E,$06,$9F,$A1,$3C,$AF
                    db $80,$38,$FE,$0A,$FF,$80,$36,$0D
                    db $C4,$CD,$43,$CE,$09,$DE,$0B,$DD
                    db $42,$DF,$70,$38,$EF,$20,$34,$FE
                    db $02,$FF,$20,$34,$FF,$A1,$3A,$FF
                    db $70,$36,$5D,$C7,$FD

                    db $5B,$06,$0F,$52,$32,$0F,$63,$32 ; 8-4, Level #65
                    db $0F,$74,$32,$5F,$80,$36,$5E,$0A
                    db $BF,$B0,$38,$BE,$02,$0D,$01,$2F
                    db $B0,$36,$39,$73,$5F,$B0,$38,$0D
                    db $03,$2F,$B0,$36,$39,$7B,$4D,$4B
                    db $5F,$B0,$38,$DE,$06,$DF,$A1,$3C
                    db $EF,$80,$38,$1F,$80,$B6,$1E,$0A
                    db $AE,$06,$BF,$80,$38,$C4,$33,$0F
                    db $80,$B6,$16,$7E,$3F,$80,$38,$9F
                    db $80,$36,$A5,$77,$CF,$80,$38,$FF
                    db $A1,$3A,$FF,$80,$36,$FE,$02,$FE
                    db $82,$0D,$07,$2F,$B0,$36,$39,$73
                    db $5F,$B0,$38,$9F,$B0,$36,$A8,$74
                    db $CF,$B0,$38,$ED,$4B,$3F,$B0,$B6
                    db $49,$7B,$6F,$B0,$38,$DF,$B0,$36
                    db $E8,$74,$FE,$0A,$2E,$82,$2F,$B0
                    db $38,$67,$02,$84,$7A,$87,$31,$0D
                    db $0B,$FE,$02,$0D,$0C,$2F,$B0,$36
                    db $39,$73,$5E,$06,$5F,$A1,$3C,$5F
                    db $B0,$38,$6F,$80,$38,$BF,$80,$36
                    db $C6,$76,$EF,$80,$38,$3F,$80,$B6
                    db $45,$7F,$6F,$80,$38,$BF,$80,$36
                    db $BE,$0A,$DD,$48,$FE,$06,$0F,$80
                    db $B8,$3D,$4B,$3F,$80,$36,$46,$7E
                    db $6F,$80,$38,$AD,$4A,$FF,$A1,$BA
                    db $FF,$80,$36,$FE,$02,$2F,$B0,$B6
                    db $39,$73,$5F,$B0,$38,$9F,$B0,$36
                    db $A9,$7B,$CF,$B0,$38,$4E,$8A,$4F
                    db $B0,$36,$9E,$07,$AF,$20,$34,$AF
                    db $80,$38,$FE,$0A,$FF,$20,$34,$FF
                    db $80,$36,$0D,$C4,$CD,$43,$CE,$09
                    db $DF,$70,$38,$DE,$0B,$DD,$42,$EF
                    db $20,$34,$FE,$02,$FF,$20,$34,$5D
                    db $C7,$FD

                    db $94,$11,$0F,$F6,$20,$FE,$10,$28 ; 3-3, Level #20
                    db $94,$65,$15,$EB,$12,$FA,$41,$4A
                    db $96,$54,$40,$A4,$42,$B7,$13,$E9
                    db $19,$F5,$15,$11,$80,$47,$42,$71
                    db $13,$80,$41,$15,$92,$1B,$1F,$24
                    db $40,$55,$12,$64,$40,$95,$12,$A4
                    db $40,$D2,$12,$E1,$40,$13,$C0,$2C
                    db $17,$2F,$F2,$10,$49,$13,$83,$40
                    db $9F,$F4,$10,$A3,$40,$17,$92,$83
                    db $13,$92,$41,$B9,$14,$C5,$12,$C8
                    db $40,$D4,$40,$4B,$92,$78,$1B,$9C
                    db $94,$9F,$F1,$10,$DF,$F4,$10,$FE
                    db $11,$7D,$C1,$9F,$F0,$20,$9D,$C7
                    db $FD

                    db $90,$B1,$0F,$F6,$20,$29,$91,$28 ; 8-3, Level #21
                    db $92,$57,$F3,$C3,$25,$C7,$27,$23
                    db $84,$33,$20,$5C,$01,$77,$63,$88
                    db $62,$99,$61,$AA,$60,$BC,$01,$69
                    db $91,$F8,$62,$D7,$E3,$E7,$63,$33
                    db $A7,$37,$27,$43,$04,$CC,$01,$E7
                    db $73,$0C,$81,$0D,$0A,$88,$72,$E7
                    db $87,$39,$E1,$4E,$00,$69,$60,$87
                    db $60,$A5,$60,$C3,$31,$FE,$31,$6D
                    db $C1,$8F,$F0,$20,$8D,$C7,$FD

                    db $52,$21,$0F,$F0,$20,$6E,$40,$58 ; 4-1, Level #22
                    db $F2,$93,$01,$97,$00,$0C,$81,$97
                    db $40,$A6,$41,$C7,$40,$0D,$04,$03
                    db $01,$07,$01,$23,$01,$27,$01,$EC
                    db $03,$AC,$F3,$C3,$03,$78,$E2,$94
                    db $43,$47,$F3,$74,$43,$47,$FB,$74
                    db $43,$2C,$F1,$4C,$63,$47,$00,$57
                    db $21,$5C,$01,$7C,$72,$39,$F1,$EC
                    db $02,$4C,$81,$D8,$62,$EC,$01,$0D
                    db $0D,$0F,$F8,$30,$C7,$07,$ED,$4A
                    db $1D,$C1,$5F,$F6,$20,$1D,$C7,$FD

                    db $54,$21,$0F,$F6,$20,$A7,$22,$37 ; 6-2, Level #23
                    db $FB,$73,$20,$83,$07,$87,$02,$93
                    db $20,$C7,$73,$04,$F1,$06,$31,$39
                    db $71,$59,$71,$E7,$73,$37,$A0,$47
                    db $04,$86,$7C,$E5,$71,$E7,$31,$33
                    db $A4,$39,$71,$A9,$71,$D3,$23,$08
                    db $F2,$13,$05,$27,$02,$49,$71,$75
                    db $75,$E8,$72,$67,$F3,$99,$71,$E7
                    db $20,$F4,$72,$F7,$31,$17,$A0,$33
                    db $20,$39,$71,$73,$28,$BC,$05,$39
                    db $F1,$79,$71,$A6,$21,$C3,$06,$D3
                    db $20,$DC,$00,$FC,$00,$07,$A2,$13
                    db $21,$5F,$F2,$30,$8C,$00,$98,$7A
                    db $C7,$63,$D9,$61,$03,$A2,$07,$22
                    db $74,$72,$77,$31,$E7,$73,$39,$F1
                    db $58,$72,$77,$73,$D8,$72,$7F,$F6
                    db $B0,$97,$73,$B6,$64,$C5,$65,$D4
                    db $66,$E3,$67,$F3,$67,$8D,$C1,$CF
                    db $F6,$20,$9D,$C7,$FD

                    db $52,$31,$0F,$F0,$20,$6E,$66,$07 ; 3-1, Level #24
                    db $81,$36,$01,$66,$00,$A7,$22,$08
                    db $F2,$67,$7B,$DC,$02,$98,$F2,$D7
                    db $20,$39,$F1,$9F,$F3,$30,$DC,$27
                    db $DC,$57,$23,$83,$57,$64,$6C,$51
                    db $87,$63,$99,$61,$A3,$06,$B3,$21
                    db $77,$F3,$F3,$21,$F7,$2A,$13,$81
                    db $23,$22,$53,$00,$63,$22,$E9,$0B
                    db $0C,$83,$13,$21,$16,$22,$33,$05
                    db $8F,$F5,$30,$8F,$90,$12,$EC,$01
                    db $63,$A0,$67,$20,$73,$01,$77,$01
                    db $83,$20,$87,$20,$B3,$20,$B7,$20
                    db $C3,$01,$C7,$00,$D3,$20,$D7,$20
                    db $67,$A0,$77,$07,$87,$22,$E8,$62
                    db $F5,$65,$1C,$82,$7F,$F8,$30,$8D
                    db $C1,$CF,$F6,$20,$8D,$C7,$FD

                    db $50,$21,$07,$81,$47,$24,$57,$00 ; 1-1, Level #25
                    db $63,$01,$77,$01,$C9,$71,$68,$F2
                    db $E7,$73,$97,$FB,$06,$83,$5C,$01
                    db $D7,$22,$E7,$00,$03,$A7,$6C,$02
                    db $B3,$22,$E3,$01,$E7,$07,$47,$A0
                    db $57,$06,$A7,$01,$D3,$00,$D7,$01
                    db $07,$81,$67,$20,$93,$22,$03,$A3
                    db $1C,$61,$17,$21,$6F,$F3,$30,$C7
                    db $63,$D8,$62,$E9,$61,$FA,$60,$4F
                    db $F3,$B0,$87,$63,$9C,$01,$B7,$63
                    db $C8,$62,$D9,$61,$EA,$60,$39,$F1
                    db $87,$21,$A7,$01,$B7,$20,$39,$F1
                    db $5F,$F8,$30,$6D,$C1,$AF,$F6,$20
                    db $7D,$C7,$FD

                    db $90,$11,$0F,$F6,$20,$FE,$10,$2A ; 1-3 & 5-3, Level #26
                    db $93,$87,$17,$A3,$14,$B2,$42,$0A
                    db $92,$19,$40,$36,$14,$50,$41,$82
                    db $16,$2B,$93,$24,$41,$BB,$14,$B8
                    db $00,$C2,$43,$C3,$13,$1B,$94,$67
                    db $12,$C4,$15,$53,$C1,$D2,$41,$12
                    db $C1,$29,$13,$85,$17,$1B,$92,$1A
                    db $42,$47,$13,$83,$41,$A7,$13,$0E
                    db $91,$A7,$63,$B7,$63,$C5,$65,$D5
                    db $65,$DD,$4A,$E3,$67,$F3,$67,$8D
                    db $C1,$AF,$F0,$20,$AD,$C7,$FD

                    db $90,$11,$0F,$F6,$20,$6E,$10,$8B ; 2-3 & 7-3, Level #27
                    db $17,$AF,$F2,$30,$D8,$62,$E8,$62
                    db $FC,$3F,$AD,$C8,$F8,$64,$0C,$BE
                    db $43,$43,$F8,$64,$0C,$BE,$73,$40
                    db $84,$40,$93,$40,$A4,$40,$B3,$40
                    db $F8,$64,$48,$E4,$5C,$39,$83,$40
                    db $92,$41,$B3,$40,$F8,$64,$48,$E4
                    db $5C,$39,$F8,$64,$13,$C2,$37,$65
                    db $4C,$24,$63,$00,$97,$65,$C3,$42
                    db $0B,$97,$AC,$32,$F8,$64,$0C,$BE
                    db $53,$45,$9D,$48,$F8,$64,$2A,$E2
                    db $3C,$47,$56,$43,$BA,$62,$F8,$64
                    db $0C,$B7,$88,$64,$BC,$31,$D4,$45
                    db $FC,$31,$3C,$B1,$78,$64,$8C,$38
                    db $0B,$9C,$1A,$33,$18,$61,$28,$61
                    db $39,$60,$5D,$4A,$EE,$11,$0F,$F8
                    db $B0,$1D,$C1,$3F,$F0,$20,$3D,$C7
                    db $FD

                    db $52,$31,$0F,$F0,$20,$6E,$40,$F7 ; 2-1, Level #28
                    db $20,$07,$84,$17,$20,$4F,$F4,$30
                    db $5F,$80,$12,$C3,$03,$C7,$02,$D3
                    db $22,$27,$E3,$39,$61,$E7,$73,$5C
                    db $E4,$57,$00,$6C,$73,$47,$A0,$53
                    db $06,$63,$22,$A7,$73,$FC,$73,$13
                    db $A1,$33,$05,$43,$21,$5C,$72,$C3
                    db $23,$CC,$03,$77,$FB,$AC,$02,$39
                    db $F1,$A7,$73,$D3,$04,$E8,$72,$E3
                    db $22,$26,$F4,$BC,$02,$8C,$81,$A8
                    db $62,$17,$87,$43,$24,$A7,$01,$C3
                    db $04,$08,$F2,$97,$21,$A3,$02,$C9
                    db $0B,$E1,$69,$F1,$69,$8D,$C1,$CF
                    db $F6,$20,$9D,$C7,$FD

                    db $38,$11,$0F,$F6,$20,$AD,$40,$3D ; Pipe entrance, Level #29
                    db $C7,$FD

                    db $95,$B1,$0F,$F6,$20,$0D,$02,$C8 ; 5-1, Level #2A
                    db $72,$1C,$81,$38,$72,$0D,$05,$97
                    db $34,$98,$62,$A3,$20,$B3,$06,$C3
                    db $20,$CC,$03,$F9,$91,$2C,$81,$48
                    db $62,$0D,$09,$37,$63,$47,$03,$57
                    db $21,$8C,$02,$C5,$79,$C7,$31,$F9
                    db $11,$39,$F1,$A9,$11,$6F,$F4,$B0
                    db $D3,$65,$E3,$65,$7D,$C1,$BF,$F6
                    db $20,$8D,$C7,$FD

                    db $00,$C1,$4C,$00,$F4,$4F,$0D,$02 ; Sky Bonus Area (Day), Level #2B
                    db $02,$42,$43,$4F,$52,$C2,$DE,$00
                    db $5A,$C2,$4D,$C7,$FD

                    db $90,$51,$0F,$F6,$20,$EE,$10,$0B ; 4-3, Level #2C
                    db $94,$33,$14,$42,$42,$77,$16,$86
                    db $44,$02,$92,$4A,$16,$69,$42,$73
                    db $14,$B0,$00,$C7,$12,$05,$C0,$1C
                    db $17,$1F,$F1,$10,$36,$12,$8F,$F4
                    db $10,$91,$40,$1B,$94,$35,$12,$34
                    db $42,$60,$42,$61,$12,$87,$12,$96
                    db $40,$A3,$14,$1C,$98,$1F,$F1,$10
                    db $47,$12,$9F,$F5,$10,$CC,$15,$CF
                    db $F1,$10,$05,$C0,$1F,$F5,$10,$39
                    db $12,$7C,$16,$7F,$F1,$10,$82,$40
                    db $98,$12,$DF,$F5,$10,$16,$C4,$17
                    db $14,$54,$12,$9B,$16,$28,$94,$CE
                    db $01,$3D,$C1,$5F,$F0,$20,$5D,$C7
                    db $FD

                    db $97,$11,$0F,$F6,$20,$FE,$10,$2B ; 6-3, Level #2D
                    db $92,$57,$12,$8B,$12,$C0,$41,$F7
                    db $13,$5B,$92,$69,$0B,$BB,$12,$B2
                    db $46,$19,$93,$71,$00,$17,$94,$7C
                    db $14,$7F,$F1,$10,$93,$41,$BF,$F5
                    db $10,$FC,$13,$FF,$F1,$10,$2F,$F5
                    db $90,$50,$42,$51,$12,$58,$14,$A6
                    db $12,$DB,$12,$1B,$93,$46,$43,$7B
                    db $12,$8D,$49,$B7,$14,$1B,$94,$49
                    db $0B,$BB,$12,$FC,$13,$FF,$F2,$10
                    db $03,$C1,$2F,$F5,$10,$43,$12,$4B
                    db $13,$77,$13,$9D,$4A,$15,$C1,$A1
                    db $41,$C3,$12,$FE,$01,$7D,$C1,$9F
                    db $F0,$20,$9D,$C7,$FD

                    db $52,$21,$0F,$F0,$20,$6E,$44,$0C ; 6-1, Level #2E
                    db $F1,$4C,$01,$AA,$35,$D9,$34,$EE
                    db $20,$08,$B3,$37,$32,$43,$04,$4E
                    db $21,$53,$20,$7C,$01,$97,$21,$B7
                    db $07,$9C,$81,$E7,$42,$5F,$F3,$B0
                    db $97,$63,$AC,$02,$C5,$41,$49,$E0
                    db $58,$61,$76,$64,$85,$65,$94,$66
                    db $A4,$22,$A6,$03,$C8,$22,$DC,$02
                    db $68,$F2,$96,$42,$13,$82,$17,$02
                    db $AF,$F4,$30,$F6,$21,$FC,$06,$26
                    db $80,$2A,$24,$36,$01,$8C,$00,$FF
                    db $F5,$30,$4E,$A0,$55,$21,$77,$20
                    db $87,$07,$89,$22,$AE,$21,$4C,$82
                    db $9F,$F4,$30,$EC,$01,$03,$E7,$13
                    db $67,$8D,$4A,$AD,$41,$EF,$F6,$20
                    db $BD,$C7,$FD

                    db $10,$51,$4C,$00,$C7,$12,$C6,$42 ; 4-2 Warpzone, Level #2F
                    db $03,$92,$02,$42,$29,$12,$63,$12
                    db $62,$42,$69,$14,$A5,$12,$A4,$42
                    db $E2,$14,$E1,$44,$F8,$16,$37,$C1
                    db $8F,$F8,$30,$02,$BB,$28,$7A,$68
                    db $7A,$A8,$7A,$E0,$6A,$F0,$6A,$6D
                    db $C5,$FD

                    db $92,$31,$0F,$F0,$20,$6E,$40,$0D ; 8-1, Level #30
                    db $02,$37,$73,$EC,$00,$0C,$80,$3C
                    db $00,$6C,$00,$9C,$00,$06,$C0,$C7
                    db $73,$06,$83,$28,$72,$96,$40,$E7
                    db $73,$26,$C0,$87,$7B,$D2,$41,$39
                    db $F1,$C8,$F2,$97,$E3,$A3,$23,$E7
                    db $02,$E3,$07,$F3,$22,$37,$E3,$9C
                    db $00,$BC,$00,$EC,$00,$0C,$80,$3C
                    db $00,$86,$21,$A6,$06,$B6,$24,$5C
                    db $80,$7C,$00,$9C,$00,$29,$E1,$DC
                    db $05,$F6,$41,$DC,$80,$E8,$72,$0C
                    db $81,$27,$73,$4C,$01,$66,$74,$0D
                    db $11,$3F,$F5,$30,$B6,$41,$2C,$82
                    db $36,$40,$7C,$02,$86,$40,$F9,$61
                    db $39,$E1,$AC,$04,$C6,$41,$0C,$83
                    db $16,$41,$88,$F2,$39,$F1,$7C,$00
                    db $89,$61,$9C,$00,$A7,$63,$BC,$00
                    db $C5,$65,$DC,$00,$E3,$67,$F3,$67
                    db $8D,$C1,$CF,$F6,$20,$8D,$C7,$FD

                    db $55,$B1,$0F,$F6,$20,$CF,$F3,$30 ; 5-2, Level #31
                    db $DF,$80,$12,$07,$B2,$15,$11,$52
                    db $42,$99,$0B,$AC,$02,$D3,$24,$D6
                    db $42,$D7,$25,$23,$84,$CF,$F3,$30
                    db $07,$E3,$19,$61,$78,$7A,$EF,$F3
                    db $30,$2C,$81,$46,$64,$55,$65,$65
                    db $65,$EC,$74,$47,$82,$53,$05,$63
                    db $21,$62,$41,$96,$22,$9A,$41,$CC
                    db $03,$B9,$91,$39,$F1,$63,$26,$67
                    db $27,$D3,$06,$FC,$01,$18,$E2,$D9
                    db $07,$E9,$04,$0C,$86,$37,$22,$93
                    db $24,$87,$84,$AC,$02,$C2,$41,$C3
                    db $23,$D9,$71,$FC,$01,$7F,$F1,$B0
                    db $9C,$00,$A7,$63,$B6,$64,$CC,$00
                    db $D4,$66,$E3,$67,$F3,$67,$8D,$C1
                    db $CF,$F6,$20,$9D,$C7,$FD

                    db $50,$B1,$0F,$F6,$20,$FC,$00,$1F ; 8-2, Level #32
                    db $F3,$B0,$5C,$00,$65,$65,$74,$66
                    db $83,$67,$93,$67,$DC,$73,$4C,$80
                    db $B3,$20,$C9,$0B,$C3,$08,$D3,$2F
                    db $DC,$00,$2C,$80,$4C,$00,$8C,$00
                    db $D3,$2E,$ED,$4A,$FC,$00,$D7,$A1
                    db $EC,$01,$4C,$80,$59,$11,$D8,$11
                    db $DA,$10,$37,$A0,$47,$04,$99,$11
                    db $E7,$21,$3A,$90,$67,$20,$76,$10
                    db $77,$60,$87,$07,$D8,$12,$39,$F1
                    db $AC,$00,$E9,$71,$0C,$80,$2C,$00
                    db $4C,$05,$C7,$7B,$39,$F1,$EC,$00
                    db $F9,$11,$0C,$82,$6F,$F4,$30,$F8
                    db $11,$FA,$10,$7F,$F2,$B0,$AC,$00
                    db $B6,$64,$CC,$01,$E3,$67,$F3,$67
                    db $8D,$C1,$CF,$F6,$20,$8D,$C7,$FD

                    db $52,$B1,$0F,$F0,$20,$6E,$45,$39 ; 7-1, Level #33
                    db $91,$B3,$04,$C3,$21,$C8,$11,$CA
                    db $10,$49,$91,$7C,$73,$E8,$12,$88
                    db $91,$8A,$10,$E7,$21,$05,$91,$07
                    db $30,$17,$07,$27,$20,$49,$11,$9C
                    db $01,$C8,$72,$23,$A6,$27,$26,$D3
                    db $03,$D8,$7A,$89,$91,$D8,$72,$39
                    db $F1,$A9,$11,$09,$F1,$63,$24,$67
                    db $24,$D8,$62,$28,$91,$2A,$10,$56
                    db $21,$70,$04,$79,$0B,$8C,$00,$94
                    db $21,$9F,$F5,$30,$2F,$F8,$B0,$3D
                    db $C1,$7F,$F6,$20,$3D,$C7,$FD

                    db $06,$C1,$4C,$00,$F4,$4F,$0D,$02 ; Sky Bonus Area (Night), Level  #34
                    db $06,$20,$24,$4F,$35,$A0,$36,$20
                    db $53,$46,$D5,$20,$D6,$20,$34,$A1
                    db $73,$49,$74,$20,$94,$20,$B4,$20
                    db $D4,$20,$F4,$20,$2E,$80,$59,$42
                    db $4D,$C7,$FD

                    db $96,$31,$0F,$F6,$20,$0D,$03,$1A ; 3-2, Level #35
                    db $60,$77,$42,$C4,$00,$C8,$62,$B9
                    db $E1,$D3,$06,$D7,$07,$F9,$61,$0C
                    db $81,$4E,$B1,$8E,$B1,$BC,$01,$E4
                    db $50,$E9,$61,$0C,$81,$0D,$0A,$84
                    db $43,$98,$72,$0D,$0C,$0F,$F8,$30
                    db $1D,$C1,$5F,$F6,$20,$1D,$C7,$FD

                    db $48,$0F,$0E,$01,$5E,$02,$A7,$00 ; 1-2, Level #C0
                    db $BC,$73,$1A,$E0,$39,$61,$58,$62
                    db $77,$63,$97,$63,$B8,$62,$D6,$07
                    db $F8,$62,$19,$E1,$75,$52,$86,$40
                    db $87,$50,$95,$52,$93,$43,$A5,$21
                    db $C5,$52,$D6,$40,$D7,$20,$E5,$06
                    db $E6,$51,$3E,$8D,$5E,$03,$67,$52
                    db $77,$52,$7E,$02,$9E,$03,$A6,$43
                    db $A7,$23,$DE,$05,$FE,$02,$1E,$83
                    db $33,$54,$46,$40,$47,$21,$56,$04
                    db $5E,$02,$83,$54,$93,$52,$96,$07
                    db $97,$50,$BE,$03,$C7,$23,$FE,$02
                    db $0C,$82,$43,$45,$45,$24,$46,$24
                    db $90,$08,$95,$51,$78,$FA,$D7,$73
                    db $39,$F1,$8C,$01,$A8,$52,$B8,$52
                    db $CC,$01,$5F,$F3,$B0,$97,$63,$9E
                    db $00,$0E,$81,$16,$24,$66,$04,$8E
                    db $00,$FE,$01,$08,$D2,$0E,$06,$6F
                    db $F7,$40,$9E,$0F,$0E,$82,$2D,$47
                    db $28,$7A,$68,$7A,$A8,$7A,$AE,$01
                    db $DE,$0F,$6D,$C5,$FD

                    db $48,$0F,$0E,$01,$5E,$02,$BC,$01 ; 4-2, Level #C1
                    db $FC,$01,$2C,$82,$41,$52,$4E,$04
                    db $67,$25,$68,$24,$69,$24,$BA,$42
                    db $C7,$04,$DE,$0B,$B2,$87,$FE,$02
                    db $2C,$E1,$2C,$71,$67,$01,$77,$00
                    db $87,$01,$8E,$00,$EE,$01,$F6,$02
                    db $03,$85,$05,$02,$13,$21,$16,$02
                    db $27,$02,$2E,$02,$88,$72,$C7,$20
                    db $D7,$07,$E4,$76,$07,$A0,$17,$06
                    db $48,$7A,$76,$20,$98,$72,$79,$E1
                    db $88,$62,$9C,$01,$B7,$73,$DC,$01
                    db $F8,$62,$FE,$01,$08,$E2,$0E,$00
                    db $6E,$02,$73,$20,$77,$23,$83,$04
                    db $93,$20,$AE,$00,$FE,$0A,$0E,$82
                    db $39,$71,$A8,$72,$E7,$73,$0C,$81
                    db $8F,$F2,$30,$AE,$00,$FE,$04,$04
                    db $D1,$17,$04,$26,$49,$27,$29,$DF
                    db $F3,$30,$FE,$02,$44,$F6,$7C,$01
                    db $8E,$06,$BF,$F7,$40,$EE,$0F,$4D
                    db $C7,$0E,$82,$68,$7A,$AE,$01,$DE
                    db $0F,$6D,$C5,$FD

                    db $48,$01,$0E,$01,$00,$5A,$3E,$06 ; Underground Bonus Area, Level #C2
                    db $45,$46,$47,$46,$53,$44,$AE,$01
                    db $DF,$FA,$40,$4D,$C7,$0E,$81,$00
                    db $5A,$2E,$04,$37,$28,$3A,$48,$46
                    db $47,$C7,$07,$CE,$0F,$DF,$FA,$40
                    db $4D,$C7,$0E,$81,$00,$5A,$33,$53
                    db $43,$51,$46,$40,$47,$50,$53,$04
                    db $55,$40,$56,$50,$62,$43,$64,$40
                    db $65,$50,$71,$41,$73,$51,$83,$51
                    db $94,$40,$95,$50,$A3,$50,$A5,$40
                    db $A6,$50,$B3,$51,$B6,$40,$B7,$50
                    db $C3,$53,$DF,$FA,$40,$4D,$C7,$0E
                    db $81,$00,$5A,$2E,$02,$36,$47,$37
                    db $52,$3A,$49,$47,$25,$A7,$52,$D7
                    db $04,$DF,$FA,$40,$4D,$C7,$0E,$81
                    db $00,$5A,$3E,$02,$44,$51,$53,$44
                    db $54,$44,$55,$24,$A1,$54,$AE,$01
                    db $B4,$21,$DF,$FA,$40,$E5,$07,$4D
                    db $C7,$FD

                    db $41,$01,$B4,$34,$C8,$52,$F2,$51 ; Underwater Bonus Area, Level #00
                    db $47,$D3,$6C,$03,$65,$49,$9E,$07
                    db $AF,$02,$3E,$AF,$82,$3E,$BE,$01
                    db $BF,$02,$3E,$BF,$82,$3E,$CC,$03
                    db $FE,$07,$0D,$C9,$0F,$02,$3E,$0F
                    db $82,$3E,$1E,$01,$1F,$02,$3E,$1F
                    db $82,$3E,$6C,$01,$62,$35,$63,$53
                    db $8A,$41,$AC,$01,$B3,$53,$E9,$51
                    db $26,$C3,$27,$33,$63,$43,$64,$33
                    db $BA,$60,$C9,$61,$CE,$0B,$DE,$0F
                    db $DF,$03,$3E,$DF,$73,$3E,$E5,$09
                    db $EF,$04,$3E,$EF,$73,$3E,$FF,$0A
                    db $3E,$0F,$0A,$BE,$7D,$4A,$7D,$47
                    db $FD

                    db $41,$01,$B8,$52,$EA,$41,$27,$B2 ; 2-2 & 7-2, Level #01
                    db $B3,$42,$16,$D4,$4A,$42,$A5,$51
                    db $A7,$31,$27,$D3,$08,$E2,$16,$64
                    db $2C,$04,$38,$42,$76,$64,$88,$62
                    db $DE,$07,$EF,$02,$3E,$EF,$82,$3E
                    db $FE,$01,$FF,$02,$3E,$FF,$82,$3E
                    db $0D,$C9,$23,$32,$31,$51,$98,$52
                    db $0D,$C9,$59,$42,$63,$53,$67,$31
                    db $14,$C2,$36,$31,$87,$53,$17,$E3
                    db $29,$61,$30,$62,$3C,$08,$42,$37
                    db $59,$40,$6A,$42,$99,$40,$C9,$61
                    db $D7,$63,$39,$D1,$58,$52,$C3,$67
                    db $D3,$31,$DC,$06,$F7,$42,$FA,$42
                    db $23,$B1,$43,$67,$C3,$34,$C7,$34
                    db $D1,$51,$43,$B3,$47,$33,$9A,$30
                    db $A9,$61,$B8,$62,$BE,$0B,$CE,$0F
                    db $CF,$03,$3E,$CF,$73,$3E,$D5,$09
                    db $DF,$04,$3E,$DF,$73,$3E,$EF,$0A
                    db $3E,$FF,$0A,$3E,$0F,$0A,$BE,$0D
                    db $4A,$7D,$47,$FD

                    db $49,$0F,$1E,$01,$1F,$00,$34,$2F ; 8-4 Underwater, Level #02
                    db $B0,$34,$2F,$C0,$34,$39,$73,$5E
                    db $07,$5F,$A1,$3C,$5F,$B0,$38,$6F
                    db $80,$38,$6F,$00,$34,$AE,$0B,$AF
                    db $71,$3C,$BF,$30,$34,$1E,$82,$1F
                    db $20,$34,$1F,$A1,$3A,$1F,$70,$36
                    db $6E,$88,$6F,$A1,$3C,$7F,$10,$34
                    db $7F,$80,$38,$9E,$02,$9F,$20,$34
                    db $9F,$A1,$3A,$9F,$80,$36,$0D,$04
                    db $2E,$0B,$2F,$A1,$3C,$3F,$10,$34
                    db $3F,$70,$38,$3E,$0B,$4F,$40,$34
                    db $45,$09,$5F,$42,$28,$5F,$50,$34
                    db $6F,$42,$28,$7F,$42,$28,$ED,$47
                    db $FD

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; empty
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF

CODE_04D800:        LDA.w $0BA5               ;
                    BNE   CODE_04D859         ;
                    LDA.w $06D5               ;
                    CMP.b #$18                ;
                    BEQ   CODE_04D810         ;
                    CMP.b #$78                ;
                    BNE   CODE_04D820         ;
CODE_04D810:        LDA.b $09                 ;\
                    AND.b #$07                ; |
                    BNE   CODE_04D820         ; |
                    LDA.w $1601               ; |Play the "Mario is turning sound"
                    BNE   CODE_04D820         ; |Every 7 frames
                    LDA.b #$04                ; |
                    STA.w $1601               ;/
CODE_04D820:        STZ.w $028E               ;
                    LDA.w $06D5               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    INC.w $028E               ;
                    REP   #$20                ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    CLC                       ;
                    ADC.w #$8000              ;
                    STA.w $028F               ;
                    LDA.w #$6000              ;
                    STA.w $0295               ;
                    LDA.w #$0100              ;
                    STA.w $0293               ;
                    SEP   #$20                ;
                    LDA.w $0EC2               ;
                    BEQ   CODE_04D854         ;
                    LDA.w $0290               ;
                    ORA.b #$40                ;
                    STA.w $0290               ;
CODE_04D854:        LDA.b #$0A                ;
                    STA.w $0291               ;
CODE_04D859:        RTL                       ;

                    STZ.w $0F4A               ;
                    LDA.b #$35                ;
                    RTL                       ;

CODE_04D860:        REP   #$20                ;16-bit A
                    LDX.b #$1E                ;Load amount of loops for palette upload
CODE_04D864:        LDA.w $0753               ;Load 'current character'
                    BEQ   CODE_04D86F         ;If it is Mario, branch.
                    LDA.l $04D8A3,x           ;Load Luigi and princess kiss sequence palette
                    BRA   CODE_04D873         ;Upload them

CODE_04D86F:        LDA.l $04D883,x           ;Load Mario and princess kiss sequence palette
CODE_04D873:        STA.w $1160,x             ;Upload them. (Sequence is after bowser btw)
                    DEX                       ;\
                    DEX                       ; |If not done, loop
                    BPL   CODE_04D864         ;/ 
                    SEP   #$20                ; 8-bit A
                    INC.w $1200               ;
                    JSR.w CODE_04D8C3         ;
                    RTL                       ; Return

                    dw $734E,$7FFF,$14A5,$5D68 ; Mario palette of princess kiss sequence
                    dw $762E,$27BF,$31BB,$3ABF
                    dw $0000,$152F,$355D,$525F
                    dw $169B,$1C9F,$0C19,$0C19

                    dw $734E,$7FFF,$14A5,$5588 ; Luigi palette of princess kiss sequence
                    dw $724D,$27BF,$31BB,$3ABF
                    dw $0000,$152F,$355D,$525F
                    dw $169B,$3303,$1A40,$1C9F

CODE_04D8C3:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.b #$FF                ;
                    STA.w $0EEE               ;
                    STZ.w $0EEF               ;
                    STZ.w $0BA3               ;
                    LDA.b #$15                ;
                    STA.w $120B               ;
                    LDA.b #$02                ;
                    STA.w $120C               ;
                    REP   #$10                ;
                    LDA.w $075F               ;
                    PHA                       ;
                    LDA.l $70000F             ;
                    BNE   CODE_04D8F2         ;
                    LDA.w $07FC               ;
                    BEQ   CODE_04D8F2         ;
                    LDA.b #$0C                ;
                    STA.w $075F               ;
CODE_04D8F2:        LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0753               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $00                 ;
                    LDA.w $075F               ;
                    AND.b #$08                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ORA.b $00                 ;
                    TAY                       ;
                    PLA                       ;
                    STA.w $075F               ;
                    LDX.w $D926,y             ;
                    TXY                       ;
                    LDX.w $1700               ;
CODE_04D911:        LDA.w $D92E,y             ;
                    STA.w $1702,x             ;
                    INC   A                   ;
                    BEQ   CODE_04D91E         ;
                    INX                       ;
                    INY                       ;
                    BRA   CODE_04D911         ;

CODE_04D91E:        STX.w $1700               ;
                    SEP   #$10                ;
                    PLX                       ;
                    PLB                       ;
                    RTS                       ;

                    dw $0000,$00A4,$0156,$01FA ;Index for next table. 

                    db $59,$05,$00,$11,$1D,$20,$11,$20 ; "Thank you Mario! The kingdom is saved!
                    db $0A,$20,$17,$20,$14,$20,$28,$20 ;  Now try a more difficult quest..." text.
                    db $22,$20,$18,$20,$1E,$20,$59,$45
                    db $00,$0B,$16,$20,$0A,$20,$1B,$20 ; Encoded in stripe image.
                    db $12,$20,$18,$20,$26,$20,$59,$85
                    db $00,$15,$1D,$20,$11,$20,$0E,$20
                    db $28,$20,$14,$20,$12,$20,$17,$20
                    db $10,$20,$0D,$20,$18,$20,$16,$20
                    db $59,$C5,$00,$11,$12,$20,$1C,$20
                    db $28,$20,$1C,$20,$0A,$20,$1F,$20
                    db $0E,$20,$0D,$20,$26,$20,$5A,$05
                    db $00,$0D,$17,$20,$18,$20,$20,$20
                    db $28,$20,$1D,$20,$1B,$20,$22,$20
                    db $5A,$45,$00,$0B,$0A,$20,$28,$20
                    db $16,$20,$18,$20,$1B,$20,$0E,$20
                    db $5A,$85,$00,$11,$0D,$20,$12,$20
                    db $0F,$20,$0F,$20,$12,$20,$0C,$20
                    db $1E,$20,$15,$20,$1D,$20,$5A,$C5
                    db $00,$0F,$1A,$20,$1E,$20,$0E,$20
                    db $1C,$20,$1D,$20,$29,$20,$29,$20
                    db $29,$20,$FF,$FF

                    db $59,$05,$00,$11,$1D,$20,$11,$20 ; "Thank you Mario for restoring peace to our
                    db $0A,$20,$17,$20,$14,$20,$28,$20 ;  kingdom. Hurrah to our hero, Mario!" text
                    db $22,$20,$18,$20,$1E,$20,$59,$45
                    db $00,$11,$16,$20,$0A,$20,$1B,$20 ; Encoded in stripe image
                    db $12,$20,$18,$20,$28,$20,$0F,$20
                    db $18,$20,$1B,$20,$59,$85,$00,$11
                    db $1B,$20,$0E,$20,$1C,$20,$1D,$20
                    db $18,$20,$1B,$20,$12,$20,$17,$20
                    db $10,$20,$59,$C5,$00,$0F,$19,$20
                    db $0E,$20,$0A,$20,$0C,$20,$0E,$20
                    db $28,$20,$1D,$20,$18,$20,$5A,$05
                    db $00,$05,$18,$20,$1E,$20,$1B,$20
                    db $5A,$45,$00,$0F,$14,$20,$12,$20
                    db $17,$20,$10,$20,$0D,$20,$18,$20
                    db $16,$20,$29,$20,$5A,$85,$00,$11
                    db $11,$20,$1E,$20,$1B,$20,$1B,$20
                    db $0A,$20,$11,$20,$28,$20,$1D,$20
                    db $18,$20,$5A,$C5,$00,$11,$18,$20
                    db $1E,$20,$1B,$20,$28,$20,$11,$20
                    db $0E,$20,$1B,$20,$18,$20,$2B,$20
                    db $5B,$05,$00,$0B,$16,$20,$0A,$20
                    db $1B,$20,$12,$20,$18,$20,$26,$20
                    db $FF,$FF

                    db $59,$05,$00,$11,$1D,$20,$11,$20 ; "Thank you Luigi! The kingdom is saved!
                    db $0A,$20,$17,$20,$14,$20,$28,$20 ;  Now try a more difficult quest..." text
                    db $22,$20,$18,$20,$1E,$20,$59,$45
                    db $00,$0B,$15,$20,$1E,$20,$12,$20 ; Encoded in stripe image
                    db $10,$20,$12,$20,$26,$20,$59,$85
                    db $00,$15,$1D,$20,$11,$20,$0E,$20
                    db $28,$20,$14,$20,$12,$20,$17,$20
                    db $10,$20,$0D,$20,$18,$20,$16,$20
                    db $59,$C5,$00,$11,$12,$20,$1C,$20
                    db $28,$20,$1C,$20,$0A,$20,$1F,$20
                    db $0E,$20,$0D,$20,$26,$20,$5A,$05
                    db $00,$0D,$17,$20,$18,$20,$20,$20
                    db $28,$20,$1D,$20,$1B,$20,$22,$20
                    db $5A,$45,$00,$0B,$0A,$20,$28,$20
                    db $16,$20,$18,$20,$1B,$20,$0E,$20
                    db $5A,$85,$00,$11,$0D,$20,$12,$20
                    db $0F,$20,$0F,$20,$12,$20,$0C,$20
                    db $1E,$20,$15,$20,$1D,$20,$5A,$C5
                    db $00,$0F,$1A,$20,$1E,$20,$0E,$20
                    db $1C,$20,$1D,$20,$29,$20,$29,$20
                    db $29,$20,$FF,$FF

                    db $59,$05,$00,$11,$1D,$20,$11,$20 ; "Thank you Luigi for restoring peace to our
                    db $0A,$20,$17,$20,$14,$20,$28,$20 ;  kingdom. Hurrah to our hero, Luigi!" text
                    db $22,$20,$18,$20,$1E,$20,$59,$45
                    db $00,$11,$15,$20,$1E,$20,$12,$20 ; Encoded in stripe image.
                    db $10,$20,$12,$20,$28,$20,$0F,$20
                    db $18,$20,$1B,$20,$59,$85,$00,$11
                    db $1B,$20,$0E,$20,$1C,$20,$1D,$20
                    db $18,$20,$1B,$20,$12,$20,$17,$20
                    db $10,$20,$59,$C5,$00,$0F,$19,$20
                    db $0E,$20,$0A,$20,$0C,$20,$0E,$20
                    db $28,$20,$1D,$20,$18,$20,$5A,$05
                    db $00,$05,$18,$20,$1E,$20,$1B,$20
                    db $5A,$45,$00,$0F,$14,$20,$12,$20
                    db $17,$20,$10,$20,$0D,$20,$18,$20
                    db $16,$20,$29,$20,$5A,$85,$00,$11
                    db $11,$20,$1E,$20,$1B,$20,$1B,$20
                    db $0A,$20,$11,$20,$28,$20,$1D,$20
                    db $18,$20,$5A,$C5,$00,$11,$18,$20
                    db $1E,$20,$1B,$20,$28,$20,$11,$20
                    db $0E,$20,$1B,$20,$18,$20,$2B,$20
                    db $5B,$05,$00,$0B,$15,$20,$1E,$20
                    db $12,$20,$10,$20,$12,$20,$26,$20
                    db $FF,$FF

CODE_04DBDA:        PHX                       ;
                    LDA.w $0F85               ;
                    BNE   CODE_04DC1B         ;
                    LDA.l $70000F             ;
                    BEQ   CODE_04DBE9         ;
                    LDA.w $0753               ;
CODE_04DBE9:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.w $0F84               ;
                    TAX                       ;
                    INC.w $0F84               ;
                    LDA.w $0F84               ;
                    CMP.b #$03                ;
                    BNE   CODE_04DC02         ;
                    LDA.b #$FF                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
CODE_04DC02:        LDA.l $04DC3F,x           ;
                    BNE   CODE_04DC11         ;
                    INC.w $0772               ;
                    STZ.w $0705               ;
                    STZ.w $005D               ;
CODE_04DC11:        STA.w $0F85               ;
                    LDA.l $04DC4F,x           ;
                    STA.w $0F86               ;
CODE_04DC1B:        DEC.w $0F85               ;
                    LDA.w $0F86               ;
                    AND.b #$08                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $0D                 ;
                    LDY.w $0F86               ;
                    LDA.w $0723               ;
                    BEQ   CODE_04DC3D         ;
                    LDA.w $0219               ;
                    CMP.b #$A2                ;
                    BCC   CODE_04DC3D         ;
                    LDA.b #$A2                ;
                    STA.w $0219               ;
CODE_04DC3D:        PLX                       ;
                    RTL                       ;

                    db $18,$A0,$08,$01,$28,$10,$03,$00 ;Mario rescued peach movements duration.
                    db $10,$A0,$08,$01,$28,$1E,$02,$00 ;Note to self: look deeper in this

                    db $01,$00,$41,$C1,$C9,$01,$01,$00 ;The movements
                    db $01,$00,$41,$C1,$C9,$01,$01,$00

CODE_04DC5F:        DEC.w $0F88               ;
                    LDA.w $0F88               ;
                    BPL   CODE_04DC7D         ;
                    INC.w $0F87               ;
                    LDX.w $0F87               ;
                    CPX.b #$05                ;
                    BNE   CODE_04DC76         ;
                    LDA.b #$A0                ;
                    STA.w $0219               ;
CODE_04DC76:        LDA.l $04DCB4,x           ;
                    STA.w $0F88               ;
CODE_04DC7D:        LDA.w $0F87               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.l $04DC91,x           ;
                    STA.b $00                 ;
                    LDA.l $04DC92,x           ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

                    dw CODE_04DC9F
                    dw CODE_04DC9F
                    dw CODE_04DC9F
                    dw CODE_04DCB0
                    dw CODE_04DCA0
                    dw CODE_04DC9F
                    dw CODE_04DC9F

CODE_04DC9F:        RTL                       ;

CODE_04DCA0:        LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDA.b #$00                ;
                    LDX.b #$01                ;
                    JSL.l CODE_03C187         ;
CODE_04DCB0:        DEC.w $021A               ;
                    RTL                       ;

                    db $00,$30,$37,$1A,$10,$60,$FF

CODE_04DCBB:        PHX                       ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$07                ;
                    STA.w $08B0               ;
                    STA.w $08B4               ;
                    LDA.w $03B9               ;
                    STA.w $08B1               ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $08B5               ;
                    LDX.w $0F87               ;
                    CPX.b #$03                ;
                    BNE   CODE_04DCE9         ;
                    LDA.b $09                 ;
                    AND.b #$04                ;
                    BNE   CODE_04DCE9         ;
                    LDA.l $04DD4E,x           ;
                    INC   A                   ;
                    INC   A                   ;
                    BRA   CODE_04DCED         ;

CODE_04DCE9:        LDA.l $04DD4E,x           ;
CODE_04DCED:        STA.w $08B2               ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.w $08B6               ;
                    LDA.b #$25                ;
                    STA.w $08B3               ;
                    STA.w $08B7               ;
                    LDA.w $021A               ;
                    CLC                       ;
                    ADC.b #$07                ;
                    SEC                       ;
                    SBC.w $0042               ;
                    LDA.w $79               ;
                    SBC.w $0043               ;
                    ORA.b #$02                ;
                    STA.w $0CB0               ;
                    STA.w $0CB4               ;
                    LDX.w $0B58               ;
                    LDA.w $0802,x             ;
                    CMP.b #$F6                ;
                    BNE   CODE_04DD28         ;
                    LDA.b #$F0                ;
                    STA.w $0801,x             ;
                    STA.w $0805,x             ;
CODE_04DD28:        LDA.b $25                 ;
                    BEQ   CODE_04DD4C         ;
                    LDA.b #$1C                ;
                    STA.w $09E3               ;
                    STA.w $09E7               ;
                    STA.w $09EB               ;
                    STA.w $09EF               ;
                    LDA.b #$80                ;
                    STA.w $09E2               ;
                    INC   A                   ;
                    STA.w $09E6               ;
                    LDA.b #$90                ;
                    STA.w $09EA               ;
                    INC   A                   ;
                    STA.w $09EE               ;
CODE_04DD4C:        PLX                       ;
                    RTL                       ;

                    db $88,$88,$80,$82,$86,$86,$86

CODE_04DD55:        LDA.w $0F83               ;
                    CMP.b #$0A                ;
                    BCS   CODE_04DD86         ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    ASL   A                   ;
                    TAX                       ;
                    INC.w $0F83               ;
                    LDA.w $DD87,x             ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w $DDAF,x             ;
                    STA.w $028A               ;
                    LDA.w $DD9B,x             ;
                    STA.w $0285               ;
                    SEP   #$20                ;
                    INC.w $0B76               ;
                    PLX                       ;
                    PLB                       ;
CODE_04DD86:        RTL                       ;

                    db $08,$00,$2F,$00,$2F,$00,$2F,$00
                    db $2F,$00,$2F,$00,$2F,$00,$1E,$00
                    db $1E,$00,$1A,$00

                    dw $A000,$D100,$D800,$E000
                    dw $E800,$F000,$F800,$D000
                    dw $D800,$E800

                    dw $3000,$6080,$6400,$6800
                    dw $6C00,$7000,$7400,$7800
                    dw $7C00,$0400

                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.w $0F83               ;
                    ASL   A                   ;
                    TAX                       ;
                    INC.w $0F83               ;
                    LDA.w $DDF1,x             ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w $DE19,x             ;
                    STA.w $028A               ;
                    LDA.w $DE05,x             ;
                    STA.w $0285               ;
                    SEP   #$20                ;
                    INC.w $0B76               ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

                    db $08,$00,$07,$00,$07,$00,$07,$00
                    db $07,$00,$07,$00,$07,$00,$07,$00
                    db $07,$00,$07,$00

                    dw $A000,$8100,$8800,$9000
                    dw $9800,$A000,$A800,$B000
                    dw $B800,$B800

                    dw $3000,$6080,$6400,$6800
                    dw $6C00,$7000,$7400,$7800
                    dw $7C00,$7C00

CODE_04DE2D:        LDA.b #$2E                ;
                    STA.b $25                 ;
                    LDA.b #$80                ;
                    STA.b $32                 ;
                    LDA.b #$01                ;
                    STA.b $19                 ;
                    LDA.b $78                 ;
                    STA.b $82                 ;
                    LDA.w $0219               ;
                    STA.w $0223               ;
                    LDA.b #$01                ;
                    STA.w $C5               ;
                    LDA.b #$18                ;
                    STA.w $0241               ;
                    STZ.w $0067               ;
                    STZ.w $020C               ;
                    RTL                       ;

CODE_04DE54:        LDA.l $70000F             ;
                    BEQ   CODE_04DE64         ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   CODE_04DE7F         ;
                    JMP.w CODE_04DE7F         ;

CODE_04DE64:        LDA.w $075F               ;
                    PHA                       ;
                    LDA.w $0E24               ;
                    PHA                       ;
                    LDA.w $07FC               ;
                    BNE   CODE_04DE77         ;
                    STZ.w $0E24               ;
                    STZ.w $075F               ;
CODE_04DE77:        PLA                       ;
                    STA.w $0E24               ;
                    PLA                       ;
                    STA.w $075F               ;
CODE_04DE7F:        LDA.b #$01                ;
                    STA.w $0F82               ;
                    STZ.w $0F83               ;
                    STZ.w $0717               ;
                    RTL                       ;

CODE_04DE8B:        LDA.l $70000F             ;
                    BEQ   CODE_04DE94         ;
                    JMP.w CODE_04DFBF         ;

CODE_04DE94:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_04871F         ;
                    LDX.w $0F80               ;
                    LDA.w $0F81               ;
                    CMP.w $E25D,x             ;
                    BCC   CODE_04DEBD         ;
                    STZ.w $0F81               ;
                    INC.w $0F80               ;
                    LDA.w $0F80               ;
                    CMP.b #$08                ;
                    BCC   CODE_04DEBD         ;
                    BNE   CODE_04DEB8         ;
                    STZ.w $0F89               ;
CODE_04DEB8:        LDA.b #$08                ;
                    STA.w $0F80               ;
CODE_04DEBD:        INC.w $0F81               ;
                    LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0F80               ;
                    ASL   A                   ;
                    REP   #$10                ;
                    TAY                       ;
                    LDX.w $E2B4,y             ;
                    STX.b $ED                 ;
                    LDX.w $E280,y             ;
                    LDY.w #$0004              ;
CODE_04DED5:        LDA.w $E2FA,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_04DF15         ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   CODE_04DEFF         ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
CODE_04DEFF:        LDA.w $E2FA,x             ;
                    ORA.b $00                 ;
                    ORA.b #$20                ;
                    STA.w $0803,y             ;
                    INX                       ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04DED5         ;

CODE_04DF15:        LDX.b $ED                 ;
CODE_04DF17:        LDA.w $E2FA,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_04DF64         ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    CLC                       ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   CODE_04DF4E         ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
CODE_04DF4E:        LDA.w $E2FA,x             ;
                    ORA.b $00                 ;
                    ORA.b #$20                ;
                    STA.w $0803,y             ;
                    INX                       ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04DF17         ;

CODE_04DF64:        LDA.w $0F80               ;
                    CMP.b #$08                ;
                    BNE   CODE_04DFB8         ;
                    SEP   #$10                ;
                    JSR.w CODE_04FD43         ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l $04E259,x           ;
                    CLC                       ;
                    ADC.b #$B0                ;
                    STA.w $0800               ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.b #$60                ;
                    SEC                       ;
                    SBC.b $00                 ;
                    STA.w $0801               ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l $04E255,x           ;
                    STA.w $0802               ;
                    LDA.b #$26                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0F89               ;
                    CPX.b #$03                ;
                    BNE   CODE_04DFB8         ;
                    STZ.w $0F89               ;
CODE_04DFB8:        SEP   #$10                ;
                    JSR.w CODE_04E221         ;
                    PLB                       ;
                    RTL                       ;

CODE_04DFBF:        LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   CODE_04DFC9         ;
                    JMP.w CODE_04E0F6         ;

CODE_04DFC9:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_04871F         ;
                    LDX.w $0F80               ;
                    LDA.w $0F81               ;
                    CMP.w $E266,x             ;
                    BCC   CODE_04DFF4         ;
                    STZ.w $0F81               ;
                    INC.w $0F80               ;
                    LDA.w $0F80               ;
                    CMP.b #$05                ;
                    BNE   CODE_04DFEB         ;
                    STZ.w $0F89               ;
CODE_04DFEB:        CMP.b #$0F                ;
                    BCC   CODE_04DFF4         ;
                    LDA.b #$06                ;
                    STA.w $0F80               ;
CODE_04DFF4:        INC.w $0F81               ;
                    LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0F80               ;
                    ASL   A                   ;
                    REP   #$10                ;
                    TAY                       ;
                    LDX.w $E2C6,y             ;
                    STX.b $ED                 ;
                    LDX.w $E280,y             ;
                    LDY.w #$0004              ;
CODE_04E00C:        LDA.w $E2FA,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_04E04C         ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   CODE_04E036         ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
CODE_04E036:        LDA.w $E2FA,x             ;
                    ORA.b $00                 ;
                    ORA.b #$20                ;
                    STA.w $0803,y             ;
                    INX                       ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04E00C         ;

CODE_04E04C:        LDX.b $ED                 ;
CODE_04E04E:        LDA.w $E2FA,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_04E09B         ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    CLC                       ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   CODE_04E085         ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
CODE_04E085:        LDA.w $E2FA,x             ;
                    ORA.b $00                 ;
                    ORA.b #$20                ;
                    STA.w $0803,y             ;
                    INX                       ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04E04E         ;

CODE_04E09B:        LDA.w $0F80               ;
                    CMP.b #$06                ;
                    BCC   CODE_04E0EF         ;
                    SEP   #$10                ;
                    JSR.w CODE_04FD43         ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l $04E259,x           ;
                    CLC                       ;
                    ADC.b #$B0                ;
                    STA.w $0800               ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.b #$60                ;
                    SEC                       ;
                    SBC.b $00                 ;
                    STA.w $0801               ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l $04E255,x           ;
                    STA.w $0802               ;
                    LDA.b #$26                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0F89               ;
                    CPX.b #$03                ;
                    BNE   CODE_04E0EF         ;
                    STZ.w $0F89               ;
CODE_04E0EF:        SEP   #$10                ;
                    JSR.w CODE_04E221         ;
                    PLB                       ;
                    RTL                       ;

CODE_04E0F6:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_04871F         ;
                    LDX.w $0F80               ;
                    LDA.w $0F81               ;
                    CMP.w $E276,x             ;
                    BCC   CODE_04E11F         ;
                    STZ.w $0F81               ;
                    INC.w $0F80               ;
                    LDA.w $0F80               ;
                    CMP.b #$09                ;
                    BCC   CODE_04E11F         ;
                    BNE   CODE_04E11A         ;
                    STZ.w $0F89               ;
CODE_04E11A:        LDA.b #$09                ;
                    STA.w $0F80               ;
CODE_04E11F:        INC.w $0F81               ;
                    LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0F80               ;
                    ASL   A                   ;
                    REP   #$10                ;
                    TAY                       ;
                    LDX.w $E2E6,y             ;
                    STX.b $ED                 ;
                    LDX.w $E2A0,y             ;
                    LDY.w #$0004              ;
CODE_04E137:        LDA.w $E2FA,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_04E177         ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   CODE_04E161         ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
CODE_04E161:        LDA.w $E2FA,x             ;
                    ORA.b $00                 ;
                    ORA.b #$20                ;
                    STA.w $0803,y             ;
                    INX                       ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04E137         ;

CODE_04E177:        LDX.b $ED                 ;
CODE_04E179:        LDA.w $E2FA,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_04E1C6         ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    CLC                       ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w $E2FA,x             ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   CODE_04E1B0         ;
                    LDA.w $0753               ;Load char palette
                    STA.b $00                 ;Store in scratch RAM
CODE_04E1B0:        LDA.w $E2FA,x             ;Load data
                    ORA.b $00                 ;ORA with char palette. 01 = luigi
                    ORA.b #$20                ;ORA #$20
                    STA.w $0803,y             ;
                    INX                       ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_04E179         ;

CODE_04E1C6:        LDA.w $0F80               ;
                    CMP.b #$09                ;
                    BNE   CODE_04E21A         ;
                    SEP   #$10                ;
                    JSR.w CODE_04FD43         ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l $04E259,x           ;
                    CLC                       ;
                    ADC.b #$B0                ;
                    STA.w $0800               ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.b #$60                ;
                    SEC                       ;
                    SBC.b $00                 ;
                    STA.w $0801               ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l $04E255,x           ;
                    STA.w $0802               ;
                    LDA.b #$26                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0F89               ;
                    CPX.b #$03                ;
                    BNE   CODE_04E21A         ;
                    STZ.w $0F89               ;
CODE_04E21A:        SEP   #$10                ;
                    JSR.w CODE_04E221         ;
                    PLB                       ;
                    RTL                       ;

CODE_04E221:        LDA.w $0753               ;
                    BEQ   CODE_04E254         ;
                    LDA.w $0806               ;
                    CMP.b #$EE                ;
                    BNE   CODE_04E254         ;
                    LDA.w $0804               ;
                    DEC   A                   ;
                    DEC   A                   ;
                    STA.w $0804               ;
                    STA.w $0808               ;
                    LDA.b #$82                ;
                    STA.w $0806               ;
                    INC   A                   ;
                    STA.w $080A               ;
                    LDA.w $0804               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0808               ;
                    LDA.b #$85                ;
                    STA.w $080E               ;
                    LDA.b #$89                ;
                    STA.w $0812               ;
CODE_04E254:        RTS                       ;

                    db $5F,$5E,$5D,$5C

                    db $00,$02,$00,$FE

                    db $50,$30,$08,$08,$20,$20,$08,$08
                    db $FF

                    db $50,$30,$08,$08,$20,$20,$08,$08
                    db $0C,$08,$08,$0C,$08,$08,$0C,$FF

                    db $60,$08,$08,$10,$14,$10,$14,$10
                    db $14,$FF

                    dw $0000,$008A,$011C,$01AE
                    dw $0244,$02D2,$0360,$045F
                    dw $055E,$055E,$055E,$055E
                    dw $055E,$055E,$055E,$055E

                    dw $06BE,$0789,$07CE,$06FF
                    dw $0744,$06FF,$0744,$06FF
                    dw $0744,$06FF

                    dw $0041,$00CB,$015D,$01F3
                    dw $0289,$0317,$03A5,$04A4
                    dw $05A3

                    dw $0041,$00CB,$015D,$01F3
                    dw $0289,$0317,$03F6,$04F5
                    dw $05F4,$03F6,$04F5,$05F4
                    dw $03F6,$04F5,$05F4,$065D

                    dw $0813,$091E,$0977,$086C
                    dw $08C5,$086C,$08C5,$086C
                    dw $08C5,$086C
                                         ;Tilemap for Mario and Princess image frames
                    db $E8,$EC,$A0,$06,$E8,$FC,$A2,$06 ;These tables are for the Princess kiss Mario-
                    db $E8,$0C,$A4,$06,$F8,$EC,$C0,$06 ; Sequence. This is table 0, next one is 1 etc
                    db $F8,$FC,$C2,$06,$F8,$0C,$C4,$06 ;The even-numbered tables are for the Princess
                    db $08,$EC,$E0,$06,$08,$FC,$E2,$06 ;The odd-numbered tables are for Mario/Luigi.
                    db $08,$0C,$E4,$06,$10,$CC,$8D,$06 ;The format of these bytes are the following:
                    db $10,$D4,$8E,$06,$10,$E4,$AC,$06 ;$XX,$YY,$TT,$PP
                    db $10,$F4,$AE,$06,$18,$F4,$CC,$06 ;XX = Xpos, YY = Ypos, TT = Tile, PP = Priority
                    db $18,$04,$CE,$06,$18,$14,$EC,$06 ;basically the OAM format.
                    db $FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06 ;These huge tables took ages to sort out...
                    db $E8,$C0,$28,$06,$E8,$D0,$2A,$06
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$4A,$06
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $E8,$EC,$A0,$06,$E8,$FC,$A2,$06
                    db $E8,$0C,$A4,$06,$F8,$EC,$C0,$06
                    db $F8,$FC,$C2,$06,$F8,$0C,$C4,$06
                    db $08,$EC,$E0,$06,$08,$FC,$E2,$06
                    db $08,$0C,$E4,$06,$10,$CC,$8D,$06
                    db $10,$D4,$8E,$06,$10,$E4,$AC,$06
                    db $10,$F4,$AE,$06,$18,$F4,$CC,$06
                    db $18,$04,$CE,$06,$18,$14,$EC,$06
                    db $FF

                    db $F0,$D0,$14,$06,$F0,$E0,$16,$06
                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$2A,$06
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$4A,$06
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $E8,$EB,$A0,$06,$E8,$FB,$A2,$06
                    db $E8,$0B,$A4,$06,$F8,$EB,$C0,$06
                    db $F8,$FB,$C2,$06,$F8,$0B,$C4,$06
                    db $08,$EB,$E0,$06,$08,$FB,$E2,$06
                    db $08,$0B,$E4,$06,$10,$CB,$8D,$06
                    db $10,$D3,$8E,$06,$10,$E3,$AC,$06
                    db $10,$F3,$AE,$06,$18,$F3,$CC,$06
                    db $18,$03,$CE,$06,$18,$13,$EC,$06
                    db $FF

                    db $F0,$D0,$14,$06,$F0,$E0,$16,$06
                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$2A,$06
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$4A,$06
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $00,$D5,$EE,$06,$00,$D5,$EE,$06
                    db $10,$DB,$88,$06,$10,$E2,$89,$06
                    db $E8,$EA,$A0,$06,$E8,$FA,$A2,$06
                    db $E8,$0A,$A4,$06,$F8,$EA,$C0,$06
                    db $F8,$FA,$C2,$06,$F8,$0A,$C4,$06
                    db $08,$EA,$E0,$06,$08,$FA,$E2,$06
                    db $08,$0A,$E4,$06,$10,$F2,$8B,$06
                    db $18,$F2,$CC,$06,$18,$02,$CE,$06
                    db $18,$12,$EC,$06,$FF

                    db $F0,$D0,$14,$06,$F0,$E0,$16,$06
                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$2A,$06
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$4A,$06
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $00,$D4,$EE,$06,$00,$D4,$EE,$06
                    db $10,$DA,$88,$06,$10,$E1,$89,$06
                    db $E8,$E9,$A0,$06,$E8,$F9,$A2,$06
                    db $E8,$09,$A4,$06,$F8,$E9,$C0,$06
                    db $F8,$F9,$C2,$06,$F8,$09,$C4,$06
                    db $08,$E9,$E0,$06,$08,$F9,$E2,$06
                    db $08,$09,$E4,$06,$10,$F1,$8B,$06
                    db $18,$F1,$CC,$06,$18,$01,$CE,$06
                    db $18,$11,$EC,$06,$FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$2A,$06
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$4A,$06
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $00,$D3,$EE,$06,$00,$D3,$EE,$06
                    db $10,$D9,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A6,$06,$E8,$F8,$A8,$06
                    db $E8,$08,$AA,$06,$F8,$E8,$C6,$06
                    db $F8,$F8,$C8,$06,$F8,$08,$CA,$06
                    db $08,$E8,$E6,$06,$08,$F8,$E8,$06
                    db $08,$08,$EA,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$2A,$06
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$4A,$06
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $00,$D3,$EE,$06,$00,$D3,$EE,$06
                    db $10,$D9,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A6,$06,$E8,$F8,$A8,$06
                    db $E8,$08,$AA,$06,$F8,$E8,$C6,$06
                    db $F8,$F8,$C8,$06,$F8,$08,$CA,$06
                    db $08,$E8,$E6,$06,$08,$F8,$E8,$06
                    db $08,$08,$EA,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0E,$06
                    db $E8,$E0,$0E,$46,$00,$D0,$3E,$06
                    db $00,$E0,$3E,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2E,$06
                    db $F8,$E0,$2E,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $F0,$D0,$42,$06,$F0,$E0,$42,$46
                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$D0,$2A,$06,$E8,$E0,$0C,$46
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2C,$06
                    db $F8,$D0,$4A,$06,$F8,$E0,$2C,$46
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $00,$D0,$60,$06,$00,$E0,$60,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $00,$D3,$EE,$06,$00,$D3,$EE,$06
                    db $10,$D9,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A6,$06,$E8,$F8,$A8,$06
                    db $E8,$08,$AA,$06,$F8,$E8,$C6,$06
                    db $F8,$F8,$C8,$06,$F8,$08,$CA,$06
                    db $08,$E8,$E6,$06,$08,$F8,$E8,$06
                    db $08,$08,$EA,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$00,$D0,$3C,$06
                    db $00,$E0,$3C,$46,$E8,$D0,$0C,$06
                    db $E8,$E0,$0C,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2C,$06
                    db $F8,$E0,$2C,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $F0,$D0,$62,$06,$F0,$E0,$62,$46
                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$D0,$2A,$06,$E8,$E0,$0C,$46
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2C,$06
                    db $F8,$D0,$4A,$06,$F8,$E0,$2C,$46
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $00,$D0,$60,$06,$00,$E0,$60,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $00,$D3,$EE,$06,$00,$D3,$EE,$06
                    db $10,$D9,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A6,$06,$E8,$F8,$A8,$06
                    db $E8,$08,$AA,$06,$F8,$E8,$C6,$06
                    db $F8,$F8,$C8,$06,$F8,$08,$CA,$06
                    db $08,$E8,$E6,$06,$08,$F8,$E8,$06
                    db $08,$08,$EA,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$E0,$0C,$46,$00,$D0,$3C,$06
                    db $00,$E0,$3C,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2C,$06
                    db $F8,$E0,$2C,$46,$F8,$F0,$48,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $F0,$D0,$40,$06,$F0,$E0,$40,$46
                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$D0,$2A,$06,$E8,$E0,$0C,$46
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2C,$06
                    db $F8,$D0,$4A,$06,$F8,$E0,$2C,$46
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $00,$D0,$60,$06,$00,$E0,$60,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$D0,$2A,$06,$E8,$E0,$0C,$46
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F8,$C0,$48,$06,$F8,$D0,$2C,$06
                    db $F8,$D0,$4A,$06,$F8,$E0,$2C,$46
                    db $F8,$E0,$4A,$46,$F8,$F0,$48,$46
                    db $00,$D0,$60,$06,$00,$E0,$60,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $E8,$EA,$A0,$06,$E8,$FA,$A2,$06
                    db $E8,$0A,$A4,$06,$F8,$EA,$C0,$06
                    db $F8,$FA,$C2,$06,$F8,$0A,$C4,$06
                    db $08,$EA,$E0,$06,$08,$FA,$E2,$06
                    db $08,$0A,$E4,$06,$10,$CA,$8D,$06
                    db $10,$D2,$8E,$06,$10,$E2,$AC,$06
                    db $10,$F2,$AE,$06,$18,$F2,$CC,$06
                    db $18,$02,$CE,$06,$18,$12,$EC,$06
                    db $FF

                    db $00,$D2,$EE,$06,$00,$D2,$EE,$06
                    db $10,$D8,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A6,$06,$E8,$F8,$A8,$06
                    db $E8,$08,$AA,$06,$F8,$E8,$C6,$06
                    db $F8,$F8,$C8,$06,$F8,$08,$CA,$06
                    db $08,$E8,$E6,$06,$08,$F8,$E8,$06
                    db $08,$08,$EA,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $00,$D2,$EE,$06,$00,$D2,$EE,$06
                    db $10,$D8,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A0,$06,$E8,$F8,$A2,$06
                    db $E8,$08,$A4,$06,$F8,$E8,$C0,$06
                    db $F8,$F8,$C2,$06,$F8,$08,$C4,$06
                    db $08,$E8,$E0,$06,$08,$F8,$E2,$06
                    db $08,$08,$E4,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $00,$D3,$EE,$06,$00,$D3,$EE,$06
                    db $10,$D9,$88,$06,$10,$E1,$89,$06
                    db $E8,$E9,$A6,$06,$E8,$F9,$A8,$06
                    db $E8,$09,$AA,$06,$F8,$E9,$C6,$06
                    db $F8,$F9,$C8,$06,$F8,$09,$CA,$06
                    db $08,$E9,$E6,$06,$08,$F9,$E8,$06
                    db $08,$09,$EA,$06,$10,$F1,$8B,$06
                    db $18,$F1,$CC,$06,$18,$01,$CE,$06
                    db $18,$11,$EC,$06,$FF

                    db $00,$D2,$EE,$06,$00,$D2,$EE,$06
                    db $10,$D8,$88,$06,$10,$E0,$89,$06
                    db $E8,$E8,$A6,$06,$E8,$F8,$A8,$06
                    db $E8,$08,$AA,$06,$F8,$E8,$C6,$06
                    db $F8,$F8,$C8,$06,$F8,$08,$CA,$06
                    db $08,$E8,$E6,$06,$08,$F8,$E8,$06
                    db $08,$08,$EA,$06,$10,$F0,$8B,$06
                    db $18,$F0,$CC,$06,$18,$00,$CE,$06
                    db $18,$10,$EC,$06,$FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$E0,$34,$06,$E8,$E0,$2A,$46
                    db $E8,$F0,$28,$46,$F0,$E0,$44,$06
                    db $F8,$C0,$48,$06,$F8,$F0,$48,$46
                    db $00,$D0,$3C,$06,$00,$E0,$64,$06
                    db $F8,$D0,$2C,$06,$F8,$E0,$4A,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $F0,$E0,$10,$06,$E8,$D0,$36,$06
                    db $E8,$E0,$36,$46,$E8,$E0,$2A,$46
                    db $E8,$F0,$28,$46,$F0,$D0,$46,$06
                    db $E8,$C0,$28,$06,$F8,$C0,$48,$06
                    db $00,$E0,$12,$06,$F8,$E0,$4A,$46
                    db $F8,$F0,$48,$46,$00,$D0,$66,$06
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $F0,$E0,$10,$06,$E8,$C0,$28,$06
                    db $E8,$D0,$36,$06,$E8,$E0,$36,$46
                    db $E8,$E0,$2A,$46,$E8,$F0,$28,$46
                    db $F0,$D0,$46,$06,$F8,$C0,$48,$06
                    db $00,$E0,$12,$06,$F8,$E0,$4A,$46
                    db $F8,$F0,$48,$46,$00,$D0,$66,$06
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$E0,$34,$06,$E8,$E0,$2A,$46
                    db $E8,$F0,$28,$46,$F0,$E0,$44,$06
                    db $F8,$C0,$48,$06,$F8,$F0,$48,$46
                    db $00,$D0,$3C,$06,$00,$E0,$64,$06
                    db $F8,$D0,$2C,$06,$F8,$E0,$4A,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

                    db $D8,$D0,$0A,$06,$D8,$E0,$08,$06
                    db $E8,$C0,$28,$06,$E8,$D0,$0C,$06
                    db $E8,$E0,$34,$06,$E8,$E0,$2A,$46
                    db $E8,$F0,$28,$46,$F0,$E0,$44,$06
                    db $F8,$C0,$48,$06,$F8,$F0,$48,$46
                    db $00,$D0,$3C,$06,$00,$E0,$64,$06
                    db $F8,$D0,$2C,$06,$F8,$E0,$4A,$46
                    db $08,$C0,$68,$06,$08,$D0,$6A,$06
                    db $08,$E0,$6A,$46,$08,$F0,$68,$46
                    db $18,$C0,$6E,$46,$18,$D0,$6C,$46
                    db $18,$E0,$6C,$06,$18,$F0,$6E,$06
                    db $FF

CODE_04ECCA:        LDA.b #$1E                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w #$7800              ;
                    STA.w $028A               ;
                    LDA.w $075F               ;
                    AND.w #$00FF              ;
                    CMP.w #$0007              ;
                    BNE   CODE_04ECED         ;
                    LDA.w #$D000              ;
                    BRA   CODE_04ECF0         ;

CODE_04ECED:        LDA.w #$C000              ;
CODE_04ECF0:        STA.w $0285               ;
                    SEP   #$20                ;
                    STZ.w $0F7D               ;
                    STZ.w $0F7E               ;
                    STZ.w $0F7F               ;
                    STZ.w $0B9C               ;
                    LDA.b #$02                ;
                    STA.w $0B76               ;
                    RTL                       ;

CODE_04ED07:        PHX                       ;
                    LDA.b #$1E                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w #$7C00              ;
                    STA.w $028A               ;
                    LDA.w $075F               ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.l $04ED5A,x           ;
                    STA.w $0285               ;
                    SEP   #$20                ;
                    PLX                       ;
                    RTL                       ;

CODE_04ED2E:        LDA.b #$80                ;
                    STA.w $2115               ;
                    REP   #$20                ;
                    LDA.w #$6000              ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.w $4300               ;
                    LDA.w #$8000              ;
                    STA.w $4302               ;
                    LDX.b #$07                ;
                    STX.w $4304               ;
                    LDA.w #$4000              ;
                    STA.w $4305               ;
                    LDX.b #$01                ;
                    STX.w $420B               ;
                    SEP   #$20                ;
                    RTL                       ;

                    dw $C800,$C800,$C800,$C800
                    dw $E800,$E000,$E000,$D000
                    dw $C800,$E800,$E000,$E000
                    dw $D000,$D000,$D000,$D000

CODE_04ED7A:        LDA.w $0F7E               ;
                    BEQ   CODE_04ED82         ;
                    JMP.w CODE_04EE26         ;

CODE_04ED82:        LDA.b $09                 ;
                    AND.b #$07                ;
                    BEQ   CODE_04ED8D         ;
                    LDA.w $0F7D               ;
                    BRA   CODE_04EDAF         ;

CODE_04ED8D:        INC.w $0F7D               ;
                    LDA.w $0F7D               ;
                    CMP.b #$03                ;
                    BCC   CODE_04EDAF         ;
                    LDA.w $07B9               ;
                    EOR.w $07BA               ;
                    AND.b #$01                ;
                    BNE   CODE_04EDAA         ;
                    LDA.b #$03                ;
                    STA.w $0F7D               ;
                    LDA.b #$01                ;
                    BRA   CODE_04EDAF         ;

CODE_04EDAA:        LDA.b #$00                ;
                    STA.w $0F7D               ;
CODE_04EDAF:        STA.b $00                 ;
                    LDA.b $79                 ;
                    XBA                       ;
                    LDA.w $021A               ;
                    LDY.b #$00                ;
                    JSR.w CODE_04FCFD         ;
                    LDA.b $79                 ;
                    XBA                       ;
                    LDA.w $021A               ;
                    REP   #$20                ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEP   #$20                ;
                    LDY.b #$04                ;
                    JSR.w CODE_04FCFD         ;
                    LDA.b $00                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_04EE02         ;
                    CMP.b #$00                ;
                    BNE   CODE_04EDDD         ;
                    LDA.b #$83                ;
                    BRA   CODE_04EDDF         ;

CODE_04EDDD:        LDA.b #$80                ;
CODE_04EDDF:        STA.w $0902               ;
                    INC   A                   ;
                    STA.w $0906               ;
                    CLC                       ;
                    ADC.b #$1F                ;
                    STA.w $090A               ;
                    INC   A                   ;
                    STA.w $090E               ;
                    LDA.b #$B0                ;
                    STA.w $0901               ;
                    STA.w $0905               ;
                    LDA.b #$C0                ;
                    STA.w $0909               ;
                    STA.w $090D               ;
                    BRA   CODE_04EE25         ;

CODE_04EE02:        LDA.b #$86                ;
                    STA.w $0902               ;
                    INC   A                   ;
                    STA.w $0906               ;
                    CLC                       ;
                    ADC.b #$0F                ;
                    STA.w $090A               ;
                    INC   A                   ;
                    STA.w $090E               ;
                    LDA.b #$B8                ;
                    STA.w $0901               ;
                    STA.w $0905               ;
                    LDA.b #$C0                ;
                    STA.w $0909               ;
                    STA.w $090D               ;
CODE_04EE25:        RTL                       ;

CODE_04EE26:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $075F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $0B9C               ;
                    BNE   CODE_04EE38         ;
                    JSR.w CODE_04FBA4         ;
CODE_04EE38:        LDA.w $EE45,x             ;
                    STA.b $00                 ;
                    LDA.w $EE46,x             ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

                    dw CODE_04EE61
                    dw CODE_04EEE4
                    dw CODE_04EF85
                    dw CODE_04F15A
                    dw CODE_04F3A1
                    dw CODE_04F5FA
                    dw CODE_04F896
                    dw CODE_04EE61
                    dw CODE_04EE61
                    dw CODE_04F3A1
                    dw CODE_04F5FA
                    dw CODE_04F896
                    dw CODE_04EE61

                    db $90,$00

CODE_04EE61:        JSR.w CODE_04FA7B         ;
                    LDA.w $0F7F               ;
                    BNE   CODE_04EE6C         ;
                    JMP.w CODE_04F9D5         ;

CODE_04EE6C:        CMP.b #$03                ;
                    BNE   CODE_04EEBB         ;
                    LDA.w $0B9F               ;
                    BNE   CODE_04EEBB         ;
                    JSR.w CODE_04FD66         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_03C187         ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   CODE_04EE97         ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
                    LDA.w $0238               ;
CODE_04EE97:        CMP.b #$B8                ;
                    BCC   CODE_04EEBB         ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    LDA.b #$00                ;
                    STA.w $0B9E               ;
                    LDA.b #$18                ;
                    STA.w $0B9F               ;
                    STZ.w $0BA4               ;
                    JSR.w CODE_04FD29         ;
CODE_04EEBB:        LDA.w $0B9F               ;
                    BNE   CODE_04EEC7         ;
                    LDA.b #$01                ;
                    STA.w $0B9E               ;
                    BRA   CODE_04EECA         ;

CODE_04EEC7:        DEC.w $0B9F               ;
CODE_04EECA:        LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_04F9FC         ;
                    JMP.w CODE_04F9D5         ;

CODE_04EEE4:        JSR.w CODE_04FA7B         ;
                    LDA.w $0F7F               ;
                    BNE   CODE_04EEEF         ;
                    JMP.w CODE_04F9D5         ;

CODE_04EEEF:        CMP.b #$03                ;
                    BNE   CODE_04EF4F         ;
                    LDA.w $0B9F               ;
                    BNE   CODE_04EF4C         ;
                    LDA.w $0B9C               ;
                    CMP.b #$02                ;
                    BNE   CODE_04EF04         ;
                    STA.w $0B9E               ;
                    BRA   CODE_04EF4F         ;

CODE_04EF04:        JSR.w CODE_04FD66         ;
                    LDA.b #$01                ;
                    STA.w $0B9E               ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_03C187         ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   CODE_04EF2B         ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
                    LDA.w $0238               ;
CODE_04EF2B:        CMP.b #$B8                ;
                    BCC   CODE_04EF4F         ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    STZ.w $00A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    LDA.b #$28                ;
                    STA.w $0B9F               ;
                    LDA.b #$02                ;
                    STA.w $0B9C               ;
                    LDA.b #$00                ;
                    STA.w $0B9E               ;
CODE_04EF4C:        DEC.w $0B9F               ;
CODE_04EF4F:        LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_04F9FC         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.b $00                 ;
                    LDA.w $0B9E               ;
                    CMP.b #$02                ;
                    BNE   CODE_04EF7F         ;
                    JSR.w CODE_04FD29         ;
                    LDA.b #$03                ;
CODE_04EF7F:        JSR.w CODE_04F9FC         ;
                    JMP.w CODE_04F9D5         ;

CODE_04EF85:        JSR.w CODE_04FA7B         ;
                    LDA.w $0F7F               ;
                    BNE   CODE_04EF90         ;
                    JMP.w CODE_04F9D5         ;

CODE_04EF90:        CMP.b #$03                ;
                    BEQ   CODE_04EF97         ;
                    JMP.w CODE_04F017         ;

CODE_04EF97:        LDA.w $0BA0               ;
                    CMP.b #$28                ;
                    BCC   CODE_04F014         ;
                    CMP.b #$50                ;
                    BCC   CODE_04EFFD         ;
                    CMP.b #$58                ;
                    BCC   CODE_04EFF7         ;
                    JSR.w CODE_04FD66         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_03C187         ;
                    LDA.b #$01                ;
                    STA.w $0B9E               ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   CODE_04EFCC         ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
                    BRA   CODE_04EFE9         ;

CODE_04EFCC:        CMP.b #$B8                ;
                    BCC   CODE_04EFE9         ;
                    STZ.w $00A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    STZ.w $0B9E               ;
                    LDA.b #$01                ;
                    STA.w $0B9F               ;
                    JSR.w CODE_04FD29         ;
CODE_04EFE9:        LDA.w $0B9F               ;
                    BNE   CODE_04EFF7         ;
                    LDA.b $09                 ;
                    AND.b #$01                ;
                    BNE   CODE_04EFF7         ;
                    INC.w $021D               ;
CODE_04EFF7:        JSR.w CODE_04F031         ;
                    JMP.w CODE_04F9D5         ;

CODE_04EFFD:        LDY.b #$A0                ;
                    CMP.b #$2C                ;
                    BCC   CODE_04F011         ;
                    CMP.b #$30                ;
                    BCC   CODE_04F00C         ;
                    JSR.w CODE_04F091         ;
                    BRA   CODE_04F014         ;

CODE_04F00C:        JSR.w CODE_04F0ED         ;
                    BRA   CODE_04F014         ;

CODE_04F011:        JSR.w CODE_04F124         ;
CODE_04F014:        INC.w $0BA0               ;
CODE_04F017:        LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_04F9FC         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F031:        LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_04F9FC         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.w $021D               ;
                    SEC                       ;
                    SBC.b #$07                ;
                    STA.b $00                 ;
                    LDA.w $0B9F               ;
                    DEC   A                   ;
                    BEQ   CODE_04F065         ;
                    LDA.b #$04                ;
                    CLC                       ;
                    ADC.w $0B9E               ;
CODE_04F065:        JSR.w CODE_04F9FC         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.w $021D               ;
                    CLC                       ;
                    ADC.b #$07                ;
                    STA.b $00                 ;
                    LDA.w $0B9F               ;
                    DEC   A                   ;
                    BEQ   CODE_04F085         ;
                    LDA.b #$06                ;
                    CLC                       ;
                    ADC.w $0B9E               ;
CODE_04F085:        JSR.w CODE_04F9FC         ;
                    LDA.w $0BA0               ;
                    BMI   CODE_04F090         ;
                    INC.w $0BA0               ;
CODE_04F090:        RTS                       ;

CODE_04F091:        LDA.w $0238               ;
                    INC   A                   ;
                    STA.w $0905,y             ;
                    STA.w $090D,y             ;
                    CLC                       ;
                    ADC.b #$07                ;
                    STA.w $0901,y             ;
                    STA.w $0909,y             ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$0D                ;
                    STA.w $0904,y             ;
                    DEC   A                   ;
                    STA.w $0900,y             ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$0D                ;
                    STA.w $090C,y             ;
                    INC   A                   ;
                    STA.w $0908,y             ;
                    LDA.b #$E0                ;
                    STA.w $0906,y             ;
                    STA.w $090E,y             ;
                    LDA.b #$CE                ;
                    STA.w $0902,y             ;
                    STA.w $090A,y             ;
                    LDA.b #$2D                ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
                    LDA.b #$6D                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    RTS                       ;

CODE_04F0ED:        LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$09                ;
                    STA.w $0900,y             ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$09                ;
                    STA.w $0904,y             ;
                    LDA.w $0238               ;
                    INC   A                   ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b #$E0                ;
                    STA.w $0902,y             ;
                    STA.w $0906,y             ;
                    LDA.b #$6D                ;
                    STA.w $0903,y             ;
                    LDA.b #$2D                ;
                    STA.w $0907,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    RTS                       ;

CODE_04F124:        LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$05                ;
                    STA.w $0900,y             ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$05                ;
                    STA.w $0904,y             ;
                    LDA.w $0238               ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b #$E0                ;
                    STA.w $0902,y             ;
                    STA.w $0906,y             ;
                    LDA.b #$6D                ;
                    STA.w $0903,y             ;
                    LDA.b #$2D                ;
                    STA.w $0907,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    RTS                       ;

CODE_04F15A:        JSR.w CODE_04FA7B         ;
                    LDA.w $0F7F               ;
                    BNE   CODE_04F165         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F165:        INC.w $0B9F               ;
                    LDA.w $0B9F               ;
                    CMP.b #$C0                ;
                    BCC   CODE_04F187         ;
                    LDA.b #$C0                ;
                    STA.w $0B9F               ;
                    LDA.b #$02                ;
                    STA.w $0B9C               ;
                    LDA.b #$01                ;
                    STA.w $0BB8               ;
                    STA.w $0BB9               ;
                    STA.w $0BBA               ;
                    STA.w $0BBB               ;
CODE_04F187:        STZ.w $0E67               ;
                    LDA.w $0BB4               ;
                    BNE   CODE_04F1A2         ;
                    LDA.w $0B9C               ;
                    CMP.b #$02                ;
                    BEQ   CODE_04F19C         ;
                    JSR.w CODE_04F2AB         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F19C:        JSR.w CODE_04F1D7         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F1A2:        LDA.w $0BA1               ;
                    BEQ   CODE_04F1AE         ;
                    DEC.w $0BA1               ;
                    LDA.b #$00                ;
                    BRA   CODE_04F1B3         ;

CODE_04F1AE:        JSR.w CODE_04FD29         ;
                    LDA.b #$02                ;
CODE_04F1B3:        STA.w $0B9E               ;
                    LDX.b #$03                ;
                    LDY.b #$00                ;
CODE_04F1BA:        LDA.w $0BB0,x             ;
                    STA.b $00                 ;
                    LDA.b #$B8                ;
                    STA.b $01                 ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_04F9FC         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    STY.w $0E67               ;
                    DEX                       ;
                    BPL   CODE_04F1BA         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F1D7:        JSR.w CODE_04FD66         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_03C187         ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   CODE_04F1F6         ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
CODE_04F1F6:        LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    CMP.b #$B8                ;
                    BCC   CODE_04F20E         ;
                    LDA.b #$B8                ;
                    STZ.w $0BB8               ;
CODE_04F20E:        STA.b $01                 ;
                    LDA.w $0BB8               ;
                    JSR.w CODE_04F9FC         ;
                    LDA.w $0BB1               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    CMP.b #$B8                ;
                    BCC   CODE_04F22C         ;
                    LDA.b #$B8                ;
                    STZ.w $0BB9               ;
                    BRA   CODE_04F23A         ;

CODE_04F22C:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_04F234         ;
                    INC.w $0BB1               ;
CODE_04F234:        LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$0C                ;
CODE_04F23A:        STA.b $01                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $0BB9               ;
                    CLC                       ;
                    ADC.b #$06                ;
                    JSR.w CODE_04F9FC         ;
                    LDA.w $0BB2               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$18                ;
                    CMP.b #$B8                ;
                    BCC   CODE_04F260         ;
                    LDA.b #$B8                ;
                    STZ.w $0BBA               ;
                    BRA   CODE_04F263         ;

CODE_04F260:        DEC.w $0BB2               ;
CODE_04F263:        STA.b $01                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $0BBA               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    JSR.w CODE_04F9FC         ;
                    LDA.w $0BB3               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$24                ;
                    CMP.b #$B8                ;
                    BCC   CODE_04F297         ;
                    LDA.b #$B8                ;
                    STZ.w $0BBB               ;
                    INC.w $0BB4               ;
                    LDA.b #$28                ;
                    STA.w $0BA1               ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$24                ;
                    BRA   CODE_04F29A         ;

CODE_04F297:        INC.w $0BB3               ;
CODE_04F29A:        STA.b $01                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $0BBB               ;
                    CLC                       ;
                    ADC.b #$06                ;
                    JSR.w CODE_04F9FC         ;
                    RTS                       ;

CODE_04F2AB:        LDY.b #$B0                ;
                    LDX.b #$00                ;
CODE_04F2AF:        LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.w $F38F,x             ;
                    STA.w $0901,y             ;
                    LDA.w $F390,x             ;
                    STA.w $0902,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$12                ;
                    BCC   CODE_04F2AF         ;
                    LDA.b #$6D                ;
                    STA.w $09C3               ;
                    STZ.w $0DC0               ;
                    STZ.w $0DBC               ;
                    LDA.w $09BC               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $09C0               ;
                    LDX.b #$00                ;
CODE_04F2EB:        LDA.w $F388,x             ;
                    CMP.w $0B9F               ;
                    BCS   CODE_04F2F8         ;
                    INX                       ;
                    CPX.b #$06                ;
                    BNE   CODE_04F2EB         ;
CODE_04F2F8:        TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $F37A,x             ;
                    STA.b $00                 ;
                    LDA.w $F37B,x             ;
                    STA.b $01                 ;
                    LDA.b #$01                ;
                    JMP.w ($0000)             ;

CODE_04F30A:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DB8               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

CODE_04F31D:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DB8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    LDA.b #$09                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_04F332:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

CODE_04F342:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DC8               ;
                    STA.w $0DD0               ;
                    LDA.b #$09                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_04F354:        STA.w $0DB0               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

CODE_04F361:        STA.w $0DB0               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    LDA.b #$09                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_04F370:        STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

                    dw CODE_04F30A
                    dw CODE_04F31D
                    dw CODE_04F332
                    dw CODE_04F342
                    dw CODE_04F354
                    dw CODE_04F361
                    dw CODE_04F370

                    db $40,$48,$58,$60,$70,$78,$BF,$97
                    db $EA,$A2,$EA,$AD,$EA,$B8,$B6,$B8
                    db $B6,$C0,$C9,$B3,$EA,$A8,$EA,$9D
                    db $EA

CODE_04F3A1:        JSR.w CODE_04FA7B
                    LDA.w $0F7F               ;
                    BNE   CODE_04F3AC         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F3AC:        JSR.w CODE_04FD66         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_03C187         ;
                    LDA.w $0238               ;
                    CMP.b #$A0                ;
                    BCS   CODE_04F3CB         ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
CODE_04F3CB:        LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCC   CODE_04F3ED         ;
                    LDA.b #$B0                ;
                    STA.w $0238               ;
                    STZ.w $043D               ;
                    STZ.w $041C               ;
                    INC.w $0B9E               ;
                    LDA.w $0B9E               ;
                    BMI   CODE_04F3EA         ;
                    LDA.b #$00                ;
                    STA.w $0B9E               ;
CODE_04F3EA:        STA.w $A1               ;
CODE_04F3ED:        INC.w $0B9F               ;
                    LDA.w $0B9F               ;
                    CMP.b #$44                ;
                    BCC   CODE_04F40C         ;
                    BNE   CODE_04F3FE         ;
                    LDA.b #$08                ;
                    STA.w $1600               ;
CODE_04F3FE:        LDA.b #$45                ;
                    STA.w $0B9F               ;
                    JSR.w CODE_04F412         ;
                    JSR.w CODE_04FD29         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F40C:        JSR.w CODE_04F586         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F412:        LDA.w $03AE               ;
                    CLC                       ;
                    ADC.w $0B9F               ;
                    STA.b $00                 ;
                    CLC                       ;
                    ADC.b #$06                ;
                    STA.w $0900               ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0904               ;
                    LDA.b $00                 ;
                    STA.w $0910               ;
                    STA.w $0918               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0914               ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.b #$1C                ;
                    STA.w $0920               ;
                    STA.w $0928               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0924               ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.b #$06                ;
                    STA.w $0930               ;
                    STA.w $0938               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0934               ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.b #$16                ;
                    STA.w $0940               ;
                    STA.w $0948               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0944               ;
                    LDA.b #$B8                ;
                    STA.w $0911               ;
                    STA.w $0915               ;
                    STA.w $0921               ;
                    STA.w $0925               ;
                    STA.w $0931               ;
                    STA.w $0935               ;
                    STA.w $0941               ;
                    STA.w $0945               ;
                    LDA.b #$C0                ;
                    STA.w $0901               ;
                    STA.w $0905               ;
                    STA.w $0919               ;
                    STA.w $0929               ;
                    STA.w $0939               ;
                    STA.w $0949               ;
                    LDA.b #$BE                ;
                    STA.w $0912               ;
                    STA.w $0926               ;
                    LDA.b #$BF                ;
                    STA.w $0916               ;
                    STA.w $0922               ;
                    LDA.b #$EC                ;
                    STA.w $091A               ;
                    STA.w $092A               ;
                    LDA.b #$EA                ;
                    STA.w $0902               ;
                    STA.w $0906               ;
                    LDA.b #$B6                ;
                    STA.w $0932               ;
                    STA.w $0936               ;
                    STA.w $0942               ;
                    STA.w $0946               ;
                    LDA.b #$C9                ;
                    STA.w $093A               ;
                    STA.w $094A               ;
                    LDA.b #$2D                ;
                    STA.w $0903               ;
                    STA.w $0913               ;
                    STA.w $0917               ;
                    STA.w $091B               ;
                    STA.w $0933               ;
                    STA.w $093B               ;
                    STA.w $0943               ;
                    STA.w $094B               ;
                    LDA.b #$6D                ;
                    STA.w $0907               ;
                    STA.w $0923               ;
                    STA.w $0927               ;
                    STA.w $092B               ;
                    STA.w $0937               ;
                    STA.w $0947               ;
                    LDA.b #$02                ;
                    STA.w $0D00               ;
                    STA.w $0D04               ;
                    STA.w $0D18               ;
                    STA.w $0D28               ;
                    STA.w $0D38               ;
                    STA.w $0D48               ;
                    LDX.b #$03                ;
CODE_04F510:        LDA.w $0BB8,x             ;
                    BEQ   CODE_04F521         ;
                    CMP.b #$1E                ;
                    BCC   CODE_04F51E         ;
                    STZ.w $0BB8,x             ;
                    BRA   CODE_04F521         ;

CODE_04F51E:        INC.w $0BB8,x             ;
CODE_04F521:        DEX                       ;
                    BPL   CODE_04F510         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_04F556         ;
                    LDX.b #$03                ;
CODE_04F52C:        LDA.w $0BB8,x             ;
                    BEQ   CODE_04F534         ;
                    DEX                       ;
                    BNE   CODE_04F52C         ;
CODE_04F534:        LDA.b $09                 ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $07B9,y             ;
                    EOR.b $09                 ;
                    AND.b #$1F                ;
                    CLC                       ;
                    ADC.b #$CC                ;
                    STA.w $0BB0,x             ;
                    LDA.w $07BA,y             ;
                    EOR.b $09                 ;
                    AND.b #$07                ;
                    CLC                       ;
                    ADC.b #$B0                ;
                    STA.w $0BB4,x             ;
                    INC.w $0BB8,x             ;
CODE_04F556:        LDX.b #$03                ;
CODE_04F558:        LDA.w $0BB8,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $F582,y             ;
                    STA.b $00                 ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $0BB0,x             ;
                    STA.w $0800,y             ;
                    LDA.w $0BB4,x             ;
                    STA.w $0801,y             ;
                    LDA.b $00                 ;
                    STA.w $0802,y             ;
                    LDA.b #$25                ;
                    STA.w $0803,y             ;
                    DEX                       ;
                    BPL   CODE_04F558         ;
                    RTS                       ;

                    db $F5,$E4,$F4,$E5

CODE_04F586:        LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.w $0B9F               ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0904,y             ;
                    STA.w $090C,y             ;
                    LDA.w $0238               ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0909,y             ;
                    STA.w $090D,y             ;
                    LDA.w $0B9F               ;
                    AND.b #$0C                ;
                    TAX                       ;
                    LDA.b #$04                ;
                    STA.b $00                 ;
CODE_04F5BF:        LDA.w $F5DA,x             ;
                    STA.w $0902,y             ;
                    LDA.w $F5EA,x             ;
                    STA.w $0903,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $00                 ;
                    BNE   CODE_04F5BF         ;
                    RTS                       ;

                    db $CE,$CE,$EE,$EE,$E0,$E2,$E0,$E2
                    db $EE,$EE,$CE,$CE,$E2,$E0,$E2,$E0

                    db $2D,$4D,$2D,$4D,$2D,$2D,$AD,$AD
                    db $AD,$CD,$AD,$CD,$4D,$4D,$CD,$CD

CODE_04F5FA:        JSR.w CODE_04FA7B
                    LDA.w $0F7F               ;
                    BNE   CODE_04F605         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F605:        JSR.w CODE_04FD66         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $01                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_03C187         ;
                    LDA.w $0238               ;
                    CMP.b #$A0                ;
                    BCS   CODE_04F624         ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
CODE_04F624:        LDA.w $0238               ;
                    CMP.b #$B8                ;
                    BCC   CODE_04F64A         ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    STZ.w $00A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    LDA.w $0BA4               ;
                    CMP.b #$01                ;
                    BNE   CODE_04F65A         ;
                    LDA.b #$20                ;
                    STA.w $1600               ;
                    STA.w $0BA4               ;
                    BRA   CODE_04F65A         ;

CODE_04F64A:        LDY.w $0B9D               ;
                    LDA.w $EE5F,y             ;
                    TAY                       ;
                    LDA.w $A1               ;
                    JSR.w CODE_04F6F9         ;
                    JMP.w CODE_04F9D5         ;

CODE_04F65A:        LDA.w $0B9C               ;
                    CMP.b #$02                ;
                    BEQ   CODE_04F678         ;
                    INC.w $0B9C               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $03AE               ;
                    LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $021A               ;
                    STZ.b $09                 ;
CODE_04F678:        LDA.w $0BA0               ;
                    BNE   CODE_04F68C         ;
                    INC.w $0B9F               ;
                    LDA.w $0B9F               ;
                    CMP.b #$40                ;
                    BCC   CODE_04F69B         ;
                    LDA.b #$40                ;
                    STA.w $0B9F               ;
CODE_04F68C:        INC.w $0BA0               ;
                    LDA.w $0BA0               ;
                    CMP.b #$88                ;
                    BCC   CODE_04F69B         ;
                    LDA.b #$88                ;
                    STA.w $0BA0               ;
CODE_04F69B:        JSR.w CODE_04F74C         ;
                    JSR.w CODE_04FD29         ;
                    JMP.w CODE_04F9D5         ;

                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0904,y             ;
                    STA.w $090C,y             ;
                    LDA.w $0238               ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0909,y             ;
                    STA.w $090D,y             ;
                    LDA.b #$CE                ;
                    STA.w $0902,y             ;
                    STA.w $0906,y             ;
                    STA.w $090A,y             ;
                    STA.w $090E,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    LDA.b #$6D                ;
                    STA.w $0907,y             ;
                    LDA.b #$AD                ;
                    STA.w $090B,y             ;
                    LDA.b #$CD                ;
                    STA.w $090F,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    RTS                       ;

CODE_04F6F9:        LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0904,y             ;
                    STA.w $090C,y             ;
                    LDA.w $0238               ;
                    STA.w $0909,y             ;
                    STA.w $090D,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b #$CE                ;
                    STA.w $090A,y             ;
                    STA.w $090E,y             ;
                    LDA.b #$DE                ;
                    STA.w $0902,y             ;
                    STA.w $0906,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    STA.w $090B,y             ;
                    LDA.b #$6D                ;
                    STA.w $0907,y             ;
                    STA.w $090F,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    RTS                       ;

CODE_04F74C:        LDA.w $0B9F               ;
                    SEC                       ;
                    SBC.b #$28                ;
                    BPL   CODE_04F756         ;
                    LDA.b #$00                ;
CODE_04F756:        LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.w $0BA0               ;
                    AND.b #$08                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $01                 ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.w $0BA0               ;
                    CLC                       ;
                    ADC.b $01                 ;
                    STA.w $0900               ;
                    STA.w $0910               ;
                    CLC                       ;
                    ADC.b #$10                ;
                    SEC                       ;
                    SBC.b $01                 ;
                    STA.w $0904               ;
                    STA.w $0914               ;
                    CLC                       ;
                    ADC.b #$10                ;
                    SEC                       ;
                    SBC.b $01                 ;
                    STA.w $0908               ;
                    STA.w $0918               ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b $00                 ;
                    CLC                       ;
                    ADC.b $01                 ;
                    STA.w $0911               ;
                    STA.w $0915               ;
                    STA.w $0919               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0901               ;
                    STA.w $0905               ;
                    STA.w $0909               ;
                    LDA.b #$DE                ;
                    STA.w $0902               ;
                    STA.w $090A               ;
                    LDA.b #$EC                ;
                    STA.w $0906               ;
                    LDA.b #$CE                ;
                    STA.w $0912               ;
                    STA.w $091A               ;
                    LDA.b #$EA                ;
                    STA.w $0916               ;
                    LDA.b #$2D                ;
                    STA.w $0903               ;
                    STA.w $0907               ;
                    STA.w $0913               ;
                    STA.w $0917               ;
                    LDA.b #$6D                ;
                    STA.w $090B               ;
                    STA.w $091B               ;
                    LDA.b #$02                ;
                    STA.w $0D00               ;
                    STA.w $0D04               ;
                    STA.w $0D08               ;
                    STA.w $0D10               ;
                    STA.w $0D14               ;
                    STA.w $0D18               ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.w $0BA0               ;
                    INC   A                   ;
                    INC   A                   ;
                    STA.w $0920               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0924               ;
                    INC   A                   ;
                    STA.w $0928               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $092C               ;
                    INC   A                   ;
                    STA.w $0930               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0934               ;
                    INC   A                   ;
                    STA.w $0938               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $093C               ;
                    LDA.b #$C8                ;
                    STA.w $0921               ;
                    STA.w $0925               ;
                    STA.w $0929               ;
                    STA.w $092D               ;
                    STA.w $0931               ;
                    STA.w $0935               ;
                    STA.w $0939               ;
                    STA.w $093D               ;
                    LDA.w $0BA0               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_04F846         ;
                    LDA.b #$0E                ;
                    STA.w $1600               ;
CODE_04F846:        LDA.w $0BA0               ;
                    AND.b #$08                ;
                    ASL   A                   ;
                    ORA.b #$CB                ;
                    STA.w $0922               ;
                    STA.w $092A               ;
                    STA.w $0932               ;
                    STA.w $093A               ;
                    INC   A                   ;
                    STA.w $0926               ;
                    STA.w $092E               ;
                    STA.w $0936               ;
                    STA.w $093E               ;
                    LDA.b #$2D                ;
                    STA.w $0923               ;
                    STA.w $0927               ;
                    STA.w $092B               ;
                    STA.w $092F               ;
                    STA.w $0933               ;
                    STA.w $0937               ;
                    STA.w $093B               ;
                    STA.w $093F               ;
                    LDY.b #$00                ;
CODE_04F883:        LDA.w $0900,y             ;
                    CMP.b #$40                ;
                    BCS   CODE_04F88F         ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
CODE_04F88F:        INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BNE   CODE_04F883         ;
                    RTS                       ;

CODE_04F896:        INC.w $0F7F               ;
                    LDA.w $0F7F               ;
                    CMP.b #$D0                ;
                    BCC   CODE_04F8AB         ;
                    JSR.w CODE_04FD29         ;
                    LDA.b #$D0                ;
                    STA.w $0F7F               ;
                    JMP.w CODE_04F8BA         ;

CODE_04F8AB:        CMP.b #$20                ;
                    BCC   CODE_04F8BA         ;
                    PHA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_04F8B9         ;
                    LDA.b #$0E                ;
                    STA.w $1600               ;
CODE_04F8B9:        PLA                       ;
CODE_04F8BA:        LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BCC   CODE_04F8C3         ;
                    LDA.b #$03                ;
CODE_04F8C3:        PHA                       ;
                    JSR.w CODE_04F8DC         ;
                    PLA                       ;
                    CMP.b #$02                ;
                    BNE   CODE_04F8D9         ;
                    LDA.w $0BA4               ;
                    BNE   CODE_04F8D9         ;
                    LDA.b #$2B                ;
                    STA.w $1600               ;
                    STA.w $0BA4               ;
CODE_04F8D9:        JMP.w CODE_04F9D5         ;

CODE_04F8DC:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.b #$08                ;
                    LDA.b #$88                ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    LDA.b #$90                ;
                    STA.w $0904,y             ;
                    LDA.b #$B0                ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b #$C0                ;
                    STA.w $0909,y             ;
                    LDA.b #$80                ;
                    STA.w $0902,y             ;
                    INC   A                   ;
                    STA.w $0906,y             ;
                    LDA.b #$A0                ;
                    STA.w $090A,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    STA.w $090B,y             ;
                    LDY.b #$00                ;
CODE_04F917:        LDA.w $F9B5,x             ;
                    STA.w $0900,y             ;
                    INY                       ;
                    INX                       ;
                    CPY.b #$08                ;
                    BCC   CODE_04F917         ;
                    LDA.b #$02                ;
                    STA.w $0D00               ;
                    STA.w $0D04               ;
                    STA.w $0D08               ;
                    STA.w $0D0C               ;
                    STA.w $0D10               ;
                    LDA.b #$7E                ;
                    CLC                       ;
                    ADC.w $0F7F               ;
                    STA.w $091C               ;
                    CMP.b #$88                ;
                    BCS   CODE_04F945         ;
                    LDA.b #$F0                ;
                    BRA   CODE_04F947         ;

CODE_04F945:        LDA.b #$C0                ;
CODE_04F947:        STA.w $091D               ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$02                ;
                    STA.b $01                 ;
                    CLC                       ;
                    ADC.b #$E6                ;
                    STA.w $091E               ;
                    LDA.b #$2D                ;
                    STA.w $091F               ;
                    LDA.b #$02                ;
                    STA.w $0D1C               ;
                    LDY.b #$20                ;
                    LDX.b #$06                ;
                    LDA.b #$78                ;
                    CLC                       ;
                    ADC.w $0F7F               ;
                    STA.b $00                 ;
CODE_04F96E:        LDA.b $00                 ;
                    STA.w $0900,y             ;
                    STA.w $0904,y             ;
                    CMP.b #$91                ;
                    BCS   CODE_04F984         ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    BRA   CODE_04F98E         ;

CODE_04F984:        LDA.b #$C0                ;
                    STA.w $0901,y             ;
                    LDA.b #$C8                ;
                    STA.w $0905,y             ;
CODE_04F98E:        LDA.b #$BA                ;
                    CLC                       ;
                    ADC.b $01                 ;
                    STA.w $0902,y             ;
                    INC   A                   ;
                    STA.w $0906,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    LDA.b $00                 ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    STA.b $00                 ;
                    DEX                       ;
                    BNE   CODE_04F96E         ;
                    RTS                       ;

                    db $98,$C0,$E4,$2D,$90,$C0,$A1,$2D
                    db $99,$BF,$E4,$2D,$90,$C0,$A1,$2D
                    db $9B,$BF,$E2,$2D,$90,$C0,$E0,$2D
                    db $90,$C0,$E0,$2D,$90,$C0,$E0,$2D

CODE_04F9D5:        LDA.w $0BA6               ;
                    BEQ   CODE_04F9E1         ;
                    BMI   CODE_04F9F8         ;
                    DEC.w $0BA6               ;
                    BRA   CODE_04F9F8         ;

CODE_04F9E1:        LDA.w $0BA7               ;
                    BNE   CODE_04F9F8         ;
                    INC.w $0BA7               ;
                    LDA.b #$B8                ;
                    STA.w $03CE               ;
                    LDA.w $0754               ;
                    BNE   CODE_04F9F8         ;
                    LDA.b #$C8                ;
                    STA.w $03CE               ;
CODE_04F9F8:        PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_04F9FC:        PHX                       ;
                    STA.b $02                 ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $02                 ;
                    TAX                       ;
                    LDA.b $00                 ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    LDA.b $01                 ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0909,y             ;
                    LDA.w $FA4B,x             ;
                    STA.w $0902,y             ;
                    LDA.w $FA4C,x             ;
                    STA.w $0906,y             ;
                    LDA.w $FA4D,x             ;
                    STA.w $090A,y             ;
                    LDA.w $FA63,x             ;
                    STA.w $0903,y             ;
                    LDA.w $FA64,x             ;
                    STA.w $0907,y             ;
                    LDA.w $FA65,x             ;
                    STA.w $090B,y             ;
                    LDA.b #$02                ;
                    STA.w $0D08,y             ;
                    PLX                       ;
                    RTS                       ;

                    db $B6,$B6,$C9,$B7,$B7,$CB,$B8,$B9
                    db $EC,$B9,$B8,$EC,$E3,$E2,$E4,$F3
                    db $F2,$E6,$E2,$E3,$E4,$F2,$F3,$E6

                    db $2D,$6D,$2D,$2D,$6D,$2D,$2D,$2D
                    db $2D,$6D,$6D,$6D,$6D,$6D,$6D,$6D
                    db $6D,$6D,$2D,$2D,$2D,$2D,$2D,$2D

CODE_04FA7B:        DEC.w $0F7D               ;
                    LDA.w $0F7D               ;
                    BPL   CODE_04FA8B         ;
                    INC.w $0F7F               ;
                    LDA.b #$07                ;
                    STA.w $0F7D               ;
CODE_04FA8B:        LDA.w $0F7F               ;
                    CMP.b #$03                ;
                    BCC   CODE_04FA97         ;
                    LDA.b #$03                ;
                    STA.w $0F7F               ;
CODE_04FA97:        PHX                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $FAA7,x             ;
                    STA.b $00                 ;
                    LDA.w $FAA8,x             ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

                    dw CODE_04FAAF
                    dw CODE_04FB18
                    dw CODE_04FB5E
                    dw CODE_04FB77

CODE_04FAAF:        LDA.b #$94                ;
                    STA.w $0958               ;
                    LDA.b #$BB                ;
                    STA.w $0959               ;
                    LDA.b #$C0                ;
                    STA.w $095A               ;
                    LDA.b #$2D                ;
                    STA.w $095B               ;
                    LDA.b #$02                ;
                    STA.w $0D58               ;
                    LDA.b #$88                ;
                    STA.w $0960               ;
                    STA.w $0970               ;
                    LDA.b #$90                ;
                    STA.w $0964               ;
                    STA.w $0974               ;
                    LDA.b #$C0                ;
                    STA.w $0971               ;
                    STA.w $0975               ;
                    LDA.b #$9C                ;
                    STA.w $0972               ;
                    INC   A                   ;
                    STA.w $0976               ;
                    LDA.b #$B8                ;
                    STA.w $0961               ;
                    STA.w $0965               ;
                    LDA.b #$8C                ;
                    STA.w $0962               ;
                    INC   A                   ;
                    STA.w $0966               ;
                    LDA.b #$2D                ;
                    STA.w $0973               ;
                    STA.w $0977               ;
                    STA.w $0963               ;
                    STA.w $0967               ;
                    LDA.b #$02                ;
                    STA.w $0D70               ;
                    STA.w $0D74               ;
                    STA.w $0D60               ;
                    STA.w $0D64               ;
                    PLX                       ;
                    RTS                       ;

CODE_04FB18:        LDA.b #$9A                ;
                    STA.w $0958               ;
                    LDA.b #$BE                ;
                    STA.w $0959               ;
                    LDA.b #$C2                ;
                    STA.w $095A               ;
                    LDA.b #$2D                ;
                    STA.w $095B               ;
                    LDA.b #$02                ;
                    STA.w $0D58               ;
                    LDA.b #$88                ;
                    STA.w $0970               ;
                    LDA.b #$90                ;
                    STA.w $0974               ;
                    LDA.b #$C0                ;
                    STA.w $0971               ;
                    STA.w $0975               ;
                    LDA.b #$99                ;
                    STA.w $0972               ;
                    INC   A                   ;
                    STA.w $0976               ;
                    LDA.b #$2D                ;
                    STA.w $0973               ;
                    STA.w $0977               ;
                    LDA.b #$02                ;
                    STA.w $0D70               ;
                    STA.w $0D74               ;
                    PLX                       ;
                    RTS                       ;

CODE_04FB5E:        LDA.b #$9C                ;
                    STA.w $0958               ;
                    LDA.b #$C1                ;
                    STA.w $0959               ;
                    LDA.b #$C4                ;
                    STA.w $095A               ;
                    LDA.b #$2D                ;
                    STA.w $095B               ;
                    LDA.b #$02                ;
                    STA.w $0D58               ;
CODE_04FB77:        LDA.b #$88                ;
                    STA.w $0970               ;
                    LDA.b #$90                ;
                    STA.w $0974               ;
                    LDA.b #$C0                ;
                    STA.w $0971               ;
                    STA.w $0975               ;
                    LDA.b #$C6                ;
                    STA.w $0972               ;
                    INC   A                   ;
                    STA.w $0976               ;
                    LDA.b #$2D                ;
                    STA.w $0973               ;
                    STA.w $0977               ;
                    LDA.b #$02                ;
                    STA.w $0D70               ;
                    STA.w $0D74               ;
                    PLX                       ;
                    RTS                       ;

CODE_04FBA4:        LDA.b #$0F                ;
                    STA.w $1600               ;
                    LDA.w $0754               ;
                    EOR.b #$01                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$E0                ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $03CE               ;
                    LDY.b #$9C                ;
                    LDA.b #$0B                ;
                    STA.b $01                 ;
                    STZ.b $00                 ;
                    LDA.b #$00                ;
CODE_04FBC5:        STA.b ($00),y             ;
                    INY                       ;
                    CPY.b #$BF                ;
                    BNE   CODE_04FBC5         ;
                    INC.w $0B9C               ;
                    DEC.w $0BA6               ;
                    LDA.w $075F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $FBE4,x             ;
                    STA.b $00                 ;
                    LDA.w $FBE5,x             ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

                    dw CODE_04FBFE
                    dw CODE_04FC26
                    dw CODE_04FC4E
                    dw CODE_04FC7C
                    dw CODE_04FCAE
                    dw CODE_04FCD4
                    dw CODE_04FCEE
                    dw CODE_04FBFE
                    dw CODE_04FBFE
                    dw CODE_04FCAE
                    dw CODE_04FCD4
                    dw CODE_04FCEE
                    dw CODE_04FBFE

CODE_04FBFE:        LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $021A               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $03AE               ;
                    LDA.b #$08                ;
                    STA.w $0F7D               ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    RTS                       ;

CODE_04FC26:        LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    STA.w $021A               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    STA.w $03AE               ;
                    LDA.b #$08                ;
                    STA.w $0F7D               ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    RTS                       ;

CODE_04FC4E:        LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $021A               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $03AE               ;
                    LDA.b #$08                ;
                    STA.w $0F7D               ;
                    STZ.w $021D               ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    STZ.w $0BA0               ;
                    RTS                       ;

CODE_04FC7C:        LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $021A               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $03AE               ;
                    STA.w $0BB0               ;
                    STA.w $0BB1               ;
                    STA.w $0BB2               ;
                    STA.w $0BB3               ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    STZ.w $0E67               ;
                    RTS                       ;

CODE_04FCAE:        LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    STA.w $021A               ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    STA.w $0238               ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    LDA.b #$FE                ;
                    STA.w $0B9E               ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    RTS                       ;

CODE_04FCD4:        LDA.w $021A               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    STA.w $021A               ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    LDA.b #$FD                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    RTS                       ;

CODE_04FCEE:        STZ.w $1600               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    RTS                       ;

CODE_04FCFD:        REP   #$20                ;
                    SEC                       ;
                    SBC.w #$0008              ;
                    SEC                       ;
                    SBC.w $0042               ;
                    STA.b $01                 ;
                    SEP   #$20                ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    STA.w $090B,y             ;
                    XBA                       ;
                    CMP.b #$00                ;
                    BEQ   CODE_04FD20         ;
                    LDA.b #$01                ;
CODE_04FD20:        ORA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D08,y             ;
                    RTS                       ;

CODE_04FD29:        LDA.w $03CE               ;
                    CMP.b #$D0                ;
                    BCC   CODE_04FD42         ;
                    AND.b #$08                ;
                    BEQ   CODE_04FD42         ;
                    LDA.w $03CE               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $03CE               ;
                    LDA.b #$30                ;
                    STA.w $0BA6               ;
CODE_04FD42:        RTS                       ;

CODE_04FD43:        LDA.w $0EEE               ;
                    BEQ   CODE_04FD4C         ;
                    DEC.w $0EEE               ;
                    RTS                       ;

CODE_04FD4C:        LDA.w $0BA3               ;
                    CMP.b #$C0                ;
                    BCS   CODE_04FD61         ;
                    INC.w $0BA3               ;
                    LDA.w $0BA3               ;
                    CMP.b #$C0                ;
                    BNE   CODE_04FD60         ;
                    JSR.w CODE_04FD74         ;
CODE_04FD60:        RTS                       ;

CODE_04FD61:        JSL.l CODE_048600         ;
                    RTS                       ;

CODE_04FD66:        LDA.w $0BA4               ;
                    BNE   CODE_04FD73         ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    STA.w $0BA4               ;
CODE_04FD73:        RTS                       ;

CODE_04FD74:        REP   #$20                ;\
                    PHD                       ; |16-bit A
                    LDA.w #$1700              ; |Direct page = $7E:1700
                    TCD                       ;/
                    LDA.w #$F15A              ;
                    STA.b $02                 ;
                    LDA.w #$1300              ;
                    STA.b $04                 ;
                    LDA.w #$0019              ;"P" With no properties
                    STA.b $06                 ;
                    LDA.w #$001E              ;"U" With no properties
                    STA.b $08                 ;
                    LDA.w #$001C              ;"S" With no properties
                    STA.b $0A                 ;
                    LDA.w #$0011              ;"H" With no properties
                    STA.b $0C                 ;
                    LDA.w #$0028              ;" " With no properties
                    STA.b $0E                 ;
                    LDA.w #$001C              ;"S" With no properties
                    STA.b $10                 ;
                    LDA.w #$001D              ;"T" With no properties
                    STA.b $12                 ;
                    LDA.w #$000A              ;"A" With no properties
                    STA.b $14                 ;
                    LDA.w #$001B              ;"R" With no properties
                    STA.b $16                 ;
                    LDA.w #$001D              ;"T" With no properties
                    STA.b $18                 ;
                    SEP   #$20                ;
                    LDA.b #$FF                ;"End of tilemap marker" byte (?)
                    STA.b $1A                 ;
                    PLD                       ;
                    LDA.b #$15                ;\"Push start" SFX at princess rescued sequence
                    STA.w $1603               ;/
                    RTS                       ;Return

;-------Clear BG1/BG2 layer scrolling
CODE_04FDC4:        STZ.w $073F               ;\[?]
                    STZ.w $0740               ;/
                    STZ.w $210D               ;\No BG1 X-scrolling
                    STZ.w $210D               ;/
                    STZ.w $210E               ;\No BG1 Y-scrolling
                    STZ.w $210E               ;/
                    STZ.w $210F               ;\No BG2 X-scrolling
                    STZ.w $210F               ;/
                    STZ.w $2110               ;\No BG2 X-scrolling
                    STZ.w $2110               ;/
                    STZ.w $2111               ;\No BG2 Y-scrolling
                    STZ.w $2111               ;/
                    STZ.w $2112               ;\No BG2 Y-scrolling
                    STZ.w $2112               ;/
                    RTL                       ;
