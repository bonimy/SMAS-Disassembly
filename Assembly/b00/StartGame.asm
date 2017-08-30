;-------Indirect game pointers
PNTR_008194:        db CODE_038000            ;SMB1
                    db CODE_0D8000            ;SMBTLL
                    db CODE_118000            ;SMB2
                    db CODE_208000            ;SMB3

PNTR_008198:        db CODE_038000>>8
                    db CODE_0D8000>>8
                    db CODE_118000>>8
                    db CODE_208000>>8

PNTR_00819C:        db CODE_038000>>$10
                    db CODE_0D8000>>$10
                    db CODE_118000>>$10
                    db CODE_208000>>$10

;-------Play selected game
CODE_0081A0:        LDX.b #$0F                ;
-                   LDA.b $70,x               ;
                    STA.l $700490,x           ;
                    DEX                       ;
                    BPL   -                   ;
                    LDA.b $D1                 ;
                    STA.l $70000E             ;
                    LDA.b $D0                 ;
                    STA.l $70000F             ;
                    REP   #$20                ;
                    LDA.w #$0000              ;
                    STA.b $00                 ;
                    LDA.w #$0000              ;
                    LDY.b #$7F                ;
                    JSL.l CODE_00868E         ;
                    SEP   #$20                ;
                    LDA.b $D0                 ;
                    TAX                       ;
                    INC   A                   ;
                    ASL   A                   ;
                    STA.l $7FFF00             ;
                    LDA.l PNTR_008194,x       ;
                    STA.b $03                 ;
                    LDA.l PNTR_008198,x       ;
                    STA.b $04                 ;
                    LDA.l PNTR_00819C,x       ;
                    STA.b $05                 ;
                    REP   #$20                ;
                    LDA.w #$00F0              ;
                    STA.b $00                 ;
                    LDA.w #$0010              ;
                    LDY.b #$00                ;
                    JSL.l CODE_00868E         ;
                    LDA.w #$1E00              ;
                    STA.b $00                 ;
                    LDA.w #$0200              ;
                    LDY.b #$00                ;
                    JSL.l CODE_00868E         ;
                    SEP   #$20                ;
                    PLB                       ;\
                    PLB                       ;|Clear last JSL return location
                    PLB                       ;/
                    JSL.l CODE_00A849         ;
                    LDA.b #$00                ;
                    STA.l $701FF8             ;
                    STA.l $701FF9             ;
                    REP   #$30                ;
                    LDA.l $700004             ;
                    TAX                       ;
                    SEP   #$20                ;
                    LDA.l $700010,x           ;
                    STA.l $7FFF02             ;
                    SEP   #$10                ;
                    JML.w [$0003]             ;

;-------Play game demo
CODE_00822B:        LDA.l $701FF0             ;
                    PHA                       ;
                    INC   A                   ;
                    AND.b #$03                ;
                    STA.l $701FF0             ;
                    STZ.b $D1                 ;
                    LDA.b #$01                ;
                    STA.l $701FF2             ;
                    LDX.b #$0F                ;
-                   LDA.b $70,x               ;
                    STA.l $700490,x           ;
                    DEX                       ;
                    BPL   -                   ;
                    REP   #$20                ;
                    LDA.w #$0000              ;
                    STA.b $00                 ;
                    LDA.w #$0000              ;
                    LDY.b #$7F                ;
                    JSL.l CODE_00868E         ;
                    SEP   #$20                ;
                    PLA                       ;
                    STA.b $00                 ;
                    TAX                       ;
                    INC   A                   ;
                    ASL   A                   ;
                    STA.l $7FFF00             ;
                    LDA.l PNTR_008194,x       ;
                    STA.b $03                 ;
                    LDA.l PNTR_008198,x       ;
                    STA.b $04                 ;
                    LDA.l PNTR_00819C,x       ;
                    STA.b $05                 ;
                    REP   #$20                ;
                    LDA.w #$00F0              ;
                    STA.b $00                 ;
                    LDA.w #$0010              ;
                    LDY.b #$00                ;
                    JSL.l CODE_00868E         ;
                    LDA.w #$1E00              ;
                    STA.b $00                 ;
                    LDA.w #$0200              ;
                    LDY.b #$00                ;
                    JSL.l CODE_00868E         ;
                    LDA.w #$8000              ;
                    SEP   #$20                ;
                    PLB                       ;\
                    PLB                       ;|Clear last JSL return location
                    PLB                       ;/
                    REP   #$30                ;
                    LDA.b $00                 ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w DATA_008DD3,x       ;
                    TAY                       ;
                    LDX.w #$0000              ;
                    TXA                       ;
                    SEP   #$20                ;
-                   LDA.w DATA_008DE3,y       ;
                    STA.l $7FFB00,x           ;
                    INY                       ;
                    INX                       ;
                    CPX.w #$0106              ;
                    BNE   -                   ;
                    LDA.b #$00                ;
                    STA.l $7FFB00             ;
                    STA.l $7FFB01             ;
                    SEP   #$30                ;
                    JML.w [$0003]             ;