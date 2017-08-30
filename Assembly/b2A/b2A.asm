; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $2A8000
    fillbyte $FF : fill   $8000
	
ORG $2A8000
CODE_2A8000:        LDA.w $100B                 
                    CMP.b #$04                  
                    BCC   CODE_2A8018           
                    PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    INC.w $034A                 
                    LDA.w $034B                 
                    ASL   A                     
                    TAX                         
                    JSR.w (PNTR_2A8019,x)             
                    PLX                         
                    PLB                         
CODE_2A8018:        RTL                         

PNTR_2A8019:        dw CODE_2A801D
                    dw CODE_2A8083

CODE_2A801D:        LDA.w $034A
                    AND.b #$07
                    BNE   CODE_2A804E
                    REP   #$20                  
                    LDA.w $034A                 
                    AND.w #$0018                
                    ASL   A                     
                    STA.b $00                   
                    LDA.w $1006                 
                    AND.w #$000F                
                    ASL   A                     
                    ORA.b $00                   
                    TAX                         
                    LDA.w DATA_2A80C5,x               
                    STA.b $00                   
                    INC   A                     
                    STA.b $04                   
                    LDA.w DATA_2A80CD,x               
                    STA.b $02                   
                    INC   A                     
                    STA.b $06                   
                    JSR.w CODE_2A817E           
                    SEP   #$20                  
CODE_2A804E:        LDA.w $034A                 
                    CMP.b #$18                  
                    BNE   CODE_2A8082           
                    REP   #$20                  
                    LDA.w $1006                 
                    AND.w #$000F                
                    ASL   A                     
                    TAX                         
                    LDA.w DATA_2A82B2,x               
                    STA.b $0A                   
                    LDA.w #$00FC                
                    STA.b $00                   
                    STA.b $04                   
                    LDA.w #$00FC                
                    STA.b $02                   
                    STA.b $06                   
                    LDA.w DATA_2A8105,x               
                    STA.b $08                   
                    JSR.w CODE_2A8287           
                    SEP   #$20                  
                    STZ.w $034A                 
                    INC.w $034B                 
CODE_2A8082:        RTS                         

CODE_2A8083:        LDA.w $034A                 
                    AND.b #$07                  
                    BNE   CODE_2A80C4           
                    LDA.w $034A                 
                    AND.b #$18                  
                    ASL   A                     
                    STA.b $00                   
                    LDA.w $1006                 
                    ASL   A                     
                    ADC.b $00                   
                    TAY                         
                    LDA.w $034A                 
                    AND.b #$60                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w DATA_2A82B2,x               
                    STA.b $0A                   
                    LDA   DATA_2A80C5,y               
                    STA.b $00                   
                    INC   A                     
                    STA.b $04                   
                    LDA   DATA_2A80CD,y               
                    STA.b $02                   
                    INC   A                     
                    STA.b $06                   
                    LDA.w DATA_2A8105,x               
                    STA.b $08                   
                    JSR.w CODE_2A8287           
                    SEP   #$20                  
CODE_2A80C4:        RTS                         

DATA_2A80C5:        dw $00FC
                    dw $00FC
                    dw $00FC
                    dw $00FC

DATA_2A80CD:        dw $00FC
                    dw $00FC
                    dw $00FC
                    dw $00FC
                    dw $0997
                    dw $0599
                    dw $0997
                    dw $09A3
                    dw $4997
                    dw $4599
                    dw $4997
                    dw $49A3
                    dw $099A
                    dw $059C
                    dw $099A
                    dw $099E
                    dw $499A
                    dw $459C
                    dw $499A
                    dw $499E
                    dw $09A5
                    dw $05A7
                    dw $09A5
                    dw $09A9
                    dw $49A5
                    dw $45A7
                    dw $49A5
                    dw $49A9

DATA_2A8105:        dw $0006
                    dw $0005
                    dw $0006
                    dw $0007

CODE_2A810D:        PHB
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$00FC                
                    STA.b $00                   
                    STA.b $04                   
                    LDA.w #$00FC                
                    STA.b $02                   
                    STA.b $06                   
                    JSR.w CODE_2A817E           
                    LDA.w $1006                 
                    AND.w #$000F                
                    ASL   A                     
                    TAX                         
                    LDA.w DATA_2A8156,x               
                    STA.b $00                   
                    LDY.b #$00                  
CODE_2A8139:        LDA   DATA_2A82BA,y               
                    STA.w $2116                 
                    LDA.b $00                   
                    STA.w $2118                 
                    INY                         
                    INY                         
                    CPY.b #$30                  
                    BNE   CODE_2A8139           
                    SEP   #$20                  
                    PLY                         
                    PLX                         
                    PLB                         
                    STZ.w $034A                 
                    STZ.w $034B                 
                    RTL                         

DATA_2A8156:        dw $09AB,$09AC,$09AB,$09AD

DATA_2A815E:        dw $BBF2

DATA_2A8160:        dw $BBFC,$BBE6,$BBFC,$BBF2
                    dw $BBFC,$BBE6,$BBF2

DATA_2A816E:        dw $0005,$0006,$0005,$0006
     
DATA_2A8176:        dw $0007,$0007,$0007,$0005

CODE_2A817E:        LDA.w $1006                 
                    AND.w #$000F                  
                    ASL   A
                    TAY                         
                    ASL   A                     
                    TAX                         
                    LDA.w DATA_2A815E,x               
                    STA.b $0A                   
                    LDA   DATA_2A816E,y               
                    STA.b $08                   
                    PHY                         
                    JSR.w CODE_2A8287           
                    PLY                         
                    LDA.w DATA_2A8160,x               
                    STA.b $0A                   
                    LDA   DATA_2A8176,y               
                    STA.b $08                   
                    JSR.w CODE_2A8287           
                    RTS                         

CODE_2A81A5:        PHB                         
                    PHK                         
                    PLB                         
                    STZ.w $2115                 
                    REP   #$20                  
                    LDA.w #$00FC                
                    STA.b $00                   
                    LDA.w #$1000                
                    STA.w $2116                 
                    LDA.w #$1808                
                    STA.w $4300                 
                    LDA.w #$0000                
                    STA.w $4302                 
                    STZ.w $4304                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    LDY.b #$01                  
                    STY.w $420B                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    STA.w $4305                 
                    LDA.w #$1000                
                    STA.w $2116                 
                    LDA.w #$1908                
                    STA.w $4300                 
                    LDA.w #$0001                
                    STA.w $4302                 
                    STY.w $420B                 
                    LDA.w DATA_2A82B2                 
                    STA.b $0A                   
                    LDA.w #$09A5                
                    STA.b $00                   
                    INC   A                     
                    STA.b $04                   
                    LDA.w #$49A5                
                    STA.b $02                   
                    INC   A                     
                    STA.b $06                   
                    LDA.w #$0006                
                    STA.b $08                   
                    JSR.w CODE_2A8287           
                    LDA.w DATA_2A82B4                 
                    STA.b $0A                   
                    LDA.w #$05A7                
                    STA.b $00                   
                    INC   A                     
                    STA.b $04                   
                    LDA.w #$45A7                
                    STA.b $02                   
                    INC   A                     
                    STA.b $06                   
                    LDA.w #$0005                
                    STA.b $08                   
                    JSR.w CODE_2A8287           
                    LDA.w DATA_2A82B8                 
                    STA.b $0A                   
                    LDA.w #$09A9                
                    STA.b $00                   
                    INC   A                     
                    STA.b $04                   
                    LDA.w #$49A9                
                    STA.b $02                   
                    INC   A                     
                    STA.b $06                   
                    LDA.w #$0007                
                    STA.b $08                   
                    JSR.w CODE_2A8287           
                    LDA.w #$09AE                
                    STA.b $02                   
                    LDA.w #$09AF                
                    STA.b $04                   
                    LDY.b #$00                  
CODE_2A8252:        LDA.w #$09AB                
                    STA.b $00                   
CODE_2A8257:        LDA   DATA_2A82BA,y               
                    STA.w $2116                 
                    LDA.b $00                   
                    STA.w $2118                 
                    LDA.b $02                   
                    STA.w $2118                 
                    LDA.b $04                   
                    STA.w $2118                 
                    INY                         
                    INY                         
                    CPY.b #$30                  
                    BEQ   CODE_2A8283           
                    TYA                         
                    AND.w #$0002                
                    BNE   CODE_2A8257           
                    INC.b $00                   
                    LDA.b $00                   
                    CMP.w #$09AE                
                    BNE   CODE_2A8257           
                    BRA   CODE_2A8252           

CODE_2A8283:        SEP   #$20                  
                    PLB                         
                    RTL                         

CODE_2A8287:        LDY.b #$00                  
CODE_2A8289:        LDA.b ($0A),y               
                    STA.w $2116                 
                    LDA.b $00                   
                    STA.w $2118                 
                    LDA.b $02                   
                    STA.w $2118                 
                    LDA.b ($0A),y               
                    CLC                         
                    ADC.w #$0020              
                    STA.w $2116
                    LDA.b $04                   
                    STA.w $2118                 
                    LDA.b $06                   
                    STA.w $2118                 
                    INY                         
                    INY                         
                    DEC.b $08                   
                    BNE   CODE_2A8289           
                    RTS                         

DATA_2A82B2:        dw $BBE6

DATA_2A82B4:        dw $BBF2,$BBE6

DATA_2A82B8:        dw $BBFC

DATA_2A82BA:        dw $1076,$1283,$122B,$1294
                    dw $1146,$1177,$1476,$1683
                    dw $162B,$1694,$1546,$1577
                    dw $1876,$1A83,$1A2B,$1A94
                    dw $1946,$1977,$1C76,$1E83
                    dw $1E2B,$1E94,$1D46,$1D77
     
CODE_2A82EA:        LDA.b #$80                  
                    STA.w $2115                 
                    REP   #$20                  
                    LDA.w #$6800                
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$F000                
                    STA.w $4302                 
                    LDX.b #$37                  
                    STX.w $4304                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    SEP   #$20                  
                    LDA.b #$0F                  
                    STA.b $16                   
                    LDA.w $0726                 
                    STA.w $1A80                 
                    LDA.w $1D                 
                    AND.b #$02                  
                    BEQ   CODE_2A832F           
                    LDX.b $B3                   
                    CPX.b #$BC                  
                    BEQ   CODE_2A832F           
                    STA.w $1A80                 
CODE_2A832F:        JSL.l CODE_22E0A9           
                    JSL.l CODE_27E173           
                    RTL                         

CODE_2A8338:        LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
CODE_2A833F:        LDY.w $0700                 
                    LDA.b #$BA                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    INY                         
                    LDA.b #$BB                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEC.b $02                   
                    BNE   CODE_2A833F           
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDY.w $0700                 
                    LDA.b #$02                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    INY                         
                    LDA.b $D9                   
                    SEC                         
                    SBC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$03                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    RTL                         

CODE_2A838C:        LDY.w $0700                 
                    LDA.b #$E2                  
                    STA.b [$2E],y               
                    RTL                         

CODE_2A8394:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.w $0700                 
                    STA.b $03                   
                    LDX.b #$00                  
CODE_2A83AE:        LDY.b $03                   
                    LDA.w DATA_2A83DB,x               
                    CMP.b #$80                  
                    BEQ   CODE_2A83C5           
                    CMP.b #$FF                  
                    BEQ   CODE_2A83D9           
                    STA.b [$2E],y               
                    AND.b #$F0                  
                    BNE   CODE_2A83C5           
                    LDA.b #$01                  
                    STA.b [$D8],y               
CODE_2A83C5:        INX                         
                    INC.b $03                   
                    LDA.b $03                   
                    AND.b #$07                  
                    BNE   CODE_2A83AE           
                    LDA.b $03                   
                    AND.b #$F0                  
                    CLC                         
                    ADC.b #$10                  
                    STA.b $03                   
                    BRA   CODE_2A83AE           

CODE_2A83D9:        PLB                         
                    RTL                         

DATA_2A83DB:        db $80,$80,$80,$90,$91,$80,$80,$80
                    db $80,$80,$80,$94,$92,$91,$80,$80
                    db $80,$80,$80,$94,$03,$95,$80,$80
                    db $80,$80,$90,$93,$03,$95,$80,$80
                    db $80,$90,$93,$98,$03,$95,$80,$80
                    db $90,$93,$98,$92,$93,$92,$91,$80
                    db $94,$92,$02,$03,$98,$03,$92,$91
                    db $94,$03,$98,$03,$92,$93,$03,$95
                    db $FF

CODE_2A841C:        RTL                         

                    PHB                         
                    LDA.b #$7F                  
                    PHA                         
                    PLB                         
                    LDA.l $0249               
                    AND.b #$FE                  
                    TAX                         
                    LDY.b #$00                  
                    REP   #$20                  
                    LDA.w #$001F                
                    STA.b $00                   
                    LDA.l $0212               
                    STA.b $02                   
CODE_2A8438:        LDA.l $2ABC0A,x             
                    CLC                         
                    ADC.b $02                   
                    STA.w $9200,y               
                    STA.w $9240,y               
                    STA.w $9280,y               
                    STA.w $92C0,y               
                    STA.w $9300,y               
                    STA.w $9340,y               
                    STA.w $9380,y               
                    STA.w $93C0,y               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    DEC.b $00                   
                    BPL   CODE_2A8438           
                    SEP   #$20                  
                    PLB                         
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_2A846E           
                    INC.w $0249                 
                    INC.w $0249                 
CODE_2A846E:        LDA.w $0293                 
                    ORA.b #$80                  
                    STA.w $0293                 
                    RTL                         

DATA_2A8477:        db $55,$56,$56,$56,$56,$57

DATA_2A847D:        db $5B,$5C,$5C,$5C,$5C,$5D
             
CODE_2A8483:        PHB
                    PHK
                    PLB                         
                    LDX.b #$00                  
                    LDY.w $0700                 
                    LDA.b $30                   
                    STA.b $DA                   
CODE_2A848F:        REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.w DATA_2A8477,x               
                    STA.b [$2E],y               
                    LDA.w DATA_2A847D,x               
                    STA.b [$D8],y               
                    JSL.l CODE_23BEBB           
                    INX                         
                    CPX.b #$06                  
                    BNE   CODE_2A848F           
                    PLB                         
                    RTL                         

CODE_2A84B0:        LDA.w $0350                 
                    BEQ   CODE_2A84EA           
                    STZ.w $0249                 
                    LDA.b #$B0                  
                    STA.w $024B                 
                    LDA.b #$1A                  
                    STA.w $0612                 
                    STZ.b $D8                   
                    STZ.b $D9                   
CODE_2A84C6:        JSR.w CODE_2A8518           
                    INC.w $0249                 
                    LDA.w $0249                 
                    AND.b #$01                  
                    BNE   CODE_2A84E3           
                    LDA.w $024B                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $024B                 
                    AND.b #$F0                  
                    BNE   CODE_2A84E3           
                    INC.w $024B                 
CODE_2A84E3:        DEC.w $0612                 
                    BNE   CODE_2A84C6           
                    BRA   CODE_2A8513           

CODE_2A84EA:        REP   #$20                  
                    LDX.b #$00                  
                    LDA.w #$00FF                
CODE_2A84F1:        STA.l $7F2000,x             
                    STA.l $7F2100,x             
                    STA.l $7F2200,x             
                    STA.l $7F2300,x             
                    STA.l $7F2400,x             
                    STA.l $7F2500,x             
                    STA.l $7F2600,x             
                    DEX                         
                    DEX                         
                    BNE   CODE_2A84F1           
                    SEP   #$20                  
CODE_2A8513:        STZ.b $D8                   
                    STZ.b $D9                   
                    RTL                         

CODE_2A8518:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0249                 
                    AND.b #$01                  
                    STA.b $C2                   
                    LDA.w $0350                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0350                 
                    TAY                         
                    LDA.w $B545,y               
                    STA.b $08                   
                    REP   #$20                  
                    LDA.w $B543,y               
                    STA.b $06                   
                    SEP   #$20                  
                    LDA.b #$7F                  
                    STA.b $0F                   
                    REP   #$20                  
                    STZ.b $0D                   
                    LDA.w #$0010                
                    STA.b $00                   
                    LDA.w $024B                 
                    AND.w #$00F0                
                    STA.b $09                   
                    REP   #$10                  
                    LDA.w $024B                 
                    AND.w #$0001                
                    BEQ   CODE_2A8560           
                    LDA.b $0D                   
                    CLC                         
                    ADC.w #$0100                
                    STA.b $0D                   
CODE_2A8560:        LDX.b $D8                   
                    LDY.b $09                   
                    LDA.b [$0D],y               
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $C2                   
                    AND.w #$00FF                
                    BEQ   CODE_2A8576           
                    INY                         
                    INY                         
CODE_2A8576:        LDA.b [$06],y               
                    STA.l $7F2000,x             
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.b [$06],y               
                    STA.l $7F2002,x             
                    INC.b $09                   
                    INC.b $D8                   
                    INC.b $D8                   
                    INC.b $D8                   
                    INC.b $D8                   
                    DEC.b $00                   
                    BNE   CODE_2A8560           
                    SEP   #$30                  
                    PLB                         
                    RTS                         

                    PHB                         
                    PHK                         
                    PLB                         
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    LDA.w #$0010                
                    STA.b $DB                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDY.w $0700                 
                    LDA.w DATA_2A85CB,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    JSR.w CODE_2A86F5           
                    INX                         
                    LDA.w DATA_2A85CB,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    PLB                         
                    RTL                         

DATA_2A85CB:        db $02,$03,$04,$05

CODE_2A85CF:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b [$2B]                 
                    TAX                         
                    REP   #$20                  
                    INC.b $2B                   
                    LDA.b $2E                   
                    STA.b $D8                   
                    LDA.w #$0001                
                    STA.b $DB                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $03                   
                    LDY.w $0700                 
                    TXA                         
                    BEQ   CODE_2A8648           
                    CPX.b #$04                  
                    BNE   CODE_2A8615           
                    REP   #$20                  
                    DEC.b $D8                   
                    DEC.b $D8                   
                    SEP   #$20                  
                    LDA.b #$48                  
                    STA.b [$D8],y               
                    REP   #$20                  
                    INC.b $D8                   
                    SEP   #$20                  
                    LDA.b #$48                  
                    STA.b [$D8],y               
                    REP   #$20                  
                    INC.b $D8                   
                    SEP   #$20                  
CODE_2A8615:        LDA.w $8667,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    JSR.w CODE_2A86F5           
                    DEC.b $03                   
                    LDA.b #$02                  
                    STA.b $02                   
                    JSR.w CODE_2A8655           
                    LDA.w $866D,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    JSR.w CODE_2A86F5           
                    CPX.b #$04                  
                    BNE   CODE_2A8653           
                    LDA.b #$48                  
                    STA.b [$D8],y               
                    REP   #$20                  
                    INC.b $D8                   
                    SEP   #$20                  
                    LDA.b #$48                  
                    STA.b [$D8],y               
                    BRA   CODE_2A8653           

CODE_2A8648:        LDA.b #$10                  
                    STA.b $DB                   
                    LDA.b #$07                  
                    STA.b $02                   
                    JSR.w CODE_2A8655           
CODE_2A8653:        PLB                         
                    RTL                         

CODE_2A8655:        LDA.b $03                   
                    BEQ   CODE_2A8667           
                    LDA.b $02                   
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    JSR.w CODE_2A86F5           
                    DEC.b $03                   
                    BRA   CODE_2A8655           

CODE_2A8667:        RTS                         

                    db $03,$03,$06,$08,$0B,$08,$04,$05
                    db $04,$09,$09,$0A
             

CODE_2A8674:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b [$2B]                 
                    STA.b $03                   
                    STA.b $DD                   
                    REP   #$20                  
                    INC.b $2B                   
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDA.w $86D5,x               
                    STA.b $DB                   
                    STZ.b $DC                   
                    STZ.b $02                   
                    TXA                         
                    BNE   CODE_2A86A7           
                    LDA.b [$2B]                 
                    STA.b $02                   
                    REP   #$20                  
                    INC.b $2B                   
                    SEP   #$20                  
CODE_2A86A7:        LDY.w $0700                 
CODE_2A86AA:        LDA.w $86E5,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    JSR.w CODE_2A86F5           
                    DEC.b $03                   
                    BNE   CODE_2A86AA           
                    LDA.b $02                   
                    BEQ   CODE_2A86D3           
                    DEC.b $02                   
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $DD                   
                    STA.b $03                   
                    BRA   CODE_2A86AA           

CODE_2A86D3:        PLB                         
                    RTL                         

                    db $01,$0F,$01,$11,$10,$10,$11,$01
                    db $0F,$0F,$11,$11,$0F,$01,$01,$01
                    db $13,$14,$15,$16,$17,$18,$19,$1A
                    db $1B,$1C,$1D,$1E,$1F,$20,$21,$22
   
CODE_2A86F5:        REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$2000                
                    CLC                         
                    ADC.b $DB                   
                    STA.b $D8                   
                    SEP   #$20                  
                    RTS                         

CODE_2A8705:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b $00                   
                    PHA                         
                    LDA.b $01                   
                    PHA                         
                    PHX                         
                    LDA.b $30                   
                    STA.b $DA                   
                    STA.b $DD                   
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$2000                
                    STA.b $DB                   
                    SEP   #$20                  
                    LDX.b #$00                  
CODE_2A8725:        JSR.w CODE_2A8761           
                    LDA.b [$D8],y               
                    CMP.b #$9C                  
                    BEQ   CODE_2A8755           
                    CMP.b #$E4                  
                    BEQ   CODE_2A8755           
                    LDA.w $875E,x               
                    STA.b [$D8],y               
                    CPX.b #$02                  
                    BEQ   CODE_2A873E           
                    INX                         
                    BRA   CODE_2A8725           

CODE_2A873E:        JSR.w CODE_2A8761           
                    LDA.b [$D8],y               
                    CMP.b #$9C                  
                    BEQ   CODE_2A8755           
                    CMP.b #$E4                  
                    BEQ   CODE_2A8755           
                    LDA.b #$04                  
                    STA.b [$D8],y               
                    LDA.b #$01                  
                    STA.b [$DB],y               
                    BRA   CODE_2A873E           

CODE_2A8755:        PLX                         
                    PLA                         
                    STA.b $01                   
                    PLA                         
                    STA.b $00                   
                    PLB                         
                    RTL                         

                    ASL.b $07                   
                    PHP                         
CODE_2A8761:        REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    LDA.b $DB                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $DB                   
                    SEP   #$20                  
                    RTS                         

CODE_2A8776:        REP   #$20                  
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    CMP.b #$AB                  
                    BNE   CODE_2A8793           
                    LDA.b #$0B                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8793:        RTL                         

CODE_2A8794:        REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    CMP.b #$9A                  
                    BNE   CODE_2A87B1           
                    LDA.b #$0D                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A87B1:        RTL                         

CODE_2A87B2:        PHY                         
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$000F                
                    STA.b $D8                   
                    TYA                         
                    AND.w #$00FF                
                    BNE   CODE_2A87CF           
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $D8                   
CODE_2A87CF:        SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$AA                  
                    BNE   CODE_2A87E5           
                    LDA.b $D8                   
                    SEC                         
                    SBC.b #$10                  
                    STA.b $D8                   
                    LDA.b #$06                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A87E5:        REP   #$20                  
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8803           
                    REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_2A8803:        LDA.b [$D8],y               
                    CMP.b #$A8                  
                    BNE   CODE_2A881C           
                    REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A881C:        PLY                         
                    RTL                         

CODE_2A881E:        PHY                         
                    REP   #$20                  
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    CMP.b #$A8                  
                    BEQ   CODE_2A8840           
                    CMP.b #$34                  
                    BEQ   CODE_2A8840           
                    LDA.b #$05                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8840:        PLY                         
                    RTL                         

                    ASL.b $0C                   
CODE_2A8844:        PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$AA                  
                    BEQ   CODE_2A886B           
                    CMP.b #$A9                  
                    BEQ   CODE_2A886B           
                    LDA.w $8842,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A886B:        PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

CODE_2A886F:        PHX                         
                    PHY                         
                    LDA.b [$2E],y               
                    CMP.b #$A6                  
                    BNE   CODE_2A88C0           
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    PHA                         
                    CLC                         
                    ADC.w #$0011                
                    STA.b $D8                   
                    PLA                         
                    CLC                         
                    ADC.w #$000F                
                    STA.b $DB                   
                    TYA                         
                    AND.w #$000F                
                    BNE   CODE_2A88A3           
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $D8                   
                    LDA.b $DB                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $DB                   
CODE_2A88A3:        SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$A8                  
                    BNE   CODE_2A88C0           
                    REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b #$05                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    BRA   CODE_2A88E5           

CODE_2A88C0:        REP   #$20                  
                    LDA.b $DB                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$AA                  
                    BEQ   CODE_2A88D2           
                    CMP.b #$BF                  
                    BNE   CODE_2A88E5           
CODE_2A88D2:        REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b #$06                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A88E5:        PLY                         
                    PLX                         
                    RTL                         

CODE_2A88E8:        PHY                         
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b #$0F                  
                    TAY                         
                    AND.b #$F0                  
                    BNE   CODE_2A8900           
                    INC.b $D9                   
CODE_2A8900:        LDA.b [$D8],y               
                    CMP.b #$9A                  
                    BEQ   CODE_2A890E           
                    CMP.b #$99                  
                    BEQ   CODE_2A890E           
                    CMP.b #$E3                  
                    BNE   CODE_2A8927           
CODE_2A890E:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8920           
                    REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_2A8920:        LDA.b #$02                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8927:        PLY                         
                    RTL                         

                    ASL   A                     
                    TSB.b $08                   
CODE_2A892C:        PHB                         
                    PHK                         
                    PLB                         
                    PHY                         
                    PHX                         
                    LDA.b $30                   
                    STA.b $DA                   
                    STA.b $DD                   
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEC                         
                    SBC.w #$000F                
                    STA.b $DB                   
                    TYA                         
                    AND.w #$000F                
                    BNE   CODE_2A8951           
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $D8                   
CODE_2A8951:        LDA.b $D8                   
                    SEC                         
                    SBC.w #$0011                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDX.b #$00                  
                    LDA.b [$D8],y               
                    CMP.b #$9F                  
                    BEQ   CODE_2A8981           
                    CMP.b #$27                  
                    BEQ   CODE_2A8983           
                    CMP.b #$35                  
                    BEQ   CODE_2A8983           
                    CMP.b #$36                  
                    BEQ   CODE_2A8983           
                    CMP.b #$E4                  
                    BEQ   CODE_2A8982           
                    CMP.b #$F8                  
                    BEQ   CODE_2A8982           
                    CMP.b #$9B                  
                    BEQ   CODE_2A8982           
                    CMP.b #$AA                  
                    BEQ   CODE_2A8982           
                    BRA   CODE_2A8997           

CODE_2A8981:        INX                         
CODE_2A8982:        INX                         
CODE_2A8983:        REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.w $8929,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8997:        LDA.b [$DB],y               
                    CMP.b #$A8                  
                    BEQ   CODE_2A89A1           
                    CMP.b #$F6                  
                    BNE   CODE_2A89BC           
CODE_2A89A1:        REP   #$20                  
                    LDA.b $DB                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $DB                   
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.b [$DB],y               
                    LDA.b $DC                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $DC                   
                    LDA.b #$01                  
                    STA.b [$DB],y               
CODE_2A89BC:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BEQ   CODE_2A89CB           
                    CMP.b #$04                  
                    BNE   CODE_2A89D3           
CODE_2A89CB:        JSL.l CODE_2AB73A           
                    LDA.b #$AB                  
                    STA.b [$2E],y               
CODE_2A89D3:        PLX                         
                    PLY                         
                    PLB                         
                    RTL                         

                    ASL   A                     
                    TSB.b $04                   
                    PHP                         
                    ASL   A                     
CODE_2A89DC:        PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    INY                         
                    TYA                         
                    AND.w #$000F                
                    BNE   CODE_2A89FE           
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $D8                   
CODE_2A89FE:        SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$C2                  
                    BNE   CODE_2A8A0E           
                    DEY                         
                    LDA.b #$03                  
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8A0E:        PLY                         
                    PLX                         
                    PHX                         
                    PHY                         
                    LDA.b [$2E],y               
                    CMP.b #$9F                  
                    BEQ   CODE_2A8A50           
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8A31           
                    REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_2A8A31:        DEY                         
                    LDA.b [$D8],y               
                    CMP.b #$26                  
                    BEQ   CODE_2A8A50           
                    CMP.b #$33                  
                    BEQ   CODE_2A8A50           
                    CMP.b #$9A                  
                    BEQ   CODE_2A8A50           
                    CMP.b #$E3                  
                    BEQ   CODE_2A8A50           
                    CMP.b #$0D                  
                    BEQ   CODE_2A8A50           
                    LDA.w $89D7,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8A50:        PLY                         
                    PHY                         
                    LDA.b [$2E],y               
                    CMP.b #$9B                  
                    BEQ   CODE_2A8A5E           
                    CMP.b #$E4                  
                    BEQ   CODE_2A8A5E           
                    CMP.b #$9F                  
CODE_2A8A5E:        BNE   CODE_2A8AA8           
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8A7E           
                    REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_2A8A7E:        LDX.b #$03                  
                    LDA.b [$D8],y               
                    CMP.b #$E3                  
                    BEQ   CODE_2A8A9D           
                    CMP.b #$9A                  
                    BNE   CODE_2A8AA8           
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8A9B           
                    REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_2A8A9B:        BRA   CODE_2A8A9F           

CODE_2A8A9D:        LDX.b #$02                  
CODE_2A8A9F:        DEY                         
                    LDA.w $89D7,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8AA8:        TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8AB9           
                    REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_2A8AB9:        DEY                         
                    LDA.b [$2E],y               
                    CMP.b #$9F                  
                    BNE   CODE_2A8ACE           
                    LDA.b [$D8],y               
                    CMP.b #$86                  
                    BNE   CODE_2A8ACE           
                    LDA.w $89DA                 
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8ACE:        PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

CODE_2A8AD2:        LDA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$01                  
                    STA.b [$D8],y               
                    RTS                         

                    db $09,$02,$02,$07
              
CODE_2A8AE2:        PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    STA.b $DB                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    STA.b $DD                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    AND.b #$F0                  
                    BNE   CODE_2A8B02           
                    INC.b $D9                   
CODE_2A8B02:        LDA.b [$D8],y               
                    CMP.b #$9A                  
                    BEQ   CODE_2A8B18           
                    CMP.b #$A8                  
                    BEQ   CODE_2A8B18           
                    CMP.b #$F6                  
                    BEQ   CODE_2A8B18           
                    LDA.w $8ADE,x               
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
CODE_2A8B18:        PLY                         
                    PHY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8B2B           
                    REP   #$20                  
                    LDA.b $DB                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $DB                   
                    SEP   #$20                  
CODE_2A8B2B:        DEY                         
                    LDA.b [$DB],y               
                    CMP.b #$C2                  
                    BNE   CODE_2A8B47           
                    PLY                         
                    PHY                         
                    LDA.b #$12                  
                    STA.b [$2E],y               
                    REP   #$30                  
                    TYA                         
                    ORA.w #$2000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.b [$2E],y               
                    SEP   #$10                  
CODE_2A8B47:        PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

CODE_2A8B4B:        REP   #$20                  
                    LDA.w #$1000                
                    XBA                         
                    STA.w $1602                 
                    LDA.w #$40BE                
                    XBA                         
                    STA.w $1604                 
                    LDA.w #$30FB                
                    STA.w $1606                 
                    LDA.w #$FFFF                
                    STA.w $1608                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    REP   #$20                  
                    LDA.w #$1300                
                    XBA                         
                    STA.w $1602                 
                    LDA.w #$403E                
                    XBA                         
                    STA.w $1604                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    REP   #$20                  
                    LDA.w #$1060                
                    XBA                         
                    STA.w $1602                 
                    LDA.w #$003F                
                    XBA                         
                    STA.w $1604                 
                    LDX.b #$40                  
                    LDA.w #$04D9                
CODE_2A8B96:        STA.w $1606,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2A8B96           
                    LDA.w #$04E7                
                    STA.w $1624                 
                    LDA.w #$04E8                
                    STA.w $1626                 
                    LDA.w #$FFFF                
                    STA.w $1646                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    REP   #$20                  
                    LDA.w #$12E0                
                    XBA                         
                    STA.w $1602                 
                    LDX.b #$40                  
                    LDA.w #$04E5                
CODE_2A8BC2:        STA.w $1606,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2A8BC2           
                    LDA.w #$04E9                
                    STA.w $1624                 
                    LDA.w #$04EA                
                    STA.w $1626                 
                    LDA.w #$FFFF                
                    STA.w $1646                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    REP   #$20                  
                    LDA.w #$1000                
                    XBA                         
                    STA.w $1602                 
                    LDA.w #$C02E                
                    XBA                         
                    STA.w $1604                 
                    LDA.w #$30FB                
                    STA.w $1606                 
                    LDA.w #$FFFF                
                    STA.w $1608                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    LDA.b #$10                  
                    STA.w $1602                 
                    LDA.b #$1F                  
                    STA.w $1603                 
                    JSR.w CODE_2A8C9A           
                    REP   #$20                  
                    LDA.w #$1061                
                    XBA                         
                    STA.w $1602                 
                    LDA.w #$8029                
                    XBA                         
                    STA.w $1604                 
                    LDA.w #$24D8                
                    STA.w $1606                 
                    LDA.w #$24DB                
                    LDX.b #$24                  
CODE_2A8C29:        STA.w $1608,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2A8C29           
                    LDA.w #$24EB                
                    STA.w $1618                 
                    LDA.w #$24EC                
                    STA.w $161A                 
                    LDA.w #$24ED                
                    STA.w $161C                 
                    LDA.w #$24E4                
                    STA.w $162E                 
                    LDA.w #$FFFF                
                    STA.w $1630                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    REP   #$20                  
                    LDA.w #$107E                
                    XBA                         
                    STA.w $1602                 
                    LDA.w #$24DA                
                    STA.w $1606                 
                    LDA.w #$24E3                
                    LDX.b #$24                  
CODE_2A8C67:        STA.w $1608,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2A8C67           
                    LDA.w #$24EE                
                    STA.w $1618                 
                    LDA.w #$24F0                
                    STA.w $161A                 
                    LDA.w #$24F1                
                    STA.w $161C                 
                    LDA.w #$24E6                
                    STA.w $162E                 
                    SEP   #$20                  
                    JSR.w CODE_2A8C9A           
                    STZ.w $1600                 
                    STZ.w $1601                 
                    LDA.b #$FF                  
                    STA.w $1602                 
                    STA.w $1603                 
                    RTL                         

CODE_2A8C9A:        REP   #$20                  
                    LDA.w #$1602                
                    STA.b $36                   
                    LDX.b #$00                  
                    STX.b $38                   
                    SEP   #$20                  
                    JSL.l CODE_29E8AB           
                    RTS                         

CODE_2A8CAC:        PHB                         
                    LDA.b #$7F                  
                    PHA                         
                    PLB                         
                    REP   #$30                  
                    LDX.w #$01AE                
CODE_2A8CB6:        STZ.w $0000,x               
                    STZ.w $01B0,x               
                    STZ.w $0360,x               
                    STZ.w $0510,x               
                    STZ.w $06C0,x               
                    STZ.w $0870,x               
                    STZ.w $0A20,x               
                    STZ.w $0BD0,x               
                    STZ.w $0D80,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2A8CB6           
                    SEP   #$30                  
                    PLB                         
                    RTS                         

CODE_2A8CD9:        STA.l $7F0000,x             
                    STA.l $7F0360,x             
                    STA.l $7F06C0,x             
                    STA.l $7F0A20,x             
                    STA.l $7F0D80,x             
                    RTS                         

CODE_2A8CEE:        STA.l $7F0010,x             
                    STA.l $7F0370,x             
                    STA.l $7F06D0,x             
                    STA.l $7F0A30,x             
                    STA.l $7F0D90,x             
                    RTS                         

CODE_2A8D03:        PHB                         
                    LDY.b #$7F                  
                    PHY                         
                    PLB                         
                    STA.w $00,x               
                    STA.w $01B0,x               
                    STA.w $0360,x               
                    STA.w $0510,x               
                    STA.w $06C0,x               
                    STA.w $0870,x               
                    STA.w $0A20,x               
                    STA.w $0BD0,x               
                    STA.w $0D80,x               
                    PLB                         
                    RTS                         

CODE_2A8D25:        PHB                         
                    LDY.b #$7F                  
                    PHY                         
                    PLB                         
                    STA.w $0100,x               
                    STA.w $02B0,x               
                    STA.w $0460,x               
                    STA.w $0610,x               
                    STA.w $07C0,x               
                    STA.w $0970,x               
                    STA.w $0B20,x               
                    STA.w $0CD0,x               
                    STA.w $0E80,x               
                    PLB                         
                    RTS                         

PNTR_2A8D47:     dl $2ADC80
                    dl $2ADCE6
                    dl $2ADCFB
                    dl $2ADD3A
                    dl $2ADD43
                    dl $2ADD59
                    dl $2ADD89
                    dl $2ADD9E
                    dl $2ADDB9
                    dl $2ADE3C
                    dl $2ADE70
                    dl $2ADECF
                    dl $2ADEDE
                    dl $2ADEFF
                    dl $2ADF36
                    dl $2ADF96
                    dl $2AE059
                    dl $2AE07D
                    dl $2AE080
                    dl $2AE083
                    dl $2ADE70
                    dl $2AE086
                    dl $2AE092
                    dl $2ADF36
                    dl $2ADEFF
                    dl $2ADD43
                    dl $2AE0A4
                    dl $2AE0C7
                    dl $2AE13C
                    dl $2AE086
                    dl $2AE1D8
                    dl $2AE23E
                    dl $2ADCB0
                    dl $2AE241
                    dl $2ADCE6
                    dl $2ADCFB
                    dl $2ADCD4
                  
CODE_2A8DB6:        PHB
                    PHK                         
                    PLB                         
                    LDA.w $0350                 
                    CMP.b #$17                  
                    BEQ   CODE_2A8DC0           
CODE_2A8DC0:        JSR.w CODE_2A8CAC           
                    STZ.w $0293                 
                    STZ.w $420C                 
                    LDA.w $0350                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0350                 
                    TAX                         
                    LDA.w PNTR_2A8D47-1,x               
                    STA.b $2D                   
                    REP   #$20                  
                    LDA.w PNTR_2A8D47-3,x               
                    STA.b $2B                   
                    SEP   #$20                  
                    LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.w $02C5                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $034F                 
                    REP   #$30                  
                    LDA.b $2B                   
                    CLC                         
                    ADC.w #$0002                
                    STA.b $2B                   
                    LDA.w $0350                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    SEP   #$20                  
                    JMP.w (PNTR_2A8E08,x)             

CODE_2A8E04:        SEP   #$10                  
                    PLB                         
                    RTL                         

PNTR_2A8E08:        dw CODE_2A8E04
                    dw CODE_2A8EBA
                    dw CODE_2A9144
                    dw CODE_2A9342
                    dw CODE_2A948E
                    dw CODE_2A95FA
                    dw CODE_2A98B5
                    dw CODE_2A9AB4
                    dw CODE_2A9BC5
                    dw CODE_2A9C9D
                    dw CODE_2A9F2D
                    dw CODE_2AA0A7
                    dw CODE_2AA181
                    dw CODE_2AA339
                    dw CODE_2AA44A
                    dw CODE_2AA69A
                    dw CODE_2AA948
                    dw CODE_2AAA8F
                    dw CODE_2A8E04
                    dw CODE_2AAC05
                    dw CODE_2AAC05
                    dw CODE_2AA0A7
                    dw CODE_2AACA9
                    dw CODE_2AAE8C
                    dw CODE_2AA69A
                    dw CODE_2AA44A
                    dw CODE_2A95FA
                    dw CODE_2AAF58
                    dw CODE_2AB13F
                    dw CODE_2AA69A
                    dw CODE_2AACA9
                    dw CODE_2AB2B3
                    dw CODE_2AB3A1
                    dw CODE_2A8EBA
                    dw CODE_2AB3FE
                    dw CODE_2A9144
                    dw CODE_2A9342
                    dw CODE_2A8EBA

CODE_2A8E54:        PHA
                    ROL   A
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$07                  
                    STA.b $04                   
                    PLA                         
                    AND.b #$1F                  
                    XBA                         
                    INY                         
                    LDA.b [$2B],y               
                    REP   #$20                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.b [$2B],y               
                    AND.b #$0F                  
                    BEQ   CODE_2A8E88           
                    STA.b $02                   
                    STZ.b $03                   
                    REP   #$20                  
CODE_2A8E7A:        LDA.b $00                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $00                   
                    DEC.b $02                   
                    BNE   CODE_2A8E7A           
                    SEP   #$20                  
CODE_2A8E88:        INY                         
                    LDA.b [$2B],y               
                    AND.b #$0F                  
                    STA.b $D8                   
                    STZ.b $D9                   
                    LDA.b [$2B],y               
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    STZ.b $DA                   
                    STZ.b $DB                   
                    LDA.b $04                   
                    BEQ   CODE_2A8EA6           
                    INY                         
                    LDA.b [$2B],y               
                    STA.b $DA                   
CODE_2A8EA6:        REP   #$20                  
                    LDA.b $04                   
                    AND.w #$00FF                
                    BEQ   CODE_2A8EB1           
                    INC.b $2B                   
CODE_2A8EB1:        INC.b $2B                   
                    INC.b $2B                   
                    INC.b $2B                   
                    SEP   #$20                  
                    RTS                         

CODE_2A8EBA:        SEP   #$10                  
                    LDY.b #$00                  
                    LDX.b #$70                  
CODE_2A8EC0:        LDA.b #$15                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8EC0           
CODE_2A8ECB:        LDA.b #$15                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8ECB           
                    REP   #$10                  
                    LDX.w #$0170                
                    LDA.b #$20                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$23                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$21                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$0F                  
                    JSR.w CODE_2A8CD9           
                    LDX.w #$0324                
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
CODE_2A8F06:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A8F16           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A8F18,x)             
                    BRA   CODE_2A8F06           

CODE_2A8F16:        PLB                         
                    RTL                         

PNTR_2A8F18:        dw CODE_2A8F1E
                    dw CODE_2A8F58
                    dw CODE_2A8F78

CODE_2A8F1E:        REP   #$10
                    LDX.b $00
                    LDA.b #$11                  
                    JSR.w CODE_2A8CD9
                    LDA.b #$16
                    JSR.w CODE_2A8CEE
                    LDA.b $D8
                    BEQ   CODE_2A8F4A           
CODE_2A8F30:        INX                         
                    LDA.b #$19                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$1C                  
                    JSR.w CODE_2A8CEE           
                    INX                         
                    LDA.b #$1A                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$1D                  
                    JSR.w CODE_2A8CEE           
                    DEC.b $D8                   
                    BNE   CODE_2A8F30           
CODE_2A8F4A:        INX                         
                    LDA.b #$12                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$17                  
                    JSR.w CODE_2A8CEE           
                    SEP   #$10                  
                    RTS                         

CODE_2A8F58:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$25                  
                    JSR.w CODE_2A8CD9           
                    LDA.b $D8                   
                    BEQ   CODE_2A8F6F           
CODE_2A8F65:        INX                         
                    LDA.b #$26                  
                    JSR.w CODE_2A8CD9           
                    DEC.b $D8                   
                    BNE   CODE_2A8F65           
CODE_2A8F6F:        INX                         
                    LDA.b #$27                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2A8F78:        LDA.b #$2A                  
                    STA.b $08                   
                    STA.b $0B                   
                    STA.b $0E                   
                    REP   #$30                  
                    LDX.b $D8                   
                    LDA.w PNTR_2A8FF3,x               
                    STA.b $06                   
                    LDA.w PNTR_2A9001,x               
                    STA.b $09                   
                    LDA.w PNTR_2A900F,x               
                    STA.b $0C                   
                    SEP   #$20                  
                    LDA.w DATA_2A8FE5,x               
                    STA.b $0F                   
                    LDX.b $00                   
                    LDY.w #$0000                
                    LDA.b [$0C]                 
                    STA.b $02                   
                    STZ.b $04                   
                    STZ.b $05                   
CODE_2A8FA7:        LDA.b [$06],y               
                    JSR.w CODE_2A8CD9           
                    INY                         
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A8FBD           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
CODE_2A8FBD:        DEC.b $02                   
                    BNE   CODE_2A8FA7           
                    DEC.b $0F                   
                    BEQ   CODE_2A8FE2           
                    PHY                         
                    REP   #$20                  
                    LDA.b $04                   
                    ASL   A                     
                    TAY                         
                    LDA.b $00                   
                    CLC                         
                    ADC.b [$09],y               
                    STA.b $00                   
                    SEP   #$20                  
                    INC.b $04                   
                    LDY.b $04                   
                    LDA.b [$0C],y               
                    STA.b $02                   
                    LDX.b $00                   
                    PLY                         
                    BRA   CODE_2A8FA7           

CODE_2A8FE2:        SEP   #$10                  
                    RTS                         

DATA_2A8FE5:        dw $0005,$0004,$0002,$0002
                    dw $0005,$0005,$0006

PNTR_2A8FF3:        dw $901D,$9047,$9064,$906A
                    dw $9072,$909D,$90CB

PNTR_2A9001:        dw $90FB,$9103,$9109,$910B
                    dw $910D,$9115,$911D

PNTR_2A900F:        dw $9127,$912C,$9130,$9132
                    dw $9134,$9139,$913E
        
                    db $0E,$0F,$0F,$10,$13,$14,$15,$15
                    db $0F,$10,$0E,$15,$15,$15,$15,$15
                    db $14,$10,$0E,$20,$21,$15,$15,$15
                    db $15,$15,$15,$15,$1B,$0E,$15,$15
                    db $15,$15,$15,$15,$15,$15,$15,$15
                    db $15,$10

                    db $0E,$0F,$10,$0E,$15,$15,$18,$22
                    db $23,$23,$23,$23,$21,$15,$15,$15
                    db $14,$10,$13,$15,$15,$15,$15,$15
                    db $15,$15,$15,$15,$18

                    db $01,$02,$03,$0D,$07,$0A

                    db $01,$02,$02,$03,$0D,$07,$06,$0A

                    db $00,$00,$01,$03,$01,$02,$04,$04
                    db $03,$01,$28,$28,$03,$01,$02,$02
                    db $04,$04,$04,$09,$07,$06,$07,$06
                    db $08,$03,$0D,$07,$08,$09,$07,$06
                    db $06,$0B,$00,$00,$0C,$07,$0A,$0C
                    db $07,$06,$0B

                    db $01,$02,$03,$01,$02,$04,$04
                    db $04,$02,$28,$03,$03,$00,$01,$04
                    db $04,$04,$04,$04,$04,$04,$04,$02
                    db $03,$04,$05,$06,$07,$07,$06,$08
                    db $09,$07,$07,$06,$07,$0A,$06,$06
                    db $0B,$00,$00,$0C,$07,$06,$0B

                    db $01
                    db $02,$28,$02,$03,$01,$02,$04,$04
                    db $04,$04,$04,$02,$01,$02,$02,$04
                    db $04,$04,$04,$04,$04,$04,$04,$01
                    db $04,$04,$04,$04,$04,$04,$04,$07
                    db $07,$06,$07,$0D,$06,$07,$24,$07
                    db $06,$07,$06,$0B,$0C,$06,$0B

                    db $10
                    db $00,$0F,$00,$0D,$00,$0F,$00

                    db $0F
                    db $00,$0A,$00,$10,$00

                    db $10,$00

                    db $10,$00

                    db $10,$00,$0D,$00,$10,$00,$11
                    db $00

                    db $0E,$00,$0D,$00,$10,$00,$10
                    db $00

                    db $0E,$00,$0D,$00,$0F,$00,$10
                    db $00,$12,$00

                    db $04,$06,$08,$0B,$0D

                    db $03,$04,$0B,$0B

                    db $03,$03

                    db $04,$04

                    db $04,$09,$0D,$0D,$04

                    db $03,$08,$0D,$0D,$09

                    db $05,$08,$0B,$0C,$09,$03

CODE_2A9144:        SEP   #$10                  
                    STZ.w $02D9                 
                    LDA.w $0350                 
                    CMP.b #$23                  
                    BNE   CODE_2A9155           
                    LDA.b #$01                  
                    STA.w $02D9                 
CODE_2A9155:        LDX.b #$A0                  
                    LDA.b #$40                  
                    STA.b $00                   
                    LDA.b #$06                  
CODE_2A915D:        JSR.w CODE_2A8D03           
                    INX                         
                    DEC.b $00                   
                    BNE   CODE_2A915D           
                    LDA.b #$0C                  
                    STA.b $02                   
                    LDA.b #$0D                  
                    STA.b $03                   
                    LDA.b #$02                  
                    STA.b $01                   
CODE_2A9171:        LDA.b #$08                  
                    STA.b $00                   
CODE_2A9175:        LDA.b $02                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    DEC.b $00                   
                    BNE   CODE_2A9175           
                    INC.b $02                   
                    INC.b $02                   
                    INC.b $03                   
                    INC.b $03                   
                    DEC.b $01                   
                    BNE   CODE_2A9171           
                    LDA.b #$04                  
                    STA.b $01                   
CODE_2A9195:        LDA.b #$08                  
                    STA.b $00                   
CODE_2A9199:        LDA.b #$10                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$10                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    DEC.b $00                   
                    BNE   CODE_2A9199           
                    DEC.b $01                   
                    BNE   CODE_2A9195           
CODE_2A91AD:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A91BD           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A91BF,x)             
                    BRA   CODE_2A91AD           

CODE_2A91BD:        PLB                         
                    RTL                         

PNTR_2A91BF:        dw CODE_2A91C3
                    dw CODE_2A9221

CODE_2A91C3:        LDA.w $0350                 
                    CMP.b #$23                  
                    BEQ   CODE_2A9216           
                    REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$08                  
                    STA.b $02                   
                    STZ.b $03                   
                    LDA.b #$11                  
                    STA.b $04                   
CODE_2A91D8:        LDY.b $D8                   
CODE_2A91DA:        LDA.b $04                   
                    JSR.w CODE_2A8CD9           
                    INC.b $04                   
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A91F1           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
CODE_2A91F1:        DEY                         
                    BNE   CODE_2A91DA           
                    LDY.b $02                   
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC   DATA_2A9217,y               
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    DEC.b $02                   
                    DEC.b $02                   
                    BPL   CODE_2A91D8           
                    LDA.b #$17                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$18                  
                    INX                         
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
CODE_2A9216:        RTS                         

DATA_2A9217:        dw $0010,$000F,$0010,$0010
                    dw $0010
           
CODE_2A9221:        LDA.b #$2A                  
                    STA.b $08                   
                    STA.b $0B                   
                    STA.b $0E                   
                    REP   #$30                  
                    LDX.b $D8                   
                    LDA.w PNTR_2A925C,x               
                    STA.b $06                   
                    LDA.w PNTR_2A9266,x               
                    STA.b $09                   
                    LDA.w PNTR_2A9270,x               
                    STA.b $0C                   
                    STZ.b $04                   
                    SEP   #$20                  
                    LDA.w DATA_2A9252,x               
                    STA.b $0F                   
                    LDX.b $00                   
                    LDY.w #$0000                
                    LDA.b [$0C]                 
                    STA.b $02                   
                    JSR.w CODE_2A8FA7           
                    RTS                         

DATA_2A9252:        db $05,$00,$06,$00,$05,$00,$06,$00
                    db $04,$00

PNTR_2A925C:                   dw DATA_2A927A
                                  dw DATA_2A929A
       dw DATA_2A92B9
       dw DATA_2A92DC
       dw DATA_2A92EB
     
PNTR_2A9266:                dw DATA_2A92FE
       dw DATA_2A9306
       dw DATA_2A9310
       dw DATA_2A9318
       dw DATA_2A9322
     
PNTR_2A9270:                     dw DATA_2A9328
                    dw DATA_2A932D
                    dw DATA_2A9333
                    dw DATA_2A9338
                    dw DATA_2A933E


DATA_2A927A:        db $01,$02,$01,$03,$04,$05,$03,$02
       db $01,$04,$06,$06,$06,$06,$07,$02
       db $08,$09,$06,$07,$09,$07,$04,$05
       db $06,$05,$08,$04,$05,$04,$06,$06


DATA_2A929A:        db $03,$03,$02,$06,$06,$05,$02,$01
                    db $02,$07,$08,$09,$07,$04,$05,$02
                    db $00,$07,$08,$04,$06,$05,$04,$06
                    db $06,$05,$03,$07,$04,$05,$04


DATA_2A92B9:        db $01,$03,$02,$01,$02,$00,$01,$04       
                    db $06,$05,$03,$02,$01,$0A,$05,$03
       db $04,$06,$06,$06,$06,$06,$09,$06
       db $0B,$06,$06,$06,$06,$06,$06,$06
       db $05,$08,$04

DATA_2A92DC:        db $01,$02,$01,$03,$04,$05,$01,$03
                    db $04,$09,$05,$08,$09,$05,$04

DATA_2A92EB:        db $07,$09,$07,$08,$09,$06,$07,$08
       db $04,$05,$04,$07,$04,$06,$05,$08
       db $04,$05,$04

DATA_2A92FE:        db $0E,$00,$0F,$00,$10,$00,$10,$00

DATA_2A9306:        db $10,$00,$10,$00,$0E,$00,$0F,$00
                    db $0F,$00

DATA_2A9310:        db $0C,$00,$0F,$00,$10,$00,$10,$00

DATA_2A9318:        db $0E,$00,$0E,$00,$10,$00,$10,$00
                    db $12,$00

DATA_2A9322:        db $0A,$00,$0F,$00,$0F,$00

DATA_2A9328:        db $02,$06,$08,$08,$08

DATA_2A932D:        db $03,$06,$08,$0A,$02,$02

DATA_2A9333:           db $03,$09,$0A,$0A,$03

DATA_2A9338:        db $02,$04,$03,$01,$03,$02

DATA_2A933E:        db $02,$09,$06,$02

CODE_2A9342:        SEP   #$10
                    LDX.b #$00
CODE_2A9346:        LDA.b #$02
                    STA.l $7F0000,x
                    INX
                    CPX.b #$30        
                    BNE   CODE_2A9346           
CODE_2A9351:        LDA.b #$04                  
                    STA.l $7F0000,x             
                    INX                         
                    LDA.b #$07                  
                    STA.l $7F0000,x             
                    INX                         
                    CPX.b #$40     
                    BNE   CODE_2A9351
                    LDX.b #$50               
                    LDA.b #$90                  
                    STA.b $00                   
                    LDA.b #$10                  
CODE_2A936B:        STA.l $7F0000,x             
                    INX                         
                    DEC.b $00                   
                    BNE   CODE_2A936B           
CODE_2A9374:        LDY.b #$00                
                    LDA.b [$2B],y                       
                    CMP.b #$FF                  
                    BEQ   CODE_2A9384           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A9386,x)             
                    BRA   CODE_2A9374           

CODE_2A9384:        PLB                         
                    RTL                         

PNTR_2A9386:                   dw CODE_2A9392
                                  dw CODE_2A93D7
       dw CODE_2A93FD
       dw CODE_2A9453
       dw CODE_2A9465
       dw CODE_2A9480

CODE_2A9392:        REP   #$10                 
                    LDX.b $00
CODE_2A9396:        LDA.b #$01                  
                    STA.l $7F0000,x
                    REP   #$20
                    TXA                        
                    CLC                         
                    ADC.w #$0010                  
                    TAX                  
                    SEP   #$20                  
                    LDA.l $7F0000,x             
                    CMP.b #$07                  
                    BEQ   CODE_2A93C6           
                    LDA.b #$03                  
                    STA.l $7F0000,x             
CODE_2A93B4:        REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$0010                
                    TAX                         
                    SEP   #$20                  
                    DEC.b $D8                   
                    DEC.b $D8                   
                    BPL   CODE_2A9396           
                    BRA   CODE_2A93D4           

CODE_2A93C6:        LDA.b #$05                  
                    STA.l $7F0000,x             
                    LDA.b #$06                  
                    STA.l $7F0001,x             
                    BRA   CODE_2A93B4           

CODE_2A93D4:        SEP   #$10                  
                    RTS                         

CODE_2A93D7:        LDY.b #$00                  
                    LDX.b $00                   
CODE_2A93DB:        LDA.l $7F0000,x             
                    BNE   CODE_2A93E9           
                    LDA.w $93EF,y               
                    STA.l $7F0000,x             
                    INY                         
CODE_2A93E9:        INX                         
                    DEC.b $D8                   
                    BPL   CODE_2A93DB           
                    RTS                         

                    db $08,$09,$0A,$0A,$0A,$0B,$0C,$08
                    db $08,$08,$0D,$0E,$0F,$08     
              
CODE_2A93FD:        LDY.b #$00                   
                    LDX.b $00                   
                    LDA.w $1EBF                 
                    CMP.b #$24                  
                    BEQ   CODE_2A9425           
CODE_2A9408:        LDA.w $9441,y               
                    STA.l $7F0000,x             
                    LDA.w $9444,y               
                    STA.l $7F0010,x             
                    LDA.w $9447,y               
                    STA.l $7F0020,x             
                    INX                         
                    INY                         
                    DEC.b $D8                   
                    BPL   CODE_2A9408           
                    BRA   CODE_2A9440           

CODE_2A9425:        LDA.w $944A,y               
                    STA.l $7F0000,x             
                    LDA.w $944D,y               
                    STA.l $7F0010,x             
                    LDA.w $9450,y               
                    STA.l $7F0020,x             
                    INX                         
                    INY                         
                    DEC.b $D8                   
                    BPL   CODE_2A9425           
CODE_2A9440:        RTS                         

                    db $12,$13,$14
                    db $16,$17,$14
                    db $18,$19,$1A
                    db $21,$22,$14
                    db $23,$24,$14
                    db $18,$19,$1A

CODE_2A9453:        LDX.b $00
CODE_2A9455:        LDA.b #$11
                    STA.l $7F0000,X
                    TXA
                    CLC
                    ADC.b #$10
                    TAX            
                    DEC.b $D8                   
                    BPL   CODE_2A9455           
                    RTS                         

CODE_2A9465:        LDX.b $00                    
                    LDA.l $7F0000,x             
                    CMP.b #$11                  
                    BEQ   CODE_2A9473           
                    LDA.b #$1B                  
                    BRA   CODE_2A9475           

CODE_2A9473:        LDA.b #$1D                  
CODE_2A9475:        STA.l $7F0000,x             
                    LDA.b #$1C                  
                    STA.l $7F0001,x             
                    RTS                         

CODE_2A9480:        LDX.b $00                 
                    LDY.b $D8                   
                    LDA.w $948C,y               
                    STA.l $7F0000,x             
                    RTS                         

                    db $15,$1E
                
CODE_2A948E:        SEP   #$10                  
                    LDX.b #$60                  
                    LDA.b #$3D                  
CODE_2A9494:        JSR.w CODE_2A8D03           
                    INX                         
                    CPX.b #$70                  
                    BNE   CODE_2A9494           
                    LDA.b #$01                  
CODE_2A949E:        JSR.w CODE_2A8D03           
                    INX                         
                    CPX.b #$80                  
                    BNE   CODE_2A949E           
                    LDA.b #$02                  
                    STA.b $00                   
                    LDA.b #$03                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $02                   
                    LDA.b #$04                  
                    STA.b $03                   
CODE_2A94B6:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    DEC.b $02                   
                    BNE   CODE_2A94B6           
                    LDA.b #$08                  
                    STA.b $02                   
                    INC.b $00                   
                    INC.b $00                   
                    INC.b $01                   
                    INC.b $01                   
                    DEC.b $03                   
                    BNE   CODE_2A94B6           
                    LDA.b #$10                  
                    STA.b $02                   
                    LDA.b #$0A                  
CODE_2A94DC:        JSR.w CODE_2A8D03           
                    INX                         
                    DEC.b $02                   
                    BNE   CODE_2A94DC           
                    LDA.b #$04                  
                    STA.b $04                   
                    LDA.b #$0B                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    JSR.w CODE_2A95B9           
                    LDA.b #$04                  
                    STA.b $04                   
                    LDA.b #$0F                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    JSR.w CODE_2A95B9           
                    LDA.b #$04                  
                    STA.b $04                   
                    LDA.b #$13                  
                    STA.b $00                   
                    LDA.b #$14                  
                    STA.b $01                   
                    LDA.b #$19                  
                    STA.b $02                   
                    LDA.b #$1A                  
                    STA.b $03                   
                    JSR.w CODE_2A95B9           
                    LDX.b #$70                  
                    LDA.b #$04                  
                    STA.b $04                   
                    LDA.b #$2D                  
                    STA.b $00                   
                    LDA.b #$2E                  
                    STA.b $01                   
                    LDA.b #$33                  
                    STA.b $02                   
                    LDA.b #$34                  
                    STA.b $03                   
                    JSR.w CODE_2A975C           
                    LDA.b #$04                  
                    STA.b $04                   
                    LDA.b #$35                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    JSR.w CODE_2A975C           
                    LDA.b #$04                  
                    STA.b $04                   
                    LDA.b #$39                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    JSR.w CODE_2A975C           
CODE_2A9564:        LDA.b #$0A                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    CPX.b #$B0                  
                    BNE   CODE_2A9564           
CODE_2A956E:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A95B7           
                    JSR.w CODE_2A8E54           
CODE_2A9579:        STZ.b $02                   
CODE_2A957B:        REP   #$20                  
                    LDA.b $00                   
                    STA.b $04                   
                    SEP   #$20                  
                    LDA.b #$09                  
                    STA.b $03                   
CODE_2A9587:        LDX.b $02                   
                    LDA.w $95D6,x               
                    REP   #$10                  
                    LDX.b $04                   
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    LDA.b $04                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $04                   
                    SEP   #$30                  
                    INC.b $02                   
                    DEC.b $03                   
                    BNE   CODE_2A9587           
                    INC.b $00                   
                    LDA.b $02                   
                    CMP.b #$24                  
                    BNE   CODE_2A957B           
                    LDA.b $D8                   
                    BEQ   CODE_2A95B5           
                    DEC.b $D8                   
                    BRA   CODE_2A9579           

CODE_2A95B5:        BRA   CODE_2A956E           

CODE_2A95B7:        PLB                         
                    RTL                         

CODE_2A95B9:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $02                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A95B9           
                    RTS                         


                    db $15,$1B,$00,$00,$00,$00,$00,$29
                    db $2F,$16,$1C,$1F,$21,$23,$25,$27
                    db $2A,$30,$17,$1D,$20,$22,$24,$26
                    db $28,$2B,$31,$18,$1E,$00,$00,$00
                    db $00,$00,$2C,$32



CODE_2A95FA:        SEP   #$10
                    LDA.b #$3A
                    STA.b $00                   
                    LDA.b #$01                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    LDX.b #$E0                  
                    JSR.w CODE_2A973A           
                    LDA.b #$02                  
                    STA.b $00                   
                    LDA.b #$03                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A973A           
                    LDA.b #$04                  
                    STA.b $00                   
                    LDA.b #$05                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A974B           
                    LDA.b #$0B                  
                    STA.b $00                   
                    LDA.b #$0C                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A974B           
                    LDA.b #$20                  
                    STA.b $04                   
CODE_2A963E:        LDA.b #$13                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A963E           
                    LDX.b #$30                  
                    LDA.b #$10                  
                    STA.b $04                   
                    LDA.b #$13                  
CODE_2A9650:        JSR.w CODE_2A8D25           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A9650           
                    JSR.w CODE_2A96ED           
                    JSR.w CODE_2A96AD           
                    LDA.w $0350                 
                    CMP.b #$1A                  
                    BNE   CODE_2A96AB           
                    LDA.b #$00                  
                    XBA                         
                    INC.w $034F                 
                    REP   #$10                  
                    LDY.w #$0510                
                    LDX.w #$05C0                
                    LDA.b #$CF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$06C0                
                    LDX.w #$0770                
                    LDA.b #$CF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
                    LDX.b #$E0                  
                    LDA.b #$13                  
CODE_2A968C:        STA.l $7F05E0,x             
                    STA.l $7F0790,x             
                    DEX                         
                    BNE   CODE_2A968C           
                    LDX.b #$70                  
                    JSR.w CODE_2A96ED           
                    PHB                         
                    LDA.b #$2A                  
                    PHA                         
                    PLB                         
                    REP   #$20                  
                    INC.b $2B                   
                    SEP   #$20                  
                    JSR.w CODE_2A96AD           
                    PLB                         
CODE_2A96AB:        PLB                         
                    RTL                         

CODE_2A96AD:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A96EC           
                    JSR.w CODE_2A8E54           
                    LDA.b #$2A                  
                    STA.b $08                   
                    STA.b $0B                   
                    STA.b $0E                   
                    REP   #$30                  
                    LDX.b $D8                   
                    LDA.w $9796,x               
                    STA.b $06                   
                    LDA.w $97A2,x               
                    STA.b $09                   
                    LDA.w $97AE,x               
                    STA.b $0C                   
                    STZ.b $04                   
                    SEP   #$20                  
                    LDA.w $978A,x               
                    STA.b $0F                   
                    LDX.b $00                   
                    LDY.w #$0000                
                    LDA.b [$0C]                 
                    STA.b $02                   
                    JSR.w CODE_2A8FA7           
                    SEP   #$10                  
                    BRA   CODE_2A96AD           

CODE_2A96EC:        RTS                         

CODE_2A96ED:        LDA.b #$18                  
                    STA.b $00                   
                    LDA.b #$19                  
                    STA.b $01                   
                    LDA.b #$1E                  
                    STA.b $02                   
                    LDA.b #$1B                  
                    STA.b $03                   
                    LDA.b #$04                  
                    STA.b $04                   
                    JSR.w CODE_2A975C           
                    LDA.b #$21                  
                    STA.b $00                   
                    LDA.b #$22                  
                    STA.b $01                   
                    LDA.b #$26                  
                    STA.b $02                   
                    LDA.b #$24                  
                    STA.b $03                   
                    LDA.b #$04                  
                    STA.b $04                   
                    JSR.w CODE_2A975C           
                    LDA.b #$28                  
                    STA.b $00                   
                    LDA.b #$29                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A9779           
                    LDA.b #$38                  
                    STA.b $00                   
                    LDA.b #$39                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A9779           
                    RTS                         

CODE_2A973A:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A973A           
                    RTS                         

CODE_2A974B:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A974B           
                    RTS                         

CODE_2A975C:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $02                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A975C           
                    RTS                         

CODE_2A9779:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    DEC.b $04                   
                    BNE   CODE_2A9779           
                    RTS                         


                    db $06,$00,$04,$00,$06,$00,$06,$00
                    db $09,$00,$06,$00,$BA,$97,$D4,$97
                    db $E6,$97,$FF,$97,$1D,$98,$33,$98
                    db $52,$98,$5C,$98,$62,$98,$6C,$98
                    db $76,$98,$86,$98,$90,$98,$96,$98
                    db $9A,$98,$A0,$98,$A6,$98,$AF,$98
                    db $06,$07,$08,$0D,$0E,$0F,$10,$0D
                    db $0E,$14,$15,$09,$16,$16,$1A,$15
                    db $11,$1C,$1C,$23,$15,$2A,$2B,$2C
                    db $2D,$2E,$09,$16,$0A,$11,$1C,$12
                    db $1D,$10,$11,$1C,$12,$25,$15,$2F
                    db $2C,$30,$31,$32,$09,$16,$0A,$11
                    db $1C,$12,$11,$1C,$12,$17,$06,$07
                    db $1F,$12,$20,$0D,$0E,$27,$12,$20
                    db $33,$34,$35,$36,$37,$09,$16,$0A
                    db $11,$1C,$12,$06,$07,$07,$1F,$12
                    db $17,$0D,$0E,$0E,$27,$12,$20,$0D
                    db $0E,$0E,$27,$12,$20,$33,$34,$34
                    db $35,$36,$37,$09,$16,$16,$11,$1C
                    db $1C,$11,$1C,$1C,$2A,$2B,$2C,$0F
                    db $10,$1A,$15,$23,$15,$23,$15,$2D
                    db $2E,$09,$16,$0A,$11,$1C,$12,$11
                    db $1C,$12,$17,$06,$07,$07,$07,$1F
                    db $12,$20,$0D,$0E,$0E,$0E,$27,$12
                    db $20,$33,$34,$34,$34,$35,$36,$37
                    db $10,$00,$10,$00,$0F,$00,$10,$00
                    db $10,$00,$10,$00,$10,$00,$10,$00
                    db $10,$00,$10,$00,$0F,$00,$10,$00
                    db $10,$00,$10,$00,$0E,$00,$10,$00
                    db $10,$00,$10,$00,$10,$00,$10,$00
                    db $10,$00,$63,$01,$10,$00,$10,$00
                    db $10,$00,$10,$00,$10,$00,$10,$00
                    db $0D,$00,$10,$00,$10,$00,$03,$04
                    db $04,$05,$05,$05,$03,$05,$05,$05
                    db $03,$03,$04,$05,$05,$05,$03,$03
                    db $06,$06,$06,$06,$03,$03,$03,$03
                    db $02,$02,$02,$02,$02,$03,$03,$04
                    db $07,$07,$07
               

CODE_2A98B5:        SEP   #$10                  
                    LDX.b #$10                  
                    LDA.b #$01                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDX.b #$A0                  
                    LDA.b #$14                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
CODE_2A98C9:        INX                         
                    LDA.b #$18                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A98C9           
CODE_2A98D5:        LDA.b #$1C                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$1D                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A98D5           
                    LDA.b #$21                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDA.b #$22                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDA.b #$29                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDA.b #$2A                  
                    STA.b $00                   
CODE_2A98FF:        JSR.w CODE_2A9930           
                    CPX.b #$B0                  
                    BNE   CODE_2A98FF           
CODE_2A9906:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A9916           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A9918,x)             
                    BRA   CODE_2A9906           

CODE_2A9916:        PLB                         
                    RTL                         


PNTR_2A9918:        dw CODE_2A994C
                    dw CODE_2A9988
                    dw CODE_2A99BB
                    dw CODE_2A99F7
                    dw CODE_2A9A23
         dw CODE_2A9A3E


CODE_2A9924:        LDA.b $00
                    JSR.w $8D03
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A9924           
                    RTS                         

CODE_2A9930:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A9930           
                    RTS                         


                    db $34,$35,$34,$36,$34,$36,$34,$35
                    db $34,$36,$37,$34,$38,$35,$37,$37


CODE_2A994C:        REP   #$10                ;0 S:01FF P:EnvMXdIzc HC:20934 VC:000 FC:00 I:00
CODE_2A994E:        LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:20950 VC:000 FC:00 I:00
                    LDA.l $7F0000,x           ;0 S:01FF P:EnvMxdIzc HC:20966 VC:000 FC:00 I:00
                    CMP.b #$14                ;0 S:01FF P:EnvMxdIzc HC:20982 VC:000 FC:00 I:00
                    BEQ   CODE_2A996B         ;0 S:01FF P:EnvMxdIzc HC:20998 VC:000 FC:00 I:00
                    LDA.b #$02                ;0 S:01FF P:EnvMxdIzc HC:21014 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:21030 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:21054 VC:000 FC:00 I:00
                    LDA.b $00                 ;0 S:01FF P:EnvmxdIzc HC:21070 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:21086 VC:000 FC:00 I:00
                    ADC.w #$0010              ;0 S:01FF P:EnvmxdIzc HC:21102 VC:000 FC:00 I:00
                    STA.b $00                 ;0 S:01FF P:EnvmxdIzc HC:21118 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:21142 VC:000 FC:00 I:00
                    BRA   CODE_2A994E         ;0 S:01FF P:EnvMxdIzc HC:21158 VC:000 FC:00 I:00

CODE_2A996B:        LDA.b #$17                ;0 S:01FF P:EnvMxdIzc HC:21174 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:21190 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:21214 VC:000 FC:00 I:00
                    LDA.b $00                 ;0 S:01FF P:EnvmxdIzc HC:21230 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:21246 VC:000 FC:00 I:00
                    ADC.w #$0010              ;0 S:01FF P:EnvmxdIzc HC:21262 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvmxdIzc HC:21278 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:21302 VC:000 FC:00 I:00
                    LDA.b #$1B                ;0 S:01FF P:EnvMxdIzc HC:21318 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:21334 VC:000 FC:00 I:00
                    LDA.b #$20                ;0 S:01FF P:EnvMxdIzc HC:21350 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMxdIzc HC:21366 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:21390 VC:000 FC:00 I:00
                    RTS                       ;

CODE_2A9988:        REP   #$10                  
                    LDY.w #$0000                
CODE_2A998D:        LDX.b $00                   
CODE_2A998F:        LDA.w $99B1,y               
                    JSR.w CODE_2A8CD9           
                    INY                         
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$0010                
                    TAX                         
                    SEP   #$20                  
                    CPY.w #$000A                
                    BEQ   CODE_2A99AE           
                    CPY.w #$0005                
                    BNE   CODE_2A998F           
                    INC.b $00                   
                    BRA   CODE_2A998D           

CODE_2A99AE:        SEP   #$10                  
                    RTS                         


                    db $03,$08,$0D,$10,$12,$04,$09,$0E
                    db $11,$13
   
              
CODE_2A99BB:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$05                  
                    JSR.w CODE_2A99E9           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$0A                  
                    JSR.w CODE_2A99E9           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0011                
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$0F                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2A99E9:        JSR.w CODE_2A8CD9           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8CD9           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8CD9           
                    RTS                         

CODE_2A99F7:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$15                  
                    JSR.w CODE_2A9A0D           
                    LDA.b #$19                  
                    JSR.w CODE_2A9A0D           
                    LDA.b #$1E                  
                    JSR.w CODE_2A9A0D           
                    SEP   #$10                  
                    RTS                         

CODE_2A9A0D:        JSR.w CODE_2A8CD9           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    RTS                         

CODE_2A9A23:        REP   #$10                  
                    LDX.b $00                   
                    LDY.w #$0000                
CODE_2A9A2A:        LDA.w $9A39,y               
                    JSR.w CODE_2A8CD9           
                    INX                         
                    INY                         
                    CPY.w #$0005                
                    BNE   CODE_2A9A2A           
                    BRA   CODE_2A9A4D           


                    db $23,$24,$28,$26,$27
    
             
CODE_2A9A3E:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$23                  
CODE_2A9A44:        JSR.w CODE_2A8CD9           
                    INX                         
                    INC   A                     
                    CMP.b #$28                  
                    BNE   CODE_2A9A44           
CODE_2A9A4D:        LDY.w #$0000                
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0011                
                    TAX                         
                    SEP   #$20                  
CODE_2A9A5B:        LDA.w $9AAE,y               
                    JSR.w CODE_2A8CD9           
                    LDA.w $9AB1,y               
                    JSR.w CODE_2A8CEE           
                    INX                         
                    INY                         
                    CPY.w #$0003                
                    BNE   CODE_2A9A5B           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0032                
                    TAX                         
                    SEP   #$20                  
CODE_2A9A79:        LDA.l $7F0000,x             
                    CMP.b #$2A                  
                    BNE   CODE_2A9A92           
                    LDA.b #$30                  
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$0010                
                    TAX                         
                    SEP   #$20                  
                    BRA   CODE_2A9A79           

CODE_2A9A92:        REP   #$20                  
                    TXA                         
                    SEC                         
                    SBC.w #$0011                
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$31                  
                    JSR.w CODE_2A8CD9           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8CD9           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         


                    db $2B,$28,$2C,$2D,$2E,$2F


CODE_2A9AB4:        SEP   #$10                ;0 S:01FF P:EnvMXdIzc HC:22470 VC:000 FC:00 I:00
                    LDA.w $0727               ;0 S:01FF P:EnvMXdIzc HC:22486 VC:000 FC:00 I:00
                    CMP.b #$07                ;0 S:01FF P:EnvMXdIzc HC:22502 VC:000 FC:00 I:00
                    BEQ   CODE_2A9AC2         ;0 S:01FF P:EnvMXdIzc HC:22518 VC:000 FC:00 I:00
                    LDA.b #$01                  
                    STA.w $02D9                 
CODE_2A9AC2:        LDX.b #$10                  
                    LDA.b #$01                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$05                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$09                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    LDA.b #$11                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$19                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$22                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
CODE_2A9AF4:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A9B04           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A9B06,x)             
                    BRA   CODE_2A9AF4           

CODE_2A9B04:        PLB                         
                    RTL                         


PNTR_2A9B06:        dw CODE_2A9B0C
                    dw CODE_2A9B6A                      
                    dw CODE_2A9B86  

                
CODE_2A9B0C:        LDX.b $00                   
                    STX.b $01                   
                    LDA.b #$03                  
                    STA.b $D8                   
                    LDA.b #$02                  
                    JSR.w CODE_2A9B58           
                    LDA.b #$03                  
                    STA.b $D8                   
                    LDA.b #$06                  
                    JSR.w CODE_2A9B58           
                    LDA.b #$03                  
                    STA.b $D8                   
                    LDA.b #$0A                  
                    JSR.w CODE_2A9B58           
                    STZ.b $D8                   
CODE_2A9B2D:        LDA.b #$0D                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$0B                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$0E                  
                    JSR.w CODE_2A8D25           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    TAX                         
                    LDA.b $D8                   
                    BNE   CODE_2A9B4E           
                    INC.b $D8                   
                    BRA   CODE_2A9B2D           

CODE_2A9B4E:        LDA.b #$03                  
                    STA.b $D8                   
                    LDA.b #$12                  
                    JSR.w CODE_2A9B58           
                    RTS                         

CODE_2A9B58:        JSR.w CODE_2A8D25           
                    INC   A                     
                    INX                         
                    DEC.b $D8                   
                    BNE   CODE_2A9B58           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    TAX                         
                    RTS                         

CODE_2A9B6A:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$18                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$21                  
                    JSR.w CODE_2A8CEE           
                    INX                         
                    LDA.b #$18                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$21                  
                    JSR.w CODE_2A8CEE           
                    SEP   #$10                  
                    RTS                         

CODE_2A9B86:        REP   #$10                  
                    LDY.w #$0000                
CODE_2A9B8B:        LDX.b $00                   
CODE_2A9B8D:        LDA.w $9BAA,y               
                    JSR.w CODE_2A8CD9           
                    INY                         
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    CMP.b #$09                  
                    BNE   CODE_2A9B8D           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    CMP.b #$40                  
                    BNE   CODE_2A9B8B           
                    SEP   #$10                  
                    RTS                         


                db $0F,$09,$09,$09,$0D,$0B,$0E,$09
                    db $10,$15,$16,$16,$09,$0D,$0B,$0E
                    db $09,$17,$1A,$1B,$1B,$1C,$1D,$1E
                    db $1F,$1C,$20


CODE_2A9BC5:        SEP   #$10                ;0 S:01FF P:EnvMXdIzc HC:23006 VC:000 FC:00 I:00
                    LDX.b #$C0                ;0 S:01FF P:EnvMXdIzc HC:23022 VC:000 FC:00 I:00
                    LDA.b #$30                ;0 S:01FF P:EnvMXdIzc HC:23038 VC:000 FC:00 I:00
                    STA.b $00                 ;0 S:01FF P:EnvMXdIzc HC:23054 VC:000 FC:00 I:00
                    JSR.w CODE_2A9924         ;0 S:01FF P:EnvMXdIzc HC:23070 VC:000 FC:00 I:00
                    LDA.b #$01                  
                    STA.b $00                   
CODE_2A9BD4:        JSR.w CODE_2A9924           
                    INC.b $00                   
                    LDA.b $00                   
                    AND.b #$03                  
                    BNE   CODE_2A9BD4           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    LDX.b #$70                  
                    LDA.b #$2F                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
CODE_2A9BEE:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A9BFE           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A9C00,x)             
                    BRA   CODE_2A9BEE           

CODE_2A9BFE:        PLB                         
                    RTL                         


PNTR_2A9C00:        dw CODE_2A9C06
                    dw CODE_2A9C14
                    dw CODE_2A9C22 


CODE_2A9C06:        REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:31510 VC:000 FC:00 I:00
                    LDA.w #$9C59              ;0 S:01FF P:EnvmxdIzc HC:31526 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:31542 VC:000 FC:00 I:00
                    LDA.w #$0007              ;0 S:01FF P:EnvmxdIzc HC:31558 VC:000 FC:00 I:00
                    STA.b $05                 ;0 S:01FF P:EnvmxdIzc HC:31574 VC:000 FC:00 I:00
                    BRA   CODE_2A9C2E         ;0 S:01FF P:EnvmxdIzc HC:31590 VC:000 FC:00 I:00

CODE_2A9C14:        REP   #$30                ;0 S:01FF P:EnvmxdIzc HC:31614 VC:000 FC:00 I:00
                    LDA.w #$9C75              ;0 S:01FF P:EnvmxdIzc HC:31630 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:31646 VC:000 FC:00 I:00
                    LDA.w #$0005              ;0 S:01FF P:EnvmxdIzc HC:31662 VC:000 FC:00 I:00
                    STA.b $05                 ;0 S:01FF P:EnvmxdIzc HC:31678 VC:000 FC:00 I:00
                    BRA   CODE_2A9C2E         ;0 S:01FF P:EnvmxdIzc HC:31694 VC:000 FC:00 I:00

CODE_2A9C22:        REP   #$30                  
                    LDA.w #$9C89                
                    STA.b $02                   
                    LDA.w #$0005                
                    STA.b $05                   
CODE_2A9C2E:        SEP   #$20                  
CODE_2A9C30:        LDA.b #$04                  
                    STA.b $04                   
                    LDX.b $00                   
CODE_2A9C36:        LDA.b ($02)                 
                    JSR.w CODE_2A8CD9           
                    INX                         
                    REP   #$20                  
                    INC.b $02                   
                    SEP   #$20                  
                    DEC.b $04                   
                    BNE   CODE_2A9C36           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    SEP   #$20                  
                    DEC.b $05                   
                    BNE   CODE_2A9C30           
                    SEP   #$10                  
                    RTS                         


                    db $04,$05,$06,$04,$07,$08,$09,$0A
                    db $0B,$0C,$0D,$0E,$13,$14,$15,$16
                    db $1B,$1C,$1D,$1E,$23,$24,$25,$26
                    db $29,$2A,$2B,$2C,$0F,$12,$0F,$12
                    db $17,$1A,$17,$1A,$1F,$22,$1F,$22
                    db $23,$26,$23,$26,$29,$2C,$29,$2C
                    db $0F,$10,$11,$12,$17,$18,$19,$1A
                    db $1F,$20,$21,$22,$23,$27,$28,$26
                    db $29,$2D,$2E,$2C
 
                
CODE_2A9C9D:        SEP   #$10                  
CODE_2A9C9F:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A9CAF           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A9CC3,x)             
                    BRA   CODE_2A9C9F           

CODE_2A9CAF:        LDA.b #$00                  
                    XBA                         
                    REP   #$10                  
                    LDY.w #$0100                
                    LDX.w #$01B0                
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
                    PLB                         
                    RTL                         


PNTR_2A9CC3:        dw CODE_2A9CCF
                    dw CODE_2A9D61
                    dw CODE_2A9DC0
                    dw CODE_2A9E6B
                    dw CODE_2A9ED2
                    dw CODE_2A9EE8


CODE_2A9CCF:        REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:33470 VC:000 FC:00 I:00
                    LDA.b $DA                 ;0 S:01FF P:EnvmxdIzc HC:33486 VC:000 FC:00 I:00
                    ASL   A                   ;0 S:01FF P:EnvmxdIzc HC:33502 VC:000 FC:00 I:00
                    TAY                       ;0 S:01FF P:EnvmxdIzc HC:33518 VC:000 FC:00 I:00
                    LDA.w $9CE0,y             ;0 S:01FF P:EnvmxdIzc HC:33534 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:33550 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:33574 VC:000 FC:00 I:00
                    JSR.w CODE_2A9D3A         ;0 S:01FF P:EnvMxdIzc HC:33590 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMxdIzc HC:33606 VC:000 FC:00 I:00                     


                    db $EA,$9C,$FA,$9C,$0A,$9D,$1A,$9D
                    db $2A,$9D,$02,$06,$1F,$02,$06,$06
                    db $1F,$03,$03,$02,$03,$03,$10,$17
                    db $03,$03,$03,$06,$1F,$02,$06,$09
                    db $1F,$03,$03,$02,$03,$03,$10,$17
                    db $03,$03,$02,$03,$10,$17,$1D,$1F
                    db $10,$17,$02,$06,$1F,$02,$31,$1F
                    db $10,$17,$02,$09,$10,$17,$1E,$1F
                    db $10,$17,$02,$1E,$1F,$02,$09,$1F
                    db $10,$17,$00,$00,$00,$00,$00,$06
                    db $1F,$03,$03,$02,$03,$03,$10,$17
                    db $03,$03


CODE_2A9D3A:        LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:1990 VC:000 FC:00 I:00
                    LDY.w #$0000              ;0 S:01FF P:EnvMxdIzc HC:2006 VC:000 FC:00 I:00
CODE_2A9D3F:        LDA.b ($02),y             ;0 S:01FF P:EnvMxdIzc HC:2022 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:2038 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:35406 VC:000 FC:00 I:00
                    TXA                       ;0 S:01FF P:EnvmxdIzc HC:35422 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:35438 VC:000 FC:00 I:00
                    ADC.w #$0010              ;0 S:01FF P:EnvmxdIzc HC:35454 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvmxdIzc HC:35470 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:35494 VC:000 FC:00 I:00
                    INY                       ;0 S:01FF P:EnvMxdIzc HC:35510 VC:000 FC:00 I:00
                    CPY.w #$0010              ;0 S:01FF P:EnvMxdIzc HC:35526 VC:000 FC:00 I:00
                    BNE   CODE_2A9D3F         ;0 S:01FF P:EnvMxdIzc HC:35542 VC:000 FC:00 I:00
                    LDA.b $D8                 ;0 S:01FF P:EnvMxdIzc HC:35558 VC:000 FC:00 I:00
                    BEQ   CODE_2A9D5E         ;0 S:01FF P:EnvMxdIzc HC:35574 VC:000 FC:00 I:00
                    DEC.b $D8                 ;0 S:01FF P:EnvMxdIzc HC:35590 VC:000 FC:00 I:00
                    INC.b $00                 ;0 S:01FF P:EnvMxdIzc HC:35606 VC:000 FC:00 I:00
                    BRA   CODE_2A9D3A         ;0 S:01FF P:EnvMxdIzc HC:35622 VC:000 FC:00 I:00

CODE_2A9D5E:        SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:35646 VC:000 FC:00 I:00
                    RTS                       ;

CODE_2A9D61:        REP   #$30                  
                    LDA.b $DA                   
                    ASL   A                     
                    TAX                         
                    LDA.w $9D74,x               
                    STA.b $02                   
                    SEP   #$20                  
                    LDX.b $00                   
                    JSR.w CODE_2A9DA6           
                    RTS                         

                    db $80,$9D           


                    db $88,$9D,$8D,$9D,$95,$9D,$9D,$9D
                    db $A2,$9D,$07,$08,$07,$08,$1A,$07
                    db $08,$1A,$1A,$08,$1A,$07,$00,$1A
                    db $1A,$08,$1A,$1A,$1B,$1C,$07,$08
                    db $1A,$08,$08,$1A,$2C,$08,$1A,$1A
                    db $08,$06,$1A,$00,$07,$08,$06,$00

                
CODE_2A9DA6:        LDA.l $7F0000,x             
                    BNE   CODE_2A9DB7           
                    LDA.b ($02)                 
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    INC.b $02                   
                    SEP   #$20                  
CODE_2A9DB7:        INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2A9DA6           
                    SEP   #$10                  
                    RTS                         

CODE_2A9DC0:        REP   #$30                  
                    LDA.b $DA                   
                    ASL   A                     
                    TAX                         
                    LDA.w $9DE3,x               
                    STA.b $02                   
                    SEP   #$20                  
                    JSR.w CODE_2A9D3A           
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $02                   
                    STA.b $02                   
                    INC.b $00                   
                    SEP   #$20                  
                    JSR.w CODE_2A9D3A           
                    RTS                         


                    db $EB,$9D,$0B,$9E,$2B,$9E,$4B,$9E
                    db $04,$1B,$20,$33,$1B,$20,$35,$04
                    db $20,$20,$35,$04,$2E,$30,$35,$04
                    db $05,$1C,$21,$34,$1C,$21,$01,$05
                    db $2D,$2F,$01,$05,$2D,$2F,$01,$05
                    db $04,$1B,$20,$33,$1B,$1B,$35,$04
                    db $2E,$30,$20,$35,$22,$27,$04,$20
                    db $05,$1C,$21,$34,$1C,$1C,$01,$05
                    db $21,$21,$21,$01,$23,$28,$05,$21
                    db $35,$04,$0B,$12,$1B,$35,$22,$27
                    db $04,$1B,$20,$20,$20,$35,$22,$27
                    db $01,$05,$0C,$13,$1C,$01,$23,$28
                    db $05,$1C,$21,$2D,$2F,$01,$23,$28
                    db $35,$04,$0B,$12,$1B,$35,$22,$27
                    db $04,$1B,$20,$2E,$30,$35,$22,$27
                    db $01,$05,$0C,$13,$1C,$01,$23,$28
                    db $05,$1C,$21,$21,$21,$01,$23,$28
 
              
CODE_2A9E6B:        REP   #$30                  
                    LDA.b $DA                   
                    ASL   A                     
                    TAX                         
                    LDA.w $9E8C,x               
                    STA.b $02                   
                    SEP   #$20                  
                    LDX.b $00                   
                    JSR.w CODE_2A9DA6           
                    REP   #$30                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_2A9DA6           
                    RTS                         


                    db $94,$9E,$A2,$9E,$B2,$9E,$C2,$9E
                    db $0A,$0A,$0D,$0E,$0D,$0E,$0A,$11
                    db $2A,$14,$15,$14,$15,$11,$0A,$0D
                    db $0E,$0F,$0F,$0A,$0A,$0F,$11,$14
                    db $15,$16,$16,$18,$19,$16,$0D,$0E
                    db $0D,$0E,$0F,$24,$25,$0F,$26,$29
                    db $26,$15,$16,$11,$2A,$16,$0D,$0E
                    db $0D,$0E,$0F,$10,$0A,$0F,$26,$29
                    db $26,$15,$16,$17,$11,$16
  
            
CODE_2A9ED2:        REP   #$10                  
                    LDX.b $00                   
                    LDY.b $DA                   
                    LDA.w $9EE1,y               
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         


                    db $02,$32,$03,$06,$1F,$20,$21


CODE_2A9EE8:        REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:37134 VC:000 FC:00 I:00
                    LDA.b $DA                 ;0 S:01FF P:EnvmxdIzc HC:37150 VC:000 FC:00 I:00
                    ASL   A                   ;0 S:01FF P:EnvmxdIzc HC:37166 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvmxdIzc HC:37182 VC:000 FC:00 I:00
                    LDA.w $9F1B,x             ;0 S:01FF P:EnvmxdIzc HC:37198 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:37214 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:37238 VC:000 FC:00 I:00
                    LDY.w #$0002              ;0 S:01FF P:EnvMxdIzc HC:37254 VC:000 FC:00 I:00
                    LDA.b ($02)               ;0 S:01FF P:EnvMxdIzc HC:37270 VC:000 FC:00 I:00
                    LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:37286 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:37302 VC:000 FC:00 I:00
                    LDA.b ($02),y             ;0 S:01FF P:EnvMxdIzc HC:37318 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMxdIzc HC:37334 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:37358 VC:000 FC:00 I:00
                    INC.b $02                 ;0 S:01FF P:EnvmxdIzc HC:37374 VC:000 FC:00 I:00
                    INC.b $00                 ;0 S:01FF P:EnvmxdIzc HC:37390 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:37414 VC:000 FC:00 I:00
                    LDA.b ($02)               ;0 S:01FF P:EnvMxdIzc HC:37430 VC:000 FC:00 I:00
                    LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:37446 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:37462 VC:000 FC:00 I:00
                    LDA.b ($02),y             ;0 S:01FF P:EnvMxdIzc HC:37478 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMxdIzc HC:37494 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:37518 VC:000 FC:00 I:00
                    RTS                       ;


                    db $21,$9F,$25,$9F,$29,$9F,$0D,$0E
                    db $14,$15,$0A,$0D,$2A,$14,$0A,$0A
                    db $11,$11


CODE_2A9F2D:        SEP   #$10                  
                    LDA.w $0727                 
                    CMP.b #$01                  
                    BNE   CODE_2A9F3B           
                    LDA.b #$18                  
                    STA.w $02C5                 
CODE_2A9F3B:        LDX.b #$D0                  
                    LDA.b #$23                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDA.b #$24                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDA.b #$01                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
CODE_2A9F5B:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2A9F6B           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2A9F6D,x)             
                    BRA   CODE_2A9F5B           

CODE_2A9F6B:        PLB                         
                    RTL                         


PNTR_2A9F6D:        dw CODE_2A9F7D
                    dw CODE_2A9F84
                    dw CODE_2A9F8B
                    dw CODE_2A9F92
                    dw CODE_2A9F99
                    dw CODE_2A9FA0
                    dw CODE_2A9FA7
                    dw CODE_2AA066


CODE_2A9F7D:        REP   #$10                ;0 S:01FF P:EnvMXdIzc HC:39302 VC:000 FC:00 I:00
                    LDY.w #$0000              ;0 S:01FF P:EnvMxdIzc HC:39318 VC:000 FC:00 I:00
                    BRA   CODE_2A9FAC         ;0 S:01FF P:EnvMxdIzc HC:39334 VC:000 FC:00 I:00

CODE_2A9F84:        REP   #$10                  
                    LDY.w #$0008                
                    BRA   CODE_2A9FAC           

CODE_2A9F8B:        REP   #$10                  
                    LDY.w #$0010                
                    BRA   CODE_2A9FAC           

CODE_2A9F92:        REP   #$10                  
                    LDY.w #$0018                
                    BRA   CODE_2A9FAC           

CODE_2A9F99:        REP   #$10                  
                    LDY.w #$0020                
                    BRA   CODE_2A9FAC           

CODE_2A9FA0:        REP   #$10                  
                    LDY.w #$0028                
                    BRA   CODE_2A9FAC           

CODE_2A9FA7:        REP   #$10                  
                    LDY.w #$0030                
CODE_2A9FAC:        LDA.b #$01                  
                    STA.b $02                   
CODE_2A9FB0:        LDX.b $00                   
                    LDA.b #$04                  
                    STA.b $04                   
CODE_2A9FB6:        LDA.w $A026,y               
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2AA009           
                    INY                         
                    DEC.b $04                   
                    BNE   CODE_2A9FB6           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    SEP   #$20                  
                    DEC.b $02                   
                    BEQ   CODE_2A9FB0           
                    LDY.w #$0000                
CODE_2A9FD8:        LDA.b #$04                  
                    STA.b $04                   
                    LDX.b $00                   
CODE_2A9FDE:        LDA.w $A05E,y               
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2AA009           
                    INY                         
                    REP   #$20                  
                    TYA                         
                    AND.w #$0007                
                    TAY                         
                    SEP   #$20                  
                    DEC.b $04                   
                    BNE   CODE_2A9FDE           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    SEP   #$20                  
                    DEC.b $D8                   
                    BNE   CODE_2A9FD8           
                    SEP   #$10                  
                    RTS                         

CODE_2AA009:        REP   #$20                  
                    TXA                         
                    AND.w #$000F                
                    BNE   CODE_2AA023           
                    LDA.b $DA                   
                    BNE   CODE_2AA01D           
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    BRA   CODE_2AA023           

CODE_2AA01D:        TXA                         
                    SEC                         
                    SBC.w #$01C0                
                    TAX                         
CODE_2AA023:        SEP   #$20                  
                    RTS                         


                    db $1D,$1E,$1F,$20,$21,$08,$09,$22
                    db $29,$04,$0B,$0C,$07,$08,$09,$0F
                    db $14,$15,$05,$2A,$1A,$08,$09,$0A
                    db $33,$17,$16,$32,$1C,$08,$09,$1B
                    db $14,$15,$0B,$0C,$1A,$08,$09,$0F
                    db $14,$15,$16,$32,$1A,$08,$09,$1B
                    db $29,$04,$05,$2A,$07,$08,$09,$0A
                    db $12,$13,$0D,$0E,$18,$19,$10,$11
   
            
CODE_2AA066:        REP   #$10                  
                    LDY.w #$0000                
CODE_2AA06B:        LDX.b $00                   
                    LDA.b #$04                  
                    STA.b $02                   
CODE_2AA071:        LDA.l $7F0000,x             
                    CMP.b #$01                  
                    BNE   CODE_2AA07F           
                    LDA.w $A09B,y               
                    JSR.w CODE_2A8CD9           
CODE_2AA07F:        INX                         
                    INY                         
                    CPY.w #$000C                
                    BCS   $12                   
                    DEC.b $02                   
                    BNE   CODE_2AA071           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    SEP   #$20                  
                    BRA   CODE_2AA06B           

                    SEP   #$10                  
                    RTS                         
     

                    db $25,$26,$27,$28,$2B,$2C,$2D,$2E
                    db $2F,$2F,$30,$31

              
CODE_2AA0A7:        SEP   #$10                  
                    LDX.b #$00                  
                    LDA.b #$02                  
                    STA.b $00                   
                    LDA.b #$03                  
                    STA.b $01                   
                    STZ.b $02                   
                    LDA.b #$01                  
                    STA.b $03                   
CODE_2AA0B9:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA0B9           
CODE_2AA0CA:        LDA.b $02                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA0CA           
                    TXA                         
                    BNE   CODE_2AA0B9           
CODE_2AA0DE:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA0DE           
                    CPX.b #$B0                  
                    BCS   $13                   
CODE_2AA0F3:        LDA.b $02                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA0F3           
                    BRA   CODE_2AA0DE           

CODE_2AA106:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AA116           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AA118,x)             
                    BRA   CODE_2AA106           

CODE_2AA116:        PLB                         
                    RTL                         


PNTR_2AA118:        dw CODE_2AA120
                    dw CODE_2AA143
                    dw CODE_2AA153
                    dw CODE_2AA15F


CODE_2AA120:        JSR.w CODE_2AA143         ;0 S:01FF P:EnvMXdIzc HC:40366 VC:000 FC:00 I:00
                    REP   #$10                ;0 S:01FF P:EnvMXdIzc HC:40390 VC:000 FC:00 I:00
                    LDA.b $DA                 ;0 S:01FF P:EnvMxdIzc HC:40406 VC:000 FC:00 I:00
                    BEQ   CODE_2AA12B         ;0 S:01FF P:EnvMxdIzc HC:40422 VC:000 FC:00 I:00
                    STA.b $D8                 ;0 S:01FF P:EnvMxdIzc HC:40438 VC:000 FC:00 I:00
CODE_2AA12B:        JSR.w CODE_2AA136         ;0 S:01FF P:EnvMxdIzc HC:40454 VC:000 FC:00 I:00
                    LDA.b #$04                ;0 S:01FF P:EnvMxdIzc HC:40470 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:40486 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:40510 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMXdIzc HC:40526 VC:000 FC:00 I:00                  

CODE_2AA136:        REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.b $D8                   
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    RTS                         

CODE_2AA143:        JSR.w CODE_2AA153           
                    REP   #$10                  
                    JSR.w CODE_2AA136           
                    LDA.b #$04                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA153:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$04                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA15F:        REP   #$10                  
                    JSR.w CODE_2AA153           
                    JSR.w CODE_2AA136           
                    JSR.w CODE_2AA153           
                    JSR.w CODE_2AA136           
                    JSR.w CODE_2AA153           
                    LDA.b $DA                   
                    BEQ   CODE_2AA176           
                    STA.b $D8                   
CODE_2AA176:        JSR.w CODE_2AA136           
                    LDA.b #$04                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA181:        SEP   #$10                  
                    LDX.b #$40                  
                    LDA.b #$3C                  
                    STA.b $00                   
                    LDA.b #$40                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A974B           
                    LDA.b #$41                  
                    STA.b $00                   
                    LDA.b #$42                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A974B           
                    LDA.b #$43                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    INC.b $00                   
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
CODE_2AA1B2:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AA1C2           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AA219,x)             
                    BRA   CODE_2AA1B2           

CODE_2AA1C2:        LDA.w $1EBF                 
                    CMP.b #$0B                  
                    BEQ   CODE_2AA1CD           
                    CMP.b #$2F                  
                    BNE   CODE_2AA217           
CODE_2AA1CD:        LDA.b #$00                  
                    XBA                         
                    REP   #$10                  
                    LDY.w #$00C0                
                    LDX.w #$00D0                
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$0270                
                    LDX.w #$0280                
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$0420                
                    LDX.w #$0430                
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$05D0                
                    LDX.w #$05E0                
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$0780                
                    LDX.w #$0790                
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
CODE_2AA217:        PLB                         
                    RTL                         


PNTR_2AA219:        dw CODE_2AA221               
                    dw CODE_2AA225               
                    dw CODE_2AA229                 
                    dw CODE_2AA22D


CODE_2AA221:        LDY.b #$00                ;0 S:01FF P:EnvMXdIzc HC:40550 VC:000 FC:00 I:00
                    BRA   CODE_2AA22F         ;0 S:01FF P:EnvMXdIzc HC:40566 VC:000 FC:00 I:00

CODE_2AA225:        LDY.b #$02                ;0 S:01FF P:EnvMXdIzc HC:40582 VC:000 FC:00 I:00                 
                    BRA   CODE_2AA22F           

CODE_2AA229:        LDY.b #$04                  
                    BRA   CODE_2AA22F           

CODE_2AA22D:        LDY.b #$06                  
CODE_2AA22F:        LDA.b #$2A                  
                    STA.b $08                   
                    STA.b $0B                   
                    STA.b $0E                   
                    REP   #$30                  
                    LDA.w $A268,y               
                    STA.b $06                   
                    LDA.w $A270,y               
                    STA.b $09                   
                    LDA.w $A278,y               
                    STA.b $0C                   
                    STZ.b $04                   
                    SEP   #$20                  
                    LDA.w $A260,y               
                    STA.b $0F                   
                    LDX.b $00                   
                    LDY.w #$0000                
                    LDA.b [$0C]                 
                    STA.b $02                   
                    JSR.w CODE_2A8FA7           
                    SEP   #$10                  
                    RTS                         


                    db $07,$00,$06,$00,$04,$00,$05,$00
                    db $80,$A2,$BD,$A2,$CE,$A2,$E4,$A2
                    db $FF,$A2,$0B,$A3,$15,$A3,$1B,$A3
                    db $23,$A3,$2A,$A3,$30,$A3,$34,$A3
                    db $45,$01,$02,$03,$04,$05,$06,$07
                    db $03,$0A,$0B,$0C,$0D,$0E,$0F,$03
                    db $0A,$16,$17,$18,$16,$19,$1A,$1B
                    db $03,$0A,$20,$21,$16,$16,$16,$22
                    db $23,$24,$1B,$03,$29,$2A,$16,$16
                    db $16,$16,$2B,$2C,$2D,$2E,$2F,$1B
                    db $35,$36,$35,$36,$35,$36,$35,$36
                    db $35,$36,$37,$38,$37,$08,$09,$10
                    db $11,$12,$1C,$1D,$12,$25,$26,$12
                    db $30,$26,$12,$39,$3A,$3B,$45,$01
                    db $02,$03,$04,$05,$06,$0F,$03,$31
                    db $0B,$0C,$32,$33,$1B,$36,$35,$36
                    db $35,$36,$37,$38,$13,$14,$15,$1E
                    db $10,$1C,$1F,$12,$10,$1C,$1C,$27
                    db $28,$12,$1C,$1C,$1C,$34,$26,$12
                    db $3D,$3E,$3D,$3E,$3A,$3B,$3F,$0F
                    db $00,$0F,$00,$0F,$00,$0F,$00,$0F
                    db $00,$10,$00,$10,$00,$11,$00,$11
                    db $00,$11,$00,$10,$00,$0F,$00,$0F
                    db $00,$10,$00,$0F,$00,$10,$00,$11
                    db $00,$10,$00,$03,$05,$07,$09,$0B
                    db $0D,$0D,$02,$03,$03,$03,$03,$03
                    db $03,$05,$07,$07,$03,$05,$06,$06
                    db $07

                  
CODE_2AA339:        SEP   #$10                  
                    JSR.w CODE_2AA38B           
                    LDX.b #$40                  
                    LDA.b #$05                  
                    STA.b $00                   
CODE_2AA344:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
CODE_2AA349:        INC   A                     
                    INX                         
                    JSR.w CODE_2A8D25           
                    CMP.b #$0C                  
                    BNE   CODE_2AA349           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA344           
                    REP   #$10                  
                    LDX.w #$0146                
                    LDA.b #$07                  
                    STA.b $00                   
                    JSR.w CODE_2A8CD9           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8CD9           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8CD9           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
CODE_2AA375:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AA385           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AA387,x)             
                    BRA   CODE_2AA375           

CODE_2AA385:        PLB                         
                    RTL                         


PNTR_2AA387:        dw CODE_2AA3E1              
                    dw CODE_2AA40E


CODE_2AA38B:         LDX #$B0
                    LDA.b #$41                ;0 S:01FF P:EnvMXdIzc HC:40606 VC:000 FC:00 I:00
                    STA.b $00                 ;0 S:01FF P:EnvMXdIzc HC:40622 VC:000 FC:00 I:00
                    JSR.w CODE_2A9924         ;0 S:01FF P:EnvMXdIzc HC:40638 VC:000 FC:00 I:00                   
                    LDA.b #$01                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    INC.b $00                   
                    JSR.w CODE_2A9924           
                    INC.b $00                   
                    JSR.w CODE_2A9924           
                    INC.b $00                   
                    JSR.w CODE_2A9924           
CODE_2AA3AA:        JSR.w CODE_2A9930           
                    CPX.b #$50                  
                    BNE   CODE_2AA3AA           
                    LDX.b #$50                  
                    LDA.b #$0D                  
                    STA.b $00                   
                    LDA.b #$0E                  
                    STA.b $01                   
                    LDA.b #$0F                  
                    STA.b $02                   
                    LDA.b #$10                  
                    STA.b $03                   
                    LDA.b #$04                  
                    STA.b $04                   
                    JSR.w CODE_2A975C           
                    LDA.b #$11                  
                    STA.b $00                   
                    LDA.b #$12                  
                    STA.b $01                   
                    LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A974B           
                    LDA.b #$14                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    RTS                         

CODE_2AA3E1:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$3B                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$3E                  
                    JSR.w CODE_2A8CEE           
CODE_2AA3EF:        DEC.b $D8                   
                    BEQ   CODE_2AA400           
                    INX                         
                    LDA.b #$3C                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$3F                  
                    JSR.w CODE_2A8CEE           
                    BRA   CODE_2AA3EF           

CODE_2AA400:        INX                         
                    LDA.b #$3D                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$40                  
                    JSR.w CODE_2A8CEE           
                    SEP   #$10                  
                    RTS                         

CODE_2AA40E:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$35                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$38                  
                    JSR.w CODE_2A8CEE           
CODE_2AA41C:        DEC.b $D8                   
                    BEQ   CODE_2AA43C           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA430           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
CODE_2AA430:        LDA.b #$36                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$39                  
                    JSR.w CODE_2A8CEE           
                    BRA   CODE_2AA41C           

CODE_2AA43C:        INX                         
                    LDA.b #$37                  
                    JSR.w CODE_2A8CD9           
                    LDA.b #$3A                  
                    JSR.w CODE_2A8CEE           
                    SEP   #$10                  
                    RTS                         

CODE_2AA44A:        SEP   #$10                  
                    JSR.w CODE_2AA38B           
                    LDX.b #$50                  
                    LDA.b #$0F                  
                    STA.b $00                   
                    LDA.b #$10                  
                    STA.b $01                   
                    LDA.b #$0D                  
                    STA.b $02                   
                    LDA.b #$0E                  
                    STA.b $03                   
                    LDA.b #$04                  
                    STA.b $04                   
                    JSR.w CODE_2A975C           
CODE_2AA468:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AA478           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AA4F9,x)             
                    BRA   CODE_2AA468           

CODE_2AA478:        LDA.w $0350                 
                    CMP.b #$19                  
                    BNE   CODE_2AA4F7           
                    LDA.b #$00                  
                    XBA                         
                    INC.w $034F                 
                    REP   #$10                  
                    LDY.w #$0000                
                    LDX.w #$00B0                
                    LDA.b #$CF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$01B0                
                    LDX.w #$0260                
                    LDA.b #$CF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
                    LDA.b #$42                  
                    STA.b $00                   
                    LDA.b #$43                  
                    STA.b $01                   
                    REP   #$20                  
                    PHB                         
                    LDY.b #$7F                  
                    PHY                         
                    PLB                         
                    LDY.b #$00                  
                    LDX.b #$00                  
CODE_2AA4B5:        LDA.b $00                   
                    STA.w $D0,x               
                    STA.w $F0,x               
                    STA.w $0110,x               
                    STA.w $0130,x               
                    STA.w $0150,x               
                    STA.w $0170,x               
                    STA.w $0190,x               
                    STA.w $0280,x               
                    STA.w $02A0,x               
                    STA.w $02C0,x               
                    STA.w $02E0,x               
                    STA.w $0300,x               
                    STA.w $0320,x               
                    STA.w $0340,x               
                    INX                         
                    INX                         
                    TXA                         
                    AND.w #$000F                
                    BNE   CODE_2AA4B5           
                    TYA                         
                    BNE   CODE_2AA4F4           
                    INY                         
                    LDA.b $00                   
                    XBA                         
                    STA.b $00                   
                    BRA   CODE_2AA4B5           

CODE_2AA4F4:        PLB                         
                    SEP   #$20                  
CODE_2AA4F7:        PLB                         
                    RTL                         

PNTR_2AA4F9:        dw CODE_2AA3E1              
                    dw CODE_2AA40E
                    dw CODE_2AA505
                    dw CODE_2AA5AB
                    dw CODE_2AA600
                    dw CODE_2AA65A


CODE_2AA505:        REP   #$10                ;0 S:01FF P:EnvMXdIzc HC:41462 VC:000 FC:00 I:00
                    STZ.b $02                 ;0 S:01FF P:EnvMxdIzc HC:41478 VC:000 FC:00 I:00
CODE_2AA509:        LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:41494 VC:000 FC:00 I:00
                    LDA.l $7F0000,x           ;0 S:01FF P:EnvMxdIzc HC:41510 VC:000 FC:00 I:00
                    CMP.b #$04                ;0 S:01FF P:EnvMxdIzc HC:41526 VC:000 FC:00 I:00
                    BNE   CODE_2AA562         ;0 S:01FF P:EnvMxdIzc HC:41542 VC:000 FC:00 I:00
                    LDA.b $02                 ;0 S:01FF P:EnvMxdIzc HC:41558 VC:000 FC:00 I:00
                    STA.b $03                 ;0 S:01FF P:EnvMxdIzc HC:41574 VC:000 FC:00 I:00
                    LDA.b #$16                ;0 S:01FF P:EnvMxdIzc HC:41590 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:41606 VC:000 FC:00 I:00
                    LDA.b $03                 ;0 S:01FF P:EnvMxdIzc HC:41622 VC:000 FC:00 I:00
                    BEQ   CODE_2AA532         ;0 S:01FF P:EnvMxdIzc HC:41638 VC:000 FC:00 I:00
                    INX                       ;               
                    LDA.b #$18                  
                    JSR.w CODE_2A8CD9           
CODE_2AA526:        DEC.b $03                   
                    BEQ   CODE_2AA532           
                    INX                         
                    LDA.b #$1A                  
                    JSR.w CODE_2A8CD9           
                    BRA   CODE_2AA526           

CODE_2AA532:        LDA.b $02                   
                    STA.b $03                   
CODE_2AA536:        LDA.b $03                   
                    BEQ   CODE_2AA54C           
                    DEC.b $03                   
                    BEQ   CODE_2AA546           
                    INX                         
                    LDA.b #$1B                  
                    JSR.w CODE_2A8CD9           
                    BRA   CODE_2AA536           

CODE_2AA546:        INX                         
                    LDA.b #$19                  
                    JSR.w CODE_2A8CD9           
CODE_2AA54C:        INX                         
                    LDA.b #$17                  
                    JSR.w CODE_2A8CD9           
                    INC.b $02                   
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$000F                
                    STA.b $00                   
                    SEP   #$20                  
                    BRA   CODE_2AA509           

CODE_2AA562:        INX                         
CODE_2AA563:        LDA.b #$2D                  
                    STA.b $02                   
CODE_2AA567:        LDA.l $7EFFF0,x             
                    CMP.b #$1B                  
                    BEQ   CODE_2AA57F           
                    LDA.b $02                   
                    JSR.w CODE_2A8CD9           
                    INX                         
                    INC.b $02                   
                    LDA.b $02                   
                    CMP.b #$31                  
                    BEQ   CODE_2AA563           
                    BRA   CODE_2AA567           

CODE_2AA57F:        LDA.b $02                   
                    CLC                         
                    ADC.b #$06                  
                    CMP.b #$35                  
                    BNE   CODE_2AA58A           
                    LDA.b #$31                  
CODE_2AA58A:        STA.b $02                   
CODE_2AA58C:        LDA.l $7EFFF0,x             
                    CMP.b #$04                  
                    BEQ   CODE_2AA5A8           
                    LDA.b $02                   
                    JSR.w CODE_2A8CD9           
                    INX                         
                    INC.b $02                   
                    LDA.b $02                   
                    CMP.b #$35                  
                    BNE   CODE_2AA58C           
                    LDA.b #$31                  
                    STA.b $02                   
                    BRA   CODE_2AA58C           

CODE_2AA5A8:        SEP   #$10                  
                    RTS                         

CODE_2AA5AB:        REP   #$10                  
                    REP   #$20                  
                    LDA.b $DA                   
                    ASL   A                     
                    TAY                         
                    LDA.w $A5EE,y               
                    STA.b $02                   
                    SEP   #$20                  
                    LDX.b $00                   
CODE_2AA5BC:        LDA.b ($02)                 
                    BMI   CODE_2AA5EB           
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    INC.b $02                   
                    SEP   #$20                  
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA5BC           
                    LDA.b $DA                   
                    BNE   CODE_2AA5DF           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
                    BRA   CODE_2AA5BC           

CODE_2AA5DF:        REP   #$20                  
                    TXA                         
                    SEC                         
                    SBC.w #$01C0                
                    TAX                         
                    SEP   #$20                  
                    BRA   CODE_2AA5BC           

CODE_2AA5EB:        SEP   #$10                  
                    RTS                         

     
                    db $F2,$A5,$FB,$A5,$26,$27,$2B,$2C
                    db $09,$0A,$0B,$0C,$FF,$26,$27,$28
                    db $29,$FF
    
          
CODE_2AA600:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$1C                  
                    JSR.w CODE_2A8CD9           
CODE_2AA609:        REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$000F                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    LDA.l $7F0000,x             
                    CMP.b #$19                  
                    BEQ   CODE_2AA651           
                    LDA.b #$1D                  
                    JSR.w CODE_2A8CD9           
CODE_2AA623:        INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA633           
                    REP   #$20                  
                    TXA                         
                    SEC                         
                    SBC.w #$01C0                
                    TAX                         
                    SEP   #$20                  
CODE_2AA633:        LDA.l $7EFFF0,x             
                    CMP.b #$04                  
                    BEQ   CODE_2AA642           
                    LDA.b #$1E                  
                    JSR.w CODE_2A8CD9           
                    BRA   CODE_2AA623           

CODE_2AA642:        LDA.l $7F0000,x             
                    CMP.b #$04                  
                    BNE   CODE_2AA609           
                    LDA.b #$1F                  
                    JSR.w CODE_2A8CD9           
                    BRA   CODE_2AA609           

CODE_2AA651:        INX                         
                    LDA.b #$25                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA65A:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$20                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$21                  
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$000F                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$22                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$23                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$24                  
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0011                
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$2A                  
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA69A:        SEP   #$10                  
                    LDA.w $0727                 
                    CMP.b #$05                  
                    BNE   CODE_2AA6A8           
                    LDA.b #$12                  
                    STA.w $02C5                 
CODE_2AA6A8:        LDX.b #$40                  
                    LDA.b #$28                  
                    STA.b $00                   
CODE_2AA6AE:        JSR.w CODE_2A9930           
                    CPX.b #$80                  
                    BNE   CODE_2AA6AE           
CODE_2AA6B5:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AA6C5           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AA6C7,x)             
                    BRA   CODE_2AA6B5           

CODE_2AA6C5:        PLB                         
                    RTL                         


PNTR_2AA6C7:        dw CODE_2AA6D7
                    dw CODE_2AA755
                    dw CODE_2AA8A5
                    dw CODE_2AA8D5
                    dw CODE_2AA926
                    dw CODE_2AA92C
                    dw CODE_2AA932
                    dw CODE_2AA938


CODE_2AA6D7:        REP   #$10                ;0 S:01FF P:EnvMXdIzc HC:43606 VC:000 FC:00 I:00
                    LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:43622 VC:000 FC:00 I:00
                    LDA.l $7F0000,x           ;0 S:01FF P:EnvMxdIzc HC:43638 VC:000 FC:00 I:00
                    BNE   CODE_2AA6E5         ;0 S:01FF P:EnvMxdIzc HC:43654 VC:000 FC:00 I:00
                    LDA.b #$05                ;0 S:01FF P:EnvMxdIzc HC:43670 VC:000 FC:00 I:00
                    BRA   CODE_2AA6E7         ;0 S:01FF P:EnvMxdIzc HC:43686 VC:000 FC:00 I:00

CODE_2AA6E5:        LDA.b #$0C                ;0 S:01FF P:EnvMxdIzc HC:43702 VC:000 FC:00 I:00
CODE_2AA6E7:        JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:43718 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMxdIzc HC:43734 VC:000 FC:00 I:00
                    TXA                       ;0 S:01FF P:EnvMxdIzc HC:43750 VC:000 FC:00 I:00
                    AND.b #$0F                ;0 S:01FF P:EnvMxdIzc HC:43766 VC:000 FC:00 I:00
                    BNE   CODE_2AA6FA         ;0 S:01FF P:EnvMxdIzc HC:43782 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:43806 VC:000 FC:00 I:00                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
CODE_2AA6FA:        LDA.l $7F0000,x             
                    BNE   CODE_2AA704           
                    LDA.b #$2E                  
                    BRA   CODE_2AA706           

CODE_2AA704:        LDA.b #$0B                  
CODE_2AA706:        JSR.w CODE_2A8CD9           
CODE_2AA709:        REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    DEC.b $D8                   
                    BEQ   CODE_2AA736           
                    LDA.b #$19                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA72F           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
CODE_2AA72F:        LDA.b #$06                  
                    JSR.w CODE_2A8CD9           
                    BRA   CODE_2AA709           

CODE_2AA736:        LDA.b $DA                   
                    BEQ   CODE_2AA747           
                    LDA.b #$1E                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$1F                  
                    JSR.w CODE_2A8CD9           
                    BRA   CODE_2AA752           

CODE_2AA747:        LDA.b #$26                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$27                  
                    JSR.w CODE_2A8CD9           
CODE_2AA752:        SEP   #$10                  
                    RTS                         

CODE_2AA755:        REP   #$10                  
                    LDA.b $D8                   
                    STA.b $DA                   
                    LDX.b $00                   
                    LDY.w #$0001                
                    LDA.b #$19                  
                    STA.b $02                   
                    JSR.w CODE_2AA879           
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    JSR.w CODE_2AA86E           
                    LDY.w #$0007                
                    JSR.w CODE_2AA88F           
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    LDA.b #$13                  
                    STA.b $02                   
                    JSR.w CODE_2AA861           
                    JSR.w CODE_2AA86E           
                    LDA.b #$22                  
                    JSR.w CODE_2A8CD9           
                    LDA.b $D8                   
                    STA.b $DA                   
                    REP   #$20                  
                    INC.b $00                   
                    SEP   #$20                  
                    LDA.b $00                   
                    AND.b #$0F                  
                    BNE   CODE_2AA7AA           
                    REP   #$20                  
                    LDA.b $00                   
                    SEC                         
                    SBC.w #$01C0                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$0E                  
                    BRA   CODE_2AA7B6           

CODE_2AA7AA:        LDX.b $00                   
                    LDA.b #$06                  
                    STA.b $02                   
                    LDY.w #$0002                
                    JSR.w CODE_2AA879           
CODE_2AA7B6:        JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    JSR.w CODE_2AA86E           
                    LDA.b #$08                  
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    LDA.b #$14                  
                    STA.b $02                   
                    JSR.w CODE_2AA861           
                    JSR.w CODE_2AA86E           
                    LDA.b #$23                  
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    INC.b $00                   
                    SEP   #$20                  
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $DA                   
                    LDA.b #$13                  
                    STA.b $02                   
                    LDY.w #$0003                
                    JSR.w CODE_2AA879           
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    JSR.w CODE_2AA86E           
                    LDA.b #$09                  
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    LDA.b #$11                  
                    STA.b $02                   
                    JSR.w CODE_2AA861           
                    JSR.w CODE_2AA86E           
                    LDA.b #$24                  
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    INC.b $00                   
                    SEP   #$20                  
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $DA                   
                    LDA.b #$14                  
                    STA.b $02                   
                    LDY.w #$0004                
                    JSR.w CODE_2AA879           
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    JSR.w CODE_2AA86E           
                    LDA.b #$06                  
                    STA.b $02                   
                    LDY.w #$000A                
                    JSR.w CODE_2AA88F           
                    LDA.l $7F0000,x             
                    CMP.b #$14                  
                    BNE   CODE_2AA83B           
                    LDY.w #$001B                
CODE_2AA83B:        TYA                         
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    LDA.b #$12                  
                    STA.b $02                   
                    JSR.w CODE_2AA861           
                    JSR.w CODE_2AA86E           
                    LDA.b #$25                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.l $7F0000,x             
                    CMP.b #$2A                  
                    BNE   CODE_2AA85E           
                    LDA.b #$2C                  
                    JSR.w CODE_2A8CD9           
CODE_2AA85E:        SEP   #$10                  
                    RTS                         

CODE_2AA861:        JSR.w CODE_2AA86E           
                    LDA.b $02                   
                    JSR.w CODE_2A8CD9           
                    DEC.b $DA                   
                    BNE   CODE_2AA861           
                    RTS                         

CODE_2AA86E:        REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$0010                
                    TAX                         
                    SEP   #$20                  
                    RTS                         

CODE_2AA879:        LDA.l $7F0000,x             
                    BEQ   CODE_2AA88D           
                    CMP.b $02                   
                    BEQ   CODE_2AA888           
                    TYA                         
                    CLC                         
                    ADC.b #$08                  
                    TAY                         
CODE_2AA888:        TYA                         
                    CLC                         
                    ADC.b #$0C                  
                    TAY                         
CODE_2AA88D:        TYA                         
                    RTS                         

CODE_2AA88F:        LDA.l $7F0000,x             
                    BEQ   CODE_2AA8A3           
                    CMP.b $02                   
                    BEQ   CODE_2AA89E           
                    TYA                         
                    CLC                         
                    ADC.b #$02                  
                    TAY                         
CODE_2AA89E:        TYA                         
                    CLC                         
                    ADC.b #$13                  
                    TAY                         
CODE_2AA8A3:        TYA                         
                    RTS                         

CODE_2AA8A5:        REP   #$10                  
                    LDX.b $00                   
                    LDA.l $7EFFFF,x             
                    CMP.b #$25                  
                    BEQ   CODE_2AA8B5           
                    LDA.b #$2A                  
                    BRA   CODE_2AA8B7           

CODE_2AA8B5:        LDA.b #$2C                  
CODE_2AA8B7:        JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.b #$2A                  
                    JSR.w CODE_2A8CD9           
                    INX                         
                    LDA.l $7F0001,x             
                    CMP.b #$22                  
                    BEQ   CODE_2AA8CD           
                    LDA.b #$2A                  
                    BRA   CODE_2AA8CF           

CODE_2AA8CD:        LDA.b #$2B                  
CODE_2AA8CF:        JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA8D5:        REP   #$10                  
                    LDX.b $00                   
                    LDA.l $7F0000,x             
                    CMP.b #$27                  
                    BEQ   CODE_2AA8E9           
                    CMP.b #$28                  
                    BNE   CODE_2AA8EE           
                    LDA.b #$21                  
                    BRA   CODE_2AA8EB           

CODE_2AA8E9:        LDA.b #$29                  
CODE_2AA8EB:        JSR.w CODE_2A8CD9           
CODE_2AA8EE:        INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AA8FE           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$01A0                
                    TAX                         
                    SEP   #$20                  
CODE_2AA8FE:        LDA.b $D8                   
                    BEQ   CODE_2AA916           
                    DEC.b $D8                   
CODE_2AA904:        LDA.l $7F0000,x             
                    CMP.b #$28                  
                    BNE   CODE_2AA911           
                    LDA.b #$2D                  
                    JSR.w CODE_2A8CD9           
CODE_2AA911:        INX                         
                    DEC.b $D8                   
                    BNE   CODE_2AA904           
CODE_2AA916:        LDA.l $7F0000,x             
                    CMP.b #$28                  
                    BNE   CODE_2AA923           
                    LDA.b #$20                  
                    JSR.w CODE_2A8CD9           
CODE_2AA923:        SEP   #$10                  
                    RTS                         

CODE_2AA926:        LDA.b #$2F                  
                    STA.b $02                   
                    BRA   CODE_2AA93C           

CODE_2AA92C:        LDA.b #$30                  
                    STA.b $02                   
                    BRA   CODE_2AA93C           

CODE_2AA932:        LDA.b #$31                  
                    STA.b $02                   
                    BRA   CODE_2AA93C           

CODE_2AA938:        LDA.b #$32                  
                    STA.b $02                   
CODE_2AA93C:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b $02                   
                    JSR.w CODE_2A8CD9           
                    SEP   #$10                  
                    RTS                         

CODE_2AA948:        SEP   #$10                  
CODE_2AA94A:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AA95A           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AA95C,x)             
                    BRA   CODE_2AA94A           

CODE_2AA95A:        PLB                         
                    RTL                         


PNTR_2AA95C:        dw CODE_2AA966                   
                    dw CODE_2AA9B7          
                    dw CODE_2AA9F6                
                    dw CODE_2AAA12                 
                    dw CODE_2AAA57

               
CODE_2AA966:        REP   #$30                  
                    LDA.w #$A9AF                
                    STA.b $02                   
                    LDA.w #$A9B3                
                    STA.b $04                   
                    SEP   #$20                  
                    JSR.w CODE_2AA97A           
                    SEP   #$10                  
                    RTS                         

CODE_2AA97A:        LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:43822 VC:000 FC:00 I:00
CODE_2AA97C:        LDY.w #$0000              ;0 S:01FF P:EnvMxdIzc HC:43838 VC:000 FC:00 I:00
CODE_2AA97F:        LDA.b ($02),y             ;0 S:01FF P:EnvMxdIzc HC:43854 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:43870 VC:000 FC:00 I:00
                    LDA.b ($04),y             ;0 S:01FF P:EnvMxdIzc HC:43886 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMxdIzc HC:43902 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMxdIzc HC:43918 VC:000 FC:00 I:00
                    TXA                       ;0 S:01FF P:EnvMxdIzc HC:43934 VC:000 FC:00 I:00
                    AND.b #$0F                ;0 S:01FF P:EnvMxdIzc HC:43950 VC:000 FC:00 I:00
                    BNE   CODE_2AA9A4         ;0 S:01FF P:EnvMxdIzc HC:43966 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:43990 VC:000 FC:00 I:00
                    TXA                       ;0 S:01FF P:EnvmxdIzc HC:44006 VC:000 FC:00 I:00
                    CMP.w #$01B0              ;0 S:01FF P:EnvmxdIzc HC:44022 VC:000 FC:00 I:00
                    BCS   CODE_2AA99D         ;0 S:01FF P:EnvmxdIzc HC:44038 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:44054 VC:000 FC:00 I:00
                    ADC.w #$01A0              ;0 S:01FF P:EnvmxdIzc HC:44070 VC:000 FC:00 I:00
                    BRA   CODE_2AA9A1         ;0 S:01FF P:EnvmxdIzc HC:44086 VC:000 FC:00 I:00         

CODE_2AA99D:        SEC                         
                    SBC.w #$01C0                
CODE_2AA9A1:        TAX                         
                    SEP   #$20                  
CODE_2AA9A4:        INY                         
                    TYA                         
                    AND.b #$03                  
                    BNE   CODE_2AA97F           
                    DEC.b $D8                   
                    BNE   CODE_2AA97C           
                    RTS                         


                    db $04,$05,$06,$07,$02,$03,$00,$01

                 
CODE_2AA9B7:        REP   #$30                  
                    LDA.w #$A9EE                
                    STA.b $02                   
                    LDA.w #$A9F2                
                    STA.b $04                   
                    SEP   #$20                  
                    JSR.w CODE_2AA9CB           
                    SEP   #$10                  
                    RTS                         

CODE_2AA9CB:        LDY.w #$0000              ;0 S:01FF P:EnvMxdIzc HC:44102 VC:000 FC:00 I:00
CODE_2AA9CE:        LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:44118 VC:000 FC:00 I:00
                    LDA.b ($02),y             ;0 S:01FF P:EnvMxdIzc HC:44134 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:44150 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMxdIzc HC:44166 VC:000 FC:00 I:00
                    LDA.b ($04),y             ;0 S:01FF P:EnvMxdIzc HC:44182 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:44198 VC:000 FC:00 I:00
                    REP   #$20                ;0 S:01FF P:EnvMxdIzc HC:44222 VC:000 FC:00 I:00
                    LDA.b $00                 ;0 S:01FF P:EnvmxdIzc HC:44238 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:44254 VC:000 FC:00 I:00
                    ADC.w #$0010              ;0 S:01FF P:EnvmxdIzc HC:44270 VC:000 FC:00 I:00
                    STA.b $00                 ;0 S:01FF P:EnvmxdIzc HC:44286 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:44310 VC:000 FC:00 I:00
                    INY                       ;0 S:01FF P:EnvMxdIzc HC:44326 VC:000 FC:00 I:00
                    TYA                       ;0 S:01FF P:EnvMxdIzc HC:44342 VC:000 FC:00 I:00
                    AND.b #$03                ;0 S:01FF P:EnvMxdIzc HC:44358 VC:000 FC:00 I:00
                    BNE   CODE_2AA9CE         ;0 S:01FF P:EnvMxdIzc HC:44374 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMxdIzc HC:44390 VC:000 FC:00 I:00                    


                    db $04,$08,$08,$02,$07,$09,$09,$01


CODE_2AA9F6:        REP   #$10                ;0 S:01FF P:EnvMXdIzc HC:44414 VC:000 FC:00 I:00
                    LDX.b $00                 ;0 S:01FF P:EnvMxdIzc HC:44430 VC:000 FC:00 I:00
                    LDA.b #$04                ;0 S:01FF P:EnvMxdIzc HC:44446 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:44462 VC:000 FC:00 I:00
                    LDA.b #$02                ;0 S:01FF P:EnvMxdIzc HC:44478 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMxdIzc HC:44494 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMxdIzc HC:44510 VC:000 FC:00 I:00
                    LDA.b #$07                ;0 S:01FF P:EnvMxdIzc HC:44526 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:44542 VC:000 FC:00 I:00
                    LDA.b #$01                ;0 S:01FF P:EnvMxdIzc HC:44558 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMxdIzc HC:44574 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:44598 VC:000 FC:00 I:00
                    RTS                       ;                       

CODE_2AAA12:        REP   #$30                  
                    LDA.b $D8                   
                    STA.b $DA                   
                    LDA.w #$AA47                
                    STA.b $02                   
                    LDA.w #$AA4B                
                    STA.b $04                   
                    SEP   #$20                  
                    JSR.w CODE_2AA97A           
                    REP   #$20                  
                    LDA.b $DA                   
                    STA.b $D8                   
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0020                
                    STA.b $00                   
                    LDA.w #$AA4F                
                    STA.b $02                   
                    LDA.w #$AA53                
                    STA.b $04                   
                    SEP   #$20                  
                    JSR.w CODE_2AA97A           
                    SEP   #$10                  
                    RTS                         


                    db $04,$05,$06,$07,$0E,$0F,$10,$11
                    db $0E,$0F,$10,$11,$02,$03,$00,$01


CODE_2AAA57:        REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:56726 VC:000 FC:00 I:00
                    LDA.w #$AA87              ;0 S:01FF P:EnvmxdIzc HC:56742 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:56758 VC:000 FC:00 I:00
                    LDA.w #$AA8B              ;0 S:01FF P:EnvmxdIzc HC:56774 VC:000 FC:00 I:00
                    STA.b $04                 ;
                    LDA.b $00                   
                    PHA                         
                    SEP   #$20                  
                    JSR.w CODE_2AA9CB           
                    REP   #$20                  
                    PLA                         
                    INC   A                     
                    INC   A                     
                    STA.b $00                   
                    AND.w #$000F                
                    BNE   CODE_2AAA7F           
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $00                   
CODE_2AAA7F:        SEP   #$20                  
                    JSR.w CODE_2AA9CB           
                    SEP   #$10                  
                    RTS                         


                    db $0A,$0C,$0D,$0A,$0B,$0C,$0D,$0B

                
CODE_2AAA8F:        SEP   #$10                  
                    LDX.b #$10                  
                    LDA.b #$1B                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$1E                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDX.b #$50                  
                    LDA.b #$3B                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
CODE_2AAAB6:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AAAC6           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AAAC8,x)             
                    BRA   CODE_2AAAB6           

CODE_2AAAC6:        PLB                         
                    RTL                         


PNTR_2AAAC8:        dw CODE_2AAACE
                    dw CODE_2AAB8D                      
                    dw CODE_2AABB1   
        
   
CODE_2AAACE:        LDA.b #$2A                  
                    STA.b $08                   
                    STA.b $0B                   
                    STA.b $0E                   
                    REP   #$30                  
                    LDX.b $D8                   
                    LDA.w $AB0D,x               
                    STA.b $06                   
                    LDA.w $AB19,x               
                    STA.b $09                   
                    LDA.w $AB25,x               
                    STA.b $0C                   
                    STZ.b $04                   
                    SEP   #$20                  
                    LDA.w $AB01,x               
                    STA.b $0F                   
                    LDX.b $00                   
                    LDY.w #$0000                
                    LDA.b [$0C]                 
                    STA.b $02                   
                    JSR.w CODE_2A8FA7           
                    SEP   #$10                  
                    RTS                         


                    db $04,$00,$02,$00,$02,$00,$02,$00
                    db $02,$00,$03,$00,$31,$AB,$3E,$AB
                    db $46,$AB,$52,$AB,$56,$AB,$63,$AB
                    db $72,$AB,$78,$AB,$78,$AB,$78,$AB
                    db $78,$AB,$7A,$AB,$7E,$AB,$82,$AB
                    db $84,$AB,$86,$AB,$88,$AB,$8A,$AB
                    db $03,$04,$0C,$0D,$0E,$0C,$12,$16
                    db $10,$11,$17,$1C,$1A,$0F,$03,$04
                    db $06,$18,$0C,$12,$13,$16,$06,$19
                    db $03,$04,$06,$1C,$1D,$1A,$1B,$1C
                    db $1D,$10,$11,$05,$1A,$02,$05,$03
                    db $04,$06,$07,$0B,$0C,$0C,$12,$13
                    db $14,$15,$01,$00,$02,$02,$05,$08
                    db $09,$0A,$0B,$0B,$0C,$0C,$0C,$0C
                    db $0C,$10,$00,$10,$00,$12,$00,$10
                    db $00,$0D,$00,$10,$00,$02,$03,$06
                    db $02,$04,$04,$06,$06,$03,$01,$06
                    db $07,$03,$06,$06
 
                 
CODE_2AAB8D:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b #$2B                  
                    STA.b $02                   
                    LDA.b #$37                  
                    STA.b $03                   
CODE_2AAB99:        LDA.b $02                   
                    JSR.w CODE_2A8CD9           
                    LDA.b $03                   
                    JSR.w CODE_2A8CEE           
                    CMP.b #$3A                  
                    BEQ   CODE_2AABAE           
                    INX                         
                    INC.b $02                   
                    INC.b $03                   
                    BRA   CODE_2AAB99           

CODE_2AABAE:        SEP   #$10                  
                    RTS                         

CODE_2AABB1:        REP   #$10                  
                    LDX.b $00                   
                    LDY.w #$0004                
                    LDA.b #$1F                  
                    STA.b $02                   
                    JSR.w CODE_2AABEA           
                    LDY.w #$0008                
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$000E                
                    STA.b $00                   
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_2AABEA           
                    LDY.w #$0008                
                    LDA.b #$2F                  
                    STA.b $02                   
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_2AABEA           
                    SEP   #$10                  
                    RTS                         

CODE_2AABEA:        LDA.b $02                   
                    JSR.w CODE_2A8CD9           
                    INC.b $02                   
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AAC01           
                    REP   #$20                  
                    TXA                         
                    SEC                         
                    SBC.w #$01C0                
                    TAX                         
                    SEP   #$20                  
CODE_2AAC01:        DEY                         
                    BNE   CODE_2AABEA           
                    RTS                         

CODE_2AAC05:        SEP   #$10                  
                    LDA.b #$00                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    LDX.b #$00                  
                    JSR.w CODE_2AAC59           
                    LDA.b #$04                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    LDX.b #$10                  
                    JSR.w CODE_2AAC59           
                    LDA.b #$08                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    LDX.b #$20                  
                    JSR.w CODE_2AAC59           
                    LDA.b #$0C                  
                    STA.b $00                   
                    INC   A                     
                    STA.b $01                   
                    INC   A                     
                    STA.b $02                   
                    INC   A                     
                    STA.b $03                   
                    LDX.b #$30                  
                    JSR.w CODE_2AAC59           
                    TXA                         
                    CLC                         
                    ADC.b #$30                  
                    TAX                         
                    JSR.w CODE_2AAC8B           
                    PLB                         
                    RTL                         

CODE_2AAC59:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D03           
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $02                   
                    JSR.w CODE_2A8D03           
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D03           
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AAC59           
                    TXA                         
                    CLC                         
                    ADC.b #$30                  
                    TAX                         
                    CPX.b #$B0                  
                    BCC   CODE_2AAC59           
CODE_2AAC8B:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $01                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $02                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b $03                   
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AAC8B           
                    RTS                         

CODE_2AACA9:        SEP   #$10                  
                    LDX.b #$D0                  
                    LDA.b #$1B                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    REP   #$10                  
                    LDY.w #$0000                
                    LDX.w #$00B0                
                    REP   #$20                  
                    LDA.w #$ADA3                
                    STA.b $00                   
                    SEP   #$20                  
                    JSR.w CODE_2AAD96           
                    LDX.w #$00E1                
                    LDA.b #$19                  
                    JSR.w CODE_2A8CD9           
                    LDX.w #$00F8                
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2A8CD9           
                    LDX.w #$0296                
                    JSR.w CODE_2A8CD9           
                    LDX.w #$029A                
                    JSR.w CODE_2A8CD9           
                    INX                         
                    JSR.w CODE_2A8CD9           
                    LDX.w #$02A2                
                    JSR.w CODE_2A8CD9           
                    LDY.w #$0000                
                    LDX.w #$00E5                
CODE_2AAD05:        LDA.w $ADD3,y               
                    JSR.w CODE_2A8CD9           
                    INX                         
                    INY                         
                    CPY.w #$0008                
                    BNE   CODE_2AAD05           
                    LDY.w #$0000                
                    LDX.w #$0260                
                    REP   #$20                  
                    LDA.w #$ADDB                
                    STA.b $00                   
                    SEP   #$20                  
                    JSR.w CODE_2AAD96           
                    LDY.w #$0000                
                    LDX.w #$0291                
CODE_2AAD2A:        LDA.w $AE0B,y               
                    JSR.w CODE_2A8CD9           
                    INX                         
                    INY                         
                    CPY.w #$0004                
                    BNE   CODE_2AAD2A           
                    SEP   #$10                  
                    LDX.b #$30                  
                    LDA.b #$24                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    LDA.b #$2E                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$29                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    LDA.b #$26                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
CODE_2AAD5D:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AAD6D           
                    JSR.w CODE_2A8E54           
                    JSR.w CODE_2AAE0F           
                    BRA   CODE_2AAD5D           

CODE_2AAD6D:        LDA.w $0350                 
                    CMP.b #$1E                  
                    BNE   CODE_2AAD94           
                    LDA.b #$00                  
                    XBA                         
                    REP   #$10                  
                    LDY.w #$0110                
                    LDX.w #$0120                
                    LDA.b #$EF                  
                    MVN.w $7F7F                 
                    LDA.b #$00                  
                    XBA                         
                    LDY.w #$02C0                
                    LDX.w #$02D0                
                    LDA.b #$EF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
CODE_2AAD94:        PLB                         
                    RTL                         

CODE_2AAD96:        LDA.b ($00),y             ;0 S:01FF P:EnvMxdIzc HC:58270 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMxdIzc HC:58286 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMxdIzc HC:58302 VC:000 FC:00 I:00
                    INY                       ;0 S:01FF P:EnvMxdIzc HC:58318 VC:000 FC:00 I:00
                    CPY.w #$0030              ;0 S:01FF P:EnvMxdIzc HC:58334 VC:000 FC:00 I:00
                    BNE   CODE_2AAD96         ;0 S:01FF P:EnvMxdIzc HC:58350 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMxdIzc HC:58366 VC:000 FC:00 I:00


                    db $08,$08,$09,$00,$04,$09,$00,$00
                    db $00,$00,$04,$08,$09,$00,$04,$08
                    db $0F,$10,$11,$01,$0B,$11,$12,$08
                    db $03,$01,$0B,$10,$11,$01,$0B,$10
                    db $17,$0E,$15,$1A,$13,$0E,$0D,$10
                    db $06,$06,$06,$06,$0C,$15,$1A,$1A
                    db $19,$1D,$13,$0E,$0E,$15,$1A,$16
                    db $03,$01,$02,$00,$04,$03,$01,$05
                    db $06,$06,$06,$06,$06,$06,$06,$07
                    db $06,$06,$0A,$01,$0B,$06,$06,$06
                    db $06,$06,$06,$06,$06,$06,$0C,$0E
                    db $13,$0D,$06,$06,$14,$13,$0E,$15
                    db $16,$17,$0E,$0E,$15,$13,$18,$19
                    db $17,$0E,$15,$1C
     
          
CODE_2AAE0F:        REP   #$10                  
                    INC.b $00                   
                    LDX.b $00                   
                    LDY.w #$0000                
CODE_2AAE18:        LDA.w $AE71,y               
                    JSR.w CODE_2A8CD9           
                    JSR.w CODE_2AAE80           
                    CPY.w #$0005                
                    BNE   CODE_2AAE18           
                    INC.b $00                   
                    LDX.b $00                   
                    DEC.b $D8                   
CODE_2AAE2C:        LDY.w #$0000                
CODE_2AAE2F:        LDA.w $AE76,y               
                    JSR.w CODE_2A8CD9           
                    JSR.w CODE_2AAE80           
                    CPY.w #$0005                
                    BNE   CODE_2AAE2F           
                    INC.b $00                   
                    LDA.b $00                   
                    AND.b #$0F                  
                    BNE   CODE_2AAE51           
                    REP   #$20                  
                    LDA.b $00                   
                    SEC                         
                    SBC.w #$01C0                
                    STA.b $00                   
                    SEP   #$20                  
CODE_2AAE51:        SEP   #$20                  
                    LDX.b $00                   
                    DEC.b $D8                   
                    BNE   CODE_2AAE2C           
                    LDY.w #$0000                
CODE_2AAE5C:        LDA.w $AE7B,y               
                    JSR.w CODE_2A8CD9           
                    JSR.w CODE_2AAE80           
                    CPY.w #$0005                
                    BNE   CODE_2AAE5C           
                    INC.b $00                   
                    LDX.b $00                   
                    SEP   #$10                  
                    RTS                         


                    db $1E,$21,$25,$28,$2C,$1E,$22,$26
                    db $29,$26,$1E,$23,$27,$2A,$2D


CODE_2AAE80:        REP   #$20                ;0 S:01FF P:EnvMXdIzc HC:1198 VC:000 FC:00 I:00
                    TXA                       ;0 S:01FF P:EnvmXdIzc HC:1214 VC:000 FC:00 I:00
                    CLC                         
                    ADC.b #$10                  
                    BRK   #$AA                  
                    SEP   #$20                  
                    INY                         
                    RTS                         

CODE_2AAE8C:        SEP   #$10                  
                    LDA.b #$01                  
                    STA.w $02D9                 
                    LDX.b #$00                  
                    LDA.b #$13                  
                    STA.b $00                   
                    LDA.b #$14                  
                    STA.b $01                   
                    LDA.b #$15                  
                    STA.b $02                   
                    LDA.b #$16                  
                    STA.b $03                   
                    LDA.b #$04                  
                    STA.b $04                   
                    JSR.w CODE_2A975C           
                    LDX.b #$10                  
                    LDA.b #$17                  
                    STA.b $00                   
                    LDA.b #$18                  
                    STA.b $01                   
CODE_2AAEB6:        LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A9779           
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    CPX.b #$B0                  
                    BNE   CODE_2AAEB6           
                    LDX.b #$20                  
                    LDA.b #$13                  
                    STA.b $00                   
                    LDA.b #$16                  
                    STA.b $01                   
CODE_2AAED0:        LDA.b #$08                  
                    STA.b $04                   
                    JSR.w CODE_2A9779           
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    CPX.b #$A0                  
                    BNE   CODE_2AAED0           
CODE_2AAEE0:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AAEF0           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AAEF2,x)             
                    BRA   CODE_2AAEE0           

CODE_2AAEF0:        PLB                         
                    RTL                         


PNTR_2AAEF2:        dw CODE_2AAEF6
                    dw CODE_2AAF39


CODE_2AAEF6:        LDX.b $00                 ;0 S:01FF P:EnvMXdIzc HC:1374 VC:000 FC:00 I:00
                    LDA.b #$01                ;0 S:01FF P:EnvMXdIzc HC:1390 VC:000 FC:00 I:00
                    JSR.w CODE_2A8D03         ;0 S:01FF P:EnvMXdIzc HC:1406 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMXdIzc HC:1422 VC:000 FC:00 I:00
                    LDA.b #$02                ;0 S:01FF P:EnvMXdIzc HC:1438 VC:000 FC:00 I:00
                    JSR.w CODE_2A8D03           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$0F                  
                    TAX                         
                    STA.b $00                   
                    STZ.b $01                   
CODE_2AAF0D:        LDA.b #$04                  
                    STA.b $02                   
CODE_2AAF11:        LDY.b $01                   
                    LDA.w $AF2D,y               
                    JSR.w CODE_2A8D03           
                    INX                         
                    INC.b $01                   
                    DEC.b $02                   
                    BNE   CODE_2AAF11           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    STA.b $00                   
                    DEC.b $D8                   
                    BNE   CODE_2AAF0D           
                    RTS                         

     
                    db $05,$06,$07,$08,$0B,$0C,$0D,$0E
                    db $0F,$10,$11,$12
   
           
CODE_2AAF39:        LDX.b $00                   
                    LDA.b #$03                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$04                  
                    JSR.w CODE_2A8D03           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    LDA.b #$09                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$0A                  
                    JSR.w CODE_2A8D03           
                    RTS                         

CODE_2AAF58:        SEP   #$10                  
                    LDX.b #$07                  
CODE_2AAF5C:        LDA.b #$06                  
                    JSR.w CODE_2A8D03           
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    CPX.b #$E0                  
                    BCC   CODE_2AAF5C           
                    LDX.b #$0F                  
CODE_2AAF6C:        LDA.b #$06                  
                    JSR.w CODE_2A8D03           
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    CPX.b #$E0                  
                    BCC   CODE_2AAF6C           
                    LDX.b #$51                  
                    LDA.b #$11                  
                    STA.b $01                   
                    JSR.w CODE_2AAFF4           
                    LDX.b #$59                  
                    LDA.b #$11                  
                    STA.b $01                   
                    JSR.w CODE_2AAFF4           
                    LDX.b #$D1                  
                    LDA.b #$03                  
                    STA.b $01                   
                    JSR.w CODE_2AAFF4           
                    LDX.b #$D9                  
                    LDA.b #$03                  
                    STA.b $01                   
                    JSR.w CODE_2AAFF4           
                    LDX.b #$E0                  
                    LDA.b #$11                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDA.b #$29                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDX.b #$00                  
                    LDA.b #$2A                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDA.b #$2A                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDX.b #$10                  
                    LDA.b #$32                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDA.b #$32                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDX.b #$90                  
                    LDA.b #$11                  
                    STA.b $00                   
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
CODE_2AAFDA:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AAFEA           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AAFEC,x)             
                    BRA   CODE_2AAFDA           

CODE_2AAFEA:        PLB                         
                    RTL                         


PNTR_2AAFEC:        dw CODE_2AB011             
                    dw CODE_2AB064                 
                    dw CODE_2AB08B
                    dw CODE_2AB0DD


CODE_2AAFF4:        LDA.b #$06                ;0 S:01FF P:EnvMXdIzc HC:1502 VC:000 FC:00 I:00
                    STA.b $00                 ;0 S:01FF P:EnvMXdIzc HC:1518 VC:000 FC:00 I:00
                    LDA.b $01                 ;0 S:01FF P:EnvMXdIzc HC:1534 VC:000 FC:00 I:00
CODE_2AAFFA:        JSR.w CODE_2A8D03         ;0 S:01FF P:EnvMXdIzc HC:1550 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMXdIzc HC:1566 VC:000 FC:00 I:00
                    DEC.b $00                 ;0 S:01FF P:EnvMXdIzc HC:1582 VC:000 FC:00 I:00
                    BNE   CODE_2AAFFA         ;0 S:01FF P:EnvMXdIzc HC:1598 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMXdIzc HC:1614 VC:000 FC:00 I:00                     

CODE_2AB003:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INC.b $00                   
                    INX                         
                    TXA                         
                    AND.b #$07                  
                    BNE   CODE_2AB003           
                    RTS                         

CODE_2AB011:        LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $02                   
CODE_2AB017:        LDY.b $DA                   
                    LDA.w $B039,y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AB038           
                    JSR.w CODE_2A8D03           
                    INC.b $DA                   
                    INX                         
                    DEC.b $02                   
                    BNE   CODE_2AB017           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    SEP   #$20                  
                    BRA   CODE_2AB011           

CODE_2AB038:        RTS                         

     
                    db $03,$03,$03,$03,$12,$03,$0D,$13
                    db $08,$05,$02,$14,$07,$05,$04,$07
                    db $02,$01,$08,$09,$0A,$0B,$0C,$08
                    db $0D,$04,$04,$0B,$0E,$01,$07,$0B
                    db $0D,$04,$05,$04,$03,$0F,$02,$01
                    db $10,$01,$FF
  
            
CODE_2AB064:        LDA.b #$15                  
                    STA.b $02                   
CODE_2AB068:        LDA.b $D8                   
                    STA.b $D9                   
                    LDX.b $00                   
CODE_2AB06E:        LDA.b $02                   
                    JSR.w CODE_2A8D03           
                    INC.b $02                   
                    INX                         
                    DEC.b $D9                   
                    BNE   CODE_2AB06E           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $00                   
                    SEP   #$20                  
                    DEC.b $DA                   
                    BNE   CODE_2AB068           
                    RTS                         

CODE_2AB08B:        LDX.b $00                   
                    LDA.b #$3A                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8D25           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$54                  
                    JSR.w CODE_2A8D25           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    TAX                         
                    LDA.b $D8                   
                    STA.b $D9                   
                    LDA.b #$40                  
                    STA.b $02                   
                    JSR.w CODE_2AB12F           
                    INC.b $00                   
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $D9                   
                    INC.b $02                   
                    JSR.w CODE_2AB12F           
                    INC.b $00                   
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $D9                   
                    LDA.b #$54                  
                    STA.b $02                   
                    JSR.w CODE_2AB12F           
                    INC.b $00                   
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $D9                   
                    JSR.w CODE_2AB12F           
                    RTS                         

CODE_2AB0DD:        LDX.b $00                   
                    LDA.b #$54                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$3D                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8D25           
                    INX                         
                    INC   A                     
                    JSR.w CODE_2A8D25           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    TAX                         
                    LDA.b $D8                   
                    STA.b $D9                   
                    LDA.b #$54                  
                    STA.b $02                   
                    JSR.w CODE_2AB12F           
                    INC.b $00                   
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $D9                   
                    JSR.w CODE_2AB12F           
                    INC.b $00                   
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $D9                   
                    LDA.b #$42                  
                    STA.b $02                   
                    JSR.w CODE_2AB12F           
                    INC.b $00                   
                    LDX.b $00                   
                    LDA.b $D8                   
                    STA.b $D9                   
                    INC.b $02                   
                    JSR.w CODE_2AB12F           
                    RTS                         

CODE_2AB12F:        LDA.w $02                 
                    JSR.w CODE_2A8D25           
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    DEC.b $D9                   
                    BNE   CODE_2AB12F           
                    RTS                         

CODE_2AB13F:        SEP   #$10                  
                    LDX.b #$90                  
                    LDA.b #$03                  
                    STA.b $00                   
                    JSR.w CODE_2AB1BD           
                    LDA.b #$07                  
                    STA.b $00                   
                    JSR.w CODE_2AB1BD           
                    LDA.b #$0B                  
                    STA.b $00                   
                    JSR.w CODE_2AB1BD           
CODE_2AB158:        LDA.b #$09                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$0A                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$07                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$08                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AB158           
                    LDA.b #$0F                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9924           
                    JSR.w CODE_2A9930           
                    JSR.w CODE_2A9930           
                    LDA.b #$18                  
                    STA.b $00                   
                    JSR.w CODE_2AB1D8           
                    LDA.b #$1C                  
                    STA.b $00                   
                    JSR.w CODE_2AB1D8           
                    LDA.b #$20                  
                    STA.b $00                   
                    JSR.w CODE_2AB1D8           
                    LDA.b #$24                  
                    STA.b $00                   
                    JSR.w CODE_2AB1D8           
                    LDA.b #$28                  
                    STA.b $00                   
                    JSR.w CODE_2AB1D8           
CODE_2AB1AB:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AB1BB           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AB1F3,x)             
                    BRA   CODE_2AB1AB           

CODE_2AB1BB:        PLB                         
                    RTL                         

CODE_2AB1BD:        LDA.b $00                   
                    JSR.w CODE_2A8D03           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8D03           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8D03           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AB1BD           
                    RTS                         

CODE_2AB1D8:        LDA.b $00                   
                    JSR.w CODE_2A8D25           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8D25           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8D25           
                    INC   A                     
                    INX                         
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AB1D8           
                    RTS                         


PNTR_2AB1F3:        dw CODE_2AB1FF
                    dw CODE_2AB205           
                    dw CODE_2AB241             
                    dw CODE_2AB252               
                    dw CODE_2AB20B
                    dw CODE_2AB211


CODE_2AB1FF:        LDA.b #$01                ;0 S:01FF P:EnvMXdIzc HC:1630 VC:000 FC:00 I:00
                    STA.b $03                 ;0 S:01FF P:EnvMXdIzc HC:1646 VC:000 FC:00 I:00
                    BRA   CODE_2AB215         ;0 S:01FF P:EnvMXdIzc HC:1662 VC:000 FC:00 I:00

CODE_2AB205:        LDA.b #$02                ;0 S:01FF P:EnvMXdIzc HC:1678 VC:000 FC:00 I:00
                    STA.b $03                 ;0 S:01FF P:EnvMXdIzc HC:1694 VC:000 FC:00 I:00
                    BRA   CODE_2AB215         ;0 S:01FF P:EnvMXdIzc HC:1710 VC:000 FC:00 I:00

CODE_2AB20B:        LDA.b #$2C                ;0 S:01FF P:EnvMXdIzc HC:1726 VC:000 FC:00 I:00
                    STA.b $03                 ;0 S:01FF P:EnvMXdIzc HC:1742 VC:000 FC:00 I:00
                    BRA   CODE_2AB215         ;0 S:01FF P:EnvMXdIzc HC:1758 VC:000 FC:00 I:00

CODE_2AB211:        LDA.b #$2D                  
                    STA.b $03                   
CODE_2AB215:        REP   #$10                  
                    LDX.b $00                   
                    LDA.b $03                   
                    JSR.w CODE_2A8CD9           
                    LDA.b $D8                   
                    BEQ   CODE_2AB23E           
                    CLC                         
                    ADC.b $00                   
                    STA.b $00                   
                    LDX.b $00                   
                    LDA.b $03                   
                    JSR.w CODE_2A8CD9           
                    LDA.b $DA                   
                    BEQ   CODE_2AB23E           
                    CLC                         
                    ADC.b $00                   
                    STA.b $00                   
                    LDX.b $00                   
                    LDA.b $03                   
                    JSR.w CODE_2A8CD9           
CODE_2AB23E:        SEP   #$10                  
                    RTS                         

CODE_2AB241:        REP   #$20                  
                    LDA.w #$B2A3                
                    STA.b $03                   
                    INC   A                     
                    INC   A                     
                    INC   A                     
                    INC   A                     
                    STA.b $05                   
                    SEP   #$20                  
                    BRA   CODE_2AB261           

CODE_2AB252:        REP   #$20                  
                    LDA.w #$B2AB                
                    STA.b $03                   
                    INC   A                     
                    INC   A                     
                    INC   A                     
                    INC   A                     
                    STA.b $05                   
                    SEP   #$20                  
CODE_2AB261:        REP   #$10                  
                    LDY.w #$0000                
CODE_2AB266:        LDX.b $00                   
                    LDA.b ($03),y               
                    JSR.w CODE_2A8CD9           
                    LDA.b ($05),y               
                    JSR.w CODE_2A8CEE           
                    INY                         
                    CPY.w #$0004                
                    BEQ   CODE_2AB2A0           
                    INC.b $00                   
                    LDA.b $00                   
                    AND.b #$0F                  
                    BNE   CODE_2AB266           
                    LDA.b $D8                   
                    BNE   CODE_2AB292           
                    REP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $00                   
                    SEP   #$20                  
                    BRA   CODE_2AB266           

CODE_2AB292:        REP   #$20                  
                    LDA.b $00                   
                    SEC                         
                    SBC.w #$01C0                
                    STA.b $00                   
                    SEP   #$20                  
                    BRA   CODE_2AB266           

CODE_2AB2A0:        SEP   #$10                  
                    RTS                         

     
                    db $10,$11,$12,$13,$14,$15,$16,$17
                    db $0D,$0E,$0B,$0C,$07,$08,$09,$0A

                
CODE_2AB2B3:        SEP   #$10                  
                    LDX.b #$F0                  
CODE_2AB2B7:        LDA.b #$12                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$13                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$14                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    LDA.b #$15                  
                    JSR.w CODE_2A8D03           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AB2B7           
                    LDX.b #$00                  
CODE_2AB2D6:        LDA.b #$16                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$17                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$18                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    LDA.b #$19                  
                    JSR.w CODE_2A8D25           
                    INX                         
                    TXA                         
                    AND.b #$0F                  
                    BNE   CODE_2AB2D6           
CODE_2AB2F3:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AB303           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AB305,x)             
                    BRA   CODE_2AB2F3           

CODE_2AB303:        PLB                         
                    RTL                         

     
PNTR_2AB305:        dw CODE_2AA966
      dw CODE_2AA9F6
      dw CODE_2AAA12
      dw CODE_2AAA57
      dw CODE_2AB315
      dw CODE_2AB331
      dw CODE_2AB34D
      dw CODE_2AB369


CODE_2AB315:        REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:1782 VC:000 FC:00 I:00
                    LDA.w #$B329              ;0 S:01FF P:EnvmxdIzc HC:1798 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:1814 VC:000 FC:00 I:00
                    LDA.w #$B32D              ;0 S:01FF P:EnvmxdIzc HC:1830 VC:000 FC:00 I:00
                    STA.b $04                 ;0 S:01FF P:EnvmxdIzc HC:1846 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:1870 VC:000 FC:00 I:00
                    JSR.w CODE_2AA97A         ;0 S:01FF P:EnvMxdIzc HC:1886 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:1910 VC:000 FC:00 I:00
                    RTS                       ;

           
                    db $1A,$1B,$1C,$1D,$1E,$1F,$20,$21


CODE_2AB331:        REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:3710 VC:000 FC:00 I:00
                    LDA.w #$B345              ;0 S:01FF P:EnvmxdIzc HC:3726 VC:000 FC:00 I:00
                    STA.b $02                 ;0 S:01FF P:EnvmxdIzc HC:3742 VC:000 FC:00 I:00
                    LDA.w #$B349              ;0 S:01FF P:EnvmxdIzc HC:3758 VC:000 FC:00 I:00
                    STA.b $04                 ;0 S:01FF P:EnvmxdIzc HC:3774 VC:000 FC:00 I:00
                    SEP   #$20                ;0 S:01FF P:EnvmxdIzc HC:3798 VC:000 FC:00 I:00
                    JSR.w CODE_2AA9CB         ;0 S:01FF P:EnvMxdIzc HC:3814 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMxdIzc HC:3838 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMXdIzc HC:3854 VC:000 FC:00 I:00


                    db $1A,$22,$22,$1E
                    db $1D,$23,$23,$21


CODE_2AB34D:        REP   #$10
                    LDX.b $00
                    LDA.b #$1A
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMXdIzc HC:3982 VC:000 FC:00 I:00
                    LDA.b #$1E                ;0 S:01FF P:EnvMXdIzc HC:3998 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMXdIzc HC:4014 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMXdIzc HC:4030 VC:000 FC:00 I:00
                    LDA.b #$1D                ;0 S:01FF P:EnvMXdIzc HC:4046 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CD9         ;0 S:01FF P:EnvMXdIzc HC:4062 VC:000 FC:00 I:00
                    LDA.b #$21                ;0 S:01FF P:EnvMXdIzc HC:4078 VC:000 FC:00 I:00
                    JSR.w CODE_2A8CEE         ;0 S:01FF P:EnvMXdIzc HC:4094 VC:000 FC:00 I:00
                    SEP   #$10                ;0 S:01FF P:EnvMXdIzc HC:4118 VC:000 FC:00 I:00
                    RTS                       ;

CODE_2AB369:        REP   #$30                 
                    LDA.w #$B399                
                    STA.b $02                   
                    LDA.w #$B39D                
                    STA.b $04                   
                    LDA.b $00                   
                    PHA                         
                    SEP   #$20                  
                    JSR.w CODE_2AA9CB           
                    REP   #$20                  
                    PLA                         
                    INC   A                     
                    INC   A                     
                    STA.b $00                   
                    AND.w #$000F                
                    BNE   CODE_2AB391           
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $00                   
CODE_2AB391:        SEP   #$20                  
                    JSR.w CODE_2AA9CB           
                    SEP   #$10                  
                    RTS                         


                    db $24,$26,$27,$24,$25,$26,$27,$25
   
              
CODE_2AB3A1:        LDA.w $0213                 
                    BEQ   CODE_2AB3B1           
                    LDA.b #$05                  
                    STA.w $0350                 
                    SEP   #$10                  
                    PLB                         
                    JMP.w CODE_2A8DB6           

CODE_2AB3B1:        REP   #$10                  
                    LDA.b #$10                  
                    STA.b $00                   
                    STZ.b $01                   
                    LDA.b #$08                  
                    STA.b $02                   
                    JSR.w CODE_2AB3DF           
                    LDA.b #$01                  
                    STA.b $00                   
                    STZ.b $01                   
                    LDA.b #$08                  
                    STA.b $02                   
                    JSR.w CODE_2AB3DF           
                    LDY.w #$01B0                
                    LDX.w #$0000                
                    LDA.b #$01                  
                    XBA                         
                    LDA.b #$AF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
                    PLB                         
                    RTL                         

CODE_2AB3DF:        LDX.b $00                   
CODE_2AB3E1:        LDA.b #$01                  
                    JSR.w CODE_2A8CD9           
                    REP   #$20                  
                    TXA                         
                    CLC                         
                    ADC.w #$0020                
                    TAX                         
                    SEP   #$20                ;0 S:01FF P:EnvMxdIzc HC:5430 VC:000 FC:00 I:00
                    CPX.w #$01B0              ;0 S:01FF P:EnvMxdIzc HC:5446 VC:000 FC:00 I:00
                    BCC   CODE_2AB3E1         ;0 S:01FF P:EnvMxdIzc HC:5462 VC:000 FC:00 I:00
                    INC.b $00                 ;0 S:01FF P:EnvMxdIzc HC:5478 VC:000 FC:00 I:00
                    INC.b $00                 ;0 S:01FF P:EnvMxdIzc HC:5494 VC:000 FC:00 I:00
                    DEC.b $02                 ;0 S:01FF P:EnvMxdIzc HC:5510 VC:000 FC:00 I:00
                    BNE   CODE_2AB3DF         ;0 S:01FF P:EnvMxdIzc HC:5526 VC:000 FC:00 I:00
                    RTS                       ;

CODE_2AB3FE:        SEP   #$10                  
                    LDX.b #$F0                  
                    LDA.b #$29                  
                    STA.b $00                   
                    JSR.w CODE_2A9924           
                    LDX.b #$00                  
                    LDA.b #$2A                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDA.b #$2A                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDX.b #$10                  
                    LDA.b #$32                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
                    LDA.b #$32                  
                    STA.b $00                   
                    JSR.w CODE_2AB003           
CODE_2AB429:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AB439           
                    JSR.w CODE_2A8E54           
                    JSR.w (PNTR_2AB43B,x)             
                    BRA   CODE_2AB429           

CODE_2AB439:        PLB                         
                    RTL                         

PNTR_2AB43B:        dw CODE_2AB08B
                    dw CODE_2AB0DD
                    dw CODE_2AB441

                  
CODE_2AB441:        LDX.b $00
                    LDY.b $DA
                    LDA   DATA_2AB472,y               
                    JSR.w CODE_2A8D03           
                    INX                         
CODE_2AB44C:        LDY.b $DB                   
                    LDA   DATA_2AB476,y               
                    CMP.b #$FF                  
                    BEQ   CODE_2AB45D           
                    JSR.w CODE_2A8D03           
                    INX                         
                    INC.b $DB                   
                    BRA   CODE_2AB44C           

CODE_2AB45D:        LDA.b #$06                  
                    JSR.w CODE_2A8D03           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    INC.b $DA                   
                    INC.b $DB                   
                    DEC.b $D8                   
                    BNE   CODE_2AB441           
                    RTS                         

DATA_2AB472:        db $01,$07,$08,$0D

DATA_2AB476:        db $44,$45,$46,$47,$05,$FF,$48,$49
                    db $4A,$4B,$01,$FF,$4C,$4D,$4E,$4F
                    db $08,$FF,$50,$51,$52,$53,$01,$FF

CODE_2AB48E:        LDA.w $0350
                    BEQ   CODE_2AB4FD           
                    CMP.b #$12                  
                    BNE   CODE_2AB49E           
                    JSL.l CODE_22E576           
                    JMP.w CODE_2AB4FD           

CODE_2AB49E:        LDA.w $0425                 
                    BNE   CODE_2AB4FE           
                    LDA.w $0212                 
                    STA.w $0249                 
                    LDA.w $0213                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.w $024B                 
CODE_2AB4B3:        JSL.l CODE_2AB5B5           
                    LDA.w $0350                 
                    CMP.b #$02                  
                    BEQ   CODE_2AB4C8           
                    CMP.b #$23                  
                    BEQ   CODE_2AB4C8           
                    JSL.l CODE_29E9A3           
                    BRA   CODE_2AB4CC           

CODE_2AB4C8:        JSL.l CODE_22E2FE           
CODE_2AB4CC:        LDA.w $0249                 
                    CLC                         
                    ADC.w $CE95                 
                    STA.w $0249                 
                    LDA.w $0249                 
                    AND.b #$08                  
                    CMP.w $CE97                 
                    BNE   CODE_2AB4E3           
                    INC.w $024B                 
CODE_2AB4E3:        DEC.w $0612                 
                    BNE   CODE_2AB4B3           
                    LDA.b #$FF                  
                    STA.w $0249                 
                    LDA.w $0350                 
                    CMP.b #$02                  
                    BEQ   CODE_2AB4F8           
                    CMP.b #$23                  
                    BNE   CODE_2AB4FD           
CODE_2AB4F8:        LDA.b #$51                  
                    STA.w $2109                 
CODE_2AB4FD:        RTL                         

CODE_2AB4FE:        STZ.b $25                   
                    LDA.b #$70                  
                    STA.w $0218                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0249                 
                    STZ.w $024B                 
CODE_2AB50E:        JSR.w CODE_2AB67D           
                    JSL.l CODE_29E9F8           
                    LDA.w $0218                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0218                 
                    AND.b #$08                  
                    BNE   CODE_2AB53A           
                    LDA.w $024B                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $024B                 
                    AND.b #$F0                  
                    BNE   CODE_2AB53A           
                    INC.w $024B                 
                    LDA.b #$0F                  
                    AND.w $024B                 
                    STA.w $024B                 
CODE_2AB53A:        DEC.w $0612                 
                    BNE   CODE_2AB50E           
                    STZ.w $0218                 
                    STZ.w $0249                 
                    RTL                         


                    db $10,$BD,$2A,$58,$BE,$2A,$30,$BF
                    db $2A,$30,$C2,$2A,$58,$C0,$2A,$20
                    db $C4,$2A,$E8,$C5,$2A,$00,$C7,$2A
                    db $88,$C8,$2A,$38,$CA,$2A,$D8,$CB
                    db $2A,$08,$CC,$2A,$38,$CE,$2A,$38
                    db $CE,$2A,$58,$D0,$2A,$F0,$D1,$2A
                    db $30,$D3,$2A,$10,$D5,$2A,$10,$D5
                    db $2A,$90,$D5,$2A,$D8,$CB,$2A,$10
                    db $D6,$2A,$88,$D7,$2A,$58,$D0,$2A
                    db $38,$CE,$2A,$58,$C0,$2A,$50,$D8
                    db $2A,$F8,$DA,$2A,$58,$D0,$2A,$10
                    db $D6,$2A,$F0,$D1,$2A,$68,$DC,$2A
                    db $10,$BD,$2A,$50,$D8,$2A,$58,$BE
                    db $2A,$30,$BF,$2A,$10,$BD,$2A
  
               
CODE_2AB5B5:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0249                 
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $C2                   
                    LDA.w $0350                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0350                 
                    TAY                         
                    LDA.w $B545,y               
                    STA.b $08                   
                    REP   #$20                  
                    LDA.w $B543,y               
                    STA.b $06                   
                    SEP   #$20                  
                    LDX.b $25                   
                    LDA.w $024B                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    INC   A                     
                    AND.b #$0F                  
                    TAY                         
                    LDA.b #$7F                  
                    STA.b $0F                   
                    REP   #$20                  
                    STZ.b $0D                   
CODE_2AB5EE:        DEY                         
                    BEQ   CODE_2AB5FB           
                    LDA.b $0D                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $0D                   
                    BRA   CODE_2AB5EE           

CODE_2AB5FB:        LDA.w #$001A                
                    STA.b $00                   
                    LDA.w $024B                 
                    AND.w #$000F                
                    STA.b $09                   
                    REP   #$10                  
                    LDX.w #$0000                
CODE_2AB60D:        LDY.b $09                   
                    LDA.b [$0D],y               
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $C2                   
                    AND.w #$00FF                
                    BEQ   CODE_2AB623           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_2AB623:        LDA.b [$06],y               
                    STA.l $7F2002,x             
                    INY                         
                    INY                         
                    LDA.b [$06],y               
                    STA.l $7F2004,x             
                    LDA.b $09                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $09                   
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_2AB60D           
                    SEP   #$30                  
                    LDX.b $25                   
                    LDA.w $024B                 
                    AND.b #$0F                  
                    ASL   A                     
                    ORA.b $C2                   
                    STA.l $7F2001               
                    LDA.w $024B                 
                    AND.b #$10                  
                    BEQ   CODE_2AB65A           
                    LDA.b #$04                  
CODE_2AB65A:        ORA.b #$10                  
                    STA.l $7F2000               
                    LDA.w $0350                 
                    CMP.b #$02                  
                    BEQ   CODE_2AB66B           
                    CMP.b #$23                  
                    BNE   CODE_2AB67B           
CODE_2AB66B:        REP   #$20                  
                    LDA.l $7F2000               
                    CLC                         
                    ADC.w #$0040                
                    STA.l $7F2000               
                    SEP   #$20                  
CODE_2AB67B:        PLB                         
                    RTL                         

CODE_2AB67D:        REP   #$20                  
                    LDA.w $024B                 
                    AND.w #$00F0                
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w #$1000                
                    STA.l $7F2000               
                    XBA                         
                    STA.l $7F2000               
                    SEP   #$20                  
                    LDA.w $024B                 
                    AND.b #$01                  
                    BEQ   CODE_2AB6A7           
                    LDA.l $7F2000               
                    EOR.b #$08                  
                    STA.l $7F2000               
CODE_2AB6A7:        LDA.w $0218                 
                    AND.b #$08                  
                    BEQ   CODE_2AB6B9           
                    LDA.l $7F2001               
                    CLC                         
                    ADC.b #$20                  
                    STA.l $7F2001               
CODE_2AB6B9:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0350                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0350                 
                    TAY                         
                    LDA.w $B545,y               
                    STA.b $0E                   
                    REP   #$20                  
                    LDA.w $B543,y               
                    STA.b $0C                   
                    STZ.b $D8                   
                    SEP   #$20                  
                    LDA.b #$7F                  
                    STA.b $DA                   
                    LDA.w $024B                 
                    AND.b #$0F                  
                    TAY                         
                    BEQ   CODE_2AB6F0           
CODE_2AB6E1:        REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $D8                   
                    SEP   #$20                  
                    DEY                         
                    BNE   CODE_2AB6E1           
CODE_2AB6F0:        REP   #$20                  
                    LDA.w $024B                 
                    AND.w #$00F0                
                    STA.b $06                   
                    STZ.b $08                   
                    REP   #$10                  
CODE_2AB6FE:        LDY.b $06                   
                    LDA.b [$D8],y               
                    STA.b $0A                   
                    INC.b $06                   
                    LDA.b $0A                   
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDX.b $08                   
                    LDA.w $0218                 
                    AND.w #$0008                
                    BEQ   CODE_2AB71B           
                    INY                         
                    INY                         
CODE_2AB71B:        LDA.b [$0C],y               
                    STA.l $7F2002,x             
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.b [$0C],y               
                    STA.l $7F2004,x             
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    STX.b $08                   
                    CPX.w #$0040                
                    BCC   CODE_2AB6FE           
                    SEP   #$30                  
                    PLB                         
                    RTS                         

CODE_2AB73A:        PHA                         
                    PHX                         
                    PHY                         
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    ORA.w #$2000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.b [$2E],y               
                    SEP   #$10                  
                    PLY                         
                    PLX                         
                    PLA                         
                    RTL                         

CODE_2AB753:        PHX                         
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDA.l $2AB778,x             
                    STA.b $02                   
                    LDY.w $0700                 
                    LDA.b $02                   
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    PLX                         
                    RTL                         

            
                      db $20,$21,$24,$25

CODE_2AB77C:        LDY.w $0700              
                    LDA.b #$23                  
                    STA.b [$2E],y               
                    INY                         
                    STA.b [$2E],y               
                    RTL                         

CODE_2AB787:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b [$2B]                 
                    STA.b $02                   
                    REP   #$20                  
                    STZ.b $DB                   
                    INC.w $002B                 
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    CPX.b #$08                  
                    BEQ   CODE_2AB7C6           
                    LDA.w $B7EF,x               
                    STA.b $03                   
                    LDA.w $B7F9,x               
                    STA.b $DB                   
                    LDY.w $0700                 
CODE_2AB7B6:        LDA.b $03                   
                    STA.b [$D8],y               
                    JSR.w CODE_2A8AD2           
                    DEC.b $02                   
                    BMI   CODE_2AB7ED           
                    JSR.w CODE_2A86F5           
                    BRA   CODE_2AB7B6           

CODE_2AB7C6:        LDY.w $0700                 
                    LDA.b #$22                  
                    STA.b [$2E],y               
                    JSR.w CODE_2A8AD2           
CODE_2AB7D0:        JSL.l CODE_23BEBB           
                    LDA.b [$2E],y               
                    CMP.b #$C2                  
                    BEQ   CODE_2AB7D0           
                    CMP.b #$F5                  
                    BNE   CODE_2AB7ED           
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b #$23                  
                    STA.b [$2E],y               
                    JSR.w CODE_2A8AD2           
CODE_2AB7ED:        PLB                         
                    RTL                         

     
                    db $02,$04,$05,$06,$07,$08,$0B,$0C
                    db $00,$0D,$0F,$11,$11,$0F,$0E,$12
                    db $12,$0E,$00,$01,$00,$00,$13,$14
                    db $00,$00,$00,$17,$18,$19,$00,$00
                    db $00,$00,$00,$00,$00,$00,$15,$16
                    db $00,$00,$00,$1A,$00,$1B,$00,$00
                    db $00,$00,$00,$00,$00,$00,$15,$0E
                    db $14,$00,$00,$1C,$1D,$1E,$00,$00
                    db $00,$00,$00,$00,$00,$00,$15,$0F
                    db $16,$00,$00,$00,$00,$00,$00,$00
                    db $00,$13,$14,$00,$00,$00,$15,$10
                    db $0E,$14,$00,$00,$00,$00,$00,$00
                    db $00,$15,$16,$00,$00,$13,$11,$10
                    db $0F,$16,$00,$00,$00,$00,$00,$00
                    db $13,$11,$16,$00,$00,$11,$12,$12
                    db $13,$00,$00,$17,$18,$19,$00,$00
                    db $00,$00,$00,$00,$00,$14,$15,$15
                    db $16,$00,$00,$1A,$00,$1B,$00,$00
                    db $00,$11,$12,$13,$00,$14,$15,$15
                    db $16,$00,$00,$1C,$1D,$1E,$00,$00
                    db $00,$14,$15,$16,$00,$14,$15,$15
                    db $16,$00,$00,$00,$00,$00,$00,$11
                    db $12,$02,$15,$16,$00,$14,$15,$03
                    db $12,$12,$13,$00,$00,$00,$00,$14
                    db $15,$16,$15,$16,$00,$14,$15,$14
                    db $15,$15,$16,$00,$00,$00,$00,$14
                    db $15,$16,$15,$16,$00,$00,$00,$00
                    db $00,$00,$00,$17,$18,$19,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$1A,$00,$1B,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$1C,$1D,$1E,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $14,$15,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$14
                    db $01,$02,$04,$14,$15,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$14,$01
                    db $01,$02,$03,$01,$02,$04,$00,$00
                    db $14,$15,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$17,$18,$19,$00,$00
                    db $00,$15,$16,$00,$00,$00,$15,$16
                    db $00,$00,$00,$1A,$00,$1B,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$1C,$1D,$1E,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$15,$16
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$04,$05,$05
                    db $06,$00,$00,$17,$18,$19,$00,$00
                    db $00,$00,$00,$00,$00,$07,$08,$08
                    db $09,$00,$00,$1A,$00,$1B,$00,$00
                    db $00,$04,$05,$06,$00,$07,$08,$08
                    db $09,$00,$00,$1C,$1D,$1E,$00,$00
                    db $00,$07,$08,$09,$00,$07,$08,$08
                    db $09,$00,$00,$00,$00,$00,$00,$04
                    db $05,$0A,$08,$09,$00,$07,$08,$0B
                    db $05,$05,$06,$00,$00,$00,$00,$07
                    db $08,$09,$08,$09,$00,$07,$08,$07
                    db $08,$08,$09,$00,$00,$00,$00,$07
                    db $08,$09,$08,$09,$03,$B8,$63,$B8
                    db $C3,$B8,$23,$B9,$83,$B9,$03,$B8
                    db $03,$B8,$01,$04,$09,$0D,$0C,$03
                    db $0E,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$01,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$01,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$01,$00
                    db $00,$00,$00,$00,$01,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$01,$01,$01
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$01,$01,$01
                    db $01,$01,$01,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$01,$01,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$01,$01,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$01,$01
                    db $01,$00,$01,$01,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$01,$01
                    db $01,$00,$01,$01,$01,$01,$00,$00
                    db $00,$00,$00,$00,$01,$01,$01,$01
                    db $01,$00,$01,$01,$01,$01,$01,$01
                    db $00,$00,$00,$00,$01,$01,$01,$01
                    db $01,$00,$01,$01,$01,$01,$01,$01
                    db $00,$00,$00,$00,$01,$01,$01,$01
                    db $01,$F8,$B9,$58,$BA,$B8,$BA,$18
                    db $BB,$78,$BB,$F8,$B9,$F8,$B9,$83
                    db $10,$E0,$10,$0F,$11,$E5,$11,$FD
                    db $11,$6F,$12,$C7,$10,$D5,$10,$B2
                    db $11,$21,$12,$9A,$12,$8B,$10,$9A
                    db $10,$3D,$11,$63,$11,$8B,$11,$37
                    db $12,$68,$12,$08,$00,$07,$00,$07
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$07
                    db $00,$07,$00,$08,$00,$08,$00,$08
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$08
                    db $00,$08,$00,$08,$00,$07,$00,$07
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$07
                    db $00,$07,$00,$08,$00,$08,$00,$08
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$08
                    db $00,$08,$00,$08,$00,$07,$00,$07
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$07
                    db $00,$07,$00,$08,$00,$08,$00,$08
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$08
                    db $00,$08,$00,$08,$00,$07,$00,$07
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$06
                    db $00,$06,$00,$06,$00,$06,$00,$07
                    db $00,$07,$00,$08,$00,$08,$00,$08
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$09
                    db $00,$09,$00,$09,$00,$09,$00,$08
                    db $00,$08,$00,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$76,$09,$67,$09,$77
                    db $09,$56,$09,$5C,$09,$57,$09,$5D
                    db $09,$48,$09,$58,$09,$49,$09,$59
                    db $09,$4C,$09,$5C,$09,$4D,$09,$5D
                    db $09,$56,$09,$5C,$09,$57,$09,$4E
                    db $09,$80,$09,$90,$09,$81,$09,$91
                    db $09,$6A,$09,$7A,$09,$6B,$09,$7B
                    db $09,$4C,$09,$66,$09,$4D,$09,$5D
                    db $09,$4C,$09,$5C,$09,$4D,$09,$4E
                    db $09,$80,$09,$90,$09,$A0,$09,$FF
                    db $00,$4B,$09,$5B,$09,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$4A,$09,$5A
                    db $09,$A1,$09,$FF,$00,$81,$09,$91
                    db $09,$FF,$00,$76,$05,$67,$05,$77
                    db $05,$56,$05,$7C,$05,$57,$05,$7D
                    db $05,$48,$05,$58,$05,$49,$05,$59
                    db $05,$FF,$00,$50,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$43,$05,$53
                    db $05,$68,$05,$78,$05,$6D,$05,$7D
                    db $05,$6C,$05,$7C,$05,$4F,$05,$7D
                    db $05,$6C,$05,$7C,$05,$6D,$05,$7D
                    db $05,$60,$05,$70,$05,$61,$05,$71
                    db $05,$62,$05,$72,$05,$63,$05,$73
                    db $05,$6C,$05,$7C,$05,$46,$05,$47
                    db $05,$42,$05,$52,$05,$44,$05,$54
                    db $05,$45,$05,$55,$05,$41,$05,$51
                    db $05,$6D,$05,$7D,$05,$46,$05,$47
                    db $05,$62,$05,$72,$05,$64,$05,$74
                    db $05,$65,$05,$75,$05,$61,$05,$71
                    db $05,$5E,$09,$6E,$09,$5F,$09,$6F
                    db $09,$7E,$09,$6E,$09,$7F,$09,$6F
                    db $09,$56,$05,$7C,$05,$B1,$05,$7D
                    db $05,$B0,$05,$7C,$05,$57,$05,$7D
                    db $05,$FF,$00,$76,$05,$40,$05,$77
                    db $05,$B0,$05,$7C,$05,$B1,$05,$7D
                    db $05,$4C,$09,$66,$09,$4D,$09,$4E
                    db $09,$FF,$00,$FF,$00,$82,$09,$92
                    db $09,$83,$09,$93,$09,$84,$09,$94
                    db $09,$85,$09,$95,$09,$FF,$00,$FF
                    db $00,$A2,$09,$5C,$09,$A3,$09,$5D
                    db $09,$1C,$05,$1C,$05,$1C,$05,$1C
                    db $05,$00,$09,$10,$09,$01,$09,$11
                    db $09,$04,$09,$13,$49,$05,$09,$15
                    db $09,$02,$09,$11,$09,$03,$09,$11
                    db $09,$13,$09,$11,$09,$11,$09,$11
                    db $09,$11,$09,$11,$09,$13,$49,$11
                    db $09,$11,$09,$11,$09,$11,$09,$11
                    db $09,$20,$09,$30,$09,$21,$09,$11
                    db $09,$22,$09,$11,$09,$23,$09,$11
                    db $09,$24,$09,$13,$49,$25,$09,$35
                    db $09,$26,$09,$36,$09,$11,$09,$37
                    db $09,$06,$09,$16,$09,$11,$09,$11
                    db $09,$08,$0D,$18,$0D,$09,$0D,$19
                    db $0D,$0A,$0D,$1A,$0D,$0B,$0D,$1B
                    db $0D,$28,$0D,$38,$0D,$29,$0D,$39
                    db $0D,$2A,$0D,$3A,$0D,$2B,$0D,$3B
                    db $0D,$FF,$01,$FF,$01,$FF,$01,$FF
                    db $01,$0F,$49,$1F,$49,$1C,$45,$1E
                    db $49,$1C,$45,$1D,$45,$1C,$45,$1C
                    db $45,$2F,$49,$3F,$49,$2E,$49,$3E
                    db $49,$2D,$49,$3D,$49,$1C,$45,$1C
                    db $45,$1C,$45,$1D,$09,$1C,$45,$1E
                    db $09,$0F,$49,$1F,$09,$1C,$45,$1C
                    db $45,$2D,$09,$3D,$09,$2E,$09,$3E
                    db $09,$2F,$09,$3F,$09,$1C,$45,$1C
                    db $45,$1C,$05,$1D,$09,$1C,$05,$1E
                    db $09,$0F,$09,$1F,$09,$1C,$05,$1C
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$60,$09,$70,$09,$61,$09,$71
                    db $09,$45,$09,$45,$09,$45,$09,$45
                    db $09,$62,$09,$72,$09,$63,$09,$73
                    db $09,$40,$09,$50,$09,$41,$09,$51
                    db $09,$49,$09,$59,$09,$4A,$09,$5A
                    db $09,$44,$09,$54,$09,$41,$09,$51
                    db $09,$42,$09,$52,$09,$43,$09,$53
                    db $09,$57,$09,$78,$09,$48,$09,$79
                    db $09,$55,$09,$56,$09,$57,$09,$79
                    db $09,$48,$09,$78,$09,$57,$09,$79
                    db $09,$57,$09,$79,$09,$58,$09,$7A
                    db $09,$47,$09,$77,$09,$48,$09,$78
                    db $09,$57,$09,$78,$09,$4D,$09,$5D
                    db $09,$4E,$09,$5E,$09,$4F,$09,$5F
                    db $09,$55,$09,$56,$09,$48,$09,$79
                    db $09,$68,$09,$78,$09,$69,$09,$79
                    db $09,$46,$09,$56,$09,$69,$09,$79
                    db $09,$75,$09,$64,$09,$66,$09,$4B
                    db $09,$66,$09,$4B,$09,$76,$09,$64
                    db $09,$6D,$09,$7D,$09,$69,$09,$79
                    db $09,$6E,$09,$78,$09,$6F,$09,$79
                    db $09,$74,$09,$65,$09,$4B,$09,$4B
                    db $09,$4B,$09,$4B,$09,$74,$09,$65
                    db $09,$75,$09,$7E,$09,$76,$09,$7F
                    db $09,$66,$09,$7E,$09,$76,$09,$7F
                    db $09,$6D,$09,$78,$09,$69,$09,$79
                    db $09,$69,$09,$79,$09,$6A,$09,$7A
                    db $09,$67,$09,$77,$09,$68,$09,$78
                    db $09,$46,$09,$56,$09,$6A,$09,$7A
                    db $09,$46,$09,$56,$09,$68,$09,$78
                    db $09,$68,$09,$78,$09,$6A,$09,$7A
                    db $09,$60,$09,$70,$09,$63,$09,$73
                    db $09,$75,$09,$64,$09,$66,$09,$FF
                    db $00,$66,$09,$FF,$00,$76,$09,$64
                    db $09,$74,$09,$65,$09,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$74,$09,$65
                    db $09,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$5A,$45,$6A,$45,$59,$45,$69
                    db $45,$4D,$05,$49,$05,$4E,$05,$4A
                    db $45,$4E,$45,$49,$45,$4D,$45,$4A
                    db $05,$4B,$05,$5B,$05,$4C,$05,$5C
                    db $05,$4C,$45,$5C,$45,$4B,$45,$5B
                    db $45,$40,$05,$50,$05,$41,$05,$77
                    db $06,$41,$05,$77,$06,$41,$05,$77
                    db $06,$41,$05,$77,$06,$42,$05,$52
                    db $05,$44,$05,$54,$05,$45,$05,$7C
                    db $06,$45,$05,$7C,$06,$46,$05,$56
                    db $05,$5D,$05,$7F,$06,$5E,$05,$7F
                    db $06,$5E,$45,$7F,$06,$5D,$45,$7F
                    db $06,$50,$05,$50,$05,$77,$06,$77
                    db $06,$77,$06,$77,$06,$77,$06,$77
                    db $06,$44,$09,$54,$09,$45,$09,$7C
                    db $0A,$45,$09,$7C,$0A,$46,$09,$56
                    db $09,$54,$05,$54,$05,$7C,$06,$7C
                    db $06,$7C,$06,$7C,$06,$56,$05,$56
                    db $05,$7F,$06,$7F,$06,$7F,$06,$7F
                    db $06,$54,$09,$54,$09,$7C,$0A,$7C
                    db $0A,$7C,$0A,$7C,$0A,$56,$09,$56
                    db $09,$45,$05,$7C,$06,$45,$05,$7C
                    db $06,$47,$09,$58,$09,$46,$09,$56
                    db $09,$6F,$09,$76,$09,$70,$09,$77
                    db $09,$71,$09,$78,$09,$7F,$06,$73
                    db $09,$46,$05,$56,$05,$57,$09,$58
                    db $09,$74,$09,$7A,$09,$75,$09,$7B
                    db $09,$7C,$06,$7C,$06,$7C,$06,$7C
                    db $06,$47,$09,$58,$09,$45,$09,$7C
                    db $0A,$72,$09,$7F,$0A,$73,$09,$79
                    db $09,$42,$05,$52,$05,$57,$05,$58
                    db $05,$58,$09,$58,$09,$56,$09,$56
                    db $09,$7C,$09,$63,$09,$68,$09,$68
                    db $09,$63,$09,$63,$09,$7D,$09,$68
                    db $09,$56,$05,$56,$05,$58,$09,$58
                    db $09,$63,$09,$63,$09,$7F,$09,$68
                    db $09,$58,$09,$58,$09,$7C,$0A,$7C
                    db $0A,$7E,$09,$63,$09,$68,$09,$68
                    db $09,$52,$05,$52,$05,$58,$05,$58
                    db $05,$63,$09,$51,$09,$68,$09,$55
                    db $09,$63,$09,$4F,$09,$68,$09,$5F
                    db $09,$64,$05,$51,$09,$65,$05,$55
                    db $09,$65,$05,$4F,$09,$65,$05,$5F
                    db $09,$65,$05,$51,$09,$65,$05,$55
                    db $09,$66,$05,$4F,$09,$67,$09,$5F
                    db $09,$65,$09,$51,$09,$66,$09,$55
                    db $09,$64,$05,$4F,$09,$65,$05,$5F
                    db $09,$65,$05,$4F,$09,$66,$05,$5F
                    db $09,$67,$09,$51,$09,$65,$09,$55
                    db $09,$65,$09,$4F,$09,$66,$09,$5F
                    db $09,$60,$05,$4F,$09,$61,$05,$5F
                    db $09,$61,$05,$51,$09,$61,$05,$55
                    db $09,$62,$05,$4F,$09,$67,$05,$5F
                    db $09,$65,$05,$51,$09,$66,$05,$55
                    db $09,$67,$09,$4F,$09,$66,$09,$5F
                    db $09,$6B,$09,$6D,$09,$6C,$09,$6E
                    db $09,$6D,$09,$6B,$09,$6E,$09,$6C
                    db $09,$59,$05,$69,$05,$5A,$05,$6A
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$A1,$09,$A2,$49,$A1,$49,$A2
                    db $09,$A4,$49,$7E,$0A,$A3,$49,$7E
                    db $0A,$A3,$09,$7E,$0A,$A4,$09,$7E
                    db $0A,$A5,$09,$9E,$09,$A6,$09,$9F
                    db $09,$A6,$49,$9F,$49,$A5,$49,$9E
                    db $49,$7A,$0A,$70,$09,$7A,$0A,$71
                    db $09,$7A,$0A,$72,$09,$7A,$0A,$73
                    db $09,$7C,$09,$9A,$09,$7D,$09,$9D
                    db $09,$7E,$09,$8E,$09,$7F,$09,$8F
                    db $09,$77,$06,$77,$06,$77,$06,$77
                    db $06,$40,$05,$50,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$43,$05,$53
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$46,$05,$56,$05,$47,$05,$57
                    db $05,$48,$05,$58,$05,$49,$05,$59
                    db $05,$4A,$05,$5A,$05,$4B,$05,$5B
                    db $05,$4C,$05,$5C,$05,$4D,$05,$5D
                    db $05,$4E,$05,$5E,$05,$4F,$05,$5F
                    db $05,$60,$05,$FF,$00,$61,$05,$FF
                    db $00,$62,$05,$FF,$00,$63,$05,$FF
                    db $00,$64,$05,$74,$05,$65,$05,$75
                    db $05,$66,$05,$76,$05,$67,$05,$77
                    db $05,$68,$05,$78,$05,$69,$05,$79
                    db $05,$6A,$05,$7A,$05,$6B,$05,$7B
                    db $05,$6C,$05,$FF,$00,$6D,$05,$FF
                    db $00,$6E,$05,$FF,$00,$6F,$05,$FF
                    db $00,$FF,$00,$FF,$00,$80,$05,$FF
                    db $00,$81,$05,$91,$05,$82,$05,$92
                    db $05,$83,$05,$93,$05,$84,$05,$94
                    db $05,$85,$05,$FF,$00,$FF,$00,$FF
                    db $00,$86,$05,$96,$05,$87,$05,$97
                    db $05,$88,$05,$98,$05,$89,$05,$99
                    db $05,$8A,$05,$FF,$00,$8B,$05,$9B
                    db $05,$8C,$05,$9C,$05,$8D,$05,$FF
                    db $00,$FF,$00,$FF,$00,$90,$05,$90
                    db $85,$95,$05,$95,$85,$FF,$00,$FF
                    db $00,$FF,$00,$8A,$85,$9B,$85,$8B
                    db $85,$9C,$85,$8C,$85,$FF,$00,$8D
                    db $85,$96,$85,$86,$85,$97,$85,$87
                    db $85,$98,$85,$88,$85,$99,$85,$89
                    db $85,$FF,$00,$FF,$00,$FF,$00,$80
                    db $85,$91,$85,$81,$85,$92,$85,$82
                    db $85,$93,$85,$83,$85,$94,$85,$84
                    db $85,$FF,$00,$85,$85,$FF,$00,$FF
                    db $00,$FF,$00,$60,$85,$FF,$00,$61
                    db $85,$FF,$00,$62,$85,$FF,$00,$63
                    db $85,$74,$85,$64,$85,$75,$85,$65
                    db $85,$76,$85,$66,$85,$77,$85,$67
                    db $85,$78,$85,$68,$85,$79,$85,$69
                    db $85,$7A,$85,$6A,$85,$7B,$85,$6B
                    db $85,$FF,$00,$6C,$85,$FF,$00,$6D
                    db $85,$FF,$00,$6E,$85,$FF,$00,$6F
                    db $85,$58,$85,$48,$85,$59,$85,$49
                    db $85,$5A,$85,$4A,$85,$5B,$85,$4B
                    db $85,$5C,$85,$4C,$85,$5D,$85,$4D
                    db $85,$5E,$85,$4E,$85,$5F,$85,$4F
                    db $85,$50,$85,$40,$85,$51,$85,$41
                    db $85,$52,$85,$42,$85,$53,$85,$43
                    db $85,$54,$85,$44,$85,$55,$85,$45
                    db $85,$56,$85,$46,$85,$57,$85,$47
                    db $85,$FF,$00,$A0,$09,$FF,$00,$A0
                    db $09,$40,$05,$40,$05,$40,$05,$40
                    db $05,$40,$05,$A1,$05,$40,$05,$A1
                    db $05,$A2,$05,$A2,$05,$A3,$05,$A3
                    db $05,$84,$05,$94,$05,$85,$05,$95
                    db $05,$86,$05,$96,$05,$87,$05,$97
                    db $05,$40,$05,$40,$05,$40,$05,$9C
                    db $05,$40,$05,$9F,$05,$40,$05,$9F
                    db $45,$40,$05,$9C,$45,$40,$05,$40
                    db $05,$A4,$05,$88,$05,$A5,$05,$89
                    db $05,$A6,$05,$8A,$05,$A7,$05,$8B
                    db $05,$40,$05,$40,$05,$AC,$05,$BC
                    db $05,$9D,$05,$AD,$05,$9E,$05,$AE
                    db $05,$AC,$45,$BC,$45,$40,$05,$40
                    db $05,$98,$05,$A8,$05,$99,$05,$A9
                    db $05,$9A,$05,$AA,$05,$9B,$05,$AB
                    db $05,$BD,$05,$40,$05,$BE,$05,$40
                    db $05,$B8,$05,$B4,$05,$B9,$05,$B5
                    db $05,$BA,$05,$B6,$05,$BB,$05,$B7
                    db $05,$82,$05,$8C,$05,$83,$05,$8D
                    db $05,$B0,$05,$8E,$05,$B1,$05,$8F
                    db $05,$40,$05,$45,$05,$40,$05,$46
                    db $05,$40,$05,$45,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$63,$05,$55
                    db $05,$A2,$05,$45,$05,$A3,$05,$46
                    db $05,$47,$05,$57,$05,$48,$05,$58
                    db $05,$40,$05,$40,$05,$61,$05,$71
                    db $05,$62,$05,$72,$05,$64,$05,$74
                    db $05,$92,$05,$A2,$05,$93,$05,$A3
                    db $05,$40,$05,$76,$05,$40,$05,$76
                    db $05,$67,$05,$77,$05,$68,$05,$75
                    db $05,$40,$05,$76,$05,$43,$05,$53
                    db $05,$44,$05,$54,$05,$56,$05,$75
                    db $05,$A2,$05,$B2,$05,$A3,$05,$B3
                    db $05,$50,$05,$60,$05,$50,$05,$60
                    db $05,$66,$05,$65,$05,$66,$05,$65
                    db $05,$65,$05,$49,$05,$65,$05,$4A
                    db $05,$65,$05,$4B,$05,$65,$05,$65
                    db $05,$59,$05,$69,$05,$5A,$05,$6A
                    db $05,$65,$05,$65,$05,$65,$05,$4D
                    db $05,$65,$05,$4E,$05,$65,$05,$4F
                    db $05,$65,$05,$65,$05,$65,$05,$65
                    db $05,$65,$05,$5F,$05,$65,$05,$5F
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$5B,$05,$FF,$00,$5C,$05,$6C
                    db $05,$5D,$05,$6D,$05,$5E,$05,$FF
                    db $00,$FF,$00,$FF,$00,$7C,$05,$FF
                    db $00,$4C,$05,$79,$05,$4C,$05,$7A
                    db $05,$7D,$05,$FF,$00,$FF,$00,$FF
                    db $00,$6B,$05,$6B,$05,$7B,$05,$7B
                    db $05,$FF,$00,$FF,$00,$FF,$00,$6E
                    db $05,$6B,$05,$6F,$05,$7B,$05,$7E
                    db $05,$FF,$00,$7F,$05,$FF,$00,$FF
                    db $00,$81,$05,$65,$05,$81,$05,$A0
                    db $05,$80,$05,$91,$05,$80,$05,$90
                    db $05,$80,$05,$90,$05,$81,$05,$65
                    db $05,$81,$05,$65,$05,$81,$05,$65
                    db $05,$80,$05,$91,$05,$80,$05,$91
                    db $05,$FD,$08,$FD,$08,$FD,$08,$FD
                    db $08,$FD,$08,$B0,$09,$FD,$08,$B1
                    db $09,$FD,$08,$B8,$09,$FD,$08,$B9
                    db $09,$FD,$08,$B0,$09,$FD,$08,$BB
                    db $09,$FD,$08,$BC,$09,$FD,$08,$BD
                    db $09,$40,$09,$50,$09,$41,$09,$51
                    db $09,$48,$09,$42,$09,$49,$09,$43
                    db $09,$4A,$09,$44,$09,$4B,$09,$45
                    db $09,$4C,$09,$46,$09,$4D,$09,$47
                    db $09,$51,$09,$50,$09,$50,$09,$51
                    db $09,$B2,$09,$42,$09,$B3,$09,$43
                    db $09,$54,$09,$44,$09,$51,$09,$45
                    db $09,$B3,$49,$46,$09,$B7,$09,$47
                    db $09,$52,$09,$42,$09,$53,$09,$43
                    db $09,$56,$09,$46,$09,$57,$09,$47
                    db $09,$51,$09,$AA,$09,$50,$09,$67
                    db $09,$51,$09,$66,$09,$50,$09,$AB
                    db $09,$51,$09,$AA,$09,$50,$09,$AB
                    db $09,$52,$09,$58,$09,$53,$09,$59
                    db $09,$54,$09,$5A,$09,$51,$09,$5B
                    db $09,$56,$09,$5C,$09,$57,$09,$5D
                    db $09,$AC,$09,$AE,$09,$77,$09,$AF
                    db $09,$51,$09,$BE,$09,$50,$09,$BF
                    db $09,$76,$09,$AE,$09,$AD,$09,$AF
                    db $09,$AC,$09,$B6,$09,$AD,$09,$A9
                    db $09,$AC,$09,$AE,$09,$AD,$09,$AF
                    db $09,$6C,$09,$7C,$09,$68,$09,$78
                    db $09,$4E,$09,$5E,$09,$4F,$09,$5F
                    db $09,$63,$09,$6A,$09,$6A,$09,$63
                    db $09,$60,$09,$70,$09,$61,$09,$71
                    db $09,$62,$09,$72,$09,$63,$09,$73
                    db $09,$64,$09,$74,$09,$65,$09,$75
                    db $09,$6B,$09,$7B,$09,$6D,$09,$7D
                    db $09,$6E,$09,$7E,$09,$6F,$09,$7F
                    db $09,$6C,$09,$7C,$09,$6D,$09,$7D
                    db $09,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$59,$09,$62,$09,$59,$09,$62
                    db $09,$6B,$09,$74,$09,$6B,$09,$74
                    db $09,$7F,$09,$8B,$09,$7F,$09,$8B
                    db $09,$FE,$04,$FE,$04,$FE,$04,$FE
                    db $04,$FE,$04,$41,$05,$FE,$04,$42
                    db $05,$FE,$04,$43,$05,$FE,$04,$44
                    db $05,$FE,$04,$FE,$04,$FE,$04,$4A
                    db $05,$45,$05,$4B,$05,$46,$05,$4C
                    db $05,$47,$05,$4D,$05,$48,$05,$4E
                    db $05,$FE,$04,$4F,$05,$FE,$04,$FE
                    db $04,$51,$05,$5A,$05,$52,$05,$5B
                    db $05,$53,$05,$5C,$05,$54,$05,$5D
                    db $05,$55,$05,$5E,$05,$56,$05,$5F
                    db $05,$57,$05,$60,$05,$58,$05,$61
                    db $05,$51,$05,$5A,$05,$FE,$04,$7E
                    db $05,$FE,$04,$7E,$49,$FE,$04,$7D
                    db $49,$FE,$04,$7D,$09,$FE,$04,$7E
                    db $09,$FE,$04,$8A,$05,$58,$05,$61
                    db $05,$63,$05,$6C,$05,$64,$05,$6D
                    db $05,$65,$05,$6E,$05,$66,$05,$6F
                    db $05,$67,$05,$70,$05,$68,$05,$71
                    db $05,$69,$05,$72,$05,$6A,$05,$73
                    db $05,$94,$05,$9A,$05,$95,$05,$9B
                    db $05,$89,$49,$7A,$0A,$88,$49,$91
                    db $49,$88,$09,$91,$09,$89,$09,$7A
                    db $0A,$92,$05,$98,$05,$93,$05,$99
                    db $05,$75,$05,$80,$05,$76,$05,$81
                    db $05,$77,$05,$82,$05,$78,$05,$83
                    db $05,$79,$05,$84,$05,$7A,$05,$85
                    db $05,$7B,$05,$86,$05,$7C,$05,$87
                    db $05,$A0,$05,$80,$05,$A1,$05,$81
                    db $05,$7A,$0A,$9D,$49,$97,$49,$9C
                    db $49,$97,$09,$9C,$09,$7A,$0A,$9D
                    db $09,$9E,$05,$86,$05,$9F,$05,$87
                    db $05,$8C,$05,$8C,$05,$A3,$05,$40
                    db $45,$A5,$05,$40,$05,$8D,$05,$8D
                    db $05,$8E,$05,$8E,$05,$A3,$05,$40
                    db $45,$A5,$05,$40,$05,$90,$05,$8C
                    db $45,$A3,$45,$40,$05,$A2,$49,$A4
                    db $49,$A2,$09,$A4,$09,$A3,$09,$40
                    db $45,$8C,$05,$96,$09,$40,$45,$96
                    db $49,$40,$05,$96,$09,$8F,$05,$96
                    db $49,$8E,$05,$96,$09,$40,$45,$96
                    db $49,$40,$05,$96,$09,$8C,$45,$96
                    db $49,$40,$05,$96,$09,$A4,$49,$96
                    db $49,$A4,$09,$96,$09,$40,$45,$96
                    db $49,$7F,$0A,$7F,$0A,$7F,$0A,$7F
                    db $0A,$FF,$00,$50,$09,$FF,$00,$50
                    db $09,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$42,$05,$52,$05,$43,$05,$53
                    db $05,$70,$05,$80,$05,$71,$05,$81
                    db $05,$70,$05,$70,$05,$71,$05,$71
                    db $05,$60,$05,$40,$05,$61,$05,$41
                    db $05,$62,$05,$42,$05,$63,$05,$43
                    db $05,$4D,$05,$5D,$05,$4E,$05,$5E
                    db $05,$73,$05,$83,$05,$73,$05,$83
                    db $05,$73,$05,$83,$05,$72,$05,$82
                    db $05,$6F,$05,$7F,$05,$71,$05,$71
                    db $05,$44,$05,$54,$05,$44,$05,$54
                    db $05,$4B,$05,$5B,$05,$41,$05,$41
                    db $05,$42,$05,$42,$05,$4C,$05,$5C
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$46,$05,$56,$05,$44,$05,$54
                    db $05,$45,$05,$55,$05,$46,$05,$56
                    db $05,$6D,$05,$54,$05,$6E,$05,$54
                    db $05,$64,$05,$74,$05,$64,$05,$74
                    db $05,$6B,$05,$7B,$05,$41,$05,$41
                    db $05,$42,$05,$42,$05,$6C,$05,$7C
                    db $05,$64,$05,$74,$05,$65,$05,$75
                    db $05,$66,$05,$76,$05,$64,$05,$74
                    db $05,$65,$05,$75,$05,$66,$05,$76
                    db $05,$64,$05,$7D,$05,$64,$05,$7E
                    db $05,$88,$05,$90,$05,$89,$05,$41
                    db $05,$8A,$05,$42,$05,$64,$05,$91
                    db $05,$72,$05,$82,$05,$73,$05,$83
                    db $05,$69,$05,$79,$05,$41,$05,$41
                    db $05,$42,$05,$42,$05,$6A,$05,$7A
                    db $05,$67,$05,$77,$05,$68,$05,$78
                    db $05,$86,$05,$84,$05,$87,$05,$85
                    db $05,$80,$05,$70,$05,$81,$05,$71
                    db $05,$40,$05,$40,$05,$41,$05,$41
                    db $05,$42,$05,$42,$05,$43,$05,$43
                    db $05,$8C,$05,$9C,$05,$8D,$05,$9D
                    db $05,$8D,$45,$9D,$45,$8F,$05,$9F
                    db $05,$A0,$05,$98,$05,$41,$05,$99
                    db $05,$42,$05,$9A,$05,$A1,$05,$9B
                    db $05,$64,$05,$74,$05,$65,$05,$75
                    db $05,$A2,$05,$94,$05,$A3,$05,$8E
                    db $05,$A3,$45,$8E,$45,$9E,$05,$8B
                    db $05,$66,$05,$76,$05,$64,$05,$74
                    db $05,$A8,$05,$EC,$04,$64,$05,$74
                    db $05,$ED,$04,$EE,$04,$FF,$00,$FF
                    db $00,$73,$05,$84,$05,$73,$05,$85
                    db $05,$92,$05,$96,$05,$93,$05,$54
                    db $05,$A0,$05,$54,$05,$95,$05,$97
                    db $05,$A6,$05,$42,$05,$64,$05,$91
                    db $05,$64,$05,$A4,$05,$A7,$05,$A5
                    db $05,$6F,$05,$7F,$05,$4F,$05,$5F
                    db $05,$86,$05,$83,$05,$87,$05,$83
                    db $05,$50,$05,$60,$05,$51,$05,$61
                    db $05,$52,$05,$62,$05,$53,$05,$63
                    db $05,$40,$05,$50,$05,$41,$05,$51
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$B8,$09,$B8,$09,$B8,$09,$B8
                    db $09,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$86,$05,$80,$05,$87
                    db $05,$81,$05,$52,$05,$82,$05,$53
                    db $05,$83,$05,$54,$05,$84,$05,$55
                    db $05,$85,$05,$88,$05,$FF,$00,$89
                    db $05,$8A,$05,$8C,$05,$61,$05,$71
                    db $05,$62,$05,$72,$05,$63,$05,$73
                    db $05,$64,$05,$74,$05,$65,$05,$75
                    db $05,$66,$05,$76,$05,$8B,$05,$8D
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$46,$05,$56,$05,$47,$05,$57
                    db $05,$40,$05,$5C,$05,$4D,$05,$5D
                    db $05,$4E,$05,$5E,$05,$4F,$05,$5F
                    db $05,$66,$05,$76,$05,$67,$05,$77
                    db $05,$5C,$85,$40,$85,$5D,$85,$4D
                    db $85,$5E,$85,$4E,$85,$5F,$85,$4F
                    db $85,$48,$05,$58,$05,$49,$05,$59
                    db $05,$4A,$05,$5A,$05,$47,$05,$5B
                    db $05,$40,$05,$50,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$43,$05,$53
                    db $05,$9D,$05,$54,$05,$9E,$05,$55
                    db $05,$9B,$05,$52,$05,$9C,$05,$53
                    db $05,$58,$85,$48,$85,$59,$85,$49
                    db $85,$5A,$85,$4A,$85,$5B,$85,$47
                    db $85,$60,$05,$70,$05,$61,$05,$71
                    db $05,$66,$05,$76,$05,$AD,$05,$BD
                    db $05,$AC,$05,$BC,$05,$61,$05,$71
                    db $05,$FF,$00,$6E,$05,$68,$05,$6F
                    db $05,$69,$05,$52,$05,$6A,$05,$53
                    db $05,$6B,$05,$54,$05,$6C,$05,$55
                    db $05,$6D,$05,$78,$05,$FF,$00,$79
                    db $05,$7A,$05,$7B,$05,$61,$05,$71
                    db $05,$66,$05,$76,$05,$7C,$05,$7D
                    db $05,$90,$09,$97,$09,$90,$09,$97
                    db $09,$98,$09,$99,$09,$98,$09,$99
                    db $09,$B8,$09,$A0,$09,$91,$09,$A1
                    db $09,$92,$09,$A2,$09,$93,$09,$A3
                    db $09,$94,$09,$A4,$09,$95,$09,$A5
                    db $09,$96,$09,$A6,$09,$B8,$09,$A7
                    db $09,$B8,$09,$86,$05,$80,$05,$87
                    db $05,$85,$05,$88,$05,$B8,$09,$89
                    db $05,$B0,$09,$B9,$09,$B1,$09,$FD
                    db $08,$B2,$09,$FD,$08,$B3,$09,$8F
                    db $09,$B3,$49,$8F,$49,$B5,$09,$AE
                    db $09,$B6,$09,$AF,$09,$B7,$09,$B4
                    db $09,$FD,$08,$FD,$08,$FD,$08,$FD
                    db $08,$FD,$08,$FD,$08,$AE,$09,$AE
                    db $09,$7E,$09,$7E,$09,$7F,$09,$7F
                    db $09,$9F,$05,$AA,$05,$FD,$08,$AB
                    db $05,$FD,$08,$A8,$05,$9A,$05,$A9
                    db $05,$70,$05,$74,$05,$71,$05,$75
                    db $05,$72,$05,$76,$05,$73,$05,$77
                    db $05,$78,$05,$7C,$05,$79,$05,$7D
                    db $05,$7A,$05,$7E,$05,$7B,$05,$7F
                    db $05,$67,$05,$69,$05,$68,$05,$6A
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$41,$05,$7C,$06,$42,$05,$44
                    db $05,$43,$05,$45,$05,$FF,$00,$4B
                    db $05,$FF,$00,$49,$05,$49,$05,$4A
                    db $05,$4A,$05,$7C,$06,$7C,$06,$58
                    db $05,$7C,$06,$51,$05,$7C,$06,$7C
                    db $06,$47,$05,$7C,$06,$48,$05,$46
                    db $05,$4B,$05,$48,$05,$FF,$00,$4B
                    db $05,$FF,$00,$40,$09,$FF,$00,$41
                    db $09,$FF,$00,$42,$09,$FF,$00,$43
                    db $09,$4A,$05,$7C,$06,$7C,$06,$7C
                    db $06,$7C,$06,$57,$05,$7C,$06,$7C
                    db $06,$57,$05,$7C,$06,$7C,$06,$7C
                    db $06,$7C,$06,$52,$05,$47,$05,$7C
                    db $06,$55,$05,$46,$05,$48,$05,$7B
                    db $06,$4B,$05,$48,$05,$49,$09,$4C
                    db $05,$4A,$09,$7C,$0A,$7C,$0A,$7C
                    db $0A,$44,$09,$7C,$0A,$45,$09,$47
                    db $09,$4B,$09,$48,$09,$FF,$00,$4B
                    db $09,$FF,$00,$49,$09,$40,$09,$4A
                    db $09,$41,$09,$7C,$0A,$42,$09,$44
                    db $09,$43,$09,$45,$09,$FF,$00,$4B
                    db $09,$7C,$06,$7C,$06,$7C,$06,$7C
                    db $06,$58,$05,$7C,$06,$7C,$06,$7C
                    db $06,$7C,$06,$7C,$06,$7C,$06,$50
                    db $05,$47,$05,$7C,$06,$7B,$06,$46
                    db $05,$54,$05,$7B,$06,$48,$05,$7B
                    db $06,$4D,$05,$48,$05,$7C,$0A,$4D
                    db $05,$7C,$0A,$7C,$0A,$7C,$0A,$7C
                    db $0A,$46,$09,$47,$09,$48,$09,$7B
                    db $0A,$FF,$00,$49,$09,$49,$09,$4A
                    db $09,$47,$09,$7C,$0A,$48,$09,$46
                    db $09,$7C,$06,$7C,$06,$50,$05,$7C
                    db $06,$7C,$06,$7C,$06,$7C,$06,$51
                    db $05,$51,$05,$7C,$06,$47,$05,$7C
                    db $06,$7B,$06,$46,$05,$7B,$06,$7B
                    db $06,$7B,$06,$53,$05,$48,$05,$7B
                    db $06,$7C,$0A,$7C,$0A,$46,$09,$47
                    db $09,$7B,$0A,$7B,$0A,$48,$09,$7B
                    db $0A,$7C,$0A,$7C,$0A,$47,$09,$7C
                    db $0A,$7B,$0A,$46,$09,$48,$09,$7B
                    db $0A,$4A,$05,$7C,$06,$7C,$06,$50
                    db $05,$7C,$06,$7C,$06,$57,$05,$7C
                    db $06,$7C,$06,$7C,$06,$56,$05,$7C
                    db $06,$7C,$06,$7C,$06,$7C,$06,$52
                    db $05,$47,$05,$7C,$06,$55,$05,$46
                    db $05,$7B,$06,$7B,$06,$7B,$06,$7B
                    db $06,$7B,$06,$7B,$06,$48,$05,$53
                    db $05,$46,$09,$47,$09,$7B,$0A,$7B
                    db $0A,$4A,$05,$7C,$06,$52,$05,$7C
                    db $06,$7C,$06,$50,$05,$47,$05,$7C
                    db $06,$7B,$06,$46,$05,$48,$05,$54
                    db $05,$47,$09,$7C,$0A,$7B,$0A,$46
                    db $09,$59,$05,$66,$09,$5A,$05,$67
                    db $09,$5B,$05,$68,$09,$5C,$05,$69
                    db $09,$5D,$05,$66,$09,$5E,$05,$67
                    db $09,$60,$05,$68,$09,$61,$05,$69
                    db $09,$5B,$09,$68,$09,$61,$09,$69
                    db $09,$5D,$09,$66,$09,$5E,$09,$67
                    db $09,$60,$09,$68,$09,$61,$09,$69
                    db $09,$62,$05,$66,$09,$63,$05,$67
                    db $09,$59,$09,$66,$09,$5A,$09,$67
                    db $09,$5B,$09,$68,$09,$5C,$09,$69
                    db $09,$62,$09,$66,$09,$63,$09,$67
                    db $09,$64,$09,$68,$09,$65,$09,$69
                    db $09,$6A,$09,$6E,$09,$6B,$09,$6F
                    db $09,$6C,$09,$6E,$09,$6D,$09,$6F
                    db $09,$70,$09,$4E,$05,$71,$09,$4F
                    db $05,$5F,$05,$5F,$05,$5F,$05,$5F
                    db $05,$FF,$00,$49,$05,$40,$05,$4A
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$8D,$09,$8E,$09,$8D,$09,$8E
                    db $09,$8F,$09,$98,$09,$8F,$09,$98
                    db $09,$99,$09,$9A,$09,$99,$09,$9A
                    db $09,$FC,$08,$FC,$08,$FC,$08,$FC
                    db $08,$FC,$08,$50,$09,$FC,$08,$51
                    db $09,$FC,$08,$52,$09,$40,$09,$53
                    db $09,$41,$09,$54,$09,$42,$09,$55
                    db $09,$43,$09,$56,$09,$44,$09,$57
                    db $09,$45,$09,$58,$09,$46,$09,$59
                    db $09,$47,$09,$5A,$09,$48,$09,$5B
                    db $09,$49,$09,$5C,$09,$FC,$08,$5D
                    db $09,$FC,$08,$5E,$09,$FC,$08,$5F
                    db $09,$60,$09,$70,$09,$61,$09,$71
                    db $09,$62,$09,$72,$09,$63,$09,$73
                    db $09,$64,$09,$74,$09,$65,$09,$75
                    db $09,$66,$09,$76,$09,$67,$09,$77
                    db $09,$4A,$09,$8A,$05,$4B,$09,$8B
                    db $05,$4C,$09,$88,$05,$4D,$09,$89
                    db $05,$4C,$09,$8A,$05,$4D,$09,$8B
                    db $05,$68,$05,$78,$05,$69,$05,$79
                    db $05,$79,$C5,$78,$C5,$78,$C5,$79
                    db $C5,$FC,$08,$4E,$05,$4E,$05,$6A
                    db $05,$4F,$05,$6B,$05,$FC,$08,$4F
                    db $05,$6A,$05,$7A,$05,$7A,$05,$7A
                    db $05,$7B,$05,$7B,$05,$6B,$05,$7B
                    db $05,$7A,$05,$7A,$05,$7A,$05,$7A
                    db $05,$7B,$05,$7B,$05,$7B,$05,$7B
                    db $05,$FC,$08,$6F,$05,$FC,$08,$6F
                    db $45,$FC,$08,$6F,$05,$6F,$05,$FC
                    db $04,$FC,$04,$FC,$04,$FC,$04,$FC
                    db $04,$6F,$45,$FC,$04,$FC,$08,$6F
                    db $45,$FC,$08,$6E,$45,$6E,$45,$7E
                    db $06,$6E,$05,$7E,$06,$FC,$08,$6E
                    db $05,$6F,$45,$FC,$04,$6E,$45,$7D
                    db $45,$7E,$06,$7E,$06,$7E,$06,$7E
                    db $06,$7E,$06,$6C,$05,$6C,$05,$7E
                    db $05,$6D,$05,$6B,$05,$FC,$04,$6D
                    db $05,$FC,$04,$50,$05,$FC,$04,$51
                    db $05,$FC,$04,$52,$05,$40,$05,$53
                    db $05,$49,$05,$5C,$05,$FC,$04,$5D
                    db $05,$FC,$04,$5E,$05,$FC,$04,$5F
                    db $05,$7D,$45,$7C,$05,$6C,$05,$6A
                    db $05,$41,$05,$54,$09,$42,$05,$55
                    db $09,$43,$05,$56,$09,$44,$05,$57
                    db $09,$90,$05,$70,$09,$91,$05,$71
                    db $09,$92,$05,$72,$09,$93,$05,$73
                    db $09,$94,$05,$74,$09,$95,$05,$75
                    db $09,$96,$05,$76,$09,$67,$05,$77
                    db $09,$84,$05,$74,$09,$85,$05,$75
                    db $09,$86,$05,$76,$09,$67,$05,$77
                    db $09,$80,$05,$70,$09,$81,$05,$71
                    db $09,$82,$05,$72,$09,$83,$05,$73
                    db $09,$FF,$00,$9C,$09,$9B,$09,$9D
                    db $09,$9B,$49,$9D,$49,$9B,$09,$9D
                    db $09,$9B,$49,$9D,$49,$FF,$00,$9C
                    db $49,$9E,$09,$FF,$00,$9F,$09,$A0
                    db $09,$9F,$49,$A0,$49,$9F,$09,$A0
                    db $09,$9F,$49,$A0,$49,$9E,$49,$FF
                    db $00,$FF,$00,$A2,$09,$A1,$09,$A3
                    db $09,$A1,$49,$A3,$49,$A1,$09,$A3
                    db $09,$A1,$49,$A3,$49,$FF,$00,$A2
                    db $49,$A4,$09,$FF,$00,$A5,$09,$FF
                    db $00,$A5,$49,$FF,$00,$A5,$09,$FF
                    db $00,$A5,$49,$FF,$00,$A4,$49,$FF
                    db $00,$FF,$00,$8C,$09,$FF,$00,$8C
                    db $09,$A6,$05,$AA,$05,$A7,$05,$AB
                    db $05,$A8,$05,$AC,$05,$A9,$05,$AD
                    db $05,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$50,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$43,$05,$53
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$46,$05,$56,$05,$FF,$00,$57
                    db $05,$88,$05,$8C,$05,$89,$05,$8D
                    db $05,$92,$05,$92,$05,$93,$05,$93
                    db $05,$48,$05,$58,$05,$49,$05,$59
                    db $05,$4A,$05,$5A,$05,$4B,$05,$5B
                    db $05,$4C,$05,$5C,$05,$4D,$05,$5D
                    db $05,$4E,$05,$5E,$05,$4F,$05,$5F
                    db $05,$84,$05,$8E,$05,$85,$05,$87
                    db $05,$82,$05,$86,$05,$83,$05,$8D
                    db $05,$90,$05,$7A,$05,$74,$05,$7B
                    db $05,$75,$05,$52,$05,$76,$05,$53
                    db $05,$63,$05,$54,$05,$64,$05,$55
                    db $05,$65,$05,$70,$05,$6B,$05,$71
                    db $05,$6C,$05,$6C,$85,$6D,$05,$6D
                    db $85,$6E,$05,$6E,$85,$6F,$05,$6F
                    db $85,$68,$05,$68,$85,$69,$05,$69
                    db $85,$6A,$05,$6A,$85,$6B,$05,$6B
                    db $85,$6C,$05,$66,$05,$60,$05,$67
                    db $05,$61,$05,$52,$05,$62,$05,$53
                    db $05,$77,$05,$54,$05,$78,$05,$55
                    db $05,$79,$05,$7C,$05,$93,$05,$7D
                    db $05,$90,$05,$90,$05,$91,$05,$91
                    db $05,$7E,$05,$7F,$05,$49,$05,$59
                    db $05,$4E,$05,$5E,$05,$40,$05,$47
                    db $05,$72,$05,$73,$05,$49,$05,$59
                    db $05,$4E,$05,$5E,$05,$80,$05,$81
                    db $05,$90,$05,$9C,$05,$91,$05,$9D
                    db $05,$92,$05,$9E,$05,$93,$05,$9F
                    db $05,$FC,$04,$A0,$05,$FC,$04,$FC
                    db $04,$FC,$04,$FC,$04,$FC,$04,$A0
                    db $45,$68,$05,$94,$05,$69,$05,$95
                    db $05,$6A,$05,$96,$05,$6B,$05,$97
                    db $05,$6C,$05,$98,$05,$6D,$05,$99
                    db $05,$6E,$05,$9A,$05,$6F,$05,$9B
                    db $05,$9C,$05,$FC,$04,$9D,$05,$FC
                    db $04,$9E,$05,$FC,$04,$9F,$05,$FC
                    db $04,$FC,$04,$FC,$04,$FC,$04,$FC
                    db $04,$9E,$05,$FC,$04,$9F,$05,$A0
                    db $45,$A0,$45,$FC,$04,$A0,$05,$FC
                    db $04,$A0,$45,$FC,$04,$A0,$05,$A0
                    db $45,$A0,$45,$A0,$05,$A0,$05,$FC
                    db $04,$FC,$04,$A0,$05,$FC,$04,$A0
                    db $45,$8A,$05,$8E,$05,$8B,$05,$8F
                    db $05,$A2,$09,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$A2,$09,$FF
                    db $00,$FF,$00,$A3,$09,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$A4
                    db $09,$4C,$09,$5C,$09,$4D,$09,$5D
                    db $09,$4E,$09,$5E,$09,$4F,$09,$5F
                    db $09,$48,$09,$58,$09,$49,$09,$59
                    db $09,$4A,$09,$5A,$09,$4B,$09,$5B
                    db $09,$40,$09,$50,$09,$41,$09,$51
                    db $09,$42,$09,$52,$09,$43,$09,$53
                    db $09,$44,$09,$54,$09,$45,$09,$55
                    db $09,$46,$09,$56,$09,$47,$09,$57
                    db $09,$50,$09,$48,$09,$51,$09,$49
                    db $09,$56,$09,$4E,$09,$57,$09,$4F
                    db $09,$40,$09,$58,$09,$41,$09,$59
                    db $09,$46,$09,$5E,$09,$47,$09,$5F
                    db $09,$60,$09,$61,$09,$60,$09,$61
                    db $09,$61,$89,$60,$89,$61,$89,$60
                    db $89,$48,$09,$50,$09,$49,$09,$51
                    db $09,$4A,$09,$52,$09,$4B,$09,$53
                    db $09,$4C,$09,$54,$09,$4D,$09,$55
                    db $09,$4E,$09,$56,$09,$4F,$09,$57
                    db $09,$40,$09,$62,$09,$41,$09,$63
                    db $09,$42,$09,$64,$09,$43,$09,$65
                    db $09,$44,$09,$66,$09,$45,$09,$67
                    db $09,$46,$09,$68,$09,$47,$09,$69
                    db $09,$6A,$09,$58,$05,$6B,$09,$59
                    db $05,$6C,$09,$5A,$05,$6D,$09,$5B
                    db $05,$6E,$09,$5C,$05,$6F,$09,$5D
                    db $05,$70,$09,$5E,$05,$71,$09,$5F
                    db $05,$40,$05,$50,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$43,$05,$53
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$46,$05,$56,$05,$47,$05,$57
                    db $05,$48,$05,$58,$05,$49,$05,$59
                    db $05,$4A,$05,$5A,$05,$4B,$05,$5B
                    db $05,$4C,$05,$5C,$05,$4D,$05,$5D
                    db $05,$4E,$05,$5E,$05,$4F,$05,$5F
                    db $05,$50,$05,$48,$05,$51,$05,$49
                    db $05,$56,$05,$4E,$05,$57,$05,$4F
                    db $05,$40,$05,$58,$05,$41,$05,$59
                    db $05,$46,$05,$5E,$05,$47,$05,$5F
                    db $05,$60,$05,$61,$05,$60,$05,$61
                    db $05,$61,$85,$60,$85,$61,$85,$60
                    db $85,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$4B,$45,$FF,$00,$45
                    db $45,$FF,$00,$43,$45,$FF,$00,$42
                    db $45,$45,$05,$4C,$05,$4B,$05,$4D
                    db $05,$FF,$00,$4E,$05,$FF,$00,$4F
                    db $05,$61,$05,$41,$45,$62,$05,$41
                    db $05,$FF,$00,$61,$05,$FF,$00,$62
                    db $05,$FF,$00,$45,$05,$FF,$00,$4B
                    db $05,$4F,$45,$41,$45,$4E,$45,$7E
                    db $06,$4D,$45,$7E,$06,$4C,$45,$7E
                    db $06,$51,$05,$7E,$06,$52,$05,$41
                    db $05,$44,$45,$41,$45,$7E,$06,$7E
                    db $06,$7E,$06,$7E,$06,$7E,$06,$7E
                    db $06,$7E,$06,$7E,$06,$41,$05,$41
                    db $85,$53,$45,$5C,$45,$FF,$00,$FF
                    db $00,$FF,$00,$52,$45,$FF,$00,$51
                    db $45,$FF,$00,$4F,$45,$FF,$00,$4E
                    db $45,$4B,$45,$4D,$45,$45,$45,$4C
                    db $45,$7E,$06,$7E,$06,$41,$05,$7E
                    db $06,$41,$45,$7E,$06,$41,$05,$7E
                    db $06,$4C,$05,$7E,$06,$4D,$05,$7E
                    db $06,$4E,$05,$7E,$06,$4F,$05,$41
                    db $05,$42,$05,$7E,$06,$43,$05,$44
                    db $05,$52,$45,$41,$45,$51,$45,$7E
                    db $06,$41,$45,$7E,$06,$7E,$06,$7E
                    db $06,$FF,$00,$52,$45,$FF,$00,$51
                    db $45,$41,$45,$A7,$05,$7E,$06,$A7
                    db $05,$7E,$06,$A7,$05,$7E,$06,$A7
                    db $05,$7E,$06,$A7,$05,$41,$05,$A7
                    db $05,$41,$45,$A7,$05,$41,$05,$A7
                    db $05,$40,$05,$50,$05,$40,$05,$50
                    db $05,$40,$05,$54,$05,$40,$05,$55
                    db $05,$46,$05,$56,$05,$47,$05,$57
                    db $05,$48,$05,$58,$05,$49,$05,$59
                    db $05,$4A,$05,$5A,$05,$40,$05,$5B
                    db $05,$60,$05,$70,$05,$60,$05,$71
                    db $05,$60,$05,$72,$05,$63,$05,$73
                    db $05,$64,$05,$74,$05,$65,$05,$75
                    db $05,$66,$05,$76,$05,$67,$05,$77
                    db $05,$68,$05,$78,$05,$69,$05,$79
                    db $05,$6A,$05,$7A,$05,$6B,$05,$7B
                    db $05,$6C,$05,$7C,$05,$60,$05,$7D
                    db $05,$60,$05,$7E,$05,$60,$05,$7F
                    db $05,$60,$05,$5D,$05,$60,$05,$5E
                    db $05,$60,$05,$5F,$05,$60,$05,$98
                    db $05,$60,$05,$99,$05,$60,$05,$9B
                    db $05,$60,$05,$A0,$05,$60,$05,$A1
                    db $05,$80,$05,$90,$05,$81,$05,$91
                    db $05,$82,$05,$92,$05,$83,$05,$93
                    db $05,$84,$05,$94,$05,$85,$05,$95
                    db $05,$86,$05,$96,$05,$87,$05,$97
                    db $05,$88,$05,$FC,$04,$89,$05,$FC
                    db $04,$8A,$05,$9A,$05,$8B,$05,$FC
                    db $04,$8C,$05,$9C,$05,$8D,$05,$9D
                    db $05,$8E,$05,$9E,$05,$8F,$05,$9F
                    db $05,$6D,$05,$90,$05,$6E,$05,$91
                    db $05,$6F,$05,$92,$05,$A2,$05,$93
                    db $05,$A3,$05,$94,$05,$A4,$05,$95
                    db $05,$A5,$05,$95,$05,$A6,$05,$95
                    db $05,$FC,$04,$FC,$04,$FC,$04,$FC
                    db $04,$64,$09,$6C,$09,$65,$09,$6D
                    db $09,$4A,$49,$7C,$0A,$68,$09,$43
                    db $49,$69,$09,$42,$49,$4D,$49,$7D
                    db $0A,$66,$09,$6E,$09,$67,$09,$6F
                    db $09,$5B,$49,$6A,$09,$7C,$0A,$6B
                    db $09,$4E,$09,$5E,$09,$4F,$09,$5F
                    db $09,$60,$09,$70,$09,$61,$09,$71
                    db $09,$7D,$0A,$62,$09,$46,$49,$63
                    db $09,$4C,$09,$46,$09,$4D,$09,$7D
                    db $0A,$5C,$09,$47,$09,$48,$09,$58
                    db $09,$49,$09,$59,$09,$5D,$09,$5A
                    db $09,$4A,$09,$7C,$0A,$4B,$09,$5B
                    db $09,$40,$09,$50,$09,$41,$09,$51
                    db $09,$7D,$0A,$52,$09,$42,$09,$53
                    db $09,$43,$09,$54,$09,$7C,$0A,$55
                    db $09,$44,$09,$56,$09,$45,$09,$57
                    db $09,$40,$09,$50,$09,$41,$09,$51
                    db $09,$42,$09,$52,$09,$43,$09,$53
                    db $09,$44,$09,$54,$09,$45,$09,$55
                    db $09,$46,$09,$56,$09,$47,$09,$57
                    db $09,$60,$09,$70,$09,$61,$09,$71
                    db $09,$62,$09,$72,$09,$63,$09,$73
                    db $09,$64,$09,$74,$09,$65,$09,$75
                    db $09,$66,$09,$76,$09,$67,$09,$77
                    db $09,$48,$09,$58,$09,$49,$09,$59
                    db $09,$4A,$09,$5A,$09,$4B,$09,$5B
                    db $09,$4C,$09,$5C,$09,$4D,$09,$5D
                    db $09,$4E,$09,$5E,$09,$4F,$09,$5F
                    db $09,$68,$09,$78,$09,$69,$09,$79
                    db $09,$6A,$09,$7A,$09,$6B,$09,$7B
                    db $09,$6C,$09,$7C,$09,$6D,$09,$7D
                    db $09,$6E,$09,$7E,$09,$6F,$09,$7F
                    db $09,$FD,$08,$FD,$08,$FD,$08,$FD
                    db $08,$62,$49,$64,$09,$62,$09,$64
                    db $49,$62,$49,$6C,$09,$FD,$08,$FD
                    db $08,$FD,$08,$67,$49,$62,$09,$66
                    db $49,$FD,$08,$FD,$08,$FD,$08,$62
                    db $09,$6E,$49,$FE,$08,$6D,$49,$FE
                    db $08,$FE,$08,$FE,$08,$FE,$08,$FE
                    db $08,$6C,$09,$6D,$09,$FD,$08,$6E
                    db $09,$FD,$08,$62,$49,$FD,$08,$62
                    db $09,$FD,$08,$62,$49,$FD,$08,$FD
                    db $08,$ED,$09,$FE,$08,$6E,$09,$FE
                    db $08,$67,$49,$FE,$08,$66,$49,$FE
                    db $08,$FE,$08,$FE,$08,$FE,$08,$63
                    db $09,$FE,$08,$63,$49,$FE,$08,$FE
                    db $08,$FE,$08,$63,$49,$FE,$08,$63
                    db $09,$64,$09,$63,$49,$64,$49,$FE
                    db $08,$64,$09,$FE,$08,$64,$49,$FE
                    db $08,$66,$09,$FE,$08,$67,$09,$FE
                    db $08,$62,$49,$66,$09,$FD,$08,$67
                    db $09,$63,$49,$6A,$09,$FE,$08,$6B
                    db $09,$FE,$08,$FE,$08,$63,$09,$6F
                    db $49,$FE,$08,$6B,$49,$63,$09,$6A
                    db $49,$6B,$49,$FF,$00,$6A,$49,$FF
                    db $00,$6F,$09,$72,$09,$FE,$08,$73
                    db $09,$FE,$08,$73,$49,$6F,$49,$72
                    db $49,$68,$09,$FF,$00,$68,$49,$FF
                    db $00,$63,$49,$68,$09,$63,$09,$68
                    db $49,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$73,$49,$FF,$00,$72,$49,$FF
                    db $00,$6A,$09,$FF,$00,$6B,$09,$FF
                    db $00,$FF,$00,$40,$05,$FF,$00,$41
                    db $05,$FF,$00,$74,$45,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$74
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$50,$05,$43,$05,$51,$05,$42
                    db $05,$46,$05,$56,$05,$47,$05,$57
                    db $05,$5D,$05,$5C,$05,$5C,$05,$5D
                    db $05,$48,$05,$58,$05,$75,$05,$76
                    db $05,$53,$05,$42,$05,$52,$05,$43
                    db $05,$49,$45,$59,$45,$5A,$05,$5B
                    db $05,$4A,$05,$54,$05,$4B,$05,$55
                    db $05,$52,$05,$43,$05,$53,$05,$42
                    db $05,$4C,$05,$56,$05,$4D,$05,$57
                    db $05,$5D,$05,$CC,$04,$5C,$05,$CD
                    db $04,$C2,$04,$C3,$04,$75,$05,$43
                    db $05,$49,$45,$42,$05,$C0,$04,$C1
                    db $04,$CC,$04,$CE,$04,$CD,$04,$CF
                    db $04,$4C,$09,$4C,$09,$4C,$09,$4C
                    db $09,$4C,$09,$4C,$09,$4C,$09,$5B
                    db $09,$4C,$09,$5B,$49,$4C,$09,$4C
                    db $09,$4C,$09,$4C,$09,$5B,$09,$4D
                    db $09,$5B,$49,$4D,$49,$4C,$09,$4C
                    db $09,$4C,$09,$40,$09,$4C,$09,$41
                    db $09,$4C,$09,$42,$09,$4D,$09,$43
                    db $09,$4D,$49,$43,$49,$4C,$09,$42
                    db $49,$4C,$09,$41,$49,$4C,$09,$40
                    db $49,$4C,$09,$41,$49,$5C,$09,$40
                    db $49,$5C,$49,$40,$09,$4C,$09,$41
                    db $09,$50,$09,$44,$09,$51,$09,$45
                    db $09,$52,$09,$46,$09,$53,$09,$47
                    db $09,$53,$49,$47,$49,$52,$49,$46
                    db $49,$51,$49,$45,$49,$50,$49,$44
                    db $49,$54,$09,$48,$09,$55,$09,$49
                    db $09,$56,$09,$4A,$09,$57,$09,$4B
                    db $09,$57,$49,$4B,$49,$56,$49,$4A
                    db $49,$55,$49,$49,$49,$54,$49,$48
                    db $49,$5E,$09,$60,$09,$5F,$09,$5E
                    db $09,$58,$09,$5E,$49,$59,$09,$60
                    db $49,$59,$49,$60,$09,$58,$49,$5E
                    db $09,$5F,$49,$5E,$49,$5E,$49,$60
                    db $49,$5D,$09,$4E,$09,$4E,$09,$4F
                    db $09,$4E,$49,$4F,$49,$5D,$49,$4E
                    db $49,$76,$45,$86,$45,$75,$45,$85
                    db $45,$B4,$05,$B7,$05,$B5,$05,$B4
                    db $05,$B4,$05,$B5,$05,$B5,$05,$B6
                    db $05,$B6,$05,$B7,$05,$B7,$05,$B6
                    db $05,$B4,$05,$B5,$05,$B5,$05,$B4
                    db $05,$B6,$05,$B5,$05,$B7,$05,$B4
                    db $05,$75,$05,$85,$05,$76,$05,$86
                    db $05,$40,$05,$B5,$05,$41,$05,$B4
                    db $05,$B4,$05,$41,$05,$B5,$05,$B4
                    db $05,$B6,$05,$B5,$05,$B7,$05,$40
                    db $05,$40,$05,$41,$05,$41,$05,$B4
                    db $05,$B4,$05,$B5,$05,$B5,$05,$40
                    db $05,$B4,$05,$41,$05,$B5,$05,$40
                    db $05,$B6,$05,$41,$05,$B7,$05,$B4
                    db $05,$B4,$05,$41,$05,$B5,$05,$B6
                    db $05,$40,$05,$B7,$05,$41,$05,$B4
                    db $05,$B6,$05,$B5,$05,$B7,$05,$B6
                    db $05,$95,$05,$A5,$05,$96,$05,$A6
                    db $05,$40,$05,$B7,$05,$41,$05,$B6
                    db $05,$40,$05,$B5,$05,$41,$05,$40
                    db $05,$B6,$05,$B7,$05,$B7,$05,$B4
                    db $05,$48,$09,$58,$09,$49,$09,$59
                    db $09,$4A,$09,$5A,$09,$4B,$09,$5B
                    db $09,$4C,$09,$5C,$09,$4D,$09,$5D
                    db $09,$49,$09,$5E,$09,$4F,$09,$5F
                    db $09,$68,$09,$78,$09,$69,$09,$79
                    db $09,$6A,$09,$7A,$09,$6B,$09,$7B
                    db $09,$6C,$09,$7C,$09,$6D,$09,$7D
                    db $09,$6E,$09,$7E,$09,$6F,$09,$7F
                    db $09,$88,$09,$98,$09,$89,$09,$99
                    db $09,$8A,$09,$9A,$09,$8B,$09,$9B
                    db $09,$8C,$09,$9C,$09,$8D,$09,$9D
                    db $09,$8E,$09,$9E,$09,$8F,$09,$9F
                    db $09,$A8,$09,$B8,$09,$A9,$09,$B9
                    db $09,$AA,$09,$BA,$09,$AB,$09,$BB
                    db $09,$AC,$09,$BC,$09,$AD,$09,$BD
                    db $09,$AE,$09,$BE,$09,$AF,$09,$BF
                    db $09,$94,$09,$B7,$05,$A4,$09,$B4
                    db $05,$67,$09,$B5,$05,$77,$09,$B6
                    db $05,$87,$09,$B7,$05,$97,$09,$B4
                    db $05,$A7,$09,$B5,$05,$4E,$09,$B6
                    db $05,$96,$05,$A6,$05,$95,$05,$A5
                    db $05,$40,$05,$50,$05,$41,$05,$51
                    db $05,$42,$05,$52,$05,$43,$05,$53
                    db $05,$44,$05,$54,$05,$45,$05,$55
                    db $05,$46,$05,$56,$05,$47,$05,$57
                    db $05,$47,$45,$57,$45,$46,$45,$56
                    db $45,$45,$45,$55,$45,$44,$45,$54
                    db $45,$43,$45,$53,$45,$42,$45,$52
                    db $45,$41,$45,$51,$45,$40,$45,$50
                    db $45,$60,$05,$70,$05,$61,$05,$71
                    db $05,$62,$05,$72,$05,$63,$05,$73
                    db $05,$64,$05,$74,$05,$65,$05,$FF
                    db $00,$66,$05,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$66,$45,$FF
                    db $00,$65,$45,$FF,$00,$64,$45,$74
                    db $45,$63,$45,$73,$45,$62,$45,$72
                    db $45,$61,$45,$71,$45,$60,$45,$70
                    db $45,$80,$05,$90,$05,$81,$05,$91
                    db $05,$82,$05,$92,$05,$83,$05,$93
                    db $05,$84,$05,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$84,$45,$FF
                    db $00,$83,$45,$93,$45,$82,$45,$92
                    db $45,$81,$45,$91,$45,$80,$45,$90
                    db $45,$A0,$05,$B0,$05,$A1,$05,$B1
                    db $05,$A2,$05,$B2,$05,$A3,$05,$B3
                    db $05,$A3,$45,$B3,$45,$A2,$45,$B2
                    db $45,$A1,$45,$B1,$45,$A0,$45,$B0
                    db $45,$48,$05,$58,$05,$49,$05,$59
                    db $05,$4A,$05,$5A,$05,$4B,$05,$5B
                    db $05,$4C,$05,$5C,$05,$4D,$05,$5D
                    db $05,$4E,$05,$5E,$05,$4F,$05,$5F
                    db $05,$68,$05,$78,$05,$69,$05,$79
                    db $05,$6A,$05,$7A,$05,$6B,$05,$7B
                    db $05,$6B,$45,$7B,$45,$6A,$45,$7A
                    db $45,$69,$45,$79,$45,$68,$45,$78
                    db $45,$78,$05,$68,$05,$79,$05,$69
                    db $05,$7A,$05,$6A,$05,$7B,$05,$6B
                    db $05,$7B,$45,$6B,$45,$7A,$45,$6A
                    db $45,$79,$45,$69,$45,$78,$45,$68
                    db $45,$78,$05,$88,$05,$79,$05,$89
                    db $05,$7A,$05,$8A,$05,$7B,$05,$8B
                    db $05,$7B,$45,$8B,$45,$7A,$45,$8A
                    db $45,$79,$45,$89,$45,$78,$45,$88
                    db $45,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$A6,$09,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$A7,$09,$FF
                    db $00,$FF,$00,$5F,$05,$6D,$05,$59
                    db $05,$6E,$05,$5A,$05,$6F,$05,$5B
                    db $05,$6F,$45,$5B,$45,$6E,$45,$5A
                    db $45,$6D,$45,$59,$45,$FF,$00,$5F
                    db $45,$68,$05,$78,$05,$69,$05,$79
                    db $05,$6A,$05,$7A,$05,$6B,$05,$7B
                    db $05,$6B,$45,$7B,$45,$6A,$45,$7A
                    db $45,$69,$45,$79,$45,$68,$45,$78
                    db $45,$5E,$45,$5B,$45,$5D,$45,$5A
                    db $45,$5C,$45,$59,$45,$88,$45,$58
                    db $45,$88,$05,$58,$05,$5C,$05,$59
                    db $05,$5D,$05,$5A,$05,$5E,$05,$5B
                    db $05,$88,$05,$88,$05,$88,$05,$88
                    db $05,$88,$05,$88,$05,$88,$05,$7D
                    db $05,$89,$05,$7E,$05,$8A,$05,$7F
                    db $05,$8A,$45,$7F,$45,$89,$45,$7E
                    db $45,$88,$45,$7D,$45,$88,$45,$88
                    db $45,$88,$05,$88,$05,$8B,$05,$88
                    db $05,$8C,$05,$88,$05,$8D,$05,$7C
                    db $05,$8D,$45,$7C,$45,$8C,$45,$88
                    db $45,$8B,$45,$88,$45,$88,$45,$88
                    db $45,$88,$05,$40,$05,$88,$05,$41
                    db $05,$88,$05,$42,$05,$88,$05,$43
                    db $05,$88,$05,$44,$05,$88,$05,$45
                    db $05,$88,$05,$46,$05,$88,$05,$47
                    db $05,$50,$05,$60,$05,$51,$05,$61
                    db $05,$52,$05,$62,$05,$53,$05,$63
                    db $05,$54,$05,$64,$05,$55,$05,$65
                    db $05,$56,$05,$66,$05,$57,$05,$67
                    db $05,$70,$05,$80,$05,$71,$05,$81
                    db $05,$72,$05,$82,$05,$73,$05,$83
                    db $05,$74,$05,$84,$05,$75,$05,$85
                    db $05,$76,$05,$86,$05,$77,$05,$87
                    db $05,$90,$05,$A0,$05,$91,$05,$A1
                    db $05,$92,$05,$A2,$05,$93,$05,$A3
                    db $05,$94,$05,$A4,$05,$95,$05,$A5
                    db $05,$96,$05,$8E,$05,$97,$05,$8F
                    db $05,$98,$05,$48,$05,$99,$05,$49
                    db $05,$9A,$05,$4A,$05,$9B,$05,$4B
                    db $05,$9C,$05,$4C,$05,$9D,$05,$4D
                    db $05,$9E,$05,$4E,$05,$9F,$05,$4F
                    db $05,$FF,$00,$FF,$00,$A8,$09,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$A9
                    db $09,$97,$09,$89,$09,$98,$09,$86
                    db $09,$99,$09,$87,$09,$96,$09,$88
                    db $09,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$06,$00,$07,$F0,$28,$08,$00
                    db $24,$0B,$50,$2A,$0B,$80,$11,$0C
                    db $B0,$10,$12,$C0,$20,$13,$90,$00
                    db $15,$00,$02,$07,$41,$12,$07,$D1
                    db $24,$0B,$B1,$11,$0C,$A1,$2C,$11
                    db $31,$26,$13,$C1,$22,$13,$51,$02
                    db $FF,$06,$00,$0B,$50,$2A,$0B,$80
                    db $11,$0C,$B0,$10,$12,$C0,$20,$13
                    db $90,$00,$15,$00,$02,$0B,$B1,$11
                    db $0C,$A1,$2C,$11,$31,$26,$13,$C1
                    db $22,$13,$51,$02,$FF,$06,$00,$12
                    db $C0,$20,$13,$90,$00,$15,$00,$02
                    db $13,$C1,$22,$13,$51,$02,$FF,$07
                    db $00,$05,$30,$10,$08,$80,$12,$03
                    db $F0,$02,$06,$B1,$14,$08,$41,$16
                    db $0A,$D1,$18,$FF,$07,$00,$00,$10
                    db $0D,$00,$D0,$0D,$04,$00,$1F,$05
                    db $C0,$50,$05,$20,$38,$05,$40,$22
                    db $05,$90,$22,$05,$E0,$38,$07,$70
                    db $40,$08,$30,$40,$08,$B0,$40,$09
                    db $50,$40,$0A,$20,$40,$0A,$80,$40
                    db $0B,$30,$40,$0B,$B0,$40,$0C,$50
                    db $40,$0C,$20,$51,$0D,$20,$40,$0D
                    db $70,$40,$FF,$01,$01,$0F,$20,$02
                    db $0F,$21,$01,$FF,$00,$00,$11,$30
                    db $00,$13,$90,$02,$11,$81,$04,$FF
                    db $14,$40,$06,$16,$D0,$08,$14,$A1
                    db $0A,$FF,$05,$01,$02,$A0,$00,$04
                    db $10,$10,$04,$40,$20,$04,$E0,$10
                    db $0A,$60,$30,$0F,$00,$50,$0F,$50
                    db $40,$0F,$B0,$40,$02,$81,$00,$04
                    db $31,$10,$04,$D1,$20,$0A,$41,$30
                    db $0F,$01,$50,$0F,$51,$40,$0F,$B1
                    db $40,$FF,$11,$01,$17,$10,$10,$11
                    db $40,$00,$17,$90,$10,$11,$C0,$00
                    db $16,$01,$20,$17,$91,$10,$FF,$08
                    db $00,$10,$00,$00,$10,$40,$00,$12
                    db $80,$20,$10,$C0,$00,$10,$01,$00
                    db $12,$41,$20,$12,$81,$10,$10,$C1
                    db $00,$FF,$10,$00,$20,$10,$20,$00
                    db $20,$50,$20,$01,$20,$80,$02,$00
                    db $20,$C0,$40,$00,$20,$D0,$00,$04
                    db $20,$E0,$00,$01,$21,$00,$10,$00
                    db $21,$C0,$40,$01,$24,$00,$10,$00
                    db $25,$40,$10,$01,$28,$30,$50,$00
                    db $2C,$00,$30,$00,$2C,$30,$50,$01
                    db $20,$11,$20,$02,$20,$51,$20,$03
                    db $20,$81,$02,$02,$20,$D1,$40,$02
                    db $20,$E1,$00,$03,$21,$B1,$10,$05
                    db $21,$A1,$40,$03,$22,$01,$30,$01
                    db $24,$01,$10,$02,$25,$C1,$40,$05
                    db $25,$D1,$40,$06,$26,$01,$30,$02
                    db $29,$01,$10,$03,$2A,$C1,$40,$04
                    db $2B,$C1,$40,$00,$2B,$31,$50,$02
                    db $2D,$C1,$40,$04,$2C,$71,$10,$04
                    db $2E,$01,$30,$03,$FF,$0E,$00,$0B
                    db $C0,$02,$0F,$A0,$18,$0F,$E0,$24
                    db $12,$20,$36,$12,$60,$36,$13,$C0
                    db $44,$0F,$40,$70,$10,$00,$70,$0B
                    db $81,$0C,$0F,$C1,$64,$11,$01,$56
                    db $11,$41,$36,$13,$21,$44,$13,$A1
                    db $44,$33,$E1,$54,$01,$0F,$21,$70
                    db $FF,$01,$00,$00,$20,$1A,$22,$00
                    db $34,$06,$04,$20,$20,$26,$00,$06
                    db $04,$08,$20,$06,$0A,$40,$18,$0C
                    db $20,$06,$0E,$40,$18,$10,$00,$18
                    db $12,$20,$1A,$34,$00,$34,$06,$16
                    db $20,$20,$38,$00,$06,$04,$1A,$20
                    db $06,$00,$01,$18,$02,$21,$1A,$24
                    db $01,$34,$06,$06,$21,$20,$28,$01
                    db $06,$04,$0A,$21,$06,$0C,$41,$18
                    db $0E,$01,$18,$10,$21,$1A,$32,$01
                    db $34,$06,$14,$21,$20,$36,$01,$06
                    db $04,$18,$21,$06,$1A,$41,$18,$FF
                    db $0A,$00,$0E,$50,$00,$0F,$A0,$10
                    db $11,$31,$20,$10,$81,$30,$FF,$03
                    db $00,$00,$20,$07,$01,$A0,$14,$04
                    db $50,$08,$06,$E0,$14,$07,$70,$14
                    db $00,$20,$07,$01,$71,$18,$03,$11
                    db $08,$05,$31,$13,$07,$91,$14,$FF
                    db $03,$00,$00,$20,$07,$01,$A0,$14
                    db $04,$50,$08,$06,$E0,$14,$07,$70
                    db $14,$00,$20,$07,$11,$50,$20,$14
                    db $A0,$30,$12,$20,$50,$11,$B0,$40
                    db $01,$71,$18,$03,$11,$08,$05,$31
                    db $13,$07,$91,$14,$0F,$71,$20,$34
                    db $E1,$30,$01,$11,$F1,$40,$FF,$02
                    db $00,$0F,$60,$03,$0E,$F0,$03,$0F
                    db $E0,$03,$10,$00,$03,$30,$20,$03
                    db $01,$11,$10,$03,$11,$40,$03,$0E
                    db $A0,$16,$10,$60,$14,$10,$C0,$14
                    db $12,$80,$13,$14,$50,$30,$14,$F0
                    db $30,$15,$30,$20,$15,$60,$36,$30
                    db $01,$03,$01,$0F,$21,$03,$10,$81
                    db $04,$11,$B1,$03,$12,$A1,$02,$12
                    db $D1,$02,$33,$C1,$01,$01,$0E,$41
                    db $16,$10,$21,$14,$12,$61,$13,$12
                    db $F1,$13,$14,$11,$30,$15,$31,$20
                    db $15,$A1,$20,$15,$E1,$30,$FF,$05
                    db $01,$00,$00,$02,$00,$80,$20,$00
                    db $A0,$10,$00,$C0,$05,$02,$20,$02
                    db $02,$C0,$40,$04,$00,$20,$04,$20
                    db $10,$04,$80,$10,$04,$A0,$20,$04
                    db $40,$40,$06,$A0,$02,$08,$00,$31
                    db $08,$40,$02,$08,$C0,$20,$08,$E0
                    db $40,$0A,$40,$20,$0A,$60,$02,$0C
                    db $00,$02,$0C,$80,$20,$0C,$A0,$10
                    db $0C,$C0,$05,$0E,$20,$02,$0E,$C0
                    db $40,$10,$00,$20,$10,$20,$10,$10
                    db $80,$10,$10,$40,$40,$10,$A0,$20
                    db $12,$A0,$02,$14,$00,$31,$14,$40
                    db $02,$14,$C0,$20,$14,$E0,$40,$16
                    db $40,$20,$16,$60,$02,$18,$00,$04
                    db $02,$01,$10,$02,$21,$04,$04,$21
                    db $10,$04,$41,$40,$04,$81,$10,$04
                    db $A1,$20,$04,$C1,$01,$06,$A1,$02
                    db $08,$21,$31,$08,$61,$20,$08,$81
                    db $02,$0A,$61,$02,$0A,$E1,$20,$0E
                    db $01,$10,$0E,$21,$04,$10,$21,$10
                    db $10,$41,$40,$10,$81,$10,$10,$A1
                    db $20,$10,$C1,$01,$12,$A1,$02,$14
                    db $21,$31,$14,$61,$20,$14,$81,$02
                    db $16,$61,$02,$16,$E1,$20,$18,$01
                    db $04,$FF,$13,$00,$0E,$00,$00,$0F
                    db $60,$02,$10,$A0,$04,$13,$C0,$10
                    db $12,$60,$20,$10,$01,$06,$0F,$31
                    db $08,$0E,$D1,$0A,$13,$81,$10,$12
                    db $21,$20,$12,$E1,$20,$FF,$11,$00
                    db $FF,$10,$00,$FF,$12,$00,$FF,$14
                    db $00,$12,$A0,$03,$12,$11,$02,$12
                    db $61,$0B,$FF,$02,$00,$0C,$10,$03
                    db $0C,$50,$03,$0C,$90,$03,$0C,$D0
                    db $03,$0C,$70,$10,$FF,$17,$01,$20
                    db $10,$06,$0C,$20,$90,$06,$0C,$26
                    db $10,$06,$00,$26,$90,$06,$00,$28
                    db $20,$14,$05,$12,$00,$26,$12,$40
                    db $36,$12,$80,$26,$12,$C0,$36,$FF
                    db $15,$00,$00,$70,$03,$00,$E0,$40
                    db $01,$50,$50,$02,$00,$40,$02,$C0
                    db $00,$04,$10,$00,$04,$80,$40,$05
                    db $60,$50,$05,$B0,$10,$05,$F0,$40
                    db $06,$40,$10,$06,$90,$50,$07,$00
                    db $10,$07,$70,$40,$07,$A0,$10,$0D
                    db $80,$30,$0D,$D0,$20,$0E,$40,$20
                    db $0F,$B0,$20,$10,$60,$20,$00,$31
                    db $50,$00,$A1,$00,$01,$01,$00,$01
                    db $E1,$50,$02,$61,$40,$03,$C1,$00
                    db $04,$21,$0D,$05,$91,$00,$05,$D1
                    db $50,$06,$41,$52,$06,$B1,$10,$07
                    db $11,$10,$07,$71,$40,$0D,$71,$30
                    db $0E,$11,$20,$0F,$E1,$21,$10,$21
                    db $20,$10,$91,$30,$FF,$0F,$00,$00
                    db $F0,$50,$02,$10,$70,$02,$60,$50
                    db $03,$20,$50,$03,$A0,$60,$03,$D0
                    db $40,$04,$90,$40,$05,$50,$50,$06
                    db $10,$70,$07,$E0,$70,$08,$40,$50
                    db $08,$80,$40,$09,$B0,$60,$0B,$70
                    db $50,$0C,$50,$40,$2B,$20,$08,$01
                    db $0D,$10,$04,$0E,$F0,$03,$0F,$40
                    db $05,$0F,$E0,$03,$0C,$A0,$18,$0E
                    db $60,$16,$10,$C0,$14,$12,$80,$13
                    db $00,$51,$50,$02,$11,$40,$02,$A1
                    db $40,$02,$D1,$60,$03,$61,$50,$04
                    db $21,$70,$05,$81,$40,$06,$51,$50
                    db $07,$01,$50,$09,$D1,$40,$0A,$21
                    db $50,$0A,$A1,$50,$0A,$F1,$70,$0B
                    db $01,$40,$0C,$C1,$70,$0D,$D1,$60
                    db $0E,$B1,$06,$0F,$81,$04,$30,$01
                    db $03,$01,$10,$D1,$04,$11,$A1,$03
                    db $32,$C1,$02,$01,$0A,$41,$19,$0D
                    db $21,$17,$0F,$F1,$16,$11,$61,$14
                    db $FF,$16,$00,$0B,$00,$21,$0B,$40
                    db $02,$0B,$C0,$10,$0B,$E0,$30,$0D
                    db $40,$10,$0D,$60,$02,$11,$20,$48
                    db $13,$00,$42,$13,$80,$60,$13,$A0
                    db $50,$13,$C0,$45,$15,$20,$42,$15
                    db $C0,$70,$17,$00,$60,$17,$20,$50
                    db $17,$40,$70,$17,$80,$50,$17,$A0
                    db $60,$19,$A0,$42,$0B,$01,$30,$0B
                    db $21,$21,$0B,$61,$10,$0B,$81,$02
                    db $0D,$61,$02,$0D,$E1,$10,$15,$01
                    db $50,$15,$21,$44,$17,$21,$50,$17
                    db $41,$70,$17,$81,$50,$17,$A1,$60
                    db $17,$C1,$41,$19,$A1,$42,$FF,$0C
                    db $00,$FF,$0B,$00,$0B,$10,$24,$0B
                    db $90,$24,$02,$00,$06,$02,$40,$16
                    db $02,$80,$06,$02,$C0,$16,$FF,$68
                    db $E2,$F9,$E2,$1A,$E4,$CB,$E5,$EC
                    db $E6,$0D,$E8,$BE,$E9,$DF,$EA,$20
                    db $ED,$02,$B4,$B4,$B4,$03,$45,$47
                    db $45,$04,$45,$05,$45,$47,$B4,$B4
                    db $02,$02,$B4,$B4,$B4,$46,$B4,$B4
                    db $B4,$46,$B4,$B4,$B4,$46,$B4,$B4
                    db $02,$02,$49,$E5,$45,$4A,$B4,$B4
                    db $B4,$48,$45,$06,$45,$50,$B4,$B4
                    db $02,$02,$B4,$B4,$B4,$54,$B4,$B4
                    db $B4,$46,$B4,$B4,$B4,$B4,$B4,$B4
                    db $02,$02,$B4,$B4,$B4,$48,$45,$67
                    db $45,$E8,$B4,$B4,$99,$A2,$9A,$B4
                    db $02,$02,$B4,$42,$42,$46,$42,$B4
                    db $B4,$B4,$99,$A2,$A7,$C8,$9D,$B4
                    db $02,$02,$42,$42,$53,$48,$53,$50
                    db $45,$47,$B3,$47,$45,$C9,$9D,$B4
                    db $02,$02,$42,$53,$53,$46,$53,$53
                    db $42,$46,$9D,$42,$42,$42,$9D,$B4
                    db $02,$02,$42,$53,$53,$07,$45,$47
                    db $45,$08,$A6,$A2,$A2,$A2,$A7,$B4
                    db $02,$FF,$43,$43,$BB,$BB,$E8,$45
                    db $47,$45,$04,$96,$44,$45,$47,$42
                    db $50,$45,$43,$BB,$BF,$BB,$BB,$43
                    db $46,$BF,$46,$43,$46,$43,$46,$BB
                    db $42,$BF,$43,$42,$BB,$BB,$44,$45
                    db $4A,$43,$48,$43,$48,$42,$05,$45
                    db $47,$45,$43,$43,$43,$43,$46,$69
                    db $43,$69,$46,$69,$46,$43,$46,$43
                    db $43,$43,$43,$43,$43,$53,$03,$43
                    db $69,$43,$67,$45,$4A,$45,$4A,$45
                    db $BC,$43,$43,$53,$43,$43,$46,$43
                    db $43,$69,$43,$43,$BB,$BB,$46,$43
                    db $43,$43,$43,$43,$43,$53,$48,$43
                    db $50,$45,$BC,$43,$53,$BB,$48,$51
                    db $47,$42,$43,$43,$43,$BB,$46,$BB
                    db $BF,$42,$54,$53,$53,$BB,$BB,$BB
                    db $46,$43,$43,$49,$E5,$45,$4A,$45
                    db $47,$45,$4A,$43,$53,$53,$43,$BB
                    db $E8,$45,$47,$45,$06,$45,$47,$51
                    db $BB,$45,$50,$42,$A1,$83,$83,$83
                    db $A3,$43,$46,$53,$53,$53,$46,$53
                    db $53,$53,$46,$BB,$43,$9D,$9D,$9D
                    db $43,$43,$68,$43,$43,$53,$48,$BB
                    db $53,$43,$48,$BB,$43,$9D,$9D,$9D
                    db $43,$43,$46,$43,$C8,$43,$46,$BB
                    db $53,$53,$46,$BB,$A1,$82,$82,$82
                    db $A3,$43,$48,$43,$C9,$43,$48,$43
                    db $53,$53,$48,$45,$47,$53,$BB,$43
                    db $43,$43,$46,$69,$46,$69,$46,$43
                    db $43,$53,$53,$BB,$46,$BB,$53,$BB
                    db $43,$43,$07,$43,$48,$45,$69,$43
                    db $43,$43,$53,$BB,$48,$BF,$53,$BB
                    db $43,$43,$46,$BB,$43,$43,$46,$43
                    db $43,$43,$53,$43,$BB,$BB,$43,$53
                    db $43,$43,$4A,$45,$47,$45,$4A,$43
                    db $43,$43,$43,$53,$53,$53,$53,$43
                    db $43,$43,$FF,$8D,$8E,$50,$45,$47
                    db $B7,$AE,$B8,$05,$8B,$50,$B2,$47
                    db $B2,$47,$45,$8D,$8F,$85,$86,$46
                    db $8C,$8D,$8F,$AA,$91,$85,$A5,$46
                    db $9D,$46,$99,$8D,$8D,$8D,$8F,$04
                    db $90,$87,$88,$B5,$8D,$8D,$8E,$06
                    db $B9,$4A,$9D,$8D,$8D,$8D,$8D,$B0
                    db $87,$96,$97,$AB,$95,$95,$9F,$AA
                    db $A5,$46,$8A,$8D,$95,$88,$8D,$B5
                    db $8E,$E8,$B9,$67,$45,$47,$B7,$AF
                    db $8E,$48,$9D,$8D,$B4,$8C,$8D,$B0
                    db $8F,$85,$A5,$46,$A1,$A2,$93,$B0
                    db $8E,$46,$A6,$8D,$B4,$94,$88,$03
                    db $8D,$87,$96,$48,$56,$BC,$8C,$07
                    db $B8,$4A,$51,$8D,$B4,$42,$94,$AB
                    db $95,$96,$B4,$46,$A1,$A2,$93,$8D
                    db $8F,$85,$85,$8D,$49,$E5,$45,$BC
                    db $51,$E8,$51,$4A,$45,$BC,$94,$95
                    db $95,$95,$95,$08,$B3,$47,$45,$09
                    db $45,$47,$8C,$8D,$8D,$8F,$85,$86
                    db $42,$8C,$8D,$B1,$A0,$A2,$A2,$A2
                    db $A2,$BA,$93,$8D,$8D,$8D,$8D,$8F
                    db $85,$90,$8D,$0A,$B3,$47,$45,$E8
                    db $45,$67,$8C,$8D,$87,$95,$95,$95
                    db $88,$8D,$8D,$BA,$A0,$A2,$9C,$85
                    db $86,$54,$8C,$87,$96,$E8,$45,$50
                    db $94,$88,$8D,$48,$B3,$0B,$B7,$BC
                    db $8E,$BC,$8C,$8E,$BF,$46,$42,$BF
                    db $42,$8C,$8D,$A2,$82,$A2,$A9,$88
                    db $8F,$85,$90,$4B,$45,$50,$45,$E8
                    db $BF,$8C,$8D,$47,$45,$47,$45,$4B
                    db $8D,$8D,$8D,$8F,$9B,$A2,$A2,$A2
                    db $9C,$90,$8D,$85,$85,$85,$85,$90
                    db $8D,$8D,$8D,$8D,$8E,$42,$B4,$42
                    db $8C,$8D,$8D,$95,$95,$95,$95,$95
                    db $95,$95,$95,$95,$A8,$A2,$A2,$A2
                    db $A9,$95,$95,$4B,$45,$50,$BB,$BB
                    db $8C,$8D,$8D,$8D,$8D,$87,$95,$95
                    db $88,$8D,$02,$8E,$BB,$42,$84,$85
                    db $90,$8D,$8D,$8D,$8D,$8E,$B4,$B4
                    db $8C,$8D,$02,$8F,$85,$85,$90,$8D
                    db $8D,$8D,$8D,$8D,$8D,$8E,$42,$B4
                    db $8C,$8D,$02,$8D,$8D,$8D,$8D,$8D
                    db $8D,$8D,$8D,$8D,$8D,$92,$A2,$9C
                    db $90,$8D,$02,$8D,$8D,$8D,$8D,$8D
                    db $87,$95,$95,$95,$95,$96,$B4,$8C
                    db $8D,$8D,$02,$8D,$8D,$8D,$87,$95
                    db $98,$42,$B4,$B4,$C8,$B4,$B4,$8C
                    db $8D,$8D,$02,$8D,$8D,$8D,$8E,$B4
                    db $8A,$A2,$B1,$9A,$C9,$45,$47,$B7
                    db $BC,$8D,$02,$8D,$8D,$8D,$8E,$B4
                    db $9D,$B4,$42,$A4,$85,$85,$85,$90
                    db $8D,$8D,$02,$95,$95,$95,$A8,$A2
                    db $82,$A2,$A2,$A9,$95,$95,$95,$95
                    db $95,$95,$02,$FF,$8D,$8D,$8D,$8D
                    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$87
                    db $95,$95,$95,$95,$95,$95,$95,$89
                    db $95,$88,$8D,$8D,$8D,$87,$95,$96
                    db $BD,$42,$BD,$42,$42,$49,$E5,$B3
                    db $BC,$8C,$8D,$87,$95,$96,$E0,$45
                    db $08,$45,$47,$45,$8D,$85,$AA,$91
                    db $85,$90,$87,$96,$C8,$42,$BD,$99
                    db $BA,$83,$A2,$9A,$8D,$8D,$B5,$8D
                    db $AD,$8D,$8E,$42,$C9,$45,$47,$9D
                    db $4A,$B3,$67,$9D,$8D,$87,$AB,$88
                    db $8D,$8D,$8F,$86,$42,$BD,$BD,$A6
                    db $BA,$82,$A2,$A7,$8D,$8E,$BC,$8C
                    db $8D,$AD,$8D,$92,$A2,$A3,$E8,$45
                    db $07,$45,$47,$45,$8D,$96,$BB,$94
                    db $88,$8D,$8D,$8E,$BD,$42,$BD,$84
                    db $85,$85,$85,$86,$42,$42,$BB,$BB
                    db $94,$95,$95,$A8,$A2,$A2,$A2,$A9
                    db $95,$95,$95,$A8,$95,$95,$88,$8D
                    db $8D,$87,$95,$95,$95,$95,$95,$95
                    db $88,$8D,$8D,$8D,$BD,$42,$94,$95
                    db $95,$96,$BD,$53,$53,$53,$53,$BD
                    db $8C,$8D,$8D,$8D,$47,$42,$BC,$56
                    db $67,$45,$47,$45,$05,$45,$47,$45
                    db $04,$95,$88,$8D,$46,$BD,$42,$42
                    db $46,$BD,$52,$53,$53,$BF,$46,$BF
                    db $46,$42,$8C,$8D,$48,$45,$47,$BD
                    db $48,$45,$E8,$BD,$53,$42,$50,$42
                    db $48,$BD,$8C,$8D,$46,$BD,$46,$84
                    db $AA,$86,$42,$BD,$53,$42,$42,$42
                    db $46,$42,$8C,$8D,$4A,$42,$48,$B7
                    db $06,$8E,$BD,$42,$E0,$51,$BC,$45
                    db $03,$42,$8C,$8D,$42,$42,$84,$9E
                    db $AB,$9F,$85,$86,$BD,$BD,$A1,$A2
                    db $A2,$9C,$90,$8D,$A2,$A2,$A9,$96
                    db $50,$94,$95,$A8,$A2,$A2,$A2,$A2
                    db $A2,$A9,$95,$8D,$FF,$42,$42,$44
                    db $45,$04,$45,$50,$9D,$05,$45,$47
                    db $B4,$42,$8C,$8D,$8D,$42,$B4,$46
                    db $B4,$46,$99,$A2,$A7,$46,$B4,$46
                    db $B4,$B4,$8C,$8D,$8D,$42,$42,$03
                    db $B4,$BC,$9D,$BC,$45,$4A,$B4,$48
                    db $45,$5F,$8C,$8D,$8D,$42,$42,$46
                    db $99,$A2,$A7,$46,$B4,$42,$B4,$46
                    db $B4,$84,$90,$8D,$8D,$42,$B4,$48
                    db $9D,$67,$45,$4A,$42,$44,$45,$4A
                    db $B4,$8C,$8D,$8D,$8D,$42,$42,$46
                    db $9D,$46,$B4,$A1,$A3,$46,$B4,$B4
                    db $B4,$8C,$C2,$C3,$C4,$42,$49,$E5
                    db $9D,$48,$45,$E8,$45,$4A,$B4,$B4
                    db $B4,$8C,$CE,$D7,$D7,$85,$85,$85
                    db $91,$85,$85,$85,$85,$85,$85,$85
                    db $85,$90,$D2,$D7,$D7,$C4,$C3,$C4
                    db $C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4
                    db $C3,$C4,$D0,$D7,$D7,$42,$57,$58
                    db $59,$5A,$84,$90,$8D,$8D,$8D,$8D
                    db $D2,$D7,$D7,$E0,$D7,$42,$5B,$5C
                    db $5D,$5D,$8C,$8D,$8D,$8D,$8D,$8D
                    db $CE,$D7,$E9,$DB,$D7,$85,$85,$85
                    db $85,$85,$90,$8D,$C2,$BC,$C4,$C4
                    db $D0,$D9,$DA,$07,$D7,$C3,$C4,$C5
                    db $8D,$8D,$C2,$C3,$D0,$DB,$D7,$D7
                    db $E9,$DB,$D7,$DB,$D7,$D6,$D3,$D4
                    db $C2,$C3,$D0,$D9,$E4,$DE,$DA,$06
                    db $DA,$DE,$D7,$E8,$D7,$C2,$C3,$C4
                    db $D0,$D7,$D7,$DB,$D7,$D7,$D7,$D7
                    db $D7,$D7,$E9,$DB,$D7,$D7,$D7,$E9
                    db $D7,$E8,$DA,$DE,$DA,$EB,$DA,$DC
                    db $DA,$09,$DA,$DE,$D7,$D7,$D7,$C8
                    db $D7,$D7,$E9,$D7,$D7,$DB,$D7,$DB
                    db $E9,$D7,$D7,$DB,$D7,$D7,$D7,$C9
                    db $DA,$DC,$DA,$0B,$DA,$0A,$D7,$DD
                    db $DA,$E0,$DA,$08,$D7,$FF,$8D,$88
                    db $8D,$8D,$8F,$90,$87,$95,$95,$95
                    db $98,$EA,$E0,$EA,$94,$88,$8D,$94
                    db $88,$AD,$8D,$8D,$8E,$EA,$EA,$EA
                    db $9D,$42,$46,$EA,$EA,$94,$42,$42
                    db $94,$95,$95,$95,$96,$EA,$44,$45
                    db $04,$45,$4A,$51,$BC,$EA,$EA,$EA
                    db $42,$99,$A2,$9A,$B4,$EA,$46,$99
                    db $82,$9A,$46,$EA,$EA,$99,$42,$49
                    db $E5,$B9,$47,$B9,$03,$45,$E8,$9D
                    db $67,$B3,$4A,$56,$47,$B9,$EA,$EA
                    db $42,$A6,$BA,$8B,$B4,$EA,$46,$8A
                    db $A2,$A7,$46,$EA,$46,$A6,$42,$42
                    db $42,$B4,$BC,$9D,$B4,$EA,$48,$B3
                    db $47,$45,$05,$EA,$E8,$45,$42,$42
                    db $42,$42,$B4,$A6,$9A,$EA,$EA,$9D
                    db $42,$42,$42,$EA,$EA,$EA,$42,$42
                    db $42,$42,$42,$B4,$A6,$A2,$A2,$A7
                    db $EA,$EA,$EA,$EA,$42,$42,$8D,$8D
                    db $8D,$8D,$8D,$8E,$BC,$45,$47,$9D
                    db $47,$EA,$EA,$EA,$EA,$EA,$88,$8D
                    db $8D,$87,$95,$A8,$A2,$A2,$A2,$A7
                    db $46,$42,$EA,$EA,$EA,$84,$94,$95
                    db $95,$96,$42,$B4,$42,$42,$44,$45
                    db $4A,$45,$47,$EA,$EA,$94,$A2,$9A
                    db $EA,$B4,$EA,$42,$42,$99,$BA,$9A
                    db $EA,$EA,$46,$B4,$EA,$EA,$BC,$9D
                    db $44,$45,$08,$45,$47,$9D,$67,$B3
                    db $47,$EA,$0A,$45,$47,$45,$A2,$A7
                    db $46,$42,$42,$42,$46,$A6,$A2,$A7
                    db $46,$99,$A2,$9A,$EA,$EA,$06,$45
                    db $4A,$42,$E0,$42,$48,$45,$47,$51
                    db $4A,$B9,$09,$9D,$B4,$EA,$EA,$42
                    db $46,$42,$46,$42,$46,$42,$46,$42
                    db $42,$A6,$BA,$A7,$B4,$B4,$B4,$B4
                    db $48,$45,$07,$45,$4A,$45,$4A,$45
                    db $E8,$45,$4A,$42,$42,$B4,$EA,$42
                    db $94,$95,$95,$88,$8D,$87,$95,$88
                    db $8D,$8F,$85,$85,$86,$42,$86,$42
                    db $42,$42,$42,$94,$88,$8E,$EA,$8C
                    db $AD,$8D,$8D,$8D,$8E,$42,$0B,$45
                    db $47,$45,$47,$42,$8C,$8F,$85,$90
                    db $87,$95,$95,$88,$8E,$42,$46,$99
                    db $A2,$9A,$46,$42,$94,$89,$95,$89
                    db $96,$B4,$C8,$8C,$8E,$42,$4A,$9D
                    db $67,$B3,$4A,$56,$47,$B3,$47,$B3
                    db $47,$45,$C9,$8C,$8E,$42,$46,$A6
                    db $A2,$A7,$46,$BF,$84,$91,$85,$91
                    db $86,$B4,$42,$8C,$8E,$42,$48,$45
                    db $47,$45,$0C,$EA,$94,$88,$8D,$8D
                    db $8F,$85,$85,$90,$8E,$42,$EA,$EA
                    db $EA,$EA,$EA,$EA,$EA,$94,$88,$8D
                    db $8D,$8D,$8D,$8D,$8E,$42,$B4,$EA
                    db $EA,$EA,$EA,$EA,$EA,$EA,$94,$95
                    db $95,$95,$95,$95,$96,$42,$FF,$8D
                    db $87,$95,$95,$95,$95,$95,$95,$89
                    db $95,$88,$87,$95,$95,$95,$95,$8D
                    db $8E,$E5,$45,$47,$45,$47,$BE,$9D
                    db $BC,$8C,$8E,$BE,$BC,$BE,$67,$8D
                    db $8E,$46,$BE,$BE,$BE,$46,$BE,$9D
                    db $46,$8C,$8E,$BE,$54,$BE,$46,$8D
                    db $8E,$03,$45,$BC,$BE,$BC,$BE,$9D
                    db $50,$8C,$BC,$45,$4A,$45,$4A,$8D
                    db $8F,$9B,$A2,$A2,$A2,$A2,$83,$82
                    db $9C,$90,$8F,$9B,$A2,$A2,$A2,$8D
                    db $8D,$8E,$BC,$45,$BC,$BE,$9D,$44
                    db $B7,$06,$AC,$E8,$45,$47,$45,$8D
                    db $8D,$8E,$46,$BE,$BE,$BE,$9D,$46
                    db $8C,$8D,$8D,$8E,$BE,$46,$BE,$8D
                    db $8D,$8E,$04,$45,$BC,$BE,$9D,$BC
                    db $8C,$8D,$8D,$8E,$BE,$05,$45,$95
                    db $95,$A8,$A2,$A2,$A2,$A2,$82,$A2
                    db $A9,$95,$95,$A8,$A2,$A2,$A2,$95
                    db $95,$89,$95,$88,$87,$95,$95,$95
                    db $95,$95,$95,$89,$95,$88,$8D,$45
                    db $E8,$B9,$08,$8C,$8E,$09,$45,$47
                    db $45,$BC,$BE,$9D,$BE,$8C,$8D,$BE
                    db $BE,$9D,$46,$8C,$8E,$46,$BE,$BE
                    db $BE,$46,$BE,$9D,$BC,$8C,$8D,$45
                    db $BC,$9D,$BC,$8C,$8E,$E8,$45,$47
                    db $45,$0A,$45,$50,$BE,$8C,$8D,$A2
                    db $83,$82,$9C,$90,$8F,$9B,$A2,$BA
                    db $A2,$A2,$83,$82,$9C,$90,$8D,$07
                    db $B9,$BC,$8C,$8D,$8D,$BC,$56,$0B
                    db $45,$47,$B9,$67,$8C,$8D,$8D,$BE
                    db $9D,$46,$8C,$8D,$8D,$8E,$BD,$C8
                    db $BD,$42,$9D,$46,$8C,$8D,$8D,$BC
                    db $9D,$50,$8C,$8D,$8D,$8E,$42,$C9
                    db $45,$47,$B3,$4A,$8C,$8D,$8D,$A2
                    db $82,$A2,$A9,$95,$95,$A8,$A2,$A2
                    db $A2,$A2,$82,$A2,$A9,$95,$8D,$FF
                    db $D8,$42,$42,$42,$42,$42,$42,$42
                    db $D1,$D1,$D1,$D1,$D1,$D1,$D1,$D8
                    db $D8,$42,$D1,$D1,$42,$42,$42,$D1
                    db $BC,$F0,$F1,$F1,$F1,$F2,$D1,$D8
                    db $42,$D1,$D1,$D1,$D1,$D1,$D1,$D1
                    db $54,$F9,$F7,$F3,$F7,$FA,$D1,$D1
                    db $D1,$D1,$E5,$D1,$D1,$D1,$BC,$D1
                    db $48,$9D,$42,$9D,$42,$9D,$D1,$D1
                    db $D1,$D1,$46,$D1,$D1,$D1,$46,$F0
                    db $00,$FC,$42,$9D,$42,$9D,$D1,$D1
                    db $D1,$D1,$48,$45,$47,$45,$4A,$02
                    db $01,$F4,$F1,$F5,$FB,$A7,$D1,$D1
                    db $D1,$D1,$D1,$D1,$D1,$D1,$D1,$F6
                    db $F7,$F7,$F7,$F7,$F8,$D1,$D1,$D1
                    db $D8,$42,$D1,$D1,$42,$42,$42,$D1
                    db $D1,$D1,$BF,$BF,$BF,$D1,$D1,$D1
                    db $D8,$42,$42,$42,$42,$42,$42,$42
                    db $D1,$D1,$D1,$D1,$D1,$D1,$42,$D8
                    db $D8,$42,$42,$E2,$E2,$42,$42,$42
                    db $42,$E2,$E2,$E2,$42,$42,$42,$D8
                    db $D8,$42,$E2,$E2,$E2,$E2,$42,$42
                    db $42,$E2,$BC,$E2,$42,$42,$42,$D8
                    db $D8,$E2,$E2,$42,$42,$E2,$E2,$42
                    db $E2,$E2,$46,$E2,$E2,$42,$42,$D8
                    db $D8,$E2,$BC,$45,$47,$42,$E2,$E2
                    db $BC,$56,$4A,$42,$E2,$E2,$42,$D8
                    db $D8,$E2,$42,$42,$46,$42,$D1,$D1
                    db $D1,$D1,$D1,$42,$42,$E2,$42,$D8
                    db $D8,$E2,$E2,$42,$48,$45,$E6,$E6
                    db $E6,$E6,$E6,$45,$BC,$E2,$42,$D8
                    db $D8,$42,$E2,$42,$42,$42,$D1,$D1
                    db $D1,$D1,$D1,$42,$E2,$E2,$42,$D8
                    db $D8,$42,$42,$E2,$E2,$E2,$42,$42
                    db $42,$42,$E2,$E2,$E2,$42,$42,$D8
                    db $D8,$42,$42,$42,$42,$E2,$E2,$E2
                    db $E2,$E2,$E2,$42,$42,$42,$42,$D8
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$BC,$45,$47,$E2,$BC,$45
                    db $47,$45,$47,$45,$47,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$46,$E2,$E2,$E2
                    db $E2,$E2,$46,$E2,$54,$E2,$E2,$E2
                    db $E2,$E2,$44,$45,$03,$E2,$E2,$E2
                    db $67,$45,$4A,$E2,$BC,$E2,$E2,$E2
                    db $E2,$E2,$46,$E2,$E2,$E2,$E2,$E2
                    db $46,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$04,$45,$BC,$45,$47,$45
                    db $4A,$45,$47,$45,$BC,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
                    db $42,$42,$42,$42,$42,$42,$42,$42
                    db $42,$42,$42,$42,$42,$42,$42,$42
                    db $42,$42,$42,$42,$42,$42,$42,$42
                    db $42,$42,$42,$42,$42,$42,$42,$42
                    db $D8,$61,$63,$63,$63,$61,$63,$63
                    db $63,$63,$61,$63,$63,$63,$61,$D8
                    db $D8,$64,$62,$62,$62,$62,$62,$62
                    db $62,$62,$62,$62,$62,$62,$64,$D8
                    db $D8,$64,$42,$E1,$42,$E1,$42,$E1
                    db $42,$E1,$42,$42,$CA,$CB,$64,$D8
                    db $D8,$64,$BC,$45,$47,$56,$47,$45
                    db $47,$45,$47,$45,$CC,$CD,$64,$D8
                    db $D8,$61,$63,$63,$63,$61,$63,$63
                    db $63,$63,$61,$63,$63,$63,$61,$D8
                    db $62,$62,$62,$62,$62,$62,$62,$62
                    db $62,$62,$62,$62,$62,$62,$62,$D8
                    db $42,$42,$42,$42,$42,$42,$42,$42
                    db $42,$42,$42,$42,$42,$42,$42,$42
                    db $FF,$02,$8D,$8D,$8D,$8D,$8D,$8D
                    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D
                    db $02,$02,$8D,$8D,$8D,$8D,$8D,$8D
                    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D
                    db $02,$02,$8D,$8D,$87,$95,$95,$95
                    db $95,$95,$95,$95,$95,$95,$95,$88
                    db $02,$02,$88,$8D,$8E,$44,$45,$BC
                    db $45,$BC,$45,$BC,$42,$42,$42,$8C
                    db $02,$02,$90,$8D,$8E,$42,$42,$42
                    db $42,$42,$42,$42,$42,$42,$84,$90
                    db $02,$02,$8D,$87,$96,$44,$45,$BC
                    db $45,$BC,$45,$BC,$42,$A1,$93,$8D
                    db $02,$02,$8D,$8E,$42,$42,$42,$42
                    db $42,$42,$42,$42,$42,$42,$8C,$8D
                    db $02,$02,$8D,$8E,$42,$42,$84,$85
                    db $86,$44,$45,$BC,$42,$84,$90,$8D
                    db $02,$02,$8D,$8F,$85,$85,$90,$8D
                    db $8F,$85,$85,$85,$85,$90,$8D,$8D
                    db $02,$FF,$BC,$45,$00,$00,$00,$00
                    db $04,$00,$07,$00,$0A,$00,$0E,$00
                    db $42,$08,$83,$0C,$C4,$10,$05,$15
                    db $04,$00,$67,$0C,$CA,$18,$00,$00
                    db $00,$00,$BC,$45,$21,$04,$00,$00
                    db $05,$00,$08,$00,$0B,$00,$0F,$00
                    db $42,$08,$83,$0C,$C4,$10,$26,$19
                    db $04,$00,$67,$0C,$EB,$1C,$62,$04
                    db $84,$10,$BC,$45,$C6,$18,$00,$00
                    db $06,$00,$09,$00,$0C,$00,$10,$00
                    db $42,$08,$83,$0C,$E5,$14,$47,$1D
                    db $04,$00,$67,$0C,$0C,$21,$E5,$18
                    db $08,$21,$BC,$45,$6B,$2D,$00,$00
                    db $07,$00,$0A,$00,$0D,$00,$11,$00
                    db $42,$08,$A4,$10,$06,$19,$68,$21
                    db $04,$00,$67,$0C,$2D,$25,$68,$2D
                    db $8C,$31,$BC,$45,$10,$42,$00,$00
                    db $08,$00,$0B,$00,$0E,$00,$12,$00
                    db $63,$0C,$C5,$14,$27,$1D,$89,$25
                    db $04,$00,$67,$0C,$4E,$29,$EB,$41
                    db $11,$42,$BC,$45,$B5,$56,$21,$04
                    db $09,$00,$0C,$00,$0F,$00,$13,$00
                    db $84,$10,$E6,$18,$48,$21,$AA,$29
                    db $04,$00,$67,$0C,$6F,$2D,$6E,$56
                    db $94,$56,$BC,$45,$5A,$6B,$42,$08
                    db $0A,$00,$0D,$00,$10,$00,$14,$00
                    db $A5,$14,$07,$1D,$69,$25,$CB,$2D
                    db $04,$00,$67,$0C,$90,$31,$F1,$6A
                    db $17,$6B,$BC,$45,$FF,$7F,$63,$0C
                    db $0B,$00,$0E,$00,$11,$00,$15,$00
                    db $C6,$18,$28,$21,$8A,$29,$EC,$31
                    db $04,$00,$67,$0C,$B1,$35,$74,$7F
                    db $9A,$7F,$1D,$63,$1D,$63,$1D,$63
                    db $1D,$63,$1C,$64,$1C,$64,$1C,$64
                    db $1C,$64,$1B,$65,$1B,$65,$1B,$65
                    db $1B,$65,$1A,$66,$1A,$66,$1A,$66
                    db $1A,$66,$19,$67,$19,$67,$19,$67
                    db $19,$67,$18,$68,$18,$68,$18,$68
                    db $18,$68,$17,$69,$17,$69,$17,$69
                    db $17,$69,$16,$6A,$16,$6A,$16,$6A
                    db $16,$6A,$15,$6B,$15,$6B,$15,$6B
                    db $15,$6B,$14,$6C,$14,$6C,$14,$6C
                    db $14,$6C,$13,$6D,$13,$6D,$13,$6D
                    db $13,$6D,$12,$6E,$12,$6E,$12,$6E
                    db $12,$6E,$11,$6F,$11,$6F,$11,$6F
                    db $11,$6F,$10,$70,$10,$70,$10,$70
                    db $10,$70,$0F,$71,$0F,$71,$0F,$71
                    db $0F,$71,$0E,$72,$0E,$72,$0E,$72
                    db $0E,$72,$0D,$73,$0D,$73,$0D,$73
                    db $0D,$73,$0C,$74,$0C,$74,$0C,$74
                    db $0C,$74,$0B,$75,$0B,$75,$0B,$75
                    db $0B,$75,$0A,$76,$0A,$76,$0A,$76
                    db $0A,$76,$09,$77,$09,$77,$09,$77
                    db $09,$77,$08,$78,$08,$78,$08,$78
                    db $08,$78,$07,$79,$07,$79,$07,$79
                    db $07,$79,$06,$7A,$06,$7A,$06,$7A
                    db $06,$7A,$05,$7B,$05,$7B,$05,$7B
                    db $05,$7B,$04,$7C,$04,$7C,$04,$7C
                    db $04,$7C,$03,$7D,$03,$7D,$03,$7D
                    db $03,$7D,$02,$7E,$02,$7E,$02,$7E
                    db $02,$7E,$01,$7F,$01,$7F,$01,$7F
                    db $01,$7F,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$9D,$E3,$9D,$E3,$9D,$E3
                    db $9D,$E3,$9C,$E4,$9C,$E4,$9C,$E4
                    db $9C,$E4,$9B,$E5,$9B,$E5,$9B,$E5
                    db $9B,$E5,$9A,$E6,$9A,$E6,$9A,$E6
                    db $9A,$E6,$99,$E7,$99,$E7,$99,$E7
                    db $99,$E7,$98,$E8,$98,$E8,$98,$E8
                    db $98,$E8,$97,$E9,$97,$E9,$97,$E9
                    db $97,$E9,$96,$EA,$96,$EA,$96,$EA
                    db $96,$EA,$95,$EB,$95,$EB,$95,$EB
                    db $95,$EB,$94,$EC,$94,$EC,$94,$EC
                    db $94,$EC,$93,$ED,$93,$ED,$93,$ED
                    db $93,$ED,$92,$EE,$92,$EE,$92,$EE
                    db $92,$EE,$91,$EF,$91,$EF,$91,$EF
                    db $91,$EF,$90,$F0,$90,$F0,$90,$F0
                    db $90,$F0,$8F,$F1,$8F,$F1,$8F,$F1
                    db $8F,$F1,$8E,$F2,$8E,$F2,$8E,$F2
                    db $8E,$F2,$8D,$F3,$8D,$F3,$8D,$F3
                    db $8D,$F3,$8C,$F4,$8C,$F4,$8C,$F4
                    db $8C,$F4,$8B,$F5,$8B,$F5,$8B,$F5
                    db $8B,$F5,$8A,$F6,$8A,$F6,$8A,$F6
                    db $8A,$F6,$89,$F7,$89,$F7,$89,$F7
                    db $89,$F7,$88,$F8,$88,$F8,$88,$F8
                    db $88,$F8,$87,$F9,$87,$F9,$87,$F9
                    db $87,$F9,$86,$FA,$86,$FA,$86,$FA
                    db $86,$FA,$85,$FB,$85,$FB,$85,$FB
                    db $85,$FB,$84,$FC,$84,$FC,$84,$FC
                    db $84,$FC,$83,$FD,$83,$FD,$83,$FD
                    db $83,$FD,$82,$FE,$82,$FE,$82,$FE
                    db $82,$FE,$81,$FF,$81,$FF,$81,$FF
                    db $81,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$80,$FF,$80,$FF,$80,$FF
                    db $80,$FF,$00,$00,$05,$FF,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F4,$01
                    db $F5,$01,$F5,$41,$F4,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$F8,$01
                    db $F9,$01,$F9,$41,$F8,$41,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $FA,$01,$FA,$41,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$45,$09,$30,$08,$31,$08
                    db $32,$08,$33,$08,$34,$08,$35,$08
                    db $36,$08,$37,$08,$38,$08,$39,$08
                    db $3A,$08,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3B,$1C,$3C,$1C,$3D,$1C
                    db $3E,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$46,$09,$40,$08,$41,$08
                    db $42,$08,$43,$08,$44,$08,$45,$08
                    db $46,$08,$47,$08,$48,$08,$49,$08
                    db $4A,$08,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$4B,$1C,$4C,$1C,$4D,$1C
                    db $4E,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3B,$1C,$3C,$1C,$3D,$1C
                    db $3E,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$47,$09,$50,$08,$51,$08
                    db $52,$08,$53,$08,$54,$08,$55,$08
                    db $56,$08,$57,$08,$58,$08,$59,$08
                    db $5A,$08,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$4B,$1C,$4C,$1C,$4D,$1C
                    db $4E,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$48,$09,$60,$08,$61,$08
                    db $62,$08,$63,$08,$64,$08,$5C,$00
                    db $66,$08,$67,$08,$68,$08,$69,$08
                    db $6A,$08,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$40,$09
                    db $70,$08,$71,$08,$72,$08,$73,$08
                    db $74,$08,$75,$08,$76,$08,$77,$08
                    db $78,$08,$79,$08,$5C,$00,$5C,$00
                    db $5C,$00,$7D,$08,$7E,$08,$7F,$08
                    db $C0,$08,$C1,$08,$C2,$08,$5C,$00
                    db $C4,$08,$C5,$08,$CE,$08,$CF,$08
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$41,$09
                    db $80,$08,$81,$08,$82,$08,$83,$08
                    db $84,$08,$85,$08,$86,$08,$87,$08
                    db $88,$08,$89,$08,$8A,$08,$8B,$08
                    db $8C,$08,$8D,$08,$8E,$08,$8F,$08
                    db $D0,$08,$D1,$08,$D2,$08,$D3,$08
                    db $D4,$08,$D5,$08,$49,$09,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$42,$09
                    db $90,$08,$91,$08,$92,$08,$93,$08
                    db $94,$08,$95,$08,$96,$08,$97,$08
                    db $98,$08,$99,$08,$9A,$08,$9B,$08
                    db $9C,$08,$9D,$08,$9E,$08,$9F,$08
                    db $E0,$08,$E1,$08,$E2,$08,$E3,$08
                    db $E4,$08,$E5,$08,$4A,$09,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$43,$09
                    db $A0,$08,$A1,$08,$A2,$08,$A3,$08
                    db $A4,$08,$A5,$08,$A6,$08,$A7,$08
                    db $A8,$08,$A9,$08,$AA,$08,$AB,$08
                    db $AC,$08,$AD,$08,$AE,$08,$AF,$08
                    db $F0,$08,$F1,$08,$F2,$08,$F3,$08
                    db $F4,$08,$F5,$08,$4B,$09,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5B,$1C
                    db $6B,$1C,$5C,$00,$5C,$00,$44,$09
                    db $B0,$08,$B1,$08,$B2,$08,$B3,$08
                    db $B4,$08,$B5,$08,$B6,$08,$B7,$08
                    db $B8,$08,$B9,$08,$BA,$08,$BB,$08
                    db $BC,$08,$BD,$08,$BE,$08,$BF,$08
                    db $C6,$08,$C7,$08,$C8,$08,$D6,$08
                    db $D7,$08,$D8,$08,$E8,$08,$04,$1C
                    db $05,$1C,$06,$1C,$07,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$C9,$04,$CA,$04,$CB,$04
                    db $CC,$04,$CD,$04,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$14,$1C
                    db $3B,$1D,$3C,$1D,$17,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$D9,$04,$DA,$04,$DB,$04
                    db $DC,$04,$DD,$04,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$3F,$1D
                    db $21,$1C,$3D,$1D,$12,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$E9,$04,$EA,$04,$EB,$04
                    db $EC,$04,$ED,$04,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$3F,$1D
                    db $21,$1C,$3D,$1D,$12,$1C,$04,$1C
                    db $05,$1C,$06,$1C,$07,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$F9,$04,$FA,$04,$FB,$04
                    db $FF,$04,$FD,$04,$FE,$04,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$04,$1C,$05,$1C,$02,$1C
                    db $03,$1C,$3D,$1D,$12,$1C,$14,$1C
                    db $3B,$1D,$3C,$1D,$17,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$6C,$04,$6D,$04,$6E,$04
                    db $6F,$04,$DE,$04,$DF,$04,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$14,$1C,$3B,$1D,$3C,$1D
                    db $13,$1C,$3D,$1D,$12,$1C,$3F,$1D
                    db $21,$1C,$3D,$1D,$12,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3F,$1D,$21,$1C,$3D,$1D
                    db $23,$1C,$3D,$1D,$12,$1C,$3F,$1D
                    db $21,$1C,$3D,$1D,$12,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3F,$1D,$21,$1C,$3D,$1D
                    db $23,$1C,$3D,$1D,$12,$1C,$3F,$1D
                    db $21,$1C,$00,$1C,$01,$1C,$06,$1C
                    db $07,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3F,$1D,$21,$1C,$3D,$1D
                    db $23,$1C,$3D,$1D,$12,$1C,$3F,$1D
                    db $21,$1C,$10,$1C,$3B,$1D,$3C,$1D
                    db $17,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3F,$1D,$21,$1C,$3D,$1D
                    db $23,$1C,$3D,$1D,$12,$1C,$3F,$1D
                    db $21,$1C,$20,$1C,$21,$1C,$3D,$1D
                    db $12,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$04,$1C
                    db $05,$1C,$02,$1C,$03,$1C,$3D,$1D
                    db $23,$1C,$3D,$1D,$12,$1C,$3F,$1D
                    db $21,$1C,$20,$1C,$21,$1C,$3D,$1D
                    db $12,$1C,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$14,$1C
                    db $3B,$1D,$3C,$1D,$13,$1C,$3D,$1D
                    db $23,$1C,$3D,$1D,$12,$1C,$FF,$FF
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


CODE_2AF800:         PHB             
                    PHK                         
                    PLB                         
                    STZ.w $0202                 
                    LDX.b #$03                  
                    LDY.b #$22                  
                    LDA.w $0598                 
                    BEQ   CODE_2AF818           
                    LDY.b #$23                  
                    LDX.b #$03                  
                    LDA.b #$33                  
                    STA.w $0202                 
CODE_2AF818:        STY.w $0200                 
                    STX.w $0201                 
                    LDA.b #$1C                  
                    STA.w $0281                 
                    STZ.w $0282                 
                    STZ.w $0283                 
                    STZ.w $0285                 
                    LDA.b #$3C                  
                    STA.w $0287                 
                    STZ.w $0288                 
                    LDA.b #$17                  
                    STA.w $0208                 
                    STA.w $020A                 
                    STZ.w $0209                 
                    STZ.w $020B                 
                    LDA.w $0598                 
                    BEQ   CODE_2AF856           
                    DEC.w $0208                 
                    DEC.w $020A                 
                    INC.w $0209                 
                    INC.w $020B                 
                    JMP.w CODE_2AFA1F   
        
CODE_2AF856:        BRL   CODE_2AFA19    
       

                    db $F0,$00,$90,$F0,$E0,$90,$00,$F0
                    db $00,$92,$F0,$E0,$92,$00

              
CODE_2AF867:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b #$02                  
                    STA.b $92                   
                    REP   #$30                  
                    STZ.b $04                   
                    STZ.w $0283                 
                    LDA.w #$0060                
                    STA.b $0E                   
                    SEC                         
                    SBC.w $0281                 
                    STA.w $0289                 
                    CLC                         
                    ADC.w $0281                 
                    CLC                         
                    ADC.w $0281                 
                    STA.w $028B                 
                    LDA.w #$0080                
                    STA.w $028D                 
CODE_2AF892:        LDA.w #$0100                
                    STA.b $00                   
                    STA.b $02                   
                    LDA.w $0289                 
                    BPL   CODE_2AF8AD           
                    LDA.w $0283                 
                    CMP.w $0289                 
                    BCS   $27                   
                    CMP.w $028B                 
                    BCS   $22                   
                    BRA   CODE_2AF8BA   
        
CODE_2AF8AD:        LDA.w $0283                 
                    CMP.w $0289                 
                    BCC   CODE_2AF8CD           
                    CMP.w $028B                 
                    BCS   $13                   
CODE_2AF8BA:        LDA.w $0287                 
                    CLC                         
                    ADC.w $028D                 
                    DEC   A                     
                    STA.b $02                   
                    LDA.w $028D                 
                    SEC                         
                    SBC.w $0287                 
                    STA.b $00                   
CODE_2AF8CD:        LDA.w $0283                 
                    DEC   A                     
                    ASL   A                     
                    CMP.w #$01C0                
                    BCS   $46                   
                    TAX                         
                    LDA.b $00                   
                    TAY                         
                    BMI   CODE_2AF8EC           
                    AND.w #$FF00                
                    BEQ   CODE_2AF8EF           
                    CMP.w #$0100                
                    BNE   CODE_2AF8EC           
                    LDY.w #$00FF                
                    BRA   CODE_2AF8EF 
          
CODE_2AF8EC:        LDY.w #$0000                
CODE_2AF8EF:        TYA                         
                    AND.w #$00FF                
                    STA.b $06                   
                    LDA.b $02                   
                    TAY                         
                    AND.w #$FF00                
                    BEQ   CODE_2AF908           
                    LDY.w #$0000                
                    CMP.w #$0100                
                    BCC   CODE_2AF908           
                    LDY.w #$00FF                
CODE_2AF908:        TYA                         
                    AND.w #$00FF                
                    XBA                         
                    ORA.b $06                   
                    STA.b $06                   
                    CMP.w #$FFFF                
                    BNE   CODE_2AF919           
                    LDA.w #$00FF                
CODE_2AF919:        STA.l $7F9200,x             
                    INC.w $0283                 
                    LDA.w $0283                 
                    CMP.w #$00E1                
                    BCS   $03                   
                    BRL   CODE_2AF892  
         
                    SEP   #$30                  
                    LDA.w $0285                 
                    BEQ   CODE_2AF989           
                    LDA.b #$F8                  
                    CLC                         
                    ADC.w $0287                 
                    STA.w $0287                 
                    BPL   CODE_2AF940           
                    STZ.w $0287                 
CODE_2AF940:        LDA.b #$F8                  
                    CLC                         
                    ADC.w $0281                 
                    STA.w $0281                 
                    BPL   CODE_2AF94E           
                    STZ.w $0281                 
CODE_2AF94E:        LDA.w $0287                 
                    ORA.w $0281                 
                    BNE   CODE_2AF989           
                    INC.w $0728                 
                    STZ.w $0285                 
                    STZ.w $0291                 
                    LDA.w $0598                 
                    BNE   CODE_2AF97F           
                    LDA.b #$13                  
                    STA.w $0208                 
                    STZ.w $020A                 
                    LDA.w $0293                 
                    AND.b #$BF                  
                    STA.w $0293                 
                    STZ.w $0200                 
                    STZ.w $0201                 
                    STZ.w $0202                 
                    BRA   CODE_2AF9A2  
         
CODE_2AF97F:        LDA.w $0598                 
                    BEQ   CODE_2AF989           
                    LDA.b #$32                  
                    STA.w $0202                 
CODE_2AF989:        LDA.w $0598                 
                    BEQ   CODE_2AF992           
                    LDA.b #$16                  
                    BRA   CODE_2AF994           
CODE_2AF992:        LDA.b #$17                  
CODE_2AF994:        STA.w $0208                 
                    STA.w $020A                 
                    LDA.w $0293                 
                    ORA.b #$40                  
                    STA.w $0293                 
CODE_2AF9A2:        PLB                         
                    RTL        
         
        
                    db $FF,$00,$00,$20,$00


CODE_2AF9A9:        PHB                    
                    PHK                         
                    PLB                         
                    LDA.b #$30                  
                    STA.w $0202                 
                    LDY.b #$23                  
                    LDX.w $0291                 
                    CPX.b #$03                  
                    BEQ   CODE_2AF9C1           
                    LDA.b #$33                  
                    STA.w $0202                 
                    LDY.b #$33                  
CODE_2AF9C1:        STY.w $0200                 
                    LDA.b #$03                  
                    STA.w $0201                 
                    LDX.w $0291                 
                    LDA.l $2AF9A3,x             
                    STA.w $0281                 
                    STZ.w $0282                 
                    STZ.w $0287                 
                    STZ.w $0288                 
                    STZ.w $0283                 
                    STZ.w $0285                 
                    STZ.w $028B                 
                    LDA.b #$80                  
                    STA.w $0294                 
                    LDA.b #$80                  
                    STA.w $0295                 
                    STZ.w $0296                 
                    CPX.b #$01                  
                    BEQ   CODE_2AF9FA           
                    CPX.b #$04                  
                    BCC   CODE_2AFA19           
CODE_2AF9FA:        LDA.b #$03                  
                    STA.w $0201                 
                    LDX.w $0726                 
                    LDA.b $43,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0294                 
                    LDA.b $47,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0295                 
                    LDA.b $45,x                 
                    ADC.b #$00                  
                    STA.w $0296                 
CODE_2AFA19:        STZ.w $020B                 
                    STZ.w $0209                 
CODE_2AFA1F:        STZ.w $0203                 
                    STZ.w $0204                 
                    LDA.b #$41                  
                    STA.w $4370                 
                    LDA.b #$26                  
                    STA.w $4371                 
                    LDA.b #$59                  
                    STA.w $4372                 
                    LDA.b #$F8                  
                    STA.w $4373                 
                    LDA.b #$2A                  
                    STA.w $4374                 
                    LDA.b #$7F                  
                    STA.w $4377                 
                    LDA.b #$41                  
                    STA.w $4360                 
                    LDA.b #$26                  
                    STA.w $4361                 
                    LDA.b #$60                  
                    STA.w $4362                 
                    LDA.b #$F8                  
                    STA.w $4363                 
                    LDA.b #$2A                  
                    STA.w $4364                 
                    LDA.b #$7F                  
                    STA.w $4367                 
                    PLB                         
                    RTL       
                  
CODE_2AFA63:        PHB                       ;0 S:01FF P:EnvMXdIzc HC:6790 VC:000 FC:00 I:00
                    PHK                       ;0 S:01FF P:EnvMXdIzc HC:6806 VC:000 FC:00 I:00
                    PLB                       ;0 S:01FF P:EnvMXdIzc HC:6822 VC:000 FC:00 I:00
                    PHD                       ;0 S:01FF P:EnvMXdIzc HC:6838 VC:000 FC:00 I:00
                    LDA.b #$22                ;0 S:01FF P:EnvMXdIzc HC:6854 VC:000 FC:00 I:00
                    STA.w $0203               ;0 S:01FF P:EnvMXdIzc HC:6870 VC:000 FC:00 I:00
                    REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:6894 VC:000 FC:00 I:00
                    LDA.w #$0200              ;0 S:01FF P:EnvmxdIzc HC:6910 VC:000 FC:00 I:00
                    TCD                       ;0 S:01FF P:EnvmxdIzc HC:6926 VC:000 FC:00 I:00
                    LDA.w #$9000              ;0 S:01FF P:EnvmxdIzc HC:6942 VC:000 FC:00 I:00
                    STA.b $AB                 ;0 S:01FF P:EnvmxdIzc HC:6958 VC:000 FC:00 I:00
                    LDA.w #$007F              ;0 S:01FF P:EnvmxdIzc HC:6974 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:6990 VC:000 FC:00 I:00
                    TSB.b $AD                 ;0 S:01FF P:EnvmxdIzc HC:7006 VC:000 FC:00 I:00
                    LDA.b $8B                 ;0 S:01FF P:EnvmxdIzc HC:7022 VC:000 FC:00 I:00
                    AND.w #$0001              ;0 S:01FF P:EnvmxdIzc HC:7038 VC:000 FC:00 I:00
                    BEQ   CODE_2AFA93         ;0 S:01FF P:EnvmxdIzc HC:7054 VC:000 FC:00 I:00
                    LDA.w #$9200              ;0 S:01FF P:EnvmxdIzc HC:7070 VC:000 FC:00 I:00
                    STA.b $AB                 ;0 S:01FF P:EnvmxdIzc HC:7086 VC:000 FC:00 I:00
                    LDA.w #$007F              ;0 S:01FF P:EnvmxdIzc HC:7102 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7118 VC:000 FC:00 I:00
                    TSB.b $AD                 ;0 S:01FF P:EnvmxdIzc HC:7134 VC:000 FC:00 I:00
CODE_2AFA93:        STZ.b $9D                 ;0 S:01FF P:EnvmxdIzc HC:7150 VC:000 FC:00 I:00
                    STZ.b $A7                 ;0 S:01FF P:EnvmxdIzc HC:7166 VC:000 FC:00 I:00
                    STZ.b $83                 ;0 S:01FF P:EnvmxdIzc HC:7182 VC:000 FC:00 I:00
                    STZ.b $97                 ;0 S:01FF P:EnvmxdIzc HC:7198 VC:000 FC:00 I:00
                    LDA.b $81                 ;0 S:01FF P:EnvmxdIzc HC:7214 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7230 VC:000 FC:00 I:00
                    ASL   A                   ;0 S:01FF P:EnvmxdIzc HC:7246 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvmxdIzc HC:7262 VC:000 FC:00 I:00
                    LDA.l DATA_009780,x       ;0 S:01FF P:EnvmxdIzc HC:7278 VC:000 FC:00 I:00
                    STA.b $A9                 ;0 S:01FF P:EnvmxdIzc HC:7294 VC:000 FC:00 I:00
                    LDA.b $94                 ;0 S:01FF P:EnvmxdIzc HC:7310 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7326 VC:000 FC:00 I:00
                    STA.b $89                 ;0 S:01FF P:EnvmxdIzc HC:7342 VC:000 FC:00 I:00
                    LDA.b $96                 ;0 S:01FF P:EnvmxdIzc HC:7358 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7374 VC:000 FC:00 I:00
                    XBA                       ;0 S:01FF P:EnvmxdIzc HC:7390 VC:000 FC:00 I:00
                    STA.b $99                 ;0 S:01FF P:EnvmxdIzc HC:7406 VC:000 FC:00 I:00
                    LDA.b $95                 ;0 S:01FF P:EnvmxdIzc HC:7422 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7438 VC:000 FC:00 I:00
                    ORA.b $99                 ;0 S:01FF P:EnvmxdIzc HC:7454 VC:000 FC:00 I:00
                    STA.b $8D                 ;0 S:01FF P:EnvmxdIzc HC:7470 VC:000 FC:00 I:00
                    LDA.b $91                 ;0 S:01FF P:EnvmxdIzc HC:7486 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7502 VC:000 FC:00 I:00
                    CMP.w #$0002              ;0 S:01FF P:EnvmxdIzc HC:7518 VC:000 FC:00 I:00
                    BEQ   CODE_2AFAD1         ;0 S:01FF P:EnvmxdIzc HC:7534 VC:000 FC:00 I:00
                    LDA.b $8D                 ;0 S:01FF P:EnvmxdIzc HC:7550 VC:000 FC:00 I:00
                    SEC                       ;0 S:01FF P:EnvmxdIzc HC:7566 VC:000 FC:00 I:00
                    SBC.b $10                 ;0 S:01FF P:EnvmxdIzc HC:7582 VC:000 FC:00 I:00
                    STA.b $8D                 ;0 S:01FF P:EnvmxdIzc HC:7598 VC:000 FC:00 I:00
CODE_2AFAD1:        LDA.w #$0100              ;0 S:01FF P:EnvmxdIzc HC:7614 VC:000 FC:00 I:00
                    STA.b $99                 ;0 S:01FF P:EnvmxdIzc HC:7630 VC:000 FC:00 I:00
                    STA.b $9B                 ;0 S:01FF P:EnvmxdIzc HC:7646 VC:000 FC:00 I:00
                    LDA.b $83                 ;0 S:01FF P:EnvmxdIzc HC:7662 VC:000 FC:00 I:00
                    INC   A                   ;0 S:01FF P:EnvmxdIzc HC:7678 VC:000 FC:00 I:00
                    CMP.b $81                 ;0 S:01FF P:EnvmxdIzc HC:7694 VC:000 FC:00 I:00
                    BCS   CODE_2AFB15         ;0 S:01FF P:EnvmxdIzc HC:7710 VC:000 FC:00 I:00
                    LDA.b $97                 ;0 S:01FF P:EnvmxdIzc HC:7726 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:7742 VC:000 FC:00 I:00
                    ADC.b $A9                 ;0 S:01FF P:EnvmxdIzc HC:7758 VC:000 FC:00 I:00
                    STA.b $97                 ;0 S:01FF P:EnvmxdIzc HC:7774 VC:000 FC:00 I:00
                    XBA                       ;0 S:01FF P:EnvmxdIzc HC:7790 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:7806 VC:000 FC:00 I:00
                    LSR   A                   ;0 S:01FF P:EnvmxdIzc HC:7822 VC:000 FC:00 I:00
                    SEP   #$30                ;0 S:01FF P:EnvmxdIzc HC:7846 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvMXdIzc HC:7862 VC:000 FC:00 I:00
                    LDA.l DATA_0096FF,x       ;0 S:01FF P:EnvMXdIzc HC:7878 VC:000 FC:00 I:00
                    STA.w $4202               ;0 S:01FF P:EnvMXdIzc HC:7894 VC:000 FC:00 I:00
                    LDA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:7910 VC:000 FC:00 I:00
                    STA.w $4203               ;0 S:01FF P:EnvMXdIzc HC:7926 VC:000 FC:00 I:00
                    NOP                       ;0 S:01FF P:EnvMXdIzc HC:7942 VC:000 FC:00 I:00
                    NOP                       ;0 S:01FF P:EnvMXdIzc HC:7958 VC:000 FC:00 I:00
                    NOP                       ;0 S:01FF P:EnvMXdIzc HC:7974 VC:000 FC:00 I:00
                    NOP                       ;0 S:01FF P:EnvMXdIzc HC:7990 VC:000 FC:00 I:00
                    LDA.w $4217               ;0 S:01FF P:EnvMXdIzc HC:8006 VC:000 FC:00 I:00
                    STA.b $A1                 ;0 S:01FF P:EnvMXdIzc HC:8022 VC:000 FC:00 I:00
                    STZ.b $A2                 ;0 S:01FF P:EnvMXdIzc HC:8038 VC:000 FC:00 I:00
                    REP   #$30                ;0 S:01FF P:EnvMXdIzc HC:8062 VC:000 FC:00 I:00
                    LDA.b $A1                 ;0 S:01FF P:EnvmxdIzc HC:8078 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:8094 VC:000 FC:00 I:00
                    ADC.b $8D                 ;0 S:01FF P:EnvmxdIzc HC:8110 VC:000 FC:00 I:00
                    STA.b $9B                 ;0 S:01FF P:EnvmxdIzc HC:8126 VC:000 FC:00 I:00
                    LDA.b $8D                 ;0 S:01FF P:EnvmxdIzc HC:8142 VC:000 FC:00 I:00
                    SEC                       ;0 S:01FF P:EnvmxdIzc HC:8158 VC:000 FC:00 I:00
                    SBC.b $A1                 ;0 S:01FF P:EnvmxdIzc HC:8174 VC:000 FC:00 I:00
                    STA.b $99                 ;0 S:01FF P:EnvmxdIzc HC:8190 VC:000 FC:00 I:00
CODE_2AFB15:        LDA.b $89                 ;0 S:01FF P:EnvmxdIzc HC:8206 VC:000 FC:00 I:00
                    SEC                       ;0 S:01FF P:EnvmxdIzc HC:8222 VC:000 FC:00 I:00
                    SBC.b $83                 ;0 S:01FF P:EnvmxdIzc HC:8238 VC:000 FC:00 I:00
                    DEC   A                   ;0 S:01FF P:EnvmxdIzc HC:8254 VC:000 FC:00 I:00
                    ASL   A                   ;0 S:01FF P:EnvmxdIzc HC:8270 VC:000 FC:00 I:00
                    STA.b $9D                 ;0 S:01FF P:EnvmxdIzc HC:8286 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvmxdIzc HC:8302 VC:000 FC:00 I:00
                    LDA.b $99                 ;0 S:01FF P:EnvmxdIzc HC:8318 VC:000 FC:00 I:00
                    TAY                       ;0 S:01FF P:EnvmxdIzc HC:8334 VC:000 FC:00 I:00
                    BMI   CODE_2AFB33         ;0 S:01FF P:EnvmxdIzc HC:8350 VC:000 FC:00 I:00
                    AND.w #$FF00              ;0 S:01FF P:EnvmxdIzc HC:8366 VC:000 FC:00 I:00
                    BEQ   CODE_2AFB36         ;0 S:01FF P:EnvmxdIzc HC:8382 VC:000 FC:00 I:00
                    CMP.w #$0100              ;0 S:01FF P:EnvmxdIzc HC:8398 VC:000 FC:00 I:00
                    BNE   CODE_2AFB33         ;0 S:01FF P:EnvmxdIzc HC:8414 VC:000 FC:00 I:00
                    LDY.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:8430 VC:000 FC:00 I:00
                    BRA   CODE_2AFB36         ;0 S:01FF P:EnvmxdIzc HC:8446 VC:000 FC:00 I:00

CODE_2AFB33:        LDY.w #$0000              ;0 S:01FF P:EnvmxdIzc HC:8462 VC:000 FC:00 I:00
CODE_2AFB36:        TYA                       ;0 S:01FF P:EnvmxdIzc HC:8478 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:8494 VC:000 FC:00 I:00
                    STA.b $9F                 ;0 S:01FF P:EnvmxdIzc HC:8510 VC:000 FC:00 I:00
                    LDA.b $9B                 ;0 S:01FF P:EnvmxdIzc HC:8526 VC:000 FC:00 I:00
                    TAY                       ;0 S:01FF P:EnvmxdIzc HC:8542 VC:000 FC:00 I:00
                    AND.w #$FF00              ;0 S:01FF P:EnvmxdIzc HC:8558 VC:000 FC:00 I:00
                    BEQ   CODE_2AFB47         ;0 S:01FF P:EnvmxdIzc HC:8574 VC:000 FC:00 I:00
                    LDY.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:8590 VC:000 FC:00 I:00
CODE_2AFB47:        TYA                       ;0 S:01FF P:EnvmxdIzc HC:8606 VC:000 FC:00 I:00
                    AND.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:8622 VC:000 FC:00 I:00
                    XBA                       ;0 S:01FF P:EnvmxdIzc HC:8638 VC:000 FC:00 I:00
                    ORA.b $9F                 ;0 S:01FF P:EnvmxdIzc HC:8654 VC:000 FC:00 I:00
                    STA.b $9F                 ;0 S:01FF P:EnvmxdIzc HC:8670 VC:000 FC:00 I:00
                    CPX.w #$01C0              ;0 S:01FF P:EnvmxdIzc HC:8686 VC:000 FC:00 I:00
                    BCS   CODE_2AFB60         ;0 S:01FF P:EnvmxdIzc HC:8702 VC:000 FC:00 I:00
                    CMP.w #$FFFF              ;0 S:01FF P:EnvmxdIzc HC:8718 VC:000 FC:00 I:00
                    BNE   CODE_2AFB5D         ;0 S:01FF P:EnvmxdIzc HC:8734 VC:000 FC:00 I:00
                    LDA.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:8750 VC:000 FC:00 I:00
CODE_2AFB5D:        TXY                       ;0 S:01FF P:EnvmxdIzc HC:8766 VC:000 FC:00 I:00
                    STA.b [$AB],y             ;0 S:01FF P:EnvmxdIzc HC:8782 VC:000 FC:00 I:00
CODE_2AFB60:        LDA.b $89                 ;0 S:01FF P:EnvmxdIzc HC:8798 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvmxdIzc HC:8814 VC:000 FC:00 I:00
                    ADC.b $83                 ;0 S:01FF P:EnvmxdIzc HC:8830 VC:000 FC:00 I:00
                    DEC   A                   ;0 S:01FF P:EnvmxdIzc HC:8846 VC:000 FC:00 I:00
                    ASL   A                   ;0 S:01FF P:EnvmxdIzc HC:8862 VC:000 FC:00 I:00
                    STA.b $A7                 ;0 S:01FF P:EnvmxdIzc HC:8878 VC:000 FC:00 I:00
                    CMP.w #$01C0              ;0 S:01FF P:EnvmxdIzc HC:8894 VC:000 FC:00 I:00
                    BCS   CODE_2AFB7C         ;0 S:01FF P:EnvmxdIzc HC:8910 VC:000 FC:00 I:00
                    TAX                       ;0 S:01FF P:EnvmxdIzc HC:8926 VC:000 FC:00 I:00
                    LDA.b $9F                 ;0 S:01FF P:EnvmxdIzc HC:8942 VC:000 FC:00 I:00
                    CMP.w #$FFFF              ;0 S:01FF P:EnvmxdIzc HC:8958 VC:000 FC:00 I:00
                    BNE   CODE_2AFB79         ;0 S:01FF P:EnvmxdIzc HC:8974 VC:000 FC:00 I:00
                    LDA.w #$00FF              ;0 S:01FF P:EnvmxdIzc HC:8990 VC:000 FC:00 I:00
CODE_2AFB79:        TXY                       ;0 S:01FF P:EnvmxdIzc HC:9006 VC:000 FC:00 I:00
                    STA.b [$AB],y             ;0 S:01FF P:EnvmxdIzc HC:9022 VC:000 FC:00 I:00
CODE_2AFB7C:        INC.b $83                 ;0 S:01FF P:EnvmxdIzc HC:9038 VC:000 FC:00 I:00
                    LDA.b $9D                 ;0 S:01FF P:EnvmxdIzc HC:9054 VC:000 FC:00 I:00
                    CMP.w #$01C0              ;0 S:01FF P:EnvmxdIzc HC:9070 VC:000 FC:00 I:00
                    BCC   CODE_2AFB8C         ;0 S:01FF P:EnvmxdIzc HC:9086 VC:000 FC:00 I:00
                    LDA.b $A7                 ;0 S:01FF P:EnvmxdIzc HC:9102 VC:000 FC:00 I:00
                    CMP.w #$01C0              ;0 S:01FF P:EnvmxdIzc HC:9118 VC:000 FC:00 I:00
                    BCS   CODE_2AFB8F         ;0 S:01FF P:EnvmxdIzc HC:9134 VC:000 FC:00 I:00
CODE_2AFB8C:        BRL   CODE_2AFAD1         ;0 S:01FF P:EnvmxdIzc HC:9150 VC:000 FC:00 I:00

CODE_2AFB8F:        SEP   #$30                ;0 S:01FF P:EnvmxdIzc HC:9174 VC:000 FC:00 I:00
                    LDA.b $91                 ;0 S:01FF P:EnvMXdIzc HC:9190 VC:000 FC:00 I:00
                    DEC   A                   ;0 S:01FF P:EnvMXdIzc HC:9206 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC04         ;0 S:01FF P:EnvMXdIzc HC:9222 VC:000 FC:00 I:00
                    CMP.b #$03                ;0 S:01FF P:EnvMXdIzc HC:9238 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC04         ;0 S:01FF P:EnvMXdIzc HC:9254 VC:000 FC:00 I:00
                    CMP.b #$04                ;0 S:01FF P:EnvMXdIzc HC:9270 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC14         ;0 S:01FF P:EnvMXdIzc HC:9286 VC:000 FC:00 I:00
                    LDA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:9302 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvMXdIzc HC:9318 VC:000 FC:00 I:00
                    ADC.b #$08                ;0 S:01FF P:EnvMXdIzc HC:9334 VC:000 FC:00 I:00
                    STA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:9350 VC:000 FC:00 I:00
                    BCS   CODE_2AFBAA         ;0 S:01FF P:EnvMXdIzc HC:9366 VC:000 FC:00 I:00
                    JMP.w CODE_2AFC28         ;0 S:01FF P:EnvMXdIzc HC:9382 VC:000 FC:00 I:00

CODE_2AFBAA:        LDA.b #$38                ;0 S:01FF P:EnvMXdIzc HC:9398 VC:000 FC:00 I:00
                    STA.w $1050               ;0 S:01FF P:EnvMXdIzc HC:9414 VC:000 FC:00 I:00
                    STZ.b $85                 ;0 S:01FF P:EnvMXdIzc HC:9430 VC:000 FC:00 I:00
                    STZ.b $91                 ;0 S:01FF P:EnvMXdIzc HC:9446 VC:000 FC:00 I:00
                    STZ.b $93                 ;0 S:01FF P:EnvMXdIzc HC:9462 VC:000 FC:00 I:00
                    STZ.b $00                 ;0 S:01FF P:EnvMXdIzc HC:9478 VC:000 FC:00 I:00
                    STZ.b $01                 ;0 S:01FF P:EnvMXdIzc HC:9494 VC:000 FC:00 I:00
                    STZ.b $02                 ;0 S:01FF P:EnvMXdIzc HC:9510 VC:000 FC:00 I:00
                    LDA.b #$02                ;0 S:01FF P:EnvMXdIzc HC:9526 VC:000 FC:00 I:00
                    STA.w $0203               ;0 S:01FF P:EnvMXdIzc HC:9542 VC:000 FC:00 I:00
                    LDA.b #$11                ;0 S:01FF P:EnvMXdIzc HC:9558 VC:000 FC:00 I:00
                    LDX.w $02BF               ;0 S:01FF P:EnvMXdIzc HC:9574 VC:000 FC:00 I:00
                    CPX.b #$01                ;0 S:01FF P:EnvMXdIzc HC:9590 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBEF         ;0 S:01FF P:EnvMXdIzc HC:9606 VC:000 FC:00 I:00
                    CPX.b #$05                ;0 S:01FF P:EnvMXdIzc HC:9622 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBEF         ;0 S:01FF P:EnvMXdIzc HC:9638 VC:000 FC:00 I:00
                    CPX.b #$06                ;0 S:01FF P:EnvMXdIzc HC:9654 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBEF         ;0 S:01FF P:EnvMXdIzc HC:9670 VC:000 FC:00 I:00
                    CPX.b #$09                ;0 S:01FF P:EnvMXdIzc HC:9686 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBF3         ;0 S:01FF P:EnvMXdIzc HC:9702 VC:000 FC:00 I:00
                    CPX.b #$0A                ;0 S:01FF P:EnvMXdIzc HC:9718 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBF3         ;0 S:01FF P:EnvMXdIzc HC:9734 VC:000 FC:00 I:00
                    CPX.b #$0B                ;0 S:01FF P:EnvMXdIzc HC:9750 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBF3         ;0 S:01FF P:EnvMXdIzc HC:9766 VC:000 FC:00 I:00
                    CPX.b #$0C                ;0 S:01FF P:EnvMXdIzc HC:9782 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBF3         ;0 S:01FF P:EnvMXdIzc HC:9798 VC:000 FC:00 I:00
                    CPX.b #$0F                ;0 S:01FF P:EnvMXdIzc HC:9814 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBF3         ;0 S:01FF P:EnvMXdIzc HC:9830 VC:000 FC:00 I:00
                    CPX.b #$03                ;0 S:01FF P:EnvMXdIzc HC:9846 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBFC         ;0 S:01FF P:EnvMXdIzc HC:9862 VC:000 FC:00 I:00
                    CPX.b #$04                ;0 S:01FF P:EnvMXdIzc HC:9878 VC:000 FC:00 I:00
                    BEQ   CODE_2AFBFC         ;0 S:01FF P:EnvMXdIzc HC:9894 VC:000 FC:00 I:00
                    BRA   CODE_2AFBF1         ;0 S:01FF P:EnvMXdIzc HC:9910 VC:000 FC:00 I:00

CODE_2AFBEF:        ORA.b #$02                ;0 S:01FF P:EnvMXdIzc HC:9926 VC:000 FC:00 I:00
CODE_2AFBF1:        ORA.b #$04                ;0 S:01FF P:EnvMXdIzc HC:9942 VC:000 FC:00 I:00
CODE_2AFBF3:        STA.b $08                 ;0 S:01FF P:EnvMXdIzc HC:9958 VC:000 FC:00 I:00
                    STZ.b $0A                 ;0 S:01FF P:EnvMXdIzc HC:9974 VC:000 FC:00 I:00
                    STZ.w $028C               ;0 S:01FF P:EnvMXdIzc HC:9990 VC:000 FC:00 I:00
                    BRA   CODE_2AFC71         ;0 S:01FF P:EnvMXdIzc HC:10006 VC:000 FC:00 I:00

CODE_2AFBFC:        LDA.b #$13                ;0 S:01FF P:EnvMXdIzc HC:10022 VC:000 FC:00 I:00
                    STA.b $08                 ;0 S:01FF P:EnvMXdIzc HC:10038 VC:000 FC:00 I:00
                    STZ.b $0A                 ;0 S:01FF P:EnvMXdIzc HC:10054 VC:000 FC:00 I:00
                    BRA   CODE_2AFC71         ;0 S:01FF P:EnvMXdIzc HC:10070 VC:000 FC:00 I:00

CODE_2AFC04:        LDA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:10086 VC:000 FC:00 I:00
                    SEC                       ;0 S:01FF P:EnvMXdIzc HC:10102 VC:000 FC:00 I:00
                    SBC.b #$06                ;0 S:01FF P:EnvMXdIzc HC:10118 VC:000 FC:00 I:00
                    STA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:10134 VC:000 FC:00 I:00
                    BCS   CODE_2AFC28         ;0 S:01FF P:EnvMXdIzc HC:10150 VC:000 FC:00 I:00
                    LDA.b #$FF                ;0 S:01FF P:EnvMXdIzc HC:10166 VC:000 FC:00 I:00
                    STA.w $1050               ;0 S:01FF P:EnvMXdIzc HC:10182 VC:000 FC:00 I:00
                    BRA   CODE_2AFC28         ;0 S:01FF P:EnvMXdIzc HC:10198 VC:000 FC:00 I:00

CODE_2AFC14:        LDA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:10214 VC:000 FC:00 I:00
                    CLC                       ;0 S:01FF P:EnvMXdIzc HC:10230 VC:000 FC:00 I:00
                    ADC.b #$0A                ;0 S:01FF P:EnvMXdIzc HC:10246 VC:000 FC:00 I:00
                    STA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:10262 VC:000 FC:00 I:00
                    CMP.b #$20                ;0 S:01FF P:EnvMXdIzc HC:10278 VC:000 FC:00 I:00
                    BCC   CODE_2AFC28         ;0 S:01FF P:EnvMXdIzc HC:10294 VC:000 FC:00 I:00
                    LDA.b #$20                ;0 S:01FF P:EnvMXdIzc HC:10310 VC:000 FC:00 I:00
                    STA.b $81                 ;0 S:01FF P:EnvMXdIzc HC:10326 VC:000 FC:00 I:00
                    LDA.b #$FF                ;0 S:01FF P:EnvMXdIzc HC:10342 VC:000 FC:00 I:00
                    STA.w $1050               ;0 S:01FF P:EnvMXdIzc HC:10358 VC:000 FC:00 I:00
CODE_2AFC28:        LDX.b #$17                ;0 S:01FF P:EnvMXdIzc HC:10374 VC:000 FC:00 I:00
                    LDA.w $02BF               ;0 S:01FF P:EnvMXdIzc HC:10390 VC:000 FC:00 I:00
                    CMP.b #$01                ;0 S:01FF P:EnvMXdIzc HC:10406 VC:000 FC:00 I:00
                    BNE   CODE_2AFC3B         ;0 S:01FF P:EnvMXdIzc HC:10422 VC:000 FC:00 I:00
                    BRA   CODE_2AFC35         ;0 S:01FF P:EnvMXdIzc HC:10438 VC:000 FC:00 I:00

CODE_2AFC33:        LDX.b #$15                ;0 S:01FF P:EnvMXdIzc HC:10454 VC:000 FC:00 I:00
CODE_2AFC35:        LDY.b #$13                ;0 S:01FF P:EnvMXdIzc HC:10470 VC:000 FC:00 I:00
                    STY.b $09                 ;0 S:01FF P:EnvMXdIzc HC:10486 VC:000 FC:00 I:00
                    BRA   CODE_2AFC5B         ;0 S:01FF P:EnvMXdIzc HC:10502 VC:000 FC:00 I:00

CODE_2AFC3B:        CMP.b #$02                ;0 S:01FF P:EnvMXdIzc HC:10518 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC33         ;0 S:01FF P:EnvMXdIzc HC:10534 VC:000 FC:00 I:00
                    CMP.b #$07                ;0 S:01FF P:EnvMXdIzc HC:10550 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC35         ;0 S:01FF P:EnvMXdIzc HC:10566 VC:000 FC:00 I:00
                    CMP.b #$09                ;0 S:01FF P:EnvMXdIzc HC:10582 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC55         ;0 S:01FF P:EnvMXdIzc HC:10598 VC:000 FC:00 I:00
                    CMP.b #$0A                ;0 S:01FF P:EnvMXdIzc HC:10614 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC55         ;0 S:01FF P:EnvMXdIzc HC:10630 VC:000 FC:00 I:00
                    CMP.b #$0B                ;0 S:01FF P:EnvMXdIzc HC:10646 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC55         ;0 S:01FF P:EnvMXdIzc HC:10662 VC:000 FC:00 I:00
                    CMP.b #$0C                ;0 S:01FF P:EnvMXdIzc HC:10678 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC55         ;0 S:01FF P:EnvMXdIzc HC:10694 VC:000 FC:00 I:00
                    BRA   CODE_2AFC5B         ;0 S:01FF P:EnvMXdIzc HC:10710 VC:000 FC:00 I:00

CODE_2AFC55:        LDX.b #$11                ;0 S:01FF P:EnvMXdIzc HC:10726 VC:000 FC:00 I:00
                    LDY.b #$06                ;0 S:01FF P:EnvMXdIzc HC:10742 VC:000 FC:00 I:00
                    STY.b $09                 ;0 S:01FF P:EnvMXdIzc HC:10758 VC:000 FC:00 I:00
CODE_2AFC5B:        STX.b $08                 ;0 S:01FF P:EnvMXdIzc HC:10774 VC:000 FC:00 I:00
                    STX.b $0A                 ;0 S:01FF P:EnvMXdIzc HC:10790 VC:000 FC:00 I:00
                    LDY.b #$17                ;0 S:01FF P:EnvMXdIzc HC:10806 VC:000 FC:00 I:00
                    STY.b $0B                 ;0 S:01FF P:EnvMXdIzc HC:10822 VC:000 FC:00 I:00
                    LDY.b #$80                ;0 S:01FF P:EnvMXdIzc HC:10838 VC:000 FC:00 I:00
                    LDA.b $8B                 ;0 S:01FF P:EnvMXdIzc HC:10854 VC:000 FC:00 I:00
                    AND.b #$01                ;0 S:01FF P:EnvMXdIzc HC:10870 VC:000 FC:00 I:00
                    BEQ   CODE_2AFC6D         ;0 S:01FF P:EnvMXdIzc HC:10886 VC:000 FC:00 I:00
                    LDY.b #$40                ;0 S:01FF P:EnvMXdIzc HC:10902 VC:000 FC:00 I:00
CODE_2AFC6D:        STY.b $93                 ;0 S:01FF P:EnvMXdIzc HC:10918 VC:000 FC:00 I:00
                    INC.b $8B                 ;0 S:01FF P:EnvMXdIzc HC:10934 VC:000 FC:00 I:00
CODE_2AFC71:        PLD                       ;0 S:01FF P:EnvMXdIzc HC:10950 VC:000 FC:00 I:00
                    PLB                       ;0 S:01FF P:EnvMXdIzc HC:10966 VC:000 FC:00 I:00
                    RTL                       ;

     
                 db $F9,$07,$F6,$0A,$F4,$0C,$F2,$0E
                    db $F1,$0F,$EF,$11,$EE,$12,$ED,$13
                    db $EC,$14,$EB,$15,$EA,$16,$EA,$16
                    db $E9,$17,$E8,$18,$E8,$18,$E7,$19
                    db $E7,$19,$E6,$1A,$E6,$1A,$E6,$1A
                    db $E5,$1B,$E5,$1B,$E5,$1B,$E5,$1B
                    db $E5,$1B,$E5,$1B,$E5,$1B
                 

CODE_2AFCAA:        PHB                         
                    PHK                         
                    PLB                         
                    REP   #$30                  
                    LDA.w #$0001                
                    STA.w $0283                 
                    STZ.b $04                   
                    LDA.w $0726                 
                    AND.w #$00FF                
                    TAX                         
                    LDA.b $43,x                 
                    AND.w #$00FF                
                    STA.w $028B                 
                    SEC                         
                    SBC.w #$0010                
                    STA.w $0289                 
                    LDA.b $45,x                 
                    AND.w #$00FF                
                    XBA                         
                    STA.b $D8                   
                    LDA.b $47,x                 
                    AND.w #$00FF                
                    ORA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    SEC                         
                    SBC.w $0210                 
                    STA.w $028D                 
CODE_2AFCE7:        LDA.w #$0100                
                    STA.b $00                   
                    STA.b $02                   
                    LDA.b $04                   
                    CMP.w #$0034                
                    BCS   $08                   
                    LDA.w $0283                 
                    CMP.w $0289                 
                    BCS   $10                   
                    LDA.w $0283                 
                    DEC   A                     
                    ASL   A                     
                    TAX                         
                    LDA.w #$00FF                
                    STA.l $7F9000,x             
                    BRL   CODE_2AFD75 
          
                    LDX.b $04                   
                    LDA.l $2AFC74,x             
                    AND.w #$00FF                
                    STA.b $D8                   
                    LDA.l $2AFC75,x             
                    AND.w #$FF00                
                    XBA                         
                    CLC                         
                    ADC.w $028D                 
                    AND.w #$00FF                
                    STA.b $00                   
                    LDA.w $028D                 
                    SEC                         
                    SBC.b $D8                   
                    AND.w #$00FF                
                    STA.b $02                   
                    LDA.b $04                   
                    LSR   A                     
                    STA.b $D8                   
                    INC.b $04                   
                    INC.b $04                   
                    LDA.w $0283                 
                    DEC   A                     
                    ASL   A                     
                    TAX                         
                    LDA.b $02                   
                    AND.w #$00FF                
                    XBA                         
                    ORA.b $00                   
                    STA.l $7F9000,x             
                    STA.b $DA                   
                    LDA.w $028B                 
                    CLC                         
                    ADC.w #$0020                
                    SEC                         
                    SBC.b $D8                   
                    DEC   A                     
                    ASL   A                     
                    TAX                         
                    LDA.b $DA                   
                    STA.l $7F9000,x             
                    LDA.b $04                   
                    CMP.w #$0034                
                    BCC   CODE_2AFD75           
                    LDA.w $028B                 
                    CLC                         
                    ADC.w #$0020                
                    STA.w $0283                 
CODE_2AFD75:        INC.w $0283                 
                    LDA.w $0283                 
                    CMP.w #$00E1                
                    BCS   $03                   
                    BRL   CODE_2AFCE7  
         
                    SEP   #$30                  
                    LDA.b #$13                  
                    STA.w $0208                 
                    STA.w $020A                 
                    LDA.b #$80                  
                    STA.w $0293                 
                    PLB                         
                    RTL
                       
                    REP   #$30                  
                    LDX.w #$0000                
                    LDA.w #$00FF                
CODE_2AFD9C:        STA.l $7F9000,x             
                    STA.l $7F9002,x             
                    STA.l $7F9004,x             
                    STA.l $7F9006,x             
                    STA.l $7F9008,x             
                    STA.l $7F900A,x             
                    STA.l $7F900C,x             
                    STA.l $7F900E,x             
                    STA.l $7F9010,x             
                    STA.l $7F9012,x             
                    STA.l $7F9014,x             
                    STA.l $7F9016,x             
                    STA.l $7F9018,x             
                    STA.l $7F901A,x             
                    STA.l $7F901C,x             
                    STA.l $7F901E,x             
                    TXA                         
                    CLC                         
                    ADC.w #$0020                
                    TAX                         
                    CPX.w #$01C0                
                    BNE   CODE_2AFD9C           
                    SEP   #$30                  
                    RTL
                       

                    db $FC,$0C,$FC,$0C,$FC,$0C,$A9,$0C
                    db $A9,$0C,$FC,$0C,$A9,$0C,$A9,$0C

              
CODE_2AFDFA:        REP   #$30                  
                    LDX.w #$0000                
                    TXY                         
CODE_2AFE00:        LDA.b [$D8],y               
                    STA.b $DB                   
CODE_2AFE04:        PHX                         
                    LDA.b $DB                   
                    AND.w #$C000                
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
                    LDA.l $2AFDEA,x             
                    STA.b $00                   
                    LDA.l $2AFDEC,x             
                    PLX                         
                    STA.l $7FA002,x             
                    LDA.b $00                   
                    STA.l $7FA000,x             
                    ASL.b $DB                   
                    ASL.b $DB                   
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    TXA                         
                    LSR   A                     
                    AND.w #$000F                
                    BNE   CODE_2AFE04           
                    INY                         
                    INY                         
                    TYA                         
                    CMP.w #$0040                
                    BNE   CODE_2AFE00           
                    SEP   #$30                  
                    RTL 
           
           
                    db $58,$A0,$F4,$32,$60,$A0,$F5,$32
                    db $68,$A0,$F6,$32,$70,$A0,$F7,$32
                    db $80,$A0,$F6,$32,$88,$A0,$F8,$32
                    db $90,$A0,$F9,$32,$98,$A0,$FA,$32
                    db $A0,$A0,$F8,$32


CODE_2AFE63:        LDX.b #$23                ;0 S:01FF P:EnvMXdIzc HC:12734 VC:000 FC:00 I:00
CODE_2AFE65:        LDA.l $2AFE3F,x           ;0 S:01FF P:EnvMXdIzc HC:12750 VC:000 FC:00 I:00
                    STA.w $0900,x             ;0 S:01FF P:EnvMXdIzc HC:12766 VC:000 FC:00 I:00
                    DEX                       ;0 S:01FF P:EnvMXdIzc HC:12782 VC:000 FC:00 I:00
                    BPL   CODE_2AFE65         ;0 S:01FF P:EnvMXdIzc HC:12798 VC:000 FC:00 I:00
                    STZ.w $0A60               ;0 S:01FF P:EnvMXdIzc HC:12814 VC:000 FC:00 I:00
                    STZ.w $0A61               ;0 S:01FF P:EnvMXdIzc HC:12830 VC:000 FC:00 I:00
                    STZ.w $0A62               ;0 S:01FF P:EnvMXdIzc HC:12846 VC:000 FC:00 I:00
                    STZ.w $0A63               ;0 S:01FF P:EnvMXdIzc HC:12862 VC:000 FC:00 I:00
                    STZ.w $0A64               ;0 S:01FF P:EnvMXdIzc HC:12878 VC:000 FC:00 I:00
                    STZ.w $0A65               ;0 S:01FF P:EnvMXdIzc HC:12894 VC:000 FC:00 I:00
                    STZ.w $0A66               ;0 S:01FF P:EnvMXdIzc HC:12910 VC:000 FC:00 I:00
                    STZ.w $0A67               ;0 S:01FF P:EnvMXdIzc HC:12926 VC:000 FC:00 I:00
                    STZ.w $0A68               ;0 S:01FF P:EnvMXdIzc HC:12942 VC:000 FC:00 I:00
                    RTL                       ;0 S:01FF P:EnvMXdIzc HC:12958 VC:000 FC:00 I:00                      