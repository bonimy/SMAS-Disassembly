;--------Code called from other banks
CODE_00C000:        LDA.w $0BA5               ;
                    BNE   .end                ;
                    LDA.w $06D5               ;
                    CMP.b #$18                ;
                    BEQ   +                   ;
                    CMP.b #$78                ;
                    BNE   ++                  ;
+                   LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   ++                  ;
                    LDA.w $1601               ;
                    BNE   ++                  ;
                    LDA.b #$04                ;
                    STA.w $1601               ;
++                  STZ.w $028E               ;
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
                    BEQ   +                   ;
                    LDA.w $0290               ;
                    ORA.b #$40                ;
                    STA.w $0290               ;
+                   LDA.b #$0A                ;
                    STA.w $0291               ;
.end                RTL                       ;

;-------[?]This routine seems to never be called.
CODE_00C05A:        STZ.w $0F4A               ;
                    LDA.b #$35                ;
                    RTL                       ;

;-------[?]Loads the status bar for SMB1
CODE_00C060:        REP   #$20                ;
                    LDX.b #$1E                ;
-                   LDA.w $0753               ;
                    BEQ   +                   ;
                    LDA.l DATA_00C0A3,x       ;
                    BRA   ++                  ;
+                   LDA.l DATA_00C083,x       ;
++                  STA.w $1160,x             ;
                    DEX                       ;
                    DEX                       ;
                    BPL   -                   ;
                    SEP   #$20                ;
                    INC.w $1200               ;
                    JSR.w CODE_00C0C3         ;
                    RTL                       ;

DATA_00C083:        dw $734E,$7FFF,$14A5,$5D68
                    dw $762E,$27BF,$31BB,$3ABF
                    dw $0000,$152F,$355D,$525F
                    dw $169B,$1C9F,$0C19,$0C19

DATA_00C0A3:        dw $734E,$7FFF,$14A5,$5588
                    dw $724D,$27BF,$31BB,$3ABF
                    dw $0000,$152F,$355D,$525F
                    dw $169B,$3303,$1A40,$1C9F

CODE_00C0C3:        PHB                       ;
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
                    BNE   +                   ;
                    LDA.w $07FC               ;
                    BEQ   +                   ;
                    LDA.b #$0C                ;
                    STA.w $075F               ;
+                   LDA.b #$00                ;
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
                    LDX.w DATA_00C126,y       ;
                    TXY                       ;
                    LDX.w $1700               ;
-                   LDA.w DATA_00C12E,y       ;
                    STA.w $1702,x             ;
                    INC   A                   ;
                    BEQ   +                   ;
                    INX                       ;
                    INY                       ;
                    BRA   -                   ;
+                   STX.w $1700               ;
                    SEP   #$10                ;
                    PLX                       ;
                    PLB                       ;
                    RTS                       ;

DATA_00C126:        dw $0000,$00A4,$0156,$01FA

DATA_00C12E:        dw $0559,$1100,$201D,$2011
                    dw $200A,$2017,$2014,$2028
                    dw $2022,$2018,$201E,$4559
                    dw $0B00,$2016,$200A,$201B
                    dw $2012,$2018,$2026,$8559
                    dw $1500,$201D,$2011,$200E
                    dw $2028,$2014,$2012,$2017
                    dw $2010,$200D,$2018,$2016
                    dw $C559,$1100,$2012,$201C
                    dw $2028,$201C,$200A,$201F
                    dw $200E,$200D,$2026,$055A
                    dw $0D00,$2017,$2018,$2020
                    dw $2028,$201D,$201B,$2022
                    dw $455A,$0B00,$200A,$2028
                    dw $2016,$2018,$201B,$200E
                    dw $855A,$1100,$200D,$2012
                    dw $200F,$200F,$2012,$200C
                    dw $201E,$2015,$201D,$C55A
                    dw $0F00,$201A,$201E,$200E
                    dw $201C,$201D,$2029,$2029
                    dw $2029,$FFFF,$0559,$1100
                    dw $201D,$2011,$200A,$2017
                    dw $2014,$2028,$2022,$2018
                    dw $201E,$4559,$1100,$2016
                    dw $200A,$201B,$2012,$2018
                    dw $2028,$200F,$2018,$201B
                    dw $8559,$1100,$201B,$200E
                    dw $201C,$201D,$2018,$201B
                    dw $2012,$2017,$2010,$C559
                    dw $0F00,$2019,$200E,$200A
                    dw $200C,$200E,$2028,$201D
                    dw $2018,$055A,$0500,$2018
                    dw $201E,$201B,$455A,$0F00
                    dw $2014,$2012,$2017,$2010
                    dw $200D,$2018,$2016,$2029
                    dw $855A,$1100,$2011,$201E
                    dw $201B,$201B,$200A,$2011
                    dw $2028,$201D,$2018,$C55A
                    dw $1100,$2018,$201E,$201B
                    dw $2028,$2011,$200E,$201B
                    dw $2018,$202B,$055B,$0B00
                    dw $2016,$200A,$201B,$2012
                    dw $2018,$2026,$FFFF,$0559
                    dw $1100,$201D,$2011,$200A
                    dw $2017,$2014,$2028,$2022
                    dw $2018,$201E,$4559,$0B00
                    dw $2015,$201E,$2012,$2010
                    dw $2012,$2026,$8559,$1500
                    dw $201D,$2011,$200E,$2028
                    dw $2014,$2012,$2017,$2010
                    dw $200D,$2018,$2016,$C559
                    dw $1100,$2012,$201C,$2028
                    dw $201C,$200A,$201F,$200E
                    dw $200D,$2026,$055A,$0D00
                    dw $2017,$2018,$2020,$2028
                    dw $201D,$201B,$2022,$455A
                    dw $0B00,$200A,$2028,$2016
                    dw $2018,$201B,$200E,$855A
                    dw $1100,$200D,$2012,$200F
                    dw $200F,$2012,$200C,$201E
                    dw $2015,$201D,$C55A,$0F00
                    dw $201A,$201E,$200E,$201C
                    dw $201D,$2029,$2029,$2029
                    dw $FFFF,$0559,$1100,$201D
                    dw $2011,$200A,$2017,$2014
                    dw $2028,$2022,$2018,$201E
                    dw $4559,$1100,$2015,$201E
                    dw $2012,$2010,$2012,$2028
                    dw $200F,$2018,$201B,$8559
                    dw $1100,$201B,$200E,$201C
                    dw $201D,$2018,$201B,$2012
                    dw $2017,$2010,$C559,$0F00
                    dw $2019,$200E,$200A,$200C
                    dw $200E,$2028,$201D,$2018
                    dw $055A,$0500,$2018,$201E
                    dw $201B,$455A,$0F00,$2014
                    dw $2012,$2017,$2010,$200D
                    dw $2018,$2016,$2029,$855A
                    dw $1100,$2011,$201E,$201B
                    dw $201B,$200A,$2011,$2028
                    dw $201D,$2018,$C55A,$1100
                    dw $2018,$201E,$201B,$2028
                    dw $2011,$200E,$201B,$2018
                    dw $202B,$055B,$0B00,$2015
                    dw $201E,$2012,$2010,$2012
                    dw $2026,$FFFF

CODE_00C3DA:        PHX                       ;
                    LDA.w $0F85               ;
                    BNE   ++                  ;
                    LDA.l $70000F             ;
                    BEQ   +                   ;
                    LDA.w $0753               ;
+                   ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.w $0F84               ;
                    TAX                       ;
                    INC.w $0F84               ;
                    LDA.w $0F84               ;
                    CMP.b #$03                ;
                    BNE   +                   ;
                    LDA.b #$FF                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
+                   LDA.l DATA_00C43F,x       ;
                    BNE   +                   ;
                    INC.w $0772               ;
                    STZ.w $0705               ;
                    STZ.w $005D               ;
+                   STA.w $0F85               ;
                    LDA.l DATA_00C44F,x       ;
                    STA.w $0F86               ;
++                  DEC.w $0F85               ;
                    LDA.w $0F86               ;
                    AND.b #$08                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $0D                 ;
                    LDY.w $0F86               ;
                    LDA.w $0723               ;
                    BEQ   .end                ;
                    LDA.w $0219               ;
                    CMP.b #$A2                ;
                    BCC   .end                ;
                    LDA.b #$A2                ;
                    STA.w $0219               ;
.end                PLX                       ;
                    RTL                       ;

DATA_00C43F:        dw $A018,$0108,$1028,$0003
                    dw $A010,$0108,$1E28,$0002

DATA_00C44F:        dw $0001,$C141,$01C9,$0001
                    dw $0001,$C141,$01C9,$0001

CODE_00C45F:        DEC.w $0F88               ;
                    LDA.w $0F88               ;
                    BPL   ++                  ;
                    INC.w $0F87               ;
                    LDX.w $0F87               ;
                    CPX.b #$05                ;
                    BNE   +                   ;
                    LDA.b #$A0                ;
                    STA.w $0219               ;
+                   LDA.l DATA_00C4B4,x       ;
                    STA.w $0F88               ;
++                  LDA.w $0F87               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.l DATA_00C491,x       ;
                    STA.b $00                 ;
                    LDA.l DATA_00C491+1,x     ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

DATA_00C491:        dw CODE_00C49F
                    dw CODE_00C49F
                    dw CODE_00C49F
                    dw CODE_00C4B0
                    dw CODE_00C4A0
                    dw CODE_00C49F
                    dw CODE_00C49F

CODE_00C49F:        RTL                       ;

CODE_00C4A0:        LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDA.b #$00                ;
                    LDX.b #$01                ;
                    JSL.l CODE_0DBF7A         ;
CODE_00C4B0:        DEC.w $021A               ;
                    RTL                       ;

DATA_00C4B4:        db $00,$30,$37,$1A,$10,$60,$FF

CODE_00C4BB:        PHX                       ;
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
                    BNE   +                   ;
                    LDA.b $09                 ;
                    AND.b #$04                ;
                    BNE   +                   ;
                    LDA.l DATA_00C54E,x       ;
                    INC   A                   ;
                    INC   A                   ;
                    BRA   ++                  ;
+                   LDA.l DATA_00C54E,x       ;
++                  STA.w $08B2               ;
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
                    BNE   +                   ;
                    LDA.b #$F0                ;
                    STA.w $0801,x             ;
                    STA.w $0805,x             ;
+                   LDA.b $25                 ;
                    BEQ   .end                ;
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
.end                PLX                       ;
                    RTL                       ;

DATA_00C54E:        db $88,$88,$80,$82,$86,$86,$86

CODE_00C555:        LDA.w $0F83               ;
                    CMP.b #$0A                ;
                    BCS   .end                ;
                    PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    ASL   A                   ;
                    TAX                       ;
                    INC.w $0F83               ;
                    LDA.w DATA_00C587,x       ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w DATA_00C5AF,x       ;
                    STA.w $028A               ;
                    LDA.w DATA_00C59B,x       ;
                    STA.w $0285               ;
                    SEP   #$20                ;
                    INC.w $0B76               ;
                    PLX                       ;
                    PLB                       ;
.end                RTL                       ;

DATA_00C587:        db $08,$00,$2F,$00,$2F,$00,$2F,$00
                    db $2F,$00,$2F,$00,$2F,$00,$1E,$00
                    db $1E,$00,$1A,$00

DATA_00C59B:        db $00,$A0,$00,$D1,$00,$D8,$00,$E0
                    db $00,$E8,$00,$F0,$00,$F8,$00,$D0
                    db $00,$D8,$00,$E8

DATA_00C5AF:        db $00,$30,$80,$60,$00,$64,$00,$68
                    db $00,$6C,$00,$70,$00,$74,$00,$78
                    db $00,$7C,$00,$04

;-------[?]Doesn't seem to be called from anywhere
;----------Looks similar to last routine.
DATA_00C5C3:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    LDA.w $0F83               ;
                    ASL   A                   ;
                    TAX                       ;
                    INC.w $0F83               ;
                    LDA.w DATA_00C5F1,x       ;
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w DATA_00C619,x       ;
                    STA.w $028A               ;
                    LDA.w DATA_00C605,x       ;
                    STA.w $0285               ;
                    SEP   #$20                ;
                    INC.w $0B76               ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

DATA_00C5F1:        db $08,$00,$07,$00,$07,$00,$07,$00
                    db $07,$00,$07,$00,$07,$00,$07,$00
                    db $07,$00,$07,$00

DATA_00C605:        dw $A000,$8100,$8800,$9000
                    dw $9800,$A000,$A800,$B000
                    dw $B800,$B800

DATA_00C619:        dw $3000,$6080,$6400,$6800
                    dw $6C00,$7000,$7400,$7800
                    dw $7C00,$7C00

CODE_00C62D:        LDA.b #$2E                ;
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

CODE_00C654:        LDA.l $70000F             ;
                    BEQ   +                   ;
                    LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   ++                  ;\We will never know what
                    JMP.w ++                  ;/happened here...
+                   LDA.w $075F               ;
                    PHA                       ;
                    LDA.w $0E24               ;
                    PHA                       ;
                    LDA.w $07FC               ;
                    BNE   +                   ;
                    STZ.w $0E24               ;
                    STZ.w $075F               ;
+                   PLA                       ;
                    STA.w $0E24               ;
                    PLA                       ;
                    STA.w $075F               ;
++                  LDA.b #$01                ;
                    STA.w $0F82               ;
                    STZ.w $0F83               ;
                    STZ.w $0717               ;
                    RTL                       ;

CODE_00C68B:        LDA.l $70000F             ;
                    BEQ   +                   ;
                    JMP.w +++                 ;
+                   PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_0E81F6         ;
                    LDX.w $0F80               ;
                    LDA.w $0F81               ;
                    CMP.w DATA_00CA5D,x       ;
                    BCC   ++                  ;
                    STZ.w $0F81               ;
                    INC.w $0F80               ;
                    LDA.w $0F80               ;
                    CMP.b #$08                ;
                    BCC   ++                  ;
                    BNE   +                   ;
                    STZ.w $0F89               ;
+                   LDA.b #$08                ;
                    STA.w $0F80               ;
++                  INC.w $0F81               ;
                    LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0F80               ;
                    ASL   A                   ;
                    REP   #$10                ;
                    TAY                       ;
                    LDX.w DATA_00CAB4,y       ;
                    STX.b $ED                 ;
                    LDX.w DATA_00CA80,y       ;
                    LDY.w #$0004              ;
-                   LDA.w DATA_00CAFA,x       ;
                    CMP.b #$FF                ;
                    BEQ   ++                  ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   +                   ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
+                   LDA.w DATA_00CAFA,x       ;
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
                    BRA   -                   ;
++                  LDX.b $ED                 ;
-                   LDA.w DATA_00CAFA,x       ;
                    CMP.b #$FF                ;
                    BEQ   ++                  ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    CLC                       ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   +                   ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
+                   LDA.w DATA_00CAFA,x       ;
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
                    BRA   -                   ;
++                  LDA.w $0F80               ;
                    CMP.b #$08                ;
                    BNE   +                   ;
                    SEP   #$10                ;
                    JSR.w CODE_00E543         ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l DATA_00CA59,x       ;
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
                    LDA.l DATA_00CA55,x       ;
                    STA.w $0802               ;
                    LDA.b #$26                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0F89               ;
                    CPX.b #$03                ;
                    BNE   +                   ;
                    STZ.w $0F89               ;
+                   SEP   #$10                ;
                    JSR.w CODE_00CA21         ;
                    PLB                       ;
                    RTL                       ;
+++                 LDA.w $075F               ;
                    CMP.b #$08                ;
                    BCC   +                   ;
                    JMP.w +++                 ;
+                   PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_0E81F6         ;
                    LDX.w $0F80               ;
                    LDA.w $0F81               ;
                    CMP.w DATA_00CA66,x       ;
                    BCC   ++                  ;
                    STZ.w $0F81               ;
                    INC.w $0F80               ;
                    LDA.w $0F80               ;
                    CMP.b #$05                ;
                    BNE   +                   ;
                    STZ.w $0F89               ;
+                   CMP.b #$0F                ;
                    BCC   ++                  ;
                    LDA.b #$06                ;
                    STA.w $0F80               ;
++                  INC.w $0F81               ;
                    LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0F80               ;
                    ASL   A                   ;
                    REP   #$10                ;
                    TAY                       ;
                    LDX.w DATA_00CAC6,y       ;
                    STX.b $ED                 ;
                    LDX.w DATA_00CA80,y       ;
                    LDY.w #$0004              ;
-                   LDA.w DATA_00CAFA,x       ;
                    CMP.b #$FF                ;
                    BEQ   ++                  ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   +                   ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
+                   LDA.w DATA_00CAFA,x       ;
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
                    BRA   -                   ;
++                  LDX.b $ED                 ;
-                   LDA.w DATA_00CAFA,x       ;
                    CMP.b #$FF                ;
                    BEQ   ++                  ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    CLC                       ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   +                   ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
+                   LDA.w DATA_00CAFA,x       ;
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
                    BRA   -                   ;
++                  LDA.w $0F80               ;
                    CMP.b #$06                ;
                    BCC   +                   ;
                    SEP   #$10                ;
                    JSR.w CODE_00E543         ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l DATA_00CA59,x       ;
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
                    LDA.l DATA_00CA55,x       ;
                    STA.w $0802               ;
                    LDA.b #$26                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0F89               ;
                    CPX.b #$03                ;
                    BNE   +                   ;
                    STZ.w $0F89               ;
+                   SEP   #$10                ;
                    JSR.w CODE_00CA21         ;
                    PLB                       ;
                    RTL                       ;
+++                 PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSL.l CODE_0E81F6         ;
                    LDX.w $0F80               ;
                    LDA.w $0F81               ;
                    CMP.w DATA_00CA76,x       ;
                    BCC   ++                  ;
                    STZ.w $0F81               ;
                    INC.w $0F80               ;
                    LDA.w $0F80               ;
                    CMP.b #$09                ;
                    BCC   ++                  ;
                    BNE   +                   ;
                    STZ.w $0F89               ;
+                   LDA.b #$09                ;
                    STA.w $0F80               ;
++                  INC.w $0F81               ;
                    LDA.b #$00                ;
                    XBA                       ;
                    LDA.w $0F80               ;
                    ASL   A                   ;
                    REP   #$10                ;
                    TAY                       ;
                    LDX.w DATA_00CAE6,y       ;
                    STX.b $ED                 ;
                    LDX.w DATA_00CAA0,y       ;
                    LDY.w #$0004              ;
-                   LDA.w DATA_00CAFA,x       ;
                    CMP.b #$FF                ;
                    BEQ   ++                  ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   +                   ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
+                   LDA.w DATA_00CAFA,x       ;
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
                    BRA   -                   ;
++                  LDX.b $ED                ;
-                   LDA.w DATA_00CAFA,x       ;
                    CMP.b #$FF                ;
                    BEQ   ++                  ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0801,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    CLC                       ;
                    ADC.b #$C0                ;
                    CLC                       ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    ADC.w $0753               ;
                    STA.w $0800,y             ;
                    INX                       ;
                    LDA.w DATA_00CAFA,x       ;
                    STA.w $0802,y             ;
                    INX                       ;
                    STZ.b $00                 ;
                    CMP.b #$80                ;
                    BCS   +                   ;
                    LDA.w $0753               ;
                    STA.b $00                 ;
+                   LDA.w DATA_00CAFA,x       ;
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
                    BRA   -                   ;
++                  LDA.w $0F80               ;
                    CMP.b #$09                ;
                    BNE   +                   ;
                    SEP   #$10                ;
                    JSR.w CODE_00E543         ;
                    LDA.w $0F89               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$03                ;
                    TAX                       ;
                    LDA.l DATA_00CA59,x       ;
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
                    LDA.l DATA_00CA55,x       ;
                    STA.w $0802               ;
                    LDA.b #$26                ;
                    STA.w $0803               ;
                    LDA.b #$00                ;
                    STA.w $0C00               ;
                    INC.w $0F89               ;
                    CPX.b #$03                ;
                    BNE   +                   ;
                    STZ.w $0F89               ;
+                   SEP   #$10                ;
                    JSR.w CODE_00CA21         ;
                    PLB                       ;
                    RTL                       ;

CODE_00CA21:        LDA.w $0753               ;
                    BEQ   .end                ;
                    LDA.w $0806               ;
                    CMP.b #$EE                ;
                    BNE   .end                ;
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
.end                RTS                       ;

DATA_00CA55:        db $5F,$5E,$5D,$5C

DATA_00CA59:        db $00,$02,$00,$FE

DATA_00CA5D:        db $50,$30,$08,$08,$20,$20,$08,$08
                    db $FF

DATA_00CA66:        db $50,$30,$08,$08,$20,$20,$08,$08
                    db $0C,$08,$08,$0C,$08,$08,$0C,$FF

DATA_00CA76:        db $60,$08,$08,$10,$14,$10,$14,$10
                    db $14,$FF

DATA_00CA80:        dw $0000,$008A,$011C,$01AE
                    dw $0244,$02D2,$0360,$045F
                    dw $055E,$055E,$055E,$055E
                    dw $055E,$055E,$055E,$055E

DATA_00CAA0:        dw $06BE,$0789,$07CE,$06FF
                    dw $0744,$06FF,$0744,$06FF
                    dw $0744,$06FF

DATA_00CAB4:        dw $0041,$00CB,$015D,$01F3
                    dw $0289,$0317,$03A5,$04A4
                    dw $05A3

DATA_00CAC6:        dw $0041,$00CB,$015D,$01F3
                    dw $0289,$0317,$03F6,$04F5
                    dw $05F4,$03F6,$04F5,$05F4
                    dw $03F6,$04F5,$05F4,$065D


DATA_00CAE6:        dw $0813,$091E,$0977,$086C
                    dw $08C5,$086C,$08C5,$086C
                    dw $08C5,$086C

DATA_00CAFA:        incbin DATA_00CAFA.bin

;-------[?]Related to rescuing Toad or Peach after bowser fight.
CODE_00D4CA:        LDA.b #$1E                ;bank
                    STA.w $0287               ;
                    REP   #$20                ;
                    LDA.w #$0800              ;
                    STA.w $0288               ;
                    LDA.w #$7800              ;
                    STA.w $028A               ;
                    LDA.w $075F               ;
                    AND.w #$00FF              ;
                    CMP.w #$0007              ;
                    BNE   +                   ;
                    LDA.w #$D000              ;Peach GFX address
                    BRA   ++                  ;
+                   LDA.w #$C000              ;Toad GFX address
++                  STA.w $0285               ;
                    SEP   #$20                ;
                    STZ.w $0F7D               ;
                    STZ.w $0F7E               ;
                    STZ.w $0F7F               ;
                    STZ.w $0B9C               ;
                    LDA.b #$02                ;
                    STA.w $0B76               ;
                    RTL                       ;

CODE_00D507:        PHX                       ;
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
                    LDA.l PNTR_00D55A,x       ;
                    STA.w $0285               ;
                    SEP   #$20                ;
                    PLX                       ;
                    RTL                       ;

;-------[?]Sprite GFX for SMB1/TLL
CODE_00D52E:        LDA.b #$80                ;
                    STA.w $2115               ;
                    REP   #$20                ;
                    LDA.w #$6000              ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.w $4300               ;
                    LDA.w #DATA_078000        ;
                    STA.w $4302               ;
                    LDX.b #DATA_078000>>$10   ;
                    STX.w $4304               ;
                    LDA.w #$4000              ;
                    STA.w $4305               ;
                    LDX.b #$01                ;
                    STX.w $420B               ;
                    SEP   #$20                ;
                    RTL                       ;

PNTR_00D55A:        dw $C800,$C800,$C800,$C800
                    dw $E800,$E000,$E000,$D000
                    dw $C800,$E800,$E000,$E000
                    dw $D000,$D000,$D000,$D000

CODE_00D57A:        LDA.w $0F7E               ;
                    BEQ   +                   ;
                    JMP.w CODE_00D626         ;
+                   LDA.b $09                 ;
                    AND.b #$07                ;
                    BEQ   +                   ;
                    LDA.w $0F7D               ;
                    BRA   ++                  ;
+                   INC.w $0F7D               ;
                    LDA.w $0F7D               ;
                    CMP.b #$03                ;
                    BCC   ++                  ;
                    LDA.w $07B9               ;
                    EOR.w $07BA               ;
                    AND.b #$01                ;
                    BNE   +                   ;
                    LDA.b #$03                ;
                    STA.w $0F7D               ;
                    LDA.b #$01                ;
                    BRA   ++                  ;
+                   LDA.b #$00                ;
                    STA.w $0F7D               ;
++                  STA.b $00                 ;
                    LDA.b $79                 ;
                    XBA                       ;
                    LDA.w $021A               ;
                    LDY.b #$00                ;
                    JSR.w CODE_00E4FD         ;
                    LDA.b $79                 ;
                    XBA                       ;
                    LDA.w $021A               ;
                    REP   #$20                ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    SEP   #$20                ;
                    LDY.b #$04                ;
                    JSR.w CODE_00E4FD         ;
                    LDA.b $00                 ;
                    CMP.b #$02                ;
                    BEQ   +++                 ;
                    CMP.b #$00                ;
                    BNE   +                   ;
                    LDA.b #$83                ;
                    BRA   ++                  ;
+                   LDA.b #$80                ;
++                  STA.w $0902               ;
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
                    BRA   .end                ;
+++                 LDA.b #$86                ;
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
.end                RTL                       ;

CODE_00D626:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    PHX                       ;
                    PHY                       ;
                    LDA.w $075F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $0B9C               ;
                    BNE   +                   ;
                    JSR.w CODE_00E3A4         ;
+                   LDA.w PNTR_00D645,x       ;
                    STA.b $00                 ;
                    LDA.w PNTR_00D645+1,x     ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

PNTR_00D645:        dw CODE_00D661
                    dw CODE_00D6E4
                    dw CODE_00D785
                    dw CODE_00D95A
                    dw CODE_00DBA1
                    dw CODE_00DDFA
                    dw CODE_00E096
                    dw CODE_00D661
                    dw CODE_00D661
                    dw CODE_00DBA1
                    dw CODE_00DDFA
                    dw CODE_00E096
                    dw CODE_00D661

DATA_00D65F:        db $90,$00

CODE_00D661:        JSR.w CODE_00E27B         ;
                    LDA.w $0F7F               ;
                    BNE   +                   ;
                    JMP.w CODE_00E1D5         ;
+                   CMP.b #$03                ;
                    BNE   ++                  ;
                    LDA.w $0B9F               ;
                    BNE   ++                  ;
                    JSR.w CODE_00E566         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_0DBF7A         ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
                    LDA.w $0238               ;
+                   CMP.b #$B8                ;
                    BCC   ++                  ;
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
                    JSR.w CODE_00E529         ;
++                  LDA.w $0B9F               ;
                    BNE   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9E               ;
                    BRA   ++                  ;
+                   DEC.w $0B9F               ;
++                  LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_00E1FC         ;
                    JMP.w CODE_00E1D5         ;

CODE_00D6E4:        JSR.w CODE_00E27B         ;
                    LDA.w $0F7F               ;
                    BNE   +                   ;
                    JMP.w CODE_00E1D5         ;

+                   CMP.b #$03                ;
                    BNE   +++                 ;
                    LDA.w $0B9F               ;
                    BNE   ++                  ;
                    LDA.w $0B9C               ;
                    CMP.b #$02                ;
                    BNE   +                   ;
                    STA.w $0B9E               ;
                    BRA   +++                 ;

+                   JSR.w CODE_00E566         ;
                    LDA.b #$01                ;
                    STA.w $0B9E               ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_0DBF7A         ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
                    LDA.w $0238               ;
+                   CMP.b #$B8                ;
                    BCC   +++                 ;
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
++                  DEC.w $0B9F               ;
+++                 LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_00E1FC         ;
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
                    BNE   +                   ;
                    JSR.w CODE_00E529         ;
                    LDA.b #$03                ;
+                   JSR.w CODE_00E1FC         ;
                    JMP.w CODE_00E1D5         ;

CODE_00D785:        JSR.w CODE_00E27B         ;
                    LDA.w $0F7F               ;
                    BNE   +                   ;
                    JMP.w CODE_00E1D5         ;

+                   CMP.b #$03                ;
                    BEQ   +                   ;
                    JMP.w ++++++              ;

+                   LDA.w $0BA0               ;
                    CMP.b #$28                ;
                    BCC   +++++               ;
                    CMP.b #$50                ;
                    BCC   ++++                ;
                    CMP.b #$58                ;
                    BCC   +++                 ;
                    JSR.w CODE_00E566         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_0DBF7A         ;
                    LDA.b #$01                ;
                    STA.w $0B9E               ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
                    BRA   ++                  ;

+                   CMP.b #$B8                ;
                    BCC   ++                  ;
                    STZ.w $00A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    STZ.w $0B9E               ;
                    LDA.b #$01                ;
                    STA.w $0B9F               ;
                    JSR.w CODE_00E529         ;
++                  LDA.w $0B9F               ;
                    BNE   +++                 ;
                    LDA.b $09                 ;
                    AND.b #$01                ;
                    BNE   +++                 ;
                    INC.w $021D               ;
+++                 JSR.w CODE_00D831         ;
                    JMP.w CODE_00E1D5         ;

++++                LDY.b #$A0                ;
                    CMP.b #$2C                ;
                    BCC   ++                  ;
                    CMP.b #$30                ;
                    BCC   +                   ;
                    JSR.w CODE_00D891         ;
                    BRA   +++++               ;

+                   JSR.w CODE_00D8ED         ;
                    BRA   +++++               ;

++                  JSR.w CODE_00D924         ;
+++++               INC.w $0BA0               ;
++++++              LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_00E1FC         ;
                    JMP.w CODE_00E1D5         ;

CODE_00D831:        LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    STA.b $01                 ;
                    LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
                    TAY                       ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_00E1FC         ;
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
                    BEQ   +                   ;
                    LDA.b #$04                ;
                    CLC                       ;
                    ADC.w $0B9E               ;
+                   JSR.w CODE_00E1FC         ;
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
                    BEQ   +                   ;
                    LDA.b #$06                ;
                    CLC                       ;
                    ADC.w $0B9E               ;
+                   JSR.w CODE_00E1FC         ;
                    LDA.w $0BA0               ;
                    BMI   +                   ;
                    INC.w $0BA0               ;
+                   RTS                       ;

CODE_00D891:        LDA.w $0238               ;
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

CODE_00D8ED:        LDA.w $03AE               ;
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

CODE_00D924:        LDA.w $03AE               ;
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

CODE_00D95A:        JSR.w CODE_00E27B         ;
                    LDA.w $0F7F               ;
                    BNE   +                   ;
                    JMP.w CODE_00E1D5         ;

+                   INC.w $0B9F               ;
                    LDA.w $0B9F               ;
                    CMP.b #$C0                ;
                    BCC   +                   ;
                    LDA.b #$C0                ;
                    STA.w $0B9F               ;
                    LDA.b #$02                ;
                    STA.w $0B9C               ;
                    LDA.b #$01                ;
                    STA.w $0BB8               ;
                    STA.w $0BB9               ;
                    STA.w $0BBA               ;
                    STA.w $0BBB               ;
+                   STZ.w $0E67               ;
                    LDA.w $0BB4               ;
                    BNE   ++                  ;
                    LDA.w $0B9C               ;
                    CMP.b #$02                ;
                    BEQ   +                   ;
                    JSR.w CODE_00DAAB         ;
                    JMP.w CODE_00E1D5         ;

+                   JSR.w CODE_00D9D7         ;
                    JMP.w CODE_00E1D5         ;

++                  LDA.w $0BA1               ;
                    BEQ   +                   ;
                    DEC.w $0BA1               ;
                    LDA.b #$00                ;
                    BRA   ++                  ;

+                   JSR.w CODE_00E529         ;
                    LDA.b #$02                ;
++                  STA.w $0B9E               ;
                    LDX.b #$03                ;
                    LDY.b #$00                ;
-                   LDA.w $0BB0,x             ;
                    STA.b $00                 ;
                    LDA.b #$B8                ;
                    STA.b $01                 ;
                    LDA.w $0B9E               ;
                    JSR.w CODE_00E1FC         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    STY.w $0E67               ;
                    DEX                       ;
                    BPL   -                   ;
                    JMP.w CODE_00E1D5         ;

CODE_00D9D7:        JSR.w CODE_00E566         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_0DBF7A         ;
                    LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCS   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
+                   LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
                    TAY                       ;
                    LDA.w $03AE               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    CMP.b #$B8                ;
                    BCC   +                   ;
                    LDA.b #$B8                ;
                    STZ.w $0BB8               ;
+                   STA.b $01                 ;
                    LDA.w $0BB8               ;
                    JSR.w CODE_00E1FC         ;
                    LDA.w $0BB1               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$0C                ;
                    CMP.b #$B8                ;
                    BCC   +                   ;
                    LDA.b #$B8                ;
                    STZ.w $0BB9               ;
                    BRA   ++                  ;

+                   LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   +                   ;
                    INC.w $0BB1               ;
+                   LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$0C                ;
++                  STA.b $01                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $0BB9               ;
                    CLC                       ;
                    ADC.b #$06                ;
                    JSR.w CODE_00E1FC         ;
                    LDA.w $0BB2               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$18                ;
                    CMP.b #$B8                ;
                    BCC   +                   ;
                    LDA.b #$B8                ;
                    STZ.w $0BBA               ;
                    BRA   ++                  ;

+                   DEC.w $0BB2               ;
++                  STA.b $01                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $0BBA               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    JSR.w CODE_00E1FC         ;
                    LDA.w $0BB3               ;
                    STA.b $00                 ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$24                ;
                    CMP.b #$B8                ;
                    BCC   +                   ;
                    LDA.b #$B8                ;
                    STZ.w $0BBB               ;
                    INC.w $0BB4               ;
                    LDA.b #$28                ;
                    STA.w $0BA1               ;
                    LDA.w $0238               ;
                    SEC                       ;
                    SBC.b #$24                ;
                    BRA   ++                  ;

+                   INC.w $0BB3               ;
++                  STA.b $01                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    LDA.w $0BBB               ;
                    CLC                       ;
                    ADC.b #$06                ;
                    JSR.w CODE_00E1FC         ;
                    RTS                       ;

CODE_00DAAB:        LDY.b #$B0                ;
                    LDX.b #$00                ;
-                   LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.w DATA_00DB8F,x       ;
                    STA.w $0901,y             ;
                    LDA.w DATA_00DB8F+1,x     ;
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
                    BCC   -                   ;
                    LDA.b #$6D                ;
                    STA.w $09C3               ;
                    STZ.w $0DC0               ;
                    STZ.w $0DBC               ;
                    LDA.w $09BC               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $09C0               ;
                    LDX.b #$00                ;
-                   LDA.w DATA_00DB88,x       ;
                    CMP.w $0B9F               ;
                    BCS   +                   ;
                    INX                       ;
                    CPX.b #$06                ;
                    BNE   -                   ;
+                   TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w PNTR_00DB7A,x       ;
                    STA.b $00                 ;
                    LDA.w PNTR_00DB7A+1,x     ;
                    STA.b $01                 ;
                    LDA.b #$01                ;
                    JMP.w ($0000)             ;

CODE_00DB0A:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DB8               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

CODE_00DB1D:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DB8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    LDA.b #$09                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_00DB32:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

CODE_00DB42:        STA.w $0DB0               ;
                    STA.w $0DB4               ;
                    STA.w $0DC8               ;
                    STA.w $0DD0               ;
                    LDA.b #$09                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_00DB54:        STA.w $0DB0               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

CODE_00DB61:        STA.w $0DB0               ;
                    STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    LDA.b #$09                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_00DB70:        STA.w $0DC8               ;
                    STA.w $0DCC               ;
                    STA.w $0DD0               ;
                    RTS                       ;

PNTR_00DB7A:        dw CODE_00DB0A
                    dw CODE_00DB1D
                    dw CODE_00DB32
                    dw CODE_00DB42
                    dw CODE_00DB54
                    dw CODE_00DB61
                    dw CODE_00DB70

DATA_00DB88:        db $40,$48,$58,$60,$70,$78,$BF

DATA_00DB8F:        db $97,$EA,$A2,$EA,$AD,$EA,$B8,$B6
					db $B8,$B6,$C0,$C9,$B3,$EA,$A8,$EA
					db $9D,$EA 

CODE_00DBA1:        JSR.w CODE_00E27B
                    LDA.w $0F7F               ;
                    BNE   +                   ;
                    JMP.w CODE_00E1D5         ;

+                   JSR.w CODE_00E566         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_0DBF7A         ;
                    LDA.w $0238               ;
                    CMP.b #$A0                ;
                    BCS   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
+                   LDA.w $0238               ;
                    CMP.b #$B0                ;
                    BCC   ++                  ;
                    LDA.b #$B0                ;
                    STA.w $0238               ;
                    STZ.w $043D               ;
                    STZ.w $041C               ;
                    INC.w $0B9E               ;
                    LDA.w $0B9E               ;
                    BMI   +                   ;
                    LDA.b #$00                ;
                    STA.w $0B9E               ;
+                   STA.w $A1               ;
++                  INC.w $0B9F               ;
                    LDA.w $0B9F               ;
                    CMP.b #$44                ;
                    BCC   ++                  ;
                    BNE   +                   ;
                    LDA.b #$08                ;
                    STA.w $1600               ;
+                   LDA.b #$45                ;
                    STA.w $0B9F               ;
                    JSR.w CODE_00DC12         ;
                    JSR.w CODE_00E529         ;
                    JMP.w CODE_00E1D5         ;

++                  JSR.w CODE_00DD86         ;
                    JMP.w CODE_00E1D5         ;

CODE_00DC12:        LDA.w $03AE               ;
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
-                   LDA.w $0BB8,x             ;
                    BEQ   ++                  ;
                    CMP.b #$1E                ;
                    BCC   +                   ;
                    STZ.w $0BB8,x             ;
                    BRA   ++                  ;

+                   INC.w $0BB8,x             ;
++                  DEX                       ;
                    BPL   -                   ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   ++                  ;
                    LDX.b #$03                ;
-                   LDA.w $0BB8,x             ;
                    BEQ   +                   ;
                    DEX                       ;
                    BNE   -                   ;
+                   LDA.b $09                 ;
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
++                  LDX.b #$03                ;
-                   LDA.w $0BB8,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w DATA_00DD82,y       ;
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
                    BPL   -                   ;
                    RTS                       ;

DATA_00DD82:        db $F5,$E4,$F4,$E5

CODE_00DD86:        LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
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
-                   LDA.w DATA_00DDDA,x       ;
                    STA.w $0902,y             ;
                    LDA.w DATA_00DDEA,x       ;
                    STA.w $0903,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INX                       ;
                    DEC.b $00                 ;
                    BNE   -                   ;
                    RTS                       ;

DATA_00DDDA:        db $CE,$CE,$EE,$EE,$E0,$E2,$E0,$E2
                    db $EE,$EE,$CE,$CE,$E2,$E0,$E2,$E0

DATA_00DDEA:        db $2D,$4D,$2D,$4D,$2D,$2D,$AD,$AD
                    db $AD,$CD,$AD,$CD,$4D,$4D,$CD,$CD

CODE_00DDFA:        JSR.w CODE_00E27B         ;
                    LDA.w $0F7F               ;
                    BNE   +                   ;
                    JMP.w CODE_00E1D5         ;

+                   JSR.w CODE_00E566         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    STA.b $01                 ;
                    LDX.b #$01                ;
                    LDA.b #$00                ;
                    JSL.l CODE_0DBF7A         ;
                    LDA.w $0238               ;
                    CMP.b #$A0                ;
                    BCS   +                   ;
                    LDA.b #$01                ;
                    STA.w $0B9D               ;
+                   LDA.w $0238               ;
                    CMP.b #$B8                ;
                    BCC   +                   ;
                    LDA.b #$B8                ;
                    STA.w $0238               ;
                    STZ.w $00A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    LDA.w $0BA4               ;
                    CMP.b #$01                ;
                    BNE   ++                  ;
                    LDA.b #$20                ;
                    STA.w $1600               ;
                    STA.w $0BA4               ;
                    BRA   ++                  ;

+                   LDY.w $0B9D               ;
                    LDA.w DATA_00D65F,y       ;
                    TAY                       ;
                    LDA.w $A1               ;
                    JSR.w CODE_00DEF9         ;
                    JMP.w CODE_00E1D5         ;

++                  LDA.w $0B9C               ;
                    CMP.b #$02                ;
                    BEQ   +                   ;
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
+                   LDA.w $0BA0               ;
                    BNE   +                   ;
                    INC.w $0B9F               ;
                    LDA.w $0B9F               ;
                    CMP.b #$40                ;
                    BCC   ++                  ;
                    LDA.b #$40                ;
                    STA.w $0B9F               ;
+                   INC.w $0BA0               ;
                    LDA.w $0BA0               ;
                    CMP.b #$88                ;
                    BCC   ++                  ;
                    LDA.b #$88                ;
                    STA.w $0BA0               ;
++                  JSR.w CODE_00DF4C         ;
                    JSR.w CODE_00E529         ;
                    JMP.w CODE_00E1D5         ;

;-------[?]Doesn't seem to be called from anywhere.
CODE_00DEA4:        LDA.w $03AE               ;
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

CODE_00DEF9:        LDA.w $03AE               ;
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

CODE_00DF4C:        LDA.w $0B9F               ;
                    SEC                       ;
                    SBC.b #$28                ;
                    BPL   +                   ;
                    LDA.b #$00                ;
+                   LSR   A                   ;
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
                    BNE   +                   ;
                    LDA.b #$0E                ;
                    STA.w $1600               ;
+                   LDA.w $0BA0               ;
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
-                   LDA.w $0900,y             ;
                    CMP.b #$40                ;
                    BCS   +                   ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
+                   INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    BNE   -                   ;
                    RTS                       ;

CODE_00E096:        INC.w $0F7F               ;
                    LDA.w $0F7F               ;
                    CMP.b #$D0                ;
                    BCC   +                   ;
                    JSR.w CODE_00E529         ;
                    LDA.b #$D0                ;
                    STA.w $0F7F               ;
                    JMP.w ++                  ;

+                   CMP.b #$20                ;
                    BCC   ++                  ;
                    PHA                       ;
                    AND.b #$0F                ;
                    BNE   +                   ;
                    LDA.b #$0E                ;
                    STA.w $1600               ;
+                   PLA                       ;
++                  LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BCC   +                   ;
                    LDA.b #$03                ;
+                   PHA                       ;
                    JSR.w CODE_00E0DC         ;
                    PLA                       ;
                    CMP.b #$02                ;
                    BNE   .end                ;
                    LDA.w $0BA4               ;
                    BNE   .end                ;
                    LDA.b #$2B                ;
                    STA.w $1600               ;
                    STA.w $0BA4               ;
.end                JMP.w CODE_00E1D5         ;

CODE_00E0DC:        ASL   A                   ;
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
-                   LDA.w DATA_00E1B5,x       ;
                    STA.w $0900,y             ;
                    INY                       ;
                    INX                       ;
                    CPY.b #$08                ;
                    BCC   -                   ;
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
                    BCS   +                   ;
                    LDA.b #$F0                ;
                    BRA   ++                  ;

+                   LDA.b #$C0                ;
++                  STA.w $091D               ;
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
-                   LDA.b $00                 ;
                    STA.w $0900,y             ;
                    STA.w $0904,y             ;
                    CMP.b #$91                ;
                    BCS   +                   ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    BRA   ++                  ;

+                   LDA.b #$C0                ;
                    STA.w $0901,y             ;
                    LDA.b #$C8                ;
                    STA.w $0905,y             ;
++                  LDA.b #$BA                ;
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
                    BNE   -                   ;
                    RTS                       ;

DATA_00E1B5:        db $98,$C0,$E4,$2D,$90,$C0,$A1,$2D
                    db $99,$BF,$E4,$2D,$90,$C0,$A1,$2D
                    db $9B,$BF,$E2,$2D,$90,$C0,$E0,$2D
                    db $90,$C0,$E0,$2D,$90,$C0,$E0,$2D

CODE_00E1D5:        LDA.w $0BA6               ;
                    BEQ   +                   ;
                    BMI   ++                  ;
                    DEC.w $0BA6               ;
                    BRA   ++                  ;

+                   LDA.w $0BA7               ;
                    BNE   ++                  ;
                    INC.w $0BA7               ;
                    LDA.b #$B8                ;
                    STA.w $03CE               ;
                    LDA.w $0754               ;
                    BNE   ++                  ;
                    LDA.b #$C8                ;
                    STA.w $03CE               ;
++                  PLY                       ;
                    PLX                       ;
                    PLB                       ;
                    RTL                       ;

CODE_00E1FC:        PHX                       ;
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
                    LDA.w DATA_00E24B,x       ;
                    STA.w $0902,y             ;
                    LDA.w DATA_00E24B+1,x     ;
                    STA.w $0906,y             ;
                    LDA.w DATA_00E24B+2,x     ;
                    STA.w $090A,y             ;
                    LDA.w DATA_00E263,x       ;
                    STA.w $0903,y             ;
                    LDA.w DATA_00E263+1,x     ;
                    STA.w $0907,y             ;
                    LDA.w DATA_00E263+2,x     ;
                    STA.w $090B,y             ;
                    LDA.b #$02                ;
                    STA.w $0D08,y             ;
                    PLX                       ;
                    RTS                       ;

DATA_00E24B:        db $B6,$B6,$C9,$B7,$B7,$CB,$B8,$B9
                    db $EC,$B9,$B8,$EC,$E3,$E2,$E4,$F3
                    db $F2,$E6,$E2,$E3,$E4,$F2,$F3,$E6

DATA_00E263:        db $2D,$6D,$2D,$2D,$6D,$2D,$2D,$2D
                    db $2D,$6D,$6D,$6D,$6D,$6D,$6D,$6D
                    db $6D,$6D,$2D,$2D,$2D,$2D,$2D,$2D

CODE_00E27B:        DEC.w $0F7D               ;
                    LDA.w $0F7D               ;
                    BPL   +                   ;
                    INC.w $0F7F               ;
                    LDA.b #$07                ;
                    STA.w $0F7D               ;
+                   LDA.w $0F7F               ;
                    CMP.b #$03                ;
                    BCC   +                   ;
                    LDA.b #$03                ;
                    STA.w $0F7F               ;
+                   PHX                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w PNTR_00E2A7,x       ;
                    STA.b $00                 ;
                    LDA.w PNTR_00E2A7+1,x       ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

PNTR_00E2A7:        dw CODE_00E2AF
                    dw CODE_00E318
                    dw CODE_00E35E
                    dw CODE_00E377

CODE_00E2AF:        LDA.b #$94                ;
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

CODE_00E318:        LDA.b #$9A                ;
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

CODE_00E35E:        LDA.b #$9C                ;
                    STA.w $0958               ;
                    LDA.b #$C1                ;
                    STA.w $0959               ;
                    LDA.b #$C4                ;
                    STA.w $095A               ;
                    LDA.b #$2D                ;
                    STA.w $095B               ;
                    LDA.b #$02                ;
                    STA.w $0D58               ;
CODE_00E377:        LDA.b #$88                ;
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

CODE_00E3A4:        LDA.b #$0F                ;
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
-                   STA.b ($00),y             ;
                    INY                       ;
                    CPY.b #$BF                ;
                    BNE   -                   ;
                    INC.w $0B9C               ;
                    DEC.w $0BA6               ;
                    LDA.w $075F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w PNTR_00E3E4,x       ;
                    STA.b $00                 ;
                    LDA.w PNTR_00E3E4+1,x     ;
                    STA.b $01                 ;
                    JMP.w ($0000)             ;

PNTR_00E3E4:        dw CODE_00E3FE
                    dw CODE_00E426
                    dw CODE_00E44E
                    dw CODE_00E47C
                    dw CODE_00E4AE
                    dw CODE_00E4D4
                    dw CODE_00E4EE
                    dw CODE_00E3FE
                    dw CODE_00E3FE
                    dw CODE_00E4AE
                    dw CODE_00E4D4
                    dw CODE_00E4EE
                    dw CODE_00E3FE

CODE_00E3FE:        LDA.w $021A               ;
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

CODE_00E426:        LDA.w $021A               ;
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

CODE_00E44E:        LDA.w $021A               ;
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

CODE_00E47C:        LDA.w $021A               ;
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

CODE_00E4AE:        LDA.w $021A               ;
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

CODE_00E4D4:        LDA.w $021A               ;
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

CODE_00E4EE:        STZ.w $1600               ;
                    LDA.b #$FE                ;
                    STA.w $A1               ;
                    STZ.w $043D               ;
                    STZ.w $041D               ;
                    RTS                       ;

CODE_00E4FD:        REP   #$20                ;
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
                    BEQ   +                   ;
                    LDA.b #$01                ;
+                   ORA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D08,y             ;
                    RTS                       ;

CODE_00E529:        LDA.w $03CE               ;
                    CMP.b #$D0                ;
                    BCC   .end                ;
                    AND.b #$08                ;
                    BEQ   .end                ;
                    LDA.w $03CE               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $03CE               ;
                    LDA.b #$30                ;
                    STA.w $0BA6               ;
.end                RTS                       ;

CODE_00E543:        LDA.w $0EEE               ;
                    BEQ   +                   ;
                    DEC.w $0EEE               ;
                    RTS                       ;

+                   LDA.w $0BA3               ;
                    CMP.b #$C0                ;
                    BCS   ++                  ;
                    INC.w $0BA3               ;
                    LDA.w $0BA3               ;
                    CMP.b #$C0                ;
                    BNE   +                   ;
                    JSR.w CODE_00E574         ;
+                   RTS                       ;

++                  JSL.l CODE_0E8171         ;
                    RTS                       ;

CODE_00E566:        LDA.w $0BA4               ;
                    BNE   +                   ;
                    LDA.b #$01                ;
                    STA.w $1601               ;
                    STA.w $0BA4               ;
+                   RTS                       ;

CODE_00E574:        REP   #$20                ;
                    PHD                       ;\
                    LDA.w #$1700              ; |Direct page: $1700
                    TCD                       ;/
                    LDA.w #$F15A              ;
                    STA.b $1702               ;
                    LDA.w #$1300              ;
                    STA.b $1704               ;
                    LDA.w #$0019              ;
                    STA.b $1706               ;
                    LDA.w #$001E              ;
                    STA.b $1708               ;
                    LDA.w #$001C              ;
                    STA.b $170A               ;
                    LDA.w #$0011              ;
                    STA.b $170C               ;
                    LDA.w #$0028              ;
                    STA.b $170E               ;
                    LDA.w #$001C              ;
                    STA.b $1710               ;
                    LDA.w #$001D              ;
                    STA.b $1712               ;
                    LDA.w #$000A              ;
                    STA.b $1714               ;
                    LDA.w #$001B              ;
                    STA.b $1716               ;
                    LDA.w #$001D              ;
                    STA.b $1718               ;
                    SEP   #$20                ;
                    LDA.b #$FF                ;
                    STA.b $171A               ;
                    PLD                       ;
                    LDA.b #$15                ;
                    STA.w $1603               ;
                    RTS                       ;