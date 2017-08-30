; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $058000
    fillbyte $FF : fill   $8000

ORG $058000
;Bank 5. It's dedicated to the SMB1 backgrounds.
CODE_058000:        STZ.w $0EDC               ;
                    PHB                       ;\
                    LDA.b #$7E                ; |
                    PHA                       ; |
                    PLB                       ; |
                    REP   #$30                ; |
                    LDX.w #$0000              ; |Clear Background map16 tilemap
                    LDA.w #$0000              ; |
CODE_058010:        STA.w $D000,x             ; |
                    STA.w $D100,x             ; |
                    STA.w $D200,x             ; |
                    STA.w $D300,x             ; |
                    STA.w $D400,x             ; |
                    STA.w $D500,x             ; |
                    STA.w $D600,x             ; |
                    STA.w $D700,x             ; |
                    STA.w $D800,x             ; |
                    STA.w $D900,x             ; |
                    STA.w $DA00,x             ; |
                    STA.w $DB00,x             ; |
                    STA.w $DC00,x             ; |
                    INX                       ; |
                    INX                       ; |
                    CPX.w #$0100              ; |
                    BNE   CODE_058010         ; |
                    PLB                       ;/
                    PHB                       ;\
                    PHK                       ; |Data bank = current bank
                    PLB                       ; |
                    STZ.w $0EC0               ; |Index to the current BG map16 end offset
                    LDA.w $0E65               ; |
                    AND.w #$00FF              ; |Store current background to $DB. $0E65 is clone
                    BEQ   CODE_05804F         ; |of $DB (or the opposite......)
                    STA.b $DB                 ; |
CODE_05804F:        LDA.b $DB                 ; |
                    AND.w #$00FF              ; |Layer 2 background
                    ASL   A                   ; |to 16-bit index
                    TAX                       ; |
                    LDA.w $AD04,x             ; |< relative index to table
                    STA.b $02                 ; |Get index to a table. Index is indexed by
CODE_05805B:        REP   #$30                ; |the 16-bit index from before. $02 = index
                    LDX.b $02                 ; |X = index
                    LDA.w $B557,x             ; |
                    STA.b $04                 ; |
                    INC.b $02                 ; |increase pointer to read next word next time.
                    INC.b $02                 ; |
                    AND.w #$03F0              ; |
                    LSR   A                   ; |note to self: continue documenting this.
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $EF                 ;
                    LDA.b $04                 ;\ Load data
                    AND.w #$000F              ; |Extract HDMA gradient type
                    STA.b $F1                 ;/Store to HDMA gradient type
                    LDA.b $04                 ;\Load data
                    AND.w #$E000              ; |
                    STA.b $ED                 ;/
                    LDA.b $04                 ;
                    LSR   A                   ;
                    AND.w #$0E00              ;
                    ORA.b $ED                 ;
                    XBA                       ;
                    STA.b $ED                 ;
                    AND.w #$00F0              ;
                    CMP.w #$00E0              ;
                    BNE   CODE_0580B3         ;
                    LDA.b $EF                 ;
                    CMP.w #$003F              ;
                    BNE   CODE_0580AE         ;
                    INC.w $0EC0               ;
                    INC.w $0EC0               ;
                    LDA.w $0EC0               ;
                    XBA                       ;
                    TAX                       ;
                    LDA.w #$FFFF              ;
                    STA.l $7ED000,x           ;
                    JMP.w CODE_059166         ;

CODE_0580AE:        JSR.w CODE_058F19         ;
                    BRA   CODE_05805B         ;

CODE_0580B3:        LDA.w $0EC0               ;
                    XBA                       ;
                    CLC                       ;
                    ADC.b $ED                 ;
                    STA.b $EB                 ;
                    LDA.b $EF                 ;
                    CMP.w #$0010              ;
                    BCC   CODE_0580C9         ;
                    JSR.w CODE_058E85         ;
                    JMP.w CODE_05805B         ;

CODE_0580C9:        ASL   A                   ;
                    TAX                       ;
                    LDA.b $DB                 ;\
                    ASL   A                   ; |background to index
                    TAY                       ;/
                    LDA.w PNTR_0580E1,y       ;\Setup indirect pointer based on background.
                    STA.b $04                 ;/
                    LDA.w #$0005              ;\Bank byte: $05
                    STA.b $06                 ;/
                    TXY                       ;
                    LDA.b [$04],y             ;
                    STA.b $00                 ;
                    JMP.w ($0000)             ;Jump to background generation/background loading routines?

PNTR_0580E1:        dw $8141
                    dw $8141
                    dw $812B
                    dw $8149
                    dw $812D
                    dw $8149
                    dw $8149
                    dw $8149
                    dw $8149
                    dw $81DF
                    dw $8125
                    dw $81A7
                    dw $8149
                    dw $81A7
                    dw $8149
                    dw $81C7
                    dw $8149
                    dw $8149
                    dw $81C7
                    dw $8149
                    dw $81A7
                    dw $81A7
                    dw $81A7
                    dw $8149
                    dw $8149
                    dw $8169
                    dw $8169
                    dw $8149
                    dw $818F
                    dw $818F
                    dw $818F
                    dw $818F
                    dw $818F
                    dw $816F
                    dw $823F
                    dw $8244
                    dw $81F5
                    dw $82E2
                    dw $9004
                    dw $864E
                    dw $864C
                    dw $8643
                    dw $8639
                    dw $864E
                    dw $864E
                    dw $8639
                    dw $864C
                    dw $864E
                    dw $8724
                    dw $8726
                    dw $875E
                    dw $8760
                    dw $8995
                    dw $86E9
                    dw $86E9
                    dw $86E9
                    dw $8845
                    dw $8843 ;used in 1-1
                    dw $883A
                    dw $8838
                    dw $87EA
                    dw $87F4
                    dw $8800
                    dw $880C
                    dw $8818
                    dw $8824
                    dw $882C
                    dw $848D
                    dw $89E0
                    dw $89FD
                    dw $8A2E
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $85EE
                    dw $85EC
                    dw $8B51
                    dw $8B51
                    dw $8B8F
                    dw $8C66
                    dw $8CE0
                    dw $8D8A
                    dw $8B22
                    dw $8A68
                    dw $8AD5
                    dw $8DD3
                    dw $8DD1
                    dw $8DC5
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8699
                    dw $8445
                    dw $8443
                    dw $8439
                    dw $8437
                    dw $8432
                    dw $8430
                    dw $8426
                    dw $8424
                    dw $83E9
                    dw $83E7
                    dw $83DD
                    dw $83DB
                    dw $8307

                    db $07,$0A,$0B,$12,$19,$29,$2A,$33
                    db $34,$30,$00,$07,$0A,$1D,$19,$00
                    db $29,$2A,$2D,$30

                    LDY.b $F1                 ;
                    LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.w $81E1,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $81E2,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $81E3,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $81E4,y             ;
                    STA.l $7ED030,x           ;
                    LDA.w $81E5,y             ;
                    STA.l $7ED040,x           ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $01,$02,$03,$04,$08,$09,$05,$06 ;
                    db $10,$11,$17,$18,$1B,$1C,$1F,$20 ;
                    db $21,$22,$25,$26,$23,$24,$2B,$2C ;
                    db $2E,$2F,$31,$32,$A0,$0E,$00,$80 ;
                    db $03,$A0,$00,$00                 ;

                    LDX.b $EB                 ;
                    INX                       ;
                    SEP   #$20                ;
                    LDA.w $8223,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $8224,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $8225,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $8226,y             ;
                    STA.l $7ED011,x           ;
                    LDA.w $8229,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $822A,y             ;
                    STA.l $7ED021,x           ;
                    LDA.b #$30                ;
                    STA.b $E4                 ;
                    STZ.b $E5                 ;
CODE_05827C:        REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b $E4                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    CMP.b #$D0                ;
                    BCS   CODE_0582AD         ;
                    LDA.w $8227,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $8228,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $8229,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $822A,y             ;
                    STA.l $7ED011,x           ;
                    LDA.b #$20                ;
                    STA.b $E4                 ;
                    STZ.b $E5                 ;
                    BRA   CODE_05827C         ;

CODE_0582AD:        LDA.w $822B,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $822C,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $822D,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $822E,y             ;
                    STA.l $7ED011,x           ;
                    LDA.w $822F,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8230,y             ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $00,$00,$41,$00,$82,$00

                    LDA.b $F1                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $82DC,y             ;
                    TAY                       ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
CODE_0582F3:        LDA.w $B494,y             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_058302         ;
                    STA.l $7ED000,x           ;
                    INY                       ;
                    INX                       ;
                    BRA   CODE_0582F3         ;

CODE_058302:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDX.b $EB                 ;
                    LDA.b $F1                 ;
                    STA.b $E6                 ;
                    SEP   #$20                ;
                    STZ.b $E8                 ;
CODE_058311:        LDA.b #$09                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$0E                ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED050,x           ;
                    LDA.b #$12                ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED040,x           ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_058340         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    INC.b $E8                 ;
CODE_058340:        SEP   #$20                ;
                    DEC.b $E6                 ;
                    LDA.b $E6                 ;
                    BMI   CODE_05837F         ;
                    LDA.b #$09                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$0F                ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED050,x           ;
                    LDA.b #$13                ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED040,x           ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_058377         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    INC.b $E8                 ;
CODE_058377:        SEP   #$20                ;
                    DEC.b $E6                 ;
                    LDA.b $E6                 ;
                    BPL   CODE_058311         ;
CODE_05837F:        LDX.b $EB                 ;
                    LDA.b $F1                 ;
                    CMP.b #$04                ;
                    BCC   CODE_058389         ;
                    LDA.b #$04                ;
CODE_058389:        TAY                       ;
                    LDA.w $83B0,y             ;
                    STA.l $7ECFFF,x           ;
                    REP   #$20                ;
                    LDA.b $E8                 ;
                    BEQ   CODE_05839D         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_05839D:        TXA                       ;
                    CLC                       ;
                    ADC.b $F1                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $83B5,y             ;
                    STA.l $7ED001,x           ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $08,$08,$04,$04,$08

                    db $0A,$06,$0A,$06,$0A,$01,$02,$03
                    db $02,$04,$01,$02,$02,$03,$02,$02
                    db $04,$07,$08,$09,$07,$0E,$08,$0E
                    db $09,$01,$03,$04,$04,$06,$02,$04
                    db $02,$00,$05,$0C,$0F,$14

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $EB                 ;
                    BRA   CODE_0583E9         ;

                    INC.b $EB                 ;
CODE_0583E9:        LDX.b $EB                 ;
                    LDA.b $F1                 ;
                    TAY                       ;
                    LDA.w $83D1,y             ;
                    AND.w #$00FF              ;
                    STA.b $F1                 ;
                    LDA.w $83D6,y             ;
                    AND.w #$00FF              ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0583FF:        LDA.w $83BA,y             ;
                    STA.l $7ED000,x           ;
                    INX                       ;
                    INY                       ;
                    TXA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_058417         ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    SEP   #$20                ;
CODE_058417:        DEC.b $F1                 ;
                    BPL   CODE_0583FF         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $05,$0A,$06,$0C

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $EB                 ;
                    BRA   CODE_058432         ;

                    INC.b $EB                 ;
CODE_058432:        LDY.w #$0001              ;
                    BRA   CODE_058448         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $EB                 ;
                    BRA   CODE_058445         ;

                    INC.b $EB                 ;
CODE_058445:        LDY.w #$0000              ;
CODE_058448:        LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.w $8420,y             ;
                    STA.l $7ED000,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
CODE_05845F:        LDA.l $7ED000,x           ;
                    CMP.b #$0E                ;
                    BNE   CODE_05846B         ;
                    LDA.b #$0D                ;
                    BRA   CODE_058476         ;

CODE_05846B:        CMP.b #$02                ;
                    BNE   CODE_058473         ;
                    LDA.b #$0B                ;
                    BRA   CODE_058476         ;

CODE_058473:        LDA.w $8422,y             ;
CODE_058476:        STA.l $7ED000,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    BPL   CODE_05845F         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    LDA.l $7ED000,x           ;
                    BEQ   CODE_0584A6         ;
                    LDA.b #$38                ;
                    BRA   CODE_0584A8         ;

CODE_0584A6:        LDA.b #$34                ;
CODE_0584A8:        STA.l $7ED000,x           ;
                    LDA.l $7ED010,x           ;
                    BEQ   CODE_0584BA         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0584BA         ;
                    LDA.b #$44                ;
                    BRA   CODE_0584BC         ;

CODE_0584BA:        LDA.b #$40                ;
CODE_0584BC:        STA.l $7ED010,x           ;
                    LDA.l $7ED020,x           ;
                    BEQ   CODE_0584CE         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0584CE         ;
                    LDA.b #$4D                ;
                    BRA   CODE_0584D0         ;

CODE_0584CE:        LDA.b #$4C                ;
CODE_0584D0:        STA.l $7ED020,x           ;
                    INX                       ;
                    LDA.l $7ED000,x           ;
                    BEQ   CODE_0584F7         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0584F7         ;
                    CMP.b #$18                ;
                    BEQ   CODE_0584F3         ;
                    CMP.b #$07                ;
                    BEQ   CODE_0584F3         ;
                    CMP.b #$17                ;
                    BEQ   CODE_0584EF         ;
                    LDA.b #$39                ;
                    BRA   CODE_0584F9         ;

CODE_0584EF:        LDA.b #$3D                ;
                    BRA   CODE_0584F9         ;

CODE_0584F3:        LDA.b #$36                ;
                    BRA   CODE_0584F9         ;

CODE_0584F7:        LDA.b #$35                ;
CODE_0584F9:        STA.l $7ED000,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$48                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    INX                       ;
CODE_058510:        DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BNE   CODE_058519         ;
                    JMP.w CODE_058599         ;

CODE_058519:        LDA.l $7ED000,x           ;
                    BNE   CODE_058539         ;
                    LDA.b #$36                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$35                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED011,x           ;
                    BRA   CODE_05856F         ;

CODE_058539:        CMP.b #$18                ;
                    BEQ   CODE_058557         ;
                    LDA.b #$3A                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$39                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED011,x           ;
                    BRA   CODE_05856F         ;

CODE_058557:        LDA.b #$36                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$35                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED011,x           ;
CODE_05856F:        LDA.b #$47                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$48                ;
                    STA.l $7ED021,x           ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED031,x           ;
                    INX                       ;
                    INX                       ;
                    TXA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_058510         ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    SEP   #$20                ;
                    JMP.w CODE_058510         ;

CODE_058599:        LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$47                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED031,x           ;
                    LDA.l $7ED000,x           ;
                    BNE   CODE_0585CF         ;
                    LDA.b #$36                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$37                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$43                ;
                    STA.l $7ED011,x           ;
                    LDA.b #$49                ;
                    STA.l $7ED021,x           ;
                    BRA   CODE_0585E7         ;

CODE_0585CF:        LDA.b #$3A                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$3B                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$45                ;
                    STA.l $7ED011,x           ;
                    LDA.b #$4A                ;
                    STA.l $7ED021,x           ;
CODE_0585E7:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    INC.b $EB                 ;
                    LDX.b $EB                 ;
                    STX.b $E2                 ;
                    LDA.b $EF                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $878A,y             ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0585FC:        LDA.w $B323,y             ;
                    BEQ   CODE_058610         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_058634         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_058624         ;
                    LDA.w $B323,y             ;
                    STA.l $7ED000,x           ;
CODE_058610:        INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_058620         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_058620:        SEP   #$20                ;
                    BRA   CODE_0585FC         ;

CODE_058624:        REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E2                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    BRA   CODE_0585FC         ;

CODE_058634:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    INX                       ;
                    BRA   CODE_058650         ;

                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    BRA   CODE_058650         ;

                    INC.b $EB                 ;
                    LDX.b $EB                 ;
CODE_058650:        STX.b $E2                 ;
                    LDA.b $EF                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $87AA,y             ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_05865C:        LDA.w $B3E2,y             ;
                    BEQ   CODE_058670         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_058694         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_058684         ;
                    LDA.w $B3E2,y             ;
                    STA.l $7ED000,x           ;
CODE_058670:        INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_058680         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_058680:        SEP   #$20                ;
                    BRA   CODE_05865C         ;

CODE_058684:        REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E2                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    BRA   CODE_05865C         ;

CODE_058694:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDX.b $EB                 ;
                    STX.b $E2                 ;
                    LDA.b $EF                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $87BE,y             ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0586A7:        LDA.w $AD48,y             ;
                    BEQ   CODE_0586B8         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0586E4         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_0586CC         ;
                    STA.l $7ED000,x           ;
CODE_0586B8:        INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0586C8         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0586C8:        SEP   #$20                ;
                    BRA   CODE_0586A7         ;

CODE_0586CC:        REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E2                 ;
                    TAX                       ;
                    AND.w #$00F0              ;
                    CMP.w #$00F0              ;
                    BEQ   CODE_0586E4         ;
                    SEP   #$20                ;
                    INY                       ;
                    BRA   CODE_0586A7         ;

CODE_0586E4:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    DEC.b $EF                 ;
                    LDA.b $EF                 ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $F1                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.w $91E4,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $91E5,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $91E6,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $91E7,y             ;
                    STA.l $7ED011,x           ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $04,$05,$0B,$0C,$0B,$0C

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $871E               ;\
                    STA.l $7ED000,x           ; |
                    LDA.w $871F               ; |
                    STA.l $7ED001,x           ; |
                    LDA.w $8720               ; |
                    STA.l $7ED010,x           ; |
                    LDA.w $8721               ; |Why waste cycles, Nintendo?
                    STA.l $7ED011,x           ; |
                    LDA.w $8722               ; |
                    STA.l $7ED020,x           ; |
                    LDA.w $8723               ; |
                    STA.l $7ED021,x           ;/
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $871E               ;\
                    STA.l $7ED010,x           ; |
                    LDA.w $871F               ; |
                    STA.l $7ED011,x           ; |
                    LDA.w $8720               ; |Why waste cycles, Nintendo?
                    STA.l $7ED020,x           ; |
                    LDA.w $8721               ; |
                    STA.l $7ED021,x           ;/
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $00,$00,$00,$00,$1F,$00,$1F,$00
                    db $3D,$00,$3D,$00,$44,$00,$44,$00
                    db $54,$00,$54,$00,$6E,$00,$00,$00
                    db $B3,$00,$B3,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$04,$00,$18,$00,$2C,$00
                    db $52,$00,$90,$00,$00,$00,$31,$00
                    db $3B,$00,$83,$00,$F5,$00,$4B,$01
                    db $52,$01,$62,$01,$AC,$01,$06,$02
                    db $8D,$02,$D5,$02,$F2,$02,$79,$03
                    db $A0,$03,$9A,$00,$A7,$00,$C9,$00
                    db $D0,$00,$DC,$00,$06,$01,$26,$01

                    LDY.w $87DC               ;
                    LDA.b $EB                 ;
                    TAX                       ;
                    INX                       ;
                    INX                       ;
                    BRA   CODE_05884A         ;

                    LDY.w $87DE               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0012              ;
                    TAX                       ;
                    BRA   CODE_05884A         ;

                    LDY.w $87E0               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0001              ;
                    TAX                       ;
                    BRA   CODE_05884A         ;

                    LDY.w $87E2               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0011              ;
                    TAX                       ;
                    BRA   CODE_05884A         ;

                    LDY.w $87E4               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    BRA   CODE_05884A         ;

                    LDY.w $87E6               ;
                    LDX.b $EB                 ;
                    INX                       ;
                    BRA   CODE_05884A         ;

                    LDY.w $87E8               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0012              ;
                    TAX                       ;
                    BRA   CODE_05884A         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    BRA   CODE_058847         ;

                    INC.b $EB                 ;
                    LDX.b $EB                 ;
CODE_058847:        LDY.w #$0000              ;
CODE_05884A:        STX.b $E2                 ;
                    SEP   #$20                ;
CODE_05884E:        LDA.w $B1A5,y             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0588C6         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_0588A1         ;
                    JSR.w CODE_058874         ;
                    STA.l $7ED000,x           ;
                    INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_058870         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_058870:        SEP   #$20                ;
                    BRA   CODE_05884E         ;

CODE_058874:        STA.b $E4                 ;
                    CMP.b #$12                ;
                    BNE   CODE_05887D         ;
                    JMP.w CODE_0588CB         ;

CODE_05887D:        CMP.b #$03                ;
                    BNE   CODE_058884         ;
                    JMP.w CODE_0588F8         ;

CODE_058884:        CMP.b #$04                ;
                    BNE   CODE_05888B         ;
                    JMP.w CODE_058905         ;

CODE_05888B:        CMP.b #$05                ;
                    BNE   CODE_058892         ;
                    JMP.w CODE_05891A         ;

CODE_058892:        CMP.b #$18                ;
                    BNE   CODE_058899         ;
                    JMP.w CODE_05892F         ;

CODE_058899:        CMP.b #$07                ;
                    BNE   CODE_0588A0         ;
                    JMP.w CODE_05894C         ;

CODE_0588A0:        RTS                       ;

CODE_0588A1:        INY                       ;
                    REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    AND.w #$00F0              ;
                    BEQ   CODE_0588C6         ;
                    DEX                       ;
                    TXA                       ;
                    AND.w #$000F              ;
                    CMP.w #$000F              ;
                    BNE   CODE_0588C0         ;
                    TXA                       ;
                    SEC                       ;
                    SBC.w #$00F0              ;
                    TAX                       ;
CODE_0588C0:        STX.b $E2                 ;
                    SEP   #$20                ;
                    BRA   CODE_05884E         ;

CODE_0588C6:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

CODE_0588CB:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0588F5         ;
                    CMP.b #$18                ;
                    BNE   CODE_0588D9         ;
                    LDA.b #$02                ;
                    BRA   CODE_0588F7         ;

CODE_0588D9:        CMP.b #$06                ;
                    BNE   CODE_0588E1         ;
                    LDA.b #$11                ;
                    BRA   CODE_0588F7         ;

CODE_0588E1:        CMP.b #$16                ;
                    BNE   CODE_0588E9         ;
                    LDA.b #$01                ;
                    BRA   CODE_0588F7         ;

CODE_0588E9:        CMP.b #$05                ;
                    BNE   CODE_0588F1         ;
                    LDA.b #$62                ;
                    BRA   CODE_0588F7         ;

CODE_0588F1:        LDA.b #$10                ;
                    BRA   CODE_0588F7         ;

CODE_0588F5:        LDA.b $E4                 ;
CODE_0588F7:        RTS                       ;

CODE_0588F8:        LDA.l $7ED000,x           ;
                    BEQ   CODE_058902         ;
                    LDA.b #$36                ;
                    BRA   CODE_058904         ;

CODE_058902:        LDA.b $E4                 ;
CODE_058904:        RTS                       ;

CODE_058905:        LDA.l $7ED000,x           ;
                    BEQ   CODE_058917         ;
                    CMP.b #$12                ;
                    BNE   CODE_058913         ;
                    LDA.b #$14                ;
                    BRA   CODE_058919         ;

CODE_058913:        LDA.b #$37                ;
                    BRA   CODE_058919         ;

CODE_058917:        LDA.b $E4                 ;
CODE_058919:        RTS                       ;

CODE_05891A:        LDA.l $7ED000,x           ;
                    BEQ   CODE_05892C         ;
                    CMP.b #$13                ;
                    BNE   CODE_058928         ;
                    LDA.b #$15                ;
                    BRA   CODE_05892E         ;

CODE_058928:        LDA.b #$38                ;
                    BRA   CODE_05892E         ;

CODE_05892C:        LDA.b $E4                 ;
CODE_05892E:        RTS                       ;

CODE_05892F:        LDA.l $7ED000,x           ;
                    BEQ   CODE_058949         ;
                    CMP.b #$16                ;
                    BNE   CODE_05893D         ;
                    LDA.b #$1E                ;
                    BRA   CODE_05894B         ;

CODE_05893D:        CMP.b #$13                ;
                    BNE   CODE_058945         ;
                    LDA.b #$1E                ;
                    BRA   CODE_05894B         ;

CODE_058945:        LDA.b #$1D                ;
                    BRA   CODE_05894B         ;

CODE_058949:        LDA.b $E4                 ;
CODE_05894B:        RTS                       ;

CODE_05894C:        LDA.l $7ED000,x           ;
                    BEQ   CODE_05896E         ;
                    CMP.b #$16                ;
                    BNE   CODE_05895A         ;
                    LDA.b #$0E                ;
                    BRA   CODE_058970         ;

CODE_05895A:        CMP.b #$04                ;
                    BNE   CODE_058962         ;
                    LDA.b #$70                ;
                    BRA   CODE_058970         ;

CODE_058962:        CMP.b #$0B                ;
                    BNE   CODE_05896A         ;
                    LDA.b #$90                ;
                    BRA   CODE_058970         ;

CODE_05896A:        LDA.b #$49                ;
                    BRA   CODE_058970         ;

CODE_05896E:        LDA.b $E4                 ;
CODE_058970:        RTS                       ;

                    db $00,$00,$90,$91,$92,$93,$00,$00
                    db $94,$95,$96,$97,$00,$00,$98,$99
                    db $9A,$9B,$00,$9C,$9D,$9E,$9F,$A0
                    db $00,$A1,$A2,$A3,$A4,$A5,$00,$A6
                    db $A7,$A8,$A9,$AA,$E2,$20


                    LDX.b $EB                 ;
                    LDY.w #$0000              ;
CODE_05899C:        LDA.w $8971,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8972,y             ;
                    STA.l $7ED021,x           ;
                    LDA.w $8973,y             ;
                    STA.l $7ED022,x           ;
                    LDA.w $8974,y             ;
                    STA.l $7ED023,x           ;
                    LDA.w $8975,y             ;
                    STA.l $7ED024,x           ;
                    LDA.w $8976,y             ;
                    STA.l $7ED025,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.w #$0024              ;
                    BNE   CODE_05899C         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDX.b $EB                 ;
                    SEP   #$20                ;
CODE_0589E4:        LDA.b #$09                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$0B                ;
                    STA.l $7ED021,x           ;
                    INX                       ;
                    INX                       ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_0589E4         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDX.b $EB                 ;
                    SEP   #$20                ;
CODE_058A01:        LDA.l $7ED020,x           ;
                    CMP.b #$09                ;
                    BNE   CODE_058A0D         ;
                    LDA.b #$0A                ;
                    BRA   CODE_058A0F         ;

CODE_058A0D:        LDA.b #$04                ;
CODE_058A0F:        STA.l $7ED020,x           ;
                    LDA.b #$01                ;
                    STA.l $7ED030,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_058A01         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDX.b $EB                 ;
                    SEP   #$20                ;
CODE_058A32:        LDA.l $7ED021,x           ;
                    CMP.b #$0B                ;
                    BNE   CODE_058A3E         ;
                    LDA.b #$0A                ;
                    BRA   CODE_058A40         ;

CODE_058A3E:        LDA.b #$04                ;
CODE_058A40:        STA.l $7ED021,x           ;
                    LDA.b #$01                ;
                    STA.l $7ED031,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_058A32         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $7A,$7B,$61,$62,$8C,$8D,$90,$91
                    db $92

                    LDX.b $EB                 ;
                    LDA.w #$0006              ;
                    STA.b $F1                 ;
                    SEP   #$20                ;
                    LDA.w $8A5F               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8A60               ;
                    STA.l $7ED021,x           ;
CODE_058A7F:        LDA.w $8A61               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8A62               ;
                    STA.l $7ED031,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BNE   CODE_058A7F         ;
                    LDA.w $8A63               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8A64               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8A65               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8A66               ;
                    STA.l $7ED041,x           ;
                    LDA.w $8A67               ;
                    STA.l $7ED042,x           ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $70,$71,$72,$73,$74,$75,$76,$77
                    db $78,$79,$7A,$7B,$00,$7C,$7D,$00

                    LDX.b $EB                 ;
                    INX                       ;
                    SEP   #$20                ;
                    STZ.b $E5                 ;
                    LDY.w #$0000              ;
CODE_058ADF:        LDA.w $8AC5,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $8AC6,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $8AC7,y             ;
                    STA.l $7ED002,x           ;
                    LDA.w $8AC8,y             ;
                    STA.l $7ED003,x           ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    TAX                       ;
                    SEP   #$20                ;
                    INC.b $E5                 ;
                    LDA.b $E5                 ;
                    CMP.b #$04                ;
                    BNE   CODE_058ADF         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $2F,$30,$31,$32,$35,$36,$3A,$3B


                    SEP   #$20                ;
                    LDY.w #$0000              ;
                    LDX.b $EB                 ;
CODE_058B29:        LDA.w $8B1A,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8B1B,y             ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    INY                       ;
                    CPY.w #$0008              ;
                    BNE   CODE_058B29         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $01,$1F,$02,$20

CODE_058B51:        SEP   #$20                ;
                    LDX.b $EB                 ;
                    LDY.b $EF                 ;
CODE_058B57:        LDA.w $8B4D,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8B4F,y             ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_058B57         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $08,$09,$05,$06,$07,$05,$03,$04
                    db $05,$0F,$10,$11,$16,$17,$12,$1D
                    db $09,$1E,$06,$07,$05

                    SEP   #$20        
                    LDX.b $EB                 ;
CODE_058B93:        TXA                       ;
                    AND.b #$F0                ;
                    BEQ   CODE_058BB7         ;
                    LDA.l $7ED020,x           ;
                    CMP.b #$0C                ;
                    BEQ   CODE_058BE3         ;
                    LDA.w $8B7A               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8B7B               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8B7C               ;
                    STA.l $7ED022,x           ;
                    BRA   CODE_058BCC         ;

CODE_058BB7:        LDA.w $8B80               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8B81               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8B82               ;
                    STA.l $7ED022,x           ;
CODE_058BCC:        LDA.w $8B7D               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8B7E               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8B7F               ;
                    STA.l $7ED032,x           ;
                    BRA   CODE_058C43         ;

CODE_058BE3:        LDA.w $8B83               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8B84               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8B85               ;
                    STA.l $7ED022,x           ;
                    LDA.w $8B86               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8B87               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8B88               ;
                    STA.l $7ED032,x           ;
                    LDA.w $8B89               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8B8A               ;
                    STA.l $7ED041,x           ;
                    LDA.w $8B8B               ;
                    STA.l $7ED042,x           ;
                    LDA.w $8B8C               ;
                    STA.l $7ED050,x           ;
                    LDA.w $8B8D               ;
                    STA.l $7ED051,x           ;
                    LDA.w $8B8E               ;
                    STA.l $7ED052,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
CODE_058C43:        REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BMI   CODE_058C56         ;
                    JMP.w CODE_058B93         ;

CODE_058C56:        REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $0C,$18,$19,$0A,$0B,$0D,$0E,$13
                    db $14,$1A,$1B

                    SEP   #$20                ;
                    LDX.b $EB                 ;
CODE_058C6A:        LDA.l $7ED020,x           ;
                    CMP.b #$1F                ;
                    BNE   CODE_058CAF         ;
                    LDA.w $8C5E               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8C5F               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8C60               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8C61               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8C62               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8C63               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8C64               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8C65               ;
                    STA.l $7ED041,x           ;
                    INX                       ;
                    DEC.b $F1                 ;
                    BRA   CODE_058CC4         ;

CODE_058CAF:        LDA.w $8C5B               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8C5C               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8C5D               ;
                    STA.l $7ED040,x           ;
CODE_058CC4:        INX                       ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_058C6A         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $33,$34,$0D,$37,$13,$3C,$1A,$1B
                    db $33,$34,$38,$39,$3D,$3E,$40,$1B

                    LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.l $7ED020,x           ;
                    CMP.b #$0C                ;
                    BEQ   CODE_058D26         ;
                    LDA.w $8CD8               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8CD9               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8CDA               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8CDB               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8CDC               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8CDD               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8CDE               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8CDF               ;
                    STA.l $7ED041,x           ;
                    BRA   CODE_058D5E         ;

CODE_058D26:        LDA.w $8CD0               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8CD1               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8CD2               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8CD3               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8CD4               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8CD5               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8CD6               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8CD7               ;
                    STA.l $7ED041,x           ;
CODE_058D5E:        REP   #$20                ;
                    DEC.b $F1                 ;
                    DEC.b $F1                 ;
                    DEC.b $F1                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0030              ;
                    STA.b $EB                 ;
                    LDA.w #$0001              ;
                    STA.b $EF                 ;
                    JMP.w CODE_058B51         ;

                    db $41,$42,$43,$44,$45,$46,$47,$48
                    db $49,$4A,$4B,$4C,$4D,$4E,$4F,$50
                    db $51,$52,$53,$54

                    SEP   #$20                ;
                    LDX.b $EB                 ;
                    LDY.w #$0000              ;
CODE_058D91:        LDA.w $8D76,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8D77,y             ;
                    STA.l $7ED021,x           ;
                    LDA.w $8D78,y             ;
                    STA.l $7ED022,x           ;
                    LDA.w $8D79,y             ;
                    STA.l $7ED023,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.w #$0014              ;
                    BNE   CODE_058D91         ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    LDX.b $EB                 ;
                    LDA.w #$1B1A              ;
                    STA.l $7ED000,x           ;
                    JMP.w CODE_05805B         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.b #$67                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$69                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$68                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$6A                ;
                    STA.l $7ED011,x           ;
                    REP   #$20                ;
                    JMP.w CODE_05805B         ;

                    db $01,$8E,$49,$8E,$55,$8E,$85,$8E
                    db $08,$09,$0D,$0E,$08,$23,$0D,$25
                    db $24,$23,$26,$25,$24,$09,$26,$0E
                    db $00,$08,$00,$0D,$23,$24,$25,$26
                    db $0F,$10,$32,$33,$11,$12,$32,$33
                    db $13,$00,$3C,$3B,$30,$31,$32,$33
                    db $30,$10,$32,$33,$00,$36,$38,$37
                    db $0F,$31,$32,$33,$35,$10,$39,$33
                    db $0F,$10,$32,$33,$35,$12,$32,$33
                    db $23,$24,$25,$26,$11,$12,$32,$33
                    db $21,$22,$25,$26,$23,$24,$27,$28
                    db $00,$00,$26,$00,$06,$05,$07,$02
                    db $0E,$05,$11,$12,$0E,$05,$07,$08
                    db $06,$05,$07,$08,$03,$05,$0C,$0D
                    db $0F,$10,$1D,$02,$03,$05,$1D,$15
                    db $03,$18,$1B,$1B,$03,$05,$16,$15
                    db $19,$18,$1B,$1B,$03,$05,$16,$17
                    db $19,$1A,$1B,$1B

CODE_058E85:        LDA.b $5C                 ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w #$0500              ;
                    STA.b $D9                 ;
                    LDA.w $8DF9,x             ;
                    STA.b $D8                 ;
                    LDA.b $5C                 ;
                    AND.w #$00FF              ;
                    CMP.w #$0002              ;
                    BCS   CODE_058EA9         ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    BRA   CODE_058EAB         ;

CODE_058EA9:        LDX.b $EB                 ;
CODE_058EAB:        LDA.b $EF                 ;
                    SEC                       ;
                    SBC.w #$0010              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    SEP   #$20                ;
                    LDA.b [$D8],y             ;
                    STA.l $7ED020,x           ;
                    INY                       ;
                    LDA.b [$D8],y             ;
                    STA.l $7ED021,x           ;
                    INY                       ;
                    LDA.b [$D8],y             ;
                    STA.l $7ED030,x           ;
                    INY                       ;
                    LDA.b [$D8],y             ;
                    STA.l $7ED031,x           ;
                    REP   #$20                ;
                    INX                       ;
                    INX                       ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_058EAB         ;
                    RTS                       ;

CODE_058EDC:        STA.l $7ED000,x           ;code which is also used as a table??
                    STA.l $7ED100,x           ;
                    STA.l $7ED200,x           ;
                    STA.l $7ED300,x           ;
                    STA.l $7ED400,x           ;
                    STA.l $7ED500,x           ;
                    STA.l $7ED600,x           ;
                    STA.l $7ED700,x           ;
                    STA.l $7ED800,x           ;
                    STA.l $7ED900,x           ;
                    STA.l $7EDA00,x           ;
                    STA.l $7EDB00,x           ;
                    STA.l $7EDC00,x           ;
                    STA.l $7EDD00,x           ;
                    STA.l $7EDE00,x           ;
                    RTS                       ;

CODE_058F19:        LDA.b $EF                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $8F25,x             ;
                    STA.b $00                 ;
                    JMP.w ($0000)             ;

                    dw CODE_0590B6
                    dw CODE_0590BA            ;Handle HDMA during level loads?
                    dw CODE_0590D2
                    dw CODE_0590E9
                    dw CODE_05910D
                    dw CODE_059099
                    dw CODE_05905F
                    dw CODE_05903D
                    dw CODE_059004
                    dw CODE_058FFA
                    dw CODE_058F97
                    dw CODE_059116
                    dw CODE_058F6F

                    db $0C,$0D,$0E,$0F,$0C,$0D,$0E,$0F
                    db $0C,$0D,$0E,$0F,$0C,$0D,$0E,$0F
                    db $13,$14,$15,$16,$13,$14,$15,$16
                    db $13,$14,$15,$16,$13,$14,$15,$16
                    db $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A
                    db $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A

CODE_058F6F:        LDX.w #$00D0              ;
                    LDY.w #$0000              ;
                    SEP   #$20                ;
CODE_058F77:        LDA.w $8F3F,y             ;
                    JSR.w CODE_058EDC         ;
                    INX                       ;
                    INY                       ;
                    CPY.w #$0030              ;
                    BNE   CODE_058F77         ;
                    REP   #$20                ;
                    RTS                       ;

                    db $01,$02,$03,$07,$01,$02,$03,$07
                    db $01,$02,$03,$07,$01,$02,$03,$07

CODE_058F97:        STZ.b $E4                 ;
CODE_058F99:        LDA.b $E4                 ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    CLC                       ;
                    ADC.w #$00A0              ;
                    TAX                       ;
                    LDY.w #$0000              ;
                    SEP   #$20                ;
CODE_058FA9:        LDA.w $8F87,y             ;
                    STA.l $7ED000,x           ;
                    TXA                       ;
                    AND.b #$01                ;
                    BNE   CODE_058FCF         ;
                    LDA.b #$0C                ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED050,x           ;
                    LDA.b #$10                ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED040,x           ;
                    BRA   CODE_058FE7         ;

CODE_058FCF:        LDA.b #$0D                ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED050,x           ;
                    LDA.b #$11                ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED040,x           ;
CODE_058FE7:        INX                       ;
                    INY                       ;
                    TYA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_058FA9         ;
                    REP   #$20                ;
                    INC.b $E4                 ;
                    LDA.b $E4                 ;
                    CMP.w #$0006              ;
                    BNE   CODE_058F99         ;
                    RTS                       ;

CODE_058FFA:        SEP   #$20                ;
                    LDA.b $F1                 ;
                    STA.w $0EDC               ;
                    REP   #$20                ;
                    RTS                       ;

CODE_059004:        LDX.w #$0080              ;
CODE_059007:        LDA.w #$0403              ;
                    STA.l $7ED000,x           ;
                    LDA.w #$0909              ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED040,x           ;
                    STA.l $7ED050,x           ;
                    STA.l $7ED060,x           ;
                    INX                       ;
                    INX                       ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_059007         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    CPX.w #$1000              ;
                    BCC   CODE_059007         ;
                    RTS                       ;

CODE_05903D:        LDX.w #$0000              ;
                    LDA.w #$0202              ;
CODE_059043:        JSR.w CODE_058EDC         ;
                    INX                       ;
                    INX                       ;
                    CPX.w #$0020              ;
                    BNE   CODE_059043         ;
                    LDA.w #$0101              ;
CODE_059050:        JSR.w CODE_058EDC         ;
                    INX                       ;
                    INX                       ;
                    CPX.w #$0030              ;
                    BNE   CODE_059050         ;
                    RTS                       ;

                    db $03,$05,$1D,$02        ;BG map16 tiles to fill the entire cave BG with (the repetetive rocks)

CODE_05905F:        LDX.w #$0000              ;
                    SEP   #$20                ;
CODE_059064:        LDA.w $905B               ;
                    STA.l $7ED000,x           ;
                    LDA.w $905C               ;
                    STA.l $7ED001,x           ;
                    LDA.w $905D               ;
                    STA.l $7ED010,x           ;
                    LDA.w $905E               ;
                    STA.l $7ED011,x           ;
                    INX                       ;
                    INX                       ;
                    TXA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_059064         ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    CPX.w #$0800              ;
                    BNE   CODE_059064         ;
                    REP   #$20                ;
                    RTS                       ;

CODE_059099:        SEP   #$20                ;
                    LDA.b $5C                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_0590A5         ;
                    LDA.b #$5F                ;
                    BRA   CODE_0590A7         ;

CODE_0590A5:        LDA.b #$00                ;
CODE_0590A7:        LDX.w #$0000              ;
CODE_0590AA:        JSR.w CODE_058EDC         ;
                    INX                       ;
                    CPX.w #$0020              ;
                    BNE   CODE_0590AA         ;
                    REP   #$20                ;
                    RTS                       ;

CODE_0590B6:        INC.w $0EC0               ;
                    RTS                       ;

CODE_0590BA:        SEP   #$30                ;\ Enable HDMA depending on $F1: HDMA gradient type
                    LDA.b $F1                 ; |
                    CMP.b #$02                ; |
                    BNE   CODE_0590C4         ; |
                    LDA.b #$FF                ; |
CODE_0590C4:        CMP.b #$01                ; |
                    BNE   CODE_0590CB         ; |
                    STA.w $0ED1               ; |
CODE_0590CB:        JSL.l CODE_04825E         ; |<-- HDMA enable routine
                    REP   #$30                ; |
                    RTS                       ;/

CODE_0590D2:        SEP   #$30                ;
                    LDA.b #$02                ;
                    JSL.l CODE_04825E         ;
                    REP   #$30                ;
                    RTS                       ;

                    db $0F,$20,$1B,$37,$58,$C9,$1F,$29
                    db $1C,$38,$57,$CA

CODE_0590E9:        LDX.w #$00D0              ;
                    LDY.b $F1                 ;
                    LDA.w $90DD,y             ;
CODE_0590F1:        JSR.w CODE_058EDC         ;
                    INX                       ;
                    CPX.w #$00E0              ;
                    BNE   CODE_0590F1         ;
                    LDA.w $90E3,y             ;
CODE_0590FD:        JSR.w CODE_058EDC         ;
                    INX                       ;
                    CPX.w #$00F0              ;
                    BNE   CODE_0590FD         ;
                    LDA.w #$0050              ;
                    JSR.w CODE_058EDC         ;
                    RTS                       ;

CODE_05910D:        LDA.b $F1                 ;
                    STA.b $99                 ;
                    JSL.l CODE_05E6B1         ;
                    RTS                       ;

CODE_059116:        LDA.b $F1                 ;
                    ORA.w #$0010              ;
                    STA.b $99                 ;
                    JSL.l CODE_05E6B1         ;
                    RTS                       ;

                    dw $0000,$0000,$0009,$0004 ;
                    dw $0006,$0001,$0004,$0004 ;index to layer 2 background pointer
                    dw $0001,$0008,$000A,$0001 ;2nd entry is used for 1-1 background afaik
                    dw $0001,$0001,$0001,$0007
                    dw $0004,$0004,$0007,$0001
                    dw $0001,$0001,$0001,$0001
                    dw $0004,$0002,$0002,$0001
                    dw $0003,$0003,$0003,$0003
                    dw $0003,$0005

CODE_059166:        LDA.b $DB                 ;\Load background number
                    ASL   A                   ; |to index
                    TAX                       ; |
                    LDA.w $9122,x             ; |Load index to layer 2 background pointer
                    ASL   A                   ; |
                    TAX                       ; |
                    LDA.w $91CE,x             ; |Store pointer to $00-$02. $02 is hardcoded to bank 5
                    STA.b $00                 ; |
                    LDA.w #$0005              ; |
                    STA.b $02                 ;/
                    LDX.w #$0000              ;Index to RAM?
                    LDY.w #$0000              ;Loop count
CODE_05917F:        STX.b $E4                 ;\Start loop
                    TYX                       ; |
                    LDA.l $7ED000,x           ; |
                    CMP.w #$FFFF              ; |If the background map16 tilemap is $FFFF
                    BEQ   CODE_0591CA         ;/Stop uploading tiles.
                    PHY                       ;\
                    LDX.b $E4                 ; |
                    AND.w #$00FF              ; |
                    ASL   A                   ; |
                    ASL   A                   ; |Upload background data by copying -MAP16- data
                    ASL   A                   ; |to the -VRAM tilemap- located in the -RAM-
                    TAY                       ; |
                    LDA.b [$00],y             ; |
                    STA.l $7E2000,x           ; |
                    INY                       ; |
                    INY                       ; |
                    LDA.b [$00],y             ; |
                    STA.l $7E2002,x           ; |
                    INY                       ; |
                    INY                       ; |
                    LDA.b [$00],y             ; |
                    STA.l $7E2040,x           ; |
                    INY                       ; |
                    INY                       ; |
                    LDA.b [$00],y             ; |
                    STA.l $7E2042,x           ; |
                    PLY                       ; |
                    INY                       ; |
                    TYA                       ; |
                    AND.w #$000F              ; |
                    BNE   CODE_0591C1         ;/
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0040              ;
                    TAX                       ;
CODE_0591C1:        INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPY.w #$1000              ;\read full map16 (?) ($0FFF bytes). If not done yet, loop
                    BNE   CODE_05917F         ;/
CODE_0591CA:        SEP   #$30                ;
                    PLB                       ;
                    RTL                       ;

DATA_0591CE:        dw DATA_059A2C,DATA_059C2C,$AC14,DATA_05A614 ;pointers to various background map16 data
                    dw DATA_05A364,DATA_05972C,DATA_059564,DATA_0594EC ;indexed by $DB's indexes
                    dw DATA_05944C,DATA_05A4C4,DATA_0592A4

DATA_0591E4:        db $00,$00,$00,$11,$00,$00,$00,$1F ;background map16 tiles
                    db $00,$00,$00,$0C,$00,$12,$00,$00 ;format: TTTTTTTT YXPCCCTT
                    db $08,$00,$00,$00,$00,$00,$04,$00
                    db $10,$00,$00,$00,$0D,$00,$00,$00
                    db $00,$00,$0A,$00,$1E,$00,$00,$00
                    db $00,$00,$1F,$00,$17,$00,$00,$00
                    db $00,$00,$00,$19,$12,$0C,$00,$00
                    db $1B,$00,$00,$00,$00,$12,$00,$00
                    db $00,$00,$00,$09,$00,$2A,$00,$00
                    db $00,$00,$16,$00,$00,$00,$1B,$00
                    db $00,$00,$00,$16,$08,$00,$00,$00
                    db $00,$17,$00,$00,$00,$19,$00,$00
                    db $00,$00,$0F,$00,$00,$14,$00,$00
                    db $00,$1B,$00,$00,$11,$00,$00,$00
                    db $00,$06,$00,$00,$0D,$00,$00,$00
                    db $00,$07,$00,$00,$00,$00,$00,$12
                    db $00,$08,$00,$00,$00,$00,$12,$00
                    db $00,$0C,$00,$00,$16,$00,$00,$00
                    db $00,$12,$00,$00,$00,$00,$00,$04
                    db $00,$13,$00,$00,$19,$00,$00,$00
                    db $00,$17,$00,$00,$00,$00,$1B,$00
                    db $00,$00,$00,$16,$1C,$00,$00,$00
                    db $00,$00,$1E,$00,$00,$15,$00,$00
                    db $00,$00,$02,$00,$01,$00,$00,$00

DATA_0592A4:        db $24,$00,$24,$00,$24,$00,$24,$00 ;
                    db $24,$00,$E0,$1D,$24,$00,$F0,$1D
                    db $E1,$1D,$24,$00,$F0,$5D,$24,$00
                    db $C2,$1D,$C3,$1D,$D2,$1D,$D3,$1D
                    db $C4,$1D,$C5,$1D,$D4,$1D,$D5,$1D
                    db $24,$00,$E3,$1D,$24,$00,$F3,$1D
                    db $E4,$1D,$24,$00,$F4,$1D,$24,$00
                    db $CA,$1D,$CB,$1D,$F1,$1D,$F1,$5D
                    db $C0,$1D,$C1,$1D,$24,$00,$E2,$1D
                    db $D0,$1D,$D1,$1D,$F2,$1D,$24,$00
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $E6,$1D,$E7,$1D,$F6,$1D,$F7,$1D
                    db $EB,$1D,$EC,$1D,$FB,$1D,$FC,$1D
                    db $ED,$1D,$24,$00,$FD,$1D,$FE,$1D
                    db $24,$00,$24,$00,$FF,$1D,$F8,$1D
                    db $24,$00,$EA,$1D,$F9,$1D,$FA,$1D
                    db $C8,$1D,$C1,$1D,$FD,$1D,$E2,$1D
                    db $D0,$1D,$D1,$1D,$F2,$1D,$F8,$1D
                    db $E5,$1D,$F5,$1D,$D9,$1D,$DA,$1D
                    db $CE,$1D,$CF,$1D,$EF,$1D,$EF,$1D
                    db $DC,$1D,$DD,$1D,$EF,$1D,$EF,$1D
                    db $DE,$1D,$DF,$1D,$EF,$1D,$EF,$1D
                    db $CC,$1D,$CD,$1D,$EF,$1D,$EF,$1D
                    db $DC,$1D,$E3,$1D,$EF,$1D,$F3,$1D
                    db $E4,$1D,$DF,$1D,$F4,$1D,$EF,$1D
                    db $E8,$1D,$E9,$1D,$DB,$1D,$EE,$1D
                    db $EF,$1D,$EF,$1D,$EF,$1D,$EF,$1D
                    db $C9,$1D,$C1,$1D,$EF,$1D,$E2,$1D
                    db $D0,$1D,$D8,$1D,$F2,$1D,$EF,$1D
                    db $E6,$1D,$E7,$1D,$D9,$1D,$DA,$1D
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$E0,$15,$24,$00,$F0,$15
                    db $E1,$15,$24,$00,$F0,$55,$24,$00
                    db $C2,$15,$C3,$15,$D2,$15,$D3,$15
                    db $C4,$15,$C5,$15,$D4,$15,$D5,$15
                    db $24,$00,$E3,$15,$24,$00,$F3,$15
                    db $E4,$15,$24,$00,$F4,$15,$24,$00
                    db $C0,$15,$C1,$15,$24,$00,$E2,$15
                    db $D0,$15,$D1,$15,$F2,$15,$24,$00
                    db $C2,$15,$C3,$15,$24,$00,$D3,$15
                    db $C4,$15,$C5,$15,$D4,$15,$24,$00
                    db $CA,$15,$CB,$15,$F1,$15,$F1,$55
                    db $C6,$15,$C7,$15,$D6,$15,$D7,$15
                    db $C8,$15,$C1,$15,$FD,$15,$E2,$15
                    db $D0,$15,$D1,$15,$F2,$15,$F8,$15
                    db $E6,$15,$E7,$15,$D9,$15,$DA,$15
                    db $DC,$15,$E3,$15,$EF,$15,$F3,$15
                    db $E4,$15,$DF,$15,$F4,$15,$EF,$15
                    db $E8,$15,$E9,$15,$DB,$15,$EE,$15
                    db $C9,$15,$C1,$15,$EF,$15,$E2,$15
                    db $D0,$15,$D8,$15,$F2,$15,$EF,$15
                    db $E6,$15,$E7,$15,$F6,$15,$F7,$15
                    db $E5,$15,$F5,$15,$D9,$15,$DA,$15

DATA_05944C:        db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$D0,$1D,$D1,$1D
                    db $24,$00,$24,$00,$D2,$1D,$D3,$1D
                    db $24,$00,$C5,$1D,$D4,$1D,$D5,$1D
                    db $24,$00,$24,$00,$C1,$1D,$C2,$1D
                    db $24,$00,$24,$00,$FE,$1D,$FF,$1D
                    db $24,$00,$24,$00,$C0,$1D,$D1,$1D
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $24,$00,$24,$00,$D2,$1D,$C3,$1D
                    db $24,$00,$24,$00,$CA,$1C,$CB,$1C
                    db $C6,$1D,$C7,$1D,$C4,$1D,$D7,$1D
                    db $24,$00,$24,$00,$FF,$1D,$FE,$1D
                    db $E8,$1D,$E9,$1D,$F8,$1D,$F9,$1D
                    db $EA,$1D,$EB,$1D,$FA,$1D,$FB,$1D
                    db $E0,$1D,$E1,$1D,$F0,$1D,$F1,$1D
                    db $E4,$1D,$E5,$1D,$F4,$1D,$F5,$1D
                    db $C8,$1D,$C9,$1D,$D8,$1D,$D9,$1D
                    db $CA,$1D,$CB,$1D,$DA,$1D,$DB,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $E6,$1D,$E7,$1D,$F6,$1D,$F7,$1D

DATA_0594EC:        db $24,$00,$24,$00,$24,$00,$24,$00
                    db $C4,$1D,$C5,$1D,$D4,$1D,$D5,$1D
                    db $C0,$1D,$C1,$1D,$D0,$1D,$D1,$1D
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $C8,$1D,$C9,$1D,$D8,$1D,$D9,$1D
                    db $D2,$1D,$D3,$1D,$C2,$1D,$C3,$1D
                    db $C2,$1D,$C3,$1D,$C2,$1D,$C3,$1D
                    db $CA,$1D,$CB,$1D,$DA,$1D,$DB,$1D
                    db $CC,$1D,$CD,$1D,$DC,$1D,$DD,$1D
                    db $CE,$1D,$CF,$1D,$DE,$1D,$DF,$1D
                    db $F2,$1D,$F3,$1D,$E2,$1D,$E3,$1D
                    db $E4,$1D,$E5,$1D,$F4,$1D,$F5,$1D
                    db $E2,$1D,$E3,$1D,$E2,$1D,$E3,$1D
                    db $E6,$1D,$E7,$1D,$F6,$1D,$F7,$1D
                    db $E0,$1D,$E1,$1D,$F0,$1D,$F1,$1D

DATA_059564:        db $24,$00,$24,$00,$24,$00,$24,$00
                    db $C0,$1D,$C1,$1D,$CA,$1D,$D1,$1D
                    db $C2,$1D,$C3,$1D,$D2,$1D,$CB,$1D
                    db $C2,$1D,$C3,$1D,$D2,$1D,$D3,$1D
                    db $C0,$1D,$C1,$1D,$D0,$1D,$D1,$1D
                    db $DA,$1D,$E1,$1D,$D0,$1D,$D1,$1D
                    db $E2,$1D,$DB,$1D,$D2,$1D,$D3,$1D
                    db $DA,$1D,$E1,$1D,$CA,$1D,$D1,$1D
                    db $E2,$1D,$E1,$1D,$E4,$1D,$E5,$1D
                    db $E2,$1D,$E1,$1D,$D2,$1D,$D1,$1D
                    db $E2,$1D,$DB,$1D,$D2,$1D,$CB,$1D
                    db $DA,$1D,$E1,$1D,$EA,$1D,$D1,$1D
                    db $F4,$1D,$F5,$1D,$D8,$1D,$E8,$1D
                    db $E2,$1D,$DB,$1D,$D2,$1D,$EB,$1D
                    db $C0,$1D,$C1,$1D,$92,$1D,$D1,$1D
                    db $E2,$1D,$E3,$1D,$D2,$1D,$D1,$1D
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $FA,$1D,$E1,$1D,$CC,$1D,$D1,$1D
                    db $E2,$1D,$FB,$1D,$D2,$1D,$CD,$1D
                    db $A2,$1D,$E1,$1D,$B2,$1D,$D1,$1D
                    db $E2,$1D,$E1,$1D,$D2,$1D,$C6,$1D
                    db $C4,$1D,$C5,$1D,$C7,$1D,$E7,$1D
                    db $D4,$1D,$D5,$1D,$E7,$1D,$C8,$1D
                    db $E2,$1D,$E3,$1D,$C9,$1D,$D1,$1D
                    db $E2,$1D,$E1,$1D,$D2,$1D,$82,$1D
                    db $E2,$1D,$E1,$1D,$83,$1D,$84,$1D
                    db $E2,$1D,$E1,$1D,$85,$1D,$80,$1D
                    db $E2,$1D,$E1,$1D,$81,$1D,$D1,$1D
                    db $E2,$1D,$E1,$1D,$C9,$1D,$D1,$1D
                    db $E2,$1D,$D6,$1D,$D2,$1D,$E6,$1D
                    db $D7,$1D,$E7,$1D,$D7,$1D,$E7,$1D
                    db $E7,$1D,$D7,$5D,$E7,$1D,$D7,$5D
                    db $D9,$1D,$E3,$1D,$E9,$1D,$D1,$1D
                    db $E2,$1D,$DC,$1D,$D2,$1D,$EC,$1D
                    db $DD,$1D,$DE,$1D,$ED,$1D,$EE,$1D
                    db $DF,$1D,$90,$1D,$EF,$1D,$A0,$1D
                    db $91,$1D,$E1,$1D,$A1,$1D,$D1,$1D
                    db $A2,$1D,$E3,$1D,$B2,$1D,$D1,$1D
                    db $D9,$1D,$E1,$1D,$E9,$1D,$D1,$1D
                    db $E2,$1D,$E1,$1D,$F0,$1D,$F1,$1D
                    db $E2,$1D,$E1,$1D,$F2,$1D,$F3,$1D
                    db $E2,$1D,$F6,$1D,$F0,$1D,$F1,$1D
                    db $F7,$1D,$CE,$1D,$F2,$1D,$F3,$1D
                    db $CF,$1D,$F8,$1D,$F0,$1D,$F1,$1D
                    db $F9,$1D,$E1,$1D,$F2,$1D,$F3,$1D
                    db $E2,$1D,$E3,$1D,$F0,$1D,$F1,$1D
                    db $FA,$1D,$E1,$1D,$F2,$1D,$F3,$1D
                    db $E2,$1D,$FC,$1D,$F0,$1D,$F1,$1D
                    db $FD,$1D,$FE,$1D,$F2,$1D,$F3,$1D
                    db $FF,$1D,$B0,$1D,$F0,$1D,$F1,$1D
                    db $B1,$1D,$E1,$1D,$F2,$1D,$F3,$1D
                    db $E2,$1D,$FB,$1D,$F0,$1D,$F1,$1D
                    db $A2,$1D,$E1,$1D,$F2,$1D,$F3,$1D
                    db $E2,$1D,$CB,$1D,$D2,$1D,$D3,$1D
                    db $CA,$1D,$E1,$1D,$D0,$1D,$D1,$1D
                    db $86,$15,$86,$15,$87,$15,$87,$15
                    db $88,$15,$88,$15,$88,$15,$88,$15

DATA_05972C:        db $34,$15,$34,$15,$34,$15,$34,$15
                    db $34,$15,$36,$15,$34,$15,$36,$15
                    db $37,$15,$38,$15,$37,$15,$28,$15
                    db $34,$15,$09,$1D,$34,$15,$34,$15
                    db $09,$1D,$0A,$1D,$19,$1D,$1A,$1D
                    db $0B,$1D,$0C,$1D,$1B,$1D,$1C,$1D
                    db $0C,$5D,$0B,$5D,$1C,$5D,$1B,$5D
                    db $0A,$5D,$09,$5D,$1A,$5D,$19,$5D
                    db $09,$15,$0A,$15,$19,$15,$1A,$15
                    db $0B,$15,$0C,$15,$1B,$15,$1C,$15
                    db $0C,$55,$0B,$55,$1C,$55,$1B,$55
                    db $0A,$55,$09,$55,$1A,$55,$19,$55
                    db $00,$15,$01,$15,$10,$15,$11,$15
                    db $BB,$1D,$BC,$1D,$34,$1D,$88,$1D
                    db $BD,$1D,$BC,$1D,$89,$1D,$8C,$1D
                    db $BD,$1D,$BC,$1D,$8D,$1D,$89,$5D
                    db $BD,$1D,$BE,$1D,$88,$1D,$34,$1D
                    db $B0,$1D,$B1,$1D,$B2,$1D,$E8,$1C
                    db $20,$15,$21,$15,$30,$15,$31,$15
                    db $02,$15,$03,$15,$12,$15,$13,$15
                    db $B1,$5D,$B0,$5D,$E9,$1C,$B2,$5D
                    db $34,$15,$34,$1D,$34,$15,$34,$1D
                    db $34,$1D,$98,$1D,$34,$1D,$A8,$1D
                    db $89,$1D,$8A,$1D,$99,$1D,$9A,$1D
                    db $8B,$1D,$89,$5D,$9B,$1D,$99,$5D
                    db $9C,$1D,$34,$1D,$AC,$1D,$34,$1D
                    db $24,$15,$16,$15,$34,$15,$26,$15
                    db $17,$15,$18,$15,$27,$15,$28,$15
                    db $B3,$1D,$EA,$1C,$34,$1D,$8E,$1D
                    db $EB,$1C,$B3,$5D,$8F,$1D,$34,$1D
                    db $34,$1D,$A8,$1D,$34,$1D,$A8,$1D
                    db $A9,$1D,$8A,$1D,$B9,$1D,$B9,$1D
                    db $8B,$1D,$A9,$5D,$B9,$1D,$BA,$1D
                    db $AC,$1D,$34,$1D,$AC,$1D,$34,$1D
                    db $34,$15,$34,$15,$0D,$1D,$0E,$1D
                    db $34,$15,$34,$15,$0F,$1D,$34,$15
                    db $1D,$1D,$1E,$1D,$2D,$1D,$2E,$1D
                    db $1F,$1D,$29,$1D,$2F,$1D,$39,$1D
                    db $37,$15,$38,$15,$37,$15,$38,$15
                    db $34,$1D,$A8,$1D,$34,$1D,$B8,$1D
                    db $8B,$1D,$A9,$5D,$B9,$1D,$B9,$1D
                    db $AC,$1D,$34,$1D,$BA,$1D,$34,$1D
                    db $3D,$1D,$3E,$1D,$34,$15,$15,$1D
                    db $3F,$1D,$2A,$1D,$25,$1D,$3A,$1D
                    db $34,$15,$26,$95,$24,$95,$16,$95
                    db $27,$95,$38,$15,$17,$95,$18,$95
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$83,$1D,$92,$1D,$93,$1D
                    db $32,$15,$22,$15,$10,$15,$11,$15
                    db $22,$15,$23,$15,$10,$15,$11,$15
                    db $33,$15,$00,$15,$10,$15,$11,$15
                    db $A0,$1D,$A1,$1D,$10,$15,$11,$15
                    db $A2,$1D,$A3,$1D,$10,$15,$11,$15
                    db $33,$15,$34,$15,$10,$15,$11,$15
                    db $85,$15,$87,$15,$95,$15,$97,$15
                    db $84,$15,$86,$15,$94,$15,$96,$15
                    db $85,$15,$86,$15,$95,$15,$96,$15
                    db $84,$15,$87,$15,$94,$15,$97,$15
                    db $84,$15,$85,$15,$94,$15,$95,$15
                    db $86,$15,$85,$15,$96,$15,$95,$15
                    db $A6,$15,$A7,$15,$B6,$15,$B7,$15
                    db $94,$15,$A6,$15,$B4,$15,$B6,$15
                    db $A6,$15,$A6,$15,$B6,$15,$B6,$15
                    db $94,$15,$A7,$15,$B4,$15,$B7,$15
                    db $99,$15,$16,$15,$34,$15,$26,$15
                    db $4C,$15,$4D,$15,$5C,$15,$40,$15
                    db $4D,$15,$4D,$15,$41,$15,$42,$15
                    db $4D,$15,$4D,$15,$43,$15,$44,$15
                    db $4D,$15,$4E,$15,$45,$15,$5D,$15
                    db $5C,$15,$50,$15,$5C,$15,$60,$15
                    db $51,$15,$52,$15,$61,$15,$62,$15
                    db $53,$15,$54,$15,$63,$15,$64,$15
                    db $55,$15,$5D,$15,$65,$15,$5D,$15
                    db $5C,$15,$70,$15,$5C,$15,$46,$15
                    db $71,$15,$72,$15,$47,$15,$48,$15
                    db $73,$15,$74,$15,$49,$15,$4A,$15
                    db $75,$15,$5D,$15,$4B,$15,$5D,$15
                    db $5C,$15,$56,$15,$5C,$15,$66,$15
                    db $57,$15,$58,$15,$67,$15,$68,$15
                    db $59,$15,$5A,$15,$69,$15,$6A,$15
                    db $5B,$15,$5D,$15,$6B,$15,$5D,$15
                    db $5C,$15,$76,$15,$5E,$15,$6C,$15
                    db $77,$15,$78,$15,$6C,$15,$6C,$15
                    db $79,$15,$7A,$15,$6C,$15,$6C,$15
                    db $7B,$15,$5D,$15,$6C,$15,$6D,$15
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00

DATA_059A2C:        db $24,$00,$24,$00,$24,$00,$24,$00
                    db $A4,$10,$A4,$10,$24,$00,$24,$00
                    db $A4,$10,$A4,$10,$A4,$10,$A4,$10
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $24,$00,$24,$00,$24,$00,$F0,$1C
                    db $24,$00,$24,$00,$F1,$1C,$24,$00
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $40,$15,$41,$15,$50,$15,$51,$15
                    db $46,$15,$47,$15,$56,$15,$57,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $24,$00,$F2,$1C,$24,$00,$F4,$1C
                    db $F3,$1C,$24,$00,$F5,$1C,$24,$00
                    db $60,$15,$61,$15,$70,$15,$71,$15
                    db $66,$15,$67,$15,$76,$15,$77,$15
                    db $0A,$15,$0B,$15,$1A,$15,$1B,$15
                    db $0C,$15,$0D,$15,$1C,$15,$1D,$15
                    db $28,$15,$29,$15,$1A,$15,$1B,$15
                    db $38,$15,$39,$15,$1C,$15,$1D,$15
                    db $0E,$15,$24,$00,$1E,$15,$1F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $20,$15,$21,$15,$30,$15,$31,$15
                    db $2A,$15,$2B,$15,$3A,$15,$3B,$15
                    db $2C,$15,$2D,$15,$3C,$15,$3D,$15
                    db $2E,$15,$2F,$15,$3E,$15,$3F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $22,$15,$23,$15,$32,$15,$33,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $0C,$15,$0D,$15,$1C,$15,$1D,$15
                    db $28,$15,$29,$15,$1A,$15,$1B,$15
                    db $38,$15,$39,$15,$1C,$15,$1D,$15
                    db $42,$15,$43,$15,$52,$15,$53,$15
                    db $44,$15,$45,$15,$54,$15,$55,$15
                    db $62,$15,$63,$15,$72,$15,$73,$15
                    db $64,$15,$65,$15,$74,$15,$75,$15
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $34,$15,$35,$15,$1A,$15,$1B,$15
                    db $36,$15,$37,$15,$1C,$15,$1D,$15
                    db $2A,$15,$2B,$15,$24,$15,$25,$15
                    db $2C,$15,$2D,$15,$26,$15,$27,$15
                    db $A4,$15,$A5,$15,$B4,$15,$B5,$15
                    db $05,$15,$0B,$15,$15,$15,$03,$15
                    db $24,$00,$04,$15,$24,$00,$14,$15
                    db $10,$15,$11,$15,$13,$15,$27,$15
                    db $24,$00,$24,$00,$24,$00,$12,$15
                    db $06,$15,$2B,$15,$09,$15,$07,$15
                    db $2E,$15,$2F,$15,$3E,$15,$07,$15
                    db $24,$00,$24,$00,$08,$15,$24,$00
                    db $2E,$15,$2F,$15,$09,$15,$07,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15
                    db $22,$15,$23,$15,$32,$15,$33,$15
                    db $72,$15,$71,$15,$5E,$15,$5F,$15

DATA_059C2C:        db $24,$10,$24,$10,$24,$10,$24,$10
                    db $0A,$15,$4A,$15,$4A,$15,$16,$15
                    db $07,$15,$06,$15,$5A,$15,$16,$15
                    db $24,$10,$01,$15,$10,$15,$11,$15
                    db $02,$15,$03,$15,$0A,$15,$0A,$15
                    db $04,$15,$24,$10,$14,$15,$15,$15
                    db $0A,$15,$0D,$15,$0A,$15,$1D,$15
                    db $07,$15,$24,$10,$0E,$15,$07,$15
                    db $0A,$15,$1D,$15,$0A,$15,$0A,$15
                    db $1F,$15,$17,$15,$1E,$15,$55,$15
                    db $1E,$15,$55,$15,$0A,$15,$0F,$15
                    db $55,$15,$17,$15,$55,$15,$55,$15
                    db $55,$15,$55,$15,$1F,$15,$55,$15
                    db $07,$15,$06,$15,$0E,$15,$5B,$15
                    db $18,$15,$0A,$15,$0E,$15,$18,$15
                    db $5E,$15,$5E,$15,$4F,$15,$4F,$15
                    db $0A,$15,$4B,$15,$4A,$15,$16,$15
                    db $55,$15,$5A,$15,$5A,$15,$16,$15
                    db $24,$10,$06,$15,$06,$15,$16,$15
                    db $16,$15,$0A,$15,$0A,$15,$0A,$15
                    db $02,$15,$08,$15,$0A,$15,$0A,$15
                    db $09,$15,$0A,$15,$14,$15,$1A,$15
                    db $0A,$55,$0A,$15,$0A,$15,$0A,$15
                    db $1E,$15,$17,$15,$0A,$15,$0F,$15
                    db $07,$15,$24,$10,$17,$15,$07,$15
                    db $0A,$15,$0F,$15,$0A,$15,$1D,$15
                    db $55,$15,$17,$15,$1F,$15,$55,$15
                    db $1F,$15,$55,$15,$1E,$15,$55,$15
                    db $55,$15,$55,$15,$55,$15,$55,$15
                    db $07,$15,$06,$15,$17,$15,$5B,$15
                    db $18,$15,$0A,$15,$17,$15,$18,$15
                    db $5F,$15,$5F,$15,$5F,$15,$5F,$15
                    db $45,$15,$0A,$15,$0A,$15,$0A,$15
                    db $0A,$15,$0A,$15,$0A,$15,$19,$15
                    db $0A,$15,$12,$15,$0A,$15,$12,$95
                    db $13,$15,$0A,$15,$13,$95,$0A,$15
                    db $19,$15,$0A,$55,$0A,$55,$45,$D5
                    db $47,$15,$47,$55,$47,$95,$47,$D5
                    db $57,$15,$57,$55,$57,$95,$57,$D5
                    db $12,$15,$0A,$15,$12,$95,$19,$15
                    db $0A,$15,$0A,$15,$47,$15,$47,$55
                    db $47,$95,$54,$15,$0A,$15,$57,$95
                    db $57,$55,$0A,$15,$57,$D5,$0A,$15
                    db $0B,$15,$0C,$15,$1B,$15,$1C,$15
                    db $0A,$15,$0A,$15,$0A,$15,$0B,$15
                    db $0A,$15,$0A,$15,$0C,$15,$0A,$15
                    db $0B,$15,$1B,$15,$1B,$15,$0A,$15
                    db $1C,$15,$0C,$15,$0A,$15,$1C,$15
                    db $55,$55,$56,$55,$55,$55,$56,$D5
                    db $55,$55,$46,$55,$55,$55,$46,$D5
                    db $5C,$15,$17,$15,$55,$55,$55,$55
                    db $55,$55,$17,$15,$55,$55,$4C,$15
                    db $26,$15,$21,$15,$36,$15,$31,$15
                    db $22,$15,$23,$15,$32,$15,$33,$15
                    db $20,$15,$21,$15,$30,$15,$31,$15
                    db $22,$15,$24,$15,$32,$15,$34,$15
                    db $27,$15,$51,$15,$37,$15,$31,$15
                    db $52,$15,$53,$15,$32,$15,$33,$15
                    db $50,$15,$51,$15,$30,$15,$31,$15
                    db $52,$15,$48,$15,$32,$15,$58,$15
                    db $27,$15,$41,$15,$37,$15,$31,$15
                    db $42,$15,$43,$15,$32,$15,$33,$15
                    db $40,$15,$41,$15,$30,$15,$31,$15
                    db $42,$15,$44,$15,$32,$15,$35,$15
                    db $2E,$15,$29,$15,$3E,$15,$39,$15
                    db $2A,$15,$2B,$15,$3A,$15,$3B,$15
                    db $28,$15,$29,$15,$38,$15,$39,$15
                    db $2A,$15,$2C,$15,$3A,$15,$3C,$15
                    db $2F,$15,$29,$15,$3F,$15,$39,$15
                    db $2A,$15,$49,$15,$3A,$15,$59,$15
                    db $2A,$15,$2D,$15,$3A,$15,$3D,$15
                    db $60,$15,$61,$15,$5E,$15,$5F,$15
                    db $62,$15,$63,$15,$67,$15,$68,$15
                    db $62,$15,$4D,$15,$67,$15,$5D,$15
                    db $62,$15,$4E,$15,$67,$15,$5D,$15
                    db $62,$15,$4F,$15,$67,$15,$5D,$15
                    db $64,$15,$61,$15,$69,$15,$5F,$15
                    db $65,$15,$61,$15,$6A,$15,$5F,$15
                    db $66,$15,$66,$15,$66,$15,$66,$15
                    db $86,$15,$86,$15,$87,$15,$87,$15
                    db $88,$15,$88,$15,$88,$15,$88,$15
                    db $12,$15,$1F,$15,$12,$15,$1F,$15
                    db $07,$15,$06,$15,$B0,$15,$16,$15
                    db $45,$15,$71,$15,$0E,$15,$A2,$15
                    db $89,$15,$8C,$15,$9B,$15,$9C,$15
                    db $9D,$15,$9F,$15,$9F,$15,$12,$15
                    db $89,$15,$8C,$15,$9B,$15,$9C,$15
                    db $FF,$15,$FF,$15,$FF,$15,$FF,$15
                    db $EE,$15,$EE,$15,$FE,$15,$FE,$15
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $2E,$14,$96,$15,$67,$15,$91,$15
                    db $97,$15,$03,$15,$12,$15,$13,$15
                    db $4E,$15,$06,$15,$54,$15,$16,$15
                    db $A0,$15,$A1,$15,$B0,$15,$16,$15
                    db $17,$15,$B0,$15,$B0,$15,$16,$15
                    db $55,$15,$17,$15,$55,$15,$17,$95
                    db $55,$15,$55,$15,$55,$15,$17,$95
                    db $45,$15,$71,$15,$17,$15,$A2,$15
                    db $57,$15,$81,$15,$90,$15,$91,$15
                    db $82,$15,$83,$15,$92,$15,$93,$15
                    db $84,$15,$57,$15,$94,$15,$95,$15
                    db $12,$15,$0D,$15,$12,$15,$1D,$15
                    db $07,$15,$24,$14,$0E,$15,$07,$15
                    db $1E,$15,$17,$15,$12,$15,$0F,$15
                    db $12,$15,$1D,$15,$12,$15,$12,$15
                    db $1F,$15,$17,$15,$1E,$15,$55,$15
                    db $07,$15,$4B,$15,$0E,$15,$45,$15
                    db $18,$15,$19,$15,$0E,$15,$18,$15
                    db $12,$15,$0F,$15,$12,$15,$1D,$15
                    db $55,$15,$17,$15,$1F,$15,$55,$15
                    db $1E,$15,$55,$15,$12,$15,$0F,$15
                    db $1F,$15,$55,$15,$1E,$15,$55,$15
                    db $55,$15,$55,$15,$1F,$15,$55,$15
                    db $45,$15,$2E,$14,$0E,$15,$45,$15
                    db $12,$15,$12,$15,$12,$15,$89,$15
                    db $12,$15,$12,$15,$8C,$15,$12,$15
                    db $89,$15,$8A,$15,$99,$15,$9A,$15
                    db $8B,$15,$8C,$15,$9B,$15,$9C,$15
                    db $8D,$15,$8E,$15,$12,$15,$8F,$15
                    db $9D,$15,$9E,$15,$9F,$15,$12,$15
                    db $89,$15,$8C,$15,$99,$15,$9A,$15
                    db $89,$15,$8C,$15,$9B,$15,$9C,$15
                    db $B3,$15,$B2,$15,$B2,$15,$16,$15
                    db $B3,$15,$A3,$15,$B2,$15,$16,$15
                    db $12,$15,$99,$15,$12,$15,$8F,$15
                    db $9D,$15,$8E,$15,$9F,$15,$8F,$15
                    db $9C,$15,$12,$15,$9F,$15,$12,$15
                    db $12,$15,$12,$15,$8C,$15,$89,$15
                    db $89,$15,$8C,$15,$9B,$15,$9A,$15
                    db $12,$15,$12,$15,$89,$15,$8C,$15
                    db $99,$15,$9C,$15,$8F,$15,$9F,$15
                    db $12,$15,$99,$15,$8C,$15,$8F,$15
                    db $16,$15,$12,$15,$89,$15,$8C,$15
                    db $16,$15,$12,$15,$12,$15,$89,$15
                    db $16,$15,$12,$15,$89,$15,$8C,$15
                    db $99,$15,$9C,$15,$8D,$15,$B1,$15
                    db $12,$15,$1D,$15,$8C,$15,$12,$15
                    db $12,$15,$1D,$15,$8C,$15,$12,$15
                    db $62,$15,$63,$15,$72,$15,$73,$15
                    db $64,$15,$65,$15,$74,$15,$75,$15
                    db $66,$15,$67,$15,$76,$15,$77,$15
                    db $68,$15,$69,$15,$78,$15,$79,$15
                    db $24,$00,$24,$00,$00,$1D,$01,$1D
                    db $24,$00,$24,$00,$02,$1D,$03,$1D
                    db $24,$00,$24,$00,$04,$1D,$05,$1D
                    db $24,$00,$24,$00,$06,$1D,$07,$1D
                    db $10,$1D,$11,$1D,$20,$1D,$21,$1D
                    db $12,$1D,$13,$1D,$22,$1D,$23,$1D
                    db $14,$1D,$15,$1D,$24,$1D,$25,$1D
                    db $16,$1D,$17,$1D,$26,$1D,$27,$1D
                    db $24,$00,$24,$00,$40,$1D,$41,$1D
                    db $30,$1D,$31,$1D,$08,$1D,$09,$1D
                    db $32,$1D,$33,$1D,$0A,$1D,$0B,$1D
                    db $34,$1D,$35,$1D,$0C,$1D,$0D,$1D
                    db $36,$1D,$37,$1D,$0E,$1D,$0F,$1D
                    db $50,$1D,$51,$1D,$60,$1D,$61,$1D
                    db $18,$1D,$19,$1D,$28,$1D,$29,$1D
                    db $1A,$1D,$1B,$1D,$2A,$1D,$2B,$1D
                    db $1C,$1D,$1D,$1D,$2C,$1D,$2D,$1D
                    db $1E,$1D,$1F,$1D,$2E,$1D,$2F,$1D
                    db $70,$1D,$71,$1D,$24,$00,$24,$00
                    db $38,$1D,$39,$1D,$24,$00,$24,$00
                    db $3A,$1D,$3B,$1D,$24,$00,$24,$00
                    db $3C,$1D,$3D,$1D,$24,$00,$24,$00
                    db $3E,$1D,$3F,$1D,$24,$00,$24,$00
                    db $3E,$1D,$3F,$1D,$24,$00,$24,$00
                    db $3E,$1D,$3F,$1D,$24,$00,$24,$00
                    db $3E,$1D,$3F,$1D,$24,$00,$24,$00
                    db $3E,$1D,$3F,$1D,$24,$00,$24,$00
                    db $3E,$1D,$3F,$1D,$24,$00,$24,$00
                    db $C0,$1D,$C1,$1D,$D0,$1D,$D1,$1D
                    db $C2,$1D,$C3,$1D,$D2,$1D,$D3,$1D
                    db $C4,$1D,$C5,$1D,$D4,$1D,$D5,$1D
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $C8,$1D,$C9,$1D,$D8,$1D,$D9,$1D
                    db $CA,$1D,$24,$00,$DA,$1D,$DB,$1D
                    db $E8,$1D,$24,$00,$F8,$1D,$24,$00
                    db $E8,$1D,$E9,$1D,$F8,$1D,$F9,$1D
                    db $EA,$1D,$EB,$1D,$FA,$1D,$FB,$1D
                    db $24,$00,$E9,$1D,$24,$00,$F9,$1D
                    db $DF,$1D,$C3,$1D,$DC,$1D,$D3,$1D
                    db $E8,$1D,$E9,$1D,$F8,$1D,$F9,$1D
                    db $CC,$1D,$CD,$1D,$D0,$1D,$D1,$1D
                    db $CE,$1D,$CF,$1D,$D2,$1D,$D3,$1D
                    db $24,$00,$E5,$1D,$24,$00,$F5,$1D
                    db $24,$00,$DD,$1D,$24,$00,$DE,$1D
                    db $E0,$1D,$E1,$1D,$F0,$1D,$F1,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $E4,$1D,$E5,$1D,$F4,$1D,$F5,$1D
                    db $E6,$1D,$E7,$1D,$F6,$1D,$F7,$1D
                    db $E2,$1D,$F8,$1D,$F2,$1D,$F3,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $E4,$1D,$24,$00,$F4,$1D,$24,$00
                    db $24,$00,$24,$00,$EC,$1D,$ED,$1D
                    db $E2,$1D,$F8,$1D,$F2,$1D,$F3,$1D
                    db $EE,$15,$EE,$15,$FE,$15,$FE,$15
                    db $FF,$15,$FF,$15,$FF,$15,$FF,$15
                    db $16,$1D,$12,$1D,$12,$1D,$89,$1D
                    db $16,$1D,$12,$1D,$89,$1D,$8C,$1D
                    db $99,$1D,$9C,$1D,$8D,$1D,$B1,$1D
                    db $12,$1D,$1D,$1D,$8C,$1D,$12,$1D
                    db $12,$1D,$1D,$1D,$8C,$1D,$12,$1D
                    db $62,$15,$63,$15,$72,$15,$73,$15
                    db $64,$15,$65,$15,$74,$15,$75,$15
                    db $66,$15,$67,$15,$76,$15,$77,$15
                    db $68,$15,$69,$15,$78,$15,$79,$15
                    db $07,$15,$06,$15,$B0,$15,$16,$15
                    db $20,$15,$21,$15,$30,$15,$31,$15
                    db $22,$15,$23,$15,$32,$15,$33,$15
                    db $28,$15,$29,$15,$38,$15,$39,$15
                    db $2A,$15,$2B,$15,$3A,$15,$3B,$15
                    db $26,$15,$21,$15,$36,$15,$31,$15
                    db $22,$15,$24,$15,$32,$15,$34,$15
                    db $2E,$15,$29,$15,$3E,$15,$39,$15
                    db $2A,$15,$2C,$15,$3A,$15,$3C,$15
                    db $40,$15,$41,$15,$30,$15,$31,$15
                    db $42,$15,$43,$15,$32,$15,$33,$15
                    db $27,$15,$41,$15,$37,$15,$31,$15
                    db $22,$15,$24,$15,$32,$15,$34,$15
                    db $2F,$15,$29,$15,$3F,$15,$39,$15
                    db $2A,$15,$2D,$15,$3A,$15,$3D,$15
                    db $50,$15,$51,$15,$30,$15,$31,$15
                    db $52,$15,$53,$15,$32,$15,$33,$15
                    db $52,$15,$48,$15,$32,$15,$58,$15
                    db $2A,$15,$49,$15,$3A,$15,$59,$15

DATA_05A364:        db $24,$00,$24,$00,$24,$00,$24,$00
                    db $C1,$1C,$24,$00,$24,$00,$24,$00
                    db $C2,$1C,$24,$00,$24,$00,$24,$00
                    db $C3,$1C,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$C0,$1C,$24,$00
                    db $24,$00,$24,$00,$C1,$1C,$24,$00
                    db $24,$00,$24,$00,$C2,$1C,$24,$00
                    db $24,$00,$24,$00,$C3,$1C,$24,$00
                    db $C4,$1C,$24,$00,$24,$00,$24,$00
                    db $C5,$1C,$24,$00,$24,$00,$24,$00
                    db $C6,$1C,$24,$00,$24,$00,$24,$00
                    db $C7,$1C,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$C4,$1C,$24,$00
                    db $24,$00,$24,$00,$C5,$1C,$24,$00
                    db $24,$00,$24,$00,$C6,$1C,$24,$00
                    db $24,$00,$24,$00,$C7,$1C,$24,$00
                    db $24,$00,$C0,$1C,$24,$00,$24,$00
                    db $24,$00,$C1,$1C,$24,$00,$24,$00
                    db $24,$00,$C2,$1C,$24,$00,$24,$00
                    db $24,$00,$C3,$1C,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$C0,$1C
                    db $24,$00,$24,$00,$24,$00,$C1,$1C
                    db $24,$00,$24,$00,$24,$00,$C2,$1C
                    db $24,$00,$24,$00,$24,$00,$C3,$1C
                    db $24,$00,$C4,$1C,$24,$00,$24,$00
                    db $24,$00,$C5,$1C,$24,$00,$24,$00
                    db $24,$00,$C6,$1C,$24,$00,$24,$00
                    db $24,$00,$C7,$1C,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$C4,$1C
                    db $24,$00,$24,$00,$24,$00,$C5,$1C
                    db $24,$00,$24,$00,$24,$00,$C6,$1C
                    db $24,$00,$24,$00,$24,$00,$C7,$1C
                    db $E0,$15,$E0,$15,$E1,$15,$E1,$15
                    db $C6,$15,$C7,$15,$D6,$15,$D7,$15
                    db $C8,$15,$C9,$15,$D8,$15,$D9,$15
                    db $CA,$15,$CB,$15,$DA,$15,$DB,$15
                    db $CC,$15,$CD,$15,$DC,$15,$DD,$15
                    db $E6,$15,$E7,$15,$F6,$15,$F7,$15
                    db $E8,$15,$E9,$15,$F8,$15,$F9,$15
                    db $EA,$15,$EB,$15,$FA,$15,$FB,$15
                    db $EC,$15,$ED,$15,$FC,$15,$FD,$15
                    db $E2,$15,$E2,$15,$E2,$15,$E2,$15
                    db $C0,$1C,$24,$00,$24,$00,$24,$00
                    db $C0,$1C,$24,$00,$24,$00,$24,$00

DATA_05A4C4:        db $24,$00,$24,$00,$24,$00,$24,$00
                    db $04,$15,$05,$15,$16,$15,$17,$15
                    db $06,$15,$07,$15,$20,$15,$21,$15
                    db $04,$15,$05,$15,$22,$15,$23,$15
                    db $06,$15,$07,$15,$14,$15,$15,$15
                    db $0C,$15,$0D,$15,$1C,$15,$1D,$15
                    db $24,$00,$24,$00,$1E,$15,$24,$00
                    db $24,$00,$2C,$15,$24,$00,$3C,$15
                    db $0C,$15,$2A,$15,$16,$15,$3A,$15
                    db $2B,$15,$07,$15,$3B,$15,$21,$15
                    db $26,$15,$27,$15,$36,$15,$37,$15
                    db $30,$15,$31,$15,$08,$15,$24,$00
                    db $32,$15,$33,$15,$24,$00,$0B,$15
                    db $24,$15,$25,$15,$34,$15,$35,$15
                    db $26,$15,$1B,$15,$36,$15,$37,$15
                    db $0F,$15,$24,$00,$08,$15,$24,$00
                    db $24,$00,$24,$00,$24,$00,$3E,$15
                    db $2E,$15,$2F,$15,$3F,$15,$35,$15
                    db $18,$15,$24,$00,$4A,$15,$4B,$15
                    db $24,$00,$19,$15,$5A,$15,$5B,$15
                    db $24,$00,$19,$15,$5C,$15,$48,$15
                    db $24,$15,$25,$15,$44,$15,$45,$15
                    db $26,$15,$27,$15,$46,$15,$47,$15
                    db $24,$00,$24,$00,$5C,$15,$51,$15
                    db $24,$00,$24,$00,$52,$15,$53,$15
                    db $24,$00,$19,$15,$50,$15,$48,$15
                    db $00,$15,$01,$15,$11,$15,$00,$15
                    db $68,$15,$69,$15,$78,$15,$79,$15
                    db $6A,$15,$6B,$15,$7A,$15,$7B,$15
                    db $10,$15,$11,$15,$01,$15,$10,$15
                    db $6C,$15,$61,$15,$7C,$15,$71,$15
                    db $54,$15,$55,$15,$72,$15,$73,$15
                    db $56,$15,$57,$15,$74,$15,$75,$15
                    db $4C,$15,$4D,$15,$76,$15,$77,$15
                    db $62,$15,$63,$15,$72,$15,$73,$15
                    db $64,$15,$65,$15,$74,$15,$75,$15
                    db $66,$15,$67,$15,$76,$15,$77,$15
                    db $60,$15,$61,$15,$7C,$15,$71,$15
                    db $54,$15,$58,$15,$72,$15,$59,$15
                    db $16,$15,$17,$15,$18,$15,$19,$15
                    db $19,$15,$18,$15,$18,$15,$19,$15
                    db $06,$15,$06,$15,$14,$15,$15,$15

DATA_05A614:        db $34,$15,$34,$15,$34,$15,$34,$15 ;Castle background map16 tiles
                    db $34,$15,$04,$15,$34,$15,$04,$15
                    db $05,$15,$06,$15,$05,$15,$06,$15
                    db $29,$15,$2A,$15,$19,$15,$1A,$15
                    db $2B,$15,$2C,$15,$1B,$15,$1C,$15
                    db $38,$15,$34,$15,$38,$15,$34,$15
                    db $19,$15,$1A,$15,$19,$15,$1A,$15
                    db $1B,$15,$1C,$15,$1B,$15,$1C,$15
                    db $09,$15,$0A,$15,$19,$15,$1A,$15
                    db $0B,$15,$0C,$15,$1B,$15,$1C,$15
                    db $34,$15,$04,$15,$34,$15,$14,$15
                    db $05,$15,$06,$15,$15,$15,$06,$15
                    db $00,$15,$01,$15,$10,$15,$11,$15
                    db $00,$15,$02,$15,$10,$15,$12,$15
                    db $03,$15,$01,$15,$13,$15,$11,$15
                    db $0D,$15,$0A,$15,$1D,$15,$1A,$15
                    db $0B,$15,$0E,$15,$1B,$15,$1E,$15
                    db $0F,$15,$01,$15,$1F,$15,$11,$15
                    db $20,$15,$21,$15,$30,$15,$31,$15
                    db $20,$15,$22,$15,$30,$15,$32,$15
                    db $23,$15,$21,$15,$33,$15,$31,$15
                    db $20,$15,$21,$15,$30,$15,$30,$15
                    db $2D,$15,$1A,$15,$3D,$15,$1A,$15
                    db $1B,$15,$2E,$15,$1B,$15,$3E,$15
                    db $2F,$15,$21,$15,$3F,$15,$31,$15
                    db $35,$15,$35,$15,$34,$15,$34,$15
                    db $24,$15,$16,$15,$34,$15,$26,$15
                    db $17,$15,$18,$15,$27,$15,$28,$15
                    db $25,$15,$35,$15,$34,$15,$34,$15
                    db $39,$15,$0A,$15,$19,$15,$1A,$15
                    db $3A,$15,$35,$15,$38,$15,$34,$15
                    db $34,$15,$36,$15,$34,$15,$36,$15
                    db $37,$15,$28,$15,$37,$15,$28,$15
                    db $02,$15,$03,$15,$12,$15,$05,$15
                    db $04,$15,$24,$15,$14,$15,$15,$15
                    db $24,$15,$06,$15,$06,$15,$16,$15
                    db $12,$15,$12,$15,$12,$15,$12,$15
                    db $0E,$15,$17,$15,$0F,$15,$55,$15
                    db $07,$15,$24,$15,$17,$15,$07,$15
                    db $16,$15,$1B,$15,$0B,$15,$1B,$15
                    db $0C,$15,$12,$15,$1C,$15,$0C,$15
                    db $1D,$15,$55,$15,$1E,$15,$55,$15
                    db $55,$15,$17,$15,$55,$15,$55,$15
                    db $16,$15,$0B,$15,$12,$15,$12,$15
                    db $1B,$15,$12,$15,$12,$15,$12,$15
                    db $1E,$15,$55,$15,$12,$15,$55,$15
                    db $55,$15,$55,$15,$55,$15,$55,$15
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $81,$5D,$80,$5D,$92,$1D,$90,$5D
                    db $A0,$1D,$A1,$1D,$B0,$1D,$82,$1D
                    db $A2,$1D,$B1,$1D,$82,$5D,$B2,$1D
                    db $34,$15,$7C,$15,$34,$15,$7D,$15
                    db $87,$15,$88,$15,$97,$15,$98,$15
                    db $83,$1D,$84,$1D,$93,$1D,$94,$1D
                    db $85,$1D,$86,$1D,$95,$1D,$96,$1D
                    db $A7,$15,$A8,$15,$B7,$15,$B8,$15
                    db $34,$15,$8A,$15,$34,$15,$9A,$15
                    db $89,$15,$8B,$15,$13,$15,$9B,$15
                    db $A3,$1D,$A4,$1D,$30,$15,$30,$15
                    db $A5,$1D,$A6,$1D,$30,$15,$30,$15
                    db $B3,$15,$B4,$15,$B5,$15,$B6,$15
                    db $A9,$15,$AA,$15,$B9,$15,$32,$15
                    db $23,$15,$AB,$15,$33,$15,$31,$15
                    db $35,$15,$16,$15,$34,$15,$26,$15
                    db $99,$15,$16,$15,$34,$15,$26,$15
                    db $4C,$15,$4D,$15,$5C,$15,$40,$15
                    db $4D,$15,$4D,$15,$41,$15,$42,$15
                    db $4D,$15,$4D,$15,$43,$15,$44,$15
                    db $4D,$15,$4E,$15,$45,$15,$5D,$15
                    db $5C,$15,$50,$15,$5C,$15,$60,$15
                    db $51,$15,$52,$15,$61,$15,$62,$15
                    db $53,$15,$54,$15,$63,$15,$64,$15
                    db $55,$15,$5D,$15,$65,$15,$5D,$15
                    db $5C,$15,$70,$15,$5C,$15,$46,$15
                    db $71,$15,$72,$15,$47,$15,$48,$15
                    db $73,$15,$74,$15,$49,$15,$4A,$15
                    db $75,$15,$5D,$15,$4B,$15,$5D,$15
                    db $5C,$15,$56,$15,$5C,$15,$66,$15
                    db $57,$15,$58,$15,$67,$15,$68,$15
                    db $59,$15,$5A,$15,$69,$15,$6A,$15
                    db $5B,$15,$5D,$15,$6B,$15,$5D,$15
                    db $5C,$15,$76,$15,$5E,$15,$6C,$15
                    db $77,$15,$78,$15,$6C,$15,$6C,$15
                    db $79,$15,$7A,$15,$6C,$15,$6C,$15
                    db $7B,$15,$5D,$15,$6C,$15,$6D,$15
                    db $04,$15,$05,$15,$04,$15,$05,$15
                    db $06,$15,$34,$15,$06,$15,$34,$15
                    db $34,$15,$29,$15,$34,$15,$19,$15
                    db $2A,$15,$2B,$15,$1A,$15,$1B,$15
                    db $2C,$15,$38,$15,$1C,$15,$38,$15
                    db $34,$15,$19,$15,$34,$15,$19,$15
                    db $1A,$15,$1B,$15,$1A,$15,$1B,$15
                    db $1C,$15,$38,$15,$1C,$15,$38,$15
                    db $34,$15,$09,$15,$34,$15,$19,$15
                    db $0A,$15,$0B,$15,$1A,$15,$1B,$15
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $34,$15,$34,$15,$34,$15,$34,$15
                    db $34,$15,$36,$15,$34,$15,$36,$15
                    db $37,$15,$38,$15,$37,$15,$28,$15
                    db $34,$15,$09,$1D,$34,$15,$34,$15
                    db $09,$1D,$0A,$1D,$19,$1D,$1A,$1D
                    db $0B,$1D,$0C,$1D,$1B,$1D,$1C,$1D
                    db $0C,$5D,$0B,$5D,$1C,$5D,$1B,$5D
                    db $34,$15,$8D,$1D,$9C,$1D,$9D,$1D
                    db $AC,$1D,$AD,$1D,$BC,$1D,$BD,$1D
                    db $8C,$1D,$8E,$1D,$BB,$1D,$9E,$1D
                    db $AD,$5D,$AC,$5D,$BD,$5D,$BC,$5D
                    db $0A,$55,$09,$55,$1A,$55,$19,$55
                    db $00,$15,$01,$15,$10,$15,$11,$15
                    db $BB,$1D,$BC,$1D,$34,$1D,$88,$1D
                    db $BD,$1D,$BC,$1D,$89,$1D,$8C,$1D
                    db $BD,$1D,$BC,$1D,$8D,$1D,$89,$5D
                    db $34,$15,$34,$15,$34,$15,$CE,$15
                    db $EC,$15,$ED,$15,$FC,$15,$FD,$15
                    db $EE,$15,$EF,$15,$FE,$15,$FF,$15
                    db $34,$15,$34,$15,$CF,$15,$34,$15
                    db $CE,$15,$CF,$15,$34,$15,$DE,$15
                    db $D8,$15,$D9,$15,$C9,$15,$FD,$15
                    db $C1,$15,$C2,$15,$FE,$15,$DF,$15
                    db $CE,$15,$CF,$15,$DE,$15,$34,$15
                    db $CE,$15,$CF,$15,$34,$15,$DE,$15
                    db $D8,$15,$D9,$15,$6E,$15,$FD,$15
                    db $C1,$15,$C2,$15,$FE,$15,$6F,$15
                    db $CE,$15,$CF,$15,$DE,$15,$34,$15
                    db $CE,$15,$CF,$15,$34,$15,$34,$15
                    db $CE,$15,$CF,$15,$34,$15,$34,$15
                    db $34,$1D,$A8,$1D,$34,$1D,$A8,$1D
                    db $A9,$1D,$8A,$1D,$B9,$1D,$B9,$1D
                    db $34,$15,$DE,$15,$CE,$15,$CF,$15
                    db $C9,$15,$FD,$15,$D8,$15,$D9,$15
                    db $FE,$15,$DF,$15,$C1,$15,$C2,$15
                    db $DE,$15,$34,$15,$CE,$15,$CF,$15
                    db $1D,$1D,$1E,$1D,$2D,$1D,$2E,$1D
                    db $1F,$1D,$29,$1D,$2F,$1D,$39,$1D
                    db $37,$15,$38,$15,$37,$15,$38,$15
                    db $34,$15,$DE,$15,$34,$15,$34,$15
                    db $6E,$15,$FD,$15,$34,$15,$34,$15
                    db $FE,$15,$6F,$15,$34,$15,$34,$15
                    db $DE,$15,$34,$15,$34,$15,$34,$15
                    db $3F,$1D,$2A,$1D,$25,$1D,$3A,$1D
                    db $34,$15,$26,$95,$24,$95,$16,$95
                    db $27,$95,$38,$15,$17,$95,$18,$95
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$83,$1D,$92,$1D,$93,$1D
                    db $BD,$1D,$BE,$1D,$88,$1D,$34,$1D
                    db $B0,$1D,$B1,$1D,$B2,$1D,$2B,$1D
                    db $20,$15,$21,$15,$30,$15,$31,$15
                    db $02,$15,$03,$15,$12,$15,$13,$15
                    db $B1,$5D,$B0,$5D,$2C,$1D,$B2,$5D
                    db $34,$15,$34,$1D,$34,$15,$34,$1D
                    db $34,$1D,$98,$1D,$34,$1D,$A8,$1D
                    db $89,$1D,$8A,$1D,$99,$1D,$9A,$1D
                    db $8B,$1D,$89,$5D,$9B,$1D,$99,$5D
                    db $9C,$1D,$34,$1D,$AC,$1D,$34,$1D
                    db $24,$15,$16,$15,$34,$15,$26,$15
                    db $17,$15,$18,$15,$27,$15,$28,$15
                    db $B3,$1D,$3B,$1D,$34,$1D,$8E,$1D
                    db $3C,$1D,$B3,$5D,$8F,$1D,$34,$1D
                    db $34,$1D,$A8,$1D,$34,$1D,$A8,$1D
                    db $A9,$1D,$8A,$1D,$B9,$1D,$B9,$1D
                    db $8B,$1D,$A9,$5D,$B9,$1D,$BA,$1D
                    db $AC,$1D,$34,$1D,$AC,$1D,$34,$1D
                    db $34,$15,$34,$15,$0D,$1D,$0E,$1D
                    db $34,$15,$34,$15,$0F,$1D,$34,$15
                    db $1D,$1D,$1E,$1D,$2D,$1D,$2E,$1D
                    db $1F,$1D,$29,$1D,$2F,$1D,$39,$1D
                    db $37,$15,$38,$15,$37,$15,$38,$15
                    db $34,$1D,$A8,$1D,$34,$1D,$B8,$1D
                    db $8B,$1D,$A9,$5D,$B9,$1D,$B9,$1D
                    db $AC,$1D,$34,$1D,$BA,$1D,$34,$1D
                    db $3D,$1D,$3E,$1D,$34,$15,$15,$1D
                    db $3F,$1D,$2A,$1D,$25,$1D,$3A,$1D
                    db $34,$15,$26,$95,$24,$95,$16,$95
                    db $27,$95,$38,$15,$17,$95,$18,$95
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$83,$1D,$92,$1D,$93,$1D
                    db $32,$15,$22,$15,$10,$15,$11,$15
                    db $22,$15,$23,$15,$10,$15,$11,$15
                    db $33,$15,$00,$15,$10,$15,$11,$15
                    db $A0,$1D,$A1,$1D,$10,$15,$11,$15
                    db $A2,$1D,$A3,$1D,$10,$15,$11,$15
                    db $33,$15,$34,$15,$10,$15,$11,$15
                    db $85,$15,$87,$15,$95,$15,$97,$15
                    db $84,$15,$86,$15,$94,$15,$96,$15
                    db $85,$15,$86,$15,$95,$15,$96,$15
                    db $84,$15,$87,$15,$94,$15,$97,$15
                    db $84,$15,$85,$15,$94,$15,$95,$15
                    db $86,$15,$85,$15,$96,$15,$95,$15
                    db $A6,$15,$A7,$15,$B6,$15,$B7,$15
                    db $94,$15,$A6,$15,$B4,$15,$B6,$15
                    db $A6,$15,$A6,$15,$B6,$15,$B6,$15
                    db $94,$15,$A7,$15,$B4,$15,$B7,$15
                    db $24,$10,$24,$10,$24,$10,$24,$10

DATA_05AC14:        db $0E,$15,$0F,$15,$1E,$15,$1F,$15
                    db $02,$1D,$03,$1D,$12,$1D,$13,$1D
                    db $20,$1D,$21,$1D,$30,$1D,$31,$1D
                    db $2E,$15,$2F,$15,$3E,$15,$3F,$15
                    db $22,$1D,$23,$1D,$32,$1D,$33,$1D
                    db $20,$1D,$21,$1D,$1C,$15,$1D,$15
                    db $28,$15,$29,$15,$10,$1D,$11,$1D
                    db $2A,$15,$2B,$15,$12,$1D,$13,$1D
                    db $6C,$15,$6D,$15,$7C,$15,$7D,$15
                    db $4E,$15,$4F,$15,$5E,$15,$5F,$15
                    db $6E,$15,$6F,$15,$7E,$15,$7F,$15
                    db $48,$1D,$49,$1D,$58,$1D,$59,$1D
                    db $4A,$1D,$4B,$1D,$5A,$1D,$5B,$1D
                    db $0C,$15,$0D,$15,$1C,$15,$1D,$15
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $6A,$1D,$6B,$1D,$7A,$1D,$7B,$1D
                    db $28,$15,$29,$15,$38,$15,$39,$15
                    db $2A,$15,$2B,$15,$3A,$15,$3B,$15
                    db $08,$15,$09,$15,$18,$15,$19,$15
                    db $0A,$15,$0B,$15,$1A,$15,$1B,$15
                    db $06,$1D,$07,$1D,$16,$1D,$17,$15
                    db $04,$15,$05,$1D,$14,$1D,$15,$1D
                    db $06,$1D,$03,$1D,$16,$1D,$13,$1D
                    db $26,$1D,$27,$1D,$36,$1D,$37,$1D
                    db $24,$1D,$25,$1D,$34,$1D,$35,$1D
                    db $26,$1D,$23,$1D,$36,$1D,$33,$1D
                    db $2C,$15,$2D,$15,$3C,$15,$3D,$15
                    db $3D,$15,$3C,$15,$3C,$15,$3D,$15
                    db $00,$1D,$01,$1D,$10,$1D,$11,$1D

DATA_05AD04:        dw $0000,$0036,$00C6,$00D8              ;Indices to $05B557
                    dw $01B8,$022A,$0264,$040E
                    dw $05B8,$05EA,$0610,$064C
                    dw $067A,$0686,$06B8,$06C6
                    dw $072A,$080A,$09B4,$09D0
                    dw $0A22,$0A54,$0A78,$0AAA
                    dw $0AB6,$0C60,$0D50,$0E40
                    dw $0E58,$0EBC,$0F26,$0F8A
                    dw $0FEE,$1060
					
DATA_05AD48:        db $FE,$00,$B9,$B8,$B6,$FE,$00,$BE
                    db $C3,$C6,$FE,$B4,$B1,$BC,$BD,$B0
                    db $B5,$FE,$C0,$C1,$C0,$C1,$C0,$C4
                    db $FE,$B2,$B3,$B2,$B3,$B2,$B3,$B6
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C6
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C6
                    db $FF,$FE,$B9,$B8,$FE,$BE,$C3,$FE
                    db $BE,$C3,$FF,$FE,$00,$00,$BA,$B0
                    db $B5,$FE,$00,$BF,$C1,$C0,$C4

DATA_05AD8F:        db $FE,$00,$B9,$B3,$B2,$B3,$B6,$FE
                    db $00,$BE,$C3,$C2,$C3,$C6,$FE,$00
                    db $BA,$BC,$BD,$BC,$BD,$B0,$B5,$FE
                    db $BF,$C1,$C0,$C1,$C0,$C1,$C0,$C4
                    db $FE,$B9,$B3,$B2,$B3,$B2,$B3,$B2
                    db $B3,$FE,$BE,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$FE,$BE,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$FF,$FE,$00,$00,$00
                    db $00,$C7,$FE,$00,$00,$00,$BF,$C4
                    db $FE,$00,$00,$00,$B9,$B3,$B6,$00
                    db $B9,$B8,$BB,$B8,$B6,$FE,$00,$00
                    db $00,$BE,$C3,$C6,$00,$BE,$C3,$C2
                    db $C3,$C6,$FE,$00,$00,$B4,$B1,$BC
                    db $BD,$B0,$B1,$BC,$BD,$BC,$BD,$B0
                    db $B5,$FE,$00,$00,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C1,$C0,$C1,$C0,$C4
                    db $FE,$B9,$B8,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B2,$B3,$FE
                    db $BE,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$FE,$BE
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$FF,$FE,$00
                    db $00,$00,$00,$C7,$FE,$00,$00,$00
                    db $BF,$C4,$FE,$00,$B9,$B8,$BB,$B3
                    db $BB,$B8,$B6,$FE,$00,$BE,$C3,$C2
                    db $C3,$C2,$C3,$C6,$FE,$B4,$B1,$BC
                    db $BD,$BC,$BD,$BC,$BD,$B0,$B5,$FE
                    db $C0,$C1,$C0,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C4,$FE,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$FE,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$FF,$FE,$B6,$FE,$C6
                    db $FE,$C6,$FF,$FE,$B4,$B1,$FE,$C0
                    db $C1,$FE,$B2,$B3,$FE,$C2,$C3,$FE
                    db $C2,$C3,$FF,$FE,$00,$00,$00,$00
                    db $00,$B9,$B8,$B6,$FE,$00,$00,$00
                    db $00,$00,$BE,$C3,$C6,$FE,$00,$00
                    db $00,$00,$B4,$B1,$BC,$BD,$B0,$B5
                    db $FE,$00,$00,$00,$00,$C0,$C1,$C0
                    db $C1,$C0,$C4,$FE,$B9,$B8,$BB,$B8
                    db $B2,$B3,$B2,$B3,$B2,$B3,$FE,$BE
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$FE,$BE,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$FF,$FE,$00,$00
                    db $00,$00,$C7,$00,$C7,$FE,$00,$00
                    db $00,$BF,$C4,$BF,$C4,$FE,$00,$B9
                    db $B8,$BB,$B3,$BB,$B3,$B6,$FE,$00
                    db $BE,$C3,$C2,$C3,$C2,$C3,$C6,$FE
                    db $B4,$B1,$BC,$BD,$BC,$BD,$BC,$BD
                    db $B0,$B5,$FE,$C0,$C1,$C0,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C4,$FE,$B2,$B3
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$FE,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$FF,$FE
                    db $00,$00,$BA,$B0,$B5,$00,$00,$00
                    db $C7,$FE,$00,$BF,$C1,$C0,$C4,$00
                    db $00,$BF,$C4,$FE,$00,$B9,$B3,$B2
                    db $B3,$B6,$00,$B9,$B3,$BB,$B8,$B6
                    db $FE,$00,$BE,$C3,$C2,$C3,$C6,$00
                    db $BE,$C3,$C2,$C3,$C6,$FE,$B4,$B1
                    db $BC,$BD,$BC,$BD,$B0,$B1,$BC,$BD
                    db $BC,$BD,$B0,$B1,$B0,$B5,$FE,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C4,$FE
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B6,$FE,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C6,$FE,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C6,$FF,$FE,$00
                    db $00,$00,$00,$C7,$FE,$00,$00,$00
                    db $BF,$C4,$FE,$00,$B9,$B8,$BB,$B3
                    db $B6,$FE,$00,$BE,$C3,$C2,$C3,$C6
                    db $FE,$B4,$B1,$BC,$BD,$BC,$BD,$B0
                    db $B5,$FE,$C0,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C4,$FE,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$FE,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$FE,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$FF,$FE,$B4
                    db $B1,$B0,$B5,$FE,$C0,$C1,$C0,$C8
                    db $FE,$B2,$B3,$B2,$B3,$B6,$FE,$C2
                    db $C3,$C2,$C3,$C6,$FE,$C2,$C3,$C2
                    db $C3,$C6,$FF,$FE,$00,$00,$00,$00
                    db $00,$B4,$B5,$00,$C7,$B4,$B5,$FE
                    db $00,$00,$00,$00,$00,$C0,$C8,$BF
                    db $C8,$C0,$C8,$FE,$00,$00,$00,$B9
                    db $B8,$B2,$B3,$BB,$B3,$B2,$B3,$B6
                    db $FE,$00,$00,$00,$BE,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C6,$FE,$00,$BA
                    db $B0,$B1,$BC,$BD,$BC,$BD,$BC,$BD
                    db $BC,$BD,$B0,$B5,$FE,$BF,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C1,$C0
                    db $C1,$C0,$C4,$FE,$B9,$B3,$B2,$B3
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B2,$B3,$BB,$B8,$B6,$FE,$BE,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C6,$FE
                    db $BE,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C6,$FF,$FE,$00,$00,$B4,$B1,$B0
                    db $B5,$FE,$00,$00,$C0,$C1,$C0,$C4
                    db $FE,$BB,$B8,$B2,$B3,$B2,$B3,$B6
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C6
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C6
                    db $FF,$FE,$00,$00,$00,$00,$00,$00
                    db $00,$C7,$FE,$00,$00,$00,$00,$00
                    db $00,$BF,$C4,$FE,$00,$00,$B9,$B8
                    db $B6,$00,$B9,$B3,$BB,$B8,$B6,$FE
                    db $00,$00,$BE,$C3,$C6,$00,$BE,$C3
                    db $C2,$C3,$C6,$FE,$00,$00,$BA,$BC
                    db $BD,$B0,$B1,$BC,$BD,$BC,$BD,$B0
                    db $B5,$FE,$00,$BF,$C1,$C0,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C4,$FE
                    db $00,$B9,$B3,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B6,$FE,$00
                    db $BE,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C6,$FE,$B4,$B1
                    db $BC,$BD,$BC,$BD,$BC,$BD,$BC,$BD
                    db $BC,$BD,$BC,$BD,$B0,$B5,$FE,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C4,$FE
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B6,$FE,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C6,$FE,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C6,$FF

DATA_05B1A5:        db $03,$04,$05,$FE,$12,$13,$16,$06 ;
                    db $07,$FE,$12,$13,$16,$16,$16,$17 ;
                    db $18,$FE,$12,$13,$16,$16,$16,$16 ;
                    db $08,$09,$18,$FE,$12,$13,$16,$16 ;
                    db $16,$16,$16,$16,$19,$1A,$18,$FE ;
                    db $12,$13,$16,$16,$16,$16,$16,$16 ;
                    db $16,$16,$0A,$1C,$18,$FE,$12,$13 ;
                    db $16,$16,$16,$16,$16,$16,$16,$16 ;
                    db $16,$08,$1B,$1C,$18,$FE,$12,$13 ;
                    db $16,$16,$16,$16,$16,$16,$16,$16 ;
                    db $16,$16,$16,$19,$0C,$0B,$18,$FE ;
                    db $12,$13,$16,$16,$16,$16,$16,$16 ;
                    db $16,$16,$16,$16,$16,$16,$16,$0A ;
                    db $1C,$0B,$18,$FE,$12,$13,$16,$16 ;
                    db $16,$16,$16,$16,$16,$16,$16,$16 ;
                    db $16,$16,$16,$16,$08,$1B,$1C,$0B ;
                    db $18,$FE,$12,$13,$16,$16,$16,$16 ;
                    db $16,$16,$16,$16,$16,$16,$16,$16 ;
                    db $16,$16,$16,$16,$19,$1C,$1C,$0B ;
                    db $18,$FF,$FE,$13,$24,$FE,$FE,$13 ;
                    db $23,$16,$16,$16,$16,$32,$FF,$FE ;
                    db $13,$27,$FE,$13,$2C,$2D,$26,$FE ;
                    db $13,$20,$2E,$2F,$FE,$13,$16,$16 ;
                    db $16,$16,$16,$24,$FE,$13,$16,$16 ;
                    db $16,$16,$16,$16,$16,$16,$0A,$32 ;
                    db $FF,$FE,$13,$23,$FE,$13,$20,$FF ;
                    db $FE,$13,$24,$FE,$FE,$13,$27,$16 ;
                    db $16,$26,$FE,$FF,$FE,$FE,$13,$24 ;
                    db $FE,$13,$16,$16,$16,$2B,$FE,$FE ;
                    db $13,$16,$16,$16,$25,$16,$16,$16 ;
                    db $26,$FE,$13,$16,$23,$16,$24,$16 ;
                    db $16,$16,$24,$FE,$13,$16,$20,$16 ;
                    db $16,$16,$16,$16,$27,$FF,$FE,$13 ;
                    db $24,$FE,$13,$16,$16,$25,$FE,$13 ;
                    db $26,$FE,$13,$16,$16,$16,$24,$16 ;
                    db $27,$FE,$13,$16,$16,$16,$16,$16 ;
                    db $2C,$2D,$16,$0A,$32,$FF,$FE,$FE ;
                    db $13,$16,$16,$25,$FE,$13,$16,$16 ;
                    db $27,$FE,$13,$16,$16,$16,$16,$2C ;
                    db $2D,$FE,$13,$24,$23,$16,$16,$16 ;
                    db $2E,$2F,$16,$0A,$32,$FE,$13,$16 ;
                    db $16,$16,$16,$16,$16,$16,$16,$16 ;
                    db $08,$1B,$33,$FE,$13,$16,$16,$16 ;
                    db $16,$28,$20,$22,$FE,$13,$16,$16 ;
                    db $16,$16,$16,$29,$2A,$16,$16,$16 ;
                    db $16,$26,$21,$0A,$30,$FE,$13,$16 ;
                    db $16,$16,$16,$16,$16,$16,$16,$16 ;
                    db $16,$16,$16,$16,$20,$FF ;

DATA_05B323:        db $1A,$1B,$FE,$01,$02,$FE,$01,$02 ;
                    db $FE,$01,$02,$FE,$01,$02,$FE,$01 ;
                    db $02,$FE,$01,$02,$FE,$01,$26,$FE ;
                    db $2C,$2D,$FE,$30,$31,$32,$FF,$04 ;
                    db $05,$06,$07,$FE,$0D,$0E,$0F,$10 ;
                    db $FE,$16,$17,$18,$19,$FE,$1E,$1F ;
                    db $20,$21,$FE,$1E,$17,$18,$21,$FE ;
                    db $27,$1F,$28,$29,$FF,$FE,$11,$14 ;
                    db $FE,$1C,$1D,$FF,$FE,$22,$23,$FE ;
                    db $24,$25,$FE,$2A,$2B,$FE,$2E,$2F ;
                    db $FE,$33,$34,$FF,$FE,$41,$42,$43 ;
                    db $44,$FE,$45,$46,$47,$48,$FE,$49 ;
                    db $4A,$4B,$4C,$FE,$4D,$4E,$4F,$50 ;
                    db $FE,$51,$52,$53,$54,$FF,$FE,$0C ;
                    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C ;
                    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$FE ;
                    db $12,$13,$12,$13,$12,$13,$12,$13 ;
                    db $12,$13,$12,$13,$12,$13,$12,$13 ;
                    db $FE,$36,$37,$38,$36,$39,$3A,$3B ;
                    db $3B,$36,$3A,$3B,$3B,$3B,$36,$3A ;
                    db $38,$FE,$3C,$3D,$3E,$3C,$3F,$3D ;
                    db $3E,$3E,$3C,$3D,$3E,$3E,$3E,$3C ;
                    db $3D,$3E,$FF,$22,$23,$FE,$24,$25 ;
                    db $FE,$2A,$2B,$FE,$33,$34,$FF ;

DATA_05B3E2:        db $08,$FE,$0C,$FF,$14,$15,$16,$17 ;
                    db $FE,$1D,$1E,$1F,$20,$FE,$1D,$1E ;
                    db $1F,$20,$FE,$1D,$2A,$2B,$20,$FF ;
                    db $18,$19,$1A,$1B,$FE,$21,$22,$23 ;
                    db $24,$FE,$21,$22,$23,$24,$FE,$21 ;
                    db $22,$23,$24,$FF,$00,$00,$00,$00 ;
                    db $01,$02,$FE,$00,$00,$01,$03,$05 ;
                    db $06,$04,$02,$FE,$01,$03,$05,$09 ;
                    db $09,$09,$09,$06,$04,$02,$FE,$05 ;
                    db $09,$09,$09,$09,$09,$09,$09,$09 ;
                    db $06,$FF,$01,$03,$04,$03,$04,$02 ;
                    db $FE,$07,$08,$09,$09,$08,$0A,$FE ;
                    db $0B,$0C,$09,$09,$0C,$0D,$0E,$FE ;
                    db $11,$09,$09,$09,$09,$12,$13,$FE ;
                    db $11,$18,$19,$1A,$1B,$12,$13,$FE ;
                    db $11,$21,$22,$23,$24,$12,$13,$FE ;
                    db $11,$21,$22,$23,$24,$12,$13,$FE ;
                    db $11,$21,$22,$23,$24,$12,$13,$FF ;
                    db $02,$10,$10,$10,$10,$10,$10,$10 ;
                    db $10,$10,$10,$10,$10,$10,$10,$01 ;
                    db $FE,$35,$04,$03,$04,$03,$04,$03 ;
                    db $04,$03,$04,$03,$04,$03,$04,$03 ;
                    db $36,$FF ;

DATA_05B494:        db $00,$00,$00,$00,$00,$00,$00,$07 ;
                    db $01,$02,$03,$04,$01,$02,$03,$04 ;
                    db $00,$00,$00,$00,$00,$00,$10,$11 ;
                    db $0A,$0B,$0C,$0D,$0A,$0B,$0C,$0D ;
                    db $00,$00,$17,$18,$00,$00,$19,$15 ;
                    db $16,$12,$14,$15,$16,$12,$14,$15 ;
                    db $23,$24,$25,$22,$23,$24,$25,$1F ;
                    db $20,$21,$1E,$1F,$20,$21,$1E,$1F ;
                    db $FF,$08,$09,$03,$04,$05,$06,$00 ;
                    db $00,$00,$00,$00,$07,$08,$09,$03 ;
                    db $04,$0A,$0B,$0C,$0D,$0E,$0F,$00 ;
                    db $00,$00,$00,$10,$11,$0A,$0B,$0C ;
                    db $0D,$16,$12,$14,$15,$16,$12,$17 ;
                    db $18,$00,$00,$19,$15,$16,$12,$14 ;
                    db $15,$20,$21,$1E,$1F,$20,$21,$1E ;
                    db $22,$23,$24,$25,$1F,$20,$21,$1E ;
                    db $26,$FF,$01,$02,$03,$04,$08,$09 ;
                    db $03,$04,$05,$06,$00,$07,$08,$09 ;
                    db $03,$29,$0A,$0B,$0C,$0D,$0A,$0B ;
                    db $0C,$0D,$0E,$0F,$10,$11,$0A,$0B ;
                    db $0C,$0D,$0A,$12,$13,$0D,$0A,$12 ;
                    db $14,$15,$16,$12,$14,$15,$16,$12 ;
                    db $14,$15,$1A,$1B,$1C,$1D,$1A,$1B ;
                    db $1E,$1F,$20,$21,$1E,$1F,$20,$21 ;
                    db $1E,$1F,$FF ;

DATA_05B557:        dw $E091,$E070,$E048,$E020
                    dw $6900,$8163,$8970,$9180
                    dw $9510,$9920,$9D30,$A193
                    dw $B1A0,$B572,$E000,$81B0
                    dw $85D0,$8962,$9580,$A1C0
                    dw $A593,$B5A0,$B961,$6830
                    dw $7010,$9830,$E3F0

DATA_05B58D:        dw $E091,$E070,$E048,$E020
                    dw $6900,$8163,$8970,$9180
                    dw $9510,$9920,$9D30,$A193
                    dw $B1A0,$B572,$E000,$81B0
                    dw $85D0,$8962,$9580,$A1C0
                    dw $A593,$B5A0,$B961,$6830
                    dw $7010,$9830,$E000,$6910
                    dw $6D21,$7530,$79B0,$7DD0
                    dw $81B0,$85D0,$8973,$99C0
                    dw $9D90,$A1C0,$A596,$5C30
                    dw $E000,$6160,$6580,$6910
                    dw $6D22,$7930,$8190,$85A0
                    dw $8974,$9D60,$A197,$4010
                    dw $E000,$8160,$8580,$9940
                    dw $9D50,$A190,$A5A0,$A980
                    dw $B5B0,$B9F0,$BD70,$6010
                    dw $AC10,$E000,$8207,$A177
                    dw $E000,$8207,$A177,$E3F0

DATA_05B61D:        dw $E091,$E04F,$E020,$8000
                    dw $E000,$8001,$E000,$8002
                    dw $E3F0

DATA_06B62F:        dw $E04B,$E011,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$E000,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$E000
                    dw $0030,$1831,$2020,$2432
                    dw $2C1B,$3023,$3833,$4034
                    dw $4835,$5436,$5837,$5C38
                    dw $6439,$683A,$6C3B,$703C
                    dw $743D,$783E,$943F,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$E3F0

DATA_05B70F:        dw $E091,$E010,$E04C,$E080
                    dw $A010,$A420,$B010,$B420
                    dw $BC10,$A850,$E000,$A020
                    dw $A810,$AC20,$B810,$BC20
                    dw $B050,$4870,$E000,$A020
                    dw $A810,$AC20,$B410,$B820
                    dw $7C80,$E000,$AC10,$B020
                    dw $B810,$BC20,$E000,$A410
                    dw $A820,$B010,$B420,$BC50
                    dw $9090,$E000,$A810,$AC20
                    dw $B410,$B820,$E000,$A010
                    dw $A420,$B010,$B420,$BC10
                    dw $A860,$E000,$A020,$AC10
                    dw $B020,$B810,$BC20,$A460
                    dw $E3F0

DATA_05B781:        dw $E091,$E042,$E010,$B050
                    dw $B080,$E000,$6C70,$6C90
                    dw $A0F3,$E000,$7460,$74B0
                    dw $AC40,$ACA0,$E000,$8060
                    dw $80B0,$A4F9,$E000,$E000
                    dw $9060,$4060,$40C0,$B4F2
                    dw $E000,$3870,$38E0,$A4F4
                    dw $E3F0

DATA_05B7BB:        dw $E011,$E04B,$E031,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E000,$0010,$0C11,$1012
                    dw $1C13,$2414,$2815,$3016
                    dw $4C16,$5417,$5C18,$6019
                    dw $641A,$681B,$6C1C,$7816
                    dw $801D,$901E,$8107,$8510
                    dw $9911,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$E000,$0030
                    dw $1831,$2020,$2432,$2C1B
                    dw $3023,$3833,$4034,$4835
                    dw $5436,$5837,$5C38,$6439
                    dw $683A,$6C3B,$703C,$743D
                    dw $783E,$943F,$8107,$8911
                    dw $9910,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$8107
                    dw $8510,$9911,$E000,$181F
                    dw $2020,$2421,$2C22,$3023
                    dw $3820,$4024,$5025,$5826
                    dw $5C27,$6428,$6C29,$742A
                    dw $782B,$882C,$902D,$982F
                    dw $8107,$8510,$9910,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E3F0

DATA_05B965:        dw $E011,$E047,$E031,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E000,$0010,$0C11,$1012
                    dw $1C13,$2414,$2815,$3016
                    dw $4C16,$5417,$5C18,$6019
                    dw $641A,$681B,$6C1C,$7816
                    dw $801D,$901E,$8107,$8510
                    dw $9911,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$E000,$0030
                    dw $1831,$2020,$2432,$2C1B
                    dw $3023,$3833,$4034,$4835
                    dw $5436,$5837,$5C38,$6439
                    dw $683A,$6C3B,$703C,$743D
                    dw $783E,$943F,$8107,$8911
                    dw $9910,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$8107
                    dw $8510,$9911,$E000,$181F
                    dw $2020,$2421,$2C22,$3023
                    dw $3820,$4024,$5025,$5826
                    dw $5C27,$6428,$6C29,$742A
                    dw $782B,$882C,$902D,$982F
                    dw $8107,$8510,$9910,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E3F0

DATA_05BB0F:        dw $E091,$E042,$E010,$A850
                    dw $A880,$E000,$8C60,$8CB0
                    dw $E000,$A850,$A880,$E000
                    dw $7070,$7090,$A850,$A8B0
                    dw $9C70,$E000,$E000,$A840
                    dw $A8A0,$E000,$2470,$24E0
                    dw $E3F0

DATA_05BB41:        dw $E091,$E04E,$E010,$E0A0
                    dw $A803,$BC00,$E000,$A802
                    dw $E000,$A400,$AC01,$E000
                    dw $A803,$E000,$A401,$AC01
                    dw $BC08,$E000,$E3F0

DATA_05BB67:        dw $E091,$E010,$E0B0,$E0C0
                    dw $9010,$E000,$8800,$B010
                    dw $A425,$E000,$6810,$B420
                    dw $BC2F,$E000,$8810,$B800
                    dw $E000,$A800,$9810,$A420
                    dw $E000,$6800,$A420,$B420
                    dw $BC2F,$E000,$6810,$BC20
                    dw $E000,$E3F0

DATA_05BBA3:        dw $E091,$E010,$E045,$A410
                    dw $6800,$5C20,$E000,$6C00
                    dw $E000,$4030,$5C40,$E000
                    dw $5020,$9060,$E000,$A050
                    dw $8420,$7870,$E000,$4C80
                    dw $E000,$4090,$E3F0

DATA_05BBD1:        dw $E091,$E042,$E010,$2470
                    dw $24E0,$E3F0

DATA_05BBDD:        dw $E091,$E045,$E010,$8820
                    dw $B810,$7C00,$E000,$5890
                    dw $48A0,$E000,$98B0,$E000
                    dw $A410,$6800,$5CC0,$E000
                    dw $E000,$A010,$6400,$90D0
                    dw $E000,$8820,$B810,$7C00
                    dw $E3F0

DATA_05BC0F:        dw $E010,$E041,$2800,$E000
                    dw $E000,$2800,$E3F0

DATA_05BC1D:        dw $E091,$E042,$E013,$E04D
                    dw $A880,$AC24,$ACB2,$D043
                    dw $9090,$9436,$D890,$DC32
                    dw $BC92,$E000,$A064,$ACA0
                    dw $D003,$94A1,$B815,$E000
                    dw $C093,$C472,$B081,$B434
                    dw $9082,$9076,$E000,$C084
                    dw $C032,$8890,$ACA3,$D043
                    dw $8C36,$E000,$80A0,$A405
                    dw $ACB2,$D043,$98A3,$BC45
                    dw $7490,$7838,$E000,$C480
                    dw $C822,$B0A0,$D403,$9482
                    dw $9476,$E3F0

DATA_05BC81:        dw $E04B,$E011,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$E000,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$E000
                    dw $0030,$1831,$2020,$2432
                    dw $2C1B,$3023,$3833,$4034
                    dw $4835,$5436,$5837,$5C38
                    dw $6439,$683A,$6C3B,$703C
                    dw $743D,$783E,$943F,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$E3F0

DATA_05BD61:        dw $E011,$E04B,$E031,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E000,$0010,$0C11,$1012
                    dw $1C13,$2414,$2815,$3016
                    dw $4C16,$5417,$5C18,$6019
                    dw $641A,$681B,$6C1C,$7816
                    dw $801D,$901E,$8107,$8510
                    dw $9911,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$E000,$0030
                    dw $1831,$2020,$2432,$2C1B
                    dw $3023,$3833,$4034,$4835
                    dw $5436,$5837,$5C38,$6439
                    dw $683A,$6C3B,$703C,$743D
                    dw $783E,$943F,$8107,$8911
                    dw $9910,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$8107
                    dw $8510,$9911,$E000,$181F
                    dw $2020,$2421,$2C22,$3023
                    dw $3820,$4024,$5025,$5826
                    dw $5C27,$6428,$6C29,$742A
                    dw $782B,$882C,$902D,$982F
                    dw $8107,$8510,$9910,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E3F0

DATA_05BF0B:        dw $E091,$E013,$E042,$E04D
                    dw $C080,$C422,$B0A0,$D403
                    dw $9482,$9476,$E000,$80A0
                    dw $A405,$E3F0

DATA_05BF27:        dw $E091,$E042,$E010,$6C70
                    dw $6C90,$E000,$8C60,$8CB0
                    dw $E000,$7470,$7490,$AC50
                    dw $AC80,$E000,$8070,$80E0
                    dw $E000,$6070,$60E0,$E000
                    dw $8840,$88D0,$A060,$A0B0
                    dw $E000,$5470,$74A0,$E000
                    dw $6070,$60E0,$E000,$8870
                    dw $8890,$E000,$5070,$5090
                    dw $E000,$E000,$2870,$28E0
                    dw $E3F0

DATA_05BF79:        dw $E091,$E045,$E010,$8820
                    dw $B810,$7C00,$E000,$5890
                    dw $48A0,$E000,$98B0,$E000
                    dw $A410,$6800,$5CC0,$E000
                    dw $E000,$A010,$6400,$90D0
                    dw $E000,$8820,$B810,$7C00
                    dw $E3F0

DATA_05BFAB:        dw $E091,$E010,$E045,$8420
                    dw $7470,$E000,$4880,$5C90
                    dw $E000,$E000,$40C0,$E000
                    dw $4090,$E000,$4830,$E000
                    dw $04E0,$E3F0

DATA_05BFCF:        dw $E091,$E045,$E010,$8820
                    dw $B810,$7C00,$E000,$5890
                    dw $48A0,$E000,$98B0,$E000
                    dw $A410,$6800,$5CC0,$E000
                    dw $E000,$A010,$6400,$90D0
                    dw $E000,$8820,$B810,$7C00
                    dw $E3F0

DATA_05C001:        dw $E011,$E041,$2800,$E000
                    dw $2C00,$E3F0

DATA_05C00D:        dw $E011,$E047,$E031,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E000,$0010,$0C11,$1012
                    dw $1C13,$2414,$2815,$3016
                    dw $4C16,$5417,$5C18,$6019
                    dw $641A,$681B,$6C1C,$7816
                    dw $801D,$901E,$8107,$8510
                    dw $9911,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$E000,$0030
                    dw $1831,$2020,$2432,$2C1B
                    dw $3023,$3833,$4034,$4835
                    dw $5436,$5837,$5C38,$6439
                    dw $683A,$6C3B,$703C,$743D
                    dw $783E,$943F,$8107,$8911
                    dw $9910,$E000,$181F,$2020
                    dw $2421,$2C22,$3023,$3820
                    dw $4024,$5025,$5826,$5C27
                    dw $6428,$6C29,$742A,$782B
                    dw $882C,$902D,$982F,$8107
                    dw $8510,$9910,$0010,$0C11
                    dw $1012,$1C13,$2414,$2815
                    dw $3016,$4C16,$5417,$5C18
                    dw $6019,$641A,$681B,$6C1C
                    dw $7816,$801D,$901E,$8107
                    dw $8510,$9911,$E000,$181F
                    dw $2020,$2421,$2C22,$3023
                    dw $3820,$4024,$5025,$5826
                    dw $5C27,$6428,$6C29,$742A
                    dw $782B,$882C,$902D,$982F
                    dw $8107,$8510,$9910,$0010
                    dw $0C11,$1012,$1C13,$2414
                    dw $2815,$3016,$4C16,$5417
                    dw $5C18,$6019,$641A,$681B
                    dw $6C1C,$7816,$801D,$901E
                    dw $8107,$8510,$9911,$E000
                    dw $181F,$2020,$2421,$2C22
                    dw $3023,$3820,$4024,$5025
                    dw $5826,$5C27,$6428,$6C29
                    dw $742A,$782B,$882C,$902D
                    dw $982F,$8107,$8510,$9910
                    dw $E3F0

DATA_05C1B7:        dw $E012,$E060,$E050,$E043
                    dw $4510,$6D10,$6100,$1530
                    dw $5520,$2900,$A960,$C970
                    dw $AD82,$CD92,$B9A0,$D9B0
                    dw $2D40,$4D50,$2007,$0025
                    dw $1C15,$E000,$4510,$6D10
                    dw $1530,$5520,$2900,$2D40
                    dw $4D50,$2007,$0025,$1C15
                    dw $E000,$4510,$6D10,$6100
                    dw $1530,$5520,$2900,$A960
                    dw $C970,$AD82,$CD92,$B9A0
                    dw $D9B0,$2D40,$4D50,$2007
                    dw $0025,$1C15,$E000,$4510
                    dw $6D10,$1530,$5520,$2900
                    dw $2D40,$4D50,$2007,$0025
                    dw $1C15,$E000,$4510,$6D10
                    dw $6100,$1530,$5520,$2900
                    dw $A960,$C970,$AD82,$CD92
                    dw $B9A0,$D9B0,$2D40,$4D50
                    dw $2007,$0025,$1C15,$E000
                    dw $4510,$6D10,$1530,$5520
                    dw $2900,$2D40,$4D50,$2007
                    dw $0025,$1C15,$E000,$4510
                    dw $6D10,$6100,$1530,$5520
                    dw $2900,$A960,$C970,$AD82
                    dw $CD92,$B9A0,$D9B0,$2D40
                    dw $4D50,$2007,$0025,$1C15
                    dw $E000,$4510,$6D10,$1530
                    dw $5520,$2900,$2D40,$4D50
                    dw $2007,$0025,$1C15,$E3F0

DATA_05C2A7:        dw $E012,$E060,$E050,$E043
                    dw $4510,$6D10,$6100,$1530
                    dw $5520,$2900,$A960,$C970
                    dw $AD82,$CD92,$B9A0,$D9B0
                    dw $2D40,$4D50,$2007,$0025
                    dw $1C15,$E000,$4510,$6D10
                    dw $1530,$5520,$2900,$2D40
                    dw $4D50,$2007,$0025,$1C15
                    dw $E000,$4510,$6D10,$6100
                    dw $1530,$5520,$2900,$A960
                    dw $C970,$AD82,$CD92,$B9A0
                    dw $D9B0,$2D40,$4D50,$2007
                    dw $0025,$1C15,$E000,$4510
                    dw $6D10,$1530,$5520,$2900
                    dw $2D40,$4D50,$2007,$0025
                    dw $1C15,$E000,$4510,$6D10
                    dw $6100,$1530,$5520,$2900
                    dw $A960,$C970,$AD82,$CD92
                    dw $B9A0,$D9B0,$2D40,$4D50
                    dw $2007,$0025,$1C15,$E000
                    dw $4510,$6D10,$1530,$5520
                    dw $2900,$2D40,$4D50,$2007
                    dw $0025,$1C15,$E000,$4510
                    dw $6D10,$6100,$1530,$5520
                    dw $2900,$A960,$C970,$AD82
                    dw $CD92,$B9A0,$D9B0,$2D40
                    dw $4D50,$2007,$0025,$1C15
                    dw $E000,$4510,$6D10,$1530
                    dw $5520,$2900,$2D40,$4D50
                    dw $2007,$0025,$1C15,$E3F0

DATA_05C397:        dw $E041,$E012,$2800,$E000      ;Mario bonus room background commands
                    dw $2800,$E000,$2800,$E000      ;Todo: same for luigi??
                    dw $2800,$E000,$2800,$E3F0

DATA_05C3AF:        dw $E046,$E050,$0003,$1003
                    dw $4019,$5019,$403F,$0826
                    dw $1826,$E000,$0C03,$4C19
                    dw $1C03,$5C19,$403F,$0426
                    dw $1426,$E000,$0803,$4819
                    dw $403A,$0026,$5449,$9C45
                    dw $3060,$E000,$0C07,$8C13
                    dw $1807,$9813,$803F,$0426
                    dw $3050,$6060,$E000,$2850
                    dw $0007,$8013,$1007,$9013
                    dw $803F,$5480,$E000,$0007
                    dw $8013,$1407,$9413,$803F
                    dw $4480,$E3F0

DATA_05C413:        dw $E046,$E050,$0007,$1007
                    dw $6017,$7017,$603F,$0826
                    dw $B890,$E000,$0005,$1005
                    dw $6017,$7017,$603F,$0826
                    dw $B4A0,$E000,$0005,$6017
                    dw $6039,$7047,$4860,$A890
                    dw $3850,$E000,$1005,$7017
                    dw $683B,$6447,$5860,$E000
                    dw $0005,$6017,$1005,$7017
                    dw $603F,$0826,$5860,$B890
                    dw $E000,$0005,$6017,$1005
                    dw $7017,$603F,$0826,$5480
                    dw $E000,$603F,$4480,$5080
                    dw $E3F0

DATA_05C47D:        dw $E046,$E050,$0003,$1003
                    dw $4019,$5019,$403F,$0826
                    dw $1826,$E000,$0C03,$4C19
                    dw $1C03,$5C19,$403F,$0426
                    dw $1426,$E000,$0803,$4819
                    dw $403A,$0026,$5449,$9C45
                    dw $3060,$E000,$0C07,$8C13
                    dw $1807,$9813,$803F,$0426
                    dw $3050,$6060,$E000,$2850
                    dw $0007,$8013,$1007,$9013
                    dw $803F,$5480,$E000,$0007
                    dw $8013,$1407,$9413,$803F
                    dw $4480,$E3F0

DATA_05C4E1:        dw $E046,$E050,$0003,$1003
                    dw $4019,$5019,$403F,$0826
                    dw $1826,$E000,$0C03,$4C19
                    dw $1C03,$5C19,$403F,$0426
                    dw $1426,$E000,$0803,$4819
                    dw $403A,$0026,$5449,$9C45
                    dw $3060,$E000,$0C07,$8C13
                    dw $1807,$9813,$803F,$0426
                    dw $3050,$6060,$E000,$2850
                    dw $0007,$8013,$1007,$9013
                    dw $803F,$5480,$E000,$0007
                    dw $8013,$1407,$9413,$803F
                    dw $4480,$E3F0

DATA_05C545:        dw $E050,$E046,$0005,$1405
                    dw $6017,$7417,$603F,$0826
                    dw $5C60,$E000,$0807,$1C07
                    dw $6817,$7C17,$603F,$1026
                    dw $E000,$1007,$7017,$603F
                    dw $7C47,$0426,$E000,$0426
                    dw $7435,$7047,$5860,$B890
                    dw $E000,$0C07,$1C07,$6C17
                    dw $7C17,$603F,$0426,$5080
                    dw $B490,$E000,$603F,$7C47
                    dw $0426,$4C80,$E000,$7435
                    dw $7047,$2450,$5480,$E000
                    dw $7017,$8017,$603F,$4090
                    dw $5090,$4480,$5480,$A0B0
                    dw $E3F0

DATA_05C5B7:        dw $E012,$E050,$E044,$A0A0
                    dw $2010,$2800,$4C30,$5830
                    dw $E000,$A0A0,$4430,$3010
                    dw $3800,$5C30,$E000,$A0A0
                    dw $4830,$5430,$E000,$A0A0
                    dw $2010,$2800,$5020,$5850
                    dw $E000,$A0A0,$4820,$5050
                    dw $5820,$E000,$A0A0,$4450
                    dw $2C00,$94D0,$E000,$A0A0
                    dw $2000,$4840,$5440,$3C00
                    dw $E000,$A0A0,$2010,$4830
                    dw $7470,$5C20,$E000,$A0A0
                    dw $2410,$8CC0,$3010,$5820
                    dw $E000,$A0A0,$4050,$5050
                    dw $4880,$5820,$E000,$A0A0
                    dw $2400,$4C20,$5820,$E3F0

DATA_05C637:        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;Empty, unused data
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
                    db $FF

CODE_05C800:        LDA.w $4212               ;
                    LSR   A                   ;
                    BCS   CODE_05C800         ;
                    STZ.w $4016               ;
                    LDA.l $701FF4             ;
                    TAX                       ;
                    LDA.w $4218,x             ;
                    STA.w $0FF8               ;
                    TAY                       ;
                    EOR.w $0FFD               ;
                    AND.w $0FF8               ;
                    STA.w $0FFA               ;
                    STY.w $0FFD               ;
                    LDA.w $4219,x             ;
                    STA.w $0FF4               ;
                    TAY                       ;
                    EOR.w $0FFC               ;
                    AND.w $0FF4               ;
                    STA.w $0FF6               ;
                    STY.w $0FFC               ;
                    LDA.l $701FF6             ;
                    TAX                       ;
                    LDA.w $4218,x             ;
                    STA.w $0FF9               ;
                    TAY                       ;
                    EOR.w $0FFE               ;
                    AND.w $0FF9               ;
                    STA.w $0FFB               ;
                    STY.w $0FFE               ;
                    LDA.w $4219,x             ;
                    STA.w $0FF5               ;
                    TAY                       ;
                    EOR.w $0FFF               ;
                    AND.w $0FF5               ;
                    STA.w $0FF7               ;
                    STY.w $0FFF               ;
                    RTL                       ;

CODE_05C860:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.l $700006             ;
                    BNE   CODE_05C88B         ;
                    LDA.w $0FF8               ;
                    AND.b #$C0                ;
                    TSB.w $0FF4               ;
                    LDA.w $0FFA               ;
                    AND.b #$C0                ;
                    TSB.w $0FF6               ;
                    LDA.w $0FF9               ;
                    AND.b #$C0                ;
                    TSB.w $0FF5               ;
                    LDA.w $0FFB               ;
                    AND.b #$C0                ;
                    TSB.w $0FF7               ;
                    BRA   CODE_05C8F3         ;

CODE_05C88B:        LDA.w $0FF4               ;
                    AND.b #$80                ;
                    LSR   A                   ;
                    TSB.w $0FF4               ;
                    LDA.w $0FF8               ;
                    AND.b #$C0                ;
                    STA.b $00                 ;
                    LDA.w $0FF4               ;
                    AND.b #$7F                ;
                    ORA.b $00                 ;
                    STA.w $0FF4               ;
                    LDA.w $0FF6               ;
                    AND.b #$80                ;
                    LSR   A                   ;
                    TSB.w $0FF6               ;
                    LDA.w $0FFA               ;
                    AND.b #$C0                ;
                    STA.b $00                 ;
                    LDA.w $0FF6               ;
                    AND.b #$7F                ;
                    ORA.b $00                 ;
                    STA.w $0FF6               ;
                    LDA.w $0FF5               ;
                    AND.b #$80                ;
                    LSR   A                   ;
                    TSB.w $0FF5               ;
                    LDA.w $0FF9               ;
                    AND.b #$C0                ;
                    STA.b $00                 ;
                    LDA.w $0FF5               ;
                    AND.b #$7F                ;
                    ORA.b $00                 ;
                    STA.w $0FF5               ;
                    LDA.w $0FF7               ;
                    AND.b #$80                ;
                    LSR   A                   ;
                    TSB.w $0FF7               ;
                    LDA.w $0FFB               ;
                    AND.b #$C0                ;
                    STA.b $00                 ;
                    LDA.w $0FF7               ;
                    AND.b #$7F                ;
                    ORA.b $00                 ;
                    STA.w $0FF7               ;
CODE_05C8F3:        PLB                       ;
                    RTL                       ;

                    db $03,$02,$06,$08,$01,$13

CODE_05C8FB:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.w $0770               ;
                    BEQ   CODE_05C94D         ;
                    LDA.w $0752               ;
                    CMP.b #$02                ;
                    BEQ   CODE_05C91C         ;
                    LDY.b #$05                ;
                    LDA.w $0710               ;
                    CMP.b #$06                ;
                    BEQ   CODE_05C918         ;
                    CMP.b #$07                ;
                    BNE   CODE_05C91C         ;
CODE_05C918:        LDY.b #$05                ;
                    BRA   CODE_05C925         ;

CODE_05C91C:        LDY.b $BA                 ;
                    LDA.w $0743               ;
                    BEQ   CODE_05C925         ;
                    LDY.b #$04                ;
CODE_05C925:        LDA.b $0F                 ;
                    CMP.b #$04                ;
                    BEQ   CODE_05C944         ;
                    CMP.b #$05                ;
                    BEQ   CODE_05C944         ;
                    LDA.b $DB                 ;
                    CMP.b #$1B                ;
                    BNE   CODE_05C939         ;
                    LDA.b #$01                ;
                    BRA   CODE_05C93C         ;

CODE_05C939:        LDA.w $C8F5,y             ;
CODE_05C93C:        LDX.w $0EDF               ;
                    BNE   CODE_05C944         ;
                    STA.w $1602               ;
CODE_05C944:        LDX.b $DB                 ;
                    CPX.b #$21                ;
                    BNE   CODE_05C94D         ;
                    STA.w $0EDF               ;
CODE_05C94D:        PLX                       ;
                    PLB                       ;
                    RTL                       ;

                    LDA.l $7FFB06             ;
                    BPL   CODE_05C958         ;
                    LDA.b #$00                ;
CODE_05C958:        STA.w $077A               ;
CODE_05C95B:        LDA.l $7FFB00             ;
                    STA.w $075F               ;
                    STA.w $0766               ;
                    LDA.l $7FFB01             ;
                    STA.w $075C               ;
                    STA.w $0763               ;
                    LDA.l $7FFB02             ;
                    BPL   CODE_05C976         ;
                    INC   A                   ;
CODE_05C976:        STA.w $0760               ;
                    STA.w $0767               ;
                    LDA.l $7FFB03             ;
                    STA.w $075A               ;
                    LDA.l $7FFB04             ;
                    STA.w $0761               ;
                    LDA.l $7FFB05             ;
                    STA.w $07FC               ;
                    STA.w $0781               ;
CODE_05C994:        PHX                       ;
                    LDX.b #$00                ;
CODE_05C997:        LDA.l $701FE0,x           ;
                    STA.w $07C8,x             ;
                    INX                       ;
                    CPX.b #$06                ;
                    BNE   CODE_05C997         ;
                    PLX                       ;
                    RTL                       ;

                    LDA.l $700009             ;
                    STA.w $0760               ;
                    STA.w $0767               ;
                    LDA.w $0E24               ;
                    STA.w $075C               ;
                    STA.w $0763               ;
                    LDA.b #$02                ;
                    STA.w $075A               ;
                    STA.w $0761               ;
                    STZ.w $075E               ;
                    STZ.w $0765               ;
                    PHX                       ;
                    LDX.b #$00                ;
CODE_05C9C9:        STZ.w $07CE,x             ;
                    INX                       ;
                    CPX.b #$0C                ;
                    BNE   CODE_05C9C9         ;
                    PLX                       ;
                    RTL                       ;

CODE_05C9D3:        PHX                       ;
                    PHY                       ;
                    LDA.w $0369               ;
                    BEQ   CODE_05CA13         ;
                    LDY.w $0B46,x             ;
                    LDX.b #$00                ;
CODE_05C9DF:        LDA.w $0900,y             ;
                    STA.w $0800,x             ;
                    TYA                       ;
                    AND.b #$03                ;
                    CMP.b #$01                ;
                    BNE   CODE_05C9FD         ;
                    LDA.w $0800,x             ;
                    CMP.b #$F0                ;
                    BCC   CODE_05C9FD         ;
                    LDA.b #$F0                ;
                    STA.w $0800,x             ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
CODE_05C9FD:        LDA.w $0D00,y             ;
                    STA.w $0C00,x             ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
                    LDA.b #$F0                ;
                    STA.w $0900,y             ;
                    INY                       ;
                    INX                       ;
                    CPX.b #$20                ;
                    BNE   CODE_05C9DF         ;
CODE_05CA13:        LDX.b #$00                ;
                    STZ.b $E7                 ;
CODE_05CA17:        LDA.w $0300,x             ;
                    BEQ   CODE_05CA26         ;
                    JSR.w CODE_05CA2E         ;
                    LDA.b $E7                 ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.b $E7                 ;
CODE_05CA26:        INX                       ;
                    CPX.b #$0D                ;
                    BCC   CODE_05CA17         ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_05CA2E:        LDA.b $9E                 ;
                    INC   A                   ;
                    STA.w $02FC               ;
                    PHX                       ;
                    LDY.w $030D,x             ;
                    STY.b $E6                 ;
                    LDA.w $CB2D,y             ;
                    CLC                       ;
                    ADC.b #$A0                ;
                    STA.b $E4                 ;
                    LDA.w $CB2E,y             ;
                    CLC                       ;
                    ADC.b #$A0                ;
                    STA.b $E5                 ;
                    LDY.b $E7                 ;
                    LDA.w $031A,x             ;
                    JSR.w CODE_05CAD3         ;
                    LDA.w $031A,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    JSR.w CODE_05CAD3         ;
                    LDY.b $E7                 ;
                    LDA.b $E4                 ;
                    JSR.w CODE_05CABD         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.b $E5                 ;
                    JSR.w CODE_05CABD         ;
                    LDX.b $E6                 ;
                    CPX.b #$04                ;
                    BCS   CODE_05CA76         ;
                    LDA.b #$22                ;
                    BRA   CODE_05CA78         ;

CODE_05CA76:        LDA.b #$23                ;
CODE_05CA78:        LDY.b $E7                 ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    PHA                       ;
                    JSR.w CODE_05CAD3         ;
                    PLA                       ;
                    JSR.w CODE_05CAD3         ;
                    LDY.b $E7                 ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b #$08                ;
                    STA.b $E8                 ;
CODE_05CA90:        LDA.w $CAE5,x             ;
                    STA.w $0902,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $E8                 ;
                    BNE   CODE_05CA90         ;
                    PLX                       ;
                    DEC.w $0327,x             ;
                    LDA.w $0327,x             ;
                    BNE   CODE_05CABC         ;
                    LDA.b #$03                ;
                    STA.w $0327,x             ;
                    INC.w $030D,x             ;
                    LDA.w $030D,x             ;
                    AND.b #$0F                ;
                    CMP.b #$09                ;
                    BNE   CODE_05CABC         ;
                    STZ.w $0300,x             ;
CODE_05CABC:        RTS                       ;

CODE_05CABD:        STA.w $0901,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0905,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0909,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $090D,y             ;
                    RTS                       ;

CODE_05CAD3:        STA.w $0900,y             ;
                    STA.w $0904,y             ;
                    STA.w $0908,y             ;
                    STA.w $090C,y             ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    RTS                       ;

                    db $10,$20,$FC,$FC,$11,$21,$FC,$FC
                    db $10,$20,$FC,$FC,$11,$21,$FC,$FC
                    db $12,$22,$FC,$FC,$13,$23,$FC,$FC
                    db $14,$24,$16,$FC,$15,$25,$17,$FC
                    db $4C,$5C,$4E,$5E,$4D,$5D,$4F,$5F
                    db $8C,$9C,$8E,$9E,$8D,$9D,$8F,$9F
                    db $AC,$BC,$AE,$BE,$AD,$BD,$AF,$BF
                    db $AC,$BC,$AE,$BE,$AD,$BD,$AF,$BF
                    db $AC,$BC,$AE,$BE,$AD,$BD,$AF,$BF
                    db $00,$00,$01,$03,$06,$0A,$0F,$14
                    db $1C,$24,$3C,$0E,$0E,$0E,$66,$66
                    db $64,$64,$64,$66,$66

CODE_05CB42:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHY                       ;
                    LDA.w $0B46,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAY                       ;
                    LDA.b $47,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_05CB55         ;
                    LDA.b #$41                ;
CODE_05CB55:        EOR.b #$2B                ;
                    STA.w $0903,y             ;
                    LDA.b $1C,x               ;
                    CMP.b #$08                ;
                    BEQ   CODE_05CB6F         ;
                    LDA.w $0EA2,x             ;
                    CMP.b #$0A                ;
                    BCS   CODE_05CB6F         ;
                    LDA.w $0903,y             ;
                    EOR.b #$20                ;
                    STA.w $0903,y             ;
CODE_05CB6F:        LDA.w $0F4F,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$0F                ;
                    STA.b $E4                 ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_05CB84         ;
                    LDA.b $E4                 ;
                    CMP.b #$09                ;
                    BCC   CODE_05CB87         ;
CODE_05CB84:        STZ.w $0F4F,x             ;
CODE_05CB87:        LDA.b $0F                 ;
                    CMP.b #$09                ;
                    BCS   CODE_05CB95         ;
                    LDA.w $0E67               ;
                    BNE   CODE_05CB95         ;
                    INC.w $0F4F,x             ;
CODE_05CB95:        LDX.b $E4                 ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0901,y             ;
                    LDA.w $CB38,x             ;
                    STA.w $0902,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    LDX.b $9E                 ;
                    LDA.w $021A,x             ;
                    STA.b $E4                 ;
                    LDA.b $79,x               ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b $E5                 ;
                    BEQ   CODE_05CBD0         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
CODE_05CBD0:        LDA.w $03B9               ;
                    CMP.b #$E0                ;
                    BCS   CODE_05CBDD         ;
                    LDA.b $BC,x               ;
                    CMP.b #$01                ;
                    BEQ   CODE_05CBE2         ;
CODE_05CBDD:        LDA.b #$F0                ;
                    STA.w $0901,y             ;
CODE_05CBE2:        PLY                       ;
                    PLB                       ;
                    RTL                       ;

CODE_05CBE5:        LDA.w $03FA               ;
                    BEQ   CODE_05CC16         ;
                    LDA.w $0219               ;
                    STA.b $E4                 ;
                    LDA.w $78               ;
                    STA.b $E5                 ;
                    STZ.w $02FE               ;
                    REP   #$20                ;
                    LDA.w $02FD               ;
                    CLC                       ;
                    ADC.w $03CC               ;
                    CMP.b $E4                 ;
                    BCC   CODE_05CC09         ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    RTL                       ;

CODE_05CC09:        SEP   #$20                ;
                    STZ.w $03FA               ;
                    LDA.b #$34                ;
                    STA.w $02F7               ;
                    STA.w $03CF               ;
CODE_05CC16:        LDA.w $03CF               ;
                    BEQ   CODE_05CC46         ;
                    CMP.b #$28                ;
                    BCC   CODE_05CC23         ;
                    LDA.b #$F8                ;
                    BRA   CODE_05CC25         ;

CODE_05CC23:        LDA.b #$F0                ;
CODE_05CC25:        STA.w $03CE               ;
                    LDA.w $0754               ;
                    BEQ   CODE_05CC36         ;
                    LDA.w $03CE               ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $03CE               ;
CODE_05CC36:        DEC.w $03CF               ;
                    LDA.w $03CF               ;
                    BNE   CODE_05CC3E         ;
CODE_05CC3E:        STZ.b $5D                 ;
                    STZ.w $0705               ;
                    LDA.b #$00                ;
                    RTL                       ;

CODE_05CC46:        LDA.b #$01                ;
                    STA.w $0723               ;
                    STA.w $0254               ;
                    JSR.w CODE_05CC6C         ;
                    STZ.w $03CE               ;
                    LDA.w $03FB               ;
                    BEQ   CODE_05CC5F         ;
                    DEC.w $03FB               ;
                    LDA.b #$01                ;
                    RTL                       ;

CODE_05CC5F:        LDA.w $0746               ;
                    CMP.b #$01                ;
                    BCS   CODE_05CC69         ;
                    INC.w $0746               ;
CODE_05CC69:        LDA.b #$00                ;
                    RTL                       ;

CODE_05CC6C:        LDX.b #$00                ;
                    REP   #$20                ;
CODE_05CC70:        LDA.w $11E0,x             ;
                    STA.b $E4                 ;
                    AND.w #$7C00              ;
                    BEQ   CODE_05CC82         ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.w #$0400              ;
                    STA.b $E4                 ;
CODE_05CC82:        LDA.b $E4                 ;
                    AND.w #$03E0              ;
                    BEQ   CODE_05CC91         ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.w #$0020              ;
                    STA.b $E4                 ;
CODE_05CC91:        LDA.b $E4                 ;
                    AND.w #$001F              ;
                    BEQ   CODE_05CC9A         ;
                    DEC.b $E4                 ;
CODE_05CC9A:        LDA.b $E4                 ;
                    STA.w $11E0,x             ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$20                ;
                    BNE   CODE_05CC70         ;
                    SEP   #$20                ;
                    INC.w $1200               ;
                    RTS                       ;

                    db $90,$80,$70,$90

                    db $FF,$01

CODE_05CCB1:        PHX                       ;
                    PHY                       ;
                    LDY.w $0368               ;
                    LDX.w $0F4E               ;
                    LDA.w $021A,y             ;
                    SEC                       ;
                    SBC.b #$0E                ;
                    STA.w $021A,x             ;
                    LDA.w $79,y             ;
                    STA.b $79,x               ;
                    LDA.w $0238,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    STA.w $041D,x             ;
                    TAY                       ;
                    LDA.w $CCAB,y             ;
                    LDY.b #$00                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_05CCE4         ;
                    INY                       ;
CODE_05CCE4:        LDA.w $CCAF,y             ;
                    STA.w $043D,x             ;
                    STZ.w $06CB               ;
                    LDA.b #$08                ;
                    STA.w $0490,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.w $0402,x             ;
                    STA.b $29,x               ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_05CD01:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.w $0B46,x             ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b #$21                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    LDA.w $0F58,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BNE   CODE_05CD51         ;
                    STZ.w $0F36,x             ;
                    LDA.b #$01                ;
                    STA.w $0F36,x             ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0F62,x             ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.w $0F6B,x             ;
                    LDA.w $03B9               ;
                    STA.w $0F74,x             ;
                    LDA.b #$00                ;
                    STA.w $0F58,x             ;
CODE_05CD51:        TAX                       ;
                    LDA.w $CDE2,x             ;
                    STA.w $0902,y             ;
                    INC   A                   ;
                    STA.w $0906,y             ;
                    STX.b $E4                 ;
                    LDX.b $9E                 ;
                    LDA.w $021A,x             ;
                    STA.b $E5                 ;
                    LDA.b $79,x               ;
                    STA.b $E6                 ;
                    REP   #$20                ;
                    LDA.b $E5                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E5                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $E7                 ;
                    SEP   #$20                ;
                    LDA.b #$02                ;
                    STA.b $E9                 ;
                    LDA.b $E6                 ;
                    BEQ   CODE_05CD84         ;
                    LDA.b #$01                ;
CODE_05CD84:        ORA.b $E9                 ;
                    STA.w $0D00,y             ;
                    LDA.b $E8                 ;
                    BEQ   CODE_05CD8F         ;
                    LDA.b #$01                ;
CODE_05CD8F:        ORA.b $E9                 ;
                    STA.w $0D04,y             ;
                    LDA.w $0F36,x             ;
                    BEQ   CODE_05CDDB         ;
                    LDA.w $0F62,x             ;
                    STA.b $E5                 ;
                    LDA.w $0F6B,x             ;
                    STA.b $E6                 ;
                    REP   #$20                ;
                    LDA.b $E5                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E5                 ;
                    SEP   #$20                ;
                    LDA.b $E5                 ;
                    STA.w $0908,y             ;
                    LDA.w $0F58,x             ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    CLC                       ;
                    ADC.w $0F74,x             ;
                    STA.w $0909,y             ;
                    LDX.b $E4                 ;
                    LDA.w $CDE5,x             ;
                    STA.w $090A,y             ;
                    LDA.b #$28                ;
                    STA.w $090B,y             ;
                    STZ.b $E9                 ;
                    LDA.b $E6                 ;
                    BEQ   CODE_05CDD6         ;
                    LDA.b #$01                ;
CODE_05CDD6:        ORA.b $E9                 ;
                    STA.w $0D08,y             ;
CODE_05CDDB:        LDX.b $9E                 ;
                    INC.w $0F58,x             ;
                    PLB                       ;
                    RTL                       ;

                    db $86,$A6,$89,$30

                    db $31,$32,$06,$0A,$0E

CODE_05CDEB:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.b #$04                ;
                    STY.w $02FF               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.b $E4                 ;
                    LDX.b #$00                ;
CODE_05CDFD:        LDA.w $CF1B,x             ;
                    CLC                       ;
                    ADC.b $E4                 ;
                    STA.w $0800,y             ;
                    LDA.w $03B9               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $0801,y             ;
                    PHX                       ;
                    LDA.b $09                 ;
                    AND.b #$18                ;
                    STX.b $E5                 ;
                    CLC                       ;
                    ADC.b $E5                 ;
                    TAX                       ;
                    LDA.w $CEFB,x             ;
                    STA.w $0803,y             ;
                    LDA.w $CEDB,x             ;
                    STA.w $0802,y             ;
                    PLX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    CPX.b #$05                ;
                    BNE   CODE_05CDFD         ;
                    LDX.b $9E                 ;
                    LDA.w $021A,x             ;
                    STA.b $E5                 ;
                    LDA.b $79,x               ;
                    STA.b $E6                 ;
                    REP   #$20                ;
                    LDA.b $E5                 ;
                    SEC                       ;
                    SBC.w #$0008              ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E9                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E8                 ;
                    CLC                       ;
                    ADC.w #$0004              ;
                    STA.b $DF                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $DD                 ;
                    CLC                       ;
                    ADC.w #$0004              ;
                    STA.b $E7                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E6                 ;
                    SEC                       ;
                    SBC.w #$0010              ;
                    STA.b $E5                 ;
                    SEP   #$20                ;
                    LDA.b #$02                ;
                    STA.b $E4                 ;
                    LDY.b #$04                ;
                    LDX.b #$05                ;
CODE_05CE76:        LDA.b $E5,x               ;
                    BEQ   CODE_05CE7C         ;
                    LDA.b #$01                ;
CODE_05CE7C:        ORA.b $E4                 ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_05CE76         ;
                    STZ.b $E4                 ;
                    LDA.w $06CC               ;
                    BNE   CODE_05CEA6         ;
                    LDA.b #$F0                ;
                    STA.w $0815               ;
                    LDA.b $DE                 ;
                    BEQ   CODE_05CE9A         ;
                    LDA.b #$01                ;
CODE_05CE9A:        ORA.b $E4                 ;
                    STA.w $0C00               ;
                    LDA.b $DD                 ;
                    STA.w $0800               ;
                    BRA   CODE_05CEBE         ;

CODE_05CEA6:        LDA.b #$F0                ;
                    STA.w $080D               ;
                    STA.w $0811               ;
                    LDA.b $E0                 ;
                    BEQ   CODE_05CEB4         ;
                    LDA.b #$01                ;
CODE_05CEB4:        ORA.b $E4                 ;
                    STA.w $0C00               ;
                    LDA.b $DF                 ;
                    STA.w $0800               ;
CODE_05CEBE:        LDA.b $09                 ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.w $03B9               ;
                    STA.w $0801               ;
                    LDA.b #$E7                ;
                    STA.w $0802               ;
                    LDA.b #$2C                ;
                    STA.w $0803               ;
                    LDX.b $9E                 ;
                    PLB                       ;
                    RTL                       ;

                    db $40,$41,$41,$42,$42,$00,$00,$00
                    db $60,$61,$61,$62,$62,$00,$00,$00
                    db $42,$41,$41,$40,$40,$00,$00,$00
                    db $62,$61,$61,$60,$60,$00,$00,$00
                    db $2A,$6A,$6A,$2A,$2A,$00,$00,$00
                    db $2A,$6A,$6A,$2A,$2A,$00,$00,$00
                    db $6A,$2A,$2A,$6A,$6A,$00,$00,$00
                    db $6A,$2A,$2A,$6A,$6A,$00,$00,$00
                    db $00,$10,$20,$30,$20,$C0,$E0,$C4
                    db $C2,$E2,$C5,$C6,$E6,$D4,$C8,$E8
                    db $D5,$CA,$EA,$E4,$C8,$EC,$E5,$CC
                    db $E0,$F4,$CE,$E2,$F5,$C0,$E0,$C4
                    db $EE,$E2,$C5,$CC,$E0,$94,$A4,$E2
                    db $95,$80,$A0,$84,$82,$A2,$85,$C2
                    db $E2,$C5,$C0,$E0,$C4,$C8,$E8,$D5
                    db $C6,$E6,$D4,$C8,$EC,$E5,$CA,$EA
                    db $E4,$CE,$E2,$F5,$CC,$E0,$F4,$EE
                    db $E2,$C5,$C0,$E0,$C4,$A4,$E2,$95
                    db $CC,$E0,$94,$82,$A2,$85,$80,$A0
                    db $84,$00,$01,$01,$00,$02,$02,$03
                    db $04,$05,$06,$08,$09,$EE,$EE,$EE
                    db $00,$F6,$F6,$F6,$00,$EC,$EC,$EC
                    db $00,$00,$00,$00,$E8,$E8,$E8,$00
                    db $F2,$F2,$F2,$00,$FA,$FA,$FA,$EA
                    db $EA,$EA,$00,$E5,$E5,$E5,$00,$E4
                    db $E4,$E4,$00,$00,$00,$00,$E8,$E8
                    db $E8,$00,$ED,$ED,$ED,$00,$E5,$E5
                    db $E5,$A9,$B9,$E8,$00,$A9,$B9,$E8
                    db $00,$A9,$B9,$E8,$00,$00,$00,$00
                    db $A9,$B9,$E8,$00,$A9,$B9,$E8,$00
                    db $A9,$B9,$E8,$27,$27,$26,$27,$27
                    db $27,$26,$27,$27,$27,$26,$27,$27
                    db $27,$27,$27,$27,$26,$27,$27,$27
                    db $26,$27,$27,$27,$26

CODE_05CFE8:        PHX                       ;
                    INC.w $03CA               ;
                    LDA.w $03CA               ;
                    CMP.b #$34                ;
                    BCS   CODE_05D050         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $CF80,x             ;
                    CLC                       ;
                    ADC.w $03AE               ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.w $08F8               ;
                    LDA.w $CF8D,x             ;
                    CLC                       ;
                    ADC.w $03AE               ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.w $08FC               ;
                    LDA.w $CF9A,x             ;
                    BNE   CODE_05D019         ;
                    LDA.b #$F0                ;
                    BRA   CODE_05D020         ;

CODE_05D019:        CLC                       ;
                    ADC.w $03B9               ;
                    CLC                       ;
                    ADC.b #$10                ;
CODE_05D020:        STA.w $08F9               ;
                    LDA.w $CFA7,x             ;
                    BNE   CODE_05D02C         ;
                    LDA.b #$F0                ;
                    BRA   CODE_05D033         ;

CODE_05D02C:        CLC                       ;
                    ADC.b #$10                ;
                    CLC                       ;
                    ADC.w $03B9               ;
CODE_05D033:        STA.w $08FD               ;
                    LDA.w $CFB4,x             ;
                    STA.w $08FA               ;
                    LDA.w $CFC1,x             ;
                    STA.w $08FE               ;
                    LDA.w $CFCE,x             ;
                    STA.w $08FB               ;
                    LDA.w $CFDB,x             ;
                    STA.w $08FF               ;
                    BRA   CODE_05D053         ;

CODE_05D050:        STZ.w $03CB               ;
CODE_05D053:        PLX                       ;
                    RTS                       ;

CODE_05D055:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $03CB               ;
                    BEQ   CODE_05D060         ;
                    JSR.w CODE_05CFE8         ;
CODE_05D060:        LDA.w $0F4C               ;
                    BEQ   CODE_05D07A         ;
                    LDY.w $014B               ;
                    CPY.b #$08                ;
                    BNE   CODE_05D089         ;
                    LDA.w $0F4C               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$01                ;
                    TAY                       ;
                    LDA.w $CF7E,y             ;
                    TAY                       ;
                    BRA   CODE_05D089         ;

CODE_05D07A:        LDA.w $0792,x             ;
                    BNE   CODE_05D082         ;
                    STZ.w $014B               ;
CODE_05D082:        LDA.w $014B               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
CODE_05D089:        LDA.w $CF74,y             ;
                    STA.w $014C               ;
                    LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $0904,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $090C,y             ;
                    STA.w $0910,y             ;
                    STA.w $0914,y             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    STA.w $090D,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0905,y             ;
                    STA.w $0911,y             ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.w $0909,y             ;
                    STA.w $0915,y             ;
                    LDA.b $47,x               ;
                    STA.b $DE                 ;
                    CMP.b #$01                ;
                    BEQ   CODE_05D0D5         ;
                    LDA.b #$61                ;
                    BRA   CODE_05D0D7         ;

CODE_05D0D5:        LDA.b #$21                ;
CODE_05D0D7:        STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
                    STA.w $0913,y             ;
                    STA.w $0917,y             ;
                    STX.b $9E                 ;
                    LDA.w $014C               ;
                    ASL   A                   ;
                    STA.b $DD                 ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $DD                 ;
                    TAX                       ;
                    CLC                       ;
                    ADC.b #$06                ;
                    STA.b $DD                 ;
                    LDA.b $DE                 ;
                    CMP.b #$01                ;
                    BEQ   CODE_05D10C         ;
                    LDA.b $DD                 ;
                    CLC                       ;
                    ADC.b #$2A                ;
                    STA.b $DD                 ;
                    SEC                       ;
                    SBC.b #$06                ;
                    TAX                       ;
CODE_05D10C:        LDA.w $CF20,x             ;
                    STA.w $0902,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    CPX.b $DD                 ;
                    BNE   CODE_05D10C         ;
                    LDA.b #$00                ;
                    STA.w $0CFC,y             ;
                    STA.w $0CF0,y             ;
                    LDX.b $9E                 ;
                    LDA.w $021A,x             ;
                    STA.b $E4                 ;
                    LDA.b $79,x               ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E4                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $E6                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $E8                 ;
                    SEP   #$20                ;
                    LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.b $E5                 ;
                    BEQ   CODE_05D15A         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
CODE_05D15A:        LDA.b $E7                 ;
                    BEQ   CODE_05D163         ;
                    LDA.b #$01                ;
                    STA.w $0D08,y             ;
CODE_05D163:        LDA.b $E9                 ;
                    BEQ   CODE_05D172         ;
                    LDA.b #$01                ;
                    STA.w $0D0C,y             ;
                    STA.w $0D10,y             ;
                    STA.w $0D14,y             ;
CODE_05D172:        LDA.w $0F4C               ;
                    BNE   CODE_05D189         ;
                    STZ.w $0F4C               ;
                    INC.w $014B               ;
                    LDA.w $014B               ;
                    CMP.b #$30                ;
                    BCC   CODE_05D1AD         ;
                    STZ.w $014B               ;
                    BRA   CODE_05D1AD         ;

CODE_05D189:        DEC.w $0F4C               ;
                    LDA.w $0F4C               ;
                    BNE   CODE_05D1AD         ;
                    LDA.w $014B               ;
                    CMP.b #$06                ;
                    BNE   CODE_05D1AA         ;
                    INC.w $014B               ;
                    LDA.b #$28                ;
                    STA.w $0F4C               ;
                    LDA.b #$3A                ;
                    STA.w $1600               ;
                    JSR.w CODE_05CCB1         ;
                    BRA   CODE_05D1AD         ;

CODE_05D1AA:        STZ.w $014B               ;
CODE_05D1AD:        LDA.w $0283               ;
                    BNE   CODE_05D1F1         ;
                    LDX.b $9E                 ;
                    LDY.w $0B46,x             ;
                    LDX.b #$06                ;
CODE_05D1B9:        LDA.w $0903,y             ;
                    ORA.b #$80                ;
                    STA.w $0903,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_05D1B9         ;
                    LDX.b $9E                 ;
                    LDY.w $0B46,x             ;
                    LDA.w $0901,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0901,y             ;
                    STA.w $090D,y             ;
                    LDA.w $0905,y             ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.w $0905,y             ;
                    STA.w $0911,y             ;
                    LDA.w $0909,y             ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.w $0909,y             ;
                    STA.w $0915,y             ;
CODE_05D1F1:        JSR.w CODE_05C9D3         ;
                    PLB                       ;
                    RTL                       ;

                    PHA                       ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $07B2               ;
                    BEQ   CODE_05D26F         ;
                    LDA.w $0FF4               ;
                    STA.b $E4                 ;
                    AND.b #$C0                ;
                    BEQ   CODE_05D26F         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_05D26F         ;
                    LDA.b $E4                 ;
                    CMP.b #$40                ;
                    BNE   CODE_05D226         ;
                    LDA.b #$17                ;
                    STA.w $07B2               ;
                    INC.w $075F               ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   CODE_05D226         ;
                    STZ.w $075F               ;
CODE_05D226:        LDA.b $E4                 ;
                    CMP.b #$80                ;
                    BNE   CODE_05D23E         ;
                    LDA.b #$17                ;
                    STA.w $07B2               ;
                    INC.w $075C               ;
                    LDA.w $075C               ;
                    CMP.b #$04                ;
                    BCC   CODE_05D23E         ;
                    STZ.w $075C               ;
CODE_05D23E:        LDX.b #$00                ;
CODE_05D240:        LDA.w $D2A6,x             ;
                    STA.l $001702,x           ;
                    INX                       ;
                    CPX.b #$0B                ;
                    BCC   CODE_05D240         ;
                    LDA.w $075F               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.l $001706             ;
                    LDA.w $075C               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.l $00170A             ;
                    LDA.w $075F               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.w $075C               ;
                    TAX                       ;
                    LDA.w $D272,x             ;
                    STA.w $0760               ;
CODE_05D26F:        PLB                       ;
                    PLA                       ;
                    RTL                       ;

DATA_05D272:        db $00,$02,$03,$04
					db $00,$02,$03,$04
                    db $00,$01,$02,$03
					db $00,$02,$03,$04
                    db $00,$01,$02,$03
					db $00,$01,$02,$03
                    db $00,$02,$03,$04
					db $00,$01,$02,$03
                    db $00,$01,$02,$03
					db $00,$02,$03,$04
                    db $00,$02,$03,$04
					db $00,$01,$02,$03
                    db $00,$01,$02,$03

					db $58,$73,$00,$05,$24,$20,$24,$20,$24,$20,$FF

CODE_05D2B1:        PHY                       ;
                    LDY.b #$00                ;
CODE_05D2B4:        LDA.w $0B25,y             ;
                    BEQ   CODE_05D2C0         ;
                    INY                       ;
                    CPY.b #$05                ;
                    BNE   CODE_05D2B4         ;
                    LDY.b #$00                ;
CODE_05D2C0:        LDA.b #$01                ;
                    STA.w $0B25,y             ;
                    LDA.b $5E,x               ;
                    BPL   CODE_05D2E0         ;
                    LDA.b $79,x               ;
                    XBA                       ;
                    LDA.w $021A,x             ;
                    REP   #$20                ;
                    SEC                       ;
                    SBC.w #$0008              ;
                    SEP   #$20                ;
                    STA.w $0B2F,y             ;
                    XBA                       ;
                    STA.w $0B2A,y             ;
                    BRA   CODE_05D2F5         ;

CODE_05D2E0:        LDA.b $79,x               ;
                    XBA                       ;
                    LDA.w $021A,x             ;
                    REP   #$20                ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEP   #$20                ;
                    STA.w $0B2F,y             ;
                    XBA                       ;
                    STA.w $0B2A,y             ;
CODE_05D2F5:        LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$0C                ;
                    STA.w $0B34,y             ;
                    PLY                       ;
                    RTL                       ;

CODE_05D300:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDX.b #$00                ;
CODE_05D307:        LDA.w $D46D,x             ;
                    TAY                       ;
                    LDA.w $0B25,x             ;
                    BEQ   CODE_05D330         ;
                    AND.b #$0C                ;
                    STA.b $E4                 ;
                    BNE   CODE_05D31B         ;
                    JSR.w CODE_05D339         ;
                    BRA   CODE_05D330         ;

CODE_05D31B:        CMP.b #$04                ;
                    BNE   CODE_05D324         ;
                    JSR.w CODE_05D374         ;
                    BRA   CODE_05D330         ;

CODE_05D324:        CMP.b #$08                ;
                    BNE   CODE_05D32D         ;
                    JSR.w CODE_05D3B4         ;
                    BRA   CODE_05D330         ;

CODE_05D32D:        STZ.w $0B25,x             ;
CODE_05D330:        INX                       ;
                    CPX.b #$05                ;
                    BNE   CODE_05D307         ;
                    PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_05D339:        JSR.w CODE_05D458         ;
                    LDA.w $0B3B               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0801,y             ;
                    LDA.b #$26                ;
                    STA.w $0802,y             ;
                    LDA.b #$25                ;
                    STA.w $0803,y             ;
                    REP   #$20                ;
                    LDA.w $0B39               ;
                    CLC                       ;
                    ADC.w #$0004              ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0B39               ;
                    SEP   #$20                ;
                    LDA.w $0B39               ;
                    STA.w $0800,y             ;
                    LDA.w $0B3A               ;
                    BEQ   CODE_05D36D         ;
                    LDA.b #$01                ;
CODE_05D36D:        STA.w $0C00,y             ;
                    INC.w $0B25,x             ;
                    RTS                       ;

CODE_05D374:        JSR.w CODE_05D458         ;
                    LDA.w $0B3B               ;
                    STA.w $0801,y             ;
                    LDA.b #$60                ;
                    STA.w $0802,y             ;
                    LDA.b #$25                ;
                    STA.w $0803,y             ;
                    REP   #$20                ;
                    LDA.w $0B39               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0B39               ;
                    SEP   #$20                ;
                    LDA.w $0B39               ;
                    STA.w $0800,y             ;
                    LDA.w $0B3A               ;
                    BEQ   CODE_05D3A3         ;
                    LDA.b #$03                ;
                    BRA   CODE_05D3A5         ;

CODE_05D3A3:        LDA.b #$02                ;
CODE_05D3A5:        STA.w $0C00,y             ;
                    INC.w $0B25,x             ;
                    RTS                       ;

                    db $FF,$FE,$FC,$F9,$01,$02,$04,$07

CODE_05D3B4:        STX.b $F1                 ;
                    JSR.w CODE_05D458         ;
                    LDA.w $0B25,x             ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.w $0B3B               ;
                    CLC                       ;
                    ADC.w $D3AC,x             ;
                    STA.w $0801,y             ;
                    STA.w $0805,y             ;
                    LDA.w $0B3B               ;
                    CLC                       ;
                    ADC.w $D3B0,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0809,y             ;
                    STA.w $080D,y             ;
                    LDA.b #$39                ;
                    STA.w $0802,y             ;
                    STA.w $0806,y             ;
                    STA.w $080A,y             ;
                    STA.w $080E,y             ;
                    LDA.b #$25                ;
                    STA.w $0803,y             ;
                    STA.w $0807,y             ;
                    STA.w $080B,y             ;
                    STA.w $080F,y             ;
                    LDA.w $D3AC,x             ;
                    STA.b $EF                 ;
                    LDA.b #$FF                ;
                    STA.b $F0                 ;
                    REP   #$20                ;
                    LDA.w $0B39               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    CLC                       ;
                    ADC.b $EF                 ;
                    STA.b $ED                 ;
                    SEP   #$20                ;
                    LDA.b $ED                 ;
                    STA.w $0800,y             ;
                    STA.w $0808,y             ;
                    LDA.b $EE                 ;
                    BEQ   CODE_05D41E         ;
                    LDA.b #$01                ;
CODE_05D41E:        STA.w $0C00,y             ;
                    STA.w $0C08,y             ;
                    LDA.w $D3B0,x             ;
                    STA.b $EF                 ;
                    STZ.b $F0                 ;
                    REP   #$20                ;
                    LDA.w $0B39               ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEC                       ;
                    SBC.b $42                 ;
                    CLC                       ;
                    ADC.b $EF                 ;
                    STA.b $ED                 ;
                    SEP   #$20                ;
                    LDA.b $ED                 ;
                    STA.w $0804,y             ;
                    STA.w $080C,y             ;
                    LDA.b $EE                 ;
                    BEQ   CODE_05D44C         ;
                    LDA.b #$01                ;
CODE_05D44C:        STA.w $0C04,y             ;
                    STA.w $0C0C,y             ;
                    LDX.b $F1                 ;
                    INC.w $0B25,x             ;
                    RTS                       ;

CODE_05D458:        LDA.w $0B34,x             ;
                    STA.w $0B3B               ;
                    LDA.w $0B2A,x             ;
                    XBA                       ;
                    LDA.w $0B2F,x             ;
                    REP   #$20                ;
                    STA.w $0B39               ;
                    SEP   #$20                ;
                    RTS                       ;

                    db $00,$10,$20,$40,$50

CODE_05D472:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $0201               ;
                    CMP.b #$01                ;
                    BEQ   CODE_05D4EE         ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BEQ   CODE_05D4EE         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_05D4EE         ;
                    LDA.b $96                 ;
                    BNE   CODE_05D4EB         ;
                    LDA.w $02FC               ;
                    BEQ   CODE_05D4EE         ;
                    LDX.b #$08                ;
CODE_05D494:        LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BEQ   CODE_05D49F         ;
CODE_05D49A:        DEX                       ;
                    BPL   CODE_05D494         ;
                    BRA   CODE_05D4C2         ;

CODE_05D49F:        LDA.w $0238,x             ;
                    CMP.b #$B8                ;
                    BCC   CODE_05D4EE         ;
                    LDA.b $10,x               ;
                    AND.b #$80                ;
                    BNE   CODE_05D49A         ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $02FA               ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.w $02FB               ;
                    LDA.b #$08                ;
                    STA.b $96                 ;
                    BRA   CODE_05D4E1         ;

CODE_05D4C2:        LDX.w $02FC               ;
                    DEX                       ;
                    LDA.w $0238,x             ;
                    CMP.b #$B8                ;
                    BCC   CODE_05D4EE         ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $02FA               ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.w $02FB               ;
                    LDA.b #$04                ;
                    STA.b $96                 ;
CODE_05D4E1:        LDA.b #$25                ;
                    STA.w $1600               ;
                    LDA.b #$20                ;
                    STA.w $1603               ;
CODE_05D4EB:        JSR.w CODE_05D4F2         ;
CODE_05D4EE:        JMP.w CODE_05E3BF         ;

                    RTL                       ;

CODE_05D4F2:        LDA.b $96                 ;
                    STA.b $E4                 ;
                    INC.w $02F9               ;
                    LDA.w $02F9               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$06                ;
                    BCS   CODE_05D55D         ;
                    STA.b $DD                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.b #$20                ;
                    STZ.b $E9                 ;
CODE_05D50C:        TXA                       ;
                    AND.b #$01                ;
                    CLC                       ;
                    ADC.b #$FF                ;
                    STA.b $E8                 ;
                    LDA.w $D563,x             ;
                    STA.b $E7                 ;
                    REP   #$20                ;
                    LDA.b $E7                 ;
                    CLC                       ;
                    ADC.w $02FA               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E7                 ;
                    SEP   #$20                ;
                    LDA.b $E7                 ;
                    STA.w $0800,y             ;
                    LDA.b $E8                 ;
                    BEQ   CODE_05D533         ;
                    LDA.b #$00                ;
CODE_05D533:        ORA.b $E9                 ;
                    STA.w $0C00,y             ;
                    LDA.w $D58B,x             ;
                    CLC                       ;
                    ADC.b #$D8                ;
                    STA.w $0801,y             ;
                    PHX                       ;
                    LDX.b $DD                 ;
                    LDA.w $D5BC,x             ;
                    STA.w $0802,y             ;
                    LDX.b $E4                 ;
                    LDA.w $D5B3,x             ;
                    STA.w $0803,y             ;
                    PLX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $E4                 ;
                    BNE   CODE_05D50C         ;
                    RTS                       ;

CODE_05D55D:        STZ.w $02FC               ;
                    STZ.b $96                 ;
                    RTS                       ;

                    db $F6,$02,$F1,$07,$F2,$06,$ED,$0B
                    db $F3,$05,$EE,$0A,$EF,$09,$EA,$0E
                    db $F1,$07,$EC,$0C,$ED,$0B,$E8,$10
                    db $F0,$08,$EB,$0D,$EC,$0C,$E7,$11
                    db $EF,$09,$EA,$0E,$EB,$0D,$E6,$12
                    db $F5,$F5,$F8,$F8,$F1,$F1,$F4,$F4
                    db $F4,$F4,$F7,$F7,$F0,$F0,$F3,$F3
                    db $F2,$F2,$F5,$F5,$EE,$EE,$F1,$F1
                    db $F1,$F1,$F4,$F4,$ED,$ED,$F0,$F0
                    db $F0,$F0,$F3,$F3,$EC,$EC,$EF,$EF
                    db $28,$68,$28,$68,$28,$68,$28,$68
                    db $28,$33,$33,$34,$35,$36,$37,$F1
                    db $FF,$F6,$FF,$02,$00,$07,$00,$EE
                    db $FF,$F3,$FF,$05,$00,$0A,$00,$EC
                    db $FF,$F1,$FF,$07,$00,$0C,$00,$EB
                    db $FF,$F0,$FF,$08,$00,$0D,$00,$EA
                    db $FF,$EF,$FF,$09,$00,$0E,$00,$EA
                    db $FF,$EF,$FF,$09,$00,$0E,$00,$F8
                    db $F5,$F5,$F8,$F7,$F4,$F4,$F7,$F5
                    db $F2,$F2,$F5,$F4,$F1,$F1,$F4,$F3
                    db $F0,$F0,$F3,$F3,$F0,$F0,$F3,$33
                    db $33,$34,$35,$36,$37,$28,$28,$68
                    db $68

CODE_05D614:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $0B00,x             ;
                    CMP.b #$02                ;
                    BEQ   CODE_05D657         ;
                    LSR   A                   ;
                    BCC   CODE_05D66C         ;
                    LDA.w $0B09,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$06                ;
                    BEQ   CODE_05D659         ;
                    TAY                       ;
                    LDA.w $D60A,y             ;
                    STA.b $ED                 ;
                    LDA.w $021A,x             ;
                    STA.b $00                 ;
                    LDA.b $79,x               ;
                    STA.b $01                 ;
                    REP   #$20                ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $00                 ;
                    SEP   #$20                ;
                    LDA.w $0B46,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.b $F2                 ;
                    JSR.w CODE_05D73C         ;
                    BRA   CODE_05D66C         ;

CODE_05D657:        BRA   CODE_05D69D         ;

CODE_05D659:        INC.w $0B00,x             ;
                    STZ.w $0B09,x             ;
                    LDA.w $0B00,x             ;
                    CMP.b #$02                ;
                    BNE   CODE_05D66C         ;
                    LDA.w $0238,x             ;
                    STA.w $0B12,x             ;
CODE_05D66C:        PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

                    db $FF,$FF,$FA,$FF,$FA,$FF,$FA,$FF
                    db $FF,$FF,$00,$00,$00,$00,$00,$00
                    db $FE,$FF,$FE,$FF,$FF,$00,$00,$00
                    db $FF,$12,$12,$12,$10,$10,$FC,$30
                    db $31,$32,$FC,$30,$31,$32,$FC,$FC
                    db $FF,$FF,$FF,$00,$00

CODE_05D69D:        LDA.w $0B09,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$05                ;
                    BCC   CODE_05D6AF         ;
                    LDA.b #$30                ;
                    STA.w $0B09,x             ;
                    JMP.w CODE_05D739         ;

CODE_05D6AF:        STA.b $EB                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $021A,x             ;
                    STA.b $00                 ;
                    LDA.b $79,x               ;
                    STA.b $01                 ;
                    REP   #$20                ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEC                       ;
                    SBC.b $42                 ;
                    PHA                       ;
                    CLC                       ;
                    ADC.w $D670,y             ;
                    STA.b $00                 ;
                    PLA                       ;
                    CLC                       ;
                    ADC.w $D67A,y             ;
                    STA.b $02                 ;
                    SEP   #$20                ;
                    LDY.b $EB                 ;
                    LDA.w $D698,y             ;
                    CLC                       ;
                    ADC.w $0B12,x             ;
                    STA.w $0B12,x             ;
                    LDA.w $D684,y             ;
                    CLC                       ;
                    ADC.w $0B12,x             ;
                    STA.b $04                 ;
                    LDA.w $D689,y             ;
                    CLC                       ;
                    ADC.w $0B12,x             ;
                    STA.b $ED                 ;
                    LDA.w $0B46,x             ;
                    TAY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    LDX.b $EB                 ;
                    LDA.b $00                 ;
                    STA.w $0900,y             ;
                    LDA.b $02                 ;
                    STA.w $0904,y             ;
                    LDA.b $04                 ;
                    STA.w $0901,y             ;
                    LDA.b $ED                 ;
                    STA.w $0905,y             ;
                    LDA.w $D68E,x             ;
                    STA.w $0902,y             ;
                    LDA.w $D693,x             ;
                    STA.w $0906,y             ;
                    LDA.b #$28                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    LDA.b $01                 ;
                    BEQ   CODE_05D730         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
CODE_05D730:        LDA.b $03                 ;
                    BEQ   CODE_05D739         ;
                    LDA.b #$01                ;
                    STA.w $0D04,y             ;
CODE_05D739:        JMP.w CODE_05D66C         ;

CODE_05D73C:        STY.b $EC                 ;
                    LDX.b #$00                ;
CODE_05D740:        LDA.b $EC                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $EB                 ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b $EB                 ;
                    TAY                       ;
                    LDA.b #$D8                ;
                    CLC                       ;
                    ADC.w $D5F2,y             ;
                    STA.b $EE                 ;
                    LDA.w $D610,x             ;
                    STA.b $EF                 ;
                    TYA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    REP   #$20                ;
                    LDA.w $D5C2,y             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $F0                 ;
                    SEP   #$20                ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $F2                 ;
                    TAY                       ;
                    LDA.b $F0                 ;
                    STA.w $0900,y             ;
                    LDA.b $EE                 ;
                    STA.w $0901,y             ;
                    LDA.b $ED                 ;
                    STA.w $0902,y             ;
                    LDA.b $EF                 ;
                    STA.w $0903,y             ;
                    LDA.b $F1                 ;
                    BEQ   CODE_05D78B         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
CODE_05D78B:        INX                       ;
                    CPX.b #$04                ;
                    BNE   CODE_05D740         ;
                    RTS                       ;

                    db $1C,$0E,$06,$08,$18,$16,$1A,$14
                    db $D0,$E0,$E1,$FC,$00,$FC,$F8,$F4

CODE_05D7A1:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $0E40               ;
                    BNE   CODE_05D7AE         ;
                    JSR.w CODE_05D7C2         ;
CODE_05D7AE:        JSR.w CODE_05D7D1         ;
                    LDA.w $0E42               ;
                    AND.b #$20                ;
                    BEQ   CODE_05D7BE         ;
                    STZ.w $0E40               ;
                    STZ.w $0E41               ;
CODE_05D7BE:        PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_05D7C2:        LDX.b #$03                ;
CODE_05D7C4:        LDA.w $D79D,x             ;
                    STA.w $0E42,x             ;
                    DEX                       ;
                    BPL   CODE_05D7C4         ;
                    INC.w $0E40               ;
                    RTS                       ;

CODE_05D7D1:        LDX.b #$03                ;
                    LDY.b #$30                ;
CODE_05D7D5:        LDA.w $0E42,x             ;
                    BMI   CODE_05D805         ;
                    BNE   CODE_05D7DF         ;
                    JSR.w CODE_05D815         ;
CODE_05D7DF:        LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BCS   CODE_05D805         ;
                    PHX                       ;
                    TAX                       ;
                    LDA.w $D799,x             ;
                    STA.w $0802,y             ;
                    LDA.b #$38                ;
                    STA.w $0803,y             ;
                    PLX                       ;
                    LDA.w $0E46,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.w $0800,y             ;
                    LDA.w $0E4A,x             ;
                    STA.w $0801,y             ;
                    BRA   CODE_05D80A         ;

CODE_05D805:        LDA.b #$F0                ;
                    STA.w $0801,y             ;
CODE_05D80A:        INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INC.w $0E42,x             ;
                    DEX                       ;
                    BPL   CODE_05D7D5         ;
                    RTS                       ;

CODE_05D815:        LDA.w $0202               ;
                    LSR   A                   ;
                    BCC   CODE_05D823         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$06                ;
                    BRA   CODE_05D829         ;

CODE_05D823:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$02                ;
CODE_05D829:        STA.w $0E46,x             ;
                    LDA.w $06D5               ;
                    CMP.b #$18                ;
                    BEQ   CODE_05D837         ;
                    CMP.b #$78                ;
                    BNE   CODE_05D84A         ;
CODE_05D837:        LDA.w $07B8               ;
                    AND.b #$04                ;
                    SEC                       ;
                    SBC.b #$02                ;
                    CLC                       ;
                    ADC.w $03B8               ;
                    ADC.w $D795               ;
                    STA.w $0E4A,x             ;
                    RTS                       ;

CODE_05D84A:        LDA.b #$F8                ;
                    STA.w $0E4A,x             ;
                    RTS                       ;

                    db $00,$A5,$40,$28,$C4,$39,$00,$D0
                    db $40,$12,$C8,$39,$00,$F0,$40,$12
                    db $C8,$39,$01,$10,$40,$12,$C8,$39
                    db $01,$30,$40,$12,$C8,$39,$00,$C5
                    db $C0,$10,$C5,$39,$01,$59,$C0,$06
                    db $C8,$39,$00,$DA,$C0,$10,$C6,$39
                    db $00,$A5,$00,$01,$C0,$39,$00,$BA
                    db $00,$01,$C1,$39,$01,$E5,$00,$01
                    db $C2,$39,$01,$FA,$00,$01,$C3,$39
                    db $00,$C6,$00,$13,$C9,$39,$CA,$39
                    db $D1,$39,$D1,$39,$D5,$39,$C9,$79
                    db $C9,$39,$F5,$39,$D5,$39,$C9,$79
                    db $00,$E6,$00,$13,$CB,$39,$CC,$39
                    db $D2,$39,$D2,$39,$D2,$39,$D6,$39
                    db $DA,$39,$DC,$39,$D2,$39,$DE,$39
                    db $01,$06,$00,$13,$CD,$39,$CE,$39
                    db $D3,$39,$D4,$39,$D7,$39,$D8,$39
                    db $D3,$39,$DB,$39,$D7,$39,$DF,$39
                    db $01,$26,$00,$13,$CF,$39,$D0,$39
                    db $CF,$39,$D0,$39,$D9,$39,$C8,$39
                    db $CF,$39,$DD,$39,$D9,$39,$DD,$39
                    db $01,$38,$00,$03,$5F,$38,$7A,$38
                    db $01,$46,$00,$25,$C9,$39,$E0,$39
                    db $C9,$79,$C9,$39,$C9,$79,$D5,$39
                    db $C9,$79,$D1,$39,$C9,$39,$C9,$79
                    db $C8,$39,$D5,$39,$C9,$79,$D5,$39
                    db $C9,$79,$C9,$39,$C9,$79,$C9,$39
                    db $C9,$79,$01,$66,$00,$25,$E3,$39
                    db $E1,$39,$E1,$39,$E3,$39,$E1,$39
                    db $E3,$39,$F4,$39,$E3,$39,$E3,$39
                    db $F4,$39,$C8,$39,$E3,$39,$F4,$39
                    db $E3,$39,$F4,$19,$E3,$39,$F4,$39
                    db $E3,$39,$EE,$39,$01,$86,$00,$25
                    db $E3,$39,$E3,$39,$E3,$39,$E3,$39
                    db $E3,$39,$E3,$39,$E8,$39,$E3,$39
                    db $E3,$39,$E3,$39,$C8,$39,$E3,$39
                    db $E8,$39,$E3,$39,$E8,$39,$E3,$39
                    db $E3,$39,$EF,$39,$F0,$39,$01,$A6
                    db $00,$25,$D2,$39,$D2,$39,$D2,$39
                    db $E5,$39,$E6,$39,$D2,$39,$F3,$39
                    db $D2,$39,$D2,$39,$D2,$39,$C8,$39
                    db $D2,$39,$F3,$39,$D2,$39,$F3,$39
                    db $D2,$39,$D2,$39,$F1,$39,$F6,$39
                    db $01,$C6,$00,$27,$D7,$39,$D7,$39
                    db $D7,$39,$D7,$39,$E7,$39,$D7,$39
                    db $D7,$39,$D7,$39,$D3,$39,$D4,$39
                    db $C8,$39,$D7,$39,$EC,$39,$D7,$39
                    db $D7,$39,$D3,$39,$D4,$39,$D3,$39
                    db $D4,$39,$F2,$39,$01,$E6,$40,$0E
                    db $E4,$39,$01,$EE,$00,$17,$EA,$39
                    db $EB,$39,$C7,$39,$E4,$39,$ED,$39
                    db $E4,$39,$E4,$39,$EA,$39,$EB,$39
                    db $EA,$39,$EB,$39,$E4,$39,$02,$08
                    db $00,$25,$2F,$06,$01,$04,$09,$04
                    db $08,$04,$05,$04,$24,$04,$01,$04
                    db $09,$04,$09,$04,$03,$04,$24,$04
                    db $17,$04,$12,$04,$17,$04,$1D,$04
                    db $0E,$04,$17,$04,$0D,$04,$18,$04
                    db $02,$4A,$00,$19,$01,$08,$24,$00
                    db $19,$08,$15,$08,$0A,$08,$22,$08
                    db $0E,$08,$1B,$08,$24,$00,$10,$08
                    db $0A,$08,$16,$08,$0E,$08,$02,$8A
                    db $00,$19,$02,$08,$24,$00,$19,$08
                    db $15,$08,$0A,$08,$22,$08,$0E,$08
                    db $1B,$08,$24,$00,$10,$08,$0A,$08
                    db $16,$08,$0E,$08,$02,$EB,$00,$07
                    db $1D,$08,$18,$08,$19,$08,$28,$08
                    db $02,$F5,$00,$01,$00,$08,$FF,$FF
                    db $00,$30

CODE_05DA72:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    STY.b $00                 ;
                    LDA.w $03B9               ;
                    LDX.w $039A,y             ;
                    LDY.w $0B46,x             ;
                    STY.b $02                 ;
                    DEC   A                   ;
                    JSR.w CODE_05DAFF         ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    STA.w $0910,y             ;
                    STA.w $0904,y             ;
                    STA.w $090C,y             ;
                    STA.w $0914,y             ;
                    STA.w $0918,y             ;
                    STA.w $091C,y             ;
                    STA.w $0920,y             ;
                    LDA.b #$1B                ;
                    STA.w $0903,y             ;
                    STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    STA.w $0907,y             ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
                    STA.w $091B,y             ;
                    STA.w $091F,y             ;
                    STA.w $0923,y             ;
                    LDX.b #$08                ;
CODE_05DAC3:        LDA.b #$2C                ;
                    STA.w $0902,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BPL   CODE_05DAC3         ;
                    LDY.b $02                 ;
                    LDA.w $00               ;
                    BNE   CODE_05DADB         ;
                    LDA.b #$2A                ;
                    STA.w $0902,y             ;
CODE_05DADB:        LDA.w $0399               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    INC   A                   ;
                    TAX                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $02                 ;
                    TAY                       ;
CODE_05DAEA:        CPX.b #$09                ;
                    BCS   CODE_05DAFA         ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    BRA   CODE_05DAEA         ;

CODE_05DAFA:        LDY.w $0000               ;
                    PLB                       ;
                    RTL                       ;

CODE_05DAFF:        LDX.b #$09                ;
CODE_05DB01:        STA.w $0901,y             ;
                    PHA                       ;
                    LDA.w $0223               ;
                    STA.b $E4                 ;
                    LDA.b $82                 ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b #$02                ;
                    STA.b $DD                 ;
                    LDA.b $E5                 ;
                    BEQ   CODE_05DB23         ;
                    LDA.b #$01                ;
CODE_05DB23:        ORA.b $DD                 ;
                    STA.w $0D00,y             ;
                    LDA.w $0236               ;
                    BNE   CODE_05DB3B         ;
                    LDA.w $0901,y             ;
                    BPL   CODE_05DB3B         ;
                    CMP.b #$F0                ;
                    BCS   CODE_05DB3B         ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
CODE_05DB3B:        PLA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_05DB01         ;
                    LDY.b $02                 ;
                    RTS                       ;

CODE_05DB49:        LDY.w $0B53               ;
                    REP   #$20                ;
                    LDA.w $0E70               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E6B               ;
                    SEP   #$20                ;
                    LDA.w $0E6F               ;
                    BNE   CODE_05DB89         ;
                    LDA.w $0E6D               ;
                    STA.w $0801,y             ;
                    LDA.w $0E6B               ;
                    JSR.w CODE_05DC6F         ;
                    STA.w $0800,y             ;
                    LDA.b #$26                ;
                    STA.w $0802,y             ;
                    LDA.b #$29                ;
                    STA.w $0803,y             ;
                    DEC.w $0E6E               ;
                    BEQ   CODE_05DB7F         ;
                    JMP.w CODE_05DC03         ;

CODE_05DB7F:        LDA.b #$06                ;
                    STA.w $0E6E               ;
                    INC.w $0E6F               ;
                    BRA   CODE_05DC03         ;

CODE_05DB89:        LDA.w $0E6F               ;
                    CMP.b #$06                ;
                    BCS   CODE_05DC03         ;
                    PHX                       ;
                    LDX.w $0E6F               ;
                    LDA.w $DC35,x             ;
                    CLC                       ;
                    ADC.w $0E6B               ;
                    STA.w $0800,y             ;
                    STA.w $0804,y             ;
                    JSR.w CODE_05DC6F         ;
                    LDA.w $DC41,x             ;
                    CLC                       ;
                    ADC.w $0E6D               ;
                    STA.w $0801,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0805,y             ;
                    LDA.w $DC3B,x             ;
                    CLC                       ;
                    ADC.w $0E6B               ;
                    STA.w $0808,y             ;
                    STA.w $080C,y             ;
                    JSR.w CODE_05DC6F         ;
                    LDA.w $DC41,x             ;
                    CLC                       ;
                    ADC.w $0E6D               ;
                    STA.w $0809,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $080D,y             ;
                    LDX.w $0E6F               ;
                    DEX                       ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b #$03                ;
                    STA.b $04                 ;
CODE_05DBE0:        LDA.w $DC47,x             ;
                    STA.w $0802,y             ;
                    LDA.w $DC5B,x             ;
                    STA.w $0803,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $04                 ;
                    BPL   CODE_05DBE0         ;
                    DEC.w $0E6E               ;
                    BNE   CODE_05DC02         ;
                    LDA.b #$06                ;
                    STA.w $0E6E               ;
                    INC.w $0E6F               ;
CODE_05DC02:        PLX                       ;
CODE_05DC03:        JMP.w CODE_05DCE9         ;

CODE_05DC06:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_05DC0E         ;
                    DEC.w $0248,x             ;
CODE_05DC0E:        LDA.w $0248,x             ;
                    STA.w $0801,y             ;
                    LDA.w $03B3               ;
                    STA.w $0800,y             ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    CMP.b #$F8                ;
                    BCC   CODE_05DC28         ;
                    LDA.b #$03                ;
                    STA.w $0C00,y             ;
CODE_05DC28:        LDA.b #$23                ;
                    STA.w $0803,y             ;
                    LDA.b #$2E                ;
                    STA.w $0802,y             ;
                    JMP.w CODE_05DB49         ;

                    db $00,$FC,$FB,$FA,$FA,$FA,$00,$04
                    db $05,$06,$06,$06,$00,$FC,$FC,$FE
                    db $FE,$FF,$27,$27,$28,$28,$36,$37
                    db $36,$37,$36,$37,$36,$37,$38,$29
                    db $38,$29,$38,$29,$38,$29,$29,$A9
                    db $29,$A9,$29,$29,$69,$69,$29,$29
                    db $69,$69,$29,$29,$69,$69,$29,$29
                    db $69,$69

CODE_05DC6F:        PHA                       ;
                    CMP.b #$F8                ;
                    BCC   CODE_05DC7C         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C04,y             ;
CODE_05DC7C:        PLA                       ;
                    RTS                       ;

CODE_05DC7E:        LDA.w $0248,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0E6D               ;
                    LDA.w $022A,x             ;
                    STA.w $0E70               ;
                    LDA.w $89,x             ;
                    STA.w $0E71               ;
                    LDA.b #$06                ;
                    STA.w $0E6E               ;
                    STZ.w $0E6F               ;
                    RTL                       ;

                    db $28,$2A,$2C,$2E

CODE_05DCA0:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.w $0B62,x             ;
                    LDA.b $39,x               ;
                    CMP.b #$02                ;
                    BCC   CODE_05DCAF         ;
                    JMP.w CODE_05DC06         ;

CODE_05DCAF:        LDA.b $B1,x               ;
                    BMI   CODE_05DCB6         ;
                    JMP.w CODE_05DB49         ;

CODE_05DCB6:        LDA.w $0248,x             ;
                    STA.w $0801,y             ;
                    LDA.w $03B3               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.b $E4                 ;
                    CMP.b #$F0                ;
                    BCS   CODE_05DCCC         ;
                    LDA.b #$02                ;
                    BRA   CODE_05DCCE         ;

CODE_05DCCC:        LDA.b #$03                ;
CODE_05DCCE:        STA.w $0C00,y             ;
                    LDA.b $E4                 ;
                    STA.w $0800,y             ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.w $DC9C,x             ;
                    STA.w $0802,y             ;
                    LDA.b #$28                ;
                    STA.w $0803,y             ;
                    LDX.b $9E                 ;
CODE_05DCE9:        PLB                       ;
                    RTL                       ;

                    db $04,$00,$04,$00,$00,$04,$00,$04
                    db $00,$08,$00,$08,$08,$00,$08,$00
                    db $44,$46,$44,$46,$81,$83,$80,$82
                    db $2A,$2A,$EA,$EA

CODE_05DD07:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.w $0B62,x             ;
                    LDA.w $0747               ;
                    BNE   CODE_05DD1A         ;
                    LDA.b $39,x               ;
                    AND.b #$7F                ;
                    CMP.b #$01                ;
                    BEQ   CODE_05DD1E         ;
CODE_05DD1A:        LDX.b #$00                ;
                    BEQ   CODE_05DD25         ;
CODE_05DD1E:        LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
CODE_05DD25:        LDA.w $03BE               ;
                    CLC                       ;
                    ADC.w $DCEF,x             ;
                    STA.w $0801,y             ;
                    REP   #$20                ;
                    LDA.w $DCEB,x             ;
                    AND.w #$00FF              ;
                    CLC                       ;
                    ADC.w $0E93               ;
                    SEC                       ;
                    SBC.w #$0008              ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b $E4                 ;
                    STA.w $0800,y             ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    LDA.b $E5                 ;
                    BEQ   CODE_05DD56         ;
                    LDA.b #$03                ;
                    STA.w $0C00,y             ;
CODE_05DD56:        LDA.w $DCFB,x             ;
                    STA.w $0802,y             ;
                    LDA.w $DD03,x             ;
                    STA.w $0803,y             ;
                    LDA.w $03D6               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BEQ   CODE_05DD72         ;
                    LDA.w $03D6               ;
                    AND.b #$F0                ;
                    BEQ   CODE_05DD76         ;
CODE_05DD72:        LDX.b $9E                 ;
                    STZ.b $39,x               ;
CODE_05DD76:        LDX.b $9E                 ;
                    PLB                       ;
                    RTL                       ;

CODE_05DD7A:        PHD                       ;
                    LDA.b #$0C                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    REP   #$10                ;
                    LDX.w #$0000              ;
                    TXY                       ;
CODE_05DD87:        LDA.b $0C,x               ;
                    LSR   A                   ;
                    ROR   A                   ;
                    ROR   A                   ;
                    STA.b $01                 ;
                    LDA.b $08,x               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TSB.b $01                 ;
                    LDA.b $04,x               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TSB.b $01                 ;
                    LDA.b $00,x               ;
                    ORA.b $01                 ;
                    STA.w $0A00,y             ;
                    INY                       ;
                    LDA.b $1C,x               ;
                    LSR   A                   ;
                    ROR   A                   ;
                    ROR   A                   ;
                    STA.b $01                 ;
                    LDA.b $18,x               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TSB.b $01                 ;
                    LDA.b $14,x               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TSB.b $01                 ;
                    LDA.b $10,x               ;
                    ORA.b $01                 ;
                    STA.w $0A00,y             ;
                    INY                       ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    CPX.w #$0200              ;
                    BCC   CODE_05DD87         ;
                    SEP   #$10                ;
                    PLD                       ;
                    RTL                       ;

CODE_05DDD4:        INC.w $0B76               ;
                    LDA.b #$38                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$B000              ;
                    STA.w $0285               ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w #$7C00              ;
                    STA.w $028A               ;
                    SEP   #$20                ;
                    RTS                       ;

CODE_05DDF3:        INC.w $0B76               ;
                    LDA.b #$07                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$B800              ;
                    STA.w $0285               ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w #$7C00              ;
                    STA.w $028A               ;
                    SEP   #$20                ;
                    RTS                       ;

CODE_05DE12:        PHX                       ;
                    PHY                       ;
                    JSR.w CODE_05E231         ;Clear windowing HDMA table
                    JSR.w CODE_05E1CE         ;
                    LDA.b #$22                ;
                    STA.w $1204               ;
                    LDA.b #$02                ;
                    STA.w $1205               ;
                    LDA.b #$15                ;
                    STA.w $1207               ;
                    LDA.b #$02                ;
                    STA.w $1208               ;
                    PLY                       ;
                    PLX                       ;
                    RTL                       ;

CODE_05DE31:        JSR.w CODE_05E231         ;Clear windowing HDMA table
                    JSR.w CODE_05E1CE         ;
                    JSR.w CODE_05DE65         ;
                    JSR.w CODE_05DDD4         ;
                    LDA.b #$01                ;
                    STA.w $0776               ;
                    STZ.w $0B77               ;
                    STZ.w $0B78               ;
                    STZ.w $0F8A               ;
                    RTL                       ;

CODE_05DE4C:        PHB                       ;\
                    PHK                       ; |
                    PLB                       ; |
                    PHX                       ; |
                    PHY                       ; |
                    LDA.w $0B75               ; |Pause window states
                    ASL   A                   ; |
                    TAX                       ; |
                    JSR.w (PNTR_05DE5D,x)     ; |
                    PLY                       ; |
                    PLX                       ; |
                    PLB                       ; |
                    RTL                       ;/

PNTR_05DE5D:        dw CODE_05E0B3            ;$00 = Expand
                    dw CODE_05DE97            ;$01 = Maintain pause window, wait for input etc
                    dw CODE_05E1AF            ;$02 = Select option?
                    dw CODE_05E11D            ;$03 = Collapse

CODE_05DE65:        REP   #$20                ;
                    LDA.w #$0010              ;
                    STA.w $0B6B               ;
                    LDA.w #$0064              ;
                    STA.w $0B6D               ;
                    LDA.w #$00A4              ;
                    STA.w $0B6F               ;
                    LDA.w #$00C4              ;
                    STA.w $0B71               ;
                    LDA.w #$00D0              ;
                    STA.w $0B73               ;
                    SEP   #$20                ;
                    LDA.w $1680               ;
                    BEQ   CODE_05DE96         ;
                    LDA.w $077A               ;
                    BEQ   CODE_05DE96         ;
                    LDA.b #$0E                ;
                    STA.w $0B6B               ;
CODE_05DE96:        RTS                       ;

CODE_05DE97:        JSR.w CODE_05DFFD         ;
                    LDX.w $0753               ;
                    LDA.w $1680               ;
                    BEQ   CODE_05DEB0         ;
                    LDA.w $077A               ;
                    BEQ   CODE_05DEB0         ;
                    LDA.w $0761               ;
                    BMI   CODE_05DEB0         ;
                    TXA                       ;
                    EOR.b #$01                ;
                    TAX                       ;
CODE_05DEB0:        LDA.w $0FF6,x             ;
                    STA.b $F2                 ;
                    AND.b #$2C                ;
                    BNE   CODE_05DEBC         ;
                    JMP.w CODE_05DF0D         ;

CODE_05DEBC:        LDA.b $F2                 ;
                    AND.b #$20                ;
                    BNE   CODE_05DEF8         ;
                    LDA.b $F2                 ;
                    AND.b #$08                ;
                    BNE   CODE_05DEE1         ;
                    INC.w $0B77               ;
                    LDA.w $0B77               ;
                    CMP.b #$03                ;
                    BCC   CODE_05DED7         ;
                    DEC.w $0B77               ;
                    BRA   CODE_05DF0D         ;

CODE_05DED7:        LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
                    BRA   CODE_05DF0D         ;

CODE_05DEE1:        DEC.w $0B77               ;
                    LDA.w $0B77               ;
                    BPL   CODE_05DEEE         ;
                    INC.w $0B77               ;
                    BRA   CODE_05DF0D         ;

CODE_05DEEE:        LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
                    BRA   CODE_05DF0D         ;

CODE_05DEF8:        INC.w $0B77               ;
                    LDA.w $0B77               ;
                    CMP.b #$03                ;
                    BCC   CODE_05DF05         ;
                    STZ.w $0B77               ;
CODE_05DF05:        LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
CODE_05DF0D:        LDA.b #$4C                ;
                    STA.w $0800               ;
                    LDX.w $0B77               ;
                    LDA.w $DFA9,x             ;
                    STA.w $0801               ;
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $DFAC,x             ;
                    STA.w $0802               ;
                    LDA.b #$21                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0B78               ;
                    LDA.b $F2                 ;
                    AND.b #$10                ;
                    BEQ   CODE_05DFA8         ;
                    LDA.b #$F2                ;
                    STA.w $1602               ;
                    STZ.w $0B78               ;
                    LDA.w $0B77               ;
                    BEQ   CODE_05DF68         ;
                    LDA.b #$30                ;
                    STA.w $0F8A               ;
                    LDA.b #$02                ;
                    STA.w $0B75               ;
                    LDA.b #$3B                ;
                    STA.w $1600               ;
                    LDA.w $0B77               ;
                    CMP.b #$02                ;
                    BNE   CODE_05DF7C         ;
                    LDA.b #$F3                ;
                    STA.w $1602               ;
                    BRA   CODE_05DF7C         ;

CODE_05DF68:        LDA.b #$10                ;
                    STA.w $0F8A               ;
                    LDA.b #$10                ;
                    STA.w $0B6B               ;
                    LDA.b #$02                ;
                    STA.w $0B75               ;
                    LDA.b #$43                ;
                    STA.w $1600               ;
CODE_05DF7C:        LDA.w $1680               ;
                    BEQ   CODE_05DF9A         ;
                    LDA.w $0B77               ;
                    CMP.b #$02                ;
                    BEQ   CODE_05DF9A         ;
                    STZ.w $0776               ;
                    LDA.b #$0E                ;
                    STA.w $0772               ;
                    LDX.w $0B77               ;
                    BEQ   CODE_05DF99         ;
                    JSL.l CODE_008F03         ;
CODE_05DF99:        RTS                       ;

CODE_05DF9A:        LDA.b #$20                ;
                    STA.w $0F8A               ;
                    LDA.w $0B77               ;
                    BEQ   CODE_05DFA8         ;
                    JSL.l CODE_008F03         ;
CODE_05DFA8:        RTS                       ;

                    db $50,$60,$70

                    db $D0,$DE,$AA,$AA,$AA,$AA,$AA,$AA ;First 2 bytes are the flashing arrow animation
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$14 ;First byte = arrow, 2nd byte = empty space
                    db $15,$16,$17,$18,$19,$1A,$1B,$AA ;SMB1 Pause screen tilemap. Pwnsome
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$28,$29,$2A,$2B,$1C,$14,$15
                    db $16,$17,$18,$19,$1A,$1B,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$28,$29,$2A,$2B,$1C
                    db $24,$25,$26,$27,$AA,$AA,$AA,$AA
                    db $FF                             ;(end of tilemap)


CODE_05DFFD:        REP   #$10                ;
                    LDY.w #$0010              ;
                    LDX.w #$0000              ;
                    LDA.b #$48                ;
                    STA.b $01                 ;
CODE_05E009:        LDA.b #$54                ;
                    STA.b $00                 ;
CODE_05E00D:        LDA.w $DFAE,x             ;
                    BPL   CODE_05E02A         ;
                    INX                       ;
                    INC   A                   ;
                    BEQ   CODE_05E04B         ;
CODE_05E016:        LDA.b $00                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $00                 ;
                    CMP.b #$B8                ;
                    BCC   CODE_05E00D         ;
                    LDA.b $01                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $01                 ;
                    BRA   CODE_05E009         ;

CODE_05E02A:        CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0802,y             ;
                    LDA.b $00                 ;
                    STA.w $0800,y             ;
                    LDA.b $01                 ;
                    STA.w $0801,y             ;
                    LDA.b #$21                ;
                    STA.w $0803,y             ;
                    LDA.b #$00                ;
                    STA.w $0C00,y             ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_05E016         ;

CODE_05E04B:        LDA.b #$40                ;
                    STA.b $01                 ;
CODE_05E04F:        LDA.b #$40                ;
                    STA.b $00                 ;
CODE_05E053:        LDA.b $00                 ;
                    STA.w $0800,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.b $00                 ;
                    LDA.b $01                 ;
                    STA.w $0801,y             ;
                    LDA.b #$CD                ;
                    STA.w $0802,y             ;
                    LDA.b #$21                ;
                    STA.w $0803,y             ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    LDA.b $00                 ;
                    CMP.b #$C0                ;
                    BCC   CODE_05E053         ;
                    LDA.b $01                 ;
                    CMP.b #$80                ;
                    BCS   CODE_05E088         ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.b $01                 ;
                    BRA   CODE_05E04F         ;

CODE_05E088:        SEP   #$10                ;
                    LDA.b #$4C                ;
                    STA.w $0800               ;
                    LDX.w $0B77               ;
                    LDA.w $DFA9,x             ;
                    STA.w $0801               ;
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $DFAC,x             ;
                    STA.w $0802               ;
                    LDA.b #$21                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    RTS                       ;

;EXPAND PAUSE WINDOW ROUTINE
CODE_05E0B3:        LDA.w $0B6B               ;\Windowing HDMA routine for pause which actually expands stuff
                    BEQ   CODE_05E116         ;/Timer for expanding and collapsing
                    BMI   CODE_05E116         ;
                    REP   #$30                ;
                    DEC.w $0B6B               ;Decrease timer. when it hits 0, the expanding ends
                    DEC.w $0B6D               ;\Maximum left border set
                    DEC.w $0B6D               ;/
                    INC.w $0B6F               ;\Maximum right border set
                    INC.w $0B6F               ;/
                    DEC.w $0B71               ;\
                    DEC.w $0B71               ; |Maximum upper border set
                    DEC.w $0B71               ; |
                    DEC.w $0B71               ;/
                    INC.w $0B73               ;\
                    INC.w $0B73               ; |Maximum lower border set
                    INC.w $0B73               ; |
                    INC.w $0B73               ;/
                    LDX.w #$007E              ;\
                    LDA.w #$00FF              ; |
CODE_05E0E9:        STA.l $7FF000,x           ; |
                    STA.l $7FF080,x           ; |
                    STA.l $7FF100,x           ; |Clear windowing RAM?
                    STA.l $7FF180,x           ; |NOPing it out doesn't seem to have any side effects
                    DEX                       ; |
                    DEX                       ; |
                    BPL   CODE_05E0E9         ;/
                    LDA.w $0B6F               ;\ Maximum right border
                    XBA                       ; |swap low and high bytes
                    ORA.w $0B6D               ;/|OR with maximum left border -> to Windowing HDMA value
                    LDX.w $0B71               ; |Load maximum upper border as an index
CODE_05E107:        STA.l $7FF000,x           ;/ Store windowing HDMA value
                    INX                       ;\
                    INX                       ; |If we didn't reach maximum lower border yet
                    CPX.w $0B73               ; |Loop
                    BNE   CODE_05E107         ;/
                    SEP   #$30                ;
                    BRA   CODE_05E119         ;

CODE_05E116:        INC.w $0B75               ;Increase pause window state?
CODE_05E119:        JSR.w CODE_05DFFD         ;
                    RTS                       ;

;COLLAPSE PAUSE WINDOW ROUTINE
CODE_05E11D:        LDA.w $0B6B               ;
                    BEQ   CODE_05E180         ;
                    BMI   CODE_05E180         ;
                    REP   #$30                ;
                    INC.w $0B6D               ;\Maximum left border
                    INC.w $0B6D               ;/
                    DEC.w $0B6F               ;\
                    DEC.w $0B6F               ;/Maximum right border
                    INC.w $0B71               ;\
                    INC.w $0B71               ; |
                    INC.w $0B71               ; |Maximum left border
                    INC.w $0B71               ;/
                    DEC.w $0B73               ;\
                    DEC.w $0B73               ; |
                    DEC.w $0B73               ; |Maximum right border
                    DEC.w $0B73               ;/
                    DEC.w $0B6B               ;Decrease timer for collapsing
                    LDX.w #$007E              ;\
                    LDA.w #$00FF              ; |
CODE_05E153:        STA.l $7FF000,x           ; |
                    STA.l $7FF080,x           ; |Clear windowing RAM?
                    STA.l $7FF100,x           ; |
                    STA.l $7FF180,x           ; |
                    DEX                       ; |
                    DEX                       ; |
                    BPL   CODE_05E153         ;/
                    LDA.w $0B6F               ;\ Maximum right border
                    XBA                       ; |Swap low and high bytes
                    ORA.w $0B6D               ;/ ORA with maximum left border -> to windowing HDMA value
                    LDX.w $0B71               ;\Load maximum upper border as an index
CODE_05E171:        STA.l $7FF000,x           ; |
                    INX                       ; |Store windowing HDMA value to the HDMA RAM
                    INX                       ;/
                    CPX.w $0B73               ;\If not done yet, loop
                    BNE   CODE_05E171         ;/
                    SEP   #$30                ;
                    BRA   CODE_05E1AB         ;

CODE_05E180:        STZ.w $0B75               ;Pause window state to zero
                    LDA.b #$0F                ;\
                    STA.w $1201               ;/Set brightness to max
                    STZ.w $0776               ;
                    LDA.w $1206               ;\
                    EOR.b #$03                ; |reverse window mask settings
                    STA.w $1206               ;/
                    LDA.w $1207               ;
                    EOR.b #$10                ;
                    STA.w $1207               ;
                    JSR.w CODE_05DDF3         ;
                    JSL.l CODE_0385BF         ;
                    LDA.w $1203               ;
                    AND.b #$F7                ;
                    STA.w $1203               ;
                    RTS                       ;

CODE_05E1AB:        JSR.w CODE_05DFFD         ;
                    RTS                       ;

CODE_05E1AF:        DEC.w $0F8A               ;
                    BNE   CODE_05E1CA         ;
                    INC.w $0B75               ;
                    LDA.b #$10                ;
                    STA.w $0B6B               ;
                    STA.w $0F8A               ;
                    LDA.w $0B77               ;\
                    CMP.b #$02                ; |If option is not Save and Quit
                    BNE   CODE_05E1CA         ; |Branch
                    JML.l CODE_0080DE         ;/ Go save and quit

CODE_05E1CA:        JSR.w CODE_05DFFD         ;
                    RTS                       ;

CODE_05E1CE:        PHB                       ;\
                    LDA.b #$7F                ; |
                    PHA                       ; |
                    PLB                       ; |
                    REP   #$30                ; |
                    LDX.w #$007E              ; |Clear $7FF000-$7F1FFF
                    LDA.w #$0000              ; |
CODE_05E1DB:        STA.w $F000,x             ; |
                    STA.w $F080,x             ; |
                    STA.w $F100,x             ; |
                    STA.w $F180,x             ; |
                    DEX                       ; |
                    DEX                       ; |
                    BPL   CODE_05E1DB         ; |
                    PLB                       ;/
                    SEP   #$20                ;A = 8-bit. XY = 16-bit
                    LDX.w #$2641              ;\Window 1 left position & window 1 right position
                    STX.w $4330               ;/2 regs write once. Indirect HDMA
                    LDX.w #$E22A              ;\
                    STX.w $4332               ; |Source: $05:E22A
                    LDA.b #$05                ; |
                    STA.w $4334               ;/
                    LDA.b #$7F                ;\
                    STA.w $4337               ;/Indirect HDMA address bank byte: $7F:xxxx
                    LDA.b #$00                ;\Window mask settings for BG1, 2, 3, 4.
                    STA.w $1204               ; |No window for BG1, 2, 3, 4.
                    STZ.w $1205               ;/
                    LDA.w $1206               ;\
                    ORA.b #$03                ; |Enable window 1 for OBJ. Window 1 inversion for OBJ
                    STA.w $1206               ;/
                    LDA.w $1207               ;\
                    ORA.b #$10                ; |Enable window masking for OBJ on the mainscreen
                    STA.w $1207               ; |
                    STZ.w $1208               ;/ None on the subscreen
                    SEP   #$10                ;AXY = 8-bit
                    LDA.w $1203               ;\
                    ORA.b #$08                ; |Enable HDMA
                    STA.w $1203               ;/
                    RTS                       ;

                    db $F8,$00,$F0,$F8,$F0,$F0,$00

CODE_05E231:        PHB                       ;\
                    LDA.b #$7F                ; |
                    PHA                       ; |
                    PLB                       ; |
                    REP   #$30                ; |
                    LDX.w #$01A0              ; |
CODE_05E23B:        LDA.w #$00FF              ; |
                    STA.w $F000,x             ; |
                    STA.w $F002,x             ; |
                    STA.w $F004,x             ; |
                    STA.w $F006,x             ; |
                    STA.w $F008,x             ; |
                    STA.w $F00A,x             ; |
                    STA.w $F00C,x             ; |
                    STA.w $F00E,x             ; |
                    STA.w $F010,x             ; |
                    STA.w $F012,x             ; |
                    STA.w $F014,x             ; |
                    STA.w $F016,x             ; |
                    STA.w $F018,x             ; |Clear windowing HDMA table
                    STA.w $F01A,x             ; |
                    STA.w $F01C,x             ; |
                    STA.w $F01E,x             ; |
                    STA.w $F200,x             ; |
                    STA.w $F202,x             ; |
                    STA.w $F204,x             ; |
                    STA.w $F206,x             ; |
                    STA.w $F208,x             ; |
                    STA.w $F20A,x             ; |
                    STA.w $F20C,x             ; |
                    STA.w $F20E,x             ; |
                    STA.w $F210,x             ; |
                    STA.w $F212,x             ; |
                    STA.w $F214,x             ; |
                    STA.w $F216,x             ; |
                    STA.w $F218,x             ; |
                    STA.w $F21A,x             ; |
                    STA.w $F21C,x             ; |
                    STA.w $F21E,x             ; |
                    TXA                       ; |
                    SEC                       ; |
                    SBC.w #$0020              ; |
                    TAX                       ; |
                    BPL   CODE_05E23B         ; |
                    SEP   #$30                ; |
                    PLB                       ; |
                    RTS                       ;/

CODE_05E2AA:        LDA.w $02F7               ;
                    BNE   CODE_05E2DE         ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_05E2DE         ;
                    LDA.w $03D3               ;
                    AND.b #$08                ;
                    BNE   CODE_05E2DE         ;
                    LDY.w $0B53,x             ;
                    LDA.w $03B0               ;
                    STA.w $0800,y             ;
                    LDA.w $03BB               ;
                    STA.w $0801,y             ;
                    LDA.b #$9F                ;
                    STA.w $0802,y             ;
                    LDA.b $0F                 ;
                    CMP.b #$07                ;
                    BNE   CODE_05E2D9         ;
                    LDA.b #$0A                ;
                    BRA   CODE_05E2DB         ;

CODE_05E2D9:        LDA.b #$2A                ;
CODE_05E2DB:        STA.w $0803,y             ;
CODE_05E2DE:        RTL                       ;

                    db $DF,$1B,$7F,$02,$39,$01,$00,$00 ;palette animation (axe, coins, [?], underground lanterns)
                    db $FF,$4B,$5F,$1F,$9C,$0D,$00,$00
                    db $FF,$7F,$FF,$4B,$FF,$19,$00,$00
                    db $DA,$1A,$F3,$0D,$0D,$05,$00,$00
                    db $5E,$2B,$77,$1E,$70,$11,$00,$00
                    db $DF,$3B,$FB,$2E,$D3,$1D,$00,$00
                    db $7F,$47,$98,$32,$B1,$15,$00,$00
                    db $1B,$67,$34,$4A,$4D,$2D,$00,$00
                    db $97,$7E,$B0,$6D,$EA,$54,$00,$00
                    db $5F,$03,$59,$02,$00,$38,$00,$00
                    db $FF,$03,$BC,$02,$16,$00,$00,$00
                    db $FF,$7F,$FF,$47,$DF,$00,$00,$00
                    db $C5,$2C,$89,$3D,$CD,$3D,$51,$4E
                    db $F8,$2E,$74,$1E,$41,$1C,$A3,$28
                    db $A4,$28,$48,$35,$8B,$3D,$0F,$4A
                    db $D6,$32,$31,$1E,$41,$1C,$A3,$28
                    db $62,$20,$C6,$2C,$27,$39,$8B,$41
                    db $50,$32,$AB,$21,$41,$1C,$A3,$28
                    db $83,$24,$07,$31,$49,$39,$CD,$45
                    db $93,$32,$EE,$1D,$41,$1C,$A3,$28
                    db $62,$20,$C6,$2C,$27,$39,$8B,$41
                    db $50,$32,$AB,$21,$41,$1C,$A3,$28
                    db $83,$24,$07,$31,$49,$39,$CD,$45
                    db $93,$32,$EE,$1D,$41,$1C,$A3,$28
                    db $A4,$28,$48,$35,$8B,$3D,$0F,$4A
                    db $D6,$32,$31,$1E,$41,$1C,$A3,$28
                    db $C5,$2C,$89,$3D,$CD,$3D,$51,$4E
                    db $F8,$2E,$74,$1E,$41,$1C,$A3,$28

CODE_05E3BF:        INC.w $0E74               ;
                    LDA.w $0E74               ;
                    AND.b #$07                ;
                    BEQ   CODE_05E3CC         ;
                    JMP.w CODE_05E441         ;

CODE_05E3CC:        INC.w $0E75               ;
                    LDA.w $0E75               ;
                    CMP.b #$03                ;
                    BNE   CODE_05E3DB         ;
                    STZ.w $0E75               ;
                    LDA.b #$00                ;
CODE_05E3DB:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $E2DF,x             ;
                    STA.w $1026               ;
                    LDA.w $E327,x             ;
                    STA.w $100A               ;
                    LDA.w $E2F7,x             ;
                    STA.w $102C               ;
                    LDA.w $E2E1,x             ;
                    STA.w $1028               ;
                    LDA.w $E329,x             ;
                    STA.w $100C               ;
                    LDA.w $E2F9,x             ;
                    STA.w $102E               ;
                    LDA.w $E2E3,x             ;
                    STA.w $102A               ;
                    LDA.w $E32B,x             ;
                    STA.w $100E               ;
                    LDA.w $E2FB,x             ;
                    STA.w $1030               ;
                    SEP   #$20                ;
                    LDA.w $0E20               ;
                    BNE   CODE_05E441         ;
                    LDA.b $DB                 ;
                    BEQ   CODE_05E476         ;
                    CMP.b #$1B                ;
                    BEQ   CODE_05E476         ;
                    CMP.b #$21                ;
                    BNE   CODE_05E42D         ;
                    JMP.w CODE_05E587         ;

CODE_05E42D:        CMP.b #$09                ;
                    BEQ   CODE_05E478         ;
                    CMP.b #$19                ;
                    BEQ   CODE_05E439         ;
                    CMP.b #$1A                ;
                    BNE   CODE_05E43C         ;
CODE_05E439:        JMP.w CODE_05E4A5         ;

CODE_05E43C:        LDA.b #$01                ;
                    STA.w $1200               ;
CODE_05E441:        LDA.w $0E74               ;
                    AND.b #$03                ;
                    BNE   CODE_05E476         ;
                    INC.w $0E76               ;
                    LDA.w $0E76               ;
                    CMP.b #$03                ;
                    BNE   CODE_05E457         ;
                    STZ.w $0E76               ;
                    LDA.b #$00                ;
CODE_05E457:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $E30F,x             ;
                    STA.w $1032               ;
                    LDA.w $E311,x             ;
                    STA.w $1034               ;
                    LDA.w $E313,x             ;
                    STA.w $1036               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
CODE_05E476:        PLB                       ;
                    RTL                       ;

CODE_05E478:        LDA.w $0E74               ;
                    AND.b #$38                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $E4D7,x             ;
                    STA.w $10E6               ;
                    LDA.w $E4E7,x             ;
                    STA.w $10E8               ;
                    LDA.w $E4F7,x             ;
                    STA.w $10FA               ;
                    LDA.w $E507,x             ;
                    STA.w $10FC               ;
                    LDA.w $E517,x             ;
                    STA.w $10FE               ;
                    SEP   #$20                ;
                    JMP.w CODE_05E43C         ;

CODE_05E4A5:        LDA.w $0E74               ;
                    AND.b #$38                ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $E33F,x             ;
                    STA.w $10E6               ;
                    LDA.w $E341,x             ;
                    STA.w $10E8               ;
                    LDA.w $E343,x             ;
                    STA.w $10EA               ;
                    LDA.w $E345,x             ;
                    STA.w $10EC               ;
                    LDA.w $E347,x             ;
                    STA.w $10EE               ;
                    LDA.w $E349,x             ;
                    STA.w $10F0               ;
                    SEP   #$20                ;
                    JMP.w CODE_05E43C         ;

                    db $BF,$7F,$38,$7F,$B4,$76,$30,$72
                    db $BF,$7F,$38,$7F,$B4,$76,$30,$72
                    db $38,$7F,$B4,$76,$30,$72,$BF,$7F
                    db $38,$7F,$B4,$76,$30,$72,$BF,$7F
                    db $B4,$76,$30,$72,$BF,$7F,$38,$7F
                    db $B4,$76,$30,$72,$BF,$7F,$38,$7F
                    db $C9,$69,$87,$61,$45,$59,$03,$51
                    db $C9,$69,$C9,$69,$C9,$69,$46,$59
                    db $30,$72,$BF,$7F,$38,$7F,$B4,$76
                    db $30,$72,$BF,$7F,$38,$7F,$B4,$76
                    db $63,$0C,$E5,$1C,$27,$29,$06,$25
                    db $63,$0C,$07,$1D,$2A,$25,$09,$21
                    db $63,$0C,$29,$19,$2C,$21,$2B,$1D
                    db $63,$0C,$07,$1D,$2A,$25,$09,$21
                    db $63,$0C,$E5,$1C,$27,$29,$06,$25
                    db $63,$0C,$07,$1D,$2A,$25,$09,$21
                    db $63,$0C,$29,$19,$2C,$21,$2B,$1D
                    db $63,$0C,$07,$1D,$2A,$25,$09,$21
                    db $77,$00,$7A,$01,$98,$00,$9B,$01
                    db $B9,$00,$BC,$01,$FB,$00,$FE,$01
                    db $DA,$00,$DD,$01,$B9,$00,$BC,$01
                    db $98,$00,$9B,$01,$77,$00,$7A,$01

CODE_05E587:        LDA.w $0E74               ;
                    AND.b #$38                ;
                    TAX                       ;
                    LSR   A                   ;
                    TAY                       ;
                    REP   #$20                ;
                    LDA.w $E527,x             ;
                    STA.w $10E2               ;
                    LDA.w $E529,x             ;
                    STA.w $10E4               ;
                    LDA.w $E52B,x             ;
                    STA.w $10E6               ;
                    LDA.w $E52D,x             ;
                    STA.w $10E8               ;
                    LDA.w $E567,y             ;
                    STA.w $10FC               ;
                    LDA.w $E569,y             ;
                    STA.w $10FE               ;
                    SEP   #$20                ;
                    LDA.b $1C                 ;
                    CMP.b #$35                ;
                    BEQ   CODE_05E631         ;
                    LDA.w $0EB7               ;
                    BNE   CODE_05E5E6         ;
                    LDA.w $07B8               ;
                    AND.b #$0F                ;
                    BNE   CODE_05E631         ;
                    LDA.b $0F                 ;
                    CMP.b #$08                ;
                    BNE   CODE_05E5D4         ;
                    LDA.b #$18                ;
                    STA.w $1603               ;
CODE_05E5D4:        LDA.b #$11                ;
                    STA.w $0EB8               ;
                    LDA.b #$1F                ;
                    STA.w $0EB9               ;
                    STA.w $0EBA               ;
                    INC.w $0EB7               ;
                    BRA   CODE_05E60E         ;

CODE_05E5E6:        DEC.w $0EB8               ;
                    DEC.w $0EB9               ;
                    DEC.w $0EB9               ;
                    DEC.w $0EBA               ;
                    DEC.w $0EBA               ;
                    DEC.w $0EB8               ;
                    DEC.w $0EB9               ;
                    DEC.w $0EB9               ;
                    DEC.w $0EBA               ;
                    DEC.w $0EBA               ;
                    LDA.w $0EB8               ;
                    CMP.b #$03                ;
                    BNE   CODE_05E60E         ;
                    STZ.w $0EB7               ;
CODE_05E60E:        REP   #$20                ;
                    LDA.w $0EB8               ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $E4                 ;
                    LDA.w $0EB9               ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ORA.b $E4                 ;
                    ORA.w $0EBA               ;
                    STA.b $E4                 ;
                    STA.w $10E2               ;
                    SEP   #$20                ;
CODE_05E631:        JMP.w CODE_05E43C         ;

CODE_05E634:        LDA.w $0B76               ;
                    BNE   CODE_05E6AE         ;
                    STZ.w $028D               ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_05E67A         ;
                    LDA.b $09                 ;
                    AND.b #$38                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $04                 ;
                    LDA.b #$06                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$8000              ;
                    LDY.b $04                 ;
CODE_05E657:        DEY                       ;
                    BMI   CODE_05E660         ;
                    CLC                       ;
                    ADC.w #$0800              ;
                    BRA   CODE_05E657         ;

CODE_05E660:        CLC                       ;
                    ADC.w #$4000              ;
                    STA.w $0285               ;
                    LDA.w #$1C00              ;
                    STA.w $028A               ;
                    LDA.w #$0600              ;
                    STA.w $0288               ;
                    SEP   #$20                ;
                    INC.w $028D               ;
                    BRA   CODE_05E6AE         ;

CODE_05E67A:        LDA.b $09                 ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0285               ;
                    AND.b #$07                ;
                    BNE   CODE_05E6AE         ;
                    LDA.b #$0C                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w $0285               ;
                    AND.w #$0038              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w #$FB00              ;
                    STA.w $0285               ;
                    LDA.w #$5160              ;
                    STA.w $028A               ;
                    LDA.w #$0040              ;
                    STA.w $0288               ;
                    SEP   #$20                ;
                    INC.w $028D               ;
CODE_05E6AE:        RTL                       ;

                    db $01,$18

CODE_05E6B1:        SEP   #$30                ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.b $99                 ;
                    CMP.b #$01                ;
                    BNE   CODE_05E6C7         ;
                    STA.w $02F8               ;
                    LDX.w $0753               ;
                    LDA.w $E6AF,x             ;
                    STA.b $99                 ;
CODE_05E6C7:        JSR.w CODE_05E82A         ;
                    LDA.b $99                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $E6DB,x             ;
                    STA.b $00                 ;
                    LDA.w $E6DC,x             ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

                    dw CODE_05E71B
                    dw CODE_05E73C
                    dw CODE_05E727
                    dw CODE_05E73C
                    dw CODE_05E74F
                    dw CODE_05E727
                    dw CODE_05E71B
                    dw CODE_05E743
                    dw CODE_05E71B
                    dw CODE_05E743
                    dw CODE_05E75B
                    dw CODE_05E727
                    dw CODE_05E727
                    dw CODE_05E71B
                    dw CODE_05E727
                    dw CODE_05E71B
                    dw CODE_05E727
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E73C
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B
                    dw CODE_05E71B

CODE_05E71B:        STZ.b $99                 ;
                    PLB                       ;
                    STZ.w $028D               ;
                    LDA.b #$01                ;
                    STA.w $028C               ;
                    RTL                       ;

CODE_05E727:        LDA.b $DB                 ;
                    CMP.b #$16                ;
                    BEQ   CODE_05E748         ;
                    CMP.b #$14                ;
                    BEQ   CODE_05E748         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_05E748         ;
                    LDA.b #$17                ;
                    JSR.w CODE_05E82A         ;
                    BRA   CODE_05E71B         ;

CODE_05E73C:        LDA.b #$11                ;
                    JSR.w CODE_05E82A         ;
                    BRA   CODE_05E71B         ;

CODE_05E743:        LDA.b #$16                ;
                    JSR.w CODE_05E82A         ;
CODE_05E748:        LDA.b #$12                ;
                    JSR.w CODE_05E82A         ;
                    BRA   CODE_05E71B         ;

CODE_05E74F:        LDA.b #$13                ;
                    JSR.w CODE_05E82A         ;
                    LDA.b #$14                ;
                    JSR.w CODE_05E82A         ;
                    BRA   CODE_05E71B         ;

CODE_05E75B:        LDA.b #$15                ;
                    JSR.w CODE_05E82A         ;
                    BRA   CODE_05E71B         ;

                    db $00,$00,$08,$00,$06,$00,$09,$00
                    db $09,$00,$08,$00,$09,$00,$06,$00
                    db $08,$00,$06,$00,$08,$00,$09,$00
                    db $08,$00,$08,$00,$08,$00,$09,$00
                    db $08,$00,$09,$00,$08,$00,$09,$00
                    db $09,$00,$09,$00,$09,$00,$09,$00
                    db $08,$00,$00,$00,$00,$E0,$00,$A0
                    db $00,$80,$00,$A0,$00,$98,$00,$A0
                    db $00,$A0,$00,$80,$00,$A0,$00,$D0
                    db $00,$E0,$00,$A0,$00,$90,$00,$B0
                    db $00,$90,$00,$B8,$00,$D0,$00,$C0
                    db $00,$E8,$00,$F0,$00,$F8,$00,$E0
                    db $00,$C0,$00,$F0,$00,$00,$00,$20
                    db $00,$20,$00,$20,$00,$20,$00,$2C
                    db $00,$20,$00,$20,$00,$20,$00,$20
                    db $00,$34,$00,$2C,$00,$28,$00,$2C
                    db $00,$2C,$00,$20,$00,$2C,$00,$30
                    db $00,$30,$00,$20,$00,$28,$00,$2C
                    db $00,$2C,$00,$30,$00,$20,$00,$10
                    db $00,$10,$00,$20,$00,$10,$00,$20
                    db $00,$08,$00,$20,$00,$10,$00,$10
                    db $00,$20,$00,$20,$00,$08,$00,$10
                    db $00,$08,$00,$08,$00,$10,$00,$10
                    db $00,$10,$00,$10,$00,$08,$00,$08
                    db $00,$08,$00,$08,$00,$10,$00,$10

CODE_05E82A:        ASL   A                   ;
                    TAX                       ;
                    LDA.w $E762,x             ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w $E794,x             ;
                    STA.w $0285               ;
                    LDA.w $E7C6,x             ;
                    STA.w $028A               ;
                    LDA.w $E7F8,x             ;
                    STA.w $0288               ;
                    SEP   #$20                ;
                    JSR.w CODE_05E84C         ;
                    RTS                       ;

CODE_05E84C:        LDA.b #$80                ;
                    STA.w $2115               ;
                    REP   #$20                ;
                    LDA.w $028A               ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.w $4300               ;
                    LDA.w $0285               ;
                    STA.w $4302               ;
                    LDX.w $0287               ;
                    STX.w $4304               ;
                    LDA.w $0288               ;
                    STA.w $4305               ;
                    LDX.b #$01                ;
                    STX.w $420B               ;
                    SEP   #$20                ;
                    RTS                       ;

CODE_05E879:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    STZ.w $0F49               ;
                    PHX                       ;
                    LDX.b $9E                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$04                ;
                    BCS   CODE_05E890         ;
                    LDA.b $29,x               ;
                    BMI   CODE_05E894         ;
                    AND.b #$06                ;
                    BEQ   CODE_05E894         ;
CODE_05E890:        PLX                       ;
                    PLB                       ;
                    CLC                       ;
                    RTL                       ;

CODE_05E894:        LDA.w $29,x             ;
                    STA.b $E0                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_05E8A5         ;
                    CMP.b #$03                ;
                    BEQ   CODE_05E8A5         ;
                    CMP.b #$04                ;
                    BNE   CODE_05E8AA         ;
CODE_05E8A5:        STZ.w $0F40,x             ;
                    BRA   CODE_05E8B7         ;

CODE_05E8AA:        AND.b #$80                ;
                    BEQ   CODE_05E890         ;
                    LDA.b $0F                 ;
                    CMP.b #$0A                ;
                    BCS   CODE_05E8B7         ;
                    INC.w $0F40,x             ;
CODE_05E8B7:        LDA.w $0F40,x             ;
                    AND.b #$0C                ;
                    STA.b $E4                 ;
                    LDA.b $1C,x               ;
                    LDX.b $E4                 ;
                    CMP.b #$02                ;
                    BNE   CODE_05E8CB         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAX                       ;
CODE_05E8CB:        LDA.b $E0                 ;
                    AND.b #$0F                ;
                    CMP.b #$04                ;
                    BNE   CODE_05E8DC         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$20                ;
                    TAX                       ;
                    LDA.b #$80                ;
                    TSB.b $04                 ;
CODE_05E8DC:        TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    CMP.b #$F0                ;
                    BCC   CODE_05E8ED         ;
                    LDA.b #$F0                ;
CODE_05E8ED:        PHA                       ;
                    LDA.b $04                 ;
                    BPL   CODE_05E8F8         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b #$02                ;
                    BRA   CODE_05E8F9         ;

CODE_05E8F8:        PLA                       ;
CODE_05E8F9:        JSR.w CODE_05E9BF         ;
                    LDA.b $04                 ;
                    BPL   CODE_05E908         ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$12                ;
                    BRA   CODE_05E90E         ;

CODE_05E908:        LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$10                ;
CODE_05E90E:        JSR.w CODE_05E9BF         ;
                    LDX.b $E4                 ;
                    LDA.w $EA28,x             ;
                    ORA.b $04                 ;
                    STA.w $08F3,y             ;
                    LDA.w $EA29,x             ;
                    ORA.b $04                 ;
                    STA.w $08F7,y             ;
                    LDA.w $EA2A,x             ;
                    ORA.b $04                 ;
                    STA.w $08FB,y             ;
                    LDA.w $EA2B,x             ;
                    ORA.b $04                 ;
                    STA.w $08FF,y             ;
                    INC.w $0F49               ;
                    PLX                       ;
                    PLB                       ;
                    SEC                       ;
                    RTL                       ;

                    db $00,$FC,$F9,$F7,$F5,$F4,$F3,$F2
                    db $F2,$F2,$F3,$F4,$F5,$F7,$F9,$FC
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00

CODE_05E95A:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDX.b $9E                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$35                ;
                    BNE   CODE_05E9AE         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_05E9AE         ;
                    LDA.w $0F4A               ;
                    AND.b #$1F                ;
                    LDY.w $0B46,x             ;
                    PHY                       ;
                    TAX                       ;
                    LDA.w $E93A,x             ;
                    STA.b $DD                 ;
                    JSR.w CODE_05E9B1         ;
                    JSR.w CODE_05E9B1         ;
                    JSR.w CODE_05E9B1         ;
                    JSR.w CODE_05E9B1         ;
                    JSR.w CODE_05E9B1         ;
                    JSR.w CODE_05E9B1         ;
                    PLY                       ;
                    CPX.b #$10                ;
                    BCS   CODE_05E9AB         ;
                    LDA.b #$FF                ;
                    STA.w $0902,y             ;
                    STA.w $0906,y             ;
                    LDA.b #$D7                ;
                    STA.w $090A,y             ;
                    STA.w $090E,y             ;
                    LDA.b #$EE                ;
                    STA.w $0912,y             ;
                    STA.w $0916,y             ;
CODE_05E9AB:        INC.w $0F4A               ;
CODE_05E9AE:        PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_05E9B1:        LDA.w $0901,y             ;
                    CLC                       ;
                    ADC.b $DD                 ;
                    STA.w $0901,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    RTS                       ;

CODE_05E9BF:        STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    LDA.w $E9E8,x             ;
                    STA.w $0902,y             ;
                    LDA.w $E9E9,x             ;
                    STA.w $0906,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    INX                       ;
                    RTS                       ;

                    db $6E,$6E,$6F,$6F,$C2,$C4,$C3,$C5
                    db $C0,$C0,$C1,$C1,$C4,$C2,$C5,$C3
                    db $F5,$F5,$F4,$F4,$80,$82,$81,$83
                    db $68,$68,$90,$90,$82,$80,$83,$81
                    db $6F,$6F,$6E,$6E,$C3,$C5,$C2,$C4
                    db $C1,$C1,$C0,$C0,$C5,$C3,$C4,$C2
                    db $F4,$F4,$F5,$F5,$81,$83,$80,$82
                    db $90,$90,$68,$68,$83,$81,$82,$80
                    db $00,$40,$00,$40,$00,$00,$00,$00
                    db $00,$40,$00,$40,$40,$40,$40,$40

CODE_05EA38:        LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.w $BC,x             ;
                    CMP.b #$02                ;
                    BCS   CODE_05EA50         ;
                    LDA.w $03B9               ;
                    CMP.b #$E8                ;
                    BCC   CODE_05EA52         ;
CODE_05EA50:        LDA.b #$F0                ;
CODE_05EA52:        STA.w $0901,y             ;
                    LDA.w $A1,x             ;
                    BMI   CODE_05EA5E         ;
                    LDA.b #$A9                ;
                    BRA   CODE_05EA60         ;

CODE_05EA5E:        LDA.b #$29                ;
CODE_05EA60:        STA.w $0903,y             ;
                    LDA.w $0E68               ;
                    AND.b #$18                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$62                ;
                    STA.w $0902,y             ;
                    LDA.w $021A,x             ;
                    STA.b $E4                 ;
                    LDA.b $79,x               ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E6                 ;
                    SEP   #$20                ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    LDA.b $E7                 ;
                    BEQ   CODE_05EA92         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
CODE_05EA92:        RTL                       ;

                    db $F9,$0E,$F7,$0E,$FA,$FB,$F8,$FB
                    db $F6,$FB

                    db $20,$22,$24

CODE_05EAA0:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.b #$F0                ;
                    LDA.w $021A,x             ;
                    STA.b $E4                 ;
                    LDA.b $79,x               ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E4                 ;
                    CLC                       ;
                    ADC.w #$0004              ;
                    STA.b $E6                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $E8                 ;
                    SEP   #$20                ;
                    LDA.b $E4                 ;
                    STA.w $0800,y             ;
                    LDA.w $0238,x             ;
                    STA.w $0801,y             ;
                    LDA.b #$2B                ;
                    STA.w $0803,y             ;
                    LDA.b $09                 ;
                    AND.b #$18                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHX                       ;
                    TAX                       ;
                    CPX.b #$03                ;
                    BNE   CODE_05EAE8         ;
                    LDX.b #$01                ;
CODE_05EAE8:        LDA.w $EA9D,x             ;
                    STA.w $0802,y             ;
                    PLX                       ;
                    LDA.w $070F               ;
                    BEQ   CODE_05EB29         ;
                    LDA.w $010F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b $E6                 ;
                    STA.w $0804,y             ;
                    LDA.b $E8                 ;
                    STA.w $0808,y             ;
                    LDA.w $010D               ;
                    STA.w $0805,y             ;
                    STA.w $0809,y             ;
                    LDA.w $EA93,x             ;
                    STA.w $0806,y             ;
                    LDA.w $EA94,x             ;
                    STA.w $080A,y             ;
                    LDA.b #$22                ;
                    STA.w $0807,y             ;
                    STA.w $080B,y             ;
                    CPX.b #$04                ;
                    BCS   CODE_05EB29         ;
                    LDA.b #$23                ;
                    STA.w $080B,y             ;
CODE_05EB29:        LDA.b #$02                ;
                    STA.b $DD                 ;
                    LDA.b $E5                 ;
                    BEQ   CODE_05EB33         ;
                    LDA.b #$01                ;
CODE_05EB33:        ORA.b $DD                 ;
                    STA.w $0C00,y             ;
                    STZ.b $DD                 ;
                    LDA.b $E7                 ;
                    BEQ   CODE_05EB40         ;
                    LDA.b #$01                ;
CODE_05EB40:        ORA.b $DD                 ;
                    STA.w $0C04,y             ;
                    CPX.b #$04                ;
                    BCS   CODE_05EB4D         ;
                    LDA.b #$02                ;
                    STA.b $DD                 ;
CODE_05EB4D:        LDA.b $E9                 ;
                    BEQ   CODE_05EB53         ;
                    LDA.b #$01                ;
CODE_05EB53:        ORA.b $DD                 ;
                    STA.w $0C08,y             ;
                    PLB                       ;
                    RTL                       ;

CODE_05EB5A:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $07FC               ;
                    STA.l $701FF8             ;
                    LDA.w $075F               ;
                    STA.l $701FF9             ;
                    LDA.b #$01                ;
                    STA.w $0F0B               ;
                    LDA.b #$01                ;
                    STA.w $07FC               ;
                    STA.w $075D               ;
                    STA.w $07FB               ;
                    STA.w $076A               ;
                    STA.l $7FFB05             ;
                    LDA.b #$80                ;
                    STA.w $1602               ;
                    STZ.w $075F               ;
                    STZ.w $0760               ;
                    STZ.w $075C               ;
                    STZ.w $075B               ;
                    STZ.w $0F0B               ;
                    PLB                       ;
                    JSL.l CODE_03A287         ;
                    RTL                       ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$06,$FF
                    db $00,$FF,$FF,$06,$00,$01,$FF,$06
                    db $FF,$0F,$FF,$01,$FF,$FF,$FF,$FF
                    db $16,$06,$FF,$0E,$FF,$00,$0A,$FF
                    db $0B,$FF,$07,$FF,$FF,$14,$FF,$FF
                    db $FF,$FF,$FF,$FF,$16,$06,$00,$FF
                    db $0E,$05,$00,$FF,$0E,$FF,$06,$06
                    db $FF,$0F,$FF,$00,$FF,$FF,$FF,$FF
                    db $16,$FF,$FF,$12,$FF,$FF,$FF,$00
                    db $02,$06,$FF,$FF,$03,$FF,$0F,$FF
                    db $FF,$FF,$FF,$FF,$16,$00,$06,$FF
                    db $0E,$08,$00,$02,$08,$04,$05,$03
                    db $08,$FF,$0F,$06,$FF,$FF,$FF,$FF
                    db $16,$FF,$FF,$12,$FF,$FF,$00,$02
                    db $FF,$0E,$06,$FF,$FF,$08,$FF,$FF
                    db $FF,$FF,$FF,$FF,$16,$00,$0E,$05
                    db $08,$02,$0A,$FF,$0B,$FF,$07,$00
                    db $0E,$FF,$14,$03,$FF,$FF,$FF,$FF
                    db $16,$00,$02,$FF,$0E,$06,$02,$0E
                    db $12,$08,$06,$00,$08,$FF,$0E,$05
                    db $FF,$FF,$FF,$FF,$16,$FF,$FF,$FF
                    db $FF,$FF,$FF,$02,$FF,$00,$FF,$FF
                    db $02,$00,$01,$FF,$03,$08,$FF,$0F
                    db $02,$FF,$FF,$FF,$FF,$16,$02,$FF
                    db $0E,$FF,$00,$0A,$FF,$0B,$FF,$07
                    db $00,$0E,$FF,$14,$03,$FF,$FF,$FF
                    db $FF,$16,$02,$00,$FF,$0E,$05,$00
                    db $FF,$0E,$FF,$02,$02,$FF,$0F,$FF
                    db $00,$FF,$FF,$FF,$FF,$16,$FF,$FF
                    db $12,$FF,$FF,$FF,$00,$FF,$02,$FF
                    db $FF,$03,$FF,$0F,$FF,$FF,$FF,$FF
                    db $FF,$16,$00,$02,$FF,$0E,$08,$00
                    db $02,$08,$04,$05,$03,$08,$FF,$0F
                    db $02,$FF,$FF,$FF,$FF,$16,$FF,$FF
                    db $12,$FF,$FF,$00,$02,$FF,$0E,$06
                    db $FF,$FF,$08,$FF,$FF,$FF,$FF,$FF
                    db $FF,$16,$00,$0E,$05,$08,$02,$0A
                    db $FF,$0B,$FF,$07,$00,$0E,$FF,$14
                    db $03,$FF,$FF,$FF,$FF,$16,$FF,$02
                    db $00,$0E,$FF,$02,$0E,$12,$08,$FF
                    db $00,$08,$FF,$0E,$05,$FF,$FF,$FF
                    db $FF,$16,$01,$02,$02,$06,$03,$07
                    db $00,$00,$05,$03,$18,$18,$16,$03
                    db $03,$01,$02,$02,$04,$03,$08,$08
                    db $06,$03,$03,$11,$11,$16,$03,$03
                    db $08,$00,$00,$05,$03,$07,$07,$07
                    db $03,$03,$00,$00,$00,$00,$00,$01
                    db $02,$02,$03,$04,$05,$06,$06,$07
                    db $08,$09,$0A,$0B,$0C,$00,$0D,$0E
                    db $0E,$0F,$10,$11,$12,$13,$14,$00
                    db $15,$16,$17,$18,$00,$19,$1A,$1A
                    db $1B,$1C,$1D,$1E,$1F,$20,$00,$21
                    db $22,$23,$24,$00,$00,$00,$FF,$7F
                    db $63,$0C,$55,$01,$1C,$1A,$3E,$1B
                    db $9C,$2D,$BF,$3A,$00,$00,$2F,$15
                    db $14,$00,$19,$0C,$9F,$1C,$2E,$76
                    db $68,$5D,$E6,$44,$BC,$45,$A5,$14
                    db $FF,$7F,$3F,$02,$DB,$01,$36,$01
                    db $BF,$3A,$9C,$2D,$00,$00,$3F,$5B
                    db $76,$69,$F0,$50,$8B,$3C,$36,$01
                    db $DB,$01,$3F,$02,$BC,$45,$FF,$7F
                    db $A5,$14,$92,$00,$98,$00,$9F,$00
                    db $9C,$2D,$BF,$3A,$00,$00,$2F,$15
                    db $95,$2C,$3A,$41,$DF,$55,$1F,$03
                    db $7A,$02,$D5,$01,$BC,$45,$A5,$14
                    db $FF,$7F,$DF,$55,$3A,$41,$95,$2C
                    db $BF,$3A,$9C,$2D,$00,$00,$3F,$5B
                    db $7F,$21,$D9,$14,$53,$04,$00,$02
                    db $E0,$02,$E0,$03,$00,$00,$FF,$7F
                    db $63,$0C,$55,$01,$1C,$1A,$3E,$1B
                    db $9C,$2D,$BF,$3A,$00,$00,$2F,$15
                    db $60,$1E,$04,$33,$88,$43,$55,$76
                    db $90,$71,$CA,$58
                    
DATA_05EDE0:        db $01,$80,$02,$81
                    db $41,$80,$01,$42,$C2,$02,$80,$41
                    db $C1,$41,$C1,$01,$C1,$01,$02,$80
                    db $00

;Demo action timer lengths
DATA_05EDF5:        db $9B,$10,$18,$05,$2C,$20,$1C
                    db $0E,$60,$10,$20,$28,$30,$20,$10
                    db $80,$20,$30,$2C,$01,$FF,$00
                    
;Alt demo timer actions
DATA_05EE0B:        db $01
                    db $80,$01,$02,$01,$80,$01,$80,$01
                    db $02,$80,$02,$80,$01,$80,$01,$80
                    db $01,$80,$01,$02,$01,$00

;Alt demo action timer lengths
DATA_05EE22:        db $A0,$08
                    db $08,$40,$30,$10,$08,$10,$18,$1C
                    db $20,$58,$10,$40,$38,$40,$20,$50
                    db $30,$30,$48,$80,$FF,$00

CODE_05EE3A:        PHD                       ;
                    LDA.b #$07                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    LDX.b #$05                ;
                    LDA.b $53                 ;
                    BEQ   CODE_05EE49         ;
                    LDX.b #$0B                ;
CODE_05EE49:        LDY.b #$05                ;
                    SEC                       ;
CODE_05EE4C:        LDA.b $CE,x               ;
                    SBC.w $07C8,y             ;
                    DEX                       ;
                    DEY                       ;
                    BPL   CODE_05EE4C         ;
                    BCC   CODE_05EE64         ;
                    INX                       ;
                    INY                       ;
CODE_05EE59:        LDA.b $CE,x               ;
                    STA.w $07C8,y             ;
                    INX                       ;
                    INY                       ;
                    CPY.b #$06                ;
                    BCC   CODE_05EE59         ;
CODE_05EE64:        PLD                       ;
                    RTL                       ;