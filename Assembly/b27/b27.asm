; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $278000
    fillbyte $FF : fill   $8000

ORG $278000
CODE_278000:        LDA.w $0425                 
                    BEQ   CODE_278037           
                    LDA.w $052B                 
                    LDY.w $052A                 
                    JSL.l CODE_209FC1           
                    STA.w $052B                 
                    STY.w $052A                 
                    LDA.w $823C,y               
                    STA.b $2E                   
                    LDA.w $824C,y               
                    STA.b $2F                   
                    LDA.w $052B                 
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.w $0529                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $05                   
                    STA.b $04                   
                    LDA.b #$00                  
                    STA.b $06                   
                    BEQ   CODE_278073           
CODE_278037:        LDA.w $0528                 
                    ASL   A                     
                    TAX                         
                    LDA.w $8200,x               
                    STA.b $2E                   
                    LDA.w $8201,x               
                    STA.b $2F                   
                    STZ.b $06                   
                    LDA.w $052A                 
                    BEQ   CODE_27804F           
                    INC.b $2F                   
CODE_27804F:        LDA.w $052B                 
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.w $0529                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $05                   
                    STA.b $04                   
                    LDA.w $052A                 
                    BNE   CODE_27806F           
                    LDA.w $052B                 
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_278073           
CODE_27806F:        LDA.b #$01                  
                    STA.b $06                   
CODE_278073:        LDA.w $0564                 
                    BNE   CODE_278079           
                    RTL                         

CODE_278079:        JSR.w CODE_27807D           
                    RTL                         

CODE_27807D:        JSL.l CODE_20FB1F           

                    dw CODE_278144
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_2780B3
                    dw CODE_278145
                    dw CODE_2781B5
                    dw CODE_278216
                    dw CODE_278216
                    dw CODE_278216
                    dw CODE_278216

CODE_2780B3:        LDX.w $0564                 
                    DEX                         
                    LDY.b $04                   
                    LDA.w $84E6,x               
                    STA.b [$2E],y               
                    TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDY.b #$00                  
CODE_2780C5:        LDA.w $84F8,x               
                    STA.w $036E,y               
                    INX                         
                    INY                         
                    CPY.b #$08                  
                    BNE   CODE_2780C5           
                    LDA.b $05                   
                    ASL   A                     
                    ADC.b #$00                  
                    ASL   A                     
                    ADC.b #$00                  
                    PHA                         
                    AND.b #$0F                  
                    LDY.b $06                   
                    BEQ   CODE_2780E7           
                    LDY.w $052A                 
                    BEQ   CODE_2780E7           
                    ORA.b #$08                  
CODE_2780E7:        STA.w $036C                 
                    LDA.w $0528                 
                    LSR   A                     
                    BCC   CODE_2780F8           
                    LDA.w $036C                 
                    ORA.b #$04                  
                    STA.w $036C                 
CODE_2780F8:        PLA                         
                    AND.b #$F0                  
                    STA.b $01                   
                    LDA.w $0529                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $01                   
                    STA.w $036D                 
                    LDA.b #$00                  
                    STA.w $0564                 
                    LDA.w $0425                 
                    BEQ   CODE_278144           
                    REP   #$20                  
                    LDA.b $06                   
                    PHA                         
                    LDA.w $052A                 
                    XBA                         
                    AND.w #$FF00                
                    LSR   A                     
                    LSR   A                     
                    STA.b $06                   
                    LDA.w $036C                 
                    XBA                         
                    SEC                         
                    SBC.b $06                   
                    AND.w #$0BFF                
                    XBA                         
                    STA.w $036C                 
                    PLA                         
                    STA.b $06                   
                    SEP   #$20                  
                    LDA.w $052A                 
                    AND.b #$01                  
                    BEQ   CODE_278144           
                    LDA.w $036C                 
                    EOR.b #$08                  
                    STA.w $036C                 
CODE_278144:        RTS                         

CODE_278145:        LDA.b #$00                  
                    STA.w $0564                 
                    LDY.b $04                   
                    LDA.b #$42                  
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    BCC   CODE_278159           
                    INC.b $2F                   
CODE_278159:        LDA.b #$42                  
                    STA.b [$2E],y               
                    REP   #$10                  
                    LDY.w #$0000                
                    LDX.w $1600                 
CODE_278165:        LDA.w $8588,y               
                    STA.w $1602,x               
                    INX                         
                    INY                         
                    CPY.w #$000D                
                    BNE   CODE_278165           
                    SEP   #$10                  
                    LDA.b $05                   
                    ASL   A                     
                    ADC.b #$00                  
                    ASL   A                     
                    ADC.b #$00                  
                    PHA                         
                    AND.b #$0F                  
                    LDY.b $06                   
                    BEQ   CODE_278185           
                    ORA.b #$08                  
CODE_278185:        REP   #$10                  
                    LDX.w $1600                 
                    STA.w $1602,x               
                    STA.w $1608,x               
                    PLA                         
                    AND.b #$F0                  
                    STA.b $01                   
                    LDA.w $0529                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $01                   
                    STA.w $1603,x               
                    CLC                         
                    ADC.b #$01                  
                    STA.w $1609,x               
                    REP   #$20                  
                    LDA.w $1600                 
                    CLC                         
                    ADC.w #$000C                
                    STA.w $1600                 
                    SEP   #$30                  
                    RTS                         

CODE_2781B5:        LDA.b #$00                  
                    STA.w $0564                 
                    LDY.b $04                   
                    LDA.b #$86                  
                    STA.b [$2E],y               
                    INY                         
                    LDA.b #$87                  
                    STA.b [$2E],y               
                    LDX.b #$00                  
                    LDY.w $1600                 
                    REP   #$20                  
CODE_2781CC:        LDA.w $8595,x               
                    STA.w $1602,y               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPX.b #$1A                  
                    BNE   CODE_2781CC           
                    SEP   #$20                  
                    LDX.w $1600                 
                    LDA.b $05                   
                    ASL   A                     
                    ADC.b #$00                  
                    ASL   A                     
                    ADC.b #$00                  
                    PHA                         
                    AND.b #$0F                  
                    LDY.b $06                   
                    BEQ   CODE_2781F0           
                    ORA.b #$08                  
CODE_2781F0:        STA.w $1602,x               
                    STA.w $160E,x               
                    PLA                         
                    AND.b #$F0                  
                    STA.b $01                   
                    LDA.w $0529                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $01                   
                    STA.w $1603,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $160F,x               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$1A                  
                    STA.w $1600                 
                    RTS                         

CODE_278216:        LDX.b #$00                  
                    LDA.w $0564                 
                    CMP.b #$15                  
                    BNE   CODE_278229           
                    LDY.b $04                   
                    LDA.b [$2E],y               
                    CMP.b #$96                  
                    BEQ   CODE_27822F           
                    BNE   CODE_27822E           
CODE_278229:        SEC                         
                    SBC.b #$16                  
                    TAX                         
                    INX                         
CODE_27822E:        INX                         
CODE_27822F:        LDY.w $85AF,x               
                    STX.b $0A                   
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    TAY                         
                    SEP   #$20                  
                    LDX.w $1600                 
                    LDA.b #$31                  
                    STA.b $00                   
CODE_278244:        LDA.w $85B4,y               
                    STA.w $1602,x               
                    INX                         
                    INY                         
                    DEC.b $00                   
                    BNE   CODE_278244           
                    SEP   #$10                  
                    LDA.b $0A                   
                    ASL   A                     
                    ASL   A                     
                    STA.b $0A                   
                    LDA.b #$00                  
                    STA.b $02                   
CODE_27825C:        LDA.b $04                   
                    AND.b #$F0                  
                    LDY.b $06                   
                    BEQ   CODE_278267           
                    CLC                         
                    ADC.b #$10                  
CODE_278267:        STA.b $05                   
                    LDA.b $04                   
                    AND.b #$0F                  
                    ASL   A                     
                    STA.b $07                   
                    LDA.b $05                   
                    ASL   A                     
                    ADC.b #$00                  
                    ASL   A                     
                    ADC.b #$00                  
                    PHA                         
                    AND.b #$03                  
                    LDY.b $06                   
                    BEQ   CODE_278281           
                    ORA.b #$08                  
CODE_278281:        STA.b $08                   
                    LDA.w $0528                 
                    LSR   A                     
                    BCC   CODE_27828F           
                    LDA.b $08                   
                    ORA.b #$04                  
                    STA.b $08                   
CODE_27828F:        LDX.b #$00                  
                    LDA.b $02                   
                    BEQ   CODE_278297           
                    LDX.b #$18                  
CODE_278297:        REP   #$30                  
                    TXA                         
                    AND.w #$00FF                
                    CLC                         
                    ADC.w $1600                 
                    TAX                         
                    SEP   #$20                  
                    PLA                         
                    AND.b #$F0                  
                    ORA.b $07                   
                    PHA                         
                    LDA.b $08                   
                    AND.b #$08                  
                    BEQ   CODE_2782CA           
                    PLA                         
                    CMP.b #$40                  
                    BCS   CODE_2782C5
                    PHA                         
                    DEC.b $08                   
                    LDA.b $08                   
                    AND.b #$08                  
                    BNE   CODE_2782C4           
                    LDA.b $08                   
                    AND.b #$03                  
                    STA.b $08                   
CODE_2782C4:        PLA                         
CODE_2782C5:        SEC                         
                    SBC.b #$40                  
                    BRA   CODE_2782CB           

CODE_2782CA:        PLA                         
CODE_2782CB:        STA.b $03                   
                    STA.w $1603,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $160F,x               
                    LDA.b $08                   
                    STA.w $1602,x               
                    STA.w $160E,x               
                    SEP   #$10                  
                    LDY.b $04                   
                    LDX.b $0A                   
                    LDA.w $86AB,x               
                    STA.b [$2E],y               
                    INY                         
                    LDA.w $86AC,x               
                    STA.b [$2E],y               
                    LDA.b $04                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $04                   
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    INC.b $0A                   
                    INC.b $0A                   
                    INC.b $02                   
                    LDA.b $02                   
                    CMP.b #$02                  
                    BEQ   CODE_27830B           
                    JMP.w CODE_27825C           

CODE_27830B:        REP   #$20                  
                    LDA.w $1600                 
                    CLC                         
                    ADC.w #$0030                
                    STA.w $1600                 
                    SEP   #$20                  
                    STZ.w $0564                 
                    INC.w $037B                 
                    RTS                         

                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_278357           
                    LDA.b $15                   
                    AND.b #$18                  
                    LSR   A                     
                    TAX                         
                    LDY.w $1600                 
                    LDA.b #$3F                  
                    STA.w $1601,y               
                    LDA.b #$04                  
                    STA.w $1602,y               
                    STA.w $1603,y               
CODE_27833C:        LDA.w $86BF,x               
                    STA.w $1604,y               
                    INY                         
                    INX                         
                    TXA                         
                    AND.b #$03                  
                    BNE   CODE_27833C           
                    LDA.b #$00                  
                    STA.w $1604,y               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$07                  
                    STA.w $1600                 
CODE_278357:        RTS                         

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

CODE_278500:        LDA.w $0554                 
                    ORA.w $0551                 
                    ORA.b $9C                   
                    BEQ   CODE_278517           
                    LDA.w $1A02                 
                    CMP.b #$13                  
                    BCC   CODE_278516           
                    LDA.b #$80                  
                    STA.w $05F3                 
CODE_278516:        RTL                         

CODE_278517:        STA.w $05F3                 
                    LDA.w $1A09                 
                    BEQ   CODE_278522           
                    DEC.w $1A09                 
CODE_278522:        JSR.w CODE_278526           
                    RTL                         

CODE_278526:        LDA.w $1A01                 
                    JSL.l CODE_20FB1F           

                    dw CODE_27855A
                    dw CODE_27855A
                    dw CODE_27888F
                    dw CODE_27876F
                    dw CODE_278723
                    dw CODE_27882D

CODE_278539:        DEC.w $1A67
                    BPL   CODE_278559           
                    LDA.b #$05                  
                    STA.w $1A67                 
                    INC.w $1A66                 
                    LDA.w $1A66                 
                    CMP.b #$06                  
                    BCC   CODE_278552           
                    LDA.b #$00                  
                    STA.w $1A66                 
CODE_278552:        TAY                         
                    LDA.w $84BE,y               
                    STA.w $07C9                 
CODE_278559:        RTS                         

CODE_27855A:        LDX.b #$00                  
                    JSR.w CODE_278922           
                    LDA.w $1A02                 
                    CMP.b #$11                  
                    BNE   CODE_27856B           
                    PHA                         
                    JSR.w CODE_278539           
                    PLA                         
CODE_27856B:        CMP.b #$0E                  
                    BNE   CODE_278572           
                    JSR.w CODE_27886A           
CODE_278572:        JSR.w CODE_278697           
                    LDA.w $1A09                 
                    LSR   A                     
                    BCS   CODE_2785B9                   
                    PHA                         
                    JSR.w CODE_278920           
                    PLA                         
                    BNE   CODE_2785B9           
                    LDA.w $1A08                 
                    BEQ   CODE_27858A           
                    JMP.w CODE_278614           

CODE_27858A:        LDA.w $1A05                 
                    BNE   CODE_2785E8           
CODE_27858F:        STX.b $DA                   
                    LDX.w $1A02                 
                    LDA.w $1A03                 
                    CMP.l $27AA5F,x             
                    PHP                         
                    TXY                         
                    LDX.b $DA                   
                    PLP                         
                    BNE   CODE_2785C4           
                    CPY.b #$13                  
                    BCC   CODE_2785A9           
                    ROR.w $05F3                 
CODE_2785A9:        LDA.b #$00                  
                    STA.w $1A0E                 
                    LDA.w $825C,y               
                    BNE   CODE_2785BA           
                    STA.w $1A0F                 
                    STA.w $1A10                 
CODE_2785B9:        RTS                         

CODE_2785BA:        STA.w $1A04                 
                    LDA.b #$FF                  
                    STA.w $1A05                 
                    BNE   CODE_2785DF           
CODE_2785C4:        INC.w $1A03                 
                    LDY.w $1A03                 
                    LDA.w $8271,y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    BEQ   CODE_27860E           
                    STA.w $1A04                 
                    LDY.w $1A03                 
                    LDA.w $835F,y               
                    STA.w $1A05                 
CODE_2785DF:        LDY.w $1A04                 
                    LDA.w $8458,y               
                    STA.w $1A06                 
CODE_2785E8:        LDY.w $1A04                 
                    LDA.w $1A06                 
                    CMP.w $8459,y               
                    BNE   CODE_278603           
                    LDA.w $8458,y               
                    STA.w $1A06                 
                    LDA.w $1A05                 
                    BMI   CODE_278603           
                    DEC.w $1A05                 
                    BEQ   CODE_27858F           
CODE_278603:        INC.w $1A06                 
                    LDY.w $1A06                 
                    LDA.w $8490,y               
                    BNE   CODE_278611           
CODE_27860E:        LDA.w $835F,y               
CODE_278611:        STA.w $1A08                 
CODE_278614:        DEC.w $1A08                 
                    LDA.w $1A05                 
                    BEQ   CODE_278624           
                    LDY.w $1A06                 
                    LDA.w $8462,y               
                    BPL   CODE_27862A           
CODE_278624:        LDY.w $1A03                 
                    LDA.w $8271,y               
CODE_27862A:        PHA                         
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA.w $844D,y               
                    CLC                         
                    ADC.w $1A0E                 
                    STA.w $1A0E                 
                    PLA                         
                    AND.b #$03                  
                    TAY                         
                    LDA.w $844D,y               
                    CLC                         
                    ADC.w $1A0F                 
                    STA.w $1A0F                 
                    LDA.b #$04                  
                    STA.w $1A09                 
                    LDA.w $02BF                 
                    CMP.b #$03                  
                    BNE   CODE_278659           
                    LDX.w $0727                 
                    BRA   CODE_278660           

CODE_278659:        LDX.b #$08                  
                    CMP.b #$04                  
                    BEQ   CODE_278660           
                    RTS                         

CODE_278660:        LDA.w $0351                 
                    INC   A                     
                    INC   A                     
                    CMP.w $8450,x               
                    BCC   CODE_27866D           
                    AND.w $8450,x               
CODE_27866D:        STA.w $0351                 
                    LDA.w $0350                 
                    CMP.b #$23                  
                    BEQ   CODE_27867B           
                    JSL.l CODE_29D356           
CODE_27867B:        REP   #$20                  
                    LDA.w $0212                 
                    STA.w $035D                 
                    LSR   A                     
                    STA.w $035B                 
                    LSR   A                     
                    STA.w $0359                 
                    LSR   A                     
                    STA.w $0357                 
                    SEP   #$20                  
                    LDA.b #$07                  
                    STA.w $0427                 
                    RTS                         

CODE_278697:        LDA.b #$01                  
                    STA.w $05FC                 
                    LDY.b $A6                   
                    BNE   CODE_2786BC           
                    LDA.w $1A02                 
                    CMP.b #$13                  
                    BCC   CODE_2786B8           
                    LDA.b #$04                  
                    STA.w $0427                 
                    LDA.b $55                   
                    CMP.b #$01                  
                    BNE   CODE_2786B8           
                    LDA.b $70                   
                    CMP.b #$70                  
                    BCS   CODE_2786B9                   
CODE_2786B8:        INY                         
CODE_2786B9:        STY.w $1A14                 
CODE_2786BC:        LDA.b #$0F                  
                    SEC                         
                    SBC.b $79                   
                    BCS   CODE_2786CA                   
                    LDA.b $79                   
                    SEC                         
                    SBC.b #$E0                  
                    BCC   CODE_2786E5           
CODE_2786CA:        LDA.w $1A0E                 
                    EOR.b $8B                   
                    BMI   CODE_2786D4           
                    STZ.w $074E                 
CODE_2786D4:        LDA.w $1A0E                 
                    CLC                         
                    SBC.b $8B                   
                    EOR.b $79                   
                    BMI   CODE_2786F6           
                    LDA.w $1A0E                 
                    STA.b $8B                   
                    BRA   CODE_2786F6           

CODE_2786E5:        LDA.w $1A14                 
                    BNE   CODE_2786F6           
                    LDA.b $5E                   
                    CLC                         
                    ADC.w $1A12                 
                    STA.b $5E                   
                    BCC   CODE_2786F6           
                    INC.b $43                   
CODE_2786F6:        LDA.w $1A0E                 
                    ASL   A                     
                    ROL   A                     
                    AND.b #$01                  
                    STA.w $1A07                 
                    LDA.b $8B                   
                    BEQ   CODE_278722           
                    EOR.w $1A0E                 
                    BMI   CODE_278722           
                    LDY.b #$00                  
                    LDA.w $1A12                 
                    BEQ   CODE_278722           
                    BPL   CODE_278713           
                    DEY                         
CODE_278713:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    TYA                         
                    ADC.b $43                   
                    STA.b $43                   
                    LDA.b #$00                  
                    STA.w $074E                 
CODE_278722:        RTS                         

CODE_278723:        LDA.w $1A04                 
                    BNE   CODE_27873C           
                    LDA.w $0216                 
                    CMP.b #$EF                  
                    BNE   CODE_278722           
                    LDA.w $0216                 
                    STA.w $1A0D                 
                    INC.w $1A04                 
                    LDA.b #$20                  
                    BNE   CODE_278756           
CODE_27873C:        LDA.w $1A09                 
                    BEQ   CODE_278744           
                    JMP.w CODE_2787B8           

CODE_278744:        LDA.w $1A0D                 
                    CMP.b #$0D                  
                    BEQ   CODE_27876C           
                    CMP.b #$0F                  
                    BNE   CODE_278759           
                    LDA.b #$09                  
                    STA.w $1203                 
                    LDA.b #$20                  
CODE_278756:        STA.w $1A09                 
CODE_278759:        JSR.w CODE_278920           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_27876C           
                    LDA.w $1A0F                 
                    CMP.b #$F8                  
                    BEQ   CODE_27876C           
                    DEC.w $1A0F                 
CODE_27876C:        JMP.w CODE_2787C0           

CODE_27876F:        LDA.w $1A09                 
                    BNE   CODE_2787B8           
                    JSR.w CODE_278920           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_27878F           
                    LDY.w $1A03                 
                    LDA.w $1A0F                 
                    CMP.w $84C8,y               
                    BEQ   CODE_27878F           
                    CLC                         
                    ADC.w $84C6,y               
                    STA.w $1A0F                 
CODE_27878F:        LDA.w $1A02                 
                    ASL   A                     
                    ORA.w $1A03                 
                    TAY                         
                    LDA.w $1A0D                 
                    CMP.w $84CA,y               
                    BNE   CODE_2787C0           
                    LDA.b #$00                  
                    STA.w $1A0F                 
                    LDA.w $1A03                 
                    EOR.b #$01                  
                    STA.w $1A03                 
                    BEQ   CODE_2787B3           
                    LDA.b #$09                  
                    STA.w $1203                 
CODE_2787B3:        LDA.b #$20                  
                    STA.w $1A09                 
CODE_2787B8:        AND.b #$01                  
                    EOR.w $1A0D                 
                    STA.w $1A0D                 
CODE_2787C0:        LDA.b #$01                  
                    STA.w $058B                 
                    LDA.b #$81                  
CODE_2787C7:        STA.w $0427                 
                    LDA.b #$06                  
                    LDY.b $BB                   
                    BNE   CODE_2787D2           
                    LDA.b #$12                  
CODE_2787D2:        ADC.b $70                   
                    AND.b #$F0                  
                    STA.b $08                   
                    LDA.b $55                   
                    ADC.b #$00                  
                    AND.b #$01                  
                    STA.b $02                   
                    LDA.b $5E                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $09                   
                    LDA.b $43                   
                    ADC.b #$00                  
                    ASL   A                     
                    TAY                         
                    LDA.w $8200,y               
                    STA.b $00                   
                    LDA.w $8201,y               
                    CLC                         
                    ADC.b $02                   
                    STA.b $01                   
                    LDA.b $09                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $08                   
                    TAY                         
                    LDA.b #$7E                  
                    STA.b $02                   
                    LDA.b [$00],y               
                    STA.b $00                   
                    LDY.w $0560                 
                    LDA.w $AF56,y               
                    CMP.b $00                   
                    BEQ   CODE_278823           
                    LDA.w $AF3A,y               
                    CMP.b #$FF                  
                    BEQ   CODE_278827           
                    SEC                         
                    SBC.b $00                   
                    CMP.b #$02                  
                    BCS   CODE_278827                   
CODE_278823:        JSL.l CODE_27A4C6           
CODE_278827:        LDA.b #$81                  
                    STA.w $05FC                 
                    RTS                         

CODE_27882D:        JSR.w CODE_278920           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_278848           
                    LDY.w $1A03                 
                    LDA.w $1A0F                 
                    CMP.w $84CE,y               
                    BEQ   CODE_278848           
                    CLC                         
                    ADC.w $84C6,y               
                    STA.w $1A0F                 
CODE_278848:        LDA.w $1A02                 
                    ASL   A                     
                    ORA.w $1A03                 
                    TAY                         
                    LDA.w $1A0D                 
                    CMP.w $84D0,y               
                    BNE   CODE_278860           
                    LDA.w $1A03                 
                    EOR.b #$01                  
                    STA.w $1A03                 
CODE_278860:        LDA.w $1A02                 
                    CMP.b #$04                  
                    BCC   CODE_27886A           
                    JMP.w CODE_2787C0           

CODE_27886A:        LDY.b #$00                  
                    LDA.b #$00                  
                    JSR.w CODE_2787C7           
                    LDA.w $0544                 
                    BNE   CODE_27888E           
                    TAY                         
                    LDA.w $056F                 
                    BNE   CODE_278881           
                    LDA.b $BB                   
                    BEQ   CODE_278881           
                    INY                         
CODE_278881:        LDA.b $82                   
                    CMP.w $84C4,y               
                    TAY                         
                    ROR   A                     
                    CPY.b #$80                  
                    ROR   A                     
                    STA.w $0584                 
CODE_27888E:        RTS                         

CODE_27888F:        INC.w $1A13                 
                    LDA.b #$00                  
                    STA.w $1A0E                 
                    STA.w $1A12                 
                    LDA.w $1A04                 
                    CMP.b #$05                  
                    BCS   CODE_278918                   
                    REP   #$20                  
                    LDA.w $0565                 
                    AND.w #$0003                
                    BNE   CODE_2788AE           
                    INC.w $02CE                 
CODE_2788AE:        LDA.w $0565                 
                    AND.w #$0003                
                    BNE   CODE_2788B9           
                    DEC.w $02CC                 
CODE_2788B9:        SEP   #$20                  
                    LDA.b #$08                  
                    STA.w $1A0E                 
                    LDA.b #$F8                  
                    STA.w $1A0F                 
                    LDA.w $1A13                 
                    LSR   A                     
                    BCC   CODE_2788CE           
                    INC.w $1A12                 
CODE_2788CE:        LDA.w $05FF                 
                    BNE   CODE_2788EC           
                    BCC   CODE_27891D           
                    INC.w $1A0C                 
                    BNE   CODE_2788DD           
                    INC.w $1A0A                 
CODE_2788DD:        LDA.w $1A0D                 
                    BNE   CODE_2788E7           
                    INC.w $1A04                 
                    BNE   CODE_278910           
CODE_2788E7:        DEC.w $1A0D                 
                    BCS   CODE_27891D                   
CODE_2788EC:        LSR   A                     
                    LSR   A                     
                    LDA.w $1A04                 
                    ROL   A                     
                    TAY                         
                    LDA.w $1A0C                 
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1A0C                 
                    BCC   CODE_278901           
                    INC.w $1A0A                 
CODE_278901:        AND.b #$F0                  
                    CMP.w $84DC,y               
                    BNE   CODE_27891D           
                    STA.w $1A0C                 
                    LDA.b #$EF                  
                    STA.w $1A0D                 
CODE_278910:        LDY.w $05FF                 
                    INY                         
                    CPY.b #$04                  
                    BCC   CODE_27891A           
CODE_278918:        LDY.b #$00                  
CODE_27891A:        STY.w $05FF                 
CODE_27891D:        JMP.w CODE_278697           

CODE_278920:        LDX.b #$01                  
CODE_278922:        LDA.w $1A0E,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $1A10,x               
                    STA.w $1A10,x               
                    PHP                         
                    PHP                         
                    LDY.b #$00                  
                    LDA.w $1A0E,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_278942           
                    ORA.b #$F0                  
                    DEY                         
CODE_278942:        PLP                         
                    PHA                         
                    ADC.w $1A0C,x               
                    STA.w $1A0C,x               
                    TYA                         
                    ADC.w $1A0A,x               
                    STA.w $1A0A,x               
                    PLA                         
                    PLP                         
                    ADC.b #$00                  
                    STA.w $1A12                 
                    RTS                         

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

                    LDA.b $17
                    AND.b #$03
                    TAY
                    LDA.w $AF6B,y               
                    STA.b $8B                   
                    LDA.b $17                   
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA.w $AF6B,y               
                    STA.b $9D                   
                    RTS                         

CODE_278A17:        REP   #$20                  
                    LDA.w $02E3                 
                    BEQ   CODE_278A61           
                    CMP.w #$0010                
                    BEQ   CODE_278A28           
                    DEC.w $02E3                 
                    BRA   CODE_278A61           

CODE_278A28:        SEP   #$20                  
                    LDY.b #$01                  
                    LDA.w $05EE                 
                    ORA.w $05EF                 
                    BNE   CODE_278A35           
                    INY                         
CODE_278A35:        ORA.w $05F0                 
                    BEQ   CODE_278A64           
                    TYA                         
                    TAX                         
                    LDA.w $AF8B,x               
                    STA.w $069C                 
CODE_278A42:        DEC.w $05EE,x               
                    BPL   CODE_278A4F           
                    LDA.b #$09                  
                    STA.w $05EE,x               
                    DEX                         
                    BPL   CODE_278A42           
CODE_278A4F:        LDX.b $9B                   
                    LDA.w $2143                 
                    AND.b #$7F                  
                    CMP.b #$4B                  
                    BEQ   CODE_278A5F           
                    LDA.b #$4B                  
                    STA.w $1203                 
CODE_278A5F:        LDA.b #$01                  
CODE_278A61:        SEP   #$20                  
                    RTL                         

CODE_278A64:        LDA.b #$4C                  
                    STA.w $1203                 
                    LDA.b #$00                  
                    STA.w $02E3                 
                    STA.w $02E4                 
                    RTL                         

CODE_278A72:        LDY.b #$05                  
CODE_278A74:        LDA.w $1FC8,y               
                    BEQ   CODE_278A7E           
                    DEY                         
                    BPL   CODE_278A74           
CODE_278A7C:        SEC                         
                    RTL                         

CODE_278A7E:        JSL.l CODE_27A85F           
                    BNE   CODE_278A7C           
                    CLC                         
                    RTL                         

CODE_278A86:        PHA                         
                    TYA                         
                    TAX                         
                    PLA                         
CODE_278A8A:        CLC                         
                    ADC.b #$05                  
                    JSL.l CODE_278A94           
                    LDX.b $9B                   
                    RTL                         

CODE_278A94:        PHA                         
                    STY.b $0E                   
                    JSR.w CODE_278ADB           
                    PLA                         
                    STA.w $079F,y               
                    LDA.b $56,x                 
                    XBA                         
                    LDA.b $71,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.w $0216                 
                    SEC                         
                    SBC.w #$0010                
                    BPL   CODE_278AB2           
                    LDA.w #$0005                
CODE_278AB2:        CMP.w #$00C0                
                    BCC   CODE_278ABA           
                    LDA.w #$00C0                
CODE_278ABA:        SEP   #$20                  
                    STA.w $07A9,y               
                    LDA.b $44,x                 
                    XBA                         
                    LDA.b $5F,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    SEP   #$20                  
                    STA.w $07AE,y               
                    XBA                         
                    STA.w $0251,y               
                    LDA.b #$30                  
                    STA.w $07A4,y               
                    LDY.b $0E                   
                    RTL                         

CODE_278ADB:        LDY.b #$04                  
CODE_278ADD:        LDA.w $079F,y               
                    BEQ   CODE_278AE7           
                    DEY                         
                    BPL   CODE_278ADD           
                    LDY.b #$04                  
CODE_278AE7:        RTS                         

CODE_278AE8:        LDY.b #$03                  
CODE_278AEA:        LDA.w $1FB4,y               
                    BEQ   CODE_278AF4           
                    DEY                         
                    BPL   CODE_278AEA           
                    LDY.b #$03                  
CODE_278AF4:        LDA.b #$01                  
                    STA.w $1203                 
                    LDA.b #$01                  
                    STA.w $1FB4,y               
                    LDA.b $00                   
                    SEC                         
                    SBC.w $0543                 
                    SBC.b #$18                  
                    STA.w $1FB8,y               
                    LDA.b $0E                   
                    XBA                         
                    LDA.b $01                   
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    SEP   #$20                  
                    STA.w $1FBC,y               
                    XBA                         
                    STA.w $024C,y               
                    LDA.b #$FB                  
                    STA.w $1FC0,y               
                    LDA.b #$01                  
                    STA.w $1FC4,y               
                    RTL                         

CODE_278B28:        LDA.b $A7,x                 
                    AND.b #$03                  
                    BNE   CODE_278B47           
                    LDA.w $1F76                 
                    SEC                         
                    SBC.b #$34                  
                    CMP.b #$02                  
                    BCS   CODE_278B47                   
                    TAY                         
                    LDA.b $5F,x                 
                    ADC.w $AF8E,y               
                    STA.b $5F,x                 
                    LDA.b $44,x                 
                    ADC.w $AF90,y               
                    STA.b $44,x                 
CODE_278B47:        RTL                         

CODE_278B48:        LDA.w $0567                 
                    BNE   CODE_278B47           
                    LDA.w $1F76                 
                    SEC                         
                    SBC.b #$34                  
                    CMP.b #$02                  
                    BCS   CODE_278B47                   
                    TAY                         
                    LDA.w $AF8E,y               
                    LDY.b #$FF                  
                    EOR.b $8C,x                 
                    BMI   CODE_278B63           
                    LDY.b #$01                  
CODE_278B63:        STY.w $07B5                 
                    RTL                         

CODE_278B67:        LDA.b $A7,x                 
                    BPL   CODE_278B84           
                    LDA.b $71,x                 
                    SEC                         
                    SBC.w $0543                 
                    AND.b #$F0                  
                    CLC                         
                    ADC.b #$01                  
                    CLC                         
                    ADC.w $0543                 
                    STA.b $71,x                 
                    LDA.b #$00                  
                    ADC.b #$00                  
                    STA.b $56,x                 
                    BRA   CODE_278B8E           

CODE_278B84:        LDA.b $71,x                 
                    AND.b #$F0                  
                    CLC                         
                    ADC.w $06B3                 
                    STA.b $71,x                 
CODE_278B8E:        LDA.b #$00                  
                    STA.b $9E,x                 
                    RTL                         

CODE_278B93:        LDA.b #$FF                  
                    BNE   CODE_278B9D           
                    LDA.b #$08                  
                    BNE   CODE_278B9D           
CODE_278B9B:        LDA.b #$04                  
CODE_278B9D:        PHA                         
                    CPX.b #$05                  
                    BNE   CODE_278BAA           
                    LDA.w $1A4F,x               
                    BEQ   CODE_278BAA           
                    DEC.w $1A4F,x               
CODE_278BAA:        LDA.b $A7,x                 
                    STA.w $1CEF                 
                    LDA.b #$00                  
                    STA.b $A7,x                 
                    STA.w $06B3                 
                    STA.w $07B5                 
                    JSL.l CODE_278CF3           
                    PLA                         
                    STA.b $00                   
                    LDY.w $064F                 
                    LDA.w $064C                 
                    CMP.w $1E9A,y               
                    BCC   CODE_278BD6           
                    LDA.b #$01                  
                    LDY.b $8C,x                 
                    BPL   CODE_278BD2           
                    ASL   A                     
CODE_278BD2:        ORA.b $A7,x                 
                    STA.b $A7,x                 
CODE_278BD6:        LDY.w $064E                 
                    LDA.b $9E,x                 
                    BPL   CODE_278BFB           
                    LDA.w $0563                 
                    BEQ   CODE_278BEC           
                    LDA.w $064B                 
                    CMP.w $1E96,y               
                    BCC   CODE_278BFA           
                    BCS   CODE_278BF4                   
CODE_278BEC:        LDA.w $064B                 
                    CMP.w $1E9A,y               
                    BCC   CODE_278BFA           
CODE_278BF4:        LDA.b $A7,x                 
                    ORA.b #$08                  
                    STA.b $A7,x                 
CODE_278BFA:        RTL                         

CODE_278BFB:        LDA.w $064B                 
                    CMP.w $1E96,y               
                    BCS   CODE_278C06                   
                    JMP.w CODE_278CB1           

CODE_278C06:        LDY.w $0563                 
                    BNE   CODE_278C0E           
                    JMP.w CODE_278C9D           

CODE_278C0E:        CMP.b #$A8                  
                    BEQ   CODE_278C22           
                    CMP.b #$AA                  
                    BEQ   CODE_278C22           
                    CMP.b #$37                  
                    BEQ   CODE_278C22           
                    CMP.b #$AB                  
                    BEQ   CODE_278C22           
                    CMP.b #$F9                  
                    BNE   CODE_278C25           
CODE_278C22:        JMP.w CODE_278CD4           

CODE_278C25:        LDA.b $71,x                 
                    AND.b #$0F                  
                    STA.b $00                   
                    LDA.b $0F                   
                    AND.b #$0F                  
                    STA.b $0F                   
                    LDY.w $060D                 
                    LDA.w $AD70,y               
                    CMP.b #$80                  
                    BNE   CODE_278C3E           
                    JMP.w CODE_278CB1           

CODE_278C3E:        TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $0F                   
                    TAY                         
                    LDA.w $AC0B,y               
                    AND.b #$0F                  
                    STA.b $01                   
                    LDA.b $00                   
                    CMP.b #$0C                  
                    BCS   CODE_278C58                   
                    CMP.b $01                   
                    BCC   CODE_278CB1           
CODE_278C58:        LDA.b $01                   
                    STA.w $06B3                 
                    LDA.b $A7,x                 
                    ORA.b #$04                  
                    STA.b $A7,x                 
                    LDY.w $060D                 
                    LDA.b $8C,x                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    BNE   CODE_278C70           
                    LDA.b #$01                  
CODE_278C70:        CMP.b #$08                  
                    BCC   CODE_278C76           
                    ORA.b #$F0                  
CODE_278C76:        LDX.w $AD70,y               
                    CPX.b #$00                  
                    BNE   CODE_278C80           
                    LDX.b #$00                  
                    TXA                         
CODE_278C80:        CPX.b #$00                  
                    BPL   CODE_278C88           
                    JSL.l CODE_27A859           
CODE_278C88:        STX.b $00                   
                    LDX.b $9B                   
                    STA.w $07B6,x               
                    LDA.b $00                   
                    LDY.b $8C,x                 
                    BPL   CODE_278C99           
                    JSL.l CODE_27A859           
CODE_278C99:        STA.w $07B5                 
                    RTL                         

CODE_278C9D:        LDA.w $058B                 
                    BNE   CODE_278CAA           
                    LDA.b $71,x                 
                    AND.b #$0F                  
                    CMP.b $00                   
                    BCS   CODE_278CB0                   
CODE_278CAA:        LDA.b $A7,x                 
                    ORA.b #$04                  
                    STA.b $A7,x                 
CODE_278CB0:        RTL                         

CODE_278CB1:        LDA.w $0563                 
                    BEQ   CODE_278CD3           
                    LDY.b #$00                  
                    LDA.w $07B6,x               
                    BEQ   CODE_278CD3           
                    BPL   CODE_278CC0           
                    DEY                         
CODE_278CC0:        CLC                         
                    ADC.b $71,x                 
                    STA.b $71,x                 
                    TYA                         
                    ADC.b $56,x                 
                    STA.b $56,x                 
                    LDA.b #$00                  
                    STA.w $07B6,x               
                    JSL.l CODE_278B93           
CODE_278CD3:        RTL                         

CODE_278CD4:        LDA.w $0661,x               
                    CMP.b #$06                  
                    BEQ   CODE_278CF2           
                    CMP.b #$04                  
                    BEQ   CODE_278CF2           
                    LDA.b $71,x                 
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$01                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $56,x                 
                    JSL.l CODE_278B93           
CODE_278CF2:        RTL                         

CODE_278CF3:        LDY.b #$6C                  
                    JSL.l CODE_278E13           
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    STA.b $00                   
                    TAY                         
                    LDA.w $0671,x               
                    CMP.b #$64                  
                    BNE   CODE_278D12           
                    LDA.b $B3                   
                    CMP.b #$F0                  
                    BNE   CODE_278D12           
                    LDA.b #$80                  
                    STA.b $B3                   
CODE_278D12:        LDA.b $B3                   
                    CMP.w $1E96,y               
                    BCS   CODE_278D66                   
                    LDX.b #$00                  
                    CMP.b #$D7                  
                    BEQ   CODE_278D38           
                    CMP.b #$E0                  
                    BEQ   CODE_278D38           
                    CMP.b #$E1                  
                    BEQ   CODE_278D38           
                    LDA.w $0560                 
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.w $AD84,y               
                    CMP.b $B3                   
                    BCS   CODE_278D38                   
                    INX                         
CODE_278D38:        TXA                         
                    LDX.b $9B                   
                    CMP.w $06B7,x               
                    BEQ   CODE_278D63           
                    PHA                         
                    LDA.b $B3                   
                    LDY.b $00                   
                    CMP.w $1E96,y               
                    PLA                         
                    BCS   CODE_278D63                  
                    PHA                         
                    LDA.w $1FE1,x               
                    PHA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    TAY                         
                    PLA                         
                    CMP.w $1E96,y               
                    PLA                         
                    BCS   CODE_278D63                   
                    PHA                         
                    JSL.l CODE_278F34           
                    PLA                         
CODE_278D63:        STA.w $06B7,x               
CODE_278D66:        LDA.b $B3                   
                    STA.w $1FE1,x               
                    LDY.w $0671,x               
                    LDA.w $B0FB,y               
                    AND.b #$F0                  
                    LSR   A                     
                    PHA                         
                    TAY                         
                    LDA.b $9E,x                 
                    BPL   CODE_278D7C           
                    INY                         
                    INY                         
CODE_278D7C:        JSL.l CODE_278E13           
                    STA.w $1F76                 
                    STA.w $064B                 
                    PHA                         
                    LDA.w $0560                 
                    CMP.b #$02                  
                    BNE   CODE_278DA0           
                    LDA.b $B3                   
                    CMP.b #$49                  
                    BEQ   CODE_278D98           
                    CMP.b #$4A                  
                    BNE   CODE_278DA0           
CODE_278D98:        INC.w $06EB,x               
                    LDA.b #$06                  
                    STA.w $0661,x               
CODE_278DA0:        PLA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    STA.w $064E                 
                    TAY                         
                    LDA.w $1F7B                 
                    STA.b $0F                   
                    LDA.w $0563                 
                    BEQ   CODE_278DD6           
                    LDA.b $B3                   
                    CMP.w $1E96,y               
                    BCC   CODE_278DD6           
                    PHA                         
                    TYA                         
                    ASL   A                     
                    TAX                         
                    LDA.w $AAD0,x               
                    STA.b $02                   
                    LDA.w $AAD1,x               
                    STA.b $03                   
                    PLA                         
                    SEC                         
                    SBC.w $1E96,y               
                    TAY                         
                    LDA.b ($02),y               
                    STA.w $060D                 
                    LDX.b $9B                   
CODE_278DD6:        LDA.b #$00                  
                    STA.w $1F77                 
                    PLA                         
                    CMP.b #$08                  
                    BNE   CODE_278DF5           
                    LDY.w $0563                 
                    BEQ   CODE_278DF5           
                    PHA                         
                    LDA.w $1CEF                 
                    AND.b #$04                  
                    TAY                         
                    PLA                         
                    CPY.b #$00                  
                    BEQ   CODE_278DF5           
                    LDY.b #$68                  
                    BRA   CODE_278DFA           

CODE_278DF5:        TAY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_278DFA:        LDA.b $8C,x                 
                    BMI   CODE_278E00           
                    INY                         
                    INY                         
CODE_278E00:        JSL.l CODE_278E13           
                    STA.w $1F77                 
                    STA.w $064C                 
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    STA.w $064F                 
                    RTL                         

CODE_278E13:        LDA.w $0425                 
                    BEQ   CODE_278E1B           
                    JMP.w CODE_278EEB           

CODE_278E1B:        LDA.w $058B                 
                    BEQ   CODE_278E42           
                    LDA.b $71,x                 
                    CLC                         
                    ADC.w $ADCA,y               
                    SEC                         
                    SBC.w $0543                 
                    CMP.b #$A0                  
                    BCC   CODE_278E42           
                    SBC.b #$10                  
                    AND.b #$F0                  
                    STA.w $1F79                 
                    LDA.b $A7,x                 
                    ORA.b #$80                  
                    STA.b $A7,x                 
                    LDA.b #$01                  
                    STA.w $1F78                 
                    BRA   CODE_278E5A           

CODE_278E42:        LDA.b $71,x                 
                    CLC                         
                    ADC.w $ADCA,y               
                    AND.b #$F0                  
                    STA.w $1F79                 
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $1F78                 
                    BEQ   CODE_278E63           
                    CMP.b #$02                  
                    BCS   CODE_278ECD                   
CODE_278E5A:        PHA                         
                    LDA.w $1F79                 
                    CMP.b #$B0                  
                    PLA                         
                    BCS   CODE_278ECD                   
CODE_278E63:        AND.b #$01                  
                    STA.b $02                   
                    LDA.b $5F,x                 
                    ADC.w $ADCB,y               
                    STA.w $1F7B                 
                    LDA.b $44,x                 
                    ADC.b #$00                  
                    STA.w $1F7A                 
                    CMP.b #$10                  
                    BCS   CODE_278ECD                   
                    PHX                         
                    ASL   A                     
                    TAX                         
                    LDA.l $218200,x             
                    STA.b $00                   
                    LDA.l $218201,x             
                    ADC.b $02                   
                    STA.b $01                   
                    LDA.w $821E,x               
                    STA.b $D8                   
                    LDA.w $821F,x               
                    ADC.b $02                   
                    STA.b $D9                   
                    LDA.b #$7E                  
                    STA.b $02                   
                    STA.b $DA                   
                    PLX                         
                    LDA.w $1F7B                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.w $1F79                 
                    TAY                         
CODE_278EA9:        LDA.b [$D8],y               
                    BEQ   CODE_278EC5           
                    PHX                         
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $AB57,x               
                    STA.b $DB                   
                    LDA.w $AB58,x               
                    STA.b $DC                   
                    LDA.b [$00],y               
                    TAY                         
                    LDA.b ($DB),y               
                    PLX                         
                    BRA   CODE_278EC7           

CODE_278EC5:        LDA.b [$00],y               
CODE_278EC7:        JSL.l CODE_278ED2           
                    BRA   CODE_278ECF           

CODE_278ECD:        LDA.b #$00                  
CODE_278ECF:        STA.b $B3                   
                    RTL                         

CODE_278ED2:        LDY.w $0567                 
                    BEQ   CODE_278EEA           
                    LDY.b #$03                  
CODE_278ED9:        CMP.w $AF92,y               
                    BNE   CODE_278EE7           
                    LDA.w $AF9A,y               
                    STA.b $B4                   
                    LDA.w $AF96,y               
                    RTL                         

CODE_278EE7:        DEY                         
                    BPL   CODE_278ED9           
CODE_278EEA:        RTL                         

CODE_278EEB:        LDA.b $71,x                 
                    CLC                         
                    ADC.w $ADCA,y               
                    AND.b #$F0                  
                    STA.w $1F79                 
                    STA.b $02                   
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $1F78                 
                    CMP.b #$10                  
                    BCS   CODE_278ECD                   
                    ADC.b #$20                  
                    STA.b $01                   
                    LDA.b $44,x                 
                    STA.w $1F7A                 
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.w $ADCB,y               
                    STA.w $1F7B                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    STA.b $00                   
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b #$7E                  
                    STA.b $02                   
                    STA.b $DA                   
                    LDY.b #$00                  
                    JMP.w CODE_278EA9           

CODE_278F34:        LDA.b #$02                  
                    STA.b $00                   
                    LDA.w $1A4F,x               
                    BNE   CODE_278EEA           
                    LDA.w $0671,x               
                    CMP.b #$1F                  
                    BEQ   CODE_278FC0           
                    LDA.b $9E,x                 
                    BMI   CODE_278F5B           
                    LDA.w $0671,x               
                    CMP.b #$62                  
                    BEQ   CODE_278FC0           
                    CMP.b #$6A                  
                    BEQ   CODE_278FC0           
                    CMP.b #$61                  
                    BEQ   CODE_278FC0           
                    LDA.b #$00                  
                    STA.b $9E,x                 
CODE_278F5B:        LDY.b #$02                  
                    INC.w $1A72                 
                    LDA.w $1A72                 
                    AND.b #$01                  
                    TAY                         
                    INY                         
                    LDA.b #$01                  
                    STA.w $1F90,y               
                    LSR   A                     
                    STA.w $1F99,y               
                    STZ.b $01                   
                    LDA.b $56,x                 
                    XBA                         
                    LDA.b $71,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.w #$0004                
                    AND.w #$FFF0                
                    CLC                         
                    ADC.b $00                   
                    SEP   #$20                  
                    STA.w $1F93,y               
                    XBA                         
                    STA.w $058E,y               
                    LDA.b $5F,x                 
                    STA.w $1F96,y               
                    LDA.b $44,x                 
                    STA.w $EF,y               
                    LDA.b $9E,x                 
                    BMI   CODE_278FC0           
                    LDA.w $1F7F                 
                    BNE   CODE_278FC0           
                    LDA.b #$80                  
                    STA.w $1F7F                 
                    LDA.b $71,x                 
                    ADC.b #$06                  
                    STA.w $1F87                 
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $1F83                 
                    LDA.b $5F,x                 
                    ADC.b #$04                  
                    STA.w $1F8F                 
                    LDA.b $44,x                 
                    ADC.b #$00                  
                    STA.w $1F8B                 
CODE_278FC0:        RTL                         

CODE_278FC1:        JMP.w CODE_278FD3           

                    db $35

                    BEQ   CODE_278FD3
                    LDA.b $18
                    AND.b #$20                  
                    BEQ   CODE_278FD3           
                    EOR.w $1CFF                 
                    STA.w $1CFF                 
CODE_278FD3:        LDA.w $1A45                 
                    BEQ   CODE_278FDB           
                    DEC.w $1A45                 
CODE_278FDB:        LDA.b $BB                   
                    CMP.b #$06                  
                    BNE   CODE_278FE6           
                    LDA.b #$4F                  
                    STA.w $071E                 
CODE_278FE6:        LDA.b $BF                   
                    CMP.b #$03                  
                    BNE   CODE_278FF4           
                    LDA.w $071B                 
                    CMP.b #$52                  
                    BNE   CODE_278FF4           
                    RTL                         

CODE_278FF4:        LDA.w $06A4                 
                    STA.w $06A5                 
                    STZ.w $06A4                 
                    STZ.w $07BD                 
                    LDA.b #$FF                  
                    STA.w $07B3                 
                    JSL.l CODE_299E7B           
                    JSL.l CODE_299A9A           
                    DEC.w $055D                 
                    BPL   CODE_279017           
                    LDA.b #$07                  
                    STA.w $055D                 
CODE_279017:        LDX.b #$07                  
CODE_279019:        STX.b $9B                   
                    LDA.b $9C                   
                    BNE   CODE_27905A           
                    LDA.w $0518,x               
                    BEQ   CODE_279027           
                    DEC.w $0518,x               
CODE_279027:        LDA.w $0520,x               
                    BEQ   CODE_27902F           
                    DEC.w $0520,x               
CODE_27902F:        CPX.b #$05                  
                    BCS   CODE_27905A                   
                    LDA.w $06AB,x               
                    BEQ   CODE_27903B           
                    DEC.w $06AB,x               
CODE_27903B:        LDA.w $06A6,x               
                    BEQ   CODE_27905A           
                    CMP.b #$60                  
                    BCC   CODE_279057           
                    LDA.b #$01                  
                    LDY.w $0661,x               
                    CPY.b #$02                  
                    BEQ   CODE_279057           
                    CPY.b #$04                  
                    BNE   CODE_279053           
                    LDA.b #$03                  
CODE_279053:        AND.b $15                   
                    BNE   CODE_27905A           
CODE_279057:        DEC.w $06A6,x               
CODE_27905A:        TXA                         
                    CLC                         
                    ADC.w $055D                 
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $AF6E,y               
                    STA.b $C6,x                 
                    SEP   #$20                  
                    JSR.w CODE_2790EC           
                    JSR.w CODE_27A5BB           
                    LDA.w $0661,x               
                    BNE   CODE_27907A           
                    LDA.b #$FF                  
                    STA.w $0659,x               
CODE_27907A:        DEX                         
                    BPL   CODE_279019           
                    LDA.w $05FD                 
                    BEQ   CODE_279086           
                    JSL.l CODE_22F000           
CODE_279086:        LDA.w $0350                 
                    CMP.b #$03                  
                    BNE   CODE_279091           
                    JSL.l CODE_29D3C1           
CODE_279091:        LDA.w $054F                 
                    BEQ   CODE_2790A7           
                    LDA.w $0575                 
                    ORA.w $058A                 
                    BNE   CODE_2790A2           
                    LDA.b $A6                   
                    BNE   CODE_2790A7           
CODE_2790A2:        LDA.b #$00                  
                    STA.w $054F                 
CODE_2790A7:        LDA.w $0564                 
                    BNE   CODE_2790DF           
                    LDY.b #$00                  
                    LDA.w $052E,y               
                    BNE   CODE_2790BF           
                    INY                         
                    LDA.w $052E,y               
                    BNE   CODE_2790BF           
                    INY                         
                    LDA.w $052E,y               
                    BEQ   CODE_2790DF           
CODE_2790BF:        STA.w $0564                 
                    LDA.w $0531,y               
                    STA.w $0528                 
                    LDA.w $0534,y               
                    STA.w $0529                 
                    LDA.w $0537,y               
                    STA.w $052A                 
                    LDA.w $053A,y               
                    STA.w $052B                 
                    LDA.b #$00                  
                    STA.w $052E,y               
CODE_2790DF:        LDA.w $0414                 
                    BEQ   CODE_2790EA           
                    STA.w $055F                 
                    STZ.w $07BE                 
CODE_2790EA:        RTL                         

CODE_2790EB:        RTS                         

CODE_2790EC:        LDA.w $0661,x               
                    BEQ   CODE_2790EB           
                    CMP.b #$08                  
                    BEQ   CODE_27910D           
                    LDY.b #$04                  
CODE_2790F7:        LDA.w $0671,x               
                    CMP.w $AFA2,y               
                    BCS   CODE_279102                   
                    DEY                         
                    BNE   CODE_2790F7           
CODE_279102:        STY.b $DE                   
                    INY                         
                    SEC                         
                    SBC.w $AFA1,y               
                    STA.w $0418                 
                    TAY                         
CODE_27910D:        JSL.l CODE_27A994           
                    JSL.l CODE_27A2C8           
                    JSL.l CODE_27A27C           
                    LDA.w $0661,x               
                    JSL.l CODE_20FB1F           

                    dw CODE_279B7B
                    dw CODE_279B7D
                    dw CODE_279D14
                    dw CODE_2791E8
                    dw CODE_2795A1
                    dw CODE_2793E1
                    dw CODE_27974A
                    dw CODE_27980F
                    dw CODE_279132

CODE_279132:        LDA.w $0518,x               
                    BNE   CODE_27913A           
                    JMP.w CODE_27980C           

CODE_27913A:        JSL.l CODE_27A85F           
                    BEQ   CODE_279143           
                    BRL   CODE_2791E7           

CODE_279143:        JSL.l CODE_279DC2           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b $7A,x                 
                    STA.w $0800,y               
                    STA.w $0808,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    STA.w $080C,y               
                    LDA.b $83,x                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    REP   #$20                  
                    LDA.w $0518,x               
                    AND.w #$00FF                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.w $AFA7,x               
                    STA.w $0802,y               
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080A,y               
                    STA.w $080E,y               
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    ORA.b #$22                  
                    STA.w $0803,y               
                    STA.w $080B,y               
                    EOR.b #$C0                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_2791B8           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $080A,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $080A,y               
CODE_2791B8:        LDA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_2791CD           
                    LDA.w $0806,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $0806,y               
                    PLA                         
                    STA.w $080E,y               
CODE_2791CD:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$30                  
                    LDX.b $9B                   
CODE_2791E7:        RTS                         

CODE_2791E8:        LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$10                  
                    BEQ   CODE_2791FD           
                    LDA.b #$10                  
                    STA.w $06A6,x               
                    LDA.b #$07                  
                    STA.w $0661,x               
                    RTS                         

CODE_2791FD:        LDA.b $9C                   
                    BNE   CODE_27924E           
                    JSR.w CODE_279886           
                    JSL.l CODE_27983B           
                    LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_279237           
                    LDA.b $9E,x                 
                    BMI   CODE_279237           
                    PHA                         
                    JSL.l CODE_278B67           
                    LDA.b $8C,x                 
                    PHP                         
                    BPL   CODE_279220           
                    JSL.l CODE_27A859           
CODE_279220:        LSR   A                     
                    PLP                         
                    BPL   CODE_279228           
                    JSL.l CODE_27A859           
CODE_279228:        STA.b $8C,x                 
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    JSL.l CODE_27A859           
                    CMP.b #$FE                  
                    BCS   CODE_279237                   
                    STA.b $9E,x                 
CODE_279237:        LDA.b $A7,x                 
                    AND.b #$08                  
                    BEQ   CODE_279241           
                    LDA.b #$10                  
                    STA.b $9E,x                 
CODE_279241:        LDA.b $A7,x                 
                    AND.b #$03                  
                    BEQ   CODE_27924B           
                    JSL.l CODE_279905           
CODE_27924B:        JSR.w CODE_279916           
CODE_27924E:        JSR.w CODE_279394           
CODE_279251:        JSR.w CODE_279BDF           
CODE_279254:        LDA.b #$02                  
                    STA.w $0669,x               
                    LDA.w $1FF9,x               
                    BEQ   CODE_27926F           
                    JSL.l CODE_22C964           
CODE_279262:        LDA.w $06A6,x               
                    CMP.b #$60                  
                    BCS   CODE_27926E                   
                    AND.b #$07                  
                    STA.w $06AB,x               
CODE_27926E:        RTS                         

CODE_27926F:        LDA.w $0671,x               
                    CMP.b #$50                  
                    BEQ   CODE_27927A           
                    CMP.b #$55                  
                    BNE   CODE_279282           
CODE_27927A:        LDA.b $BD                   
                    STA.w $0679,x               
                    JMP.w CODE_279EA0           

CODE_279282:        JSR.w CODE_279EBF           
                    JSR.w CODE_27A9BF           
                    LDY.w $0671,x               
                    CPY.b #$5C                  
                    BNE   CODE_2792B3           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b #$74                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $080A,y               
                    LDA.b #$76                  
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.w $0807,y               
                    AND.b #$BF                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    SEP   #$10                  
                    RTS                         

CODE_2792B3:        JSR.w CODE_279262           
                    CPY.b #$70                  
                    BNE   CODE_2792DB           
                    LDY.w $0679,x               
                    BMI   CODE_2792DA           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$01                  
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    SEP   #$10                  
CODE_2792DA:        RTS                         

CODE_2792DB:        CPY.b #$71                  
                    BEQ   CODE_2792DA           
                    LDA.w $06A6,x               
                    CMP.b #$50                  
                    BCS   CODE_2792DA                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $06A6,x               
                    AND.w $AFAB,y               
                    BEQ   CODE_2792DA           
                    LDA.b #$01                  
                    LDY.w $0679,x               
                    BMI   CODE_2792FB           
                    LSR   A                     
CODE_2792FB:        REP   #$30                  
                    LDY.b $C6,x                 
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $0801,y               
                    CMP.b #$F0                  
                    BEQ   CODE_27931D           
                    CLC                         
                    ADC.w $AFB1,x               
                    CMP.b #$C5                  
                    BCS   CODE_279331                   
                    STA.w $0811,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0819,y               
CODE_27931D:        LDA.w $0805,y               
                    CMP.b #$F0                  
                    BEQ   CODE_279331           
                    CLC                         
                    ADC.w $AFB1,x               
                    STA.w $0815,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,y               
CODE_279331:        LDA.w $0800,y               
                    SEC                         
                    SBC.b #$03                  
                    STA.w $0810,y               
                    STA.w $0818,y               
                    LDA.w $0804,y               
                    CLC                         
                    ADC.b #$03                  
                    STA.w $0814,y               
                    STA.w $081C,y               
                    LDA.w $0802,y               
                    AND.b #$80                  
                    ORA.b #$26                  
                    STA.w $0813,y               
                    STA.w $081B,y               
                    ORA.b #$40                  
                    STA.w $0817,y               
                    STA.w $081F,y               
                    LDA.b #$F8                  
                    STA.w $0812,y               
                    STA.w $0816,y               
                    INC   A                     
                    STA.w $081A,y               
                    STA.w $081E,y               
                    REP   #$20                  
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0A20,y               
                    STA.w $0A24,y               
                    LDA.w $0A21,y               
                    STA.w $0A25,y               
                    LDA.w $0A22,y               
                    STA.w $0A26,y               
                    LDA.w $0A23,y               
                    STA.w $0A27,y               
                    PLY                         
                    SEP   #$30                  
                    LDX.b $9B                   
                    RTS                         

CODE_279394:        TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCS   CODE_2793E0                   
                    JSL.l CODE_27A85F           
                    BNE   CODE_2793E0           
                    JSL.l CODE_27A439           
                    TXA                         
                    BEQ   CODE_2793E0           
                    DEX                         
CODE_2793A9:        LDY.w $0671,x               
                    LDA.w $AE78,y               
                    AND.b #$10                  
                    BEQ   CODE_2793DB           
                    LDA.w $0661,x               
                    CMP.b #$02                  
                    BNE   CODE_2793DB           
                    JSL.l CODE_27A85F           
                    BNE   CODE_2793DB           
                    JSL.l CODE_27A413           
                    JSL.l CODE_27A45F           
                    BCC   CODE_2793DB           
                    LDY.b $9B                   
                    LDA.b $7A,x                 
                    CMP.w $007A,y               
                    LDY.b #$00                  
                    BCC   CODE_2793D7           
                    LDY.b #$40                  
CODE_2793D7:        TYA                         
                    STA.w $0679,x               
CODE_2793DB:        DEX                         
                    BPL   CODE_2793A9           
                    LDX.b $9B                   
CODE_2793E0:        RTS                         

CODE_2793E1:        LDA.b $9C                   
                    BEQ   CODE_2793E8           
                    JMP.w CODE_2794B6           

CODE_2793E8:        JSL.l CODE_27983B           
                    JSL.l CODE_27A27C           
                    LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_27940B           
                    LDA.b $8C,x                 
                    BNE   CODE_279403           
                    JSL.l CODE_27A837           
                    LDA.w $AFB3,y               
                    STA.b $8C,x                 
CODE_279403:        JSL.l CODE_278B67           
                    LDA.b #$0C                  
                    STA.b $9E,x                 
CODE_27940B:        LDA.b $A7,x                 
                    AND.b #$03                  
                    BNE   CODE_279414           
                    JMP.w CODE_27945B           

CODE_279414:        LDA.w $7A,x               
                    LDY.b $8C,x                 
                    BPL   CODE_279421           
                    CMP.b #$06                  
                    BCC   CODE_279448           
                    BCS   CODE_279425                   
CODE_279421:        CMP.b #$E4                  
                    BCS   CODE_279448                   
CODE_279425:        JSL.l CODE_27A85F           
                    BNE   CODE_279448           
                    LDA.w $1F78                 
                    STA.b $0C                   
                    LDA.w $1F79                 
                    STA.b $0D                   
                    LDA.w $1F7A                 
                    STA.b $0E                   
                    LDA.w $1F7B                 
                    STA.b $0F                   
                    LDA.w $1F77                 
                    JSL.l CODE_23D83B           
                    LDX.b $9B                   
CODE_279448:        LDA.b #$01                  
                    STA.w $1200                 
                    LDA.w $0671,x               
                    CMP.b #$5C                  
                    BNE   CODE_279457           
                    JMP.w CODE_279A55           

CODE_279457:        JSL.l CODE_279905           
CODE_27945B:        JSR.w CODE_279916           
                    TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCC   CODE_2794B6           
                    JSR.w CODE_27A6EF           
                    BCC   CODE_2794B6           
                    LDA.b #$13                  
                    ORA.w $05F5,y               
                    CMP.b #$19                  
                    BCC   CODE_279479           
                    CMP.b #$1B                  
                    BCS   CODE_27947C                   
                    LDA.b #$19                  
CODE_279479:        STA.w $1200                 
CODE_27947C:        LDA.b $8C,x                 
                    ASL   A                     
                    LDA.b #$10                  
                    BCC   CODE_279485           
                    LDA.b #$F0                  
CODE_279485:        STA.w $8C,y               
                    LDA.w $0661,y               
                    CMP.b #$05                  
                    BNE   CODE_2794A5           
                    LDA.w $05F5,y               
                    JSL.l CODE_278A8A           
                    JSR.w CODE_279526           
                    LDA.w $8C,y               
                    ASL   A                     
                    LDA.b #$10                  
                    BCS   CODE_2794A3                   
                    LDA.b #$F0                  
CODE_2794A3:        STA.b $8C,x                 
CODE_2794A5:        TYA                         
                    TAX                         
                    JSR.w CODE_279526           
                    LDX.b $9B                   
                    LDA.w $05F5,x               
                    INC.w $05F5,x               
                    JSL.l CODE_278A86           
CODE_2794B6:        JSR.w CODE_279BDF           
                    LDA.w $0671,x               
                    CMP.b #$5C                  
                    BEQ   CODE_2794ED           
                    CMP.b #$7A                  
                    BCS   CODE_279521                   
                    LDA.w $0565                 
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA.w $0679,x               
                    AND.b #$BF                  
                    ORA.w $AFB5,y               
                    STA.w $0679,x               
                    LDA.w $AFB9,y               
                    STA.w $0669,x               
                    TYA                         
                    AND.b #$01                  
                    BNE   CODE_2794E6           
                    JSR.w CODE_279EBF           
                    BRA   CODE_2794E9           

CODE_2794E6:        JSR.w CODE_279EA0           
CODE_2794E9:        JSR.w CODE_27A9BF           
                    RTS                         

CODE_2794ED:        LDA.b $15                   
                    LSR   A                     
                    STA.w $0769,x               
                    JSR.w CODE_279EBF           
                    LDY.w $0671,x               
                    CPY.b #$5C                  
                    BNE   CODE_279520           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b #$74                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $080A,y               
                    LDA.b #$76                  
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.w $0807,y               
                    AND.b #$BF                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    SEP   #$10                  
CODE_279520:        RTS                         

CODE_279521:        JSL.l CODE_22C964           
                    RTS                         

CODE_279526:        LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$D0                  
                    STA.b $9E,x                 
                    LDA.b $71,x                 
                    STA.w $1A47                 
                    LDA.b $5F,x                 
                    STA.w $1A48                 
                    LDA.b $44,x                 
                    STA.w $027E                 
                    LDA.b #$0A                  
                    STA.w $1A46                 
                    RTS                         

CODE_279544:        LDA.w $1F9C                 
                    STA.w $1F9D                 
                    LDA.w $1F9F                 
                    STA.w $1FA0                 
                    LDA.w $1FAB                 
                    STA.w $1FAC                 
                    LDA.w $1FA2                 
                    STA.w $1FA3                 
                    LDA.w $1FA5                 
                    STA.w $1FA6                 
                    LDA.w $1FA8                 
                    STA.w $1FA9                 
                    LDA.w $1FAE                 
                    STA.w $1FAF                 
                    LDA.w $1FB1                 
                    STA.w $1FB2                 
                    LDA.b $DF                   
                    STA.b $E0                   
                    LDA.w $02AE                 
                    STA.w $02AF                 
                    RTL                         

                    LDA.w $1F77                 
CODE_279582:        STA.b $07                   
                    LDA.w $1F78                 
                    STA.b $0C                   
                    LDA.w $1F79                 
                    STA.b $0D                   
                    LDA.w $1F7A                 
                    STA.b $0E                   
                    LDA.w $1F7B                 
                    STA.b $0F                   
                    LDA.b $07                   
                    JSL.l CODE_23D83B           
                    LDX.b $9B                   
                    RTL                         

CODE_2795A1:        LDA.b $BF                   
                    BEQ   CODE_2795A8           
                    JMP.w CODE_27971E           

CODE_2795A8:        JSR.w CODE_279886           
                    BIT.b $17                   
                    BVC   $03                   
CODE_2795AF:        JMP.w CODE_279670           

CODE_2795B2:        LDA.w $0571                 
                    BNE   CODE_2795AF           
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDA.b #$0C                  
                    STA.w $0557                 
                    LDA.b #$10                  
                    STA.w $0520,x               
                    LDA.w $0671,x               
                    CMP.b #$50                  
                    BEQ   CODE_2795D1           
                    CMP.b #$55                  
                    BNE   CODE_2795F7           
CODE_2795D1:        LDA.b #$02                  
                    STA.w $0661,x               
                    LDA.b #$E0                  
                    STA.b $9E,x                 
                    JSL.l CODE_27A837           
                    LDA.w $AFC1,y               
                    STA.b $8C,x                 
                    EOR.b $8B                   
                    BMI   CODE_2795F4           
                    LDA.b $8B                   
                    STA.b $00                   
                    ASL.b $00                   
                    ROR   A                     
                    CLC                         
                    ADC.w $AFBD,y               
                    STA.b $8C,x                 
CODE_2795F4:        JMP.w CODE_279EA0           

CODE_2795F7:        LDA.b #$00                  
                    STA.w $05F5,x               
                    LDA.w $0661,x               
                    CMP.b #$04                  
                    BNE   CODE_27963E           
                    LDA.w $0671,x               
                    CMP.b #$5C                  
                    BEQ   CODE_279634           
                    LDY.b #$01                  
                    LDA.b $BD                   
                    BNE   CODE_279612           
                    LDY.b #$FF                  
CODE_279612:        STY.b $8C,x                 
                    JSL.l CODE_278B93           
                    LDA.b $A7,x                 
                    AND.b #$03                  
                    BEQ   CODE_279634           
                    LDA.b #$05                  
                    JSL.l CODE_278A94           
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$C0                  
                    STA.b $9E,x                 
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    JMP.w CODE_27971E           

CODE_279634:        LDY.b #$00                  
                    LDA.b $BD                   
                    BEQ   CODE_27963B           
                    INY                         
CODE_27963B:        JMP.w CODE_279647           

CODE_27963E:        JSL.l CODE_27A837           
                    LDA.w $AFBF,y               
                    STA.b $BD                   
CODE_279647:        LDA.w $AFBD,y               
                    STA.b $8C,x                 
                    EOR.b $8B                   
                    BMI   CODE_27965D           
                    LDA.b $8B                   
                    STA.b $00                   
                    ASL.b $00                   
                    ROR   A                     
                    CLC                         
                    ADC.w $AFBD,y               
                    STA.b $8C,x                 
CODE_27965D:        LDA.w $0661,x               
                    CMP.b #$06                  
                    BEQ   CODE_279669           
                    LDA.b #$05                  
                    STA.w $0661,x               
CODE_279669:        LDA.b #$00                  
                    STA.b $9E,x                 
                    JMP.w CODE_27971E           

CODE_279670:        LDA.b #$01                  
                    STA.w $06A4                 
                    LDA.w $0571                 
                    BEQ   CODE_27967E           
                    LDY.b #$0A                  
                    BNE   CODE_27969B           
CODE_27967E:        LDY.b #$00                  
                    LDA.b $BD                   
                    BNE   CODE_279685           
                    INY                         
CODE_279685:        LDA.w $1FF9,x               
                    BEQ   CODE_27968F           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_27968F:        LDA.w $0558                 
                    BEQ   CODE_2796A4           
                    INY                         
                    INY                         
                    CMP.b #$05                  
                    BCC   CODE_27969B           
                    INY                         
CODE_27969B:        REP   #$20                  
                    LDA.w #$0020                
                    STA.b $C6,x                 
                    SEP   #$20                  
CODE_2796A4:        LDA.b $5E                   
                    CLC                         
                    ADC.w $AFC3,y               
                    STA.b $5F,x                 
                    LDA.b $43                   
                    ADC.w $AFCE,y               
                    STA.b $44,x                 
                    LDA.b #$FE                  
                    LDY.w $1FF9,x               
                    BNE   CODE_2796C2           
                    LDA.b #$0D                  
                    LDY.b $BB                   
                    BNE   CODE_2796C2           
                    LDA.b #$0F                  
CODE_2796C2:        PHA                         
                    CLC                         
                    ADC.b $70                   
                    STA.b $71,x                 
                    LDY.b #$00                  
                    PLA                         
                    BPL   CODE_2796CE           
                    DEY                         
CODE_2796CE:        TYA                         
                    ADC.b $55                   
                    STA.b $56,x                 
                    LDA.b $8B                   
                    STA.b $8C,x                 
                    LDA.b $9D                   
                    STA.b $9E,x                 
                    JSL.l CODE_278B93           
                    JSL.l CODE_279DC2           
                    JSR.w CODE_27A6EF           
                    BCC   CODE_27971E           
                    LDA.w $0520,x               
                    ORA.w $0571                 
                    BNE   CODE_27971E           
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$D0                  
                    STA.b $9E,x                 
                    LDA.b #$06                  
                    STA.w $0661,y               
                    LDA.b #$D0                  
                    STA.w $9E,y               
                    LDA.b #$00                  
                    JSL.l CODE_278A8A           
                    LDA.b #$10                  
                    STA.w $0520,x               
                    TYA                         
                    TAX                         
                    JSL.l CODE_27A837           
                    LDA.w $AFD9,y               
                    STA.b $8C,x                 
CODE_27971E:        LDX.b $9B                   
                    LDA.b $BF                   
                    BNE   CODE_27972B           
                    LDA.w $0851                 
                    CMP.b #$F0                  
                    BEQ   CODE_279749           
CODE_27972B:        LDA.w $0679,x               
                    ORA.b #$20                  
                    STA.b $D8                   
                    LDA.w $0571                 
                    AND.b #$80                  
                    BEQ   CODE_279741           
                    LDA.b $D8                   
                    AND.b #$CF                  
                    ORA.b #$10                  
                    STA.b $D8                   
CODE_279741:        LDA.b $D8                   
                    STA.w $0679,x               
                    JSR.w CODE_279254           
CODE_279749:        RTS                         

CODE_27974A:        JSR.w CODE_2797F9           
                    LDY.w $0671,x               
                    LDA.w $B317,y               
                    AND.b #$0F                  
                    BEQ   CODE_279762           
                    CPX.b #$05                  
                    BCS   CODE_279762                   
                    PHA                         
                    LDA.b #$02                  
                    STA.w $0669,x               
                    PLA                         
CODE_279762:        JSL.l CODE_20FB1F           

                    dw CODE_27977A
                    dw CODE_2797B8
                    dw CODE_2797B2
                    dw CODE_2797AC
                    dw CODE_2797A5
                    dw CODE_279781
                    dw CODE_27978D
                    dw CODE_279794
                    dw CODE_27979F
                    dw CODE_279788

CODE_27977A:        JSL.l CODE_279D6E
                    JMP.w CODE_2797BB           

CODE_279781:        JSL.l CODE_279D44           
                    JMP.w CODE_2797BB           

CODE_279788:        JSL.l CODE_279D44           
                    RTS                         

CODE_27978D:        JSL.l CODE_22C964           
                    JMP.w CODE_2797BB           

CODE_279794:        LDA.b #$08                  
                    STA.w $0661,x               
                    LDA.b #$1F                  
                    STA.w $0518,x               
                    RTS                         

CODE_27979F:        JSR.w CODE_279EA0           
                    JMP.w CODE_2797F0           

CODE_2797A5:        JSL.l CODE_279EE1           
                    JMP.w CODE_2797BB           

CODE_2797AC:        JSR.w CODE_279F11           
                    JMP.w CODE_2797BB           

CODE_2797B2:        JSR.w CODE_279EBF           
                    JMP.w CODE_2797BB           

CODE_2797B8:        JSR.w CODE_279EA0           
CODE_2797BB:        LDA.b $9C                   
                    BNE   CODE_2797F8           
                    LDA.w $06EB,x               
                    BEQ   CODE_2797E8           
                    INC.w $06EB,x               
                    CMP.b #$90                  
                    BNE   CODE_2797CE           
                    JMP.w CODE_279C33           

CODE_2797CE:        LDA.b #$04                  
                    STA.b $9E,x                 
                    JSL.l CODE_27A7E4           
                    LDA.w $0679,x               
                    AND.b #$CF                  
                    ORA.b #$10                  
                    STA.w $0679,x               
                    CPX.b #$05                  
                    BCC   CODE_2797E7           
                    JMP.w CODE_27A31F           

CODE_2797E7:        RTS                         

CODE_2797E8:        LDA.w $0679,x               
                    ORA.b #$80                  
                    STA.w $0679,x               
CODE_2797F0:        LDA.b $9C                   
                    BNE   CODE_2797F8           
                    JSL.l CODE_27983B           
CODE_2797F8:        RTS                         

CODE_2797F9:        LDA.w $0425                 
                    BEQ   CODE_279804           
                    LDA.b $83,x                 
                    CMP.b #$C8                  
                    BCC   CODE_2797F8           
CODE_279804:        LDA.b $56,x                 
                    CMP.b #$02                  
                    BMI   CODE_2797F8           
                    PLA                         
                    PLA                         
CODE_27980C:        JMP.w CODE_279C5F           

CODE_27980F:        LDA.w $06A6,x               
                    BEQ   CODE_279838           
                    JSL.l CODE_27983B           
                    LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_279824           
                    JSL.l CODE_278B67           
                    STA.b $8C,x                 
CODE_279824:        LDA.b #$03                  
                    STA.w $0669,x               
                    LDA.w $0671,x               
                    CMP.b #$72                  
                    BNE   CODE_279833           
                    JMP.w CODE_279EBF           

CODE_279833:        JSL.l CODE_22C964           
                    RTS                         

CODE_279838:        JMP.w CODE_279C5F           

CODE_27983B:        LDA.b $8C,x                 
                    PHA                         
                    LDY.w $06B7,x               
                    BEQ   CODE_27984D           
                    LDY.w $0661,x               
                    CPY.b #$02                  
                    BEQ   CODE_27984D           
                    ASL   A                     
                    ROR.b $8C,x                 
CODE_27984D:        JSL.l CODE_27A7EF           
                    PLA                         
                    STA.b $8C,x                 
                    JSL.l CODE_27A7E4           
                    JSL.l CODE_278B9B           
                    LDY.w $06B7,x               
                    LDA.b $9E,x                 
                    BPL   CODE_279871           
                    CPY.b #$00                  
                    BEQ   CODE_279871           
                    CMP.b #$E8                  
                    BCS   CODE_279871                   
                    LDA.b #$E8                  
                    STA.b $9E,x                 
                    BNE   CODE_279871           
CODE_279871:        LDA.b $9E,x                 
                    CLC                         
                    ADC.w $AFDD,y               
                    STA.b $9E,x                 
                    BMI   CODE_279885           
                    CMP.w $AFDB,y               
                    BCC   CODE_279885           
                    LDA.w $AFDB,y               
                    STA.b $9E,x                 
CODE_279885:        RTL                         

CODE_279886:        LDA.w $0671,x               
                    CMP.b #$50                  
                    BEQ   CODE_279891           
                    CMP.b #$55                  
                    BNE   CODE_2798A8           
CODE_279891:        LDA.w $0518,x               
                    BNE   CODE_2798A0           
                    LDA.b #$02                  
                    STA.w $0661,x               
                    JSL.l CODE_28D485           
                    RTS                         

CODE_2798A0:        CMP.b #$40                  
                    BCS   CODE_2798A7                   
                    STA.w $0769,x               
CODE_2798A7:        RTS                         

CODE_2798A8:        CMP.b #$5C                  
                    BNE   CODE_2798C7           
                    LDA.w $06A6,x               
                    BNE   CODE_2798B4           
                    JMP.w CODE_279794           

CODE_2798B4:        CMP.b #$60                  
                    BCS   CODE_2798C3                   
                    CMP.b #$30                  
                    BCS   CODE_2798C2                   
                    CMP.b #$10                  
                    BCS   CODE_2798C1                   
                    LSR   A                     
CODE_2798C1:        LSR   A                     
CODE_2798C2:        LSR   A                     
CODE_2798C3:        STA.w $0769,x               
                    RTS                         

CODE_2798C7:        LDA.w $06A6,x               
                    BNE   CODE_279904           
                    LDA.w $0661,x               
                    CMP.b #$04                  
                    BNE   CODE_2798F0           
                    JSL.l CODE_278B93           
                    LDA.b $A7,x                 
                    BEQ   CODE_2798F0           
                    LDA.b #$05                  
                    JSL.l CODE_278A94           
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$C0                  
                    STA.b $9E,x                 
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    BEQ   CODE_2798FF           
CODE_2798F0:        LDA.b #$02                  
                    STA.w $0661,x               
                    JSL.l CODE_27A837           
                    LDA.w $AFDF,y               
                    STA.w $0679,x               
CODE_2798FF:        PLA                         
                    PLA                         
                    JMP.w CODE_279251           

CODE_279904:        RTS                         

CODE_279905:        LDA.b $8C,x                 
                    JSL.l CODE_27A859           
                    STA.b $8C,x                 
CODE_27990D:        LDA.w $0679,x               
                    EOR.b #$40                  
                    STA.w $0679,x               
                    RTL                         

CODE_279916:        JSL.l CODE_27A85F           
                    BNE   CODE_279984           
                    LDA.w $1F76                 
                    CMP.b #$F3                  
                    BNE   CODE_27997A           
                    LDA.b #$D0                  
                    STA.b $9E,x                 
                    JSL.l CODE_27A837           
                    LDA.w $AFE1,y               
                    STA.b $8C,x                 
                    LDA.b #$80                  
                    STA.w $0679,x               
                    LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$40                  
                    BNE   CODE_27994B           
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$00                  
                    JSL.l CODE_278A8A           
                    RTS                         

CODE_27994B:        PHX                         
                    REP   #$30                  
                    LDA.w $0671,x               
                    AND.w #$00FF                
                    STA.b $D8                   
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    LDA.l $288438,x             
                    STA.b $D8                   
                    SEP   #$30                  
                    PLX                         
                    LDA.b $D9                   
                    AND.b #$F8                  
                    CMP.b #$08                  
                    BNE   CODE_279977           
                    LDA.b $D8                   
                    STA.w $0671,x               
                    LDA.b #$00                  
                    JSL.l CODE_278A8A           
CODE_279977:        JMP.w CODE_279AEE           

CODE_27997A:        JSR.w CODE_27A31B           
                    LDA.b #$00                  
                    STA.w $0797,x               
                    BCS   CODE_279985                   
CODE_279984:        RTS                         

CODE_279985:        LDA.w $0520,x               
                    BNE   CODE_279984           
                    LDA.w $0545                 
                    BNE   CODE_27999B           
                    LDY.w $0671,x               
                    LDA.w $B0FB,y               
                    AND.b #$02                  
                    BEQ   CODE_2799D8           
                    BNE   CODE_2799C5           
CODE_27999B:        JSR.w CODE_2799D8           
                    LDA.w $0661,x               
                    CMP.b #$02                  
                    BEQ   CODE_2799C4           
                    STA.b $03                   
                    JSR.w CODE_27A679           
                    LDA.w $0783,x               
                    AND.b #$1F                  
                    ADC.b #$B4                  
                    STA.b $9E,x                 
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b $8B                   
                    STA.b $00                   
                    ASL.b $00                   
                    ROR   A                     
                    CLC                         
                    ADC.b $8C,x                 
                    STA.b $8C,x                 
CODE_2799C4:        RTS                         

CODE_2799C5:        LDA.b $A6                   
                    BNE   CODE_2799D8           
                    LDA.b $9E,x                 
                    CMP.b #$0A                  
                    BMI   CODE_2799D2           
CODE_2799CF:        JMP.w CODE_279AF9           

CODE_2799D2:        LDA.b $A7,x                 
                    AND.b #$04                  
                    BNE   CODE_2799CF           
CODE_2799D8:        LDY.b #$11                  
                    LDA.w $0671,x               
                    CMP.b #$6B                  
                    BEQ   CODE_2799EE           
                    CMP.b #$64                  
                    BEQ   CODE_2799EE           
                    LDY.b #$13                  
                    LDA.w $1FF9,x               
                    BEQ   CODE_2799EE           
                    LDY.b #$08                  
CODE_2799EE:        STY.b $01                   
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b $01                   
                    ROL.b $00                   
                    CMP.b $70                   
                    PHP                         
                    LSR.b $00                   
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    PLP                         
                    SBC.b $55                   
                    BMI   CODE_2799CF           
                    LDA.b $9D                   
                    BPL   CODE_279A13           
                    LDA.w $056E                 
                    BNE   CODE_279A13           
                    LDA.w $05F4                 
                    BEQ   CODE_2799CF           
CODE_279A13:        LDA.b #$01                  
                    STA.w $0797,x               
                    LDA.w $0575                 
                    BNE   CODE_279A27           
                    LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$20                  
                    BEQ   CODE_279A32           
CODE_279A27:        LDA.w $0577                 
                    ORA.w $057A                 
                    BNE   CODE_279A32           
                    JMP.w CODE_279B1D           

CODE_279A32:        LDY.w $0671,x               
                    LDA.w $B0FB,y               
                    AND.b #$04                  
                    BNE   CODE_279A74           
                    LDA.w $057A                 
                    ORA.w $0577                 
                    BEQ   CODE_279A5B           
                    JSR.w CODE_279A75           
                    LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$10                  
                    BEQ   CODE_279A55           
                    LDA.b #$03                  
                    BNE   CODE_279A57           
CODE_279A55:        LDA.b #$06                  
CODE_279A57:        STA.w $0661,x               
                    RTS                         

CODE_279A5B:        LDA.w $0661,x               
                    CMP.b #$03                  
                    BNE   CODE_279A75           
CODE_279A62:        LDA.w $05F4                 
                    INC.w $05F4                 
                    JSL.l CODE_278A8A           
                    JSR.w CODE_2795B2           
                    LDA.b #$00                  
                    STA.w $0557                 
CODE_279A74:        RTS                         

CODE_279A75:        LDA.b #$08                  
                    STA.w $0520,x               
                    LDA.b #$C0                  
                    STA.b $9D                   
                    LDA.b #$02                  
                    STA.w $1200                 
                    DEC.w $1CF6,x               
                    BPL   CODE_279A74           
                    PHX                         
                    REP   #$30                  
                    LDA.w $0671,x               
                    AND.w #$00FF                
                    STA.b $D8                   
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    LDA.l $288438,x             
                    STA.b $D8                   
                    SEP   #$30                  
                    PLX                         
                    LDA.b $D9                   
                    AND.b #$F4                  
                    CMP.b #$04                  
                    BNE   CODE_279AB1           
                    LDA.w $05F4                 
                    CLC                         
                    ADC.b #$04                  
                    BNE   CODE_279AB4           
CODE_279AB1:        LDA.w $05F4                 
CODE_279AB4:        INC.w $05F4                 
                    JSL.l CODE_278A8A           
                    LDA.b $D9                   
                    AND.b #$F8                  
                    CMP.b #$08                  
                    BNE   CODE_279ACE           
                    LDA.b $D8                   
                    STA.w $0671,x               
                    INC.w $1CF6,x               
                    JMP.w CODE_279AE6           

CODE_279ACE:        LDY.w $0671,x               
                    LDA.w $B0FB,y               
                    AND.b #$01                  
                    BEQ   CODE_279AEB           
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$00                  
                    STA.b $8C,x                 
CODE_279AE6:        LDA.b #$00                  
                    STA.b $9E,x                 
                    RTS                         

CODE_279AEB:        INC.w $1CF6,x               
CODE_279AEE:        LDA.b #$03                  
                    STA.w $0661,x               
                    LDA.b #$FF                  
                    STA.w $06A6,x               
                    RTS                         

CODE_279AF9:        LDA.w $0661,x               
                    CMP.b #$03                  
                    BNE   CODE_279B1D           
                    LDA.w $0577                 
                    ORA.w $057A                 
                    BEQ   CODE_279B0B           
                    JMP.w CODE_279A62           

CODE_279B0B:        LDA.w $06A5                 
                    BNE   CODE_279B6A           
                    BIT.b $17                   
                    BVS   CODE_279B17           
                    JMP.w CODE_2795B2           

CODE_279B17:        LDA.b #$04                  
                    STA.w $0661,x               
                    RTS                         

CODE_279B1D:        LDA.w $0552                 
                    ORA.w $057A                 
                    ORA.w $0520,x               
                    ORA.w $0553                 
                    BNE   CODE_279B6A           
                    LDA.w $0661,x               
                    CMP.b #$05                  
                    BNE   CODE_279B4B           
                    LDY.b #$00                  
                    LDA.b $8B                   
                    BEQ   CODE_279B4B           
                    BPL   CODE_279B3B           
                    INY                         
CODE_279B3B:        STY.b $00                   
                    EOR.b $8C,x                 
                    BMI   CODE_279B4B           
                    JSL.l CODE_27A837           
                    CPY.b $00                   
                    BNE   CODE_279B6A           
                    BEQ   CODE_279B66           
CODE_279B4B:        LDY.w $0671,x               
                    LDA.w $AE78,y               
                    AND.b #$10                  
                    BEQ   CODE_279B66           
                    JSL.l CODE_27A837           
                    LDA.w $0679,x               
                    AND.b #$BF                  
                    DEY                         
                    BEQ   CODE_279B63           
                    ORA.b #$40                  
CODE_279B63:        STA.w $0679,x               
CODE_279B66:        JSL.l CODE_27A4C6           
CODE_279B6A:        RTS                         

CODE_279B6B:        JSR.w CODE_279916           
                    RTL                         

CODE_279B6F:        JSR.w CODE_27997A           
                    RTL                         

CODE_279B73:        JSR.w CODE_279A75           
                    RTL                         

CODE_279B77:        JSR.w CODE_279AEE           
                    RTL                         

CODE_279B7B:        RTS                         

CODE_279B7C:        RTL                         

CODE_279B7D:        JSL.l CODE_279B82           
                    RTS                         

CODE_279B82:        JSL.l CODE_279C96         ;Sprite INIT Routines
                    INC.w $0661,x               
                    JSL.l CODE_279BB7           
                    PHX                         
                    REP   #$30                ;\
                    LDA.w $0671,x             ; |
                    AND.w #$00FF              ; |
                    STA.b $00                 ; |
                    ASL   A                   ; |
                    CLC                       ; |
                    ADC.b $00                 ; |Sprite # to 24-bit pointer index
                    TAX                       ; | then jump to pointer code.
                    SEP   #$20                ; |
                    LDA   PNTR_288000,x    ; |
                    STA.b $00                 ; |
                    LDA   PNTR_288000+1,x  ; |
                    STA.b $01                 ; |
                    LDA   PNTR_288000+2,x  ; |
                    STA.b $02                 ; |
                    SEP   #$10                ; |
                    PLX                       ; |
                    JML.w [$0000]             ;/


CODE_279BB7:        LDY.w $0671,x             ;\
                    LDA.w $B263,y             ; |$21:B263, NOT bank $27
                    AND.b #$07                ; |
                    STA.w $1FE9,x             ; |
                    RTL                       ;/

CODE_279BC3:        JSR.w CODE_279BDF           
                    RTL                         

CODE_279BC7:        JSR.w CODE_279BDB           
                    RTL                         

CODE_279BCB:        JSR.w CODE_279BD7           
                    RTL                         

CODE_279BCF:        JSR.w CODE_279C33           
                    RTL                         

CODE_279BD3:        JSR.w CODE_279C52           
                    RTL                         

CODE_279BD7:        LDA.b #$04                  
                    BNE   CODE_279BEE           
CODE_279BDB:        LDA.b #$02                  
                    BNE   CODE_279BEE           
CODE_279BDF:        LDA.w $1FF1,x               
                    BEQ   CODE_279BEC           
                    LDA.w $0651,x               
                    BNE   CODE_279BDB           
                    STA.w $1FF1,x               
CODE_279BEC:        LDA.b #$00                  
CODE_279BEE:        STA.b $00                   
                    JSL.l CODE_27A85F           
                    BEQ   CODE_279C64           
                    LDA.w $0425                 
                    BNE   CODE_279C65           
                    LDA.b $56,x                 
                    CMP.b #$02                  
                    BPL   CODE_279C33           
                    TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCS   CODE_279C64                   
                    AND.b #$01                  
                    STA.b $01                   
                    ADC.b $00                   
                    TAY                         
                    LDA.w $0210                 
                    CLC                         
                    ADC.w $AFE7,y               
                    ROL.b $00                   
                    CMP.b $5F,x                 
                    PHP                         
                    LDA.b $12                   
                    LSR.b $00                   
                    ADC.w $AFED,y               
                    PLP                         
                    SBC.b $44,x                 
                    STA.b $00                   
                    LDY.b $01                   
                    BEQ   CODE_279C2F           
                    EOR.b #$80                  
                    STA.b $00                   
CODE_279C2F:        LDA.b $00                   
                    BPL   CODE_279C64           
CODE_279C33:        LDA.w $0671,x               
                    CMP.b #$58                  
                    BEQ   CODE_279C4A           
                    CMP.b #$4F                  
                    BEQ   CODE_279C4A           
                    CMP.b #$6A                  
                    BEQ   CODE_279C4A           
                    CMP.b #$61                  
                    BEQ   CODE_279C4A           
                    CMP.b #$59                  
                    BNE   CODE_279C52           
CODE_279C4A:        LDY.w $0771,x               
                    LDA.b #$00                  
                    STA.w $06B4,y               
CODE_279C52:        LDY.w $0659,x               
                    BMI   CODE_279C5F           
                    LDA.w $1B10,y               
                    AND.b #$7F                  
                    STA.w $1B10,y               
CODE_279C5F:        LDA.b #$00                  
                    STA.w $0661,x               
CODE_279C64:        RTS                         

CODE_279C65:        LDA.b $15                   
                    LSR   A                     
                    BCS   CODE_279C64                   
                    AND.b #$01                  
                    STA.b $01                   
                    TAY                         
                    LDA.w $0543                 
                    CLC                         
                    ADC.w $AFE3,y               
                    ROL.b $00                   
                    CMP.b $71,x                 
                    PHP                         
                    LDA.w $0542                 
                    LSR.b $00                   
                    ADC.w $AFE5,y               
                    PLP                         
                    SBC.b $56,x                 
                    STA.b $00                   
                    LDY.b $01                   
                    BEQ   CODE_279C90           
                    EOR.b #$80                  
                    STA.b $00                   
CODE_279C90:        LDA.b $00                   
                    BPL   CODE_279C64           
                    BMI   CODE_279C33           
CODE_279C96:        STZ.w $0691,x               
                    LDA.w $0671,x               
                    CMP.b #$7F                  
                    BEQ   CODE_279CA4           
                    CMP.b #$7D                  
                    BNE   CODE_279CA9           
CODE_279CA4:        LDA.b $71,x                 
                    STA.w $0691,x               
CODE_279CA9:        LDA.b #$00                  
                    STA.w $0689,x               
                    STA.b $7A,x                 
                    STA.w $0518,x               
                    STA.w $0520,x               
                    STA.b $8C,x                 
                    STA.b $9E,x                 
                    STA.w $0679,x               
                    STA.w $0669,x               
                    STA.w $0769,x               
                    STA.b $A7,x                 
                    CPX.b #$06                  
                    BCS   CODE_279CD5                   
                    STA.w $1A49,x               
                    STA.w $1A4F,x               
                    STA.w $06EB,x               
                    STA.w $06B7,x               
CODE_279CD5:        CPX.b #$05                  
                    BCS   CODE_279D13                   
                    STA.w $0797,x               
                    STA.w $06AB,x               
                    STA.w $06A6,x               
                    STA.w $07B6,x               
                    STA.w $1021,x               
                    STA.b $68,x                 
                    STA.b $4D,x                 
                    STA.w $1FD2,x               
                    STA.w $0771,x               
                    STA.w $0776,x               
                    STA.w $077B,x               
                    STA.w $1FF9,x               
                    STA.w $1FF1,x               
                    STA.w $1CF6,x               
                    STA.w $1A49,x               
                    STA.w $1CC8,x               
                    STA.w $1CCD,x               
                    STA.w $1CD2,x               
                    STA.w $1CD7,x               
                    STA.w $1CDC,x               
CODE_279D13:        RTL                         

CODE_279D14:        LDA.b $9C                   
                    BEQ   CODE_279D3F           
                    LDA.w $0671,x               
                    CMP.b #$2E                  
                    BNE   CODE_279D23           
                    LDA.b $68,x                 
                    BEQ   CODE_279D2B           
CODE_279D23:        CMP.b #$2F                  
                    BEQ   CODE_279D2B           
                    JSL.l CODE_279D6E           
CODE_279D2B:        LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$0F                  
                    CMP.b #$05                  
                    BEQ   CODE_279D3F           
                    LDA.w $0661,x               
                    CMP.b #$02                  
                    BEQ   CODE_279D3F           
                    RTS                         

CODE_279D3F:        JSL.l CODE_279D44           
                    RTS                         

CODE_279D44:        PHX                       ;Sprite MAIN Routines
                    REP   #$30                  
                    LDA.w $0671,x               
                    AND.w #$00FF                
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    SEP   #$20                  
                    LDA   PNTR_28821C,x             
                    STA.b $00                   
                    LDA   PNTR_28821C+1,x             
                    STA.b $01                   
                    LDA   PNTR_28821C+2,x             
                    STA.b $02                   
                    SEP   #$10                  
                    PLX                         
                    JML.w [$0000]               


CODE_279D6E:        PHX                         
                    LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$0F                  
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    LDA   PNTR_279D94,x             
                    STA.b $00                   
                    LDA   PNTR_279D94+1,x             
                    STA.b $01                   
                    LDA   PNTR_279D94+2,x             
                    STA.b $02                   
                    PLX                         
                    JML.w [$0000]               

PNTR_279D94:        dl CODE_28B625
            dl CODE_279EBB
            dl CODE_279F51
            dl CODE_28BB64
            dl CODE_279B7C
            dl CODE_279DC1
            dl CODE_279F6B
            dl CODE_279B7C
            dl CODE_28BFD9
            dl CODE_279B7C
            dl CODE_279EDD
            dl CODE_28CE71
            dl CODE_279B7C
            dl CODE_28B3A6
            dl CODE_28BD52           

CODE_279DC1:        RTL                         

CODE_279DC2:        LDA.b $71,x                 
                    SEC                         
                    SBC.w $0543                 
                    STA.b $83,x                 
                    LDA.b $5F,x                 
                    SEC                         
                    SBC.w $0210                 
                    STA.b $7A,x                 
                    RTL                         

CODE_279DD3:        LDA.b $A7,x                 
                    AND.b #$04                  
                    BNE   CODE_279DF7           
CODE_279DD9:        LDA.w $05FC                 
                    BEQ   CODE_279DF7           
                    LDA.w $0424                 
                    CMP.b #$01                  
                    BEQ   CODE_279DF7           
                    LDY.b #$00                  
                    LDA.w $0780                 
                    BPL   CODE_279DED           
                    DEY                         
CODE_279DED:        CLC                         
                    ADC.b $71,x                 
                    STA.b $71,x                 
                    TYA                         
                    ADC.b $56,x                 
                    STA.b $56,x                 
CODE_279DF7:        RTL                         

CODE_279DF8:        LDA.b $71,x                 
                    SEC                         
                    SBC.w $0543                 
                    STA.b $83,x                 
                    STA.b $00                   
                    SEC                         
                    LDA.w $06AB,x               
                    BEQ   CODE_279E0F           
                    CMP.b #$40                  
                    BCC   CODE_279E0E           
                    LSR   A                     
                    LSR   A                     
CODE_279E0E:        LSR   A                     
CODE_279E0F:        LDA.b $5F,x                 
                    SBC.w $0210                 
                    STA.b $7A,x                 
                    STA.b $01                   
                    LDA.w $0679,x               
                    STA.b $02                   
                    AND.b #$30                  
                    CMP.b #$10                  
                    BEQ   CODE_279E27           
                    LDA.b #$20                  
                    TSB.b $02                   
CODE_279E27:        LDY.w $0671,x               
                    LDA.w $B3CB,y               
                    AND.b #$01                  
                    TSB.b $02                   
                    LDY.w $0418                 
                    LDA.w $0769,x               
                    BEQ   CODE_279E57           
                    DEC.w $0769,x               
                    LDA.w $0671,x               
                    CMP.b #$19                  
                    BEQ   CODE_279E57           
                    CMP.b #$4B                  
                    BEQ   CODE_279E51           
                    CMP.b #$4C                  
                    BEQ   CODE_279E51           
                    JSL.l CODE_27AA8D           
                    BRA   CODE_279E55           

CODE_279E51:        JSL.l CODE_27AA74           
CODE_279E55:        BPL   CODE_279E5A           
CODE_279E57:        LDA.w $1FE9,x               
CODE_279E5A:        ASL   A                     
                    STA.b $03                   
                    LDA.w $0671,x               
                    CMP.b #$55                  
                    BNE   CODE_279E66           
                    INC.b $03                   
CODE_279E66:        LDA.w $0681,x               
                    STA.b $04                   
                    LDA.w $0651,x               
                    STA.b $07                   
                    LDA.w $0669,x               
                    ASL   A                     
                    STA.b $05                   
                    LDA.b $DE                   
                    ASL   A                     
                    CLC                         
                    ADC.b $DE                   
                    TAX                         
                    LDA.l $21B47F,x             
                    STA.b $D8                   
                    LDA.l $21B480,x             
                    STA.b $D9                   
                    LDA.l $21B481,x             
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    CLC                         
                    ADC.b $05                   
                    STA.b $05                   
                    TAX                         
                    LDY.b $9B                   
                    LDA.w $C6,y               
                    STA.b $06                   
                    TAY                         
                    RTL                         

CODE_279EA0:        JSL.l CODE_279DF8           
                    JSL.l CODE_279F90           
                    LDX.b $9B                   
                    LDA.w $0671,x               
                    CMP.b #$2F                  
                    BNE   CODE_279EBA           
                    LDA.w $0661,x               
                    CMP.b #$06                  
                    JSL.l CODE_29A412           
CODE_279EBA:        RTS                         

CODE_279EBB:        JSR.w CODE_279EA0           
                    RTL                         

CODE_279EBF:        JSR.w CODE_279EA0           
                    REP   #$10                  
                    LDY.w $00C6,x               
                    LDA.w $0803,y               
                    AND.b #$BF                  
                    STA.w $0803,y               
                    STA.w $080B,y               
                    ORA.b #$40                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    SEP   #$10                  
                    RTS                         

CODE_279EDD:        JSR.w CODE_279EBF           
                    RTL                         

CODE_279EE1:        JSR.w CODE_279F11           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.w $07F3,y               
                    AND.b #$BF                  
                    STA.w $07F3,y               
                    STA.w $07FB,y               
                    ORA.b #$40                  
                    STA.w $07F7,y               
                    STA.w $07FF,y               
                    LDA.w $0803,y               
                    AND.b #$BF                  
                    STA.w $0803,y               
                    STA.w $080B,y               
                    ORA.b #$40                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    SEP   #$10                  
                    RTL                         

CODE_279F11:        JSL.l CODE_279DF8           
                    LDX.b $9B                   
                    LDA.w $0669,x               
                    ASL   A                     
                    CLC                         
                    ADC.b $05                   
                    STA.b $05                   
                    TAX                         
                    LDA.b $02                   
                    BPL   CODE_279F27           
                    INX                         
                    INX                         
CODE_279F27:        JSL.l CODE_279F90           
                    REP   #$20                  
                    LDX.b $9B                   
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0010                
                    STA.b $C6,x                 
                    SEP   #$20                  
                    LSR.b $04                   
                    LDX.b $05                   
                    LDA.b $02                   
                    BMI   CODE_279F43           
                    INX                         
                    INX                         
CODE_279F43:        LDA.b #$10                  
                    CLC                         
                    ADC.b $00                   
                    STA.b $00                   
                    JSL.l CODE_279F90           
                    LDX.b $9B                   
                    RTS                         

CODE_279F51:        JSR.w CODE_279F11           
                    RTL                         

CODE_279F55:        JSL.l CODE_279DF8           
                    LDX.b $9B                   
                    LDA.w $0669,x               
                    CLC                         
                    ADC.b $05                   
                    STA.b $05                   
                    TAX                         
                    JSL.l CODE_27A079           
                    LDX.b $9B                   
                    RTS                         

CODE_279F6B:        JSR.w CODE_279F55           
                    RTL                         

CODE_279F6F:        LDA.b $8C,x                 
                    BNE   CODE_279F74           
                    RTL                         

CODE_279F74:        BPL   CODE_279F7A           
                    JSL.l CODE_27A859           
CODE_279F7A:        AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $AFF7,y               
                    LDY.b #$00                  
                    AND.b $15                   
                    BEQ   CODE_279F8B           
                    INY                         
CODE_279F8B:        TYA                         
                    STA.w $0669,x               
                    RTL                         

CODE_279F90:        LDY.b $9B                   
                    REP   #$30                  
                    LDA.w $C6,y               
                    TAY                         
                    SEP   #$20                  
                    LDA.b $04                   
                    LSR   A                     
                    BCC   CODE_279FA2           
                    BRL   CODE_27A076           

CODE_279FA2:        LDA.b $00                   
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $0808,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    STA.w $080C,y               
                    PHY                         
                    PHX                         
                    TXY                         
                    REP   #$20                  
                    LDA.b $DE                   
                    AND.w #$00FF                
                    STA.b $D8                   
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    SEP   #$20                  
                    LDA.w $B48E,x               
                    STA.b $D8                   
                    LDA.w $B48F,x               
                    STA.b $D9                   
                    LDA.w $B490,x               
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    PHA                         
                    INY                         
                    LDA.b [$D8],y               
                    STA.b $D9                   
                    PLA                         
                    STA.b $D8                   
                    PLX                         
                    PLY                         
                    LDA.b $D8                   
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $080A,y               
                    LDA.b $D9                   
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b $02                   
                    ORA.b $03                   
                    STA.w $0803,y               
                    STA.w $080B,y               
                    STA.w $0807,y               
                    STA.w $080F,y               
                    BIT.b $02                   
                    BVC   $1C                   
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
                    LDA.w $080A,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $080A,y               
                    PLA                         
                    STA.w $080E,y               
                    BIT.b $02                   
                    BPL   CODE_27A055           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $080A,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $080A,y               
                    LDA.w $0806,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $0806,y               
                    PLA                         
                    STA.w $080E,y               
CODE_27A055:        REP   #$20                  
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $07                   
                    ROL   A                     
                    ROL   A                     
                    PHP                         
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A22,y               
                    PLP                         
                    ROL   A                     
                    AND.b #$01                  
                    STA.w $0A21,y               
                    STA.w $0A23,y               
                    PLY                         
CODE_27A076:        SEP   #$30                  
                    RTL                         

CODE_27A079:        LDY.b $9B                   
                    REP   #$30                  
                    LDA.w $C6,y               
                    TAY                         
                    SEP   #$20                  
                    LDA.b $04                   
                    LSR   A                     
                    BCS   CODE_27A076                   
                    LDA.b $00                   
                    STA.w $0801,y               
                    STA.w $0805,y               
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $080D,y               
                    STA.w $0811,y               
                    STA.w $0815,y               
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $080C,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    STA.w $0810,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,y               
                    STA.w $0814,y               
                    PHY                         
                    PHX                         
                    TXY                         
                    REP   #$20                  
                    LDA.b $DE                   
                    AND.w #$00FF                
                    STA.b $D8                   
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    SEP   #$20                  
                    LDA.w $B48E,x               
                    STA.b $D8                   
                    LDA.w $B48F,x               
                    STA.b $D9                   
                    LDA.w $B490,x               
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    STA.b $DB                   
                    INY                         
                    LDA.b [$D8],y               
                    STA.b $DC                   
                    INY                         
                    LDA.b [$D8],y               
                    STA.b $DD                   
                    PLX                         
                    PLY                         
                    LDA.b $DB                   
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b $DC                   
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $0812,y               
                    LDA.b $DD                   
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0816,y               
                    LDA.b $02                   
                    ORA.b $03                   
                    STA.w $0803,y               
                    STA.w $080F,y               
                    STA.w $0807,y               
                    STA.w $0813,y               
                    STA.w $080B,y               
                    STA.w $0817,y               
                    BIT.b $02                   
                    BPL   CODE_27A14A           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $080E,y               
                    LDA.w $0806,y               
                    PHA                         
                    LDA.w $0812,y               
                    STA.w $0806,y               
                    PLA                         
                    STA.w $0812,y               
                    LDA.w $080A,y               
                    PHA                         
                    LDA.w $0816,y               
                    STA.w $080A,y               
                    PLA                         
                    STA.w $0816,y               
CODE_27A14A:        BIT.b $02                   
                    BVC   $1C                   
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $080A,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $080A,y               
                    LDA.w $080E,y               
                    PHA                         
                    LDA.w $0816,y               
                    STA.w $080E,y               
                    PLA                         
                    STA.w $0816,y               
                    REP   #$20                  
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $07                   
                    ROL   A                     
                    ROL   A                     
                    STA.b $09                   
                    PHP                         
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A23,y               
                    LDA.b $09                   
                    PLP                         
                    ROL   A                     
                    PHP                         
                    AND.b #$01                  
                    STA.w $0A21,y               
                    STA.w $0A24,y               
                    PLP                         
                    ROL   A                     
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A25,y               
                    PLY                         
                    SEP   #$30                  
                    RTL                         

CODE_27A19D:        PHX                         
                    LDY.b #$07                  
CODE_27A1A0:        STY.b $06                   
                    LDX.b $9B                   
                    LDA.w $0783,x               
                    AND.b #$07                  
                    CLC                         
                    ADC.b $06                   
                    TAY                         
                    LDA.w $AFFB,y               
                    TAY                         
                    STY.b $08                   
                    LDA.w $0661,y               
                    BEQ   CODE_27A1D1           
CODE_27A1B8:        LDY.b $06                   
                    DEY                         
                    BPL   CODE_27A1A0           
                    JSR.w CODE_27A202           
                    BCS   CODE_27A1F1                   
                    LDX.b #$20                  
                    LDA.w $0783                 
                    BPL   CODE_27A1CB           
                    LDX.b #$30                  
CODE_27A1CB:        STX.b $D8                   
                    STZ.b $D9                   
                    BRA   CODE_27A1F1           

CODE_27A1D1:        TYA                         
                    CLC                         
                    ADC.w $055D                 
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $AF6E,y               
                    STA.b $D8                   
                    SEP   #$20                  
                    REP   #$10                  
                    LDX.b $D8                   
                    LDA.w $0801,x               
                    CMP.b #$F0                  
                    BEQ   CODE_27A1F1           
                    SEP   #$10                  
                    BRL   CODE_27A1B8           

CODE_27A1F1:        SEP   #$10                  
                    LDX.b $D8                   
                    STX.b $06                   
                    TXY                         
                    PLX                         
                    LDA.b $D8                   
                    STA.b $C6,x                 
                    LDA.b $D9                   
                    STA.b $C7,x                 
                    RTL                         

CODE_27A202:        PHX                         
                    REP   #$30                  
                    LDY.w #$000E                
CODE_27A208:        LDA.w $AF6E,y               
                    STA.b $D8                   
                    TAX                         
                    LDA.w $0801,x               
                    AND.w #$00FF                
                    CMP.w #$00F0                
                    BEQ   CODE_27A222           
                    DEY                         
                    DEY                         
                    BPL   CODE_27A208           
                    SEP   #$30                  
                    PLX                         
                    CLC                         
                    RTS                         

CODE_27A222:        SEP   #$30                  
                    PLX                         
                    SEC                         
                    RTS                         

CODE_27A227:        PHX                         
                    LDA.b $C6,x                 
                    STA.b $DA                   
                    LDA.b $C7,x                 
                    STA.b $DB                   
                    LDY.b #$07                  
CODE_27A232:        STY.b $06                   
                    LDA.w $0661,y               
                    BNE   CODE_27A257           
                    TYA                         
                    CLC                         
                    ADC.w $055D                 
                    ASL   A                     
                    TAY                         
                    REP   #$30                  
                    LDA.w $AF6E,y               
                    CMP.b $DA                   
                    BEQ   CODE_27A257           
                    STA.b $D8                   
                    TAY                         
                    LDA.w $0801,y               
                    AND.w #$00FF                
                    CMP.w #$00F0                
                    BEQ   CODE_27A26B           
CODE_27A257:        SEP   #$30                  
                    LDY.b $06                   
                    DEY                         
                    BPL   CODE_27A232           
                    LDX.b #$20                  
                    LDA.w $0783                 
                    BPL   CODE_27A267           
                    LDX.b #$30                  
CODE_27A267:        STX.b $D8                   
                    STZ.b $D9                   
CODE_27A26B:        SEP   #$30                  
                    LDX.b $D8                   
                    STX.b $06                   
                    TXY                         
                    PLX                         
                    LDA.b $D8                   
                    STA.b $C6,x                 
                    LDA.b $D9                   
                    STA.b $C7,x                 
                    RTL                         

CODE_27A27C:        LDY.w $0671,x               
                    LDA.w $B047,y               
                    AND.b #$70                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_27A289:        LDA.w $0661,x               
                    CMP.b #$02                  
                    BPL   CODE_27A296           
                    LDA.b #$FC                  
                    STA.w $0651,x               
                    RTL                         

CODE_27A296:        LDA.b #$00                  
                    STA.w $0651,x               
CODE_27A29B:        LDA.b $5F,x                 
                    STA.b $0E                   
                    LDA.b $44,x                 
                    STA.b $0F                   
                    REP   #$20                  
                    LDA.w $B00A,y               
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $0E                   
                    SEC                         
                    SBC.w $0210                 
                    CMP.w #$0100                
                    BCC   CODE_27A2C2           
                    SEP   #$20                  
                    LDA.w $0651,x               
                    ORA.w $B010,y               
                    STA.w $0651,x               
CODE_27A2C2:        SEP   #$20                  
                    DEY                         
                    BPL   CODE_27A29B           
                    RTL                         

CODE_27A2C8:        LDY.w $0671,x               
                    LDA.w $B047,y               
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_27A2D3:        LDA.b #$01                  
                    STA.b $02                   
                    LDA.b #$00                  
                    STA.w $0681,x               
                    LDA.b $56,x                 
                    STA.b $00                   
                    LDA.b $71,x                 
                    STA.b $01                   
CODE_27A2E4:        LDA.b $01                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $01                   
                    BCC   CODE_27A2EF           
                    INC.b $00                   
CODE_27A2EF:        LDA.b $01                   
                    SEC                         
                    SBC.w $0543                 
                    STA.b $03                   
                    LDA.b $00                   
                    SBC.w $0542                 
                    BNE   CODE_27A304           
                    LDA.b $03                   
                    CMP.b #$F0                  
                    BCC   CODE_27A30C           
CODE_27A304:        LDA.b $02                   
                    ORA.w $0681,x               
                    STA.w $0681,x               
CODE_27A30C:        ASL.b $02                   
                    DEY                         
                    BPL   CODE_27A2E4           
                    RTL                         

CODE_27A312:        JSR.w CODE_27A31B           
                    RTL                         

CODE_27A316:        JSR.w CODE_27A31F           
                    RTL                         

CODE_27A31A:        RTS                         

CODE_27A31B:        LDA.b #$01                  
                    BRA   CODE_27A321           

CODE_27A31F:        LDA.b #$00                  
CODE_27A321:        STA.b $0F                   
                    LDA.w $0797,x               
                    AND.b #$FC                  
                    STA.w $0797,x               
                    CLC                         
                    LDA.b $BF                   
                    ORA.w $0583                 
                    ORA.w $0587                 
                    BNE   CODE_27A31A           
                    JSL.l CODE_27A413           
                    LDA.b $BB                   
                    BEQ   CODE_27A347           
                    LDA.b #$00                  
                    LDY.w $056F                 
                    BNE   CODE_27A347           
                    LDA.b #$01                  
CODE_27A347:        ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $79                   
                    CLC                         
                    ADC.w $B016,y               
                    STA.b $02                   
                    LDA.b $82                   
                    CLC                         
                    ADC.w $B018,y               
                    STA.b $06                   
                    LDA.w $B017,y               
                    STA.b $03                   
                    LDA.w $B019,y               
                    STA.b $07                   
                    JSL.l CODE_27A45F           
                    BCC   CODE_27A31A           
                    STA.b $00                   
                    LDA.w $0425                 
                    BNE   CODE_27A398           
                    LDA.b $5E                   
                    SEC                         
                    SBC.b $5F,x                 
                    STA.b $0E                   
                    LDA.b $43                   
                    SBC.b $44,x                 
                    STA.b $0D                   
                    BPL   CODE_27A390           
                    LDA.b $0E                   
                    JSL.l CODE_27A859           
                    STA.b $0E                   
                    LDA.b $0D                   
                    EOR.b #$FF                  
                    ADC.b #$00                  
                    STA.b $0D                   
CODE_27A390:        LDA.b $0D                   
                    BNE   CODE_27A407           
                    LDA.b $0E                   
                    BMI   CODE_27A407           
CODE_27A398:        LDA.b $70                   
                    SEC                         
                    SBC.b $71,x                 
                    STA.b $0E                   
                    LDA.b $55                   
                    SBC.b $56,x                 
                    STA.b $0D                   
                    BPL   CODE_27A3B7           
                    LDA.b $0E                   
                    JSL.l CODE_27A859           
                    STA.b $0E                   
                    LDA.b $0D                   
                    EOR.b #$FF                  
                    ADC.b #$00                  
                    STA.b $0D                   
CODE_27A3B7:        LDA.b $0D                   
                    BNE   CODE_27A407           
                    LDA.b $0E                   
                    BMI   CODE_27A407           
                    LDA.b $0B                   
                    LSR   A                     
                    BCC   CODE_27A3D3           
                    LDA.b $00                   
                    SEC                         
                    SBC.b $0A                   
                    CMP.b #$08                  
                    BMI   CODE_27A3D3           
                    LDA.b $0B                   
                    EOR.b #$01                  
                    STA.b $0B                   
CODE_27A3D3:        LDA.b $0B                   
                    ORA.w $0797,x               
                    STA.w $0797,x               
                    LDA.w $0553                 
                    BEQ   CODE_27A409           
                    LDY.w $0671,x               
                    LDA.w $AE78,y               
                    AND.b #$80                  
                    BNE   CODE_27A409           
                    LDA.b #$06                  
                    STA.w $0661,x               
                    LDA.b #$C8                  
                    STA.b $9E,x                 
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDA.b #$05                  
                    JSL.l CODE_278A94           
                    JSL.l CODE_27A837           
                    LDA.w $B01E,y               
                    STA.b $8C,x                 
CODE_27A407:        CLC                         
                    RTS                         

CODE_27A409:        LDA.b $0F                   
                    BNE   CODE_27A411           
                    JSL.l CODE_27A49C           
CODE_27A411:        SEC                         
                    RTS                         

CODE_27A413:        LDY.w $0671,x               
                    LDA.w $AE78,y               
                    AND.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $7A,x                 
                    CLC                         
                    ADC.w $AE38,y               
                    STA.b $00                   
                    LDA.b $83,x                 
                    CLC                         
                    ADC.w $AE3A,y               
                    STA.b $04                   
                    LDA.w $AE39,y               
                    STA.b $01                   
                    LDA.w $AE3B,y               
                    STA.b $05                   
                    RTL                         

CODE_27A439:        LDY.w $0671,x               
                    LDA.w $AE78,y               
                    AND.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $7A,x                 
                    CLC                         
                    ADC.w $AE38,y               
                    STA.b $02                   
                    LDA.b $83,x                 
                    CLC                         
                    ADC.w $AE3A,y               
                    STA.b $06                   
                    LDA.w $AE39,y               
                    STA.b $03                   
                    LDA.w $AE3B,y               
                    STA.b $07                   
                    RTL                         

CODE_27A45F:        LDY.b #$00                  
                    STY.b $0B                   
                    LDA.b $02                   
                    SEC                         
                    SBC.b $00                   
                    STA.b $0A                   
                    ASL   A                     
                    LDA.b $01                   
                    BCC   CODE_27A47B           
                    LDA.b $0A                   
                    EOR.b #$FF                  
                    STA.b $0A                   
                    INC.b $0A                   
                    INC.b $0B                   
                    LDA.b $03                   
CODE_27A47B:        CMP.b $0A                   
                    BCC   CODE_27A49B           
                    ASL.b $0B                   
                    LDA.b $06                   
                    SEC                         
                    SBC.b $04                   
                    STA.b $0A                   
                    ASL   A                     
                    LDA.b $05                   
                    BCC   CODE_27A499           
                    LDA.b $0A                   
                    EOR.b #$FF                  
                    STA.b $0A                   
                    INC.b $0A                   
                    INC.b $0B                   
                    LDA.b $07                   
CODE_27A499:        CMP.b $0A                   
CODE_27A49B:        RTL                         

CODE_27A49C:        REP   #$30                  
                    LDA.w $0671,x               
                    AND.w #$00FF                
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    SEP   #$20                  
                    LDA   PNTR_288438,x             
                    STA.b $00                   
                    LDA   PNTR_288438+1,x             
                    STA.b $01                   
                    LDA   PNTR_288438+2,x             
                    STA.b $02                   
                    SEP   #$10                  
                    LDX.b $9B                   
                    JML.w [$0000]               

CODE_27A4C6:        LDA.w $0552                 
                    ORA.w $057A                 
                    ORA.w $0553                 
                    ORA.w $0554                 
                    ORA.b $9C                   
                    ORA.w $0556                 
                    ORA.w $1CFF                 
                    BEQ   CODE_27A4DF           
                    JMP.w CODE_27A543           

CODE_27A4DF:        LDA.w $0577                 
                    BNE   CODE_27A4EA           
                    LDA.b $BB                   
                    CMP.b #$04                  
                    BMI   CODE_27A515           
CODE_27A4EA:        LDA.b #$0F                  
                    STA.w $1200                 
                    LDA.w $0577                 
                    BEQ   CODE_27A4F8           
                    LDA.b #$00                  
                    BRA   CODE_27A4FD           

CODE_27A4F8:        LDY.b $BB                   
                    LDA.w $B024,y               
CODE_27A4FD:        STA.b $00                   
                    JSR.w CODE_27A57F           
                    LDA.w $0577                 
                    BEQ   CODE_27A50E           
                    LDA.b #$00                  
                    STA.w $0577                 
                    BRA   CODE_27A537           

CODE_27A50E:        LDA.b #$02                  
                    STA.w $0578                 
                    BRA   CODE_27A537           

CODE_27A515:        LDA.b $BB                   
                    BEQ   CODE_27A544           
                    LDA.b #$02                  
                    STA.w $0578                 
                    LDA.b $BB                   
                    CMP.b #$04                  
                    BPL   CODE_27A52B           
                    LDA.b #$04                  
                    STA.w $1200                 
                    LDA.b $BB                   
CODE_27A52B:        CMP.b #$02                  
                    BCS   CODE_27A537                   
                    LDA.b #$2F                  
                    STA.w $0551                 
                    DEC.w $0578                 
CODE_27A537:        LDA.b #$71                  
                    STA.w $0552                 
                    LDA.b #$00                  
                    STA.w $054F                 
                    BEQ   CODE_27A578           
CODE_27A543:        RTL                         

CODE_27A544:        LDX.b $9B                   
CODE_27A546:        LDA.b #$09                  
                    STA.w $1202                 
                    LDA.b #$01                  
                    STA.w $02D9                 
                    STZ.b $8B                   
                    STZ.b $C1                   
                    STZ.w $054F                 
                    STZ.w $0552                 
                    STZ.w $0577                 
                    STZ.w $0553                 
                    STZ.w $0567                 
                    STZ.w $057A                 
                    LDA.b #$01                  
                    STA.w $0578                 
                    LDA.b #$C0                  
                    STA.b $9D                   
                    LDA.b #$30                  
                    STA.w $0510                 
                    LDA.b #$01                  
                    STA.b $BF                   
CODE_27A578:        LDA.b $BD                   
                    AND.b #$7F                  
                    STA.b $BD                   
                    RTL                         

CODE_27A57F:        LDY.b #$05                  
CODE_27A581:        LDA.w $1FC8,y               
                    BEQ   CODE_27A58A           
                    DEY                         
                    BPL   CODE_27A581           
                    RTS                         

CODE_27A58A:        LDA.b #$09                  
                    STA.w $1FC8,y               
                    LDA.b $70                   
                    STA.w $05BF,y               
                    LDA.b $55                   
                    STA.w $1FD7,y               
                    LDA.b $5E                   
                    STA.w $05C9,y               
                    LDA.b $43                   
                    STA.w $E2,y               
                    LDA.b #$D0                  
                    STA.w $05D3,y               
                    LDA.b #$00                  
                    CMP.b $BD                   
                    LDA.b #$10                  
                    BCS   CODE_27A5B2                   
                    LDA.b #$F0                  
CODE_27A5B2:        STA.w $05DD,y               
                    LDA.b $00                   
                    STA.w $06C7,y               
                    RTS                         

CODE_27A5BB:        LDA.w $0797,x               
                    AND.b #$F7                  
                    STA.w $0797,x               
                    JSR.w CODE_27A5E0           
                    LDA.w $07B3                 
                    CMP.b #$FF                  
                    BEQ   CODE_27A5DF           
                    STA.b $06                   
                    LDA.b #$0F                  
                    STA.b $07                   
                    LDA.w $07B4                 
                    STA.b $02                   
                    LDA.b #$0F                  
                    STA.b $03                   
                    JSR.w CODE_27A614           
CODE_27A5DF:        RTS                         

CODE_27A5E0:        LDA.w $0517                 
                    BEQ   CODE_27A5DF           
                    CMP.b #$0C                  
                    BEQ   CODE_27A5ED           
                    CMP.b #$09                  
                    BNE   CODE_27A5DF           
CODE_27A5ED:        LDA.b $BD                   
                    AND.b #$40                  
                    TAY                         
                    BEQ   CODE_27A5F6           
                    LDY.b #$01                  
CODE_27A5F6:        LDA.w $B02D,y               
                    CLC                         
                    ADC.b $79                   
                    STA.b $02                   
                    LDA.b #$0A                  
                    STA.b $03                   
                    LDA.b $82                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $06                   
                    LDA.b #$0F                  
                    STA.b $07                   
                    LDA.w $0544                 
                    CMP.b #$FE                  
                    BEQ   CODE_27A5DF           
CODE_27A614:        LDY.w $0661,x               
                    LDA.w $B033,y               
                    BNE   CODE_27A5DF           
                    JSL.l CODE_27A85F           
                    BNE   CODE_27A5DF           
                    JSL.l CODE_27A413           
                    JSL.l CODE_27A45F           
                    BCC   CODE_27A5DF           
                    LDA.w $0797,x               
                    ORA.b #$08                  
                    STA.w $0797,x               
                    LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$80                  
                    BNE   CODE_27A5DF           
                    LDA.b $03                   
                    CMP.b #$0F                  
                    BEQ   CODE_27A679           
                    LDY.b #$00                  
                    LDA.b $BD                   
                    BEQ   CODE_27A64B           
                    INY                         
CODE_27A64B:        LDA.b $5E                   
                    STA.b $D8                   
                    LDA.b $43                   
                    STA.b $D9                   
                    SEP   #$20                  
                    LDA.w $B031,y               
                    AND.b #$FF                  
                    CMP.b #$80                  
                    BCC   CODE_27A660           
                    ORA.b #$00                  
CODE_27A660:        CLC                         
                    ADC.b $D8                   
                    SEP   #$20                  
                    STA.w $1A48                 
                    XBA                         
                    STA.w $027E                 
                    LDA.b $70                   
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1A47                 
                    LDA.b #$0A                  
                    STA.w $1A46                 
CODE_27A679:        LDA.b #$0C                  
                    STA.w $0520,x               
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDY.w $0671,x               
                    LDA.w $B1AF,y               
                    AND.b #$40                  
                    BNE   CODE_27A69D           
                    LDA.w $0545                 
                    BNE   CODE_27A699           
                    LDA.w $05F4                 
                    JSL.l CODE_278A8A           
CODE_27A699:        LDA.b #$06                  
                    BNE   CODE_27A6CA           
CODE_27A69D:        PHX                         
                    REP   #$30                  
                    LDA.w $0671,x               
                    AND.w #$00FF                
                    STA.b $D8                   
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    LDA   PNTR_288438,x             
                    STA.b $D8                   
                    SEP   #$30                  
                    PLX                         
                    LDA.b $D9                   
                    AND.b #$F8                  
                    CMP.b #$08                  
                    BNE   CODE_27A6C3           
                    LDA.b $D8                   
                    STA.w $0671,x               
CODE_27A6C3:        LDA.b #$FF                  
                    STA.w $06A6,x               
                    LDA.b #$03                  
CODE_27A6CA:        STA.w $0661,x               
                    LDA.b #$D0                  
                    LDY.b $03                   
                    CPY.b #$0F                  
                    BEQ   CODE_27A6D7           
                    LDA.b #$B0                  
CODE_27A6D7:        STA.b $9E,x                 
                    JSL.l CODE_27A837           
                    LDA.w $B02B,y               
                    STA.b $8C,x                 
                    LDA.w $0679,x               
                    ORA.b #$80                  
                    STA.w $0679,x               
                    RTS                         

CODE_27A6EB:        JSR.w CODE_27A6EF           
                    RTL                         

CODE_27A6EF:        LDA.w $0681,x               
                    BNE   CODE_27A74E           
                    LDA.w $0651,x               
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BEQ   CODE_27A74E           
                    JSL.l CODE_27A439           
CODE_27A701:        LDX.b #$04                  
CODE_27A703:        CPX.b $9B                   
                    BEQ   CODE_27A74B           
                    LDY.w $0661,x               
                    LDA.w $B033,y               
                    BNE   CODE_27A74B           
                    LDA.w $0681,x               
                    BNE   CODE_27A74B           
                    LDA.w $0651,x               
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BEQ   CODE_27A74B           
                    JSL.l CODE_27A413           
                    JSL.l CODE_27A45F           
                    BCC   CODE_27A74B           
                    LDY.b $9B                   
                    LDA.b $5F,x                 
                    SEC                         
                    SBC.w $005F,y               
                    PHA                         
                    LDA.b $44,x                 
                    SBC.w $0044,y               
                    STA.b $00                   
                    PLA                         
                    ADC.b #$80                  
                    LDA.b $00                   
                    ADC.b #$00                  
                    BNE   CODE_27A74B           
                    SEC                         
                    LDY.w $0671,x               
                    LDA.w $AE78,y               
                    AND.b #$80                  
                    BEQ   CODE_27A751           
CODE_27A74B:        DEX                         
                    BPL   CODE_27A703           
CODE_27A74E:        CLC                         
                    BCC   CODE_27A756           
CODE_27A751:        TXA                         
                    TAY                         
                    LDA.w $0671,y               
CODE_27A756:        LDX.b $9B                   
                    RTS                         

CODE_27A759:        JSR.w CODE_27A701           
                    RTL                         

CODE_27A75D:        PHA                         
                    LDA.w $0425                 
                    BEQ   CODE_27A77E           
                    LDY.b $0C                   
                    LDA.b $0D                   
                    JSL.l CODE_209FC1           
                    PHA                         
                    PHX                         
                    TYX                         
                    LDA.l $21823C,x             
                    STA.b $00                   
                    LDA.l $21824C,x             
                    STA.b $01                   
                    PLX                         
                    PLA                         
                    BRA   CODE_27A798           

CODE_27A77E:        PHX                         
                    LDA.b $0E                   
                    ASL   A                     
                    TAX                         
                    LDA.l $218200,x             
                    STA.b $00                   
                    LDA.l $218201,x             
                    STA.b $01                   
                    PLX                         
                    LDA.b $0C                   
                    BEQ   CODE_27A796           
                    INC.b $01                   
CODE_27A796:        LDA.b $0D                   
CODE_27A798:        AND.b #$F0                  
                    STA.b $02                   
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    TAY                         
                    LDA.b #$7E                  
                    STA.b $02                   
                    PLA                         
                    STA.b [$00],y               
                    RTL                         

CODE_27A7AD:        LDA.b $5F,x                 
                    SEC                         
                    SBC.b $5E                   
                    STA.b $0E                   
                    LDA.b $44,x                 
                    SBC.b $43                   
                    LSR   A                     
                    ROR.b $0E                   
                    LSR   A                     
                    ROR.b $0E                   
                    ASL   A                     
                    AND.b #$40                  
                    STA.b $0F                   
                    RTL                         

CODE_27A7C4:        LDA.b $71,x                 
                    SEC                         
                    SBC.b $70                   
                    STA.b $0E                   
                    LDA.b $56,x                 
                    SBC.b $55                   
                    STA.b $0F                   
                    LSR   A                     
                    ROR.b $0E                   
                    LSR   A                     
                    ROR.b $0E                   
                    RTL                         

CODE_27A7D8:        LDA.b $9E,x                 
                    BMI   CODE_27A7E4           
                    CMP.b #$40                  
                    BMI   CODE_27A7E4           
                    LDA.b #$40                  
                    STA.b $9E,x                 
CODE_27A7E4:        TXA                         
                    CLC                         
                    ADC.b #$12                  
                    TAX                         
                    JSR.w CODE_27A806           
                    LDX.b $9B                   
                    RTL                         

CODE_27A7EF:        JSR.w CODE_27A806           
                    LDY.w $0425                 
                    BEQ   CODE_27A805           
                    PHA                         
                    LDY.w $0671                 
                    LDA.w $B0FB,x               
                    AND.b #$08                  
                    BNE   CODE_27A804           
                    STA.b $44,x                 
CODE_27A804:        PLA                         
CODE_27A805:        RTL                         

CODE_27A806:        LDA.b $8C,x                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $074F,x               
                    STA.w $074F,x               
                    PHP                         
                    PHP                         
                    LDY.b #$00                  
                    LDA.b $8C,x                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_27A824           
                    ORA.b #$F0                  
                    DEY                         
CODE_27A824:        PLP                         
                    PHA                         
                    ADC.b $5F,x                 
                    STA.b $5F,x                 
                    TYA                         
                    ADC.b $44,x                 
                    STA.b $44,x                 
                    PLA                         
                    PLP                         
                    ADC.b #$00                  
                    STA.w $074D                 
                    RTS                         

CODE_27A837:        LDA.b $5E                   
                    SEC                         
                    SBC.b $5F,x                 
                    STA.b $0F                   
                    LDY.b #$00                  
                    LDA.b $43                   
                    SBC.b $44,x                 
                    BPL   CODE_27A847           
                    INY                         
CODE_27A847:        RTL                         

CODE_27A848:        LDA.b $70                   
                    SEC                         
                    SBC.b $71,x                 
                    STA.b $0F                   
                    LDY.b #$00                  
                    LDA.b $55                   
                    SBC.b $56,x                 
                    BPL   CODE_27A858           
                    INY                         
CODE_27A858:        RTL                         

CODE_27A859:        EOR.b #$FF                ;\Invert accumulator (8-bit)
                    CLC                       ; |
                    ADC.b #$01                ; |Something tells me SMW's version (InvertAccum) is better
                    RTL                       ;/

CODE_27A85F:        LDA.w $0651,x             ;
                    ORA.w $0681,x             ;
                    RTL                       ;

                    LDY.b #$04                  
CODE_27A868:        LDA.w $0661,y               
                    BEQ   CODE_27A870           
                    DEY                         
                    BPL   CODE_27A868           
CODE_27A870:        RTS                         

                    LDA.b $55                   
                    STA.b $0C                   
                    LDA.b $09                   
                    CLC                         
                    ADC.b $70                   
                    STA.b $0D                   
                    BCC   CODE_27A880           
                    INC.b $0C                   
CODE_27A880:        LDA.b $0C                   
                    BNE   CODE_27A88F           
                    LDA.b $0D                   
                    SEC                         
                    SBC.b #$10                  
                    STA.b $0D                   
                    BCS   CODE_27A88F                   
                    DEC.b $0C                   
CODE_27A88F:        LDA.b $43                   
                    STA.b $0E                   
                    LDA.b $0A                   
                    BPL   CODE_27A899           
                    DEC.b $0E                   
CODE_27A899:        LDA.b $5E                   
                    CLC                         
                    ADC.b $0A                   
                    STA.b $0F                   
                    BCC   CODE_27A8A4           
                    INC.b $0E                   
CODE_27A8A4:        STY.b $09                   
                    STX.b $0A                   
                    JSL.l CODE_209FE0           
                    LDY.b $09                   
                    LDX.b $0A                   
                    RTS                         

CODE_27A8B1:        LDY.b #$00                  
                    LDA.w $052E,y               
                    BEQ   CODE_27A8BE           
                    INY                         
                    LDA.w $052E,y               
                    BNE   CODE_27A8D7           
CODE_27A8BE:        LDA.b $0B                   
                    STA.w $052E,y               
                    LDA.b $0E                   
                    STA.w $0531,y               
                    LDA.b $0F                   
                    STA.w $0534,y               
                    LDA.b $0C                   
                    STA.w $0537,y               
                    LDA.b $0D                   
                    STA.w $053A,y               
CODE_27A8D7:        RTL                         

CODE_27A8D8:        STX.w $0669                 
                    STA.b $5F                   
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    LDY.w $0726                 
                    BEQ   CODE_27A8E8           
                    LDY.b #$23                  
CODE_27A8E8:        LDX.b #$00                  
CODE_27A8EA:        LDA.w $1D80,y               
                    BEQ   CODE_27A8F5           
                    INY                         
                    INX                         
                    CPX.b #$1B                  
                    BCC   CODE_27A8EA           
CODE_27A8F5:        STY.w $0689                 
                    TXA                         
                    LDY.b #$03                  
CODE_27A8FB:        CMP.b #$07                  
                    BCC   CODE_27A904           
                    SBC.b #$07                  
                    DEY                         
                    BNE   CODE_27A8FB           
CODE_27A904:        TAX                         
                    LDA.w $B03C,y               
                    STA.w $0691                 
                    LDA.b #$02                  
                    STA.w $0661                 
                    LDA.b #$35                  
                    STA.w $0671                 
                    LDA.b #$90                  
                    STA.b $71                   
                    LDA.w $B040,x               
                    LSR   A                     
                    LSR   A                     
                    SEC                         
                    SBC.b $00                   
                    STA.b $8C                   
                    LDA.b #$D0                  
                    STA.b $9E                   
                    LDA.b #$00                  
                    STA.w $074F                 
                    STA.w $0758                 
                    LDA.b #$FF                  
                    STA.w $0518                 
                    STA.b $4D                   
                    LDA.b #$3E                  
                    STA.w $1203                 
                    RTL                         

CODE_27A93C:        LDA.w $05FF                 
                    STA.w $05FE                 
                    JSR.w CODE_27A9B2           
                    LDY.b #$00                  
                    LDA.w $1A13                 
                    LSR   A                     
                    BCC   CODE_27A951           
                    INY                         
                    DEC.w $0781                 
CODE_27A951:        LDA.w $0781                 
                    STA.l $7E3952               
                    STY.w $0781                 
                    CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    BCC   CODE_27A964           
                    INC.b $43                   
CODE_27A964:        LDY.b #$00                  
                    LDA.w $1A13                 
                    LSR   A                     
                    BCC   CODE_27A970           
                    DEY                         
                    INC.w $0780                 
CODE_27A970:        LDA.w $0780                 
                    STA.l $7E3953               
                    STY.w $0780                 
                    LDY.b $A6                   
                    BEQ   CODE_27A989           
                    LDY.b #$00                  
                    CLC                         
                    ADC.w $0780                 
                    CMP.b #$FF                  
                    BNE   CODE_27A989           
                    DEY                         
CODE_27A989:        CLC                         
                    ADC.b $70                   
                    STA.b $70                   
                    TYA                         
                    ADC.b $55                   
                    STA.b $55                   
                    RTL                         

CODE_27A994:        JSR.w CODE_27A9B2           
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.l $7E3952               
                    STA.b $5F,x                 
                    BCC   CODE_27A9A4           
                    INC.b $44,x                 
CODE_27A9A4:        LDA.b $71,x                 
                    CLC                         
                    ADC.l $7E3953               
                    STA.b $71,x                 
                    BCC   CODE_27A9B1           
                    INC.b $56,x                 
CODE_27A9B1:        RTL                         

CODE_27A9B2:        LDA.w $05FE                 
                    BEQ   CODE_27A9BB           
                    LDA.b $9C                   
                    BEQ   CODE_27A9BE           
CODE_27A9BB:        PLA                         
                    PLA                         
                    RTL                         

CODE_27A9BE:        RTS                         

CODE_27A9BF:        LDA.w $0425                 
                    BEQ   CODE_27A9FD           
                    LDA.b $C6,x                 
                    STA.b $DA                   
                    LDA.b $C7,x                 
                    STA.b $DB                   
                    JSL.l CODE_27A19D           
                    REP   #$30                  
                    LDA.b $DA                   
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    LDY.b $DA                   
                    LDX.w #$0000                
                    LDA.w $0800,y               
                    CMP.b #$F8                  
                    BCS   CODE_27AA00                   
                    LDX.w #$0004                
                    LDA.w $0804,y               
                    CMP.b #$F8                  
                    BCS   CODE_27AA00                   
CODE_27A9FD:        BRL   CODE_27AA59           

CODE_27AA00:        STX.b $DC                   
                    REP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b $DC                   
                    TAY                         
                    LDA.b $D8                   
                    CLC                         
                    ADC.b $DC                   
                    TAX                         
                    SEP   #$20                  
                    LDA.w $0800,y               
                    STA.w $0800,x               
                    STA.w $0808,x               
                    LDA.w $0801,y               
                    STA.w $0801,x               
                    LDA.w $0809,y               
                    STA.w $0809,x               
                    LDA.w $0802,y               
                    STA.w $0802,x               
                    LDA.w $080A,y               
                    STA.w $080A,x               
                    LDA.w $0803,y               
                    STA.w $0803,x               
                    LDA.w $080B,y               
                    STA.w $080B,x               
                    REP   #$20                  
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,x               
                    STA.w $0A22,x               
                    INC   A                     
                    STA.w $0A20,y               
                    STA.w $0A22,y               
CODE_27AA59:        SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

DATA_27AA5E:        db $FF,$02,$13,$14,$26,$32,$4D,$60
                    db $62,$71,$85,$90,$A5,$C6,$C9,$CF
                    db $E4,$E5,$E6,$E8,$EB,$ED

CODE_27AA74:        PHB
                    PHK
                    PLB                         
                    PHX                         
                    LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    AND.b #$07                  
                    TAX                         
                    LDA.w $AA85,x               
                    PLX                         
                    PLB                         
                    RTL                         

                    db $02,$04,$03,$04,$00,$04,$01,$04

CODE_27AA8D:        PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    LDA.b $15                   
                    LSR   A                     
                    AND.b #$03                  
                    TAX                         
                    LDA.w DATA_27AA9D,x               
                    PLX                         
                    PLB                         
                    RTL                         

DATA_27AA9D:        db $00,$01,$02,$01

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
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF

CODE_27B000:        LDA.b $BF
                    BNE   CODE_27B07F
                    LDA.w $0425
                    BEQ   CODE_27B00C           
                    JMP.w CODE_27B0EE           

CODE_27B00C:        LDA.b $70                   
                    CLC                         
                    ADC.b #$20                  
                    AND.b #$F0                  
                    STA.b $04                   
                    LDA.b $55                   
                    ADC.b #$00                  
                    AND.b #$01                  
                    STA.b $02                   
                    LDA.b $5E                   
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $03                   
                    LDA.b $43                   
                    ADC.b #$00                  
                    STA.b $05                   
                    CMP.b #$10                  
                    BCS   CODE_27B07F                   
                    PHX                         
                    ASL   A                     
                    TAX                         
                    LDA.l $218200,x             
                    STA.b $2E                   
                    STA.b $D8                   
                    LDA.l $218201,x             
                    CLC                         
                    ADC.b $02                   
                    STA.b $2F                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    STA.b $DA                   
                    PLX                         
                    LDA.b $03                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $04                   
                    TAY                         
                    LDA.b [$D8],y               
                    BEQ   CODE_27B075           
                    PHX                         
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $AB57,x               
                    STA.b $DB                   
                    LDA.w $AB58,x               
                    STA.b $DC                   
                    LDA.b [$2E],y               
                    TAY                         
                    LDA.b ($DB),y               
                    PLX                         
                    BRA   CODE_27B077           

CODE_27B075:        LDA.b [$2E],y               
CODE_27B077:        CMP.b #$F3                  
                    BNE   CODE_27B080           
                    LDA.b #$D0                  
                    STA.b $9D                   
CODE_27B07F:        RTS                         

CODE_27B080:        CMP.b #$94                  
                    BNE   CODE_27B092           
                    LDY.w $070A                 
                    CPY.b #$0B                  
                    BEQ   CODE_27B08F           
                    CPY.b #$02                  
                    BNE   CODE_27B092           
CODE_27B08F:        JMP.w CODE_27B1BE           

CODE_27B092:        CMP.b #$5B                  
                    BNE   CODE_27B0ED           
CODE_27B096:        LDY.w $070A                 
                    CPY.b #$04                  
                    BEQ   CODE_27B0A9           
                    CPY.b #$08                  
                    BEQ   CODE_27B0A9           
                    CPY.b #$0C                  
                    BEQ   CODE_27B0A9           
                    CPY.b #$02                  
                    BNE   CODE_27B07F           
CODE_27B0A9:        LDA.w $0564                 
                    BNE   CODE_27B07F           
                    JSR.w CODE_27DC85           
                    LDA.b #$54                  
                    STA.w $0671,x               
                    LDA.b $04                   
                    SEC                         
                    SBC.b #$01                  
                    STA.b $71,x                 
                    LDA.b $02                   
                    SBC.b #$00                  
                    STA.b $56,x                 
                    LDA.b $03                   
                    STA.b $5F,x                 
                    LDA.b $05                   
                    STA.b $44,x                 
                    LDA.b #$20                  
                    STA.b $68,x                 
                    LDA.b #$03                  
                    STA.w $1FE9,x               
                    LDA.b #$02                  
                    STA.w $0564                 
                    LDA.b $02                   
                    STA.w $052A                 
                    LDA.b $04                   
                    STA.w $052B                 
                    LDA.b $03                   
                    STA.w $0529                 
                    LDA.b $05                   
                    STA.w $0528                 
CODE_27B0ED:        RTS                         

CODE_27B0EE:        LDA.b $70                   
                    CLC                         
                    ADC.b #$21                  
                    AND.b #$F0                  
                    STA.b $00                   
                    STA.b $04                   
                    LDA.b $55                   
                    ADC.b #$00                  
                    STA.b $02                   
                    ORA.b #$20                  
                    STA.b $01                   
                    STA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $DC                   
                    LDA.b $5E                   
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $03                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $00                   
                    STA.b $00                   
                    STA.b $D8                   
                    STA.b $DB                   
                    LDY.b #$00                  
                    STY.b $05                   
                    LDA.b #$7E                  
                    STA.b $DA                   
                    STA.b $DD                   
                    LDA.b [$DB],y               
                    BEQ   CODE_27B145           
                    PHX                         
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $AB57,x               
                    STA.b $DB                   
                    LDA.w $AB58,x               
                    STA.b $DC                   
                    LDA.b [$D8],y               
                    TAY                         
                    LDA.b ($DB),y               
                    PLX                         
                    BRA   CODE_27B147           

CODE_27B145:        LDA.b [$D8],y               
CODE_27B147:        CMP.b #$5B                  
                    BNE   CODE_27B14E           
                    JMP.w CODE_27B096           

CODE_27B14E:        LDY.b $A6                   
                    BNE   CODE_27B0ED           
                    LDY.w $07BD                 
                    BNE   CODE_27B0ED           
                    CMP.b #$54                  
                    BCC   CODE_27B0ED           
                    CMP.b #$5D                  
                    BCS   CODE_27B0ED                   
                    SEC                         
                    SBC.b #$54                  
                    TAY                         
                    LDA.b #$FF                  
                    STA.b $02                   
                    LDX.b #$04                  
CODE_27B169:        LDA.w $0661,x               
                    BEQ   CODE_27B17F           
                    LDA.w $0671,x               
                    CMP.b #$A8                  
                    BCC   CODE_27B181           
                    CMP.b #$AA                  
                    BCS   CODE_27B181                   
                    JSR.w CODE_279C5F           
                    JMP.w CODE_27B17F           

CODE_27B17F:        STX.b $02                   
CODE_27B181:        DEX                         
                    BPL   CODE_27B169           
                    LDX.b $02                   
                    BMI   CODE_27B1BD           
                    LDA.b #$02                  
                    STA.w $0661,x               
                    LDA.w $C6C9,y               
                    STA.w $0671,x               
                    LDA.w $C6D2,y               
                    STA.b $4D,x                 
                    LDA.b $00                   
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$01                  
                    STA.b $71,x                 
                    LDA.b $01                   
                    SBC.b #$00                  
                    AND.b #$0F                  
                    STA.b $56,x                 
                    LDA.b $00                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $C6DB,y               
                    STA.b $5F,x                 
                    LDA.b #$00                  
                    STA.b $44,x                 
                    LDA.b #$FF                  
                    STA.b $68,x                 
CODE_27B1BD:        RTS                         

CODE_27B1BE:        LDA.b #$01                  
                    STA.w $0578                 
                    JSL.l CODE_27A546           
                    RTS                         

CODE_27B1C8:        LDX.w $1600                 
                    LDA.w $1CFB                 
                    BEQ   CODE_27B1FC           
                    PHA                         
                    AND.b #$03                  
                    TAY                         
                    DEC.w $1CFB                 
                    PLA                         
                    BPL   CODE_27B1FD           
                    AND.b #$7F                  
                    BNE   CODE_27B1E1           
                    STA.w $1CFB                 
CODE_27B1E1:        TYA                         
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $C6E4,y               
                    STA.w $13A2                 
                    STA.w $13A4                 
                    STA.w $13A6                 
                    STA.w $13C2                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
CODE_27B1FC:        RTS                         

CODE_27B1FD:        REP   #$20                  
                    LDA.w $1CFB                 
                    AND.w #$00FF                
                    BEQ   CODE_27B218           
                    LDA.b $15                   
                    AND.w #$0003                
                    PHX                         
                    TAX                         
                    LDA.l $27B223,x             
                    STA.w $1300                 
                    PLX                         
                    BRA   CODE_27B21B           

CODE_27B218:        STZ.w $1300                 
CODE_27B21B:        SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

                    PHP                         
                    ADC.b [$FF],y               
                    ADC.l $08F018,x             
                    TYA                         
                    ASL   A                     
                    TAY                         
                    LDA.w $C6E4,y               
                    BRA   CODE_27B235           

                    LDA.w $02B9                 
CODE_27B235:        STA.b $DC                   
                    AND.b #$1F                  
                    ORA.b #$20                  
                    STA.b $D8                   
                    LDA.b $DC                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$1F                  
                    ORA.b #$40                  
                    STA.b $DA                   
                    LDA.b $DC                   
                    XBA                         
                    LSR   A                     
                    LSR   A                     
                    AND.b #$1F                  
                    ORA.b #$80                  
                    STA.b $DC                   
                    SEP   #$20                  
                    LDA.b $D8                   
                    STA.w $0205                 
                    LDA.b $DA                   
                    STA.w $0206                 
                    LDA.b $DC                   
                    STA.w $0207                 
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

                    REP   #$20                  
                    LDA.w $1CFB                 
                    AND.w #$00FF                
                    BEQ   CODE_27B27E           
                    TYA                         
                    ASL   A                     
                    TAY                         
                    LDA.w $C6E4,y               
                    BRA   CODE_27B281           

CODE_27B27E:        LDA.w $02B9                 
CODE_27B281:        STA.w $1300                 
                    SEP   #$20                  
                    LDA.b #$20                  
                    STA.w $0205                 
                    ASL   A                     
                    STA.w $0206                 
                    ASL   A                     
                    STA.w $0207                 
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

CODE_27B299:        JSR.w CODE_27B1C8           
                    JSR.w CODE_27B000           
                    JSR.w CODE_27BFDB           
                    JSR.w CODE_27BA22           
                    JSR.w CODE_27BB5E           
                    JSR.w CODE_27BCD7           
                    JSR.w CODE_27C294           
                    JSR.w CODE_27C536           
                    JSR.w CODE_27D83D           
                    JSR.w CODE_27B42C           
                    JSL.l CODE_29D713           
                    LDA.b $BB                   
                    CMP.b #$06                  
                    BEQ   CODE_27B2C5           
                    CMP.b #$02                  
                    BNE   CODE_27B2DC           
CODE_27B2C5:        LDA.w $0556                 
                    ORA.w $056F                 
                    ORA.w $0557                 
                    ORA.w $058C                 
                    ORA.b $9C                   
                    BNE   CODE_27B2DC           
                    BIT.b $18                   
                    BVC   $03                   
                    JSR.w CODE_27B3A3           
CODE_27B2DC:        LDA.w $1A46                 
                    BNE   CODE_27B2E4           
                    BRL   CODE_27B39A           

CODE_27B2E4:        DEC.w $1A46                 
                    LDY.b #$00                  
                    LDA.w $1A47                 
                    SEC                         
                    SBC.w $0543                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    LDA.w $027E                 
                    XBA                         
                    LDA.w $1A48                 
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    LDA.b $D8                   
                    STA.w $0800,y               
                    STA.w $0808,y               
                    LDA.b $DA                   
                    STA.w $0804,y               
                    STA.w $080C,y               
                    LDA.b #$56                  
                    STA.w $0802,y               
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080A,y               
                    STA.w $080E,y               
                    LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    STA.b $00                   
                    LDA.b $15                   
                    AND.b #$03                  
                    ASL   A                     
                    ORA.b #$20                  
                    ORA.b $00                   
                    STA.w $0803,y               
                    STA.w $080B,y               
                    EOR.b #$C0                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_27B36B           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $080A,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $080A,y               
CODE_27B36B:        LDA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_27B380           
                    LDA.w $0806,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $0806,y               
                    PLA                         
                    STA.w $080E,y               
CODE_27B380:        PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A22,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A21,y               
                    STA.w $0A23,y               
                    PLY                         
CODE_27B39A:        LDA.w $0556                 
                    BNE   CODE_27B3A2           
                    JSR.w CODE_27DDC8           
CODE_27B3A2:        RTL                         

CODE_27B3A3:        LDX.b #$01                  
CODE_27B3A5:        LDA.w $1CE1,x               
                    BEQ   CODE_27B3AE           
                    DEX                         
                    BPL   CODE_27B3A5           
                    RTS                         

CODE_27B3AE:        LDA.b #$06                  
                    STA.w $1203                 
                    LDA.b #$0B                  
                    STA.w $0513                 
                    LDA.b $5E                   
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1CE5,x               
                    LDA.b $43                   
                    ADC.b #$00                  
                    STA.w $0247,x               
                    LDA.w $0425                 
                    BEQ   CODE_27B3E1           
                    LDA.b $BD                   
                    AND.b #$40                  
                    BEQ   CODE_27B3E1           
                    LDA.w $1CE5,x               
                    CMP.b #$F8                  
                    BCC   CODE_27B3E1           
                    LDA.b #$00                  
                    STA.w $1CE5,x               
                    STA.w $0247,x               
CODE_27B3E1:        LDA.b $70                   
                    STA.w $1CE3,x               
                    LDA.b $55                   
                    STA.w $05FA,x               
                    LDA.b #$01                  
                    LDY.b $BB                   
                    CPY.b #$06                  
                    SEC                         
                    BNE   CODE_27B3F5           
                    ASL   A                     
CODE_27B3F5:        STA.w $1CE1,x               
                    LDA.b #$03                  
                    BCS   CODE_27B3FE                   
                    LDA.b #$FD                  
CODE_27B3FE:        STA.w $1CE7,x               
                    LDA.b #$00                  
                    STA.b $00                   
                    LDA.b #$03                  
                    BCS   CODE_27B416                   
                    LDA.b $BD                   
                    ASL   A                     
                    EOR.b $8B                   
                    BPL   CODE_27B414           
                    LDA.b $8B                   
                    STA.b $00                   
CODE_27B414:        LDA.b #$10                  
CODE_27B416:        LDY.b $BD                   
                    BNE   CODE_27B41E           
                    JSL.l CODE_27A859           
CODE_27B41E:        CLC                         
                    ADC.b $00                   
                    STA.w $1CE9,x               
                    STZ.w $1CED,x               
                    STZ.w $1CEB,x               
                    RTS                         

CODE_27B42B:        RTS                         

CODE_27B42C:        LDX.b #$01                  
                    STX.b $9B                   
                    JSR.w CODE_27B436           
                    DEC.b $9B                   
                    DEX                         
CODE_27B436:        LDA.w $1CE1,x               
                    BEQ   CODE_27B42B           
                    CMP.b #$03                  
                    BCC   CODE_27B442           
                    JMP.w CODE_27B95E           

CODE_27B442:        LDA.w $05FE                 
                    BEQ   CODE_27B466           
                    LDA.b $9C                   
                    BNE   CODE_27B466           
                    LDA.w $1CE5,x               
                    CLC                         
                    ADC.l $7E3952               
                    STA.w $1CE5,x               
                    LDA.w $1CE3,x               
                    CLC                         
                    ADC.l $7E3953               
                    STA.w $1CE3,x               
                    BCC   CODE_27B466           
                    INC.w $05FA,x               
CODE_27B466:        LDY.b $9C                   
                    BNE   CODE_27B4CC           
                    LDA.w $1CE7,x               
                    LDY.w $05FC                 
                    BEQ   CODE_27B476           
                    CLC                         
                    ADC.w $0780                 
CODE_27B476:        PHA                         
                    LDY.b #$00                  
                    PLA                         
                    BPL   CODE_27B47D           
                    DEY                         
CODE_27B47D:        CLC                         
                    ADC.w $1CE3,x               
                    STA.w $1CE3,x               
                    TYA                         
                    ADC.w $05FA,x               
                    STA.w $05FA,x               
                    INC.w $1CED,x               
                    LDA.w $1CE1,x               
                    CMP.b #$02                  
                    BNE   CODE_27B4CF           
                    LDA.w $1CE9,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $1A55,x               
                    STA.w $1A55,x               
                    PHP                         
                    LDA.w $1CE9,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    LDY.b #$00                  
                    BCC   CODE_27B4B4           
                    ORA.b #$F0                  
                    DEY                         
CODE_27B4B4:        PLP                         
                    ADC.w $1CE5,x               
                    STA.w $1CE5,x               
                    TYA                         
                    ADC.w $0247,x               
                    STA.w $0247,x               
                    LDA.w $1CED,x               
                    AND.b #$07                  
                    BNE   CODE_27B4CC           
                    INC.w $1CE7,x               
CODE_27B4CC:        JMP.w CODE_27B505           

CODE_27B4CF:        LDA.w $0247,x               
                    XBA                         
                    LDA.w $1CE5,x               
                    REP   #$20                  
                    STA.b $D8                   
                    LDA.w $1CE9,x               
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_27B4E8           
                    ORA.w #$FF00                
CODE_27B4E8:        CLC                         
                    ADC.b $D8                   
                    SEP   #$20                  
                    STA.w $1CE5,x               
                    XBA                         
                    STA.w $0247,x               
                    LDA.w $1CE7,x               
                    CMP.b #$04                  
                    BEQ   CODE_27B505           
                    LDA.w $1CED,x               
                    AND.b #$03                  
                    BNE   CODE_27B505           
                    INC.w $1CE7,x               
CODE_27B505:        LDA.w $0247,x               
                    XBA                         
                    LDA.w $1CE5,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $DC                   
                    CMP.w #$0100                
                    BCC   CODE_27B51E           
                    CMP.w #$FFF8                
                    BCC   CODE_27B526           
CODE_27B51E:        STA.b $0D                   
                    SEP   #$20                  
                    STA.b $01                   
                    BRA   CODE_27B52E           

CODE_27B526:        SEP   #$30                  
                    LDA.b #$00                  
                    STA.w $1CE1,x               
                    RTS                         

CODE_27B52E:        ADC.b #$08                  
                    STA.b $0D                   
                    LDA.w $05FA,x               
                    XBA                         
                    LDA.w $1CE3,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0216                 
                    STA.b $D8                   
                    CMP.w #$00C0                
                    BCC   CODE_27B55E           
                    CMP.w #$FFE0                
                    BCS   CODE_27B55E                   
                    SEP   #$20                  
                    LDA.w $1CE1,x               
                    CMP.b #$02                  
                    BNE   CODE_27B55B           
                    LDA.b $D9                   
                    BPL   CODE_27B55B           
                    BRL   CODE_27B693           

CODE_27B55B:        BRL   CODE_27B526           

CODE_27B55E:        SEP   #$20                  
                    JSR.w CODE_27D728           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $1CE3,x               
                    SEC                         
                    SBC.w $0543                 
                    STA.w $0801,y               
                    PHA                         
                    ADC.b #$0E                  
                    STA.b $0C                   
                    PLA                         
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $DD                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    LDA.w $1CE9,x               
                    LSR   A                     
                    AND.b #$40                  
                    STA.b $02                   
                    LDA.w $1CE1,x               
                    CMP.b #$02                  
                    BEQ   CODE_27B5AB           
                    BRL   CODE_27B64B           

CODE_27B5AB:        LDA.b $BB                   
                    CMP.b #$06                  
                    BEQ   CODE_27B5B4           
                    BRL   CODE_27B6A8           

CODE_27B5B4:        REP   #$30                  
                    LDY.b $C6,x                 
                    LDA.w $1CED,x               
                    LSR   A                     
                    LSR   A                     
                    AND.w #$0003                
                    TAX                         
                    LDA.w $0588                 
                    AND.w #$00FF                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.w $C6F9,x               
                    BIT.b $02                   
                    BVC   $02                   
                    EOR.b #$06                  
                    STA.b $DA                   
                    STZ.b $DB                   
                    CLC                         
                    ADC.b $01                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $C6F8,x               
                    CLC                         
                    ADC.w $0801,y               
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b #$EE                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b $02                   
                    EOR.w $C6F4,x               
                    SEC                         
                    ORA.b #$21                  
                    LDX.b $D8                   
                    BEQ   CODE_27B60A           
                    AND.b #$CF                  
                    ORA.b #$10                  
CODE_27B60A:        STA.w $0803,y               
                    STA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_27B622           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_27B622:        PHY                         
                    LDX.b $9B                   
                    LDA.w $0247,x               
                    XBA                         
                    LDA.w $1CE5,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.b $DA                   
                    STA.b $DC                   
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $DD                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    BRL   CODE_27B693           

CODE_27B64B:        LDA.w $0588                 
                    STA.b $D8                   
                    STZ.b $D9                   
                    REP   #$30                  
                    LDY.b $C6,x                 
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    AND.w #$0003                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C6EC,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b $02                   
                    EOR.w $C6F0,x               
                    CLC                         
                    ORA.b #$20                  
                    LDX.b $D8                   
                    BEQ   CODE_27B67B           
                    AND.b #$CF                  
                    ORA.b #$10                  
CODE_27B67B:        STA.w $0803,y               
                    STA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_27B693           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_27B693:        SEP   #$10                  
                    LDX.b $9B                   
                    LDA.b $9C                   
                    BNE   CODE_27B6AD           
                    LDA.w $1CE1,x               
                    CMP.b #$02                  
                    BEQ   CODE_27B6A5           
                    JSR.w CODE_27B6AE           
CODE_27B6A5:        JMP.w CODE_27B890           

CODE_27B6A8:        LDA.b #$03                  
                    STA.w $1CE1,x               
CODE_27B6AD:        RTS                         

CODE_27B6AE:        LDA.w $0425                 
                    BEQ   CODE_27B6EB           
                    LDA.b $0C                   
                    CLC                         
                    ADC.w $0543                 
                    STA.b $05                   
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.w $0542                 
                    ADC.b #$20                  
                    STA.b $01                   
                    STA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $DC                   
                    LDA.w $1CE5,x               
                    ADC.b #$04                  
                    STA.b $0D                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    STA.b $00                   
                    STA.b $D8                   
                    STA.b $DB                   
                    LDA.b #$7E                  
                    STA.b $DA                   
                    STA.b $DD                   
                    LDY.b #$00                  
                    JMP.w CODE_27B759           

CODE_27B6EB:        LDA.w $058B                 
                    BEQ   CODE_27B702           
                    LDA.b $0C                   
                    CMP.b #$A0                  
                    BCC   CODE_27B704           
                    SBC.b #$10                  
                    STA.b $05                   
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.b #$01                  
                    BRA   CODE_27B713           

CODE_27B702:        LDA.b $0C                   
CODE_27B704:        CLC                         
                    ADC.w $0543                 
                    STA.b $05                   
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.w $0542                 
                    ADC.b #$00                  
CODE_27B713:        STA.b $03                   
                    BEQ   CODE_27B724           
                    CMP.b #$02                  
                    BCS   CODE_27B721                   
                    LDA.b $02                   
                    CMP.b #$B0                  
                    BCC   CODE_27B724           
CODE_27B721:        BRL   CODE_27B7A0           

CODE_27B724:        LDA.w $1CE5,x               
                    STA.b $04                   
                    PHX                         
                    LDA.w $0247,x               
                    STA.b $06                   
                    ASL   A                     
                    TAX                         
                    LDA.l $218200,x             
                    STA.b $D8                   
                    STA.b $DB                   
                    LDA.b $03                   
                    AND.b #$01                  
                    CLC                         
                    ADC.l $218201,x             
                    STA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $DC                   
                    PLX                         
                    LDA.b $04                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    TAY                         
                    LDA.b #$7E                  
                    STA.b $DA                   
                    STA.b $DD                   
CODE_27B759:        LDA.b [$DB],y               
                    BEQ   CODE_27B775           
                    LDA.b [$D8],y               
                    TAY                         
                    PHX                         
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $AB57,x               
                    STA.b $DB                   
                    LDA.w $AB58,x               
                    STA.b $DC                   
                    LDA.b ($DB),y               
                    PLX                         
                    BRA   CODE_27B777           

CODE_27B775:        LDA.b [$D8],y               
CODE_27B777:        JSL.l CODE_278ED2           
                    PHA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    TAY                         
                    STY.b $01                   
                    PLA                         
                    STA.b $00                   
                    CMP.w $1E96,y               
                    BCC   CODE_27B7A0           
                    CMP.w $1E9A,y               
                    BCC   CODE_27B7E8           
                    LDY.w $0560                 
                    CPY.b #$0B                  
                    BNE   CODE_27B7AF           
                    CMP.b #$56                  
                    BNE   CODE_27B7A6           
                    LDA.b #$10                  
                    BNE   CODE_27B7AC           
CODE_27B7A0:        LDA.b #$00                  
                    STA.w $1CEB,x               
                    RTS                         

CODE_27B7A6:        CMP.b #$55                  
                    BNE   CODE_27B7AF           
                    LDA.b #$11                  
CODE_27B7AC:        JSR.w CODE_27B7F6           
CODE_27B7AF:        LDA.b $00                   
                    LDY.w $0563                 
                    BEQ   CODE_27B7C2           
                    CMP.b #$37                  
                    BEQ   CODE_27B7DD           
                    CMP.b #$AB                  
                    BEQ   CODE_27B7DD           
                    CMP.b #$F9                  
                    BEQ   CODE_27B7DD           
CODE_27B7C2:        INC.w $1CEB,x               
                    LDA.w $1CEB,x               
                    CMP.b #$02                  
                    BNE   CODE_27B7CF           
                    JMP.w CODE_27B884           

CODE_27B7CF:        LDA.w $1CE3,x               
                    SEC                         
                    SBC.b #$02                  
                    STA.w $1CE3,x               
                    BCS   CODE_27B7DD                   
                    DEC.w $05FA,x               
CODE_27B7DD:        LDA.b #$FD                  
CODE_27B7DF:        STA.w $1CE7,x               
                    LDA.b #$03                  
                    STA.w $1CED,x               
                    RTS                         

CODE_27B7E8:        LDA.w $0563                 
                    BNE   CODE_27B827           
                    LDA.b $05                   
                    AND.b #$0F                  
                    CMP.b #$05                  
                    BCC   CODE_27B7DD           
                    RTS                         

CODE_27B7F6:        STA.w $0564                 
                    JSL.l CODE_279544           
                    LDA.b #$01                  
                    STA.w $1F9C                 
                    LDA.b $02                   
                    STA.w $052B                 
                    SBC.w $0543                 
                    STA.w $1F9F                 
                    LDA.b $03                   
                    STA.w $052A                 
                    LDA.b $04                   
                    AND.b #$F0                  
                    STA.w $0529                 
                    SBC.w $0210                 
                    STA.w $1FA2                 
                    LDA.b $06                   
                    STA.w $0528                 
                    JMP.w CODE_27B6A8           

CODE_27B827:        LDA.b $05                   
                    AND.b #$0F                  
                    STA.b $05                   
                    LDA.b $04                   
                    AND.b #$0F                  
                    STA.b $04                   
                    LDY.b $01                   
                    TYA                         
                    ASL   A                     
                    TAX                         
                    LDA.w $AAD0,x               
                    STA.b $02                   
                    LDA.w $AAD1,x               
                    STA.b $03                   
                    LDY.b $01                   
                    LDX.b $9B                   
                    LDA.b $00                   
                    SEC                         
                    SBC.w $1E96,y               
                    TAY                         
                    LDA.b ($02),y               
                    TAY                         
                    LDA.w $AD70,y               
                    CMP.b #$80                  
                    BEQ   CODE_27B884           
                    STA.b $06                   
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $04                   
                    TAY                         
                    LDA.w $AC0B,y               
                    AND.b #$0F                  
                    STA.b $01                   
                    LDA.b $05                   
                    CMP.b #$0C                  
                    BCS   CODE_27B873                   
                    CMP.b $01                   
                    BCC   CODE_27B88F           
CODE_27B873:        LDA.b $06                   
                    BEQ   CODE_27B88C           
                    LDY.b #$FB                  
                    EOR.w $1CE9,x               
                    BMI   CODE_27B880           
                    LDY.b #$FE                  
CODE_27B880:        TYA                         
                    JMP.w CODE_27B7DF           

CODE_27B884:        LDA.b #$01                  
                    STA.w $1200                 
                    JMP.w CODE_27B6A8           

CODE_27B88C:        JMP.w CODE_27B7DD           

CODE_27B88F:        RTS                         

CODE_27B890:        LDY.b #$04                  
CODE_27B892:        LDA.w $0651,y               
                    ORA.w $0681,y               
                    BNE   CODE_27B8B1           
                    LDX.w $0661,y               
                    LDA.w $B033,x               
                    BNE   CODE_27B8B1           
                    LDX.w $0671,y               
                    LDA.w $AE78,x               
                    STA.b $00                   
                    AND.b #$20                  
                    BNE   CODE_27B8B1           
                    JSR.w CODE_27B8B9           
CODE_27B8B1:        DEY                         
                    BPL   CODE_27B892           
                    LDX.b $9B                   
CODE_27B8B6:        SEP   #$20                  
                    RTS                         

CODE_27B8B9:        LDA.b $00                   
                    AND.b #$0F                  
                    TAX                         
                    STX.b $01                   
                    LDA.w $C6FD,x               
                    STA.b $DA                   
                    STZ.b $DB                   
                    LDA.w $C70D,x               
                    STA.b $DC                   
                    STZ.b $DD                   
                    LDX.b $9B                   
                    LDA.w $71,y               
                    STA.b $D8                   
                    LDA.w $56,y               
                    STA.b $D9                   
                    LDA.w $05FA,x               
                    XBA                         
                    LDA.w $1CE3,x               
                    REP   #$20                  
                    CLC                         
                    ADC.w #$000E                
                    SEC                         
                    SBC.b $D8                   
                    CMP.b $DA                   
                    BCS   CODE_27B8B6                   
                    SEP   #$20                  
                    LDA.w $5F,y               
                    STA.b $D8                   
                    LDA.w $44,y               
                    STA.b $D9                   
                    LDA.w $0247,x               
                    XBA                         
                    LDA.w $1CE5,x               
                    REP   #$20                  
                    CLC                         
                    ADC.w #$0008                
                    SEC                         
                    SBC.b $D8                   
                    CMP.b $DC                   
                    BCS   CODE_27B8B6
                    SEP   #$20                  
                    LDA.w $1CE1,x               
                    CMP.b #$02                  
                    BEQ   CODE_27B91C           
                    JSR.w CODE_27B6A8           
                    BRA   CODE_27B922           

CODE_27B91C:        LDA.b $00                   
                    BMI   CODE_27B95A           
                    BPL   CODE_27B928           
CODE_27B922:        LDA.b $00                   
                    AND.b #$40                  
                    BNE   CODE_27B95B           
CODE_27B928:        LDA.b #$03                  
                    STA.w $1200                 
                    LDA.w $1CF6,y               
                    BEQ   CODE_27B939           
                    SEC                         
                    SBC.b #$01                  
                    STA.w $1CF6,y               
                    RTS                         

CODE_27B939:        LDA.b #$CC                  
                    STA.w $9E,y               
                    LDA.w $1CE9,x               
                    ASL   A                     
                    LDA.b #$0C                  
                    BCC   CODE_27B948           
                    LDA.b #$F4                  
CODE_27B948:        STA.w $8C,y               
                    TYA                         
                    TAX                         
                    LDA.b #$05                  
                    JSL.l CODE_278A94           
                    LDX.b $9B                   
                    LDA.b #$06                  
                    STA.w $0661,y               
CODE_27B95A:        RTS                         

CODE_27B95B:        JMP.w CODE_27B884           

CODE_27B95E:        LDY.b $9C                   
                    BNE   CODE_27B974           
                    INC.w $1CE1,x               
                    LDA.w $1CE1,x               
                    CMP.b #$10                  
                    BNE   CODE_27B974           
CODE_27B96C:        SEP   #$30                  
                    LDA.b #$00                  
                    STA.w $1CE1,x               
                    RTS                         

CODE_27B974:        JSL.l CODE_27A19D           
                    LDA.w $0247,x               
                    XBA                         
                    LDA.w $1CE5,x               
                    REP   #$30                  
                    SBC.w #$0004                
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    LDA.b $D8                   
                    STA.w $0800,y               
                    STA.w $0808,y               
                    LDA.b $DA                   
                    STA.w $0804,y               
                    STA.w $080C,y               
                    LDA.w $05FA,x               
                    XBA                         
                    LDA.w $1CE3,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0216                 
                    CMP.w #$00D0                
                    BCS   CODE_27B96C                   
                    SEP   #$20                  
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    REP   #$20                  
                    LDA.w $1CE1,x               
                    AND.w #$00FF                
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C71D,x               
                    STA.w $0802,y               
                    STA.w $080E,y               
                    INC   A                     
                    STA.w $080A,y               
                    STA.w $0806,y               
                    LDA.b #$22                  
                    STA.b $DC                   
                    LDA.w $0588                 
                    BEQ   CODE_27B9F1           
                    LDA.b #$12                  
                    STA.b $DC                   
CODE_27B9F1:        LDA.b $DC                   
                    STA.w $0803,y               
                    STA.w $080B,y               
                    ORA.b #$C0                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A22,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A21,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    LDX.b $9B                   
CODE_27BA21:        RTS                         

CODE_27BA22:        LDY.w $056E                 
                    INY                         
                    BNE   CODE_27BA2B           
                    STY.w $05F4                 
CODE_27BA2B:        LDY.b $9C                   
                    BNE   CODE_27BA21           
                    LDA.w $0575                 
                    BEQ   CODE_27BA21           
                    STY.w $05F4                 
                    CMP.b #$01                  
                    BNE   CODE_27BA3E           
                    BRL   CODE_27BAE7           

CODE_27BA3E:        LDA.b $9D                   
                    CMP.b #$3C                  
                    BPL   CODE_27BA4D           
                    INC.b $9D                   
                    LDA.b $15                   
                    LSR   A                     
                    BCC   CODE_27BA4D           
                    INC.b $9D                   
CODE_27BA4D:        LDX.b #$00                  
                    JSL.l CODE_27A19D           
                    BEQ   CODE_27BA21           
                    LDA.w $0583                 
                    BNE   CODE_27BA21           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b #$46                  
                    STA.w $0802,y               
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080A,y               
                    STA.w $080E,y               
                    SEP   #$10                  
                    LDA.b $15                   
                    LSR   A                     
                    AND.b #$03                  
                    CLC                         
                    ADC.b #$05                  
                    LDX.w $056F                 
                    BNE   CODE_27BA81           
                    LDX.w $00BB                 
                    BNE   CODE_27BA84           
CODE_27BA81:        CLC                         
                    ADC.b #$0A                  
CODE_27BA84:        STA.b $00                   
                    LDX.b $9B                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b $82                   
                    CLC                         
                    ADC.b $00                   
                    SEC                         
                    SBC.b #$0A                  
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    LDA.b $79                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,y               
                    STA.w $080C,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    LDA.b #$80                  
                    STA.b $DC                   
                    LDA.b $79                   
                    STA.b $D8                   
                    STZ.b $D9                   
                    LDA.b $79                   
                    STA.b $DA                   
                    STZ.b $DB                   
                    LDA.b $15                   
                    AND.b #$03                  
                    SEC                         
                    SBC.b #$02                  
                    JSR.w CODE_27BE00           
                    RTS                         

CODE_27BAE7:        LDY.b #$7F                  
                    LDA.b $17                   
                    AND.b #$83                  
                    BEQ   CODE_27BAF1           
                    LDY.b #$3F                  
CODE_27BAF1:        TYA                         
                    AND.b $15                   
                    BNE   CODE_27BB02           
                    LDX.b #$02                  
CODE_27BAF8:        STX.b $9B                   
                    LDA.w $1F7C,x               
                    BEQ   CODE_27BB03           
                    DEX                         
                    BPL   CODE_27BAF8           
CODE_27BB02:        RTS                         

CODE_27BB03:        LDA.w $0783                 
                    ORA.b #$10                  
                    STA.w $1F7C,x               
                    LDY.b #$00                  
                    LDA.b $BC                   
                    CMP.b #$12                  
                    BCC   CODE_27BB2B           
                    LDY.b #$03                  
                    CMP.b #$15                  
                    BCC   CODE_27BB2B           
                    LDY.b #$00                  
                    CMP.b #$1F                  
                    BCC   CODE_27BB2B           
                    INY                         
                    CMP.b #$23                  
                    BCC   CODE_27BB2B           
                    INY                         
                    CMP.b #$27                  
                    BCC   CODE_27BB2B           
                    LDY.b #$00                  
CODE_27BB2B:        TYA                         
                    ASL   A                     
                    TAY                         
                    BIT.b $BD                   
                    BVC   $01                   
                    INY                         
                    LDA.b #$00                  
                    LDX.b $BB                   
                    BNE   CODE_27BB3B           
                    LDA.b #$08                  
CODE_27BB3B:        LDX.b $9B                   
                    CLC                         
                    ADC.b $70                   
                    ADC.w $C721,y               
                    STA.w $1F84,x               
                    LDA.b $55                   
                    ADC.b #$00                  
                    STA.w $1F80,x               
                    LDA.b $5E                   
                    CLC                         
                    ADC.w $C729,y               
                    STA.w $1F8C,x               
                    LDA.b $43                   
                    ADC.b #$00                  
                    STA.w $1F88,x               
                    RTS                         

CODE_27BB5E:        LDX.b #$03                  
CODE_27BB60:        STX.b $9B                   
                    LDA.w $1F7C,x               
                    BEQ   CODE_27BB6A           
                    JSR.w CODE_27BB6E           
CODE_27BB6A:        DEX                         
                    BPL   CODE_27BB60           
                    RTS                         

CODE_27BB6E:        LDA.b $9C                   
                    BEQ   CODE_27BB75           
                    JMP.w CODE_27BB90           

CODE_27BB75:        INC.w $1F7C,x               
                    LDA.w $1F7C,x               
                    ORA.b #$80                  
                    STA.w $1F7C,x               
                    AND.b #$30                  
                    BEQ   CODE_27BB90           
                    DEC.w $1F84,x               
                    LDY.w $1F84,x               
                    INY                         
                    BNE   CODE_27BB90           
                    DEC.w $1F80,x               
CODE_27BB90:        LDA.w $0425                 
                    BEQ   CODE_27BBB5           
                    LDA.w $1F84,x               
                    CLC                         
                    ADC.b #$0A                  
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.w $1F80,x               
                    ADC.b #$60                  
                    STA.b $01                   
                    LDA.w $1F8C,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    STA.b $00                   
                    LDY.b #$00                  
                    BEQ   CODE_27BBF5           
CODE_27BBB5:        LDA.w $1F84,x               
                    CLC                         
                    ADC.b #$02                  
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.w $1F80,x               
                    ADC.b #$00                  
                    PHA                         
                    LDA.w $1F8C,x               
                    STA.b $04                   
                    PLA                         
                    STA.b $01                   
                    PHX                         
                    LDA.w $1F88,x               
                    ASL   A                     
                    TAX                         
                    LDA.l $218200,x             
                    STA.b $00                   
                    STA.b $D8                   
                    LDA.b $01                   
                    AND.b #$01                  
                    CLC                         
                    ADC.l $218201,x             
                    STA.b $01                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    PLX                         
                    LDA.b $04                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    TAY                         
CODE_27BBF5:        LDA.b #$7E                  
                    STA.b $02                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BEQ   CODE_27BC17           
                    PHX                         
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $AB57,x               
                    STA.b $D8                   
                    LDA.w $AB58,x               
                    STA.b $D9                   
                    LDA.b [$00],y               
                    TAY                         
                    LDA.b ($D8),y               
                    PLX                         
                    BRA   CODE_27BC19           

CODE_27BC17:        LDA.b [$00],y               
CODE_27BC19:        PHA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    STA.b $00                   
                    PLA                         
                    STA.b $01                   
                    LDY.b $00                   
                    CMP.w $1E96,y               
                    BCS   CODE_27BC45                   
                    LDA.w $0560                 
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.b $01                   
                    CMP.b #$E0                  
                    BEQ   CODE_27BC45           
                    CMP.b #$E1                  
                    BEQ   CODE_27BC45           
                    LDA.w $AD84,y               
                    CMP.b $01                   
                    BCC   CODE_27BC4D           
CODE_27BC45:        SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $1F7C,x               
                    RTS                         

CODE_27BC4D:        STZ.b $01                   
                    LDA.w $0565                 
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $C731,y               
                    STA.b $00                   
                    CMP.b #$80                  
                    BCC   CODE_27BC62           
                    DEC.b $01                   
CODE_27BC62:        LDA.b $15                   
                    AND.b #$03                  
                    ADC.b $9B                   
                    TAY                         
                    LDA.w $C735,y               
                    BMI   CODE_27BCD6           
                    TAY                         
                    LDA.w $0801,y               
                    CMP.b #$F0                  
                    BNE   CODE_27BCD6           
                    LDA.w $0543                 
                    STA.b $D8                   
                    LDA.w $0542                 
                    STA.b $D9                   
                    LDA.w $1F80,x               
                    XBA                         
                    LDA.w $1F84,x               
                    REP   #$20                  
                    SEC                         
                    SBC.b $D8                   
                    CMP.w #$00C8                
                    BCS   CODE_27BC45                   
                    SEP   #$20                  
                    STA.w $0801,y               
                    STA.w $0805,y               
                    LDA.w $1F88,x               
                    XBA                         
                    LDA.w $1F8C,x               
                    REP   #$20                  
                    CLC                         
                    ADC.b $00                   
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    CMP.b #$F8                  
                    BCS   CODE_27BC45                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b #$C6                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b #$23                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
CODE_27BCD6:        RTS                         

CODE_27BCD7:        LDX.b #$02                  
CODE_27BCD9:        STX.b $9B                   
                    LDA.w $1F90,x               
                    BEQ   CODE_27BCFE           
                    LDA.b $9C                   
                    BNE   CODE_27BCFB           
                    INC.w $1F90,x               
                    LDA.b $15                   
                    LSR   A                     
                    BCC   CODE_27BCEF           
                    INC.w $1F90,x               
CODE_27BCEF:        LDA.w $1F90,x               
                    CMP.b #$30                  
                    BCC   CODE_27BCFB           
                    JSR.w CODE_27BD02           
                    BEQ   CODE_27BCFE           
CODE_27BCFB:        JSR.w CODE_27BD0A           
CODE_27BCFE:        DEX                         
                    BPL   CODE_27BCD9           
                    RTS                         

CODE_27BD02:        SEP   #$30                  
                    LDA.b #$00                  
                    STA.w $1F90,x               
CODE_27BD09:        RTS                         

CODE_27BD0A:        LDA.w $0216                 
                    STA.w $02A7                 
                    LDA.w $0217                 
                    STA.w $02A8                 
                    LDY.b #$01                  
                    JSL.l CODE_27DEF1           
                    BCS   CODE_27BD26                   
                    LDA.b #$EF                  
                    STA.w $02A7                 
                    STZ.w $02A8                 
CODE_27BD26:        JSL.l CODE_27A19D           
                    BEQ   CODE_27BD09           
                    LDA.b $EF,x                 
                    XBA                         
                    LDA.w $1F96,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    CMP.w #$FFF0                
                    BCS   CODE_27BD42                   
                    CMP.w #$0100                
                    BCS   CODE_27BD02                   
CODE_27BD42:        STA.b $D8                   
                    PHA                         
                    PHP                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    PLP                         
                    PLA                         
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    ADC.b #$08                  
                    STA.w $0808,y               
                    STA.w $080C,y               
                    LDA.w $058E,x               
                    XBA                         
                    LDA.w $1F93,x               
                    REP   #$20                  
                    STA.b $DC                   
                    LDA.w $1F99,x               
                    AND.w #$00FF                
                    PHP                         
                    LDA.b $DC                   
                    PLP                         
                    BNE   CODE_27BD7A           
                    SEC                         
                    SBC.w $02A7                 
CODE_27BD7A:        CMP.w #$00AE                
                    BCS   CODE_27BD02                   
                    SEP   #$20                  
                    STA.w $0801,y               
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    STA.w $080D,y               
                    REP   #$20                  
                    LDA.w $1F90,x               
                    AND.w #$00FF                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    STA.b $00                   
                    LDA.w $C73C,x               
                    STA.w $0802,y               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0806,y               
                    STA.w $080E,y               
                    LDX.w #$0000                
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BNE   CODE_27BDBC           
                    LDX.w #$0001                
CODE_27BDBC:        TXA                         
                    STA.b $DC                   
                    ORA.b #$22                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    ORA.b #$62                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    SEP   #$10                  
                    LDX.b $9B                   
                    LDA.b $00                   
                    CMP.b #$03                  
                    BCS   CODE_27BDDC                   
                    BRL   CODE_27BE5E           

CODE_27BDDC:        LDA.b $15                   
                    AND.b #$01                  
                    ORA.b $9C                   
                    BNE   CODE_27BDF5           
                    LDA.w $1F93,x               
                    CLC                         
                    ADC.b #$01                  
                    STA.w $1F93,x               
                    LDA.w $058E,x               
                    ADC.b #$00                  
                    STA.w $058E,x               
CODE_27BDF5:        LDA.w $1F90,x               
                    SEC                         
                    SBC.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
CODE_27BE00:        STA.b $00                   
                    STZ.b $01                   
                    REP   #$30                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.b $00                   
                    STA.b $D8                   
                    LDA.b $DA                   
                    CLC                         
                    ADC.b $00                   
                    STA.b $DA                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    LDA.w $0800,y               
                    SEC                         
                    SBC.b $00                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0808,y               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0808,y               
                    STA.w $080C,y               
                    LDA.b $DC                   
                    ORA.b #$22                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    ORA.b #$40                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    LDA.w $0565                 
                    AND.b #$02                  
                    BNE   CODE_27BE5E           
                    LDA.b $00                   
                    ASL   A                     
                    ORA.b $DC                   
                    ORA.b #$A0                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    ORA.b #$40                  
                    STA.w $080B,y               
                    STA.w $080F,y               
CODE_27BE5E:        REP   #$30                  
                    LDA.b $C6,x                 
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    RTS                         

CODE_27BE7E:        LDA.w $05F4                 
                    CMP.b #$08                  
                    BCC   CODE_27BE8A           
                    LDA.b #$08                  
                    STA.w $05F4                 
CODE_27BE8A:        LDX.b #$04                  
CODE_27BE8C:        STX.b $9B                   
                    LDA.w $079F,x               
                    AND.b #$7F                  
                    BEQ   CODE_27BEAA           
                    CMP.b #$0D                  
                    BCC   CODE_27BEA5           
                    LDA.w $079F,x               
                    AND.b #$80                  
                    ORA.b #$0D                  
                    STA.w $079F,x               
                    AND.b #$7F                  
CODE_27BEA5:        STA.b $00                   
                    JSR.w CODE_27BEAE           
CODE_27BEAA:        DEX                         
                    BPL   CODE_27BE8C           
                    RTL                         

CODE_27BEAE:        LDA.w $0551                 
                    ORA.w $0555                 
                    ORA.w $0554                 
                    BNE   CODE_27BEBD           
                    LDA.b $9C                   
                    BNE   CODE_27BF13           
CODE_27BEBD:        LDA.w $07A4,x               
                    BNE   CODE_27BEC8           
CODE_27BEC2:        LDA.b #$00                  
                    STA.w $079F,x               
                    RTS                         

CODE_27BEC8:        DEC.w $07A4,x               
                    CMP.b #$2A                  
                    BNE   CODE_27BEFA           
                    LDY.b $00                   
                    LDA.w $069C                 
                    CLC                         
                    ADC.w $C75B,y               
                    STA.w $069C                 
                    LDA.w $069D                 
                    ADC.w $C768,y               
                    STA.w $069D                 
                    CPY.b #$0D                  
                    BNE   CODE_27BEF8           
                    LDA.b #$05                  
                    STA.w $1203                 
                    LDX.w $0726                 
                    LDA.w $0736,x               
                    BMI   CODE_27BEF8           
                    INC.w $0736,x               
CODE_27BEF8:        LDX.b $9B                   
CODE_27BEFA:        LDA.w $07A4,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $15                   
                    AND.w $C776,y               
                    BNE   CODE_27BF13           
                    LDA.w $07A9,x               
                    CMP.b #$04                  
                    BCC   CODE_27BF13           
                    DEC.w $07A9,x               
CODE_27BF13:        STZ.b $D9                   
                    LDA.w $0781                 
                    STA.b $D8                   
                    CMP.b #$80                  
                    BCC   CODE_27BF20           
                    DEC.b $D9                   
CODE_27BF20:        LDA.w $0251,x               
                    XBA                         
                    LDA.w $07AE,x               
                    REP   #$20                  
                    SEC                         
                    SBC.b $D8                   
                    SEP   #$20                  
                    STA.w $07AE,x               
                    XBA                         
                    STA.w $0251,x               
                    LDA.w $07AE,x               
                    CMP.b #$F8                  
                    BCS   CODE_27BEC2                   
                    LDA.w $07A9,x               
                    SEC                         
                    SBC.w $0780                 
                    STA.w $07A9,x               
                    CMP.b #$F8                  
                    BCC   CODE_27BF4D           
                    BRL   CODE_27BEC2           

CODE_27BF4D:        JSL.l CODE_27A19D           
                    STZ.b $01                   
                    LDX.b $00                   
                    LDA.w $C741,x               
                    LDX.b $9B                   
                    CMP.b #$FF                  
                    BEQ   CODE_27BF99           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    STA.w $0802,y               
                    CMP.w $C74E                 
                    BNE   CODE_27BF6E           
                    LDA.b #$22                  
                    BRA   CODE_27BF70           

CODE_27BF6E:        LDA.b #$20                  
CODE_27BF70:        STA.w $0803,y               
                    LDA.w $07A9,x               
                    STA.w $0801,y               
                    LDA.w $07AE,x               
                    STA.w $0800,y               
                    REP   #$20                  
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0004                
                    STA.b $C6,x                 
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0251,x               
                    AND.b #$01                  
                    STA.w $0A20,y               
                    SEP   #$10                  
CODE_27BF99:        REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.w $07A9,x               
                    STA.w $0801,y               
                    LDA.w $07AE,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0800,y               
                    LDA.w $0251,x               
                    ADC.b #$00                  
                    STA.b $D8                   
                    LDX.b $00                   
                    LDA.w $C74E,x               
                    STA.w $0802,y               
                    LDA.b #$20                  
                    CPX.w #$000D                
                    BNE   CODE_27BFC4           
                    ORA.b #$02                  
CODE_27BFC4:        STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D8                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

CODE_27BFDB:        LDX.b #$01                  
CODE_27BFDD:        STX.b $9B                   
                    JSR.w CODE_27BFE6           
                    DEX                         
                    BPL   CODE_27BFDD           
CODE_27BFE5:        RTS                         

CODE_27BFE6:        LDA.w $1F9C,x               
                    BEQ   CODE_27BFE5           
                    CMP.b #$02                  
                    BEQ   CODE_27BFF2           
                    JMP.w CODE_27C1CC           

CODE_27BFF2:        LDA.b $9C                   
                    BNE   CODE_27BFFF           
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_27BFFF           
                    INC.w $1FA5,x               
CODE_27BFFF:        LDA.w $1FB1,x               
                    STA.b $01                   
                    LDA.w $1F9F,x               
                    STA.b $00                   
                    REP   #$20                  
                    LDA.w $0780                 
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_27C019           
                    ORA.w #$FF00                
CODE_27C019:        STA.b $02                   
                    LDA.w $1FA5,x               
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_27C029           
                    ORA.w #$FF00                
CODE_27C029:        STA.b $D8                   
                    LDA.b $9C                   
                    AND.w #$00FF                
                    BEQ   CODE_27C037           
                    LDA.w #$0000                
                    BRA   CODE_27C039           

CODE_27C037:        LDA.b $D8                   
CODE_27C039:        CLC                         
                    ADC.b $00                   
                    SEC                         
                    SBC.b $02                   
                    STA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $04                   
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $1F9F,x               
                    LDA.b $01                   
                    STA.w $1FB1,x               
                    LDA.b $05                   
                    BEQ   CODE_27C060           
                    LDA.w $1FAE,x               
                    AND.b #$08                  
                    BNE   CODE_27C06F           
                    BRA   CODE_27C067           

CODE_27C060:        LDA.w $1FAE,x               
                    AND.b #$08                  
                    BEQ   CODE_27C06F           
CODE_27C067:        LDA.w $1FAE,x               
                    EOR.b #$08                  
                    STA.w $1FAE,x               
CODE_27C06F:        LDA.b $9C                   
                    BNE   CODE_27C076           
                    INC.w $1FA8,x               
CODE_27C076:        LDA.w $1FAB,x               
                    STA.b $00                   
                    LDA.b $DF,x                 
                    STA.b $01                   
                    REP   #$20                  
                    LDA.b $9C                   
                    AND.w #$00FF                
                    BEQ   CODE_27C08D           
                    LDA.w #$0000                
                    BRA   CODE_27C093           

CODE_27C08D:        LDA.b $D8                   
                    CLC                         
                    ADC.w #$0002                
CODE_27C093:        CLC                         
                    ADC.b $00                   
                    SEC                         
                    SBC.b $02                   
                    STA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $04                   
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $1FAB,x               
                    LDA.b $01                   
                    STA.b $DF,x                 
                    LDA.b $05                   
                    BEQ   CODE_27C0B9           
                    LDA.w $1FAE,x               
                    AND.b #$04                  
                    BNE   CODE_27C0C8           
                    BRA   CODE_27C0C0           

CODE_27C0B9:        LDA.w $1FAE,x               
                    AND.b #$04                  
                    BEQ   CODE_27C0C8           
CODE_27C0C0:        LDA.w $1FAE,x               
                    EOR.b #$04                  
                    STA.w $1FAE,x               
CODE_27C0C8:        STZ.b $DD                   
                    LDA.w $0781                 
                    STA.b $DC                   
                    BPL   CODE_27C0D3           
                    DEC.b $DD                   
CODE_27C0D3:        LDA.w $02AE,x               
                    XBA                         
                    LDA.w $1FA2,x               
                    REP   #$20                  
                    SEC                         
                    SBC.b $DC                   
                    SEP   #$20                  
                    STA.w $1FA2,x               
                    XBA                         
                    STA.w $02AE,x               
                    JSR.w CODE_27D788           
                    BCC   CODE_27C0EE           
                    RTS                         

CODE_27C0EE:        LDA.w $1FAE,x               
                    STA.b $03                   
                    CMP.b #$0C                  
                    BCC   CODE_27C101           
                    LDA.w $1FB1,x               
                    CMP.b #$01                  
                    BNE   CODE_27C101           
                    JMP.w CODE_27C1C6           

CODE_27C101:        LDA.b $03                   
                    AND.b #$08                  
                    BNE   CODE_27C110           
                    LDA.w $1F9F,x               
                    STA.w $0801,y               
                    STA.w $0805,y               
CODE_27C110:        LDA.b $03                   
                    AND.b #$04                  
                    BNE   CODE_27C11F           
                    LDA.w $1FAB,x               
                    STA.w $0809,y               
                    STA.w $080D,y               
CODE_27C11F:        LSR.b $03                   
                    BCC   CODE_27C12B           
                    LDA.b #$F0                  
                    STA.w $0801,y               
                    STA.w $0809,y               
CODE_27C12B:        LSR.b $03                   
                    BCC   CODE_27C137           
                    LDA.b #$F0                  
                    STA.w $0805,y               
                    STA.w $080D,y               
CODE_27C137:        STZ.b $DD                   
                    LDA.w $1FA8,x               
                    STA.b $DC                   
                    LDA.w $02AE,x               
                    XBA                         
                    LDA.w $1FA2,x               
                    REP   #$20                  
                    CLC                         
                    ADC.b $DC                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    STA.w $0800,y               
                    STA.w $0808,y               
                    LDA.b $DB                   
                    BEQ   CODE_27C164           
                    LDA.w $1FAE,x               
                    ORA.b #$01                  
                    STA.w $1FAE,x               
CODE_27C164:        LDA.w $02AE,x               
                    XBA                         
                    LDA.w $1FA2,x               
                    REP   #$20                  
                    SEC                         
                    SBC.b $DC                   
                    STA.b $DC                   
                    SEP   #$20                  
                    STA.w $0804,y               
                    STA.w $080C,y               
                    LDA.b $DD                   
                    BEQ   CODE_27C186           
                    LDA.w $1FAE,x               
                    ORA.b #$02                  
                    STA.w $1FAE,x               
CODE_27C186:        LDA.w $0565                 
                    AND.b #$06                  
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    ROR   A                     
                    ORA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b #$4A                  
                    STA.w $0802,y               
                    STA.w $0806,y               
                    STA.w $080A,y               
                    STA.w $080E,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A22,y               
                    LDA.b $DD                   
                    AND.b #$01                  
                    STA.w $0A21,y               
                    STA.w $0A23,y               
                    PLY                         
CODE_27C1C5:        RTS                         

CODE_27C1C6:        LDA.b #$00                  
                    STA.w $1F9C,x               
                    RTS                         

CODE_27C1CC:        LDA.w $1FAE,x               
                    BEQ   CODE_27C1C6           
                    LDA.b $9C                   
                    BNE   CODE_27C1D8           
                    DEC.w $1FAE,x               
CODE_27C1D8:        LDA.w $1F9F,x               
                    LDY.w $05FC                 
                    BNE   CODE_27C1E7           
                    SEC                         
                    SBC.w $0780                 
                    STA.w $1F9F,x               
CODE_27C1E7:        CMP.b #$D0                  
                    BCS   CODE_27C1C6                   
                    CPY.b #$00                  
                    BNE   CODE_27C1F9           
                    LDA.w $1FA2,x               
                    SEC                         
                    SBC.w $0781                 
                    STA.w $1FA2,x               
CODE_27C1F9:        CMP.b #$F0                  
                    BCS   CODE_27C1C6                   
                    TXA                         
                    EOR.b $15                   
                    AND.b #$01                  
                    TAY                         
                    LDA.w $C77C,y               
                    TAY                         
                    LDA.w $0801,y               
                    CMP.b #$F0                  
                    BNE   CODE_27C1C5           
                    LDA.w $1FA2,x               
                    STA.w $0800,y               
                    STA.w $0808,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    STA.w $080C,y               
                    LDA.w $1F9F,x               
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $080D,y               
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    STA.b $00                   
                    LDA.b #$22                  
                    ORA.b $00                   
                    STA.w $0803,y               
                    STA.w $080B,y               
                    EOR.b #$C0                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    LDA.w $1FAE,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $C836,x               
                    STA.b $D8                   
                    INC   A                     
                    STA.b $D9                   
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_27C26F           
                    LDA.b $D8                   
                    PHA                         
                    LDA.b $D9                   
                    STA.b $D8                   
                    PLA                         
                    STA.b $D9                   
CODE_27C26F:        LDA.b $D8                   
                    STA.w $0802,y               
                    STA.w $080E,y               
                    LDA.b $D9                   
                    STA.w $080A,y               
                    STA.w $0806,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    LDX.b $9B                   
                    RTS                         

CODE_27C294:        LDX.b #$03                  
CODE_27C296:        STX.b $9B                   
                    LDA.w $1FB4,x               
                    BEQ   CODE_27C2A0           
                    JSR.w CODE_27C2A4           
CODE_27C2A0:        DEX                         
                    BPL   CODE_27C296           
                    RTS                         

CODE_27C2A4:        LDA.b $9C                   
                    BNE   CODE_27C30B           
                    LDA.w $1FC0,x               
                    CMP.b #$05                  
                    BEQ   CODE_27C2E2           
                    INC.w $1FC4,x               
                    LDA.w $1FB8,x               
                    CLC                         
                    ADC.w $1FC0,x               
                    STA.w $1FB8,x               
                    LDA.w $1FC4,x               
                    AND.b #$03                  
                    BNE   CODE_27C2E2           
                    INC.w $1FC0,x               
                    LDA.w $1FC0,x               
                    CMP.b #$05                  
                    BNE   CODE_27C2E2           
                    LDA.w $1FB8,x               
                    STA.l $7FC52E,x             
                    STZ.w $1FC4,x               
                    LDA.w $1FB4,x               
                    PHA                         
                    JSR.w CODE_27C412           
                    PLA                         
                    STA.w $1FB4,x               
CODE_27C2E2:        LDA.w $0781                 
                    STA.b $D8                   
                    STZ.b $D9                   
                    CMP.b #$80                  
                    BCC   CODE_27C2EF           
                    DEC.b $D9                   
CODE_27C2EF:        LDA.w $024C,x               
                    XBA                         
                    LDA.w $1FBC,x               
                    REP   #$20                  
                    SEC                         
                    SBC.b $D8                   
                    SEP   #$20                  
                    STA.w $1FBC,x               
                    XBA                         
                    STA.w $024C,x               
                    LDA.w $1FBC,x               
                    CMP.b #$F8                  
                    BCS   CODE_27C327                   
CODE_27C30B:        LDA.w $1FC0,x               
                    CMP.b #$05                  
                    BNE   CODE_27C315           
                    BRL   CODE_27C39B           

CODE_27C315:        LDA.b $9C                   
                    BEQ   CODE_27C32A           
                    LDA.w $1FB8,x               
                    SEC                         
                    SBC.w $0780                 
                    STA.w $1FB8,x               
                    CMP.b #$C5                  
                    BCC   CODE_27C32A           
CODE_27C327:        BRL   CODE_27C43C           

CODE_27C32A:        JSL.l CODE_27A19D           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.w $1FB8,x               
                    CMP.b #$A8                  
                    BCC   CODE_27C33B           
                    LDA.b #$F0                  
CODE_27C33B:        STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $1FBC,x               
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $024C,x               
                    STA.b $D8                   
                    REP   #$20                  
                    LDA.w $1FC4,x               
                    LSR   A                     
                    LSR   A                     
                    AND.w #$0003                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C77E,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C782,x               
                    STA.w $0803,y               
                    STA.w $0807,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D8                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

DATA_27C38B:        db $E0,$E0,$E0,$E0,$E2,$E2,$E2,$E2
                    db $E4,$E4,$E4,$E4,$E4,$E4,$E4,$E4

CODE_27C39B:        LDA.b $9C                   
                    BEQ   CODE_27C3B2           
                    LDA.l $7FC52E,x             
                    SEC                         
                    SBC.w $0780                 
                    STA.l $7FC52E,x             
                    CMP.b #$C5                  
                    BCC   CODE_27C3B2           
                    BRL   CODE_27C43C           

CODE_27C3B2:        JSL.l CODE_27A19D           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.l $7FC52E,x             
                    STA.w $0801,y               
                    LDA.w $024C,x               
                    XBA                         
                    LDA.w $1FBC,x               
                    REP   #$20                  
                    CLC                         
                    ADC.w #$FFFC                
                    SEP   #$20                  
                    STA.w $0800,y               
                    STA.w $0804,y               
                    XBA                         
                    STA.b $D8                   
                    REP   #$20                  
                    LDA.w $1FC4,x               
                    AND.w #$000F                
                    TAX                         
                    SEP   #$20                  
                    LDA   DATA_27C38B,x             
                    STA.w $0802,y               
                    LDA.b #$21                  
                    STA.w $0803,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D8                   
                    AND.b #$01                  
                    ORA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    SEP   #$10                  
                    LDX.b $9B                   
                    INC.w $1FC4,x               
                    LDA.w $1FC4,x               
                    AND.b #$0F                  
                    BEQ   CODE_27C43C           
                    RTS                         

CODE_27C412:        JSR.w CODE_278ADB           
                    LDA.b #$85                  
                    STA.w $079F,y               
                    LDA.b #$30                  
                    STA.w $07A4,y               
                    LDA.w $1FB8,x               
                    CMP.b #$C0                  
                    BCC   CODE_27C428           
                    LDA.b #$05                  
CODE_27C428:        STA.w $07A9,y               
                    LDA.w $1FBC,x               
                    SEC                         
                    SBC.b #$04                  
                    STA.w $07AE,y               
                    LDA.w $024C,x               
                    SBC.b #$00                  
                    STA.w $0251,y               
CODE_27C43C:        LDA.b #$00                  
                    STA.w $1FB4,x               
                    RTS                         

CODE_27C442:        LDA.b #$01                  
                    STA.w $1A68,x               
                    LDA.w $05BF,x               
                    CLC                         
                    ADC.b #$0C                  
                    STA.b $05                   
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.w $1FD7,x               
                    ADC.b #$00                  
                    PHA                         
                    LDA.w $05C9,x               
                    CLC                         
                    ADC.b #$04                  
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.w $0210                 
                    STA.b $04                   
                    PLA                         
                    STA.b $01                   
                    PHX                         
                    LDA.b $12                   
                    ADC.b #$00                  
                    ASL   A                     
                    TAX                         
                    LDA.l $218200,x             
                    STA.b $00                   
                    STA.b $DB                   
                    LDA.b $01                   
                    AND.b #$01                  
                    CLC                         
                    ADC.l $218201,x             
                    STA.b $01                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $DC                   
                    PLX                         
                    LDA.b $04                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    TAY                         
                    LDA.b #$7E                  
                    STA.b $02                   
                    STA.b $DD                   
                    LDA.b [$DB],y               
                    BEQ   CODE_27C4B7           
                    PHX                         
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $AB57,x               
                    STA.b $DB                   
                    LDA.w $AB58,x               
                    STA.b $DC                   
                    LDA.b [$00],y               
                    TAY                         
                    LDA.b ($DB),y               
                    PLX                         
                    BRA   CODE_27C4B9           

CODE_27C4B7:        LDA.b [$00],y               
CODE_27C4B9:        PHA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    TAY                         
                    STY.b $01                   
                    PLA                         
                    STA.b $00                   
                    CMP.w $1E96,y               
                    BCC   CODE_27C505           
                    CMP.w $1E9A,y               
                    BCC   CODE_27C4F4           
                    LDA.w $1FC8,x               
                    CMP.b #$0C                  
                    BEQ   CODE_27C4D8           
                    SEC                         
                    RTS                         

CODE_27C4D8:        INC.w $06C7,x               
                    LDA.w $06C7,x               
                    CMP.b #$02                  
                    BNE   CODE_27C4E5           
                    JMP.w CODE_27C527           

CODE_27C4E5:        DEC.w $05BF,x               
                    DEC.w $05BF,x               
                    DEC.w $05BF,x               
CODE_27C4EE:        LDA.b #$D4                  
                    STA.w $05D3,x               
CODE_27C4F3:        RTS                         

CODE_27C4F4:        LDA.w $1FC8,x               
                    CMP.b #$0C                  
                    CLC                         
                    BNE   CODE_27C4F3           
                    LDA.b $05                   
                    AND.b #$0F                  
                    CMP.b #$05                  
                    BCC   CODE_27C4EE           
                    RTS                         

CODE_27C505:        LDA.w $1FC8,x               
                    CMP.b #$14                  
                    CLC                         
                    BNE   CODE_27C521           
                    LDA.w $0560                 
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $01                   
                    TAY                         
                    LDA.w $AD84,y               
                    CMP.b $00                   
                    BCC   CODE_27C520           
                    DEC.w $1A68,x               
CODE_27C520:        RTS                         

CODE_27C521:        LDA.b #$00                  
                    STA.w $06C7,x               
                    RTS                         

CODE_27C527:        LDA.b #$01                  
                    STA.w $1200                 
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    JMP.w CODE_27D38A           

CODE_27C536:        LDA.b #$00                  
                    STA.w $06B6                 
                    LDX.b #$09                  
CODE_27C53D:        STX.b $9B                   
                    JSR.w CODE_27C546           
                    DEX                         
                    BPL   CODE_27C53D           
CODE_27C545:        RTS                         

CODE_27C546:        LDA.w $1FC8,x               
                    BEQ   CODE_27C545           
                    LDA.w $05FE                 
                    BEQ   CODE_27C56F           
                    LDA.b $9C                   
                    BNE   CODE_27C56F           
                    LDA.w $05C9,x               
                    CLC                         
                    ADC.l $7E3952               
                    STA.w $05C9,x               
                    LDA.w $05BF,x               
                    CLC                         
                    ADC.l $7E3953               
                    STA.w $05BF,x               
                    BCC   CODE_27C56F           
                    INC.w $1FD7,x               
CODE_27C56F:        LDY.b $9C                   
                    BNE   CODE_27C57B           
                    LDY.w $06D1,x               
                    BEQ   CODE_27C57B           
                    DEC.w $06D1,x               
CODE_27C57B:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    CMP.w #$00F8                
                    BCC   CODE_27C595           
                    CMP.w #$FFF8                
                    BCS   CODE_27C595                   
                    SEP   #$20                  
                    BRA   CODE_27C5D1           

CODE_27C595:        SEP   #$20                  
                    LDA.w $05BF,x               
                    CLC                         
                    ADC.b #$14                  
                    PHA                         
                    LDA.w $1FD7,x               
                    ADC.b #$00                  
                    STA.b $00                   
                    PLA                         
                    CMP.w $0543                 
                    LDA.b $00                   
                    SBC.w $0542                 
                    STA.b $0D                   
                    BEQ   CODE_27C5D6           
                    LDA.w $1FC8,x               
                    CMP.b #$0E                  
                    BEQ   CODE_27C5CD           
                    CMP.b #$06                  
                    BEQ   CODE_27C5CD           
                    CMP.b #$10                  
                    BEQ   CODE_27C5CD           
                    CMP.b #$13                  
                    BEQ   CODE_27C5CD           
                    CMP.b #$07                  
                    BEQ   CODE_27C5CD           
                    CMP.b #$01                  
                    BNE   CODE_27C5D1           
CODE_27C5CD:        LDA.b $0D                   
                    BMI   CODE_27C5D6           
CODE_27C5D1:        SEP   #$20                  
                    JMP.w CODE_27D37F           

CODE_27C5D6:        LDA.w $1FC8,x               
                    JSL.l CODE_20FB1F           

                    dw CODE_27C545
                    dw CODE_27D175
                    dw CODE_27D442
                    dw CODE_27D508
                    dw CODE_27D576
                    dw CODE_27D576
                    dw CODE_27D013
                    dw CODE_27CF6B
                    dw CODE_27CE2B
                    dw CODE_27CEC9
                    dw CODE_27CD7B
                    dw CODE_27CC31
                    dw CODE_27D576
                    dw CODE_27C91B
                    dw CODE_27CB74
                    dw CODE_27CAAE
                    dw CODE_27C995
                    dw CODE_27C7A7
                    dw CODE_27D576
                    dw CODE_27C7A7
                    dw CODE_27C6D6
                    dw CODE_27C60F
                    dw CODE_27D672
                    dw CODE_27DFF2
                    dw CODE_27E05B

CODE_27C60F:        JSR.w CODE_27C67F         ;Draw GFX for laser sprite
                    LDA.b $9C                 ;\
                    BNE   CODE_27C65A         ;/
                    LDA.w $05BF,x             ;\
                    CLC                       ; |
                    ADC.b #$08                ; |Y position decreases by 8 every frame
                    STA.w $05BF,x             ;/
                    LDA.b $E2,x               ;\
                    XBA                       ; |
                    LDA.w $05C9,x             ; |
                    REP   #$20                ; |
                    SEC                       ; |
                    SBC.w #$0008              ; |X position decreases by 8 every frame
                    SEP   #$20                ; |
                    STA.w $05C9,x             ; |
                    XBA                       ; |
                    STA.b $E2,x               ;/
                    JSR.w CODE_27C442         ;\Related to detecting solid tile for laser to
                    BCC   CODE_27C65A         ;/interact with? Return if none found
                    LDA.w $05BF,x             ;\ Prepare smoke image position by altering own position
                    AND.b #$F0                ; |(Extended sprite Y position &= 0xF0) + 0x05
                    CLC                       ; |
                    ADC.b #$05                ; |
                    STA.w $05BF,x             ;/
                    LDA.w $05C9,x             ;\
                    AND.b #$F0                ; |(Extended sprite X position &= 0xF0) + 0x0B
                    ADC.b #$0B                ; |
                    STA.w $05C9,x             ;/
                    JSR.w CODE_27D37F         ;Remove self (store 00 to extended sprite number)
                    LDY.b #$01                ;\
CODE_27C652:        LDA.w $1F9C,y             ; |Search for free slot for smoke image
                    BEQ   CODE_27C65B         ; |
                    DEY                       ; |
                    BPL   CODE_27C652         ; |
CODE_27C65A:        RTS                       ;/

CODE_27C65B:        LDA.b #$01                ;\Smoke image = smoke
                    STA.w $1F9C,y             ;/
                    LDA.w $05C9,x             ;\
                    SEC                       ; |
                    SBC.b #$08                ; |Setup smoke image x position
                    SEC                       ; |
                    SBC.w $0210               ; |
                    STA.w $1FA2,y             ;/
                    LDA.w $05BF,x             ;\
                    CLC                       ; |
                    ADC.b #$04                ; |Setu smoke image Y position
                    SBC.w $0543               ; |
                    STA.w $1F9F,y             ;/
                    LDA.b #$17                ;\How long does the smoke image last.
                    STA.w $1FAE,y             ;/
                    RTS                         

CODE_27C67F:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b #$4A                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    ASL   A                     
                    ORA.b #$21                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    JMP.w CODE_27D302           

                    RTS                         

CODE_27C6D6:        LDA.b $9C                   
                    BNE   CODE_27C723           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_27C710           
                    LDA.w $06C7,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $05D3,x               
                    CLC                         
                    ADC.w $C78E,y               
                    STA.w $05D3,x               
                    CMP.w $C790,y               
                    BNE   CODE_27C6F8           
                    INC.w $06C7,x               
CODE_27C6F8:        LDA.w $06BD,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $05DD,x               
                    CLC                         
                    ADC.w $C78E,y               
                    STA.w $05DD,x               
                    CMP.w $C790,y               
                    BNE   CODE_27C710           
                    INC.w $06BD,x               
CODE_27C710:        JSR.w CODE_27D7E3           
                    LDA.w $05D3,x               
                    BPL   CODE_27C720           
                    JSR.w CODE_27C442           
                    LDA.w $1A68,x               
                    BEQ   CODE_27C723           
CODE_27C720:        JSR.w CODE_27D80F           
CODE_27C723:        LDA.w $06D1,x               
                    BEQ   CODE_27C7A4           
                    CMP.b #$30                  
                    BCS   CODE_27C730                   
                    AND.b #$02                  
                    BNE   CODE_27C7A1           
CODE_27C730:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    REP   #$10                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    REP   #$20                  
                    LDA.w $0565                 
                    LSR   A                     
                    AND.w #$000F                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $0801,y               
                    CLC                         
                    ADC.w $C792,x               
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    TXA                         
                    CMP.b #$08                  
                    LDA.b #$B4                  
                    BCC   CODE_27C775           
                    LDA.b #$B6                  
CODE_27C775:        STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b #$2A                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    LDX.b $9B                   
                    AND.b #$01                  
                    BNE   CODE_27C7A1           
                    JMP.w CODE_27D302           

CODE_27C7A1:        SEP   #$20                  
                    RTS                         

CODE_27C7A4:        JMP.w CODE_27D37F           

CODE_27C7A7:        LDA.b $9C                   
                    BNE   CODE_27C7CC           
                    INC.w $06BD,x               
                    JSR.w CODE_27CC1B           
                    LDA.w $1FC8,x               
                    CMP.b #$13                  
                    BNE   CODE_27C7CC           
                    LDA.w $05D3,x               
                    BMI   CODE_27C7C1           
                    CMP.b #$70                  
                    BCS   CODE_27C7CC                   
CODE_27C7C1:        LDA.w $06C7,x               
                    BNE   CODE_27C7C9           
                    INC.w $05D3,x               
CODE_27C7C9:        INC.w $05D3,x               
CODE_27C7CC:        JSR.w CODE_27D728           
                    LDA.w $1FD7,x               
                    XBA                         
                    LDA.w $05BF,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0216                 
                    CMP.w #$0100                
                    BCC   CODE_27C7E6           
                    CMP.w #$FFF0                
                    BCC   CODE_27C7A1           
CODE_27C7E6:        SEP   #$20                  
                    LDA.w $1FC8,x               
                    CMP.b #$13                  
                    BEQ   CODE_27C7F2           
                    BRL   CODE_27C8A1           

CODE_27C7F2:        LDA.w $06C7,x               
                    BEQ   CODE_27C848           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.b #$4A                  
                    STA.w $0802,y               
                    LDA.b #$06                  
                    STA.b $00                   
                    LDA.w $06D1,x               
                    BEQ   CODE_27C826           
                    JSL.l CODE_27AA74           
                    ASL   A                     
                    STA.b $00                   
                    LDA.b #$4B                  
                    STA.w $0802,y               
CODE_27C826:        LDA.w $0565                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    AND.b #$C0                  
                    ORA.b #$20                  
                    ORA.b $00                   
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    SEP   #$10                  
                    RTS                         

CODE_27C848:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CF49           
                    LDA.b #$0C                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    RTS                         

CODE_27C8A1:        LDA.w $05D3,x               
                    CMP.b #$20                  
                    BMI   CODE_27C8B6           
                    JSR.w CODE_27D37F           
                    INC.w $0422                 
                    JSR.w CODE_278ADB           
                    LDA.b #$89                  
                    JMP.w CODE_27CD2B           

CODE_27C8B6:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.w #$0004                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    REP   #$20                  
                    LDA.w $06BD,x               
                    LSR   A                     
                    LSR   A                     
                    AND.w #$0003                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C786,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C78A,x               
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

CODE_27C91B:        LDA.w $06C7,x               
                    BNE   CODE_27C991           
                    LDA.w $06D1,x               
                    BEQ   CODE_27C992           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA.b $15                   
                    AND.w $C7A2,y               
                    BNE   CODE_27C939           
                    JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
CODE_27C939:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b #$3A                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.b $9B                   
                    AND.b #$03                  
                    ASL   A                     
                    ORA.b #$21                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    RTS                         

CODE_27C991:        RTS                         

CODE_27C992:        JMP.w CODE_27D37F           

CODE_27C995:        LDA.b $9C                   
                    BNE   CODE_27C9F6           
                    JSR.w CODE_27CC1B           
                    DEC.w $05D3,x               
                    LDA.w $1CFC                 
                    CLC                         
                    ADC.w $06BD,x               
                    STA.w $1CFC                 
                    BCC   CODE_27C9AE           
                    INC.w $1CFD                 
CODE_27C9AE:        JSR.w CODE_27C442           
                    BCC   CODE_27C9F6           
                    LDA.w $05D3,x               
                    BMI   CODE_27C9F6           
                    CMP.b #$20                  
                    BCC   CODE_27C9E3           
                    LSR   A                     
                    JSL.l CODE_27A859           
                    STA.w $05D3,x               
                    DEC.w $05BF,x               
                    DEC.w $05BF,x               
                    LDA.w $1CFE                 
                    BNE   CODE_27C9D4           
                    LDA.b #$38                  
                    STA.w $1200                 
CODE_27C9D4:        INC.w $1CFE                 
                    LDA.w $06BD,x               
                    CLC                         
                    ADC.b #$80                  
                    STA.w $06BD,x               
                    JMP.w CODE_27C9F6           

CODE_27C9E3:        LDA.b #$00                  
                    STA.w $05D3,x               
                    STA.w $1CFD                 
                    LDA.w $05BF,x               
                    AND.b #$F0                  
                    CLC                         
                    ADC.b #$05                  
                    STA.w $05BF,x               
CODE_27C9F6:        JSR.w CODE_27D728           
                    BEQ   CODE_27C9FC           
                    RTS                         

CODE_27C9FC:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,y               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CF49           
                    LDA.w $0801,y               
                    SBC.b #$04                  
                    STA.w $0801,y               
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    STA.w $080D,y               
                    REP   #$20                  
                    LDA.w $1CFE                 
                    AND.w #$00FF                
                    LSR   A                     
                    LDA.w $1CFD                 
                    AND.w #$0007                
                    BCC   CODE_27CA3F           
                    EOR.w #$0007                
CODE_27CA3F:        AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C7A6,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C7AE,x               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.w $C7B6,x               
                    STA.w $0803,y               
                    STA.w $0807,y               
                    ORA.b #$40                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    AND.b #$80                  
                    BEQ   CODE_27CA8A           
                    LDA.w $0802,y               
                    INC   A                     
                    STA.w $0802,y               
                    LDA.w $0806,y               
                    DEC   A                     
                    STA.w $0806,y               
                    LDA.w $080A,y               
                    INC   A                     
                    STA.w $080A,y               
                    LDA.w $080E,y               
                    DEC   A                     
                    STA.w $080E,y               
CODE_27CA8A:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    LDX.b $9B                   
                    JMP.w CODE_27D302           

                    RTS                         

CODE_27CAAE:        LDA.b $9C                   
                    BNE   CODE_27CB05           
                    LDA.w $0597,x               
                    BEQ   CODE_27CABF           
                    LDA.b $15                   
                    LSR   A                     
                    BCC   CODE_27CABF           
                    DEC.w $0597,x               
CODE_27CABF:        LDA.w $06C7,x               
                    BEQ   CODE_27CAF9           
                    LDY.w $06BD,x               
                    LDA.w $0661,y               
                    CMP.b #$02                  
                    BNE   CODE_27CAEF           
                    LDA.w $0671,y               
                    CMP.b #$67                  
                    BNE   CODE_27CAEF           
                    LDA.w $68,y               
                    CMP.b #$4F                  
                    BCC   CODE_27CAEF           
                    LDA.w $0565                 
                    INC.w $05C9,x               
                    AND.b #$02                  
                    BNE   CODE_27CAEC           
                    DEC.w $05C9,x               
                    DEC.w $05C9,x               
CODE_27CAEC:        JMP.w CODE_27CB05           

CODE_27CAEF:        LDA.b #$00                  
                    STA.w $06C7,x               
                    LDA.b #$C0                  
                    STA.w $0597,x               
CODE_27CAF9:        LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_27CB05           
                    JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
CODE_27CB05:        LDA.w $0597,x               
                    BNE   CODE_27CB0D           
                    JMP.w CODE_27D37F           

CODE_27CB0D:        CMP.b #$30                  
                    BCS   CODE_27CB1A                   
                    TXA                         
                    ASL   A                     
                    ADC.w $0597,x               
                    AND.b #$02                  
                    BNE   CODE_27CB73           
CODE_27CB1A:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LDA.b #$18                  
                    BCC   CODE_27CB4D           
                    LDA.b #$1A                  
CODE_27CB4D:        STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b #$23                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    JMP.w CODE_27D302           

CODE_27CB73:        RTS                         

CODE_27CB74:        LDA.b $9C                   
                    BNE   CODE_27CBB7           
                    LDA.w $06D1,x               
                    BNE   CODE_27CB80           
                    JMP.w CODE_27D37F           

CODE_27CB80:        LDA.w $06C7,x               
                    BNE   CODE_27CBA5           
                    JSR.w CODE_27D80F           
                    LDA.w $05D3,x               
                    BMI   CODE_27CB97           
                    SEC                         
                    SBC.b #$07                  
                    STA.w $05D3,x               
                    BPL   CODE_27CBA2           
                    BMI   CODE_27CB9F           
CODE_27CB97:        CLC                         
                    ADC.b #$07                  
                    STA.w $05D3,x               
                    BMI   CODE_27CBA2           
CODE_27CB9F:        INC.w $06C7,x               
CODE_27CBA2:        JMP.w CODE_27CBB7           

CODE_27CBA5:        INC.w $06BD,x               
                    LDA.w $06BD,x               
                    AND.b #$30                  
                    BEQ   CODE_27CBB7           
                    DEC.w $05BF,x               
                    BNE   CODE_27CBB7           
                    DEC.w $1FD7,x               
CODE_27CBB7:        LDA.w $0565                 
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $C731,y               
                    STA.b $00                   
                    JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $05C9,x               
                    CLC                         
                    ADC.b $00                   
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b #$C6                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b #$23                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    RTS                         

CODE_27CC1B:        JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
                    LDA.w $05D3,x               
                    BMI   CODE_27CC2A           
                    CMP.b #$6E                  
                    BCS   CODE_27CC30                   
CODE_27CC2A:        INC.w $05D3,x               
                    INC.w $05D3,x               
CODE_27CC30:        RTS                         

CODE_27CC31:        LDA.b $9C                   
                    BNE   CODE_27CC46           
                    JSR.w CODE_27CC1B           
                    JSR.w CODE_27CD5F           
                    LDA.w $06C7,x               
                    BNE   CODE_27CC46           
                    DEC.w $05D3,x               
                    DEC.w $05D3,x               
CODE_27CC46:        JSR.w CODE_27D728           
                    BNE   CODE_27CC30           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CF49           
                    LDA.b #$2A                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b #$CE                  
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b #$CC                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    LDA.w $06C7,x               
                    ORA.w $00BF                 
                    ORA.w $0583                 
                    BNE   CODE_27CD25           
                    LDY.b #$00                  
                    LDA.b $BB                   
                    BEQ   CODE_27CCBB           
                    LDA.w $056F                 
                    BNE   CODE_27CCBB           
                    INY                         
CODE_27CCBB:        LDA.w $05BF,x               
                    SEC                         
                    SBC.b $70                   
                    SEC                         
                    SBC.w $C7BE,y               
                    CMP.w $C7C0,y               
                    BCS   CODE_27CD25                   
                    LDA.w $05C9,x               
                    CLC                         
                    ADC.b #$08                  
                    SEC                         
                    SBC.b $5E                   
                    CMP.b #$14                  
                    BCS   CODE_27CD25                   
                    LDA.w $0553                 
                    BNE   CODE_27CD09           
                    LDA.b $9D                   
                    BMI   CODE_27CD22           
                    LDA.w $1FD7,x               
                    XBA                         
                    LDA.w $05BF,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0216                 
                    SEC                         
                    SBC.w #$0013                
                    STA.b $D8                   
                    SEP   #$20                  
                    CMP.b $82                   
                    PHP                         
                    LDY.w $0544                 
                    BPL   CODE_27CD06           
                    LDY.b $D9                   
                    BMI   CODE_27CD06           
                    PLP                         
                    BCS   CODE_27CD22                   
                    BRA   CODE_27CD09           

CODE_27CD06:        PLP                         
                    BCC   CODE_27CD22           
CODE_27CD09:        LDA.b #$01                  
                    STA.w $06C7,x               
                    LDA.b #$00                  
                    STA.w $05DD,x               
                    STA.w $05D3,x               
                    LDA.b #$D0                  
                    STA.b $9D                   
                    LDA.b #$02                  
                    STA.w $1200                 
                    JMP.w CODE_27CD26           

CODE_27CD22:        JMP.w CODE_27D336           

CODE_27CD25:        RTS                         

CODE_27CD26:        JSR.w CODE_278ADB           
                    LDA.b #$85                  
CODE_27CD2B:        CLC                         
                    ADC.w $05F4                 
                    STA.w $079F,y               
                    INC.w $05F4                 
                    LDA.b #$30                  
                    STA.w $07A4,y               
                    LDA.w $05BF,x               
                    SEC                         
                    SBC.w $0543                 
                    SBC.b #$06                  
                    CMP.b #$C0                  
                    BCC   CODE_27CD49           
                    LDA.b #$05                  
CODE_27CD49:        STA.w $07A9,y               
                    LDA.w $05C9,x               
                    SEC                         
                    SBC.w $0210                 
                    STA.w $07AE,y               
                    LDA.b $E2,x                 
                    SBC.w $0211                 
                    STA.w $0251,y               
                    RTS                         

CODE_27CD5F:        LDA.w $05FC                 
                    BEQ   CODE_27CD7A           
                    LDY.b #$00                  
                    LDA.w $0780                 
                    BPL   CODE_27CD6C           
                    DEY                         
CODE_27CD6C:        CLC                         
                    ADC.w $05BF,x               
                    STA.w $05BF,x               
                    TYA                         
                    ADC.w $1FD7,x               
                    STA.w $1FD7,x               
CODE_27CD7A:        RTS                         

CODE_27CD7B:        LDA.b $9C                   
                    BNE   CODE_27CD90           
                    JSR.w CODE_27CD5F           
                    JSR.w CODE_27D7E3           
                    LDA.w $05D3,x               
                    BEQ   CODE_27CD8D           
                    INC.w $05D3,x               
CODE_27CD8D:        JSR.w CODE_27D80F           
CODE_27CD90:        JSR.w CODE_27D302           
                    JSR.w CODE_27D728           
                    BNE   CODE_27CE15           
                    LDA.w $05DD,x               
                    AND.b #$80                  
                    STA.b $00                   
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    LDY.b $C6,x                 
                    LDA.w $0565                 
                    LSR   A                     
                    CLC                         
                    ADC.b $9B                   
                    AND.w #$0003                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C7C2,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C7C6,x               
                    EOR.b $00                   
                    ORA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_27CDE5           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_27CDE5:        REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
CODE_27CE15:        RTS                         

CODE_27CE16:        LDA.w $05BF,x               
                    SEC                         
                    SBC.w $0543                 
                    STA.w $0801,y               
                    LDA.w $05C9,x               
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0800,y               
                    RTS                         

CODE_27CE2B:        LDA.b $9C                   
                    BNE   CODE_27CE35           
                    JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
CODE_27CE35:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    LDY.b $C6,x                 
                    LDA.w $06D1,x               
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$BE                  
                    CPX.w #$00E0                
                    BCS   CODE_27CE61                   
                    LDA.b #$BA                  
                    CPX.w #$00C0                
                    BCS   CODE_27CE61                   
                    LDA.b #$BC                  
CODE_27CE61:        STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_27CE16           
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    TXA                         
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    STA.b $00                   
                    LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    ORA.b #$22                  
                    EOR.b $00                   
                    STA.w $0803,y               
                    STA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_27CEAF           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_27CEAF:        PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    SEP   #$10                  
                    JMP.w CODE_27D302           

                    RTS                         

CODE_27CEC9:        LDA.b $9C                   
                    BNE   CODE_27CED0           
                    JSR.w CODE_27CC1B           
CODE_27CED0:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    LDY.b $C6,x                 
                    LDA.w $06C7,x               
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C7D2,x               
                    STA.w $0803,y               
                    STA.w $0807,y               
                    CPX.w #$0000                
                    BEQ   CODE_27CF02           
                    ORA.b #$40                  
CODE_27CF02:        STA.w $080B,y               
                    STA.w $080F,y               
                    TXA                         
                    ASL   A                     
                    TAX                         
                    LDA.w $C7CA,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C7CB,x               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
                    PHY                         
                    REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    PLY                         
                    JSR.w CODE_27CF49           
                    SEP   #$10                  
                    RTS                         

CODE_27CF49:        JSR.w CODE_27CE16           
                    LDA.w $0801,y               
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    STA.w $080D,y               
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,y               
                    STA.w $080C,y               
                    RTS                         

CODE_27CF6B:        LDA.b $9C                   
                    BNE   CODE_27CF7D           
                    LDA.w $06C7,x               
                    BEQ   CODE_27CF7A           
                    JSR.w CODE_27CC1B           
                    JMP.w CODE_27CF7D           

CODE_27CF7A:        JSR.w CODE_27D7E3           
CODE_27CF7D:        JSR.w CODE_27D728           
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    SEP   #$20                  
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b #$94                  
                    STA.w $0802,y               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0806,y               
                    STA.w $080E,y               
                    JSR.w CODE_27CF49           
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    ORA.b #$2A                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    EOR.b #$C0                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    AND.b #$80                  
                    BEQ   CODE_27CFD7           
                    LDA.w $080A,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $080A,y               
                    PLA                         
                    STA.w $080E,y               
CODE_27CFD7:        LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_27CFEC           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_27CFEC:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    SEP   #$10                  
                    LDA.w $06C7,x               
                    BNE   CODE_27D012           
                    JMP.w CODE_27D302           

CODE_27D012:        RTS                         

CODE_27D013:        LDA.b $9C                   
                    BEQ   CODE_27D01A           
                    JMP.w CODE_27D0DC           

CODE_27D01A:        LDA.w $06C7,x               
                    BNE   CODE_27D022           
                    JMP.w CODE_27D0AE           

CODE_27D022:        BPL   CODE_27D02A           
                    JSR.w CODE_27CC1B           
                    JMP.w CODE_27D0DC           

CODE_27D02A:        LDY.w $0553                 
                    BNE   CODE_27D04F           
                    LDY.w $0575                 
                    BNE   CODE_27D04F           
                    INC.w $06B6                 
                    CMP.b #$05                  
                    BCS   CODE_27D044                   
                    LDA.b $15                   
                    AND.b #$0F                  
                    BNE   CODE_27D044           
                    INC.w $06C7,x               
CODE_27D044:        LDA.b $18                   
                    AND.b #$FF                  
                    BEQ   CODE_27D065           
                    DEC.w $06C7,x               
                    BNE   CODE_27D065           
CODE_27D04F:        LDA.b #$FF                  
                    STA.w $06C7,x               
                    LDA.b #$E0                  
                    STA.w $05D3,x               
                    LDA.b #$08                  
                    LDY.w $0783,x               
                    BPL   CODE_27D062           
                    LDA.b #$F8                  
CODE_27D062:        STA.w $05DD,x               
CODE_27D065:        INC.w $06BD,x               
                    LDA.w $06BD,x               
                    LSR   A                     
                    LSR   A                     
                    AND.b #$1F                  
                    CMP.b #$10                  
                    AND.b #$0F                  
                    BCC   CODE_27D079           
                    EOR.b #$0F                  
                    ADC.b #$00                  
CODE_27D079:        CLC                         
                    LDY.w $056F                 
                    BNE   CODE_27D083           
                    LDY.b $BB                   
                    BNE   CODE_27D087           
CODE_27D083:        LSR   A                     
                    CLC                         
                    ADC.b #$08                  
CODE_27D087:        ADC.b $70                   
                    STA.w $05BF,x               
                    LDA.b $55                   
                    ADC.b #$00                  
                    STA.w $1FD7,x               
                    LDA.w $06BD,x               
                    AND.b #$1F                  
                    CMP.b #$10                  
                    AND.b #$0F                  
                    BCC   CODE_27D0A2           
                    EOR.b #$0F                  
                    ADC.b #$00                  
CODE_27D0A2:        SEC                         
                    SBC.b #$03                  
                    CLC                         
                    ADC.b $5E                   
                    STA.w $05C9,x               
                    JMP.w CODE_27D0DC           

CODE_27D0AE:        JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
                    LDA.w $05D3,x               
                    CMP.b #$10                  
                    BPL   CODE_27D0BE           
                    INC.w $05D3,x               
CODE_27D0BE:        LDA.b $15                   
                    AND.b #$00                  
                    BNE   CODE_27D0DC           
                    LDA.w $06BD,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $05DD,x               
                    CLC                         
                    ADC.w $C7D6,y               
                    STA.w $05DD,x               
                    CMP.w $C7D8,y               
                    BNE   CODE_27D0DC           
                    INC.w $06BD,x               
CODE_27D0DC:        JSR.w CODE_27D728           
                    BEQ   CODE_27D0E4           
                    BRL   CODE_27D16D           

CODE_27D0E4:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    LDA.w $06C7,x               
                    BEQ   CODE_27D115           
                    BMI   CODE_27D115           
                    TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    EOR.w $06BD,x               
                    AND.b #$10                  
                    BEQ   CODE_27D115           
                    PHX                         
                    REP   #$20                  
                    TXA                         
                    ASL   A                     
                    TAX                         
                    SEP   #$20                  
                    LDY.w $C7DA,x               
                    PLX                         
CODE_27D115:        JSR.w CODE_27CE16           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    STA.w $0805,y               
                    LDA.b #$FE                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDX.w #$0002                
                    LDA.w $0565                 
                    AND.b #$08                  
                    BEQ   CODE_27D13A           
                    LDX.w #$0042                
CODE_27D13A:        TXA                         
                    ORA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    REP   #$20                  
                    LDA.b $9B                   
                    TAX                         
                    SEP   #$20                  
                    LDA.w $06C7,x               
                    BEQ   CODE_27D170           
                    BPL   CODE_27D16D           
                    LDA.b #$A6                  
                    STA.w $0803,y               
                    STA.w $0807,y               
CODE_27D16D:        SEP   #$10                  
                    RTS                         

CODE_27D170:        SEP   #$10                  
                    JMP.w CODE_27D302           

CODE_27D175:        LDA.b $9C                   
                    BEQ   CODE_27D17C           
                    JMP.w CODE_27D231           

CODE_27D17C:        LDA.w $06C7,x               
                    AND.b #$0F                  
                    BNE   CODE_27D186           
                    BRL   CODE_27D22B           

CODE_27D186:        DEC.w $06C7,x               
                    LDA.w $1FC8,x               
                    CMP.b #$01                  
                    BNE   CODE_27D19C           
                    LDA.w $06C7,x               
                    AND.b #$0F                  
                    BNE   CODE_27D19C           
                    LDA.b #$37                  
                    STA.w $1200                 
CODE_27D19C:        LDA.w $06C7,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    STY.b $01                   
                    LDA.w $0661,y               
                    CMP.b #$02                  
                    BNE   CODE_27D1B4           
                    LDA.w $0651,y               
                    AND.b #$C0                  
                    BEQ   CODE_27D1B7           
CODE_27D1B4:        JMP.w CODE_27D37F           

CODE_27D1B7:        LDA.w $0679,y               
                    AND.b #$40                  
                    STA.b $02                   
                    ASL   A                     
                    ASL   A                     
                    ROL   A                     
                    AND.b #$01                  
                    STA.b $00                   
                    LDA.w $1FC8,x               
                    CMP.b #$01                  
                    BEQ   CODE_27D1D0           
                    INC.b $00                   
                    INC.b $00                   
CODE_27D1D0:        LDA.w $0671,y               
                    CMP.b #$86                  
                    BNE   CODE_27D1DE           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$04                  
                    STA.b $00                   
CODE_27D1DE:        LDA.w $5F,y               
                    LDY.b $00                   
                    CLC                         
                    ADC.w $C7EE,y               
                    STA.w $05C9,x               
                    LDY.b $00                   
                    STZ.b $DD                   
                    LDA.w $C7F4,y               
                    STA.b $DC                   
                    BPL   CODE_27D1F7           
                    DEC.b $DD                   
CODE_27D1F7:        LDY.b $01                   
                    LDA.w $56,y               
                    XBA                         
                    LDA.w $71,y               
                    REP   #$20                  
                    CLC                         
                    ADC.b $DC                   
                    SEP   #$20                  
                    STA.w $05BF,x               
                    XBA                         
                    STA.w $1FD7,x               
                    LDA.b #$00                  
                    LDY.w $05DD,x               
                    BMI   CODE_27D217           
                    LDA.b #$40                  
CODE_27D217:        CMP.b $02                   
                    BEQ   CODE_27D228           
                    LDA.w $05DD,x               
                    JSL.l CODE_27A859           
                    STA.w $05DD,x               
                    INC.w $0597,x               
CODE_27D228:        JMP.w CODE_27D231           

CODE_27D22B:        INC.w $06BD,x               
                    JSR.w CODE_27CC1B           
CODE_27D231:        JSR.w CODE_27D728           
                    BEQ   CODE_27D237           
                    RTS                         

CODE_27D237:        STY.b $01                   
                    LDA.w $05DD,x               
                    LDY.w $1FC8,x               
                    CPY.b #$01                  
                    BEQ   CODE_27D245           
                    EOR.b #$80                  
CODE_27D245:        LSR   A                     
                    AND.b #$40                  
                    STA.b $00                   
                    CPY.b #$01                  
                    BNE   CODE_27D256           
                    LDY.b $01                   
                    JSR.w CODE_27D395           
                    JMP.w CODE_27D2F0           

CODE_27D256:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    LDY.b $C6,x                 
                    LDA.w $06BD,x               
                    AND.w #$000C                
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.b $00                   
                    EOR.w $C81C,x               
                    ORA.b #$23                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b $00                   
                    BEQ   CODE_27D290           
                    INX                         
                    INX                         
CODE_27D290:        REP   #$20                  
                    TXA                         
                    AND.w #$0003                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C820,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C822,x               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_27D2D0           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
                    LDA.w $080A,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $080A,y               
                    PLA                         
                    STA.w $080E,y               
CODE_27D2D0:        PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    PLY                         
                    SEP   #$10                  
CODE_27D2F0:        LDX.b $9B                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CF49           
                    SEP   #$10                  
                    LDA.w $06C7,x               
                    AND.b #$0F                  
                    BNE   CODE_27D357           
CODE_27D302:        TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCC   CODE_27D357           
                    LDY.b #$00                  
                    LDA.b $BB                   
                    BEQ   CODE_27D315           
                    LDA.w $056F                 
                    BNE   CODE_27D315           
                    INY                         
CODE_27D315:        LDA.w $05BF,x               
                    CLC                         
                    ADC.b #$08                  
                    SEC                         
                    SBC.b $70                   
                    SEC                         
                    SBC.w $C7FA,y               
                    CMP.w $C7FC,y               
                    BCS   CODE_27D384                   
                    LDA.w $05C9,x               
                    CLC                         
                    ADC.b #$06                  
                    SEC                         
                    SBC.b $5E                   
                    SBC.b #$00                  
                    CMP.b #$10                  
                    BCS   CODE_27D384                   
CODE_27D336:        LDA.w $0552                 
                    ORA.w $057A                 
                    ORA.b $9C                   
                    ORA.w $00BF                 
                    ORA.w $0583                 
                    ORA.w $0587                 
                    ORA.b $0D                   
                    BNE   CODE_27D384           
                    LDA.w $1FC8,x               
                    CMP.b #$06                  
                    BNE   CODE_27D358           
                    LDA.b #$05                  
                    STA.w $06C7,x               
CODE_27D357:        RTS                         

CODE_27D358:        CMP.b #$10                  
                    BNE   CODE_27D375           
                    INC.w $07BE                 
                    LDA.b #$01                  
                    STA.w $02D9                 
                    LDA.b #$0B                  
                    STA.w $1202                 
                    LDA.b #$60                  
                    STA.w $02E3                 
                    LDA.b #$01                  
                    STA.w $02E4                 
                    BRA   CODE_27D37F           

CODE_27D375:        LDA.w $0553                 
                    BNE   CODE_27D385           
                    JSL.l CODE_27A4C6           
                    RTS                         

CODE_27D37F:        LDA.b #$00                  
                    STA.w $1FC8,x               
CODE_27D384:        RTS                         

CODE_27D385:        LDA.b #$03                  
                    STA.w $1200                 
CODE_27D38A:        LDA.b #$16                  
                    STA.w $1FC8,x               
                    LDA.b #$1F                  
                    STA.w $06C7,x               
                    RTS                         

CODE_27D395:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    LDY.b $C6,x                 
                    LDA.w $06BD,x               
                    AND.w #$001C                
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    STA.b $DC                   
                    LDA.b $DB                   
                    STA.b $DD                   
                    LDA.b $00                   
                    EOR.w $C800,x               
                    ORA.b #$21                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b $00                   
                    BEQ   CODE_27D3D9           
                    INX                         
                    INX                         
                    INX                         
                    INX                         
CODE_27D3D9:        REP   #$20                  
                    TXA                         
                    AND.w #$0007                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C808,x               
                    STA.b $D8                   
                    INC   A                     
                    STA.b $D9                   
                    LDA.w $C80C,x               
                    STA.b $DA                   
                    INC   A                     
                    STA.b $DB                   
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_27D40D           
                    LDA.b $D8                   
                    PHA                         
                    LDA.b $D9                   
                    STA.b $D8                   
                    PLA                         
                    STA.b $D9                   
                    LDA.b $DA                   
                    PHA                         
                    LDA.b $DB                   
                    STA.b $DA                   
                    PLA                         
                    STA.b $DB                   
CODE_27D40D:        LDA.b $D8                   
                    STA.w $0802,y               
                    LDA.b $D9                   
                    STA.w $0806,y               
                    LDA.b $DA                   
                    STA.w $080A,y               
                    LDA.b $DB                   
                    STA.w $080E,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $DC                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $DD                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    PLY                         
                    SEP   #$10                  
                    RTS                         

CODE_27D442:        LDA.b $9C                   
                    BEQ   CODE_27D449           
                    JMP.w CODE_27D231           

CODE_27D449:        LDA.w $06C7,x               
                    AND.b #$0F                  
                    BEQ   CODE_27D453           
                    JMP.w CODE_27D186           

CODE_27D453:        INC.w $06BD,x               
                    LDA.b $15                   
                    AND.b #$0A                  
                    BNE   CODE_27D461           
                    LDA.b #$48                  
                    STA.w $1203                 
CODE_27D461:        LDA.w $0597,x               
                    BMI   CODE_27D492           
                    LDA.w $06D1,x               
                    BNE   CODE_27D492           
                    LDA.w $0597,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $05DD,x               
                    CLC                         
                    ADC.w $C814,y               
                    STA.w $05DD,x               
                    CMP.w $C816,y               
                    BNE   CODE_27D492           
                    LDA.b #$30                  
                    STA.w $06D1,x               
                    INC.w $0597,x               
                    LDA.w $05B5,x               
                    BEQ   CODE_27D492           
                    LDA.b #$FF                  
                    STA.w $0597,x               
CODE_27D492:        LDA.b $15                   
                    LSR   A                     
                    BCS   CODE_27D4B8                   
                    LDA.w $05B5,x               
                    CMP.b #$01                  
                    BCC   CODE_27D4A3           
                    LDY.w $05D3,x               
                    BEQ   CODE_27D4B8           
CODE_27D4A3:        AND.b #$01                  
                    TAY                         
                    LDA.w $05D3,x               
                    CLC                         
                    ADC.w $C818,y               
                    STA.w $05D3,x               
                    CMP.w $C81A,y               
                    BNE   CODE_27D4B8           
                    INC.w $05B5,x               
CODE_27D4B8:        JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
                    JSR.w CODE_27D231           
                    LDA.w $0597,x               
                    BPL   CODE_27D507           
                    TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCS   CODE_27D507                   
                    LDA.w $06C7,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $0661,y               
                    CMP.b #$02                  
                    BNE   CODE_27D507           
                    LDA.w $0671,y               
                    CMP.b #$82                  
                    BNE   CODE_27D507           
                    LDA.w $05BF,x               
                    CLC                         
                    ADC.b #$08                  
                    SEC                         
                    SBC.w $0071,y               
                    SEC                         
                    SBC.b #$08                  
                    CMP.b #$10                  
                    BCS   CODE_27D507                   
                    LDA.w $05C9,x               
                    CLC                         
                    ADC.b #$08                  
                    SEC                         
                    SBC.w $005F,y               
                    SBC.b #$00                  
                    CMP.b #$10                  
                    BCS   CODE_27D507                   
                    JMP.w CODE_27D37F           

CODE_27D507:        RTS                         

CODE_27D508:        LDA.b $9C                   
                    BEQ   CODE_27D50F           
                    JMP.w CODE_27D231           

CODE_27D50F:        LDA.w $06C7,x               
                    AND.b #$0F                  
                    BEQ   CODE_27D519           
                    JMP.w CODE_27D186           

CODE_27D519:        DEC.w $06BD,x               
                    LDY.w $06D1,x               
                    BEQ   CODE_27D527           
                    DEY                         
                    BNE   CODE_27D54A           
                    INC.w $05B5,x               
CODE_27D527:        LDA.b $15                   
                    AND.b #$00                  
                    BNE   CODE_27D54A           
                    LDA.w $0597,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $05DD,x               
                    CLC                         
                    ADC.w $C826,y               
                    STA.w $05DD,x               
                    CMP.w $C828,y               
                    BNE   CODE_27D54A           
                    LDA.b #$50                  
                    STA.w $06D1,x               
                    INC.w $0597,x               
CODE_27D54A:        LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_27D573           
                    LDA.w $05B5,x               
                    BEQ   CODE_27D573           
                    CMP.b #$03                  
                    BCC   CODE_27D55E           
                    LDY.w $05D3,x               
                    BEQ   CODE_27D573           
CODE_27D55E:        AND.b #$01                  
                    TAY                         
                    LDA.w $05D3,x               
                    CLC                         
                    ADC.w $C82A,y               
                    STA.w $05D3,x               
                    CMP.w $C82C,y               
                    BNE   CODE_27D573           
                    INC.w $05B5,x               
CODE_27D573:        JMP.w CODE_27D4B8           

CODE_27D576:        LDA.b $9C                   
                    BNE   CODE_27D5B1           
                    INC.w $06BD,x               
                    LDA.w $1FC8,x               
                    CMP.b #$05                  
                    BEQ   CODE_27D5AB           
                    CMP.b #$12                  
                    BEQ   CODE_27D5AB           
                    JSR.w CODE_27CC1B           
                    LDA.w $05D3,x               
                    CMP.b #$30                  
                    BPL   CODE_27D598           
                    INC.w $05D3,x               
                    INC.w $05D3,x               
CODE_27D598:        LDA.w $1FC8,x               
                    CMP.b #$0C                  
                    BNE   CODE_27D5A2           
                    JSR.w CODE_27C442           
CODE_27D5A2:        JMP.w CODE_27D5B1           

                    JSR.w CODE_27CC1B           
                    JMP.w CODE_27D5B1           

CODE_27D5AB:        JSR.w CODE_27D7E3           
                    JSR.w CODE_27D80F           
CODE_27D5B1:        JSR.w CODE_27D728           
                    BEQ   CODE_27D5B9           
                    BRL   CODE_27D671           

CODE_27D5B9:        LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $1FC8,x               
                    CMP.b #$12                  
                    BNE   CODE_27D5FA           
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    LDA.b #$88                  
                    BCC   CODE_27D5EF           
                    LDA.b #$8A                  
CODE_27D5EF:        STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b #$2A                  
                    BRA   CODE_27D634           

CODE_27D5FA:        LDA.w $05DD,x               
                    LSR   A                     
                    AND.b #$40                  
                    PHA                         
                    REP   #$20                  
                    LDA.w $06BD,x               
                    AND.w #$00FF                
                    LSR   A                     
                    LSR   A                     
                    AND.w #$0003                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C82E,x               
                    CPX.w #$0002                
                    BEQ   CODE_27D627           
                    CPX.w #$0003                
                    BEQ   CODE_27D627           
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    BRA   CODE_27D62E           

CODE_27D627:        STA.w $0806,y               
                    INC   A                     
                    STA.w $0802,y               
CODE_27D62E:        PLA                         
                    EOR.w $C832,x               
                    ORA.b #$20                  
CODE_27D634:        STA.w $0803,y               
                    STA.w $0807,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    SEP   #$10                  
                    LDX.b $9B                   
                    LDA.b $BB                   
                    CMP.b #$06                  
                    BNE   CODE_27D66E           
                    LDA.w $056F                 
                    BEQ   CODE_27D66E           
                    LDA.w $0553                 
                    PHA                         
                    LDA.b #$10                  
                    STA.w $0553                 
                    JSR.w CODE_27D302           
                    PLA                         
                    STA.w $0553                 
                    RTS                         

CODE_27D66E:        JMP.w CODE_27D302           

CODE_27D671:        RTS                         

CODE_27D672:        LDA.w $06C7,x               
                    BNE   CODE_27D67A           
                    JMP.w CODE_27D37F           

CODE_27D67A:        CMP.b #$18                  
                    BCC   CODE_27D683           
                    LDA.b #$17                  
                    STA.w $06C7,x               
CODE_27D683:        LDA.b $9C                   
                    BNE   CODE_27D68A           
                    DEC.w $06C7,x               
CODE_27D68A:        JSR.w CODE_27D728           
                    BNE   CODE_27D671           
                    LDA.w $E2,x               
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $00                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $02                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CF49           
                    LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ROR   A                     
                    AND.b #$80                  
                    ORA.b #$22                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    EOR.b #$40                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    REP   #$20                  
                    LDA.w $06C7,x               
                    AND.w #$00FF                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C836,x               
                    STA.w $0802,y               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0806,y               
                    STA.w $080E,y               
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_27D705           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
                    LDA.w $080A,y               
                    PHA                         
                    LDA.w $080E,y               
                    STA.w $080A,y               
                    PLA                         
                    STA.w $080E,y               
CODE_27D705:        PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $01                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $03                   
                    AND.b #$01                  
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    PLY                         
                    SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

CODE_27D728:        REP   #$10                  
                    LDA.b #$07                  
                    STA.b $DA                   
                    STX.b $D8                   
                    STZ.b $D9                   
CODE_27D732:        LDA.b #$00                  
                    XBA                         
                    REP   #$20                  
                    LDA.b $D8                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA.w $AF6E,y               
                    STA.b $C6,x                 
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D8                   
                    INC   A                     
                    AND.b #$07                  
                    STA.b $D8                   
                    LDA.w $0801,y               
                    CMP.w $0809,y               
                    BNE   CODE_27D759           
                    CMP.b #$F0                  
                    BEQ   CODE_27D783           
CODE_27D759:        DEC.b $DA                   
                    BPL   CODE_27D732           
                    LDY.w #$0080                
CODE_27D760:        STY.b $C6,x                 
                    LDA.w $0801,y               
                    CMP.w $0805,y               
                    BNE   CODE_27D76E           
                    CMP.b #$F0                  
                    BEQ   CODE_27D783           
CODE_27D76E:        REP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.w #$0008                
                    TAY                         
                    SEP   #$20                  
                    CPY.w #$0200                
                    BNE   CODE_27D760           
                    LDA.b #$00                  
                    STA.b $C6,x                 
                    STA.b $C7,x                 
CODE_27D783:        SEP   #$10                  
                    LDA.b $0D                   
                    RTS                         

CODE_27D788:        TXA                         
                    EOR.b $15                   
                    AND.b #$01                  
                    TAY                         
                    LDA.w $C77A,y               
                    TAY                         
                    LDA.w $0801,y               
                    CMP.w $0805,y               
                    BNE   CODE_27D7A8           
                    CMP.w $0809,y               
                    BNE   CODE_27D7A8           
                    CMP.w $080D,y               
                    BNE   CODE_27D7A8           
                    CMP.b #$F0                  
                    BEQ   CODE_27D7CB           
CODE_27D7A8:        LDY.b #$00                  
CODE_27D7AA:        LDA.w $0801,y               
                    CMP.w $0805,y               
                    BNE   CODE_27D7C0           
                    CMP.w $0809,y               
                    BNE   CODE_27D7C0           
                    CMP.w $080D,y               
                    BNE   CODE_27D7C0           
                    CMP.b #$F0                  
                    BEQ   CODE_27D7CB           
CODE_27D7C0:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    CPY.b #$40                  
                    BNE   CODE_27D7AA           
                    SEC                         
                    RTS                         

CODE_27D7CB:        CLC                         
                    RTS                         

CODE_27D7CD:        LDY.b #$00                  
CODE_27D7CF:        LDA.w $0801,y               
                    CMP.b #$F0                  
                    BEQ   CODE_27D7E1           
                    TYA                         
                    CLC                         
                    ADC.b #$04                  
                    TAY                         
                    CPY.b #$40                  
                    BNE   CODE_27D7CF           
                    SEC                         
                    RTS                         

CODE_27D7E1:        CLC                         
                    RTS                         

CODE_27D7E3:        LDA.w $05DD,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $05AB,x               
                    STA.w $05AB,x               
                    PHP                         
                    LDA.w $05DD,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    LDY.b #$00                  
                    BCC   CODE_27D802           
                    ORA.b #$F0                  
                    DEY                         
CODE_27D802:        PLP                         
                    ADC.w $05C9,x               
                    STA.w $05C9,x               
                    TYA                         
                    ADC.b $E2,x                 
                    STA.b $E2,x                 
                    RTS                         

CODE_27D80F:        LDA.w $05D3,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $05A1,x               
                    STA.w $05A1,x               
                    PHP                         
                    LDA.w $05D3,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    LDY.b #$00                  
                    BCC   CODE_27D82E           
                    ORA.b #$F0                  
                    DEY                         
CODE_27D82E:        PLP                         
                    ADC.w $05BF,x               
                    STA.w $05BF,x               
                    TYA                         
                    ADC.w $1FD7,x               
                    STA.w $1FD7,x               
                    RTS                         

CODE_27D83D:        LDA.b $9C                   
                    ORA.l $7E3973               
                    BNE   CODE_27D84F           
                    LDX.b #$07                  
CODE_27D847:        STX.b $9B                   
                    JSR.w CODE_27D850           
                    DEX                         
                    BPL   CODE_27D847           
CODE_27D84F:        RTS                         

CODE_27D850:        LDA.w $1A15,x               
                    BEQ   CODE_27D84F           
                    PHA                         
                    LDA.w $06E3,x               
                    BEQ   CODE_27D85E           
                    DEC.w $06E3,x               
CODE_27D85E:        LDA.w $1A57,x               
                    BEQ   CODE_27D866           
                    DEC.w $1A57,x               
CODE_27D866:        PLA                         
                    JSL.l CODE_20FB1F           

                    dw CODE_27D84F
                    dw CODE_27DBE4
                    dw CODE_27DBE4
                    dw CODE_27DB84
                    dw CODE_27DA57
                    dw CODE_27D9E9
                    dw CODE_27D9E9
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D8ED
                    dw CODE_27D897

CODE_27D897:        LDA.w $1A35,x             ;\
                    CMP.w $0210               ; |
                    LDA.w $1A2D,x             ; |
                    SBC.b $12                 ;/
                    BNE   CODE_27D8BC           
                    LDA.w $1A35,x             ;\
                    SEC                       ; |If mario is not between $38 and $4C pixels 
                    SBC.b $5E                 ; |close to the sprite (20 pixels area), branch
                    CMP.b #$38                ; |
                    BCC   CODE_27D8BC         ; |
                    CMP.b #$4C                ; |
                    BCS   CODE_27D8BC         ;/
                    LDY.b #$07                ;\
CODE_27D8B4:        LDA.w $1FC8,y             ; |
                    BEQ   CODE_27D8BD         ; |Search free slot for laser sprite
                    DEY                       ; |(Not regular sprite index. rather it's some other type)
                    BPL   CODE_27D8B4         ;/ (Extended sprites maybe?)
CODE_27D8BC:        RTS                       ;return

CODE_27D8BD:        LDA.b #$01                ;\Sound effect the bowser statue laser plays
                    STA.w $1200               ;/
                    LDA.b #$15                ;\Sprite: Laser sprite
                    STA.w $1FC8,y             ;/
                    LDA.w $1A2D,x             ;\
                    XBA                       ; |
                    LDA.w $1A35,x             ; |Set extended sprite X pos
                    REP   #$20                ; |
                    SEC                       ; |
                    SBC.w #$0008              ; |
                    SEP   #$20                ; |
                    STA.w $05C9,y             ; |
                    XBA                       ; |
                    STA.w $E2,y             ;/
                    LDA.w $1A25,x             ;\
                    CLC                       ; |Set extended sprite Y pos
                    ADC.b #$08                ; |
                    STA.w $05BF,y             ;/
                    LDA.w $1A1D,x               
                    STA.w $1FD7,y               
                    RTS                         

CODE_27D8ED:        LDA.w $06E3,x               
                    BNE   CODE_27D92C           
                    LDA.w $1A35,x               
                    CMP.w $0210                 
                    LDA.w $1A2D,x               
                    SBC.b $12                   
                    BNE   CODE_27D92C           
                    LDA.w $1A35,x               
                    SEC                         
                    SBC.w $0210                 
                    CMP.b #$F0                  
                    BCS   CODE_27D92C                   
                    LDA.b #$87                  
                    STA.w $06E3,x               
                    LDA.w $1A15,x               
                    STA.b $00                   
                    CMP.b #$12                  
                    BEQ   CODE_27D91C           
                    CMP.b #$08                  
                    BNE   CODE_27D91F           
CODE_27D91C:        JMP.w CODE_27D92D           

CODE_27D91F:        CMP.b #$13                  
                    BCC   CODE_27D926           
                    JMP.w CODE_27D98A           

CODE_27D926:        CLC                         
                    ADC.b #$01                  
                    JMP.w CODE_27DADB           

CODE_27D92C:        RTS                         

CODE_27D92D:        JSR.w CODE_27DC85           
                    LDA.b #$B0                  
                    STA.w $0671,x               
                    INC.w $1FF9,x               
                    LDY.b $9B                   
                    LDA.w $1A25,y               
                    STA.b $71,x                 
                    LDA.w $1A1D,y               
                    STA.b $56,x                 
                    LDA.b $00                   
                    CMP.b #$11                  
                    LDA.b #$30                  
                    LDY.b #$12                  
                    BCS   CODE_27D952                   
                    LDY.b #$09                  
                    LDA.b #$D0                  
CODE_27D952:        STY.b $00                   
                    STA.b $8C,x                 
                    EOR.b #$80                  
                    LDY.b $9B                   
                    ASL   A                     
                    LDA.w $1A35,y               
                    BCS   CODE_27D963                   
                    SEC                         
                    SBC.b #$10                  
CODE_27D963:        STA.b $5F,x                 
                    LDA.w $1A2D,y               
                    SBC.b #$00                  
                    STA.b $44,x                 
                    LDA.b #$05                  
                    STA.w $1FE9,x               
                    JSR.w CODE_27D9E4           
                    JSR.w CODE_27DB4E           
                    LDA.w $1A25,x               
                    SEC                         
                    SBC.w $0543                 
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1F9F                 
                    ADC.b #$08                  
                    STA.w $1FA0                 
                    RTS                         

CODE_27D98A:        JSR.w CODE_27DC85           
                    LDA.b #$50                  
                    STA.w $0671,x               
                    LDA.b #$80                  
                    STA.w $06A6,x               
                    INC.w $1021,x               
                    INC.w $0689,x               
                    LDY.b $9B                   
                    LDA.w $1A25,y               
                    SEC                         
                    SBC.b #$08                  
                    STA.b $71,x                 
                    LDA.w $1A1D,y               
                    SBC.b #$00                  
                    STA.b $56,x                 
                    LDA.b #$D0                  
                    STA.b $9E,x                 
                    LDA.b $00                   
                    CMP.b #$14                  
                    LDA.b #$10                  
                    LDY.b #$0B                  
                    BCS   CODE_27D9BF                   
                    DEY                         
                    LDA.b #$F0                  
CODE_27D9BF:        STY.b $00                   
                    STA.b $8C,x                 
                    ASL   A                     
                    LDA.b #$00                  
                    STA.b $01                   
                    LDY.b $9B                   
                    LDA.b #$08                  
                    BCC   CODE_27D9D2           
                    LDA.b #$F8                  
                    DEC.b $01                   
CODE_27D9D2:        CLC                         
                    ADC.w $1A35,y               
                    STA.b $5F,x                 
                    LDA.w $1A2D,y               
                    ADC.b $01                   
                    STA.b $44,x                 
                    LDA.b #$05                  
                    STA.w $1FE9,x               
CODE_27D9E4:        LDX.b $9B                   
                    JMP.w CODE_27DB4E           

CODE_27D9E9:        LDA.w $06E3,x               
                    BNE   CODE_27DA4F           
                    TXA                         
                    TAY                         
                    LDA.b #$70                  
                    STA.w $06E3,y               
                    INC.w $06DB,x               
                    LDA.w $06DB,x               
                    AND.b #$03                  
                    BEQ   CODE_27DA4F           
                    JSR.w CODE_27DC85           
                    LDA.w $1A35,y               
                    STA.b $5F,x                 
                    LDA.w $1A2D,y               
                    STA.b $44,x                 
                    JSL.l CODE_27A837           
                    STY.b $01                   
                    LDY.b $9B                   
                    LDA.w $1A15,y               
                    LDY.b #$00                  
                    CMP.b #$05                  
                    BNE   CODE_27DA1E           
                    INY                         
CODE_27DA1E:        CPY.b $01                   
                    BNE   CODE_27DA50           
                    LDA.w $C843,y               
                    STA.w $0679,x               
                    LDY.b $9B                   
                    LDA.w $1A25,y               
                    SEC                         
                    SBC.b #$03                  
                    STA.b $71,x                 
                    LDA.w $1A1D,y               
                    SBC.b #$00                  
                    STA.b $56,x                 
                    LDA.b #$72                  
                    STA.w $0671,x               
                    LDA.b #$01                  
                    STA.w $1FE9,x               
                    LDA.b #$28                  
                    STA.w $0689,x               
                    LDA.b #$FF                  
                    STA.w $0651,x               
CODE_27DA4D:        LDX.b $9B                   
CODE_27DA4F:        RTS                         

CODE_27DA50:        LDA.b #$00                  
                    STA.w $0661,x               
                    BEQ   CODE_27DA4D           
CODE_27DA57:        LDA.w $1A57,x               
                    BNE   CODE_27DA92           
                    LDA.b #$3D                  
                    STA.w $1A57,x               
                    LDA.w $1A25,x               
                    CMP.w $0543                 
                    LDA.w $1A1D,x               
                    SBC.w $0542                 
                    BNE   CODE_27DAC4           
                    LDA.w $1A35,x               
                    CMP.w $0210                 
                    LDA.w $1A2D,x               
                    SBC.b $12                   
                    BNE   CODE_27DAC4           
                    LDA.w $1A35,x               
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.b #$20                  
                    CMP.b #$28                  
                    BCC   CODE_27DAC4           
                    LDA.b #$20                  
                    STA.w $06E3,x               
                    INC.w $06DB,x               
CODE_27DA92:        LDA.w $06E3,x               
                    BEQ   CODE_27DAC4           
                    CMP.b #$1D                  
                    BNE   CODE_27DAC5           
                    LDA.w $0564                 
                    BEQ   CODE_27DAA7           
                    LDA.b #$1E                  
                    STA.w $06E3,x               
                    BRA   CODE_27DAC4           

CODE_27DAA7:        LDA.b #$15                  
                    STA.w $0564                 
                    LDA.w $1A25,x               
                    STA.w $052B                 
                    LDA.w $1A1D,x               
                    STA.w $052A                 
                    LDA.w $1A35,x               
                    STA.w $0529                 
                    LDA.w $1A2D,x               
                    STA.w $0528                 
CODE_27DAC4:        RTS                         

CODE_27DAC5:        CMP.b #$01                  
                    BNE   CODE_27DAEA           
                    LDA.w $06DB,x               
                    AND.b #$07                  
                    STA.b $00                   
                    JSR.w CODE_27DAE0           
                    LDA.w $06DB,x               
                    CLC                         
                    ADC.b #$04                  
                    AND.b #$07                  
CODE_27DADB:        STA.b $00                   
                    JMP.w CODE_27DAE0           

CODE_27DAE0:        LDY.b #$05                  
CODE_27DAE2:        LDA.w $1FC8,y               
                    BEQ   CODE_27DAEB           
                    DEY                         
                    BPL   CODE_27DAE2           
CODE_27DAEA:        RTS                         

CODE_27DAEB:        LDA.b #$0B                  
                    STA.w $1FC8,y               
                    LDA.w $1A2D,x               
                    STA.b $D9                   
                    LDA.w $1A35,x               
                    STA.b $D8                   
                    LDX.b $00                   
                    REP   #$20                  
                    LDA.w $C875,x               
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_27DB0C           
                    ORA.w #$FF00                
CODE_27DB0C:        CLC                         
                    ADC.b $D8                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $D8                   
                    STA.w $05C9,y               
                    LDA.b $D9                   
                    STA.w $E2,y               
                    LDA.w $C861,x               
                    STA.w $05D3,y               
                    LDA.w $C84D,x               
                    STA.w $05DD,y               
                    LDA.b #$00                  
                    STA.b $02                   
                    LDA.w $C88B,x               
                    BPL   CODE_27DB34           
                    DEC.b $02                   
CODE_27DB34:        CLC                         
                    LDX.b $9B                   
                    ADC.w $1A25,x               
                    STA.w $05BF,y               
                    LDA.w $1A1D,x               
                    ADC.b $02                   
                    STA.w $1FD7,y               
                    LDA.b #$00                  
                    STA.w $06C7,y               
                    JMP.w CODE_27DB4E           

                    RTS                         

CODE_27DB4E:        LDA.b #$4A                  
                    STA.w $1203                 
                    JSL.l CODE_279544           
                    LDA.b #$01                  
                    STA.w $1F9C                 
                    LDA.w $1A35,x               
                    CLC                         
                    LDX.b $00                   
                    ADC.w $C875,x               
                    SEC                         
                    SBC.w $0210                 
                    STA.w $1FA2                 
                    LDA.w $C88B,x               
                    LDX.b $9B                   
                    CLC                         
                    ADC.w $1A25,x               
                    SEC                         
                    SBC.w $0543                 
                    STA.w $1F9F                 
                    LDA.b #$1F                  
                    STA.w $1FAE                 
                    RTS                         

                db $60,$20

CODE_27DB84:        LDA.w $06E3,x
                    BNE   $5A    
                    LDA.w $1A35,x               
                    CMP.w $0210                 
                    LDA.w $1A2D,x               
                    SBC.b $12                   
                    BNE   CODE_27DBE3           
                    LDA.w $1A35,x               
                    SEC                         
                    SBC.w $0210                 
                    CMP.b #$F0                  
                    BCS   CODE_27DBE3                   
                    LDA.b #$C0                  
                    STA.w $06E3,x               
                    JSR.w CODE_27DC85           
                    LDY.b $9B                   
                    LDA.b #$AD                  
                    STA.w $0671,x               
                    LDA.w $1A25,y               
                    SEC                         
                    SBC.b #$06                  
                    STA.b $71,x                 
                    LDA.w $1A1D,y               
                    SBC.b #$00                  
                    STA.b $56,x                 
                    LDA.w $1A2D,y               
                    STA.b $44,x                 
                    LDA.w $1A35,y               
                    STA.b $5F,x                 
                    LDA.b #$00                  
                    STA.b $68,x                 
                    LDA.b #$28                  
                    STA.w $0518,x               
                    LDA.b #$05                  
                    STA.w $1FE9,x               
                    JSL.l CODE_27A837           
                    LDA.w $DB82,y               
                    STA.w $0679,x               
                    LDX.b $9B                   
CODE_27DBE3:        RTS                         

CODE_27DBE4:        LDA.w $06E3,x               
                    BNE   CODE_27DBE3           
                    LDA.w $1A25,x               
                    CMP.w $0543                 
                    LDA.w $1A1D,x               
                    SBC.w $0542                 
                    BNE   CODE_27DBE3           
                    LDA.w $1A35,x               
                    CMP.w $0210                 
                    LDA.w $1A2D,x               
                    SBC.b $12                   
                    BNE   CODE_27DBE3           
                    LDA.w $0783,x               
                    AND.b #$1F                  
                    ORA.b #$80                  
                    STA.w $06E3,x               
                    LDA.w $1A35,x               
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$20                  
                    BCC   CODE_27DBE3           
                    LDA.b $5E                   
                    SBC.w $1A35,x               
                    CLC                         
                    ADC.b #$11                  
                    CMP.b #$22                  
                    BCC   CODE_27DBE3           
                    JSR.w CODE_27DC85           
                    LDY.b $9B                   
                    LDA.w $1A15,y               
                    LSR   A                     
                    LDA.b #$78                  
                    BCS   CODE_27DC37                   
                    LDA.b #$79                  
CODE_27DC37:        STA.w $0671,x               
                    LDA.b #$00                  
                    STA.w $1FE9,x               
                    LDA.w $1A25,y               
                    SEC                         
                    SBC.b #$01                  
                    STA.b $71,x                 
                    LDA.w $1A1D,y               
                    SBC.b #$00                  
                    STA.b $56,x                 
                    LDA.w $1A2D,y               
                    STA.b $44,x                 
                    LDA.w $1A35,y               
                    STA.b $5F,x                 
                    STA.w $1CD7,x               
                    LDA.b #$0C                  
                    STA.w $0518,x               
                    LDA.b #$20                  
                    STA.w $1FD2,x               
                    JSL.l CODE_27A837           
                    LDA.w $C8A1,y               
                    STA.b $8C,x                 
                    LDA.w $C8A3,y               
                    STA.w $0679,x               
                    LDA.w $C8A5,y               
                    STA.b $4D,x                 
                    LDX.b $9B                   
                    TYA                         
                    CLC                         
                    ADC.b #$14                  
                    STA.b $00                   
                    JSR.w CODE_27DB4E           
                    RTS                         

CODE_27DC85:        LDX.b #$04                  
CODE_27DC87:        LDA.w $0661,x               
                    BEQ   CODE_27DC94           
                    DEX                         
                    BPL   CODE_27DC87           
                    PLA                         
                    PLA                         
                    LDX.b $9B                   
                    RTS                         

CODE_27DC94:        JSL.l CODE_279C96           
                    LDA.b #$02                  
                    STA.w $0661,x               
                    RTS                         

CODE_27DC9E:        LDA.w $034E                 
                    BNE   CODE_27DCA4           
                    RTL                         

CODE_27DCA4:        INC.w $034E                 
                    CMP.b #$10                  
                    BNE   CODE_27DCB2           
                    PHP                         
                    LDX.b #$10                  
                    STX.w $1203                 
                    PLP                         
CODE_27DCB2:        BCS   CODE_27DD0E                   
                    JSR.w CODE_27DD64           
                    LDX.b #$00                  
                    JSR.w CODE_27D728           
                    REP   #$10                  
                    LDY.b $C6                   
                    LDX.w #$0000                
CODE_27DCC3:        LDA.b $0A                   
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    LDA.b $0B                   
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.b $0B                   
                    LDA.b $0C                   
                    INC.b $0C                   
                    INC.b $0C                   
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    PHX                         
                    TAX                         
                    SEP   #$20                  
                    STZ.w $0A20,x               
                    STZ.w $0A21,x               
                    PLX                         
                    TYA                         
                    CLC                         
                    ADC.b #$08                  
                    TAY                         
                    INX                         
                    CPX.w #$0004                
                    BNE   CODE_27DCC3           
                    SEP   #$10                  
                    RTL                         

CODE_27DD0E:        CMP.b #$20                  
                    BCS   CODE_27DD63                   
                    EOR.b #$1F                  
                    JSR.w CODE_27DD64           
                    LDA.b #$04                  
                    STA.b $0D                   
CODE_27DD1B:        JSR.w CODE_27D7CD           
                    LDA.b $0A                   
                    STA.w $0800,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    STZ.w $0A20,x               
                    STZ.w $0A21,x               
                    LDA.b $0B                   
                    STA.w $0801,y               
                    LDA.b $0C                   
                    STA.w $0802,y               
                    LDA.b #$20                  
                    STA.w $0803,y               
                    INC.b $0C                   
                    JSR.w CODE_27D7CD           
                    LDA.b $0A                   
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0800,y               
                    LDA.b $0B                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.b $0B                   
                    LDA.b $0C                   
                    STA.w $0802,y               
                    LDA.b #$20                  
                    STA.w $0803,y               
                    INC.b $0C                   
                    DEC.b $0D                   
                    BNE   CODE_27DD1B           
CODE_27DD63:        RTL                         

CODE_27DD64:        REP   #$20                  
                    AND.w #$00FC                
                    LSR   A                     
                    LSR   A                     
                    XBA                         
                    CLC                         
                    ADC.w #$D000                
                    STA.w $022C                 
                    CLC                         
                    ADC.w #$0040                
                    STA.w $022E                 
                    CLC                         
                    ADC.w #$0040                
                    STA.w $0230                 
                    CLC                         
                    ADC.w #$0040                
                    STA.w $0232                 
                    SEP   #$20                  
                    LDA.b #$32                  
                    STA.w $0239                 
                    LDA.b $70                   
                    STA.b $D8                   
                    LDA.b $55                   
                    STA.b $D9                   
                    LDA.b $43                   
                    XBA                         
                    LDA.b $5E                   
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $0A                   
                    LDA.b $D8                   
                    SEC                         
                    SBC.w $0216                 
                    DEC   A                     
                    STA.b $0B                   
                    SEP   #$20                  
                    LDA.b #$10                  
                    STA.b $0C                   
CODE_27DDB3:        RTS                         

DATA_27DDB4:        dw $FFFF
                    dw $0002
                    dw $0005
                    dw $0008
                    dw $0008
                    dw $0005
                    dw $0002
                    dw $FFFF

DATA_27DDC4:        db $FA,$FB,$FC,$FD

CODE_27DDC8:        STZ.b $D8
                    LDA.b $BC                   
                    CMP.w $E984                 
                    BEQ   CODE_27DDE2           
                    CMP.w $E985                 
                    BEQ   CODE_27DDE2           
                    LDA.l $7FC522               
                    ORA.l $7FC523               
                    BEQ   CODE_27DDB3           
                    INC.b $D8                   
CODE_27DDE2:        LDA.w $1201                 
                    BNE   CODE_27DDF2           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_27DDF2           
                    LDA.b #$04                  
                    STA.w $1201                 
CODE_27DDF2:        LDX.b #$01                  
CODE_27DDF4:        LDA.l $7FC522,x             
                    BEQ   CODE_27DE4A           
                    INC   A                     
                    STA.l $7FC522,x             
                    AND.b #$0F                  
                    CMP.b #$04                  
                    BNE   CODE_27DE40           
                    LDY.b $D8                   
                    BNE   CODE_27DE40           
                    PHX                         
                    TXA                         
                    EOR.b #$01                  
                    TAX                         
                    LDA.l $7FC522,x             
                    AND.b #$F0                  
                    CMP.b #$40                  
                    BEQ   CODE_27DE1B           
                    CLC                         
                    ADC.b #$10                  
CODE_27DE1B:        STA.l $7FC522,x             
                    LDA.b $5E                   
                    STA.l $7FC524,x             
                    LDA.b $43                   
                    STA.l $7FC526,x             
                    LDA.b $70                   
                    STA.l $7FC528,x             
                    LDA.b $55                   
                    STA.l $7FC52A,x             
                    LDA.b $BD                   
                    STA.l $7FC52C,x             
                    PLX                         
                    BRA   CODE_27DE4A           

CODE_27DE40:        CMP.b #$08                  
                    BNE   CODE_27DE4A           
                    LDA.b #$00                  
                    STA.l $7FC522,x             
CODE_27DE4A:        DEX                         
                    BPL   CODE_27DDF4           
                    LDX.b #$01                  
CODE_27DE4F:        LDA.l $7FC522,x             
                    BNE   CODE_27DE58           
                    BRL   CODE_27DEEA           

CODE_27DE58:        JSR.w CODE_27D7CD           
                    PHX                         
                    LDA.l $7FC52C,x             
                    AND.b #$40                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $D8                   
                    LDA.l $7FC522,x             
                    STA.b $DC                   
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    REP   #$20                  
                    LDA   DATA_27DDB4,x             
                    STA.b $DA                   
                    SEP   #$20                  
                    LDA.b $DC                   
                    AND.b #$0F                  
                    LSR   A                     
                    TAX                         
                    LDA   DATA_27DDC4,x             
                    STA.b $DC                   
                    PLX                         
                    LDA.l $7FC528,x             
                    STA.b $D8                   
                    LDA.l $7FC52A,x             
                    STA.b $D9                   
                    LDA.l $7FC526,x             
                    XBA                         
                    LDA.l $7FC524,x             
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.b $DA                   
                    STA.b $0A                   
                    LDA.b $D8                   
                    SEC                         
                    SBC.w $0216                 
                    CLC                         
                    ADC.w #$001A                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $D9                   
                    BNE   CODE_27DEEA           
                    LDA.b $0A                   
                    STA.w $0800,y               
                    LDA.b $D8                   
                    STA.w $0801,y               
                    LDA.b $DC                   
                    STA.w $0802,y               
                    PHX                         
                    LDA.b #$21                  
                    LDX.w $0588                 
                    BEQ   CODE_27DEDB           
                    LDA.b #$11                  
CODE_27DEDB:        STA.w $0803,y               
                    PLX                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $0B                   
                    AND.b #$01                  
                    STA.w $0A20,y               
CODE_27DEEA:        DEX                         
                    BMI   CODE_27DEF0           
                    BRL   CODE_27DE4F           

CODE_27DEF0:        RTS                         

CODE_27DEF1:        LDA.w $0580                 
                    BEQ   CODE_27DF24           
                    LDA.w $02C1                 
                    CMP.b #$34                  
                    BNE   CODE_27DF24           
                    CPY.b #$01                  
                    BEQ   CODE_27DF22           
                    LDA.b $71,x                 
                    SEC                         
                    SBC.w $0543                 
                    CMP.b #$9E                  
                    BCC   CODE_27DF22           
                    CMP.b #$A4                  
                    BCS   CODE_27DF22                   
                    LDA.w $0520,x               
                    BNE   CODE_27DF22           
                    LDA.b #$10                  
                    STA.w $0520,x               
                    JSL.l CODE_278F34           
                    LDA.b #$82                  
                    STA.w $1F93,y               
CODE_27DF22:        CLC                         
                    RTL                         

CODE_27DF24:        SEC                         
                    RTL                         

CODE_27DF26:        PHB                         
                    PHK                         
                    PLB                         
                    STA.b $08                   
                    LDA.w $0671,x               
                    CMP.b #$18                  
                    BNE   CODE_27DF40           
                    LDA.b #$22                  
                    STA.b $0C                   
                    STZ.b $0D                   
                    LDA.b #$28                  
                    STA.b $0E                   
                    STZ.b $0F                   
                    BRA   CODE_27DF4C           

CODE_27DF40:        LDA.b #$1A                  
                    STA.b $0C                   
                    STZ.b $0D                   
                    LDA.b #$18                  
                    STA.b $0E                   
                    STZ.b $0F                   
CODE_27DF4C:        LDA.b $5F,x                 
                    STA.b $0A                   
                    LDA.b $44,x                 
                    STA.b $0B                   
                    REP   #$20                  
                    LDA.b $0A                   
                    SEC                         
                    SBC.w $0210                 
                    SEC                         
                    SBC.w #$0009                
                    STA.b $0A                   
                    CLC                         
                    ADC.b $0C                   
                    STA.b $0C                   
                    SEP   #$20                  
                    JSR.w CODE_27D7CD           
                    LDA.b $0A                   
                    PHX                         
                    JSR.w CODE_27DFB1           
                    LDA.w $DFE6,x               
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    LDX.b $0B                   
                    BEQ   CODE_27DF88           
                    ORA.b #$01                  
CODE_27DF88:        STA.w $0A20,y               
                    PLX                         
                    JSR.w CODE_27D7CD           
                    LDA.b $0C                   
                    PHX                         
                    JSR.w CODE_27DFB1           
                    LDA.w $DFE9,x               
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    LDX.b $0D                   
                    BEQ   CODE_27DFAB           
                    ORA.b #$01                  
CODE_27DFAB:        STA.w $0A20,y               
                    PLX                         
                    PLB                         
                    RTL                         

CODE_27DFB1:        STA.w $0800,y               
                    LDA.b $56,x                 
                    XBA                         
                    LDA.b $71,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.w $0216                 
                    CLC                         
                    ADC.b $0E                   
                    SEP   #$20                  
                    XBA                         
                    AND.b #$FF                  
                    BNE   CODE_27DFCC           
                    XBA                         
                    BRA   CODE_27DFCE           

CODE_27DFCC:        LDA.b #$F0                  
CODE_27DFCE:        STA.w $0801,y               
                    LDA.b $08                   
                    CMP.b #$0B                  
                    BCC   CODE_27DFD9           
                    LDA.b #$0B                  
CODE_27DFD9:        LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $DFE3,x               
                    STA.w $0802,y               
                    RTS                         

                    db $20,$E6,$E8,$60                       

                    db $61,$21,$20,$21,$21

DATA_27DFEC:        db $CC,$CD,$FD

DATA_27DFEF:        db $23,$23,$21

CODE_27DFF2:        LDA.b $9C
                    BNE   CODE_27E00F
                    LDA.w $06D1,x               
                    BNE   CODE_27E00F           
                    LDA.b #$04                  
                    STA.w $06D1,x               
                    INC.w $06BD,x               
                    LDA.w $06BD,x               
                    CMP.b #$03                  
                    BCC   CODE_27E00F           
                    STZ.w $1FC8,x               
                    BRA   CODE_27E05A           

CODE_27E00F:        JSR.w CODE_27D728           
                    BNE   CODE_27E05A           
                    LDA.w $06BD,x               
                    CMP.b #$03                  
                    BCS   CODE_27E05A                   
                    PHX                         
                    TAX                         
                    LDA   DATA_27DFEC,x             
                    STA.b $DA                   
                    LDA   DATA_27DFEF,x             
                    STA.b $DB                   
                    PLX                         
                    LDA.b $E2,x                 
                    XBA                         
                    LDA.w $05C9,x               
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    JSR.w CODE_27CE16           
                    LDA.b $DA                   
                    STA.w $0802,y               
                    LDA.b $DB                   
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    SEP   #$10                  
CODE_27E05A:        RTS                         

CODE_27E05B:        LDA.w $06D1,x               
                    BNE   CODE_27E064           
                    STZ.w $1FC8,x               
                    RTS                         

CODE_27E064:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $06D1,x               
                    AND.b #$FC                  
                    LSR   A                     
                    TAY                         
                    LDA.w $05C9,x               
                    STA.b $0E                   
                    LDA.w $E2,x               
                    STA.b $0F                   
                    REP   #$30                  
                    LDA.b $0E                   
                    CLC                         
                    ADC.w #$0004                
                    SEC                         
                    SBC.w $0210                 
                    STA.b $0E                   
                    SEC                         
                    SBC   DATA_27E143,y               
                    STA.b $00                   
                    LDA.b $0E                   
                    SEC                         
                    SBC   DATA_27E14F,y               
                    STA.b $02                   
                    LDA.b $0E                   
                    CLC                         
                    ADC   DATA_27E143,y               
                    STA.b $04                   
                    LDA.b $0E                   
                    CLC                         
                    ADC   DATA_27E14F,y               
                    STA.b $06                   
                    TYA                         
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $05BF,x               
                    SEC                         
                    SBC.w $0216                 
                    STA.b $08                   
                    CLC                         
                    ADC   DATA_27E161,y               
                    STA.b $09                   
                    LDA.b $08                   
                    CLC                         
                    ADC   DATA_27E15B,y               
                    STA.b $08                   
                    LDA   DATA_27E167,y               
                    STA.b $0A                   
                    LDA   DATA_27E16D,y               
                    STA.b $0B                   
                    JSR.w CODE_27D728           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b $00                   
                    STA.w $0800,y               
                    LDA.b $02                   
                    STA.w $0804,y               
                    LDA.b $04                   
                    STA.w $0808,y               
                    LDA.b $06                   
                    STA.w $080C,y               
                    LDA.b $08                   
                    STA.w $0801,y               
                    STA.w $080D,y               
                    LDA.b $09                   
                    STA.w $0805,y               
                    STA.w $0809,y               
                    LDA.b $0A                   
                    STA.w $0802,y               
                    STA.w $0806,y               
                    STA.w $080A,y               
                    STA.w $080E,y               
                    LDA.b $0B                   
                    STA.w $0803,y               
                    STA.w $0807,y               
                    ORA.b #$40                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $01                   
                    BEQ   CODE_27E121           
                    LDA.b #$01                  
CODE_27E121:        STA.w $0A20,y               
                    LDA.b $03                   
                    BEQ   CODE_27E12A           
                    LDA.b #$01                  
CODE_27E12A:        STA.w $0A21,y               
                    LDA.b $05                   
                    BEQ   CODE_27E133           
                    LDA.b #$01                  
CODE_27E133:        STA.w $0A22,y               
                    LDA.b $07                   
                    BEQ   CODE_27E13C           
                    LDA.b #$01                  
CODE_27E13C:        STA.w $0A23,y               
                    SEP   #$10                  
                    PLB                         
                    RTS                         

DATA_27E143:        db $0F,$00,$0E,$00,$0D,$00,$0C,$00
                    db $0B,$00,$0A,$00

DATA_27E14F:        db $12,$00,$10,$00,$0E,$00,$0C,$00
                    db $0A,$00,$08,$00

DATA_27E15B:        db $0A,$09,$09,$0A,$0B,$0C

DATA_27E161:        db $06,$05,$04,$06,$08,$0A

DATA_27E167:        db $1D,$1D,$D1,$D1,$D0,$D0

DATA_27E16D:        db $22,$22,$23,$23,$23,$23

CODE_27E173:        PHB
                    LDA.b #$27                  
                    PHA                         
                    PLB                         
                    PHX                         
                    PHY                         
                    LDA.w $1A80                 
                    ASL   A                     
                    CLC                         
                    ADC.w $1A80                 
                    TAX                         
                    LDY.b #$00                  
CODE_27E185:        LDA.w DATA_27E1DF,x               
                    STA.w $0800,y               
                    LDA.b #$60                  
                    STA.w $0801,y               
                    LDA.w DATA_27E1E8,x               
                    STA.w $0802,y               
                    LDA.b #$22                  
                    STA.w $0803,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPY.b #$0C                  
                    BCC   CODE_27E185           
                    LDX.b #$00                  
CODE_27E1B1:        LDA.w DATA_27E1F1,x               
                    STA.w $0800,y               
                    LDA.b #$60                  
                    STA.w $0801,y               
                    LDA.w DATA_27E1F4,x               
                    STA.w $0802,y               
                    LDA.b #$22                  
                    STA.w $0803,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    INX                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    CPX.b #$03                  
                    BCC   CODE_27E1B1           
                    PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

DATA_27E1DF:        db $58,$68,$68,$58,$68,$68,$50,$60
                    db $70

DATA_27E1E8:        db $A0,$A2,$A2,$A4,$A6,$A6,$A8,$AA
                    db $AC

DATA_27E1F1:        db $80,$90,$98

DATA_27E1F4:        db $AE,$8C,$8D

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
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        db $FF,$00,$FF,$00,$FF,$02,$FF,$00
        db $FF,$02,$FF,$01,$FF,$00,$FF,$00
        db $FF,$00,$FF,$00,$FF,$00,$FF,$00
        db $FF,$00,$FF,$01,$FF,$00,$FF,$00
        db $FF,$00,$0E,$25,$06,$FF,$01,$5B
        db $0D,$14,$5A,$13,$14,$5B,$26,$16
        db $5A,$29,$16,$FF,$01,$34,$0D,$14
        db $FF,$01,$34,$0D,$04,$FF,$01,$70
        db $0A,$17,$2A,$10,$16,$A0,$2C,$12
        db $73,$3E,$10,$74,$40,$10,$73,$42
        db $10,$74,$44,$10,$73,$46,$10,$74
        db $50,$10,$73,$55,$16,$74,$5C,$16
        db $73,$5D,$16,$74,$5E,$16,$73,$5F
        db $16,$74,$60,$16,$41,$68,$15,$FF
        db $01,$6C,$14,$0F,$BC,$5E,$0F,$D3
        db $61,$00,$FF,$01,$FF,$01,$FF,$01
        db $FF,$01,$FF,$01,$FF,$01,$D3,$00
        db $30,$5F,$11,$14,$60,$14,$14,$6C
        db $34,$18,$6C,$36,$18,$6C,$38,$18
        db $FF,$01,$3C,$08,$15,$3C,$38,$11
        db $FF,$01,$58,$0D,$04,$58,$11,$11
        db $6C,$1B,$18,$61,$1C,$16,$6C,$1D
        db $18,$72,$21,$17,$6C,$29,$18,$6F
        db $2A,$06,$6D,$2B,$13,$6C,$2D,$18
        db $6D,$3B,$13,$6D,$3C,$13,$6D,$48
        db $14,$6D,$4B,$14,$72,$4B,$18,$70
        db $4D,$14,$70,$4F,$14,$72,$57,$14
        db $72,$59,$14,$6C,$59,$18,$58,$5E
        db $08,$6F,$65,$11,$6C,$6E,$18,$6C
        db $70,$18,$81,$79,$13,$81,$7B,$13
        db $41,$88,$15,$FF,$01,$25,$02,$0C
        db $FF,$01,$25,$02,$0D,$FF,$01,$25
        db $02,$0E,$FF,$01,$25,$02,$0F,$FF
        db $01,$25,$02,$10,$FF,$01,$25,$02
        db $11,$FF,$01,$25,$02,$05,$FF,$01
        db $25,$02,$04,$FF,$01,$25,$02,$07
        db $FF,$01,$25,$02,$08,$FF,$01,$25
        db $02,$06,$FF,$01,$25,$02,$0B,$FF
        db $01,$25,$02,$09,$FF,$01,$25,$02
        db $0A,$FF,$01,$25,$02,$02,$FF,$01
        db $25,$02,$03,$FF,$01,$25,$02,$01
        db $FF,$01,$25,$02,$12,$FF,$01,$25
        db $02,$13,$FF,$01,$25,$02,$14,$FF
        db $01,$25,$02,$15,$FF,$01,$25,$02
        db $16,$FF,$01,$25,$02,$17,$FF,$01
        db $6D,$12,$19,$83,$56,$12,$41,$68
        db $15,$FF,$01,$6E,$0C,$19,$6E,$12
        db $19,$6D,$19,$06,$6D,$1C,$03,$55
        db $25,$19,$55,$27,$19,$55,$29,$19
        db $6C,$38,$19,$6C,$3A,$19,$6D,$4C
        db $06,$6E,$4E,$19,$6E,$51,$19,$6E
        db $54,$19,$6D,$56,$06,$55,$5D,$0A
        db $6C,$63,$07,$71,$64,$19,$FF,$01
        db $41,$18,$15,$FF,$01,$71,$0C,$19
        db $71,$10,$19,$71,$12,$19,$2B,$1C
        db $09,$2B,$23,$18,$71,$2F,$19,$71
        db $32,$19,$71,$35,$19,$71,$38,$19
        db $71,$4F,$19,$71,$51,$19,$71,$53
        db $19,$71,$55,$19,$2B,$5F,$18,$71
        db $6C,$19,$FF,$01,$6E,$11,$16,$6C
        db $19,$19,$6C,$18,$15,$A0,$26,$16
        db $6C,$2E,$14,$72,$32,$19,$72,$33
        db $19,$6E,$42,$19,$6C,$4C,$19,$72
        db $4B,$15,$A0,$56,$17,$A0,$5E,$16
        db $72,$54,$19,$6C,$5D,$19,$6D,$6D
        db $15,$6D,$6A,$19,$6E,$78,$16,$A0
        db $78,$17,$6C,$82,$13,$6D,$81,$16
        db $6E,$8D,$13,$6E,$9E,$19,$41,$A8
        db $15,$FF,$01,$77,$0B,$12,$77,$0F
        db $13,$61,$0B,$15,$A0,$14,$06,$A0
        db $1A,$17,$A0,$22,$05,$A2,$29,$06
        db $6C,$20,$09,$77,$2D,$12,$61,$26
        db $15,$77,$21,$16,$6C,$32,$09,$6C
        db $34,$09,$77,$30,$16,$FF,$01,$41
        db $38,$15,$FF,$01,$41,$38,$15,$FF
        db $01,$7A,$18,$14,$7A,$16,$18,$7E
        db $11,$18,$7D,$26,$16,$7A,$2D,$13
        db $7C,$30,$18,$7C,$32,$18,$7E,$42
        db $18,$7A,$4B,$18,$7C,$4A,$14,$7C
        db $54,$18,$7A,$5C,$18,$7D,$56,$17
        db $7D,$5E,$16,$7B,$69,$18,$7B,$6D
        db $14,$7E,$78,$15,$7D,$78,$17,$7B
        db $80,$15,$7A,$81,$12,$7E,$8C,$12
        db $7E,$9E,$18,$41,$A8,$15,$FF,$01
        db $A2,$0C,$16,$2B,$08,$18,$A2,$0D
        db $09,$A6,$12,$08,$A2,$17,$09,$71
        db $1C,$18,$71,$1E,$18,$71,$20,$18
        db $A2,$22,$16,$71,$26,$0A,$71,$28
        db $0A,$71,$2A,$0A,$55,$32,$09,$A2
        db $36,$15,$55,$3C,$17,$2B,$3D,$0A
        db $A6,$42,$14,$A0,$4A,$16,$71,$4D
        db $0A,$71,$51,$0A,$71,$55,$0A,$A2
        db $59,$17,$2B,$5C,$0A,$71,$64,$18
        db $A6,$66,$07,$71,$6A,$0A,$FF,$01
        db $6C,$0D,$19,$82,$15,$18,$6D,$27
        db $14,$6C,$32,$18,$72,$3A,$19,$73
        db $42,$19,$73,$4A,$19,$82,$57,$17
        db $72,$65,$19,$72,$67,$19,$6D,$68
        db $13,$74,$79,$19,$6C,$78,$18,$07
        db $96,$18,$41,$98,$15,$FF,$01,$3E
        db $08,$17,$41,$28,$15,$FF,$01,$98
        db $0A,$13,$41,$48,$15,$FF,$01,$A0
        db $11,$18,$A4,$15,$14,$A6,$17,$14
        db $A0,$1E,$15,$A0,$26,$17,$A3,$29
        db $11,$A0,$2C,$18,$A3,$2F,$11,$A0
        db $32,$17,$A6,$3C,$13,$A0,$45,$18
        db $A2,$47,$16,$A4,$49,$14,$39,$4C
        db $14,$A3,$58,$15,$2A,$5C,$18,$A2
        db $5D,$16,$2A,$6A,$16,$A6,$6C,$17
        db $39,$6F,$19,$A7,$78,$11,$A0,$78
        db $15,$33,$80,$19,$33,$82,$19,$33
        db $88,$19,$A2,$8B,$16,$46,$98,$16
        db $2A,$A0,$18,$A6,$A3,$15,$33,$AD
        db $19,$3D,$AF,$16,$41,$C8,$15,$FF
        db $01,$6E,$12,$07,$A1,$16,$08,$BC
        db $20,$09,$74,$22,$04,$55,$2D,$0A
        db $55,$33,$0A,$77,$36,$18,$BC,$3A
        db $0A,$55,$3D,$0A,$55,$46,$06,$BC
        db $46,$0A,$55,$4E,$04,$55,$56,$0A
        db $55,$5A,$0A,$77,$5B,$15,$55,$69
        db $0A,$77,$6D,$14,$6C,$6F,$0A,$6E
        db $7A,$0A,$6E,$7E,$05,$77,$83,$18
        db $77,$8A,$14,$FF,$01,$41,$18,$15
        db $FF,$01,$41,$48,$15,$FF,$01,$41
        db $48,$15,$FF,$01,$40,$0B,$18,$89
        db $14,$19,$89,$1A,$15,$89,$27,$14
        db $33,$30,$0C,$33,$34,$0A,$33,$3A
        db $07,$40,$3C,$06,$89,$44,$08,$89
        db $54,$09,$39,$63,$19,$39,$68,$19
        db $74,$6B,$0D,$39,$6D,$19,$41,$88
        db $15,$33,$88,$19,$FF,$01,$D6,$32
        db $0D,$52,$33,$0F,$BA,$34,$0F,$FF
        db $01,$41,$18,$15,$FF,$01,$A4,$16
        db $13,$A0,$1C,$16,$A4,$20,$13,$A0
        db $24,$12,$6E,$33,$19,$BC,$37,$16
        db $BC,$37,$18,$BC,$3C,$14,$BC,$3C
        db $19,$BC,$4F,$18,$BC,$50,$13,$2F
        db $51,$12,$6D,$59,$16,$A4,$5F,$14
        db $6E,$6A,$17,$BC,$6B,$18,$6F,$6E
        db $14,$BC,$72,$13,$BC,$72,$16,$BC
        db $7A,$15,$BC,$7A,$18,$6C,$7F,$19
        db $A2,$91,$15,$41,$A8,$15,$FF,$01
        db $29,$0F,$16,$29,$12,$11,$29,$1E
        db $10,$29,$20,$16,$29,$31,$14,$29
        db $33,$16,$29,$3E,$19,$6C,$41,$18
        db $29,$51,$19,$6C,$53,$18,$29,$55
        db $19,$29,$59,$15,$A6,$60,$17,$29
        db $6A,$19,$A6,$6C,$16,$29,$75,$17
        db $29,$79,$15,$29,$7D,$13,$6E,$7E
        db $11,$41,$98,$15,$29,$98,$19,$FF
        db $01,$41,$18,$15,$FF,$01,$D3,$08
        db $50,$6C,$22,$15,$6C,$24,$15,$6F
        db $2C,$11,$6C,$3A,$10,$72,$3B,$14
        db $72,$3C,$14,$28,$46,$0C,$6D,$4E
        db $08,$6C,$52,$0D,$58,$57,$09,$6D
        db $5F,$09,$6C,$62,$09,$6C,$63,$09
        db $72,$6C,$0D,$72,$6D,$0D,$58,$77
        db $06,$41,$88,$15,$FF,$01,$6C,$11
        db $18,$73,$15,$18,$6D,$20,$14,$6C
        db $23,$18,$A0,$25,$15,$A2,$2B,$16
        db $A4,$32,$16,$6D,$3F,$18,$73,$44
        db $18,$70,$4E,$18,$A6,$52,$14,$6D
        db $5E,$12,$70,$66,$18,$A2,$69,$16
        db $6F,$74,$16,$6D,$7D,$18,$6D,$7F
        db $18,$6E,$8B,$11,$41,$A8,$15,$FF
        db $01,$72,$0E,$19,$A6,$16,$17,$72
        db $21,$19,$6D,$24,$16,$72,$34,$18
        db $72,$37,$18,$73,$3B,$18,$6E,$53
        db $13,$6E,$56,$13,$6E,$59,$13,$6C
        db $5C,$19,$A0,$70,$18,$A4,$74,$17
        db $6D,$83,$17,$41,$A8,$15,$FF,$01
        db $41,$38,$15,$FF,$01,$41,$28,$15
        db $FF,$01,$41,$18,$15,$FF,$01,$72
        db $1A,$12,$6C,$18,$19,$C0,$10,$19
        db $C1,$13,$19,$6D,$2D,$13,$C0,$34
        db $12,$C1,$37,$12,$41,$58,$15,$FF
        db $01,$41,$58,$15,$FF,$01,$82,$02
        db $18,$41,$18,$15,$FF,$01,$FF,$01
        db $D3,$00,$50,$2D,$00,$19,$64,$10
        db $19,$64,$1C,$19,$43,$22,$19,$6C
        db $2F,$13,$43,$52,$19,$92,$52,$15
        db $6D,$63,$15,$43,$6C,$19,$43,$86
        db $19,$43,$96,$19,$92,$9E,$11,$FF
        db $01,$41,$28,$15,$FF,$01,$70,$10
        db $0F,$70,$13,$12,$70,$23,$0F,$70
        db $25,$19,$A2,$31,$13,$70,$32,$0A
        db $70,$34,$19,$70,$3B,$14,$70,$40
        db $0F,$70,$4B,$13,$70,$4E,$16,$68
        db $63,$0C,$70,$67,$0F,$68,$6E,$0C
        db $A0,$72,$0F,$FF,$01,$40,$0C,$18
        db $40,$0F,$18,$40,$1E,$18,$40,$26
        db $18,$40,$37,$14,$40,$3B,$14,$6C
        db $4A,$18,$40,$50,$18,$33,$50,$08
        db $33,$51,$08,$A6,$65,$18,$FF,$01
        db $77,$0D,$16,$6A,$17,$14,$66,$1C
        db $14,$A1,$23,$04,$63,$24,$16,$65
        db $28,$17,$66,$31,$16,$A3,$33,$08
        db $77,$44,$14,$6A,$4E,$14,$65,$57
        db $18,$77,$58,$14,$A0,$65,$09,$66
        db $65,$16,$A4,$6C,$08,$63,$6C,$13
        db $FF,$01,$81,$0C,$14,$81,$09,$18
        db $BA,$0D,$14,$FF,$01,$43,$10,$18
        db $43,$17,$18,$A3,$18,$14,$29,$18
        db $0E,$42,$22,$0B,$29,$23,$17,$A4
        db $2C,$18,$29,$2F,$09,$A7,$34,$0E
        db $77,$4D,$0F,$77,$47,$15,$77,$53
        db $11,$77,$51,$15,$77,$5E,$0F,$77
        db $63,$0D,$77,$6B,$12,$77,$70,$14
        db $77,$76,$0F,$77,$78,$16,$77,$7E
        db $12,$77,$8D,$0F,$A3,$80,$10,$A2
        db $84,$11,$A3,$88,$10,$A2,$8C,$12
        db $29,$A0,$0F,$29,$A6,$0F,$29,$A4
        db $0F,$A4,$A8,$10,$42,$AD,$0F,$29
        db $BC,$09,$FF,$01,$C1,$19,$13,$72
        db $20,$18,$C1,$2B,$13,$73,$39,$15
        db $A4,$4A,$11,$72,$53,$17,$72,$55
        db $10,$73,$61,$14,$72,$6B,$16,$72
        db $6C,$17,$A4,$6E,$16,$72,$7E,$18
        db $A4,$81,$17,$C1,$8B,$14,$74,$9D
        db $19,$41,$A8,$15,$FF,$01,$2B,$10
        db $15,$83,$3F,$12,$B6,$63,$12,$6B
        db $75,$16,$83,$91,$11,$B6,$B7,$11
        db $41,$C8,$15,$FF,$01,$6C,$13,$13
        db $6C,$17,$15,$6C,$1A,$16,$6C,$1E
        db $19,$6C,$33,$13,$6C,$37,$15,$6E
        db $3C,$17,$6E,$3F,$18,$71,$51,$14
        db $71,$57,$17,$71,$59,$18,$A6,$60
        db $19,$83,$65,$12,$C0,$92,$18,$C1
        db $94,$18,$6E,$B3,$17,$6E,$B7,$17
        db $41,$C8,$15,$FF,$01,$81,$0C,$18
        db $BA,$0D,$14,$FF,$01,$D3,$00,$51
        db $70,$18,$09,$70,$1B,$09,$A2,$20
        db $0C,$A2,$25,$10,$A6,$29,$12,$A2
        db $2E,$12,$43,$58,$11,$43,$65,$0E
        db $70,$77,$0C,$70,$79,$0D,$D3,$7C
        db $51,$FF,$01,$70,$0B,$12,$70,$0D
        db $12,$41,$18,$15,$FF,$01,$6C,$38
        db $06,$A3,$3C,$08,$A3,$40,$06,$A3
        db $46,$04,$A3,$4A,$05,$A3,$4C,$06
        db $A3,$4E,$07,$41,$88,$15,$FF,$01
        db $6C,$1B,$16,$6C,$1F,$0A,$6C,$1F
        db $10,$6C,$21,$10,$6C,$28,$0C,$6C
        db $2A,$0C,$6C,$5C,$0B,$6C,$5E,$0B
        db $6C,$5D,$13,$6C,$69,$11,$6C,$64
        db $16,$6C,$66,$17,$6C,$70,$18,$FF
        db $01,$70,$12,$13,$70,$15,$10,$70
        db $19,$10,$A4,$1F,$16,$A3,$25,$0F
        db $A3,$2C,$0C,$70,$2B,$0F,$70,$32
        db $12,$70,$34,$14,$A4,$37,$18,$6C
        db $4C,$09,$6C,$50,$0B,$6C,$56,$09
        db $6C,$65,$0B,$A4,$64,$14,$A2,$66
        db $16,$A2,$6C,$17,$70,$6A,$18,$A2
        db $71,$15,$70,$76,$18,$A0,$78,$17
        db $A1,$78,$13,$FF,$01,$C0,$17,$14
        db $C1,$19,$14,$C0,$2C,$17,$6C,$33
        db $17,$6C,$3B,$18,$6C,$41,$17,$C1
        db $47,$17,$A0,$6B,$16,$A0,$70,$17
        db $41,$88,$15,$FF,$01,$70,$12,$0D
        db $70,$16,$0D,$A0,$19,$11,$A1,$26
        db $09,$A1,$2B,$05,$A0,$2B,$0B,$70
        db $28,$0C,$70,$2A,$0C,$70,$27,$09
        db $70,$2D,$05,$A0,$41,$07,$70,$50
        db $0C,$A1,$54,$09,$70,$68,$10,$A1
        db $6A,$0E,$70,$6F,$10,$A0,$70,$0F
        db $A1,$72,$0C,$FF,$01,$AF,$02,$11
        db $A4,$1A,$1A,$6F,$1B,$12,$A4,$29
        db $19,$A4,$2C,$19,$6C,$37,$19,$5D
        db $51,$12,$6E,$7E,$16,$6E,$9E,$16
        db $41,$D8,$15,$FF,$01,$70,$12,$16
        db $70,$17,$18,$68,$15,$13,$70,$22
        db $15,$80,$25,$14,$68,$33,$10,$69
        db $48,$10,$70,$4B,$16,$6F,$50,$13
        db $6F,$65,$13,$69,$61,$11,$70,$71
        db $18,$70,$71,$18,$69,$7E,$14,$69
        db $86,$17,$70,$88,$15,$FF,$01,$D4
        db $00,$1E,$72,$0F,$15,$A4,$13,$19
        db $A6,$26,$19,$77,$38,$17,$26,$33
        db $14,$80,$39,$13,$77,$48,$18,$77
        db $55,$17,$77,$5F,$18,$77,$67,$17
        db $80,$60,$13,$80,$69,$12,$FF,$01
        db $72,$2E,$13,$72,$30,$15,$72,$31
        db $16,$72,$42,$16,$72,$43,$17,$6E
        db $60,$16,$77,$84,$18,$40,$95,$14
        db $A1,$99,$12,$A1,$9D,$12,$A5,$A8
        db $16,$A3,$AE,$16,$40,$AA,$19,$A6
        db $B4,$17,$40,$C4,$15,$40,$CF,$14
        db $40,$D2,$19,$A3,$D7,$15,$A3,$E0
        db $15,$40,$E0,$18,$40,$EA,$18,$FF
        db $01,$AF,$02,$11,$74,$2E,$05,$A6
        db $3A,$0A,$A6,$40,$0A,$A6,$46,$0A
        db $A6,$50,$0B,$A6,$56,$0F,$A6,$5C
        db $13,$A6,$8D,$13,$BB,$92,$01,$A6
        db $93,$0F,$A6,$99,$0B,$80,$C1,$19
        db $41,$E8,$15,$FF,$01,$70,$0E,$0F
        db $70,$11,$12,$70,$13,$14,$70,$15
        db $16,$A3,$27,$10,$70,$2C,$12,$A0
        db $2D,$16,$6C,$48,$09,$6C,$4A,$0A
        db $6C,$54,$09,$6C,$6C,$0A,$A6,$75
        db $15,$A3,$7D,$14,$FF,$01,$D3,$00
        db $51,$D4,$01,$2C,$2D,$06,$19,$6C
        db $12,$15,$6C,$38,$16,$3E,$54,$18
        db $FF,$01,$3F,$08,$0A,$3F,$14,$0F
        db $2F,$1D,$0A,$3F,$23,$0F,$FF,$01
        db $FF,$01,$94,$18,$05,$FF,$01,$98
        db $16,$14,$94,$48,$09,$99,$58,$09
        db $FF,$01,$94,$27,$14,$99,$37,$14
        db $FF,$01,$94,$37,$10,$98,$77,$14
        db $FF,$01,$94,$35,$14,$98,$57,$14
        db $9A,$65,$06,$FF,$01,$9A,$44,$09
        db $98,$67,$14,$FF,$01,$98,$18,$05
        db $94,$48,$05,$FF,$01,$72,$0F,$17
        db $72,$11,$18,$A2,$14,$17,$A6,$22
        db $17,$72,$34,$15,$72,$36,$16,$72
        db $38,$17,$77,$41,$19,$6C,$52,$14
        db $6C,$54,$15,$6C,$56,$16,$74,$65
        db $18,$A5,$66,$11,$73,$6B,$18,$83
        db $92,$12,$41,$C8,$15,$FF,$01,$46
        db $10,$15,$6C,$1A,$17,$33,$21,$17
        db $33,$23,$17,$33,$27,$16,$39,$2A
        db $15,$39,$2F,$16,$29,$37,$15,$29
        db $3D,$14,$29,$43,$13,$40,$4A,$18
        db $40,$54,$18,$40,$5D,$18,$33,$65
        db $12,$33,$68,$12,$33,$6B,$12,$40
        db $74,$18,$40,$7A,$19,$40,$7F,$19
        db $41,$A8,$15,$FF,$01,$D3,$00,$60
        db $3B,$00,$19,$3C,$0B,$11,$3C,$0F
        db $17,$44,$1B,$15,$6F,$2F,$13,$64
        db $37,$19,$64,$3C,$19,$64,$4A,$19
        db $64,$4E,$19,$64,$5C,$19,$64,$5F
        db $19,$44,$52,$15,$6F,$6B,$10,$64
        db $6A,$19,$64,$6F,$19,$A4,$7B,$13
        db $FF,$01,$3C,$0B,$08,$64,$12,$1A
        db $41,$28,$15,$FF,$01,$D3,$00,$00
        db $93,$1D,$14,$6D,$29,$12,$6D,$3B
        db $12,$6D,$3C,$18,$6F,$44,$14,$6D
        db $54,$14,$6E,$6E,$14,$6F,$76,$12
        db $93,$7A,$13,$D3,$00,$00,$FF,$01
        db $80,$10,$16,$41,$28,$15,$FF,$01
        db $27,$12,$18,$6D,$13,$13,$6D,$2B
        db $17,$6D,$35,$18,$27,$5A,$19,$27
        db $6A,$18,$6F,$6D,$15,$6F,$71,$13
        db $41,$88,$15,$FF,$01,$2F,$0E,$10
        db $8B,$15,$15,$8C,$1C,$11,$8B,$2F
        db $15,$8C,$34,$11,$60,$48,$17,$8C
        db $4B,$11,$60,$57,$13,$2F,$57,$16
        db $8C,$61,$15,$8B,$77,$18,$FF,$01
        db $4B,$1D,$24,$FF,$01,$41,$58,$15
        db $FF,$01,$6D,$12,$10,$6D,$1C,$15
        db $6F,$29,$13,$6D,$38,$18,$73,$43
        db $12,$73,$44,$12,$6D,$4B,$16,$27
        db $5B,$15,$27,$62,$13,$72,$6F,$10
        db $72,$71,$10,$6D,$79,$10,$6D,$79
        db $18,$74,$8B,$14,$74,$8D,$14,$41
        db $A8,$15,$FF,$01,$D4,$00,$1C,$6E
        db $12,$15,$6E,$17,$15,$74,$14,$17
        db $6E,$2D,$16,$A7,$30,$11,$A6,$37
        db $17,$74,$4E,$17,$58,$52,$13,$A2
        db $54,$17,$A7,$69,$10,$6E,$70,$15
        db $74,$78,$17,$41,$98,$15,$FF,$01
        db $6D,$1D,$15,$6F,$29,$16,$6D,$37
        db $13,$6D,$38,$18,$FF,$01,$6D,$1D
        db $16,$6F,$29,$17,$6D,$37,$14,$6D
        db $38,$19,$FF,$01,$D3,$00,$02,$2C
        db $0F,$18,$2C,$14,$15,$2C,$1C,$13
        db $2C,$2A,$11,$24,$2C,$14,$2C,$3A
        db $19,$6D,$30,$16,$2C,$49,$15,$2C
        db $4E,$0C,$2C,$4D,$12,$24,$50,$10
        db $2C,$53,$0D,$6D,$5C,$07,$2C,$67
        db $0A,$2C,$69,$07,$2C,$79,$11,$2C
        db $78,$15,$2C,$88,$16,$FF,$01,$3C
        db $09,$0E,$6D,$1E,$06,$3C,$11,$08
        db $3C,$14,$10,$3C,$27,$06,$3C,$27
        db $13,$27,$3E,$08,$3C,$31,$03,$28
        db $4A,$11,$6D,$52,$0E,$3C,$57,$0A
        db $3C,$56,$18,$3C,$5F,$14,$27,$7B
        db $11,$3C,$78,$09,$3C,$74,$18,$41
        db $88,$15,$FF,$01,$46,$14,$16,$2A
        db $24,$18,$A2,$2A,$17,$A4,$3A,$16
        db $2A,$46,$18,$2A,$4A,$18,$2A,$5C
        db $18,$73,$63,$19,$2A,$65,$18,$46
        db $6C,$16,$41,$88,$15,$FF,$01,$D3
        db $00,$53,$64,$11,$19,$64,$19,$19
        db $64,$23,$19,$58,$40,$13,$6F,$4B
        db $12,$59,$57,$10,$44,$5D,$15,$58
        db $6B,$11,$64,$6B,$19,$43,$76,$19
        db $FF,$01,$41,$28,$15,$FF,$01,$6D
        db $13,$12,$6D,$1A,$18,$3C,$21,$13
        db $6F,$30,$11,$6C,$36,$18,$44,$4D
        db $18,$6F,$5C,$0D,$37,$74,$14,$44
        db $78,$12,$6F,$82,$15,$41,$98,$15
        db $6C,$98,$18,$FF,$01,$D3,$00,$00
        db $D4,$01,$2C,$36,$17,$14,$36,$23
        db $16,$36,$25,$13,$36,$27,$19,$36
        db $2F,$15,$6D,$43,$15,$36,$44,$18
        db $36,$4B,$14,$36,$56,$16,$36,$58
        db $15,$36,$61,$13,$36,$6D,$18,$36
        db $6F,$15,$36,$70,$1A,$6F,$75,$13
        db $6D,$7C,$16,$FF,$01,$92,$12,$16
        db $92,$19,$18,$72,$1E,$12,$72,$23
        db $12,$72,$24,$12,$44,$2E,$13,$37
        db $3F,$19,$3C,$46,$18,$3C,$4D,$16
        db $91,$62,$15,$91,$6B,$16,$58,$77
        db $10,$91,$75,$16,$91,$7E,$15,$91
        db $87,$15,$91,$90,$16,$41,$A8,$15
        db $FF,$01,$D3,$00,$09,$77,$12,$10
        db $66,$18,$16,$77,$1D,$17,$61,$1F
        db $11,$77,$2D,$15,$D2,$34,$11,$61
        db $3B,$11,$D2,$3C,$0C,$6D,$44,$09
        db $6F,$51,$03,$6D,$56,$07,$6C,$58
        db $07,$6D,$61,$09,$66,$6C,$11,$66
        db $72,$11,$77,$77,$15,$FF,$01,$82
        db $03,$18,$82,$0E,$18,$41,$18,$15
        db $FF,$01,$29,$2B,$19,$41,$38,$15
        db $FF,$01,$6D,$0B,$13,$6D,$12,$14
        db $6D,$24,$14,$6D,$26,$14,$40,$33
        db $19,$40,$3C,$18,$73,$45,$19,$6F
        db $52,$17,$40,$5E,$17,$40,$65,$17
        db $40,$6B,$17,$40,$74,$17,$92,$81
        db $15,$6D,$84,$15,$41,$A8,$15,$FF
        db $01,$D3,$00,$0A,$D4,$01,$4E,$58
        db $26,$0C,$58,$6F,$02,$FF,$01,$6E
        db $06,$17,$41,$28,$15,$FF,$01,$6D
        db $26,$0D,$41,$58,$15,$FF,$01,$A0
        db $0A,$16,$A0,$12,$17,$A0,$22,$18
        db $A0,$34,$18,$A0,$48,$18,$A0,$4C
        db $18,$A0,$5C,$18,$A0,$6E,$18,$A0
        db $96,$18,$A0,$B8,$18,$FF,$01,$D3
        db $00,$54,$77,$11,$16,$77,$17,$14
        db $66,$1A,$0E,$77,$1C,$17,$63,$22
        db $15,$6A,$29,$10,$77,$2A,$14,$77
        db $32,$16,$66,$41,$0E,$66,$43,$0F
        db $77,$48,$16,$77,$4C,$14,$77,$50
        db $17,$D2,$57,$15,$77,$60,$16,$66
        db $65,$0E,$66,$69,$0E,$D2,$72,$15
        db $6A,$78,$12,$FF,$01,$6F,$09,$07
        db $6C,$02,$10,$6C,$04,$10,$A2,$0E
        db $27,$57,$07,$2C,$56,$0E,$2F,$56
        db $0A,$33,$6D,$01,$36,$6F,$04,$43
        db $6D,$0C,$48,$6D,$07,$57,$A2,$08
        db $5E,$57,$02,$60,$56,$08,$60,$6D
        db $03,$6D,$FF,$01,$D3,$00,$0F,$B5
        db $0F,$0F,$67,$14,$18,$63,$2E,$13
        db $6A,$36,$13,$BB,$3F,$0F,$63,$56
        db $0D,$6A,$63,$0C,$6A,$69,$10,$B5
        db $6F,$0F,$67,$7E,$18,$63,$8A,$13
        db $67,$97,$15,$FF,$01,$77,$0D,$12
        db $63,$16,$15,$65,$1E,$17,$62,$24
        db $11,$77,$2F,$14,$77,$31,$0C,$66
        db $36,$0D,$65,$48,$18,$77,$49,$0D
        db $77,$5D,$0D,$66,$5E,$12,$61,$6C
        db $10,$63,$75,$15,$77,$79,$0F,$FF
        db $01,$56,$08,$0D,$A2,$09,$2E,$A2
        db $09,$37,$56,$06,$2F,$FF,$01,$65
        db $14,$09,$62,$1D,$06,$65,$24,$09
        db $62,$30,$11,$66,$33,$0C,$67,$3A
        db $18,$67,$4E,$18,$66,$4E,$0C,$61
        db $67,$0A,$67,$70,$18,$62,$7B,$05
        db $65,$7D,$12,$FF,$01,$6C,$0F,$10
        db $6C,$07,$10,$6C,$0E,$20,$FF,$01
        db $57,$0B,$0D,$56,$05,$0F,$A0,$04
        db $42,$6D,$05,$52,$56,$0B,$5B,$A0
        db $04,$61,$6C,$0D,$67,$6C,$0F,$67
        db $FF,$01,$83,$2A,$12,$6D,$55,$18
        db $6D,$60,$18,$6F,$69,$14,$6F,$75
        db $10,$FF,$01,$83,$0F,$12,$41,$18
        db $15,$FF,$01,$D3,$00,$12,$D6,$2B
        db $07,$52,$2C,$16,$BA,$2D,$16,$FF
        db $01,$7F,$0C,$16,$7C,$10,$17,$7B
        db $18,$15,$A6,$26,$07,$7E,$30,$17
        db $7C,$42,$0F,$7E,$46,$11,$7B,$58
        db $13,$7B,$5F,$15,$7B,$64,$13,$A6
        db $72,$15,$7A,$7A,$17,$FF,$01,$D3
        db $00,$55,$BB,$0A,$00,$6C,$1B,$18
        db $6D,$20,$10,$B7,$21,$00,$B7,$3A
        db $00,$BB,$50,$00,$58,$5E,$14,$58
        db $6D,$11,$58,$79,$16,$FF,$01,$6C
        db $0B,$18,$6B,$22,$16,$6B,$2E,$13
        db $6B,$30,$13,$6B,$32,$13,$A4,$36
        db $18,$6B,$3D,$13,$6B,$41,$13,$83
        db $4F,$12,$6B,$55,$13,$BC,$60,$18
        db $6B,$64,$18,$BC,$66,$17,$6B,$6A
        db $18,$41,$88,$15,$FF,$01,$86,$11
        db $17,$86,$25,$17,$FF,$01,$D3,$00
        db $52,$D4,$01,$18,$7B,$10,$14,$3B
        db $12,$19,$7B,$16,$15,$7F,$1B,$16
        db $A6,$2E,$16,$A6,$3C,$14,$BB,$48
        db $19,$7F,$50,$14,$B4,$5C,$19,$7F
        db $63,$16,$B4,$65,$19,$BB,$7C,$19
        db $FF,$01,$D3,$00,$07,$9F,$16,$16
        db $9F,$18,$14,$9F,$1B,$13,$9F,$1D
        db $16,$9F,$20,$17,$9F,$23,$18,$9F
        db $26,$16,$9F,$29,$18,$9F,$2C,$17
        db $9F,$2E,$16,$9F,$30,$15,$9F,$33
        db $15,$9F,$36,$16,$6F,$37,$14,$9F
        db $39,$18,$9F,$3C,$18,$9F,$3F,$18
        db $58,$5D,$17,$FF,$01,$D3,$00,$20
        db $6F,$0A,$10,$28,$10,$11,$28,$14
        db $0D,$38,$18,$08,$28,$1C,$06,$28
        db $2C,$11,$28,$33,$0C,$28,$37,$0A
        db $27,$4C,$13,$28,$4E,$0F,$58,$56
        db $14,$27,$58,$07,$38,$5D,$05,$28
        db $74,$11,$28,$7A,$0A,$58,$7E,$14
        db $27,$90,$12,$37,$95,$0E,$38,$96
        db $0B,$FF,$01,$65,$06,$17,$83,$0F
        db $03,$B6,$16,$03,$B6,$27,$0B,$83
        db $30,$0B,$65,$44,$17,$FF,$01,$D3
        db $00,$10,$FF,$01,$D3,$00,$10,$FF
        db $01,$25,$00,$80,$FF,$01,$6D,$24
        db $17,$25,$20,$80,$FF,$01,$6B,$10
        db $15,$6B,$18,$14,$FF,$01,$7A,$10
        db $13,$7E,$15,$0F,$7E,$1E,$17,$7F
        db $22,$15,$BC,$2C,$17,$BD,$33,$16
        db $BC,$3A,$15,$BD,$42,$17,$7F,$47
        db $18,$BC,$55,$17,$BC,$56,$16,$BC
        db $5D,$18,$BD,$5C,$13,$A2,$51,$16
        db $7F,$60,$15,$BD,$66,$14,$BD,$6A
        db $17,$7F,$73,$15,$BC,$79,$14,$FF
        db $01,$D3,$00,$12,$FF,$01,$D3,$00
        db $10,$FF,$01,$63,$0F,$13,$63,$17
        db $17,$FF,$01,$91,$06,$12,$91,$12
        db $15,$91,$1C,$17,$90,$28,$13,$92
        db $2F,$15,$91,$2F,$19,$90,$37,$17
        db $91,$44,$17,$91,$45,$05,$90,$5D
        db $13,$6F,$61,$11,$93,$65,$15,$90
        db $6C,$17,$93,$73,$19,$6E,$7C,$16
        db $FF,$01,$A2,$0C,$13,$A6,$15,$14
        db $A5,$1C,$10,$A1,$20,$15,$A6,$25
        db $15,$6F,$34,$11,$FF,$01,$A4,$0A
        db $14,$A4,$12,$14,$A0,$1E,$15,$A5
        db $2C,$12,$A2,$31,$15,$A4,$33,$13
        db $A4,$3A,$14,$FF,$01,$9E,$0E,$0D
        db $9E,$12,$0F,$9E,$19,$10,$9E,$17
        db $0D,$9E,$1E,$11,$9E,$23,$10,$9E
        db $2B,$0F,$9E,$25,$0B,$9E,$33,$0F
        db $FF,$01,$87,$0D,$14,$81,$1B,$18
        db $81,$1D,$14,$82,$2D,$13,$86,$37
        db $13,$FF,$01,$BB,$04,$19,$B4,$17
        db $19,$B4,$5C,$19,$BB,$70,$19,$FF
        db $01,$D6,$0C,$03,$52,$0D,$15,$BA
        db $0E,$15,$FF,$01,$52,$0B,$13,$BA
        db $0C,$13,$FF,$01,$52,$0B,$13,$BA
        db $0C,$13,$FF,$01,$81,$0A,$17,$BA
        db $0D,$14,$FF,$01,$D3,$00,$12,$FF
        db $00,$82,$69,$18,$41,$78,$15,$FF
        db $01,$41,$18,$15,$FF,$00,$D4,$00
        db $2E,$39,$0E,$0A,$33,$1D,$08,$33
        db $23,$06,$A6,$24,$05,$66,$2E,$13
        db $39,$36,$02,$A6,$3C,$07,$6E,$49
        db $08,$39,$55,$18,$39,$58,$18,$A6
        db $5A,$03,$A6,$60,$09,$A6,$64,$04
        db $A1,$66,$11,$A6,$6A,$08,$A2,$6E
        db $07,$39,$71,$04,$A6,$72,$04,$A6
        db $78,$07,$FF,$01,$81,$0B,$16,$81
        db $07,$18,$BA,$0D,$14,$FF,$01,$81
        db $0B,$16,$BA,$0D,$14,$FF,$00,$41
        db $48,$15,$FF,$00,$6E,$0A,$14,$72
        db $11,$05,$72,$1B,$05,$73,$1F,$09
        db $72,$25,$05,$72,$29,$11,$72,$2D
        db $11,$73,$3A,$16,$73,$3D,$16,$6E
        db $55,$11,$72,$61,$05,$72,$6B,$05
        db $72,$75,$05,$72,$7F,$05,$41,$B8
        db $15,$FF,$00,$6B,$12,$17,$6B,$19
        db $15,$6B,$1F,$16,$6B,$24,$18,$6B
        db $29,$17,$6B,$2E,$16,$6D,$34,$19
        db $6B,$40,$18,$59,$47,$19,$72,$56
        db $11,$59,$5D,$19,$72,$64,$11,$59
        db $83,$14,$A0,$9E,$17,$6B,$A1,$18
        db $A0,$A4,$18,$6B,$B8,$19,$41,$B8
        db $15,$FF,$00,$89,$09,$19,$89,$19
        db $19,$6D,$22,$17,$89,$34,$19,$72
        db $34,$13,$72,$35,$19,$72,$43,$11
        db $72,$43,$17,$6D,$52,$11,$6D,$52
        db $13,$6D,$64,$13,$6D,$69,$15,$6D
        db $6F,$17,$41,$98,$15,$89,$9A,$19
        db $FF,$00,$59,$0F,$13,$6D,$12,$17
        db $59,$29,$13,$59,$29,$19,$59,$47
        db $12,$6C,$42,$17,$6C,$48,$17,$6B
        db $63,$13,$6C,$62,$13,$6C,$6F,$14
        db $6B,$6C,$13,$6B,$6C,$18,$6B,$7D
        db $14,$6B,$80,$17,$6C,$8B,$13,$6C
        db $8D,$13,$FF,$00,$3F,$11,$19,$3F
        db $1A,$19,$3F,$1C,$19,$8A,$1F,$11
        db $3F,$28,$19,$3F,$2E,$16,$8A,$3D
        db $11,$2F,$42,$12,$3F,$4C,$16,$8A
        db $60,$01,$2F,$6D,$01,$8A,$76,$01
        db $8A,$7A,$02,$8A,$7E,$03,$8A,$86
        db $03,$4B,$AD,$18,$FF,$00,$D3,$04
        db $31,$2F,$0C,$11,$2F,$1E,$11,$FF
        db $00,$73,$11,$17,$6D,$14,$16,$77
        db $16,$0A,$6D,$1A,$16,$6D,$23,$17
        db $82,$30,$18,$6E,$3A,$19,$6D,$44
        db $17,$82,$4E,$15,$6F,$55,$04,$6F
        db $58,$04,$A4,$5E,$15,$82,$6B,$15
        db $82,$95,$18,$41,$98,$15,$FF,$00
        db $81,$18,$09,$6B,$18,$11,$6B,$18
        db $15,$6B,$25,$18,$6B,$29,$18,$6C
        db $2D,$08,$6C,$31,$0A,$FF,$00,$41
        db $18,$15,$FF,$00,$41,$18,$15,$FF
        db $00,$D5,$0A,$16,$FF,$00,$4C,$4C
        db $27,$FF,$00,$9E,$06,$17,$9E,$0B
        db $15,$9E,$0D,$11,$53,$12,$0F,$53
        db $18,$0F,$9E,$1E,$12,$9E,$24,$16
        db $9E,$2C,$15,$9E,$2E,$11,$3F,$28
        db $17,$9E,$32,$11,$9E,$36,$12,$53
        db $3A,$0F,$2F,$47,$17,$9E,$4B,$14
        db $9E,$4E,$17,$9E,$51,$14,$53,$56
        db $0F,$53,$5E,$0F,$9E,$63,$11,$2F
        db $6F,$15,$9E,$6A,$10,$9E,$71,$12
        db $9E,$78,$13,$53,$79,$0F,$3F,$7E
        db $17,$FF,$00,$8A,$09,$04,$5B,$14
        db $15,$5A,$1C,$15,$5B,$23,$15,$8A
        db $24,$04,$5A,$28,$15,$4B,$4D,$17
        db $FF,$00,$8A,$3E,$12,$5A,$45,$15
        db $8A,$4B,$12,$FF,$00,$9E,$12,$12
        db $9E,$18,$12,$9E,$1F,$12,$9E,$27
        db $11,$5B,$38,$15,$5A,$47,$16,$9E
        db $51,$11,$9E,$53,$14,$9E,$5E,$11
        db $5A,$5B,$17,$3F,$6B,$18,$4B,$9D
        db $17,$FF,$00,$D3,$01,$30,$D3,$1C
        db $30,$D6,$44,$0C,$BA,$45,$11,$52
        db $4A,$18,$FF,$00,$32,$2A,$17,$32
        db $2D,$13,$31,$2D,$15,$31,$30,$11
        db $32,$3A,$15,$31,$3D,$13,$32,$42
        db $18,$32,$43,$13,$31,$45,$16,$FF
        db $00,$5A,$11,$14,$77,$17,$13,$77
        db $1F,$17,$5A,$25,$14,$77,$29,$13
        db $4C,$5C,$28,$FF,$00,$5A,$10,$14
        db $5B,$19,$15,$3F,$14,$18,$8A,$2B
        db $11,$2F,$3F,$14,$3F,$36,$18,$8A
        db $48,$11,$2F,$4F,$14,$3F,$5C,$18
        db $3F,$55,$18,$8A,$6B,$11,$3F,$68
        db $18,$3F,$72,$18,$3F,$74,$18,$3F
        db $7D,$18,$4C,$AD,$17,$FF,$00,$77
        db $21,$17,$77,$3A,$17,$77,$4C,$17
        db $FF,$00,$9E,$0D,$13,$8A,$16,$12
        db $5B,$11,$14,$5A,$23,$14,$5B,$2A
        db $0F,$8A,$32,$0D,$5A,$3B,$0F,$5A
        db $3B,$14,$2F,$49,$11,$8A,$4D,$0F
        db $5B,$4C,$15,$8A,$5B,$0F,$5B,$5C
        db $17,$8A,$70,$0F,$FF,$00,$4B,$3C
        db $17,$FF,$00,$98,$06,$14,$98,$17
        db $11,$98,$2A,$0A,$98,$37,$14,$98
        db $47,$14,$98,$56,$11,$98,$6A,$14
        db $98,$73,$0A,$FF,$00,$A2,$0C,$14
        db $A2,$13,$17,$2F,$14,$10,$5B,$18
        db $15,$A2,$1D,$15,$A6,$25,$16,$A2
        db $2A,$13,$A2,$31,$18,$8A,$35,$0F
        db $A2,$39,$14,$2F,$46,$16,$A2,$48
        db $18,$A2,$4C,$18,$A0,$58,$15,$A3
        db $58,$11,$A6,$60,$14,$A2,$66,$16
        db $8A,$72,$0F,$2F,$7F,$10,$2F,$83
        db $14,$A2,$87,$19,$FF,$00,$5A,$10
        db $15,$3F,$11,$18,$3F,$13,$18,$5A
        db $19,$15,$8A,$1A,$0F,$4B,$3C,$27
        db $FF,$00,$60,$13,$15,$51,$1F,$15
        db $2F,$26,$12,$2F,$2D,$12,$31,$38
        db $17,$31,$3E,$15,$32,$3E,$17,$2F
        db $44,$16,$31,$4D,$15,$5A,$54,$15
        db $8A,$5A,$10,$5B,$64,$14,$5F,$7C
        db $16,$31,$7A,$15,$31,$81,$15,$4B
        db $AC,$37,$FF,$00,$D3,$08,$40,$2F
        db $04,$14,$2F,$0C,$14,$2F,$0D,$17
        db $FF,$00,$9E,$0C,$15,$3A,$09,$16
        db $9E,$10,$13,$9E,$15,$0F,$9E,$1A
        db $09,$9E,$1D,$06,$30,$46,$02,$5B
        db $48,$08,$5B,$48,$12,$5A,$41,$0D
        db $4C,$7C,$17,$FF,$00,$51,$08,$16
        db $5B,$17,$14,$5B,$1E,$15,$5F,$25
        db $0A,$5B,$30,$12,$FF,$00,$08,$0C
        db $0B,$4C,$6C,$17,$FF,$00,$8A,$0C
        db $04,$5B,$14,$15,$5A,$1C,$15,$5B
        db $23,$15,$8A,$24,$04,$5A,$28,$15
        db $FF,$00,$8A,$0A,$11,$5B,$10,$14
        db $FF,$00,$3F,$2A,$16,$3F,$39,$16
        db $3F,$49,$16,$3F,$54,$19,$3F,$5B
        db $19,$3F,$62,$12,$3F,$63,$12,$3F
        db $6C,$15,$5B,$6E,$14,$4B,$8D,$27
        db $FF,$00,$30,$10,$10,$30,$18,$10
        db $30,$27,$14,$8B,$22,$14,$8B,$30
        db $15,$30,$32,$10,$30,$3A,$11,$8C
        db $41,$10,$30,$4C,$14,$8A,$52,$13
        db $30,$53,$14,$8C,$5C,$15,$4B,$8C
        db $17,$FF,$00,$5A,$11,$16,$5F,$1C
        db $16,$60,$28,$16,$3F,$31,$18,$5A
        db $35,$17,$8F,$4C,$10,$8B,$50,$18
        db $8A,$52,$10,$8F,$5C,$10,$2F,$83
        db $17,$3F,$87,$13,$8A,$9A,$10,$5F
        db $A0,$15,$3F,$A8,$13,$08,$AA,$13
        db $5B,$B4,$17,$3F,$B9,$14,$4B,$EC
        db $38,$FF,$00,$9E,$14,$13,$9E,$1E
        db $11,$8A,$2E,$10,$9E,$32,$12,$9E
        db $38,$13,$08,$3B,$15,$9E,$3C,$12
        db $9E,$49,$13,$9E,$4E,$12,$8A,$52
        db $10,$9E,$57,$13,$9E,$5C,$10,$9E
        db $5E,$13,$9E,$69,$12,$08,$74,$16
        db $5E,$A2,$14,$08,$AA,$13,$2F,$B2
        db $12,$60,$B7,$16,$08,$C4,$13,$8B
        db $CD,$18,$08,$CE,$13,$FF,$00,$D0
        db $18,$14,$D0,$1D,$14,$D0,$22,$14
        db $2E,$31,$10,$30,$4E,$15,$5A,$55
        db $13,$5A,$58,$0D,$5A,$5B,$07,$9E
        db $6A,$09,$9E,$6E,$09,$9E,$74,$09
        db $9E,$7A,$09,$51,$89,$12,$8B,$9A
        db $0F,$9E,$A1,$13,$5A,$A8,$18,$9E
        db $AA,$13,$9E,$AF,$13,$18,$CC,$0B
        db $18,$EC,$0B,$FF,$00,$3F,$04,$18
        db $3F,$0A,$18,$8C,$16,$10,$D0,$40
        db $15,$75,$62,$16,$75,$6C,$16,$75
        db $73,$17,$75,$7E,$15,$D0,$A3,$16
        db $75,$D1,$17,$75,$D6,$16,$75,$D9
        db $16,$75,$E1,$14,$75,$E5,$17,$FF
        db $00,$B8,$03,$03,$AE,$0E,$09,$BE
        db $09,$09,$BE,$0D,$0C,$BE,$15,$0C
        db $BE,$1D,$08,$AB,$16,$02,$AC,$21
        db $0A,$BF,$29,$0A,$BE,$26,$07,$BE
        db $29,$07,$AA,$28,$0D,$AB,$2E,$03
        db $BE,$34,$0C,$BE,$38,$06,$BE,$3C
        db $09,$AE,$4F,$0A,$BE,$43,$0D,$BE
        db $46,$0D,$AB,$4C,$04,$AE,$5E,$08
        db $BE,$5A,$0F,$AB,$58,$03,$AE,$64
        db $08,$AE,$69,$08,$BE,$60,$0C,$AA
        db $64,$0F,$AE,$72,$08,$AE,$77,$08
        db $AB,$7B,$03,$BF,$80,$06,$AB,$86
        db $04,$AB,$96,$02,$FF,$00,$09,$16
        db $14,$FF,$00,$0E,$0D,$08,$FF,$00
        db $D3,$00,$03,$C4,$17,$0F,$AC,$18
        db $0D,$C8,$24,$15,$C8,$27,$15,$BC
        db $2D,$0C,$CA,$38,$07,$CB,$3C,$08
        db $C8,$44,$0F,$BF,$49,$0A,$CA,$4E
        db $0D,$CA,$5D,$0A,$C9,$5F,$10,$BC
        db $5A,$0E,$CA,$61,$0A,$C9,$62,$10
        db $CB,$66,$0A,$C8,$65,$10,$CB,$6A
        db $0A,$C8,$68,$10,$BC,$70,$0C,$FF
        db $00,$D3,$00,$0B,$C4,$13,$0D,$AA
        db $16,$13,$C4,$18,$0D,$BC,$1E,$0C
        db $C4,$24,$10,$C6,$28,$09,$AA,$29
        db $14,$BC,$2C,$0D,$C6,$2D,$09,$BF
        db $38,$0A,$AA,$3D,$14,$C5,$47,$12
        db $BC,$4D,$10,$C5,$4F,$12,$FF,$00
        db $D3,$00,$04,$BC,$15,$0D,$BC,$18
        db $0B,$C9,$21,$0A,$BC,$29,$0B,$BC
        db $2F,$0D,$BC,$33,$0A,$BC,$36,$0F
        db $BC,$42,$11,$BC,$42,$13,$BC,$42
        db $15,$BC,$53,$10,$BC,$53,$12,$BE
        db $63,$0F,$BE,$65,$0F,$BE,$67,$0F
        db $BC,$6E,$0C,$BC,$71,$0B,$FF,$00
        db $D3,$00,$01,$BE,$19,$11,$BE,$1B
        db $11,$BE,$1D,$11,$BC,$1F,$0E,$C8
        db $29,$0F,$CB,$2D,$10,$CB,$30,$10
        db $BC,$37,$0E,$CA,$3B,$0A,$CA,$3F
        db $0A,$C8,$3C,$10,$C8,$40,$10,$AE
        db $4B,$0C,$B1,$4D,$11,$AC,$54,$10
        db $BE,$66,$0C,$BE,$68,$0C,$BE,$6A
        db $0C,$AC,$6B,$11,$FF,$00,$D3,$00
        db $05,$B1,$14,$0B,$AA,$15,$0F,$AA
        db $14,$11,$B1,$1B,$0D,$AE,$26,$0A
        db $9D,$29,$0D,$9D,$2C,$0D,$9D,$2F
        db $0D,$B1,$39,$11,$AC,$3F,$11,$B2
        db $3D,$0E,$BE,$3A,$0B,$B2,$4A,$0E
        db $B1,$49,$0A,$B2,$55,$0C,$AC,$57
        db $0E,$B1,$52,$11,$9D,$58,$11,$B1
        db $6B,$0B,$AC,$6A,$0D,$B1,$68,$10
        db $9D,$62,$11,$AA,$77,$13,$FF,$00
        db $D3,$00,$06,$AA,$13,$0F,$AA,$11
        db $11,$AE,$18,$0F,$AE,$2E,$0D,$AE
        db $34,$0F,$AB,$3B,$0A,$B1,$42,$12
        db $9D,$49,$14,$9D,$53,$15,$B2,$55
        db $15,$9D,$57,$15,$AC,$5D,$12,$B1
        db $6A,$06,$FF,$00,$D3,$00,$0C,$9D
        db $17,$07,$9D,$1E,$07,$AE,$14,$08
        db $AA,$15,$0A,$AE,$2E,$08,$AA,$30
        db $0D,$9D,$33,$08,$AA,$3F,$0E,$9D
        db $43,$0B,$BE,$55,$0D,$BE,$5B,$0D
        db $AE,$5A,$0A,$BE,$69,$0A,$AE,$75
        db $0B,$BE,$85,$0D,$BE,$8B,$09,$AA
        db $8A,$0D,$AA,$90,$09,$AE,$96,$0A
        db $AE,$A0,$08,$AE,$AA,$0B,$AE,$BD
        db $0D,$AE,$C1,$0A,$AE,$C4,$07,$AA
        db $DB,$0D,$FF,$01,$D3,$00,$0D,$B1
        db $0B,$15,$AD,$0E,$17,$B1,$11,$16
        db $AD,$14,$19,$B1,$18,$18,$AD,$22
        db $17,$B1,$26,$16,$AD,$2E,$17,$B1
        db $31,$16,$B1,$3A,$13,$AD,$43,$14
        db $B1,$45,$15,$B1,$4C,$16,$AD,$51
        db $16,$B1,$53,$17,$B1,$64,$16,$B1
        db $64,$17,$AD,$68,$11,$B1,$6A,$12
        db $B1,$74,$18,$AD,$7C,$17,$B1,$7F
        db $16,$AD,$84,$12,$B1,$87,$11,$AD
        db $8F,$19,$B1,$92,$18,$AD,$96,$14
        db $B1,$99,$13,$AD,$A3,$16,$B1,$A6
        db $15,$AA,$BE,$17,$FF,$01,$D3,$00
        db $0E,$BE,$0D,$13,$C2,$08,$14,$C6
        db $15,$12,$C6,$19,$12,$C2,$1C,$14
        db $BE,$20,$13,$CF,$22,$12,$BE,$2A
        db $12,$CD,$2F,$12,$C2,$42,$15,$C2
        db $47,$13,$BE,$4C,$12,$BE,$52,$11
        db $BE,$57,$13,$BE,$5C,$12,$CD,$5F
        db $12,$C3,$73,$13,$BE,$78,$12,$CE
        db $7F,$15,$C2,$80,$14,$C2,$81,$13
        db $C2,$82,$12,$CD,$8F,$12,$50,$95
        db $13,$50,$97,$11,$FF,$01,$D3,$00
        db $14,$C2,$0D,$16,$C6,$15,$10,$C4
        db $1A,$16,$C4,$1B,$16,$C4,$1C,$16
        db $C7,$21,$11,$CF,$23,$16,$C2,$2B
        db $16,$C2,$2C,$15,$C7,$34,$10,$AD
        db $35,$17,$AD,$3D,$17,$AD,$41,$17
        db $AD,$49,$17,$AD,$4D,$17,$C7,$53
        db $11,$C6,$58,$11,$C7,$5A,$11,$C4
        db $61,$16,$C4,$67,$16,$C5,$68,$16
        db $CF,$6D,$16,$C4,$73,$16,$C2,$76
        db $15,$C2,$79,$13,$AD,$7D,$13,$FF
        db $01,$D3,$00,$13,$C2,$15,$16,$C4
        db $17,$15,$CF,$1A,$16,$C2,$20,$16
        db $CE,$23,$15,$C4,$26,$16,$C2,$2A
        db $16,$C4,$2D,$15,$AC,$34,$17,$AD
        db $39,$17,$CF,$3B,$16,$C2,$41,$16
        db $AD,$44,$15,$C2,$4E,$16,$AD,$51
        db $15,$C2,$59,$18,$C2,$5B,$16,$AD
        db $5E,$15,$CF,$60,$16,$C2,$66,$16
        db $AD,$6B,$15,$C2,$76,$16,$AD,$7B
        db $15,$C5,$7F,$16,$CF,$80,$16,$C2
        db $86,$16,$AD,$8B,$15,$CF,$8F,$16
        db $CE,$96,$16,$AD,$98,$15,$C5,$9A
        db $14,$CF,$9B,$16,$C2,$A9,$18,$C3
        db $B1,$14,$AD,$B5,$13,$C4,$B7,$12
        db $C5,$B8,$12,$C5,$B9,$15,$FF,$01
        db $0E,$0D,$08,$FF,$01,$0E,$0D,$06
        db $FF,$01,$0E,$0D,$08,$FF,$01,$0E
        db $0D,$08,$FF,$01,$0E,$0D,$07,$FF
        db $01,$0E,$0D,$07,$FF,$01,$D3,$00
        db $11,$B8,$01,$03,$AA,$3E,$0B,$FF
        db $01,$82,$03,$17,$82,$0C,$17,$BA
        db $0F,$11,$FF,$01,$4C,$0C,$47,$FF
        db $01,$4B,$0C,$17,$FF,$01,$4C,$0C
        db $27,$FF,$01,$82,$0C,$17,$D6,$0D
        db $09,$BA,$0E,$17,$FF,$01,$D3,$00
        db $50,$2D,$04,$19,$6D,$19,$10,$6D
        db $1D,$10,$3E,$10,$18,$6C,$39,$11
        db $3E,$31,$18,$74,$43,$11,$74,$45
        db $11,$3E,$4C,$18,$92,$55,$11,$92
        db $59,$12,$6D,$63,$10,$27,$72,$13
        db $FF,$01,$41,$38,$15,$FF,$FF,$FF
        db $FF
