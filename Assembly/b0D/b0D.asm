; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $0D8000:
    fillbyte $FF : fill $8000

ORG $0D8000
CODE_0D8000:        JMP.w CODE_0D800D         ;

CODE_0D8003:        JMP.w CODE_0D818D         ;

CODE_0D8006:        JMP.w CODE_0D83A0         ;

CODE_0D8009:        JML.l CODE_009641         ;

CODE_0D800D:        NOP                       ;
                    NOP                       ;
                    LDA.b #$AA                ;
                    STA.l $702000             ;
                    CMP.l $700000             ;
                    BNE   CODE_0D8009         ;
                    LDA.b #$55                ;
                    STA.l $702000             ;
                    CMP.l $700000             ;
                    BNE   CODE_0D8009         ;
                    SEI                       ;
                    STZ.w $4200               ;
                    STZ.w $420B               ;
                    STZ.w $420C               ;
                    LDA.b #$80                ;
                    STA.w $2100               ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_0E8000         ;
                    JSL.l CODE_0480AE         ;
                    JSR.w CODE_0D841C         ;
                    STZ.w $1608               ;
                    STZ.w $1609               ;
                    STZ.w $160F               ;
                    STZ.w $160E               ;
                    STZ.w $160A               ;
                    STA.w $160D               ;
                    LDA.b #$01                ;
                    STA.w $160C               ;
                    LDA.b #$81                ;
                    STA.b $09                 ;
                    STA.w $4200               ;
                    CLI                       ;
CODE_0D8062:        LDA.w $0154               ;
                    BEQ   CODE_0D8062         ;
                    JSR.w CODE_0D96A8         ;
                    LDA.w $07B7               ;
                    AND.b #$02                ;
                    STA.w $07C7               ;
                    LDA.w $07B8               ;
                    AND.b #$02                ;
                    EOR.w $07C7               ;
                    CLC                       ;
                    BEQ   CODE_0D807E         ;
                    SEC                       ;
CODE_0D807E:        ROR.w $07B7               ;
                    ROR.w $07B8               ;
                    ROR.w $07B9               ;
                    ROR.w $07BA               ;
                    ROR.w $07BB               ;
                    ROR.w $07BC               ;
                    ROR.w $07BD               ;
                    JSL.l CODE_048163         ;
                    LDA.l $700007             ;
                    BEQ   CODE_0D80B8         ;
                    LDA.w $0FFA               ;
                    AND.b #$20                ;
                    BEQ   CODE_0D80A7         ;
                    INC.w $15E5               ;
CODE_0D80A7:        LDA.w $0FFA               ;
                    AND.b #$10                ;
                    BNE   CODE_0D80B8         ;
                    LDA.w $15E5               ;
                    AND.b #$01                ;
                    BEQ   CODE_0D80B8         ;
                    JMP.w CODE_0D817F         ;

CODE_0D80B8:        LDA.w $0B76               ;
                    BNE   CODE_0D80C1         ;
                    JSL.l CODE_0FEFAF         ;
CODE_0D80C1:        JSL.l CODE_0FD94F         ;
                    JSR.w CODE_0D98F2         ;
                    LDA.b $5C                 ;
                    BNE   CODE_0D80D0         ;
                    JSL.l CODE_0E834E         ;
CODE_0D80D0:        LDA.w $0ED6               ;
                    BMI   CODE_0D80F0         ;
                    BEQ   CODE_0D810A         ;
                    LDA.w $07B0               ;
                    BEQ   CODE_0D810A         ;
                    LDA.w $0FFA               ;
                    BMI   CODE_0D80E8         ;
                    LDA.w $0FF6               ;
                    AND.b #$90                ;
                    BEQ   CODE_0D810A         ;
CODE_0D80E8:        STZ.w $07B0               ;
                    STZ.w $0ED6               ;
                    BRA   CODE_0D810A         ;

CODE_0D80F0:        LDA.w $0FFA               ;
                    ORA.w $0FF6               ;
                    AND.b #$40                ;
                    BEQ   CODE_0D810A         ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BNE   CODE_0D810A         ;
                    LDA.b #$80                ;
                    STA.w $1602               ;
                    JML.l CODE_0080DE         ;

CODE_0D810A:        LDA.w $0E7F               ;
                    BEQ   CODE_0D8114         ;
                    JSR.w CODE_0DC089         ;
                    BRA   CODE_0D817F         ;

CODE_0D8114:        LDA.w $0776               ;
                    LSR   A                   ;
                    BCS   CODE_0D8178         ;
                    PHD                       ;
                    LDA.b #$07                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    LDA.b $47                 ;
                    BEQ   CODE_0D8129         ;
                    DEC.b $47                 ;
                    BNE   CODE_0D813E         ;
CODE_0D8129:        LDX.b #$18                ;
                    DEC.b $87                 ;
                    BPL   CODE_0D8135         ;
                    LDA.b #$14                ;
                    STA.b $87                 ;
                    LDX.b #$2B                ;
CODE_0D8135:        LDA.b $88,x               ;
                    BEQ   CODE_0D813B         ;
                    DEC.b $88,x               ;
CODE_0D813B:        DEX                       ;
                    BPL   CODE_0D8135         ;
CODE_0D813E:        PLD                       ;
                    LDA.w $07B0               ;
                    BNE   CODE_0D814C         ;
                    LDA.w $0ED6               ;
                    AND.b #$80                ;
                    STA.w $0ED6               ;
CODE_0D814C:        INC.b $09                 ;
                    INC.w $0E68               ;
                    LDA.w $0E68               ;
                    AND.b #$18                ;
                    CMP.b #$18                ;
                    BNE   CODE_0D815D         ;
                    STZ.w $0E68               ;
CODE_0D815D:        JSL.l CODE_0FE26D         ;
                    LDA.w $0722               ;
                    BEQ   CODE_0D816E         ;
                    LDA.b $1B                 ;
                    LSR   A                   ;
                    BCS   CODE_0D816E         ;
                    JSR.w CODE_0D83EC         ;
CODE_0D816E:        JSR.w CODE_0D83D8         ;
                    LDA.w $1680               ;
                    BMI   CODE_0D8178         ;
                    BRA   CODE_0D817F         ;

CODE_0D8178:        JSR.w CODE_0D841C         ;
                    JSL.l CODE_0FDA33         ;
CODE_0D817F:        JSL.l CODE_0FEBC6         ;
                    STZ.w $0154               ;
                    JMP.w CODE_0D8062         ;

                    db $00,$00,$00,$03

CODE_0D818D:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $4210               ;
                    LDA.w $1201               ;
                    BNE   CODE_0D819A         ;
                    LDA.b #$80                ;
CODE_0D819A:        STA.w $2100               ;
                    STZ.w $420C               ;
                    LDA.w $0154               ;
                    BEQ   CODE_0D81A8         ;
                    JMP.w CODE_0D82EA         ;

CODE_0D81A8:        INC.w $0154               ;
                    LDX.w $0773               ;
                    LDA.w $0753               ;
                    BEQ   CODE_0D81C5         ;
                    CPX.b #$0C                ;
                    BNE   CODE_0D81B9         ;
                    LDX.b #$1F                ;
CODE_0D81B9:        CPX.b #$10                ;
                    BNE   CODE_0D81BF         ;
                    LDX.b #$20                ;
CODE_0D81BF:        CPX.b #$13                ;
                    BNE   CODE_0D81C5         ;
                    LDX.b #$21                ;
CODE_0D81C5:        LDA.l $0FF340,x           ;
                    STA.b $00                 ;
                    LDA.l $0FF362,x           ;
                    STA.b $01                 ;
                    LDA.b #$0F                ;
                    STA.w $4314               ;
                    STA.b $02                 ;
                    JSR.w CODE_0D977C         ;
                    LDX.w $0773               ;
                    CPX.b #$06                ;
                    BNE   CODE_0D81F8         ;
                    LDA.l $0FF340             ;
                    STA.b $00                 ;
                    LDA.l $0FF362             ;
                    STA.b $01                 ;
                    LDA.b #$0F                ;
                    STA.w $4314               ;
                    STA.b $02                 ;
                    JSR.w CODE_0D977C         ;
CODE_0D81F8:        PHD                       ;
                    LDA.b #$43                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    REP   #$10                ;
                    LDA.b #$81                ;
                    STA.w $2115               ;
                    LDY.w #$1801              ;
                    STY.b $00                 ;
                    LDA.w $0EF9               ;
                    BEQ   CODE_0D8243         ;
                    LDA.b #$7F                ;
                    STA.b $04                 ;
                    REP   #$20                ;
                    LDY.w #$0040              ;
                    LDX.w #$0000              ;
                    LDA.l $7F0002,x           ;
CODE_0D8220:        STA.w $2116               ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0004              ;
                    STA.b $02                 ;
                    STY.b $05                 ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0042              ;
                    TAX                       ;
                    LDA.w #$0001              ;
                    STA.w $420B               ;
                    LDA.l $7F0002,x           ;
                    BPL   CODE_0D8220         ;
                    SEP   #$20                ;
                    STZ.w $0EF9               ;
CODE_0D8243:        LDA.w $0ED4               ;
                    BEQ   CODE_0D8276         ;
                    LDA.b #$7F                ;
                    STA.b $04                 ;
                    REP   #$20                ;
                    LDY.w #$0038              ;
                    LDX.w #$0000              ;
                    LDA.l $7F2002,x           ;
CODE_0D8258:        STA.w $2116               ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$2004              ;
                    STA.b $02                 ;
                    STY.b $05                 ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$003A              ;
                    TAX                       ;
                    LDA.w #$0001              ;
                    STA.w $420B               ;
                    LDA.l $7F2002,x           ;
                    BPL   CODE_0D8258         ;
CODE_0D8276:        SEP   #$30                ;
                    STZ.w $0ED4               ;
                    LDA.b #$80                ;
                    STA.w $2115               ;
                    JSR.w CODE_0D96DD         ;
                    LDA.w $1200               ;
                    BEQ   CODE_0D82B3         ;
                    BMI   CODE_0D82AE         ;
                    REP   #$10                ;
                    STZ.w $2121               ;
                    LDY.w #$2200              ;
                    STY.b $00                 ;
                    LDY.w #$1000              ;
                    STY.b $02                 ;
                    LDA.b #$00                ;
                    STA.b $04                 ;
                    LDY.w #$0200              ;
                    STY.b $05                 ;
                    LDA.b #$01                ;
                    STA.w $420B               ;
                    SEP   #$10                ;
                    STZ.w $1200               ;
                    BRA   CODE_0D82B3         ;

CODE_0D82AE:        LDA.b #$01                ;
                    STA.w $1200               ;
CODE_0D82B3:        PLD                       ;
                    LDY.b #$00                ;
                    LDX.w $0773               ;
                    CPX.b #$06                ;
                    BNE   CODE_0D82BF         ;
                    INY                       ;
                    INY                       ;
CODE_0D82BF:        REP   #$20                ;
                    LDA.w $8189,y             ;
                    REP   #$10                ;
                    TAX                       ;
                    STZ.w $1700,x             ;
                    LDA.w #$FFFF              ;
                    STA.w $1702,x             ;
                    LDA.w #$0000              ;
                    STA.l $7F0000             ;
                    LDA.b $5C                 ;
                    AND.w #$00FF              ;
                    BEQ   CODE_0D82E5         ;
                    LDA.w #$0000              ;
                    STA.l $7F2000             ;
CODE_0D82E5:        SEP   #$30                ;
                    STZ.w $0773               ;
CODE_0D82EA:        LDA.w $1203               ;
                    STA.w $420C               ;
                    PHD                       ;
                    LDA.b #$21                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    LDA.w $1209               ;
                    STA.b $30                 ;
                    LDA.w $120A               ;
                    STA.b $31                 ;
                    LDA.w $1204               ;
                    STA.b $23                 ;
                    LDA.w $1205               ;
                    STA.b $24                 ;
                    LDA.w $1206               ;
                    STA.b $25                 ;
                    LDA.w $120B               ;
                    STA.b $2C                 ;
                    LDA.w $120C               ;
                    STA.b $2D                 ;
                    LDA.w $1207               ;
                    STA.b $2E                 ;
                    LDA.w $1208               ;
                    STA.b $2F                 ;
                    LDA.w $0EE0               ;
                    STA.b $32                 ;
                    LDA.w $0EE1               ;
                    STA.b $32                 ;
                    LDA.w $0EE2               ;
                    STA.b $32                 ;
                    LDA.w $120D               ;
                    STA.b $05                 ;
                    LDA.w $0E7E               ;
                    STA.b $06                 ;
                    STZ.b $11                 ;
                    STZ.b $11                 ;
                    LDA.w $0ED1               ;
                    BEQ   CODE_0D8350         ;
                    LDA.w $0EEE               ;
                    STA.b $0F                 ;
                    LDA.w $0EEF               ;
                    STA.b $0F                 ;
CODE_0D8350:        LDA.w $0E7F               ;
                    BNE   CODE_0D837F         ;
                    LDA.w $073F               ;
                    STA.b $0D                 ;
                    LDA.w $071A               ;
                    STA.b $0D                 ;
                    LDA.w $0ED1               ;
                    BNE   CODE_0D836E         ;
                    LDA.w $0EFD               ;
                    STA.b $0F                 ;
                    LDA.w $0EFE               ;
                    STA.b $0F                 ;
CODE_0D836E:        LDA.w $0740               ;
                    STA.b $0E                 ;
                    STZ.b $0E                 ;
                    LDA.w $0ED2               ;
                    STA.b $10                 ;
                    LDA.w $0ED3               ;
                    STA.b $10                 ;
CODE_0D837F:        PLD                       ;
                    LDX.b #$81                ;
                    LDA.w $0EDE               ;
                    BEQ   CODE_0D839B         ;
                    LDA.w $4211               ;
                    LDA.w $0EF2               ;
                    STA.w $4209               ;
                    STZ.w $420A               ;
                    STZ.w $4207               ;
                    STZ.w $4208               ;
                    LDX.b #$A1                ;
CODE_0D839B:        STX.w $4200               ;
                    PLB                       ;
                    RTL                       ;

CODE_0D83A0:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    LDA.w $4211               ;
                    BPL   CODE_0D83D6         ;
                    LDA.w $0EDE               ;
                    BEQ   CODE_0D83D6         ;
                    LDA.w $0ED1               ;
                    BEQ   CODE_0D83C5         ;
CODE_0D83B2:        BIT.w $4212               ;
                    BVC   CODE_0D83B2         ;
                    LDA.w $0EFD               ;
                    STA.w $210F               ;
                    LDA.w $0EFE               ;
                    STA.w $210F               ;
                    BRA   CODE_0D83D6         ;

CODE_0D83C5:        BIT.w $4212               ;
                    BVC   CODE_0D83C5         ;
                    LDA.w $0EEE               ;
                    STA.w $2111               ;
                    LDA.w $0EEF               ;
                    STA.w $2111               ;
CODE_0D83D6:        PLB                       ;
                    RTL                       ;

CODE_0D83D8:        LDA.w $0770               ;
                    ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0D83E0,x)     ;

PNTR_0D83E0:        dw CODE_0D84B6
                    dw CODE_0DAB70
                    dw CODE_0D8667
                    dw CODE_0D9FC6

CODE_0D83E8:        JSR.w CODE_0D8421         ;
                    RTL                       ;

CODE_0D83EC:        PHD                       ;
                    LDA.b #$0B                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    LDA.b #$90                ;
                    STA.b $62                 ;
                    LDA.b #$94                ;
                    STA.b $63                 ;
                    LDA.b #$98                ;
                    STA.b $64                 ;
                    LDA.b #$9C                ;
                    STA.b $65                 ;
                    LDA.b #$A0                ;
                    STA.b $66                 ;
                    LDA.b #$A4                ;
                    STA.b $67                 ;
                    LDA.b #$A8                ;
                    STA.b $68                 ;
                    LDA.b #$AC                ;
                    STA.b $69                 ;
                    LDA.b #$58                ;
                    STA.b $6A                 ;
                    PLD                       ;
CODE_0D8418:        LDA.b $96                 ;
                    BNE   CODE_0D845E         ;
CODE_0D841C:        LDA.w $0E67               ;
                    BNE   CODE_0D8495         ;
CODE_0D8421:        LDX.b #$00                ;
                    LDA.b #$F0                ;
CODE_0D8425:        STA.w $0801,x             ;
                    STA.w $0841,x             ;
                    STA.w $0881,x             ;
                    STA.w $08C1,x             ;
                    STA.w $0901,x             ;
                    STA.w $0941,x             ;
                    STA.w $0981,x             ;
                    STA.w $09C1,x             ;
                    STZ.w $0C00,x             ;
                    STZ.w $0C40,x             ;
                    STZ.w $0C80,x             ;
                    STZ.w $0CC0,x             ;
                    STZ.w $0D00,x             ;
                    STZ.w $0D40,x             ;
                    STZ.w $0D80,x             ;
                    STZ.w $0DC0,x             ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$40                ;
                    BNE   CODE_0D8425         ;
                    RTS                       ;

CODE_0D845E:        LDX.b #$00                ;
                    LDA.b #$F0                ;
CODE_0D8462:        STA.w $0841,x             ;
                    STA.w $0881,x             ;
                    STA.w $08C1,x             ;
                    STA.w $0901,x             ;
                    STA.w $0941,x             ;
                    STA.w $0981,x             ;
                    STA.w $09C1,x             ;
                    STZ.w $0C40,x             ;
                    STZ.w $0C80,x             ;
                    STZ.w $0CC0,x             ;
                    STZ.w $0D00,x             ;
                    STZ.w $0D40,x             ;
                    STZ.w $0D80,x             ;
                    STZ.w $0DC0,x             ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$40                ;
                    BNE   CODE_0D8462         ;
                    RTS                       ;

CODE_0D8495:        LDA.b #$F0                ;
                    STA.w $0851               ;
                    STA.w $0855               ;
                    STA.w $08B1               ;
                    STA.w $08B5               ;
                    STA.w $08B9               ;
                    STA.w $08BD               ;
                    STA.w $08C1               ;
                    STA.w $08C5               ;
                    STA.w $08C9               ;
                    STA.w $08CD               ;
                    RTS                       ;

CODE_0D84B6:        LDA.w $0772               ;
                    ASL   A                   ;
                    TAX                       ;
                    JSR.w (PNTR_0D84D5,x)     ;
                    LDA.l $701FF2             ;
                    BEQ   CODE_0D84D1         ;
                    STZ.w $1600               ;
                    STZ.w $1601               ;
                    STZ.w $1602               ;
                    STZ.w $1603               ;
                    RTS                       ;

CODE_0D84D1:        STZ.w $1602               ;
                    RTS                       ;

PNTR_0D84D5:        dw CODE_0D9D11            ;
                    dw CODE_0D89BD            ;
                    dw CODE_0D9E3F            ;
                    dw CODE_0D84DD            ;

CODE_0D84DD:        LDA.w $0FF4               ;
                    AND.b #$10                ;
                    BEQ   CODE_0D8558         ;
                    LDA.w $077A               ;
                    STA.w $0EC2               ;
                    STA.w $0753               ;
                    STZ.w $077A               ;
                    STZ.w $0F08               ;
                    STZ.w $0F09               ;
                    STZ.w $07FB               ;
                    LDA.l $700008             ;
                    STA.w $075F               ;
                    LDA.l $700009             ;
                    STA.w $0760               ;
                    LDA.w $0E24               ;
                    STA.w $075C               ;
                    JSL.l CODE_0FD051         ;
                    LDA.w $075F               ;
                    CMP.b #$09                ;
                    BCC   CODE_0D851B         ;
                    INC.w $07FB               ;
CODE_0D851B:        LDA.b #$00                ;
                    STA.l $7FFB05             ;
                    JMP.w CODE_0D85FE         ;

CODE_0D8524:        LDA.b #$00                ;
                    STA.l $701FE8             ;
                    STA.l $701FE9             ;
                    STA.l $701FEA             ;
                    STA.l $701FEB             ;
                    STA.l $701FEC             ;
                    STA.l $701FED             ;
                    STA.w $07C8               ;
                    STA.w $07C9               ;
                    STA.w $07CA               ;
                    STA.w $07CB               ;
                    STA.w $07CC               ;
                    STA.w $07CD               ;
                    LDA.b #$08                ;
                    STA.w $1600               ;
                    JMP.w CODE_0D85EC         ;

CODE_0D8558:        JSL.l CODE_0FFB49         ;
                    LDA.l $701FF2             ;
                    BNE   CODE_0D8582         ;
                    LDA.w $0FF8               ;
                    CMP.b #$B0                ;
                    BNE   CODE_0D8570         ;
                    LDA.w $0FF4               ;
                    CMP.b #$80                ;
                    BEQ   CODE_0D8524         ;
CODE_0D8570:        LDA.l $7FFB05             ;
                    BMI   CODE_0D857B         ;
                    LDA.b #$40                ;
                    STA.w $07B2               ;
CODE_0D857B:        LDA.w $0FF6               ;
                    AND.b #$2C                ;
                    BNE   CODE_0D858F         ;
CODE_0D8582:        LDX.w $07B2               ;
                    BNE   CODE_0D85CF         ;
                    JSL.l CODE_0FF70F         ;
                    BCC   CODE_0D85D2         ;
                    BCS   CODE_0D85EC         ;
CODE_0D858F:        LDA.w $07B2               ;
                    BEQ   CODE_0D85EC         ;
                    LDA.b #$18                ;
                    STA.w $07B2               ;
                    LDA.w $09               ;
                    AND.b #$FE                ;
                    STA.w $09               ;
                    LDA.l $701FF2             ;
                    BNE   CODE_0D85CF         ;
                    LDA.w $0FF6               ;
                    BIT.b #$20                ;
                    BEQ   CODE_0D85B5         ;
                    LDA.w $077A               ;
                    EOR.b #$01                ;
                    BRA   CODE_0D85C3         ;

CODE_0D85B5:        AND.b #$0C                ;
                    BEQ   CODE_0D85CB         ;
                    EOR.b #$08                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.w $077A               ;
                    BEQ   CODE_0D85CB         ;
CODE_0D85C3:        STA.w $077A               ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
CODE_0D85CB:        JSL.l CODE_0FF317         ;
CODE_0D85CF:        STZ.w $0FF4               ;
CODE_0D85D2:        LDA.w $1603               ;
                    PHA                       ;
                    JSR.w CODE_0DAB80         ;
                    STZ.w $1600               ;
                    STZ.w $1601               ;
                    PLA                       ;
                    STA.w $1603               ;
                    LDA.b $0F                 ;
                    CMP.b #$06                ;
                    BNE   CODE_0D8656         ;
                    STZ.w $0EC8               ;
CODE_0D85EC:        STZ.w $0770               ;
                    STZ.w $0772               ;
                    STZ.w $0722               ;
                    LDA.b #$01                ;
                    STA.w $0E7F               ;
                    INC.w $0774               ;
                    RTS                       ;

CODE_0D85FE:        LDY.w $07B2               ;
                    BEQ   CODE_0D85EC         ;
                    ASL   A                   ;
                    BCC   CODE_0D860B         ;
                    LDA.b #$09                ;
                    JSR.w CODE_0D8663         ;
CODE_0D860B:        LDA.b #$29                ;
                    STA.w $1603               ;
                    LDA.b #$01                ;
                    STA.w $0E67               ;
                    STA.w $0BA5               ;
                    JSR.w CODE_0DF700         ;
                    JSL.l CODE_0EC34C         ;
                    INC.w $075D               ;
                    INC.w $0764               ;
                    INC.w $0757               ;
                    INC.w $0770               ;
                    LDA.w $07FB               ;
                    STA.w $076A               ;
                    STZ.w $0772               ;
                    STZ.w $07B2               ;
                    LDX.b #$0B                ;
CODE_0D8639:        STZ.w $07DA,x             ;
                    DEX                       ;
                    BPL   CODE_0D8639         ;
                    PHX                       ;
                    STZ.b $E4                 ;
                    LDA.w $075E               ;
                    JSR.w CODE_0D8657         ;
                    STA.w $07DF               ;
                    LDA.b $E4                 ;
                    STA.w $07DE               ;
                    LDA.b #$01                ;
                    STA.w $0E1A               ;
                    PLX                       ;
CODE_0D8656:        RTS                       ;

CODE_0D8657:        CMP.b #$0A                ;
                    BCC   CODE_0D8662         ;
                    INC.b $E4                 ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    BRA   CODE_0D8657         ;

CODE_0D8662:        RTS                       ;

CODE_0D8663:        STA.w $075F               ;
                    RTS                       ;

CODE_0D8667:        JSR.w CODE_0D867C         ;
                    LDA.w $0772               ;
                    BEQ   CODE_0D8676         ;
                    LDX.b #$00                ;
                    STX.b $9E                 ;
                    JSR.w CODE_0DC250         ;
CODE_0D8676:        JSR.w CODE_0DFD29         ;
                    JMP.w CODE_0DF700         ;

CODE_0D867C:        LDA.w $0EC4               ;
                    BNE   CODE_0D8695         ;
                    LDA.w $0772               ;
                    JSR.w CODE_0D9693         ;Some sort of executeptr routine

                    dw CODE_0DD3BA
                    dw CODE_0D8773
                    dw CODE_0D878B
                    dw CODE_0D87FA
                    dw CODE_0D8810
                    dw CODE_0D8734
                    dw CODE_0D8857

CODE_0D8695:        LDA.w $0772               ;
                    JSR.w CODE_0D9693         ;Same case as above

                    dw CODE_0DD3BA
                    dw CODE_0D876D
                    dw CODE_0D878B
                    dw CODE_0D86B9
                    dw CODE_0D86CD
                    dw CODE_0D8734
                    dw CODE_0D86F6
                    dw CODE_0D86FD
                    dw CODE_0D870C
                    dw CODE_0D871D
                    dw CODE_0D8722
                    dw CODE_0D8726
                    dw CODE_0D8857
                    dw CODE_0D872A
                    dw CODE_0D872F

CODE_0D86B9:        LDA.w $0754               ;
                    BEQ   CODE_0D86C6         ;
                    JSL.l CODE_00C62D         ;
                    INC.w $0772               ;
                    RTS                       ;

CODE_0D86C6:        INC.w $0772               ;
                    INC.w $0772               ;
                    RTS                       ;

CODE_0D86CD:        STZ.w $0FF4               ;
                    STZ.w $0FF6               ;
                    STZ.w $0FF5               ;
                    STZ.w $0FF7               ;
                    STZ.w $0FF8               ;
                    STZ.w $0FF9               ;
                    STZ.w $0FFA               ;
                    STZ.w $0FFB               ;
                    LDA.b #$02                ;
                    STA.w $078F               ;
                    JSR.w CODE_0DAB99         ;
                    LDA.w $0754               ;
                    BNE   CODE_0D86F5         ;
                    INC.w $0772               ;
CODE_0D86F5:        RTS                       ;

CODE_0D86F6:        INC.w $0772               ;
                    INC.w $0F87               ;
                    RTS                       ;

CODE_0D86FD:        JSL.l CODE_00C45F         ;
                    LDA.w $0F87               ;
                    CMP.b #$06                ;
                    BCC   CODE_0D870B         ;
                    INC.w $0772               ;
CODE_0D870B:        RTS                       ;

CODE_0D870C:        LDA.b #$10                ;
                    STA.w $1602               ;
                    JSL.l CODE_00C060         ;
                    JSL.l CODE_0FD9F9         ;
                    INC.w $0772               ;
                    RTS                       ;

CODE_0D871D:        JSL.l CODE_00C68B         ;
                    RTS                       ;

CODE_0D8722:        INC.w $0772               ;
                    RTS                       ;

CODE_0D8726:        INC.w $0772               ;
                    RTS                       ;

CODE_0D872A:        JSL.l CODE_0E819D         ;
                    RTS                       ;

CODE_0D872F:        JSL.l CODE_0E81E3         ;
                    RTS                       ;

CODE_0D8734:        LDA.w $07B1               ;
                    CMP.b #$06                ;
                    BCS   CODE_0D876C         ;
                    LDA.w $2143               ;
                    AND.b #$7F                ;
                    CMP.b #$4B                ;
                    BEQ   CODE_0D8749         ;
                    LDA.b #$4B                ;
                    STA.w $1603               ;
CODE_0D8749:        JSR.w CODE_0DD6FF         ;
                    LDA.w $07E9               ;
                    ORA.w $07EA               ;
                    ORA.w $07EB               ;
                    BNE   CODE_0D876C         ;
                    LDA.b #$4C                ;
                    STA.w $1603               ;
                    STA.w $0E1A               ;
                    LDA.b #$30                ;
                    STA.w $0788               ;
                    LDA.b #$06                ;
                    STA.w $07B1               ;
                    INC.w $0772               ;
CODE_0D876C:        RTS                       ;

CODE_0D876D:        JSL.l CODE_00C654         ;
                    BRA   CODE_0D877C         ;

CODE_0D8773:        LDA.w $0B76               ;
                    BEQ   CODE_0D8786         ;
                    JSL.l CODE_00D507         ;
CODE_0D877C:        LDX.w $071B               ;
                    INX                       ;
                    STX.w $0203               ;
                    JMP.w CODE_0D8BD0         ;

CODE_0D8786:        JSL.l CODE_00D4CA         ;
                    RTS                       ;

CODE_0D878B:        LDA.b $96                 ;
                    BEQ   CODE_0D8790         ;
                    RTS                       ;

CODE_0D8790:        LDA.w $0F82               ;
                    BEQ   CODE_0D8799         ;
                    JSL.l CODE_00C555         ;
CODE_0D8799:        LDY.b #$00                ;
                    STY.w $0204               ;
                    LDA.b $78                 ;
                    CMP.w $0203               ;
                    BNE   CODE_0D87CD         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0D87B0         ;
                    CMP.b #$0C                ;
                    BNE   CODE_0D87B9         ;
CODE_0D87B0:        INC.w $0204               ;
                    JSL.l CODE_00C3DA         ;
                    BRA   CODE_0D87D1         ;

CODE_0D87B9:        CMP.b #$02                ;
                    BNE   CODE_0D87C6         ;
                    LDA.w $0219               ;
                    CMP.b #$44                ;
                    BCS   CODE_0D87D1         ;
                    BRA   CODE_0D87CD         ;

CODE_0D87C6:        LDA.w $0219               ;
                    CMP.b #$54                ;
                    BCS   CODE_0D87D1         ;
CODE_0D87CD:        INC.w $0204               ;
                    INY                       ;
CODE_0D87D1:        TYA                       ;
                    JSR.w CODE_0DAE12         ;
                    LDA.w $071A               ;
                    CMP.w $0203               ;
                    BEQ   CODE_0D87F4         ;
                    LDA.w $0768               ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0768               ;
                    LDA.b #$01                ;
                    ADC.b #$00                ;
                    TAY                       ;
                    JSR.w CODE_0DACAA         ;
                    JSR.w CODE_0DAC52         ;
                    INC.w $0204               ;
CODE_0D87F4:        LDA.w $0204               ;
                    BEQ   CODE_0D8853         ;
                    RTS                       ;

CODE_0D87FA:        INC.w $0F7F               ;
                    LDA.w $0F7F               ;
                    CMP.b #$70                ;
                    BNE   CODE_0D880F         ;
                    LDA.b #$01                ;
                    STA.w $0F7E               ;
                    STZ.w $0F7F               ;
                    INC.w $0772               ;
CODE_0D880F:        RTS                       ;

CODE_0D8810:        LDA.w $0749               ;
                    BNE   CODE_0D8834         ;
                    LDA.w $0719               ;
                    BEQ   CODE_0D8822         ;
                    CMP.b #$08                ;
                    BCS   CODE_0D8834         ;
                    CMP.b #$01                ;
                    BCC   CODE_0D8834         ;
CODE_0D8822:        TAY                       ;
                    BEQ   CODE_0D882D         ;
                    CPY.b #$03                ;
                    BCS   CODE_0D8847         ;
                    CPY.b #$02                ;
                    BCS   CODE_0D8834         ;
CODE_0D882D:        TYA                       ;
                    CLC                       ;
                    ADC.b #$0C                ;
                    STA.w $0773               ;
CODE_0D8834:        LDA.w $0749               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0749               ;
                    LDA.w $0719               ;
                    ADC.b #$00                ;
                    STA.w $0719               ;
                    CMP.b #$06                ;
CODE_0D8847:        BCC   CODE_0D8856         ;
                    LDA.b #$06                ;
                    LDA.b #$08                ;
                    STA.w $07B1               ;
                    STA.w $0E67               ;
CODE_0D8853:        INC.w $0772               ;
CODE_0D8856:        RTS                       ;

CODE_0D8857:        LDA.w $07B1               ;
                    BNE   CODE_0D8898         ;
CODE_0D885C:        STZ.w $0760               ;
                    STZ.w $075C               ;
                    STZ.w $0772               ;
                    LDA.w $1680               ;
                    CMP.b #$90                ;
                    BEQ   CODE_0D888C         ;
                    LDA.w $075F               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    CMP.b #$0C                ;
                    BCC   CODE_0D8878         ;
                    LDA.b #$0C                ;
CODE_0D8878:        CMP.b #$08                ;
                    BNE   CODE_0D8889         ;
                    LDA.w $0F2B               ;
                    BEQ   CODE_0D8889         ;
                    LDA.b #$01                ;
                    STA.w $07FB               ;
                    INC.w $075F               ;
CODE_0D8889:        INC.w $075F               ;
CODE_0D888C:        JSL.l CODE_0EC34C         ;
                    INC.w $0757               ;
                    LDA.b #$01                ;
                    STA.w $0770               ;
CODE_0D8898:        RTS                       ;

                    LDA.w $0FF4               ;
                    ORA.w $0FF5               ;
                    AND.b #$40                ;
                    BEQ   CODE_0D88B0         ;
                    LDA.b #$01                ;
                    STA.w $07FB               ;
                    LDA.b #$FF                ;
                    STA.w $075A               ;
                    JSR.w CODE_0D9FF4         ;
CODE_0D88B0:        RTS                       ;

                    db $FF,$FF,$F6,$FB,$F7,$FB,$F8,$FB
                    db $F9,$FB,$FA,$FB,$F6,$0E,$F7,$0E
                    db $F8,$0E,$F9,$0E,$FA,$0E,$FD,$FE
                    db $FF,$41,$42,$44,$45,$48,$31,$32
                    db $34,$35,$38,$00

CODE_0D88D5:        LDA.w $0110,x             ;
                    BEQ   CODE_0D8898         ;
                    CMP.b #$0B                ;
                    BCC   CODE_0D88EA         ;
                    LDA.b #$0B                ;
                    STA.w $0110,x             ;
                    CPX.b #$09                ;
                    BEQ   CODE_0D88EA         ;
                    STA.w $0284               ;
CODE_0D88EA:        TAY                       ;
                    LDA.w $0138,x             ;
                    BNE   CODE_0D88F4         ;
                    STA.w $0110,x             ;
                    RTS                       ;

CODE_0D88F4:        DEC.w $0138,x             ;
                    CMP.b #$2B                ;
                    BNE   CODE_0D891B         ;
                    CPY.b #$0B                ;
                    BNE   CODE_0D8908         ;
                    JSL.l CODE_048596         ;Increase lives by one
                    LDA.b #$05                ;
                    STA.w $1603               ;
CODE_0D8908:        LDA.w $88C9,y             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.w $88C9,y             ;
                    AND.b #$0F                ;
                    STA.w $0145,x             ;
                    JSR.w CODE_0DBB27         ;
CODE_0D891B:        LDX.b $9E                 ;
                    LDY.w $0B58               ;
CODE_0D8920:        LDA.w $0801,y             ;
                    CMP.b #$F0                ;
                    BEQ   CODE_0D8936         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$90                ;
                    BNE   CODE_0D8920         ;
                    LDY.w $0B58               ;
CODE_0D8936:        LDA.w $0124,x             ;
                    CMP.b #$18                ;
                    BCC   CODE_0D8942         ;
                    SBC.b #$01                ;
                    STA.w $0124,x             ;
CODE_0D8942:        LDA.w $0124,x             ;
                    JSR.w CODE_0DEB8A         ;
                    STX.b $E0                 ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w $0E50,x             ;
                    STA.b $E2                 ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.b $DE                 ;
                    SEP   #$20                ;
                    LDX.b $E0                 ;
                    STZ.b $DD                 ;
                    LDA.b $E3                 ;
                    BEQ   CODE_0D896A         ;
                    LDA.b $DD                 ;
                    ORA.b #$01                ;
                    STA.b $DD                 ;
CODE_0D896A:        LDA.b $DD                 ;
                    STA.w $0C00,y             ;
                    LDA.w $0110,x             ;
                    CMP.b #$06                ;
                    BCS   CODE_0D897A         ;
CODE_0D8976:        STZ.b $DD                 ;
                    BRA   CODE_0D8982         ;

CODE_0D897A:        CMP.b #$0B                ;
                    BEQ   CODE_0D8976         ;
                    LDA.b #$02                ;
                    STA.b $DD                 ;
CODE_0D8982:        LDA.b $DF                 ;
                    BEQ   CODE_0D898C         ;
                    LDA.b $DD                 ;
                    ORA.b #$01                ;
                    STA.b $DD                 ;
CODE_0D898C:        LDA.b $DD                 ;
                    STA.w $0C04,y             ;
                    LDA.b $E2                 ;
                    STA.w $0800,y             ;
                    LDA.b $DE                 ;
                    STA.w $0804,y             ;
                    LDA.w $0110,x             ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $88B1,x             ;
                    STA.w $0802,y             ;
                    LDA.w $88B2,x             ;
                    STA.w $0806,y             ;
                    TAX                       ;
                    LDA.b #$32                ;
                    STA.w $0803,y             ;
                    CPX.b #$0E                ;
                    BNE   CODE_0D89B7         ;
                    INC   A                   ;
CODE_0D89B7:        STA.w $0807,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0D89BD:        LDA.w $073C               ;
                    ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0D89C5,x)     ;

PNTR_0D89C5:        dw CODE_0D89E5
                    dw CODE_0D89EE
                    dw CODE_0D8A32
                    dw CODE_0D8A56
                    dw CODE_0D8ABF
                    dw CODE_0D8ED6
                    dw CODE_0D8AE0
                    dw CODE_0D9A4C
                    dw CODE_0D8ED6
                    dw CODE_0D8B6F
                    dw CODE_0D8A0D
                    dw CODE_0D8A23
                    dw CODE_0D8A28
                    dw CODE_0D8B9D
                    dw CODE_0D8BB3
                    dw CODE_0D8BCB

CODE_0D89E5:        LDA.w $0770               ;
                    BEQ   CODE_0D8A20         ;
                    LDX.b #$03                ;
                    BRA   CODE_0D8A18         ;

CODE_0D89EE:        LDA.w $0744               ;
                    PHA                       ;
                    LDA.w $0756               ;
                    PHA                       ;
                    STZ.w $0756               ;
                    LDA.b #$02                ;
                    STA.w $0744               ;
                    JSL.l CODE_0E98C3         ;
                    PLA                       ;
                    STA.w $0756               ;
                    PLA                       ;
                    STA.w $0744               ;
                    JMP.w CODE_0D8BC7         ;

CODE_0D8A0D:        LDA.b $5C                 ;
                    JSL.l CODE_0FD8F6         ;
                    JSL.l CODE_0E9147         ;
                    RTS                       ;

CODE_0D8A18:        STZ.w $0773               ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
CODE_0D8A20:        JMP.w CODE_0D8BC7         ;

CODE_0D8A23:        JSL.l CODE_0E98B8         ;
                    RTS                       ;

CODE_0D8A28:        INC.w $073C               ;
                    RTS                       ;

CODE_0D8A2C:        STA.w $0773               ;
                    JMP.w CODE_0D8BC7         ;

CODE_0D8A32:        LDA.b #$00                ;
                    JSR.w CODE_0D8DBF         ;
                    LDA.w $0753               ;
                    BEQ   CODE_0D8A53         ;
                    LDA.b #$15                ;
                    STA.w $1706               ;
                    LDA.b #$1E                ;
                    STA.w $1708               ;
                    LDA.b #$12                ;
                    STA.w $170A               ;
                    STA.w $170E               ;
                    LDA.b #$10                ;
                    STA.w $170C               ;
CODE_0D8A53:        JMP.w CODE_0D8BC7         ;

CODE_0D8A56:        JSR.w CODE_0DBB2D         ;
                    REP   #$30                ;
                    LDX.w $1700               ;
                    LDA.w #$7358              ;
                    STA.w $1702,x             ;
                    LDA.w #$0500              ;
                    STA.w $1704,x             ;
                    SEP   #$20                ;
                    LDA.w $075F               ;
                    INC   A                   ;
                    STA.w $1706,x             ;
                    LDA.b #$20                ;
                    STA.w $1707,x             ;
                    STA.w $1709,x             ;
                    STA.w $170B,x             ;
                    LDA.b #$24                ;
                    STA.w $1708,x             ;
                    LDA.w $075C               ;
                    INC   A                   ;
                    STA.w $170A,x             ;
                    LDA.b #$FF                ;
                    STA.w $170C,x             ;
                    LDA.w $0770               ;
                    BNE   CODE_0D8AB0         ;
                    LDA.l $701FF2             ;
                    BNE   CODE_0D8AB0         ;
                    LDA.l $7FFB05             ;
                    BMI   CODE_0D8AB0         ;
                    LDA.l $7FFB00             ;
                    INC   A                   ;
                    STA.w $1706,x             ;
                    LDA.l $7FFB01             ;
                    INC   A                   ;
                    STA.w $170A,x             ;
CODE_0D8AB0:        REP   #$20                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$000A              ;
                    STA.w $1700               ;
                    SEP   #$30                ;
                    JMP.w CODE_0D8BC7         ;

CODE_0D8ABF:        LDA.w $0759               ;
                    BEQ   CODE_0D8ADA         ;
                    STZ.w $0759               ;
                    LDY.b #$00                ;
                    JSR.w CODE_0D841C         ;
                    JSL.l CODE_0E8D2E         ;
                    LDA.b #$01                ;
                    STA.w $0ED6               ;
                    LDA.b #$02                ;
                    JMP.w CODE_0D8B02         ;

CODE_0D8ADA:        INC.w $073C               ;
                    JMP.w CODE_0D8BC7         ;

CODE_0D8AE0:        LDA.w $0770               ;
                    BEQ   CODE_0D8B2E         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0D8B34         ;
                    LDA.w $0752               ;
                    BNE   CODE_0D8B2E         ;
                    LDY.b $5C                 ;
                    CPY.b #$03                ;
                    BEQ   CODE_0D8AF9         ;
                    LDA.w $0769               ;
                    BNE   CODE_0D8B2E         ;
CODE_0D8AF9:        JSR.w CODE_0DF85F         ;
                    JSL.l CODE_0E8F43         ;
                    LDA.b #$01                ;
CODE_0D8B02:        JSR.w CODE_0D8DBF         ;
                    JSR.w CODE_0D8EE7         ;
                    STZ.w $1204               ;
                    STZ.w $1205               ;
                    STZ.w $1206               ;
                    STZ.w $1209               ;
                    LDA.b #$20                ;
                    STA.w $120A               ;
                    STZ.w $1203               ;
                    LDA.b #$02                ;
                    STA.w $0E7F               ;
                    STZ.w $0E4F               ;
                    STZ.w $1201               ;
                    STZ.w $0E7E               ;
                    STZ.w $0774               ;
                    RTS                       ;

CODE_0D8B2E:        LDA.b #$09                ;
                    STA.w $073C               ;
                    RTS                       ;

CODE_0D8B34:        STZ.w $1204               ;
                    STZ.w $1205               ;
                    STZ.w $1206               ;
                    STZ.w $1209               ;
                    LDA.b #$20                ;
                    STA.w $120A               ;
                    STZ.w $1203               ;
                    LDA.w $0774               ;
                    BEQ   CODE_0D8B5F         ;
                    STZ.w $0E4F               ;
                    STZ.w $0774               ;
                    STZ.w $1201               ;
                    LDA.b #$02                ;
                    STA.w $0E7F               ;
                    JSL.l CODE_0E8D2E         ;
CODE_0D8B5F:        JSR.w CODE_0D99CA         ;
                    LDA.b #$09                ;
                    STA.w $07B0               ;
                    LDA.b #$03                ;
                    JSR.w CODE_0D8DBF         ;
                    JMP.w CODE_0D8BD0         ;

CODE_0D8B6F:        LDA.w $0774               ;
                    BEQ   CODE_0D8B7A         ;
                    CMP.b #$01                ;
                    BEQ   CODE_0D8B87         ;
                    BRA   CODE_0D8B84         ;

CODE_0D8B7A:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STZ.w $0E4F               ;
                    BRA   CODE_0D8B9C         ;

CODE_0D8B84:        INC.w $0774               ;
CODE_0D8B87:        JSR.w CODE_0DA054         ;
                    LDA.w $071F               ;
                    BNE   CODE_0D8B87         ;
                    DEC.w $071E               ;
                    BPL   CODE_0D8B97         ;
                    INC.w $073C               ;
CODE_0D8B97:        LDA.b #$06                ;
                    STA.w $0773               ;
CODE_0D8B9C:        RTS                       ;

CODE_0D8B9D:        LDA.w $0770               ;
                    BNE   CODE_0D8BD0         ;
                    JSL.l CODE_0FE893         ;
                    STZ.w $0EC2               ;
                    LDA.b #$80                ;
                    STA.w $0ED6               ;
                    LDA.b #$05                ;
                    JMP.w CODE_0D8A2C         ;

CODE_0D8BB3:        LDA.w $0770               ;
                    BNE   CODE_0D8BD0         ;
                    LDX.b #$00                ;
CODE_0D8BBA:        STA.w $0300,x             ;
                    STA.w $0400,x             ;
                    DEX                       ;
                    BNE   CODE_0D8BBA         ;
                    JSL.l CODE_0FF317         ;
CODE_0D8BC7:        INC.w $073C               ;
                    RTS                       ;

CODE_0D8BCB:        LDA.b #$FA                ;
                    JSR.w CODE_0DBB30         ;
CODE_0D8BD0:        INC.w $0772               ;
                    RTS                       ;

                    db $58,$43,$00,$09,$16,$20,$0A,$20
                    db $1B,$20,$12,$20,$18,$20,$58,$52
                    db $00,$15,$20,$20,$18,$20,$1B,$20
                    db $15,$20,$0D,$20,$28,$20,$28,$20
                    db $1D,$20,$12,$20,$16,$20,$0E,$20
                    db $58,$68,$00,$09,$00,$20,$28,$20
                    db $28,$20,$27,$24,$25,$20,$FF,$58
                    db $43,$00,$09,$15,$20,$1E,$20,$12
                    db $20,$10,$20,$12,$20,$58,$52,$00
                    db $15,$20,$20,$18,$20,$1B,$20,$15
                    db $20,$0D,$20,$28,$20,$28,$20,$1D
                    db $20,$12,$20,$16,$20,$0E,$20,$58
                    db $68,$00,$09,$00,$20,$28,$20,$28
                    db $20,$27,$24,$25,$20,$FF,$59,$6D
                    db $00,$0F,$28,$20,$28,$20,$28,$20
                    db $25,$20,$28,$20,$28,$20,$28,$20
                    db $28,$20,$59,$E0,$40,$FE,$28,$00
                    db $59,$0B,$00,$11,$20,$20,$18,$20
                    db $1B,$20,$15,$20,$0D,$20,$28,$20
                    db $28,$20,$24,$20,$28,$20,$58,$AC
                    db $40,$0D,$28,$20,$FF,$09,$6D,$00
                    db $09,$E0,$19,$E1,$19,$E2,$19,$E3
                    db $19,$E4,$19,$09,$8D,$00,$09,$F0
                    db $19,$F1,$19,$F2,$19,$F3,$19,$F4
                    db $19,$09,$AC,$00,$0D,$CA,$19,$CB
                    db $19,$CC,$19,$CD,$19,$24,$00,$CE
                    db $19,$CF,$19,$09,$CC,$00,$0D,$DA
                    db $19,$DB,$19,$DC,$19,$DD,$19,$24
                    db $00,$DE,$19,$DF,$19,$FF,$09,$CC
                    db $40,$0C,$24,$00,$09,$AB,$00,$0F
                    db $A1,$02,$A2,$02,$A3,$02,$A4,$02
                    db $A5,$02,$A6,$02,$A7,$02,$A8,$02
                    db $09,$EB,$00,$19,$AE,$02,$AF,$02
                    db $B0,$02,$B1,$02,$AD,$02,$A1,$02
                    db $A2,$02,$A3,$02,$A4,$02,$A5,$02
                    db $A6,$02,$A7,$02,$A8,$02,$0A,$2B
                    db $00,$11,$AE,$02,$AF,$02,$B0,$02
                    db $B1,$02,$AD,$02,$A9,$02,$AA,$02
                    db $AB,$02,$AC,$02,$09,$0B,$00,$13
                    db $C0,$19,$C1,$19,$C2,$19,$C3,$19
                    db $C4,$19,$C5,$19,$C6,$19,$C7,$19
                    db $C8,$19,$C9,$19,$09,$2B,$00,$13
                    db $D0,$19,$D1,$19,$D2,$19,$D3,$19
                    db $D4,$19,$D5,$19,$D6,$19,$D7,$19
                    db $D8,$19,$D9,$19,$FF,$05,$84,$00
                    db $29,$20,$08,$0E,$08,$15,$08,$0C
                    db $08,$18,$08,$16,$08,$0E,$08,$24
                    db $00,$1D,$08,$18,$08,$24,$00,$20
                    db $08,$0A,$08,$1B,$08,$19,$08,$24
                    db $00,$23,$08,$18,$08,$17,$08,$0E
                    db $08,$2B,$08,$05,$E5,$00,$01,$24
                    db $08,$05,$ED,$00,$01,$24,$08,$05
                    db $F5,$00,$01,$24,$08,$FF,$E5,$19
                    db $E6,$19,$E7,$19,$E8,$19,$E9,$19
                    db $F5,$19,$F6,$19,$F7,$19,$F8,$19
                    db $F9,$19,$15,$20,$1E,$20,$12,$20
                    db $10,$20,$12,$20,$02,$03,$04,$01
                    db $06,$07,$08,$05,$0B,$0C,$0D

                    db $00,$37,$6E,$6E,$A5,$C1,$E6,$E6
                    db $65,$65

                    dw $0000,$0000,$0000,$0000
                    dw $0101

CODE_0D8DB7:        LDA.w $077A               ;
                    BEQ   CODE_0D8DD4         ;
                    INY                       ;
                    BRA   CODE_0D8DD4         ;

CODE_0D8DBF:        PHA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    BEQ   CODE_0D8DB7         ;
                    CPY.b #$04                ;
                    BCC   CODE_0D8DD4         ;
                    CPY.b #$08                ;
                    BCC   CODE_0D8DCE         ;
                    LDY.b #$08                ;
CODE_0D8DCE:        LDA.w $077A               ;
                    BNE   CODE_0D8DD4         ;
                    INY                       ;
CODE_0D8DD4:        STY.b $F3                 ;
                    LDX.w $8DA3,y             ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BNE   CODE_0D8DEA         ;
                    CPY.b #$07                ;
                    BNE   CODE_0D8DEA         ;
                    DEY                       ;
                    LDX.w $8DA3,y             ;
                    STY.b $F3                 ;
CODE_0D8DEA:        REP   #$30                ;
                    LDA.w $8DAD,y             ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    STA.b $DE                 ;
                    TXA                       ;
                    AND.w #$00FF              ;
                    ORA.b $DE                 ;
                    TAX                       ;
                    LDY.w #$0000              ;
                    SEP   #$20                ;
CODE_0D8E01:        LDA.w $8BD4,x             ;
                    CMP.b #$FF                ;
                    BEQ   CODE_0D8E0F         ;
                    STA.w $1702,y             ;
                    INX                       ;
                    INY                       ;
                    BRA   CODE_0D8E01         ;

CODE_0D8E0F:        LDA.b #$FF                ;
                    STA.w $1702,y             ;
                    SEP   #$10                ;
                    PLA                       ;
                    TAX                       ;
                    CMP.b #$04                ;
                    BCC   CODE_0D8E1F         ;
                    JMP.w CODE_0D8EB3         ;

CODE_0D8E1F:        DEX                       ;
                    BNE   CODE_0D8E68         ;
                    LDA.w $075A               ;
                    INC   A                   ;
                    CMP.b #$0A                ;
                    BCC   CODE_0D8E56         ;
                    STZ.b $E4                 ;
                    STZ.b $E5                 ;
CODE_0D8E2E:        SEC                       ;
                    SBC.b #$64                ;
                    BCC   CODE_0D8E37         ;
                    INC.b $E4                 ;
                    BRA   CODE_0D8E2E         ;

CODE_0D8E37:        CLC                       ;
                    ADC.b #$64                ;
CODE_0D8E3A:        SEC                       ;
                    SBC.b #$0A                ;
                    BCC   CODE_0D8E43         ;
                    INC.b $E5                 ;
                    BRA   CODE_0D8E3A         ;

CODE_0D8E43:        CLC                       ;
                    ADC.b #$0A                ;
                    STA.b $E6                 ;
                    LDY.b $E4                 ;
                    BEQ   CODE_0D8E4F         ;
                    STY.w $170E               ;
CODE_0D8E4F:        LDA.b $E5                 ;
                    STA.w $1710               ;
                    LDA.b $E6                 ;
CODE_0D8E56:        STA.w $1712               ;
                    LDY.w $075F               ;
                    INY                       ;
                    STY.w $172C               ;
                    LDY.w $075C               ;
                    INY                       ;
                    STY.w $1730               ;
                    RTS                       ;

CODE_0D8E68:        LDA.w $077A               ;
                    BEQ   CODE_0D8EB2         ;
                    LDA.w $0753               ;
                    DEX                       ;
                    BNE   CODE_0D8E89         ;
                    LDY.w $0770               ;
                    CPY.b #$03                ;
                    BEQ   CODE_0D8E89         ;
                    LDA.w $0761               ;
                    BMI   CODE_0D8E86         ;
                    LDA.w $0753               ;
                    EOR.b #$01                ;
                    BRA   CODE_0D8E89         ;

CODE_0D8E86:        LDA.w $0753               ;
CODE_0D8E89:        LSR   A                   ;
                    BCC   CODE_0D8EB2         ;
                    LDY.b #$09                ;
                    LDA.b $F3                 ;
                    CMP.b #$04                ;
                    BEQ   CODE_0D8E98         ;
                    CMP.b #$06                ;
                    BNE   CODE_0D8EA9         ;
CODE_0D8E98:        LDA.w $8D7A,y             ;
                    STA.w $1706,y             ;
                    LDA.w $8D84,y             ;
                    STA.w $1714,y             ;
                    DEY                       ;
                    BPL   CODE_0D8E98         ;
                    BRA   CODE_0D8EB2         ;

CODE_0D8EA9:        LDA.w $8D8E,y             ;
                    STA.w $1706,y             ;
                    DEY                       ;
                    BPL   CODE_0D8EA9         ;
CODE_0D8EB2:        RTS                       ;

CODE_0D8EB3:        PHA                       ;
                    LDY.w $1700               ;
                    PHX                       ;
                    LDX.b #$00                ;
CODE_0D8EBA:        LDA.w $8D39,x             ;
                    STA.w $1702,y             ;
                    INX                       ;
                    INY                       ;
                    CMP.b #$FF                ;
                    BNE   CODE_0D8EBA         ;
                    PLX                       ;
                    PLA                       ;
                    SEC                       ;
                    SBC.b #$80                ;
                    TAX                       ;
                    STY.w $1700               ;
                    LDA.w $8D98,x             ;
                    STA.w $16F9,y             ;
                    RTS                       ;

CODE_0D8ED6:        LDA.w $07B0               ;
                    BNE   CODE_0D8EEF         ;
                    LDA.w $0770               ;
                    CMP.b #$03                ;
                    BEQ   CODE_0D8EE7         ;
                    LDA.b #$01                ;
                    STA.w $0E7F               ;
CODE_0D8EE7:        LDA.b #$07                ;
                    STA.w $07B0               ;
                    INC.w $073C               ;
CODE_0D8EEF:        RTS                       ;

CODE_0D8EF0:        LDA.w $0EC9               ;
                    BNE   CODE_0D8EEF         ;
                    REP   #$30                ;
                    LDY.w $1A00               ;
                    STY.b $00                 ;
                    LDA.w $0720               ;
                    STA.w $1A02,y             ;
                    XBA                       ;
                    STA.w $0ECC               ;
                    LDA.w #$3D80              ;
                    STA.w $1A04,y             ;
                    LDA.w #$0024              ;
                    STA.w $1A06,y             ;
                    STA.w $1A08,y             ;
                    STA.w $1A0A,y             ;
                    STA.w $1A0C,y             ;
                    SEP   #$30                ;
                    LDX.b #$00                ;
                    LDA.w $0EE7               ;
                    BEQ   CODE_0D8F34         ;
                    STA.w $0EE6               ;
                    LDA.w $0720               ;
                    STA.w $0EF5               ;
                    LDA.w $0721               ;
                    INC   A                   ;
                    STA.w $0EF4               ;
CODE_0D8F34:        STX.b $02                 ;
                    LDA.w $06A1,x             ;
                    AND.b #$C0                ;
                    ASL   A                   ;
                    ROL   A                   ;
                    ROL   A                   ;
                    TAY                       ;
                    LDA.w $910B,y             ;
                    STA.b $06                 ;
                    LDA.w $910F,y             ;
                    STA.b $07                 ;
                    REP   #$30                ;
                    TXA                       ;
                    AND.w #$00FF              ;
                    TAX                       ;
                    LDA.w $06A1,x             ;
                    AND.w #$003F              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $03                 ;
                    LDA.w $071F               ;
                    AND.w #$0001              ;
                    EOR.w #$0001              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.b $03                 ;
                    TAY                       ;
                    LDX.b $00                 ;
                    LDA.b ($06),y             ;
                    STA.w $1A0E,x             ;
                    INY                       ;
                    INY                       ;
                    LDA.b ($06),y             ;
                    STA.w $1A10,x             ;
                    INC.b $00                 ;
                    INC.b $00                 ;
                    INC.b $00                 ;
                    INC.b $00                 ;
                    SEP   #$30                ;
                    LDX.b $02                 ;
                    INX                       ;
                    CPX.b #$0D                ;
                    BCS   CODE_0D8F8B         ;
                    JMP.w CODE_0D8F34         ;

CODE_0D8F8B:        REP   #$30                ;
                    LDY.w $1A00               ;
                    LDA.w $1A0E,y             ;
                    CMP.w #$18A2              ;
                    BEQ   CODE_0D8F9D         ;
                    CMP.w #$18A3              ;
                    BNE   CODE_0D8FA9         ;
CODE_0D8F9D:        STA.w $1A06,y             ;
                    STA.w $1A08,y             ;
                    STA.w $1A0A,y             ;
                    STA.w $1A0C,y             ;
CODE_0D8FA9:        LDA.b $00                 ;
                    CLC                       ;
                    ADC.w #$000E              ;
                    TAY                       ;
                    LDA.w #$FFFF              ;
                    STA.w $1A02,y             ;
                    STY.w $1A00               ;
                    LDA.w $0743               ;
                    AND.w #$00FF              ;
                    BNE   CODE_0D9007         ;
                    LDA.b $5C                 ;
                    AND.w #$00FF              ;
                    BEQ   CODE_0D9007         ;
                    CMP.w #$0003              ;
                    BEQ   CODE_0D9007         ;
                    LDA.w $19F8,y             ;
                    CMP.w #$086A              ;
                    BEQ   CODE_0D8FDA         ;
                    CMP.w #$0863              ;
                    BNE   CODE_0D8FDD         ;
CODE_0D8FDA:        INC.w $0ECE               ;
CODE_0D8FDD:        LDA.w $19F8,y             ;
                    CMP.w #$0024              ;
                    BEQ   CODE_0D8FFA         ;
                    CMP.w #$10A4              ;
                    BEQ   CODE_0D8FFA         ;
                    CMP.w #$0A08              ;
                    BNE   CODE_0D9003         ;
                    LDA.w $0ECE               ;
                    AND.w #$FF00              ;
                    STA.w $0ECE               ;
                    BRA   CODE_0D9003         ;

CODE_0D8FFA:        LDA.w $0ECE               ;
                    ORA.w #$0100              ;
                    STA.w $0ECE               ;
CODE_0D9003:        JSL.l CODE_0E87FF         ;
CODE_0D9007:        SEP   #$30                ;
                    INC.w $0721               ;
                    LDA.w $0721               ;
                    AND.b #$1F                ;
                    BNE   CODE_0D901E         ;
                    STZ.w $0721               ;
                    LDA.w $0720               ;
                    EOR.b #$04                ;
                    STA.w $0720               ;
CODE_0D901E:        LDA.b #$06                ;
                    STA.w $0773               ;
                    RTS                       ;

CODE_0D9024:        RTS                       ;

CODE_0D9025:        RTS                       ;

                    db $45,$0C,$45,$0C,$47,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $57,$0C,$58,$0C,$59,$0C,$5A,$0C
                    db $24,$00,$24,$00,$24,$00,$24,$00

CODE_0D9046:        LDY.w $1700               ;
                    INY                       ;
                    LDA.b #$03                ;
                    JSR.w CODE_0D9094         ;
                    LDA.b #$06                ;
                    STA.w $0773               ;
                    JMP.w CODE_0D9085         ;

CODE_0D9057:        JSR.w CODE_0D9063         ;
                    INC.w $03F2               ;
                    DEC.w $03EE,x             ;
                    RTS                       ;

CODE_0D9061:        LDA.b #$00                ;
CODE_0D9063:        LDY.b #$03                ;
                    CMP.b #$00                ;
                    BEQ   CODE_0D907D         ;
                    LDY.b #$00                ;
                    CMP.b #$54                ;
                    BEQ   CODE_0D907D         ;
                    CMP.b #$49                ;
                    BEQ   CODE_0D907D         ;
                    INY                       ;
                    CMP.b #$5A                ;
                    BEQ   CODE_0D907D         ;
                    CMP.b #$4A                ;
                    BEQ   CODE_0D907D         ;
                    INY                       ;
CODE_0D907D:        TYA                       ;
                    LDY.w $1700               ;
                    INY                       ;
                    JSR.w CODE_0D9094         ;
CODE_0D9085:        REP   #$20                ;
                    LDA.w $1700               ;
                    CLC                       ;
                    ADC.w #$0010              ;
                    STA.w $1700               ;
                    SEP   #$20                ;
                    RTS                       ;

CODE_0D9094:        STX.b $00                 ;
                    STY.b $01                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.b #$00                ;
                    LDA.b $06                 ;
                    CMP.b #$D0                ;
                    BCC   CODE_0D90A6         ;
                    LDY.b #$04                ;
CODE_0D90A6:        STY.b $03                 ;
                    AND.b #$0F                ;
                    ASL   A                   ;
                    STA.b $04                 ;
                    STZ.b $05                 ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.b #$20                ;
                    ASL   A                   ;
                    ROL.b $05                 ;
                    ASL   A                   ;
                    ROL.b $05                 ;
                    ADC.b $04                 ;
                    STA.b $04                 ;
                    LDA.b $05                 ;
                    ADC.b $03                 ;
                    STA.b $05                 ;
                    LDY.b $01                 ;
CODE_0D90C6:        REP   #$30                ;
                    TYA                       ;
                    AND.w #$00FF              ;
                    TAY                       ;
                    TXA                       ;
                    AND.w #$00FF              ;
                    TAX                       ;
                    LDA.b $04                 ;
                    XBA                       ;
                    STA.w $1701,y             ;
                    CLC                       ;
                    ADC.w #$2000              ;
                    STA.w $1709,y             ;
                    LDA.w #$0300              ;
                    STA.w $1703,y             ;
                    STA.w $170B,y             ;
                    LDA.w $9026,x             ;
                    STA.w $1705,y             ;
                    LDA.w $9028,x             ;
                    STA.w $1707,y             ;
                    LDA.w $902A,x             ;
                    STA.w $170D,y             ;
                    LDA.w $902C,x             ;
                    STA.w $170F,y             ;
                    LDA.w #$FFFF              ;
                    STA.w $1711,y             ;
                    SEP   #$30                ;
                    LDX.b $00                 ;
                    RTS                       ;

                    db $13,$93,$5B,$9B,$91,$92,$94,$94
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $27,$00,$27,$00,$27,$00,$27,$00
                    db $24,$00,$E3,$09,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$E0,$09
                    db $24,$00,$24,$00,$24,$00,$D2,$08
                    db $D0,$08,$D3,$08,$D1,$08,$D4,$08
                    db $24,$00,$D5,$08,$24,$00,$24,$00
                    db $24,$00,$20,$2A,$24,$00,$20,$2A
                    db $24,$00,$81,$28,$24,$00,$20,$2A
                    db $24,$00,$20,$2A,$24,$00,$80,$28
                    db $24,$00,$7F,$18,$7F,$18,$24,$00
                    db $B8,$08,$BA,$08,$B9,$08,$BB,$08
                    db $B8,$08,$BC,$08,$B9,$08,$BD,$08
                    db $BA,$08,$BC,$08,$BB,$08,$BD,$08
                    db $04,$12,$10,$12,$05,$12,$11,$12
                    db $06,$12,$12,$12,$05,$12,$11,$12
                    db $06,$12,$12,$12,$07,$12,$13,$12
                    db $04,$12,$10,$12,$07,$12,$13,$12
                    db $00,$12,$10,$12,$01,$12,$11,$12
                    db $02,$12,$12,$12,$01,$12,$11,$12
                    db $02,$12,$12,$12,$03,$12,$13,$12
                    db $00,$12,$10,$12,$03,$12,$13,$12
                    db $60,$08,$64,$08,$61,$08,$65,$08
                    db $62,$08,$66,$08,$63,$08,$67,$08
                    db $60,$08,$64,$08,$61,$08,$65,$08
                    db $62,$08,$66,$08,$63,$08,$67,$08
                    db $68,$08,$68,$08,$69,$08,$69,$08
                    db $97,$08,$97,$08,$6A,$08,$6A,$08
                    db $64,$88,$60,$88,$65,$88,$61,$88
                    db $66,$88,$62,$88,$67,$88,$63,$88
                    db $4B,$10,$4C,$10,$4D,$10,$4E,$10
                    db $4D,$10,$4F,$10,$4D,$10,$4A,$10
                    db $4D,$10,$4E,$10,$50,$10,$51,$10
                    db $6B,$18,$70,$18,$2C,$18,$2D,$18
                    db $6C,$18,$71,$18,$6D,$18,$72,$18
                    db $6E,$18,$73,$18,$6F,$18,$74,$18
                    db $6C,$38,$71,$38,$6D,$38,$72,$38
                    db $86,$08,$8A,$08,$87,$08,$8B,$08
                    db $88,$08,$8C,$08,$88,$08,$8C,$08
                    db $89,$08,$8D,$08,$69,$08,$69,$08
                    db $8E,$08,$91,$08,$8F,$08,$92,$08
                    db $98,$08,$93,$08,$98,$08,$93,$08
                    db $90,$08,$94,$08,$69,$08,$69,$08
                    db $4A,$1D,$5A,$1D,$4B,$1D,$5B,$1D
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$2F,$08,$24,$00,$3D,$08
                    db $A2,$18,$A2,$18,$A3,$18,$A3,$18
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $A2,$18,$A2,$18,$A3,$18,$A3,$18
                    db $99,$18,$24,$00,$99,$18,$24,$00
                    db $24,$00,$A2,$18,$3E,$18,$3F,$18
                    db $5B,$18,$5C,$18,$24,$00,$A3,$18
                    db $24,$10,$24,$10,$24,$10,$24,$10
                    db $14,$12,$16,$12,$15,$12,$17,$12
                    db $BE,$0C,$BE,$0C,$BF,$0C,$BF,$0C
                    db $75,$18,$9F,$18,$76,$18,$9F,$58
                    db $9F,$18,$9F,$18,$9F,$58,$9F,$58
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $27,$0C,$27,$0C,$27,$0C,$27,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $08,$0A,$18,$0A,$09,$0A,$19,$0A
                    db $0A,$0A,$1A,$0A,$0B,$0A,$1B,$0A
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $45,$0C,$47,$0C,$45,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $47,$0C,$47,$0C,$47,$0C,$47,$0C
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $AB,$0C,$AC,$0C,$AD,$0C,$AE,$0C
                    db $E6,$09,$F6,$09,$E7,$09,$F7,$09
                    db $E8,$09,$F8,$09,$E9,$09,$F9,$09
                    db $E6,$09,$F6,$09,$E9,$09,$F9,$09
                    db $CA,$09,$DA,$09,$CB,$09,$DB,$09
                    db $EA,$09,$FA,$09,$EB,$09,$FB,$09
                    db $C6,$09,$D6,$09,$C7,$09,$D7,$09
                    db $CA,$29,$DA,$29,$CB,$29,$DB,$29
                    db $21,$32,$24,$00,$21,$32,$24,$00
                    db $26,$0E,$28,$0E,$27,$0E,$29,$0E
                    db $2A,$0E,$2C,$0E,$2B,$0E,$2D,$0E
                    db $2A,$0C,$2A,$0C,$40,$0C,$40,$0C
                    db $24,$00,$24,$00,$24,$00,$24,$00
                    db $24,$00,$47,$0C,$24,$00,$47,$0C
                    db $82,$10,$84,$10,$83,$10,$85,$10
                    db $16,$09,$18,$09,$17,$09,$19,$09
                    db $18,$09,$19,$09,$18,$09,$19,$09
                    db $82,$30,$84,$30,$83,$30,$85,$30
                    db $16,$29,$18,$29,$17,$29,$19,$29
                    db $24,$0C,$47,$0C,$24,$0C,$47,$0C
                    db $86,$08,$8A,$08,$87,$08,$8B,$08
                    db $8E,$08,$91,$08,$8F,$08,$92,$08
                    db $24,$00,$2F,$00,$24,$00,$3D,$00
                    db $EC,$18,$24,$00,$ED,$18,$24,$00
                    db $C8,$10,$A4,$10,$C9,$10,$A4,$10
                    db $E0,$38,$E2,$38,$E1,$38,$E3,$38
                    db $EE,$18,$24,$00,$EF,$18,$24,$00
                    db $A4,$10,$A4,$10,$A4,$10,$A4,$10
                    db $96,$38,$96,$38,$96,$38,$96,$38
                    db $B0,$10,$B1,$10,$B2,$10,$B3,$10
                    db $9B,$0C,$9D,$0C,$9C,$0C,$9E,$0C
                    db $40,$0E,$50,$0E,$41,$0E,$51,$0E
                    db $42,$0E,$52,$0E,$43,$0E,$53,$0E
                    db $44,$0E,$54,$0E,$45,$0E,$55,$0E
                    db $46,$0E,$56,$0E,$47,$0E,$57,$0E
                    db $48,$0E,$58,$0E,$49,$0E,$59,$0E
                    db $4A,$0E,$5A,$0E,$4B,$0E,$5B,$0E
                    db $4B,$4E,$5B,$4E,$4A,$4E,$5A,$4E
                    db $49,$4E,$59,$4E,$48,$4E,$58,$4E
                    db $47,$4E,$57,$4E,$46,$4E,$56,$4E
                    db $45,$4E,$55,$4E,$44,$4E,$54,$4E
                    db $43,$4E,$53,$4E,$42,$4E,$52,$4E
                    db $41,$4E,$51,$4E,$40,$4E,$50,$4E
                    db $63,$0E,$73,$0E,$5C,$0E,$66,$0E
                    db $5D,$0E,$67,$0E,$62,$0E,$72,$0E
                    db $72,$0E,$73,$0E,$5E,$0E,$66,$0E
                    db $5F,$0E,$67,$0E,$73,$0E,$72,$0E
                    db $24,$00,$24,$00,$60,$0E,$70,$0E
                    db $61,$0E,$71,$0E,$62,$0E,$72,$0E
                    db $63,$0E,$73,$0E,$62,$0E,$72,$0E
                    db $63,$0E,$73,$0E,$64,$0E,$74,$0E
                    db $65,$0E,$75,$0E,$24,$00,$24,$00
                    db $24,$00,$24,$00,$4C,$0E,$70,$0E
                    db $4D,$0E,$71,$0E,$73,$0E,$72,$0E
                    db $72,$0E,$73,$0E,$73,$0E,$72,$0E
                    db $72,$0E,$73,$0E,$4E,$0E,$74,$0E
                    db $4F,$0E,$75,$0E,$24,$00,$24,$00
                    db $61,$0E,$66,$0E,$62,$0E,$72,$0E
                    db $63,$0E,$73,$0E,$64,$0E,$67,$0E
                    db $72,$0E,$73,$0E,$67,$4E,$66,$8E
                    db $66,$4E,$67,$8E,$73,$0E,$72,$0E
                    db $40,$0E,$50,$0E,$44,$0E,$54,$0E
                    db $44,$4E,$54,$4E,$40,$4E,$50,$4E
                    db $40,$0E,$50,$0E,$42,$0E,$52,$0E
                    db $43,$0E,$53,$0E,$44,$0E,$54,$0E
                    db $44,$4E,$54,$4E,$43,$4E,$53,$4E
                    db $42,$4E,$52,$4E,$40,$4E,$50,$4E
                    db $24,$00,$24,$00,$CC,$0C,$CE,$0C
                    db $CD,$0C,$CF,$0C,$24,$00,$24,$00
                    db $CC,$0C,$CE,$0C,$CD,$0C,$CF,$0C
                    db $53,$04,$55,$04,$54,$04,$56,$04
                    db $53,$04,$55,$04,$54,$04,$56,$04
                    db $53,$04,$55,$04,$54,$04,$56,$04
                    db $A5,$04,$A7,$04,$A6,$04,$A8,$04
                    db $A5,$04,$A7,$04,$A6,$04,$A8,$04
                    db $EA,$09,$FA,$09,$D2,$09,$E2,$09
                    db $EA,$09,$FA,$09,$F2,$09,$FB,$09
                    db $F3,$09,$DA,$09,$CB,$09,$DB,$09
                    db $CA,$09,$DA,$09,$C3,$09,$E2,$09
                    db $CA,$09,$DA,$09,$F0,$09,$DB,$09
                    db $D2,$09,$E1,$09,$EB,$09,$FB,$09
                    db $F1,$09,$FA,$09,$EB,$09,$FB,$09
                    db $C0,$09,$E1,$09,$CB,$09,$DB,$09
                    db $C8,$09,$D4,$09,$C5,$09,$D5,$09
                    db $E4,$09,$F4,$09,$E5,$09,$F5,$09
                    db $C8,$09,$D4,$09,$C8,$09,$D4,$09
                    db $E4,$09,$F4,$09,$F4,$09,$E4,$09
                    db $CA,$09,$DA,$09,$C3,$09,$D3,$09
                    db $EA,$09,$FA,$09,$D2,$09,$D2,$09
                    db $C0,$09,$D0,$09,$CB,$09,$DB,$09
                    db $D2,$09,$D2,$09,$EB,$09,$FB,$09
                    db $08,$2A,$18,$2A,$09,$2A,$19,$2A
                    db $57,$0C,$59,$0C,$58,$0C,$5A,$0C
                    db $7B,$04,$7D,$04,$7C,$04,$7E,$04

CODE_0D9693:        ASL   A                   ;
                    TAY                       ;
                    PLA                       ;
                    STA.b $04                 ;
                    PLA                       ;
                    STA.b $05                 ;
                    INY                       ;
                    LDA.b ($04),y             ;
                    STA.b $06                 ;
                    INY                       ;
                    LDA.b ($04),y             ;
                    STA.b $07                 ;
                    JMP.w ($0006)             ;

CODE_0D96A8:        LDA.w $4212               ;
                    LSR   A                   ;
                    BCS   CODE_0D96A8         ;
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
                    RTS                       ;

CODE_0D96DD:        STZ.b $00                 ;
                    REP   #$20                ;
                    STZ.w $2102               ;
                    LDA.w #$0004              ;
                    STA.b $01                 ;
                    LDA.w #$0008              ;
                    STA.b $03                 ;
                    LDA.w #$0220              ;
                    STA.b $05                 ;
                    LDX.b #$01                ;
                    STX.w $420B               ;
                    SEP   #$20                ;
                    LDA.b #$80                ;
                    STA.w $2103               ;
                    STZ.w $2102               ;
                    LDA.w $0B76               ;
                    BNE   CODE_0D9714         ;
                    JSR.w CODE_0D9755         ;
                    LDA.w $028C               ;
                    BNE   CODE_0D9751         ;
                    LDA.w $028D               ;
                    BEQ   CODE_0D9751         ;
CODE_0D9714:        REP   #$20                ;
                    LDA.w $028A               ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.b $00                 ;
                    LDA.w $0285               ;
                    STA.b $02                 ;
                    LDY.w $0287               ;
                    STY.b $04                 ;
                    LDA.w $0288               ;
                    STA.b $05                 ;
                    STX.w $420B               ;
                    SEP   #$20                ;
                    LDA.w $0B76               ;
                    BEQ   CODE_0D9751         ;
                    DEC.w $0B76               ;
                    BEQ   CODE_0D9751         ;
                    LDA.w $0286               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0286               ;
                    LDA.w $028B               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $028B               ;
CODE_0D9751:        STZ.w $028C               ;
                    RTS                       ;

CODE_0D9755:        LDA.w $028E               ;
                    BEQ   CODE_0D977B         ;
                    REP   #$20                ;
                    LDA.w $0295               ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.b $00                 ;
                    LDA.w $028F               ;
                    STA.b $02                 ;
                    LDY.w $0291               ;
                    STY.b $04                 ;
                    LDA.w $0293               ;
                    STA.b $05                 ;
                    STX.w $420B               ;
                    SEP   #$20                ;
CODE_0D977B:        RTS                       ;

CODE_0D977C:        REP   #$10                ;
                    STZ.b $06                 ;
                    LDY.w #$0000              ;
                    LDA.b [$00],y             ;
                    BPL   CODE_0D978A         ;
                    SEP   #$30                ;
                    RTS                       ;

CODE_0D978A:        STA.b $04                 ;
                    INY                       ;
                    LDA.b [$00],y             ;
                    STA.b $03                 ;
                    INY                       ;
                    LDA.b [$00],y             ;
                    AND.b #$80                ;
                    ASL   A                   ;
                    ROL   A                   ;
                    STA.b $07                 ;
                    LDA.b [$00],y             ;
                    AND.b #$40                ;
                    STA.b $05                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ORA.b #$01                ;
                    STA.w $4310               ;
                    LDA.b #$18                ;
                    STA.w $4311               ;
                    REP   #$20                ;
                    LDA.b $03                 ;
                    STA.w $2116               ;
                    LDA.b [$00],y             ;
                    XBA                       ;
                    AND.w #$3FFF              ;
                    TAX                       ;
                    INX                       ;
                    STX.w $4315               ;
                    INY                       ;
                    INY                       ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $4312               ;
                    LDA.b $05                 ;
                    BEQ   CODE_0D9800         ;
                    INX                       ;
                    TXA                       ;
                    LSR   A                   ;
                    TAX                       ;
                    STX.w $4315               ;
                    SEP   #$20                ;
                    LDA.b $05                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $4310               ;
                    LDA.b $07                 ;
                    STA.w $2115               ;
                    LDA.b #$02                ;
                    STA.w $420B               ;
                    LDA.b #$19                ;
                    STA.w $4311               ;
                    REP   #$21                ;
                    TYA                       ;
                    ADC.b $00                 ;
                    INC   A                   ;
                    STA.w $4312               ;
                    LDA.b $03                 ;
                    STA.w $2116               ;
                    STX.w $4315               ;
                    LDX.w #$0002              ;
CODE_0D9800:        STX.b $03                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b $03                 ;
                    TAY                       ;
                    SEP   #$20                ;
                    LDA.b $07                 ;
                    ORA.b #$80                ;
                    STA.w $2115               ;
                    LDA.b #$02                ;
                    STA.w $420B               ;
                    LDA.b [$00],y             ;
                    BMI   CODE_0D981C         ;
                    JMP.w CODE_0D978A         ;

CODE_0D981C:        SEP   #$30                ;
                    RTS                       ;

                    db $EF,$00,$06,$00,$62,$00,$06,$00
                    db $62,$00,$06,$00,$6D,$00,$02,$00
                    db $6D,$00,$02,$00,$7A,$00,$03,$00
                    db $06,$0C,$0C,$18,$18,$24

CODE_0D983D:        STA.b $00
                    JSR.w CODE_0D9848         ;
                    LDA.b $00                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_0D9848:        INC   A                   ;
                    AND.b #$0F                ;
                    CMP.b #$06                ;
                    BCS   CODE_0D98A9         ;
                    PHA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b #$58                ;
                    LDX.b #$20                ;
                    CPY.b #$00                ;
                    BNE   CODE_0D985F         ;
                    LDA.b #$02                ;
                    LDX.b #$08                ;
CODE_0D985F:        STX.b $F9                 ;
                    LDX.w $1700               ;
                    STA.w $1702,x             ;
                    LDA.w $981F,y             ;
                    STA.w $1703,x             ;
                    LDA.w $9820,y             ;
                    STA.w $1704,x             ;
                    LDA.w $9821,y             ;
                    STA.b $03                 ;
                    ASL   A                   ;
                    DEC   A                   ;
                    STA.w $1705,x             ;
                    STX.b $02                 ;
                    PLA                       ;
                    TAX                       ;
                    LDA.w $9837,x             ;
                    SEC                       ;
                    SBC.w $9821,y             ;
                    TAY                       ;
                    LDX.b $02                 ;
CODE_0D988B:        LDA.w $07C8,y             ;
                    STA.w $1706,x             ;
                    LDA.b $F9                 ;
                    STA.w $1707,x             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    DEC.b $03                 ;
                    BNE   CODE_0D988B         ;
                    LDA.b #$FF                ;
                    STA.w $1706,x             ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    STX.w $1700               ;
CODE_0D98A9:        RTS                       ;

CODE_0D98AA:        LDA.w $0770               ;
                    CMP.b #$00                ;
                    BEQ   CODE_0D98C7         ;
                    LDX.b #$05                ;
CODE_0D98B3:        LDA.w $0145,x             ;
                    CLC                       ;
                    ADC.w $07C8,y             ;
                    BMI   CODE_0D98D2         ;
                    CMP.b #$0A                ;
                    BCS   CODE_0D98D9         ;
CODE_0D98C0:        STA.w $07C8,y             ;
                    DEY                       ;
                    DEX                       ;
                    BPL   CODE_0D98B3         ;
CODE_0D98C7:        LDA.b #$00                ;
                    LDX.b #$06                ;
CODE_0D98CB:        STA.w $0144,x             ;
                    DEX                       ;
                    BPL   CODE_0D98CB         ;
                    RTS                       ;

CODE_0D98D2:        DEC.w $0144,x             ;
                    LDA.b #$09                ;
                    BNE   CODE_0D98C0         ;
CODE_0D98D9:        CPX.b #$00                ;
                    BNE   CODE_0D98E9         ;
                    LDX.b #$05                ;
                    LDA.b #$09                ;
CODE_0D98E1:        STA.w $07CE,x             ;
                    DEX                       ;
                    BNE   CODE_0D98E1         ;
                    LDA.b #$13                ;
CODE_0D98E9:        SEC                       ;
                    SBC.b #$0A                ;
                    INC.w $0144,x             ;
                    JMP.w CODE_0D98C0         ;

CODE_0D98F2:        PHD                       ;
                    LDA.b #$07                ;
                    XBA                       ;
                    LDA.b #$00                ;
                    TCD                       ;
                    LDX.b #$05                ;
                    LDY.b #$05                ;
                    SEC                       ;
CODE_0D98FE:        LDA.b $CE,x               ;
                    SBC.w $07C8,y             ;
                    DEX                       ;
                    DEY                       ;
                    BPL   CODE_0D98FE         ;
                    BCC   CODE_0D9916         ;
                    INX                       ;
                    INY                       ;
CODE_0D990B:        LDA.b $CE,x               ;
                    STA.w $07C8,y             ;
                    INX                       ;
                    INY                       ;
                    CPY.b #$06                ;
                    BCC   CODE_0D990B         ;
CODE_0D9916:        PLD                       ;
                    RTS                       ;

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

                    LDA.b #$10                ;
                    STA.w $07B1               ;
                    BNE   CODE_0D9975         ;
                    LDA.w $07B1               ;
                    BEQ   CODE_0D9975         ;
                    RTS                       ;

CODE_0D9975:        INC.w $0772               ;
                    RTS                       ;

                    db $42,$73,$0C,$2B,$63,$73,$83

CODE_0D9980:        LDA.w $0FF6               ;
                    AND.b #$0C                ;
                    BEQ   CODE_0D99A5         ;
                    LDY.b #$01                ;
                    STY.w $1603               ;
                    LDY.w $0F06               ;
                    AND.b #$08                ;
                    BEQ   CODE_0D9999         ;
                    DEY                       ;
                    BPL   CODE_0D99A2         ;
                    INY                       ;
                    BRA   CODE_0D999F         ;

CODE_0D9999:        INY                       ;
                    CPY.b #$03                ;
                    BNE   CODE_0D99A2         ;
                    DEY                       ;
CODE_0D999F:        STZ.w $1603               ;
CODE_0D99A2:        STY.w $0F06               ;
CODE_0D99A5:        LDA.w $0F8A               ;
                    BNE   CODE_0D9A11         ;
                    LDA.w $0FF6               ;
                    AND.b #$10                ;
                    BNE   CODE_0D99F8         ;
                    LDA.w $0FF6               ;
                    AND.b #$20                ;
                    BEQ   CODE_0D99CA         ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
                    INC.w $0F06               ;
                    LDA.w $0F06               ;
                    CMP.b #$03                ;
                    BNE   CODE_0D99CA         ;
                    STZ.w $0F06               ;
CODE_0D99CA:        LDA.w $1603               ;
                    BEQ   CODE_0D99D2         ;
                    STZ.w $0B78               ;
CODE_0D99D2:        INC.w $0B78               ;
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ORA.b #$02                ;
                    STA.w $0C00               ;
                    LDY.b #$03                ;
CODE_0D99E5:        LDA.w $9979,y             ;
                    STA.w $0800,y             ;
                    DEY                       ;
                    BPL   CODE_0D99E5         ;
                    LDY.w $0F06               ;
                    LDA.w $997D,y             ;
                    STA.w $0801               ;
                    RTS                       ;

CODE_0D99F8:        LDA.b #$20                ;
                    STA.w $0F8A               ;
                    LDA.b #$43                ;
                    STA.w $1600               ;
                    LDA.b #$F3                ;
                    STA.w $1602               ;
                    LDA.w $0F06               ;
                    BEQ   CODE_0D9A11         ;
                    LDA.b #$3B                ;
                    STA.w $1600               ;
CODE_0D9A11:        JSR.w CODE_0D99D2         ;
                    DEC.w $0F8A               ;
                    LDA.w $0F8A               ;
                    BEQ   CODE_0D9A1D         ;
                    RTS                       ;

CODE_0D9A1D:        STZ.w $0B78               ;
                    LDY.b #$04                ;
                    STY.w $075A               ;
                    STZ.w $075E               ;
                    LDA.b #$00                ;
                    LDY.b #$11                ;
CODE_0D9A2C:        STA.w $07CE,y             ;
                    DEY                       ;
                    BPL   CODE_0D9A2C         ;
                    INC.w $075D               ;
                    LDA.w $0F06               ;
                    BEQ   CODE_0D9A49         ;
                    JSL.l CODE_0090AC         ;
                    LDA.w $0F06               ;
                    CMP.b #$01                ;
                    BEQ   CODE_0D9A49         ;
                    JML.l CODE_0080DE         ;

CODE_0D9A49:        JMP.w CODE_0DA009         ;

CODE_0D9A4C:        LDA.w $0770               ;
                    CMP.b #$03                ;
                    BEQ   CODE_0D9A69         ;
                    LDA.w $0F07               ;
                    BNE   CODE_0D9A60         ;
                    LDA.b #$1D                ;
                    STA.w $0773               ;
                    INC.w $0F07               ;
CODE_0D9A60:        LDA.b #$00                ;
                    STA.w $0774               ;
                    INC.w $073C               ;
                    RTS                       ;

CODE_0D9A69:        LDA.b #$20                ;
                    STA.w $07B0               ;
                    LDA.b #$1E                ;
                    STA.w $0773               ;
                    INC.w $0772               ;
                    RTS                       ;

                    db $20,$20,$1E,$28,$28,$0D,$04,$70
                    db $70,$60,$90,$90,$0A,$09,$E4,$98
                    db $D0,$18,$18,$18,$22,$22,$0D,$04
                    db $42,$42,$3E,$5D,$5D,$0A,$09,$B4
                    db $68,$A0

                    LDX.b #$60                ;
                    LDY.b #$21                ;
                    LDA.w $0753               ;
                    BNE   CODE_0D9AA6         ;
                    LDX.b #$0E                ;
                    LDY.b #$10                ;
CODE_0D9AA6:        STX.w $B38E               ;
                    LDX.b #$10                ;
CODE_0D9AAB:        LDA.w $9A77,y             ;
                    STA.l $0DB1F9,x           ;
                    DEY                       ;
                    DEX                       ;
                    BPL   CODE_0D9AAB         ;
                    RTS                       ;

                    LDA.w $0749               ;
                    BNE   CODE_0D9AD6         ;
                    LDY.w $0719               ;
                    CPY.b #$0A                ;
                    BCS   CODE_0D9AE8         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$05                ;
                    BNE   CODE_0D9ACF         ;
                    LDA.b #$04                ;
                    STA.w $FC               ;
CODE_0D9ACF:        TYA                       ;
                    CLC                       ;
                    ADC.b #$0C                ;
                    STA.w $0773               ;
CODE_0D9AD6:        LDA.w $0749               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0749               ;
                    LDA.w $0719               ;
                    ADC.b #$00                ;
                    STA.w $0719               ;
                    RTS                       ;

CODE_0D9AE8:        LDA.b #$0C                ;
                    STA.w $07B1               ;
CODE_0D9AED:        INC.w $0772               ;
CODE_0D9AF0:        LDA.b #$00                ;
                    STA.w $0F27               ;
                    STA.w $0F28               ;
                    STA.w $0F29               ;
CODE_0D9AFB:        RTS                       ;

                    LDA.w $07B1               ;
                    BNE   CODE_0D9AFB         ;
                    LDA.w $075A               ;
                    BMI   CODE_0D9B20         ;
                    LDA.w $0788               ;
                    BNE   CODE_0D9AFB         ;
                    LDA.b #$30                ;
                    STA.w $0788               ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
                    DEC.w $075A               ;
                    LDA.b #$01                ;
                    STA.w $0146               ;
                    JMP.w CODE_0DD70E         ;

CODE_0D9B20:        LDA.b #$05                ;
                    STA.w $0F2D               ;
                    LDA.b #$00                ;
                    STA.w $0F2C               ;
                    STZ.w $0F2E               ;
                    STZ.w $0F2F               ;
                    BRA   CODE_0D9AED         ;

                    INC.w $0772               ;
                    JSR.w CODE_0D9AF0         ;
                    LDA.b #$60                ;
                    STA.w $0F2A               ;
                    RTS                       ;

                    JSR.w CODE_0D9C2B         ;
                    LDA.w $0F2D               ;
                    BEQ   CODE_0D9B65         ;
                    REP   #$20                ;
                    LDA.w $0F2C               ;
                    XBA                       ;
                    STA.w $1702               ;
                    LDA.w #$7E43              ;
                    STA.w $1704               ;
                    LDA.w #$0024              ;
                    STA.w $1706               ;
                    LDA.w #$FFFF              ;
                    STA.w $1708               ;
                    SEP   #$20                ;
                    BRA   CODE_0D9B8E         ;

CODE_0D9B65:        LDA.w $0EB8               ;
                    BNE   CODE_0D9B84         ;
                    INC.w $0F2E               ;
                    LDA.w $0F2E               ;
                    BNE   CODE_0D9B8E         ;
                    INC.w $0F2F               ;
                    LDA.w $0F2F               ;
                    CMP.b #$02                ;
                    BNE   CODE_0D9B8E         ;
                    STZ.w $07FA               ;
                    LDA.b #$01                ;
                    STA.w $07FB               ;
CODE_0D9B84:        LDA.w $075F               ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0D9B94         ;
                    JMP.w CODE_0D9CC7         ;

CODE_0D9B8E:        STZ.w $0EB8               ;
                    STZ.w $0F2D               ;
CODE_0D9B94:        RTS                       ;

                    db $01,$00,$01,$02,$03,$00,$00,$00
                    db $00,$00,$A7,$AB,$AD,$B1,$9B,$9B
                    db $9B,$9B,$01,$05,$0F,$FF,$20,$FF
                    db $10,$30,$0F,$FF,$40,$FF,$03,$01
                    db $03,$01,$0F,$20,$20,$20,$20,$20
                    db $20,$20,$20,$9F,$D2,$01,$00,$00
                    db $9F,$D2,$00

                    LDA.b #$07                ;
                    STA.b $9B,x               ;
                    LDA.b [$9B],y             ;
                    BEQ   CODE_0D9BD4         ;
                    INC.w $0F09               ;
                    RTS                       ;

CODE_0D9BD4:        LDA.b #$00                ;
                    STA.w $0F09               ;
                    STA.w $0772               ;
                    LDA.w $075F               ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0D9BF6         ;
                    LDA.w $0F2B               ;
                    BEQ   CODE_0D9C01         ;
                    LDA.b #$00                ;
                    STA.w $0F08               ;
                    STA.w $075A               ;
                    INC.w $075F               ;
                    JMP.w CODE_0D885C         ;

CODE_0D9BF6:        LDA.b #$00                ;
                    STA.w $0F08               ;
                    STA.w $0770               ;
                    JMP.w CODE_0D84B6         ;

CODE_0D9C01:        LDA.b #$00                ;
                    STA.w $0F08               ;
                    STA.w $075A               ;
                    STA.w $0F07               ;
                    JMP.w CODE_0D885C         ;

                    db $50,$B0,$E0,$68,$98,$C8,$80,$50
                    db $68,$80,$98,$B0,$C8,$E0,$B8,$90
                    db $70,$68,$70,$90,$B8,$38,$48,$60
                    db $80

                    LDY.b #$B8                ;
                    INY                       ;
CODE_0D9C2B:        LDA.w $0F2A               ;
                    BEQ   CODE_0D9C34         ;
                    DEC.w $0F2A               ;
                    RTS                       ;

CODE_0D9C34:        JSR.w CODE_0D8418         ;
                    LDX.w $0F28               ;
                    CPX.b #$07                ;
                    BEQ   CODE_0D9C50         ;
                    LDA.w $0F27               ;
                    AND.b #$1F                ;
                    BNE   CODE_0D9C66         ;
                    INC.w $0F28               ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
                    JMP.w CODE_0D9C66         ;

CODE_0D9C50:        LDA.w $0F27               ;
                    AND.b #$1F                ;
                    BNE   CODE_0D9C66         ;
                    INC.w $0F29               ;
                    LDA.w $0F29               ;
                    CMP.b #$0B                ;
                    BCC   CODE_0D9C66         ;
                    LDA.b #$04                ;
                    STA.w $0F29               ;
CODE_0D9C66:        INC.w $0F27               ;
                    LDA.w $075F               ;
                    PHA                       ;
                    LDA.w $0F28               ;
                    PHA                       ;
                    TAX                       ;
CODE_0D9C72:        LDA.w $0F29               ;
                    CMP.b #$04                ;
                    BCC   CODE_0D9C84         ;
                    SBC.b #$04                ;
                    TAY                       ;
                    LDA.w $9C0F,y             ;
                    CMP.w $9C15,x             ;
                    BEQ   CODE_0D9CA9         ;
CODE_0D9C84:        LDY.w $9C15,x             ;
                    STY.w $0B46               ;
                    LDA.b #$35                ;
                    STA.w $1C               ;
                    LDA.w $9C1C,x             ;
                    STA.w $0238               ;
                    LDA.w $9C23,x             ;
                    STA.w $03AE               ;
                    LDX.b #$00                ;
                    STX.w $075F               ;
                    STX.w $009E               ;
                    JSR.w CODE_0DEE40         ;
                    DEC.w $0F4A               ;
CODE_0D9CA9:        DEC.w $0F28               ;
                    LDX.w $0F28               ;
                    BNE   CODE_0D9C72         ;
                    INC.w $0F4A               ;
                    PLA                       ;
                    STA.w $0F28               ;
                    PLA                       ;
                    STA.w $075F               ;
                    LDA.b #$30                ;
                    STA.w $0B46               ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    RTS                       ;

CODE_0D9CC7:        JSL.l CODE_0FFB74         ;
                    BCS   CODE_0D9CCE         ;
                    RTS                       ;

CODE_0D9CCE:        LDA.b #$01                ;
                    STA.w $0E1A               ;
                    JMP.w CODE_0D9BD4         ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF

                    db $D0,$00,$18,$30,$48,$60,$78,$90
                    db $A8,$C0,$D8,$D8,$B0,$C0,$40,$44
                    db $48,$50,$54,$60,$68,$70,$78,$80
                    db $88,$00,$08,$10,$18,$18,$FF,$23
                    db $58

CODE_0D9D11:        LDA.b #$80                ;
                    STA.w $1201               ;
                    LDA.b #$FF                ;
                    STA.l $001102             ;
                    LDA.b #$7F                ;
                    STA.l $001103             ;
                    INC.w $1200               ;
                    LDA.b #$FF                ;
                    STA.w $1702               ;
                    STA.w $1703               ;
                    LDA.b #$09                ;
                    STA.w $120D               ;
                    LDA.b #$10                ;
                    STA.w $120B               ;
                    LDA.b #$20                ;
                    STA.w $120A               ;
                    LDA.b #$20                ;
                    STA.w $0EE0               ;
                    LDA.b #$40                ;
                    STA.w $0EE1               ;
                    LDA.b #$80                ;
                    STA.w $0EE2               ;
                    LDY.b #$FE                ;
                    LDX.b #$05                ;
CODE_0D9D4F:        LDA.w $07C8,x             ;
                    CMP.b #$0A                ;
                    BCS   CODE_0D9D62         ;
                    DEX                       ;
                    BPL   CODE_0D9D4F         ;
                    LDA.w $07FF               ;
                    CMP.b #$A5                ;
                    BNE   CODE_0D9D62         ;
                    LDY.b #$C7                ;
CODE_0D9D62:        JSL.l CODE_0FF733         ;
                    LDA.b #$A5                ;
                    STA.w $07FF               ;
                    STA.w $07B7               ;
                    STZ.w $0EF6               ;
                    STZ.w $0EF9               ;
                    STZ.w $0EF7               ;
                    STZ.w $0EF8               ;
                    LDY.b #$6F                ;
                    JSL.l CODE_0FF733         ;
                    LDA.b #$18                ;
                    STA.w $07B2               ;
                    JSL.l CODE_0EC34C         ;
                    JSR.w CODE_0D9D90         ;
                    STZ.w $0E7F               ;
                    RTS                       ;

CODE_0D9D90:        LDY.w $075F               ;
                    CPY.b #$0D                ;
                    BCC   CODE_0D9D9B         ;
                    JSL.l CODE_0EC34C         ;
CODE_0D9D9B:        LDY.b #$4B                ;
                    JSL.l CODE_0FF733         ;
                    LDX.b #$29                ;
                    LDA.b #$00                ;
CODE_0D9DA5:        STA.w $0788,x             ;
                    DEX                       ;
                    BPL   CODE_0D9DA5         ;
                    LDA.w $075B               ;
                    LDY.w $0752               ;
                    BEQ   CODE_0D9DB6         ;
                    LDA.w $0751               ;
CODE_0D9DB6:        STA.w $071A               ;
                    STA.w $0725               ;
                    STA.w $0728               ;
                    PHY                       ;
                    REP   #$20                ;
                    XBA                       ;
                    AND.w #$FF00              ;
                    STA.b $42                 ;
                    LSR   A                   ;
                    STA.w $0EFD               ;
                    LSR   A                   ;
                    STA.w $0EEE               ;
                    SEP   #$20                ;
                    PLY                       ;
                    JSR.w CODE_0DAD3E         ;
                    LDY.b #$00                ;
                    AND.b #$01                ;
                    BEQ   CODE_0D9DDE         ;
                    LDY.b #$04                ;
CODE_0D9DDE:        STY.w $0720               ;
                    STZ.w $0721               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $06A0               ;
                    LDA.b #$FF                ;
                    STA.w $1300               ;
                    STA.w $1301               ;
                    STA.w $1302               ;
                    STA.w $1303               ;
                    STA.w $1304               ;
                    LDA.b #$0B                ;
                    STA.w $071E               ;
                    JSL.l CODE_0EC3BD         ;
                    LDA.w $07FB               ;
                    BNE   CODE_0D9E1A         ;
                    LDA.w $075F               ;
                    CMP.b #$03                ;
                    BCC   CODE_0D9E1D         ;
                    BNE   CODE_0D9E1A         ;
                    LDA.w $075C               ;
                    CMP.b #$03                ;
                    BCC   CODE_0D9E1D         ;
CODE_0D9E1A:        INC.w $06CC               ;
CODE_0D9E1D:        LDA.w $075B               ;
                    BEQ   CODE_0D9E27         ;
                    LDA.b #$02                ;
                    STA.w $0710               ;
CODE_0D9E27:        LDA.b $DB                 ;
                    CMP.b #$07                ;
                    BEQ   CODE_0D9E36         ;
                    CMP.b #$41                ;
                    BEQ   CODE_0D9E36         ;
                    LDA.b #$80                ;
                    STA.w $1602               ;
CODE_0D9E36:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    INC.w $0772               ;
                    RTS                       ;

CODE_0D9E3F:        LDA.w $2142               ;
                    CMP.b #$15                ;
                    BEQ   CODE_0D9E4F         ;
                    JSL.l CODE_0086B5         ;
                    LDA.b #$15                ;
                    STA.w $2142               ;
CODE_0D9E4F:        LDA.b #$01                ;
                    STA.w $0757               ;
                    STA.w $0754               ;
                    STZ.w $0E73               ;
CODE_0D9E5A:        LDA.b #$02                ;
                    STA.w $0E7F               ;
                    LDA.b #$20                ;
                    TSB.w $1601               ;
                    LDA.b #$00                ;
                    STA.w $1201               ;
                    STA.w $0774               ;
                    STA.w $0F04               ;
                    STA.w $0F02               ;
                    TAY                       ;
CODE_0D9E73:        STA.w $0300,y             ;
                    INY                       ;
                    BNE   CODE_0D9E73         ;
                    STA.w $0759               ;
                    STA.w $0769               ;
                    STA.w $0728               ;
                    LDA.b #$FF                ;
                    STA.w $03A0               ;
                    STA.w $1702               ;
                    LDA.w $071A               ;
                    AND.b #$01                ;
                    STA.w $0F05               ;
                    LDA.b #$38                ;
                    STA.w $0B43               ;
                    LDA.b #$48                ;
                    STA.w $0B42               ;
                    LDA.b #$58                ;
                    STA.w $0B41               ;
                    LDX.b #$1C                ;
CODE_0D9EA3:        LDA.w $9CF0,x             ;
                    STA.w $0B45,x             ;
                    DEX                       ;
                    BPL   CODE_0D9EA3         ;
                    JSR.w CODE_0DA04E         ;
                    INC.w $0722               ;
                    INC.w $0772               ;
                    RTS                       ;

                    db $28,$18,$38,$28,$08,$00,$00,$20
                    db $B0,$50,$00,$00,$B0,$B0,$F0,$2E
                    db $0E,$2E,$2E,$2E,$2E,$2E,$2E,$0E
                    db $04,$03,$02

CODE_0D9ED1:        LDA.w $071A               ;
                    STA.b $78                 ;
                    LDA.b #$28                ;
                    STA.w $070A               ;
                    LDA.b #$01                ;
                    STA.w $0202               ;
                    STA.b $BB                 ;
                    LDA.b #$00                ;
                    STA.b $28                 ;
                    DEC.w $0480               ;
                    LDY.b #$00                ;
                    STY.w $075B               ;
                    LDA.b $5C                 ;
                    BNE   CODE_0D9EF3         ;
                    INY                       ;
CODE_0D9EF3:        STY.w $0704               ;
                    LDX.w $0710               ;
                    LDY.w $0752               ;
                    BEQ   CODE_0D9F05         ;
                    CPY.b #$01                ;
                    BEQ   CODE_0D9F05         ;
                    LDX.w $9EB8,y             ;
CODE_0D9F05:        LDA.w $9EB6,y             ;
                    STA.w $0219               ;
                    LDA.w $9EBC,x             ;
                    STA.w $0237               ;
                    LDA.w $9EC5,x             ;
                    STA.w $0256               ;
                    LDX.b #$00                ;
                    JSR.w CODE_0DE9A9         ;
                    JSL.l CODE_0E98C3         ;
                    LDY.w $0715               ;
                    BEQ   CODE_0D9F3F         ;
                    LDA.w $0757               ;
                    BEQ   CODE_0D9F3F         ;
                    LDA.w $9ECD,y             ;
                    STA.w $07E9               ;
                    LDA.b #$01                ;
                    STA.w $07EB               ;
                    LSR   A                   ;
                    STA.w $07EA               ;
                    STA.w $0757               ;
                    STA.w $07AF               ;
CODE_0D9F3F:        LDY.w $0758               ;
                    BEQ   CODE_0D9F58         ;
                    LDA.b #$03                ;
                    STA.b $28                 ;
                    LDX.b #$00                ;
                    JSR.w CODE_0DBCE2         ;
                    LDA.b #$F0                ;
                    STA.b $44                 ;
                    LDX.b #$09                ;
                    LDY.b #$00                ;
                    JSR.w CODE_0DB7C9         ;
CODE_0D9F58:        LDY.b $5C                 ;
                    BNE   CODE_0D9F5F         ;
                    JSR.w CODE_0DB542         ;
CODE_0D9F5F:        LDA.b #$07                ;
                    STA.b $0F                 ;
                    RTS                       ;

                    ROR.b $60                 ;
                    DEY                       ;
                    RTS                       ;

                    db $66,$70,$77,$60,$D6,$00,$77,$80
                    db $70,$B0,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00

CODE_0D9F7E:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STA.w $0E67               ;
                    STZ.w $0722               ;
                    DEC.w $075A               ;
                    BPL   CODE_0D9F97         ;
                    STZ.w $0772               ;
                    LDA.b #$03                ;
                    STA.w $0770               ;
                    RTS                       ;

CODE_0D9F97:        LDA.w $075F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $075C               ;
                    AND.b #$02                ;
                    BEQ   CODE_0D9FA4         ;
                    INX                       ;
CODE_0D9FA4:        LDY.w $9F64,x             ;
                    LDA.w $075C               ;
                    LSR   A                   ;
                    TYA                       ;
                    BCS   CODE_0D9FB2         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_0D9FB2:        AND.b #$0F                ;
                    CMP.w $071A               ;
                    BEQ   CODE_0D9FBD         ;
                    BCC   CODE_0D9FBD         ;
                    LDA.b #$00                ;
CODE_0D9FBD:        STA.w $075B               ;
                    JSR.w CODE_0DA026         ;
                    JMP.w CODE_0DA009         ;

CODE_0D9FC6:        LDA.w $0772               ;
                    ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0D9FCE,x)     ;

PNTR_0D9FCE:        dw CODE_0D9FD4
                    dw CODE_0D89BD
                    dw CODE_0D9FEC

CODE_0D9FD4:        STZ.w $073C               ;
                    STZ.w $0722               ;
                    STZ.w $0F06               ;
                    STZ.w $0B78               ;
                    LDA.b #$0A                ;
                    STA.w $1602               ;
                    INC.w $0774               ;
                    INC.w $0772               ;
                    RTS                       ;

CODE_0D9FEC:        JMP.w CODE_0D9980         ;

                    LDA.w $07B0               ;
                    BNE   CODE_0DA008         ;
CODE_0D9FF4:        JSR.w CODE_0DA026         ;
                    BCC   CODE_0DA009         ;
                    LDA.w $075F               ;
                    STA.w $07FD               ;
                    STZ.w $0772               ;
                    STZ.w $07B0               ;
                    STZ.w $0770               ;
CODE_0DA008:        RTS                       ;

CODE_0DA009:        JSL.l CODE_0EC34C         ;
                    LDA.b #$01                ;
                    STA.w $0754               ;
                    INC.w $0757               ;
                    STZ.w $0747               ;
                    STZ.w $0756               ;
                    STZ.b $0F                 ;
                    STZ.w $0772               ;
                    LDA.b #$01                ;
                    STA.w $0770               ;
                    RTS                       ;

CODE_0DA026:        SEC                       ;
                    LDA.w $077A               ;
                    BEQ   CODE_0DA04D         ;
                    LDA.w $0761               ;
                    BMI   CODE_0DA04D         ;
                    LDA.w $0753               ;
                    EOR.b #$01                ;
                    STA.w $0753               ;
                    LDX.b #$06                ;
CODE_0DA03B:        LDA.w $075A,x             ;
                    PHA                       ;
                    LDA.w $0761,x             ;
                    STA.w $075A,x             ;
                    PLA                       ;
                    STA.w $0761,x             ;
                    DEX                       ;
                    BPL   CODE_0DA03B         ;
                    CLC                       ;
CODE_0DA04D:        RTS                       ;

CODE_0DA04E:        LDA.b #$FF                ;
                    STA.w $06C9               ;
                    RTS                       ;

CODE_0DA054:        LDY.w $071F               ;
                    BNE   CODE_0DA05E         ;
                    LDY.b #$08                ;
                    STY.w $071F               ;
CODE_0DA05E:        DEY                       ;
                    TYA                       ;
                    JSR.w CODE_0DA0BF         ;
                    DEC.w $071F               ;
                    BNE   CODE_0DA09D         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DA074         ;
                    ASL.b $00                 ;
CODE_0DA074:        LDA.w $0ED1               ;
                    BNE   CODE_0DA09D         ;
                    LDA.w $0EFD               ;
                    AND.b $00                 ;
                    BEQ   CODE_0DA087         ;
                    LDA.w $0EFC               ;
                    BEQ   CODE_0DA091         ;
                    BRA   CODE_0DA09D         ;

CODE_0DA087:        LDA.w $0EFC               ;
                    BEQ   CODE_0DA09D         ;
                    STZ.w $0EFC               ;
                    BRA   CODE_0DA096         ;

CODE_0DA091:        LDA.b #$01                ;
                    STA.w $0EFC               ;
CODE_0DA096:        JSL.l CODE_0E9970         ;
                    JSR.w CODE_0D9024         ;
CODE_0DA09D:        LDA.w $0EEE               ;
                    AND.b #$10                ;
                    BEQ   CODE_0DA0AB         ;
                    LDA.w $0EDD               ;
                    BEQ   CODE_0DA0B5         ;
                    BRA   CODE_0DA0BE         ;

CODE_0DA0AB:        LDA.w $0EDD               ;
                    BEQ   CODE_0DA0BE         ;
                    STZ.w $0EDD               ;
                    BRA   CODE_0DA0BA         ;

CODE_0DA0B5:        LDA.b #$01                ;
                    STA.w $0EDD               ;
CODE_0DA0BA:        JSL.l CODE_0E85DD         ;
CODE_0DA0BE:        RTS                       ;

CODE_0DA0BF:        ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0DA0C4,x)     ;

PNTR_0DA0C4:        dw CODE_0DA0D4
                    dw CODE_0D8EF0
                    dw CODE_0D8EF0
                    dw CODE_0DA165
                    dw CODE_0DA0D4
                    dw CODE_0D8EF0
                    dw CODE_0D8EF0
                    dw CODE_0DA165

CODE_0DA0D4:        INC.w $0726               ;
                    LDA.w $0726               ;
                    AND.b #$0F                ;
                    BNE   CODE_0DA0E4         ;
                    STA.w $0726               ;
                    INC.w $0725               ;
CODE_0DA0E4:        INC.w $06A0               ;
                    LDA.w $06A0               ;
                    AND.b #$1F                ;
                    STA.w $06A0               ;
                    RTS                       ;

                    db $00,$30,$60,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$04,$00,$00,$05
                    db $00,$00,$06,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$45,$00
                    db $00,$0B,$0D,$46,$0C,$46,$46,$00
                    db $0D,$1A,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$70,$70,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$82
                    db $85,$71,$4E,$4A,$63,$00,$00,$00
                    db $18,$01,$18,$07,$18,$0F,$18,$FF
                    db $18,$01,$1F,$07,$1F,$0F,$1F,$81
                    db $1F,$01,$00,$8F,$1F,$F1,$1F,$F9
                    db $18,$F1,$18,$FF,$1F


CODE_0DA165:        LDA.w $0728               ;0 S:01FF P:EnvMXdizc HC:3366 VC:000 FC:00 I:00
                    BEQ   CODE_0DA16D         ;0 S:01FF P:EnvMXdizc HC:3382 VC:000 FC:00 I:00
                    JSR.w CODE_0DA316         ;0 S:01FF P:EnvMXdizc HC:3398 VC:000 FC:00 I:00
CODE_0DA16D:        LDX.b #$0C                ;
                    LDA.b #$00                ;
CODE_0DA171:        STA.w $06A1,x             ;
                    DEX                       ;
                    BPL   CODE_0DA171         ;
                    LDY.w $0742               ;
                    BEQ   CODE_0DA1BF         ;
                    LDA.w $0725               ;
CODE_0DA17F:        CMP.b #$03                ;
                    BMI   CODE_0DA188         ;
                    SEC                       ;
                    SBC.b #$03                ;
                    BPL   CODE_0DA17F         ;
CODE_0DA188:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.w $A0EF,y             ;
                    ADC.w $0726               ;
                    TAX                       ;
                    LDA.l $0FF77A,x           ;
                    BEQ   CODE_0DA1BF         ;
                    PHA                       ;
                    AND.b #$0F                ;
                    SEC                       ;
                    SBC.b #$01                ;
                    STA.b $00                 ;
                    ASL   A                   ;
                    ADC.b $00                 ;
                    TAX                       ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.b #$03                ;
                    STA.b $00                 ;
CODE_0DA1AF:        LDA.w $A0F3,x             ;
                    STA.w $06A1,y             ;
                    INX                       ;
                    INY                       ;
                    CPY.b #$0B                ;
                    BEQ   CODE_0DA1BF         ;
                    DEC.b $00                 ;
                    BNE   CODE_0DA1AF         ;
CODE_0DA1BF:        LDX.w $0741               ;
                    BEQ   CODE_0DA1FD         ;
                    LDY.w $A116,x             ;
                    LDX.b #$00                ;
CODE_0DA1C9:        LDA.w $A11A,y             ;
                    BEQ   CODE_0DA1F7         ;
                    PHY                       ;
                    LDY.b $5C                 ;
                    BNE   CODE_0DA1E9         ;
                    LDY.b $DB                 ;
                    CPY.b #$45                ;
                    BEQ   CODE_0DA1F3         ;
                    LDY.w $0EF0               ;
                    BNE   CODE_0DA1E4         ;
                    INC.w $0EF0               ;
                    INC   A                   ;
                    BRA   CODE_0DA1F1         ;

CODE_0DA1E4:        STZ.w $0EF0               ;
                    BRA   CODE_0DA1F3         ;

CODE_0DA1E9:        CPY.b #$03                ;
                    BNE   CODE_0DA1F3         ;
                    CMP.b #$86                ;
                    BNE   CODE_0DA1F3         ;
CODE_0DA1F1:        INC   A                   ;
                    INC   A                   ;
CODE_0DA1F3:        PLY                       ;
                    STA.w $06A1,x             ;
CODE_0DA1F7:        INY                       ;
                    INX                       ;
                    CPX.b #$0D                ;
                    BNE   CODE_0DA1C9         ;
CODE_0DA1FD:        STZ.w $0109               ;
                    STZ.b $F9                 ;
                    LDA.w $0EE8               ;
                    STA.w $0EE9               ;
                    INC.w $0EE8               ;
                    LDY.b $5C                 ;
                    BNE   CODE_0DA219         ;
                    LDA.b $DB                 ;
                    CMP.b #$41                ;
                    BNE   CODE_0DA219         ;
                    LDA.b #$63                ;
                    BRA   CODE_0DA223         ;

CODE_0DA219:        LDA.w $A141,y             ;
                    LDY.w $0743               ;
                    BEQ   CODE_0DA223         ;
                    LDA.b #$86                ;
CODE_0DA223:        STA.b $07                 ;
                    LDX.b #$00                ;
                    LDA.w $0727               ;
                    ASL   A                   ;
                    TAY                       ;
CODE_0DA22C:        LDA.w $A145,y             ;
                    STA.b $00                 ;
                    INY                       ;
                    STY.b $01                 ;
                    LDA.w $0743               ;
                    BEQ   CODE_0DA243         ;
                    CPX.b #$00                ;
                    BEQ   CODE_0DA243         ;
                    LDA.b $00                 ;
                    AND.b #$08                ;
                    STA.b $00                 ;
CODE_0DA243:        LDY.b #$00                ;
CODE_0DA245:        LDA.w $C97F,y             ;
                    BIT.b $00                 ;
                    BEQ   CODE_0DA29C         ;
                    LDA.w $DB               ;
                    CMP.b #$09                ;
                    BEQ   CODE_0DA263         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DA263         ;
                    LDA.b $F9                 ;
                    BEQ   CODE_0DA263         ;
                    LDA.b #$66                ;
                    STA.b $07                 ;
                    BRA   CODE_0DA265         ;

CODE_0DA263:        LDA.b $07                 ;
CODE_0DA265:        STA.w $06A1,x             ;
                    LDA.b $F9                 ;
                    BEQ   CODE_0DA280         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DA280         ;
                    LDA.b $F9                 ;
                    INC.b $F9                 ;
                    INC   A                   ;
                    BNE   CODE_0DA2A3         ;
                    INC.w $06A1,x             ;
                    INC.b $07                 ;
                    BRA   CODE_0DA2A3         ;

CODE_0DA280:        LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DA2A3         ;
                    LDA.w $0743               ;
                    BNE   CODE_0DA2A3         ;
                    LDA.w $0109               ;
                    BNE   CODE_0DA2A3         ;
                    LDA.w $0EE9               ;
                    AND.b #$01                ;
                    BNE   CODE_0DA2A3         ;
                    INC.w $06A1,x             ;
                    BRA   CODE_0DA2A3         ;

CODE_0DA29C:        LDA.b #$FE                ;
                    STA.b $F9                 ;
                    INC.w $0109               ;
CODE_0DA2A3:        INX                       ;
                    CPX.b #$0D                ;
                    BEQ   CODE_0DA2C5         ;
                    LDA.b $5C                 ;
                    CMP.b #$02                ;
                    BNE   CODE_0DA2B6         ;
                    CPX.b #$0B                ;
                    BNE   CODE_0DA2B6         ;
                    LDA.b #$4E                ;
                    STA.b $07                 ;
CODE_0DA2B6:        INC.w $0EE9               ;
                    INY                       ;
                    CPY.b #$08                ;
                    BNE   CODE_0DA245         ;
                    LDY.b $01                 ;
                    BEQ   CODE_0DA2C5         ;
                    JMP.w CODE_0DA22C         ;

CODE_0DA2C5:        LDA.w $06AD               ;
                    CMP.b #$4E                ;
                    BEQ   CODE_0DA2D0         ;
                    CMP.b #$71                ;
                    BNE   CODE_0DA2D3         ;
CODE_0DA2D0:        INC.w $06AD               ;
CODE_0DA2D3:        JSR.w CODE_0DA316         ;
                    LDA.w $06A0               ;
                    JSR.w CODE_0DAA8F         ;
                    LDA.w $06AC               ;
                    CMP.b #$70                ;
                    BNE   CODE_0DA2E6         ;
                    STA.w $06AD               ;
CODE_0DA2E6:        LDX.b #$00                ;
                    TXY                       ;
CODE_0DA2E9:        STY.b $00                 ;
                    LDA.w $0EC9               ;
                    BNE   CODE_0DA311         ;
                    LDA.w $06A1,x             ;
                    AND.b #$C0                ;
                    ASL   A                   ;
                    ROL   A                   ;
                    ROL   A                   ;
                    TAY                       ;
                    LDA.w $06A1,x             ;
                    CMP.w $A312,y             ;
                    BCS   CODE_0DA303         ;
                    LDA.b #$00                ;
CODE_0DA303:        LDY.b $00                 ;
                    STA.b ($06),y             ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    INX                       ;
                    CPX.b #$0D                ;
                    BCC   CODE_0DA2E9         ;
CODE_0DA311:        RTS                       ;

                    db $16,$49,$86,$E7

CODE_0DA316:        REP   #$10                ;
                    LDX.w #$0004              ;
CODE_0DA31B:        STZ.w $010B               ;
                    STX.b $9E                 ;
                    STZ.w $0729               ;
                    LDY.w $072C               ;
                    LDA.b [$FA],y             ;
                    CMP.b #$FD                ;
                    BEQ   CODE_0DA38F         ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DA335         ;
                    INC.w $010B               ;
CODE_0DA335:        LDA.w $1300,x             ;
                    BPL   CODE_0DA38F         ;
                    LDA.w $010B               ;
                    BEQ   CODE_0DA340         ;
                    INY                       ;
CODE_0DA340:        INY                       ;
                    LDA.b [$FA],y             ;
                    ASL   A                   ;
                    BCC   CODE_0DA351         ;
                    LDA.w $072B               ;
                    BNE   CODE_0DA351         ;
                    INC.w $072B               ;
                    INC.w $072A               ;
CODE_0DA351:        LDY.w $072C               ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0D                ;
                    BNE   CODE_0DA37E         ;
                    INY                       ;
                    LDA.b [$FA],y             ;
                    LDY.w $072C               ;
                    AND.b #$40                ;
                    BNE   CODE_0DA387         ;
                    LDA.w $072B               ;
                    BNE   CODE_0DA387         ;
                    LDA.w $010B               ;
                    BEQ   CODE_0DA371         ;
                    INY                       ;
CODE_0DA371:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$1F                ;
                    STA.w $072A               ;
                    INC.w $072B               ;
                    BRA   CODE_0DA399         ;

CODE_0DA37E:        CMP.b #$0E                ;
                    BNE   CODE_0DA387         ;
                    LDA.w $0728               ;
                    BNE   CODE_0DA38F         ;
CODE_0DA387:        LDA.w $072A               ;
                    CMP.w $0725               ;
                    BCC   CODE_0DA396         ;
CODE_0DA38F:        JSR.w CODE_0DA3DD         ;
                    REP   #$10                ;
                    BRA   CODE_0DA39C         ;

CODE_0DA396:        INC.w $0729               ;
CODE_0DA399:        JSR.w CODE_0DA3BF         ;
CODE_0DA39C:        LDX.b $9E                 ;
                    LDA.w $1300,x             ;
                    BMI   CODE_0DA3A6         ;
                    DEC.w $1300,x             ;
CODE_0DA3A6:        DEX                       ;
                    BMI   CODE_0DA3AC         ;
                    JMP.w CODE_0DA31B         ;

CODE_0DA3AC:        LDA.w $0729               ;
                    BEQ   CODE_0DA3B4         ;
                    JMP.w CODE_0DA316         ;

CODE_0DA3B4:        LDA.w $0728               ;
                    BEQ   CODE_0DA3BC         ;
                    JMP.w CODE_0DA316         ;

CODE_0DA3BC:        SEP   #$10                ;
                    RTS                       ;

CODE_0DA3BF:        REP   #$20                ;
                    INC.w $072C               ;
                    INC.w $072C               ;
                    LDA.w $010B               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_0DA3D2         ;
                    INC.w $072C               ;
CODE_0DA3D2:        SEP   #$20                ;
                    LDA.b #$00                ;
                    STA.w $072B               ;
                    STA.w $010B               ;
                    RTS                       ;

CODE_0DA3DD:        REP   #$30                ;
                    TXA                       ;
                    AND.w #$00FF              ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.w $1300,x             ;
                    BMI   CODE_0DA3F5         ;
                    REP   #$20                ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.w $1305,x             ;
                    SEP   #$20                ;
CODE_0DA3F5:        LDA.w $0F82               ;
                    BEQ   CODE_0DA402         ;
                    JSL.l CODE_0E82EE         ;
                    STZ.w $0F82               ;
                    RTS                       ;

CODE_0DA402:        STY.b $F7                 ;
                    STZ.b $F6                 ;
                    STZ.w $010B               ;
                    LDX.w #$0010              ;
                    LDA.b [$FA],y             ;
                    CMP.b #$FD                ;
                    BEQ   CODE_0DA3BC         ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DA41C         ;
                    INC.b $F6                 ;
                    BRA   CODE_0DA426         ;

CODE_0DA41C:        LDX.w #$0008              ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DA426         ;
                    LDX.w #$0000              ;
CODE_0DA426:        STX.b $07                 ;
                    LDX.b $9E                 ;
                    CMP.b #$0E                ;
                    BNE   CODE_0DA434         ;
                    STZ.b $07                 ;
                    LDA.b #$36                ;
                    BNE   CODE_0DA491         ;
CODE_0DA434:        CMP.b #$0D                ;
                    BNE   CODE_0DA457         ;
                    LDA.b #$28                ;
                    STA.b $07                 ;
                    LDA.b $F6                 ;
                    BEQ   CODE_0DA441         ;
                    INY                       ;
CODE_0DA441:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$40                ;
                    BEQ   CODE_0DA4B0         ;
                    LDA.b [$FA],y             ;
                    AND.b #$7F                ;
                    CMP.b #$4B                ;
                    BNE   CODE_0DA453         ;
                    INC.w $0745               ;
CODE_0DA453:        AND.b #$3F                ;
                    BRA   CODE_0DA491         ;

CODE_0DA457:        CMP.b #$0C                ;
                    BCS   CODE_0DA483         ;
                    LDA.b $F6                 ;
                    BEQ   CODE_0DA460         ;
                    INY                       ;
CODE_0DA460:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$70                ;
                    BNE   CODE_0DA471         ;
                    LDA.b #$18                ;
                    STA.b $07                 ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    BRA   CODE_0DA491         ;

CODE_0DA471:        STA.b $00                 ;
                    CMP.b #$70                ;
                    BNE   CODE_0DA47F         ;
                    LDA.b [$FA],y             ;
                    AND.b #$08                ;
                    BEQ   CODE_0DA47F         ;
                    STZ.b $00                 ;
CODE_0DA47F:        LDA.b $00                 ;
                    BRA   CODE_0DA48D         ;

CODE_0DA483:        LDA.b $F6                 ;
                    BEQ   CODE_0DA488         ;
                    INY                       ;
CODE_0DA488:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$70                ;
CODE_0DA48D:        LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_0DA491:        STA.b $00                 ;
                    LDA.w $1300,x             ;
                    BPL   CODE_0DA4F0         ;
                    LDA.w $072A               ;
                    CMP.w $0725               ;
                    BEQ   CODE_0DA4B3         ;
                    LDY.w $072C               ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BNE   CODE_0DA4B0         ;
                    LDA.w $0728               ;
                    BNE   CODE_0DA4D7         ;
CODE_0DA4B0:        SEP   #$10                ;
                    RTS                       ;

CODE_0DA4B3:        LDA.w $0728               ;
                    BEQ   CODE_0DA4C7         ;
                    LDA.b #$00                ;
                    STA.w $0728               ;
                    STA.w $0729               ;
                    STA.b $9E                 ;
                    STA.b $9F                 ;
CODE_0DA4C4:        SEP   #$10                ;
                    RTS                       ;

CODE_0DA4C7:        LDY.w $072C               ;
                    LDA.b [$FA],y             ;
                    AND.b #$F0                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.w $0726               ;
                    BNE   CODE_0DA4B0         ;
CODE_0DA4D7:        PHX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $072C               ;
                    STA.w $1305,x             ;
                    SEP   #$20                ;
                    PLX                       ;
                    LDA.b $F6                 ;
                    BEQ   CODE_0DA4ED         ;
                    INC.w $010B               ;
CODE_0DA4ED:        JSR.w CODE_0DA3BF         ;
CODE_0DA4F0:        LDA.b $F6                 ;
                    BEQ   CODE_0DA4FD         ;
                    LDY.b $F7                 ;
                    JSL.l CODE_0E88C0         ;
                    SEP   #$10                ;
                    RTS                       ;

CODE_0DA4FD:        SEP   #$10                ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.b $07                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $A513,y             ;
                    STA.b $04                 ;
                    LDA.w $A514,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DA76E
                    dw CODE_0DA644
                    dw CODE_0DA8F6
                    dw CODE_0DA904
                    dw CODE_0DA8BD
                    dw CODE_0DA915
                    dw CODE_0DA91C
                    dw CODE_0DA76E
                    dw CODE_0DA9DC
                    dw CODE_0DA6FF
                    dw CODE_0DA843
                    dw CODE_0DA847
                    dw CODE_0DA84B
                    dw CODE_0DA811
                    dw CODE_0DA831
                    dw CODE_0DA835
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA58B
                    dw CODE_0DA9AC
                    dw CODE_0DA9AC
                    dw CODE_0DA9AC
                    dw CODE_0DA9AC
                    dw CODE_0DA9A2
                    dw CODE_0DA9AC
                    dw CODE_0DA9AC
                    dw CODE_0DA9B5
                    dw CODE_0DA9B5
                    dw CODE_0DA9B5
                    dw CODE_0DA9B5
                    dw CODE_0DA9B2
                    dw CODE_0DA9B5
                    dw CODE_0DA704
                    dw CODE_0DA8E1
                    dw CODE_0DA967
                    dw CODE_0DA717
                    dw CODE_0DA877
                    dw CODE_0DA8D2
                    dw CODE_0DA8D7
                    dw CODE_0DA8CB
                    dw CODE_0DA5C4
                    dw CODE_0DA611
                    dw CODE_0DA611
                    dw CODE_0DA62F
                    dw CODE_0DA62F
                    dw CODE_0DA62F
                    dw CODE_0DA4C4
                    dw CODE_0DA581
                    dw CODE_0DA586
                    dw CODE_0DA58C


CODE_0DA581:        JSL.l $0FF2D9
                    RTS          

CODE_0DA586:        JSL.l CODE_0FF2FC         ;
                    RTS                       ;

CODE_0DA58B:        RTS                       ;

CODE_0DA58C:        PHX                       ;
                    REP   #$30                ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.w $1305,x             ;
                    SEP   #$20                ;
                    INY                       ;
                    LDA.b [$FA],y             ;
                    SEP   #$10                ;
                    PLX                       ;
                    PHA                       ;
                    AND.b #$40                ;
                    BNE   CODE_0DA5B4         ;
                    PLA                       ;
                    PHA                       ;
                    AND.b #$0F                ;
                    STA.w $0727               ;
                    PLA                       ;
                    AND.b #$30                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0742               ;
                    RTS                       ;

CODE_0DA5B4:        PLA                       ;
                    AND.b #$07                ;
                    CMP.b #$04                ;
                    BCC   CODE_0DA5C0         ;
                    STA.w $0744               ;
                    LDA.b #$00                ;
CODE_0DA5C0:        STA.w $0741               ;
                    RTS                       ;

CODE_0DA5C4:        LDX.b #$80                ;
                    LDA.w $07FB               ;
                    BNE   CODE_0DA5DE         ;
                    LDA.w $075F               ;
                    BNE   CODE_0DA5E6         ;
                    LDY.b $5C                 ;
                    DEY                       ;
                    BEQ   CODE_0DA5DB         ;
                    LDA.w $074F               ;
                    BEQ   CODE_0DA5DC         ;
                    INX                       ;
CODE_0DA5DB:        INX                       ;
CODE_0DA5DC:        BRA   CODE_0DA605         ;

CODE_0DA5DE:        LDA.b #$87                ;
                    CLC                       ;
                    ADC.w $075C               ;
                    BNE   CODE_0DA606         ;
CODE_0DA5E6:        LDX.b #$83                ;
                    LDA.w $075F               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DA605         ;
                    INX                       ;
                    CMP.b #$04                ;
                    BNE   CODE_0DA602         ;
                    LDA.w $074F               ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DA605         ;
                    LDY.b $5C                 ;
                    DEY                       ;
                    BEQ   CODE_0DA603         ;
                    BRA   CODE_0DA604         ;

CODE_0DA602:        INX                       ;
CODE_0DA603:        INX                       ;
CODE_0DA604:        INX                       ;
CODE_0DA605:        TXA                       ;
CODE_0DA606:        STA.w $06D6               ;
                    JSR.w CODE_0D8EB3         ;
                    LDA.b #$0D                ;
                    JSR.w CODE_0DA61A         ;
CODE_0DA611:        LDA.w $0723               ;
                    EOR.b #$01                ;
                    STA.w $0723               ;
                    RTS                       ;

CODE_0DA61A:        STA.b $00                 ;
                    LDA.b #$00                ;
                    LDX.b #$08                ;
CODE_0DA620:        LDY.b $1C,x               ;
                    CPY.b $00                 ;
                    BNE   CODE_0DA628         ;
                    STA.b $10,x               ;
CODE_0DA628:        DEX                       ;
                    BPL   CODE_0DA620         ;
                    RTS                       ;

                    TRB.b $17                 ;
                    CLC                       ;
CODE_0DA62F:        LDX.b $00                 ;
                    LDA.w $A624,x             ;
                    LDY.b #$09                ;
CODE_0DA636:        DEY                       ;
                    BMI   CODE_0DA640         ;
                    CMP.w $001C,y             ;
                    BNE   CODE_0DA636         ;
                    LDA.b #$00                ;
CODE_0DA640:        STA.w $06CD               ;
                    RTS                       ;

CODE_0DA644:        LDA.w $0733               ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $A656,y             ;
                    STA.b $04                 ;
                    LDA.w $A657,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DA65C
                    dw CODE_0DA6CC
                    dw CODE_0DA92B

CODE_0DA65C:        JSR.w CODE_0DAA5B         ;
                    STX.w $0ECA               ;
                    LDA.w $1300,x             ;
                    BEQ   CODE_0DA6C7         ;
                    BPL   CODE_0DA67A         ;
                    TYA                       ;
                    STA.w $1300,x             ;
                    LDA.w $0725               ;
                    ORA.w $0726               ;
                    BEQ   CODE_0DA67A         ;
                    LDA.b #$1E                ;
                    JMP.w CODE_0DA6F8         ;

CODE_0DA67A:        STA.w $0ECB               ;
                    LDX.b $07                 ;
                    LDA.b #$1F                ;
                    STA.w $06A1,x             ;
                    TXY                       ;
                    INY                       ;
                    LDX.w $0ECA               ;
                    DEC.w $0ECB               ;
                    BEQ   CODE_0DA6A8         ;
                    LDA.w $130F,x             ;
                    BNE   CODE_0DA69F         ;
                    INC.w $130F,x             ;
                    LDA.b #$0E                ;
                    STA.w $06A1,y             ;
                    LDA.b #$12                ;
                    BRA   CODE_0DA6C3         ;

CODE_0DA69F:        LDA.b #$0F                ;
                    STA.w $06A1,y             ;
                    LDA.b #$13                ;
                    BRA   CODE_0DA6C3         ;

CODE_0DA6A8:        LDA.w $130F,x             ;
                    BEQ   CODE_0DA6B9         ;
                    STZ.w $130F,x             ;
                    LDA.b #$10                ;
                    STA.w $06A1,y             ;
                    LDA.b #$14                ;
                    BRA   CODE_0DA6C3         ;

CODE_0DA6B9:        STZ.w $130F,x             ;
                    LDA.b #$11                ;
                    STA.w $06A1,y             ;
                    LDA.b #$15                ;
CODE_0DA6C3:        TYX                       ;
                    JMP.w CODE_0DA6F2         ;

CODE_0DA6C7:        LDA.b #$20                ;
                    JMP.w CODE_0DA6F8         ;

CODE_0DA6CC:        JSR.w CODE_0DAA4C         ;
                    STY.b $06                 ;
                    BCC   CODE_0DA6DE         ;
                    LDA.w $1300,x             ;
                    LSR   A                   ;
                    STA.w $1314,x             ;
                    LDA.b #$21                ;
                    BRA   CODE_0DA6F8         ;

CODE_0DA6DE:        LDA.b #$23                ;
                    LDY.w $1300,x             ;
                    BEQ   CODE_0DA6F8         ;
                    LDA.w $1314,x             ;
                    STA.b $06                 ;
                    LDX.b $07                 ;
                    LDA.b #$22                ;
                    STA.w $06A1,x             ;
                    RTS                       ;

CODE_0DA6F2:        INX                       ;
                    LDY.b #$0F                ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA6F8:        LDX.b $07                 ;
                    LDY.b #$00                ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA6FF:        JSL.l CODE_0E88A6         ;
                    RTS                       ;

CODE_0DA704:        JSR.w CODE_0DAA5B         ;
                    LDY.w $1300,x             ;
                    LDX.b $07                 ;
                    LDA.b #$76                ;
                    STA.w $06A1,x             ;
                    LDA.b #$77                ;
                    STA.w $06A2,x             ;
                    RTS                       ;

CODE_0DA717:        LDY.b #$03                ;
                    JSR.w CODE_0DAA4F         ;
                    LDY.b #$0A                ;
                    DEY                       ;
                    DEY                       ;
                    STY.b $05                 ;
                    LDY.w $1300,x             ;
                    STY.b $06                 ;
                    LDX.b $05                 ;
                    INX                       ;
                    LDA.w $A75A,y             ;
                    CMP.b #$00                ;
                    BEQ   CODE_0DA739         ;
                    LDX.b #$00                ;
                    LDY.b $05                 ;
                    JSR.w CODE_0DAA15         ;
                    CLC                       ;
CODE_0DA739:        LDY.b $06                 ;
                    LDA.w $A75E,y             ;
                    STA.w $06A1,x             ;
                    LDA.w $A762,y             ;
                    STA.w $06A2,x             ;
                    BCS   CODE_0DA759         ;
                    LDX.b #$06                ;
CODE_0DA74B:        LDA.b #$00                ;
                    STA.w $06A1,x             ;
                    DEX                       ;
                    BPL   CODE_0DA74B         ;
                    LDA.w $A766,y             ;
                    STA.w $06A8               ;
CODE_0DA759:        RTS                       ;

                    db $1B,$1A,$00,$00,$1B,$27,$26,$25
                    db $1B,$2A,$29,$28,$17,$16,$1B,$1A
                    db $19,$18,$1B,$1A

CODE_0DA76E:        JSR.w CODE_0DA7BC         ;
                    LDA.b $00                 ;
                    BEQ   CODE_0DA779         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
CODE_0DA779:        TYA                       ;
                    PHA                       ;
                    LDY.w $1300,x             ;
                    BEQ   CODE_0DA7A8         ;
                    JSR.w CODE_0DA7FE         ;
                    BCS   CODE_0DA7A8         ;
                    JSR.w CODE_0DAA79         ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $021A,x             ;
CODE_0DA78E:        LDA.w $0725               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    JSR.w CODE_0DAA81         ;
                    STA.w $0238,x             ;
                    LDA.b #$0D                ;
                    STA.b $1C,x               ;
                    JSR.w CODE_0DCA79         ;
CODE_0DA7A8:        PLA                       ;
                    TAY                       ;
                    LDX.b $07                 ;
                    LDA.w $A766,y             ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    LDA.w $A768,y             ;
                    LDY.b $06                 ;
                    DEY                       ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA7BC:        LDY.b #$01                ;
                    JSR.w CODE_0DAA4F         ;
                    JSR.w CODE_0DAA5B         ;
                    TYA                       ;
                    AND.b #$07                ;
                    STA.b $06                 ;
                    LDY.w $1300,x             ;
                    RTS                       ;

CODE_0DA7CD:        STA.w $1C,x             ;
                    JSR.w CODE_0DAA79         ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $021A,x             ;
                    LDA.w $0725               ;
                    ADC.b #$00                ;
                    STA.w $79,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.w $10,x             ;
                    JSR.w CODE_0DAA81         ;
                    STA.w $0238,x             ;
                    JMP.w CODE_0DCA79         ;

CODE_0DA7F1:        LDX.b #$00                ;
CODE_0DA7F3:        CLC                       ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DA7FD         ;
                    INX                       ;
                    CPX.b #$08                ;
                    BNE   CODE_0DA7F3         ;
CODE_0DA7FD:        RTS                       ;

CODE_0DA7FE:        LDX.b #$08                ;
CODE_0DA800:        CLC                       ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DA80A         ;
                    DEX                       ;
                    CPX.b #$FF                ;
                    BNE   CODE_0DA800         ;
CODE_0DA80A:        RTS                       ;

                    BRA   CODE_0DA78E         ;

                    STA.b ($82,x)             ;
                    STY.b $85                 ;
CODE_0DA811:        JSR.w CODE_0DAA4C         ;
                    LDX.b #$0A                ;
                    LDA.b $5C                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DA81D         ;
                    INX                       ;
CODE_0DA81D:        LDY.b $5C                 ;
                    LDA.w $A80B,y             ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    TYA                       ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $A80F,y             ;
                    LDY.b #$01                ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA831:        LDA.b #$03                ;
                    BRA   CODE_0DA837         ;

CODE_0DA835:        LDA.b #$07                ;
CODE_0DA837:        PHA                       ;
                    JSR.w CODE_0DAA4C         ;
                    PLA                       ;
                    TAX                       ;
                    LDA.b #$E7                ;
                    STA.w $06A1,x             ;
                    RTS                       ;

CODE_0DA843:        LDA.b #$06                ;
                    BRA   CODE_0DA84D         ;

CODE_0DA847:        LDA.b #$07                ;
                    BRA   CODE_0DA84D         ;

CODE_0DA84B:        LDA.b #$09                ;
CODE_0DA84D:        PHA                       ;
                    JSR.w CODE_0DAA4C         ;
                    LDA.w $1300,x             ;
                    BEQ   CODE_0DA866         ;
                    LDA.w $130F,x             ;
                    BNE   CODE_0DA862         ;
                    INC.w $130F,x             ;
                    LDA.b #$08                ;
                    BRA   CODE_0DA86B         ;

CODE_0DA862:        LDA.b #$07                ;
                    BRA   CODE_0DA86B         ;

CODE_0DA866:        STZ.w $130F,x             ;
                    LDA.b #$09                ;
CODE_0DA86B:        PLX                       ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    LDY.b #$00                ;
                    LDA.b #$6A                ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA877:        LDA.b #$2D                ;
                    STA.w $06A1               ;
                    LDX.b #$01                ;
                    LDY.b #$08                ;
                    LDA.b #$2E                ;
                    JSR.w CODE_0DAA15         ;
                    LDA.b #$62                ;
                    STA.w $06AB               ;
                    JSR.w CODE_0DAA79         ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $021F               ;
                    LDA.w $0725               ;
                    ADC.b #$00                ;
                    STA.b $7E                 ;
                    LDA.b #$30                ;
                    STA.w $023D               ;
                    LDA.b #$B0                ;
                    STA.w $010D               ;
                    LDA.b #$30                ;
                    STA.b $21                 ;
                    INC.b $15                 ;
                    LDA.b #$FF                ;
                    STA.w $0FB4               ;
                    STA.w $0FB5               ;
                    STA.w $0FB6               ;
                    STA.w $0FB7               ;
                    RTS                       ;

                    db $EB,$EA,$EA,$EA

CODE_0DA8BD:        LDY.b $5C                 ;
                    LDA.w $A8B9,y             ;
                    JMP.w CODE_0DA909         ;

                    db $06,$07,$08,$FE,$0A,$87

CODE_0DA8CB:        LDY.b #$0C                ;
                    JSR.w CODE_0DAA4F         ;
                    BRA   CODE_0DA8D7         ;

CODE_0DA8D2:        LDA.b #$08                ;
                    STA.w $0773               ;
CODE_0DA8D7:        LDY.b $00                 ;
                    LDX.w $A8C3,y             ;
                    LDA.w $A8C6,y             ;
                    BRA   CODE_0DA8E8         ;

CODE_0DA8E1:        JSR.w CODE_0DAA5B         ;
                    LDX.b $07                 ;
                    LDA.b #$FD                ;
CODE_0DA8E8:        LDY.b #$00                ;
                    JMP.w CODE_0DAA15         ;

                    db $70,$62,$62,$68,$2B,$49,$4A,$4A
                    db $86

CODE_0DA8F6:        LDY.b $5C
                    LDA.w $0743
                    BEQ   CODE_0DA8FF         ;
                    LDY.b #$04                ;
CODE_0DA8FF:        LDA.w $A8F1,y             ;
                    BRA   CODE_0DA909         ;

CODE_0DA904:        LDY.b $5C                 ;
                    LDA.w $A8ED,y             ;
CODE_0DA909:        PHA                       ;
                    JSR.w CODE_0DAA4C         ;
                    LDX.b $07                 ;
                    LDY.b #$00                ;
                    PLA                       ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA915:        LDY.b $5C                 ;
                    LDA.w $A8F1,y             ;
                    BRA   CODE_0DA921         ;

CODE_0DA91C:        LDY.b $5C                 ;
                    LDA.w $A8ED,y             ;
CODE_0DA921:        PHA                       ;
                    JSR.w CODE_0DAA5B         ;
                    PLA                       ;
                    LDX.b $07                 ;
                    JMP.w CODE_0DAA15         ;

CODE_0DA92B:        JSR.w CODE_0DAA5B         ;
                    LDX.b $07                 ;
                    LDA.b #$6B                ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    DEY                       ;
                    BMI   CODE_0DA947         ;
                    LDA.b #$6C                ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    DEY                       ;
                    BMI   CODE_0DA947         ;
                    LDA.b #$6D                ;
                    JSR.w CODE_0DAA15         ;
CODE_0DA947:        LDX.w $026A               ;
                    JSR.w CODE_0DAA81         ;
                    STA.w $0277,x             ;
                    LDA.w $0725               ;
                    STA.w $026B,x             ;
                    JSR.w CODE_0DAA79         ;
                    STA.w $0271,x             ;
                    INX                       ;
                    CPX.b #$06                ;
                    BCC   CODE_0DA963         ;
                    LDX.b #$00                ;
CODE_0DA963:        STX.w $026A               ;
                    RTS                       ;

CODE_0DA967:        JSR.w CODE_0DAA5B         ;
                    LDX.b #$00                ;
CODE_0DA96C:        CLC                       ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DA976         ;
                    INX                       ;
                    CPX.b #$07                ;
                    BNE   CODE_0DA96C         ;
CODE_0DA976:        JSR.w CODE_0DAA79         ;
                    STA.w $021A,x             ;
                    LDA.w $0725               ;
                    STA.b $79,x               ;
                    JSR.w CODE_0DAA81         ;
                    STA.w $0238,x             ;
                    STA.b $5E,x               ;
                    LDA.b #$32                ;
                    STA.b $1C,x               ;
                    LDY.b #$01                ;
                    STY.b $BC,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    LDX.b $07                 ;
                    LDA.b #$6E                ;
                    STA.w $06A1,x             ;
                    LDA.b #$6F                ;
                    STA.w $06A2,x             ;
                    RTS                       ;

CODE_0DA9A2:        LDA.w $075D               ;
                    BEQ   CODE_0DA9DB         ;
                    STZ.w $075D               ;
                    BRA   CODE_0DA9B5         ;

CODE_0DA9AC:        JSR.w CODE_0DA9D5         ;
                    JMP.w CODE_0DA9C7         ;

CODE_0DA9B2:        STZ.w $06BC               ;
CODE_0DA9B5:        JSR.w CODE_0DA9D5         ;
                    STY.b $07                 ;
                    LDA.b #$00                ;
                    LDY.b $5C                 ;
                    DEY                       ;
                    BEQ   CODE_0DA9C3         ;
                    LDA.b #$06                ;
CODE_0DA9C3:        CLC                       ;
                    ADC.b $07                 ;
                    TAY                       ;
CODE_0DA9C7:        LDA.w $BD6E,y             ;
                    PHA                       ;
                    JSR.w CODE_0DAA5B         ;
                    LDX.b $07                 ;
                    PLA                       ;
                    STA.w $06A1,x             ;
                    RTS                       ;

CODE_0DA9D5:        LDA.b $00                 ;
                    SEC                       ;
                    SBC.b #$00                ;
                    TAY                       ;
CODE_0DA9DB:        RTS                       ;

CODE_0DA9DC:        JSR.w CODE_0DAA4C         ;
                    BCC   CODE_0DAA0D         ;
                    LDA.b $5C                 ;
                    BNE   CODE_0DAA0D         ;
                    LDX.w $026A               ;
                    JSR.w CODE_0DAA79         ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $0271,x             ;
                    LDA.w $0725               ;
                    SBC.b #$00                ;
                    STA.w $026B,x             ;
                    INY                       ;
                    INY                       ;
                    TYA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $0277,x             ;
                    INX                       ;
                    CPX.b #$05                ;
                    BCC   CODE_0DAA0A         ;
                    LDX.b #$00                ;
CODE_0DAA0A:        STX.w $026A               ;
CODE_0DAA0D:        LDX.b $5C                 ;
                    LDA.b #$00                ;
                    LDX.b #$08                ;
                    LDY.b #$0F                ;
CODE_0DAA15:        STY.w $0735               ;
                    LDY.w $06A1,x             ;
                    BEQ   CODE_0DAA3D         ;
                    CPY.b #$1F                ;
                    BEQ   CODE_0DAA40         ;
                    CPY.b #$22                ;
                    BEQ   CODE_0DAA40         ;
                    CPY.b #$E7                ;
                    BEQ   CODE_0DAA3D         ;
                    CPY.b #$0F                ;
                    BEQ   CODE_0DAA40         ;
                    CPY.b #$13                ;
                    BEQ   CODE_0DAA40         ;
                    CPY.b #$E7                ;
                    BCS   CODE_0DAA40         ;
                    CPY.b #$4E                ;
                    BNE   CODE_0DAA3D         ;
                    CMP.b #$48                ;
                    BEQ   CODE_0DAA40         ;
CODE_0DAA3D:        STA.w $06A1,x             ;
CODE_0DAA40:        INX                       ;
                    CPX.b #$0D                ;
                    BCS   CODE_0DAA4B         ;
                    LDY.w $0735               ;
                    DEY                       ;
                    BPL   CODE_0DAA15         ;
CODE_0DAA4B:        RTS                       ;

CODE_0DAA4C:        JSR.w CODE_0DAA5B         ;
CODE_0DAA4F:        LDA.w $1300,x             ;
                    CLC                       ;
                    BPL   CODE_0DAA5A         ;
                    TYA                       ;
                    STA.w $1300,x             ;
                    SEC                       ;
CODE_0DAA5A:        RTS                       ;

CODE_0DAA5B:        PHX                       ;
                    REP   #$30                ;
                    TXA                       ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.w $1305,x             ;
                    SEP   #$20                ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    STA.b $07                 ;
                    INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    SEP   #$10                ;
                    TAY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_0DAA79:        LDA.w $0726               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    RTS                       ;

CODE_0DAA81:        LDA.b $07                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$20                ;
                    RTS                       ;

                    db $00,$D0,$05,$05

CODE_0DAA8F:        PHA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $AA8D,y             ;
                    STA.b $07                 ;
                    PLA                       ;
                    AND.b #$0F                ;
                    CLC                       ;
                    ADC.w $AA8B,y             ;
                    STA.b $06                 ;
                    RTS                       ;

CODE_0DAAA4:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_0DAA4C         ;
                    PLB                       ;
                    RTL                       ;

CODE_0DAAAC:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_0DAA15         ;
                    PLB                       ;
                    RTL                       ;

CODE_0DAAB4:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_0DAA4F         ;
                    PLB                       ;
                    RTL                       ;

CODE_0DAABC:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_0DAA79         ;
                    PLB                       ;
                    RTL                       ;

CODE_0DAAC4:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_0DA7F1         ;
                    PLB                       ;
                    RTL                       ;

CODE_0DAACC:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHA                       ;
                    JSR.w CODE_0DA7BC         ;
                    PLA                       ;
                    STA.w $07               ;
                    TYA                       ;
                    PHA                       ;
                    LDY.w $1300,x             ;
                    BEQ   CODE_0DAB05         ;
                    JSR.w CODE_0DA7F1         ;
                    BCS   CODE_0DAB05         ;
                    LDA.b #$04                ;
                    JSR.w CODE_0DA7CD         ;
                    LDA.w $06               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $0238,x             ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    STA.w $0238,x             ;
                    STA.w $043D,x             ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.w $041D,x             ;
                    INC.w $00A1,x             ;
CODE_0DAB05:        PLA                       ;
                    TAY                       ;
                    PHA                       ;
                    LDX.w $0007               ;
                    LDA.w $A768,y             ;
                    LDY.w $0006               ;
                    DEY                       ;
                    JSR.w CODE_0DAA15         ;
                    PLA                       ;
                    TAY                       ;
                    LDA.w $A766,y             ;
                    STA.w $06A1,x             ;
                    PLB                       ;
                    RTL                       ;

CODE_0DAB1F:        LDA.b $29,x               ;
                    BNE   CODE_0DAB63         ;
                    LDA.w $0792,x             ;
                    BNE   CODE_0DAB63         ;
                    LDA.w $A1,x             ;
                    BNE   CODE_0DAB39         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $5E,x               ;
                    INC.w $00A1,x             ;
CODE_0DAB39:        LDA.w $041D,x             ;
                    LDY.b $5E,x               ;
                    BPL   CODE_0DAB43         ;
                    LDA.w $043D,x             ;
CODE_0DAB43:        STA.w $00               ;
                    LDA.w $0747               ;
                    BNE   CODE_0DAB63         ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b $5E,x               ;
                    STA.w $0238,x             ;
                    CMP.w $0000               ;
                    BNE   CODE_0DAB63         ;
                    LDA.b #$00                ;
                    STA.w $A1,x             ;
                    LDA.b #$20                ;
                    STA.w $0792,x             ;
CODE_0DAB63:        RTS                       ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF

CODE_0DAB70:        LDA.w $0772               ;
                    ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0DAB78,x)     ;

PNTR_0DAB78:        dw CODE_0D9D90
                    dw CODE_0D89BD
                    dw CODE_0D9E5A
                    dw CODE_0DAB99

CODE_0DAB80:        LDA.l $701FF2             ;
                    BNE   CODE_0DAB9D         ;
                    LDA.l $7FFB05             ;
                    BMI   CODE_0DAB9D         ;
                    JSR.w CODE_0DAD50         ;
                    JSR.w CODE_0DFDB2         ;
                    JSR.w CODE_0DFD29         ;
                    JSR.w CODE_0DF700         ;
                    RTS                       ;

CODE_0DAB99:        JSL.l CODE_0FD000         ;
CODE_0DAB9D:        LDA.b $28                 ;
                    BNE   CODE_0DABA1         ;
CODE_0DABA1:        JSR.w CODE_0DAD50         ;
                    LDA.w $0772               ;
                    CMP.b #$03                ;
                    BCS   CODE_0DABAC         ;
                    RTS                       ;

CODE_0DABAC:        JSR.w CODE_0DB42F         ;
                    LDX.b #$00                ;
CODE_0DABB1:        STX.b $9E                 ;
                    LDA.w $0E67               ;
                    BEQ   CODE_0DABBC         ;
                    CMP.b #$7F                ;
                    BEQ   CODE_0DABDA         ;
CODE_0DABBC:        JSR.w CODE_0DC250         ;
                    LDA.w $0E67               ;
                    BNE   CODE_0DABC7         ;
                    JSR.w CODE_0D88D5         ;
CODE_0DABC7:        INX                       ;
                    CPX.b #$0A                ;
                    BNE   CODE_0DABB1         ;
                    JSL.l CODE_0FE0FB         ;
                    LDA.w $0E67               ;
                    BEQ   CODE_0DABDA         ;
                    LDA.b #$7F                ;
                    STA.w $0E67               ;
CODE_0DABDA:        JSR.w CODE_0DFDB2         ;
                    JSR.w CODE_0DFD29         ;
                    JSR.w CODE_0DF700         ;
                    LDX.b #$01                ;
                    STX.b $9E                 ;
                    JSR.w CODE_0DBE0F         ;
                    DEX                       ;
                    STX.b $9E                 ;
                    JSR.w CODE_0DBE0F         ;
                    JSR.w CODE_0DBE77         ;
                    JSR.w CODE_0DBA8C         ;
                    JSR.w CODE_0DB875         ;
                    JSR.w CODE_0DB5FA         ;
                    JSR.w CODE_0DB6A1         ;
                    JSR.w CODE_0DB58D         ;
                    JSR.w CODE_0D9025         ;
                    LDA.w $0F04               ;
                    BEQ   CODE_0DAC0E         ;
                    JSL.l CODE_0FF257         ;
CODE_0DAC0E:        LDA.b $BB                 ;
                    CMP.b #$02                ;
                    BPL   CODE_0DAC26         ;
                    LDA.w $07AF               ;
                    BEQ   CODE_0DAC38         ;
                    CMP.b #$04                ;
                    BNE   CODE_0DAC26         ;
                    LDA.w $0787               ;
                    BNE   CODE_0DAC26         ;
                    JSL.l CODE_0FD8F6         ;
CODE_0DAC26:        LDA.b $09                 ;
                    PHY                       ;
                    LDY.w $07AF               ;
                    CPY.b #$08                ;
                    BCS   CODE_0DAC32         ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_0DAC32:        PLY                       ;
                    JSR.w CODE_0DB018         ;
                    BRA   CODE_0DAC4C         ;

CODE_0DAC38:        LDA.w $0787               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DAC49         ;
                    LDA.b $0F                 ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DAC49         ;
                    JSL.l CODE_0E98C3         ;
CODE_0DAC49:        JSR.w CODE_0DB050         ;
CODE_0DAC4C:        LDA.b $0A                 ;
                    STA.b $0D                 ;
                    STZ.b $0C                 ;
CODE_0DAC52:        LDA.w $0773               ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DAC75         ;
                    LDA.w $071F               ;
                    BNE   CODE_0DAC72         ;
                    LDA.w $073D               ;
                    CMP.b #$20                ;
                    BMI   CODE_0DAC75         ;
                    LDA.w $073D               ;
                    SBC.b #$20                ;
                    STA.w $073D               ;
                    LDA.b #$00                ;
                    STA.w $1A00               ;
CODE_0DAC72:        JSR.w CODE_0DA054         ;
CODE_0DAC75:        RTS                       ;

CODE_0DAC76:        LDA.w $06FF               ;
                    CLC                       ;
                    ADC.w $03A1               ;
                    STA.w $06FF               ;
                    LDA.w $0723               ;
                    BEQ   CODE_0DAC88         ;
                    JMP.w CODE_0DAD02         ;

CODE_0DAC88:        LDA.w $0755               ;
                    CMP.b #$50                ;
                    BCC   CODE_0DAD02         ;
                    LDA.w $078D               ;
                    BNE   CODE_0DAD02         ;
                    LDY.w $06FF               ;
                    DEY                       ;
                    BMI   CODE_0DAD02         ;
                    INY                       ;
                    CPY.b #$02                ;
                    BCC   CODE_0DACA0         ;
                    DEY                       ;
CODE_0DACA0:        LDA.w $0755               ;
                    CMP.b #$70                ;
                    BCC   CODE_0DACAA         ;
                    LDY.w $06FF               ;
CODE_0DACAA:        LDA.w $0F01               ;
                    BNE   CODE_0DACAA         ;
                    TYA                       ;
                    STA.w $0775               ;
                    CLC                       ;
                    ADC.w $073D               ;
                    STA.w $073D               ;
                    LDA.w $071C               ;
                    STA.b $00                 ;
                    LDA.w $071A               ;
                    STA.b $01                 ;
                    REP   #$30                ;
                    TYA                       ;
                    AND.w #$00FF              ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $00                 ;
                    LSR   A                   ;
                    STA.w $0EFD               ;
                    LSR   A                   ;
                    STA.w $0EEE               ;
                    SEP   #$30                ;
                    LDA.b $00                 ;
                    STA.w $071C               ;
                    STA.w $073F               ;
                    STA.b $42                 ;
                    LDA.b $01                 ;
                    STA.w $071A               ;
                    STA.b $43                 ;
                    AND.b #$01                ;
                    STA.b $00                 ;
                    LDA.w $0778               ;
                    AND.b #$FE                ;
                    ORA.b $00                 ;
                    STA.w $0778               ;
                    JSR.w CODE_0DAD3E         ;
                    LDA.b #$08                ;
                    STA.w $07A1               ;
                    BRA   CODE_0DAD07         ;

CODE_0DAD02:        LDA.b #$00                ;
                    STA.w $0775               ;
CODE_0DAD07:        LDX.b #$00                ;
                    JSR.w CODE_0DFE34         ;
                    STA.b $00                 ;
                    LDY.b #$00                ;
                    ASL   A                   ;
                    BCS   CODE_0DAD1A         ;
                    INY                       ;
                    LDA.b $00                 ;
                    AND.b #$20                ;
                    BEQ   CODE_0DAD34         ;
CODE_0DAD1A:        LDA.w $071C,y             ;
                    SEC                       ;
                    SBC.w $AD3A,y             ;
                    STA.w $0219               ;
                    LDA.w $071A,y             ;
                    SBC.b #$00                ;
                    STA.b $78                 ;
                    LDA.b $0C                 ;
                    CMP.w $AD3C,y             ;
                    BEQ   CODE_0DAD34         ;
                    STZ.b $5D                 ;
CODE_0DAD34:        LDA.b #$00                ;
                    STA.w $03A1               ;
                    RTS                       ;

                    db $00,$10,$01,$02

CODE_0DAD3E:        LDA.w $071C               ;
                    CLC                       ;
                    ADC.b #$FF                ;
                    STA.w $071D               ;
                    LDA.w $071A               ;
                    ADC.b #$00                ;
                    STA.w $071B               ;
                    RTS                       ;

CODE_0DAD50:        LDA.b $0F                 ;
                    ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0DAD57,x)     ;

PNTR_0DAD57:        dw CODE_0D9ED1
                    dw CODE_0DAF29
                    dw CODE_0DAF7A
                    dw CODE_0DAF4B
                    dw CODE_0DB05B
                    dw CODE_0DB07D
                    dw CODE_0D9F7E
                    dw CODE_0DAD71
                    dw CODE_0DAE1C
                    dw CODE_0DAFC2
                    dw CODE_0DAFD4
                    dw CODE_0DAFF8
                    dw CODE_0DB00E

CODE_0DAD71:        LDA.w $0752               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DADB1         ;
                    LDA.b #$00                ;
                    LDY.w $0237               ;
                    CPY.b #$30                ;
                    BCS   CODE_0DAD84         ;
                    JMP.w CODE_0DAE12         ;

CODE_0DAD84:        LDA.w $0710               ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DAD8F         ;
                    CMP.b #$07                ;
                    BNE   CODE_0DADFB         ;
CODE_0DAD8F:        LDA.w $0256               ;
                    AND.b #$F0                ;
                    BEQ   CODE_0DAD9B         ;
                    LDA.b #$01                ;
                    JMP.w CODE_0DAE12         ;

CODE_0DAD9B:        JSR.w CODE_0DAFAD         ;
                    DEC.w $06DE               ;
                    BNE   CODE_0DAE11         ;
                    LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STA.w $0E4F               ;
                    INC.w $0769               ;
                    JMP.w CODE_0DB0B0         ;

CODE_0DADB1:        LDA.w $0758               ;
                    BNE   CODE_0DADD2         ;
                    LDA.w $0237               ;
                    CMP.b #$B0                ;
                    BNE   CODE_0DADC2         ;
                    LDA.b #$04                ;
                    STA.w $1600               ;
CODE_0DADC2:        STA.w $0E4E               ;
                    LDA.b #$FF                ;
                    JSR.w CODE_0DAF72         ;
                    LDA.w $0237               ;
                    CMP.b #$91                ;
                    BCC   CODE_0DADFB         ;
                    RTS                       ;

CODE_0DADD2:        LDA.w $0399               ;
                    CMP.b #$60                ;
                    BNE   CODE_0DAE11         ;
                    LDA.w $0237               ;
                    CMP.b #$99                ;
                    LDY.b #$00                ;
                    LDA.b #$01                ;
                    BCC   CODE_0DADEE         ;
                    LDA.b #$03                ;
                    STA.b $28                 ;
                    INY                       ;
                    LDA.b #$08                ;
                    STA.w $05B4               ;
CODE_0DADEE:        STY.w $0716               ;
                    JSR.w CODE_0DAE12         ;
                    LDA.w $0219               ;
                    CMP.b #$48                ;
                    BCC   CODE_0DAE11         ;
CODE_0DADFB:        STZ.w $0E4E               ;
                    LDA.b #$08                ;
                    STA.b $0F                 ;
                    LDA.b #$01                ;
                    STA.w $0202               ;
                    LSR   A                   ;
                    STA.w $0752               ;
                    STA.w $0716               ;
                    STA.w $0758               ;
CODE_0DAE11:        RTS                       ;

CODE_0DAE12:        STA.w $0FF4               ;
                    LDA.b #$01                ;
                    STA.w $0B7A               ;
                    BRA   CODE_0DAE1F         ;

CODE_0DAE1C:        STZ.w $0B7A               ;
CODE_0DAE1F:        LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DAE5F         ;
                    LDA.b $5C                 ;
                    BNE   CODE_0DAE38         ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_0DAE35         ;
                    LDA.w $0237               ;
                    CMP.b #$D0                ;
                    BCC   CODE_0DAE38         ;
CODE_0DAE35:        STZ.w $0FF4               ;
CODE_0DAE38:        LDA.w $0FF4               ;
                    AND.b #$C0                ;
                    STA.b $0A                 ;
                    LDA.w $0FF4               ;
                    AND.b #$03                ;
                    STA.b $0C                 ;
                    LDA.w $0FF4               ;
                    AND.b #$0C                ;
                    STA.b $0B                 ;
                    AND.b #$04                ;
                    BEQ   CODE_0DAE5F         ;
                    LDA.b $28                 ;
                    BNE   CODE_0DAE5F         ;
                    LDY.b $0C                 ;
                    BEQ   CODE_0DAE5F         ;
                    LDA.b #$00                ;
                    STA.b $0C                 ;
                    STA.b $0B                 ;
CODE_0DAE5F:        LDA.l $700007             ;
                    BEQ   CODE_0DAE6B         ;
                    JSL.l CODE_0FDEFE         ;
                    BCC   CODE_0DAE6E         ;
CODE_0DAE6B:        JSR.w CODE_0DB0E5         ;
CODE_0DAE6E:        LDY.b #$01                ;
                    LDA.w $0754               ;
                    BNE   CODE_0DAE7E         ;
                    LDY.b #$00                ;
                    LDA.w $0714               ;
                    BEQ   CODE_0DAE7E         ;
                    LDY.b #$02                ;
CODE_0DAE7E:        STY.w $048F               ;
                    LDA.b #$01                ;
                    LDY.b $5D                 ;
                    BEQ   CODE_0DAE8C         ;
                    BPL   CODE_0DAE8A         ;
                    ASL   A                   ;
CODE_0DAE8A:        STA.b $46                 ;
CODE_0DAE8C:        JSR.w CODE_0DAC76         ;
                    JSR.w CODE_0DFDB2         ;
                    JSR.w CODE_0DFD29         ;
                    LDX.b #$00                ;
                    JSR.w CODE_0DE9A9         ;
                    JSR.w CODE_0DE263         ;
                    LDA.w $0237               ;
                    CMP.b #$40                ;
                    BCC   CODE_0DAECE         ;
                    LDA.b $0F                 ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DAECE         ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DAECE         ;
                    CMP.b #$04                ;
                    BCC   CODE_0DAECE         ;
                    LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BNE   CODE_0DAEC4         ;
                    STZ.w $0F04               ;
                    LDA.w $0256               ;
                    AND.b #$CE                ;
                    ORA.b #$30                ;
                    BRA   CODE_0DAECB         ;

CODE_0DAEC4:        LDA.w $0256               ;
                    AND.b #$CE                ;
                    ORA.b #$20                ;
CODE_0DAECB:        STA.w $0256               ;
CODE_0DAECE:        LDA.b $BB                 ;
                    CMP.b #$02                ;
                    BMI   CODE_0DAF1C         ;
                    LDX.b #$01                ;
                    STX.w $0723               ;
                    LDY.b #$04                ;
                    STY.b $07                 ;
                    LDX.b #$00                ;
                    LDY.w $0759               ;
                    BNE   CODE_0DAEE9         ;
                    LDY.w $0743               ;
                    BNE   CODE_0DAF0C         ;
CODE_0DAEE9:        INX                       ;
                    LDY.b $0F                 ;
                    CPY.b #$0B                ;
                    BEQ   CODE_0DAF0C         ;
                    LDY.w $0712               ;
                    BNE   CODE_0DAF08         ;
                    INY                       ;
                    STY.w $0712               ;
                    LDY.b #$09                ;
                    STY.w $1602               ;
                    PHA                       ;
                    LDA.b #$20                ;
                    TSB.w $1601               ;
                    PLA                       ;
                    STA.w $0E67               ;
CODE_0DAF08:        LDY.b #$06                ;
                    STY.b $07                 ;
CODE_0DAF0C:        CMP.b $07                 ;
                    BMI   CODE_0DAF1C         ;
                    DEX                       ;
                    BMI   CODE_0DAF1D         ;
                    LDY.w $07B1               ;
                    BNE   CODE_0DAF1C         ;
                    LDA.b #$06                ;
                    STA.b $0F                 ;
CODE_0DAF1C:        RTS                       ;

CODE_0DAF1D:        LDA.b #$00                ;
                    STA.w $0758               ;
                    JSR.w CODE_0DAF43         ;
                    INC.w $0752               ;
                    RTS                       ;

CODE_0DAF29:        LDA.b $BB                 ;
                    BNE   CODE_0DAF34         ;
                    LDA.w $0237               ;
                    CMP.b #$E4                ;
                    BCC   CODE_0DAF43         ;
CODE_0DAF34:        LDA.b #$08                ;
                    STA.w $0758               ;
                    STA.w $0E67               ;
                    LDY.b #$03                ;
                    STY.b $28                 ;
                    JMP.w CODE_0DAE12         ;

CODE_0DAF43:        LDA.b #$02                ;
                    STA.w $0752               ;
                    JMP.w CODE_0DAF8F         ;

CODE_0DAF4B:        LDA.b #$01                ;
                    STA.w $0E4F               ;
                    STA.w $0218               ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_0DAF5D         ;
                    LDA.b #$01                ;
                    JSR.w CODE_0DAF72         ;
CODE_0DAF5D:        JSR.w CODE_0DAC76         ;
                    LDY.b #$00                ;
                    LDA.w $06D6               ;
                    BNE   CODE_0DAF87         ;
                    INY                       ;
                    LDA.b $5C                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DAF87         ;
                    INY                       ;
                    JMP.w CODE_0DAF87         ;

CODE_0DAF72:        CLC                       ;
                    ADC.w $0237               ;
                    STA.w $0237               ;
                    RTS                       ;

CODE_0DAF7A:        LDA.b #$01                ;
                    STA.w $0E4F               ;
                    STA.w $0E67               ;
                    JSR.w CODE_0DAFAD         ;
                    LDY.b #$02                ;
CODE_0DAF87:        DEC.w $06DE               ;
                    BNE   CODE_0DAFAC         ;
                    STY.w $0752               ;
CODE_0DAF8F:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STA.w $0E67               ;
                    LDA.w $02FF               ;
                    BEQ   CODE_0DAFA4         ;
                    LDX.b #$00                ;
                    JSL.l CODE_0FD4D3         ;
                    LDX.b $9E                 ;
CODE_0DAFA4:        LDA.b #$00                ;
                    STA.w $0772               ;
                    STA.w $0722               ;
CODE_0DAFAC:        RTS                       ;

CODE_0DAFAD:        LDA.b #$08                ;
                    STA.b $5D                 ;
                    LDY.b #$01                ;
                    LDA.w $0219               ;
                    AND.b #$0F                ;
                    BNE   CODE_0DAFBD         ;
                    STA.b $5D                 ;
                    TAY                       ;
CODE_0DAFBD:        TYA                       ;
                    JSR.w CODE_0DAE12         ;
                    RTS                       ;

CODE_0DAFC2:        LDA.w $0747               ;
                    CMP.b #$F8                ;
                    BNE   CODE_0DAFCC         ;
                    JMP.w CODE_0DAFE4         ;

CODE_0DAFCC:        CMP.b #$C4                ;
                    BNE   CODE_0DAFD3         ;
                    JSR.w CODE_0DB002         ;
CODE_0DAFD3:        RTS                       ;

CODE_0DAFD4:        LDA.w $0747               ;
                    CMP.b #$F0                ;
                    BCS   CODE_0DAFE2         ;
                    CMP.b #$C8                ;
                    BEQ   CODE_0DB002         ;
                    JMP.w CODE_0DAE1C         ;

CODE_0DAFE2:        BNE   CODE_0DAFF7         ;
CODE_0DAFE4:        LDY.w $070B               ;
                    BNE   CODE_0DAFF7         ;
                    STY.w $070D               ;
                    INC.w $070B               ;
                    LDA.w $0754               ;
                    EOR.b #$01                ;
                    STA.w $0754               ;
CODE_0DAFF7:        RTS                       ;

CODE_0DAFF8:        LDA.w $0747               ;
                    CMP.b #$F0                ;
                    BCS   CODE_0DB05A         ;
                    JMP.w CODE_0DAE1C         ;

CODE_0DB002:        STZ.w $0747               ;
                    JSL.l CODE_0E98C3         ;
                    LDA.b #$08                ;
                    STA.b $0F                 ;
                    RTS                       ;

CODE_0DB00E:        LDA.w $0747               ;
                    CMP.b #$C0                ;
                    BEQ   CODE_0DB04D         ;
                    EOR.b #$FF                ;
                    ASL   A                   ;
CODE_0DB018:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    PHY                       ;
                    PHX                       ;
                    REP   #$30                ;
                    AND.w #$0060              ;
                    TAX                       ;
                    LDA.w $0753               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_0DB031         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
CODE_0DB031:        LDY.w #$01E0              ;
CODE_0DB034:        LDA.w $C19C,x             ;
                    STA.w $1000,y             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    CPY.w #$0200              ;
                    BNE   CODE_0DB034         ;
                    SEP   #$30                ;
                    PLX                       ;
                    PLY                       ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
                    RTS                       ;

CODE_0DB04D:        JSR.w CODE_0DB002         ;
CODE_0DB050:        LDA.w $0256               ;
                    AND.b #$F1                ;
                    ORA.b #$0E                ;
                    STA.w $0256               ;
CODE_0DB05A:        RTS                       ;

CODE_0DB05B:        LDA.b $21                 ;
                    CMP.b #$30                ;
                    BNE   CODE_0DB072         ;
                    LDA.b #$00                ;
                    STA.w $0713               ;
                    LDY.w $0237               ;
                    CPY.b #$9E                ;
                    BCS   CODE_0DB06F         ;
                    LDA.b #$04                ;
CODE_0DB06F:        JMP.w CODE_0DAE12         ;

CODE_0DB072:        INC.b $0F                 ;
                    RTS                       ;

                    db $15,$23,$16,$1B,$17,$18,$23,$63

CODE_0DB07D:        JSL.l CODE_0FD2CD         ;
                    BEQ   CODE_0DB092         ;
                    LDA.b #$01                ;
                    JSR.w CODE_0DAE12         ;
                    LDA.w $0237               ;
                    CMP.b #$AE                ;
                    BCC   CODE_0DB092         ;
                    STZ.w $0723               ;
CODE_0DB092:        LDA.w $0746               ;
                    CMP.b #$05                ;
                    BNE   CODE_0DB0E4         ;
                    INC.w $075C               ;
                    LDA.w $075C               ;
                    CMP.b #$03                ;
                    BNE   CODE_0DB0B0         ;
                    LDY.w $075F               ;
                    LDA.w $0748               ;
                    CMP.b #$10                ;
                    BCC   CODE_0DB0B0         ;
                    INC.w $075D               ;
CODE_0DB0B0:        INC.w $0760               ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BNE   CODE_0DB0D7         ;
                    LDA.w $075C               ;
                    CMP.b #$04                ;
                    BNE   CODE_0DB0D7         ;
                    STZ.w $075C               ;
                    STZ.w $0760               ;
                    INC.w $075F               ;
                    LDA.b #$FF                ;
                    STA.w $07FA               ;
                    LDA.b #$01                ;
                    STA.w $07FB               ;
                    STA.w $076A               ;
CODE_0DB0D7:        JSL.l CODE_0EC34C         ;
                    INC.w $0757               ;
                    JSR.w CODE_0DAF8F         ;
                    STA.w $075B               ;
CODE_0DB0E4:        RTS                       ;

CODE_0DB0E5:        LDA.b #$00                ;
                    LDY.w $0754               ;
                    BNE   CODE_0DB0F4         ;
                    LDA.b $28                 ;
                    BNE   CODE_0DB0F7         ;
                    LDA.b $0B                 ;
                    AND.b #$04                ;
CODE_0DB0F4:        STA.w $0714               ;
CODE_0DB0F7:        JSR.w CODE_0DB236         ;
                    LDA.w $070B               ;
                    BNE   CODE_0DB117         ;
                    LDA.b $28                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DB10A         ;
                    LDY.b #$18                ;
                    STY.w $0791               ;
CODE_0DB10A:        ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_0DB10F,x)     ;

PNTR_0DB10F:        dw CODE_0DB118
                    dw CODE_0DB13E
                    dw CODE_0DB135
                    dw CODE_0DB197

CODE_0DB117:        RTS                       ;

CODE_0DB118:        JSR.w CODE_0DB39D         ;
                    LDA.b $0C                 ;
                    BEQ   CODE_0DB122         ;
                    STA.w $0202               ;
CODE_0DB122:        JSR.w CODE_0DB3D8         ;
CODE_0DB125:        JSR.w CODE_0DBEA7         ;
                    STA.w $06FF               ;
                    LDA.w $0F04               ;
                    BEQ   CODE_0DB134         ;
                    JSL.l CODE_0FF1FE         ;
CODE_0DB134:        RTS                       ;

CODE_0DB135:        LDA.w $070A               ;
                    STA.w $0709               ;
                    JMP.w CODE_0DB177         ;

CODE_0DB13E:        LDY.b $A0                 ;
                    BPL   CODE_0DB156         ;
                    LDA.b $0A                 ;
                    AND.b #$80                ;
                    AND.b $0D                 ;
                    BNE   CODE_0DB15C         ;
                    LDA.w $0708               ;
                    SEC                       ;
                    SBC.w $0237               ;
                    CMP.w $0706               ;
                    BCC   CODE_0DB15C         ;
CODE_0DB156:        LDA.w $070A               ;
                    STA.w $0709               ;
CODE_0DB15C:        LDA.w $0704               ;
                    BEQ   CODE_0DB177         ;
                    JSR.w CODE_0DB39D         ;
                    LDA.w $0237               ;
                    CMP.b #$14                ;
                    BCS   CODE_0DB170         ;
                    LDA.b #$18                ;
                    STA.w $0709               ;
CODE_0DB170:        LDA.b $0C                 ;
                    BEQ   CODE_0DB177         ;
                    STA.w $0202               ;
CODE_0DB177:        LDA.b $0C                 ;
                    BEQ   CODE_0DB17E         ;
                    JSR.w CODE_0DB3D8         ;
CODE_0DB17E:        JSR.w CODE_0DB125         ;
                    LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BNE   CODE_0DB18C         ;
                    LDA.b #$28                ;
                    STA.w $0709               ;
CODE_0DB18C:        JMP.w CODE_0DBEF0         ;

                    db $0E,$04,$FC,$F2
                    db $00,$00,$FF,$FF

CODE_0DB197:        LDA.w $041C               ;
                    CLC                       ;
                    ADC.w $043C               ;
                    STA.w $041C               ;
                    LDY.b #$00                ;
                    LDA.b $A0                 ;
                    BPL   CODE_0DB1A8         ;
                    DEY                       ;
CODE_0DB1A8:        STY.b $00                 ;
                    ADC.w $0237               ;
                    STA.w $0237               ;
                    LDA.b $BB                 ;
                    ADC.b $00                 ;
                    STA.b $BB                 ;
                    LDA.b $0C                 ;
                    AND.w $0480               ;
                    BEQ   CODE_0DB1F5         ;
                    LDY.w $0791               ;
                    BNE   CODE_0DB1F4         ;
                    LDY.b #$18                ;
                    STY.w $0791               ;
                    LDX.b #$00                ;
                    LDY.w $0202               ;
                    LSR   A                   ;
                    BCS   CODE_0DB1D8         ;
                    LDA.w $03AD               ;
                    CMP.b #$10                ;
                    BCC   CODE_0DB1F4         ;
                    INX                       ;
                    INX                       ;
CODE_0DB1D8:        DEY                       ;
                    BEQ   CODE_0DB1DC         ;
                    INX                       ;
CODE_0DB1DC:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.w $B18F,x             ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.w $B193,x             ;
                    STA.b $78                 ;
                    LDA.b $0C                 ;
                    EOR.b #$03                ;
                    STA.w $0202               ;
CODE_0DB1F4:        RTS                       ;

CODE_0DB1F5:        STA.w $0791               ;
                    RTS                       ;

                    db $20,$20,$1E,$28,$28,$0D,$04,$70
                    db $70,$60,$90,$90,$0A,$09,$E4,$98
                    db $D0,$18,$18,$18,$22,$22,$0D,$04
                    db $42,$42,$3E,$5D,$5D,$0A,$09,$B4
                    db $68,$A0,$FC,$FC,$FC,$FB,$FB,$FE
                    db $FF,$00,$00,$00,$00,$00,$80,$00
                    db $D8,$E8,$F0,$28,$18,$10,$0C,$00
                    db $FF,$01,$00,$20,$FF

CODE_0DB236:        LDA.b $28                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DB26C         ;
                    LDY.b #$00                ;
                    LDA.b $0B                 ;
                    AND.w $0480               ;
                    BEQ   CODE_0DB258         ;
                    INY                       ;
                    AND.b #$08                ;
                    BEQ   CODE_0DB257         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0DB258         ;
                    LDA.b #$30                ;
                    STA.w $1600               ;
                    BRA   CODE_0DB258         ;

CODE_0DB257:        INY                       ;
CODE_0DB258:        LDX.w $B233,y             ;
                    STX.w $043C               ;
                    LDA.b #$08                ;
                    LDX.w $B230,y             ;
                    STX.b $A0                 ;
                    BMI   CODE_0DB268         ;
                    LSR   A                   ;
CODE_0DB268:        STA.w $070C               ;
                    RTS                       ;

CODE_0DB26C:        LDA.w $070E               ;
                    BNE   CODE_0DB27B         ;
                    LDA.b $0A                 ;
                    AND.b #$80                ;
                    BEQ   CODE_0DB27B         ;
                    AND.b $0D                 ;
                    BEQ   CODE_0DB27E         ;
CODE_0DB27B:        JMP.w CODE_0DB327         ;

CODE_0DB27E:        LDA.b $28                 ;
                    BEQ   CODE_0DB293         ;
                    LDA.w $0704               ;
                    BEQ   CODE_0DB27B         ;
                    LDA.w $078A               ;
                    BNE   CODE_0DB293         ;
                    LDA.b $A0                 ;
                    BPL   CODE_0DB293         ;
                    JMP.w CODE_0DB327         ;

CODE_0DB293:        LDA.b #$20                ;
                    STA.w $078A               ;
                    LDY.b #$00                ;
                    STY.w $041C               ;
                    STY.w $043C               ;
                    LDA.b $BB                 ;
                    STA.w $0707               ;
                    LDA.w $0237               ;
                    STA.w $0708               ;
                    LDA.b #$01                ;
                    STA.b $28                 ;
                    LDA.w $0700               ;
                    CMP.b #$09                ;
                    BCC   CODE_0DB2C6         ;
                    INY                       ;
                    CMP.b #$10                ;
                    BCC   CODE_0DB2C6         ;
                    INY                       ;
                    CMP.b #$19                ;
                    BCC   CODE_0DB2C6         ;
                    INY                       ;
                    CMP.b #$1C                ;
                    BCC   CODE_0DB2C6         ;
                    INY                       ;
CODE_0DB2C6:        LDA.b #$01                ;
                    STA.w $0706               ;
                    LDA.w $0704               ;
                    BEQ   CODE_0DB2D8         ;
                    LDY.b #$05                ;
                    LDA.w $027D               ;
                    BEQ   CODE_0DB2D8         ;
                    INY                       ;
CODE_0DB2D8:        LDA.w $0753               ;
                    BNE   CODE_0DB2F6         ;
                    LDA.w $B1F9,y             ;
                    STA.w $0709               ;
                    LDA.w $B200,y             ;
                    STA.w $070A               ;
                    LDA.w $B222,y             ;
                    STA.w $043C               ;
                    LDA.w $B21B,y             ;
                    STA.b $A0                 ;
                    BRA   CODE_0DB30D         ;

CODE_0DB2F6:        LDA.w $B20A,y             ;
                    STA.w $0709               ;
                    LDA.w $B211,y             ;
                    STA.w $070A               ;
                    LDA.w $B222,y             ;
                    STA.w $043C               ;
                    LDA.w $B21B,y             ;
                    STA.b $A0                 ;
CODE_0DB30D:        LDA.w $0704               ;
                    BEQ   CODE_0DB322         ;
                    LDA.b #$0E                ;
                    STA.w $1600               ;
                    LDA.w $0237               ;
                    CMP.b #$14                ;
                    BCS   CODE_0DB327         ;
                    STZ.b $A0                 ;
                    BRA   CODE_0DB327         ;

CODE_0DB322:        LDA.b #$01                ;
                    TSB.w $1601               ;
CODE_0DB327:        LDY.b #$00                ;
                    STY.b $00                 ;
                    LDA.b $28                 ;
                    BEQ   CODE_0DB338         ;
                    LDA.w $0700               ;
                    CMP.b #$19                ;
                    BCS   CODE_0DB368         ;
                    BCC   CODE_0DB34F         ;
CODE_0DB338:        INY                       ;
                    LDA.b $5C                 ;
                    BEQ   CODE_0DB34F         ;
                    DEY                       ;
                    LDA.b $0C                 ;
                    CMP.b $46                 ;
                    BNE   CODE_0DB34F         ;
                    LDA.b $0A                 ;
                    AND.b #$40                ;
                    BNE   CODE_0DB363         ;
                    LDA.w $078B               ;
                    BNE   CODE_0DB368         ;
CODE_0DB34F:        INY                       ;
                    INC.b $00                 ;
                    LDA.w $0703               ;
                    BNE   CODE_0DB35E         ;
                    LDA.w $0700               ;
                    CMP.b #$21                ;
                    BCC   CODE_0DB368         ;
CODE_0DB35E:        INC.b $00                 ;
                    JMP.w CODE_0DB368         ;

CODE_0DB363:        LDA.b #$0A                ;
                    STA.w $078B               ;
CODE_0DB368:        LDA.w $B229,y             ;
                    STA.w $045D               ;
                    LDA.b $0F                 ;
                    CMP.b #$07                ;
                    BNE   CODE_0DB376         ;
                    LDY.b #$03                ;
CODE_0DB376:        LDA.w $B22C,y             ;
                    STA.w $0463               ;
                    LDY.b $00                 ;
                    LDA.w $B207,y             ;
                    STA.w $0702               ;
                    STZ.w $0701               ;
                    LDA.w $0202               ;
                    CMP.b $46                 ;
                    BEQ   CODE_0DB399         ;
                    LDA.w $0EC2               ;
                    BNE   CODE_0DB399         ;
                    ASL.w $0702               ;
                    ROL.w $0701               ;
CODE_0DB399:        RTS                       ;

                    db $02,$04,$07

CODE_0DB39D:        LDY.b #$00                ;
                    LDA.w $0700               ;
                    CMP.b #$1C                ;
                    BCS   CODE_0DB3BB         ;
                    INY                       ;
                    CMP.b #$0E                ;
                    BCS   CODE_0DB3AC         ;
                    INY                       ;
CODE_0DB3AC:        LDA.w $0FF4               ;
                    AND.b #$7F                ;
                    BEQ   CODE_0DB3D1         ;
                    AND.b #$03                ;
                    CMP.b $46                 ;
                    BNE   CODE_0DB3C0         ;
                    LDA.b #$00                ;
CODE_0DB3BB:        STA.w $0703               ;
                    BRA   CODE_0DB3D1         ;

CODE_0DB3C0:        LDA.w $0700               ;
                    CMP.b #$0B                ;
                    BCS   CODE_0DB3D1         ;
                    LDA.w $0202               ;
                    STA.b $46                 ;
                    STZ.b $5D                 ;
                    STZ.w $0705               ;
CODE_0DB3D1:        LDA.w $B39A,y             ;
                    STA.w $070C               ;
                    RTS                       ;

CODE_0DB3D8:        AND.w $0480               ;
                    CMP.b #$00                ;
                    BNE   CODE_0DB3E7         ;
                    LDA.b $5D                 ;
                    BEQ   CODE_0DB42B         ;
                    BPL   CODE_0DB407         ;
                    BMI   CODE_0DB3EA         ;
CODE_0DB3E7:        LSR   A                   ;
                    BCC   CODE_0DB407         ;
CODE_0DB3EA:        LDA.w $0705               ;
                    CLC                       ;
                    ADC.w $0702               ;
                    STA.w $0705               ;
                    LDA.b $5D                 ;
                    ADC.w $0701               ;
                    STA.b $5D                 ;
                    CMP.w $0463               ;
                    BMI   CODE_0DB422         ;
                    LDA.w $0463               ;
                    STA.b $5D                 ;
                    BRA   CODE_0DB42B         ;

CODE_0DB407:        LDA.w $0705               ;
                    SEC                       ;
                    SBC.w $0702               ;
                    STA.w $0705               ;
                    LDA.b $5D                 ;
                    SBC.w $0701               ;
                    STA.b $5D                 ;
                    CMP.w $045D               ;
                    BPL   CODE_0DB422         ;
                    LDA.w $045D               ;
                    STA.b $5D                 ;
CODE_0DB422:        CMP.b #$00                ;
                    BPL   CODE_0DB42B         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_0DB42B:        STA.w $0700               ;
                    RTS                       ;

CODE_0DB42F:        LDA.w $0756               ;
                    CMP.b #$02                ;
                    BCC   CODE_0DB47A         ;
                    LDA.b $0A                 ;
                    AND.b #$40                ;
                    BEQ   CODE_0DB470         ;
                    AND.b $0D                 ;
                    BNE   CODE_0DB470         ;
                    LDA.w $06CE               ;
                    AND.b #$01                ;
                    TAX                       ;
                    LDA.b $33,x               ;
                    BNE   CODE_0DB470         ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_0DB470         ;
                    LDA.w $0714               ;
                    BNE   CODE_0DB470         ;
                    LDA.b $28                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DB470         ;
                    LDA.b #$06                ;
                    STA.w $1603               ;
                    LDA.b #$02                ;
                    STA.b $33,x               ;
                    LDY.w $070C               ;
                    STY.w $0711               ;
                    DEY                       ;
                    STY.w $0789               ;
                    INC.w $06CE               ;
CODE_0DB470:        LDX.b #$00                ;
                    JSR.w CODE_0DB495         ;
                    LDX.b #$01                ;
                    JSR.w CODE_0DB495         ;
CODE_0DB47A:        LDA.b $5C                 ;
                    BNE   CODE_0DB492         ;
                    LDX.b #$02                ;
CODE_0DB480:        STX.b $9E                 ;
                    JSR.w CODE_0DB52F         ;
                    JSR.w CODE_0DFD30         ;
                    JSR.w CODE_0DFDC3         ;
                    JSL.l CODE_0FEC20         ;
                    DEX                       ;
                    BPL   CODE_0DB480         ;
CODE_0DB492:        RTS                       ;

                    db $40,$C0

CODE_0DB495:        STX.b $9E
                    LDA.b $33,x               ;
                    ASL   A                   ;
                    BCC   CODE_0DB49F         ;
                    JMP.w CODE_0DB529         ;

CODE_0DB49F:        LDY.b $33,x               ;
                    BNE   CODE_0DB4A6         ;
                    JMP.w CODE_0DB528         ;

CODE_0DB4A6:        DEY                       ;
                    BEQ   CODE_0DB4D5         ;
                    LDA.w $0219               ;
                    ADC.b #$04                ;
                    STA.w $0224,x             ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    STA.b $83,x               ;
                    LDA.w $0237               ;
                    STA.w $0242,x             ;
                    LDA.b #$01                ;
                    STA.b $C6,x               ;
                    LDY.w $0202               ;
                    DEY                       ;
                    LDA.w $B493,y             ;
                    STA.b $68,x               ;
                    LDA.b #$04                ;
                    STA.b $AB,x               ;
                    LDA.b #$07                ;
                    STA.w $049A,x             ;
                    DEC.b $33,x               ;
CODE_0DB4D5:        TXA                       ;
                    CLC                       ;
                    ADC.b #$0B                ;
                    TAX                       ;
                    LDA.b #$50                ;
                    STA.b $00                 ;
                    LDA.b #$03                ;
                    STA.b $02                 ;
                    LDA.b #$00                ;
                    JSR.w CODE_0DBF7E         ;
                    JSR.w CODE_0DBEAD         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0DFD39         ;
                    JSR.w CODE_0DFDB9         ;
                    JSR.w CODE_0DE932         ;
                    JSR.w CODE_0DE8C2         ;
                    LDA.w $03D2               ;
                    AND.b #$FC                ;
                    BEQ   CODE_0DB51E         ;
                    AND.b #$F0                ;
                    BNE   CODE_0DB524         ;
                    LDA.w $68,x             ;
                    BMI   CODE_0DB513         ;
                    LDA.w $03D2               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BEQ   CODE_0DB524         ;
                    BRA   CODE_0DB521         ;

CODE_0DB513:        LDA.w $03D2               ;
                    AND.b #$0C                ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DB524         ;
                    BRA   CODE_0DB521         ;

CODE_0DB51E:        JSR.w CODE_0DDB80         ;
CODE_0DB521:        JMP.w CODE_0DF433         ;

CODE_0DB524:        LDA.b #$00                ;
                    STA.b $33,x               ;
CODE_0DB528:        RTS                       ;

CODE_0DB529:        JSR.w CODE_0DFD39         ;
                    JMP.w CODE_0DF498         ;

CODE_0DB52F:        LDA.w $07B8,x             ;
                    AND.b #$01                ;
                    STA.b $07                 ;
                    LDA.w $0251,x             ;
                    CMP.b #$F8                ;
                    BNE   CODE_0DB56E         ;
                    LDA.w $079E               ;
                    BNE   CODE_0DB588         ;
CODE_0DB542:        LDY.b #$00                ;
                    LDA.w $0202               ;
                    LSR   A                   ;
                    BCC   CODE_0DB54C         ;
                    LDY.b #$08                ;
CODE_0DB54C:        TYA                       ;
                    ADC.w $0219               ;
                    STA.w $0233,x             ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    STA.b $92,x               ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0251,x             ;
                    LDA.b #$01                ;
                    STA.b $D5,x               ;
                    LDY.b $07                 ;
                    LDA.w $B58B,y             ;
                    STA.w $079E               ;
CODE_0DB56E:        LDY.b $07                 ;
                    LDA.w $0436,x             ;
                    SEC                       ;
                    SBC.w $B589,y             ;
                    STA.w $0436,x             ;
                    LDA.w $0251,x             ;
                    SBC.b #$00                ;
                    CMP.b #$20                ;
                    BCS   CODE_0DB585         ;
                    LDA.b #$F8                ;
CODE_0DB585:        STA.w $0251,x             ;
CODE_0DB588:        RTS                       ;

                    db $FF,$50,$40,$20

CODE_0DB58D:        LDA.w $0770               ;
                    BEQ   CODE_0DB5E7         ;
                    LDA.b $0F                 ;
                    CMP.b #$08                ;
                    BCC   CODE_0DB5E7         ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DB5E7         ;
                    LDA.b $BB                 ;
                    CMP.b #$02                ;
                    BPL   CODE_0DB5E7         ;
                    LDA.w $078F               ;
                    BNE   CODE_0DB5E7         ;
                    LDA.w $07E9               ;
                    ORA.w $07EA               ;
                    ORA.w $07EB               ;
                    BEQ   CODE_0DB5DE         ;
                    LDY.w $07E9               ;
                    DEY                       ;
                    BNE   CODE_0DB5C5         ;
                    LDA.w $07EA               ;
                    ORA.w $07EB               ;
                    BNE   CODE_0DB5C5         ;
                    LDA.b #$FF                ;
                    STA.w $1600               ;
CODE_0DB5C5:        LDA.b #$18                ;
                    STA.w $078F               ;
                    LDY.b #$23                ;
                    LDA.b #$FF                ;
                    STA.w $014A               ;
                    LDA.w $0E73               ;
                    BNE   CODE_0DB5D9         ;
                    JSR.w CODE_0D98AA         ;
CODE_0DB5D9:        LDA.b #$A4                ;
                    JMP.w CODE_0D983D         ;

CODE_0DB5DE:        STA.w $0756               ;
                    JSR.w CODE_0DDE8A         ;
                    INC.w $0759               ;
CODE_0DB5E7:        RTS                       ;

CODE_0DB5E8:        LDA.w $0723               ;
                    BEQ   CODE_0DB5E7         ;
                    LDA.w $0237               ;
                    AND.b $BB                 ;
                    BNE   CODE_0DB5E7         ;
                    STA.w $0723               ;
                    JMP.w CODE_0DCCEA         ;

CODE_0DB5FA:        LDA.b $5C                 ;
                    BNE   CODE_0DB63B         ;
                    STA.w $027D               ;
                    JSL.l CODE_048378         ;
                    LDA.w $0747               ;
                    BNE   CODE_0DB63B         ;
                    LDY.b #$04                ;
CODE_0DB60C:        LDA.w $0271,y             ;
                    CLC                       ;
                    ADC.w $0277,y             ;
                    STA.b $02                 ;
                    LDA.w $026B,y             ;
                    BEQ   CODE_0DB638         ;
                    ADC.b #$00                ;
                    STA.b $01                 ;
                    LDA.w $0219               ;
                    SEC                       ;
                    SBC.w $0271,y             ;
                    LDA.b $78                 ;
                    SBC.w $026B,y             ;
                    BMI   CODE_0DB638         ;
                    LDA.b $02                 ;
                    SEC                       ;
                    SBC.w $0219               ;
                    LDA.b $01                 ;
                    SBC.b $78                 ;
                    BPL   CODE_0DB63C         ;
CODE_0DB638:        DEY                       ;
                    BPL   CODE_0DB60C         ;
CODE_0DB63B:        RTS                       ;

CODE_0DB63C:        LDA.w $0277,y             ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.w $0271,y             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $01                 ;
                    LDA.w $026B,y             ;
                    ADC.b #$00                ;
                    STA.b $00                 ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_0DB687         ;
                    LDA.b $01                 ;
                    SEC                       ;
                    SBC.w $0219               ;
                    LDA.b $00                 ;
                    SBC.b $78                 ;
                    BPL   CODE_0DB672         ;
                    LDA.w $0219               ;
                    SEC                       ;
                    SBC.b #$01                ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    SBC.b #$00                ;
                    JMP.w CODE_0DB685         ;

CODE_0DB672:        LDA.w $0480               ;
                    LSR   A                   ;
                    BCC   CODE_0DB687         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
CODE_0DB685:        STA.b $78                 ;
CODE_0DB687:        LDA.b #$10                ;
                    STA.b $00                 ;
                    LDA.b #$01                ;
                    STA.w $027D               ;
                    STA.b $02                 ;
                    LSR   A                   ;
                    TAX                       ;
                    JMP.w CODE_0DBF7E         ;

                    db $05,$02,$08,$04,$01,$03,$03,$04
                    db $04,$04

CODE_0DB6A1:        LDX.b #$05                ;
                    STX.b $9E                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$30                ;
                    BEQ   CODE_0DB6AC         ;
                    RTS                       ;

CODE_0DB6AC:        LDA.b $0F                 ;
                    CMP.b #$04                ;
                    BNE   CODE_0DB6E7         ;
                    LDA.b $28                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DB6E7         ;
                    LDA.w $0238,x             ;
                    CMP.b #$AA                ;
                    BCS   CODE_0DB6EA         ;
                    LDA.w $0237               ;
                    CMP.b #$A2                ;
                    BCS   CODE_0DB6EA         ;
                    LDA.w $041D,x             ;
                    ADC.b #$FF                ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    ADC.b #$01                ;
                    STA.w $0238,x             ;
                    LDA.w $010E               ;
                    SEC                       ;
                    SBC.b #$FF                ;
                    STA.w $010E               ;
                    LDA.w $010D               ;
                    SBC.b #$01                ;
                    STA.w $010D               ;
CODE_0DB6E7:        JMP.w CODE_0DB735         ;

CODE_0DB6EA:        LDY.w $010F               ;
                    CPY.b #$05                ;
                    BNE   CODE_0DB6FD         ;
                    JSL.l CODE_048596         ;Increase lives by one
                    LDA.b #$05                ;
                    STA.w $1603               ;
                    JMP.w CODE_0DB709         ;

CODE_0DB6FD:        LDA.w $B697,y             ;
                    LDX.w $B69C,y             ;
                    STA.w $0145,x             ;
                    JSR.w CODE_0DBB27         ;
CODE_0DB709:        LDA.b #$05                ;
                    STA.b $0F                 ;
                    LDA.b #$0C                ;
                    STA.w $1602               ;
                    LDA.w $0202               ;
                    AND.b #$02                ;
                    BNE   CODE_0DB71D         ;
                    LDA.b #$6E                ;
                    BRA   CODE_0DB71F         ;

CODE_0DB71D:        LDA.b #$60                ;
CODE_0DB71F:        STA.w $02FD               ;
                    LDA.w $0219               ;
                    STA.w $03CC               ;
                    LDA.b $78                 ;
                    STA.w $03CD               ;
                    LDA.b #$20                ;
                    STA.w $03FB               ;
                    STA.w $03FA               ;
CODE_0DB735:        JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JSL.l CODE_0FFC40         ;
                    RTS                       ;

                    db $08,$10,$08,$00

CODE_0DB744:        JSR.w CODE_0DFDE1         ;
                    LDA.w $0747               ;
                    BNE   CODE_0DB7AD         ;
                    LDA.w $070E               ;
                    BEQ   CODE_0DB7AD         ;
                    TAY                       ;
                    DEY                       ;
                    TYA                       ;
                    AND.b #$02                ;
                    BNE   CODE_0DB761         ;
                    INC.w $0237               ;
                    INC.w $0237               ;
                    JMP.w CODE_0DB767         ;

CODE_0DB761:        DEC.w $0237               ;
                    DEC.w $0237               ;
CODE_0DB767:        LDA.b $5E,x               ;
                    CLC                       ;
                    ADC.w $B740,y             ;
                    STA.w $0238,x             ;
                    CPY.b #$01                ;
                    BCC   CODE_0DB79C         ;
                    LDA.b $0A                 ;
                    AND.b #$80                ;
                    BEQ   CODE_0DB79C         ;
                    AND.b $0D                 ;
                    BNE   CODE_0DB79C         ;
                    TYA                       ;
                    PHA                       ;
                    LDA.b #$F4                ;
                    LDY.w $075F               ;
                    CPY.b #$0B                ;
                    BEQ   CODE_0DB795         ;
                    CPY.b #$01                ;
                    BEQ   CODE_0DB795         ;
                    CPY.b #$02                ;
                    BEQ   CODE_0DB795         ;
                    CPY.b #$06                ;
                    BNE   CODE_0DB797         ;
CODE_0DB795:        LDA.b #$E0                ;
CODE_0DB797:        STA.w $06DB               ;
                    PLA                       ;
                    TAY                       ;
CODE_0DB79C:        CPY.b #$03                ;
                    BNE   CODE_0DB7AD         ;
                    LDA.w $06DB               ;
                    STA.b $A0                 ;
                    STZ.w $070E               ;
                    LDA.b #$08                ;
                    STA.w $1603               ;
CODE_0DB7AD:        JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DEE40         ;
                    JSR.w CODE_0DDAFC         ;
                    LDA.w $070E               ;
                    BEQ   CODE_0DB7C8         ;
                    LDA.w $078E               ;
                    BNE   CODE_0DB7C8         ;
                    LDA.b #$04                ;
                    STA.w $078E               ;
                    INC.w $070E               ;
CODE_0DB7C8:        RTS                       ;

CODE_0DB7C9:        LDA.b #$2F                ;
                    STA.b $1C,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    LDA.w $85,y             ;
                    STA.b $79,x               ;
                    LDA.w $0226,y             ;
                    STA.w $021A,x             ;
                    LDA.w $0244,y             ;
                    BNE   CODE_0DB7E3         ;
                    LDA.b #$F0                ;
CODE_0DB7E3:        STA.w $0238,x             ;
                    LDY.w $0398               ;
                    BNE   CODE_0DB7EE         ;
                    STA.w $039D               ;
CODE_0DB7EE:        TXA                       ;
                    STA.w $039A,y             ;
                    INC.w $0398               ;
                    LDA.b #$03                ;
                    STA.w $1603               ;
                    RTS                       ;

CODE_0DB7FB:        CPX.b #$09                ;
                    BEQ   CODE_0DB800         ;
                    RTS                       ;

CODE_0DB800:        LDA.w $0236               ;
                    BNE   CODE_0DB809         ;
                    LDA.b #$90                ;
                    BRA   CODE_0DB80B         ;

CODE_0DB809:        LDA.b #$60                ;
CODE_0DB80B:        CMP.w $0399               ;
                    BEQ   CODE_0DB81B         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_0DB81B         ;
                    DEC.w $0241               ;
                    INC.w $0399               ;
CODE_0DB81B:        LDA.w $0399               ;
                    CMP.b #$08                ;
                    BCC   CODE_0DB86E         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DFDE1         ;
                    LDY.b #$00                ;
                    JSL.l CODE_0FE8BE         ;
                    LDA.w $03D1               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DB842         ;
                    LDX.b #$09                ;
                    JSR.w CODE_0DCCEA         ;
                    STA.w $0398               ;
                    STA.w $0399               ;
CODE_0DB842:        LDX.b #$0A                ;
                    LDA.b #$01                ;
                    LDY.b #$1B                ;
                    JSR.w CODE_0DEAFF         ;
                    LDY.b $02                 ;
                    CPY.b #$D0                ;
                    BCS   CODE_0DB86E         ;
                    LDA.w $0236               ;
                    BNE   CODE_0DB859         ;
                    TYA                       ;
                    BMI   CODE_0DB86E         ;
CODE_0DB859:        LDA.b ($06),y             ;
                    BNE   CODE_0DB86E         ;
                    LDA.b #$2F                ;
                    STA.b ($06),y             ;
                    TYA                       ;
                    BMI   CODE_0DB86E         ;
                    SEC                       ;
                    SBC.b #$10                ;
                    BEQ   CODE_0DB86E         ;
                    BMI   CODE_0DB86E         ;
                    TAY                       ;
                    BRA   CODE_0DB859         ;

CODE_0DB86E:        LDY.b $02                 ;
                    LDX.b $9E                 ;
                    RTS                       ;

                   db $0F,$07

CODE_0DB875:        LDA.b $5C
                    BEQ   CODE_0DB8E8         ;
                    LDX.b #$02                ;
CODE_0DB87B:        STX.b $9E                 ;
                    LDA.b $10,x               ;
                    BNE   CODE_0DB8D2         ;
                    LDA.w $07B8,x             ;
                    LDY.w $06CC               ;
                    AND.w $B873,y             ;
                    CMP.b #$06                ;
                    BCS   CODE_0DB8D2         ;
                    TAY                       ;
                    LDA.w $026B,y             ;
                    BEQ   CODE_0DB8D2         ;
                    LDA.w $027D,y             ;
                    BEQ   CODE_0DB8A0         ;
                    SBC.b #$00                ;
                    STA.w $027D,y             ;
                    BRA   CODE_0DB8D2         ;

CODE_0DB8A0:        LDA.w $0747               ;
                    BNE   CODE_0DB8D2         ;
                    LDA.b #$0E                ;
                    STA.w $027D,y             ;
                    LDA.w $026B,y             ;
                    STA.b $79,x               ;
                    LDA.w $0271,y             ;
                    STA.w $021A,x             ;
                    LDA.w $0277,y             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.b $29,x               ;
                    LDA.b #$09                ;
                    STA.w $0490,x             ;
                    LDA.b #$33                ;
                    STA.b $1C,x               ;
                    BRA   CODE_0DB8E5         ;

CODE_0DB8D2:        LDA.b $1C,x               ;
                    CMP.b #$33                ;
                    BNE   CODE_0DB8E5         ;
                    JSR.w CODE_0DDAFC         ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DB8E5         ;
                    JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DB8EB         ;
CODE_0DB8E5:        DEX                       ;
                    BPL   CODE_0DB87B         ;
CODE_0DB8E8:        RTS                       ;

                    CLC                       ;
                    INX                       ;
CODE_0DB8EB:        LDA.w $0747               ;
                    BNE   CODE_0DB943         ;
                    LDA.b $29,x               ;
                    BNE   CODE_0DB926         ;
                    LDA.w $03D1               ;
                    AND.b #$0C                ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DB952         ;
                    LDY.b #$01                ;
                    JSR.w CODE_0DE828         ;
                    BMI   CODE_0DB905         ;
                    INY                       ;
CODE_0DB905:        STY.b $47,x               ;
                    DEY                       ;
                    LDA.w $B8E9,y             ;
                    STA.b $5E,x               ;
                    LDA.b $00                 ;
                    ADC.b #$28                ;
                    CMP.b #$50                ;
                    BCC   CODE_0DB952         ;
                    LDA.b #$01                ;
                    STA.b $29,x               ;
                    LDA.b #$0A                ;
                    STA.w $0792,x             ;
                    LDA.b #$4A                ;
                    STA.w $1603               ;
                    JSR.w CODE_0DC06E         ;
CODE_0DB926:        LDA.w $03D1               ;
                    AND.b #$F0                ;
                    CMP.b #$F0                ;
                    BEQ   CODE_0DB952         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DB938         ;
                    JSR.w CODE_0DBF06         ;
CODE_0DB938:        LDA.w $0E67               ;
                    BNE   CODE_0DB943         ;
                    JSR.w CODE_0DBEA0         ;
                    JSR.w CODE_0DBFED         ;
CODE_0DB943:        JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DE948         ;
                    JSR.w CODE_0DDD7D         ;
                    JMP.w CODE_0DEE40         ;

CODE_0DB952:        JSR.w CODE_0DCCEA         ;
                    RTS                       ;

                    db $04,$04,$04,$05,$05,$05,$06,$06
                    db $06,$10,$F0

CODE_0DB961:        LDA.w $07B8               ;0 S:01FF P:EnvMXdizc HC:7566 VC:000 FC:00 I:00
                    AND.b #$07                ;0 S:01FF P:EnvMXdizc HC:7582 VC:000 FC:00 I:00
                    BNE   CODE_0DB96D         ;0 S:01FF P:EnvMXdizc HC:7598 VC:000 FC:00 I:00
                    LDA.w $07B8               ;0 S:01FF P:EnvMXdizc HC:7614 VC:000 FC:00 I:00
                    AND.b #$08                ;0 S:01FF P:EnvMXdizc HC:7630 VC:000 FC:00 I:00
CODE_0DB96D:        TAY                       ;
                    LDA.w $39,y             ;
                    BNE   CODE_0DB98C         ;
                    LDX.w $B956,y             ;
                    LDA.b $10,x               ;
                    BNE   CODE_0DB98C         ;
                    LDX.b $9E                 ;
                    TXA                       ;
                    STA.w $06AE,y             ;
                    LDA.b #$90                ;
                    STA.w $39,y             ;
                    LDA.b #$07                ;
                    STA.w $049C,y             ;
                    SEC                       ;
                    RTS                       ;

CODE_0DB98C:        LDX.b $9E                 ;
                    CLC                       ;
                    RTS                       ;

CODE_0DB990:        LDA.w $0747               ;
                    BEQ   CODE_0DB998         ;
                    JMP.w CODE_0DBA1E         ;

CODE_0DB998:        LDA.b $39,x               ;
                    AND.b #$7F                ;
                    LDY.w $06AE,x             ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DB9C3         ;
                    BCS   CODE_0DB9D9         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$11                ;
                    TAX                       ;
                    LDA.b #$10                ;
                    STA.b $00                 ;
                    LDA.b #$0F                ;
                    STA.b $01                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDA.b #$00                ;
                    JSR.w CODE_0DBF7E         ;
                    JSR.w CODE_0DBEAD         ;
                    LDX.b $9E                 ;
                    JMP.w CODE_0DBA1B         ;

CODE_0DB9C3:        LDA.b #$FE                ;
                    STA.b $B1,x               ;
                    LDA.w $29,y             ;
                    AND.b #$F7                ;
                    STA.w $29,y             ;
                    LDX.b $47,y               ;
                    DEX                       ;
                    LDA.w $B95F,x             ;
                    LDX.b $9E                 ;
                    STA.b $6E,x               ;
CODE_0DB9D9:        DEC.b $39,x               ;
                    LDA.b $39,x               ;
                    CMP.b #$81                ;
                    BNE   CODE_0DB9E6         ;
                    LDA.b #$37                ;
                    STA.w $1600               ;
CODE_0DB9E6:        LDA.w $1C,y             ;
                    CMP.b #$2D                ;
                    BNE   CODE_0DB9F1         ;
                    LDA.b #$08                ;
                    BRA   CODE_0DB9FE         ;

CODE_0DB9F1:        LDA.w $47,y             ;
                    CMP.b #$02                ;
                    BNE   CODE_0DB9FC         ;
                    LDA.b #$06                ;
                    BRA   CODE_0DB9FE         ;

CODE_0DB9FC:        LDA.b #$02                ;
CODE_0DB9FE:        CLC                       ;
                    ADC.w $021A,y             ;
                    STA.w $022A,x             ;
                    LDA.w $79,y             ;
                    ADC.b #$00                ;
                    STA.b $89,x               ;
                    LDA.w $0238,y             ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    STA.w $0248,x             ;
                    LDA.b #$01                ;
                    STA.b $CC,x               ;
                    BNE   CODE_0DBA1E         ;
CODE_0DBA1B:        JSR.w CODE_0DDCD9         ;
CODE_0DBA1E:        JSR.w CODE_0DFDCD         ;
                    JSR.w CODE_0DFD46         ;
                    JSR.w CODE_0DE93B         ;
                    JSL.l CODE_0FEB53         ;
                    RTS                       ;

CODE_0DBA2C:        JSR.w CODE_0DBA7A         ;
                    LDA.b $85,x               ;
                    STA.w $89,y             ;
                    LDA.w $0226,x             ;
                    ORA.b #$05                ;
                    STA.w $022A,y             ;
                    LDA.w $0244,x             ;
                    SBC.b #$10                ;
                    STA.w $0248,y             ;
                    BRA   CODE_0DBA61         ;

CODE_0DBA46:        JSR.w CODE_0DBA7A         ;
                    LDA.w $03EC,x             ;
                    STA.w $89,y             ;
                    LDA.b $06                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$05                ;
                    STA.w $022A,y             ;
                    LDA.b $02                 ;
                    ADC.b #$20                ;
                    STA.w $0248,y             ;
CODE_0DBA61:        LDA.b #$FB                ;
                    STA.w $B1,y             ;
                    LDA.b #$01                ;
                    STA.w $CC,y             ;
                    STA.w $39,y             ;
                    STA.w $1603               ;
                    STX.b $9E                 ;
                    JSR.w CODE_0DBAFF         ;
                    INC.w $0748               ;
                    RTS                       ;

CODE_0DBA7A:        LDY.b #$08                ;
CODE_0DBA7C:        LDA.w $39,y             ;
                    BEQ   CODE_0DBA88         ;
                    DEY                       ;
                    CPY.b #$05                ;
                    BNE   CODE_0DBA7C         ;
                    LDY.b #$08                ;
CODE_0DBA88:        STY.w $06B7               ;
                    RTS                       ;

CODE_0DBA8C:        LDX.b #$08                ;
CODE_0DBA8E:        STX.b $9E                 ;
                    LDA.b $39,x               ;
                    BEQ   CODE_0DBAF5         ;
                    ASL   A                   ;
                    BCC   CODE_0DBA9D         ;
                    JSR.w CODE_0DB990         ;
                    JMP.w CODE_0DBAF5         ;

CODE_0DBA9D:        LDY.b $39,x               ;
                    DEY                       ;
                    BEQ   CODE_0DBAC1         ;
                    INC.b $39,x               ;
                    LDA.w $022A,x             ;
                    CLC                       ;
                    ADC.w $0775               ;
                    STA.w $022A,x             ;
                    LDA.b $89,x               ;
                    ADC.b #$00                ;
                    STA.b $89,x               ;
                    LDA.b $39,x               ;
                    CMP.b #$30                ;
                    BNE   CODE_0DBAE0         ;
                    LDA.b #$00                ;
                    STA.b $39,x               ;
                    JMP.w CODE_0DBAF5         ;

CODE_0DBAC1:        TXA                       ;
                    CLC                       ;
                    ADC.b #$11                ;
                    TAX                       ;
                    LDA.b #$50                ;
                    STA.b $00                 ;
                    LDA.b #$06                ;
                    STA.b $02                 ;
                    LSR   A                   ;
                    STA.b $01                 ;
                    LDA.b #$00                ;
                    JSR.w CODE_0DBF7E         ;
                    LDX.b $9E                 ;
                    LDA.b $B1,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_0DBAE0         ;
                    INC.b $39,x               ;
CODE_0DBAE0:        LDA.b $B1,x               ;
                    BNE   CODE_0DBAE8         ;
                    JSL.l CODE_0FEACA         ;
CODE_0DBAE8:        JSR.w CODE_0DFD46         ;
                    JSR.w CODE_0DFDCD         ;
                    JSR.w CODE_0DE93B         ;
                    JSL.l CODE_0FEAEC         ;
CODE_0DBAF5:        DEX                       ;
                    BPL   CODE_0DBA8E         ;
                    RTS                       ;

                    db $17,$1D,$0B,$11,$02,$13

CODE_0DBAFF:        LDA.b #$01                ;
                    STA.w $014A               ;
                    LDY.w $BAF9               ;
                    JSR.w CODE_0D98AA         ;
                    INC.w $075E               ;
                    LDA.w $075E               ;
                    CMP.b #$64                ;
                    BNE   CODE_0DBB22         ;
                    LDA.b #$00                ;
                    STA.w $075E               ;
                    JSL.l CODE_048596         ;Increase lives by one
                    LDA.b #$05                ;
                    STA.w $1603               ;
CODE_0DBB22:        LDA.b #$02                ;
                    STA.w $0149               ;
CODE_0DBB27:        LDY.w $BAFB               ;
                    JSR.w CODE_0D98AA         ;
CODE_0DBB2D:        LDA.w $BAFD               ;
CODE_0DBB30:        JSR.w CODE_0D983D         ;
                    LDY.w $1700               ;
                    LDA.w $16F6,y             ;
                    BNE   CODE_0DBB49         ;
                    LDA.b #$28                ;
                    LDX.w $16F2,y             ;
                    CPX.b #$02                ;
                    BNE   CODE_0DBB46         ;
                    LDA.b #$24                ;
CODE_0DBB46:        STA.w $16F6,y             ;
CODE_0DBB49:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DBB4C:        LDA.b #$2E                ;
                    STA.b $25                 ;
                    LDA.b $85,x               ;
                    STA.b $82                 ;
                    LDA.w $0226,x             ;
                    STA.w $0223               ;
                    LDA.b #$01                ;
                    STA.b $C5                 ;
                    LDA.w $0244,x             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0241               ;
CODE_0DBB67:        LDA.b #$01                ;
                    STA.b $32                 ;
                    STA.b $19                 ;
                    LDA.b #$03                ;
                    STA.w $0499               ;
                    LDA.w $020C               ;
                    CMP.b #$02                ;
                    BCS   CODE_0DBB84         ;
                    LDA.w $0756               ;
                    CMP.b #$02                ;
                    BCC   CODE_0DBB81         ;
                    LSR   A                   ;
CODE_0DBB81:        STA.w $020C               ;
CODE_0DBB84:        LDA.b #$30                ;
                    STA.w $0260               ;
                    LDA.b #$02                ;
                    STA.w $1603               ;
                    RTS                       ;

CODE_0DBB8F:        LDX.b #$09                ;
                    STX.b $9E                 ;
                    LDA.b $32                 ;
                    BNE   CODE_0DBB9A         ;
                    JMP.w CODE_0DBC46         ;

CODE_0DBB9A:        ASL   A                   ;
                    BCC   CODE_0DBBC9         ;
                    LDA.w $0747               ;
                    BNE   CODE_0DBBF2         ;
                    LDA.w $020C               ;
                    BEQ   CODE_0DBBC0         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DBBC0         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DBBC0         ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DBBC0         ;
                    CMP.b #$02                ;
                    BNE   CODE_0DBBF2         ;
                    JSR.w CODE_0DCE92         ;
                    JSR.w CODE_0DE84D         ;
                    JMP.w CODE_0DBBF2         ;

CODE_0DBBC0:        JSR.w CODE_0DCE10         ;
                    JSR.w CODE_0DE68D         ;
                    JMP.w CODE_0DBBF2         ;

CODE_0DBBC9:        LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_0DBBE9         ;
                    DEC.w $0241               ;
                    LDA.b $32                 ;
                    INC.b $32                 ;
                    CMP.b #$11                ;
                    BCC   CODE_0DBBE9         ;
                    LDA.b #$10                ;
                    STA.b $5E,x               ;
                    LDA.b #$80                ;
                    STA.b $32                 ;
                    ASL   A                   ;
                    STA.w $0260               ;
                    ROL   A                   ;
                    STA.b $47,x               ;
CODE_0DBBE9:        LDA.b $32                 ;
                    CMP.b #$06                ;
                    BCS   CODE_0DBBF2         ;
                    JMP.w CODE_0DBC46         ;

CODE_0DBBF2:        JMP.w CODE_0DBC34         ;

                    LDA.b $79,x               ;
                    STA.b $E9                 ;
                    LDA.w $021A,x             ;
                    STA.b $E8                 ;
                    REP   #$20                ;
                    LDA.b $E8                 ;
                    CMP.b $42                 ;
                    BCS   CODE_0DBC17         ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    STA.b $E6                 ;
                    SEP   #$20                ;
                    LDA.b $E6                 ;
                    STA.w $021A,x             ;
                    LDA.b $E7                 ;
                    STA.b $79,x               ;
CODE_0DBC17:        SEP   #$20                ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DE948         ;
                    JSR.w CODE_0DEC50         ;
                    JSR.w CODE_0DDD7D         ;
                    JSR.w CODE_0DDAFC         ;
                    LDA.b $E8                 ;
                    STA.w $021A,x             ;
                    LDA.b $E9                 ;
                    STA.b $79,x               ;
CODE_0DBC34:        JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DE948         ;
                    JSR.w CODE_0DEC50         ;
                    JSR.w CODE_0DDD7D         ;
                    JSR.w CODE_0DDAFC         ;
CODE_0DBC46:        RTS                       ;

                    TSB.b $12                 ;
CODE_0DBC49:        PHA                       ;
                    LDA.b #$11                ;
                    LDX.w $03F0               ;
                    LDY.w $0754               ;
                    BNE   CODE_0DBC56         ;
                    LDA.b #$12                ;
CODE_0DBC56:        STA.b $35,x               ;
                    JSR.w CODE_0D9061         ;
                    LDX.w $03F0               ;
                    LDA.b $02                 ;
                    STA.w $03E6,x             ;
                    TAY                       ;
                    LDA.b $06                 ;
                    STA.w $03E8,x             ;
                    LDA.b ($06),y             ;
                    JSR.w CODE_0DBD83         ;
                    STA.b $00                 ;
                    LDY.w $0754               ;
                    BNE   CODE_0DBC76         ;
                    TYA                       ;
CODE_0DBC76:        BCC   CODE_0DBC9D         ;
                    LDY.b #$11                ;
                    STY.b $35,x               ;
                    LDA.b #$FD                ;
                    LDY.b $00                 ;
                    CPY.b #$54                ;
                    BEQ   CODE_0DBC88         ;
                    CPY.b #$5A                ;
                    BNE   CODE_0DBC9D         ;
CODE_0DBC88:        LDA.w $06BC               ;
                    BNE   CODE_0DBC95         ;
                    LDA.b #$0B                ;
                    STA.w $07AD               ;
                    INC.w $06BC               ;
CODE_0DBC95:        LDA.w $07AD               ;
                    BNE   CODE_0DBC9C         ;
                    LDY.b #$FD                ;
CODE_0DBC9C:        TYA                       ;
CODE_0DBC9D:        STA.w $03EA,x             ;
                    JSR.w CODE_0DBCE2         ;
                    LDY.b $02                 ;
                    LDA.b #$2C                ;
                    STA.b ($06),y             ;
                    LDA.b #$10                ;
                    STA.w $078C               ;
                    PLA                       ;
                    STA.b $05                 ;
                    LDY.b #$00                ;
                    LDA.w $0714               ;
                    BNE   CODE_0DBCBD         ;
                    LDA.w $0754               ;
                    BEQ   CODE_0DBCBE         ;
CODE_0DBCBD:        INY                       ;
CODE_0DBCBE:        LDA.w $0237               ;
                    CLC                       ;
                    ADC.w $BC47,y             ;
                    AND.b #$F0                ;
                    STA.w $0244,x             ;
                    LDY.b $35,x               ;
                    CPY.b #$11                ;
                    BEQ   CODE_0DBCD6         ;
                    JSR.w CODE_0DBD8F         ;
                    JMP.w CODE_0DBCD9         ;

CODE_0DBCD6:        JSR.w CODE_0DBD01         ;
CODE_0DBCD9:        LDA.w $03F0               ;
                    EOR.b #$01                ;
                    STA.w $03F0               ;
                    RTS                       ;

CODE_0DBCE2:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    AND.b #$F0                ;
                    STA.w $0226,x             ;
                    STA.w $0E16               ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    STA.b $85,x               ;
                    STA.w $03EC,x             ;
                    STA.w $0E17               ;
                    LDA.b $BB                 ;
                    STA.b $C8,x               ;
                    RTS                       ;

CODE_0DBD01:        JSR.w CODE_0DBDB4         ;
                    LDA.b #$01                ;
                    STA.w $1600               ;
                    LDA.b #$00                ;
                    STA.b $6A,x               ;
                    STA.w $0449,x             ;
                    STA.b $A0                 ;
                    LDA.b #$FE                ;
                    STA.b $AD,x               ;
                    LDA.b $05                 ;
                    JSR.w CODE_0DBD83         ;
                    BCC   CODE_0DBD6D         ;
                    TYA                       ;
                    CMP.b #$0D                ;
                    BCC   CODE_0DBD24         ;
                    SBC.b #$06                ;
CODE_0DBD24:        ASL   A                   ;
                    TAY                       ;
                    LDA.w $BD33,y             ;
                    STA.b $04                 ;
                    LDA.w $BD34,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DBD51
                    dw CODE_0DBD59
                    dw CODE_0DBA2C
                    dw CODE_0DBA2C
                    dw CODE_0DBD5D
                    dw CODE_0DBD59
                    dw CODE_0DBD51
                    dw CODE_0DBD51
                    dw CODE_0DBD59
                    dw CODE_0DBD65
                    dw CODE_0DBD55
                    dw CODE_0DBA2C
                    dw CODE_0DBD5D
                    dw CODE_0DBD65
                    dw CODE_0DBD55

CODE_0DBD51:        LDA.b #$00                ;
                    BRA   CODE_0DBD5F         ;

CODE_0DBD55:        LDA.b #$02                ;
                    BRA   CODE_0DBD5F         ;

CODE_0DBD59:        LDA.b #$04                ;
                    BRA   CODE_0DBD5F         ;

CODE_0DBD5D:        LDA.b #$03                ;
CODE_0DBD5F:        STA.w $020C               ;
                    JMP.w CODE_0DBB4C         ;

CODE_0DBD65:        LDX.b #$09                ;
                    LDY.w $03F0               ;
                    JSR.w CODE_0DB7C9         ;
CODE_0DBD6D:        RTS                       ;

                    db $E8,$E9,$E7,$5C,$5D,$5E,$5F,$50
                    db $51,$52,$53,$54,$55,$56,$57,$58
                    db $59,$5A,$5B,$60,$61

CODE_0DBD83:        LDY.b #$14                ;
CODE_0DBD85:        CMP.w $BD6E,y             ;
                    BEQ   CODE_0DBD8E         ;
                    DEY                       ;
                    BPL   CODE_0DBD85         ;
                    CLC                       ;
CODE_0DBD8E:        RTS                       ;

CODE_0DBD8F:        JSR.w CODE_0DBDB4         ;
                    LDA.b #$01                ;
                    STA.w $03EE,x             ;
                    LDA.w $1603               ;
                    BNE   CODE_0DBDA1         ;
                    LDA.b #$07                ;
                    STA.w $1603               ;
CODE_0DBDA1:        JSR.w CODE_0DBDDB         ;
                    LDA.b #$FE                ;
                    STA.b $A0                 ;
                    LDA.b #$05                ;
                    STA.w $014A               ;
                    JSR.w CODE_0DBB27         ;
                    LDX.w $03F0               ;
                    RTS                       ;

CODE_0DBDB4:        LDX.w $03F0               ;
                    LDY.b $02                 ;
                    BEQ   CODE_0DBDDA         ;
                    TYA                       ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.b $02                 ;
                    TAY                       ;
                    LDA.b ($06),y             ;
                    CMP.b #$EA                ;
                    BNE   CODE_0DBDDA         ;
                    LDA.b #$00                ;
                    STA.b ($06),y             ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
                    JSR.w CODE_0D9046         ;
                    LDX.w $03F0               ;
                    JSR.w CODE_0DBA46         ;
CODE_0DBDDA:        RTS                       ;

CODE_0DBDDB:        LDA.w $0226,x             ;
                    STA.w $03F3,x             ;
                    LDA.b #$F0                ;
                    STA.b $6A,x               ;
                    STA.b $6C,x               ;
                    LDA.b #$FA                ;
                    STA.b $AD,x               ;
                    LDA.b #$FC                ;
                    STA.b $AF,x               ;
                    LDA.b #$00                ;
                    STA.w $0449,x             ;
                    STA.w $044B,x             ;
                    LDA.b $85,x               ;
                    STA.b $87,x               ;
                    LDA.w $0226,x             ;
                    STA.w $0228,x             ;
                    LDA.w $0244,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0246,x             ;
                    LDA.b #$FA                ;
                    STA.b $AD,x               ;
                    RTS                       ;

CODE_0DBE0F:        LDA.b $35,x               ;
                    BEQ   CODE_0DBE76         ;
                    AND.b #$0F                ;
                    PHA                       ;
                    TAY                       ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$0D                ;
                    TAX                       ;
                    DEY                       ;
                    BEQ   CODE_0DBE55         ;
                    JSR.w CODE_0DBF46         ;
                    JSR.w CODE_0DBEAD         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$02                ;
                    TAX                       ;
                    JSR.w CODE_0DBF46         ;
                    JSR.w CODE_0DBEAD         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0DFD56         ;
                    JSR.w CODE_0DFDE7         ;
                    JSR.w CODE_0DF39C         ;
                    PLA                       ;
                    LDY.b $C8,x               ;
                    BEQ   CODE_0DBE76         ;
                    PHA                       ;
                    LDA.b #$F0                ;
                    CMP.w $0246,x             ;
                    BCS   CODE_0DBE4B         ;
                    STA.w $0246,x             ;
CODE_0DBE4B:        LDA.w $0244,x             ;
                    CMP.b #$F0                ;
                    PLA                       ;
                    BCC   CODE_0DBE76         ;
                    BCS   CODE_0DBE74         ;
CODE_0DBE55:        JSR.w CODE_0DBF46         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0DFD56         ;
                    JSR.w CODE_0DFDE7         ;
                    JSR.w CODE_0DF348         ;
                    PLA                       ;
                    STA.b $35,x               ;
                    LDA.w $0244,x             ;
                    AND.b #$0F                ;
                    CMP.b #$05                ;
                    BCS   CODE_0DBE76         ;
                    LDA.b #$01                ;
                    STA.w $03EE,x             ;
CODE_0DBE74:        STZ.b $35,x               ;
CODE_0DBE76:        RTS                       ;

CODE_0DBE77:        LDX.b #$01                ;
CODE_0DBE79:        STX.b $9E                 ;
                    LDA.w $03EE,x             ;
                    BEQ   CODE_0DBE9C         ;
                    LDA.w $03E8,x             ;
                    STA.b $06                 ;
                    LDA.b #$05                ;
                    STA.b $07                 ;
                    LDA.w $03E6,x             ;
                    STA.b $02                 ;
                    TAY                       ;
                    LDA.w $03EA,x             ;
                    STA.b ($06),y             ;
                    JSR.w CODE_0D9057         ;
                    LDA.b #$00                ;
                    STA.w $03EE,x             ;
CODE_0DBE9C:        DEX                       ;
                    BPL   CODE_0DBE79         ;
                    RTS                       ;

CODE_0DBEA0:        INX                       ;
                    JSR.w CODE_0DBEAD         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DBEA7:        LDA.w $070E               ;
                    BNE   CODE_0DBEEF         ;
                    TAX                       ;
CODE_0DBEAD:        LDA.b $5D,x               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $01                 ;
                    LDA.b $5D,x               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$08                ;
                    BCC   CODE_0DBEC1         ;
                    ORA.b #$F0                ;
CODE_0DBEC1:        STA.b $00                 ;
                    STA.w $0EB6               ;
                    LDY.b #$00                ;
                    CMP.b #$00                ;
                    BPL   CODE_0DBECD         ;
                    DEY                       ;
CODE_0DBECD:        STY.b $02                 ;
                    LDA.w $0401,x             ;
                    CLC                       ;
                    ADC.b $01                 ;
                    STA.w $0401,x             ;
                    LDA.b #$00                ;
                    ROL   A                   ;
                    PHA                       ;
                    ROR   A                   ;
                    LDA.w $0219,x             ;
                    ADC.b $00                 ;
                    STA.w $0219,x             ;
                    LDA.b $78,x               ;
                    ADC.b $02                 ;
                    STA.b $78,x               ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b $00                 ;
CODE_0DBEEF:        RTS                       ;

CODE_0DBEF0:        LDX.b #$00                ;
                    LDA.w $0747               ;
                    BNE   CODE_0DBEFC         ;
                    LDA.w $070E               ;
                    BNE   CODE_0DBEEF         ;
CODE_0DBEFC:        LDA.w $0709               ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    JMP.w CODE_0DBF4F         ;

CODE_0DBF06:        LDY.b #$3D                ;
                    LDA.b $29,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_0DBF35         ;
CODE_0DBF0E:        LDY.b #$20                ;
                    BRA   CODE_0DBF35         ;

CODE_0DBF12:        LDY.b #$00                ;
                    BRA   CODE_0DBF18         ;

CODE_0DBF16:        LDY.b #$01                ;
CODE_0DBF18:        INX                       ;
                    LDA.b #$03                ;
                    STA.b $00                 ;
                    LDA.b #$06                ;
                    STA.b $01                 ;
                    LDA.b #$02                ;
                    STA.b $02                 ;
                    TYA                       ;
                    JMP.w CODE_0DBF74         ;

CODE_0DBF29:        LDY.b #$7F                ;
                    BNE   CODE_0DBF2F         ;
CODE_0DBF2D:        LDY.b #$0F                ;
CODE_0DBF2F:        LDA.b #$02                ;
                    BNE   CODE_0DBF37         ;
CODE_0DBF33:        LDY.b #$1C                ;
CODE_0DBF35:        LDA.b #$03                ;
CODE_0DBF37:        STY.b $00                 ;
                    INX                       ;
                    JSR.w CODE_0DBF4F         ;
                    LDX.b $9E                 ;
                    RTS                       ;

                    ASL.b $08                 ;
                    LDY.b #$00                ;
                    BRA   CODE_0DBF46         ;

CODE_0DBF46:        LDY.b #$01                ;
                    LDA.b #$50                ;
                    STA.b $00                 ;
                    LDA.w $BF40,y             ;
CODE_0DBF4F:        STA.b $02                 ;
                    LDA.b #$00                ;
                    JMP.w CODE_0DBF7E         ;

CODE_0DBF56:        LDA.b #$00                ;
                    BRA   CODE_0DBF5C         ;

CODE_0DBF5A:        LDA.b #$01                ;
CODE_0DBF5C:        PHA                       ;
                    LDY.b $1C,x               ;
                    INX                       ;
                    LDA.b #$05                ;
                    CPY.b #$29                ;
                    BNE   CODE_0DBF68         ;
                    LDA.b #$09                ;
CODE_0DBF68:        STA.b $00                 ;
                    LDA.b #$0A                ;
                    STA.b $01                 ;
                    LDA.b #$03                ;
                    STA.b $02                 ;
                    PLA                       ;
                    TAY                       ;
CODE_0DBF74:        JSR.w CODE_0DBF7E         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DBF7A:        JSR.w CODE_0DBF7E         ;
                    RTL                       ;

CODE_0DBF7E:        PHA                       ;
                    LDA.w $041C,x             ;
                    CLC                       ;
                    ADC.w $043C,x             ;
                    STA.w $041C,x             ;
                    LDY.b #$00                ;
                    LDA.b $A0,x               ;
                    BPL   CODE_0DBF90         ;
                    DEY                       ;
CODE_0DBF90:        STY.b $07                 ;
                    ADC.w $0237,x             ;
                    STA.w $0237,x             ;
                    LDA.b $BB,x               ;
                    ADC.b $07                 ;
                    STA.b $BB,x               ;
                    LDA.w $043C,x             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $043C,x             ;
                    LDA.b $A0,x               ;
                    ADC.b #$00                ;
                    STA.b $A0,x               ;
                    CMP.b $02                 ;
                    BMI   CODE_0DBFBF         ;
                    LDA.w $043C,x             ;
                    CMP.b #$80                ;
                    BCC   CODE_0DBFBF         ;
                    LDA.b $02                 ;
                    STA.b $A0,x               ;
                    STZ.w $043C,x             ;
CODE_0DBFBF:        PLA                       ;
                    BEQ   CODE_0DBFEC         ;
                    LDA.b $02                 ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $07                 ;
                    LDA.w $043C,x             ;
                    SEC                       ;
                    SBC.b $01                 ;
                    STA.w $043C,x             ;
                    LDA.b $A0,x               ;
                    SBC.b #$00                ;
                    STA.b $A0,x               ;
                    CMP.b $07                 ;
                    BPL   CODE_0DBFEC         ;
                    LDA.w $043C,x             ;
                    CMP.b #$80                ;
                    BCS   CODE_0DBFEC         ;
                    LDA.b $07                 ;
                    STA.b $A0,x               ;
                    LDA.b #$FF                ;
                    STA.w $043C,x             ;
CODE_0DBFEC:        RTS                       ;

CODE_0DBFED:        LDA.w $0E9D,x             ;
                    BEQ   CODE_0DC054         ;
                    INC.w $0EA2,x             ;
                    LDA.w $0EA2,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DC055         ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$40                ;
                    STA.b $E4                 ;
                    LDA.w $0EAC,x             ;
                    STA.b $E5                 ;
                    LDA.w $0EA7,x             ;
                    STA.b $E6                 ;
                    REP   #$20                ;
                    LDA.b $E5                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    PHA                       ;
                    LDA.w $0EB5               ;
                    BMI   CODE_0DC023         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    BRA   CODE_0DC028         ;

CODE_0DC023:        PLA                       ;
                    SEC                       ;
                    SBC.w #$000C              ;
CODE_0DC028:        STA.b $E5                 ;
                    SEP   #$20                ;
                    PHY                       ;
                    LDY.w $0B46,x             ;
                    LDA.b $E5                 ;
                    STA.w $0900,y             ;
                    LDA.w $0EB1,x             ;
                    STA.w $0901,y             ;
                    LDA.b $E4                 ;
                    STA.w $0902,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    LDA.b $E6                 ;
                    BEQ   CODE_0DC053         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
CODE_0DC053:        PLY                       ;
CODE_0DC054:        RTS                       ;

CODE_0DC055:        STZ.w $0E9D,x             ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $E8                 ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $E8                 ;
                    PHX                       ;
                    TAX                       ;
                    LDA.b #$F0                ;
                    STA.w $0901,x             ;
                    STZ.w $0D00,x             ;
                    PLX                       ;
                    RTS                       ;

CODE_0DC06E:        STA.w $0E9D,x             ;
                    STZ.w $0EA2,x             ;
                    LDA.w $021A,x             ;
                    STA.w $0EAC,x             ;
                    LDA.b $79,x               ;
                    STA.w $0EA7,x             ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0EB1,x             ;
                    RTS                       ;

CODE_0DC089:        LDA.w $0E7F               ;
                    LSR   A                   ;
                    BCC   CODE_0DC0D4         ;
                    LDA.w $1201               ;
                    BMI   CODE_0DC0CA         ;
                    DEC.w $1201               ;
                    BNE   CODE_0DC100         ;
                    LDA.b #$80                ;
                    STA.w $2100               ;
                    STA.w $1201               ;
                    STZ.w $420C               ;
                    STZ.w $1203               ;
                    STZ.w $0B75               ;
                    STZ.w $1680               ;
                    LDA.l $701FF2             ;
                    BEQ   CODE_0DC0C0         ;
                    LDA.w $0EC8               ;
                    BNE   CODE_0DC0BC         ;
                    JML.l CODE_008139         ;

CODE_0DC0BC:        JML.l CODE_0080DE         ;

CODE_0DC0C0:        JSL.l CODE_048000         ;
                    JSR.w CODE_0DC124         ;
                    JSR.w CODE_0DC14F         ;
CODE_0DC0CA:        STZ.w $0E7F               ;
                    LDA.b #$01                ;
                    STA.w $0774               ;
                    BRA   CODE_0DC100         ;

CODE_0DC0D4:        LDA.w $0E66               ;
                    BNE   CODE_0DC0E4         ;
                    LDA.b $0E                 ;
                    BNE   CODE_0DC0E4         ;
                    LDA.b #$01                ;
                    STA.b $0E                 ;
                    JSR.w CODE_0DAB99         ;
CODE_0DC0E4:        STZ.w $0E67               ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BEQ   CODE_0DC0F8         ;
                    INC.w $1201               ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DC100         ;
CODE_0DC0F8:        STZ.w $0E7F               ;
                    STZ.w $0774               ;
                    STZ.b $0E                 ;
CODE_0DC100:        LDA.w $0E4F               ;
                    BEQ   CODE_0DC123         ;
                    JSR.w CODE_0DC124         ;
                    LDA.w $1201               ;
                    EOR.b #$0F                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$0F                ;
                    STA.w $0E7E               ;
                    JSR.w CODE_0DC13D         ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DC123         ;
                    STZ.w $0E4F               ;
CODE_0DC123:        RTS                       ;

CODE_0DC124:        PHX                       ;
                    LDX.b #$00                ;
                    LDA.b #$F0                ;
CODE_0DC129:        STA.w $0801,x             ;
                    STA.w $0901,x             ;
                    STZ.w $0C00,x             ;
                    STZ.w $0D00,x             ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    BNE   CODE_0DC129         ;
                    PLX                       ;
                    RTS                       ;

CODE_0DC13D:        PHY                       ;
                    LDY.b #$D0                ;
                    LDA.b #$F0                ;
CODE_0DC142:        STA.w $0801,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$F0                ;
                    BNE   CODE_0DC142         ;
                    PLY                       ;
                    RTS                       ;

CODE_0DC14F:        JSL.l CODE_00D52E         ;
                    STZ.w $0BA5               ;
                    STZ.w $0F06               ;
                    STZ.w $0EC4               ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DC167         ;
                    CMP.b #$0C                ;
                    BNE   CODE_0DC16C         ;
CODE_0DC167:        LDA.b #$01                ;
                    STA.w $0EC4               ;
CODE_0DC16C:        STZ.w $0ED1               ;
                    STZ.w $0E40               ;
                    STZ.w $0E41               ;
                    STZ.w $0E42               ;
                    STZ.w $0EDC               ;
                    STZ.w $0ECF               ;
                    LDA.b #$01                ;
                    STA.w $0ECE               ;
                    LDA.w $0E66               ;
                    BNE   CODE_0DC196         ;
                    LDA.w $0237               ;
                    STA.w $03B8               ;
                    LDA.w $0219               ;
                    STA.w $03AD               ;
                    BRA   CODE_0DC199         ;

CODE_0DC196:        STZ.w $0E66               ;
CODE_0DC199:        STZ.b $0E                 ;
                    RTS                       ;

                    db $00,$00,$FF,$7F,$63,$0C,$55,$01
                    db $1C,$1A,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$2F,$15,$14,$00,$19,$0C
                    db $9F,$1C,$2E,$76,$68,$5D,$E6,$44
                    db $BC,$45,$A5,$14,$FF,$7F,$3F,$02
                    db $DB,$01,$36,$01,$BF,$3A,$9C,$2D
                    db $00,$00,$3F,$5B,$76,$69,$F0,$50
                    db $8B,$3C,$36,$01,$DB,$01,$3F,$02
                    db $BC,$45,$FF,$7F,$A5,$14,$92,$00
                    db $98,$00,$9F,$00,$9C,$2D,$BF,$3A
                    db $00,$00,$2F,$15,$95,$2C,$3A,$41
                    db $DF,$55,$1F,$03,$7A,$02,$D5,$01
                    db $BC,$45,$A5,$14,$FF,$7F,$DF,$55
                    db $3A,$41,$95,$2C,$BF,$3A,$9C,$2D
                    db $00,$00,$3F,$5B,$7F,$21,$D9,$14
                    db $53,$04,$00,$02,$E0,$02,$E0,$03
                    db $00,$00,$FF,$7F,$63,$0C,$55,$01
                    db $1C,$1A,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$2F,$15,$60,$1E,$04,$33
                    db $88,$43,$55,$76,$90,$71,$CA,$58

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF

CODE_0DC250:        BIT.b $10,x               ;
                    BMI   CODE_0DC267         ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DC25B         ;
                    JMP.w CODE_0DCBB0         ;

CODE_0DC25B:        LDA.w $071F               ;
                    AND.b #$07                ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DC273         ;
                    JMP.w CODE_0DC2E9         ;

CODE_0DC267:        LDA.b $10,x               ;
                    AND.b #$0F                ;
                    TAY                       ;
                    LDA.w $10,y             ;
                    BNE   CODE_0DC273         ;
                    STA.b $10,x               ;
CODE_0DC273:        RTS                       ;

                    db $02,$02,$02,$02,$05,$05,$05,$05
                    db $06,$07,$07,$04,$03,$05,$08,$09
                    db $03,$06,$07,$0A,$05,$05,$0B,$05
                    db $B0,$B0,$40,$30,$B0,$30,$B0,$B0
                    db $F0,$F0,$B0,$F0,$02,$02,$02,$02
                    db $02,$02,$02,$02,$01,$01,$01,$01

CODE_0DC2A4:        LDA.b $78                 ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.b $78                 ;
                    LDA.w $0725               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $0725               ;
                    LDA.w $071A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $071A               ;
                    LDA.w $071B               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $071B               ;
                    LDA.w $072A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $072A               ;
                    STZ.w $073B               ;
                    STZ.w $072B               ;
                    STZ.w $0739               ;
                    STZ.w $073A               ;
                    PHX                       ;
                    TYX                       ;
                    LDA.l $0EC4E0,x           ;
                    STA.w $072C               ;
                    STZ.w $0EDB               ;
                    PLX                       ;
                    RTS                       ;

CODE_0DC2E9:        LDA.w $0745               ;
                    BEQ   CODE_0DC354         ;
                    LDA.w $0726               ;
                    BNE   CODE_0DC354         ;
                    LDY.b #$0C                ;
CODE_0DC2F5:        DEY                       ;
                    BMI   CODE_0DC354         ;
                    LDA.w $075F               ;
                    CMP.w $C274,y             ;
                    BNE   CODE_0DC2F5         ;
                    LDA.w $0725               ;
                    CMP.w $C280,y             ;
                    BNE   CODE_0DC2F5         ;
                    LDA.w $0237               ;
                    CMP.w $C28C,y             ;
                    BNE   CODE_0DC325         ;
                    LDA.b $28                 ;
                    CMP.b #$00                ;
                    BNE   CODE_0DC325         ;
                    INC.w $06D9               ;
                    LDA.w $0EDB               ;
                    BNE   CODE_0DC332         ;
                    LDA.b #$29                ;
                    STA.w $1603               ;
                    BRA   CODE_0DC332         ;

CODE_0DC325:        LDA.w $0EDB               ;
                    BNE   CODE_0DC332         ;
                    LDA.b #$2A                ;
                    STA.w $1603               ;
                    STA.w $0EDB               ;
CODE_0DC332:        INC.w $06DA               ;
                    LDA.w $06DA               ;
                    CMP.w $C298,y             ;
                    BNE   CODE_0DC351         ;
                    LDA.w $06D9               ;
                    CMP.w $C298,y             ;
                    BEQ   CODE_0DC34B         ;
                    JSR.w CODE_0DC2A4         ;
                    JSR.w CODE_0DD462         ;
CODE_0DC34B:        STZ.w $06DA               ;
                    STZ.w $06D9               ;
CODE_0DC351:        STZ.w $0745               ;
CODE_0DC354:        LDA.w $06CD               ;
                    BEQ   CODE_0DC367         ;
                    STA.b $1C,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    STZ.b $29,x               ;
                    STZ.w $06CD               ;
                    JMP.w CODE_0DC461         ;

CODE_0DC367:        LDY.w $0739               ;
                    LDA.b [$FD],y             ;
                    CMP.b #$FF                ;
                    BNE   CODE_0DC373         ;
                    JMP.w CODE_0DC44D         ;

CODE_0DC373:        AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BEQ   CODE_0DC387         ;
                    CPX.b #$05                ;
                    BCC   CODE_0DC387         ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$3F                ;
                    CMP.b #$2E                ;
                    BEQ   CODE_0DC387         ;
                    RTS                       ;

CODE_0DC387:        LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$30                ;
                    AND.b #$F0                ;
                    STA.b $07                 ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $06                 ;
                    LDY.w $0739               ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    ASL   A                   ;
                    BCC   CODE_0DC3AC         ;
                    LDA.w $073B               ;
                    BNE   CODE_0DC3AC         ;
                    INC.w $073B               ;
                    INC.w $073A               ;
CODE_0DC3AC:        DEY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DC3CE         ;
                    LDA.w $073B               ;
                    BNE   CODE_0DC3CE         ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$3F                ;
                    STA.w $073A               ;
                    INC.w $0739               ;
                    INC.w $0739               ;
                    INC.w $073B               ;
                    JMP.w CODE_0DC2E9         ;

CODE_0DC3CE:        LDA.w $073A               ;
                    STA.b $79,x               ;
                    LDA.b [$FD],y             ;
                    AND.b #$F0                ;
                    STA.w $021A,x             ;
                    CMP.w $071D               ;
                    LDA.b $79,x               ;
                    SBC.w $071B               ;
                    BCS   CODE_0DC3EF         ;
                    LDA.b [$FD],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BEQ   CODE_0DC46A         ;
                    JMP.w CODE_0DC48D         ;

CODE_0DC3EF:        LDA.b $07                 ;
                    CMP.w $021A,x             ;
                    LDA.b $06                 ;
                    SBC.b $79,x               ;
                    BCC   CODE_0DC44D         ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    LDA.b [$FD],y             ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $0238,x             ;
                    CMP.b #$E0                ;
                    BEQ   CODE_0DC46A         ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$40                ;
                    BEQ   CODE_0DC41A         ;
                    LDA.w $06CC               ;
                    BNE   CODE_0DC41A         ;
                    JMP.w CODE_0DC49B         ;

CODE_0DC41A:        LDA.b [$FD],y             ;
                    AND.b #$3F                ;
                    CMP.b #$37                ;
                    BCC   CODE_0DC426         ;
                    CMP.b #$3F                ;
                    BCC   CODE_0DC467         ;
CODE_0DC426:        CMP.b #$06                ;
                    BNE   CODE_0DC431         ;
                    LDY.w $076A               ;
                    BEQ   CODE_0DC431         ;
                    LDA.b #$02                ;
CODE_0DC431:        CMP.b #$2D                ;
                    BNE   CODE_0DC438         ;
                    JSR.w CODE_0DDB63         ;
CODE_0DC438:        CMP.b #$35                ;
                    BNE   CODE_0DC43F         ;
                    STZ.w $0F4A               ;
CODE_0DC43F:        STA.b $1C,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    JSR.w CODE_0DC461         ;
                    LDA.b $10,x               ;
                    BNE   CODE_0DC49B         ;
                    RTS                       ;

CODE_0DC44D:        LDA.w $06CB               ;
                    BNE   CODE_0DC45B         ;
                    LDA.w $0398               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DC466         ;
                    LDA.b #$00                ;
CODE_0DC45B:        CPX.b #$09                ;
                    BEQ   CODE_0DC461         ;
                    STA.b $1C,x               ;
CODE_0DC461:        STZ.b $29,x               ;
                    JSR.w CODE_0DC4B9         ;
CODE_0DC466:        RTS                       ;

CODE_0DC467:        JMP.w CODE_0DCA0B         ;

CODE_0DC46A:        INY                       ;
                    INY                       ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BEQ   CODE_0DC47D         ;
                    LDA.b [$FD],y             ;
                    JSR.w CODE_0DC4A7         ;
                    CMP.w $075F               ;
                    BNE   CODE_0DC48B         ;
CODE_0DC47D:        DEY                       ;
                    LDA.b [$FD],y             ;
                    STA.w $0750               ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$1F                ;
                    STA.w $0751               ;
CODE_0DC48B:        BRA   CODE_0DC498         ;

CODE_0DC48D:        LDY.w $0739               ;
                    LDA.b [$FD],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BNE   CODE_0DC49B         ;
CODE_0DC498:        INC.w $0739               ;
CODE_0DC49B:        INC.w $0739               ;
                    INC.w $0739               ;
                    STZ.w $073B               ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DC4A7:        LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    LDA.w $07FB               ;
                    BEQ   CODE_0DC4B7         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b #$09                ;
                    PHA                       ;
CODE_0DC4B7:        PLA                       ;
                    RTS                       ;

CODE_0DC4B9:        LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_0DC4CE         ;
                    TAY                       ;
                    LDA.w $0238,x             ;
                    ADC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.w $03D9,x             ;
                    TYA                       ;
CODE_0DC4CE:        ASL   A                   ;
                    TAY                       ;
                    LDA.w $C4DD,y             ;
                    STA.b $04                 ;
                    LDA.w $C4DE,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DC587
                    dw CODE_0DC587
                    dw CODE_0DC587
                    dw CODE_0DC597
                    dw CODE_0DCA79
                    dw CODE_0DC5A1
                    dw CODE_0DC54C
                    dw CODE_0DC5C0
                    dw CODE_0DC5E7
                    dw CODE_0DC54B
                    dw CODE_0DC5F1
                    dw CODE_0DC5F1
                    dw CODE_0DC552
                    dw CODE_0DCA79
                    dw CODE_0DCAFE
                    dw CODE_0DC5C6
                    dw CODE_0DC5BB
                    dw CODE_0DC602
                    dw CODE_0DCAC3
                    dw CODE_0DC54B
                    dw CODE_0DCAC3
                    dw CODE_0DCAC3
                    dw CODE_0DCAC3
                    dw CODE_0DCAC3
                    dw CODE_0DCAE7
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC6E7
                    dw CODE_0DC6E7
                    dw CODE_0DC6E7
                    dw CODE_0DC6E7
                    dw CODE_0DC6E4
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DCB0C
                    dw CODE_0DCB40
                    dw CODE_0DCB6E
                    dw CODE_0DCB74
                    dw CODE_0DCB39
                    dw CODE_0DCB31
                    dw CODE_0DCB39
                    dw CODE_0DCB7A
                    dw CODE_0DCB86
                    dw CODE_0DC7DE
                    dw CODE_0DBB67
                    dw CODE_0DB7C9
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC54B
                    dw CODE_0DC56E
                    dw CODE_0DCBAF

CODE_0DC54B:        RTS                       ;

CODE_0DC54C:        JSR.w CODE_0DC587         ;
                    JMP.w CODE_0DC5C2         ;

CODE_0DC552:        LDA.b #$D0                ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.w $07A2,x             ;
                    STZ.b $29,x               ;
                    STA.w $0B00,x             ;
                    STZ.w $0B09,x             ;
                    LDA.b #$27                ;
                    STA.w $1603               ;
                    JMP.w CODE_0DC5C2         ;

CODE_0DC56E:        LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DC57F         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DC57F         ;
                    LDA.b #$B8                ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_0DC57F:        LDA.b #$70                ;
                    STA.w $0238,x             ;
                    RTS                       ;

                    db $F8,$F4

CODE_0DC587:        LDY.b #$01                ;
                    LDA.w $076A               ;
                    BNE   CODE_0DC58F         ;
                    DEY                       ;
CODE_0DC58F:        LDA.w $C585,y             ;
CODE_0DC592:        STA.b $5E,x               ;
                    JMP.w CODE_0DC5D8         ;

CODE_0DC597:        JSR.w CODE_0DC587         ;
                    LDA.b #$01                ;
                    STA.b $29,x               ;
                    RTS                       ;

                    db $80,$50

CODE_0DC5A1:        STZ.w $03A2,x             ;
                    STZ.b $5E,x               ;
                    LDA.w $075F               ;
                    CMP.b #$06                ;
                    BCS   CODE_0DC5B6         ;
                    LDY.w $06CC               ;
                    LDA.w $C59F,y             ;
                    STA.w $07A2,x             ;
CODE_0DC5B6:        LDA.b #$0B                ;
                    JMP.w CODE_0DC5DA         ;

CODE_0DC5BB:        LDA.b #$00                ;
                    JMP.w CODE_0DC592         ;

CODE_0DC5C0:        STZ.b $5E,x               ;
CODE_0DC5C2:        LDA.b #$09                ;
                    BNE   CODE_0DC5DA         ;
CODE_0DC5C6:        LDY.b #$30                ;
                    LDA.w $0238,x             ;
                    STA.w $0402,x             ;
                    BPL   CODE_0DC5D2         ;
                    LDY.b #$E0                ;
CODE_0DC5D2:        TYA                       ;
                    ADC.w $0238,x             ;
                    STA.b $5E,x               ;
CODE_0DC5D8:        LDA.b #$03                ;
CODE_0DC5DA:        STA.w $0490,x             ;
                    LDA.b #$02                ;
                    STA.b $47,x               ;
CODE_0DC5E1:        STZ.b $A1,x               ;
                    STZ.w $043D,x             ;
                    RTS                       ;

CODE_0DC5E7:        LDA.b #$02                ;
                    STA.b $47,x               ;
                    LDA.b #$09                ;
                    STA.w $0490,x             ;
                    RTS                       ;

CODE_0DC5F1:        JSR.w CODE_0DC5C2         ;
                    LDA.w $07B7,x             ;
                    AND.b #$10                ;
                    STA.b $5E,x               ;
                    LDA.w $0238,x             ;
                    STA.w $043D,x             ;
                    RTS                       ;

CODE_0DC602:        LDA.w $06CB               ;
                    BNE   CODE_0DC610         ;
CODE_0DC607:        STZ.w $06D1               ;
                    JSR.w CODE_0DC5BB         ;
                    JMP.w CODE_0DCB06         ;

CODE_0DC610:        JMP.w CODE_0DCCEA         ;

                    db $26,$2C,$32,$38,$20,$22,$24,$26
                    db $13,$14,$15,$16

CODE_0DC61F:        LDA.w $079B               ;
                    BNE   CODE_0DC66C         ;
                    CPX.b #$09                ;
                    BCS   CODE_0DC66C         ;
                    LDA.b #$80                ;
                    STA.w $079B               ;
                    LDY.b #$08                ;
CODE_0DC62F:        LDA.w $1C,y             ;
                    CMP.b #$11                ;
                    BEQ   CODE_0DC66D         ;
                    DEY                       ;
                    BPL   CODE_0DC62F         ;
                    INC.w $06D1               ;
                    LDA.w $06D1               ;
                    CMP.b #$03                ;
                    BCC   CODE_0DC66C         ;
                    LDX.b #$08                ;
CODE_0DC645:        LDA.b $10,x               ;
                    BEQ   CODE_0DC64E         ;
                    DEX                       ;
                    BPL   CODE_0DC645         ;
                    BMI   CODE_0DC66A         ;
CODE_0DC64E:        STZ.b $29,x               ;
                    LDA.b #$11                ;
                    STA.b $1C,x               ;
                    JSR.w CODE_0DC607         ;
                    LDA.b #$20                ;
                    LDY.w $07FB               ;
                    BNE   CODE_0DC665         ;
                    LDY.w $075F               ;
                    CPY.b #$06                ;
                    BCC   CODE_0DC667         ;
CODE_0DC665:        LDA.b #$60                ;
CODE_0DC667:        JSR.w CODE_0DC8C9         ;
CODE_0DC66A:        LDX.b $9E                 ;
CODE_0DC66C:        RTS                       ;

CODE_0DC66D:        LDA.w $0237               ;
                    CMP.b #$2C                ;
                    BCC   CODE_0DC66C         ;
                    LDA.w $29,y             ;
                    BNE   CODE_0DC66C         ;
                    LDA.w $79,y             ;
                    STA.b $79,x               ;
                    LDA.w $021A,y             ;
                    STA.w $021A,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    LDA.w $0238,y             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $C613,y             ;
                    STA.b $03                 ;
                    LDA.w $C617,y             ;
                    STA.b $02                 ;
                    LDA.w $C61B,y             ;
                    STA.b $01                 ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0DD30E         ;
                    LDY.b $5D                 ;
                    CPY.b #$08                ;
                    BCS   CODE_0DC6BF         ;
                    TAY                       ;
                    LDA.w $07B8,x             ;
                    AND.b #$03                ;
                    BEQ   CODE_0DC6BE         ;
                    TYA                       ;
                    EOR.b #$FF                ;
                    TAY                       ;
                    INY                       ;
CODE_0DC6BE:        TYA                       ;
CODE_0DC6BF:        JSR.w CODE_0DC5C2         ;
                    LDY.b #$02                ;
                    STA.b $5E,x               ;
                    CMP.b #$00                ;
                    BMI   CODE_0DC6CB         ;
                    DEY                       ;
CODE_0DC6CB:        STY.b $47,x               ;
                    LDA.b #$FD                ;
                    STA.b $A1,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    LDA.b #$05                ;
                    STA.b $29,x               ;
CODE_0DC6D9:        RTS                       ;

                    db $28,$38,$28,$38,$28,$00,$00,$10
                    db $10,$00

CODE_0DC6E4:        JSR.w CODE_0DC827         ;
CODE_0DC6E7:        STZ.b $5E,x               ;
                    LDA.b $1C,x               ;
                    SEC                       ;
                    SBC.b #$1B                ;
                    TAY                       ;
                    LDA.w $C6DA,y             ;
                    STA.w $0388,x             ;
                    LDA.w $C6DF,y             ;
                    STA.w $0203,x             ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0238,x             ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    JMP.w CODE_0DCB06         ;

                    db $80,$30,$40,$80,$30,$50,$50,$70
                    db $20,$40,$80,$A0,$70,$40,$90,$68
                    db $0E,$05,$06,$0E,$1C,$20,$10,$0C
                    db $1E,$22,$18,$14,$10,$60,$20

                    PHA                       ;
CODE_0DC736:        LDA.w $079B               ;
                    BNE   CODE_0DC6D9         ;
                    JSR.w CODE_0DC5C2         ;
                    LDA.w $07B8,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $C732,y             ;
                    STA.w $079B               ;
                    LDY.b #$03                ;
                    LDA.w $06CC               ;
                    BEQ   CODE_0DC752         ;
                    INY                       ;
CODE_0DC752:        STY.b $00                 ;
                    CPX.b $00                 ;
                    BCC   CODE_0DC75B         ;
                    JMP.w CODE_0DC6D9         ;

CODE_0DC75B:        LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    STA.b $00                 ;
                    STA.b $01                 ;
                    LDA.b #$FB                ;
                    STA.b $A1,x               ;
                    LDA.b #$00                ;
                    LDY.b $5D                 ;
                    BEQ   CODE_0DC775         ;
                    LDA.b #$04                ;
                    CPY.b #$19                ;
                    BCC   CODE_0DC775         ;
                    ASL   A                   ;
CODE_0DC775:        PHA                       ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $00                 ;
                    LDA.w $07B8,x             ;
                    AND.b #$03                ;
                    BEQ   CODE_0DC789         ;
                    LDA.w $07B9,x             ;
                    AND.b #$0F                ;
                    STA.b $00                 ;
CODE_0DC789:        PLA                       ;
                    CLC                       ;
                    ADC.b $01                 ;
                    TAY                       ;
                    LDA.w $C726,y             ;
                    STA.b $5E,x               ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
                    LDA.b $5D                 ;
                    BNE   CODE_0DC7AD         ;
                    LDY.b $00                 ;
                    TYA                       ;
                    AND.b #$02                ;
                    BEQ   CODE_0DC7AD         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $5E,x               ;
                    INC.b $47,x               ;
CODE_0DC7AD:        TYA                       ;
                    AND.b #$02                ;
                    BEQ   CODE_0DC7C2         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.w $C716,y             ;
                    STA.w $021A,x             ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    BRA   CODE_0DC7D0         ;

CODE_0DC7C2:        LDA.w $0219               ;
                    SEC                       ;
                    SBC.w $C716,y             ;
                    STA.w $021A,x             ;
                    LDA.b $78                 ;
                    SBC.b #$00                ;
CODE_0DC7D0:        STA.b $79,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    STA.b $BC,x               ;
                    LDA.b #$F8                ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_0DC7DE:        LDY.b #$04                ;
CODE_0DC7E0:        CPY.w $009E               ;
                    BEQ   CODE_0DC7F4         ;
                    LDA.w $1C,y             ;
                    CMP.b #$2D                ;
                    BNE   CODE_0DC7F4         ;
                    LDA.b #$00                ;
                    STA.w $1C,y             ;
                    STA.w $10,y             ;
CODE_0DC7F4:        DEY                       ;
                    BPL   CODE_0DC7E0         ;
                    JSR.w CODE_0DC827         ;
                    STX.w $0368               ;
                    STZ.w $0363               ;
                    STZ.w $0369               ;
                    LDA.w $021A,x             ;
                    STA.w $0366               ;
                    LDA.b #$DF                ;
                    STA.w $079C               ;
                    STA.b $47,x               ;
                    LDA.b #$20                ;
                    STA.w $0364               ;
                    STA.w $0792,x             ;
                    STA.w $0257,x             ;
                    LDA.b $1C,x               ;
                    LDA.b #$05                ;
                    STA.w $0283               ;
                    LSR   A                   ;
                    STA.w $0365               ;
                    RTS                       ;

CODE_0DC827:        LDY.b #$FF                ;
CODE_0DC829:        INY                       ;
                    LDA.w $10,y             ;
                    BNE   CODE_0DC829         ;
                    STY.w $06CF               ;
                    TXA                       ;
                    ORA.b #$80                ;
                    STA.w $10,y             ;
                    LDA.b $79,x               ;
                    STA.w $79,y             ;
                    LDA.w $021A,x             ;
                    STA.w $021A,y             ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    STA.w $BC,y             ;
                    LDA.w $0238,x             ;
                    STA.w $0238,y             ;
CODE_0DC850:        RTS                       ;

                    db $90,$80,$70,$90
                    db $FF,$01

CODE_0DC857:        LDA.w $079B               ;
                    BNE   CODE_0DC850         ;
                    STA.w $043D,x             ;
                    LDA.b #$06                ;
                    STA.w $014B               ;
                    LDA.b #$18                ;
                    STA.w $0F4C               ;
                    STX.w $0F4D               ;
                    LDY.w $0368               ;
                    LDA.w $1C,y             ;
                    CMP.b #$2D                ;
                    BEQ   CODE_0DC8C5         ;
                    JSR.w CODE_0DD5EA         ;
                    CLC                       ;
                    ADC.b #$20                ;
                    LDY.w $06CC               ;
                    BEQ   CODE_0DC884         ;
                    SEC                       ;
                    SBC.b #$10                ;
CODE_0DC884:        STA.w $079B               ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    STA.w $041D,x             ;
                    TAY                       ;
                    LDA.w $C851,y             ;
                    STA.w $0238,x             ;
                    LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.w $021A,x             ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    STZ.w $0F4C               ;
                    STZ.w $0F4D               ;
                    STZ.w $014B               ;
                    LDA.b #$17                ;
                    STA.w $1603               ;
                    LDA.b #$08                ;
                    STA.w $0490,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.w $0402,x             ;
                    STA.b $29,x               ;
CODE_0DC8C5:        STX.w $0F4E               ;
                    RTS                       ;

CODE_0DC8C9:        STA.w $0238,x             ;
                    LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.w $021A,x             ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    BRA   CODE_0DC912         ;

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
                    LDA.w $C851,y             ;
                    LDY.b #$00                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_0DC909         ;
                    INY                       ;
CODE_0DC909:        LDA.w $C855,y             ;
                    STA.w $043D,x             ;
                    STZ.w $06CB               ;
CODE_0DC912:        LDA.b #$08                ;
                    STA.w $0490,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.w $0402,x             ;
                    STA.b $29,x               ;
                    RTS                       ;

                    db $00,$30,$60,$60,$00,$20,$60,$40
                    db $70,$40,$60,$30

CODE_0DC930:        LDA.w $079B               ;
                    BNE   CODE_0DC97E         ;
                    LDA.b #$20                ;
                    STA.w $079B               ;
                    DEC.w $06D7               ;
                    LDY.b #$0A                ;
CODE_0DC93F:        DEY                       ;
                    LDA.w $1C,y             ;
                    CMP.b #$31                ;
                    BNE   CODE_0DC93F         ;
                    LDA.w $021A,y             ;
                    SEC                       ;
                    SBC.b #$30                ;
                    PHA                       ;
                    LDA.w $79,y             ;
                    SBC.b #$00                ;
                    STA.b $00                 ;
                    LDA.w $06D7               ;
                    CLC                       ;
                    ADC.w $0029,y             ;
                    TAY                       ;
                    PLA                       ;
                    CLC                       ;
                    ADC.w $C924,y             ;
                    STA.w $021A,x             ;
                    LDA.b $00                 ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    LDA.w $C92A,y             ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.b $5E,x               ;
                    LDA.b #$08                ;
                    STA.b $A1,x               ;
CODE_0DC97E:        RTS                       ;

                    db $01,$02,$04,$08,$10,$20,$40,$80
                    db $40,$30,$90,$50,$20,$60,$A0,$70
                    db $0A,$0B

CODE_0DC991:        LDA.w $079B               ;
                    BNE   CODE_0DCA01         ;
                    LDA.b $5C                 ;
                    BNE   CODE_0DC9EE         ;
                    CPX.b #$03                ;
                    BCS   CODE_0DCA01         ;
                    LDY.b #$00                ;
                    LDA.w $07B7,x             ;
                    CMP.b #$AA                ;
                    BCC   CODE_0DC9A8         ;
                    INY                       ;
CODE_0DC9A8:        LDA.w $075F               ;
                    CMP.b #$01                ;
                    BEQ   CODE_0DC9B0         ;
                    INY                       ;
CODE_0DC9B0:        TYA                       ;
                    AND.b #$01                ;
                    TAY                       ;
                    LDA.w $C98F,y             ;
CODE_0DC9B7:        STA.b $1C,x               ;
                    LDA.w $06DD               ;
                    CMP.b #$FF                ;
                    BNE   CODE_0DC9C3         ;
                    STZ.w $06DD               ;
CODE_0DC9C3:        LDA.w $07B7,x             ;
                    AND.b #$07                ;
CODE_0DC9C8:        TAY                       ;
                    LDA.w $C97F,y             ;
                    BIT.w $06DD               ;
                    BEQ   CODE_0DC9D7         ;
                    INY                       ;
                    TYA                       ;
                    AND.b #$07                ;
                    BRA   CODE_0DC9C8         ;

CODE_0DC9D7:        ORA.w $06DD               ;
                    STA.w $06DD               ;
                    LDA.w $C987,y             ;
                    JSR.w CODE_0DC8C9         ;
                    STA.w $041D,x             ;
                    LDA.b #$20                ;
                    STA.w $079B               ;
                    JMP.w CODE_0DC4B9         ;

CODE_0DC9EE:        LDY.b #$FF                ;
CODE_0DC9F0:        INY                       ;
                    CPY.b #$09                ;
                    BCS   CODE_0DCA02         ;
                    LDA.w $10,y             ;
                    BEQ   CODE_0DC9F0         ;
                    LDA.w $1C,y             ;
                    CMP.b #$08                ;
                    BNE   CODE_0DC9F0         ;
CODE_0DCA01:        RTS                       ;

CODE_0DCA02:        LDA.b #$09                ;
                    STA.w $1603               ;
                    LDA.b #$08                ;
                    BNE   CODE_0DC9B7         ;
CODE_0DCA0B:        LDY.b #$00                ;
                    SEC                       ;
                    SBC.b #$37                ;
                    PHA                       ;
                    CMP.b #$04                ;
                    BCS   CODE_0DCA20         ;
                    PHA                       ;
                    LDY.b #$06                ;
                    LDA.w $076A               ;
                    BEQ   CODE_0DCA1F         ;
                    LDY.b #$02                ;
CODE_0DCA1F:        PLA                       ;
CODE_0DCA20:        STY.b $01                 ;
                    LDY.b #$B0                ;
                    AND.b #$02                ;
                    BEQ   CODE_0DCA2A         ;
                    LDY.b #$70                ;
CODE_0DCA2A:        STY.b $00                 ;
                    LDA.w $071B               ;
                    STA.b $02                 ;
                    LDA.w $071D               ;
                    STA.b $03                 ;
                    LDY.b #$02                ;
                    PLA                       ;
                    LSR   A                   ;
                    BCC   CODE_0DCA3D         ;
                    INY                       ;
CODE_0DCA3D:        STY.w $06D3               ;
CODE_0DCA40:        LDX.b #$FF                ;
CODE_0DCA42:        INX                       ;
                    CPX.b #$09                ;
                    BCS   CODE_0DCA76         ;
                    LDA.b $10,x               ;
                    BNE   CODE_0DCA42         ;
                    LDA.b $01                 ;
                    STA.b $1C,x               ;
                    LDA.b $02                 ;
                    STA.b $79,x               ;
                    LDA.b $03                 ;
                    STA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.b $03                 ;
                    LDA.b $02                 ;
                    ADC.b #$00                ;
                    STA.b $02                 ;
                    LDA.b $00                 ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    JSR.w CODE_0DC4B9         ;
                    DEC.w $06D3               ;
                    BNE   CODE_0DCA40         ;
CODE_0DCA76:        JMP.w CODE_0DC49B         ;

CODE_0DCA79:        LDA.b #$2C                ;
                    STA.w $00               ;
                    LDA.b #$13                ;
                    STA.w $01               ;
                    STA.w $0F25               ;
                    LDA.w $07FB               ;
                    BNE   CODE_0DCAA0         ;
                    LDA.w $075F               ;
                    CMP.b #$03                ;
                    BCS   CODE_0DCAA0         ;
                    DEC.w $0000               ;
                    DEC.w $0000               ;
                    LDA.b #$21                ;
                    STA.w $01               ;
                    STA.w $0F25               ;
CODE_0DCAA0:        LDA.w $00               ;
                    STA.w $0F24               ;
                    LDA.b #$01                ;
                    STA.b $5E,x               ;
                    LSR   A                   ;
                    STA.b $29,x               ;
                    STA.w $A1,x             ;
                    LDA.w $0238,x             ;
                    STA.w $043D,x             ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.w $041D,x             ;
                    LDA.b #$09                ;
                    LDA.b #$0C                ;
                    JMP.w CODE_0DCB08         ;

CODE_0DCAC3:        LDA.b $1C,x               ;
                    STA.w $06CB               ;
                    SEC                       ;
                    SBC.b #$12                ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $CADA,y             ;
                    STA.b $04                 ;
                    LDA.w $CADB,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DC61F
                    dw CODE_0DCAE6
                    dw CODE_0DC736
                    dw CODE_0DC857
                    dw CODE_0DC930
                    dw CODE_0DC991

CODE_0DCAE6:        RTS                       ;

CODE_0DCAE7:        LDY.b #$09                ;
CODE_0DCAE9:        LDA.w $1C,y             ;
                    CMP.b #$11                ;
                    BNE   CODE_0DCAF5         ;
                    LDA.b #$01                ;
                    STA.w $29,y             ;
CODE_0DCAF5:        DEY                       ;
                    BPL   CODE_0DCAE9         ;
                    STZ.w $06CB               ;
                    STZ.b $10,x               ;
                    RTS                       ;

CODE_0DCAFE:        LDA.b #$02                ;
                    STA.b $47,x               ;
                    LDA.b #$F4                ;
                    STA.b $5E,x               ;
CODE_0DCB06:        LDA.b #$03                ;
CODE_0DCB08:        STA.w $0490,x             ;
                    RTS                       ;

CODE_0DCB0C:        DEC.w $0238,x             ;
                    DEC.w $0238,x             ;
                    LDY.w $06CC               ;
                    BNE   CODE_0DCB1C         ;
                    LDY.b #$02                ;
                    JSR.w CODE_0DCB9E         ;
CODE_0DCB1C:        LDY.b #$FF                ;
                    LDA.w $03A0               ;
                    STA.b $29,x               ;
                    BPL   CODE_0DCB26         ;
                    TXY                       ;
CODE_0DCB26:        STY.w $03A0               ;
                    LDA.b #$00                ;
                    STA.b $47,x               ;
                    TAY                       ;
                    JSR.w CODE_0DCB9E         ;
CODE_0DCB31:        LDA.b #$FF                ;
                    STA.w $03A2,x             ;
                    JMP.w CODE_0DCB58         ;

CODE_0DCB39:        LDA.b #$00                ;
                    STA.b $5E,x               ;
                    JMP.w CODE_0DCB58         ;

CODE_0DCB40:        LDY.b #$40                ;
                    LDA.w $0238,x             ;
                    BPL   CODE_0DCB4E         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    LDY.b #$C0                ;
CODE_0DCB4E:        STA.w $0402,x             ;
                    TYA                       ;
                    CLC                       ;
                    ADC.w $0238,x             ;
                    STA.b $5E,x               ;
CODE_0DCB58:        JSR.w CODE_0DC5E1         ;
CODE_0DCB5B:        LDA.b #$05                ;
                    LDY.b $5C                 ;
                    CPY.b #$03                ;
                    BEQ   CODE_0DCB6A         ;
                    LDY.w $06CC               ;
                    BNE   CODE_0DCB6A         ;
                    LDA.b #$06                ;
CODE_0DCB6A:        STA.w $0490,x             ;
                    RTS                       ;

CODE_0DCB6E:        JSR.w CODE_0DCB7A         ;
                    JMP.w CODE_0DCB77         ;

CODE_0DCB74:        JSR.w CODE_0DCB86         ;
CODE_0DCB77:        JMP.w CODE_0DCB5B         ;

CODE_0DCB7A:        LDA.b #$10                ;
                    STA.w $043D,x             ;
                    LDA.b #$FF                ;
                    STA.b $A1,x               ;
                    JMP.w CODE_0DCB8D         ;

CODE_0DCB86:        LDA.b #$F0                ;
                    STA.w $043D,x             ;
                    STZ.b $A1,x               ;
CODE_0DCB8D:        LDY.b #$01                ;
                    JSR.w CODE_0DCB9E         ;
                    LDA.b #$04                ;
                    STA.w $0490,x             ;
                    RTS                       ;

                    db $08,$0C,$F8,$00,$00,$FF

CODE_0DCB9E:        LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.w $CB98,y             ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    ADC.w $CB9B,y             ;
                    STA.b $79,x               ;
CODE_0DCBAF:        RTS                       ;

CODE_0DCBB0:        LDX.b $9E                 ;
                    LDA.b #$00                ;
                    LDY.b $1C,x               ;
                    CPY.b #$15                ;
                    BCC   CODE_0DCBBD         ;
                    TYA                       ;
                    SBC.b #$14                ;
CODE_0DCBBD:        ASL   A                   ;
                    TAY                       ;
                    LDA.w $CBCC,y             ;
                    STA.b $04                 ;
                    LDA.w $CBCD,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DCC1A
                    dw CODE_0DCC7B
                    dw CODE_0DD652
                    dw CODE_0DCC10
                    dw CODE_0DCC10
                    dw CODE_0DCC10
                    dw CODE_0DCC10
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC8D
                    dw CODE_0DCC10
                    dw CODE_0DCCAB
                    dw CODE_0DCCAB
                    dw CODE_0DCCAB
                    dw CODE_0DCCAB
                    dw CODE_0DCCAB
                    dw CODE_0DCCAB
                    dw CODE_0DCCAB
                    dw CODE_0DCC93
                    dw CODE_0DCC93
                    dw CODE_0DD448
                    dw CODE_0DBB8F
                    dw CODE_0DB7FB
                    dw CODE_0DCC10
                    dw CODE_0DD6A0
                    dw CODE_0DB744
                    dw CODE_0DCC10
                    dw CODE_0DB5E8
                    dw CODE_0DCC11

CODE_0DCC10:        RTS                       ;

CODE_0DCC11:        JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JMP.w CODE_0DEE40         ;

CODE_0DCC1A:        LDA.b #$20                ;
                    STA.w $0257,x             ;
                    JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DEE40         ;
                    JSR.w CODE_0DE948         ;
                    JSR.w CODE_0DE68D         ;
                    JSR.w CODE_0DE003         ;
                    JSR.w CODE_0DDD7D         ;
                    LDY.w $0747               ;
                    BNE   CODE_0DCC3C         ;
                    JSR.w CODE_0DCC3F         ;
CODE_0DCC3C:        JMP.w CODE_0DDAFC         ;

CODE_0DCC3F:        LDA.b $1C,x               ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $CC50,y             ;
                    STA.b $04                 ;
                    LDA.w $CC51,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DCE10
                    dw CODE_0DCE10
                    dw CODE_0DCE10
                    dw CODE_0DCE10
                    dw CODE_0DAB1F
                    dw CODE_0DCD6F
                    dw CODE_0DCE10
                    dw CODE_0DCF25
                    dw CODE_0DCFD5
                    dw CODE_0DCC7A
                    dw CODE_0DCFE9
                    dw CODE_0DCFE9
                    dw CODE_0DCD22
                    dw CODE_0DD780
                    dw CODE_0DCE92
                    dw CODE_0DCE98
                    dw CODE_0DCEC1
                    dw CODE_0DD2CE
                    dw CODE_0DCE10
                    dw CODE_0DCC7A
                    dw CODE_0DD289

CODE_0DCC7A:        RTS                       ;

CODE_0DCC7B:        JSR.w CODE_0DD5FC         ;
                    JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DE948         ;
                    JSR.w CODE_0DDD7D         ;
                    JMP.w CODE_0DDAFC         ;

CODE_0DCC8D:        JSR.w CODE_0DD0DF         ;
                    JMP.w CODE_0DDAFC         ;

CODE_0DCC93:        JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DE951         ;
                    JSR.w CODE_0DE16E         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DF5A2         ;
                    JSR.w CODE_0DDAD1         ;
                    JMP.w CODE_0DDAFC         ;

CODE_0DCCAB:        JSR.w CODE_0DFDE1         ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DE980         ;
                    JSR.w CODE_0DE137         ;
                    LDA.w $0747               ;
                    BNE   CODE_0DCCBF         ;
                    JSR.w CODE_0DCCC8         ;
CODE_0DCCBF:        JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DEBA6         ;
                    JMP.w CODE_0DDAFC         ;

CODE_0DCCC8:        LDA.b $1C,x               ;
                    SEC                       ;
                    SBC.b #$24                ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $CCDC,y             ;
                    STA.b $04                 ;
                    LDA.w $CCDD,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_0DD807
                    dw CODE_0DDA4C
                    dw CODE_0DDACB
                    dw CODE_0DDACB
                    dw CODE_0DDA82
                    dw CODE_0DDAAD
                    dw CODE_0DDAB9

CODE_0DCCEA:        STZ.w $07A2,x
CODE_0DCCED:        CPX.b #$09                ;
                    BNE   CODE_0DCD08         ;
                    LDA.b #$F0                ;
                    STA.w $09E1               ;
                    STA.w $09E5               ;
                    STA.w $09E9               ;
                    STA.w $09ED               ;
                    LDA.b $DB                 ;
                    CMP.b #$22                ;
                    BNE   CODE_0DCD08         ;
                    STZ.w $0743               ;
CODE_0DCD08:        STZ.b $10,x               ;
                    STZ.b $1C,x               ;
                    STZ.b $29,x               ;
                    STZ.w $0110,x             ;
                    STZ.w $012E,x             ;
                    STZ.w $0792,x             ;
                    STZ.w $03A2,x             ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    LDA.b #$00                ;
                    RTS                       ;

CODE_0DCD22:        LDA.w $07A2,x             ;
                    BNE   CODE_0DCD3D         ;
                    JSR.w CODE_0DC552         ;
                    LDA.w $07B8,x             ;
                    ORA.b #$80                ;
                    STA.w $043D,x             ;
                    AND.b #$0F                ;
                    ORA.b #$06                ;
                    STA.w $07A2,x             ;
                    LDA.b #$F9                ;
                    STA.b $A1,x               ;
CODE_0DCD3D:        LDA.w $A1,x             ;
                    BMI   CODE_0DCD5B         ;
                    LDA.w $0238,x             ;
                    CMP.b #$C0                ;
                    BCC   CODE_0DCD5B         ;
                    LDA.w $0B00,x             ;
                    CMP.b #$02                ;
                    BNE   CODE_0DCD5B         ;
                    INC.w $0B00,x             ;
                    STZ.w $0B09,x             ;
                    LDA.b #$27                ;
                    STA.w $1603               ;
CODE_0DCD5B:        INC.w $0B09,x             ;
                    JSL.l CODE_0FE40F         ;
                    JMP.w CODE_0DBF33         ;

                    db $30,$1C,$00,$E8,$00,$18,$08,$F8
                    db $0C,$F4

CODE_0DCD6F:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DCD78         ;
                    JMP.w CODE_0DCE7E         ;

CODE_0DCD78:        LDA.w $020F,x             ;
                    BEQ   CODE_0DCDAB         ;
                    DEC.w $020F,x             ;
                    LDA.w $03D1               ;
                    AND.b #$0C                ;
                    BNE   CODE_0DCDF1         ;
                    LDA.w $03A2,x             ;
                    BNE   CODE_0DCDA3         ;
                    LDY.w $06CC               ;
                    LDA.w $CD65,y             ;
                    STA.w $03A2,x             ;
                    JSR.w CODE_0DB961         ;
                    BCC   CODE_0DCDA3         ;
                    LDA.b $29,x               ;
                    ORA.b #$08                ;
                    STA.b $29,x               ;
                    JMP.w CODE_0DCDF1         ;

CODE_0DCDA3:        DEC.w $03A2,x             ;
                    JMP.w CODE_0DCDF1         ;

                    db $20,$37

CODE_0DCDAB:        LDA.b $29,x               ;
                    AND.b #$07                ;
                    CMP.b #$01                ;
                    BEQ   CODE_0DCDF1         ;
                    STZ.b $00                 ;
                    LDY.b #$FA                ;
                    LDA.w $0238,x             ;
                    BMI   CODE_0DCDCF         ;
                    LDY.b #$FD                ;
                    CMP.b #$70                ;
                    INC.b $00                 ;
                    BCC   CODE_0DCDCF         ;
                    DEC.b $00                 ;
                    LDA.w $07B8,x             ;
                    AND.b #$01                ;
                    BNE   CODE_0DCDCF         ;
                    LDY.b #$FA                ;
CODE_0DCDCF:        STY.b $A1,x               ;
                    LDA.b $29,x               ;
                    ORA.b #$01                ;
                    STA.b $29,x               ;
                    LDA.b $00                 ;
                    AND.w $07B9,x             ;
                    TAY                       ;
                    LDA.w $06CC               ;
                    BNE   CODE_0DCDE3         ;
                    TAY                       ;
CODE_0DCDE3:        LDA.w $CDA9,y             ;
                    STA.w $0792,x             ;
                    LDA.w $07B8,x             ;
                    ORA.b #$C0                ;
                    STA.w $020F,x             ;
CODE_0DCDF1:        LDY.b #$FC                ;
                    LDA.b $09                 ;
                    AND.b #$40                ;
                    BNE   CODE_0DCDFB         ;
                    LDY.b #$04                ;
CODE_0DCDFB:        STY.b $5E,x               ;
                    LDY.b #$01                ;
                    JSR.w CODE_0DE828         ;
                    BMI   CODE_0DCE0E         ;
                    INY                       ;
                    LDA.w $07A2,x             ;
                    BNE   CODE_0DCE0E         ;
                    LDA.b #$F8                ;
                    STA.b $5E,x               ;
CODE_0DCE0E:        STY.b $47,x               ;
CODE_0DCE10:        LDY.b #$00                ;
                    LDA.b $29,x               ;
                    AND.b #$40                ;
                    BNE   CODE_0DCE31         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCS   CODE_0DCE4D         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DCE7E         ;
                    LDA.b $29,x               ;
                    AND.b #$07                ;
                    BEQ   CODE_0DCE4D         ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DCE31         ;
                    CMP.b #$03                ;
                    BCS   CODE_0DCE61         ;
CODE_0DCE31:        JSR.w CODE_0DBF06         ;
                    LDY.b #$00                ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DCE48         ;
                    AND.b #$40                ;
                    BEQ   CODE_0DCE4D         ;
                    LDA.b $1C,x               ;
                    CMP.b #$2E                ;
                    BEQ   CODE_0DCE4D         ;
                    BNE   CODE_0DCE4B         ;
CODE_0DCE48:        JMP.w CODE_0DBEA0         ;

CODE_0DCE4B:        LDY.b #$01                ;
CODE_0DCE4D:        LDA.b $5E,x               ;
                    PHA                       ;
                    BPL   CODE_0DCE54         ;
                    INY                       ;
                    INY                       ;
CODE_0DCE54:        CLC                       ;
                    ADC.w $CD67,y             ;
                    STA.b $5E,x               ;
                    JSR.w CODE_0DBEA0         ;
                    PLA                       ;
                    STA.b $5E,x               ;
                    RTS                       ;

CODE_0DCE61:        LDA.w $07A2,x             ;
                    BNE   CODE_0DCE84         ;
                    STA.b $29,x               ;
                    LDA.b $09                 ;
                    AND.b #$01                ;
                    TAY                       ;
                    INY                       ;
                    STY.b $47,x               ;
                    DEY                       ;
                    LDA.w $076A               ;
                    BEQ   CODE_0DCE78         ;
                    INY                       ;
                    INY                       ;
CODE_0DCE78:        LDA.w $CD6B,y             ;
                    STA.b $5E,x               ;
                    RTS                       ;

CODE_0DCE7E:        JSR.w CODE_0DBF06         ;
                    JMP.w CODE_0DBEA0         ;

CODE_0DCE84:        CMP.b #$0E                ;
                    BNE   CODE_0DCE91         ;
                    LDA.b $1C,x               ;
                    CMP.b #$06                ;
                    BNE   CODE_0DCE91         ;
                    JSR.w CODE_0DCCEA         ;
CODE_0DCE91:        RTS                       ;

CODE_0DCE92:        JSR.w CODE_0DBF33         ;
                    JMP.w CODE_0DBEA0         ;

CODE_0DCE98:        LDA.b $A1,x               ;
                    ORA.w $043D,x             ;
                    BNE   CODE_0DCEB4         ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    CMP.w $0402,x             ;
                    BCS   CODE_0DCEB4         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0DCEB3         ;
                    INC.w $0238,x             ;
CODE_0DCEB3:        RTS                       ;

CODE_0DCEB4:        LDA.w $0238,x             ;
                    CMP.b $5E,x               ;
                    BCC   CODE_0DCEBE         ;
                    JMP.w CODE_0DBF16         ;

CODE_0DCEBE:        JMP.w CODE_0DBF12         ;

CODE_0DCEC1:        JSR.w CODE_0DCEE3         ;
                    JSR.w CODE_0DCF04         ;
                    LDY.b #$01                ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_0DCEE2         ;
                    LDA.b $09                 ;
                    AND.b #$40                ;
                    BNE   CODE_0DCED7         ;
                    LDY.b #$FF                ;
CODE_0DCED7:        STY.b $00                 ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $0238,x             ;
CODE_0DCEE2:        RTS                       ;

CODE_0DCEE3:        LDA.b #$13                ;
CODE_0DCEE5:        STA.b $01                 ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_0DCEFA         ;
                    LDY.b $5E,x               ;
                    LDA.b $A1,x               ;
                    LSR   A                   ;
                    BCS   CODE_0DCEFE         ;
                    CPY.b $01                 ;
                    BEQ   CODE_0DCEFB         ;
                    INC.b $5E,x               ;
CODE_0DCEFA:        RTS                       ;

CODE_0DCEFB:        INC.b $A1,x               ;
                    RTS                       ;

CODE_0DCEFE:        TYA                       ;
                    BEQ   CODE_0DCEFB         ;
                    DEC.b $5E,x               ;
                    RTS                       ;

CODE_0DCF04:        LDA.b $5E,x               ;
                    PHA                       ;
                    LDY.b #$01                ;
                    LDA.b $A1,x               ;
                    AND.b #$02                ;
                    BNE   CODE_0DCF18         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $5E,x               ;
                    LDY.b #$02                ;
CODE_0DCF18:        STY.b $47,x               ;
                    JSR.w CODE_0DBEA0         ;
                    STA.b $00                 ;
                    PLA                       ;
                    STA.b $5E,x               ;
                    RTS                       ;

                    db $3F,$03

CODE_0DCF25:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DCF7E         ;
                    LDY.w $06CC               ;
                    LDA.w $07B8,x             ;
                    AND.w $CF23,y             ;
                    BNE   CODE_0DCF48         ;
                    TXA                       ;
                    LSR   A                   ;
                    BCC   CODE_0DCF3E         ;
                    LDY.b $46                 ;
                    BCS   CODE_0DCF46         ;
CODE_0DCF3E:        LDY.b #$02                ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DCF46         ;
                    DEY                       ;
CODE_0DCF46:        STY.b $47,x               ;
CODE_0DCF48:        JSR.w CODE_0DCF81         ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.w $043D,x             ;
                    CMP.b #$20                ;
                    BCC   CODE_0DCF59         ;
                    STA.w $0238,x             ;
CODE_0DCF59:        LDY.b $47,x               ;
                    DEY                       ;
                    BNE   CODE_0DCF6E         ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b $5E,x               ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    RTS                       ;

CODE_0DCF6E:        LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.b $5E,x               ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    SBC.b #$00                ;
                    STA.b $79,x               ;
                    RTS                       ;

CODE_0DCF7E:        JMP.w CODE_0DBF2D         ;

CODE_0DCF81:        LDA.b $A1,x               ;
                    AND.b #$02                ;
                    BNE   CODE_0DCFB8         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    PHA                       ;
                    LDA.b $A1,x               ;
                    LSR   A                   ;
                    BCS   CODE_0DCFA3         ;
                    PLA                       ;
                    BNE   CODE_0DCFA2         ;
                    INC.w $043D,x             ;
                    LDA.w $043D,x             ;
                    STA.b $5E,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0DCFA2         ;
                    INC.b $A1,x               ;
CODE_0DCFA2:        RTS                       ;

CODE_0DCFA3:        PLA                      
                    BNE   CODE_0DCFB7         ;
                    DEC.w $043D,x             ;
                    LDA.w $043D,x             ;
                    STA.b $5E,x               ;
                    BNE   CODE_0DCFB7         ;
                    INC.b $A1,x               ;
                    LDA.b #$02                ;
                    STA.w $07A2,x             ;
CODE_0DCFB7:        RTS                       ;

CODE_0DCFB8:        LDA.w $07A2,x             ;
                    BEQ   CODE_0DCFC6         ;
CODE_0DCFBD:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_0DCFC5         ;
                    INC.w $0238,x             ;
CODE_0DCFC5:        RTS                       ;

CODE_0DCFC6:        LDA.w $0238,x             ;
                    ADC.b #$10                ;
                    CMP.w $0237               ;
                    BCC   CODE_0DCFBD         ;
                    LDA.b #$00                ;
                    STA.b $A1,x               ;
                    RTS                       ;

CODE_0DCFD5:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DCFDE         ;
                    JMP.w CODE_0DBF33         ;

CODE_0DCFDE:        LDA.b #$E8                ;
                    STA.b $5E,x               ;
                    JMP.w CODE_0DBEA0         ;

                    db $40,$80,$04,$04

CODE_0DCFE9:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DCFF2         ;
                    JMP.w CODE_0DBF2D         ;

CODE_0DCFF2:        STA.b $03                 ;
                    LDA.b $1C,x               ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    TAY                       ;
                    LDA.w $CFE5,y             ;
                    STA.b $02                 ;
                    LDA.w $0402,x             ;
                    SEC                       ;
                    SBC.b $02                 ;
                    STA.w $0402,x             ;
                    LDA.w $021A,x             ;
                    SBC.b #$00                ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    SBC.b #$00                ;
                    STA.b $79,x               ;
                    LDA.b #$40                ;
                    STA.b $02                 ;
                    CPX.b #$02                ;
                    BCC   CODE_0DD069         ;
                    LDA.b $5E,x               ;
                    CMP.b #$10                ;
                    BCC   CODE_0DD03B         ;
                    LDA.w $041D,x             ;
                    CLC                       ;
                    ADC.b $02                 ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    ADC.b $03                 ;
                    STA.w $0238,x             ;
                    LDA.b $BC,x               ;
                    ADC.b #$00                ;
                    BRA   CODE_0DD050         ;

CODE_0DD03B:        LDA.w $041D,x             ;
                    SEC                       ;
                    SBC.b $02                 ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    SBC.b $03                 ;
                    STA.w $0238,x             ;
                    LDA.b $BC,x               ;
                    SBC.b #$00                ;
CODE_0DD050:        STA.b $BC,x               ;
                    LDY.b #$00                ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.w $043D,x             ;
                    BPL   CODE_0DD062         ;
                    LDY.b #$10                ;
                    EOR.b #$FF                ;
                    INC   A                   ;
CODE_0DD062:        CMP.b #$0F                ;
                    BCC   CODE_0DD069         ;
                    TYA                       ;
                    STA.b $5E,x               ;
CODE_0DD069:        RTS                       ;

                    db $00,$01,$03,$04,$05,$06,$07,$07
                    db $08,$00,$03,$06,$09,$0B,$0D,$0E
                    db $0F,$10,$00,$04,$09,$0D,$10,$13
                    db $16,$17,$18,$00,$06,$0C,$12,$16
                    db $1A,$1D,$1F,$20,$00,$07,$0F,$16
                    db $1C,$21,$25,$27,$28,$00,$09,$12
                    db $1B,$21,$27,$2C,$2F,$30,$00,$0B
                    db $15,$1F,$27,$2E,$33,$37,$38,$00
                    db $0C,$18,$24,$2D,$35,$3B,$3E,$40
                    db $00,$0E,$1B,$28,$32,$3B,$42,$46
                    db $48,$00,$0F,$1F,$2D,$38,$42,$4A
                    db $4E,$50,$00,$11,$22,$31,$3E,$49
                    db $51,$56,$58,$01,$03,$02,$00,$00
                    db $09,$12,$1B,$24,$2D,$36,$3F,$48
                    db $51,$5A,$63,$0C,$18

CODE_0DD0DF:        JSR.w CODE_0DFDE1         ;
                    LDA.w $03D1               ;
                    AND.b #$08                ;
                    BNE   CODE_0DD159         ;
                    LDA.w $0747               ;
                    BNE   CODE_0DD0F8         ;
                    LDA.w $0388,x             ;
                    JSR.w CODE_0DD7E4         ;
                    AND.b #$1F                ;
                    STA.b $A1,x               ;
CODE_0DD0F8:        LDA.b $A1,x               ;
                    LDY.b $1C,x               ;
                    CPY.b #$1F                ;
                    BCC   CODE_0DD10B         ;
                    CMP.b #$08                ;
                    BEQ   CODE_0DD108         ;
                    CMP.b #$18                ;
                    BNE   CODE_0DD10B         ;
CODE_0DD108:        INC   A                   ;
                    STA.b $A1,x               ;
CODE_0DD10B:        STA.b $EF                 ;
                    JSR.w CODE_0DFD4F         ;
                    JSR.w CODE_0DD23C         ;
                    LDY.w $0B46,x             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    STA.b $07                 ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.b $06                 ;
                    LDA.b #$01                ;
                    STA.b $00                 ;
                    JSR.w CODE_0DD1B5         ;
                    LDY.b #$05                ;
                    LDA.b $1C,x               ;
                    CMP.b #$1F                ;
                    BCC   CODE_0DD137         ;
                    LDY.b #$0B                ;
CODE_0DD137:        STY.b $ED                 ;
                    STZ.b $00                 ;
CODE_0DD13B:        LDA.b $EF                 ;
                    JSR.w CODE_0DD23C         ;
                    JSR.w CODE_0DD15A         ;
                    LDA.b $00                 ;
                    CMP.b #$04                ;
                    BNE   CODE_0DD151         ;
                    LDY.w $06CF               ;
                    LDA.w $0B46,y             ;
                    STA.b $06                 ;
CODE_0DD151:        INC.b $00                 ;
                    LDA.b $00                 ;
                    CMP.b $ED                 ;
                    BCC   CODE_0DD13B         ;
CODE_0DD159:        RTS                       ;

CODE_0DD15A:        LDA.b $03                 ;
                    STA.b $05                 ;
                    LDY.b $06                 ;
                    LDA.b $01                 ;
                    LSR.b $05                 ;
                    BCS   CODE_0DD169         ;
                    EOR.b #$FF                ;
                    INC   A                   ;
CODE_0DD169:        CLC                       ;
                    ADC.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.b $06                 ;
                    CMP.w $03AE               ;
                    BCS   CODE_0DD180         ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b $06                 ;
                    JMP.w CODE_0DD184         ;

CODE_0DD180:        SEC                       ;
                    SBC.w $03AE               ;
CODE_0DD184:        CMP.b #$59                ;
                    BCC   CODE_0DD18C         ;
                    LDA.b #$F8                ;
                    BNE   CODE_0DD1A0         ;
CODE_0DD18C:        LDA.w $03B9               ;
                    CMP.b #$F8                ;
                    BEQ   CODE_0DD1A0         ;
                    LDA.b $02                 ;
                    LSR.b $05                 ;
                    BCS   CODE_0DD19C         ;
                    EOR.b #$FF                ;
                    INC   A                   ;
CODE_0DD19C:        CLC                       ;
                    ADC.w $03B9               ;
CODE_0DD1A0:        STA.w $0901,y             ;
                    STA.b $07                 ;
                    CMP.b #$F0                ;
                    BCC   CODE_0DD1B0         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
                    BRA   CODE_0DD1B5         ;

CODE_0DD1B0:        LDA.b #$00                ;
                    STA.w $0D00,y             ;
CODE_0DD1B5:        JSR.w CODE_0DF47B         ;
                    TYA                       ;
                    PHA                       ;
                    LDA.w $07AF               ;
                    ORA.w $0747               ;
                    BNE   CODE_0DD233         ;
                    STA.b $05                 ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_0DD233         ;
                    LDY.w $0237               ;
                    LDA.w $0754               ;
                    BNE   CODE_0DD1D6         ;
                    LDA.w $0714               ;
                    BEQ   CODE_0DD1DF         ;
CODE_0DD1D6:        INC.b $05                 ;
                    INC.b $05                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$18                ;
                    TAY                       ;
CODE_0DD1DF:        TYA                       ;
CODE_0DD1E0:        SEC                       ;
                    SBC.b $07                 ;
                    BPL   CODE_0DD1E8         ;
                    EOR.b #$FF                ;
                    INC   A                   ;
CODE_0DD1E8:        CMP.b #$08                ;
                    BCS   CODE_0DD206         ;
                    LDA.b $06                 ;
                    CMP.b #$F0                ;
                    BCS   CODE_0DD206         ;
                    LDA.w $03AD               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.b $04                 ;
                    SEC                       ;
                    SBC.b $06                 ;
                    BPL   CODE_0DD202         ;
                    EOR.b #$FF                ;
                    INC   A                   ;
CODE_0DD202:        CMP.b #$08                ;
                    BCC   CODE_0DD21A         ;
CODE_0DD206:        LDA.b $05                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DD233         ;
                    LDY.b $05                 ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.w $D0DD,y             ;
                    INC.b $05                 ;
                    JMP.w CODE_0DD1E0         ;

CODE_0DD21A:        LDX.b #$01                ;
                    LDA.b $04                 ;
                    CMP.b $06                 ;
                    BCS   CODE_0DD223         ;
                    INX                       ;
CODE_0DD223:        TXA                       ;
                    LDX.b $9E                 ;
                    STA.b $47,x               ;
                    LDX.b #$00                ;
                    LDA.b $00                 ;
                    PHA                       ;
                    JSR.w CODE_0DDE82         ;
                    PLA                       ;
                    STA.b $00                 ;
CODE_0DD233:        PLA                       ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.b $06                 ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DD23C:        PHA                       ;
                    AND.b #$0F                ;
                    CMP.b #$09                ;
                    BCC   CODE_0DD246         ;
                    EOR.b #$0F                ;
                    INC   A                   ;
CODE_0DD246:        STA.b $01                 ;
                    LDY.b $00                 ;
                    LDA.w $D0D1,y             ;
                    CLC                       ;
                    ADC.b $01                 ;
                    TAY                       ;
                    LDA.w $D06A,y             ;
                    STA.b $01                 ;
                    PLA                       ;
                    PHA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    AND.b #$0F                ;
                    CMP.b #$09                ;
                    BCC   CODE_0DD264         ;
                    EOR.b #$0F                ;
                    INC   A                   ;
CODE_0DD264:        STA.b $02                 ;
                    LDY.b $00                 ;
                    LDA.w $D0D1,y             ;
                    CLC                       ;
                    ADC.b $02                 ;
                    TAY                       ;
                    LDA.w $D06A,y             ;
                    STA.b $02                 ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $D0CD,y             ;
                    STA.b $03                 ;
                    RTS                       ;

                    db $F8,$A0,$70,$BD,$00,$00,$00,$00
                    db $20,$20

CODE_0DD289:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DD297         ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    JMP.w CODE_0DBF33         ;

CODE_0DD297:        JSR.w CODE_0DBEA0         ;
                    LDY.b #$0D                ;
                    LDA.b #$05                ;
                    JSR.w CODE_0DBF37         ;
                    LDA.w $043D,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.w $D27F,y             ;
                    BPL   CODE_0DD2B5         ;
                    EOR.b #$FF                ;
                    INC   A                   ;
CODE_0DD2B5:        CMP.b #$08                ;
                    BCS   CODE_0DD2C4         ;
                    LDA.w $043D,x             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
CODE_0DD2C4:        LDA.w $D284,y             ;
                    STA.w $0257,x             ;
                    RTS                       ;

                    db $15,$30,$40

CODE_0DD2CE:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DD2D7         ;
                    JMP.w CODE_0DBF06         ;

CODE_0DD2D7:        LDA.b $29,x               ;
                    BEQ   CODE_0DD2E4         ;
                    STZ.b $A1,x               ;
                    STZ.w $06CB               ;
                    LDA.b #$10                ;
                    BNE   CODE_0DD2F7         ;
CODE_0DD2E4:        LDA.b #$12                ;
                    STA.w $06CB               ;
                    LDY.b #$02                ;
CODE_0DD2EB:        LDA.w $D2CB,y             ;
                    STA.w $01,y             ;
                    DEY                       ;
                    BPL   CODE_0DD2EB         ;
                    JSR.w CODE_0DD30E         ;
CODE_0DD2F7:        STA.b $5E,x               ;
                    LDY.b #$01                ;
                    LDA.b $A1,x               ;
                    AND.b #$01                ;
                    BNE   CODE_0DD309         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $5E,x               ;
                    INY                       ;
CODE_0DD309:        STY.b $47,x               ;
                    JMP.w CODE_0DBEA0         ;

CODE_0DD30E:        LDY.b #$00                ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DD31D         ;
                    INY                       ;
                    LDA.b $00                 ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $00                 ;
CODE_0DD31D:        LDA.b $00                 ;
                    CMP.b #$3C                ;
                    BCC   CODE_0DD33F         ;
                    LDA.b #$3C                ;
                    STA.b $00                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$11                ;
                    BNE   CODE_0DD33F         ;
                    TYA                       ;
                    CMP.b $A1,x               ;
                    BEQ   CODE_0DD33F         ;
                    LDA.b $A1,x               ;
                    BEQ   CODE_0DD33C         ;
                    DEC.b $5E,x               ;
                    LDA.b $5E,x               ;
                    BNE   CODE_0DD37A         ;
CODE_0DD33C:        TYA                       ;
                    STA.b $A1,x               ;
CODE_0DD33F:        LDA.b $00                 ;
                    AND.b #$3C                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDY.b #$00                ;
                    LDA.b $5D                 ;
                    BEQ   CODE_0DD371         ;
                    LDA.w $0775               ;
                    BEQ   CODE_0DD371         ;
                    INY                       ;
                    LDA.b $5D                 ;
                    CMP.b #$19                ;
                    BCC   CODE_0DD361         ;
                    LDA.w $0775               ;
                    CMP.b #$02                ;
                    BCC   CODE_0DD361         ;
                    INY                       ;
CODE_0DD361:        LDA.b $1C,x               ;
                    CMP.b #$12                ;
                    BNE   CODE_0DD36B         ;
                    LDA.b $5D                 ;
                    BNE   CODE_0DD371         ;
CODE_0DD36B:        LDA.b $A1,x               ;
                    BNE   CODE_0DD371         ;
                    LDY.b #$00                ;
CODE_0DD371:        LDA.w $01,y             ;
                    LDY.b $00                 ;
CODE_0DD376:        DEC   A                   ;
                    DEY                       ;
                    BPL   CODE_0DD376         ;
CODE_0DD37A:        RTS                       ;

                    db $1A,$58,$98,$96,$94,$92,$90,$8E
                    db $8C,$8A,$88,$86,$84,$82,$80

CODE_0DD38A:        PHX                       
                    LDX.w $0369               ;
                    DEX                       ;
                    DEX                       ;
                    STX.w $0334               ;
                    AND.b #$80                ;
                    BEQ   CODE_0DD3B8         ;
                    STZ.w $030D,x             ;
                    LDA.b #$01                ;
                    STA.w $0300,x             ;
                    LDA.b $04                 ;
                    AND.b #$1F                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $E4                 ;
                    LDA.b #$00                ;
                    SEC                       ;
                    SBC.b $42                 ;
                    CLC                       ;
                    ADC.b $E4                 ;
                    STA.w $031A,x             ;
                    LDA.b #$03                ;
                    STA.w $0327,x             ;
CODE_0DD3B8:        PLX                       ;
                    RTS                       ;

CODE_0DD3BA:        LDX.w $0368               ;
                    LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BNE   CODE_0DD3D4         ;
                    STX.b $9E                 ;
                    LDA.b $29,x               ;
                    BEQ   CODE_0DD3ED         ;
                    AND.b #$40                ;
                    BEQ   CODE_0DD3D4         ;
                    LDA.w $0238,x             ;
                    CMP.b #$E0                ;
                    BCC   CODE_0DD3E7         ;
CODE_0DD3D4:        LDA.w $95               ;
                    BNE   CODE_0DD3E1         ;
                    LDA.b #$0B                ;
                    STA.w $1602               ;
                    STA.w $95               ;
CODE_0DD3E1:        INC.w $0772               ;
                    JMP.w CODE_0DD462         ;

CODE_0DD3E7:        JSR.w CODE_0DBF2D         ;
                    JMP.w CODE_0DD56E         ;

CODE_0DD3ED:        DEC.w $0364               ;
                    BNE   CODE_0DD441         ;
                    LDA.b #$04                ;
                    STA.w $0364               ;
                    LDA.w $0363               ;
                    EOR.b #$01                ;
                    STA.w $0363               ;
                    LDA.b #$02                ;
                    STA.b $05                 ;
                    LDY.w $0369               ;
                    LDA.w $D37B,y             ;
                    STA.b $04                 ;
                    JSR.w CODE_0DD38A         ;
                    LDY.w $1700               ;
                    INY                       ;
                    LDX.b #$18                ;
                    JSR.w CODE_0D90C6         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0D9085         ;
                    LDA.b #$16                ;
                    STA.w $1603               ;
                    LDA.w $0369               ;
                    BNE   CODE_0DD430         ;
                    LDA.b #$08                ;
                    STA.w $014B               ;
                    LDA.b #$FF                ;
                    STA.w $0F4C               ;
CODE_0DD430:        INC.w $0369               ;
                    LDA.w $0369               ;
                    CMP.b #$0F                ;
                    BNE   CODE_0DD441         ;
                    JSR.w CODE_0DC5E1         ;
                    LDA.b #$40                ;
                    STA.b $29,x               ;
CODE_0DD441:        JMP.w CODE_0DD56E         ;

                    db $21,$41,$11,$31

CODE_0DD448:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_0DD470         ;
                    LDA.w $0238,x             ;
                    CMP.b #$E0                ;
                    BCC   CODE_0DD3E7         ;
                    LDA.w $0EC4               ;
                    BNE   CODE_0DD462         ;
                    LDA.w $0201               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DD462         ;
                    RTS                       ;

CODE_0DD462:        LDX.b #$08                ;
CODE_0DD464:        JSR.w CODE_0DCCEA         ;
                    DEX                       ;
                    BPL   CODE_0DD464         ;
                    STA.w $06CB               ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DD470:        STZ.w $06CB               ;
                    LDA.w $0747               ;
                    BEQ   CODE_0DD47B         ;
                    JMP.w CODE_0DD52B         ;

CODE_0DD47B:        LDA.w $0363               ;
                    BPL   CODE_0DD483         ;
                    JMP.w CODE_0DD500         ;

CODE_0DD483:        DEC.w $0364               ;
                    BNE   CODE_0DD495         ;
                    LDA.b #$20                ;
                    STA.w $0364               ;
                    LDA.w $0363               ;
                    EOR.b #$01                ;
                    STA.w $0363               ;
CODE_0DD495:        LDA.b $09                 ;
                    AND.b #$0F                ;
                    BNE   CODE_0DD49F         ;
                    LDA.b #$02                ;
                    STA.b $47,x               ;
CODE_0DD49F:        LDA.w $0792,x             ;
                    BEQ   CODE_0DD4C1         ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DD4C1         ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
                    LDA.b #$02                ;
                    STA.w $0365               ;
                    LDA.b #$20                ;
                    STA.w $0792,x             ;
                    STA.w $079C               ;
                    LDA.w $021A,x             ;
                    CMP.b #$B0                ;
                    BCS   CODE_0DD500         ;
CODE_0DD4C1:        LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_0DD500         ;
                    LDA.w $021A,x             ;
                    CMP.w $0366               ;
                    BNE   CODE_0DD4DB         ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $D444,y             ;
                    STA.w $06DC               ;
CODE_0DD4DB:        LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.w $0365               ;
                    STA.w $021A,x             ;
                    LDY.b $47,x               ;
                    CPY.b #$01                ;
                    BEQ   CODE_0DD500         ;
                    LDY.b #$FF                ;
                    SEC                       ;
                    SBC.w $0366               ;
                    BPL   CODE_0DD4F8         ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    LDY.b #$01                ;
CODE_0DD4F8:        CMP.w $06DC               ;
                    BCC   CODE_0DD500         ;
                    STY.w $0365               ;
CODE_0DD500:        LDA.w $0792,x             ;
                    BNE   CODE_0DD52E         ;
                    JSR.w CODE_0DBF2D         ;
                    LDA.w $075F               ;
                    CMP.b #$05                ;
                    BCC   CODE_0DD518         ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_0DD518         ;
                    JSR.w CODE_0DB961         ;
CODE_0DD518:        LDA.w $0238,x             ;
                    CMP.b #$80                ;
                    BCC   CODE_0DD53C         ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $D444,y             ;
                    STA.w $0792,x             ;
CODE_0DD52B:        JMP.w CODE_0DD53C         ;

CODE_0DD52E:        CMP.b #$01                ;
                    BNE   CODE_0DD53C         ;
                    DEC.w $0238,x             ;
                    JSR.w CODE_0DC5E1         ;
                    LDA.b #$FE                ;
                    STA.b $A1,x               ;
CODE_0DD53C:        LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DD547         ;
                    CMP.b #$05                ;
                    BCS   CODE_0DD56E         ;
CODE_0DD547:        LDA.w $079C               ;
                    BNE   CODE_0DD56E         ;
                    LDA.b #$20                ;
                    STA.w $079C               ;
                    LDA.w $0363               ;
                    EOR.b #$80                ;
                    STA.w $0363               ;
                    BMI   CODE_0DD53C         ;
                    JSR.w CODE_0DD5EA         ;
                    LDY.w $06CC               ;
                    BEQ   CODE_0DD566         ;
                    SEC                       ;
                    SBC.b #$10                ;
CODE_0DD566:        STA.w $079C               ;
                    LDA.b #$15                ;
                    STA.w $06CB               ;
CODE_0DD56E:        JSR.w CODE_0DD5C5         ;
                    LDY.b #$10                ;
                    LDA.b $47,x               ;
                    LSR   A                   ;
                    BCC   CODE_0DD57A         ;
                    LDY.b #$F0                ;
CODE_0DD57A:        TYA                       ;
                    CLC                       ;
                    ADC.w $021A,x             ;
                    LDY.w $06CF               ;
                    STA.w $021A,y             ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0238,y             ;
                    LDA.b $29,x               ;
                    STA.w $29,y             ;
                    LDA.b $47,x               ;
                    STA.w $47,y             ;
                    LDA.b $9E                 ;
                    PHA                       ;
                    LDX.w $06CF               ;
                    STX.b $9E                 ;
                    LDA.b $97                 ;
                    BNE   CODE_0DD5B4         ;
                    LDA.w $0EC4               ;
                    BEQ   CODE_0DD5AD         ;
                    LDA.b #$05                ;
                    BRA   CODE_0DD5AF         ;

CODE_0DD5AD:        LDA.b #$04                ;
CODE_0DD5AF:        STA.w $1602               ;
                    STA.b $97                 ;
CODE_0DD5B4:        LDA.b #$2D                ;
                    STA.b $1C,x               ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    PLA                       ;
                    STA.b $9E                 ;
                    TAX                       ;
                    STZ.w $036A               ;
CODE_0DD5C4:        RTS                       ;

CODE_0DD5C5:        INC.w $036A               ;
                    JSR.w CODE_0DCC11         ;
                    LDA.b $29,x               ;
                    BNE   CODE_0DD5C4         ;
                    LDA.b #$0A                ;
                    STA.w $0490,x             ;
                    JSR.w CODE_0DE948         ;
                    LDA.w $0770               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DD5E1         ;
                    JMP.w CODE_0DDD7D         ;

CODE_0DD5E1:        RTS                       ;

                    LDA.l $BFBF40,x           ;
                    LDA.l $BF4040,x           ;
CODE_0DD5EA:        LDY.w $0367               ;
                    INC.w $0367               ;
                    LDA.w $0367               ;
                    AND.b #$07                ;
                    STA.w $0367               ;
                    LDA.w $D5E2,y             ;
CODE_0DD5FB:        RTS                       ;

CODE_0DD5FC:        CPX.w $0F4D               ;
                    BNE   CODE_0DD60D         ;
                    LDA.w $0F4C               ;
                    BEQ   CODE_0DD60D         ;
                    LDA.w $014B               ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DD651         ;
CODE_0DD60D:        LDA.w $0747               ;
                    BNE   CODE_0DD646         ;
                    LDA.b #$40                ;
                    LDY.w $06CC               ;
                    BEQ   CODE_0DD61B         ;
                    LDA.b #$60                ;
CODE_0DD61B:        STA.b $00                 ;
                    LDA.w $0402,x             ;
                    SEC                       ;
                    SBC.b $00                 ;
                    STA.w $0402,x             ;
                    LDA.w $021A,x             ;
                    SBC.b #$01                ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    SBC.b #$00                ;
                    STA.b $79,x               ;
                    LDY.w $041D,x             ;
                    LDA.w $0238,x             ;
                    CMP.w $C851,y             ;
                    BEQ   CODE_0DD646         ;
                    CLC                       ;
                    ADC.w $043D,x             ;
                    STA.w $0238,x             ;
CODE_0DD646:        JSR.w CODE_0DFD4F         ;
                    LDA.b $29,x               ;
                    BNE   CODE_0DD5FB         ;
                    JSL.l CODE_0FD3E9         ;
CODE_0DD651:        RTS                       ;

CODE_0DD652:        DEC.b $A1,x               ;
                    BNE   CODE_0DD66D         ;
                    LDA.b #$08                ;
                    STA.b $A1,x               ;
                    INC.b $5E,x               ;
                    LDA.b $5E,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DD669         ;
                    LDA.b #$29                ;
                    STA.w $1600               ;
                    BRA   CODE_0DD66D         ;

CODE_0DD669:        CMP.b #$04                ;
                    BCS   CODE_0DD685         ;
CODE_0DD66D:        JSR.w CODE_0DFD4F         ;
                    LDA.w $03B9               ;
                    STA.w $03BA               ;
                    LDA.w $03AE               ;
                    STA.w $03AF               ;
                    LDY.w $0B46,x             ;
                    LDA.b $5E,x               ;
                    JSR.w CODE_0DF538         ;
                    RTS                       ;

CODE_0DD685:        STZ.b $10,x               ;
                    LDY.w $0B46,x             ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    LDA.b #$05                ;
                    STA.w $0149               ;
                    JMP.w CODE_0DD70E         ;

CODE_0DD6A0:        STZ.w $06CB               ;
                    LDA.w $0746               ;
                    CMP.b #$05                ;
                    BCS   CODE_0DD6E9         ;
                    JSR.w CODE_0D9693         ;

                    dw CODE_0DD6E9
                    dw CODE_0DD6B7
                    dw CODE_0DD6F4
                    dw CODE_0DD71F
                    dw CODE_0DD772

CODE_0DD6B7:        LDA.w $07EB               ;
                    CMP.w $07DF               ;
                    BNE   CODE_0DD6CF         ;
                    AND.b #$01                ;
                    BEQ   CODE_0DD6C9         ;
                    LDY.b #$03                ;
                    LDA.b #$03                ;
                    BNE   CODE_0DD6D3         ;
CODE_0DD6C9:        LDY.b #$00                ;
                    LDA.b #$06                ;
                    BNE   CODE_0DD6D3         ;
CODE_0DD6CF:        LDY.b #$00                ;
                    LDA.b #$FF                ;
CODE_0DD6D3:        STA.w $06D7               ;
                    STY.b $29,x               ;
                    LDA.w $2143               ;
                    AND.b #$7F                ;
                    CMP.b #$4B                ;
                    BEQ   CODE_0DD6E6         ;
                    LDA.b #$4B                ;
                    STA.w $1603               ;
CODE_0DD6E6:        INC.w $0746               ;
CODE_0DD6E9:        RTS                       ;

CODE_0DD6EA:        LDA.b #$4C                ;
                    STA.w $1603               ;
                    STA.w $0E1A               ;
                    BRA   CODE_0DD6E6         ;

CODE_0DD6F4:        LDA.w $07E9               ;
                    ORA.w $07EA               ;
                    ORA.w $07EB               ;
                    BEQ   CODE_0DD6EA         ;
CODE_0DD6FF:        LDY.b #$23                ;
                    LDA.b #$FF                ;
                    STA.w $014A               ;
                    JSR.w CODE_0D98AA         ;
                    LDA.b #$05                ;
                    STA.w $014A               ;
CODE_0DD70E:        LDY.b #$0B                ;
                    JSR.w CODE_0D98AA         ;
                    LDA.w $0753               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$04                ;
                    JMP.w CODE_0DBB30         ;

CODE_0DD71F:        LDA.b #$01                ;
                    STA.b $1B                 ;
                    LDA.w $0238,x             ;
                    CMP.b #$72                ;
                    BCC   CODE_0DD72F         ;
                    DEC.w $0238,x             ;
                    BRA   CODE_0DD73B         ;

CODE_0DD72F:        LDA.w $06D7               ;
                    BEQ   CODE_0DD766         ;
                    BMI   CODE_0DD766         ;
                    LDA.b #$16                ;
                    STA.w $06CB               ;
CODE_0DD73B:        JSR.w CODE_0DFD4F         ;
                    LDY.w $0B46,x             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    LDA.b $09                 ;
                    AND.b #$18                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0902,y             ;
                    LDA.b #$0B                ;
                    STA.w $0903,y             ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DD766:        JSR.w CODE_0DD73B         ;
                    LDA.b #$06                ;
                    STA.w $07A2,x             ;
CODE_0DD76E:        INC.w $0746               ;
                    RTS                       ;

CODE_0DD772:        JSR.w CODE_0DD73B         ;
                    LDA.w $07A2,x             ;
                    BNE   CODE_0DD77F         ;
                    LDA.w $07B1               ;
                    BEQ   CODE_0DD76E         ;
CODE_0DD77F:        RTS                       ;

CODE_0DD780:        LDA.b $29,x               ;
                    BNE   CODE_0DD7DE         ;
                    LDA.w $0792,x             ;
                    BNE   CODE_0DD7DE         ;
                    LDA.b $A1,x               ;
                    BNE   CODE_0DD7AD         ;
                    LDA.b $5E,x               ;
                    BMI   CODE_0DD7A4         ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DD79D         ;
                    LDA.b $00                 ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $00                 ;
CODE_0DD79D:        LDA.b $00                 ;
                    CMP.w $0F25               ;
                    BCC   CODE_0DD7DE         ;
CODE_0DD7A4:        LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $5E,x               ;
                    INC.b $A1,x               ;
CODE_0DD7AD:        LDA.w $043D,x             ;
                    LDY.b $5E,x               ;
                    BPL   CODE_0DD7B7         ;
                    LDA.w $041D,x             ;
CODE_0DD7B7:        STA.b $00                 ;
                    LDA.w $0F24               ;
                    CMP.b #$2C                ;
                    BEQ   CODE_0DD7C5         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_0DD7DE         ;
CODE_0DD7C5:        LDA.w $0747               ;
                    BNE   CODE_0DD7DE         ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b $5E,x               ;
                    STA.w $0238,x             ;
                    CMP.b $00                 ;
                    BNE   CODE_0DD7DE         ;
                    STZ.b $A1,x               ;
                    LDA.b #$40                ;
                    STA.w $0792,x             ;
CODE_0DD7DE:        LDA.b #$00                ;
                    STA.w $0257,x             ;
                    RTS                       ;

CODE_0DD7E4:        STA.b $07                 ;
                    LDA.w $0203,x             ;
                    BNE   CODE_0DD7F9         ;
                    LDY.b #$18                ;
                    LDA.b $5E,x               ;
                    CLC                       ;
                    ADC.b $07                 ;
                    STA.b $5E,x               ;
                    LDA.b $A1,x               ;
                    ADC.b #$00                ;
                    RTS                       ;

CODE_0DD7F9:        LDY.b #$08                ;
                    LDA.b $5E,x               ;
                    SEC                       ;
                    SBC.b $07                 ;
                    STA.b $5E,x               ;
                    LDA.b $A1,x               ;
                    SBC.b #$00                ;
                    RTS                       ;

CODE_0DD807:        LDA.b $BC,x               ;
                    CMP.b #$03                ;
                    BNE   CODE_0DD810         ;
                    JMP.w CODE_0DCCEA         ;

CODE_0DD810:        LDA.b $29,x               ;
                    BPL   CODE_0DD815         ;
CODE_0DD814:        RTS                       ;

CODE_0DD815:        TAY                       ;
                    LDA.w $1C,y             ;
                    CMP.b #$24                ;
                    BNE   CODE_0DD814         ;
                    LDA.w $03A2,x             ;
                    STA.b $00                 ;
                    LDA.b $47,x               ;
                    BEQ   CODE_0DD829         ;
                    JMP.w CODE_0DDA34         ;

CODE_0DD829:        LDA.b #$2D                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_0DD840         ;
                    CPY.b $00                 ;
                    BEQ   CODE_0DD83D         ;
                    CLC                       ;
                    ADC.b #$02                ;
                    STA.w $0238,x             ;
                    JMP.w CODE_0DDA2A         ;

CODE_0DD83D:        JMP.w CODE_0DDA11         ;

CODE_0DD840:        CMP.w $0238,y             ;
                    BCC   CODE_0DD852         ;
                    CPX.b $00                 ;
                    BEQ   CODE_0DD83D         ;
                    CLC                       ;
                    ADC.b #$02                ;
                    STA.w $0238,y             ;
                    JMP.w CODE_0DDA2A         ;

CODE_0DD852:        LDA.w $0238,x             ;
                    PHA                       ;
                    LDA.w $03A2,x             ;
                    BPL   CODE_0DD873         ;
                    LDA.w $043D,x             ;
                    CLC                       ;
                    ADC.b #$05                ;
                    STA.b $00                 ;
                    LDA.b $A1,x               ;
                    ADC.b #$00                ;
                    BMI   CODE_0DD883         ;
                    BNE   CODE_0DD877         ;
                    LDA.b $00                 ;
                    CMP.b #$0B                ;
                    BCC   CODE_0DD87D         ;
                    BCS   CODE_0DD877         ;
CODE_0DD873:        CMP.b $9E                 ;
                    BEQ   CODE_0DD883         ;
CODE_0DD877:        JSR.w CODE_0DBF5A         ;
                    JMP.w CODE_0DD886         ;

CODE_0DD87D:        JSR.w CODE_0DDA2A         ;
                    JMP.w CODE_0DD886         ;

CODE_0DD883:        JSR.w CODE_0DBF56         ;
CODE_0DD886:        LDY.b $29,x               ;
                    PLA                       ;
                    SEC                       ;
                    SBC.w $0238,x             ;
                    CLC                       ;
                    ADC.w $0238,y             ;
                    STA.w $0238,y             ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_0DD89D         ;
                    TAX                       ;
                    JSR.w CODE_0DE21B         ;
CODE_0DD89D:        LDY.b $9E                 ;
                    LDA.w $A1,y             ;
                    ORA.w $043D,y             ;
                    BNE   CODE_0DD8AA         ;
                    JMP.w CODE_0DD9B9         ;

CODE_0DD8AA:        LDA.w $A1,y             ;
                    PHA                       ;
                    PHA                       ;
                    PHA                       ;
                    JSR.w CODE_0DD9BC         ;
                    LDA.b $42                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $F3                 ;
                    LDA.b $43                 ;
                    AND.b #$01                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$20                ;
                    STA.b $F4                 ;
                    LDA.b $F3                 ;
                    CLC                       ;
                    ADC.b #$1F                ;
                    TAX                       ;
                    AND.b #$1F                ;
                    STA.b $F5                 ;
                    TXA                       ;
                    AND.b #$20                ;
                    BEQ   CODE_0DD8D9         ;
                    LDA.b $F4                 ;
                    EOR.b #$04                ;
                    STA.b $F6                 ;
CODE_0DD8D9:        REP   #$30                ;
                    LDA.b $00                 ;
                    AND.w #$241F              ;
                    CMP.b $F3                 ;
                    BCS   CODE_0DD8EB         ;
                    CMP.b $F5                 ;
                    BCC   CODE_0DD8EB         ;
                    JMP.w CODE_0DD944         ;

CODE_0DD8EB:        TYA                       ;
                    AND.w #$00FF              ;
                    TAY                       ;
                    LDX.w $1700               ;
                    LDA.b $00                 ;
                    AND.w #$1FFF              ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    LDA.w #$0300              ;
                    STA.w $1704,x             ;
                    LDA.w $A1,y             ;
                    AND.w #$0080              ;
                    BNE   CODE_0DD92D         ;
                    LDA.w $1702,x             ;
                    AND.w #$F003              ;
                    CMP.w #$A000              ;
                    BEQ   CODE_0DD91A         ;
                    CMP.w #$B000              ;
                    BNE   CODE_0DD91F         ;
CODE_0DD91A:        LDA.w #$185C              ;
                    BRA   CODE_0DD922         ;

CODE_0DD91F:        LDA.w #$10A2              ;
CODE_0DD922:        STA.w $1706,x             ;
                    LDA.w #$18A3              ;
                    STA.w $1708,x             ;
                    BRA   CODE_0DD936         ;

CODE_0DD92D:        LDA.w #$0024              ;
                    STA.w $1706,x             ;
                    STA.w $1708,x             ;
CODE_0DD936:        LDA.w #$FFFF              ;
                    STA.w $170A,x             ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.w $1700               ;
CODE_0DD944:        SEP   #$30                ;
                    LDA.w $29,y             ;
                    TAY                       ;
                    PLA                       ;
                    EOR.b #$FF                ;
                    JSR.w CODE_0DD9BC         ;
                    REP   #$30                ;
                    LDA.b $00                 ;
                    AND.w #$241F              ;
                    CMP.b $F3                 ;
                    BCS   CODE_0DD962         ;
                    CMP.b $F5                 ;
                    BCC   CODE_0DD962         ;
                    JMP.w CODE_0DD9B6         ;

CODE_0DD962:        LDX.w $1700               ;
                    LDA.b $00                 ;
                    AND.w #$1FFF              ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    LDA.w #$0300              ;
                    STA.w $1704,x             ;
                    PLA                       ;
                    AND.w #$0080              ;
                    BEQ   CODE_0DD99D         ;
                    LDA.w #$10A2              ;
                    STA.w $1706,x             ;
                    LDA.w $1702,x             ;
                    AND.w #$F003              ;
                    CMP.w #$A000              ;
                    BEQ   CODE_0DD990         ;
                    CMP.w #$B000              ;
                    BNE   CODE_0DD995         ;
CODE_0DD990:        LDA.w #$183F              ;
                    BRA   CODE_0DD998         ;

CODE_0DD995:        LDA.w #$18A3              ;
CODE_0DD998:        STA.w $1708,x             ;
                    BRA   CODE_0DD9A6         ;

CODE_0DD99D:        LDA.w #$0024              ;
                    STA.w $1706,x             ;
                    STA.w $1708,x             ;
CODE_0DD9A6:        LDA.w #$FFFF              ;
                    STA.w $170A,x             ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.w $1700               ;
                    BRA   CODE_0DD9B7         ;

CODE_0DD9B6:        PLA                       ;
CODE_0DD9B7:        SEP   #$30                ;
CODE_0DD9B9:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DD9BC:        PHA                       ;
                    LDA.w $021A,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    LDX.w $06CC               ;
                    BNE   CODE_0DD9CB         ;
                    CLC                       ;
                    ADC.b #$10                ;
CODE_0DD9CB:        PHA                       ;
                    LDA.w $79,y             ;
                    ADC.b #$00                ;
                    STA.b $02                 ;
                    PLA                       ;
                    AND.b #$F0                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDX.w $0238,y             ;
                    PLA                       ;
                    BPL   CODE_0DD9E6         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAX                       ;
CODE_0DD9E6:        TXA                       ;
                    ASL   A                   ;
                    ROL   A                   ;
                    PHA                       ;
                    ROL   A                   ;
                    AND.b #$03                ;
                    ORA.b #$20                ;
                    STA.b $01                 ;
                    LDA.b $02                 ;
                    AND.b #$01                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $01                 ;
                    STA.b $01                 ;
                    PLA                       ;
                    AND.b #$E0                ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $00                 ;
                    LDA.w $0238,y             ;
                    CMP.b #$E8                ;
                    BCC   CODE_0DDA10         ;
                    LDA.b $00                 ;
                    AND.b #$BF                ;
                    STA.b $00                 ;
CODE_0DDA10:        RTS                       ;

CODE_0DDA11:        TYX                       ;
                    JSR.w CODE_0DFDE1         ;
                    LDA.b #$06                ;
                    JSR.w CODE_0DDFC3         ;
                    LDA.w $03AD               ;
                    STA.w $011A,x             ;
                    LDA.w $0237               ;
                    STA.w $0124,x             ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
CODE_0DDA2A:        JSR.w CODE_0DC5E1         ;
                    STA.w $A1,y             ;
                    STA.w $043D,y             ;
                    RTS                       ;

CODE_0DDA34:        TYA                       ;
                    PHA                       ;
                    JSR.w CODE_0DBF0E         ;
                    PLA                       ;
                    TAX                       ;
                    JSR.w CODE_0DBF0E         ;
                    LDX.b $9E                 ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_0DDA49         ;
                    TAX                       ;
                    JSR.w CODE_0DE21B         ;
CODE_0DDA49:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DDA4C:        LDA.b $A1,x               ;
                    ORA.w $043D,x             ;
                    BNE   CODE_0DDA69         ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    CMP.w $0402,x             ;
                    BCS   CODE_0DDA69         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_0DDA67         ;
                    INC.w $0238,x             ;
CODE_0DDA67:        BRA   CODE_0DDA79         ;

CODE_0DDA69:        LDA.w $0238,x             ;
                    CMP.b $5E,x               ;
                    BCC   CODE_0DDA76         ;
                    JSR.w CODE_0DBF5A         ;
                    JMP.w CODE_0DDA79         ;

CODE_0DDA76:        JSR.w CODE_0DBF56         ;
CODE_0DDA79:        LDA.w $03A2,x             ;
                    BMI   CODE_0DDA81         ;
                    JSR.w CODE_0DE21B         ;
CODE_0DDA81:        RTS                       ;

CODE_0DDA82:        LDA.b #$0E                ;
                    JSR.w CODE_0DCEE5         ;
                    JSR.w CODE_0DCF04         ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_0DDAAC         ;
CODE_0DDA8F:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    LDY.b $00                 ;
                    BMI   CODE_0DDAA2         ;
                    ADC.b #$00                ;
                    BRA   CODE_0DDAA4         ;

CODE_0DDAA2:        SBC.b #$00                ;
CODE_0DDAA4:        STA.b $78                 ;
                    STY.w $03A1               ;
                    JSR.w CODE_0DE21B         ;
CODE_0DDAAC:        RTS                       ;

CODE_0DDAAD:        LDA.w $03A2,x             ;
                    BMI   CODE_0DDAB8         ;
                    JSR.w CODE_0DBF29         ;
                    JSR.w CODE_0DE21B         ;
CODE_0DDAB8:        RTS                       ;

CODE_0DDAB9:        JSR.w CODE_0DBEA0         ;
                    STA.b $00                 ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_0DDACA         ;
                    LDA.b #$10                ;
                    STA.b $5E,x               ;
                    JSR.w CODE_0DDA8F         ;
CODE_0DDACA:        RTS                       ;

CODE_0DDACB:        JSR.w CODE_0DDAD6         ;
                    JMP.w CODE_0DDA79         ;

CODE_0DDAD1:        JSR.w CODE_0DDAD6         ;
                    BRA   CODE_0DDAEE         ;

CODE_0DDAD6:        LDA.w $0747               ;
                    BNE   CODE_0DDAFB         ;
                    LDA.w $041D,x             ;
                    CLC                       ;
                    ADC.w $043D,x             ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    ADC.b $A1,x               ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_0DDAEE:        LDA.w $03A2,x             ;
                    BEQ   CODE_0DDAFB         ;
                    CMP.b #$FF                ;
                    BNE   CODE_0DDAF8         ;
                    RTS                       ;

CODE_0DDAF8:        JSR.w CODE_0DE20C         ;
CODE_0DDAFB:        RTS                       ;

CODE_0DDAFC:        LDA.b $1C,x               ;
                    CMP.b #$14                ;
                    BEQ   CODE_0DDB62         ;
                    LDA.w $071C               ;
                    LDY.b $1C,x               ;
                    CPY.b #$05                ;
                    BEQ   CODE_0DDB13         ;
                    CPY.b #$04                ;
                    BEQ   CODE_0DDB13         ;
                    CPY.b #$0D                ;
                    BNE   CODE_0DDB15         ;
CODE_0DDB13:        ADC.b #$38                ;
CODE_0DDB15:        SBC.b #$48                ;
                    STA.b $01                 ;
                    LDA.w $071A               ;
                    SBC.b #$00                ;
                    STA.b $00                 ;
                    LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$48                ;
                    STA.b $03                 ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $02                 ;
                    LDA.w $021A,x             ;
                    CMP.b $01                 ;
                    LDA.b $79,x               ;
                    SBC.b $00                 ;
                    BMI   CODE_0DDB5F         ;
                    LDA.w $021A,x             ;
                    CMP.b $03                 ;
                    LDA.b $79,x               ;
                    SBC.b $02                 ;
                    BMI   CODE_0DDB62         ;
                    LDA.b $29,x               ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DDB62         ;
                    CPY.b #$0D                ;
                    BEQ   CODE_0DDB62         ;
                    CPY.b #$04                ;
                    BEQ   CODE_0DDB62         ;
                    CPY.b #$30                ;
                    BEQ   CODE_0DDB62         ;
                    CPY.b #$31                ;
                    BEQ   CODE_0DDB62         ;
                    CPY.b #$32                ;
                    BEQ   CODE_0DDB62         ;
CODE_0DDB5F:        JSR.w CODE_0DCCEA         ;
CODE_0DDB62:        RTS                       ;

CODE_0DDB63:        LDA.w $0EC4               ;
                    BEQ   CODE_0DDB6E         ;
                    INC.w $0201               ;
                    STZ.w $0F4C               ;
CODE_0DDB6E:        LDA.b #$2D                ;
                    RTS                       ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF

CODE_0DDB80:        LDA.b $33,x               ;
                    BEQ   CODE_0DDBDC         ;
                    ASL   A                   ;
                    BCS   CODE_0DDBDC         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_0DDBDC         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$2C                ;
                    TAY                       ;
                    LDX.b #$08                ;
CODE_0DDB95:        STX.b $01                 ;
                    TYA                       ;
                    PHA                       ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DDBD5         ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DDBD5         ;
                    LDA.b $1C,x               ;
                    CMP.b #$24                ;
                    BCC   CODE_0DDBAD         ;
                    CMP.b #$2B                ;
                    BCC   CODE_0DDBD5         ;
CODE_0DDBAD:        CMP.b #$06                ;
                    BNE   CODE_0DDBB7         ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BCS   CODE_0DDBD5         ;
CODE_0DDBB7:        LDA.w $03D9,x             ;
                    BNE   CODE_0DDBD5         ;
                    STX.b $E4                 ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAX                       ;
                    JSR.w CODE_0DEA35         ;
                    LDX.b $9E                 ;
                    BCC   CODE_0DDBD5         ;
                    LDA.b #$80                ;
                    STA.b $33,x               ;
                    LDX.b $01                 ;
                    JSR.w CODE_0DDBEC         ;
CODE_0DDBD5:        PLA                       ;
                    TAY                       ;
                    LDX.b $01                 ;
                    DEX                       ;
                    BPL   CODE_0DDB95         ;
CODE_0DDBDC:        LDX.b $9E                 ;
                    RTS                       ;

                    db $06,$00,$02,$12,$11,$07,$05,$2D
                    db $2D,$01,$0A,$08,$2D

CODE_0DDBEC:        JSR.w CODE_0DFD4F
                    LDA.b #$03                ;
                    STA.w $1600               ;
                    LDX.b $01                 ;
                    LDA.b $10,x               ;
                    BPL   CODE_0DDC05         ;
                    AND.b #$0F                ;
                    TAX                       ;
                    LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BEQ   CODE_0DDC12         ;
                    LDX.b $01                 ;
CODE_0DDC05:        LDA.b $1C,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0DDC0E         ;
                    JMP.w CODE_0DDCD8         ;

CODE_0DDC0E:        CMP.b #$2D                ;
                    BNE   CODE_0DDC8C         ;
CODE_0DDC12:        LDA.b #$08                ;
                    STA.w $014B               ;
                    LDA.b #$18                ;
                    STA.w $0F4C               ;
                    DEC.w $0283               ;
                    BEQ   CODE_0DDC36         ;
                    LDA.w $0283               ;
                    CMP.b #$01                ;
                    BEQ   CODE_0DDC2B         ;
                    JMP.w CODE_0DDCD8         ;

CODE_0DDC2B:        STZ.w $03CA               ;
                    LDA.b #$01                ;
                    STA.w $03CB               ;
                    JMP.w CODE_0DDCD8         ;

CODE_0DDC36:        LDA.b #$08                ;
                    STA.w $014B               ;
                    LDA.b #$FF                ;
                    STA.w $0F4C               ;
                    JSR.w CODE_0DC5E1         ;
                    STA.b $5E,x               ;
                    STZ.w $06CB               ;
                    LDA.b #$FE                ;
                    STA.b $A1,x               ;
                    LDY.w $075F               ;
                    LDA.w $DBDF,y             ;
                    STA.b $1C,x               ;
                    STX.w $02FC               ;
                    INC.w $02FC               ;
                    CMP.b #$2D                ;
                    BEQ   CODE_0DDC7C         ;
                    PHX                       ;
                    LDA.b $DB                 ;
                    CMP.b #$21                ;
                    BEQ   CODE_0DDC7B         ;
                    STX.w $0077               ;
                    INC.w $0077               ;
                    LDX.b #$08                ;
CODE_0DDC6D:        LDA.b $1C,x               ;
                    DEX                       ;
                    BMI   CODE_0DDC7B         ;
                    CMP.b #$2D                ;
                    BNE   CODE_0DDC6D         ;
                    INX                       ;
                    STZ.b $10,x               ;
                    STZ.b $1C,x               ;
CODE_0DDC7B:        PLX                       ;
CODE_0DDC7C:        LDA.b #$20                ;
                    CPY.b #$03                ;
                    BCS   CODE_0DDC84         ;
                    ORA.b #$03                ;
CODE_0DDC84:        STA.b $29,x               ;
                    LDX.b $01                 ;
                    LDA.b #$09                ;
                    BNE   CODE_0DDCCC         ;
CODE_0DDC8C:        CMP.b #$08                ;
                    BEQ   CODE_0DDCD8         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DDCD8         ;
                    CMP.b #$15                ;
                    BCS   CODE_0DDCD8         ;
CODE_0DDC98:        LDA.b $1C,x               ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DDCA2         ;
                    CMP.b #$0D                ;
                    BNE   CODE_0DDCB1         ;
CODE_0DDCA2:        TAY                       ;
                    LDA.w $0238,x             ;
                    ADC.b #$18                ;
                    CPY.b #$04                ;
                    BNE   CODE_0DDCAE         ;
                    SBC.b #$31                ;
CODE_0DDCAE:        STA.w $0238,x             ;
CODE_0DDCB1:        JSR.w CODE_0DE6E7         ;
                    LDA.b $29,x               ;
                    AND.b #$1F                ;
                    ORA.b #$20                ;
                    STA.b $29,x               ;
                    LDA.b #$02                ;
                    LDY.b $1C,x               ;
                    CPY.b #$05                ;
                    BNE   CODE_0DDCC6         ;
                    LDA.b #$06                ;
CODE_0DDCC6:        CPY.b #$06                ;
                    BNE   CODE_0DDCCC         ;
                    LDA.b #$01                ;
CODE_0DDCCC:        JSR.w CODE_0DDFC3         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DDCD8         ;
                    LDA.b #$03                ;
                    STA.w $1600               ;
CODE_0DDCD8:        RTS                       ;

CODE_0DDCD9:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_0DDD17         ;
                    LDA.w $03D0               ;
                    ORA.w $0747               ;
                    ORA.w $03D6               ;
                    BNE   CODE_0DDD17         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$34                ;
                    TAY                       ;
                    JSR.w CODE_0DEA33         ;
                    LDX.b $9E                 ;
                    BCC   CODE_0DDD12         ;
                    LDA.w $06BE,x             ;
                    BNE   CODE_0DDD17         ;
                    LDA.b #$01                ;
                    STA.w $06BE,x             ;
                    LDA.b $6E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $6E,x               ;
                    LDA.w $07AF               ;
                    BNE   CODE_0DDD17         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDD12:        LDA.b #$00                ;
                    STA.w $06BE,x             ;
CODE_0DDD17:        RTS                       ;

CODE_0DDD18:        JSR.w CODE_0DCCED         ;
                    LDA.w $020C               ;
                    CMP.b #$04                ;
                    BNE   CODE_0DDD25         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDD25:        LDA.b #$06                ;
                    JSR.w CODE_0DDF94         ;
                    LDA.b #$0A                ;
                    STA.w $1600               ;
                    LDA.w $020C               ;
                    CMP.b #$02                ;
                    BCC   CODE_0DDD45         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DDD5F         ;
                    LDA.b #$23                ;
                    STA.w $07AF               ;
                    LDA.b #$0D                ;
                    STA.w $1602               ;
                    RTS                       ;

CODE_0DDD45:        LDA.w $0756               ;
                    BEQ   CODE_0DDD6A         ;
                    CMP.b #$01                ;
                    BNE   CODE_0DDD76         ;
                    LDX.b $9E                 ;
                    LDA.b #$02                ;
                    STA.w $0756               ;
                    JSL.l CODE_0E98C3         ;
                    LDX.b $9E                 ;
                    LDA.b #$0C                ;
                    BRA   CODE_0DDD71         ;

CODE_0DDD5F:        LDA.b #$0B                ;
                    STA.w $0110,x             ;
                    LDA.b #$00                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_0DDD6A:        LDA.b #$01                ;
                    STA.w $0756               ;
                    LDA.b #$09                ;
CODE_0DDD71:        LDY.b #$00                ;
                    JSR.w CODE_0DDEA4         ;
CODE_0DDD76:        RTS                       ;

                    db $18,$E8,$30,$D0,$08,$F8

CODE_0DDD7D:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_0DDD76         ;
                    JSR.w CODE_0DE247         ;
                    BCS   CODE_0DDDBD         ;
                    CPX.b #$09                ;
                    BNE   CODE_0DDD94         ;
                    LDA.w $03AE               ;
                    BPL   CODE_0DDD94         ;
                    CMP.b #$F4                ;
                    BCS   CODE_0DDD99         ;
CODE_0DDD94:        LDA.w $03D9,x             ;
                    BNE   CODE_0DDDBD         ;
CODE_0DDD99:        LDA.b $0F                 ;
                    CMP.b #$08                ;
                    BNE   CODE_0DDDBD         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DDDBD         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DDDBD         ;
                    JSR.w CODE_0DE251         ;
                    JSR.w CODE_0DEA33         ;
                    LDX.b $9E                 ;
                    BCS   CODE_0DDDBE         ;
                    LDA.w $0481,x             ;
                    AND.b #$FE                ;
                    STA.w $0481,x             ;
CODE_0DDDBD:        RTS                       ;

CODE_0DDDBE:        LDY.b $1C,x               ;
                    CPY.b #$2E                ;
                    BNE   CODE_0DDDC7         ;
                    JMP.w CODE_0DDD18         ;

CODE_0DDDC7:        LDA.w $07AF               ;
                    BEQ   CODE_0DDDD2         ;
                    JMP.w CODE_0DDC98         ;

                    ASL   A                   ;
                    ASL.b $04                 ;
CODE_0DDDD2:        LDA.w $0481,x             ;
                    AND.b #$01                ;
                    ORA.w $03D9,x             ;
                    BNE   CODE_0DDE49         ;
                    LDA.b #$01                ;
                    ORA.w $0481,x             ;
                    STA.w $0481,x             ;
                    CPY.b #$12                ;
                    BEQ   CODE_0DDE4A         ;
                    CPY.b #$33                ;
                    BEQ   CODE_0DDE4A         ;
                    CPY.b #$0D                ;
                    BNE   CODE_0DDDF3         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDDF3:        CPY.b #$04                ;
                    BNE   CODE_0DDDFA         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDDFA:        CPY.b #$0C                ;
                    BNE   CODE_0DDE01         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDE01:        CPY.b #$15                ;
                    BCS   CODE_0DDE82         ;
                    LDA.b $5C                 ;
                    BEQ   CODE_0DDE82         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCS   CODE_0DDE4A         ;
                    LDA.b $29,x               ;
                    AND.b #$07                ;
                    CMP.b #$02                ;
                    BCC   CODE_0DDE4A         ;
                    LDA.b $1C,x               ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DDE49         ;
                    LDA.b #$03                ;
                    STA.w $1600               ;
                    JSL.l CODE_0FE0AC         ;
                    STZ.w $0F40,x             ;
                    LDA.b $29,x               ;
                    ORA.b #$80                ;
                    STA.b $29,x               ;
                    JSR.w CODE_0DDF88         ;
                    LDA.w $DD79,y             ;
                    STA.b $5E,x               ;
                    LDA.b #$03                ;
                    CLC                       ;
                    ADC.w $0284               ;
                    LDY.w $07A2,x             ;
                    CPY.b #$03                ;
                    BCS   CODE_0DDE46         ;
                    LDA.w $DDCF,y             ;
CODE_0DDE46:        JSR.w CODE_0DDFC3         ;
CODE_0DDE49:        RTS                       ;

CODE_0DDE4A:        LDY.w $00A0               ;
                    DEY                       ;
                    BMI   CODE_0DDE53         ;
                    JMP.w CODE_0DDEDE         ;

CODE_0DDE53:        LDA.b $1C,x               ;
                    CMP.b #$07                ;
                    BCC   CODE_0DDE64         ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.b #$0C                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_0DDEDE         ;
CODE_0DDE64:        LDA.w $079D               ;
                    BNE   CODE_0DDEDE         ;
                    LDA.w $07AE               ;
                    BNE   CODE_0DDEB1         ;
                    LDA.w $03AD               ;
                    CMP.w $03AE               ;
                    BCC   CODE_0DDE79         ;
                    JMP.w CODE_0DDF79         ;

CODE_0DDE79:        LDA.b $47,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DDE82         ;
                    JMP.w CODE_0DDF82         ;

CODE_0DDE82:        LDA.w $07AE               ;
                    ORA.w $07AF               ;
                    BNE   CODE_0DDEB1         ;
CODE_0DDE8A:        LDX.w $0756               ;
                    BEQ   CODE_0DDEB4         ;
                    STA.w $0756               ;
                    LDA.b #$08                ;
                    STA.w $07AE               ;
                    LDA.b #$04                ;
                    STA.w $1600               ;
                    JSL.l CODE_0E98C3         ;
                    LDA.b #$0A                ;
CODE_0DDEA2:        LDY.b #$01                ;
CODE_0DDEA4:        STA.b $0F                 ;
                    STY.b $28                 ;
                    LDY.b #$FF                ;
                    STY.w $0747               ;
                    INY                       ;
                    STY.w $0775               ;
CODE_0DDEB1:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DDEB4:        STX.b $5D                 ;
                    PHX                       ;
                    LDA.b #$01                ;
                    STA.w $0754               ;
                    JSL.l CODE_0E98C3         ;
                    PLX                       ;
                    INX                       ;
                    LDA.b #$20                ;
                    TSB.w $1601               ;
                    LDA.b #$09                ;
                    STA.w $1602               ;
                    STA.w $0E67               ;
                    STA.w $0723               ;
                    LDA.b #$FC                ;
                    STA.b $A0                 ;
                    LDA.b #$0B                ;
                    BNE   CODE_0DDEA2         ;

                    db $02,$06,$05,$06

CODE_0DDEDE:        LDA.b $1C,x               ;
                    CMP.b #$12                ;
                    BEQ   CODE_0DDE82         ;
                    LDA.b #$02                ;
                    STA.w $1600               ;
                    LDA.b $1C,x               ;
                    LDY.b #$00                ;
                    CMP.b #$14                ;
                    BEQ   CODE_0DDF0C         ;
                    CMP.b #$08                ;
                    BEQ   CODE_0DDF0C         ;
                    CMP.b #$33                ;
                    BEQ   CODE_0DDF0C         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DDF0C         ;
                    INY                       ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DDF0C         ;
                    INY                       ;
                    CMP.b #$11                ;
                    BEQ   CODE_0DDF0C         ;
                    INY                       ;
                    CMP.b #$07                ;
                    BNE   CODE_0DDF27         ;
CODE_0DDF0C:        LDA.w $DEDA,y             ;
                    JSR.w CODE_0DDFC3         ;
                    LDA.b $47,x               ;
                    PHA                       ;
                    JSR.w CODE_0DE706         ;
                    PLA                       ;
                    STA.b $47,x               ;
                    LDA.b #$20                ;
                    STA.b $29,x               ;
                    JSR.w CODE_0DC5E1         ;
                    STZ.b $5E,x               ;
                    JMP.w CODE_0DDF66         ;

CODE_0DDF27:        CMP.b #$09                ;
                    BCC   CODE_0DDF49         ;
                    JSR.w CODE_0DDF66         ;
                    AND.b #$01                ;
                    STA.b $1C,x               ;
                    LDA.b #$00                ;
                    STA.b $29,x               ;
                    LDA.b #$03                ;
                    JSR.w CODE_0DDFC3         ;
                    JSR.w CODE_0DC5E1         ;
                    JSR.w CODE_0DDF88         ;
                    LDA.w $DD7B,y             ;
                    STA.b $5E,x               ;
                    RTS                       ;

                    BPL   CODE_0DDF54         ;
CODE_0DDF49:        LDA.b #$04                ;
                    STA.b $29,x               ;
                    INC.w $0284               ;
                    LDA.w $0284               ;
                    CLC                       ;
CODE_0DDF54:        ADC.w $079D               ;
                    JSR.w CODE_0DDFC3         ;
                    INC.w $079D               ;
                    LDY.w $076A               ;
                    LDA.w $DF47,y             ;
                    STA.w $07A2,x             ;
CODE_0DDF66:        LDY.b #$FA                ;
                    LDA.w $1C,x             ;
                    CMP.b #$0F                ;
                    BEQ   CODE_0DDF73         ;
                    CMP.b #$10                ;
                    BNE   CODE_0DDF75         ;
CODE_0DDF73:        LDY.b #$F8                ;
CODE_0DDF75:        STY.w $00A0               ;
                    RTS                       ;

CODE_0DDF79:        LDA.b $47,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DDF82         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDF82:        JSR.w CODE_0DE10A         ;
                    JMP.w CODE_0DDE82         ;

CODE_0DDF88:        LDY.b #$01                ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DDF90         ;
                    INY                       ;
CODE_0DDF90:        STY.b $47,x               ;
                    DEY                       ;
                    RTS                       ;

CODE_0DDF94:        STA.w $0110,x             ;
                    LDA.b #$30                ;
                    STA.w $0138,x             ;
                    LDA.w $0238,x             ;
                    STA.w $0124,x             ;
                    LDA.w $03AE               ;
                    STA.w $011A,x             ;
                    LDA.w $021A,x             ;
                    STA.b $ED                 ;
                    LDA.b $79,x               ;
                    STA.b $EE                 ;
                    PHX                       ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.b $ED                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E50,x             ;
                    SEP   #$20                ;
                    PLX                       ;
CODE_0DDFC2:        RTS                       ;

CODE_0DDFC3:        CMP.w $0110,x             ;
                    BCS   CODE_0DDFC9         ;
                    RTS                       ;

CODE_0DDFC9:        STA.w $0110,x             ;
                    LDA.b #$30                ;
                    STA.w $0138,x             ;
                    LDA.w $0238,x             ;
                    STA.w $0124,x             ;
                    PHY                       ;
                    TXA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $021A,x             ;
                    STA.b $E4                 ;
                    LDA.b $79,x               ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E50,y             ;
                    SEP   #$20                ;
                    STA.w $011A,x             ;
                    PLY                       ;
                    RTS                       ;

                    db $80,$40,$20,$10,$08,$04,$02,$7F
                    db $BF,$DF,$EF,$F7,$FB,$FD

CODE_0DE003:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_0DDFC2         ;
                    LDA.b $5C                 ;
                    BEQ   CODE_0DDFC2         ;
                    LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_0DE088         ;
                    CMP.b #$11                ;
                    BEQ   CODE_0DE088         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_0DE088         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DE088         ;
                    LDA.w $03D9,x             ;
                    BNE   CODE_0DE088         ;
                    JSR.w CODE_0DE251         ;
                    DEX                       ;
                    BMI   CODE_0DE088         ;
CODE_0DE029:        STX.b $01                 ;
                    TYA                       ;
                    PHA                       ;
                    LDA.b $10,x               ;
                    BEQ   CODE_0DE081         ;
                    LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_0DE081         ;
                    CMP.b #$11                ;
                    BEQ   CODE_0DE081         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_0DE081         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DE081         ;
                    LDA.w $03D9,x             ;
                    BNE   CODE_0DE081         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAX                       ;
                    JSR.w CODE_0DEA35         ;
                    LDX.b $9E                 ;
                    LDY.b $01                 ;
                    BCC   CODE_0DE078         ;
                    LDA.b $29,x               ;
                    ORA.w $0029,y             ;
                    AND.b #$80                ;
                    BNE   CODE_0DE072         ;
                    LDA.w $0481,y             ;
                    AND.w $DFF5,x             ;
                    BNE   CODE_0DE081         ;
                    LDA.w $0481,y             ;
                    ORA.w $DFF5,x             ;
                    STA.w $0481,y             ;
CODE_0DE072:        JSR.w CODE_0DE08B         ;
                    JMP.w CODE_0DE081         ;

CODE_0DE078:        LDA.w $0481,y             ;
                    AND.w $DFFC,x             ;
                    STA.w $0481,y             ;
CODE_0DE081:        PLA                       ;
                    TAY                       ;
                    LDX.b $01                 ;
                    DEX                       ;
                    BPL   CODE_0DE029         ;
CODE_0DE088:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DE08B:        LDA.w $29,y             ;
                    ORA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DE0CB         ;
                    LDA.b $1C,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_0DE09C         ;
                    STZ.b $29,x               ;
CODE_0DE09C:        LDA.b $29,x               ;
                    CMP.b #$06                ;
                    BCC   CODE_0DE0CC         ;
                    LDA.w $29,y             ;
                    ASL   A                   ;
                    BCC   CODE_0DE0B2         ;
                    LDA.b #$06                ;
                    JSR.w CODE_0DDFC3         ;
                    JSR.w CODE_0DDC98         ;
                    LDY.b $01                 ;
CODE_0DE0B2:        TYA                       ;
                    TAX                       ;
                    JSR.w CODE_0DDC98         ;
                    LDX.b $9E                 ;
                    LDA.w $012E,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    LDX.b $01                 ;
                    JSR.w CODE_0DDFC3         ;
                    LDX.b $9E                 ;
                    INC.w $012E,x             ;
                    BRA   CODE_0DE0F3         ;

CODE_0DE0CB:        RTS                       ;

CODE_0DE0CC:        LDA.w $29,y             ;
                    CMP.b #$06                ;
                    BCC   CODE_0DE103         ;
                    LDA.w $1C,y             ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DE0CB         ;
                    JSR.w CODE_0DDC98         ;
                    JSL.l CODE_0FE0AC         ;
                    LDY.b $01                 ;
                    LDA.w $012E,y             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0DDFC3         ;
                    LDX.b $01                 ;
                    INC.w $012E,x             ;
CODE_0DE0F3:        LDA.w $012E,x             ;
                    CLC                       ;
                    ADC.b #$12                ;
                    CMP.b #$1A                ;
                    BCC   CODE_0DE0FF         ;
                    LDA.b #$00                ;
CODE_0DE0FF:        STA.w $1600               ;
                    RTS                       ;

CODE_0DE103:        TYA                       ;
                    TAX                       ;
                    JSR.w CODE_0DE10A         ;
                    LDX.b $9E                 ;
CODE_0DE10A:        LDA.b $1C,x               ;
                    CMP.b #$0D                ;
                    BEQ   CODE_0DE136         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DE136         ;
                    CMP.b #$11                ;
                    BEQ   CODE_0DE136         ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DE136         ;
                    CMP.b #$12                ;
                    BEQ   CODE_0DE128         ;
                    CMP.b #$0E                ;
                    BEQ   CODE_0DE128         ;
                    CMP.b #$07                ;
                    BCS   CODE_0DE136         ;
CODE_0DE128:        LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    TAY                       ;
                    INY                       ;
                    STY.b $5E,x               ;
                    LDA.b $47,x               ;
                    EOR.b #$03                ;
                    STA.b $47,x               ;
CODE_0DE136:        RTS                       ;

CODE_0DE137:        LDA.b #$FF                ;
                    STA.w $03A2,x             ;
                    LDA.w $0747               ;
                    BNE   CODE_0DE16B         ;
                    LDA.b $29,x               ;
                    BMI   CODE_0DE16B         ;
                    LDA.b $1C,x               ;
                    CMP.b #$24                ;
                    BNE   CODE_0DE151         ;
                    LDA.b $29,x               ;
                    TAX                       ;
                    JSR.w CODE_0DE151         ;
CODE_0DE151:        JSR.w CODE_0DE247         ;
                    BCS   CODE_0DE16B         ;
                    TXA                       ;
                    JSR.w CODE_0DE253         ;
                    LDA.w $0238,x             ;
                    STA.b $00                 ;
                    TXA                       ;
                    PHA                       ;
                    JSR.w CODE_0DEA33         ;
                    PLA                       ;
                    TAX                       ;
                    BCC   CODE_0DE16B         ;
                    JSR.w CODE_0DE1AF         ;
CODE_0DE16B:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DE16E:        LDA.w $0747               ;
                    BNE   CODE_0DE1AA         ;
                    STA.w $03A2,x             ;
                    JSR.w CODE_0DE247         ;
                    BCS   CODE_0DE1AA         ;
                    LDA.b #$02                ;
                    STA.b $00                 ;
CODE_0DE17F:        LDX.b $9E                 ;
                    JSR.w CODE_0DE251         ;
                    AND.b #$02                ;
                    BNE   CODE_0DE1AA         ;
                    LDA.w $0F9D,y             ;
                    CMP.b #$20                ;
                    BCC   CODE_0DE194         ;
                    JSR.w CODE_0DEA33         ;
                    BCS   CODE_0DE1AD         ;
CODE_0DE194:        LDA.w $0F9D,y             ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0F9D,y             ;
                    LDA.w $0F9F,y             ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0F9F,y             ;
                    DEC.b $00                 ;
                    BNE   CODE_0DE17F         ;
CODE_0DE1AA:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DE1AD:        LDX.b $9E                 ;
CODE_0DE1AF:        LDA.w $0F9F,y             ;
                    SEC                       ;
                    SBC.w $0F9D               ;
                    CMP.b #$04                ;
                    BCS   CODE_0DE1C2         ;
                    LDA.b $A0                 ;
                    BPL   CODE_0DE1C2         ;
                    LDA.b #$01                ;
                    STA.b $A0                 ;
CODE_0DE1C2:        LDA.w $0F9F               ;
                    SEC                       ;
                    SBC.w $0F9D,y             ;
                    CMP.b #$06                ;
                    BCS   CODE_0DE1E8         ;
                    LDA.b $A0                 ;
                    BMI   CODE_0DE1E8         ;
                    LDA.b $00                 ;
                    LDY.b $1C,x               ;
                    CPY.b #$2B                ;
                    BEQ   CODE_0DE1DE         ;
                    CPY.b #$2C                ;
                    BEQ   CODE_0DE1DE         ;
                    TXA                       ;
CODE_0DE1DE:        LDX.b $9E                 ;
                    STA.w $03A2,x             ;
                    LDA.b #$00                ;
                    STA.b $28                 ;
                    RTS                       ;

CODE_0DE1E8:        LDA.b #$01                ;
                    STA.b $00                 ;
                    LDA.w $0F9E               ;
                    SEC                       ;
                    SBC.w $0F9C,y             ;
                    CMP.b #$08                ;
                    BCC   CODE_0DE204         ;
                    INC.b $00                 ;
                    LDA.w $0F9E,y             ;
                    CLC                       ;
                    SBC.w $0F9C               ;
                    CMP.b #$09                ;
                    BCS   CODE_0DE207         ;
CODE_0DE204:        JSR.w CODE_0DE614         ;
CODE_0DE207:        LDX.b $9E                 ;
                    RTS                       ;

                    BRA   CODE_0DE20C         ;

CODE_0DE20C:        TAY                       ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.w $E209,y             ;
                    BNE   CODE_0DE21E         ;
                    LDA.b #$02                ;
                    STA.b $BB                 ;
                    RTS                       ;

CODE_0DE21B:        LDA.w $0238,x             ;
CODE_0DE21E:        LDY.b $0F                 ;
                    CPY.b #$0B                ;
                    BEQ   CODE_0DE246         ;
                    LDY.b $BC,x               ;
                    CPY.b #$01                ;
                    BNE   CODE_0DE246         ;
                    SEC                       ;
                    SBC.b #$20                ;
                    STA.w $0237               ;
                    TYA                       ;
                    SBC.b #$00                ;
                    STA.b $BB                 ;
                    BNE   CODE_0DE23F         ;
                    STZ.w $03A2,x             ;
                    LDA.b #$01                ;
                    STA.w $28               ;
CODE_0DE23F:        LDA.b #$00                ;
                    STA.b $A0                 ;
                    STA.w $043C               ;
CODE_0DE246:        RTS                       ;

CODE_0DE247:        LDA.w $03D0               ;
                    AND.b #$F0                ;
                    CLC                       ;
                    BEQ   CODE_0DE250         ;
                    SEC                       ;
CODE_0DE250:        RTS                       ;

CODE_0DE251:        LDA.b $9E                 ;
CODE_0DE253:        ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAY                       ;
                    LDA.w $03D1               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    RTS                       ;

                   db $20,$10

CODE_0DE263:        LDA.w $0716
                    BNE   CODE_0DE297         ;
                    LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DE297         ;
                    CMP.b #$04                ;
                    BCC   CODE_0DE297         ;
                    LDA.b #$01                ;
                    LDY.w $0704               ;
                    BNE   CODE_0DE283         ;
                    LDA.b $28                 ;
                    BEQ   CODE_0DE281         ;
                    CMP.b #$03                ;
                    BNE   CODE_0DE285         ;
CODE_0DE281:        LDA.b #$02                ;
CODE_0DE283:        STA.b $28                 ;
CODE_0DE285:        LDA.b $BB                 ;
                    CMP.b #$01                ;
                    BNE   CODE_0DE297         ;
                    LDA.b #$FF                ;
                    STA.w $0480               ;
                    LDA.w $0237               ;
                    CMP.b #$CF                ;
                    BCC   CODE_0DE298         ;
CODE_0DE297:        RTS                       ;

CODE_0DE298:        LDY.b #$02                ;
                    LDA.w $0714               ;
                    BNE   CODE_0DE2AB         ;
                    LDA.w $0754               ;
                    BNE   CODE_0DE2AB         ;
                    DEY                       ;
                    LDA.w $0704               ;
                    BNE   CODE_0DE2AB         ;
                    DEY                       ;
CODE_0DE2AB:        LDA.w $EABB,y             ;
                    STA.b $EB                 ;
                    TAY                       ;
                    LDX.w $0754               ;
                    LDA.w $0714               ;
                    BEQ   CODE_0DE2BA         ;
                    INX                       ;
CODE_0DE2BA:        LDA.w $0237               ;
                    CMP.w $E261,x             ;
                    BCC   CODE_0DE2FA         ;
                    LDA.b #$01                ;
                    STA.b $E4                 ;
                    JSR.w CODE_0DEAF7         ;
                    BEQ   CODE_0DE2FA         ;
                    JSR.w CODE_0DE66C         ;
                    BCS   CODE_0DE323         ;
                    LDY.b $A0                 ;
                    BPL   CODE_0DE2FA         ;
                    LDY.b $04                 ;
                    CPY.b #$04                ;
                    BCC   CODE_0DE2FA         ;
                    JSR.w CODE_0DE65A         ;
                    BCS   CODE_0DE2ED         ;
                    LDY.b $5C                 ;
                    BEQ   CODE_0DE2F6         ;
                    LDY.w $078C               ;
                    BNE   CODE_0DE2F6         ;
                    JSR.w CODE_0DBC49         ;
                    BRA   CODE_0DE2FA         ;

CODE_0DE2ED:        CMP.b #$2F                ;
                    BEQ   CODE_0DE2F6         ;
                    LDA.b #$01                ;
                    STA.w $1600               ;
CODE_0DE2F6:        LDA.b #$01                ;
                    STA.b $A0                 ;
CODE_0DE2FA:        LDY.b $EB                 ;
                    LDA.w $0237               ;
                    CMP.b #$CF                ;
                    BCS   CODE_0DE367         ;
                    STZ.b $E4                 ;
                    JSR.w CODE_0DEAF6         ;
                    JSR.w CODE_0DE66C         ;
                    BCS   CODE_0DE323         ;
                    PHA                       ;
                    STZ.b $E4                 ;
                    JSR.w CODE_0DEAF6         ;
                    STA.b $00                 ;
                    PLA                       ;
                    STA.b $01                 ;
                    BNE   CODE_0DE326         ;
                    LDA.b $00                 ;
                    BEQ   CODE_0DE367         ;
                    JSR.w CODE_0DE66C         ;
                    BCC   CODE_0DE326         ;
CODE_0DE323:        JMP.w CODE_0DE420         ;

CODE_0DE326:        JSR.w CODE_0DE665         ;
                    BCS   CODE_0DE367         ;
                    LDY.b $A0                 ;
                    BMI   CODE_0DE367         ;
                    CMP.b #$FE                ;
                    BNE   CODE_0DE336         ;
                    JMP.w CODE_0DE429         ;

CODE_0DE336:        JSR.w CODE_0DE55A         ;
                    BEQ   CODE_0DE367         ;
                    LDY.w $070E               ;
                    BNE   CODE_0DE363         ;
                    LDY.b $04                 ;
                    CPY.b #$05                ;
                    BCC   CODE_0DE34D         ;
                    LDA.b $46                 ;
                    STA.b $00                 ;
                    JMP.w CODE_0DE614         ;

CODE_0DE34D:        JSR.w CODE_0DE571         ;
                    LDA.b #$F0                ;
                    AND.w $0237               ;
                    STA.w $0237               ;
                    JSR.w CODE_0DE598         ;
                    STZ.b $A0                 ;
                    STZ.w $043C               ;
                    STZ.w $0284               ;
CODE_0DE363:        LDA.b #$00                ;
                    STA.b $28                 ;
CODE_0DE367:        LDY.b $EB                 ;
                    INY                       ;
                    INY                       ;
                    LDA.b #$02                ;
                    STA.b $00                 ;
CODE_0DE36F:        INY                       ;
                    STY.b $EB                 ;
                    LDA.w $0237               ;
                    CMP.b #$20                ;
                    BCC   CODE_0DE391         ;
                    CMP.b #$E4                ;
                    BCS   CODE_0DE3AA         ;
                    STZ.b $E4                 ;
                    JSR.w CODE_0DEAFB         ;
                    BEQ   CODE_0DE391         ;
                    CMP.b #$25                ;
                    BEQ   CODE_0DE391         ;
                    CMP.b #$76                ;
                    BEQ   CODE_0DE391         ;
                    JSR.w CODE_0DE665         ;
                    BCC   CODE_0DE3AB         ;
CODE_0DE391:        LDY.b $EB                 ;
                    INY                       ;
                    LDA.w $0237               ;
                    CMP.b #$08                ;
                    BCC   CODE_0DE3AA         ;
                    CMP.b #$D0                ;
                    BCS   CODE_0DE3AA         ;
                    STZ.b $E4                 ;
                    JSR.w CODE_0DEAFB         ;
                    BNE   CODE_0DE3AB         ;
                    DEC.b $00                 ;
                    BNE   CODE_0DE36F         ;
CODE_0DE3AA:        RTS                       ;

CODE_0DE3AB:        JSR.w CODE_0DE55A         ;
                    BEQ   CODE_0DE41D         ;
                    JSR.w CODE_0DE665         ;
                    BCC   CODE_0DE3B8         ;
                    JMP.w CODE_0DE47C         ;

CODE_0DE3B8:        JSR.w CODE_0DE66C         ;
                    BCS   CODE_0DE420         ;
                    JSR.w CODE_0DE58D         ;
                    BCC   CODE_0DE3CA         ;
                    LDA.w $070E               ;
                    BNE   CODE_0DE41D         ;
                    JMP.w CODE_0DE41A         ;

CODE_0DE3CA:        LDY.b $28                 ;
                    CPY.b #$00                ;
                    BNE   CODE_0DE41A         ;
                    LDY.w $0202               ;
                    DEY                       ;
                    BNE   CODE_0DE41A         ;
                    CMP.b #$77                ;
                    BEQ   CODE_0DE3DE         ;
                    CMP.b #$28                ;
                    BNE   CODE_0DE41A         ;
CODE_0DE3DE:        LDA.w $0256               ;
                    BEQ   CODE_0DE3F1         ;
                    LDY.b $9A                 ;
                    BNE   CODE_0DE3F1         ;
                    LDY.b #$04                ;
                    STY.w $1600               ;
                    STY.b $9A                 ;
                    STZ.w $07AF               ;
CODE_0DE3F1:        AND.b #$CF                ;
                    STA.w $0256               ;
                    LDA.w $0219               ;
                    AND.b #$0F                ;
                    BEQ   CODE_0DE40B         ;
                    LDY.b #$00                ;
                    LDA.w $071A               ;
                    BEQ   CODE_0DE405         ;
                    INY                       ;
CODE_0DE405:        LDA.w $E41E,y             ;
                    STA.w $06DE               ;
CODE_0DE40B:        LDA.b $0F                 ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DE41D         ;
                    CMP.b #$08                ;
                    BNE   CODE_0DE41D         ;
                    LDA.b #$02                ;
                    STA.b $0F                 ;
                    RTS                       ;

CODE_0DE41A:        JSR.w CODE_0DE614         ;
CODE_0DE41D:        RTS                       ;

                    db $34,$34

CODE_0DE420:        JSR.w CODE_0DE46A         ;
                    INC.w $0748               ;
                    JMP.w CODE_0DBAFF         ;

CODE_0DE429:        STZ.w $0772               ;
                    LDA.b #$02                ;
                    STA.w $0770               ;
                    LDA.w $2142               ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DE43D         ;
                    LDA.b #$F0                ;
                    STA.w $1602               ;
CODE_0DE43D:        LDA.b #$18                ;
                    STA.b $5D                 ;
                    PHX                       ;
                    LDX.b #$00                ;
CODE_0DE444:        LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BNE   CODE_0DE464         ;
                    LDA.b $10,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DE464         ;
                    LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.w $073F               ;
                    STA.w $03AE               ;
                    LDA.w $0238,x             ;
                    STA.w $03B9               ;
                    JSL.l CODE_0FD73D         ;
CODE_0DE464:        INX                       ;
                    CPX.b #$09                ;
                    BNE   CODE_0DE444         ;
                    PLX                       ;
CODE_0DE46A:        LDY.b $02                 ;
                    LDA.b #$00                ;
                    STA.b ($06),y             ;
                    JMP.w CODE_0D9046         ;

                    db $F9,$07,$FF,$00,$18,$22,$50,$68
                    db $90

CODE_0DE47C:        LDY.b $04                 ;
                    CPY.b #$06                ;
                    BCC   CODE_0DE486         ;
                    CPY.b #$0A                ;
                    BCC   CODE_0DE487         ;
CODE_0DE486:        RTS                       ;

CODE_0DE487:        CMP.b #$2D                ;
                    BEQ   CODE_0DE48F         ;
                    CMP.b #$2E                ;
                    BNE   CODE_0DE4E0         ;
CODE_0DE48F:        LDA.b $0F                 ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DE4EF         ;
                    INC.w $0723               ;
                    LDA.b $0F                 ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DE4DA         ;
                    LDA.b #$33                ;
                    JSR.w CODE_0DA61A         ;
                    JSL.l CODE_0E877D         ;
                    LDA.b #$F0                ;
                    STA.w $1602               ;
                    LDA.b #$46                ;
                    STA.w $1600               ;
                    LSR   A                   ;
                    STA.w $0713               ;
                    LDX.b #$04                ;
                    LDA.w $0237               ;
                    STA.w $070F               ;
CODE_0DE4BD:        CMP.w $E477,x             ;
                    BCS   CODE_0DE4C5         ;
                    DEX                       ;
                    BNE   CODE_0DE4BD         ;
CODE_0DE4C5:        STX.w $010F               ;
                    LDA.w $07DE               ;
                    CMP.w $07DF               ;
                    BNE   CODE_0DE4DA         ;
                    CMP.w $07EB               ;
                    BNE   CODE_0DE4DA         ;
                    LDA.b #$05                ;
                    STA.w $010F               ;
CODE_0DE4DA:        LDA.b #$04                ;
                    STA.b $0F                 ;
                    BRA   CODE_0DE4EF         ;

CODE_0DE4E0:        CMP.b #$2F                ;
                    BNE   CODE_0DE4EF         ;
                    LDA.w $0237               ;
                    CMP.b #$20                ;
                    BCS   CODE_0DE4EF         ;
                    LDA.b #$01                ;
                    STA.b $0F                 ;
CODE_0DE4EF:        LDA.b #$03                ;
                    STA.b $28                 ;
                    STZ.b $5D                 ;
                    STZ.w $0705               ;
                    LDA.w $0398               ;
                    BEQ   CODE_0DE52C         ;
                    LDA.w $03AE               ;
                    BPL   CODE_0DE52C         ;
                    CMP.b #$F8                ;
                    BCC   CODE_0DE52C         ;
                    LDA.w $82               ;
                    STA.b $E5                 ;
                    LDA.w $0223               ;
                    STA.b $E4                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    CLC                       ;
                    ADC.w #$0007              ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b $E4                 ;
                    STA.w $0219               ;
                    LDA.b $E5                 ;
                    STA.b $78                 ;
                    LDA.b #$02                ;
                    STA.w $0202               ;
                    BRA   CODE_0DE559         ;

CODE_0DE52C:        LDA.w $0219               ;
                    SEC                       ;
                    SBC.w $071C               ;
                    CMP.b #$10                ;
                    BCS   CODE_0DE53C         ;
                    LDA.b #$02                ;
                    STA.w $0202               ;
CODE_0DE53C:        LDY.w $0202               ;
                    LDA.b $06                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $E472,y             ;
                    STA.w $0219               ;
                    LDA.b $06                 ;
                    BNE   CODE_0DE559         ;
                    LDA.w $071B               ;
                    CLC                       ;
                    ADC.w $E474,y             ;
                    STA.b $78                 ;
CODE_0DE559:        RTS                       ;

CODE_0DE55A:        CMP.b #$5C                ;
                    BEQ   CODE_0DE570         ;
                    CMP.b #$5D                ;
                    BEQ   CODE_0DE570         ;
                    CMP.b #$5E                ;
                    BEQ   CODE_0DE570         ;
                    CMP.b #$60                ;
                    BEQ   CODE_0DE570         ;
                    CMP.b #$61                ;
                    BEQ   CODE_0DE570         ;
                    CMP.b #$5F                ;
CODE_0DE570:        RTS                       ;

CODE_0DE571:        JSR.w CODE_0DE58D         ;
                    BCC   CODE_0DE58C         ;
                    LDA.b #$70                ;
                    STA.w $0709               ;
                    STA.w $070A               ;
                    LDA.b #$F9                ;
                    STA.w $06DB               ;
                    LDA.b #$03                ;
                    STA.w $078E               ;
                    LSR   A                   ;
                    STA.w $070E               ;
CODE_0DE58C:        RTS                       ;

CODE_0DE58D:        CMP.b #$6E                ;
                    BEQ   CODE_0DE596         ;
                    CMP.b #$6F                ;
                    CLC                       ;
                    BNE   CODE_0DE597         ;
CODE_0DE596:        SEC                       ;
CODE_0DE597:        RTS                       ;

CODE_0DE598:        LDA.b $0B                 ;
                    AND.b #$04                ;
                    BEQ   CODE_0DE613         ;
                    LDA.b $00                 ;
                    CMP.b #$17                ;
                    BNE   CODE_0DE613         ;
                    LDA.b $01                 ;
                    CMP.b #$16                ;
                    BNE   CODE_0DE613         ;
                    LDA.b #$30                ;
                    STA.w $06DE               ;
                    LDA.b #$03                ;
                    STA.b $0F                 ;
                    LDA.b #$04                ;
                    STA.w $07AE               ;
                    STZ.w $07AF               ;
                    LDA.b #$00                ;
                    STA.w $0256               ;
                    LDA.w $06D6               ;
                    BEQ   CODE_0DE60D         ;
                    AND.b #$0F                ;
                    TAX                       ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCS   CODE_0DE5D4         ;
                    LDA.b #$01                ;
                    STA.w $0F2B               ;
CODE_0DE5D4:        LDA.w $8D98,x             ;
                    TAY                       ;
                    DEY                       ;
                    STY.w $075F               ;
                    LDX.w $C499,y             ;
                    TYX                       ;
                    LDA.l $0EC499,x           ;
                    TAX                       ;
                    LDA.l $0EC4A6,x           ;
                    STA.w $0750               ;
                    LDA.b #$80                ;
                    STA.w $1602               ;
                    LDA.b #$00                ;
                    STA.w $0751               ;
                    STA.w $0760               ;
                    STA.w $075C               ;
                    STA.w $0752               ;
                    INC.w $075D               ;
                    INC.w $0757               ;
                    LDA.b #$F3                ;
                    STA.w $1602               ;
                    STA.w $0E1A               ;
CODE_0DE60D:        LDA.b #$04                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_0DE613:        RTS                       ;

CODE_0DE614:        LDA.b #$00                ;
                    LDY.b $5D                 ;
                    LDX.b $00                 ;
                    DEX                       ;
                    BNE   CODE_0DE627         ;
                    INX                       ;
                    CPY.b #$00                ;
                    BMI   CODE_0DE64C         ;
                    LDA.b #$FF                ;
                    JMP.w CODE_0DE62F         ;

CODE_0DE627:        LDX.b #$02                ;
                    CPY.b #$01                ;
                    BPL   CODE_0DE64C         ;
                    LDA.b #$01                ;
CODE_0DE62F:        LDY.b #$10                ;
                    STY.w $078D               ;
                    LDY.b #$00                ;
                    STY.b $5D                 ;
                    CMP.b #$00                ;
                    BPL   CODE_0DE63D         ;
                    DEY                       ;
CODE_0DE63D:        STY.b $00                 ;
                    CLC                       ;
                    ADC.w $0219               ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.b $00                 ;
                    STA.b $78                 ;
CODE_0DE64C:        TXA                       ;
                    EOR.b #$FF                ;
                    AND.w $0480               ;
                    STA.w $0480               ;
                    RTS                       ;

                    ASL.b $62,x               ;
                    STX.b $FD                 ;
CODE_0DE65A:        JSR.w CODE_0DE67C         ;
                    CMP.w $E656,x             ;
                    RTS                       ;

                    db $2D,$78,$88,$FF

CODE_0DE665:        JSR.w $E67C 
                    CMP.w $E661,x             ;
                    RTS                       ;

CODE_0DE66C:        CMP.b #$EA                ;
                    BEQ   CODE_0DE676         ;
                    CMP.b #$EB                ;
                    BEQ   CODE_0DE676         ;
                    CLC                       ;
                    RTS                       ;

CODE_0DE676:        LDA.b #$01                ;
                    STA.w $1603               ;
                    RTS                       ;

CODE_0DE67C:        TAY                       ;
                    AND.b #$C0                ;
                    ASL   A                   ;
                    ROL   A                   ;
                    ROL   A                   ;
                    TAX                       ;
                    TYA                       ;
CODE_0DE684:        RTS                       ;

                    db $01,$01,$02,$02,$02,$05,$10,$F0

CODE_0DE68D:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DE684         ;
                    JSR.w CODE_0DE844         ;
                    BCC   CODE_0DE684         ;
                    LDY.b $1C,x               ;
                    CPY.b #$12                ;
                    BNE   CODE_0DE6A5         ;
                    LDA.w $0238,x             ;
                    CMP.b #$25                ;
                    BCC   CODE_0DE684         ;
CODE_0DE6A5:        CPY.b #$0E                ;
                    BNE   CODE_0DE6AC         ;
                    JMP.w CODE_0DE84D         ;

CODE_0DE6AC:        CPY.b #$05                ;
                    BNE   CODE_0DE6B4         ;
                    JMP.w CODE_0DE86F         ;

CODE_0DE6B3:        RTS                       ;

CODE_0DE6B4:        CPY.b #$12                ;
                    BEQ   CODE_0DE6C4         ;
                    CPY.b #$2E                ;
                    BEQ   CODE_0DE6C4         ;
                    CPY.b #$04                ;
                    BEQ   CODE_0DE6B3         ;
                    CPY.b #$07                ;
                    BCS   CODE_0DE6B3         ;
CODE_0DE6C4:        JSR.w CODE_0DE898         ;
                    BNE   CODE_0DE6CC         ;
CODE_0DE6C9:        JMP.w CODE_0DE7BE         ;

CODE_0DE6CC:        JSR.w CODE_0DE89F         ;
                    BEQ   CODE_0DE6C9         ;
                    CMP.b #$2C                ;
                    BNE   CODE_0DE743         ;
                    LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_0DE6E7         ;
                    CMP.b #$06                ;
                    BNE   CODE_0DE6E2         ;
                    JSR.w CODE_0DE878         ;
CODE_0DE6E2:        LDA.b #$01                ;
                    JSR.w CODE_0DDFC3         ;
CODE_0DE6E7:        LDA.w $1C,x             ;
                    CMP.b #$09                ;
                    BCC   CODE_0DE706         ;
                    CMP.b #$11                ;
                    BCS   CODE_0DE706         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_0DE706         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DE706         ;
                    CMP.b #$0A                ;
                    BCC   CODE_0DE702         ;
                    CMP.b #$0D                ;
                    BCC   CODE_0DE706         ;
CODE_0DE702:        AND.b #$01                ;
                    STA.b $1C,x               ;
CODE_0DE706:        CMP.b #$2E                ;
                    BEQ   CODE_0DE712         ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DE712         ;
                    LDA.b #$02                ;
                    STA.b $29,x               ;
CODE_0DE712:        DEC.w $0238,x             ;
                    DEC.w $0238,x             ;
                    LDA.b $1C,x               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DE724         ;
                    LDA.b #$FD                ;
                    LDY.b $5C                 ;
                    BNE   CODE_0DE726         ;
CODE_0DE724:        LDA.b #$FF                ;
CODE_0DE726:        STA.b $A1,x               ;
                    LDY.b #$01                ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DE730         ;
                    INY                       ;
CODE_0DE730:        LDA.b $1C,x               ;
                    CMP.b #$33                ;
                    BEQ   CODE_0DE73C         ;
                    CMP.b #$08                ;
                    BEQ   CODE_0DE73C         ;
                    STY.b $47,x               ;
CODE_0DE73C:        DEY                       ;
                    LDA.w $E68B,y             ;
                    STA.b $5E,x               ;
                    RTS                       ;

CODE_0DE743:        LDA.b $04                 ;
                    SEC                       ;
                    SBC.b #$08                ;
                    CMP.b #$05                ;
                    BCS   CODE_0DE7BE         ;
                    LDA.b $29,x               ;
                    AND.b #$40                ;
                    BNE   CODE_0DE7A9         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCC   CODE_0DE75A         ;
CODE_0DE757:        JMP.w CODE_0DE7D9         ;

CODE_0DE75A:        LDA.b $29,x               ;
                    BEQ   CODE_0DE757         ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DE781         ;
                    CMP.b #$03                ;
                    BCS   CODE_0DE780         ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0DE781         ;
                    LDA.b #$10                ;
                    LDY.b $1C,x               ;
                    CPY.b #$12                ;
                    BNE   CODE_0DE776         ;
                    LDA.b #$00                ;
CODE_0DE776:        STA.w $07A2,x             ;
                    LDA.b #$03                ;
                    STA.b $29,x               ;
                    JSR.w CODE_0DE836         ;
CODE_0DE780:        RTS                       ;

CODE_0DE781:        LDA.b $1C,x               ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DE7A9         ;
                    CMP.b #$12                ;
                    BNE   CODE_0DE799         ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
                    LDA.b #$08                ;
                    STA.b $5E,x               ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BEQ   CODE_0DE7A9         ;
CODE_0DE799:        LDY.b #$01                ;
                    JSR.w CODE_0DE828         ;
                    BPL   CODE_0DE7A1         ;
                    INY                       ;
CODE_0DE7A1:        TYA                       ;
                    CMP.b $47,x               ;
                    BNE   CODE_0DE7A9         ;
                    JSR.w CODE_0DE800         ;
CODE_0DE7A9:        JSR.w CODE_0DE836         ;
                    LDA.b $29,x               ;
                    AND.b #$80                ;
                    BNE   CODE_0DE7B7         ;
                    LDA.b #$00                ;
                    STA.b $29,x               ;
                    RTS                       ;

CODE_0DE7B7:        LDA.b $29,x               ;
                    AND.b #$BF                ;
                    STA.b $29,x               ;
                    RTS                       ;

CODE_0DE7BE:        LDA.b $1C,x               ;
                    CMP.b #$03                ;
                    BNE   CODE_0DE7C8         ;
                    LDA.b $29,x               ;
                    BEQ   CODE_0DE800         ;
CODE_0DE7C8:        LDA.b $29,x               ;
                    TAY                       ;
                    ASL   A                   ;
                    BCC   CODE_0DE7D4         ;
                    LDA.b $29,x               ;
                    ORA.b #$40                ;
                    BRA   CODE_0DE7D7         ;

CODE_0DE7D4:        LDA.w $E685,y             ;
CODE_0DE7D7:        STA.b $29,x               ;
CODE_0DE7D9:        LDA.w $0238,x             ;
                    CMP.b #$20                ;
                    BCC   CODE_0DE7FF         ;
                    LDY.b #$16                ;
                    LDA.b #$02                ;
                    STA.b $EB                 ;
CODE_0DE7E6:        LDA.b $EB                 ;
                    CMP.b $47,x               ;
                    BNE   CODE_0DE7F8         ;
                    LDA.b #$01                ;
                    JSR.w CODE_0DEA96         ;
                    BEQ   CODE_0DE7F8         ;
                    JSR.w CODE_0DE89F         ;
                    BNE   CODE_0DE800         ;
CODE_0DE7F8:        DEC.b $EB                 ;
                    INY                       ;
                    CPY.b #$18                ;
                    BCC   CODE_0DE7E6         ;
CODE_0DE7FF:        RTS                       ;

CODE_0DE800:        CPX.b #$09                ;
                    BEQ   CODE_0DE816         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCC   CODE_0DE816         ;
                    CPX.b #$09                ;
                    BEQ   CODE_0DE816         ;
                    LDA.b #$01                ;
                    STA.w $1600               ;
                    JSL.l CODE_0FE0AC         ;
CODE_0DE816:        LDA.b $1C,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_0DE825         ;
                    LDA.b #$00                ;
                    STA.b $00                 ;
                    LDY.b #$FA                ;
                    JMP.w CODE_0DCDCF         ;

CODE_0DE825:        JMP.w CODE_0DE128         ;

CODE_0DE828:        LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.w $0219               ;
                    STA.b $00                 ;
                    LDA.b $79,x               ;
                    SBC.b $78                 ;
                    RTS                       ;

CODE_0DE836:        JSR.w CODE_0DC5E1         ;
                    LDA.w $0238,x             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_0DE844:        LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$3E                ;
                    CMP.b #$44                ;
                    RTS                       ;

CODE_0DE84D:        JSR.w CODE_0DE844         ;
                    BCC   CODE_0DE86C         ;
                    LDA.b $A1,x               ;
                    CLC                       ;
                    ADC.b #$02                ;
                    CMP.b #$03                ;
                    BCC   CODE_0DE86C         ;
                    JSR.w CODE_0DE898         ;
                    BEQ   CODE_0DE86C         ;
                    JSR.w CODE_0DE89F         ;
                    BEQ   CODE_0DE86C         ;
                    JSR.w CODE_0DE836         ;
                    LDA.b #$FD                ;
                    STA.b $A1,x               ;
CODE_0DE86C:        JMP.w CODE_0DE7D9         ;

CODE_0DE86F:        JSR.w CODE_0DE898         ;
                    BEQ   CODE_0DE891         ;
                    CMP.b #$2C                ;
                    BNE   CODE_0DE880         ;
CODE_0DE878:        JSR.w CODE_0DDC98         ;
                    LDA.b #$FC                ;
                    STA.b $A1,x               ;
                    RTS                       ;

CODE_0DE880:        LDA.w $0792,x             ;
                    BNE   CODE_0DE891         ;
                    LDA.b $29,x               ;
                    AND.b #$88                ;
                    STA.b $29,x               ;
                    JSR.w CODE_0DE836         ;
                    JMP.w CODE_0DE7D9         ;

CODE_0DE891:        LDA.b $29,x               ;
                    ORA.b #$01                ;
                    STA.b $29,x               ;
                    RTS                       ;

CODE_0DE898:        LDA.b #$00                ;
                    LDY.b #$15                ;
                    JMP.w CODE_0DEA96         ;

CODE_0DE89F:        CMP.b #$2F                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$EA                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$EB                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$5C                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$5D                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$5E                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$60                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$61                ;
                    BEQ   CODE_0DE8C1         ;
                    CMP.b #$5F                ;
CODE_0DE8C1:        RTS                       ;

CODE_0DE8C2:        LDA.w $0242,x             ;
                    CMP.b #$18                ;
                    BCC   CODE_0DE8EE         ;
                    JSR.w CODE_0DEAAA         ;
                    BEQ   CODE_0DE8EE         ;
                    JSR.w CODE_0DE89F         ;
                    BEQ   CODE_0DE8EE         ;
                    LDA.b $AB,x               ;
                    BMI   CODE_0DE8F4         ;
                    LDA.w $020D,x             ;
                    BNE   CODE_0DE8F4         ;
                    LDA.b #$FD                ;
                    STA.b $AB,x               ;
                    LDA.b #$01                ;
                    STA.w $020D,x             ;
                    LDA.w $0242,x             ;
                    AND.b #$F8                ;
                    STA.w $0242,x             ;
                    RTS                       ;

CODE_0DE8EE:        LDA.b #$00                ;
                    STA.w $020D,x             ;
                    RTS                       ;

CODE_0DE8F4:        LDA.b #$80                ;
                    STA.b $33,x               ;
                    LDA.b #$01                ;
                    STA.w $1600               ;
                    RTS                       ;

                    db $02,$08,$0E,$20,$03,$14,$0D,$20
                    db $02,$14,$0E,$20,$02,$09,$0E,$15
                    db $00,$00,$18,$06,$00,$00,$20,$0D
                    db $00,$00,$30,$0D,$00,$00,$08,$08
                    db $06,$04,$0A,$0C,$03,$0E,$0D,$14
                    db $04,$04,$1C,$1C,$04,$04,$0C,$1C
                    db $03,$07,$0D,$16

CODE_0DE932:        TXA                       ;
                    CLC                       ;
                    ADC.b #$0B                ;
                    TAX                       ;
                    LDY.b #$02                ;
                    BNE   CODE_0DE942         ;
CODE_0DE93B:        TXA                       ;
                    CLC                       ;
                    ADC.b #$0D                ;
                    TAX                       ;
                    LDY.b #$06                ;
CODE_0DE942:        JSR.w CODE_0DE9A9         ;
                    JMP.w CODE_0DE9EB         ;

CODE_0DE948:        LDY.b #$48                ;
                    STY.b $00                 ;
                    LDY.b #$44                ;
                    JMP.w CODE_0DE957         ;

CODE_0DE951:        LDY.b #$08                ;
                    STY.b $00                 ;
                    LDY.b #$04                ;
CODE_0DE957:        LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.b $01                 ;
                    LDA.b $79,x               ;
                    SBC.w $071A               ;
                    BMI   CODE_0DE96D         ;
                    ORA.b $01                 ;
                    BEQ   CODE_0DE96D         ;
                    LDY.b $00                 ;
CODE_0DE96D:        TYA                       ;
                    AND.w $03D1               ;
                    STA.w $03D9,x             ;
                    CPX.b #$09                ;
                    BEQ   CODE_0DE989         ;
                    LDA.w $03D9,x             ;
                    BNE   CODE_0DE996         ;
                    JMP.w CODE_0DE989         ;

CODE_0DE980:        INX                       ;
                    JSR.w CODE_0DFE34         ;
                    DEX                       ;
                    CMP.b #$FE                ;
                    BCS   CODE_0DE996         ;
CODE_0DE989:        TXA                       ;
                    CLC                       ;
                    ADC.b #$01                ;
                    TAX                       ;
                    LDY.b #$01                ;
                    JSR.w CODE_0DE9A9         ;
                    JMP.w CODE_0DE9EB         ;

CODE_0DE996:        TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b #$FF                ;
                    STA.w $0FA0,y             ;
                    STA.w $0FA1,y             ;
                    STA.w $0FA2,y             ;
                    STA.w $0FA3,y             ;
                    RTS                       ;

CODE_0DE9A9:        STX.b $00                 ;
                    LDA.w $03B8,y             ;
                    STA.b $02                 ;
                    LDA.w $03AD,y             ;
                    STA.b $01                 ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    PHA                       ;
                    TAY                       ;
                    LDA.w $048F,x             ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b $01                 ;
                    CLC                       ;
                    ADC.w $E8FE,x             ;
                    STA.w $0F9C,y             ;
                    LDA.b $01                 ;
                    CLC                       ;
                    ADC.w $E900,x             ;
                    STA.w $0F9E,y             ;
                    INX                       ;
                    INY                       ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.w $E8FE,x             ;
                    STA.w $0F9C,y             ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.w $E900,x             ;
                    STA.w $0F9E,y             ;
                    PLA                       ;
                    TAY                       ;
                    LDX.b $00                 ;
                    RTS                       ;

CODE_0DE9EB:        LDA.w $071C               ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.b $02                 ;
                    LDA.w $071A               ;
                    ADC.b #$00                ;
                    STA.b $01                 ;
                    LDA.w $0219,x             ;
                    CMP.b $02                 ;
                    LDA.b $78,x               ;
                    SBC.b $01                 ;
                    BCC   CODE_0DEA1A         ;
                    LDA.w $0F9E,y             ;
                    BMI   CODE_0DEA17         ;
                    LDA.b #$FF                ;
                    LDX.w $0F9C,y             ;
                    BMI   CODE_0DEA14         ;
                    STA.w $0F9C,y             ;
CODE_0DEA14:        STA.w $0F9E,y             ;
CODE_0DEA17:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DEA1A:        LDA.w $0F9C,y             ;
                    BPL   CODE_0DEA30         ;
                    CMP.b #$A0                ;
                    BCC   CODE_0DEA30         ;
                    LDA.b #$00                ;
                    LDX.w $0F9E,y             ;
                    BPL   CODE_0DEA2D         ;
                    STA.w $0F9E,y             ;
CODE_0DEA2D:        STA.w $0F9C,y             ;
CODE_0DEA30:        LDX.b $9E                 ;
                    RTS                       ;

CODE_0DEA33:        LDX.b #$00                ;
CODE_0DEA35:        STY.b $06                 ;
                    LDA.b #$01                ;
                    STA.b $07                 ;
CODE_0DEA3B:        LDA.w $0F9C,y             ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_0DEA6D         ;
                    CMP.w $0F9E,x             ;
                    BCC   CODE_0DEA5A         ;
                    BEQ   CODE_0DEA8C         ;
                    LDA.w $0F9E,y             ;
                    CMP.w $0F9C,y             ;
                    BCC   CODE_0DEA8C         ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_0DEA8C         ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_0DEA5A:        LDA.w $0F9E,x             ;
                    CMP.w $0F9C,x             ;
                    BCC   CODE_0DEA8C         ;
                    LDA.w $0F9E,y             ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_0DEA8C         ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_0DEA6D:        CMP.w $0F9C,x             ;
                    BEQ   CODE_0DEA8C         ;
                    CMP.w $0F9E,x             ;
                    BCC   CODE_0DEA8C         ;
                    BEQ   CODE_0DEA8C         ;
                    CMP.w $0F9E,y             ;
                    BCC   CODE_0DEA88         ;
                    BEQ   CODE_0DEA88         ;
                    LDA.w $0F9E,y             ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_0DEA8C         ;
CODE_0DEA88:        CLC                       ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_0DEA8C:        INX                       ;
                    INY                       ;
                    DEC.b $07                 ;
                    BPL   CODE_0DEA3B         ;
                    SEC                       ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_0DEA96:        PHA                       ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$01                ;
                    TAX                       ;
                    PLA                       ;
                    JMP.w CODE_0DEAB3         ;

                    TXA                       ;
                    CLC                       ;
                    ADC.b #$11                ;
                    TAX                       ;
                    LDY.b #$1B                ;
                    JMP.w CODE_0DEAB1         ;

CODE_0DEAAA:        LDY.b #$1A                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$0B                ;
                    TAX                       ;
CODE_0DEAB1:        LDA.b #$00                ;
CODE_0DEAB3:        JSR.w CODE_0DEAFF         ;
                    LDX.b $9E                 ;
                    CMP.b #$00                ;
                    RTS                       ;

                    db $00,$07,$0E,$08,$03,$0C,$02,$02
                    db $0D,$0D,$08,$03,$0C,$02,$02,$0D
                    db $0D,$08,$03,$0C,$02,$02,$0D,$0D
                    db $08,$00,$10,$04,$14,$04,$04,$04
                    db $20,$20,$08,$18,$08,$18,$02,$20
                    db $20,$08,$18,$08,$18,$12,$20,$20
                    db $18,$18,$18,$18,$18,$14,$14,$06
                    db $06,$08,$10

CODE_0DEAF6:        INY                       ;
CODE_0DEAF7:        LDA.b #$00                ;
                    BRA   CODE_0DEAFD         ;

CODE_0DEAFB:        LDA.b #$01                ;
CODE_0DEAFD:        LDX.b #$00                ;
CODE_0DEAFF:        PHA                       ;
                    STY.b $04                 ;
                    LDA.w $EABE,y             ;
                    CLC                       ;
                    ADC.w $0219,x             ;
                    STA.b $05                 ;
                    LDA.b $78,x               ;
                    ADC.b #$00                ;
                    AND.b #$01                ;
                    LSR   A                   ;
                    ORA.b $05                 ;
                    ROR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    JSR.w CODE_0DAA8F         ;
                    LDY.b $04                 ;
                    LDA.w $0237,x             ;
                    CLC                       ;
                    ADC.w $EADA,y             ;
                    AND.b #$F0                ;
                    SEC                       ;
                    SBC.b #$20                ;
                    STA.b $02                 ;
                    TAY                       ;
                    LDA.b ($06),y             ;
                    STA.b $03                 ;
                    LDY.b $04                 ;
                    PLA                       ;
                    BNE   CODE_0DEB3B         ;
                    LDA.w $0237,x             ;
                    JMP.w CODE_0DEB3E         ;

CODE_0DEB3B:        LDA.w $0219,x             ;
CODE_0DEB3E:        AND.b #$0F                ;
                    STA.b $04                 ;
                    LDA.b $E4                 ;
                    BNE   CODE_0DEB52         ;
                    LDA.b $03                 ;
                    CMP.b #$5C                ;
                    BCC   CODE_0DEB52         ;
                    CMP.b #$62                ;
                    BCS   CODE_0DEB52         ;
                    STZ.b $03                 ;
CODE_0DEB52:        LDA.b $03                 ;
                    RTS                       ;

                    db $FF,$FF,$FF

                    LDX.b #$06                ;
CODE_0DEB5A:        STA.w $0800,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_0DEB5A         ;
                    LDY.b $02                 ;
                    RTS                       ;

CODE_0DEB6A:        LDX.b #$06                ;
CODE_0DEB6C:        STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_0DEB6C         ;
                    LDY.b $02                 ;
                    RTS                       ;

                    LDA.b #$F0                ;
                    STA.w $0815,y             ;
                    STA.w $0811,y             ;
CODE_0DEB84:        STA.w $080D,y             ;
                    STA.w $0809,y             ;
CODE_0DEB8A:        STA.w $0805,y             ;
                    STA.w $0801,y             ;
                    RTS                       ;

CODE_0DEB91:        LDA.b #$F0                ;
CODE_0DEB93:        STA.w $0915,y             ;
                    STA.w $0911,y             ;
CODE_0DEB99:        STA.w $090D,y             ;
CODE_0DEB9C:        STA.w $0909,y             ;
CODE_0DEB9F:        STA.w $0905,y             ;
                    STA.w $0901,y             ;
                    RTS                       ;

CODE_0DEBA6:        LDA.w $0743               ;
                    BEQ   CODE_0DEBAE         ;
                    JMP.w CODE_0DEC32         ;

CODE_0DEBAE:        LDY.w $0B46,x             ;
                    STY.b $02                 ;
                    LDA.w $03AE               ;
                    JSR.w CODE_0DEB6A         ;
                    LDX.b $9E                 ;
                    LDA.w $0238,x             ;
                    JSR.w CODE_0DEB99         ;
                    LDY.b $5C                 ;
                    CPY.b #$03                ;
                    BEQ   CODE_0DEBCC         ;
                    LDY.w $06CC               ;
                    BEQ   CODE_0DEBCE         ;
CODE_0DEBCC:        LDA.b #$F0                ;
CODE_0DEBCE:        LDY.w $0B46,x             ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
                    LDA.b #$87                ;
                    LDX.b $9E                 ;
                    INY                       ;
                    JSR.w CODE_0DEB93         ;
                    LDA.b #$2C                ;
                    INY                       ;
                    JSR.w CODE_0DEB93         ;
                    JSR.w CODE_0DFE34         ;
                    LDY.w $0B46,x             ;
                    JSR.w CODE_0DFEC2         ;
                    JSR.w CODE_0DFEDB         ;
                    PHY                       ;
                    JSR.w CODE_0DFF51         ;
                    JSR.w CODE_0DFEDB         ;
                    JSR.w CODE_0DFF51         ;
                    JSR.w CODE_0DFEDB         ;
                    JSR.w CODE_0DFF51         ;
                    JSR.w CODE_0DFEDB         ;
                    JSR.w CODE_0DFF51         ;
                    JSR.w CODE_0DFEDB         ;
                    JSR.w CODE_0DFF51         ;
                    JSR.w CODE_0DFEDB         ;
                    PLY                       ;
                    LDA.w $03D1               ;
                    ASL   A                   ;
                    BCC   CODE_0DEC31         ;
                    LDA.b $1C,x               ;
                    CMP.b #$27                ;
                    BEQ   CODE_0DEC31         ;
                    CMP.b #$26                ;
                    BEQ   CODE_0DEC31         ;
                    LDA.b $BC,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_0DEC2E         ;
                    LDA.w $03B9               ;
                    CMP.b #$F0                ;
                    BCC   CODE_0DEC31         ;
CODE_0DEC2E:        JSR.w CODE_0DEB91         ;
CODE_0DEC31:        RTS                       ;

CODE_0DEC32:        JSL.l CODE_0FD4D3         ;
                    RTS                       ;

                    db $E9,$EA,$78,$79,$D6,$D6,$D9,$D9
                    db $8D,$8D,$E4,$E4,$E9,$EA,$78,$79
                    db $7E,$7F,$85,$86,$2C,$28,$28,$2A
                    db $2C

CODE_0DEC50:        LDA.w $0B4F
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $02                 ;
                    LDA.w $03AE               ;
                    STA.b $05                 ;
                    LDX.w $020C               ;
                    LDA.w $EC4B,x             ;
                    EOR.w $0260               ;
                    STA.b $04                 ;
                    TXA                       ;
                    PHA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b #$01                ;
                    STA.b $07                 ;
                    STA.b $03                 ;
CODE_0DEC7A:        LDA.w $EC37,x             ;
                    STA.b $00                 ;
                    LDA.w $EC38,x             ;
                    JSR.w CODE_0DF2EF         ;
                    DEC.b $07                 ;
                    BPL   CODE_0DEC7A         ;
                    LDA.w $0B4F               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    PLA                       ;
                    BEQ   CODE_0DECD3         ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DECD3         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DECD3         ;
                    STA.b $00                 ;
                    LDA.b $09                 ;
                    AND.b #$06                ;
                    CMP.b #$06                ;
                    BNE   CODE_0DECA7         ;
                    LDA.b #$0E                ;
CODE_0DECA7:        ORA.w $0260               ;
                    EOR.b #$28                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
                    LDX.b $00                 ;
                    DEX                       ;
                    BEQ   CODE_0DECC3         ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
CODE_0DECC3:        LDA.w $0907,y             ;
                    ORA.b #$40                ;
                    STA.w $0907,y             ;
                    LDA.w $090F,y             ;
                    ORA.b #$40                ;
                    STA.w $090F,y             ;
CODE_0DECD3:        LDA.w $0B4F               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    JMP.w CODE_0DF29F         ;

                    db $FC,$FC,$AA,$AB,$AC,$AD,$FC,$FC
                    db $AE,$AF,$B0,$B1,$FC,$A5,$A6,$A7
                    db $A8,$A9,$FC,$A0,$A1,$A2,$A3,$A4
                    db $69,$A5,$6A,$A7,$A8,$A9,$6B,$A0
                    db $6C,$A2,$A3,$A4,$FC,$FC,$96,$97
                    db $98,$99,$FC,$FC,$9A,$9B,$9C,$9D
                    db $FC,$FC,$8F,$8E,$8E,$8F,$FC,$FC
                    db $95,$94,$94,$95,$FC,$FC,$DC,$DC
                    db $DF,$DF,$DC,$DC,$DD,$DD,$DE,$DE
                    db $FC,$FC,$B2,$B3,$B4,$B5,$FC,$FC
                    db $B6,$B3,$B7,$B5,$FC,$FC,$C6,$C7
                    db $C8,$C9,$FC,$FC,$6E,$6E,$6F,$6F
                    db $FC,$FC,$6D,$6D,$6F,$6F,$FC,$FC
                    db $6F,$6F,$6E,$6E,$FC,$FC,$6F,$6F
                    db $6D,$6D,$FC,$FC,$F4,$F4,$F5,$F5
                    db $FC,$FC,$F4,$F4,$F5,$F5,$FC,$FC
                    db $F5,$F5,$F4,$F4,$FC,$FC,$F5,$F5
                    db $F4,$F4,$FC,$FC,$FC,$FC,$EF,$EF
                    db $B9,$B8,$BB,$BA,$BC,$BC,$FC,$FC
                    db $BD,$BD,$BC,$BC,$7A,$7B,$DA,$DB
                    db $D8,$9E,$CD,$CD,$CE,$CE,$CF,$CF
                    db $7D,$7C,$D1,$8C,$D3,$D2,$7D,$7C
                    db $89,$88,$8B,$8A,$D5,$D4,$E3,$E2
                    db $D3,$D2,$D5,$D4,$E3,$E2,$8B,$8A
                    db $E5,$E5,$E6,$E6,$EB,$EB,$EC,$EC
                    db $ED,$ED,$EB,$EB,$FC,$FC,$D0,$D0
                    db $D7,$D7,$C8,$C9,$D8,$D9,$E8,$E9
                    db $D6,$D7,$E6,$E7,$F8,$F7,$EE,$EF
                    db $FE,$FF,$E2,$E3,$DA,$DB,$EA,$EB
                    db $FA,$FB,$FC,$FC,$64,$65,$74,$75
                    db $F2,$F2,$F3,$F3,$F2,$F2,$F1,$F1
                    db $F1,$F1,$FC,$FC,$F0,$F0,$FC,$FC
                    db $FC,$FC,$0C,$0C,$00,$0C,$C0,$A8
                    db $54,$3C,$EA,$18,$48,$48,$CC,$C0
                    db $18,$18,$18,$90,$24,$FF,$48,$9C
                    db $D2,$D8,$F0,$F6,$FC,$0A,$0C,$0A
                    db $0C,$2C,$0A,$02,$08,$0A,$08,$0A
                    db $0C,$08,$2A,$0A,$0C,$0A,$0A,$0C
                    db $FF,$0C,$0C,$00,$00,$2C,$2C,$2C
                    db $08,$18,$18,$19,$1A,$19,$18,$00
                    db $00,$00,$00,$00,$00,$06,$06,$06
                    db $06,$06,$06,$0C,$0C,$0C,$0C,$0C
                    db $0C,$FC,$FC,$D0,$D0,$D7,$D7,$FC
                    db $FC,$7E,$7E,$7F,$7F,$FC,$FC,$E0
                    db $E0,$E1,$E1

CODE_0DEE40:        LDA.b $1C,x               ;
                    CMP.b #$0C                ;
                    BNE   CODE_0DEE4B         ;
                    JSL.l CODE_0FF913         ;
                    RTS                       ;

CODE_0DEE4B:        CMP.b #$08                ;
                    BNE   CODE_0DEE5D         ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0DEE58         ;
                    JSR.w CODE_0DCCEA         ;
CODE_0DEE58:        JSL.l CODE_0FD22A         ;
                    RTS                       ;

CODE_0DEE5D:        CMP.b #$33                ;
                    BNE   CODE_0DEE6F         ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0DEE6A         ;
                    JSR.w CODE_0DCCEA         ;
CODE_0DEE6A:        JSL.l CODE_0FD22A         ;
                    RTS                       ;

CODE_0DEE6F:        CMP.b #$2D                ;
                    BNE   CODE_0DEE78         ;
                    JSL.l CODE_0FD73D         ;
                    RTS                       ;

CODE_0DEE78:        CMP.b #$35                ;
                    BNE   CODE_0DEE91         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DEE8C         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DEE8C         ;
                    JSL.l CODE_00D57A         ;
                    RTS                       ;

CODE_0DEE8C:        JSL.l CODE_00C4BB         ;
                    RTS                       ;

CODE_0DEE91:        LDA.b #$02                ;
                    LDY.w $075F               ;
                    CPY.b #$01                ;
                    BEQ   CODE_0DEEA6         ;
                    CPY.b #$02                ;
                    BEQ   CODE_0DEEA6         ;
                    CPY.b #$06                ;
                    BEQ   CODE_0DEEA6         ;
                    CPY.b #$0B                ;
                    BNE   CODE_0DEEA7         ;
CODE_0DEEA6:        LSR   A                   ;
CODE_0DEEA7:        STA.w $0F30               ;
                    STA.w $0F31               ;
                    STA.w $0F32               ;
                    LDA.w $0238,x             ;
                    STA.b $02                 ;
                    LDA.w $03AE               ;
                    STA.b $05                 ;
                    LDY.w $0B46,x             ;
                    STY.b $EB                 ;
                    LDA.b #$00                ;
                    STA.b $F0                 ;
                    LDA.b $47,x               ;
                    STA.b $03                 ;
                    LDA.w $0257,x             ;
                    STA.b $04                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$0D                ;
                    BNE   CODE_0DEEDC         ;
                    LDY.b $5E,x               ;
                    BMI   CODE_0DEEDC         ;
                    LDY.w $0792,x             ;
                    BEQ   CODE_0DEEDC         ;
                    RTS                       ;

CODE_0DEEDC:        LDA.b $29,x               ;
                    STA.b $ED                 ;
                    AND.b #$1F                ;
                    TAY                       ;
                    LDA.b $1C,x               ;
                    CMP.b #$35                ;
                    BNE   CODE_0DEEF1         ;
                    LDY.b #$00                ;
                    LDA.b #$01                ;
                    STA.b $03                 ;
                    LDA.b #$15                ;
CODE_0DEEF1:        CMP.b #$33                ;
                    BNE   CODE_0DEF08         ;
                    DEC.b $02                 ;
                    LDA.b #$20                ;
                    LDY.w $0792,x             ;
                    BEQ   CODE_0DEF00         ;
                    EOR.b #$30                ;
CODE_0DEF00:        STA.b $04                 ;
                    LDY.b #$00                ;
                    STY.b $ED                 ;
                    LDA.b #$08                ;
CODE_0DEF08:        CMP.b #$32                ;
                    BNE   CODE_0DEF14         ;
                    LDY.b #$03                ;
                    LDX.w $070E               ;
                    LDA.w $EE17,x             ;
CODE_0DEF14:        STA.b $EF                 ;
                    STY.b $EC                 ;
                    LDX.b $9E                 ;
                    CMP.b #$0C                ;
                    BNE   CODE_0DEF24         ;
                    LDA.b $A1,x               ;
                    BMI   CODE_0DEF24         ;
                    INC.b $F0                 ;
CODE_0DEF24:        LDA.w $036A               ;
                    BEQ   CODE_0DEF32         ;
                    LDY.b #$16                ;
                    CMP.b #$01                ;
                    BEQ   CODE_0DEF30         ;
                    INY                       ;
CODE_0DEF30:        STY.b $EF                 ;
CODE_0DEF32:        LDY.b $EF                 ;
                    CPY.b #$06                ;
                    BNE   CODE_0DEF55         ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BCC   CODE_0DEF42         ;
                    LDX.b #$04                ;
                    STX.b $EC                 ;
CODE_0DEF42:        AND.b #$20                ;
                    ORA.w $0747               ;
                    BNE   CODE_0DEF55         ;
                    LDA.b $09                 ;
                    AND.b #$08                ;
                    BNE   CODE_0DEF55         ;
                    LDA.b $03                 ;
                    EOR.b #$03                ;
                    STA.b $03                 ;
CODE_0DEF55:        CPY.b #$0D                ;
                    BNE   CODE_0DEF5E         ;
                    LDA.w $0F24               ;
                    BRA   CODE_0DEF7D         ;

CODE_0DEF5E:        LDA.w $EDFA,y             ;
                    CPY.b #$14                ;
                    BNE   CODE_0DEF69         ;
                    LDA.b #$3C                ;
                    BRA   CODE_0DEF7F         ;

CODE_0DEF69:        CPY.b #$16                ;
                    BEQ   CODE_0DEF71         ;
                    CPY.b #$17                ;
                    BNE   CODE_0DEF7D         ;
CODE_0DEF71:        LDA.w $0201               ;
                    LSR   A                   ;
                    BCC   CODE_0DEF7B         ;
                    LDA.b #$06                ;
                    BRA   CODE_0DEF7D         ;

CODE_0DEF7B:        LDA.b #$00                ;
CODE_0DEF7D:        EOR.b $04                 ;
CODE_0DEF7F:        STA.b $04                 ;
                    CPY.b #$15                ;
                    BNE   CODE_0DEF98         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DEF90         ;
                    CMP.b #$0C                ;
                    BNE   CODE_0DEF98         ;
CODE_0DEF90:        LDA.b $04                 ;
                    AND.b #$F0                ;
                    ORA.b #$04                ;
                    STA.b $04                 ;
CODE_0DEF98:        LDA.w $0E85               ;
                    BEQ   CODE_0DEFA6         ;
                    LDA.w $EDDF,y             ;
                    CLC                       ;
                    ADC.b #$06                ;
                    TAX                       ;
                    BRA   CODE_0DEFAA         ;

CODE_0DEFA6:        LDA.w $EDDF,y             ;
                    TAX                       ;
CODE_0DEFAA:        LDY.b $EC                 ;
                    LDA.w $036A               ;
                    BEQ   CODE_0DEFDF         ;
                    CMP.b #$01                ;
                    BNE   CODE_0DEFC7         ;
                    LDA.w $0363               ;
                    BPL   CODE_0DEFBC         ;
                    LDX.b #$DE                ;
CODE_0DEFBC:        LDA.b $ED                 ;
                    AND.b #$20                ;
                    BEQ   CODE_0DEFC4         ;
CODE_0DEFC2:        STX.b $F0                 ;
CODE_0DEFC4:        JMP.w CODE_0DF0CD         ;

CODE_0DEFC7:        LDA.w $0363               ;
                    AND.b #$01                ;
                    BEQ   CODE_0DEFD0         ;
                    LDX.b #$E4                ;
CODE_0DEFD0:        LDA.b $ED                 ;
                    AND.b #$20                ;
                    BEQ   CODE_0DEFC4         ;
                    LDA.b $02                 ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.b $02                 ;
                    BRA   CODE_0DEFC2         ;

CODE_0DEFDF:        CPX.b #$24                ;
                    BNE   CODE_0DEFF3         ;
                    CPY.b #$05                ;
                    BNE   CODE_0DEFF1         ;
                    LDX.b #$30                ;
                    LDA.b #$02                ;
                    STA.b $03                 ;
                    LDA.b #$05                ;
                    STA.b $EC                 ;
CODE_0DEFF1:        BRA   CODE_0DF043         ;

CODE_0DEFF3:        CPX.b #$90                ;
                    BNE   CODE_0DF009         ;
                    LDA.b $ED                 ;
                    AND.b #$20                ;
                    BNE   CODE_0DF006         ;
                    LDA.w $079B               ;
                    CMP.b #$10                ;
                    BCS   CODE_0DF006         ;
                    LDX.b #$96                ;
CODE_0DF006:        JMP.w CODE_0DF0B3         ;

CODE_0DF009:        LDA.b $EF                 ;
                    CMP.b #$04                ;
                    BCS   CODE_0DF01F         ;
                    CPY.b #$02                ;
                    BCC   CODE_0DF01F         ;
                    LDX.b #$5A                ;
                    LDY.b $EF                 ;
                    CPY.b #$02                ;
                    BNE   CODE_0DF01F         ;
                    LDX.b #$7E                ;
                    INC.b $02                 ;
CODE_0DF01F:        LDA.b $EC                 ;
                    CMP.b #$04                ;
                    BNE   CODE_0DF043         ;
                    LDX.b #$72                ;
                    INC.b $02                 ;
                    LDY.b $EF                 ;
                    CPY.b #$02                ;
                    BEQ   CODE_0DF033         ;
                    LDX.b #$66                ;
                    INC.b $02                 ;
CODE_0DF033:        CPY.b #$06                ;
                    BNE   CODE_0DF043         ;
                    LDX.b #$54                ;
                    LDA.b $ED                 ;
                    AND.b #$20                ;
                    BNE   CODE_0DF043         ;
                    LDX.b #$8A                ;
                    DEC.b $02                 ;
CODE_0DF043:        LDY.b $9E                 ;
                    LDA.b $EF                 ;
                    CMP.b #$05                ;
                    BNE   CODE_0DF057         ;
                    LDA.b $ED                 ;
                    BEQ   CODE_0DF072         ;
                    AND.b #$08                ;
                    BEQ   CODE_0DF0B3         ;
                    LDX.b #$B4                ;
                    BNE   CODE_0DF072         ;
CODE_0DF057:        CPX.b #$48                ;
                    BEQ   CODE_0DF072         ;
                    LDA.w $07A2,y             ;
                    CMP.b #$05                ;
                    BCS   CODE_0DF0B3         ;
                    CPX.b #$3C                ;
                    BNE   CODE_0DF072         ;
                    CMP.b #$01                ;
                    BEQ   CODE_0DF0B3         ;
                    INC.b $02                 ;
                    INC.b $02                 ;
                    INC.b $02                 ;
                    BRA   CODE_0DF0A5         ;

CODE_0DF072:        LDA.b $EF                 ;
                    CMP.b #$06                ;
                    BEQ   CODE_0DF0B3         ;
                    CMP.b #$08                ;
                    BEQ   CODE_0DF0B3         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DF0B3         ;
                    CMP.b #$18                ;
                    BCS   CODE_0DF0B3         ;
                    LDY.b #$00                ;
                    CMP.b #$15                ;
                    BNE   CODE_0DF09E         ;
                    INY                       ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_0DF0B3         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DF0B3         ;
                    LDX.b #$A2                ;
                    LDA.b #$03                ;
                    STA.b $EC                 ;
                    BNE   CODE_0DF0B3         ;
CODE_0DF09E:        LDA.b $09                 ;
                    AND.w $EE15,y             ;
                    BNE   CODE_0DF0B3         ;
CODE_0DF0A5:        LDA.b $ED                 ;
                    AND.b #$A0                ;
                    ORA.w $0747               ;
                    BNE   CODE_0DF0B3         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$06                ;
                    TAX                       ;
CODE_0DF0B3:        LDA.w $EF               ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DF0C6         ;
                    LDA.b $ED                 ;
                    AND.b #$20                ;
                    BEQ   CODE_0DF0CD         ;
                    LDA.b $EF                 ;
                    CMP.b #$04                ;
                    BCC   CODE_0DF0CD         ;
CODE_0DF0C6:        LDY.b #$01                ;
                    STY.b $F0                 ;
                    DEY                       ;
                    STY.b $EC                 ;
CODE_0DF0CD:        LDY.b $EB                 ;
                    JSL.l CODE_0FF96C         ;
                    BCS   CODE_0DF0E2         ;
                    JSR.w CODE_0DF2E7         ;
                    JSR.w CODE_0DF2E7         ;
                    JSR.w CODE_0DF2E7         ;
                    JSL.l CODE_0FFA4D         ;
CODE_0DF0E2:        LDX.b $9E                 ;
                    LDY.w $0B46,x             ;
                    LDA.b $1C,x               ;
                    CMP.b #$0C                ;
                    BNE   CODE_0DF128         ;
                    INC.w $0E1B,x             ;
                    LDA.w $0E1B,x             ;
                    CMP.b #$12                ;
                    BCC   CODE_0DF0FD         ;
                    STZ.w $0E1B,x             ;
                    LDA.w $0E1B,x             ;
CODE_0DF0FD:        TAX                       ;
                    LDA.w $EE1C,x             ;
                    TAX                       ;
                    LDA.w $EE2E,x             ;
                    STA.w $0902,y             ;
                    LDA.w $EE2F,x             ;
                    STA.w $0906,y             ;
                    LDA.w $EE30,x             ;
                    STA.w $090A,y             ;
                    LDA.w $EE31,x             ;
                    STA.w $090E,y             ;
                    LDA.w $EE32,x             ;
                    STA.w $0912,y             ;
                    LDA.w $EE33,x             ;
                    STA.w $0916,y             ;
                    LDX.b $9E                 ;
CODE_0DF128:        LDA.b $EF                 ;
                    CMP.b #$08                ;
                    BNE   CODE_0DF131         ;
CODE_0DF12E:        JMP.w CODE_0DF247         ;

CODE_0DF131:        LDA.b $F0                 ;
                    BEQ   CODE_0DF176         ;
                    LDA.w $0903,y             ;
                    ORA.b #$80                ;
                    INY                       ;
                    INY                       ;
                    JSR.w CODE_0DEB93         ;
                    DEY                       ;
                    DEY                       ;
                    TYA                       ;
                    TAX                       ;
                    LDA.b $EF                 ;
                    CMP.b #$05                ;
                    BEQ   CODE_0DF15A         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DF15A         ;
                    CMP.b #$11                ;
                    BEQ   CODE_0DF15A         ;
                    CMP.b #$15                ;
                    BCS   CODE_0DF15A         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAX                       ;
CODE_0DF15A:        LDA.w $0902,x             ;
                    PHA                       ;
                    LDA.w $0906,x             ;
                    PHA                       ;
                    LDA.w $0912,y             ;
                    STA.w $0902,x             ;
                    LDA.w $0916,y             ;
                    STA.w $0906,x             ;
                    PLA                       ;
                    STA.w $0916,y             ;
                    PLA                       ;
                    STA.w $0912,y             ;
CODE_0DF176:        LDA.w $036A               ;
                    BNE   CODE_0DF12E         ;
                    LDA.b $EF                 ;
                    LDX.b $EC                 ;
                    CMP.b #$05                ;
                    BNE   CODE_0DF186         ;
                    JMP.w CODE_0DF247         ;

CODE_0DF186:        CMP.b #$07                ;
                    BEQ   CODE_0DF1A2         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_0DF1A2         ;
                    CMP.b #$04                ;
                    BEQ   CODE_0DF1A2         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DF1A2         ;
                    CMP.b #$12                ;
                    BNE   CODE_0DF19E         ;
                    CPX.b #$05                ;
                    BNE   CODE_0DF1E2         ;
CODE_0DF19E:        CPX.b #$02                ;
                    BCC   CODE_0DF1E2         ;
CODE_0DF1A2:        LDA.w $036A               ;
                    BNE   CODE_0DF1E2         ;
                    LDA.w $0F49               ;
                    BNE   CODE_0DF1E2         ;
                    LDA.w $0903,y             ;
                    AND.b #$BE                ;
                    STA.w $0903,y             ;
                    STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    ORA.b #$40                ;
                    CPX.b #$05                ;
                    BNE   CODE_0DF1C2         ;
                    ORA.b #$80                ;
CODE_0DF1C2:        STA.w $0907,y             ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
                    CPX.b #$04                ;
                    BNE   CODE_0DF1E2         ;
                    LDA.w $090B,y             ;
                    ORA.b #$80                ;
                    STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    ORA.b #$40                ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
CODE_0DF1E2:        LDA.b $EF                 ;
                    CMP.b #$11                ;
                    BNE   CODE_0DF21D         ;
                    LDA.b $F0                 ;
                    BNE   CODE_0DF20D         ;
                    LDA.w $0913,y             ;
                    AND.b #$BF                ;
                    STA.w $0913,y             ;
                    LDA.w $0917,y             ;
                    ORA.b #$40                ;
                    STA.w $0917,y             ;
                    LDX.w $079B               ;
                    CPX.b #$10                ;
                    BCS   CODE_0DF247         ;
                    STA.w $090F,y             ;
                    AND.b #$BF                ;
                    STA.w $090B,y             ;
                    BCC   CODE_0DF247         ;
CODE_0DF20D:        LDA.w $0903,y             ;
                    AND.b #$BF                ;
                    STA.w $0903,y             ;
                    LDA.w $0907,y             ;
                    ORA.b #$40                ;
                    STA.w $0907,y             ;
CODE_0DF21D:        LDA.b $EF                 ;
                    CMP.b #$18                ;
                    BCC   CODE_0DF247         ;
                    LDA.w $0F30               ;
                    LSR   A                   ;
                    BCC   CODE_0DF22D         ;
                    LDA.b #$AA                ;
                    BRA   CODE_0DF22F         ;

CODE_0DF22D:        LDA.b #$AC                ;
CODE_0DF22F:        STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    ORA.b #$40                ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
                    AND.b #$3F                ;
                    STA.w $0903,y             ;
                    ORA.b #$40                ;
                    STA.w $0907,y             ;
CODE_0DF247:        LDX.b $9E                 ;
                    LDA.b $EF                 ;
                    CMP.b #$0D                ;
                    BNE   CODE_0DF26B         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DF28B         ;
                    LDA.w $0913,y             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0913,y             ;
                    LDA.w $0917,y             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0917,y             ;
                    BRA   CODE_0DF29F         ;

CODE_0DF26B:        CMP.b #$04                ;
                    BNE   CODE_0DF29F         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_0DF28B         ;
                    LDA.w $0903,y             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0903,y             ;
                    LDA.w $0907,y             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0907,y             ;
                    BRA   CODE_0DF29F         ;

CODE_0DF28B:        LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    STA.w $0909,y             ;
                    STA.w $090D,y             ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
CODE_0DF29F:        LDX.b $9E                 ;
                    JSR.w CODE_0DFEC2         ;
                    STZ.b $04                 ;
                    JSR.w CODE_0DFEFB         ;
                    JSR.w CODE_0DFF51         ;
                    STZ.b $04                 ;
                    JSR.w CODE_0DFEFB         ;
                    DEY                       ;
                    DEY                       ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $03D1               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    BCC   CODE_0DF2C6         ;
                    LDA.b #$10                ;
                    JSR.w CODE_0DF303         ;
CODE_0DF2C6:        PLA                       ;
                    LSR   A                   ;
                    PHA                       ;
                    BCC   CODE_0DF2D0         ;
                    LDA.b #$08                ;
                    JSR.w CODE_0DF303         ;
CODE_0DF2D0:        PLA                       ;
                    LSR   A                   ;
                    BCC   CODE_0DF2E6         ;
                    JSR.w CODE_0DF303         ;
                    LDA.b $1C,x               ;
                    CMP.b #$0C                ;
                    BEQ   CODE_0DF2E6         ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_0DF2E6         ;
                    JSR.w CODE_0DCCEA         ;
CODE_0DF2E6:        RTS                       ;

CODE_0DF2E7:        LDA.w $ECDD,x             ;
                    STA.b $00                 ;
                    LDA.w $ECDE,x             ;
CODE_0DF2EF:        STA.b $01                 ;
                    LDA.b $02                 ;
                    CMP.b #$F9                ;
                    BNE   CODE_0DF2FB         ;
                    LDA.b #$F0                ;
                    STA.b $02                 ;
CODE_0DF2FB:        JMP.w CODE_0DFFAC         ;

CODE_0DF2FE:        STA.b $01                 ;
                    JMP.w CODE_0DFF64         ;

CODE_0DF303:        STX.b $9E                 ;
                    CPX.b #$0A                ;
                    BNE   CODE_0DF30A         ;
                    DEX                       ;
CODE_0DF30A:        CLC                       ;
                    ADC.w $0B46,x             ;
                    TAY                       ;
                    LDA.b #$F0                ;
                    LDX.b $9E                 ;
                    JMP.w CODE_0DEB9F         ;

                    STX.b $9E                 ;
                    CPX.b #$0A                ;
                    BNE   CODE_0DF31D         ;
                    DEX                       ;
CODE_0DF31D:        CLC                       ;
                    ADC.w $0B46,x             ;
                    TAY                       ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    STA.w $0909,y             ;
                    STA.w $0911,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D10,y             ;
                    RTS                       ;

                    LDA.b #$01                ;
                    STA.w $0D04,y             ;
                    STA.w $0D0C,y             ;
                    STA.w $0D14,y             ;
                    RTS                       ;

CODE_0DF348:        LDY.w $0B51,x             ;
                    LDA.w $03B1               ;
                    STA.w $0800,y             ;
                    LDA.w $03BC               ;
                    STA.w $0801,y             ;
                    LDA.b #$2B                ;
                    STA.w $0803,y             ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    LDA.w $03EA,x             ;
                    CMP.b #$FD                ;
                    BNE   CODE_0DF36C         ;
                    LDA.b #$00                ;
                    BRA   CODE_0DF36E         ;

CODE_0DF36C:        LDA.b #$02                ;
CODE_0DF36E:        STA.w $0802,y             ;
                    LDA.b $85,x               ;
                    STA.b $E5                 ;
                    LDA.w $0226,x             ;
                    STA.b $E4                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b $E5                 ;
                    BEQ   CODE_0DF38E         ;
                    LDA.b #$03                ;
                    STA.w $0C00,y             ;
CODE_0DF38E:        RTS                       ;

                    AND.b #$08                ;
                    BEQ   CODE_0DF39B         ;
                    LDA.b #$F0                ;
                    STA.w $0801,y             ;
                    STA.w $0809,y             ;
CODE_0DF39B:        RTS                       ;

CODE_0DF39C:        LDA.b #$2C                ;
                    STA.b $00                 ;
                    LDA.b #$75                ;
                    LDY.b $0F                 ;
                    CPY.b #$05                ;
                    BEQ   CODE_0DF3AE         ;
                    LDA.b #$2A                ;
                    STA.b $00                 ;
                    LDA.b #$84                ;
CODE_0DF3AE:        LDY.w $0B51,x             ;
                    INY                       ;
                    JSR.w CODE_0DEB84         ;
                    LDA.b $09                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    AND.b #$C0                ;
                    ORA.b $00                 ;
                    INY                       ;
                    JSR.w CODE_0DEB84         ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $03BC               ;
                    CMP.b #$F0                ;
                    BCC   CODE_0DF3CE         ;
                    LDA.b #$F0                ;
CODE_0DF3CE:        JSR.w CODE_0DEB8A         ;
                    LDA.w $03B1               ;
                    STA.w $0800,y             ;
                    LDA.w $03F3,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.b $00                 ;
                    SEC                       ;
                    SBC.w $03B1               ;
                    ADC.b $00                 ;
                    ADC.b #$06                ;
                    STA.w $0804,y             ;
                    LDA.w $03BD               ;
                    CMP.b #$F0                ;
                    BCC   CODE_0DF3F4         ;
                    LDA.b #$F0                ;
CODE_0DF3F4:        STA.w $0809,y             ;
                    STA.w $080D,y             ;
                    LDA.w $03B2               ;
                    STA.w $0808,y             ;
                    LDA.b $00                 ;
                    SEC                       ;
                    SBC.w $03B2               ;
                    ADC.b $00                 ;
                    ADC.b #$06                ;
                    STA.w $080C,y             ;
                    LDA.w $03D4               ;
                    ASL   A                   ;
                    BCC   CODE_0DF418         ;
                    LDA.b #$F0                ;
                    JSR.w CODE_0DEB8A         ;
CODE_0DF418:        LDA.w $03D4               ;
                    BEQ   CODE_0DF425         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C08,y             ;
CODE_0DF425:        LDA.w $03D5               ;
                    BEQ   CODE_0DF432         ;
                    LDA.b #$01                ;
                    STA.w $0C04,y             ;
                    STA.w $0C0C,y             ;
CODE_0DF432:        RTS                       ;

CODE_0DF433:        LDY.w $0B56,x             ;
                    LDA.w $03BA               ;
                    STA.w $0801,y             ;
                    LDA.w $03AF               ;
                    STA.w $0800,y             ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    AND.b #$01                ;
                    EOR.b #$BE                ;
                    STA.w $0802,y             ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b #$28                ;
                    BCC   CODE_0DF457         ;
                    ORA.b #$C0                ;
CODE_0DF457:        STA.w $0803,y             ;
                    LDA.w $68,x             ;
                    BPL   CODE_0DF46B         ;
                    LDA.w $03AF               ;
                    CMP.b #$F8                ;
                    BCC   CODE_0DF46B         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
CODE_0DF46B:        RTS                       ;

                    LDY.w $0B56,x             ;
                    LDA.w $03BA               ;
                    STA.w $0901,y             ;
                    LDA.w $03AF               ;
                    STA.w $0900,y             ;
CODE_0DF47B:        LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    AND.b #$01                ;
                    EOR.b #$BE                ;
                    STA.w $0902,y             ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b #$38                ;
                    BCC   CODE_0DF490         ;
                    ORA.b #$C0                ;
CODE_0DF490:        STA.w $0903,y             ;
                    RTS                       ;


                    db $CC,$CB,$CA,$FC


CODE_0DF498:        LDY.w $0B51,x
                    LDA.w $68,x             ;
                    BMI   CODE_0DF4B7         ;
                    LDA.w $03AF               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $03AF               ;
                    CMP.b #$F8                ;
                    BCC   CODE_0DF4D6         ;
CODE_0DF4AD:        LDA.b #$01                ;
                    STA.w $0C08,y             ;
                    STA.w $0C0C,y             ;
                    BRA   CODE_0DF4D6         ;

CODE_0DF4B7:        LDA.w $03AF               ;
                    CMP.b #$F0                ;
                    BCC   CODE_0DF4D6         ;
                    CMP.b #$F8                ;
                    BCC   CODE_0DF4CC         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C04,y             ;
                    BRA   CODE_0DF4D6         ;

CODE_0DF4CC:        LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C04,y             ;
                    BRA   CODE_0DF4AD         ;

CODE_0DF4D6:        LDA.b $33,x               ;
                    INC.b $33,x               ;
                    LSR   A                   ;
                    AND.b #$07                ;
                    CMP.b #$03                ;
                    BCS   CODE_0DF528         ;
                    TAX                       ;
                    LDA.w $F494,x             ;
                    INY                       ;
                    JSR.w CODE_0DEB84         ;
                    DEY                       ;
                    LDX.b $9E                 ;
                    LDA.w $03BA               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $0801,y             ;
                    STA.w $0809,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0805,y             ;
                    STA.w $080D,y             ;
                    LDA.w $03AF               ;
                    STA.w $0800,y             ;
                    STA.w $0804,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0808,y             ;
                    STA.w $080C,y             ;
                    LDA.b #$28                ;
                    STA.w $0803,y             ;
                    LDA.b #$A8                ;
                    STA.w $0807,y             ;
                    LDA.b #$68                ;
                    STA.w $080B,y             ;
                    LDA.b #$E8                ;
                    STA.w $080F,y             ;
                    RTS                       ;

CODE_0DF528:        STZ.b $33,x               ;
                    RTS                       ;

                    db $48,$4A,$4C,$4E,$0C,$08,$0A,$0C
                    db $08,$0A,$0C,$08,$0A

CODE_0DF538:        TAX                       ;
                    LDA.w $F52B,x             ;
                    INY                       ;
                    JSR.w CODE_0DEB99         ;
                    DEY                       ;
                    LDX.b $9E                 ;
                    LDA.w $03BA               ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $0901,y             ;
                    STA.w $0909,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0905,y             ;
                    STA.w $090D,y             ;
                    LDA.w $03AF               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0900,y             ;
                    STA.w $0904,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0908,y             ;
                    STA.w $090C,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    PHX                       ;
                    LDA.b $A1,x               ;
                    TAX                       ;
                    DEX                       ;
                    LDA.w $F52F,x             ;
                    ORA.b #$20                ;
                    STA.w $0903,y             ;
                    LDA.w $F52F,x             ;
                    ORA.b #$A0                ;
                    STA.w $0907,y             ;
                    LDA.w $F52F,x             ;
                    ORA.b #$60                ;
                    STA.w $090B,y             ;
                    LDA.w $F52F,x             ;
                    ORA.b #$E0                ;
                    STA.w $090F,y             ;
                    PLX                       ;
                    RTS                       ;

CODE_0DF5A2:        LDY.w $0B46,x             ;
                    LDA.b #$87                ;
                    INY                       ;
                    JSR.w CODE_0DEB93         ;
                    INY                       ;
                    LDA.b #$2C                ;
                    JSR.w CODE_0DEB93         ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $090C,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    STA.w $0910,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0908,y             ;
                    STA.w $0914,y             ;
                    LDA.w $0238,x             ;
                    TAX                       ;
                    PHA                       ;
                    CPX.b #$00                ;
                    BCS   CODE_0DF5D9         ;
                    LDA.b #$F0                ;
CODE_0DF5D9:        JSR.w CODE_0DEB9C         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b #$80                ;
                    TAX                       ;
                    CPX.b #$00                ;
                    BCS   CODE_0DF5E7         ;
                    LDA.b #$F0                ;
CODE_0DF5E7:        STA.w $090D,y             ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
                    LDA.w $03D1               ;
                    PHA                       ;
                    AND.b #$08                ;
                    BEQ   CODE_0DF600         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
                    STA.w $0D0C,y             ;
CODE_0DF600:        PLA                       ;
                    PHA                       ;
                    AND.b #$04                ;
                    BEQ   CODE_0DF60E         ;
                    LDA.b #$01                ;
                    STA.w $0D04,y             ;
                    STA.w $0D10,y             ;
CODE_0DF60E:        PLA                       ;
                    AND.b #$02                ;
                    BEQ   CODE_0DF61B         ;
                    LDA.b #$01                ;
                    STA.w $0D08,y             ;
                    STA.w $0D14,y             ;
CODE_0DF61B:        LDX.b $9E                 ;
                    RTS                       ;

                    db $20,$28,$C8,$18,$00,$40,$50,$58
                    db $80,$88,$B8,$78,$60,$A0,$B0,$B8
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $9E,$9F

CODE_0DF700:        LDA.w $0E41               ;
                    BNE   CODE_0DF722         ;
                    LDA.w $06D5               ;
                    CMP.b #$18                ;
                    BEQ   CODE_0DF710         ;
                    CMP.b #$78                ;
                    BNE   CODE_0DF726         ;
CODE_0DF710:        INC.w $0E41               ;
                    BRA   CODE_0DF71F         ;

                    LDA.w $0202               ;
                    AND.b #$02                ;
                    BNE   CODE_0DF726         ;
                    INC.w $0E41               ;
CODE_0DF71F:        STZ.w $0E40               ;
CODE_0DF722:        JSL.l CODE_0FE5A4         ;
CODE_0DF726:        LDA.b $0F                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DF736         ;
                    LDA.w $07AE               ;
                    BEQ   CODE_0DF736         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_0DF7AC         ;
CODE_0DF736:        LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DF7B7         ;
                    LDA.w $070B               ;
                    BNE   CODE_0DF7B2         ;
                    LDY.w $0704               ;
                    BEQ   CODE_0DF7AD         ;
                    LDA.b $28                 ;
                    CMP.b #$00                ;
                    BEQ   CODE_0DF7AD         ;
                    JSR.w CODE_0DF7AD         ;
                    TAX                       ;
                    LDY.w $0B45               ;
                    LDA.w $0202               ;
                    LSR   A                   ;
                    BCS   CODE_0DF75D         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
CODE_0DF75D:        LDA.w $0754               ;
                    BNE   CODE_0DF7AC         ;
                    LDA.w $28               ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DF7AC         ;
                    LDA.w $0F               ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DF7AC         ;
                    PHX                       ;
                    LDA.w $0202               ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DF787         ;
                    LDA.w $0810,y             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0810,y             ;
                    BCS   CODE_0DF787         ;
                    LDA.b #$03                ;
                    BRA   CODE_0DF789         ;

CODE_0DF787:        LDA.b #$02                ;
CODE_0DF789:        STA.w $0C10,y             ;
                    LDA.w $06D5               ;
                    SEC                       ;
                    SBC.b #$28                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0812,y             ;
                    LDA.w $0819,y             ;
                    CMP.b #$F0                ;
                    BCC   CODE_0DF7A6         ;
                    LDA.b #$F0                ;
                    STA.w $0811,y             ;
CODE_0DF7A6:        LDA.b #$F0                ;
                    STA.w $0819,y             ;
                    PLX                       ;
CODE_0DF7AC:        RTS                       ;

CODE_0DF7AD:        JSR.w CODE_0DFBB8         ;
                    BRA   CODE_0DF7BC         ;

CODE_0DF7B2:        JSR.w CODE_0DFC76         ;
                    BRA   CODE_0DF7BC         ;

CODE_0DF7B7:        LDY.b #$0E                ;
                    LDA.w $F61E,y             ;
CODE_0DF7BC:        STA.w $06D5               ;
                    LDA.w $03CE               ;
                    BNE   CODE_0DF7D7         ;
                    LDA.w $0218               ;
                    BEQ   CODE_0DF7DA         ;
                    LDA.w $0754               ;
                    BNE   CODE_0DF7D5         ;
                    LDA.b #$D8                ;
                    STA.w $06D5               ;
                    BRA   CODE_0DF7DA         ;

CODE_0DF7D5:        LDA.b #$E0                ;
CODE_0DF7D7:        STA.w $06D5               ;
CODE_0DF7DA:        LDA.b #$04                ;
                    JSR.w CODE_0DFB6E         ;
                    JSR.w CODE_0DFCAF         ;
                    LDA.b $02                 ;
                    CMP.b #$03                ;
                    BNE   CODE_0DF802         ;
                    LDA.w $0219               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    LDA.b $78                 ;
                    SBC.b $43                 ;
                    BEQ   CODE_0DF802         ;
                    LDA.b #$01                ;
                    STA.w $0CD0               ;
                    STA.w $0CD8               ;
                    STA.w $0CE0               ;
                    STA.w $0CE8               ;
CODE_0DF802:        LDA.w $0711               ;
                    BEQ   CODE_0DF832         ;
                    LDY.b #$00                ;
                    LDA.w $0789               ;
                    CMP.w $0711               ;
                    STY.w $0711               ;
                    BCS   CODE_0DF832         ;
                    STA.w $0711               ;
                    LDA.b $28                 ;
                    CMP.b #$01                ;
                    BEQ   CODE_0DF825         ;
                    LDY.b #$07                ;
                    LDA.w $F61E,y             ;
                    STA.w $06D5               ;
CODE_0DF825:        LDY.b #$04                ;
                    LDA.b $5D                 ;
                    ORA.b $0C                 ;
                    BEQ   CODE_0DF82E         ;
                    DEY                       ;
CODE_0DF82E:        TYA                       ;
                    JSR.w CODE_0DFB6E         ;
CODE_0DF832:        LDA.w $03D0               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDX.b #$03                ;
                    LDA.w $0B45               ;
                    CLC                       ;
                    ADC.b #$18                ;
                    TAY                       ;
CODE_0DF844:        LDA.b #$F0                ;
                    LSR.b $00                 ;
                    BCC   CODE_0DF84D         ;
                    JSR.w CODE_0DEB8A         ;
CODE_0DF84D:        TYA                       ;
                    SEC                       ;
                    SBC.b #$08                ;
                    TAY                       ;
                    DEX                       ;
                    BPL   CODE_0DF844         ;
                    JSR.w CODE_0DFCCC         ;
                    RTS                       ;

                    db $40,$01,$2E,$60,$FF,$04

CODE_0DF85F:        JSR.w CODE_0D841C         ;
                    LDA.b #$D0                ;
                    STA.w $06D5               ;
                    JSL.l CODE_00C000         ;
                    LDX.b #$05                ;
CODE_0DF86D:        LDA.w $F859,x             ;
                    STA.b $02,x               ;
                    DEX                       ;
                    BPL   CODE_0DF86D         ;
                    LDX.b #$B8                ;
                    LDY.b #$D0                ;
                    JSR.w CODE_0DFB94         ;
                    JSR.w CODE_0DF883         ;
                    JSR.w CODE_0D9ED1         ;
                    RTS                       ;

CODE_0DF883:        PHX                       ;
                    PHY                       ;
                    LDA.b #$F0                ;
CODE_0DF887:        STA.w $0801,y             ;
                    STA.w $0901,y             ;
                    INY                       ;
                    BNE   CODE_0DF887         ;
                    JSR.w CODE_0DF999         ;
                    LDX.b #$00                ;
                    LDA.b #$30                ;
                    STA.b $E2                 ;
CODE_0DF899:        JSR.w CODE_0DF920         ;
                    CMP.b #$02                ;
                    BNE   CODE_0DF8D9         ;
                    LDA.b $1C,x               ;
                    CMP.b #$16                ;
                    BEQ   CODE_0DF8CB         ;
                    PHY                       ;
                    PHX                       ;
                    JSR.w CODE_0DEE6F         ;
                    PLX                       ;
                    LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    STA.w $0D10,y             ;
                    STA.w $0D14,y             ;
                    LDA.b $43                 ;
                    STA.b $79,x               ;
                    PLY                       ;
                    BRA   CODE_0DF8D0         ;

CODE_0DF8CB:        JSR.w CODE_0DFA84         ;
                    BRA   CODE_0DF913         ;

CODE_0DF8D0:        LDA.b $1C,x               ;
                    CMP.b #$12                ;
                    BNE   CODE_0DF8D9         ;
                    JSR.w CODE_0DFA2D         ;
CODE_0DF8D9:        INY                       ;
                    INX                       ;
                    CPX.b #$05                ;
                    BNE   CODE_0DF899         ;
                    LDA.b $5C                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DF913         ;
                    LDX.b #$00                ;
CODE_0DF8E7:        LDA.w $0902,x             ;
                    CMP.w $0906,x             ;
                    BNE   CODE_0DF901         ;
                    LDA.w $0903,x             ;
                    AND.b #$3F                ;
                    STA.w $0903,x             ;
                    LDA.w $0907,x             ;
                    ORA.b #$40                ;
                    STA.w $0907,x             ;
                    BRA   CODE_0DF907         ;

CODE_0DF901:        LDA.w $0907,x             ;
                    STA.w $0903,x             ;
CODE_0DF907:        INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$00                ;
                    BNE   CODE_0DF8E7         ;
CODE_0DF913:        LDX.b #$04                ;
CODE_0DF915:        STZ.b $1C,x               ;
                    DEX                       ;
                    BPL   CODE_0DF915         ;
                    STZ.w $0E85               ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_0DF920:        STZ.w $0E85               ;
                    PHX                       ;
                    TYX                       ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   CODE_0DF932         ;
                    LDA.l $0FF8AF,x           ;
                    BRA   CODE_0DF936         ;

CODE_0DF932:        LDA.l $0FF80A,x           ;
CODE_0DF936:        PLX                       ;
                    CMP.b #$FF                ;
                    BNE   CODE_0DF945         ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.b $E2                 ;
                    JMP.w CODE_0DF998         ;

CODE_0DF945:        STZ.w $00BC,x             ;
                    STA.b $1C,x               ;
                    CMP.b #$0E                ;
                    BEQ   CODE_0DF962         ;
                    CMP.b #$0F                ;
                    BEQ   CODE_0DF962         ;
                    CMP.b #$10                ;
                    BEQ   CODE_0DF962         ;
                    CMP.b #$14                ;
                    BEQ   CODE_0DF962         ;
                    CMP.b #$08                ;
                    BEQ   CODE_0DF962         ;
                    LDA.b #$98                ;
                    BRA   CODE_0DF964         ;

CODE_0DF962:        LDA.b #$88                ;
CODE_0DF964:        STA.w $0238,x             ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.b $E2                 ;
                    STA.w $03AE               ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    PHX                       ;
                    TYX                       ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   CODE_0DF985         ;
                    LDA.l $0FF8AF,x           ;
                    BRA   CODE_0DF989         ;

CODE_0DF985:        LDA.l $0FF80A,x           ;
CODE_0DF989:        PLX                       ;
                    CMP.b #$05                ;
                    BNE   CODE_0DF994         ;
                    STA.w $0E85               ;
                    JSR.w CODE_0DFB4C         ;
CODE_0DF994:        LDA.b #$02                ;
                    STA.b $47,x               ;
CODE_0DF998:        RTS                       ;

CODE_0DF999:        LDA.w $075F               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $075F               ;
                    CLC                       ;
                    ADC.w $0760               ;
                    TAX                       ;
                    LDA.l $0E8EB3,x           ;
                    STA.w $0E22               ;
                    LDA.l $0E8EF4,x           ;
                    STA.w $0E21               ;
                    PHA                       ;
                    CMP.b #$21                ;
                    BCC   CODE_0DF9C0         ;
                    SEC                       ;
                    SBC.b #$21                ;
                    STA.w $0E21               ;
CODE_0DF9C0:        ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $0E21               ;
                    TAY                       ;
                    PLA                       ;
                    STA.w $0E21               ;
                    LDA.w $071C               ;
                    STA.b $9C                 ;
                    LDA.w $071A               ;
                    STA.b $9D                 ;
                    INC.b $9B                 ;
                    STZ.w $071A               ;
                    STZ.w $073F               ;
                    STZ.w $0EFD               ;
                    STZ.w $0EFE               ;
                    STZ.w $0EEE               ;
                    STZ.w $0EEF               ;
                    STZ.w $210D               ;
                    STZ.w $210D               ;
                    STZ.w $210F               ;
                    STZ.w $210F               ;
                    STZ.w $2111               ;
                    STZ.w $2111               ;
                    RTS                       ;

                    db $DC,$DC,$DD,$DD,$DE,$DE

                    LDA.w $F9FC               ;
                    STA.w $0962               ;
                    LDA.w $F9FD               ;
                    STA.w $0966               ;
                    LDA.w $F9FE               ;
                    STA.w $096A               ;
                    LDA.w $F9FF               ;
                    STA.w $096E               ;
                    LDA.w $FA00               ;
                    STA.w $0972               ;
                    LDA.w $FA01               ;
                    STA.w $0976               ;
                    RTS                       ;

                    db $B9,$B8,$BB,$BA,$BC,$BC

CODE_0DFA2D:        PHY                       ;
                    LDA.b #$03                ;
                    STA.b $03                 ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.b #$28                ;
                    STA.w $0238,x             ;
                    STZ.b $E3                 ;
                    LDY.b #$00                ;
CODE_0DFA3F:        LDA.w $03AE               ;
                    STA.w $0990,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0994,y             ;
                    LDA.w $0238,x             ;
                    STA.w $0991,y             ;
                    STA.w $0995,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.b #$2A                ;
                    STA.w $0993,y             ;
                    STA.w $0997,y             ;
                    PHX                       ;
                    LDX.b $E3                 ;
                    LDA.w $FA27,x             ;
                    STA.w $0992,y             ;
                    LDA.w $FA28,x             ;
                    STA.w $0996,y             ;
                    INC.b $E3                 ;
                    INC.b $E3                 ;
                    PLX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEC.b $03                 ;
                    BNE   CODE_0DFA3F         ;
                    PLY                       ;
                    RTS                       ;

CODE_0DFA84:        PHY                       ;
                    PHX                       ;
                    LDA.w $0238,x             ;
                    STA.w $03B9               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $03B9               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $03AE               ;
                    LDY.b #$90                ;
                    LDX.b #$00                ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0910,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    STA.w $090C,y             ;
                    STA.w $0914,y             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0909,y             ;
                    STA.w $090D,y             ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
                    LDA.b #$00                ;
                    STA.w $0C10,y             ;
                    STA.w $0C14,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    LDA.b #$61                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
                    STA.w $0913,y             ;
                    STA.w $0917,y             ;
                    LDA.b #$C5                ;
                    STA.w $0912,y             ;
                    LDA.b #$C4                ;
                    STA.w $0916,y             ;
                    LDA.b #$EE                ;
                    STA.w $0902,y             ;
                    LDA.b #$C0                ;
                    STA.w $0906,y             ;
                    LDA.b #$E2                ;
                    STA.w $090A,y             ;
                    LDA.b #$E0                ;
                    STA.w $090E,y             ;
                    LDA.b #$70                ;
                    STA.w $09F0               ;
                    LDA.b #$78                ;
                    STA.w $09F4               ;
                    LDA.b #$98                ;
                    STA.w $09F1               ;
                    STA.w $09F5               ;
                    LDA.b #$86                ;
                    STA.w $09F2               ;
                    LDA.b #$87                ;
                    STA.w $09F6               ;
                    LDA.b #$21                ;
                    STA.w $09F3               ;
                    STA.w $09F7               ;
                    LDA.b #$02                ;
                    STA.w $0DF0               ;
                    STA.w $0DF4               ;
                    PLX                       ;
                    PLY                       ;
                    RTS                       ;

CODE_0DFB4C:        LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    STA.w $0881               ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$03                ;
                    STA.w $0880               ;
                    LDA.b #$2A                ;
                    STA.w $0883               ;
                    LDA.b #$44                ;
                    STA.w $0882               ;
                    LDA.b #$02                ;
                    STA.w $0C80               ;
                    RTS                       ;

CODE_0DFB6E:        STA.b $07                 ;
                    LDA.w $03AD               ;
                    STA.w $0755               ;
                    STA.b $05                 ;
                    LDA.w $03B8               ;
                    STA.b $02                 ;
                    LDA.w $0202               ;
                    STA.b $03                 ;
                    JSL.l CODE_00C000         ;
                    LDA.w $06D5               ;
                    AND.b #$07                ;
                    TAX                       ;
                    LDA.w $0256               ;
                    STA.b $04                 ;
                    LDY.w $0B45               ;
CODE_0DFB94:        LDA.w $F62E,x             ;
                    STA.b $00                 ;
                    LDA.w $F62F,x             ;
                    JSR.w CODE_0DF2FE         ;
                    DEC.b $07                 ;
                    BNE   CODE_0DFB94         ;
                    LDA.b $05                 ;
                    CMP.b #$F8                ;
                    BCC   CODE_0DFBB7         ;
                    LDA.b #$01                ;
                    STA.w $0CD0               ;
                    STA.w $0CD8               ;
                    STA.w $0CE0               ;
                    STA.w $0CE8               ;
CODE_0DFBB7:        RTS                       ;

CODE_0DFBB8:        LDA.b $28                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_0DFC0C         ;
                    CMP.b #$02                ;
                    BEQ   CODE_0DFBFE         ;
                    CMP.b #$01                ;
                    BNE   CODE_0DFBD6         ;
                    LDA.w $0704               ;
                    BNE   CODE_0DFC17         ;
                    LDY.b #$06                ;
                    LDA.w $0714               ;
                    BNE   CODE_0DFBF4         ;
                    LDY.b #$00                ;
                    BRA   CODE_0DFBF4         ;

CODE_0DFBD6:        LDY.b #$06                ;
                    LDA.w $0714               ;
                    BNE   CODE_0DFBF4         ;
                    LDY.b #$02                ;
                    LDA.b $5D                 ;
                    ORA.b $0C                 ;
                    BEQ   CODE_0DFBF4         ;
                    LDA.w $0700               ;
                    CMP.b #$09                ;
                    BCC   CODE_0DFC05         ;
                    LDA.b $46                 ;
                    AND.w $0202               ;
                    BNE   CODE_0DFC05         ;
                    INY                       ;
CODE_0DFBF4:        JSR.w CODE_0DFC57         ;
                    STZ.w $070D               ;
                    LDA.w $F61E,y             ;
                    RTS                       ;

CODE_0DFBFE:        LDY.b #$04                ;
                    JSR.w CODE_0DFC57         ;
                    BRA   CODE_0DFC29         ;

CODE_0DFC05:        LDY.b #$04                ;
                    JSR.w CODE_0DFC57         ;
                    BRA   CODE_0DFC2F         ;

CODE_0DFC0C:        LDY.b #$05                ;
                    LDA.b $A0                 ;
                    BEQ   CODE_0DFBF4         ;
                    JSR.w CODE_0DFC57         ;
                    BRA   CODE_0DFC33         ;

CODE_0DFC17:        LDY.b #$01                ;
                    JSR.w CODE_0DFC57         ;
                    LDA.w $078A               ;
                    ORA.w $070D               ;
                    BNE   CODE_0DFC2F         ;
                    LDA.b $0A                 ;
                    ASL   A                   ;
                    BCS   CODE_0DFC2F         ;
CODE_0DFC29:        LDA.w $070D               ;
                    JMP.w CODE_0DFC96         ;

CODE_0DFC2F:        LDA.b #$03                ;
                    BRA   CODE_0DFC35         ;

CODE_0DFC33:        LDA.b #$02                ;
CODE_0DFC35:        STA.b $00                 ;
                    JSR.w CODE_0DFC29         ;
                    PHA                       ;
                    LDA.w $0789               ;
                    BNE   CODE_0DFC55         ;
                    LDA.w $070C               ;
                    STA.w $0789               ;
                    LDA.w $070D               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    CMP.b $00                 ;
                    BCC   CODE_0DFC52         ;
                    LDA.b #$00                ;
CODE_0DFC52:        STA.w $070D               ;
CODE_0DFC55:        PLA                       ;
                    RTS                       ;

CODE_0DFC57:        LDA.w $0754               ;
                    BEQ   CODE_0DFC61         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
CODE_0DFC61:        RTS                       ;

                    db $00,$01,$00,$01,$00,$01,$02,$00
                    db $01,$02,$02,$00,$02,$00,$02,$00
                    db $02,$00,$02,$00

CODE_0DFC76:        LDY.w $070D               ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_0DFC8C         ;
                    INY                       ;
                    CPY.b #$0A                ;
                    BCC   CODE_0DFC89         ;
                    LDY.b #$00                ;
                    STY.w $070B               ;
CODE_0DFC89:        STY.w $070D               ;
CODE_0DFC8C:        LDA.w $0754               ;
                    BNE   CODE_0DFC9D         ;
                    LDA.w $FC62,y             ;
                    LDY.b #$0F                ;
CODE_0DFC96:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.w $F61E,y             ;
                    RTS                       ;

CODE_0DFC9D:        TYA                       ;
                    CLC                       ;
                    ADC.b #$0A                ;
                    TAX                       ;
                    LDY.b #$09                ;
                    LDA.w $FC62,x             ;
                    BNE   CODE_0DFCAB         ;
                    LDY.b #$01                ;
CODE_0DFCAB:        LDA.w $F61E,y             ;
                    RTS                       ;

CODE_0DFCAF:        LDY.w $0B45               ;
                    LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_0DFCCB         ;
                    LDA.w $06D5               ;
                    CMP.b #$50                ;
                    BEQ   CODE_0DFCCB         ;
                    CMP.b #$B8                ;
                    BEQ   CODE_0DFCCB         ;
                    CMP.b #$C0                ;
                    BEQ   CODE_0DFCCB         ;
                    CMP.b #$C8                ;
                    BNE   CODE_0DFCCB         ;
CODE_0DFCCB:        RTS                       ;

CODE_0DFCCC:        LDA.w $0E4E               ;
                    BEQ   CODE_0DFD28         ;
                    LDX.b #$00                ;
CODE_0DFCD3:        LDA.w $08D0,x             ;
                    STA.w $09E0,x             ;
                    INX                       ;
                    CPX.b #$20                ;
                    BNE   CODE_0DFCD3         ;
                    LDA.b #$F0                ;
                    STA.w $08D1               ;
                    STA.w $08D5               ;
                    STA.w $08D9               ;
                    STA.w $08DD               ;
                    STA.w $08E1               ;
                    STA.w $08E5               ;
                    STA.w $08E9               ;
                    STA.w $08ED               ;
                    LDA.w $0CD0               ;
                    STA.w $0DE0               ;
                    LDA.w $0CD4               ;
                    STA.w $0DE4               ;
                    LDA.w $0CD8               ;
                    STA.w $0DE8               ;
                    LDA.w $0CDC               ;
                    STA.w $0DEC               ;
                    LDA.w $0CE0               ;
                    STA.w $0DF0               ;
                    LDA.w $0CE4               ;
                    STA.w $0DF4               ;
                    LDA.w $0CE8               ;
                    STA.w $0DF8               ;
                    LDA.w $0CEC               ;
                    STA.w $0DFC               ;
CODE_0DFD28:        RTS                       ;

CODE_0DFD29:        LDX.b #$00                ;
                    LDY.b #$00                ;
                    JMP.w CODE_0DFD40         ;

CODE_0DFD30:        LDY.b #$01                ;
                    JSR.w CODE_0DFDDA         ;
                    LDY.b #$03                ;
                    BRA   CODE_0DFD40         ;

CODE_0DFD39:        LDY.b #$00                ;
                    JSR.w CODE_0DFDDA         ;
                    LDY.b #$02                ;
CODE_0DFD40:        JSR.w CODE_0DFD6E         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DFD46:        LDY.b #$02                ;
                    JSR.w CODE_0DFDDA         ;
                    LDY.b #$06                ;
                    BRA   CODE_0DFD40         ;

CODE_0DFD4F:        LDA.b #$01                ;
                    LDY.b #$01                ;
                    JMP.w CODE_0DFD62         ;

CODE_0DFD56:        LDA.b #$0D                ;
                    LDY.b #$04                ;
                    JSR.w CODE_0DFD62         ;
                    INX                       ;
                    INX                       ;
                    LDA.b #$0D                ;
                    INY                       ;
CODE_0DFD62:        STX.b $00                 ;
                    CLC                       ;
                    ADC.b $00                 ;
                    TAX                       ;
                    JSR.w CODE_0DFD6E         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DFD6E:        LDA.w $0237,x             ;
                    STA.w $03B8,y             ;
                    LDA.b $0E                 ;
                    BEQ   CODE_0DFD84         ;
                    LDA.w $0219               ;
                    BNE   CODE_0DFD84         ;
                    LDA.b #$28                ;
                    STA.w $0219               ;
                    BRA   CODE_0DFD96         ;

CODE_0DFD84:        LDA.w $0219,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.w $03AD,y             ;
                    LDA.b $78,x               ;
                    SBC.w $071A               ;
                    STA.w $03C1,y             ;
CODE_0DFD96:        PHY                       ;
                    TYA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $0219,x             ;
                    STA.b $E4                 ;
                    LDA.w $78,x             ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E87,y             ;
                    SEP   #$20                ;
                    PLY                       ;
                    RTS                       ;

CODE_0DFDB2:        LDX.b #$00                ;
                    LDY.b #$00                ;
                    JMP.w CODE_0DFDF1         ;

CODE_0DFDB9:        LDY.b #$00                ;
                    JSR.w CODE_0DFDDA         ;
                    LDY.b #$02                ;
                    JMP.w CODE_0DFDF1         ;

CODE_0DFDC3:        LDY.b #$01                ;
                    JSR.w CODE_0DFDDA         ;
                    LDY.b #$03                ;
                    JMP.w CODE_0DFDF1         ;

CODE_0DFDCD:        LDY.b #$02                ;
                    JSR.w CODE_0DFDDA         ;
                    LDY.b #$06                ;
                    JMP.w CODE_0DFDF1         ;

                    db $0B,$1A,$11

CODE_0DFDDA:        TXA                       ;
                    CLC                       ;
                    ADC.w $FDD7,y             ;
                    TAX                       ;
                    RTS                       ;

CODE_0DFDE1:        LDA.b #$01                ;
                    LDY.b #$01                ;
                    BRA   CODE_0DFDEB         ;

CODE_0DFDE7:        LDA.b #$0D                ;
                    LDY.b #$04                ;
CODE_0DFDEB:        STX.b $00                 ;
                    CLC                       ;
                    ADC.b $00                 ;
                    TAX                       ;
CODE_0DFDF1:        TYA                       ;
                    PHA                       ;
                    JSR.w CODE_0DFE15         ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $00                 ;
                    STA.b $00                 ;
                    PLA                       ;
                    TAY                       ;
                    LDA.b $00                 ;
                    STA.w $03D0,y             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    AND.b #$01                ;
                    STA.w $0E08,y             ;
                    PLA                       ;
                    LSR   A                   ;
                    STA.w $0E00,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_0DFE15:        JSR.w CODE_0DFE34         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    JMP.w CODE_0DFE78         ;

                    db $7F,$3F,$1F,$0F,$07,$03,$01,$00
                    db $80,$C0,$E0,$F0,$F8,$FC,$FE,$FF
                    db $07,$0F,$07

CODE_0DFE34:        STX.b $04
                    LDY.b #$01                ;
CODE_0DFE38:        LDA.w $071C,y             ;
                    SEC                       ;
                    SBC.w $0219,x             ;
                    STA.b $07                 ;
                    LDA.w $071A,y             ;
                    SBC.b $78,x               ;
                    LDX.w $FE31,y             ;
                    CMP.b #$00                ;
                    BMI   CODE_0DFE5D         ;
                    LDX.w $FE32,y             ;
                    CMP.b #$01                ;
                    BPL   CODE_0DFE5D         ;
                    LDA.b #$38                ;
                    STA.b $06                 ;
                    LDA.b #$08                ;
                    JSR.w CODE_0DFEAD         ;
CODE_0DFE5D:        LDA.w $FE21,x             ;
                    LDX.b $04                 ;
                    CMP.b #$00                ;
                    BNE   CODE_0DFE69         ;
                    DEY                       ;
                    BPL   CODE_0DFE38         ;
CODE_0DFE69:        RTS                       ;

                    db $00,$08,$0C,$0E,$0F,$07,$03,$01
                    db $00,$04,$00,$04,$FF,$00

CODE_0DFE78:        STX.b $04
                    LDY.b #$01                ;
CODE_0DFE7C:        LDA.w $FE76,y             ;
                    SEC                       ;
                    SBC.w $0237,x             ;
                    STA.b $07                 ;
                    LDA.b #$01                ;
                    SBC.b $BB,x               ;
                    LDX.w $FE73,y             ;
                    CMP.b #$00                ;
                    BMI   CODE_0DFEA0         ;
                    LDX.w $FE74,y             ;
                    CMP.b #$01                ;
                    BPL   CODE_0DFEA0         ;
                    LDA.b #$20                ;
                    STA.b $06                 ;
                    LDA.b #$04                ;
                    JSR.w CODE_0DFEAD         ;
CODE_0DFEA0:        LDA.w $FE6A,x             ;
                    LDX.b $04                 ;
                    CMP.b #$00                ;
                    BNE   CODE_0DFEAC         ;
                    DEY                       ;
                    BPL   CODE_0DFE7C         ;
CODE_0DFEAC:        RTS                       ;

CODE_0DFEAD:        STA.b $05                 ;
                    LDA.b $07                 ;
                    CMP.b $06                 ;
                    BCS   CODE_0DFEC1         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$07                ;
                    CPY.b #$01                ;
                    BCS   CODE_0DFEC0         ;
                    ADC.b $05                 ;
CODE_0DFEC0:        TAX                       ;
CODE_0DFEC1:        RTS                       ;

CODE_0DFEC2:        LDA.b $79,x               ;
                    STA.w $0E15               ;
                    LDA.w $021A,x             ;
                    STA.w $0E14               ;
                    RTS                       ;

                    LDA.w $0E17               ;
                    STA.w $0E15               ;
                    LDA.w $0E16               ;
                    STA.w $0E14               ;
                    RTS                       ;

CODE_0DFEDB:        LDA.b #$06                ;
                    STA.b $04                 ;
                    REP   #$20                ;
                    LDA.w $0E14               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E12               ;
                    SEP   #$20                ;
                    LDA.w $0E13               ;
                    BNE   CODE_0DFEF5         ;
                    LDA.b #$00                ;
                    BRA   CODE_0DFEF7         ;

CODE_0DFEF5:        LDA.b #$01                ;
CODE_0DFEF7:        STA.w $0D00,y             ;
                    RTS                       ;

CODE_0DFEFB:        REP   #$20                ;
                    LDA.w $0E14               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E12               ;
                    SEP   #$20                ;
                    LDA.w $0E13               ;
                    BNE   CODE_0DFF11         ;
                    LDA.b #$00                ;
                    BRA   CODE_0DFF13         ;

CODE_0DFF11:        LDA.b #$01                ;
CODE_0DFF13:        STA.w $0D10,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D00,y             ;
                    RTS                       ;

                    REP   #$20                ;
                    LDA.w $0E14               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E12               ;
                    SEP   #$20                ;
                    LDA.w $0E13               ;
                    BNE   CODE_0DFF33         ;
                    LDA.b #$00                ;
                    BRA   CODE_0DFF35         ;

CODE_0DFF33:        LDA.b #$01                ;
CODE_0DFF35:        STA.w $0C08,y             ;
                    STA.w $0C00,y             ;
                    RTS                       ;

                    STA.w $0C00,y             ;
                    STA.w $0C08,y             ;
                    RTS                       ;

                    REP   #$20                ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b $04                 ;
                    STA.b $04                 ;
                    PHA                       ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    RTS                       ;

CODE_0DFF51:        REP   #$20                ;
                    LDA.w $0E14               ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.w $0E14               ;
                    SEP   #$20                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    RTS                       ;

CODE_0DFF64:        LDA.b $03                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b $00                 ;
                    BCC   CODE_0DFF78         ;
                    STA.w $0806,y             ;
                    LDA.b $01                 ;
                    STA.w $0802,y             ;
                    LDA.b #$40                ;
                    BNE   CODE_0DFF82         ;
CODE_0DFF78:        STA.w $0802,y             ;
                    LDA.b $01                 ;
                    STA.w $0806,y             ;
                    LDA.b #$00                ;
CODE_0DFF82:        ORA.b $04                 ;
                    STA.w $0803,y             ;
                    STA.w $0807,y             ;
                    LDA.b $02                 ;
                    STA.w $0801,y             ;
                    STA.w $0805,y             ;
                    LDA.b $05                 ;
                    STA.w $0800,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0804,y             ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $02                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    INX                       ;
                    INX                       ;
                    RTS                       ;

CODE_0DFFAC:        LDA.b $03                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b $00                 ;
                    BCC   CODE_0DFFC0         ;
                    STA.w $0906,y             ;
                    LDA.b $01                 ;
                    STA.w $0902,y             ;
                    LDA.b #$40                ;
                    BNE   CODE_0DFFCA         ;
CODE_0DFFC0:        STA.w $0902,y             ;
                    LDA.b $01                 ;
                    STA.w $0906,y             ;
                    LDA.b #$00                ;
CODE_0DFFCA:        ORA.b $04                 ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    LDA.b $02                 ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b $05                 ;
                    STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $02                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    INX                       ;
                    INX                       ;
                    RTS                       ;
