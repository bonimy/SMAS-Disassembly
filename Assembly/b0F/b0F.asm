; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $0F8000:
    fillbyte $FF : fill $8000

ORG $0F8000
CODE_0F8000:        JSL.l CODE_0E8F35         ;
                    STZ.w $0EDC               ;
                    PHB                       ;
                    LDA.b #$7E                ;
                    PHA                       ;
                    PLB                       ;
                    LDA.b $DB                 ;
                    STA.w $0F35               ;
                    CMP.b #$23                ;
                    BNE   CODE_0F801F         ;
                    LDX.b $43                 ;
                    CPX.b #$0C                ;
                    BNE   CODE_0F801F         ;
                    LDX.b #$47                ;
                    STX.b $DB                 ;
CODE_0F801F:        REP   #$30                ;
                    LDX.w #$0000              ;
                    LDA.w #$0000              ;
CODE_0F8027:        STA.w $D000,x             ;
                    STA.w $D100,x             ;
                    STA.w $D200,x             ;
                    STA.w $D300,x             ;
                    STA.w $D400,x             ;
                    STA.w $D500,x             ;
                    STA.w $D600,x             ;
                    STA.w $D700,x             ;
                    STA.w $D800,x             ;
                    STA.w $D900,x             ;
                    STA.w $DA00,x             ;
                    STA.w $DB00,x             ;
                    STA.w $DC00,x             ;
                    STA.w $DD00,x             ;
                    STA.w $DE00,x             ;
                    STA.w $DF00,x             ;
                    STA.w $E000,x             ;
                    STA.w $E100,x             ;
                    STA.w $E200,x             ;
                    INX                       ;
                    INX                       ;
                    CPX.w #$0100              ;
                    BNE   CODE_0F8027         ;
                    PLB                       ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    STZ.w $0EC0               ;
                    LDA.w $0E65               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_0F8078         ;
                    STA.b $DB                 ;
CODE_0F8078:        LDA.b $DB                 ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $AE02,x             ;
                    STA.b $02                 ;
CODE_0F8084:        REP   #$30                ;
                    LDX.b $02                 ;
                    LDA.w $B6A1,x             ;
                    STA.b $04                 ;
                    INC.b $02                 ;
                    INC.b $02                 ;
                    AND.w #$03F0              ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $EF                 ;
                    LDA.b $04                 ;
                    AND.w #$000F              ;
                    STA.b $F1                 ;
                    LDA.b $04                 ;
                    AND.w #$E000              ;
                    STA.b $ED                 ;
                    LDA.b $04                 ;
                    LSR   A                   ;
                    AND.w #$0E00              ;
                    ORA.b $ED                 ;
                    XBA                       ;
                    STA.b $ED                 ;
                    AND.w #$00F0              ;
                    CMP.w #$00E0              ;
                    BNE   CODE_0F80DC         ;
                    LDA.b $EF                 ;
                    CMP.w #$003F              ;
                    BNE   CODE_0F80D7         ;
                    INC.w $0EC0               ;
                    INC.w $0EC0               ;
                    LDA.w $0EC0               ;
                    XBA                       ;
                    TAX                       ;
                    LDA.w #$FFFF              ;
                    STA.l $7ED000,x           ;
                    JMP.w CODE_0F91CF         ;

CODE_0F80D7:        JSR.w CODE_0F8FB5         ;
                    BRA   CODE_0F8084         ;

CODE_0F80DC:        LDA.w $0EC0               ;
                    XBA                       ;
                    CLC                       ;
                    ADC.b $ED                 ;
                    STA.b $EB                 ;
                    LDA.b $EF                 ;
                    CMP.w #$0010              ;
                    BCC   CODE_0F80F2         ;
                    JSR.w CODE_0F8F1D         ;
                    JMP.w CODE_0F8084         ;

CODE_0F80F2:        ASL   A                   ;
                    TAX                       ;
                    LDA.b $DB                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $810A,y             ;\Load a ptr which points to a routine using a ptr.
                    STA.b $04                 ; |
                    LDA.w #$000F              ; |
                    STA.b $06                 ; |
                    TXY                       ; |
                    LDA.b [$04],y             ; |
                    STA.b $00                 ; |
                    JMP.w ($0000)             ;/And jump to it.

                    dw $8204                  ; $00 ;these pointers point to the next pointer table
                    dw $8204                  ; $01
                    dw $8204                  ; $02
                    dw $8204                  ; $03
                    dw $8204                  ; $04
                    dw $8204                  ; $05
                    dw $8204                  ; $06
                    dw $81E4                  ; $07
                    dw $81BE                  ; $08
                    dw $81BE                  ; $09
                    dw $8204                  ; $0A
                    dw $8204                  ; $0B
                    dw $8204                  ; $0C
                    dw $81E4                  ; $0D
                    dw $81BE                  ; $0E
                    dw $8254                  ; $0F
                    dw $81BE                  ; $10
                    dw $81BE                  ; $11
                    dw $81BE                  ; $12
                    dw $821C                  ; $13
                    dw $8254                  ; $14
                    dw $81BE                  ; $15
                    dw $81BE                  ; $16
                    dw $81BE                  ; $17
                    dw $8254                  ; $18
                    dw $821C                  ; $19
                    dw $8254                  ; $1A
                    dw $821C                  ; $1B
                    dw $819A                  ; $1B
                    dw $81BE                  ; $1C
                    dw $81BE                  ; $1D
                    dw $81BE                  ; $1E
                    dw $821C                  ; $1F
                    dw $81BE                  ; $20
                    dw $8254                  ; $21
                    dw $821C                  ; $22
                    dw $823C                  ; $23
                    dw $81BE                  ; $24
                    dw $81BE                  ; $25
                    dw $81BE                  ; $26
                    dw $81BE                  ; $27
                    dw $81BE                  ; $28
                    dw $81BE                  ; $29
                    dw $81BE                  ; $2A
                    dw $819A                  ; $2B
                    dw $81BE                  ; $2C
                    dw $8254                  ; $2D
                    dw $81BE                  ; $2E
                    dw $81BE                  ; $2F
                    dw $81BE                  ; $30
                    dw $821C                  ; $31
                    dw $821C                  ; $32
                    dw $81A2                  ; $33
                    dw $81BE                  ; $34
                    dw $81BE                  ; $35
                    dw $81DE                  ; $36
                    dw $81DE                  ; $37
                    dw $81BE                  ; $38
                    dw $81DE                  ; $39
                    dw $81BE                  ; $3A
                    dw $81DE                  ; $3B
                    dw $81BE                  ; $3C
                    dw $81B6                  ; $3D
                    dw $81B6                  ; $3E
                    dw $81B6                  ; $3F
                    dw $81A0                  ; $40
                    dw $81B6                  ; $41
                    dw $81B6                  ; $42
                    dw $81B6                  ; $43
                    dw $81B6                  ; $44
                    dw $81B6                  ; $45
                    dw $81BE                  ; $46

                    dw $82B4                  ;
                    dw $82B9                  ;
                    dw $826A                  ;
                    dw $8357                  ;
                    dw $90A0                  ;
                    dw $86C3                  ;
                    dw $86C1                  ;
                    dw $86B8                  ;
                    dw $86AE                  ;
                    dw $86C3                  ;
                    dw $86C3                  ;
                    dw $86AE                  ;
                    dw $86C1                  ;
                    dw $86C3                  ;
                    dw $8799                  ;
                    dw $879B                  ;
                    dw $87D3                  ;
                    dw $87D5                  ;
                    dw $8A0A                  ;
                    dw $875E                  ;
                    dw $875E                  ;
                    dw $875E                  ;
                    dw $88BA                  ;
                    dw $88B8                  ;
                    dw $88AF                  ;
                    dw $88AD                  ;
                    dw $885F                  ;
                    dw $8869                  ;
                    dw $8875                  ;
                    dw $8881                  ;
                    dw $888D                  ;
                    dw $8899                  ;
                    dw $88A1                  ;
                    dw $8502                  ;
                    dw $8A78                  ;
                    dw $8A95                  ;
                    dw $8AC6                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8663                  ;
                    dw $8661                  ;
                    dw $8BE9                  ;
                    dw $8BE9                  ;
                    dw $8C27                  ;
                    dw $8CFE                  ;
                    dw $8D78                  ;
                    dw $8E22                  ;
                    dw $8BBA                  ;
                    dw $8B00                  ;
                    dw $8B6D                  ;
                    dw $8E6B                  ;
                    dw $8E69                  ;
                    dw $8E5D                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $870E                  ;
                    dw $84BA                  ;
                    dw $84B8                  ;
                    dw $84AE                  ;
                    dw $84AC                  ;
                    dw $84A7                  ;
                    dw $84A5                  ;
                    dw $849B                  ;
                    dw $8499                  ;
                    dw $845E                  ;
                    dw $845C                  ;
                    dw $8452                  ;
                    dw $8450                  ;
                    dw $837C                  ;

                    db $07,$0A,$0B,$12,$19,$29,$2A,$33
                    db $34,$30,$00,$07,$0A,$1D,$19,$00
                    db $29,$2A,$2D,$30

                    LDY.b $F1                 ;
                    LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.w $8256,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $8257,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $8258,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8259,y             ;
                    STA.l $7ED030,x           ;
                    LDA.w $825A,y             ;
                    STA.l $7ED040,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $01,$02,$03,$04,$08,$09,$05,$06
                    db $10,$11,$17,$18,$1B,$1C,$1F,$20
                    db $21,$22,$25,$26,$23,$24,$2B,$2C
                    db $2E,$2F,$31,$32

                    LDY.w #$000E              ;
                    BRA   CODE_0F82BC         ;

                    LDY.w #$0000              ;
CODE_0F82BC:        LDX.b $EB                 ;
                    INX                       ;
                    SEP   #$20                ;
                    LDA.w $8298,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $8299,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $829A,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $829B,y             ;
                    STA.l $7ED011,x           ;
                    LDA.w $829E,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $829F,y             ;
                    STA.l $7ED021,x           ;
                    LDA.b #$30                ;
                    STA.b $E4                 ;
                    STZ.b $E5                 ;
CODE_0F82F1:        REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b $E4                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    CMP.b #$D0                ;
                    BCS   CODE_0F8322         ;
                    LDA.w $829C,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $829D,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $829E,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $829F,y             ;
                    STA.l $7ED011,x           ;
                    LDA.b #$20                ;
                    STA.b $E4                 ;
                    STZ.b $E5                 ;
                    BRA   CODE_0F82F1         ;

CODE_0F8322:        LDA.w $82A0,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $82A1,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $82A2,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $82A3,y             ;
                    STA.l $7ED011,x           ;
                    LDA.w $82A4,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $82A5,y             ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $00,$00,$41,$00,$82,$00

                    LDA.b $F1                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $8351,y             ;
                    TAY                       ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
CODE_0F8368:        LDA.w $B5DE,y             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0F8377         ;
                    STA.l $7ED000,x           ;
                    INY                       ;
                    INX                       ;
                    BRA   CODE_0F8368         ;

CODE_0F8377:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDX.b $EB                 ;
                    LDA.b $F1                 ;
                    STA.b $E6                 ;
                    SEP   #$20                ;
                    STZ.b $E8                 ;
CODE_0F8386:        LDA.b #$09                ;
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
                    BNE   CODE_0F83B5         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    INC.b $E8                 ;
CODE_0F83B5:        SEP   #$20                ;
                    DEC.b $E6                 ;
                    LDA.b $E6                 ;
                    BMI   CODE_0F83F4         ;
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
                    BNE   CODE_0F83EC         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    INC.b $E8                 ;
CODE_0F83EC:        SEP   #$20                ;
                    DEC.b $E6                 ;
                    LDA.b $E6                 ;
                    BPL   CODE_0F8386         ;
CODE_0F83F4:        LDX.b $EB                 ;
                    LDA.b $F1                 ;
                    CMP.b #$04                ;
                    BCC   CODE_0F83FE         ;
                    LDA.b #$04                ;
CODE_0F83FE:        TAY                       ;
                    LDA.w $8425,y             ;
                    STA.l $7ECFFF,x           ;
                    REP   #$20                ;
                    LDA.b $E8                 ;
                    BEQ   CODE_0F8412         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0F8412:        TXA                       ;
                    CLC                       ;
                    ADC.b $F1                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $842A,y             ;
                    STA.l $7ED001,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $08,$08,$04,$04,$08,$0A,$06,$0A
                    db $06,$0A,$01,$02,$03,$02,$04,$01
                    db $02,$02,$03,$02,$02,$04,$07,$08
                    db $09,$07,$0E,$08,$0E,$09,$01,$03
                    db $04,$04,$06,$02,$04,$02,$00,$05
                    db $0C,$0F,$14

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $EB                 ;
                    BRA   CODE_0F845E         ;

                    INC.b $EB                 ;
CODE_0F845E:        LDX.b $EB                 ;
                    LDA.b $F1                 ;
                    TAY                       ;
                    LDA.w $8446,y             ;
                    AND.w #$00FF              ;
                    STA.b $F1                 ;
                    LDA.w $844B,y             ;
                    AND.w #$00FF              ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0F8474:        LDA.w $842F,y             ;
                    STA.l $7ED000,x           ;
                    INX                       ;
                    INY                       ;
                    TXA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_0F848C         ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    SEP   #$20                ;
CODE_0F848C:        DEC.b $F1                 ;
                    BPL   CODE_0F8474         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $05,$0A,$06,$0C


                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $EB                 ;
                    BRA   CODE_0F84A7         ;

                    INC.b $EB                 ;
CODE_0F84A7:        LDY.w #$0001              ;
                    BRA   CODE_0F84BD         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $EB                 ;
                    BRA   CODE_0F84BA         ;

                    INC.b $EB                 ;
CODE_0F84BA:        LDY.w #$0000              ;
CODE_0F84BD:        LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.w $8495,y             ;
                    STA.l $7ED000,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
CODE_0F84D4:        LDA.l $7ED000,x           ;
                    CMP.b #$0E                ;
                    BNE   CODE_0F84E0         ;
                    LDA.b #$0D                ;
                    BRA   CODE_0F84EB         ;

CODE_0F84E0:        CMP.b #$02                ;
                    BNE   CODE_0F84E8         ;
                    LDA.b #$0B                ;
                    BRA   CODE_0F84EB         ;

CODE_0F84E8:        LDA.w $8497,y             ;
CODE_0F84EB:        STA.l $7ED000,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    BPL   CODE_0F84D4         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    LDA.l $7ED000,x           ;
                    BEQ   CODE_0F851B         ;
                    LDA.b #$38                ;
                    BRA   CODE_0F851D         ;

CODE_0F851B:        LDA.b #$34                ;
CODE_0F851D:        STA.l $7ED000,x           ;
                    LDA.l $7ED010,x           ;
                    BEQ   CODE_0F852F         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0F852F         ;
                    LDA.b #$44                ;
                    BRA   CODE_0F8531         ;

CODE_0F852F:        LDA.b #$40                ;
CODE_0F8531:        STA.l $7ED010,x           ;
                    LDA.l $7ED020,x           ;
                    BEQ   CODE_0F8543         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0F8543         ;
                    LDA.b #$4D                ;
                    BRA   CODE_0F8545         ;

CODE_0F8543:        LDA.b #$4C                ;
CODE_0F8545:        STA.l $7ED020,x           ;
                    INX                       ;
                    LDA.l $7ED000,x           ;
                    BEQ   CODE_0F856C         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0F856C         ;
                    CMP.b #$18                ;
                    BEQ   CODE_0F8568         ;
                    CMP.b #$07                ;
                    BEQ   CODE_0F8568         ;
                    CMP.b #$17                ;
                    BEQ   CODE_0F8564         ;
                    LDA.b #$39                ;
                    BRA   CODE_0F856E         ;

CODE_0F8564:        LDA.b #$3D                ;
                    BRA   CODE_0F856E         ;

CODE_0F8568:        LDA.b #$36                ;
                    BRA   CODE_0F856E         ;

CODE_0F856C:        LDA.b #$35                ;
CODE_0F856E:        STA.l $7ED000,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$48                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    INX                       ;
CODE_0F8585:        DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BNE   CODE_0F858E         ;
                    JMP.w CODE_0F860E         ;

CODE_0F858E:        LDA.l $7ED000,x           ;
                    BNE   CODE_0F85AE         ;
                    LDA.b #$36                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$35                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED011,x           ;
                    BRA   CODE_0F85E4         ;

CODE_0F85AE:        CMP.b #$18                ;
                    BEQ   CODE_0F85CC         ;
                    LDA.b #$3A                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$39                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED011,x           ;
                    BRA   CODE_0F85E4         ;

CODE_0F85CC:        LDA.b #$36                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$35                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$41                ;
                    STA.l $7ED011,x           ;
CODE_0F85E4:        LDA.b #$47                ;
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
                    BNE   CODE_0F8585         ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    SEP   #$20                ;
                    JMP.w CODE_0F8585         ;

CODE_0F860E:        LDA.b #$42                ;
                    STA.l $7ED010,x           ;
                    LDA.b #$47                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$4E                ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED031,x           ;
                    LDA.l $7ED000,x           ;
                    BNE   CODE_0F8644         ;
                    LDA.b #$36                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$37                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$43                ;
                    STA.l $7ED011,x           ;
                    LDA.b #$49                ;
                    STA.l $7ED021,x           ;
                    BRA   CODE_0F865C         ;

CODE_0F8644:        LDA.b #$3A                ;
                    STA.l $7ED000,x           ;
                    LDA.b #$3B                ;
                    STA.l $7ED001,x           ;
                    LDA.b #$45                ;
                    STA.l $7ED011,x           ;
                    LDA.b #$4A                ;
                    STA.l $7ED021,x           ;
CODE_0F865C:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    INC.b $EB                 ;
                    LDX.b $EB                 ;
                    STX.b $E2                 ;
                    LDA.b $EF                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $87FF,y             ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0F8671:        LDA.w $B46D,y             ;
                    BEQ   CODE_0F8685         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0F86A9         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_0F8699         ;
                    LDA.w $B46D,y             ;
                    STA.l $7ED000,x           ;
CODE_0F8685:        INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0F8695         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0F8695:        SEP   #$20                ;
                    BRA   CODE_0F8671         ;

CODE_0F8699:        REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E2                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    BRA   CODE_0F8671         ;

CODE_0F86A9:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    INX                       ;
                    BRA   CODE_0F86C5         ;

                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    BRA   CODE_0F86C5         ;

                    INC.b $EB                 ;
                    LDX.b $EB                 ;
CODE_0F86C5:        STX.b $E2                 ;
                    LDA.b $EF                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $881F,y             ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0F86D1:        LDA.w $B52C,y             ;
                    BEQ   CODE_0F86E5         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0F8709         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_0F86F9         ;
                    LDA.w $B52C,y             ;
                    STA.l $7ED000,x           ;
CODE_0F86E5:        INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0F86F5         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0F86F5:        SEP   #$20                ;
                    BRA   CODE_0F86D1         ;

CODE_0F86F9:        REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E2                 ;
                    TAX                       ;
                    SEP   #$20                ;
                    INY                       ;
                    BRA   CODE_0F86D1         ;

CODE_0F8709:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDX.b $EB                 ;
                    STX.b $E2                 ;
                    LDA.b $EF                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $8833,y             ;
                    TAY                       ;
                    SEP   #$20                ;
CODE_0F871C:        LDA.w $AE92,y             ;
                    BEQ   CODE_0F872D         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0F8759         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_0F8741         ;
                    STA.l $7ED000,x           ;
CODE_0F872D:        INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0F873D         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0F873D:        SEP   #$20                ;
                    BRA   CODE_0F871C         ;

CODE_0F8741:        REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.b $E2                 ;
                    TAX                       ;
                    AND.w #$00F0              ;
                    CMP.w #$00F0              ;
                    BEQ   CODE_0F8759         ;
                    SEP   #$20                ;
                    INY                       ;
                    BRA   CODE_0F871C         ;

CODE_0F8759:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

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
                    LDA.w $92E2,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $92E3,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $92E4,y             ;
                    STA.l $7ED010,x           ;
                    LDA.w $92E5,y             ;
                    STA.l $7ED011,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $04,$05,$0B,$0C,$0B,$0C

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $8793               ;
                    STA.l $7ED000,x           ;
                    LDA.w $8794               ;
                    STA.l $7ED001,x           ;
                    LDA.w $8795               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8796               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8797               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8798               ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $8793               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8794               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8795               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8796               ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

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

                    LDY.w $8851               ;
                    LDA.b $EB                 ;
                    TAX                       ;
                    INX                       ;
                    INX                       ;
                    BRA   CODE_0F88BF         ;

                    LDY.w $8853               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0012              ;
                    TAX                       ;
                    BRA   CODE_0F88BF         ;

                    LDY.w $8855               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0001              ;
                    TAX                       ;
                    BRA   CODE_0F88BF         ;

                    LDY.w $8857               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0011              ;
                    TAX                       ;
                    BRA   CODE_0F88BF         ;

                    LDY.w $8859               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    BRA   CODE_0F88BF         ;

                    LDY.w $885B               ;
                    LDX.b $EB                 ;
                    INX                       ;
                    BRA   CODE_0F88BF         ;

                    LDY.w $885D               ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0012              ;
                    TAX                       ;
                    BRA   CODE_0F88BF         ;

                    INC.b $EB                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    BRA   CODE_0F88BC         ;

                    INC.b $EB                 ;
                    LDX.b $EB                 ;
CODE_0F88BC:        LDY.w #$0000              ;
CODE_0F88BF:        STX.b $E2                 ;
                    SEP   #$20                ;
CODE_0F88C3:        LDA.w $B2EF,y             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0F893B         ;
                    CMP.b #$FE                ;
                    BEQ   CODE_0F8916         ;
                    JSR.w CODE_0F88E9         ;
                    STA.l $7ED000,x           ;
                    INY                       ;
                    INX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0F88E5         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0F88E5:        SEP   #$20                ;
                    BRA   CODE_0F88C3         ;

CODE_0F88E9:        STA.b $E4                 ;
                    CMP.b #$12                ;
                    BNE   CODE_0F88F2         ;
                    JMP.w CODE_0F8940         ;

CODE_0F88F2:        CMP.b #$03                ;
                    BNE   CODE_0F88F9         ;
                    JMP.w CODE_0F896D         ;

CODE_0F88F9:        CMP.b #$04                ;
                    BNE   CODE_0F8900         ;
                    JMP.w CODE_0F897A         ;

CODE_0F8900:        CMP.b #$05                ;
                    BNE   CODE_0F8907         ;
                    JMP.w CODE_0F898F         ;

CODE_0F8907:        CMP.b #$18                ;
                    BNE   CODE_0F890E         ;
                    JMP.w CODE_0F89A4         ;

CODE_0F890E:        CMP.b #$07                ;
                    BNE   CODE_0F8915         ;
                    JMP.w CODE_0F89C1         ;

CODE_0F8915:        RTS                       ;

CODE_0F8916:        INY                       ;
                    REP   #$20                ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    AND.w #$00F0              ;
                    BEQ   CODE_0F893B         ;
                    DEX                       ;
                    TXA                       ;
                    AND.w #$000F              ;
                    CMP.w #$000F              ;
                    BNE   CODE_0F8935         ;
                    TXA                       ;
                    SEC                       ;
                    SBC.w #$00F0              ;
                    TAX                       ;
CODE_0F8935:        STX.b $E2                 ;
                    SEP   #$20                ;
                    BRA   CODE_0F88C3         ;

CODE_0F893B:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

CODE_0F8940:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0F896A         ;
                    CMP.b #$18                ;
                    BNE   CODE_0F894E         ;
                    LDA.b #$02                ;
                    BRA   CODE_0F896C         ;

CODE_0F894E:        CMP.b #$06                ;
                    BNE   CODE_0F8956         ;
                    LDA.b #$11                ;
                    BRA   CODE_0F896C         ;

CODE_0F8956:        CMP.b #$16                ;
                    BNE   CODE_0F895E         ;
                    LDA.b #$01                ;
                    BRA   CODE_0F896C         ;

CODE_0F895E:        CMP.b #$05                ;
                    BNE   CODE_0F8966         ;
                    LDA.b #$62                ;
                    BRA   CODE_0F896C         ;

CODE_0F8966:        LDA.b #$10                ;
                    BRA   CODE_0F896C         ;

CODE_0F896A:        LDA.b $E4                 ;
CODE_0F896C:        RTS                       ;

CODE_0F896D:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0F8977         ;
                    LDA.b #$36                ;
                    BRA   CODE_0F8979         ;

CODE_0F8977:        LDA.b $E4                 ;
CODE_0F8979:        RTS                       ;

CODE_0F897A:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0F898C         ;
                    CMP.b #$12                ;
                    BNE   CODE_0F8988         ;
                    LDA.b #$14                ;
                    BRA   CODE_0F898E         ;

CODE_0F8988:        LDA.b #$37                ;
                    BRA   CODE_0F898E         ;

CODE_0F898C:        LDA.b $E4                 ;
CODE_0F898E:        RTS                       ;

CODE_0F898F:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0F89A1         ;
                    CMP.b #$13                ;
                    BNE   CODE_0F899D         ;
                    LDA.b #$15                ;
                    BRA   CODE_0F89A3         ;

CODE_0F899D:        LDA.b #$38                ;
                    BRA   CODE_0F89A3         ;

CODE_0F89A1:        LDA.b $E4                 ;
CODE_0F89A3:        RTS                       ;

CODE_0F89A4:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0F89BE         ;
                    CMP.b #$16                ;
                    BNE   CODE_0F89B2         ;
                    LDA.b #$1E                ;
                    BRA   CODE_0F89C0         ;

CODE_0F89B2:        CMP.b #$13                ;
                    BNE   CODE_0F89BA         ;
                    LDA.b #$1E                ;
                    BRA   CODE_0F89C0         ;

CODE_0F89BA:        LDA.b #$1D                ;
                    BRA   CODE_0F89C0         ;

CODE_0F89BE:        LDA.b $E4                 ;
CODE_0F89C0:        RTS                       ;

CODE_0F89C1:        LDA.l $7ED000,x           ;
                    BEQ   CODE_0F89E3         ;
                    CMP.b #$16                ;
                    BNE   CODE_0F89CF         ;
                    LDA.b #$0E                ;
                    BRA   CODE_0F89E5         ;

CODE_0F89CF:        CMP.b #$04                ;
                    BNE   CODE_0F89D7         ;
                    LDA.b #$70                ;
                    BRA   CODE_0F89E5         ;

CODE_0F89D7:        CMP.b #$0B                ;
                    BNE   CODE_0F89DF         ;
                    LDA.b #$90                ;
                    BRA   CODE_0F89E5         ;

CODE_0F89DF:        LDA.b #$49                ;
                    BRA   CODE_0F89E5         ;

CODE_0F89E3:        LDA.b $E4                 ;
CODE_0F89E5:        RTS                       ;

                    db $00,$00,$90,$91,$92,$93,$00,$00
                    db $94,$95,$96,$97,$00,$00,$98,$99
                    db $9A,$9B,$00,$9C,$9D,$9E,$9F,$A0
                    db $00,$A1,$A2,$A3,$A4,$A5,$00,$A6
                    db $A7,$A8,$A9,$AA

                    SEP   #$20                ;
                    LDX.b $EB                 ;
                    LDY.w #$0000              ;
CODE_0F8A11:        PHX                       ;
                    LDA.w $89E6,y             ;
                    STA.l $7ED020,x           ;
                    JSR.w CODE_0F8A66         ;
                    LDA.w $89E7,y             ;
                    STA.l $7ED020,x           ;
                    JSR.w CODE_0F8A66         ;
                    LDA.w $89E8,y             ;
                    STA.l $7ED020,x           ;
                    JSR.w CODE_0F8A66         ;
                    LDA.w $89E9,y             ;
                    STA.l $7ED020,x           ;
                    JSR.w CODE_0F8A66         ;
                    LDA.w $89EA,y             ;
                    STA.l $7ED020,x           ;
                    JSR.w CODE_0F8A66         ;
                    LDA.w $89EB,y             ;
                    STA.l $7ED020,x           ;
                    PLX                       ;
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
                    BNE   CODE_0F8A11         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

CODE_0F8A66:        REP   #$20                ;
                    INX                       ;
                    TXA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0F8A75         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
CODE_0F8A75:        SEP   #$20                ;
                    RTS                       ;

                    LDX.b $EB                 ;
                    SEP   #$20                ;
CODE_0F8A7C:        LDA.b #$09                ;
                    STA.l $7ED020,x           ;
                    LDA.b #$0B                ;
                    STA.l $7ED021,x           ;
                    INX                       ;
                    INX                       ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_0F8A7C         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDX.b $EB                 ;
                    SEP   #$20                ;
CODE_0F8A99:        LDA.l $7ED020,x           ;
                    CMP.b #$09                ;
                    BNE   CODE_0F8AA5         ;
                    LDA.b #$0A                ;
                    BRA   CODE_0F8AA7         ;

CODE_0F8AA5:        LDA.b #$04                ;
CODE_0F8AA7:        STA.l $7ED020,x           ;
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
                    BPL   CODE_0F8A99         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDX.b $EB                 ;
                    SEP   #$20                ;
CODE_0F8ACA:        LDA.l $7ED021,x           ;
                    CMP.b #$0B                ;
                    BNE   CODE_0F8AD6         ;
                    LDA.b #$0A                ;
                    BRA   CODE_0F8AD8         ;

CODE_0F8AD6:        LDA.b #$04                ;
CODE_0F8AD8:        STA.l $7ED021,x           ;
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
                    BPL   CODE_0F8ACA         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $7A,$7B,$61,$62,$8C,$8D,$90,$91
                    db $92

                    LDX.b $EB                 ;
                    LDA.w #$0006              ;
                    STA.b $F1                 ;
                    SEP   #$20                ;
                    LDA.w $8AF7               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8AF8               ;
                    STA.l $7ED021,x           ;
CODE_0F8B17:        LDA.w $8AF9               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8AFA               ;
                    STA.l $7ED031,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BNE   CODE_0F8B17         ;
                    LDA.w $8AFB               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8AFC               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8AFD               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8AFE               ;
                    STA.l $7ED041,x           ;
                    LDA.w $8AFF               ;
                    STA.l $7ED042,x           ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                 db $70,$71,$72,$73,$74,$75,$76,$77
                    db $78,$79,$7A,$7B,$00,$7C,$7D,$00

                    LDX.b $EB                 ;
                    INX                       ;
                    SEP   #$20                ;
                    STZ.b $E5                 ;
                    LDY.w #$0000              ;
CODE_0F8B77:        LDA.w $8B5D,y             ;
                    STA.l $7ED000,x           ;
                    LDA.w $8B5E,y             ;
                    STA.l $7ED001,x           ;
                    LDA.w $8B5F,y             ;
                    STA.l $7ED002,x           ;
                    LDA.w $8B60,y             ;
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
                    BNE   CODE_0F8B77         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                 db $2F,$30,$31,$32,$35,$36,$3A,$3B

                    SEP   #$20                ;
                    LDY.w #$0000              ;
                    LDX.b $EB                 ;
CODE_0F8BC1:        LDA.w $8BB2,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8BB3,y             ;
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
                    BNE   CODE_0F8BC1         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $01,$1F,$02,$20

CODE_0F8BE9:        SEP   #$20                ;
                    LDX.b $EB                 ;
                    LDY.b $EF                 ;
CODE_0F8BEF:        LDA.w $8BE5,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8BE7,y             ;
                    STA.l $7ED021,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_0F8BEF         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $08,$09,$05,$06,$07,$05,$03,$04
                    db $05,$0F,$10,$11,$16,$17,$12,$1D
                    db $09,$1E,$06,$07,$05

                    SEP   #$20                ;
                    LDX.b $EB                 ;
CODE_0F8C2B:        TXA                       ;
                    AND.b #$F0                ;
                    BEQ   CODE_0F8C4F         ;
                    LDA.l $7ED020,x           ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0F8C7B         ;
                    LDA.w $8C12               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8C13               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8C14               ;
                    STA.l $7ED022,x           ;
                    BRA   CODE_0F8C64         ;

CODE_0F8C4F:        LDA.w $8C18               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8C19               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8C1A               ;
                    STA.l $7ED022,x           ;
CODE_0F8C64:        LDA.w $8C15               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8C16               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8C17               ;
                    STA.l $7ED032,x           ;
                    BRA   CODE_0F8CDB         ;

CODE_0F8C7B:        LDA.w $8C1B               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8C1C               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8C1D               ;
                    STA.l $7ED022,x           ;
                    LDA.w $8C1E               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8C1F               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8C20               ;
                    STA.l $7ED032,x           ;
                    LDA.w $8C21               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8C22               ;
                    STA.l $7ED041,x           ;
                    LDA.w $8C23               ;
                    STA.l $7ED042,x           ;
                    LDA.w $8C24               ;
                    STA.l $7ED050,x           ;
                    LDA.w $8C25               ;
                    STA.l $7ED051,x           ;
                    LDA.w $8C26               ;
                    STA.l $7ED052,x           ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
CODE_0F8CDB:        REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
                    SEP   #$20                ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BMI   CODE_0F8CEE         ;
                    JMP.w CODE_0F8C2B         ;

CODE_0F8CEE:        REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $0C,$18,$19,$0A,$0B,$0D,$0E,$13
                    db $14,$1A,$1B

                    SEP   #$20                ;
                    LDX.b $EB                 ;
CODE_0F8D02:        LDA.l $7ED020,x           ;
                    CMP.b #$1F                ;
                    BNE   CODE_0F8D47         ;
                    LDA.w $8CF6               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8CF7               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8CF8               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8CF9               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8CFA               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8CFB               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8CFC               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8CFD               ;
                    STA.l $7ED041,x           ;
                    INX                       ;
                    DEC.b $F1                 ;
                    BRA   CODE_0F8D5C         ;

CODE_0F8D47:        LDA.w $8CF3               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8CF4               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8CF5               ;
                    STA.l $7ED040,x           ;
CODE_0F8D5C:        INX                       ;
                    DEC.b $F1                 ;
                    LDA.b $F1                 ;
                    BPL   CODE_0F8D02         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    db $33,$34,$0D,$37,$13,$3C,$1A,$1B
                    db $33,$34,$38,$39,$3D,$3E,$40,$1B

                    LDX.b $EB                 ;
                    SEP   #$20                ;
                    LDA.l $7ED020,x           ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0F8DBE         ;
                    LDA.w $8D70               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8D71               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8D72               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8D73               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8D74               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8D75               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8D76               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8D77               ;
                    STA.l $7ED041,x           ;
                    BRA   CODE_0F8DF6         ;

CODE_0F8DBE:        LDA.w $8D68               ;
                    STA.l $7ED010,x           ;
                    LDA.w $8D69               ;
                    STA.l $7ED011,x           ;
                    LDA.w $8D6A               ;
                    STA.l $7ED020,x           ;
                    LDA.w $8D6B               ;
                    STA.l $7ED021,x           ;
                    LDA.w $8D6C               ;
                    STA.l $7ED030,x           ;
                    LDA.w $8D6D               ;
                    STA.l $7ED031,x           ;
                    LDA.w $8D6E               ;
                    STA.l $7ED040,x           ;
                    LDA.w $8D6F               ;
                    STA.l $7ED041,x           ;
CODE_0F8DF6:        REP   #$20                ;
                    DEC.b $F1                 ;
                    DEC.b $F1                 ;
                    DEC.b $F1                 ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0030              ;
                    STA.b $EB                 ;
                    LDA.w #$0001              ;
                    STA.b $EF                 ;
                    JMP.w CODE_0F8BE9         ;

                    db $41,$42,$43,$44,$45,$46,$47,$48
                    db $49,$4A,$4B,$4C,$4D,$4E,$4F,$50
                    db $51,$52,$53,$54

                    SEP   #$20                ;
                    LDX.b $EB                 ;
                    LDY.w #$0000              ;
CODE_0F8E29:        LDA.w $8E0E,y             ;
                    STA.l $7ED020,x           ;
                    LDA.w $8E0F,y             ;
                    STA.l $7ED021,x           ;
                    LDA.w $8E10,y             ;
                    STA.l $7ED022,x           ;
                    LDA.w $8E11,y             ;
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
                    BNE   CODE_0F8E29         ;
                    REP   #$20                ;
                    JMP.w CODE_0F8084         ;

                    LDX.b $EB                 ;
                    LDA.w #$1B1A              ;
                    STA.l $7ED000,x           ;
                    JMP.w CODE_0F8084         ;

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
                    JMP.w CODE_0F8084         ;

                    dw $8E99
                    dw $8EE1
                    dw $8EED
                    dw $8F1D

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

CODE_0F8F1D:        LDA.b $5C                 ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w #$0F00              ;
                    STA.b $D9                 ;
                    LDA.w $8E91,x             ;
                    STA.b $D8                 ;
                    LDA.b $5C                 ;
                    AND.w #$00FF              ;
                    CMP.w #$0002              ;
                    BCS   CODE_0F8F41         ;
                    LDA.b $EB                 ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    BRA   CODE_0F8F43         ;

CODE_0F8F41:        LDX.b $EB                 ;
CODE_0F8F43:        LDA.b $EF                 ;
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
                    BPL   CODE_0F8F43         ;
                    RTS                       ;

CODE_0F8F74:        STA.l $7ED000,x           ;
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
                    STA.l $7EDF00,x           ;
                    RTS                       ;

CODE_0F8FB5:        LDA.b $EF                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $8FC1,x             ;
                    STA.b $00                 ;
                    JMP.w ($0000)             ;

                    dw CODE_0F9152
                    dw CODE_0F9156
                    dw CODE_0F917F
                    dw CODE_0F9196
                    dw CODE_0F91BA
                    dw CODE_0F9135
                    dw CODE_0F90FB
                    dw CODE_0F90D9
                    dw CODE_0F90A0
                    dw CODE_0F9096
                    dw CODE_0F9033
                    dw CODE_0F91C3
                    dw CODE_0F900B

                    db $0C,$0D,$0E,$0F,$0C,$0D,$0E,$0F
                    db $0C,$0D,$0E,$0F,$0C,$0D,$0E,$0F
                    db $13,$14,$15,$16,$13,$14,$15,$16
                    db $13,$14,$15,$16,$13,$14,$15,$16
                    db $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A
                    db $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A

CODE_0F900B:        LDX.w #$00D0              ;
                    LDY.w #$0000              ;
                    SEP   #$20                ;
CODE_0F9013:        LDA.w $8FDB,y             ;
                    JSR.w CODE_0F8F74         ;
                    INX                       ;
                    INY                       ;
                    CPY.w #$0030              ;
                    BNE   CODE_0F9013         ;
                    REP   #$20                ;
                    RTS                       ;

                    db $01,$02,$03,$07,$01,$02,$03,$07
                    db $01,$02,$03,$07,$01,$02,$03,$07

CODE_0F9033:        STZ.b $E4                 ;
CODE_0F9035:        LDA.b $E4                 ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    CLC                       ;
                    ADC.w #$00A0              ;
                    TAX                       ;
                    LDY.w #$0000              ;
                    SEP   #$20                ;
CODE_0F9045:        LDA.w $9023,y             ;
                    STA.l $7ED000,x           ;
                    TXA                       ;
                    AND.b #$01                ;
                    BNE   CODE_0F906B         ;
                    LDA.b #$0C                ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED050,x           ;
                    LDA.b #$10                ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED040,x           ;
                    BRA   CODE_0F9083         ;

CODE_0F906B:        LDA.b #$0D                ;
                    STA.l $7ED010,x           ;
                    STA.l $7ED030,x           ;
                    STA.l $7ED050,x           ;
                    LDA.b #$11                ;
                    STA.l $7ED020,x           ;
                    STA.l $7ED040,x           ;
CODE_0F9083:        INX                       ;
                    INY                       ;
                    TYA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_0F9045         ;
                    REP   #$20                ;
                    INC.b $E4                 ;
                    LDA.b $E4                 ;
                    CMP.w #$0008              ;
                    BNE   CODE_0F9035         ;
                    RTS                       ;

CODE_0F9096:        SEP   #$20                ;
                    LDA.b $F1                 ;
                    STA.w $0EDC               ;
                    REP   #$20                ;
                    RTS                       ;

CODE_0F90A0:        LDX.w #$0080              ;
CODE_0F90A3:        LDA.w #$0403              ;
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
                    BNE   CODE_0F90A3         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$00F0              ;
                    TAX                       ;
                    CPX.w #$1000              ;
                    BCC   CODE_0F90A3         ;
                    RTS                       ;

CODE_0F90D9:        LDX.w #$0000              ;
                    LDA.w #$0202              ;
CODE_0F90DF:        JSR.w CODE_0F8F74         ;
                    INX                       ;
                    INX                       ;
                    CPX.w #$0020              ;
                    BNE   CODE_0F90DF         ;
                    LDA.w #$0101              ;
CODE_0F90EC:        JSR.w CODE_0F8F74         ;
                    INX                       ;
                    INX                       ;
                    CPX.w #$0030              ;
                    BNE   CODE_0F90EC         ;
                    RTS                       ;

                    db $03,$05,$1D,$02

CODE_0F90FB:        LDX.w #$0000              ;
                    SEP   #$20                ;
CODE_0F9100:        LDA.w $90F7               ;
                    STA.l $7ED000,x           ;
                    LDA.w $90F8               ;
                    STA.l $7ED001,x           ;
                    LDA.w $90F9               ;
                    STA.l $7ED010,x           ;
                    LDA.w $90FA               ;
                    STA.l $7ED011,x           ;
                    INX                       ;
                    INX                       ;
                    TXA                       ;
                    AND.b #$0F                ;
                    BNE   CODE_0F9100         ;
                    REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    TAX                       ;
                    SEP   #$20                ;
                    CPX.w #$0800              ;
                    BNE   CODE_0F9100         ;
                    REP   #$20                ;
                    RTS                       ;

CODE_0F9135:        SEP   #$20                ;
                    LDA.b $5C                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_0F9141         ;
                    LDA.b #$5F                ;
                    BRA   CODE_0F9143         ;

CODE_0F9141:        LDA.b #$00                ;
CODE_0F9143:        LDX.w #$0000              ;
CODE_0F9146:        JSR.w CODE_0F8F74         ;
                    INX                       ;
                    CPX.w #$0020              ;
                    BNE   CODE_0F9146         ;
                    REP   #$20                ;
                    RTS                       ;

CODE_0F9152:        INC.w $0EC0               ;
                    RTS                       ;

CODE_0F9156:        SEP   #$30                ;
                    LDA.w $075F               ;\If current world is not world 2
                    CMP.b #$01                ; |
                    BNE   CODE_0F9169         ;/branch
                    LDA.b $5C                 ;\
                    CMP.b #$02                ; |If current world is world 2, and map type is underground
                    BEQ   CODE_0F9169         ;/branch
                    LDA.b #$01                ;
                    BRA   CODE_0F9171         ;

CODE_0F9169:        LDA.b $F1                 ;
                    CMP.b #$02                ;
                    BNE   CODE_0F9171         ;
                    LDA.b #$FF                ;
CODE_0F9171:        CMP.b #$01                ;
                    BNE   CODE_0F9178         ;
                    STA.w $0ED1               ;
CODE_0F9178:        JSL.l CODE_04825E         ;
                    REP   #$30                ;
                    RTS                       ;

CODE_0F917F:        SEP   #$30                ;
                    LDA.b #$02                ;
                    JSL.l CODE_04825E         ;
                    REP   #$30                ;
                    RTS                       ;

                    db $0F,$20,$1B,$37,$58,$C9,$1F,$29
                    db $1C,$38,$57,$CA

CODE_0F9196:        LDX.w #$00D0              ;
                    LDY.b $F1                 ;
                    LDA.w $918A,y             ;
CODE_0F919E:        JSR.w CODE_0F8F74         ;
                    INX                       ;
                    CPX.w #$00E0              ;
                    BNE   CODE_0F919E         ;
                    LDA.w $9190,y             ;
CODE_0F91AA:        JSR.w CODE_0F8F74         ;
                    INX                       ;
                    CPX.w #$00F0              ;
                    BNE   CODE_0F91AA         ;
                    LDA.w #$0050              ;
                    JSR.w CODE_0F8F74         ;
                    RTS                       ;

CODE_0F91BA:        LDA.b $F1                 ;
                    STA.b $99                 ;
                    JSL.l CODE_0FF027         ;
                    RTS                       ;

CODE_0F91C3:        LDA.b $F1                 ;
                    ORA.w #$0010              ;
                    STA.b $99                 ;
                    JSL.l CODE_0FF027         ;
                    RTS                       ;

CODE_0F91CF:        LDA.b $DB                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $923C,x             ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $92CC,x             ;
                    STA.b $00                 ;
                    LDA.w #$000F              ;
                    STA.b $02                 ;
                    LDX.w #$0000              ;
                    LDY.w #$0000              ;
CODE_0F91E8:        STX.b $E4                 ;
                    TYX                       ;
                    LDA.l $7ED000,x           ;
                    CMP.w #$FFFF              ;
                    BEQ   CODE_0F9233         ;
                    PHY                       ;
                    LDX.b $E4                 ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b [$00],y             ;
                    STA.l $7E2000,x           ;
                    INY                       ;
                    INY                       ;
                    LDA.b [$00],y             ;
                    STA.l $7E2002,x           ;
                    INY                       ;
                    INY                       ;
                    LDA.b [$00],y             ;
                    STA.l $7E2040,x           ;
                    INY                       ;
                    INY                       ;
                    LDA.b [$00],y             ;
                    STA.l $7E2042,x           ;
                    PLY                       ;
                    INY                       ;
                    TYA                       ;
                    AND.w #$000F              ;
                    BNE   CODE_0F922A         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0040              ;
                    TAX                       ;
CODE_0F922A:        INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPY.w #$1200              ;
                    BNE   CODE_0F91E8         ;
CODE_0F9233:        SEP   #$30                ;
                    PLB                       ;
                    LDA.w $0F35               ;
                    STA.b $DB                 ;
                    RTL                       ;

                    db $03,$00,$03,$00,$03,$00,$03,$00
                    db $03,$00,$03,$00,$03,$00,$05,$00
                    db $01,$00,$01,$00,$03,$00,$03,$00
                    db $03,$00,$05,$00,$01,$00,$08,$00
                    db $04,$00,$04,$00,$04,$00,$01,$00
                    db $08,$00,$01,$00,$01,$00,$01,$00
                    db $08,$00,$01,$00,$08,$00,$01,$00
                    db $0A,$00,$04,$00,$04,$00,$04,$00
                    db $01,$00,$01,$00,$08,$00,$01,$00
                    db $07,$00,$01,$00,$01,$00,$01,$00
                    db $01,$00,$01,$00,$01,$00,$01,$00
                    db $0A,$00,$01,$00,$08,$00,$04,$00
                    db $04,$00,$04,$00,$01,$00,$01,$00
                    db $06,$00,$01,$00,$01,$00,$02,$00
                    db $02,$00,$01,$00,$02,$00,$01,$00
                    db $02,$00,$01,$00,$00,$00,$00,$00
                    db $00,$00,$09,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$01,$00
                    db $2A,$9B,$2A,$9D,$12,$AD,$12,$A7
                    db $62,$A4,$2A,$98,$62,$96,$EA,$95
                    db $4A,$95,$C2,$A5,$A2,$93,$00,$00
                    db $00,$11,$00,$00,$00,$1F,$00,$00
                    db $00,$0C,$00,$12,$00,$00,$08,$00
                    db $00,$00,$00,$00,$04,$00,$10,$00
                    db $00,$00,$0D,$00,$00,$00,$00,$00
                    db $0A,$00,$1E,$00,$00,$00,$00,$00
                    db $1F,$00,$17,$00,$00,$00,$00,$00
                    db $00,$19,$12,$0C,$00,$00,$1B,$00
                    db $00,$00,$00,$12,$00,$00,$00,$00
                    db $00,$09,$00,$2A,$00,$00,$00,$00
                    db $16,$00,$00,$00,$1B,$00,$00,$00
                    db $00,$16,$08,$00,$00,$00,$00,$17
                    db $00,$00,$00,$19,$00,$00,$00,$00
                    db $0F,$00,$00,$14,$00,$00,$00,$1B
                    db $00,$00,$11,$00,$00,$00,$00,$06
                    db $00,$00,$0D,$00,$00,$00,$00,$07
                    db $00,$00,$00,$00,$00,$12,$00,$08
                    db $00,$00,$00,$00,$12,$00,$00,$0C
                    db $00,$00,$16,$00,$00,$00,$00,$12
                    db $00,$00,$00,$00,$00,$04,$00,$13
                    db $00,$00,$19,$00,$00,$00,$00,$17
                    db $00,$00,$00,$00,$1B,$00,$00,$00
                    db $00,$16,$1C,$00,$00,$00,$00,$00
                    db $1E,$00,$00,$15,$00,$00,$00,$00
                    db $02,$00,$01,$00,$00,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $E0,$1D,$24,$00,$F0,$1D,$E1,$1D
                    db $24,$00,$F0,$5D,$24,$00,$C2,$1D
                    db $C3,$1D,$D2,$1D,$D3,$1D,$C4,$1D
                    db $C5,$1D,$D4,$1D,$D5,$1D,$24,$00
                    db $E3,$1D,$24,$00,$F3,$1D,$E4,$1D
                    db $24,$00,$F4,$1D,$24,$00,$CA,$1D
                    db $CB,$1D,$F1,$1D,$F1,$5D,$C0,$1D
                    db $C1,$1D,$24,$00,$E2,$1D,$D0,$1D
                    db $D1,$1D,$F2,$1D,$24,$00,$C6,$1D
                    db $C7,$1D,$D6,$1D,$D7,$1D,$E6,$1D
                    db $E7,$1D,$F6,$1D,$F7,$1D,$EB,$1D
                    db $EC,$1D,$FB,$1D,$FC,$1D,$ED,$1D
                    db $24,$00,$FD,$1D,$FE,$1D,$24,$00
                    db $24,$00,$FF,$1D,$F8,$1D,$24,$00
                    db $EA,$1D,$F9,$1D,$FA,$1D,$C8,$1D
                    db $C1,$1D,$FD,$1D,$E2,$1D,$D0,$1D
                    db $D1,$1D,$F2,$1D,$F8,$1D,$E5,$1D
                    db $F5,$1D,$D9,$1D,$DA,$1D,$CE,$1D
                    db $CF,$1D,$EF,$1D,$EF,$1D,$DC,$1D
                    db $DD,$1D,$EF,$1D,$EF,$1D,$DE,$1D
                    db $DF,$1D,$EF,$1D,$EF,$1D,$CC,$1D
                    db $CD,$1D,$EF,$1D,$EF,$1D,$DC,$1D
                    db $E3,$1D,$EF,$1D,$F3,$1D,$E4,$1D
                    db $DF,$1D,$F4,$1D,$EF,$1D,$E8,$1D
                    db $E9,$1D,$DB,$1D,$EE,$1D,$EF,$1D
                    db $EF,$1D,$EF,$1D,$EF,$1D,$C9,$1D
                    db $C1,$1D,$EF,$1D,$E2,$1D,$D0,$1D
                    db $D8,$1D,$F2,$1D,$EF,$1D,$E6,$1D
                    db $E7,$1D,$D9,$1D,$DA,$1D,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $E0,$15,$24,$00,$F0,$15,$E1,$15
                    db $24,$00,$F0,$55,$24,$00,$C2,$15
                    db $C3,$15,$D2,$15,$D3,$15,$C4,$15
                    db $C5,$15,$D4,$15,$D5,$15,$24,$00
                    db $E3,$15,$24,$00,$F3,$15,$E4,$15
                    db $24,$00,$F4,$15,$24,$00,$C0,$15
                    db $C1,$15,$24,$00,$E2,$15,$D0,$15
                    db $D1,$15,$F2,$15,$24,$00,$C2,$15
                    db $C3,$15,$24,$00,$D3,$15,$C4,$15
                    db $C5,$15,$D4,$15,$24,$00,$CA,$15
                    db $CB,$15,$F1,$15,$F1,$55,$C6,$15
                    db $C7,$15,$D6,$15,$D7,$15,$C8,$15
                    db $C1,$15,$FD,$15,$E2,$15,$D0,$15
                    db $D1,$15,$F2,$15,$F8,$15,$E6,$15
                    db $E7,$15,$D9,$15,$DA,$15,$DC,$15
                    db $E3,$15,$EF,$15,$F3,$15,$E4,$15
                    db $DF,$15,$F4,$15,$EF,$15,$E8,$15
                    db $E9,$15,$DB,$15,$EE,$15,$C9,$15
                    db $C1,$15,$EF,$15,$E2,$15,$D0,$15
                    db $D8,$15,$F2,$15,$EF,$15,$E6,$15
                    db $E7,$15,$F6,$15,$F7,$15,$E5,$15
                    db $F5,$15,$D9,$15,$DA,$15,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$D0,$1D,$D1,$1D,$24,$00
                    db $24,$00,$D2,$1D,$D3,$1D,$24,$00
                    db $C5,$1D,$D4,$1D,$D5,$1D,$24,$00
                    db $24,$00,$C1,$1D,$C2,$1D,$24,$00
                    db $24,$00,$FE,$1D,$FF,$1D,$24,$00
                    db $24,$00,$C0,$1D,$D1,$1D,$C6,$1D
                    db $C7,$1D,$D6,$1D,$D7,$1D,$24,$00
                    db $24,$00,$D2,$1D,$C3,$1D,$24,$00
                    db $24,$00,$CA,$1C,$CB,$1C,$C6,$1D
                    db $C7,$1D,$C4,$1D,$D7,$1D,$24,$00
                    db $24,$00,$FF,$1D,$FE,$1D,$E8,$1D
                    db $E9,$1D,$F8,$1D,$F9,$1D,$EA,$1D
                    db $EB,$1D,$FA,$1D,$FB,$1D,$E0,$1D
                    db $E1,$1D,$F0,$1D,$F1,$1D,$E4,$1D
                    db $E5,$1D,$F4,$1D,$F5,$1D,$C8,$1D
                    db $C9,$1D,$D8,$1D,$D9,$1D,$CA,$1D
                    db $CB,$1D,$DA,$1D,$DB,$1D,$E2,$1D
                    db $E3,$1D,$F2,$1D,$F3,$1D,$E6,$1D
                    db $E7,$1D,$F6,$1D,$F7,$1D,$24,$00
                    db $24,$00,$24,$00,$24,$00,$C4,$1D
                    db $C5,$1D,$D4,$1D,$D5,$1D,$C0,$1D
                    db $C1,$1D,$D0,$1D,$D1,$1D,$C6,$1D
                    db $C7,$1D,$D6,$1D,$D7,$1D,$C8,$1D
                    db $C9,$1D,$D8,$1D,$D9,$1D,$D2,$1D
                    db $D3,$1D,$C2,$1D,$C3,$1D,$C2,$1D
                    db $C3,$1D,$C2,$1D,$C3,$1D,$CA,$1D
                    db $CB,$1D,$DA,$1D,$DB,$1D,$CC,$1D
                    db $CD,$1D,$DC,$1D,$DD,$1D,$CE,$1D
                    db $CF,$1D,$DE,$1D,$DF,$1D,$F2,$1D
                    db $F3,$1D,$E2,$1D,$E3,$1D,$E4,$1D
                    db $E5,$1D,$F4,$1D,$F5,$1D,$E2,$1D
                    db $E3,$1D,$E2,$1D,$E3,$1D,$E6,$1D
                    db $E7,$1D,$F6,$1D,$F7,$1D,$E0,$1D
                    db $E1,$1D,$F0,$1D,$F1,$1D,$24,$00
                    db $24,$00,$24,$00,$24,$00,$C0,$1D
                    db $C1,$1D,$CA,$1D,$D1,$1D,$C2,$1D
                    db $C3,$1D,$D2,$1D,$CB,$1D,$C2,$1D
                    db $C3,$1D,$D2,$1D,$D3,$1D,$C0,$1D
                    db $C1,$1D,$D0,$1D,$D1,$1D,$DA,$1D
                    db $E1,$1D,$D0,$1D,$D1,$1D,$E2,$1D
                    db $DB,$1D,$D2,$1D,$D3,$1D,$DA,$1D
                    db $E1,$1D,$CA,$1D,$D1,$1D,$E2,$1D
                    db $E1,$1D,$E4,$1D,$E5,$1D,$E2,$1D
                    db $E1,$1D,$D2,$1D,$D1,$1D,$E2,$1D
                    db $DB,$1D,$D2,$1D,$CB,$1D,$DA,$1D
                    db $E1,$1D,$EA,$1D,$D1,$1D,$F4,$1D
                    db $F5,$1D,$D8,$1D,$E8,$1D,$E2,$1D
                    db $DB,$1D,$D2,$1D,$EB,$1D,$C0,$1D
                    db $C1,$1D,$92,$1D,$D1,$1D,$E2,$1D
                    db $E3,$1D,$D2,$1D,$D1,$1D,$24,$00
                    db $24,$00,$24,$00,$24,$00,$FA,$1D
                    db $E1,$1D,$CC,$1D,$D1,$1D,$E2,$1D
                    db $FB,$1D,$D2,$1D,$CD,$1D,$A2,$1D
                    db $E1,$1D,$B2,$1D,$D1,$1D,$E2,$1D
                    db $E1,$1D,$D2,$1D,$C6,$1D,$C4,$1D
                    db $C5,$1D,$C7,$1D,$E7,$1D,$D4,$1D
                    db $D5,$1D,$E7,$1D,$C8,$1D,$E2,$1D
                    db $E3,$1D,$C9,$1D,$D1,$1D,$E2,$1D
                    db $E1,$1D,$D2,$1D,$82,$1D,$E2,$1D
                    db $E1,$1D,$83,$1D,$84,$1D,$E2,$1D
                    db $E1,$1D,$85,$1D,$80,$1D,$E2,$1D
                    db $E1,$1D,$81,$1D,$D1,$1D,$E2,$1D
                    db $E1,$1D,$C9,$1D,$D1,$1D,$E2,$1D
                    db $D6,$1D,$D2,$1D,$E6,$1D,$D7,$1D
                    db $E7,$1D,$D7,$1D,$E7,$1D,$E7,$1D
                    db $D7,$5D,$E7,$1D,$D7,$5D,$D9,$1D
                    db $E3,$1D,$E9,$1D,$D1,$1D,$E2,$1D
                    db $DC,$1D,$D2,$1D,$EC,$1D,$DD,$1D
                    db $DE,$1D,$ED,$1D,$EE,$1D,$DF,$1D
                    db $90,$1D,$EF,$1D,$A0,$1D,$91,$1D
                    db $E1,$1D,$A1,$1D,$D1,$1D,$A2,$1D
                    db $E3,$1D,$B2,$1D,$D1,$1D,$D9,$1D
                    db $E1,$1D,$E9,$1D,$D1,$1D,$E2,$1D
                    db $E1,$1D,$F0,$1D,$F1,$1D,$E2,$1D
                    db $E1,$1D,$F2,$1D,$F3,$1D,$E2,$1D
                    db $F6,$1D,$F0,$1D,$F1,$1D,$F7,$1D
                    db $CE,$1D,$F2,$1D,$F3,$1D,$CF,$1D
                    db $F8,$1D,$F0,$1D,$F1,$1D,$F9,$1D
                    db $E1,$1D,$F2,$1D,$F3,$1D,$E2,$1D
                    db $E3,$1D,$F0,$1D,$F1,$1D,$FA,$1D
                    db $E1,$1D,$F2,$1D,$F3,$1D,$E2,$1D
                    db $FC,$1D,$F0,$1D,$F1,$1D,$FD,$1D
                    db $FE,$1D,$F2,$1D,$F3,$1D,$FF,$1D
                    db $B0,$1D,$F0,$1D,$F1,$1D,$B1,$1D
                    db $E1,$1D,$F2,$1D,$F3,$1D,$E2,$1D
                    db $FB,$1D,$F0,$1D,$F1,$1D,$A2,$1D
                    db $E1,$1D,$F2,$1D,$F3,$1D,$E2,$1D
                    db $CB,$1D,$D2,$1D,$D3,$1D,$CA,$1D
                    db $E1,$1D,$D0,$1D,$D1,$1D,$86,$15
                    db $86,$15,$87,$15,$87,$15,$88,$15
                    db $88,$15,$88,$15,$88,$15,$34,$15
                    db $34,$15,$34,$15,$34,$15,$34,$15
                    db $36,$15,$34,$15,$36,$15,$37,$15
                    db $38,$15,$37,$15,$28,$15,$34,$15
                    db $09,$1D,$34,$15,$34,$15,$09,$1D
                    db $0A,$1D,$19,$1D,$1A,$1D,$0B,$1D
                    db $0C,$1D,$1B,$1D,$1C,$1D,$0C,$5D
                    db $0B,$5D,$1C,$5D,$1B,$5D,$0A,$5D
                    db $09,$5D,$1A,$5D,$19,$5D,$09,$15
                    db $0A,$15,$19,$15,$1A,$15,$0B,$15
                    db $0C,$15,$1B,$15,$1C,$15,$0C,$55
                    db $0B,$55,$1C,$55,$1B,$55,$0A,$55
                    db $09,$55,$1A,$55,$19,$55,$00,$15
                    db $01,$15,$10,$15,$11,$15,$BB,$1D
                    db $BC,$1D,$34,$1D,$88,$1D,$BD,$1D
                    db $BC,$1D,$89,$1D,$8C,$1D,$BD,$1D
                    db $BC,$1D,$8D,$1D,$89,$5D,$BD,$1D
                    db $BE,$1D,$88,$1D,$34,$1D,$B0,$1D
                    db $B1,$1D,$B2,$1D,$E8,$1C,$20,$15
                    db $21,$15,$30,$15,$31,$15,$02,$15
                    db $03,$15,$12,$15,$13,$15,$B1,$5D
                    db $B0,$5D,$E9,$1C,$B2,$5D,$34,$15
                    db $34,$1D,$34,$15,$34,$1D,$34,$1D
                    db $98,$1D,$34,$1D,$A8,$1D,$89,$1D
                    db $8A,$1D,$99,$1D,$9A,$1D,$8B,$1D
                    db $89,$5D,$9B,$1D,$99,$5D,$9C,$1D
                    db $34,$1D,$AC,$1D,$34,$1D,$24,$15
                    db $16,$15,$34,$15,$26,$15,$17,$15
                    db $18,$15,$27,$15,$28,$15,$B3,$1D
                    db $EA,$1C,$34,$1D,$8E,$1D,$EB,$1C
                    db $B3,$5D,$8F,$1D,$34,$1D,$34,$1D
                    db $A8,$1D,$34,$1D,$A8,$1D,$A9,$1D
                    db $8A,$1D,$B9,$1D,$B9,$1D,$8B,$1D
                    db $A9,$5D,$B9,$1D,$BA,$1D,$AC,$1D
                    db $34,$1D,$AC,$1D,$34,$1D,$34,$15
                    db $34,$15,$0D,$1D,$0E,$1D,$34,$15
                    db $34,$15,$0F,$1D,$34,$15,$1D,$1D
                    db $1E,$1D,$2D,$1D,$2E,$1D,$1F,$1D
                    db $29,$1D,$2F,$1D,$39,$1D,$37,$15
                    db $38,$15,$37,$15,$38,$15,$34,$1D
                    db $A8,$1D,$34,$1D,$B8,$1D,$8B,$1D
                    db $A9,$5D,$B9,$1D,$B9,$1D,$AC,$1D
                    db $34,$1D,$BA,$1D,$34,$1D,$3D,$1D
                    db $3E,$1D,$34,$15,$15,$1D,$3F,$1D
                    db $2A,$1D,$25,$1D,$3A,$1D,$34,$15
                    db $26,$95,$24,$95,$16,$95,$27,$95
                    db $38,$15,$17,$95,$18,$95,$80,$1D
                    db $81,$1D,$90,$1D,$91,$1D,$82,$1D
                    db $83,$1D,$92,$1D,$93,$1D,$32,$15
                    db $22,$15,$10,$15,$11,$15,$22,$15
                    db $23,$15,$10,$15,$11,$15,$33,$15
                    db $00,$15,$10,$15,$11,$15,$A0,$1D
                    db $A1,$1D,$10,$15,$11,$15,$A2,$1D
                    db $A3,$1D,$10,$15,$11,$15,$33,$15
                    db $34,$15,$10,$15,$11,$15,$85,$15
                    db $87,$15,$95,$15,$97,$15,$84,$15
                    db $86,$15,$94,$15,$96,$15,$85,$15
                    db $86,$15,$95,$15,$96,$15,$84,$15
                    db $87,$15,$94,$15,$97,$15,$84,$15
                    db $85,$15,$94,$15,$95,$15,$86,$15
                    db $85,$15,$96,$15,$95,$15,$A6,$15
                    db $A7,$15,$B6,$15,$B7,$15,$94,$15
                    db $A6,$15,$B4,$15,$B6,$15,$A6,$15
                    db $A6,$15,$B6,$15,$B6,$15,$94,$15
                    db $A7,$15,$B4,$15,$B7,$15,$99,$15
                    db $16,$15,$34,$15,$26,$15,$4C,$15
                    db $4D,$15,$5C,$15,$40,$15,$4D,$15
                    db $4D,$15,$41,$15,$42,$15,$4D,$15
                    db $4D,$15,$43,$15,$44,$15,$4D,$15
                    db $4E,$15,$45,$15,$5D,$15,$5C,$15
                    db $50,$15,$5C,$15,$60,$15,$51,$15
                    db $52,$15,$61,$15,$62,$15,$53,$15
                    db $54,$15,$63,$15,$64,$15,$55,$15
                    db $5D,$15,$65,$15,$5D,$15,$5C,$15
                    db $70,$15,$5C,$15,$46,$15,$71,$15
                    db $72,$15,$47,$15,$48,$15,$73,$15
                    db $74,$15,$49,$15,$4A,$15,$75,$15
                    db $5D,$15,$4B,$15,$5D,$15,$5C,$15
                    db $56,$15,$5C,$15,$66,$15,$57,$15
                    db $58,$15,$67,$15,$68,$15,$59,$15
                    db $5A,$15,$69,$15,$6A,$15,$5B,$15
                    db $5D,$15,$6B,$15,$5D,$15,$5C,$15
                    db $76,$15,$5E,$15,$6C,$15,$77,$15
                    db $78,$15,$6C,$15,$6C,$15,$79,$15
                    db $7A,$15,$6C,$15,$6C,$15,$7B,$15
                    db $5D,$15,$6C,$15,$6D,$15,$24,$00
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
                    db $24,$00,$24,$00,$24,$00,$A4,$10
                    db $A4,$10,$24,$00,$24,$00,$A4,$10
                    db $A4,$10,$A4,$10,$A4,$10,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$24,$00
                    db $24,$00,$24,$00,$F0,$1C,$24,$00
                    db $24,$00,$F1,$1C,$24,$00,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$40,$15
                    db $41,$15,$50,$15,$51,$15,$46,$15
                    db $47,$15,$56,$15,$57,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$24,$00
                    db $F2,$1C,$24,$00,$F4,$1C,$F3,$1C
                    db $24,$00,$F5,$1C,$24,$00,$60,$15
                    db $61,$15,$70,$15,$71,$15,$66,$15
                    db $67,$15,$76,$15,$77,$15,$0A,$15
                    db $0B,$15,$1A,$15,$1B,$15,$0C,$15
                    db $0D,$15,$1C,$15,$1D,$15,$28,$15
                    db $29,$15,$1A,$15,$1B,$15,$38,$15
                    db $39,$15,$1C,$15,$1D,$15,$0E,$15
                    db $24,$00,$1E,$15,$1F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$20,$15
                    db $21,$15,$30,$15,$31,$15,$2A,$15
                    db $2B,$15,$3A,$15,$3B,$15,$2C,$15
                    db $2D,$15,$3C,$15,$3D,$15,$2E,$15
                    db $2F,$15,$3E,$15,$3F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$22,$15
                    db $23,$15,$32,$15,$33,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$0C,$15
                    db $0D,$15,$1C,$15,$1D,$15,$28,$15
                    db $29,$15,$1A,$15,$1B,$15,$38,$15
                    db $39,$15,$1C,$15,$1D,$15,$42,$15
                    db $43,$15,$52,$15,$53,$15,$44,$15
                    db $45,$15,$54,$15,$55,$15,$62,$15
                    db $63,$15,$72,$15,$73,$15,$64,$15
                    db $65,$15,$74,$15,$75,$15,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$34,$15
                    db $35,$15,$1A,$15,$1B,$15,$36,$15
                    db $37,$15,$1C,$15,$1D,$15,$2A,$15
                    db $2B,$15,$24,$15,$25,$15,$2C,$15
                    db $2D,$15,$26,$15,$27,$15,$A4,$15
                    db $A5,$15,$B4,$15,$B5,$15,$05,$15
                    db $0B,$15,$15,$15,$03,$15,$24,$00
                    db $04,$15,$24,$00,$14,$15,$10,$15
                    db $11,$15,$13,$15,$27,$15,$24,$00
                    db $24,$00,$24,$00,$12,$15,$06,$15
                    db $2B,$15,$09,$15,$07,$15,$2E,$15
                    db $2F,$15,$3E,$15,$07,$15,$24,$00
                    db $24,$00,$08,$15,$24,$00,$2E,$15
                    db $2F,$15,$09,$15,$07,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$22,$15
                    db $23,$15,$32,$15,$33,$15,$72,$15
                    db $71,$15,$5E,$15,$5F,$15,$24,$10
                    db $24,$10,$24,$10,$24,$10,$0A,$15
                    db $4A,$15,$4A,$15,$16,$15,$07,$15
                    db $06,$15,$5A,$15,$16,$15,$24,$10
                    db $01,$15,$10,$15,$11,$15,$02,$15
                    db $03,$15,$0A,$15,$0A,$15,$04,$15
                    db $24,$10,$14,$15,$15,$15,$0A,$15
                    db $0D,$15,$0A,$15,$1D,$15,$07,$15
                    db $24,$10,$0E,$15,$07,$15,$0A,$15
                    db $1D,$15,$0A,$15,$0A,$15,$1F,$15
                    db $17,$15,$1E,$15,$55,$15,$1E,$15
                    db $55,$15,$0A,$15,$0F,$15,$55,$15
                    db $17,$15,$55,$15,$55,$15,$55,$15
                    db $55,$15,$1F,$15,$55,$15,$07,$15
                    db $06,$15,$0E,$15,$5B,$15,$18,$15
                    db $0A,$15,$0E,$15,$18,$15,$5E,$15
                    db $5E,$15,$4F,$15,$4F,$15,$0A,$15
                    db $4B,$15,$4A,$15,$16,$15,$55,$15
                    db $5A,$15,$5A,$15,$16,$15,$24,$10
                    db $06,$15,$06,$15,$16,$15,$16,$15
                    db $0A,$15,$0A,$15,$0A,$15,$02,$15
                    db $08,$15,$0A,$15,$0A,$15,$09,$15
                    db $0A,$15,$14,$15,$1A,$15,$0A,$55
                    db $0A,$15,$0A,$15,$0A,$15,$1E,$15
                    db $17,$15,$0A,$15,$0F,$15,$07,$15
                    db $24,$10,$17,$15,$07,$15,$0A,$15
                    db $0F,$15,$0A,$15,$1D,$15,$55,$15
                    db $17,$15,$1F,$15,$55,$15,$1F,$15
                    db $55,$15,$1E,$15,$55,$15,$55,$15
                    db $55,$15,$55,$15,$55,$15,$07,$15
                    db $06,$15,$17,$15,$5B,$15,$18,$15
                    db $0A,$15,$17,$15,$18,$15,$5F,$15
                    db $5F,$15,$5F,$15,$5F,$15,$45,$15
                    db $0A,$15,$0A,$15,$0A,$15,$0A,$15
                    db $0A,$15,$0A,$15,$19,$15,$0A,$15
                    db $12,$15,$0A,$15,$12,$95,$13,$15
                    db $0A,$15,$13,$95,$0A,$15,$19,$15
                    db $0A,$55,$0A,$55,$45,$D5,$47,$15
                    db $47,$55,$47,$95,$47,$D5,$57,$15
                    db $57,$55,$57,$95,$57,$D5,$12,$15
                    db $0A,$15,$12,$95,$19,$15,$0A,$15
                    db $0A,$15,$47,$15,$47,$55,$47,$95
                    db $54,$15,$0A,$15,$57,$95,$57,$55
                    db $0A,$15,$57,$D5,$0A,$15,$0B,$15
                    db $0C,$15,$1B,$15,$1C,$15,$0A,$15
                    db $0A,$15,$0A,$15,$0B,$15,$0A,$15
                    db $0A,$15,$0C,$15,$0A,$15,$0B,$15
                    db $1B,$15,$1B,$15,$0A,$15,$1C,$15
                    db $0C,$15,$0A,$15,$1C,$15,$55,$55
                    db $56,$55,$55,$55,$56,$D5,$55,$55
                    db $46,$55,$55,$55,$46,$D5,$5C,$15
                    db $17,$15,$55,$55,$55,$55,$55,$55
                    db $17,$15,$55,$55,$4C,$15,$26,$15
                    db $21,$15,$36,$15,$31,$15,$22,$15
                    db $23,$15,$32,$15,$33,$15,$20,$15
                    db $21,$15,$30,$15,$31,$15,$22,$15
                    db $24,$15,$32,$15,$34,$15,$27,$15
                    db $51,$15,$37,$15,$31,$15,$52,$15
                    db $53,$15,$32,$15,$33,$15,$50,$15
                    db $51,$15,$30,$15,$31,$15,$52,$15
                    db $48,$15,$32,$15,$58,$15,$27,$15
                    db $41,$15,$37,$15,$31,$15,$42,$15
                    db $43,$15,$32,$15,$33,$15,$40,$15
                    db $41,$15,$30,$15,$31,$15,$42,$15
                    db $44,$15,$32,$15,$35,$15,$2E,$15
                    db $29,$15,$3E,$15,$39,$15,$2A,$15
                    db $2B,$15,$3A,$15,$3B,$15,$28,$15
                    db $29,$15,$38,$15,$39,$15,$2A,$15
                    db $2C,$15,$3A,$15,$3C,$15,$2F,$15
                    db $29,$15,$3F,$15,$39,$15,$2A,$15
                    db $49,$15,$3A,$15,$59,$15,$2A,$15
                    db $2D,$15,$3A,$15,$3D,$15,$60,$15
                    db $61,$15,$5E,$15,$5F,$15,$62,$15
                    db $63,$15,$67,$15,$68,$15,$62,$15
                    db $4D,$15,$67,$15,$5D,$15,$62,$15
                    db $4E,$15,$67,$15,$5D,$15,$62,$15
                    db $4F,$15,$67,$15,$5D,$15,$64,$15
                    db $61,$15,$69,$15,$5F,$15,$65,$15
                    db $61,$15,$6A,$15,$5F,$15,$66,$15
                    db $66,$15,$66,$15,$66,$15,$86,$15
                    db $86,$15,$87,$15,$87,$15,$88,$15
                    db $88,$15,$88,$15,$88,$15,$12,$15
                    db $1F,$15,$12,$15,$1F,$15,$07,$15
                    db $06,$15,$B0,$15,$16,$15,$45,$15
                    db $71,$15,$0E,$15,$A2,$15,$89,$15
                    db $8C,$15,$9B,$15,$9C,$15,$9D,$15
                    db $9F,$15,$9F,$15,$12,$15,$89,$15
                    db $8C,$15,$9B,$15,$9C,$15,$FF,$15
                    db $FF,$15,$FF,$15,$FF,$15,$EE,$15
                    db $EE,$15,$FE,$15,$FE,$15,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $27,$00,$27,$00,$27,$00,$2E,$14
                    db $96,$15,$67,$15,$91,$15,$97,$15
                    db $03,$15,$12,$15,$13,$15,$4E,$15
                    db $06,$15,$54,$15,$16,$15,$A0,$15
                    db $A1,$15,$B0,$15,$16,$15,$17,$15
                    db $B0,$15,$B0,$15,$16,$15,$55,$15
                    db $17,$15,$55,$15,$17,$95,$55,$15
                    db $55,$15,$55,$15,$17,$95,$45,$15
                    db $71,$15,$17,$15,$A2,$15,$57,$15
                    db $81,$15,$90,$15,$91,$15,$82,$15
                    db $83,$15,$92,$15,$93,$15,$84,$15
                    db $57,$15,$94,$15,$95,$15,$12,$15
                    db $0D,$15,$12,$15,$1D,$15,$07,$15
                    db $24,$14,$0E,$15,$07,$15,$1E,$15
                    db $17,$15,$12,$15,$0F,$15,$12,$15
                    db $1D,$15,$12,$15,$12,$15,$1F,$15
                    db $17,$15,$1E,$15,$55,$15,$07,$15
                    db $4B,$15,$0E,$15,$45,$15,$18,$15
                    db $19,$15,$0E,$15,$18,$15,$12,$15
                    db $0F,$15,$12,$15,$1D,$15,$55,$15
                    db $17,$15,$1F,$15,$55,$15,$1E,$15
                    db $55,$15,$12,$15,$0F,$15,$1F,$15
                    db $55,$15,$1E,$15,$55,$15,$55,$15
                    db $55,$15,$1F,$15,$55,$15,$45,$15
                    db $2E,$14,$0E,$15,$45,$15,$12,$15
                    db $12,$15,$12,$15,$89,$15,$12,$15
                    db $12,$15,$8C,$15,$12,$15,$89,$15
                    db $8A,$15,$99,$15,$9A,$15,$8B,$15
                    db $8C,$15,$9B,$15,$9C,$15,$8D,$15
                    db $8E,$15,$12,$15,$8F,$15,$9D,$15
                    db $9E,$15,$9F,$15,$12,$15,$89,$15
                    db $8C,$15,$99,$15,$9A,$15,$89,$15
                    db $8C,$15,$9B,$15,$9C,$15,$B3,$15
                    db $B2,$15,$B2,$15,$16,$15,$B3,$15
                    db $A3,$15,$B2,$15,$16,$15,$12,$15
                    db $99,$15,$12,$15,$8F,$15,$9D,$15
                    db $8E,$15,$9F,$15,$8F,$15,$9C,$15
                    db $12,$15,$9F,$15,$12,$15,$12,$15
                    db $12,$15,$8C,$15,$89,$15,$89,$15
                    db $8C,$15,$9B,$15,$9A,$15,$12,$15
                    db $12,$15,$89,$15,$8C,$15,$99,$15
                    db $9C,$15,$8F,$15,$9F,$15,$12,$15
                    db $99,$15,$8C,$15,$8F,$15,$16,$15
                    db $12,$15,$89,$15,$8C,$15,$16,$15
                    db $12,$15,$12,$15,$89,$15,$16,$15
                    db $12,$15,$89,$15,$8C,$15,$99,$15
                    db $9C,$15,$8D,$15,$B1,$15,$12,$15
                    db $1D,$15,$8C,$15,$12,$15,$12,$15
                    db $1D,$15,$8C,$15,$12,$15,$62,$15
                    db $63,$15,$72,$15,$73,$15,$64,$15
                    db $65,$15,$74,$15,$75,$15,$66,$15
                    db $67,$15,$76,$15,$77,$15,$68,$15
                    db $69,$15,$78,$15,$79,$15,$24,$00
                    db $24,$00,$00,$1D,$01,$1D,$24,$00
                    db $24,$00,$02,$1D,$03,$1D,$24,$00
                    db $24,$00,$04,$1D,$05,$1D,$24,$00
                    db $24,$00,$06,$1D,$07,$1D,$10,$1D
                    db $11,$1D,$20,$1D,$21,$1D,$12,$1D
                    db $13,$1D,$22,$1D,$23,$1D,$14,$1D
                    db $15,$1D,$24,$1D,$25,$1D,$16,$1D
                    db $17,$1D,$26,$1D,$27,$1D,$24,$00
                    db $24,$00,$40,$1D,$41,$1D,$30,$1D
                    db $31,$1D,$08,$1D,$09,$1D,$32,$1D
                    db $33,$1D,$0A,$1D,$0B,$1D,$34,$1D
                    db $35,$1D,$0C,$1D,$0D,$1D,$36,$1D
                    db $37,$1D,$0E,$1D,$0F,$1D,$50,$1D
                    db $51,$1D,$60,$1D,$61,$1D,$18,$1D
                    db $19,$1D,$28,$1D,$29,$1D,$1A,$1D
                    db $1B,$1D,$2A,$1D,$2B,$1D,$1C,$1D
                    db $1D,$1D,$2C,$1D,$2D,$1D,$1E,$1D
                    db $1F,$1D,$2E,$1D,$2F,$1D,$70,$1D
                    db $71,$1D,$24,$00,$24,$00,$38,$1D
                    db $39,$1D,$24,$00,$24,$00,$3A,$1D
                    db $3B,$1D,$24,$00,$24,$00,$3C,$1D
                    db $3D,$1D,$24,$00,$24,$00,$3E,$1D
                    db $3F,$1D,$24,$00,$24,$00,$3E,$1D
                    db $3F,$1D,$24,$00,$24,$00,$3E,$1D
                    db $3F,$1D,$24,$00,$24,$00,$3E,$1D
                    db $3F,$1D,$24,$00,$24,$00,$3E,$1D
                    db $3F,$1D,$24,$00,$24,$00,$3E,$1D
                    db $3F,$1D,$24,$00,$24,$00,$C0,$1D
                    db $C1,$1D,$D0,$1D,$D1,$1D,$C2,$1D
                    db $C3,$1D,$D2,$1D,$D3,$1D,$C4,$1D
                    db $C5,$1D,$D4,$1D,$D5,$1D,$C6,$1D
                    db $C7,$1D,$D6,$1D,$D7,$1D,$C8,$1D
                    db $C9,$1D,$D8,$1D,$D9,$1D,$CA,$1D
                    db $24,$00,$DA,$1D,$DB,$1D,$E8,$1D
                    db $24,$00,$F8,$1D,$24,$00,$E8,$1D
                    db $E9,$1D,$F8,$1D,$F9,$1D,$EA,$1D
                    db $EB,$1D,$FA,$1D,$FB,$1D,$24,$00
                    db $E9,$1D,$24,$00,$F9,$1D,$DF,$1D
                    db $C3,$1D,$DC,$1D,$D3,$1D,$E8,$1D
                    db $E9,$1D,$F8,$1D,$F9,$1D,$CC,$1D
                    db $CD,$1D,$D0,$1D,$D1,$1D,$CE,$1D
                    db $CF,$1D,$D2,$1D,$D3,$1D,$24,$00
                    db $E5,$1D,$24,$00,$F5,$1D,$24,$00
                    db $DD,$1D,$24,$00,$DE,$1D,$E0,$1D
                    db $E1,$1D,$F0,$1D,$F1,$1D,$E2,$1D
                    db $E3,$1D,$F2,$1D,$F3,$1D,$E4,$1D
                    db $E5,$1D,$F4,$1D,$F5,$1D,$E6,$1D
                    db $E7,$1D,$F6,$1D,$F7,$1D,$E2,$1D
                    db $F8,$1D,$F2,$1D,$F3,$1D,$E2,$1D
                    db $E3,$1D,$F2,$1D,$F3,$1D,$E4,$1D
                    db $24,$00,$F4,$1D,$24,$00,$24,$00
                    db $24,$00,$EC,$1D,$ED,$1D,$E2,$1D
                    db $F8,$1D,$F2,$1D,$F3,$1D,$EE,$15
                    db $EE,$15,$FE,$15,$FE,$15,$FF,$15
                    db $FF,$15,$FF,$15,$FF,$15,$16,$1D
                    db $12,$1D,$12,$1D,$89,$1D,$16,$1D
                    db $12,$1D,$89,$1D,$8C,$1D,$99,$1D
                    db $9C,$1D,$8D,$1D,$B1,$1D,$12,$1D
                    db $1D,$1D,$8C,$1D,$12,$1D,$12,$1D
                    db $1D,$1D,$8C,$1D,$12,$1D,$62,$15
                    db $63,$15,$72,$15,$73,$15,$64,$15
                    db $65,$15,$74,$15,$75,$15,$66,$15
                    db $67,$15,$76,$15,$77,$15,$68,$15
                    db $69,$15,$78,$15,$79,$15,$07,$15
                    db $06,$15,$B0,$15,$16,$15,$20,$15
                    db $21,$15,$30,$15,$31,$15,$22,$15
                    db $23,$15,$32,$15,$33,$15,$28,$15
                    db $29,$15,$38,$15,$39,$15,$2A,$15
                    db $2B,$15,$3A,$15,$3B,$15,$26,$15
                    db $21,$15,$36,$15,$31,$15,$22,$15
                    db $24,$15,$32,$15,$34,$15,$2E,$15
                    db $29,$15,$3E,$15,$39,$15,$2A,$15
                    db $2C,$15,$3A,$15,$3C,$15,$40,$15
                    db $41,$15,$30,$15,$31,$15,$42,$15
                    db $43,$15,$32,$15,$33,$15,$27,$15
                    db $41,$15,$37,$15,$31,$15,$22,$15
                    db $24,$15,$32,$15,$34,$15,$2F,$15
                    db $29,$15,$3F,$15,$39,$15,$2A,$15
                    db $2D,$15,$3A,$15,$3D,$15,$50,$15
                    db $51,$15,$30,$15,$31,$15,$52,$15
                    db $53,$15,$32,$15,$33,$15,$52,$15
                    db $48,$15,$32,$15,$58,$15,$2A,$15
                    db $49,$15,$3A,$15,$59,$15,$24,$00
                    db $24,$00,$24,$00,$24,$00,$C1,$1C
                    db $24,$00,$24,$00,$24,$00,$C2,$1C
                    db $24,$00,$24,$00,$24,$00,$C3,$1C
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$C0,$1C,$24,$00,$24,$00
                    db $24,$00,$C1,$1C,$24,$00,$24,$00
                    db $24,$00,$C2,$1C,$24,$00,$24,$00
                    db $24,$00,$C3,$1C,$24,$00,$C4,$1C
                    db $24,$00,$24,$00,$24,$00,$C5,$1C
                    db $24,$00,$24,$00,$24,$00,$C6,$1C
                    db $24,$00,$24,$00,$24,$00,$C7,$1C
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$C4,$1C,$24,$00,$24,$00
                    db $24,$00,$C5,$1C,$24,$00,$24,$00
                    db $24,$00,$C6,$1C,$24,$00,$24,$00
                    db $24,$00,$C7,$1C,$24,$00,$24,$00
                    db $C0,$1C,$24,$00,$24,$00,$24,$00
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
                    db $24,$00,$24,$00,$C7,$1C,$E0,$15
                    db $E0,$15,$E1,$15,$E1,$15,$C6,$15
                    db $C7,$15,$D6,$15,$D7,$15,$C8,$15
                    db $C9,$15,$D8,$15,$D9,$15,$CA,$15
                    db $CB,$15,$DA,$15,$DB,$15,$CC,$15
                    db $CD,$15,$DC,$15,$DD,$15,$E6,$15
                    db $E7,$15,$F6,$15,$F7,$15,$E8,$15
                    db $E9,$15,$F8,$15,$F9,$15,$EA,$15
                    db $EB,$15,$FA,$15,$FB,$15,$EC,$15
                    db $ED,$15,$FC,$15,$FD,$15,$E2,$15
                    db $E2,$15,$E2,$15,$E2,$15,$C0,$1C
                    db $24,$00,$24,$00,$24,$00,$C0,$1C
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$04,$15
                    db $05,$15,$16,$15,$17,$15,$06,$15
                    db $07,$15,$20,$15,$21,$15,$04,$15
                    db $05,$15,$22,$15,$23,$15,$06,$15
                    db $07,$15,$14,$15,$15,$15,$0C,$15
                    db $0D,$15,$1C,$15,$1D,$15,$24,$00
                    db $24,$00,$1E,$15,$24,$00,$24,$00
                    db $2C,$15,$24,$00,$3C,$15,$0C,$15
                    db $2A,$15,$16,$15,$3A,$15,$2B,$15
                    db $07,$15,$3B,$15,$21,$15,$26,$15
                    db $27,$15,$36,$15,$37,$15,$30,$15
                    db $31,$15,$08,$15,$24,$00,$32,$15
                    db $33,$15,$24,$00,$0B,$15,$24,$15
                    db $25,$15,$34,$15,$35,$15,$26,$15
                    db $1B,$15,$36,$15,$37,$15,$0F,$15
                    db $24,$00,$08,$15,$24,$00,$24,$00
                    db $24,$00,$24,$00,$3E,$15,$2E,$15
                    db $2F,$15,$3F,$15,$35,$15,$18,$15
                    db $24,$00,$4A,$15,$4B,$15,$24,$00
                    db $19,$15,$5A,$15,$5B,$15,$24,$00
                    db $19,$15,$5C,$15,$48,$15,$24,$15
                    db $25,$15,$44,$15,$45,$15,$26,$15
                    db $27,$15,$46,$15,$47,$15,$24,$00
                    db $24,$00,$5C,$15,$51,$15,$24,$00
                    db $24,$00,$52,$15,$53,$15,$24,$00
                    db $19,$15,$50,$15,$48,$15,$00,$15
                    db $01,$15,$11,$15,$00,$15,$68,$15
                    db $69,$15,$78,$15,$79,$15,$6A,$15
                    db $6B,$15,$7A,$15,$7B,$15,$10,$15
                    db $11,$15,$01,$15,$10,$15,$6C,$15
                    db $61,$15,$7C,$15,$71,$15,$54,$15
                    db $55,$15,$72,$15,$73,$15,$56,$15
                    db $57,$15,$74,$15,$75,$15,$4C,$15
                    db $4D,$15,$76,$15,$77,$15,$62,$15
                    db $63,$15,$72,$15,$73,$15,$64,$15
                    db $65,$15,$74,$15,$75,$15,$66,$15
                    db $67,$15,$76,$15,$77,$15,$60,$15
                    db $61,$15,$7C,$15,$71,$15,$54,$15
                    db $58,$15,$72,$15,$59,$15,$16,$15
                    db $17,$15,$18,$15,$19,$15,$19,$15
                    db $18,$15,$18,$15,$19,$15,$06,$15
                    db $06,$15,$14,$15,$15,$15,$34,$15
                    db $34,$15,$34,$15,$34,$15,$34,$15
                    db $04,$15,$34,$15,$04,$15,$05,$15
                    db $06,$15,$05,$15,$06,$15,$29,$15
                    db $2A,$15,$19,$15,$1A,$15,$2B,$15
                    db $2C,$15,$1B,$15,$1C,$15,$38,$15
                    db $34,$15,$38,$15,$34,$15,$19,$15
                    db $1A,$15,$19,$15,$1A,$15,$1B,$15
                    db $1C,$15,$1B,$15,$1C,$15,$09,$15
                    db $0A,$15,$19,$15,$1A,$15,$0B,$15
                    db $0C,$15,$1B,$15,$1C,$15,$34,$15
                    db $04,$15,$34,$15,$14,$15,$05,$15
                    db $06,$15,$15,$15,$06,$15,$00,$15
                    db $01,$15,$10,$15,$11,$15,$00,$15
                    db $02,$15,$10,$15,$12,$15,$03,$15
                    db $01,$15,$13,$15,$11,$15,$0D,$15
                    db $0A,$15,$1D,$15,$1A,$15,$0B,$15
                    db $0E,$15,$1B,$15,$1E,$15,$0F,$15
                    db $01,$15,$1F,$15,$11,$15,$20,$15
                    db $21,$15,$30,$15,$31,$15,$20,$15
                    db $22,$15,$30,$15,$32,$15,$23,$15
                    db $21,$15,$33,$15,$31,$15,$20,$15
                    db $21,$15,$30,$15,$30,$15,$2D,$15
                    db $1A,$15,$3D,$15,$1A,$15,$1B,$15
                    db $2E,$15,$1B,$15,$3E,$15,$2F,$15
                    db $21,$15,$3F,$15,$31,$15,$35,$15
                    db $35,$15,$34,$15,$34,$15,$24,$15
                    db $16,$15,$34,$15,$26,$15,$17,$15
                    db $18,$15,$27,$15,$28,$15,$25,$15
                    db $35,$15,$34,$15,$34,$15,$39,$15
                    db $0A,$15,$19,$15,$1A,$15,$3A,$15
                    db $35,$15,$38,$15,$34,$15,$34,$15
                    db $36,$15,$34,$15,$36,$15,$37,$15
                    db $28,$15,$37,$15,$28,$15,$02,$15
                    db $03,$15,$12,$15,$05,$15,$04,$15
                    db $24,$15,$14,$15,$15,$15,$24,$15
                    db $06,$15,$06,$15,$16,$15,$12,$15
                    db $12,$15,$12,$15,$12,$15,$0E,$15
                    db $17,$15,$0F,$15,$55,$15,$07,$15
                    db $24,$15,$17,$15,$07,$15,$16,$15
                    db $1B,$15,$0B,$15,$1B,$15,$0C,$15
                    db $12,$15,$1C,$15,$0C,$15,$1D,$15
                    db $55,$15,$1E,$15,$55,$15,$55,$15
                    db $17,$15,$55,$15,$55,$15,$16,$15
                    db $0B,$15,$12,$15,$12,$15,$1B,$15
                    db $12,$15,$12,$15,$12,$15,$1E,$15
                    db $55,$15,$12,$15,$55,$15,$55,$15
                    db $55,$15,$55,$15,$55,$15,$80,$1D
                    db $81,$1D,$90,$1D,$91,$1D,$81,$5D
                    db $80,$5D,$92,$1D,$90,$5D,$A0,$1D
                    db $A1,$1D,$B0,$1D,$82,$1D,$A2,$1D
                    db $B1,$1D,$82,$5D,$B2,$1D,$34,$15
                    db $7C,$15,$34,$15,$7D,$15,$87,$15
                    db $88,$15,$97,$15,$98,$15,$83,$1D
                    db $84,$1D,$93,$1D,$94,$1D,$85,$1D
                    db $86,$1D,$95,$1D,$96,$1D,$A7,$15
                    db $A8,$15,$B7,$15,$B8,$15,$34,$15
                    db $8A,$15,$34,$15,$9A,$15,$89,$15
                    db $8B,$15,$13,$15,$9B,$15,$A3,$1D
                    db $A4,$1D,$30,$15,$30,$15,$A5,$1D
                    db $A6,$1D,$30,$15,$30,$15,$B3,$15
                    db $B4,$15,$B5,$15,$B6,$15,$A9,$15
                    db $AA,$15,$B9,$15,$32,$15,$23,$15
                    db $AB,$15,$33,$15,$31,$15,$35,$15
                    db $16,$15,$34,$15,$26,$15,$99,$15
                    db $16,$15,$34,$15,$26,$15,$4C,$15
                    db $4D,$15,$5C,$15,$40,$15,$4D,$15
                    db $4D,$15,$41,$15,$42,$15,$4D,$15
                    db $4D,$15,$43,$15,$44,$15,$4D,$15
                    db $4E,$15,$45,$15,$5D,$15,$5C,$15
                    db $50,$15,$5C,$15,$60,$15,$51,$15
                    db $52,$15,$61,$15,$62,$15,$53,$15
                    db $54,$15,$63,$15,$64,$15,$55,$15
                    db $5D,$15,$65,$15,$5D,$15,$5C,$15
                    db $70,$15,$5C,$15,$46,$15,$71,$15
                    db $72,$15,$47,$15,$48,$15,$73,$15
                    db $74,$15,$49,$15,$4A,$15,$75,$15
                    db $5D,$15,$4B,$15,$5D,$15,$5C,$15
                    db $56,$15,$5C,$15,$66,$15,$57,$15
                    db $58,$15,$67,$15,$68,$15,$59,$15
                    db $5A,$15,$69,$15,$6A,$15,$5B,$15
                    db $5D,$15,$6B,$15,$5D,$15,$5C,$15
                    db $76,$15,$5E,$15,$6C,$15,$77,$15
                    db $78,$15,$6C,$15,$6C,$15,$79,$15
                    db $7A,$15,$6C,$15,$6C,$15,$7B,$15
                    db $5D,$15,$6C,$15,$6D,$15,$04,$15
                    db $05,$15,$04,$15,$05,$15,$06,$15
                    db $34,$15,$06,$15,$34,$15,$34,$15
                    db $29,$15,$34,$15,$19,$15,$2A,$15
                    db $2B,$15,$1A,$15,$1B,$15,$2C,$15
                    db $38,$15,$1C,$15,$38,$15,$34,$15
                    db $19,$15,$34,$15,$19,$15,$1A,$15
                    db $1B,$15,$1A,$15,$1B,$15,$1C,$15
                    db $38,$15,$1C,$15,$38,$15,$34,$15
                    db $09,$15,$34,$15,$19,$15,$0A,$15
                    db $0B,$15,$1A,$15,$1B,$15,$24,$00
                    db $24,$00,$24,$00,$24,$00,$34,$15
                    db $34,$15,$34,$15,$34,$15,$34,$15
                    db $36,$15,$34,$15,$36,$15,$37,$15
                    db $38,$15,$37,$15,$28,$15,$34,$15
                    db $09,$1D,$34,$15,$34,$15,$09,$1D
                    db $0A,$1D,$19,$1D,$1A,$1D,$0B,$1D
                    db $0C,$1D,$1B,$1D,$1C,$1D,$0C,$5D
                    db $0B,$5D,$1C,$5D,$1B,$5D,$34,$15
                    db $8D,$1D,$9C,$1D,$9D,$1D,$AC,$1D
                    db $AD,$1D,$BC,$1D,$BD,$1D,$8C,$1D
                    db $8E,$1D,$BB,$1D,$9E,$1D,$AD,$5D
                    db $AC,$5D,$BD,$5D,$BC,$5D,$0A,$55
                    db $09,$55,$1A,$55,$19,$55,$00,$15
                    db $01,$15,$10,$15,$11,$15,$BB,$1D
                    db $BC,$1D,$34,$1D,$88,$1D,$BD,$1D
                    db $BC,$1D,$89,$1D,$8C,$1D,$BD,$1D
                    db $BC,$1D,$8D,$1D,$89,$5D,$34,$15
                    db $34,$15,$34,$15,$CE,$15,$EC,$15
                    db $ED,$15,$FC,$15,$FD,$15,$EE,$15
                    db $EF,$15,$FE,$15,$FF,$15,$34,$15
                    db $34,$15,$CF,$15,$34,$15,$CE,$15
                    db $CF,$15,$34,$15,$DE,$15,$D8,$15
                    db $D9,$15,$C9,$15,$FD,$15,$C1,$15
                    db $C2,$15,$FE,$15,$DF,$15,$CE,$15
                    db $CF,$15,$DE,$15,$34,$15,$CE,$15
                    db $CF,$15,$34,$15,$DE,$15,$D8,$15
                    db $D9,$15,$6E,$15,$FD,$15,$C1,$15
                    db $C2,$15,$FE,$15,$6F,$15,$CE,$15
                    db $CF,$15,$DE,$15,$34,$15,$CE,$15
                    db $CF,$15,$34,$15,$34,$15,$CE,$15
                    db $CF,$15,$34,$15,$34,$15,$34,$1D
                    db $A8,$1D,$34,$1D,$A8,$1D,$A9,$1D
                    db $8A,$1D,$B9,$1D,$B9,$1D,$34,$15
                    db $DE,$15,$CE,$15,$CF,$15,$C9,$15
                    db $FD,$15,$D8,$15,$D9,$15,$FE,$15
                    db $DF,$15,$C1,$15,$C2,$15,$DE,$15
                    db $34,$15,$CE,$15,$CF,$15,$1D,$1D
                    db $1E,$1D,$2D,$1D,$2E,$1D,$1F,$1D
                    db $29,$1D,$2F,$1D,$39,$1D,$37,$15
                    db $38,$15,$37,$15,$38,$15,$34,$15
                    db $DE,$15,$34,$15,$34,$15,$6E,$15
                    db $FD,$15,$34,$15,$34,$15,$FE,$15
                    db $6F,$15,$34,$15,$34,$15,$DE,$15
                    db $34,$15,$34,$15,$34,$15,$3F,$1D
                    db $2A,$1D,$25,$1D,$3A,$1D,$34,$15
                    db $26,$95,$24,$95,$16,$95,$27,$95
                    db $38,$15,$17,$95,$18,$95,$80,$1D
                    db $81,$1D,$90,$1D,$91,$1D,$82,$1D
                    db $83,$1D,$92,$1D,$93,$1D,$BD,$1D
                    db $BE,$1D,$88,$1D,$34,$1D,$B0,$1D
                    db $B1,$1D,$B2,$1D,$2B,$1D,$20,$15
                    db $21,$15,$30,$15,$31,$15,$02,$15
                    db $03,$15,$12,$15,$13,$15,$B1,$5D
                    db $B0,$5D,$2C,$1D,$B2,$5D,$34,$15
                    db $34,$1D,$34,$15,$34,$1D,$34,$1D
                    db $98,$1D,$34,$1D,$A8,$1D,$89,$1D
                    db $8A,$1D,$99,$1D,$9A,$1D,$8B,$1D
                    db $89,$5D,$9B,$1D,$99,$5D,$9C,$1D
                    db $34,$1D,$AC,$1D,$34,$1D,$24,$15
                    db $16,$15,$34,$15,$26,$15,$17,$15
                    db $18,$15,$27,$15,$28,$15,$B3,$1D
                    db $3B,$1D,$34,$1D,$8E,$1D,$3C,$1D
                    db $B3,$5D,$8F,$1D,$34,$1D,$34,$1D
                    db $A8,$1D,$34,$1D,$A8,$1D,$A9,$1D
                    db $8A,$1D,$B9,$1D,$B9,$1D,$8B,$1D
                    db $A9,$5D,$B9,$1D,$BA,$1D,$AC,$1D
                    db $34,$1D,$AC,$1D,$34,$1D,$34,$15
                    db $34,$15,$0D,$1D,$0E,$1D,$34,$15
                    db $34,$15,$0F,$1D,$34,$15,$1D,$1D
                    db $1E,$1D,$2D,$1D,$2E,$1D,$1F,$1D
                    db $29,$1D,$2F,$1D,$39,$1D,$37,$15
                    db $38,$15,$37,$15,$38,$15,$34,$1D
                    db $A8,$1D,$34,$1D,$B8,$1D,$8B,$1D
                    db $A9,$5D,$B9,$1D,$B9,$1D,$AC,$1D
                    db $34,$1D,$BA,$1D,$34,$1D,$3D,$1D
                    db $3E,$1D,$34,$15,$15,$1D,$3F,$1D
                    db $2A,$1D,$25,$1D,$3A,$1D,$34,$15
                    db $26,$95,$24,$95,$16,$95,$27,$95
                    db $38,$15,$17,$95,$18,$95,$80,$1D
                    db $81,$1D,$90,$1D,$91,$1D,$82,$1D
                    db $83,$1D,$92,$1D,$93,$1D,$32,$15
                    db $22,$15,$10,$15,$11,$15,$22,$15
                    db $23,$15,$10,$15,$11,$15,$33,$15
                    db $00,$15,$10,$15,$11,$15,$A0,$1D
                    db $A1,$1D,$10,$15,$11,$15,$A2,$1D
                    db $A3,$1D,$10,$15,$11,$15,$33,$15
                    db $34,$15,$10,$15,$11,$15,$85,$15
                    db $87,$15,$95,$15,$97,$15,$84,$15
                    db $86,$15,$94,$15,$96,$15,$85,$15
                    db $86,$15,$95,$15,$96,$15,$84,$15
                    db $87,$15,$94,$15,$97,$15,$84,$15
                    db $85,$15,$94,$15,$95,$15,$86,$15
                    db $85,$15,$96,$15,$95,$15,$A6,$15
                    db $A7,$15,$B6,$15,$B7,$15,$94,$15
                    db $A6,$15,$B4,$15,$B6,$15,$A6,$15
                    db $A6,$15,$B6,$15,$B6,$15,$94,$15
                    db $A7,$15,$B4,$15,$B7,$15,$24,$10
                    db $24,$10,$24,$10,$24,$10,$0E,$15
                    db $0F,$15,$1E,$15,$1F,$15,$02,$1D
                    db $03,$1D,$12,$1D,$13,$1D,$20,$1D
                    db $21,$1D,$30,$1D,$31,$1D,$2E,$15
                    db $2F,$15,$3E,$15,$3F,$15,$22,$1D
                    db $23,$1D,$32,$1D,$33,$1D,$20,$1D
                    db $21,$1D,$1C,$15,$1D,$15,$28,$15
                    db $29,$15,$10,$1D,$11,$1D,$2A,$15
                    db $2B,$15,$12,$1D,$13,$1D,$6C,$15
                    db $6D,$15,$7C,$15,$7D,$15,$4E,$15
                    db $4F,$15,$5E,$15,$5F,$15,$6E,$15
                    db $6F,$15,$7E,$15,$7F,$15,$48,$1D
                    db $49,$1D,$58,$1D,$59,$1D,$4A,$1D
                    db $4B,$1D,$5A,$1D,$5B,$1D,$0C,$15
                    db $0D,$15,$1C,$15,$1D,$15,$68,$1D
                    db $69,$1D,$78,$1D,$79,$1D,$6A,$1D
                    db $6B,$1D,$7A,$1D,$7B,$1D,$28,$15
                    db $29,$15,$38,$15,$39,$15,$2A,$15
                    db $2B,$15,$3A,$15,$3B,$15,$08,$15
                    db $09,$15,$18,$15,$19,$15,$0A,$15
                    db $0B,$15,$1A,$15,$1B,$15,$06,$1D
                    db $07,$1D,$16,$1D,$17,$15,$04,$15
                    db $05,$1D,$14,$1D,$15,$1D,$06,$1D
                    db $03,$1D,$16,$1D,$13,$1D,$26,$1D
                    db $27,$1D,$36,$1D,$37,$1D,$24,$1D
                    db $25,$1D,$34,$1D,$35,$1D,$26,$1D
                    db $23,$1D,$36,$1D,$33,$1D,$2C,$15
                    db $2D,$15,$3C,$15,$3D,$15,$3D,$15
                    db $3C,$15,$3C,$15,$3D,$15,$00,$1D
                    db $01,$1D,$10,$1D,$11,$1D,$48,$01
                    db $48,$01,$22,$07,$2E,$08,$26,$0A
                    db $B2,$0B,$3A,$11,$80,$12,$30,$14
                    db $76,$15,$3A,$11,$3A,$11,$3A,$11
                    db $80,$12,$00,$00,$22,$01,$AC,$01
                    db $AC,$01,$04,$05,$2C,$06,$F8,$06
                    db $94,$07,$CE,$07,$3E,$15,$08,$08
                    db $A0,$08,$00,$0A,$A8,$0A,$76,$0B
                    db $22,$0C,$FA,$0D,$A4,$0F,$BC,$11
                    db $58,$15,$22,$01,$EA,$11,$AA,$15
                    db $DA,$15,$3E,$15,$DA,$15,$DA,$15
                    db $4A,$15,$58,$15,$00,$00,$76,$0B
                    db $94,$07,$F8,$06,$AC,$01,$04,$05
                    db $A4,$0F,$BC,$11,$EA,$11,$0E,$12
                    db $94,$07,$68,$15,$32,$00,$32,$00
                    db $F4,$14,$10,$09,$28,$15,$32,$00
                    db $0E,$15,$68,$06,$68,$06,$68,$06
                    db $C8,$15,$68,$06,$A0,$13,$36,$13
                    db $68,$06,$68,$06,$84,$15,$FE,$00
                    db $B9,$B8,$B6,$FE,$00,$BE,$C3,$C6
                    db $FE,$B4,$B1,$BC,$BD,$B0,$B5,$FE
                    db $C0,$C1,$C0,$C1,$C0,$C4,$FE,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B6,$FE,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C6,$FE,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C6,$FF,$FE
                    db $B9,$B8,$FE,$BE,$C3,$FE,$BE,$C3
                    db $FF,$FE,$00,$00,$BA,$B0,$B5,$FE
                    db $00,$BF,$C1,$C0,$C4,$FE,$00,$B9
                    db $B3,$B2,$B3,$B6,$FE,$00,$BE,$C3
                    db $C2,$C3,$C6,$FE,$00,$BA,$BC,$BD
                    db $BC,$BD,$B0,$B5,$FE,$BF,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C4,$FE,$B9,$B3
                    db $B2,$B3,$B2,$B3,$B2,$B3,$FE,$BE
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$FE
                    db $BE,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $FF,$FE,$00,$00,$00,$00,$C7,$FE
                    db $00,$00,$00,$BF,$C4,$FE,$00,$00
                    db $00,$B9,$B3,$B6,$00,$B9,$B8,$BB
                    db $B8,$B6,$FE,$00,$00,$00,$BE,$C3
                    db $C6,$00,$BE,$C3,$C2,$C3,$C6,$FE
                    db $00,$00,$B4,$B1,$BC,$BD,$B0,$B1
                    db $BC,$BD,$BC,$BD,$B0,$B5,$FE,$00
                    db $00,$C0,$C1,$C0,$C1,$C0,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C4,$FE,$B9,$B8
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B2,$B3,$B2,$B3,$FE,$BE,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$FE,$BE,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$FF,$FE,$00,$00,$00,$00
                    db $C7,$FE,$00,$00,$00,$BF,$C4,$FE
                    db $00,$B9,$B8,$BB,$B3,$BB,$B8,$B6
                    db $FE,$00,$BE,$C3,$C2,$C3,$C2,$C3
                    db $C6,$FE,$B4,$B1,$BC,$BD,$BC,$BD
                    db $BC,$BD,$B0,$B5,$FE,$C0,$C1,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C4,$FE
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B2,$B3,$FE,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$FE,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $FF,$FE,$B6,$FE,$C6,$FE,$C6,$FF
                    db $FE,$B4,$B1,$FE,$C0,$C1,$FE,$B2
                    db $B3,$FE,$C2,$C3,$FE,$C2,$C3,$FF
                    db $FE,$00,$00,$00,$00,$00,$B9,$B8
                    db $B6,$FE,$00,$00,$00,$00,$00,$BE
                    db $C3,$C6,$FE,$00,$00,$00,$00,$B4
                    db $B1,$BC,$BD,$B0,$B5,$FE,$00,$00
                    db $00,$00,$C0,$C1,$C0,$C1,$C0,$C4
                    db $FE,$B9,$B8,$BB,$B8,$B2,$B3,$B2
                    db $B3,$B2,$B3,$FE,$BE,$C3,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$FE,$BE
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$FF,$FE,$00,$00,$00,$00,$C7
                    db $00,$C7,$FE,$00,$00,$00,$BF,$C4
                    db $BF,$C4,$FE,$00,$B9,$B8,$BB,$B3
                    db $BB,$B3,$B6,$FE,$00,$BE,$C3,$C2
                    db $C3,$C2,$C3,$C6,$FE,$B4,$B1,$BC
                    db $BD,$BC,$BD,$BC,$BD,$B0,$B5,$FE
                    db $C0,$C1,$C0,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C4,$FE,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$FE,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C2,$C3,$C2,$C3
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$FF,$FE,$00,$00,$BA
                    db $B0,$B5,$00,$00,$00,$C7,$FE,$00
                    db $BF,$C1,$C0,$C4,$00,$00,$BF,$C4
                    db $FE,$00,$B9,$B3,$B2,$B3,$B6,$00
                    db $B9,$B3,$BB,$B8,$B6,$FE,$00,$BE
                    db $C3,$C2,$C3,$C6,$00,$BE,$C3,$C2
                    db $C3,$C6,$FE,$B4,$B1,$BC,$BD,$BC
                    db $BD,$B0,$B1,$BC,$BD,$BC,$BD,$B0
                    db $B1,$B0,$B5,$FE,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C4,$FE,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B6,$FE,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C6
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C6,$FF,$FE,$00,$00,$00,$00
                    db $C7,$FE,$00,$00,$00,$BF,$C4,$FE
                    db $00,$B9,$B8,$BB,$B3,$B6,$FE,$00
                    db $BE,$C3,$C2,$C3,$C6,$FE,$B4,$B1
                    db $BC,$BD,$BC,$BD,$B0,$B5,$FE,$C0
                    db $C1,$C0,$C1,$C0,$C1,$C0,$C4,$FE
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$FE,$C2,$C3,$C2,$C3,$C2,$C3
                    db $C2,$C3,$FF,$FE,$B4,$B1,$B0,$B5
                    db $FE,$C0,$C1,$C0,$C8,$FE,$B2,$B3
                    db $B2,$B3,$B6,$FE,$C2,$C3,$C2,$C3
                    db $C6,$FE,$C2,$C3,$C2,$C3,$C6,$FF
                    db $FE,$00,$00,$00,$00,$00,$B4,$B5
                    db $00,$C7,$B4,$B5,$FE,$00,$00,$00
                    db $00,$00,$C0,$C8,$BF,$C8,$C0,$C8
                    db $FE,$00,$00,$00,$B9,$B8,$B2,$B3
                    db $BB,$B3,$B2,$B3,$B6,$FE,$00,$00
                    db $00,$BE,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C6,$FE,$00,$BA,$B0,$B1,$BC
                    db $BD,$BC,$BD,$BC,$BD,$BC,$BD,$B0
                    db $B5,$FE,$BF,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C1,$C0,$C1,$C0,$C4
                    db $FE,$B9,$B3,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B2,$B3,$BB
                    db $B8,$B6,$FE,$BE,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C6,$FE,$BE,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C6,$FF,$FE
                    db $00,$00,$B4,$B1,$B0,$B5,$FE,$00
                    db $00,$C0,$C1,$C0,$C4,$FE,$BB,$B8
                    db $B2,$B3,$B2,$B3,$B6,$FE,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C6,$FE,$C2,$C3
                    db $C2,$C3,$C2,$C3,$C6,$FF,$FE,$00
                    db $00,$00,$00,$00,$00,$00,$C7,$FE
                    db $00,$00,$00,$00,$00,$00,$BF,$C4
                    db $FE,$00,$00,$B9,$B8,$B6,$00,$B9
                    db $B3,$BB,$B8,$B6,$FE,$00,$00,$BE
                    db $C3,$C6,$00,$BE,$C3,$C2,$C3,$C6
                    db $FE,$00,$00,$BA,$BC,$BD,$B0,$B1
                    db $BC,$BD,$BC,$BD,$B0,$B5,$FE,$00
                    db $BF,$C1,$C0,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C4,$FE,$00,$B9,$B3
                    db $B2,$B3,$B2,$B3,$B2,$B3,$B2,$B3
                    db $B2,$B3,$B6,$FE,$00,$BE,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C6,$FE,$B4,$B1,$BC,$BD,$BC
                    db $BD,$BC,$BD,$BC,$BD,$BC,$BD,$BC
                    db $BD,$B0,$B5,$FE,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C1,$C0,$C1,$C0,$C1
                    db $C0,$C1,$C0,$C4,$FE,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B2,$B3,$B2
                    db $B3,$B2,$B3,$B2,$B3,$B6,$FE,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C6
                    db $FE,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C2,$C3,$C2,$C3,$C2,$C3,$C2
                    db $C3,$C6,$FF,$03,$04,$05,$FE,$12
                    db $13,$16,$06,$07,$FE,$12,$13,$16
                    db $16,$16,$17,$18,$FE,$12,$13,$16
                    db $16,$16,$16,$08,$09,$18,$FE,$12
                    db $13,$16,$16,$16,$16,$16,$16,$19
                    db $1A,$18,$FE,$12,$13,$16,$16,$16
                    db $16,$16,$16,$16,$16,$0A,$1C,$18
                    db $FE,$12,$13,$16,$16,$16,$16,$16
                    db $16,$16,$16,$16,$08,$1B,$1C,$18
                    db $FE,$12,$13,$16,$16,$16,$16,$16
                    db $16,$16,$16,$16,$16,$16,$19,$0C
                    db $0B,$18,$FE,$12,$13,$16,$16,$16
                    db $16,$16,$16,$16,$16,$16,$16,$16
                    db $16,$16,$0A,$1C,$0B,$18,$FE,$12
                    db $13,$16,$16,$16,$16,$16,$16,$16
                    db $16,$16,$16,$16,$16,$16,$16,$08
                    db $1B,$1C,$0B,$18,$FE,$12,$13,$16
                    db $16,$16,$16,$16,$16,$16,$16,$16
                    db $16,$16,$16,$16,$16,$16,$16,$19
                    db $1C,$1C,$0B,$18,$FF,$FE,$13,$24
                    db $FE,$FE,$13,$23,$16,$16,$16,$16
                    db $32,$FF,$FE,$13,$27,$FE,$13,$2C
                    db $2D,$26,$FE,$13,$20,$2E,$2F,$FE
                    db $13,$16,$16,$16,$16,$16,$24,$FE
                    db $13,$16,$16,$16,$16,$16,$16,$16
                    db $16,$0A,$32,$FF,$FE,$13,$23,$FE
                    db $13,$20,$FF,$FE,$13,$24,$FE,$FE
                    db $13,$27,$16,$16,$26,$FE,$FF,$FE
                    db $FE,$13,$24,$FE,$13,$16,$16,$16
                    db $2B,$FE,$FE,$13,$16,$16,$16,$25
                    db $16,$16,$16,$26,$FE,$13,$16,$23
                    db $16,$24,$16,$16,$16,$24,$FE,$13
                    db $16,$20,$16,$16,$16,$16,$16,$27
                    db $FF,$FE,$13,$24,$FE,$13,$16,$16
                    db $25,$FE,$13,$26,$FE,$13,$16,$16
                    db $16,$24,$16,$27,$FE,$13,$16,$16
                    db $16,$16,$16,$2C,$2D,$16,$0A,$32
                    db $FF,$FE,$FE,$13,$16,$16,$25,$FE
                    db $13,$16,$16,$27,$FE,$13,$16,$16
                    db $16,$16,$2C,$2D,$FE,$13,$24,$23
                    db $16,$16,$16,$2E,$2F,$16,$0A,$32
                    db $FE,$13,$16,$16,$16,$16,$16,$16
                    db $16,$16,$16,$08,$1B,$33,$FE,$13
                    db $16,$16,$16,$16,$28,$20,$22,$FE
                    db $13,$16,$16,$16,$16,$16,$29,$2A
                    db $16,$16,$16,$16,$26,$21,$0A,$30
                    db $FE,$13,$16,$16,$16,$16,$16,$16
                    db $16,$16,$16,$16,$16,$16,$16,$20
                    db $FF,$1A,$1B,$FE,$01,$02,$FE,$01
                    db $02,$FE,$01,$02,$FE,$01,$02,$FE
                    db $01,$02,$FE,$01,$02,$FE,$01,$26
                    db $FE,$2C,$2D,$FE,$30,$31,$32,$FF
                    db $04,$05,$06,$07,$FE,$0D,$0E,$0F
                    db $10,$FE,$16,$17,$18,$19,$FE,$1E
                    db $1F,$20,$21,$FE,$1E,$17,$18,$21
                    db $FE,$27,$1F,$28,$29,$FF,$FE,$11
                    db $14,$FE,$1C,$1D,$FF,$FE,$22,$23
                    db $FE,$24,$25,$FE,$2A,$2B,$FE,$2E
                    db $2F,$FE,$33,$34,$FF,$FE,$41,$42
                    db $43,$44,$FE,$45,$46,$47,$48,$FE
                    db $49,$4A,$4B,$4C,$FE,$4D,$4E,$4F
                    db $50,$FE,$51,$52,$53,$54,$FF,$FE
                    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
                    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
                    db $FE,$12,$13,$12,$13,$12,$13,$12
                    db $13,$12,$13,$12,$13,$12,$13,$12
                    db $13,$FE,$36,$37,$38,$36,$39,$3A
                    db $3B,$3B,$36,$3A,$3B,$3B,$3B,$36
                    db $3A,$38,$FE,$3C,$3D,$3E,$3C,$3F
                    db $3D,$3E,$3E,$3C,$3D,$3E,$3E,$3E
                    db $3C,$3D,$3E,$FF,$22,$23,$FE,$24
                    db $25,$FE,$2A,$2B,$FE,$33,$34,$FF
                    db $08,$FE,$0C,$FF,$14,$15,$16,$17
                    db $FE,$1D,$1E,$1F,$20,$FE,$1D,$1E
                    db $1F,$20,$FE,$1D,$2A,$2B,$20,$FF
                    db $18,$19,$1A,$1B,$FE,$21,$22,$23
                    db $24,$FE,$21,$22,$23,$24,$FE,$21
                    db $22,$23,$24,$FF,$00,$00,$00,$00
                    db $01,$02,$FE,$00,$00,$01,$03,$05
                    db $06,$04,$02,$FE,$01,$03,$05,$09
                    db $09,$09,$09,$06,$04,$02,$FE,$05
                    db $09,$09,$09,$09,$09,$09,$09,$09
                    db $06,$FF,$01,$03,$04,$03,$04,$02
                    db $FE,$07,$08,$09,$09,$08,$0A,$FE
                    db $0B,$0C,$09,$09,$0C,$0D,$0E,$FE
                    db $11,$09,$09,$09,$09,$12,$13,$FE
                    db $11,$18,$19,$1A,$1B,$12,$13,$FE
                    db $11,$21,$22,$23,$24,$12,$13,$FE
                    db $11,$21,$22,$23,$24,$12,$13,$FE
                    db $11,$21,$22,$23,$24,$12,$13,$FF
                    db $02,$10,$10,$10,$10,$10,$10,$10
                    db $10,$10,$10,$10,$10,$10,$10,$01
                    db $FE,$35,$04,$03,$04,$03,$04,$03
                    db $04,$03,$04,$03,$04,$03,$04,$03
                    db $36,$FF,$00,$00,$00,$00,$00,$00
                    db $00,$07,$01,$02,$03,$04,$01,$02
                    db $03,$04,$00,$00,$00,$00,$00,$00
                    db $10,$11,$0A,$0B,$0C,$0D,$0A,$0B
                    db $0C,$0D,$00,$00,$17,$18,$00,$00
                    db $19,$15,$16,$12,$14,$15,$16,$12
                    db $14,$15,$23,$24,$25,$22,$23,$24
                    db $25,$1F,$20,$21,$1E,$1F,$20,$21
                    db $1E,$1F,$FF,$08,$09,$03,$04,$05
                    db $06,$00,$00,$00,$00,$00,$07,$08
                    db $09,$03,$04,$0A,$0B,$0C,$0D,$0E
                    db $0F,$00,$00,$00,$00,$10,$11,$0A
                    db $0B,$0C,$0D,$16,$12,$14,$15,$16
                    db $12,$17,$18,$00,$00,$19,$15,$16
                    db $12,$14,$15,$20,$21,$1E,$1F,$20
                    db $21,$1E,$22,$23,$24,$25,$1F,$20
                    db $21,$1E,$26,$FF,$01,$02,$03,$04
                    db $08,$09,$03,$04,$08,$09,$03,$04
                    db $05,$06,$00,$00,$0A,$0B,$0C,$0D
                    db $0A,$0B,$0C,$0D,$0A,$0B,$0C,$0D
                    db $0E,$0F,$00,$00,$0A,$12,$13,$0D
                    db $0A,$12,$13,$0D,$0A,$12,$14,$15
                    db $16,$12,$17,$18,$1A,$1B,$1C,$1D
                    db $1A,$1B,$1C,$1D,$1A,$1B,$1E,$1F
                    db $20,$21,$1E,$22,$FF,$91,$E0,$42
                    db $E0,$10,$E0,$50,$A8,$80,$A8,$00
                    db $E0,$60,$8C,$B0,$8C,$00,$E0,$50
                    db $A8,$80,$A8,$00,$E0,$70,$70,$90
                    db $70,$50,$A8,$B0,$A8,$70,$9C,$00
                    db $E0,$00,$E0,$40,$A8,$A0,$A8,$00
                    db $E0,$70,$24,$E0,$24,$F0,$E3,$12
                    db $E0,$60,$E0,$50,$E0,$43,$E0,$10
                    db $45,$10,$6D,$00,$61,$30,$15,$20
                    db $55,$00,$29,$60,$A9,$70,$C9,$82
                    db $AD,$92,$CD,$A0,$B9,$B0,$D9,$40
                    db $2D,$50,$4D,$07,$20,$25,$00,$15
                    db $1C,$00,$E0,$10,$45,$10,$6D,$30
                    db $15,$20,$55,$00,$29,$40,$2D,$50
                    db $4D,$07,$20,$25,$00,$15,$1C,$00
                    db $E0,$10,$45,$10,$6D,$00,$61,$30
                    db $15,$20,$55,$00,$29,$60,$A9,$70
                    db $C9,$82,$AD,$92,$CD,$A0,$B9,$B0
                    db $D9,$40,$2D,$50,$4D,$07,$20,$25
                    db $00,$15,$1C,$00,$E0,$10,$45,$10
                    db $6D,$30,$15,$20,$55,$00,$29,$40
                    db $2D,$50,$4D,$07,$20,$25,$00,$15
                    db $1C,$00,$E0,$10,$45,$10,$6D,$00
                    db $61,$30,$15,$20,$55,$00,$29,$60
                    db $A9,$70,$C9,$82,$AD,$92,$CD,$A0
                    db $B9,$B0,$D9,$40,$2D,$50,$4D,$07
                    db $20,$25,$00,$15,$1C,$00,$E0,$10
                    db $45,$10,$6D,$30,$15,$20,$55,$00
                    db $29,$40,$2D,$50,$4D,$07,$20,$25
                    db $00,$15,$1C,$00,$E0,$10,$45,$10
                    db $6D,$00,$61,$30,$15,$20,$55,$00
                    db $29,$60,$A9,$70,$C9,$82,$AD,$92
                    db $CD,$A0,$B9,$B0,$D9,$40,$2D,$50
                    db $4D,$07,$20,$25,$00,$15,$1C,$00
                    db $E0,$10,$45,$10,$6D,$30,$15,$20
                    db $55,$00,$29,$40,$2D,$50,$4D,$07
                    db $20,$25,$00,$15,$1C,$F0,$E3,$91
                    db $E0,$4E,$E0,$10,$E0,$A0,$E0,$03
                    db $A8,$00,$BC,$00,$E0,$02,$A8,$00
                    db $E0,$00,$A4,$01,$AC,$00,$E0,$03
                    db $A8,$00,$E0,$01,$A4,$01,$AC,$08
                    db $BC,$00,$E0,$F0,$E3,$46,$E0,$50
                    db $E0,$03,$00,$03,$10,$19,$40,$19
                    db $50,$3F,$40,$26,$08,$26,$18,$00
                    db $E0,$03,$0C,$19,$4C,$03,$1C,$19
                    db $5C,$3F,$40,$26,$04,$26,$14,$00
                    db $E0,$03,$08,$19,$48,$3A,$40,$26
                    db $00,$49,$54,$45,$9C,$60,$30,$00
                    db $E0,$07,$0C,$13,$8C,$07,$18,$13
                    db $98,$3F,$80,$26,$04,$50,$30,$60
                    db $60,$00,$E0,$50,$28,$07,$00,$13
                    db $80,$07,$10,$13,$90,$3F,$80,$80
                    db $54,$00,$E0,$07,$00,$13,$80,$07
                    db $14,$13,$94,$3F,$80,$80,$44,$F0
                    db $E3,$11,$E0,$4B,$E0,$31,$E0,$10
                    db $00,$11,$0C,$12,$10,$13,$1C,$14
                    db $24,$15,$28,$16,$30,$16,$4C,$17
                    db $54,$18,$5C,$19,$60,$1A,$64,$1B
                    db $68,$1C,$6C,$16,$78,$1D,$80,$1E
                    db $90,$07,$81,$10,$85,$11,$99,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$07,$81,$10,$85,$10
                    db $99,$00,$E0,$10,$00,$11,$0C,$12
                    db $10,$13,$1C,$14,$24,$15,$28,$16
                    db $30,$16,$4C,$17,$54,$18,$5C,$19
                    db $60,$1A,$64,$1B,$68,$1C,$6C,$16
                    db $78,$1D,$80,$1E,$90,$07,$81,$10
                    db $85,$11,$99,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$07
                    db $81,$10,$85,$10,$99,$00,$E0,$30
                    db $00,$31,$18,$20,$20,$32,$24,$1B
                    db $2C,$23,$30,$33,$38,$34,$40,$35
                    db $48,$36,$54,$37,$58,$38,$5C,$39
                    db $64,$3A,$68,$3B,$6C,$3C,$70,$3D
                    db $74,$3E,$78,$3F,$94,$07,$81,$11
                    db $89,$10,$99,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$07
                    db $81,$10,$85,$10,$99,$00,$E0,$10
                    db $00,$11,$0C,$12,$10,$13,$1C,$14
                    db $24,$15,$28,$16,$30,$16,$4C,$17
                    db $54,$18,$5C,$19,$60,$1A,$64,$1B
                    db $68,$1C,$6C,$16,$78,$1D,$80,$1E
                    db $90,$07,$81,$10,$85,$11,$99,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$07,$81,$10,$85,$10
                    db $99,$00,$E0,$10,$00,$11,$0C,$12
                    db $10,$13,$1C,$14,$24,$15,$28,$16
                    db $30,$16,$4C,$17,$54,$18,$5C,$19
                    db $60,$1A,$64,$1B,$68,$1C,$6C,$16
                    db $78,$1D,$80,$1E,$90,$07,$81,$10
                    db $85,$11,$99,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$07
                    db $81,$10,$85,$10,$99,$F0,$E3,$11
                    db $E0,$4B,$E0,$31,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$00,$E0,$1F
                    db $18,$20,$20,$21,$24,$22,$2C,$23
                    db $30,$20,$38,$24,$40,$25,$50,$26
                    db $58,$27,$5C,$28,$64,$29,$6C,$2A
                    db $74,$2B,$78,$2C,$88,$2D,$90,$2F
                    db $98,$07,$81,$10,$85,$10,$99,$00
                    db $E0,$10,$00,$11,$0C,$12,$10,$13
                    db $1C,$14,$24,$15,$28,$16,$30,$16
                    db $4C,$17,$54,$18,$5C,$19,$60,$1A
                    db $64,$1B,$68,$1C,$6C,$16,$78,$1D
                    db $80,$1E,$90,$07,$81,$10,$85,$11
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$00,$E0,$30,$00,$31
                    db $18,$20,$20,$32,$24,$1B,$2C,$23
                    db $30,$33,$38,$34,$40,$35,$48,$36
                    db $54,$37,$58,$38,$5C,$39,$64,$3A
                    db $68,$3B,$6C,$3C,$70,$3D,$74,$3E
                    db $78,$3F,$94,$07,$81,$11,$89,$10
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$10,$00,$11,$0C,$12
                    db $10,$13,$1C,$14,$24,$15,$28,$16
                    db $30,$16,$4C,$17,$54,$18,$5C,$19
                    db $60,$1A,$64,$1B,$68,$1C,$6C,$16
                    db $78,$1D,$80,$1E,$90,$07,$81,$10
                    db $85,$11,$99,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$07
                    db $81,$10,$85,$10,$99,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$00,$E0,$1F
                    db $18,$20,$20,$21,$24,$22,$2C,$23
                    db $30,$20,$38,$24,$40,$25,$50,$26
                    db $58,$27,$5C,$28,$64,$29,$6C,$2A
                    db $74,$2B,$78,$2C,$88,$2D,$90,$2F
                    db $98,$07,$81,$10,$85,$10,$99,$F0
                    db $E3,$4B,$E0,$11,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$00,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$00
                    db $E0,$30,$00,$31,$18,$20,$20,$32
                    db $24,$1B,$2C,$23,$30,$33,$38,$34
                    db $40,$35,$48,$36,$54,$37,$58,$38
                    db $5C,$39,$64,$3A,$68,$3B,$6C,$3C
                    db $70,$3D,$74,$3E,$78,$3F,$94,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$F0
                    db $E3,$91,$E0,$45,$E0,$10,$E0,$20
                    db $88,$10,$B8,$00,$7C,$00,$E0,$90
                    db $58,$A0,$48,$00,$E0,$B0,$98,$00
                    db $E0,$10,$A4,$00,$68,$C0,$5C,$00
                    db $E0,$00,$E0,$10,$A0,$00,$64,$D0
                    db $90,$00,$E0,$10,$A4,$00,$68,$C0
                    db $5C,$00,$E0,$00,$E0,$10,$A0,$00
                    db $64,$D0,$90,$F0,$E3,$91,$E0,$70
                    db $E0,$48,$E0,$20,$E0,$00,$69,$63
                    db $81,$70,$89,$80,$91,$10,$95,$20
                    db $99,$30,$9D,$93,$A1,$A0,$B1,$72
                    db $B5,$00,$E0,$B0,$81,$D0,$85,$62
                    db $89,$80,$95,$C0,$A1,$93,$A5,$A0
                    db $B5,$61,$B9,$30,$68,$10,$70,$30
                    db $98,$00,$E0,$10,$69,$21,$6D,$30
                    db $75,$B0,$79,$D0,$7D,$B0,$81,$D0
                    db $85,$73,$89,$C0,$99,$90,$9D,$C0
                    db $A1,$96,$A5,$30,$5C,$00,$E0,$60
                    db $61,$80,$65,$10,$69,$22,$6D,$30
                    db $79,$90,$81,$A0,$85,$74,$89,$60
                    db $9D,$97,$A1,$10,$40,$00,$E0,$60
                    db $81,$80,$85,$40,$99,$50,$9D,$90
                    db $A1,$A0,$A5,$80,$A9,$B0,$B5,$F0
                    db $B9,$70,$BD,$10,$60,$10,$AC,$00
                    db $E0,$07,$82,$77,$A1,$00,$E0,$07
                    db $82,$77,$A1,$F0,$E3,$91,$E0,$4E
                    db $E0,$10,$E0,$A0,$E0,$03,$A8,$00
                    db $BC,$00,$E0,$02,$A8,$00,$E0,$00
                    db $A4,$01,$AC,$00,$E0,$03,$A8,$00
                    db $E0,$01,$A4,$00,$E0,$01,$A4,$01
                    db $AC,$08,$BC,$00,$E0,$F0,$E3,$46
                    db $E0,$50,$E0,$07,$00,$07,$10,$17
                    db $60,$17,$70,$3F,$60,$26,$08,$90
                    db $B8,$00,$E0,$05,$00,$05,$10,$17
                    db $60,$17,$70,$3F,$60,$26,$08,$A0
                    db $B4,$00,$E0,$05,$00,$17,$60,$39
                    db $60,$47,$70,$60,$48,$90,$A8,$50
                    db $38,$00,$E0,$05,$10,$17,$70,$3B
                    db $68,$47,$64,$60,$58,$00,$E0,$05
                    db $00,$17,$60,$05,$10,$17,$70,$3F
                    db $60,$26,$08,$60,$58,$90,$B8,$00
                    db $E0,$05,$00,$17,$60,$05,$10,$17
                    db $70,$3F,$60,$26,$08,$80,$54,$00
                    db $E0,$3F,$60,$80,$44,$80,$50,$00
                    db $E0,$3F,$60,$80,$44,$80,$50,$F0
                    db $E3,$91,$E0,$42,$E0,$10,$E0,$50
                    db $B0,$80,$B0,$00,$E0,$70,$6C,$90
                    db $6C,$F3,$A4,$00,$E0,$60,$74,$B0
                    db $74,$40,$AC,$A0,$AC,$00,$E0,$60
                    db $80,$B0,$80,$F9,$A4,$00,$E0,$00
                    db $E0,$60,$90,$60,$40,$C0,$40,$F2
                    db $B4,$00,$E0,$70,$38,$E0,$38,$F4
                    db $A4,$F0,$E3,$91,$E0,$42,$E0,$10
                    db $E0,$50,$B0,$80,$B0,$00,$E0,$70
                    db $6C,$90,$6C,$F3,$A4,$00,$E0,$60
                    db $74,$B0,$74,$40,$AC,$A0,$AC,$00
                    db $E0,$60,$80,$B0,$80,$F9,$A4,$00
                    db $E0,$00,$E0,$60,$90,$60,$40,$C0
                    db $40,$F2,$B4,$00,$E0,$70,$38,$E0
                    db $38,$F4,$A4,$F0,$E3,$91,$E0,$4E
                    db $E0,$10,$E0,$A0,$E0,$03,$A8,$00
                    db $BC,$00,$E0,$02,$A8,$00,$E0,$00
                    db $A4,$01,$AC,$00,$E0,$03,$A8,$00
                    db $E0,$01,$A4,$01,$AC,$08,$BC,$00
                    db $E0,$F0,$E3,$46,$E0,$50,$E0,$07
                    db $00,$07,$10,$17,$60,$17,$70,$3F
                    db $60,$26,$08,$90,$B8,$00,$E0,$05
                    db $00,$05,$10,$17,$60,$17,$70,$3F
                    db $60,$26,$08,$A0,$B4,$00,$E0,$05
                    db $00,$17,$60,$39,$60,$47,$70,$60
                    db $48,$90,$A8,$50,$38,$00,$E0,$05
                    db $10,$17,$70,$3B,$68,$47,$64,$60
                    db $58,$00,$E0,$05,$00,$17,$60,$05
                    db $10,$17,$70,$3F,$60,$26,$08,$60
                    db $58,$90,$B8,$00,$E0,$05,$00,$17
                    db $60,$05,$10,$17,$70,$3F,$60,$26
                    db $08,$80,$54,$00,$E0,$3F,$60,$80
                    db $44,$80,$50,$00,$E0,$3F,$60,$80
                    db $44,$80,$50,$F0,$E3,$91,$E0,$45
                    db $E0,$10,$E0,$20,$88,$10,$B8,$00
                    db $7C,$00,$E0,$90,$58,$A0,$48,$00
                    db $E0,$B0,$98,$00,$E0,$10,$A4,$00
                    db $68,$C0,$5C,$00,$E0,$00,$E0,$10
                    db $A0,$00,$64,$D0,$90,$00,$E0,$20
                    db $88,$10,$B8,$00,$7C,$00,$E0,$90
                    db $58,$A0,$48,$00,$E0,$B0,$98,$00
                    db $E0,$10,$A4,$00,$68,$C0,$5C,$00
                    db $E0,$00,$E0,$10,$A0,$00,$64,$D0
                    db $90,$00,$E0,$10,$A0,$00,$64,$D0
                    db $90,$00,$E0,$20,$88,$10,$B8,$00
                    db $7C,$00,$E0,$90,$58,$A0,$48,$00
                    db $E0,$B0,$98,$00,$E0,$10,$A4,$00
                    db $68,$C0,$5C,$F0,$E3,$12,$E0,$60
                    db $E0,$50,$E0,$43,$E0,$10,$45,$10
                    db $6D,$00,$61,$30,$15,$20,$55,$00
                    db $29,$60,$A9,$70,$C9,$82,$AD,$92
                    db $CD,$A0,$B9,$B0,$D9,$40,$2D,$50
                    db $4D,$07,$20,$25,$00,$15,$1C,$00
                    db $E0,$10,$45,$10,$6D,$30,$15,$20
                    db $55,$00,$29,$40,$2D,$50,$4D,$07
                    db $20,$25,$00,$15,$1C,$00,$E0,$10
                    db $45,$10,$6D,$00,$61,$30,$15,$20
                    db $55,$00,$29,$60,$A9,$70,$C9,$82
                    db $AD,$92,$CD,$A0,$B9,$B0,$D9,$40
                    db $2D,$50,$4D,$07,$20,$25,$00,$15
                    db $1C,$00,$E0,$10,$45,$10,$6D,$30
                    db $15,$20,$55,$00,$29,$40,$2D,$50
                    db $4D,$07,$20,$25,$00,$15,$1C,$00
                    db $E0,$10,$45,$10,$6D,$00,$61,$30
                    db $15,$20,$55,$00,$29,$60,$A9,$70
                    db $C9,$82,$AD,$92,$CD,$A0,$B9,$B0
                    db $D9,$40,$2D,$50,$4D,$07,$20,$25
                    db $00,$15,$1C,$00,$E0,$10,$45,$10
                    db $6D,$30,$15,$20,$55,$00,$29,$40
                    db $2D,$50,$4D,$07,$20,$25,$00,$15
                    db $1C,$00,$E0,$10,$45,$10,$6D,$00
                    db $61,$30,$15,$20,$55,$00,$29,$60
                    db $A9,$70,$C9,$82,$AD,$92,$CD,$A0
                    db $B9,$B0,$D9,$40,$2D,$50,$4D,$07
                    db $20,$25,$00,$15,$1C,$00,$E0,$10
                    db $45,$10,$6D,$30,$15,$20,$55,$00
                    db $29,$40,$2D,$50,$4D,$07,$20,$25
                    db $00,$15,$1C,$F0,$E3,$90,$E0,$4E
                    db $E0,$10,$E0,$A0,$E0,$03,$A8,$00
                    db $BC,$00,$E0,$02,$A8,$00,$E0,$00
                    db $A4,$01,$AC,$00,$E0,$03,$A8,$00
                    db $E0,$01,$A4,$01,$AC,$08,$BC,$00
                    db $E0,$F0,$E3,$46,$E0,$50,$E0,$03
                    db $00,$03,$10,$19,$40,$19,$50,$3F
                    db $40,$26,$08,$26,$18,$00,$E0,$03
                    db $00,$03,$10,$19,$40,$19,$50,$3F
                    db $40,$26,$08,$26,$18,$00,$E0,$03
                    db $0C,$19,$4C,$03,$1C,$19,$5C,$3F
                    db $40,$26,$04,$26,$14,$00,$E0,$03
                    db $08,$19,$48,$3A,$40,$26,$00,$49
                    db $54,$45,$9C,$60,$30,$00,$E0,$07
                    db $0C,$13,$8C,$07,$18,$13,$98,$3F
                    db $80,$26,$04,$50,$30,$60,$60,$00
                    db $E0,$50,$28,$07,$00,$13,$80,$07
                    db $10,$13,$90,$3F,$80,$80,$54,$00
                    db $E0,$07,$00,$13,$80,$07,$14,$13
                    db $94,$3F,$80,$80,$44,$00,$E0,$07
                    db $00,$13,$80,$07,$14,$13,$94,$3F
                    db $80,$80,$44,$F0,$E3,$91,$E0,$10
                    db $E0,$45,$E0,$10,$A4,$00,$68,$20
                    db $5C,$00,$E0,$00,$6C,$00,$E0,$30
                    db $40,$40,$5C,$00,$E0,$20,$50,$60
                    db $90,$00,$E0,$50,$A0,$20,$84,$70
                    db $78,$00,$E0,$80,$4C,$00,$E0,$90
                    db $40,$00,$E0,$50,$A0,$20,$84,$70
                    db $78,$00,$E0,$80,$4C,$00,$E0,$90
                    db $40,$F0,$E3,$91,$E0,$70,$E0,$48
                    db $E0,$20,$E0,$00,$69,$63,$81,$70
                    db $89,$80,$91,$10,$95,$20,$99,$30
                    db $9D,$93,$A1,$A0,$B1,$72,$B5,$00
                    db $E0,$B0,$81,$D0,$85,$62,$89,$80
                    db $95,$C0,$A1,$93,$A5,$A0,$B5,$61
                    db $B9,$30,$68,$10,$70,$30,$98,$00
                    db $E0,$10,$69,$21,$6D,$30,$75,$B0
                    db $79,$D0,$7D,$B0,$81,$D0,$85,$73
                    db $89,$C0,$99,$90,$9D,$C0,$A1,$96
                    db $A5,$30,$5C,$00,$E0,$60,$61,$80
                    db $65,$10,$69,$22,$6D,$30,$79,$90
                    db $81,$A0,$85,$74,$89,$60,$9D,$97
                    db $A1,$10,$40,$00,$E0,$60,$81,$80
                    db $85,$40,$99,$50,$9D,$90,$A1,$A0
                    db $A5,$80,$A9,$B0,$B5,$F0,$B9,$70
                    db $BD,$10,$60,$10,$AC,$00,$E0,$07
                    db $82,$77,$A1,$00,$E0,$07,$82,$77
                    db $A1,$F0,$E3,$91,$E0,$10,$E0,$B0
                    db $E0,$C0,$E0,$10,$90,$00,$E0,$00
                    db $88,$10,$B0,$25,$A4,$00,$E0,$10
                    db $68,$20,$B4,$2F,$BC,$00,$E0,$10
                    db $88,$00,$B8,$00,$E0,$00,$A8,$10
                    db $98,$20,$A4,$00,$E0,$00,$68,$20
                    db $A4,$20,$B4,$2F,$BC,$00,$E0,$10
                    db $68,$20,$BC,$00,$E0,$F0,$E3,$46
                    db $E0,$50,$E0,$07,$00,$07,$10,$17
                    db $60,$17,$70,$3F,$60,$26,$08,$90
                    db $B8,$00,$E0,$05,$00,$05,$10,$17
                    db $60,$17,$70,$3F,$60,$26,$08,$90
                    db $B4,$00,$E0,$05,$00,$17,$60,$39
                    db $60,$47,$70,$60,$48,$90,$A8,$50
                    db $38,$00,$E0,$05,$10,$17,$70,$3B
                    db $68,$47,$64,$60,$58,$00,$E0,$05
                    db $00,$17,$60,$05,$10,$17,$70,$3F
                    db $60,$26,$08,$60,$58,$90,$B8,$00
                    db $E0,$05,$00,$17,$60,$05,$10,$17
                    db $70,$3F,$60,$26,$08,$00,$E0,$3F
                    db $60,$80,$44,$80,$50,$00,$E0,$3F
                    db $60,$80,$44,$80,$50,$F0,$E3,$11
                    db $E0,$4B,$E0,$31,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$00,$E0,$1F
                    db $18,$20,$20,$21,$24,$22,$2C,$23
                    db $30,$20,$38,$24,$40,$25,$50,$26
                    db $58,$27,$5C,$28,$64,$29,$6C,$2A
                    db $74,$2B,$78,$2C,$88,$2D,$90,$2F
                    db $98,$07,$81,$10,$85,$10,$99,$00
                    db $E0,$10,$00,$11,$0C,$12,$10,$13
                    db $1C,$14,$24,$15,$28,$16,$30,$16
                    db $4C,$17,$54,$18,$5C,$19,$60,$1A
                    db $64,$1B,$68,$1C,$6C,$16,$78,$1D
                    db $80,$1E,$90,$07,$81,$10,$85,$11
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$00,$E0,$30,$00,$31
                    db $18,$20,$20,$32,$24,$1B,$2C,$23
                    db $30,$33,$38,$34,$40,$35,$48,$36
                    db $54,$37,$58,$38,$5C,$39,$64,$3A
                    db $68,$3B,$6C,$3C,$70,$3D,$74,$3E
                    db $78,$3F,$94,$07,$81,$11,$89,$10
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$00,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$00,$E0,$1F
                    db $18,$20,$20,$21,$24,$22,$2C,$23
                    db $30,$20,$38,$24,$40,$25,$50,$26
                    db $58,$27,$5C,$28,$64,$29,$6C,$2A
                    db $74,$2B,$78,$2C,$88,$2D,$90,$2F
                    db $98,$07,$81,$10,$85,$10,$99,$00
                    db $E0,$10,$00,$11,$0C,$12,$10,$13
                    db $1C,$14,$24,$15,$28,$16,$30,$16
                    db $4C,$17,$54,$18,$5C,$19,$60,$1A
                    db $64,$1B,$68,$1C,$6C,$16,$78,$1D
                    db $80,$1E,$90,$07,$81,$10,$85,$11
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$00,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$F0,$E3,$11
                    db $E0,$4B,$E0,$31,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$00,$E0,$1F
                    db $18,$20,$20,$21,$24,$22,$2C,$23
                    db $30,$20,$38,$24,$40,$25,$50,$26
                    db $58,$27,$5C,$28,$64,$29,$6C,$2A
                    db $74,$2B,$78,$2C,$88,$2D,$90,$2F
                    db $98,$07,$81,$10,$85,$10,$99,$00
                    db $E0,$10,$00,$11,$0C,$12,$10,$13
                    db $1C,$14,$24,$15,$28,$16,$30,$16
                    db $4C,$17,$54,$18,$5C,$19,$60,$1A
                    db $64,$1B,$68,$1C,$6C,$16,$78,$1D
                    db $80,$1E,$90,$07,$81,$10,$85,$11
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$00,$E0,$30,$00,$31
                    db $18,$20,$20,$32,$24,$1B,$2C,$23
                    db $30,$33,$38,$34,$40,$35,$48,$36
                    db $54,$37,$58,$38,$5C,$39,$64,$3A
                    db $68,$3B,$6C,$3C,$70,$3D,$74,$3E
                    db $78,$3F,$94,$07,$81,$11,$89,$10
                    db $99,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$07,$81,$10
                    db $85,$10,$99,$10,$00,$11,$0C,$12
                    db $10,$13,$1C,$14,$24,$15,$28,$16
                    db $30,$16,$4C,$17,$54,$18,$5C,$19
                    db $60,$1A,$64,$1B,$68,$1C,$6C,$16
                    db $78,$1D,$80,$1E,$90,$07,$81,$10
                    db $85,$11,$99,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$07
                    db $81,$10,$85,$10,$99,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$07
                    db $81,$10,$85,$11,$99,$00,$E0,$1F
                    db $18,$20,$20,$21,$24,$22,$2C,$23
                    db $30,$20,$38,$24,$40,$25,$50,$26
                    db $58,$27,$5C,$28,$64,$29,$6C,$2A
                    db $74,$2B,$78,$2C,$88,$2D,$90,$2F
                    db $98,$07,$81,$10,$85,$10,$99,$F0
                    db $E3,$4B,$E0,$11,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$00,$E0,$10,$00,$11
                    db $0C,$12,$10,$13,$1C,$14,$24,$15
                    db $28,$16,$30,$16,$4C,$17,$54,$18
                    db $5C,$19,$60,$1A,$64,$1B,$68,$1C
                    db $6C,$16,$78,$1D,$80,$1E,$90,$00
                    db $E0,$30,$00,$31,$18,$20,$20,$32
                    db $24,$1B,$2C,$23,$30,$33,$38,$34
                    db $40,$35,$48,$36,$54,$37,$58,$38
                    db $5C,$39,$64,$3A,$68,$3B,$6C,$3C
                    db $70,$3D,$74,$3E,$78,$3F,$94,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$00
                    db $E0,$30,$00,$31,$18,$20,$20,$32
                    db $24,$1B,$2C,$23,$30,$33,$38,$34
                    db $40,$35,$48,$36,$54,$37,$58,$38
                    db $5C,$39,$64,$3A,$68,$3B,$6C,$3C
                    db $70,$3D,$74,$3E,$78,$3F,$94,$00
                    db $E0,$1F,$18,$20,$20,$21,$24,$22
                    db $2C,$23,$30,$20,$38,$24,$40,$25
                    db $50,$26,$58,$27,$5C,$28,$64,$29
                    db $6C,$2A,$74,$2B,$78,$2C,$88,$2D
                    db $90,$2F,$98,$00,$E0,$1F,$18,$20
                    db $20,$21,$24,$22,$2C,$23,$30,$20
                    db $38,$24,$40,$25,$50,$26,$58,$27
                    db $5C,$28,$64,$29,$6C,$2A,$74,$2B
                    db $78,$2C,$88,$2D,$90,$2F,$98,$10
                    db $00,$11,$0C,$12,$10,$13,$1C,$14
                    db $24,$15,$28,$16,$30,$16,$4C,$17
                    db $54,$18,$5C,$19,$60,$1A,$64,$1B
                    db $68,$1C,$6C,$16,$78,$1D,$80,$1E
                    db $90,$00,$E0,$1F,$18,$20,$20,$21
                    db $24,$22,$2C,$23,$30,$20,$38,$24
                    db $40,$25,$50,$26,$58,$27,$5C,$28
                    db $64,$29,$6C,$2A,$74,$2B,$78,$2C
                    db $88,$2D,$90,$2F,$98,$F0,$E3,$50
                    db $E0,$46,$E0,$05,$00,$05,$14,$17
                    db $60,$17,$74,$3F,$60,$26,$08,$60
                    db $5C,$00,$E0,$05,$00,$05,$14,$17
                    db $60,$17,$74,$3F,$60,$26,$08,$60
                    db $5C,$00,$E0,$07,$08,$07,$1C,$17
                    db $68,$17,$7C,$3F,$60,$26,$10,$00
                    db $E0,$07,$10,$17,$70,$3F,$60,$47
                    db $7C,$26,$04,$00,$E0,$26,$04,$35
                    db $74,$47,$70,$60,$58,$90,$B8,$00
                    db $E0,$07,$0C,$07,$1C,$17,$6C,$17
                    db $7C,$3F,$60,$26,$04,$80,$50,$90
                    db $B4,$00,$E0,$3F,$60,$47,$7C,$26
                    db $04,$80,$4C,$00,$E0,$35,$74,$47
                    db $70,$50,$24,$80,$54,$00,$E0,$17
                    db $70,$17,$80,$3F,$60,$90,$40,$90
                    db $50,$80,$44,$80,$54,$B0,$A0,$F0
                    db $E3,$91,$E0,$10,$E0,$45,$E0,$10
                    db $A4,$00,$68,$20,$5C,$00,$E0,$00
                    db $6C,$00,$E0,$30,$40,$40,$5C,$00
                    db $E0,$20,$50,$60,$90,$00,$E0,$50
                    db $A0,$20,$84,$70,$78,$00,$E0,$80
                    db $4C,$00,$E0,$90,$40,$F0,$E3,$91
                    db $E0,$10,$E0,$45,$E0,$20,$84,$70
                    db $74,$00,$E0,$80,$48,$90,$5C,$00
                    db $E0,$00,$E0,$C0,$40,$00,$E0,$90
                    db $40,$00,$E0,$30,$48,$00,$E0,$E0
                    db $04,$F0,$E3,$91,$E0,$10,$E0,$4C
                    db $E0,$80,$E0,$10,$A0,$20,$A4,$10
                    db $B0,$20,$B4,$10,$BC,$50,$A8,$00
                    db $E0,$20,$A0,$10,$A8,$20,$AC,$10
                    db $B8,$20,$BC,$50,$B0,$70,$48,$00
                    db $E0,$20,$A0,$10,$A8,$20,$AC,$10
                    db $B4,$20,$B8,$80,$7C,$00,$E0,$10
                    db $AC,$20,$B0,$10,$B8,$20,$BC,$00
                    db $E0,$10,$A4,$20,$A8,$10,$B0,$20
                    db $B4,$50,$BC,$90,$90,$00,$E0,$10
                    db $A8,$20,$AC,$10,$B4,$20,$B8,$00
                    db $E0,$10,$A0,$20,$A4,$10,$B0,$20
                    db $B4,$10,$BC,$60,$A8,$00,$E0,$20
                    db $A0,$10,$AC,$20,$B0,$10,$B8,$20
                    db $BC,$60,$A4,$F0,$E3,$12,$E0,$50
                    db $E0,$44,$E0,$A0,$A0,$10,$20,$00
                    db $28,$30,$4C,$30,$58,$A0,$A0,$10
                    db $20,$00,$28,$30,$4C,$30,$58,$00
                    db $E0,$A0,$A0,$30,$44,$10,$30,$00
                    db $38,$30,$5C,$00,$E0,$A0,$A0,$30
                    db $48,$30,$54,$00,$E0,$A0,$A0,$10
                    db $20,$00,$28,$20,$50,$50,$58,$00
                    db $E0,$A0,$A0,$20,$48,$50,$50,$20
                    db $58,$00,$E0,$A0,$A0,$50,$44,$00
                    db $2C,$D0,$94,$00,$E0,$A0,$A0,$00
                    db $20,$40,$48,$40,$54,$00,$3C,$00
                    db $E0,$A0,$A0,$10,$20,$30,$48,$70
                    db $74,$20,$5C,$00,$E0,$A0,$A0,$10
                    db $24,$C0,$8C,$10,$30,$20,$58,$00
                    db $E0,$A0,$A0,$50,$40,$50,$50,$80
                    db $48,$20,$58,$00,$E0,$A0,$A0,$00
                    db $24,$20,$4C,$20,$58,$00,$E0,$A0
                    db $A0,$50,$40,$50,$50,$80,$48,$20
                    db $58,$00,$E0,$A0,$A0,$00,$24,$20
                    db $4C,$20,$58,$00,$E0,$A0,$A0,$50
                    db $44,$00,$2C,$D0,$94,$00,$E0,$A0
                    db $A0,$00,$20,$40,$48,$40,$54,$00
                    db $3C,$F0,$E3,$91,$E0,$70,$E0,$48
                    db $E0,$20,$E0,$00,$69,$63,$81,$70
                    db $89,$80,$91,$10,$95,$20,$99,$30
                    db $9D,$93,$A1,$A0,$B1,$72,$B5,$00
                    db $E0,$B0,$81,$D0,$85,$62,$89,$80
                    db $95,$C0,$A1,$93,$A5,$A0,$B5,$61
                    db $B9,$30,$98,$00,$E0,$B0,$81,$D0
                    db $85,$65,$89,$C0,$A1,$96,$A5,$00
                    db $E0,$67,$81,$97,$A1,$00,$E0,$60
                    db $81,$80,$85,$40,$99,$50,$9D,$90
                    db $A1,$A0,$A5,$80,$A9,$B0,$B5,$F0
                    db $B9,$70,$BD,$10,$60,$10,$AC,$00
                    db $E0,$07,$82,$77,$A1,$00,$E0,$07
                    db $82,$77,$A1,$F0,$E3,$91,$E0,$70
                    db $E0,$48,$E0,$20,$E0,$00,$61,$62
                    db $85,$70,$81,$80,$91,$10,$95,$20
                    db $99,$30,$9D,$93,$A1,$A0,$B1,$72
                    db $B5,$00,$E0,$B0,$81,$D0,$85,$62
                    db $89,$80,$95,$C0,$A1,$93,$A5,$A0
                    db $B5,$61,$B9,$30,$64,$30,$98,$00
                    db $E0,$10,$6D,$20,$71,$30,$75,$B0
                    db $79,$D0,$7D,$B0,$85,$D0,$89,$72
                    db $8D,$C0,$99,$90,$9D,$60,$A1,$C0
                    db $A5,$95,$A9,$30,$5C,$00,$E0,$60
                    db $61,$80,$65,$10,$69,$22,$6D,$30
                    db $79,$90,$81,$A0,$85,$74,$89,$60
                    db $9D,$97,$A1,$10,$40,$00,$E0,$60
                    db $81,$80,$85,$40,$99,$50,$9D,$90
                    db $A1,$A0,$A5,$80,$A9,$B0,$B5,$F0
                    db $B9,$70,$BD,$10,$60,$10,$AC,$00
                    db $E0,$07,$82,$77,$A1,$00,$E0,$07
                    db $82,$77,$A1,$F0,$E3,$91,$E0,$46
                    db $E0,$10,$E0,$00,$E0,$00,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$00,$E0,$F0
                    db $E3,$91,$E0,$70,$E0,$48,$E0,$20
                    db $E0,$00,$69,$63,$81,$70,$89,$80
                    db $91,$10,$95,$20,$99,$30,$9D,$93
                    db $A1,$A0,$B1,$72,$B5,$00,$E0,$B0
                    db $81,$D0,$85,$62,$89,$80,$95,$C0
                    db $A1,$93,$A5,$A0,$B5,$61,$B9,$30
                    db $68,$10,$70,$30,$98,$00,$E0,$10
                    db $69,$21,$6D,$30,$75,$B0,$79,$D0
                    db $7D,$B0,$81,$D0,$85,$73,$89,$C0
                    db $99,$90,$9D,$C0,$A1,$96,$A5,$30
                    db $5C,$00,$E0,$60,$61,$80,$65,$10
                    db $69,$22,$6D,$30,$79,$90,$81,$A0
                    db $85,$74,$89,$60,$9D,$97,$A1,$10
                    db $40,$00,$E0,$60,$81,$80,$85,$40
                    db $99,$50,$9D,$90,$A1,$A0,$A5,$80
                    db $A9,$B0,$B5,$F0,$B9,$70,$BD,$10
                    db $60,$10,$AC,$00,$E0,$07,$82,$77
                    db $A1,$00,$E0,$07,$82,$77,$A1,$F0
                    db $E3,$F0,$E3,$F0,$E3,$F0,$E3,$F0
                    db $E3,$F0,$E3,$F0,$E3,$F0,$E3,$F0
                    db $E3,$F0,$E3,$F0,$E3,$F0,$E3,$F0
                    db $E3,$F0,$E3,$F0,$E3,$F0,$E3,$F0
                    db $E3,$41,$E0,$12,$E0,$00,$28,$00
                    db $E0,$00,$30,$00,$E0,$00,$38,$00
                    db $E0,$00,$E0,$00,$28,$00,$E0,$00
                    db $28,$F0,$E3,$41,$E0,$12,$E0,$00
                    db $28,$00,$E0,$00,$28,$00,$E0,$00
                    db $38,$00,$E0,$00,$E0,$00,$28,$00
                    db $E0,$00,$28,$F0,$E3,$41,$E0,$12
                    db $E0,$00,$38,$00,$E0,$00,$38,$00
                    db $E0,$00,$E0,$00,$28,$00,$E0,$00
                    db $E0,$F0,$E3,$91,$E0,$42,$E0,$10
                    db $E0,$70,$24,$E0,$24,$F0,$E3,$91
                    db $E0,$42,$E0,$10,$E0,$00,$E0,$70
                    db $24,$E0,$24,$F0,$E3,$10,$E0,$41
                    db $E0,$00,$28,$00,$E0,$00,$E0,$00
                    db $E0,$00,$2C,$F0,$E3,$10,$E0,$41
                    db $E0,$00,$28,$00,$E0,$00,$E0,$00
                    db $2C,$F0,$E3,$10,$E0,$41,$E0,$00
                    db $28,$00,$E0,$00,$E0,$00,$2C,$F0
                    db $E3,$91,$E0,$10,$E0,$41,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$00,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$00,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$00,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$F0,$E3,$91
                    db $E0,$42,$E0,$13,$E0,$4D,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$00,$E0,$00
                    db $E0,$00,$E0,$00,$E0,$00,$E0,$00
                    db $E0,$00,$E0,$F0,$E3,$91,$E0,$4F
                    db $E0,$20,$E0,$00,$80,$00,$E0,$02
                    db $80,$00,$E0,$02,$80,$F0,$E3,$F0
                    db $E3,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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
                    db $FF,$FF,$FF,$FF

CODE_0FD000:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.l $700006             ;
                    BNE   CODE_0FD01B         ;
                    LDA.w $0FF8               ;
                    AND.b #$C0                ;
                    TSB.w $0FF4               ;
                    LDA.w $0FFA               ;
                    AND.b #$C0                ;
                    TSB.w $0FF6               ;
                    BRA   CODE_0FD04F         ;

CODE_0FD01B:        LDA.w $0FF4               ;
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
CODE_0FD04F:        PLB                       ;
                    RTL                       ;

CODE_0FD051:        LDA.w $0F03               ;
                    BNE   CODE_0FD096         ;
                    LDA.l $7FFB00             ;
                    STA.w $075F               ;
                    STA.w $0766               ;
                    LDA.l $7FFB01             ;
                    STA.w $075C               ;
                    STA.w $0763               ;
                    LDA.l $7FFB02             ;
                    BPL   CODE_0FD071         ;
                    INC   A                   ;
CODE_0FD071:        STA.w $0760               ;
                    STA.w $0767               ;
                    LDA.l $7FFB03             ;
                    STA.w $075A               ;
                    LDA.l $7FFB04             ;
                    STA.w $0F2B               ;
CODE_0FD085:        PHX                       ;
                    LDX.b #$00                ;
CODE_0FD088:        LDA.l $701FE8,x           ;
                    STA.w $07C8,x             ;
                    INX                       ;
                    CPX.b #$06                ;
                    BNE   CODE_0FD088         ;
                    PLX                       ;
                    RTL                       ;

CODE_0FD096:        LDA.l $700009             ;
                    STA.w $0760               ;
                    LDA.w $0E24               ;
                    STA.w $075C               ;
                    LDA.b #$02                ;
                    STA.w $075A               ;
                    STZ.w $075E               ;
                    STZ.w $0F2B               ;
                    PHX                       ;
                    LDX.b #$00                ;
CODE_0FD0B1:        STZ.w $07CE,x             ;
                    INX                       ;
                    CPX.b #$06                ;
                    BNE   CODE_0FD0B1         ;
                    PLX                       ;
                    RTL                       ;

CODE_0FD0BB:        PHX                       ;
                    PHY                       ;
                    LDA.w $0369               ;
                    BEQ   CODE_0FD0FB         ;
                    LDY.w $0B46,x             ;
                    LDX.b #$00                ;
CODE_0FD0C7:        LDA.w $0900,y             ;
                    STA.w $0800,x             ;
                    TYA                       ;
                    AND.b #$03                ;
                    CMP.b #$01                ;
                    BNE   CODE_0FD0E5         ;
                    LDA.w $0800,x             ;
                    CMP.b #$F0                ;
                    BCC   CODE_0FD0E5         ;
                    LDA.b #$F0                ;
                    STA.w $0800,x             ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
CODE_0FD0E5:        LDA.w $0D00,y             ;
                    STA.w $0C00,x             ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
                    LDA.b #$F0                ;
                    STA.w $0900,y             ;
                    INY                       ;
                    INX                       ;
                    CPX.b #$20                ;
                    BNE   CODE_0FD0C7         ;
CODE_0FD0FB:        LDX.b #$00                ;
                    STZ.b $E7                 ;
CODE_0FD0FF:        LDA.w $0300,x             ;
                    BEQ   CODE_0FD10E         ;
                    JSR.w CODE_0FD116         ;
                    LDA.b $E7                 ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.b $E7                 ;
CODE_0FD10E:        INX                       ;
                    CPX.b #$0D                ;
                    BCC   CODE_0FD0FF         ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_0FD116:        LDA.b $9E                 ;
                    INC   A                   ;
                    STA.w $02FC               ;
                    PHX                       ;
                    LDY.w $030D,x             ;
                    STY.b $E6                 ;
                    LDA.w $D215,y             ;
                    CLC                       ;
                    ADC.b #$A0                ;
                    STA.b $E4                 ;
                    LDA.w $D216,y             ;
                    CLC                       ;
                    ADC.b #$A0                ;
                    STA.b $E5                 ;
                    LDY.b $E7                 ;
                    LDA.w $031A,x             ;
                    JSR.w CODE_0FD1BB         ;
                    LDA.w $031A,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    JSR.w CODE_0FD1BB         ;
                    LDY.b $E7                 ;
                    LDA.b $E4                 ;
                    JSR.w CODE_0FD1A5         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.b $E5                 ;
                    JSR.w CODE_0FD1A5         ;
                    LDX.b $E6                 ;
                    CPX.b #$04                ;
                    BCS   CODE_0FD15E         ;
                    LDA.b #$22                ;
                    BRA   CODE_0FD160         ;

CODE_0FD15E:        LDA.b #$23                ;
CODE_0FD160:        LDY.b $E7                 ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    PHA                       ;
                    JSR.w CODE_0FD1BB         ;
                    PLA                       ;
                    JSR.w CODE_0FD1BB         ;
                    LDY.b $E7                 ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b #$08                ;
                    STA.b $E8                 ;
CODE_0FD178:        LDA.w $D1CD,x             ;
                    STA.w $0902,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $E8                 ;
                    BNE   CODE_0FD178         ;
                    PLX                       ;
                    DEC.w $0327,x             ;
                    LDA.w $0327,x             ;
                    BNE   CODE_0FD1A4         ;
                    LDA.b #$03                ;
                    STA.w $0327,x             ;
                    INC.w $030D,x             ;
                    LDA.w $030D,x             ;
                    AND.b #$0F                ;
                    CMP.b #$09                ;
                    BNE   CODE_0FD1A4         ;
                    STZ.w $0300,x             ;
CODE_0FD1A4:        RTS                       ;

CODE_0FD1A5:        STA.w $0901,y             ;
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

CODE_0FD1BB:        STA.w $0900,y             ;
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

CODE_0FD22A:        PHB
                    PHK                       ;
                    PLB                       ;
                    PHY                       ;
                    LDA.w $0B46,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAY                       ;
                    LDA.b $47,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0FD23D         ;
                    LDA.b #$41                ;
CODE_0FD23D:        EOR.b #$2B                ;
                    STA.w $0903,y             ;
                    LDA.b $1C,x               ;
                    CMP.b #$08                ;
                    BEQ   CODE_0FD257         ;
                    LDA.w $0EA2,x             ;
                    CMP.b #$0A                ;
                    BCS   CODE_0FD257         ;
                    LDA.w $0903,y             ;
                    EOR.b #$20                ;
                    STA.w $0903,y             ;
CODE_0FD257:        LDA.w $0F4F,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$0F                ;
                    STA.b $E4                 ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0FD26C         ;
                    LDA.b $E4                 ;
                    CMP.b #$09                ;
                    BCC   CODE_0FD26F         ;
CODE_0FD26C:        STZ.w $0F4F,x             ;
CODE_0FD26F:        LDA.b $0F                 ;
                    CMP.b #$09                ;
                    BCS   CODE_0FD27D         ;
                    LDA.w $0E67               ;
                    BNE   CODE_0FD27D         ;
                    INC.w $0F4F,x             ;
CODE_0FD27D:        LDX.b $E4                 ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0901,y             ;
                    LDA.w $D220,x             ;
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
                    BEQ   CODE_0FD2B8         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
CODE_0FD2B8:        LDA.w $03B9               ;
                    CMP.b #$E0                ;
                    BCS   CODE_0FD2C5         ;
                    LDA.b $BC,x               ;
                    CMP.b #$01                ;
                    BEQ   CODE_0FD2CA         ;
CODE_0FD2C5:        LDA.b #$F0                ;
                    STA.w $0901,y             ;
CODE_0FD2CA:        PLY                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0FD2CD:        LDA.w $03FA               ;
                    BEQ   CODE_0FD2FE         ;
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
                    BCC   CODE_0FD2F1         ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    RTL                       ;

CODE_0FD2F1:        SEP   #$20                ;
                    STZ.w $03FA               ;
                    LDA.b #$34                ;
                    STA.w $02F7               ;
                    STA.w $03CF               ;
CODE_0FD2FE:        LDA.w $03CF               ;
                    BEQ   CODE_0FD32E         ;
                    CMP.b #$28                ;
                    BCC   CODE_0FD30B         ;
                    LDA.b #$F8                ;
                    BRA   CODE_0FD30D         ;

CODE_0FD30B:        LDA.b #$F0                ;
CODE_0FD30D:        STA.w $03CE               ;
                    LDA.w $0754               ;
                    BEQ   CODE_0FD31E         ;
                    LDA.w $03CE               ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $03CE               ;
CODE_0FD31E:        DEC.w $03CF               ;
                    LDA.w $03CF               ;
                    BNE   CODE_0FD326         ;
CODE_0FD326:        STZ.b $5D                 ;
                    STZ.w $0705               ;
                    LDA.b #$00                ;
                    RTL                       ;

CODE_0FD32E:        LDA.b #$01                ;
                    STA.w $0723               ;
                    STA.w $0254               ;
                    JSR.w CODE_0FD354         ;
                    STZ.w $03CE               ;
                    LDA.w $03FB               ;
                    BEQ   CODE_0FD347         ;
                    DEC.w $03FB               ;
                    LDA.b #$01                ;
                    RTL                       ;

CODE_0FD347:        LDA.w $0746               ;
                    CMP.b #$01                ;
                    BCS   CODE_0FD351         ;
                    INC.w $0746               ;
CODE_0FD351:        LDA.b #$00                ;
                    RTL                       ;

CODE_0FD354:        LDX.b #$00                ;
                    REP   #$20                ;
CODE_0FD358:        LDA.w $11E0,x             ;
                    STA.b $E4                 ;
                    AND.w #$7C00              ;
                    BEQ   CODE_0FD36A         ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.w #$0400              ;
                    STA.b $E4                 ;
CODE_0FD36A:        LDA.b $E4                 ;
                    AND.w #$03E0              ;
                    BEQ   CODE_0FD379         ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.w #$0020              ;
                    STA.b $E4                 ;
CODE_0FD379:        LDA.b $E4                 ;
                    AND.w #$001F              ;
                    BEQ   CODE_0FD382         ;
                    DEC.b $E4                 ;
CODE_0FD382:        LDA.b $E4                 ;
                    STA.w $11E0,x             ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$20                ;
                    BNE   CODE_0FD358         ;
                    SEP   #$20                ;
                    INC.w $1200               ;
                    RTS                       ;

                    db $90,$80,$70,$90

                    db $FF,$01

CODE_0FD399:        PHX
                    PHY
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
                    LDA.w $D393,y             ;
                    LDY.b #$00                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_0FD3CC         ;
                    INY                       ;
CODE_0FD3CC:        LDA.w $D397,y             ;
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

CODE_0FD3E9:        PHB                       ;
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
                    BNE   CODE_0FD439         ;
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
CODE_0FD439:        TAX                       ;
                    LDA.w $D4CA,x             ;
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
                    BEQ   CODE_0FD46C         ;
                    LDA.b #$01                ;
CODE_0FD46C:        ORA.b $E9                 ;
                    STA.w $0D00,y             ;
                    LDA.b $E8                 ;
                    BEQ   CODE_0FD477         ;
                    LDA.b #$01                ;
CODE_0FD477:        ORA.b $E9                 ;
                    STA.w $0D04,y             ;
                    LDA.w $0F36,x             ;
                    BEQ   CODE_0FD4C3         ;
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
                    LDA.w $D4CD,x             ;
                    STA.w $090A,y             ;
                    LDA.b #$28                ;
                    STA.w $090B,y             ;
                    STZ.b $E9                 ;
                    LDA.b $E6                 ;
                    BEQ   CODE_0FD4BE         ;
                    LDA.b #$01                ;
CODE_0FD4BE:        ORA.b $E9                 ;
                    STA.w $0D08,y             ;
CODE_0FD4C3:        LDX.b $9E                 ;
                    INC.w $0F58,x             ;
                    PLB                       ;
                    RTL                       ;

                    db $86,$A6,$89,$30,$31,$32,$06,$0A
                    db $0E

CODE_0FD4D3:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.b #$04                ;
                    STY.w $02FF               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.b $E4                 ;
                    LDX.b #$00                ;
CODE_0FD4E5:        LDA.w $D603,x             ;
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
                    LDA.w $D5E3,x             ;
                    STA.w $0803,y             ;
                    LDA.w $D5C3,x             ;
                    STA.w $0802,y             ;
                    PLX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    CPX.b #$05                ;
                    BNE   CODE_0FD4E5         ;
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
CODE_0FD55E:        LDA.b $E5,x               ;
                    BEQ   CODE_0FD564         ;
                    LDA.b #$01                ;
CODE_0FD564:        ORA.b $E4                 ;
                    STA.w $0C00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_0FD55E         ;
                    STZ.b $E4                 ;
                    LDA.w $06CC               ;
                    BNE   CODE_0FD58E         ;
                    LDA.b #$F0                ;
                    STA.w $0815               ;
                    LDA.b $DE                 ;
                    BEQ   CODE_0FD582         ;
                    LDA.b #$01                ;
CODE_0FD582:        ORA.b $E4                 ;
                    STA.w $0C00               ;
                    LDA.b $DD                 ;
                    STA.w $0800               ;
                    BRA   CODE_0FD5A6         ;

CODE_0FD58E:        LDA.b #$F0                ;
                    STA.w $080D               ;
                    STA.w $0811               ;
                    LDA.b $E0                 ;
                    BEQ   CODE_0FD59C         ;
                    LDA.b #$01                ;
CODE_0FD59C:        ORA.b $E4                 ;
                    STA.w $0C00               ;
                    LDA.b $DF                 ;
                    STA.w $0800               ;
CODE_0FD5A6:        LDA.b $09                 ;
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

CODE_0FD6D0:        PHX
                    INC.w $03CA               ;
                    LDA.w $03CA               ;
                    CMP.b #$34                ;
                    BCS   CODE_0FD738         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $D668,x             ;
                    CLC                       ;
                    ADC.w $03AE               ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.w $08F8               ;
                    LDA.w $D675,x             ;
                    CLC                       ;
                    ADC.w $03AE               ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.w $08FC               ;
                    LDA.w $D682,x             ;
                    BNE   CODE_0FD701         ;
                    LDA.b #$F0                ;
                    BRA   CODE_0FD708         ;

CODE_0FD701:        CLC                       ;
                    ADC.w $03B9               ;
                    CLC                       ;
                    ADC.b #$10                ;
CODE_0FD708:        STA.w $08F9               ;
                    LDA.w $D68F,x             ;
                    BNE   CODE_0FD714         ;
                    LDA.b #$F0                ;
                    BRA   CODE_0FD71B         ;

CODE_0FD714:        CLC                       ;
                    ADC.b #$10                ;
                    CLC                       ;
                    ADC.w $03B9               ;
CODE_0FD71B:        STA.w $08FD               ;
                    LDA.w $D69C,x             ;
                    STA.w $08FA               ;
                    LDA.w $D6A9,x             ;
                    STA.w $08FE               ;
                    LDA.w $D6B6,x             ;
                    STA.w $08FB               ;
                    LDA.w $D6C3,x             ;
                    STA.w $08FF               ;
                    BRA   CODE_0FD73B         ;

CODE_0FD738:        STZ.w $03CB               ;
CODE_0FD73B:        PLX                       ;
                    RTS                       ;

CODE_0FD73D:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $03CB               ;
                    BEQ   CODE_0FD748         ;
                    JSR.w CODE_0FD6D0         ;
CODE_0FD748:        LDA.w $0F4C               ;
                    BEQ   CODE_0FD762         ;
                    LDY.w $014B               ;
                    CPY.b #$08                ;
                    BNE   CODE_0FD771         ;
                    LDA.w $0F4C               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$01                ;
                    TAY                       ;
                    LDA.w $D666,y             ;
                    TAY                       ;
                    BRA   CODE_0FD771         ;

CODE_0FD762:        LDA.w $0792,x             ;
                    BNE   CODE_0FD76A         ;
                    STZ.w $014B               ;
CODE_0FD76A:        LDA.w $014B               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
CODE_0FD771:        LDA.w $D65C,y             ;
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
                    BEQ   CODE_0FD7BD         ;
                    LDA.b #$61                ;
                    BRA   CODE_0FD7BF         ;

CODE_0FD7BD:        LDA.b #$21                ;
CODE_0FD7BF:        STA.w $0903,y             ;
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
                    BEQ   CODE_0FD7F4         ;
                    LDA.b $DD                 ;
                    CLC                       ;
                    ADC.b #$2A                ;
                    STA.b $DD                 ;
                    SEC                       ;
                    SBC.b #$06                ;
                    TAX                       ;
CODE_0FD7F4:        LDA.w $D608,x             ;
                    STA.w $0902,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    CPX.b $DD                 ;
                    BNE   CODE_0FD7F4         ;
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
                    CLC                       ;
                    ADC.w #$0030              ;
                    STA.b $E2                 ;
                    SEP   #$20                ;
                    LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.b $E3                 ;
                    CMP.b #$FF                ;
                    BNE   CODE_0FD848         ;
                    STZ.b $10,x               ;
                    STZ.b $29,x               ;
                    STZ.b $1C,x               ;
CODE_0FD848:        LDA.b $E5                 ;
                    BEQ   CODE_0FD854         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
CODE_0FD854:        LDA.b $E7                 ;
                    BEQ   CODE_0FD85D         ;
                    LDA.b #$01                ;
                    STA.w $0D08,y             ;
CODE_0FD85D:        LDA.b $E9                 ;
                    BEQ   CODE_0FD86C         ;
                    LDA.b #$01                ;
                    STA.w $0D0C,y             ;
                    STA.w $0D10,y             ;
                    STA.w $0D14,y             ;
CODE_0FD86C:        LDA.w $0F4C               ;
                    BNE   CODE_0FD883         ;
                    STZ.w $0F4C               ;
                    INC.w $014B               ;
                    LDA.w $014B               ;
                    CMP.b #$30                ;
                    BCC   CODE_0FD8A7         ;
                    STZ.w $014B               ;
                    BRA   CODE_0FD8A7         ;

CODE_0FD883:        DEC.w $0F4C               ;
                    LDA.w $0F4C               ;
                    BNE   CODE_0FD8A7         ;
                    LDA.w $014B               ;
                    CMP.b #$06                ;
                    BNE   CODE_0FD8A4         ;
                    INC.w $014B               ;
                    LDA.b #$28                ;
                    STA.w $0F4C               ;
                    LDA.b #$3A                ;
                    STA.w $1600               ;
                    JSR.w CODE_0FD399         ;
                    BRA   CODE_0FD8A7         ;

CODE_0FD8A4:        STZ.w $014B               ;
CODE_0FD8A7:        LDA.w $0283               ;
                    BNE   CODE_0FD8EB         ;
                    LDX.b $9E                 ;
                    LDY.w $0B46,x             ;
                    LDX.b #$06                ;
CODE_0FD8B3:        LDA.w $0903,y             ;
                    ORA.b #$80                ;
                    STA.w $0903,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_0FD8B3         ;
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
CODE_0FD8EB:        JSR.w CODE_0FD0BB         ;
                    PLB                       ;
                    RTL                       ;

                    db $03,$02,$06,$08,$01,$13

CODE_0FD8F6:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.w $0770               ;
                    BEQ   CODE_0FD94C         ;
                    LDA.w $0752               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0FD913         ;
                    LDY.b #$05                ;
                    LDA.w $0710               ;
                    CMP.b #$06                ;
                    BEQ   CODE_0FD91C         ;
                    CMP.b #$07                ;
                    BEQ   CODE_0FD91C         ;
CODE_0FD913:        LDY.b $BA                 ;
                    LDA.w $0743               ;
                    BEQ   CODE_0FD91C         ;
                    LDY.b #$04                ;
CODE_0FD91C:        LDA.b $0F                 ;
                    CMP.b #$04                ;
                    BEQ   CODE_0FD943         ;
                    CMP.b #$05                ;
                    BEQ   CODE_0FD943         ;
                    LDA.b $DB                 ;
                    CMP.b #$39                ;
                    BEQ   CODE_0FD939         ;
                    CMP.b #$3B                ;
                    BEQ   CODE_0FD939         ;
                    CMP.b #$3D                ;
                    BEQ   CODE_0FD939         ;
                    LDA.w $D8F0,y             ;
                    BRA   CODE_0FD93B         ;

CODE_0FD939:        LDA.b #$01                ;
CODE_0FD93B:        LDX.w $0EDF               ;
                    BNE   CODE_0FD943         ;
                    STA.w $1602               ;
CODE_0FD943:        LDX.b $DB                 ;
                    CPX.b #$07                ;
                    BNE   CODE_0FD94C         ;
                    STA.w $0EDF               ;
CODE_0FD94C:        PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0FD94F:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $0770               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0FD978         ;
                    CMP.b #$01                ;
                    BNE   CODE_0FD9B9         ;
                    LDA.w $0772               ;
                    CMP.b #$03                ;
                    BNE   CODE_0FD9B9         ;
                    LDA.w $0E67               ;
                    BNE   CODE_0FD9B9         ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BNE   CODE_0FD9B9         ;
                    LDA.w $0777               ;
                    BEQ   CODE_0FD97A         ;
                    DEC.w $0777               ;
CODE_0FD978:        PLB                       ;
                    RTL                       ;

CODE_0FD97A:        LDA.b $0F                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_0FD9B9         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0FD9B9         ;
                    LDA.w $0B7A               ;
                    BNE   CODE_0FD9B9         ;
                    LDA.w $0B75               ;
                    CMP.b #$02                ;
                    BCS   CODE_0FD9B9         ;
                    LDA.w $0F8A               ;
                    BEQ   CODE_0FD99A         ;
                    DEC.w $0F8A               ;
                    BRA   CODE_0FD9B9         ;

CODE_0FD99A:        LDA.w $0B75               ;
                    BNE   CODE_0FD9B9         ;
                    LDA.w $0FF6               ;
                    AND.b #$10                ;
                    BEQ   CODE_0FD9B9         ;
                    LDA.b #$11                ;
                    STA.w $0777               ;
                    LDA.b #$F1                ;
                    STA.w $1602               ;
                    LDA.b #$43                ;
                    STA.w $1600               ;
                    JSL.l CODE_0FDA18         ;
CODE_0FD9B9:        PLB                       ;
                    RTL                       ;

CODE_0FD9BB:        INC.w $0B76               ;
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

CODE_0FD9DA:        INC.w $0B76               ;
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

CODE_0FD9F9:        PHX                       ;
                    PHY                       ;
                    JSR.w CODE_0FDE85         ;
                    JSR.w CODE_0FDE22         ;
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

CODE_0FDA18:        JSR.w CODE_0FDE85         ;
                    JSR.w CODE_0FDE22         ;
                    JSR.w CODE_0FDA4C         ;
                    JSR.w CODE_0FD9BB         ;
                    LDA.b #$01                ;
                    STA.w $0776               ;
                    STZ.w $0B77               ;
                    STZ.w $0B78               ;
                    STZ.w $0F8A               ;
                    RTL                       ;

CODE_0FDA33:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $0B75               ;
                    ASL   A                   ;
                    TAX                       ;
                    JSR.w (PNTR_0FDA44,x)     ;
                    PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

PNTR_0FDA44:        dw CODE_0FDD00
                    dw CODE_0FDA6F
                    dw CODE_0FDDFC
                    dw CODE_0FDD6A

CODE_0FDA4C:        REP   #$20                ;
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
                    RTS                       ;

CODE_0FDA6F:        JSR.w CODE_0FDC34         ;
                    LDA.w $0FF6               ;
                    STA.b $F2                 ;
                    AND.b #$2C                ;
                    BEQ   CODE_0FDAF3         ;
                    LDA.w $1680               ;
                    BEQ   CODE_0FDAA2         ;
                    AND.b #$10                ;
                    CMP.b #$10                ;
                    BEQ   CODE_0FDAA2         ;
                    LDA.b $F2                 ;
                    AND.b #$20                ;
                    BEQ   CODE_0FDA96         ;
                    LDA.w $0B77               ;
                    EOR.b #$02                ;
CODE_0FDA91:        STA.w $0B77               ;
                    BRA   CODE_0FDABD         ;

CODE_0FDA96:        LDA.b $F2                 ;
                    AND.b #$04                ;
                    LSR   A                   ;
                    CMP.w $0B77               ;
                    BNE   CODE_0FDA91         ;
                    BRA   CODE_0FDAF3         ;

CODE_0FDAA2:        LDA.b $F2                 ;
                    AND.b #$20                ;
                    BNE   CODE_0FDADE         ;
                    LDA.b $F2                 ;
                    AND.b #$08                ;
                    BNE   CODE_0FDAC7         ;
                    INC.w $0B77               ;
                    LDA.w $0B77               ;
                    CMP.b #$03                ;
                    BCC   CODE_0FDABD         ;
                    DEC.w $0B77               ;
                    BRA   CODE_0FDAF3         ;

CODE_0FDABD:        LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
                    BRA   CODE_0FDAF3         ;

CODE_0FDAC7:        DEC.w $0B77               ;
                    LDA.w $0B77               ;
                    BPL   CODE_0FDAD4         ;
                    INC.w $0B77               ;
                    BRA   CODE_0FDAF3         ;

CODE_0FDAD4:        LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
                    BRA   CODE_0FDAF3         ;

CODE_0FDADE:        INC.w $0B77               ;
                    LDA.w $0B77               ;
                    CMP.b #$03                ;
                    BCC   CODE_0FDAEB         ;
                    STZ.w $0B77               ;
CODE_0FDAEB:        LDA.b #$01                ;
                    STA.w $1603               ;
                    STZ.w $0B78               ;
CODE_0FDAF3:        LDA.b #$4C                ;
                    STA.w $0800               ;
                    LDX.w $0B77               ;
                    LDA.w $DB91,x             ;
                    STA.w $0801               ;
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $DB94,x             ;
                    STA.w $0802               ;
                    LDA.b #$21                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0B78               ;
                    LDA.b $F2                 ;
                    AND.b #$10                ;
                    BEQ   CODE_0FDB90         ;
                    LDA.b #$F2                ;
                    STA.w $1602               ;
                    STZ.w $0B78               ;
                    LDA.w $0B77               ;
                    BEQ   CODE_0FDB4E         ;
                    LDA.b #$30                ;
                    STA.w $0F8A               ;
                    LDA.b #$02                ;
                    STA.w $0B75               ;
                    LDA.b #$3B                ;
                    STA.w $1600               ;
                    LDA.w $0B77               ;
                    CMP.b #$02                ;
                    BNE   CODE_0FDB62         ;
                    LDA.b #$F3                ;
                    STA.w $1602               ;
                    BRA   CODE_0FDB62         ;

CODE_0FDB4E:        LDA.b #$10                ;
                    STA.w $0F8A               ;
                    LDA.b #$10                ;
                    STA.w $0B6B               ;
                    LDA.b #$02                ;
                    STA.w $0B75               ;
                    LDA.b #$43                ;
                    STA.w $1600               ;
CODE_0FDB62:        LDA.w $1680               ;
                    CMP.b #$10                ;
                    BNE   CODE_0FDB82         ;
                    LDA.w $0B77               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0FDB82         ;
                    STZ.w $0776               ;
                    LDA.b #$0E                ;
                    STA.w $0772               ;
                    LDX.w $0B77               ;
                    BEQ   CODE_0FDB81         ;
                    JSL.l CODE_0090AC         ;
CODE_0FDB81:        RTS                       ;

CODE_0FDB82:        LDA.b #$20                ;
                    STA.w $0F8A               ;
                    LDA.w $0B77               ;
                    BEQ   CODE_0FDB90         ;
                    JSL.l CODE_0090AC         ;
CODE_0FDB90:        RTS                       ;

                    db $50,$60,$70,$D0,$DE,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$14,$15,$16,$17,$18,$19
                    db $1A,$1B,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$28,$29,$2A,$2B
                    db $1C,$14,$15,$16,$17,$18,$19,$1A
                    db $1B,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$28,$29
                    db $2A,$2B,$1C,$24,$25,$26,$27,$AA
                    db $AA,$AA,$AA,$FF,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$24,$25,$26,$27,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$28,$29,$2A
                    db $2B,$1C,$24,$25,$26,$27,$AA,$AA
                    db $AA,$AA,$FF

CODE_0FDC34:        REP   #$10                ;
                    LDY.w #$0010              ;
                    LDX.w #$0000              ;
                    LDA.b #$48                ;
                    STA.b $01                 ;
CODE_0FDC40:        LDA.b #$58                ;
                    STA.b $00                 ;
CODE_0FDC44:        LDA.w $1680               ;
                    BEQ   CODE_0FDC5A         ;
                    AND.b #$10                ;
                    CMP.b #$10                ;
                    BEQ   CODE_0FDC5A         ;
                    LDA.w $DBE5,x             ;
                    BPL   CODE_0FDC77         ;
                    INX                       ;
                    INC   A                   ;
                    BEQ   CODE_0FDC98         ;
                    BRA   CODE_0FDC63         ;

CODE_0FDC5A:        LDA.w $DB96,x             ;
                    BPL   CODE_0FDC77         ;
                    INX                       ;
                    INC   A                   ;
                    BEQ   CODE_0FDC98         ;
CODE_0FDC63:        LDA.b $00                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $00                 ;
                    CMP.b #$C0                ;
                    BCC   CODE_0FDC44         ;
                    LDA.b $01                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $01                 ;
                    BRA   CODE_0FDC40         ;

CODE_0FDC77:        CLC                       ;
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
                    BRA   CODE_0FDC63         ;

CODE_0FDC98:        LDA.b #$40                ;
                    STA.b $01                 ;
CODE_0FDC9C:        LDA.b #$40                ;
                    STA.b $00                 ;
CODE_0FDCA0:        LDA.b $00                 ;
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
                    BCC   CODE_0FDCA0         ;
                    LDA.b $01                 ;
                    CMP.b #$80                ;
                    BCS   CODE_0FDCD5         ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.b $01                 ;
                    BRA   CODE_0FDC9C         ;

CODE_0FDCD5:        SEP   #$10                ;
                    LDA.b #$4C                ;
                    STA.w $0800               ;
                    LDX.w $0B77               ;
                    LDA.w $DB91,x             ;
                    STA.w $0801               ;
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $DB94,x             ;
                    STA.w $0802               ;
                    LDA.b #$21                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    RTS                       ;

CODE_0FDD00:        LDA.w $0B6B               ;
                    BEQ   CODE_0FDD63         ;
                    BMI   CODE_0FDD63         ;
                    REP   #$30                ;
                    DEC.w $0B6B               ;
                    DEC.w $0B6D               ;
                    DEC.w $0B6D               ;
                    INC.w $0B6F               ;
                    INC.w $0B6F               ;
                    DEC.w $0B71               ;
                    DEC.w $0B71               ;
                    DEC.w $0B71               ;
                    DEC.w $0B71               ;
                    INC.w $0B73               ;
                    INC.w $0B73               ;
                    INC.w $0B73               ;
                    INC.w $0B73               ;
                    LDX.w #$007E              ;
                    LDA.w #$00FF              ;
CODE_0FDD36:        STA.l $7FF000,x           ;
                    STA.l $7FF080,x           ;
                    STA.l $7FF100,x           ;
                    STA.l $7FF180,x           ;
                    DEX                       ;
                    DEX                       ;
                    BPL   CODE_0FDD36         ;
                    LDA.w $0B6F               ;
                    XBA                       ;
                    ORA.w $0B6D               ;
                    LDX.w $0B71               ;
CODE_0FDD54:        STA.l $7FF000,x           ;
                    INX                       ;
                    INX                       ;
                    CPX.w $0B73               ;
                    BNE   CODE_0FDD54         ;
                    SEP   #$30                ;
                    BRA   CODE_0FDD66         ;

CODE_0FDD63:        INC.w $0B75               ;
CODE_0FDD66:        JSR.w CODE_0FDC34         ;
                    RTS                       ;

CODE_0FDD6A:        LDA.w $0B6B               ;
                    BEQ   CODE_0FDDCD         ;
                    BMI   CODE_0FDDCD         ;
                    REP   #$30                ;
                    INC.w $0B6D               ;
                    INC.w $0B6D               ;
                    DEC.w $0B6F               ;
                    DEC.w $0B6F               ;
                    INC.w $0B71               ;
                    INC.w $0B71               ;
                    INC.w $0B71               ;
                    INC.w $0B71               ;
                    DEC.w $0B73               ;
                    DEC.w $0B73               ;
                    DEC.w $0B73               ;
                    DEC.w $0B73               ;
                    DEC.w $0B6B               ;
                    LDX.w #$007E              ;
                    LDA.w #$00FF              ;
CODE_0FDDA0:        STA.l $7FF000,x           ;
                    STA.l $7FF080,x           ;
                    STA.l $7FF100,x           ;
                    STA.l $7FF180,x           ;
                    DEX                       ;
                    DEX                       ;
                    BPL   CODE_0FDDA0         ;
                    LDA.w $0B6F               ;
                    XBA                       ;
                    ORA.w $0B6D               ;
                    LDX.w $0B71               ;
CODE_0FDDBE:        STA.l $7FF000,x           ;
                    INX                       ;
                    INX                       ;
                    CPX.w $0B73               ;
                    BNE   CODE_0FDDBE         ;
                    SEP   #$30                ;
                    BRA   CODE_0FDDF8         ;

CODE_0FDDCD:        STZ.w $0B75               ;
                    LDA.b #$0F                ;
                    STA.w $1201               ;
                    STZ.w $0776               ;
                    LDA.w $1206               ;
                    EOR.b #$03                ;
                    STA.w $1206               ;
                    LDA.w $1207               ;
                    EOR.b #$10                ;
                    STA.w $1207               ;
                    JSR.w CODE_0FD9DA         ;
                    JSL.l CODE_0D83E8         ;
                    LDA.w $1203               ;
                    AND.b #$F7                ;
                    STA.w $1203               ;
                    RTS                       ;

CODE_0FDDF8:        JSR.w CODE_0FDC34         ;
                    RTS                       ;

CODE_0FDDFC:        DEC.w $0F8A               ;
                    BNE   CODE_0FDE1E         ;
                    INC.w $0B75               ;
                    LDA.b #$10                ;
                    STA.w $0B6B               ;
                    STA.w $0F8A               ;
                    LDA.w $1680               ;
                    CMP.b #$01                ;
                    BEQ   CODE_0FDE1A         ;
                    LDA.w $0B77               ;
                    CMP.b #$02                ;
                    BNE   CODE_0FDE1E         ;
CODE_0FDE1A:        JML.l CODE_0080DE         ;

CODE_0FDE1E:        JSR.w CODE_0FDC34         ;
                    RTS                       ;

CODE_0FDE22:        PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$30                ;
                    LDX.w #$007E              ;
                    LDA.w #$0000              ;
CODE_0FDE2F:        STA.w $F000,x             ;
                    STA.w $F080,x             ;
                    STA.w $F100,x             ;
                    STA.w $F180,x             ;
                    DEX                       ;
                    DEX                       ;
                    BPL   CODE_0FDE2F         ;
                    PLB                       ;
                    SEP   #$20                ;
                    LDX.w #$2641              ;
                    STX.w $4330               ;
                    LDX.w #$DE7E              ;
                    STX.w $4332               ;
                    LDA.b #$0F                ;
                    STA.w $4334               ;
                    LDA.b #$7F                ;
                    STA.w $4337               ;
                    LDA.b #$00                ;
                    STA.w $1204               ;
                    STZ.w $1205               ;
                    LDA.w $1206               ;
                    ORA.b #$03                ;
                    STA.w $1206               ;
                    LDA.w $1207               ;
                    ORA.b #$10                ;
                    STA.w $1207               ;
                    STZ.w $1208               ;
                    SEP   #$10                ;
                    LDA.w $1203               ;
                    ORA.b #$08                ;
                    STA.w $1203               ;
                    RTS                       ;

                    db $F8,$00,$F0,$F8,$F0,$F0,$00

CODE_0FDE85:        PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$30                ;
                    LDX.w #$01A0              ;
CODE_0FDE8F:        LDA.w #$00FF              ;
                    STA.w $F000,x             ;
                    STA.w $F002,x             ;
                    STA.w $F004,x             ;
                    STA.w $F006,x             ;
                    STA.w $F008,x             ;
                    STA.w $F00A,x             ;
                    STA.w $F00C,x             ;
                    STA.w $F00E,x             ;
                    STA.w $F010,x             ;
                    STA.w $F012,x             ;
                    STA.w $F014,x             ;
                    STA.w $F016,x             ;
                    STA.w $F018,x             ;
                    STA.w $F01A,x             ;
                    STA.w $F01C,x             ;
                    STA.w $F01E,x             ;
                    STA.w $F200,x             ;
                    STA.w $F202,x             ;
                    STA.w $F204,x             ;
                    STA.w $F206,x             ;
                    STA.w $F208,x             ;
                    STA.w $F20A,x             ;
                    STA.w $F20C,x             ;
                    STA.w $F20E,x             ;
                    STA.w $F210,x             ;
                    STA.w $F212,x             ;
                    STA.w $F214,x             ;
                    STA.w $F216,x             ;
                    STA.w $F218,x             ;
                    STA.w $F21A,x             ;
                    STA.w $F21C,x             ;
                    STA.w $F21E,x             ;
                    TXA                       ;
                    SEC                       ;
                    SBC.w #$0020              ;
                    TAX                       ;
                    BPL   CODE_0FDE8F         ;
                    SEP   #$30                ;
                    PLB                       ;
                    RTS                       ;

CODE_0FDEFE:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDX.w $0EC3               ;
                    LDA.w $0FFA,x             ;
                    PLX                       ;
                    AND.b #$C0                ;
                    BEQ   CODE_0FDF23         ;
                    AND.b #$80                ;
                    BEQ   CODE_0FDF1B         ;
                    STZ.w $0754               ;
                    LDA.b #$01                ;
                    STA.w $0756               ;
                    BRA   CODE_0FDF23         ;

CODE_0FDF1B:        STZ.w $0754               ;
                    LDA.b #$02                ;
                    STA.w $0756               ;
CODE_0FDF23:        LDA.w $0FF6               ;
                    AND.b #$20                ;
                    BEQ   CODE_0FDF38         ;
                    EOR.w $0E73               ;
                    STA.w $0E73               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0716               ;
CODE_0FDF38:        LDA.w $0E73               ;
                    BNE   CODE_0FDF40         ;
                    JMP.w CODE_0FDFE7         ;

CODE_0FDF40:        LDA.b #$10                ;
                    STA.w $07AF               ;
                    LDA.w $0FF8               ;
                    AND.b #$10                ;
                    BEQ   CODE_0FDF8B         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0FDF8B         ;
                    LDA.w $0FF4               ;
                    LSR   A                   ;
                    BCS   CODE_0FDF64         ;
                    LSR   A                   ;
                    BCS   CODE_0FDF72         ;
                    LSR   A                   ;
                    BCS   CODE_0FDF88         ;
                    LSR   A                   ;
                    BCS   CODE_0FDF81         ;
                    JMP.w CODE_0FDFEA         ;

CODE_0FDF64:        LDA.b #$09                ;
                    STA.w $07EA               ;
                    STA.w $07EB               ;
                    STA.w $07E9               ;
                    JMP.w CODE_0FDFEA         ;

CODE_0FDF72:        STZ.w $07EA               ;
                    STZ.w $07EB               ;
                    STZ.w $07E9               ;
                    STZ.w $0E73               ;
                    JMP.w CODE_0FDFEA         ;

CODE_0FDF81:        JSL.l CODE_048596         ;Increase lives by one
                    JMP.w CODE_0FDFEA         ;

CODE_0FDF88:        JMP.w CODE_0FDFEA         ;

CODE_0FDF8B:        LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0FDFAC         ;
                    LDA.w $0FF6               ;
                    AND.b #$80                ;
                    BEQ   CODE_0FDFAC         ;
                    LDA.w $0754               ;
                    EOR.b #$01                ;
                    STA.w $0754               ;
                    LDA.w $0756               ;
                    EOR.b #$02                ;
                    STA.w $0756               ;
                    JSL.l CODE_0E98C3         ;
CODE_0FDFAC:        LDA.w $0FF4               ;
                    AND.b #$03                ;
                    BEQ   CODE_0FDFCA         ;
                    TAY                       ;
                    LDA.b $0C                 ;
                    STA.w $0202               ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.w $DFEC,y             ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.w $DFEE,y             ;
                    STA.b $78                 ;
CODE_0FDFCA:        LDA.w $0FF4               ;
                    AND.b #$0C                ;
                    BEQ   CODE_0FDFEA         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.w $DFEC,y             ;
                    STA.w $0237               ;
                    LDA.b $BB                 ;
                    ADC.w $DFEE,y             ;
                    STA.b $BB                 ;
                    BRA   CODE_0FDFEA         ;

CODE_0FDFE7:        SEC                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0FDFEA:        CLC                       ;
                    PLB                       ;
                    RTL                       ;

                    db $03,$FD,$00,$FF

                    PHA                       ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $07B2               ;
                    BEQ   CODE_0FE06A         ;
                    LDA.w $0FF4               ;
                    STA.b $E4                 ;
                    AND.b #$C0                ;
                    BEQ   CODE_0FE06A         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0FE06A         ;
                    LDA.b $E4                 ;
                    CMP.b #$40                ;
                    BNE   CODE_0FE021         ;
                    LDA.b #$17                ;
                    STA.w $07B2               ;
                    INC.w $075F               ;
                    LDA.w $075F               ;
                    CMP.b #$0D                ;
                    BCC   CODE_0FE021         ;
                    STZ.w $075F               ;
CODE_0FE021:        LDA.b $E4                 ;
                    CMP.b #$80                ;
                    BNE   CODE_0FE039         ;
                    LDA.b #$17                ;
                    STA.w $07B2               ;
                    INC.w $075C               ;
                    LDA.w $075C               ;
                    CMP.b #$04                ;
                    BCC   CODE_0FE039         ;
                    STZ.w $075C               ;
CODE_0FE039:        LDX.b #$00                ;
CODE_0FE03B:        LDA.w $E0A1,x             ;
                    STA.l $001702,x           ;
                    INX                       ;
                    CPX.b #$0B                ;
                    BCC   CODE_0FE03B         ;
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
                    LDA.w $E06D,x             ;
                    STA.w $0760               ;
CODE_0FE06A:        PLB                       ;
                    PLA                       ;
                    RTL                       ;

                    db $00,$02,$03,$04,$00,$01,$02,$03
                    db $00,$02,$03,$04,$00,$01,$02,$03
                    db $00,$02,$03,$04,$00,$02,$03,$04
                    db $00,$01,$02,$03,$00,$01,$02,$03
                    db $00,$01,$02,$03,$00,$02,$03,$04
                    db $00,$02,$03,$04,$00,$01,$02,$03
                    db $00,$01,$02,$03,$58,$73,$00,$05
                    db $24,$20,$24,$20,$24,$20,$FF

CODE_0FE0AC:        PHY                       ;
                    LDY.b #$00                ;
CODE_0FE0AF:        LDA.w $0B25,y             ;
                    BEQ   CODE_0FE0BB         ;
                    INY                       ;
                    CPY.b #$05                ;
                    BNE   CODE_0FE0AF         ;
                    LDY.b #$00                ;
CODE_0FE0BB:        LDA.b #$01                ;
                    STA.w $0B25,y             ;
                    LDA.b $5E,x               ;
                    BPL   CODE_0FE0DB         ;
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
                    BRA   CODE_0FE0F0         ;

CODE_0FE0DB:        LDA.b $79,x               ;
                    XBA                       ;
                    LDA.w $021A,x             ;
                    REP   #$20                ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEP   #$20                ;
                    STA.w $0B2F,y             ;
                    XBA                       ;
                    STA.w $0B2A,y             ;
CODE_0FE0F0:        LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$0C                ;
                    STA.w $0B34,y             ;
                    PLY                       ;
                    RTL                       ;

CODE_0FE0FB:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDX.b #$00                ;
CODE_0FE102:        LDA.w $E268,x             ;
                    TAY                       ;
                    LDA.w $0B25,x             ;
                    BEQ   CODE_0FE12B         ;
                    AND.b #$0C                ;
                    STA.b $E4                 ;
                    BNE   CODE_0FE116         ;
                    JSR.w CODE_0FE134         ;
                    BRA   CODE_0FE12B         ;

CODE_0FE116:        CMP.b #$04                ;
                    BNE   CODE_0FE11F         ;
                    JSR.w CODE_0FE16F         ;
                    BRA   CODE_0FE12B         ;

CODE_0FE11F:        CMP.b #$08                ;
                    BNE   CODE_0FE128         ;
                    JSR.w CODE_0FE1AF         ;
                    BRA   CODE_0FE12B         ;

CODE_0FE128:        STZ.w $0B25,x             ;
CODE_0FE12B:        INX                       ;
                    CPX.b #$05                ;
                    BNE   CODE_0FE102         ;
                    PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0FE134:        JSR.w CODE_0FE253         ;
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
                    BEQ   CODE_0FE168         ;
                    LDA.b #$01                ;
CODE_0FE168:        STA.w $0C00,y             ;
                    INC.w $0B25,x             ;
                    RTS                       ;

CODE_0FE16F:        JSR.w CODE_0FE253         ;
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
                    BEQ   CODE_0FE19E         ;
                    LDA.b #$03                ;
                    BRA   CODE_0FE1A0         ;

CODE_0FE19E:        LDA.b #$02                ;
CODE_0FE1A0:        STA.w $0C00,y             ;
                    INC.w $0B25,x             ;
                    RTS                       ;

                    db $FF,$FE,$FC,$F9,$01,$02,$04,$07

CODE_0FE1AF:        STX.b $F1                 ;
                    JSR.w CODE_0FE253         ;
                    LDA.w $0B25,x             ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.w $0B3B               ;
                    CLC                       ;
                    ADC.w $E1A7,x             ;
                    STA.w $0801,y             ;
                    STA.w $0805,y             ;
                    LDA.w $0B3B               ;
                    CLC                       ;
                    ADC.w $E1AB,x             ;
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
                    LDA.w $E1A7,x             ;
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
                    BEQ   CODE_0FE219         ;
                    LDA.b #$01                ;
CODE_0FE219:        STA.w $0C00,y             ;
                    STA.w $0C08,y             ;
                    LDA.w $E1AB,x             ;
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
                    BEQ   CODE_0FE247         ;
                    LDA.b #$01                ;
CODE_0FE247:        STA.w $0C04,y             ;
                    STA.w $0C0C,y             ;
                    LDX.b $F1                 ;
                    INC.w $0B25,x             ;
                    RTS                       ;

CODE_0FE253:        LDA.w $0B34,x             ;
                    STA.w $0B3B               ;
                    LDA.w $0B2A,x             ;
                    XBA                       ;
                    LDA.w $0B2F,x             ;
                    REP   #$20                ;
                    STA.w $0B39               ;
                    SEP   #$20                ;
                    RTS                       ;

                    db $00,$10,$20,$40,$50

CODE_0FE26D:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $0201               ;
                    CMP.b #$01                ;
                    BEQ   CODE_0FE2E9         ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BEQ   CODE_0FE2E9         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0FE2E9         ;
                    LDA.b $96                 ;
                    BNE   CODE_0FE2E6         ;
                    LDA.w $02FC               ;
                    BEQ   CODE_0FE2E9         ;
                    LDX.b #$08                ;
CODE_0FE28F:        LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BEQ   CODE_0FE29A         ;
CODE_0FE295:        DEX                       ;
                    BPL   CODE_0FE28F         ;
                    BRA   CODE_0FE2BD         ;

CODE_0FE29A:        LDA.w $0238,x             ;
                    CMP.b #$B8                ;
                    BCC   CODE_0FE2E9         ;
                    LDA.b $10,x               ;
                    AND.b #$80                ;
                    BNE   CODE_0FE295         ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $02FA               ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.w $02FB               ;
                    LDA.b #$08                ;
                    STA.b $96                 ;
                    BRA   CODE_0FE2DC         ;

CODE_0FE2BD:        LDX.w $02FC               ;
                    DEX                       ;
                    LDA.w $0238,x             ;
                    CMP.b #$B8                ;
                    BCC   CODE_0FE2E9         ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $02FA               ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.w $02FB               ;
                    LDA.b #$04                ;
                    STA.b $96                 ;
CODE_0FE2DC:        LDA.b #$25                ;
                    STA.w $1600               ;
                    LDA.b #$20                ;
                    STA.w $1603               ;
CODE_0FE2E6:        JSR.w CODE_0FE2ED         ;
CODE_0FE2E9:        JMP.w CODE_0FED35         ;

                    RTL                       ;

CODE_0FE2ED:        LDA.b $96                 ;
                    STA.b $E4                 ;
                    INC.w $02F9               ;
                    LDA.w $02F9               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$06                ;
                    BCS   CODE_0FE358         ;
                    STA.b $DD                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.b #$20                ;
                    STZ.b $E9                 ;
CODE_0FE307:        TXA                       ;
                    AND.b #$01                ;
                    CLC                       ;
                    ADC.b #$FF                ;
                    STA.b $E8                 ;
                    LDA.w $E35E,x             ;
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
                    BEQ   CODE_0FE32E         ;
                    LDA.b #$00                ;
CODE_0FE32E:        ORA.b $E9                 ;
                    STA.w $0C00,y             ;
                    LDA.w $E386,x             ;
                    CLC                       ;
                    ADC.b #$D8                ;
                    STA.w $0801,y             ;
                    PHX                       ;
                    LDX.b $DD                 ;
                    LDA.w $E3B7,x             ;
                    STA.w $0802,y             ;
                    LDX.b $E4                 ;
                    LDA.w $E3AE,x             ;
                    STA.w $0803,y             ;
                    PLX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $E4                 ;
                    BNE   CODE_0FE307         ;
                    RTS                       ;

CODE_0FE358:        STZ.w $02FC               ;
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

CODE_0FE40F:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $0B00,x             ;
                    CMP.b #$02                ;
                    BEQ   CODE_0FE452         ;
                    LSR   A                   ;
                    BCC   CODE_0FE467         ;
                    LDA.w $0B09,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$06                ;
                    BEQ   CODE_0FE454         ;
                    TAY                       ;
                    LDA.w $E405,y             ;
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
                    JSR.w CODE_0FE537         ;
                    BRA   CODE_0FE467         ;

CODE_0FE452:        BRA   CODE_0FE498         ;

CODE_0FE454:        INC.w $0B00,x             ;
                    STZ.w $0B09,x             ;
                    LDA.w $0B00,x             ;
                    CMP.b #$02                ;
                    BNE   CODE_0FE467         ;
                    LDA.w $0238,x             ;
                    STA.w $0B12,x             ;
CODE_0FE467:        PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

                    db $FF,$FF,$FA,$FF,$FA,$FF,$FA,$FF
                    db $FF,$FF,$00,$00,$00,$00,$00,$00
                    db $FE,$FF,$FE,$FF,$FF,$00,$00,$00
                    db $FF,$12,$12,$12,$10,$10,$FC,$30
                    db $31,$32,$FC,$30,$31,$32,$FC,$FC
                    db $FF,$FF,$FF,$00,$00

CODE_0FE498:        LDA.w $0B09,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$05                ;
                    BCC   CODE_0FE4AA         ;
                    LDA.b #$30                ;
                    STA.w $0B09,x             ;
                    JMP.w CODE_0FE534         ;

CODE_0FE4AA:        STA.b $EB                 ;
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
                    ADC.w $E46B,y             ;
                    STA.b $00                 ;
                    PLA                       ;
                    CLC                       ;
                    ADC.w $E475,y             ;
                    STA.b $02                 ;
                    SEP   #$20                ;
                    LDY.b $EB                 ;
                    LDA.w $E493,y             ;
                    CLC                       ;
                    ADC.w $0B12,x             ;
                    STA.w $0B12,x             ;
                    LDA.w $E47F,y             ;
                    CLC                       ;
                    ADC.w $0B12,x             ;
                    STA.b $04                 ;
                    LDA.w $E484,y             ;
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
                    LDA.w $E489,x             ;
                    STA.w $0902,y             ;
                    LDA.w $E48E,x             ;
                    STA.w $0906,y             ;
                    LDA.b #$28                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    LDA.b $01                 ;
                    BEQ   CODE_0FE52B         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
CODE_0FE52B:        LDA.b $03                 ;
                    BEQ   CODE_0FE534         ;
                    LDA.b #$01                ;
                    STA.w $0D04,y             ;
CODE_0FE534:        JMP.w CODE_0FE467         ;

CODE_0FE537:        STY.b $EC                 ;
                    LDX.b #$00                ;
CODE_0FE53B:        LDA.b $EC                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $EB                 ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b $EB                 ;
                    TAY                       ;
                    LDA.b #$D8                ;
                    CLC                       ;
                    ADC.w $E3ED,y             ;
                    STA.b $EE                 ;
                    LDA.b $5C                 ;
                    BNE   CODE_0FE556         ;
                    LDA.b #$F0                ;
                    STA.b $EE                 ;
CODE_0FE556:        LDA.w $E40B,x             ;
                    STA.b $EF                 ;
                    TYA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    REP   #$20                ;
                    LDA.w $E3BD,y             ;
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
                    BEQ   CODE_0FE58E         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
CODE_0FE58E:        INX                       ;
                    CPX.b #$04                ;
                    BNE   CODE_0FE53B         ;
                    RTS                       ;

                    db $1C,$0E,$06,$08,$18,$16,$1A,$14
                    db $D0,$E0,$E1,$FC,$00,$FC,$F8,$F4

CODE_0FE5A4:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $0E40               ;
                    BNE   CODE_0FE5B1         ;
                    JSR.w CODE_0FE5C5         ;
CODE_0FE5B1:        JSR.w CODE_0FE5D4         ;
                    LDA.w $0E42               ;
                    AND.b #$20                ;
                    BEQ   CODE_0FE5C1         ;
                    STZ.w $0E40               ;
                    STZ.w $0E41               ;
CODE_0FE5C1:        PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0FE5C5:        LDX.b #$03                ;
CODE_0FE5C7:        LDA.w $E5A0,x             ;
                    STA.w $0E42,x             ;
                    DEX                       ;
                    BPL   CODE_0FE5C7         ;
                    INC.w $0E40               ;
                    RTS                       ;

CODE_0FE5D4:        LDX.b #$03                ;
                    LDY.b #$30                ;
CODE_0FE5D8:        LDA.w $0E42,x             ;
                    BMI   CODE_0FE608         ;
                    BNE   CODE_0FE5E2         ;
                    JSR.w CODE_0FE618         ;
CODE_0FE5E2:        LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BCS   CODE_0FE608         ;
                    PHX                       ;
                    TAX                       ;
                    LDA.w $E59C,x             ;
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
                    BRA   CODE_0FE60D         ;

CODE_0FE608:        LDA.b #$F8                ;
                    STA.w $0801,y             ;
CODE_0FE60D:        INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INC.w $0E42,x             ;
                    DEX                       ;
                    BPL   CODE_0FE5D8         ;
                    RTS                       ;

CODE_0FE618:        LDA.w $0202               ;
                    LSR   A                   ;
                    BCC   CODE_0FE626         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$06                ;
                    BRA   CODE_0FE62C         ;

CODE_0FE626:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$02                ;
CODE_0FE62C:        STA.w $0E46,x             ;
                    LDA.w $06D5               ;
                    CMP.b #$18                ;
                    BEQ   CODE_0FE63A         ;
                    CMP.b #$78                ;
                    BNE   CODE_0FE64D         ;
CODE_0FE63A:        LDA.w $07B8               ;
                    AND.b #$04                ;
                    SEC                       ;
                    SBC.b #$02                ;
                    CLC                       ;
                    ADC.w $03B8               ;
                    ADC.w $E598               ;
                    STA.w $0E4A,x             ;
                    RTS                       ;

CODE_0FE64D:        LDA.b #$F8                ;
                    STA.w $0E4A,x             ;
                    RTS                       ;

                    db $00,$A5,$40,$2A,$82,$39,$00,$D0
                    db $40,$14,$84,$39,$00,$F0,$40,$14
                    db $84,$39,$01,$10,$40,$14,$84,$39
                    db $00,$C4,$C0,$10,$83,$39,$00,$C5
                    db $C0,$10,$84,$39,$00,$C6,$00,$13
                    db $85,$39,$86,$39,$87,$39,$87,$39
                    db $88,$39,$89,$39,$8A,$39,$8B,$39
                    db $88,$39,$89,$39,$00,$E6,$00,$13
                    db $8C,$39,$8D,$39,$8E,$39,$8F,$39
                    db $90,$39,$91,$39,$92,$39,$93,$39
                    db $90,$39,$94,$39,$01,$06,$00,$13
                    db $95,$39,$96,$39,$95,$39,$96,$39
                    db $97,$39,$84,$39,$95,$39,$98,$39
                    db $97,$39,$99,$39,$01,$26,$00,$29
                    db $8A,$39,$9A,$39,$8A,$79,$8A,$39
                    db $8A,$79,$88,$39,$8A,$79,$9B,$39
                    db $8A,$39,$8A,$79,$84,$39,$88,$39
                    db $8A,$79,$88,$39,$8A,$79,$8A,$39
                    db $8A,$79,$8A,$39,$8A,$79,$84,$39
                    db $84,$39,$01,$46,$00,$29,$9C,$39
                    db $9D,$39,$9D,$39,$9C,$39,$9D,$39
                    db $9C,$39,$9E,$39,$9C,$39,$9C,$39
                    db $9D,$39,$84,$39,$9C,$39,$C7,$39
                    db $9C,$39,$C7,$39,$9C,$39,$9D,$39
                    db $C8,$39,$C9,$39,$84,$39,$84,$39
                    db $01,$66,$00,$29,$9F,$39,$9F,$39
                    db $9F,$39,$A0,$39,$A1,$39,$9F,$39
                    db $A2,$39,$9F,$39,$9F,$39,$9F,$39
                    db $84,$39,$9F,$39,$A2,$39,$9F,$39
                    db $A2,$39,$9F,$39,$9F,$39,$CA,$39
                    db $CB,$39,$84,$39,$84,$39,$01,$19
                    db $00,$03,$E4,$39,$E5,$39,$01,$86
                    db $00,$29,$A3,$39,$A3,$39,$A3,$39
                    db $A4,$39,$A5,$39,$A3,$39,$A3,$39
                    db $A3,$39,$A6,$39,$A7,$39,$84,$39
                    db $A3,$39,$CC,$39,$A3,$39,$A3,$39
                    db $A6,$39,$A7,$39,$A6,$39,$A7,$39
                    db $CD,$39,$84,$39,$01,$A6,$00,$29
                    db $A8,$39,$A9,$39,$AA,$39,$AB,$39
                    db $AC,$39,$AD,$39,$AE,$39,$AF,$39
                    db $B0,$39,$B1,$39,$CE,$39,$AC,$39
                    db $CF,$39,$AD,$39,$D0,$39,$D1,$39
                    db $D2,$39,$D3,$39,$D4,$39,$D5,$39
                    db $84,$39,$01,$C6,$00,$29,$B2,$39
                    db $B3,$39,$B4,$39,$B5,$39,$84,$39
                    db $B6,$39,$B7,$39,$B8,$39,$B9,$39
                    db $BA,$39,$D6,$39,$84,$39,$D7,$39
                    db $D8,$39,$D9,$39,$DA,$39,$DB,$39
                    db $DC,$39,$DD,$39,$DE,$39,$84,$39
                    db $00,$DB,$C0,$10,$C6,$39,$01,$E4
                    db $00,$2F,$BB,$39,$BC,$39,$BD,$39
                    db $BE,$39,$BF,$39,$C0,$39,$BC,$39
                    db $C1,$39,$C2,$39,$C3,$39,$C4,$39
                    db $C4,$79,$BF,$39,$BC,$39,$DF,$39
                    db $E0,$39,$C2,$39,$BF,$79,$E1,$39
                    db $E1,$79,$E2,$39,$E3,$39,$BC,$39
                    db $80,$39,$00,$A4,$00,$01,$81,$39
                    db $00,$BB,$00,$01,$C5,$39,$02,$0A
                    db $00,$25,$2F,$06,$01,$04,$09,$04
                    db $08,$04,$06,$04,$24,$04,$01,$04
                    db $09,$04,$09,$04,$03,$04,$24,$04
                    db $17,$04,$12,$04,$17,$04,$1D,$04
                    db $0E,$04,$17,$04,$0D,$04,$18,$04
                    db $02,$4E,$00,$15,$16,$08,$0A,$08
                    db $1B,$08,$12,$08,$18,$08,$24,$08
                    db $10,$08,$0A,$08,$16,$08,$0E,$08
                    db $24,$08,$02,$8E,$00,$15,$15,$08
                    db $1E,$08,$12,$08,$10,$08,$12,$08
                    db $24,$08,$10,$08,$0A,$08,$16,$08
                    db $0E,$08,$24,$08,$02,$EB,$00,$07
                    db $1D,$08,$18,$08,$19,$08,$28,$08
                    db $02,$F5,$00,$01,$00,$08,$FF,$FF

CODE_0FE893:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.b #$01                ;
                    STA.w $0EC8               ;
                    REP   #$30                ;
                    LDX.w $1700               ;
                    LDY.w #$0000              ;
CODE_0FE8A3:        LDA.w $E653,y             ;
                    STA.w $1702,x             ;
                    INC   A                   ;
                    BEQ   CODE_0FE8B2         ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    BRA   CODE_0FE8A3         ;

CODE_0FE8B2:        STX.w $1700               ;
                    SEP   #$30                ;
                    STZ.w $0F2B               ;
                    PLB                       ;
                    RTL                       ;

                    db $00,$30

CODE_0FE8BE:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    STY.b $00                 ;
                    LDA.w $03B9               ;
                    LDX.w $039A,y             ;
                    LDY.w $0B46,x             ;
                    STY.b $02                 ;
                    DEC   A                   ;
                    JSR.w CODE_0FE94B         ;
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
CODE_0FE90F:        LDA.b #$2C                ;
                    STA.w $0902,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BPL   CODE_0FE90F         ;
                    LDY.b $02                 ;
                    LDA.w $00               ;
                    BNE   CODE_0FE927         ;
                    LDA.b #$2A                ;
                    STA.w $0902,y             ;
CODE_0FE927:        LDA.w $0399               ;
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
CODE_0FE936:        CPX.b #$09                ;
                    BCS   CODE_0FE946         ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    BRA   CODE_0FE936         ;

CODE_0FE946:        LDY.w $0000               ;
                    PLB                       ;
                    RTL                       ;

CODE_0FE94B:        LDX.b #$09                ;
CODE_0FE94D:        STA.w $0901,y             ;
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
                    BEQ   CODE_0FE96F         ;
                    LDA.b #$01                ;
CODE_0FE96F:        ORA.b $DD                 ;
                    STA.w $0D00,y             ;
                    LDA.w $0236               ;
                    BNE   CODE_0FE987         ;
                    LDA.w $0901,y             ;
                    BPL   CODE_0FE987         ;
                    CMP.b #$F0                ;
                    BCS   CODE_0FE987         ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
CODE_0FE987:        PLA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_0FE94D         ;
                    LDY.b $02                 ;
                    RTS                       ;

CODE_0FE995:        LDY.w $0B53               ;
                    REP   #$20                ;
                    LDA.w $0E70               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E6B               ;
                    SEP   #$20                ;
                    LDA.w $0E6F               ;
                    BNE   CODE_0FE9D5         ;
                    LDA.w $0E6D               ;
                    STA.w $0801,y             ;
                    LDA.w $0E6B               ;
                    JSR.w CODE_0FEABB         ;
                    STA.w $0800,y             ;
                    LDA.b #$26                ;
                    STA.w $0802,y             ;
                    LDA.b #$29                ;
                    STA.w $0803,y             ;
                    DEC.w $0E6E               ;
                    BEQ   CODE_0FE9CB         ;
                    JMP.w CODE_0FEA4F         ;

CODE_0FE9CB:        LDA.b #$06                ;
                    STA.w $0E6E               ;
                    INC.w $0E6F               ;
                    BRA   CODE_0FEA4F         ;

CODE_0FE9D5:        LDA.w $0E6F               ;
                    CMP.b #$06                ;
                    BCS   CODE_0FEA4F         ;
                    PHX                       ;
                    LDX.w $0E6F               ;
                    LDA.w $EA81,x             ;
                    CLC                       ;
                    ADC.w $0E6B               ;
                    STA.w $0800,y             ;
                    STA.w $0804,y             ;
                    JSR.w CODE_0FEABB         ;
                    LDA.w $EA8D,x             ;
                    CLC                       ;
                    ADC.w $0E6D               ;
                    STA.w $0801,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0805,y             ;
                    LDA.w $EA87,x             ;
                    CLC                       ;
                    ADC.w $0E6B               ;
                    STA.w $0808,y             ;
                    STA.w $080C,y             ;
                    JSR.w CODE_0FEABB         ;
                    LDA.w $EA8D,x             ;
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
CODE_0FEA2C:        LDA.w $EA93,x             ;
                    STA.w $0802,y             ;
                    LDA.w $EAA7,x             ;
                    STA.w $0803,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $04                 ;
                    BPL   CODE_0FEA2C         ;
                    DEC.w $0E6E               ;
                    BNE   CODE_0FEA4E         ;
                    LDA.b #$06                ;
                    STA.w $0E6E               ;
                    INC.w $0E6F               ;
CODE_0FEA4E:        PLX                       ;
CODE_0FEA4F:        JMP.w CODE_0FEB35         ;

CODE_0FEA52:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_0FEA5A         ;
                    DEC.w $0248,x             ;
CODE_0FEA5A:        LDA.w $0248,x             ;
                    STA.w $0801,y             ;
                    LDA.w $03B3               ;
                    STA.w $0800,y             ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    CMP.b #$F8                ;
                    BCC   CODE_0FEA74         ;
                    LDA.b #$03                ;
                    STA.w $0C00,y             ;
CODE_0FEA74:        LDA.b #$23                ;
                    STA.w $0803,y             ;
                    LDA.b #$2E                ;
                    STA.w $0802,y             ;
                    JMP.w CODE_0FE995         ;

                    db $00,$FC,$FB,$FA,$FA,$FA,$00,$04
                    db $05,$06,$06,$06,$00,$FC,$FC,$FE
                    db $FE,$FF,$27,$27,$28,$28,$36,$37
                    db $36,$37,$36,$37,$36,$37,$38,$29
                    db $38,$29,$38,$29,$38,$29,$29,$A9
                    db $29,$A9,$29,$29,$69,$69,$29,$29
                    db $69,$69,$29,$29,$69,$69,$29,$29
                    db $69,$69

CODE_0FEABB:        PHA                       ;
                    CMP.b #$F8                ;
                    BCC   CODE_0FEAC8         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C04,y             ;
CODE_0FEAC8:        PLA                       ;
                    RTS                       ;

CODE_0FEACA:        LDA.w $0248,x             ;
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

CODE_0FEAEC:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.w $0B62,x             ;
                    LDA.b $39,x               ;
                    CMP.b #$02                ;
                    BCC   CODE_0FEAFB         ;
                    JMP.w CODE_0FEA52         ;

CODE_0FEAFB:        LDA.b $B1,x               ;
                    BMI   CODE_0FEB02         ;
                    JMP.w CODE_0FE995         ;

CODE_0FEB02:        LDA.w $0248,x             ;
                    STA.w $0801,y             ;
                    LDA.w $03B3               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.b $E4                 ;
                    CMP.b #$F0                ;
                    BCS   CODE_0FEB18         ;
                    LDA.b #$02                ;
                    BRA   CODE_0FEB1A         ;

CODE_0FEB18:        LDA.b #$03                ;
CODE_0FEB1A:        STA.w $0C00,y             ;
                    LDA.b $E4                 ;
                    STA.w $0800,y             ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.w $EAE8,x             ;
                    STA.w $0802,y             ;
                    LDA.b #$28                ;
                    STA.w $0803,y             ;
                    LDX.b $9E                 ;
CODE_0FEB35:        PLB                       ;
                    RTL                       ;

                    db $04,$00,$04,$00,$00,$04,$00,$04
                    db $00,$08,$00,$08,$08,$00,$08,$00
                    db $44,$46,$44,$46,$81,$83,$80,$82
                    db $2A,$2A,$AA,$6A

CODE_0FEB53:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.w $0B62,x             ;
                    LDA.w $0747               ;
                    BNE   CODE_0FEB66         ;
                    LDA.b $39,x               ;
                    AND.b #$7F                ;
                    CMP.b #$01                ;
                    BEQ   CODE_0FEB6A         ;
CODE_0FEB66:        LDX.b #$00                ;
                    BEQ   CODE_0FEB71         ;
CODE_0FEB6A:        LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
CODE_0FEB71:        LDA.w $03BE               ;
                    CLC                       ;
                    ADC.w $EB3B,x             ;
                    STA.w $0801,y             ;
                    REP   #$20                ;
                    LDA.w $EB37,x             ;
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
                    BEQ   CODE_0FEBA2         ;
                    LDA.b #$03                ;
                    STA.w $0C00,y             ;
CODE_0FEBA2:        LDA.w $EB47,x             ;
                    STA.w $0802,y             ;
                    LDA.w $EB4F,x             ;
                    STA.w $0803,y             ;
                    LDA.w $03D6               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BEQ   CODE_0FEBBE         ;
                    LDA.w $03D6               ;
                    AND.b #$F0                ;
                    BEQ   CODE_0FEBC2         ;
CODE_0FEBBE:        LDX.b $9E                 ;
                    STZ.b $39,x               ;
CODE_0FEBC2:        LDX.b $9E                 ;
                    PLB                       ;
                    RTL                       ;

CODE_0FEBC6:        PHD                       ;
                    LDA.b #$0C                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    REP   #$10                ;
                    LDX.w #$0000              ;
                    TXY                       ;
CODE_0FEBD3:        LDA.b $0C,x               ;
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
                    BCC   CODE_0FEBD3         ;
                    SEP   #$10                ;
                    PLD                       ;
                    RTL                       ;

CODE_0FEC20:        LDA.w $02F7               ;
                    BNE   CODE_0FEC54         ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_0FEC54         ;
                    LDA.w $03D3               ;
                    AND.b #$08                ;
                    BNE   CODE_0FEC54         ;
                    LDY.w $0B53,x             ;
                    LDA.w $03B0               ;
                    STA.w $0800,y             ;
                    LDA.w $03BB               ;
                    STA.w $0801,y             ;
                    LDA.b #$9F                ;
                    STA.w $0802,y             ;
                    LDA.b $0F                 ;
                    CMP.b #$07                ;
                    BNE   CODE_0FEC4F         ;
                    LDA.b #$0A                ;
                    BRA   CODE_0FEC51         ;

CODE_0FEC4F:        LDA.b #$2A                ;
CODE_0FEC51:        STA.w $0803,y             ;
CODE_0FEC54:        RTL                       ;

                    db $DF,$1B,$7F,$02,$39,$01,$00,$00
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

CODE_0FED35:        LDA.w $0200               ;
                    BEQ   CODE_0FED3C         ;
                    PLB                       ;
                    RTL                       ;

CODE_0FED3C:        INC.w $0E74               ;
                    LDA.w $0E74               ;
                    AND.b #$07                ;
                    BEQ   CODE_0FED49         ;
                    JMP.w CODE_0FEDBC         ;

CODE_0FED49:        INC.w $0E75               ;
                    LDA.w $0E75               ;
                    CMP.b #$03                ;
                    BNE   CODE_0FED58         ;
                    STZ.w $0E75               ;
                    LDA.b #$00                ;
CODE_0FED58:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $EC55,x             ;
                    STA.w $1026               ;
                    LDA.w $EC9D,x             ;
                    STA.w $100A               ;
                    LDA.w $EC6D,x             ;
                    STA.w $102C               ;
                    LDA.w $EC57,x             ;
                    STA.w $1028               ;
                    LDA.w $EC9F,x             ;
                    STA.w $100C               ;
                    LDA.w $EC6F,x             ;
                    STA.w $102E               ;
                    LDA.w $EC59,x             ;
                    STA.w $102A               ;
                    LDA.w $ECA1,x             ;
                    STA.w $100E               ;
                    LDA.w $EC71,x             ;
                    STA.w $1030               ;
                    SEP   #$20                ;
                    LDA.w $0F26               ;
                    BEQ   CODE_0FEDB7         ;
                    DEC   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $EDAF,x             ;
                    STA.b $E4                 ;
                    LDA.w $EDB0,x             ;
                    STA.b $E5                 ;
                    LDA.b #$05                ;
                    STA.b $E6                 ;
                    JMP.w ($00E4)             ;

                    dw CODE_0FEDF3
                    dw CODE_0FEDB7
                    dw CODE_0FEE20
                    dw CODE_0FEF02

CODE_0FEDB7:        LDA.b #$01                ;
                    STA.w $1200               ;
CODE_0FEDBC:        LDA.w $0E74               ;
                    AND.b #$03                ;
                    BNE   CODE_0FEDF1         ;
                    INC.w $0E76               ;
                    LDA.w $0E76               ;
                    CMP.b #$03                ;
                    BNE   CODE_0FEDD2         ;
                    STZ.w $0E76               ;
                    LDA.b #$00                ;
CODE_0FEDD2:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $EC85,x             ;
                    STA.w $1032               ;
                    LDA.w $EC87,x             ;
                    STA.w $1034               ;
                    LDA.w $EC89,x             ;
                    STA.w $1036               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
CODE_0FEDF1:        PLB                       ;
                    RTL                       ;

CODE_0FEDF3:        LDA.w $0E74               ;
                    AND.b #$38                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $EE52,x             ;
                    STA.w $10E6               ;
                    LDA.w $EE62,x             ;
                    STA.w $10E8               ;
                    LDA.w $EE72,x             ;
                    STA.w $10FA               ;
                    LDA.w $EE82,x             ;
                    STA.w $10FC               ;
                    LDA.w $EE92,x             ;
                    STA.w $10FE               ;
                    SEP   #$20                ;
                    JMP.w CODE_0FEDB7         ;

CODE_0FEE20:        LDA.w $0E74               ;
                    AND.b #$38                ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $ECB5,x             ;
                    STA.w $10E6               ;
                    LDA.w $ECB7,x             ;
                    STA.w $10E8               ;
                    LDA.w $ECB9,x             ;
                    STA.w $10EA               ;
                    LDA.w $ECBB,x             ;
                    STA.w $10EC               ;
                    LDA.w $ECBD,x             ;
                    STA.w $10EE               ;
                    LDA.w $ECBF,x             ;
                    STA.w $10F0               ;
                    SEP   #$20                ;
                    JMP.w CODE_0FEDB7         ;

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

CODE_0FEF02:        LDA.w $0E74               ;
                    AND.b #$38                ;
                    TAX                       ;
                    LSR   A                   ;
                    TAY                       ;
                    REP   #$20                ;
                    LDA.w $EEA2,x             ;
                    STA.w $10E2               ;
                    LDA.w $EEA4,x             ;
                    STA.w $10E4               ;
                    LDA.w $EEA6,x             ;
                    STA.w $10E6               ;
                    LDA.w $EEA8,x             ;
                    STA.w $10E8               ;
                    LDA.w $EEE2,y             ;
                    STA.w $10FC               ;
                    LDA.w $EEE4,y             ;
                    STA.w $10FE               ;
                    SEP   #$20                ;
                    LDA.b $1C                 ;
                    CMP.b #$35                ;
                    BEQ   CODE_0FEFAC         ;
                    LDA.w $0EB7               ;
                    BNE   CODE_0FEF61         ;
                    LDA.w $07B8               ;
                    AND.b #$0F                ;
                    BNE   CODE_0FEFAC         ;
                    LDA.b $0F                 ;
                    CMP.b #$08                ;
                    BNE   CODE_0FEF4F         ;
                    LDA.b #$18                ;
                    STA.w $1603               ;
CODE_0FEF4F:        LDA.b #$11                ;
                    STA.w $0EB8               ;
                    LDA.b #$1F                ;
                    STA.w $0EB9               ;
                    STA.w $0EBA               ;
                    INC.w $0EB7               ;
                    BRA   CODE_0FEF89         ;

CODE_0FEF61:        DEC.w $0EB8               ;
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
                    BNE   CODE_0FEF89         ;
                    STZ.w $0EB7               ;
CODE_0FEF89:        REP   #$20                ;
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
CODE_0FEFAC:        JMP.w CODE_0FEDB7         ;

CODE_0FEFAF:        STZ.w $028D               ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0FEFF0         ;
                    LDA.b $09                 ;
                    AND.b #$38                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $04                 ;
                    LDA.b #$10                ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$8000              ;
                    LDY.b $04                 ;
CODE_0FEFCD:        DEY                       ;
                    BMI   CODE_0FEFD6         ;
                    CLC                       ;
                    ADC.w #$0800              ;
                    BRA   CODE_0FEFCD         ;

CODE_0FEFD6:        CLC                       ;
                    ADC.w #$4000              ;
                    STA.w $0285               ;
                    LDA.w #$1C00              ;
                    STA.w $028A               ;
                    LDA.w #$0600              ;
                    STA.w $0288               ;
                    SEP   #$20                ;
                    INC.w $028D               ;
                    BRA   CODE_0FF024         ;

CODE_0FEFF0:        LDA.b $09                 ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0285               ;
                    AND.b #$07                ;
                    BNE   CODE_0FF024         ;
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
CODE_0FF024:        RTL                       ;

                    db $01,$18

CODE_0FF027:        SEP   #$30                ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.b $99                 ;
                    CMP.b #$01                ;
                    BNE   CODE_0FF03D         ;
                    STA.w $02F8               ;
                    LDX.w $0753               ;
                    LDA.w $F025,x             ;
                    STA.b $99                 ;
CODE_0FF03D:        JSR.w CODE_0FF1AF         ;
                    LDA.b $99                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $F051,x             ;
                    STA.b $00                 ;
                    LDA.w $F052,x             ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

                    dw CODE_0FF0A0
                    dw CODE_0FF0C1
                    dw CODE_0FF0AC
                    dw CODE_0FF0C1
                    dw CODE_0FF0D4
                    dw CODE_0FF0AC
                    dw CODE_0FF0A0
                    dw CODE_0FF0C8
                    dw CODE_0FF091
                    dw CODE_0FF0C8
                    dw CODE_0FF0E0
                    dw CODE_0FF0AC
                    dw CODE_0FF0AC
                    dw CODE_0FF0A0
                    dw CODE_0FF0AC
                    dw CODE_0FF0A0
                    dw CODE_0FF0AC
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0C1
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0
                    dw CODE_0FF0A0

CODE_0FF091:        LDA.w $075F               ;
                    CMP.b #$08                ;
                    BNE   CODE_0FF0A0         ;
                    LDA.b #$11                ;
                    STA.w $99               ;
                    JSR.w CODE_0FF1AF         ;
CODE_0FF0A0:        STZ.b $99                 ;
                    PLB                       ;
                    STZ.w $028D               ;
                    LDA.b #$01                ;
                    STA.w $028C               ;
                    RTL                       ;

CODE_0FF0AC:        LDA.b $DB                 ;
                    CMP.b #$13                ;
                    BEQ   CODE_0FF0CD         ;
                    CMP.b #$19                ;
                    BEQ   CODE_0FF0CD         ;
                    CMP.b #$2F                ;
                    BEQ   CODE_0FF0CD         ;
                    LDA.b #$17                ;
                    JSR.w CODE_0FF1AF         ;
                    BRA   CODE_0FF0A0         ;

CODE_0FF0C1:        LDA.b #$11                ;
                    JSR.w CODE_0FF1AF         ;
                    BRA   CODE_0FF0A0         ;

CODE_0FF0C8:        LDA.b #$16                ;
                    JSR.w CODE_0FF1AF         ;
CODE_0FF0CD:        LDA.b #$12                ;
                    JSR.w CODE_0FF1AF         ;
                    BRA   CODE_0FF0A0         ;

CODE_0FF0D4:        LDA.b #$13                ;
                    JSR.w CODE_0FF1AF         ;
                    LDA.b #$14                ;
                    JSR.w CODE_0FF1AF         ;
                    BRA   CODE_0FF0A0         ;

CODE_0FF0E0:        LDA.b #$15                ;
                    JSR.w CODE_0FF1AF         ;
                    BRA   CODE_0FF0A0         ;

                    db $00,$00,$08,$00,$10,$00,$09,$00
                    db $09,$00,$08,$00,$09,$00,$10,$00
                    db $08,$00,$10,$00,$08,$00,$09,$00
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

CODE_0FF1AF:        ASL   A                   ;
                    TAX                       ;
                    LDA.w $F0E7,x             ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w $F119,x             ;
                    STA.w $0285               ;
                    LDA.w $F14B,x             ;
                    STA.w $028A               ;
                    LDA.w $F17D,x             ;
                    STA.w $0288               ;
                    SEP   #$20                ;
                    JSR.w CODE_0FF1D1         ;
                    RTS                       ;

CODE_0FF1D1:        LDA.b #$80                ;
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

CODE_0FF1FE:        LDA.w $0F04               ;
                    BEQ   CODE_0FF232         ;
                    LDA.b $5C                 ;
                    CMP.b #$01                ;
                    BNE   CODE_0FF232         ;
                    LDY.b #$01                ;
                    LDA.w $09               ;
                    ASL   A                   ;
                    BCS   CODE_0FF213         ;
                    LDY.b #$03                ;
CODE_0FF213:        STY.w $0000               ;
                    LDA.w $09               ;
                    AND.w $0000               ;
                    BNE   CODE_0FF232         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.w $0219               ;
                    LDA.w $78               ;
                    ADC.b #$00                ;
                    STA.w $78               ;
                    INC.w $06FF               ;
CODE_0FF232:        RTL                       ;

                    db $30,$70,$B8,$50,$98,$30,$70,$B8
                    db $50,$98,$30,$70,$30,$30,$30,$60
                    db $60,$A0,$A0,$A0,$D0,$D0,$D0,$60
                    db $91,$91,$91,$91,$92,$92,$91,$91
                    db $91,$92,$91,$92

CODE_0FF257:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $0E67               ;
                    BNE   CODE_0FF2A2         ;
                    LDA.w $0F04               ;
                    BEQ   CODE_0FF2A2         ;
                    JSR.w CODE_0FF2BC         ;
                    LDX.b #$00                ;
                    LDY.b #$00                ;
CODE_0FF26B:        LDA.w $0901,y             ;
                    CMP.b #$F0                ;
                    BEQ   CODE_0FF27D         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    TYA                       ;
                    AND.b #$FF                ;
                    BEQ   CODE_0FF2A2         ;
                    BRA   CODE_0FF26B         ;

CODE_0FF27D:        LDA.w $0F18,x             ;
                    STA.w $0901,y             ;
                    LDA.w $F24B,x             ;
                    STA.w $0902,y             ;
                    LDA.b #$2A                ;
                    STA.w $0903,y             ;
                    LDA.w $0F0C,x             ;
                    STA.w $0900,y             ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    CPX.b #$0C                ;
                    BNE   CODE_0FF26B         ;
CODE_0FF2A2:        PLB                       ;
                    RTL                       ;

                    db $57,$57,$56,$56,$58,$58,$56,$56
                    db $57,$58,$57,$58,$59,$59,$58,$58
                    db $5A,$5A,$58,$58,$59,$5A,$59,$5A

CODE_0FF2BC:        LDX.b #$0B                ;
CODE_0FF2BE:        LDA.w $0F0C,x             ;
                    CLC                       ;
                    ADC.w $F2A4,x             ;
                    ADC.w $F2A4,x             ;
                    STA.w $0F0C,x             ;
                    LDA.w $0F18,x             ;
                    CLC                       ;
                    ADC.w $F2A4,x             ;
                    STA.w $0F18,x             ;
                    DEX                       ;
                    BPL   CODE_0FF2BE         ;
                    RTS                       ;

                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDX.b #$0B                ;
CODE_0FF2DF:        LDA.w $F23F,x             ;
                    STA.w $0F0C,x             ;
                    LDA.w $F233,x             ;
                    STA.w $0F18,x             ;
                    DEX                       ;
                    BPL   CODE_0FF2DF         ;
                    PLX                       ;
                    PLB                       ;
                    LDA.b #$10                ;
                    STA.w $0F4B               ;
                    TSB.w $1601               ;
                    LDA.b #$01                ;
                    BNE   CODE_0FF306         ;
CODE_0FF2FC:        STZ.w $0F4B               ;
                    LDA.b #$20                ;
                    TSB.w $1601               ;
                    LDA.b #$00                ;
CODE_0FF306:        STA.w $0F04               ;
                    RTL                       ;

                    db $0C,$00,$02,$4C,$80,$05,$2E,$12
                    db $24,$10,$24,$10,$FF

CODE_0FF317:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDY.b #$0C                ;
CODE_0FF31C:        LDA.w $F30A,y             ;
                    STA.w $1700,y             ;
                    DEY                       ;
                    BPL   CODE_0FF31C         ;
                    LDA.w $077A               ;
                    BEQ   CODE_0FF33E         ;
                    LDA.b #$24                ;
                    STA.w $1706               ;
                    LDA.b #$10                ;
                    STA.w $1707               ;
                    LDA.b #$2E                ;
                    STA.w $170A               ;
                    LDA.b #$12                ;
                    STA.w $170B               ;
CODE_0FF33E:        PLB                       ;
                    RTL                       ;

                    db $02,$4E,$4E,$4E,$4E,$02,$02,$02
                    db $4E,$4E,$4E,$4E,$4F,$99,$84,$85
                    db $86,$D0,$F1,$1A,$64,$83,$AE,$DB
                    db $00,$2F,$2F,$3C,$0A,$3C,$BB,$74
                    db $AB,$3F,$17,$F6,$F6,$F6,$F6,$17
                    db $1A,$1A,$F6,$F6,$F6,$F6,$F6,$F6
                    db $F3,$F3,$F3,$F3,$F3,$F4,$F4,$F4
                    db $F4,$F4,$F5,$F5,$F5,$F5,$F3,$F5
                    db $F5,$F6,$F3,$F4,$FF,$FF,$04,$E8
                    db $00,$1F,$1D,$08,$11,$08,$0A,$08
                    db $17,$08,$14,$08,$24,$08,$22,$08
                    db $18,$08,$1E,$08,$24,$08,$16,$08
                    db $0A,$08,$1B,$08,$12,$08,$18,$08
                    db $2B,$08,$FF,$04,$E8,$00,$1F,$1D
                    db $08,$11,$08,$0A,$08,$17,$08,$14
                    db $08,$24,$08,$22,$08,$18,$08,$1E
                    db $08,$24,$08,$15,$08,$1E,$08,$12
                    db $08,$10,$08,$12,$08,$2B,$08,$FF
                    db $05,$09,$00,$1B,$19,$08,$0E,$08
                    db $0A,$08,$0C,$08,$0E,$08,$24,$08
                    db $12,$08,$1C,$08,$24,$08,$19,$08
                    db $0A,$08,$1F,$08,$0E,$08,$0D,$08
                    db $FF,$05,$47,$00,$23,$20,$08,$12
                    db $08,$1D,$08,$11,$08,$24,$08,$14
                    db $08,$12,$08,$17,$08,$10,$08,$0D
                    db $08,$18,$08,$16,$08,$24,$08,$1C
                    db $08,$0A,$08,$1F,$08,$0E,$08,$0D
                    db $08,$FF,$05,$89,$00,$1F,$11,$08
                    db $1E,$08,$1B,$08,$1B,$08,$0A,$08
                    db $11,$08,$24,$08,$1D,$08,$18,$08
                    db $24,$08,$24,$08,$16,$08,$0A,$08
                    db $1B,$08,$12,$08,$18,$08,$FF,$05
                    db $89,$00,$1F,$11,$08,$1E,$08,$1B
                    db $08,$1B,$08,$0A,$08,$11,$08,$24
                    db $08,$1D,$08,$18,$08,$24,$08,$24
                    db $08,$15,$08,$1E,$08,$12,$08,$10
                    db $08,$12,$08,$FF,$05,$CA,$00,$19
                    db $18,$08,$1E,$08,$1B,$08,$24,$08
                    db $18,$08,$17,$08,$15,$08,$22,$08
                    db $24,$08,$11,$08,$0E,$08,$1B,$08
                    db $18,$08,$FF,$06,$07,$00,$25,$1D
                    db $08,$11,$08,$12,$08,$1C,$08,$24
                    db $08,$0E,$08,$17,$08,$0D,$08,$1C
                    db $08,$24,$08,$22,$08,$18,$08,$1E
                    db $08,$1B,$08,$24,$08,$1D,$08,$1B
                    db $08,$12,$08,$19,$08,$FF,$06,$46
                    db $00,$27,$18,$08,$0F,$08,$24,$08
                    db $0A,$08,$24,$08,$15,$08,$18,$08
                    db $17,$08,$10,$08,$24,$08,$0F,$08
                    db $1B,$08,$12,$08,$0E,$08,$17,$08
                    db $0D,$08,$1C,$08,$11,$08,$12,$08
                    db $19,$08,$FF,$06,$88,$00,$1F,$01
                    db $04,$00,$04,$00,$04,$00,$04,$00
                    db $04,$00,$04,$24,$04,$19,$04,$1D
                    db $04,$1C,$04,$AF,$04,$0A,$04,$0D
                    db $04,$0D,$04,$0E,$04,$0D,$04,$FF
                    db $06,$A6,$00,$29,$0F,$04,$18,$04
                    db $1B,$04,$24,$04,$0E,$04,$0A,$04
                    db $0C,$04,$11,$04,$24,$04,$19,$04
                    db $15,$04,$0A,$04,$22,$04,$0E,$04
                    db $1B,$04,$24,$04,$15,$04,$0E,$04
                    db $0F,$04,$1D,$04,$AF,$04,$FF,$3F
                    db $00,$00,$07,$0F,$08,$30,$08,$30
                    db $08,$0F,$08,$FF,$06,$24,$00,$2F
                    db $20,$08,$0E,$08,$24,$08,$19,$08
                    db $1B,$08,$0E,$08,$1C,$08,$0E,$08
                    db $17,$08,$1D,$08,$24,$08,$0F,$08
                    db $0A,$08,$17,$08,$1D,$08,$0A,$08
                    db $1C,$08,$22,$08,$24,$08,$20,$08
                    db $18,$08,$1B,$08,$15,$08,$0D,$08
                    db $06,$66,$00,$25,$15,$08,$0E,$08
                    db $1D,$08,$F2,$08,$1C,$08,$24,$08
                    db $1D,$08,$1B,$08,$22,$08,$24,$08
                    db $76,$08,$09,$08,$24,$08,$20,$08
                    db $18,$08,$1B,$08,$15,$08,$0D,$08
                    db $75,$08,$06,$A9,$00,$1B,$20,$08
                    db $12,$08,$1D,$08,$11,$08,$24,$08
                    db $18,$08,$17,$08,$0E,$08,$24,$08
                    db $10,$08,$0A,$08,$16,$08,$0E,$08
                    db $AF,$08,$FF,$06,$25,$00,$2B,$22
                    db $08,$18,$08,$1E,$08,$F2,$08,$1B
                    db $08,$0E,$08,$24,$08,$0A,$08,$24
                    db $08,$1C,$08,$1E,$08,$19,$08,$0E
                    db $08,$1B,$08,$24,$08,$19,$08,$15
                    db $08,$0A,$08,$22,$08,$0E,$08,$1B
                    db $08,$2B,$08,$06,$69,$00,$19,$20
                    db $08,$0E,$08,$24,$08,$11,$08,$18
                    db $08,$19,$08,$0E,$08,$24,$08,$20
                    db $08,$0E,$08,$F2,$08,$15,$08,$15
                    db $08,$06,$A9,$00,$1B,$1C,$08,$0E
                    db $08,$0E,$08,$24,$08,$22,$08,$18
                    db $08,$1E,$08,$24,$08,$0A,$08,$10
                    db $08,$0A,$08,$12,$08,$87,$10,$AF
                    db $08,$06,$E8,$00,$1F,$16,$08,$0A
                    db $08,$1B,$08,$12,$08,$18,$08,$24
                    db $08,$0A,$08,$17,$08,$0D,$08,$24
                    db $08,$1C,$08,$1D,$08,$0A,$08,$0F
                    db $08,$0F,$08,$AF,$08,$FF,$FF,$05
                    db $48,$00,$1F,$1D,$08,$11,$08,$0A
                    db $08,$17,$08,$14,$08,$24,$00,$22
                    db $08,$18,$08,$1E,$08,$24,$00,$16
                    db $08,$0A,$08,$1B,$08,$12,$08,$18
                    db $08,$2B,$08,$FF,$05,$48,$00,$1F
                    db $1D,$08,$11,$08,$0A,$08,$17,$08
                    db $14,$08,$24,$00,$22,$08,$18,$08
                    db $1E,$08,$24,$00,$15,$08,$1E,$08
                    db $12,$08,$10,$08,$12,$08,$2B,$08
                    db $FF,$05,$C5,$00,$2B,$0B,$08,$1E
                    db $08,$1D,$08,$24,$00,$18,$08,$1E
                    db $08,$1B,$08,$24,$00,$19,$08,$1B
                    db $08,$12,$08,$17,$08,$0C,$08,$0E
                    db $08,$1C,$08,$1C,$08,$24,$00,$12
                    db $08,$1C,$08,$24,$00,$12,$08,$17
                    db $08,$06,$05,$00,$1D,$0A,$08,$17
                    db $08,$18,$08,$1D,$08,$11,$08,$0E
                    db $08,$1B,$08,$24,$00,$0C,$08,$0A
                    db $08,$1C,$08,$1D,$08,$15,$08,$0E
                    db $08,$2B,$08,$FF,$01,$81,$01,$81
                    db $01,$81,$02,$01,$81,$00,$81,$00
                    db $80,$01,$81,$01,$00,$B0,$10,$10
                    db $10,$28,$10,$28,$06,$10,$10,$0C
                    db $80,$10,$28,$08,$90,$FF,$00

CODE_0FF70F:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDX.w $0717               ;
                    LDA.w $0718               ;
                    BNE   CODE_0FF727         ;
                    INX                       ;
                    INC.w $0717               ;
                    SEC                       ;
                    LDA.w $F6FC,x             ;
                    STA.w $0718               ;
                    BEQ   CODE_0FF731         ;
CODE_0FF727:        LDA.w $F6EB,x             ;
                    STA.w $0FF4               ;
                    DEC.w $0718               ;
                    CLC                       ;
CODE_0FF731:        PLB                       ;
                    RTL                       ;

CODE_0FF733:        LDX.b #$07                ;
                    LDA.b #$00                ;
                    STA.b $06                 ;
CODE_0FF739:        STX.b $07                 ;
CODE_0FF73B:        CPX.b #$01                ;
                    BNE   CODE_0FF743         ;
                    CPY.b #$50                ;
                    BCS   CODE_0FF745         ;
CODE_0FF743:        STA.b ($06),y             ;
CODE_0FF745:        DEY                       ;
                    CPY.b #$FF                ;
                    BNE   CODE_0FF73B         ;
                    DEX                       ;
                    BPL   CODE_0FF739         ;
                    LDA.b #$FF                ;
                    STA.w $1702               ;
                    INC   A                   ;
                    STZ.w $0B25               ;
                    STZ.w $0B26               ;
                    STZ.w $0B27               ;
                    STZ.w $0B28               ;
                    STZ.w $0B29               ;
                    LDX.b #$40                ;
CODE_0FF764:        STZ.w $0F00,x             ;
                    INX                       ;
                    BNE   CODE_0FF764         ;
                    LDA.w $0F0B               ;
                    BEQ   CODE_0FF779         ;
                    DEC   A                   ;
                    STA.w $0F0B               ;
                    BNE   CODE_0FF779         ;
                    JSL.l CODE_0FD085         ;
CODE_0FF779:        RTL                       ;

                    db $93,$00,$00,$11,$12,$12,$13,$00
                    db $00,$51,$52,$53,$00,$00,$00,$00
                    db $00,$00,$01,$02,$02,$03,$00,$00
                    db $00,$00,$00,$00,$91,$92,$93,$00
                    db $00,$00,$00,$51,$52,$53,$41,$42
                    db $43,$00,$00,$00,$00,$00,$91,$92
                    db $97,$87,$88,$89,$99,$00,$00,$00
                    db $11,$12,$13,$A4,$A5,$A5,$A5,$A6
                    db $97,$98,$99,$01,$02,$03,$00,$A4
                    db $A5,$A6,$00,$11,$12,$12,$12,$13
                    db $00,$00,$00,$00,$01,$02,$02,$03
                    db $00,$A4,$A5,$A5,$A6,$00,$00,$00
                    db $11,$12,$12,$13,$00,$00,$00,$00
                    db $00,$00,$00,$9C,$00,$8B,$AA,$AA
                    db $AA,$AA,$11,$12,$13,$8B,$00,$9C
                    db $9C,$00,$00,$01,$02,$03,$11,$12
                    db $12,$13,$00,$00,$00,$00,$AA,$AA
                    db $9C,$AA,$00,$8B,$00,$01,$02,$03
                    db $FF,$FF,$FF,$FF,$FF,$06,$00,$FF
                    db $01,$0E,$06,$00,$FF,$02,$0E,$FF
                    db $01,$07,$0F,$FF,$FF,$FF,$FF,$FF
                    db $16,$FF,$06,$FF,$0E,$FF,$06,$00
                    db $FF,$0E,$01,$00,$0E,$14,$0F,$01
                    db $FF,$FF,$FF,$FF,$16,$01,$0F,$05
                    db $0E,$00,$0A,$0B,$07,$00,$01,$00
                    db $0E,$FF,$0F,$01,$FF,$FF,$FF,$FF
                    db $16,$FF,$06,$FF,$12,$FF,$00,$08
                    db $12,$05,$01,$FF,$03,$08,$0F,$FF
                    db $FF,$FF,$FF,$FF,$16,$06,$08,$00
                    db $0F,$02,$FF,$02,$01,$06,$FF,$FF
                    db $0E,$07,$0F,$08,$FF,$FF,$FF,$FF
                    db $16,$02,$0E,$05,$08,$06,$01,$0A
                    db $07,$0B,$0E,$01,$0E,$14,$0F,$FF
                    db $FF,$FF,$FF,$FF,$16,$02,$0E,$14
                    db $08,$05,$01,$0E,$12,$0F,$FF,$FF
                    db $0E,$FF,$0F,$FF,$FF,$FF,$FF,$FF
                    db $16,$00,$02,$0F,$05,$06,$02,$05
                    db $0F,$00,$FF,$01,$0E,$12,$0F,$05
                    db $FF,$FF,$FF,$FF,$16,$02,$07,$12
                    db $0E,$05,$FF,$FF,$12,$FF,$FF,$FF
                    db $FF,$FF,$FF,$16,$02,$06,$0E,$07
                    db $05,$00,$0E,$FF,$0F,$01,$FF,$05
                    db $FF,$08,$FF,$07,$0E,$0F,$14,$FF
                    db $FF,$FF,$FF,$FF,$16,$FF,$00,$0E
                    db $02,$FF,$0A,$00,$07,$0E,$0B,$01
                    db $0E,$08,$0F,$FF,$FF,$FF,$FF,$FF
                    db $16,$02,$0E,$05,$0F,$FF,$01,$0E
                    db $14,$08,$07,$FF,$0E,$12,$0F,$FF
                    db $FF,$FF,$FF,$FF,$16,$00,$05,$0F
                    db $08,$02,$01,$0E,$02,$0F,$00,$01
                    db $0E,$05,$08,$00,$FF,$FF,$FF,$FF
                    db $16

CODE_0FF913:        LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BCS   CODE_0FF92A         ;
                    LDA.w $03B9               ;
                    CMP.b #$E8                ;
                    BCC   CODE_0FF92C         ;
CODE_0FF92A:        LDA.b #$F0                ;
CODE_0FF92C:        STA.w $0901,y             ;
                    LDA.b $A1,x               ;
                    BMI   CODE_0FF937         ;
                    LDA.b #$A9                ;
                    BRA   CODE_0FF939         ;

CODE_0FF937:        LDA.b #$29                ;
CODE_0FF939:        STA.w $0903,y             ;
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
                    BEQ   CODE_0FF96B         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
CODE_0FF96B:        RTL                       ;

CODE_0FF96C:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    STZ.w $0F49               ;
                    PHX                       ;
                    LDX.b $9E                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$04                ;
                    BCS   CODE_0FF983         ;
                    LDA.b $29,x               ;
                    BMI   CODE_0FF987         ;
                    AND.b #$06                ;
                    BEQ   CODE_0FF987         ;
CODE_0FF983:        PLX                       ;
                    PLB                       ;
                    CLC                       ;
                    RTL                       ;

CODE_0FF987:        LDA.w $29,x             ;
                    STA.b $E0                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_0FF998         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0FF998         ;
                    CMP.b #$04                ;
                    BNE   CODE_0FF99D         ;
CODE_0FF998:        STZ.w $0F40,x             ;
                    BRA   CODE_0FF9AA         ;

CODE_0FF99D:        AND.b #$80                ;
                    BEQ   CODE_0FF983         ;
                    LDA.b $0F                 ;
                    CMP.b #$0A                ;
                    BCS   CODE_0FF9AA         ;
                    INC.w $0F40,x             ;
CODE_0FF9AA:        LDA.w $0F40,x             ;
                    AND.b #$0C                ;
                    STA.b $E4                 ;
                    LDA.b $1C,x               ;
                    LDX.b $E4                 ;
                    CMP.b #$02                ;
                    BNE   CODE_0FF9BE         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAX                       ;
CODE_0FF9BE:        LDA.b $E0                 ;
                    AND.b #$0F                ;
                    CMP.b #$04                ;
                    BNE   CODE_0FF9CF         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$20                ;
                    TAX                       ;
                    LDA.b #$80                ;
                    TSB.b $04                 ;
CODE_0FF9CF:        TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    CMP.b #$F0                ;
                    BCC   CODE_0FF9E0         ;
                    LDA.b #$F0                ;
CODE_0FF9E0:        PHA                       ;
                    LDA.b $04                 ;
                    BPL   CODE_0FF9EB         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b #$02                ;
                    BRA   CODE_0FF9EC         ;

CODE_0FF9EB:        PLA                       ;
CODE_0FF9EC:        JSR.w CODE_0FFAB0         ;
                    LDA.b $04                 ;
                    BPL   CODE_0FF9FB         ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$12                ;
                    BRA   CODE_0FFA01         ;

CODE_0FF9FB:        LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$10                ;
CODE_0FFA01:        JSR.w CODE_0FFAB0         ;
                    LDX.b $E4                 ;
                    LDA.w $FB19,x             ;
                    ORA.b $04                 ;
                    STA.w $08F3,y             ;
                    LDA.w $FB1A,x             ;
                    ORA.b $04                 ;
                    STA.w $08F7,y             ;
                    LDA.w $FB1B,x             ;
                    ORA.b $04                 ;
                    STA.w $08FB,y             ;
                    LDA.w $FB1C,x             ;
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

CODE_0FFA4D:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDX.b $9E                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$35                ;
                    BNE   CODE_0FFA9F         ;
                    LDA.w $0EC4               ;
                    BNE   CODE_0FFA9F         ;
                    LDA.w $0F4A               ;
                    AND.b #$1F                ;
                    LDY.w $0B46,x             ;
                    PHY                       ;
                    TAX                       ;
                    LDA.w $FA2D,x             ;
                    STA.b $DD                 ;
                    JSR.w CODE_0FFAA2         ;
                    JSR.w CODE_0FFAA2         ;
                    JSR.w CODE_0FFAA2         ;
                    JSR.w CODE_0FFAA2         ;
                    JSR.w CODE_0FFAA2         ;
                    JSR.w CODE_0FFAA2         ;
                    PLY                       ;
                    CPX.b #$10                ;
                    BCS   CODE_0FFA9C         ;
                    LDA.b #$FF                ;
                    STA.w $0902,y             ;
                    STA.w $0906,y             ;
                    LDA.b #$D7                ;
                    STA.w $090A,y             ;
                    STA.w $090E,y             ;
                    LDA.b #$EE                ;
                    STA.w $0912,y             ;
                    STA.w $0916,y             ;
CODE_0FFA9C:        INC.w $0F4A               ;
CODE_0FFA9F:        PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_0FFAA2:        LDA.w $0901,y             ;
                    CLC                       ;
                    ADC.b $DD                 ;
                    STA.w $0901,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    RTS                       ;

CODE_0FFAB0:        STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    LDA.w $FAD9,x             ;
                    STA.w $0902,y             ;
                    LDA.w $FADA,x             ;
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
                    db $BF,$27,$FF,$7F,$1F,$3F,$5F,$4A
                    db $3E,$03,$FF,$77,$7F,$2A,$5F,$31
                    db $9E,$02,$BF,$6F,$DF,$15,$1D,$00
                    db $FF,$53,$7F,$67,$9F,$4F,$7F,$67

CODE_0FFB49:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.b $09                 ;
                    AND.b #$18                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $FB29,x             ;
                    STA.w $10CC               ;
                    LDA.w $FB31,x             ;
                    STA.w $10CE               ;
                    LDA.w $FB39,x             ;
                    STA.w $10D0               ;
                    LDA.w $FB41,x             ;
                    STA.w $10DA               ;
                    SEP   #$20                ;
                    INC.w $1200               ;
                    PLB                       ;
                    RTL                       ;

CODE_0FFB74:        REP   #$30                ;
                    LDX.w #$0000              ;
                    STZ.b $E6                 ;
CODE_0FFB7B:        LDA.w $1000,x             ;
                    STA.b $E4                 ;
                    AND.w #$7C00              ;
                    BEQ   CODE_0FFB8D         ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.w #$0400              ;
                    STA.b $E4                 ;
CODE_0FFB8D:        LDA.b $E4                 ;
                    AND.w #$03E0              ;
                    BEQ   CODE_0FFB9C         ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.w #$0020              ;
                    STA.b $E4                 ;
CODE_0FFB9C:        LDA.b $E4                 ;
                    AND.w #$001F              ;
                    BEQ   CODE_0FFBA5         ;
                    DEC.b $E4                 ;
CODE_0FFBA5:        LDA.b $E4                 ;
                    STA.w $1000,x             ;
                    ORA.b $E6                 ;
                    STA.b $E6                 ;
                    INX                       ;
                    INX                       ;
                    CPX.w #$0200              ;
                    BCC   CODE_0FFB7B         ;
                    LDA.b $E6                 ;
                    BEQ   CODE_0FFBC8         ;
                    SEP   #$30                ;
                    STA.w $0EB8               ;
                    STA.w $0200               ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
                    CLC                       ;
                    RTL                       ;

CODE_0FFBC8:        SEP   #$30                ;
                    STZ.w $0EB8               ;
                    STZ.w $0200               ;
                    SEC                       ;
                    RTL                       ;

                    LDA.b $5E,x               ;
                    BMI   CODE_0FFBDF         ;
                    LDA.b $00                 ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.b $E4                 ;
                    BRA   CODE_0FFBE3         ;

CODE_0FFBDF:        LDA.b $00                 ;
                    STA.b $E4                 ;
CODE_0FFBE3:        LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.b $E4                 ;
                    STA.b $E4                 ;
                    PHY                       ;
                    LDY.w $0B46,x             ;
                    CMP.b #$18                ;
                    BCC   CODE_0FFC03         ;
                    LDA.w $0913,y             ;
                    ORA.b #$20                ;
                    STA.w $0913,y             ;
                    LDA.w $0917,y             ;
                    ORA.b #$20                ;
                    STA.w $0917,y             ;
CODE_0FFC03:        LDA.b $E4                 ;
                    CMP.b #$10                ;
                    BCC   CODE_0FFC19         ;
                    LDA.w $090B,y             ;
                    ORA.b #$20                ;
                    STA.w $090B,y             ;
                    LDA.w $090F,y             ;
                    ORA.b #$20                ;
                    STA.w $090F,y             ;
CODE_0FFC19:        LDA.b $E4                 ;
                    CMP.b #$08                ;
                    BCC   CODE_0FFC2F         ;
                    LDA.w $0903,y             ;
                    ORA.b #$20                ;
                    STA.w $0903,y             ;
                    LDA.w $0907,y             ;
                    ORA.b #$20                ;
                    STA.w $0907,y             ;
CODE_0FFC2F:        PLY                       ;
                    RTL                       ;

                    db $F9,$0E,$F7,$0E,$FA,$FB,$F8,$FB
                    db $F6,$FB,$FD,$FE,$20,$22,$24

CODE_0FFC40:        PHB
                    PHK                       ;
                    PLB                       ;
                    LDY.b #$F0                ;
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
                    ADC.w #$0004              ;
                    STA.b $E6                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $E8                 ;
                    BPL   CODE_0FFC6E         ;
                    CMP.w #$FF80              ;
                    BCS   CODE_0FFC6E         ;
                    SEP   #$30                ;
                    PLB                       ;
                    RTL                       ;

CODE_0FFC6E:        SEP   #$20                ;
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
                    BNE   CODE_0FFC8F         ;
                    LDX.b #$01                ;
CODE_0FFC8F:        LDA.w $FC3D,x             ;
                    STA.w $0802,y             ;
                    PLX                       ;
                    LDA.w $070F               ;
                    BEQ   CODE_0FFCD0         ;
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
                    LDA.w $FC31,x             ;
                    STA.w $0806,y             ;
                    LDA.w $FC32,x             ;
                    STA.w $080A,y             ;
                    LDA.b #$22                ;
                    STA.w $0807,y             ;
                    STA.w $080B,y             ;
                    CPX.b #$04                ;
                    BCS   CODE_0FFCD0         ;
                    LDA.b #$23                ;
                    STA.w $080B,y             ;
CODE_0FFCD0:        LDA.b #$02                ;
                    STA.b $DD                 ;
                    LDA.b $E5                 ;
                    BEQ   CODE_0FFCDA         ;
                    LDA.b #$01                ;
CODE_0FFCDA:        ORA.b $DD                 ;
                    STA.w $0C00,y             ;
                    STZ.b $DD                 ;
                    LDA.b $E7                 ;
                    BEQ   CODE_0FFCE7         ;
                    LDA.b #$01                ;
CODE_0FFCE7:        ORA.b $DD                 ;
                    STA.w $0C04,y             ;
                    CPX.b #$04                ;
                    BCS   CODE_0FFCF4         ;
                    LDA.b #$02                ;
                    STA.b $DD                 ;
CODE_0FFCF4:        LDA.b $E9                 ;
                    BEQ   CODE_0FFCFA         ;
                    LDA.b #$01                ;
CODE_0FFCFA:        ORA.b $DD                 ;
                    STA.w $0C08,y             ;
                    PLB                       ;
                    RTL                       ;
