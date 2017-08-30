; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $158000
    fillbyte $FF : fill $8000

ORG $158000
CODE_158000:        LDA.w $0724                 
                    BNE   CODE_158079           
                    LDA.w $0772                 
                    BEQ   CODE_158017           
                    LDX.b #$02                  
CODE_15800C:        LDA.w $02B2,x               
                    STA.w $0725,x               
                    DEX                         
                    BPL   CODE_15800C           
                    BRA   CODE_15802F      
     
CODE_158017:        LDX.w $0535                 
                    LDA.l DATA_11D01A,x             
                    STA.w $0725                 
                    LDA.l DATA_11D024,x             
                    STA.w $0726                 
                    LDA.l DATA_11D02E,x             
                    STA.w $0727                 
CODE_15802F:        LDA.w $0535                 
                    LDY.b #$01                  
                    JSR.w CODE_158107           
                    LDA.w $0533                 
                    CMP.b #$06                  
                    BEQ   CODE_158046           
                    CMP.b #$07                  
                    BEQ   CODE_158046           
                    CMP.b #$0C                  
                    BNE   CODE_158052           
CODE_158046:        LDA.w $0534                 
                    BNE   CODE_158052           
                    LDA.b #$10                ; \ Layer 3 Y pos = #$0010.
                    STA.w $020A               ; /
                    BRA   CODE_158055         
  
CODE_158052:        STZ.w $020A                 
CODE_158055:        STZ.w $020B                 
                    INC.w $0724                 
                    LDA.w $0535                 
                    STA.w $0728                 
                    LDA.b #$01                  
                    STA.w $0729                 
                    LSR   A                     
                    STA.b $06                   
                    LDA.b #$FF                  
                    STA.w $072A                 
                    LDA.b #$0F                  
                    STA.w $072B                 
                    JSR.w CODE_158083           
                    JSR.w CODE_1583F2           
CODE_158079:        JSL.l CODE_1581BD           
                    LDA.w $0729                 
                    BNE   CODE_158082           
CODE_158082:        RTL      
                   
CODE_158083:        LDA.w $0535                 
                    BNE   CODE_158093           
                    LDA.w $072C                 
                    BPL   CODE_158090           
                    JMP.w CODE_158100           

CODE_158090:        LDA.w $0535                 
CODE_158093:        CMP.w $0541                 
                    BNE   CODE_15809D           
                    LDA.w $072C                 
                    BPL   CODE_158100           
CODE_15809D:        LDX.b #$02                  
                    LDA.w $072C                 
                    BPL   CODE_1580AA           
                    LDA.b #$FF                  
                    STA.b $0B                   
                    BNE   CODE_1580AC           
CODE_1580AA:        STZ.b $0B                   
CODE_1580AC:        LDA.w $072C                 
                    AND.b #$F0                  
                    CLC                         
                    ADC.w $0725,x               
                    PHP                         
                    ADC.b $0B                   
                    PLP                         
                    STA.b $0C                   
                    LDA.b $0B                   
                    BNE   CODE_1580D1           
                    BCC   CODE_1580E3           
                    LDA.w $0725,x               
                    AND.b #$0F                  
                    CMP.b #$09                  
                    BNE   CODE_1580E3           
                    LDA.b $0C                   
                    AND.b #$F0                  
                    JMP.w CODE_1580E5           

CODE_1580D1:        BCS   CODE_1580E3                   
                    LDA.w $0725,x               
                    AND.b #$0F                  
                    BNE   CODE_1580E3           
                    LDA.b $0C                   
                    AND.b #$F0                  
                    ADC.b #$09                  
                    JMP.w CODE_1580E5           

CODE_1580E3:        LDA.b $0C                   
CODE_1580E5:        STA.w $0725,x               
                    DEX                         
                    BPL   CODE_1580AC           
                    LDA.w $072C                 
                    BPL   CODE_158100           
                    DEC.w $0728                 
                    LDA.w $0205                 
                    EOR.b #$01                  
                    STA.w $0205                 
                    LDA.b #$01                  
                    STA.w $072B                 
CODE_158100:        STZ.w $072C                 
                    JSR.w CODE_15832E           
                    RTS
                       
CODE_158107:        LSR   A                     
                    BCS   CODE_158124                   
                    CPY.b #$01                  
                    BEQ   CODE_158113           
                    LDA.w $0628                 
                    BEQ   CODE_15811A           
CODE_158113:        LDA.b #$01                  
                    STA.w $0205                 
                    BRA   CODE_15811D           
CODE_15811A:        STZ.w $0205                 
CODE_15811D:        STZ.w $020B                 
                    LDA.b #$00                  
                    BRA   CODE_15813D           

CODE_158124:        CPY.b #$01                  
                    BEQ   CODE_15812D           
                    STZ.w $0205                 
                    BRA   CODE_15813A           

CODE_15812D:        LDA.b #$01                  
                    STA.w $0205                 
                    STA.w $020B                 
                    LDA.b #$40                  
                    STA.w $0204                 
CODE_15813A:        LDA   DATA_119B3C,y               
CODE_15813D:        STA.w $0730                 
                    RTS
                       
CODE_158141:        LDA.w $0204                 
                    STA.w $0732                 
                    LDA.w $0205                 
                    STA.w $0733                 
                    LDA.w $0734                 
                    STA.w $0735                 
                    INC.w $0736                 
                    LDA.w DATA_119B3E                 
                    STA.w $0535                 
                    JSR.w CODE_158107           
                    LDA.b #$00                  
                    STA.w $0204                 
                    STA.w $0737                 
                    LDA.w DATA_119B3E                 
                    STA.w $0734                 
                    LDA.w DATA_119B3E                 
                    STA.w $0725                 
                    LDA.b #$E0                  
                    STA.w $0730                 
                    LDA.w DATA_119B3E                 
                    CLC                         
                    ADC.b #$F0                  
                    STA.w $072A                 
                    RTL
                       
CODE_158182:        LDA.w $0732                 
                    STA.w $0204                 
                    STA.w $0737                 
                    LDA.w $0733                 
                    STA.w $0205                 
                    LDA.w $0735                 
                    STA.w $0734                 
                    LDA.w $0736                 
                    BNE   CODE_1581BC           
                    INC.w $0738                 
                    INC.w $0736                 
                    INC.b $D5                   
                    LDA.w $0726                 
                    STA.w $0725                 
                    LDA.b #$10                  
                    STA.b $01                   
                    LDA.b #$F0                  
                    STA.w $0730                 
                    STA.w $072B                 
                    LDA.w $0727                 
                    STA.w $072A                 
CODE_1581BC:        RTL
                       
CODE_1581BD:        LDX.b #$00                  
                    STX.w $0739                 
                    STX.w $073A                 
                    STX.b $D8                   
                    JSL.l CODE_158236           
                    JSL.l CODE_15826D           
                    LDA.w $0730                 
                    CMP.w $073B                 
                    BNE   CODE_1581F1           
                    BRA   CODE_1581F1           

                    LDA.w $072B                 
                    CLC                         
                    ADC.b #$01                  
                    CMP.w $073C                 
                    BNE   CODE_1581F1           
CODE_1581E4:        STZ.w $0729                 
                    STZ.w $0736                 
                    STZ.w $0738                 
                    INC.w $0739                 
                    RTL
                       
CODE_1581F1:        LDA.w $0725                 
                    CMP.w $072A                 
                    BEQ   CODE_1581E4           
                    LDX.b #$00                  
                    JSL.l CODE_15821B           
                    RTL                         

CODE_158200:        LDA.w $0725,x               
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0725,x               
                    BCS   CODE_15821A                   
                    DEC.w $0725,x               
                    LDA.w $0725,x               
                    CMP.b #$EF                  
                    BNE   CODE_15821A           
                    LDA.b #$F9                  
                    STA.w $0725,x               
CODE_15821A:        RTL                         

CODE_15821B:        LDA.w $0725,x               
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0725,x               
                    BCC   CODE_158235           
                    INC.w $0725,x               
                    LDA.w $0725,x               
                    CMP.b #$0A                  
                    BNE   CODE_158235           
                    LDA.b #$00                  
                    STA.w $0725,x               
CODE_158235:        RTL                         

CODE_158236:        STY.b $0F                   
                    LDA.w $0725,x               
                    AND.b #$0F                  
                    TAY                         
                    LDA   DATA_11AB1B,y               
                    STA.w $073F                 
                    LDA   DATA_11AB25,y               
                    STA.w $0740                 
                    LDA.b #$7F                  
                    STA.w $0741                 
                    LDA.w $0725,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0742                 
                    ASL   A                     
                    STA.w $073C                 
                    LDY.b #$00                  
                    LDA.w $0725,x               
                    LSR   A                     
                    BCS   CODE_158267                   
                    LDY.b #$04                  
CODE_158267:        STY.w $073B                 
                    LDY.b $0F                   
                    RTL                         

CODE_15826D:        LDA.l $7F0800               
                    TAX                         
                    LDA.w $073F                 
                    STA.b $C4                   
                    LDA.w $0740                 
                    STA.b $C5                   
                    LDA.w $0741                 
                    STA.b $C6                   
                    REP   #$20                  
                    LDA.w $073B                 
                    CLC                         
                    ADC.w #$0048                
                    STA.l $7F0802,x             
                    XBA                         
                    CLC                         
                    ADC.w #$0001                
                    XBA                         
                    STA.l $7F0842,x             
                    INX                         
                    INX                         
                    LDA.w #$3C00                
                    STA.l $7F0802,x             
                    STA.l $7F0842,x             
                    INX                         
                    INX                         
                    SEP   #$20                  
                    STZ.w $0743                 
                    STZ.w $074F                 
CODE_1582AF:        LDA.w $0744                 
                    STA.b $00                   
                    LDA.w $0745                 
                    STA.b $01                   
                    LDA.w $0746                 
                    STA.b $02                   
                    LDY.w $0742                 
                    REP   #$30                  
                    LDA.b [$C4],y               
                    AND.w #$00FF                
                    CMP.w #$00FF                
                    BNE   CODE_1582DD           
                    LDA   DATA_15934F               
                    STA.b $00                   
                    LDA.w #$0015                
                    STA.b $02                   
                    LDY.w #$0000                
                    BRA   CODE_1582E1           

CODE_1582DD:        ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
CODE_1582E1:        LDA.b [$00],y               
                    STA.l $7F0802,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0842,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0804,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0844,x             
                    SEP   #$30                  
                    INC.w $0743                 
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    LDA.w $0742                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0742                 
                    LDA.w $0743                 
                    CMP.b #$0F                  
                    BCC   CODE_1582AF           
                    LDA.b #$FF                  
                    STA.l $7F0842,x             
                    TXA                         
                    CLC                         
                    ADC.b #$40                  
                    STA.l $7F0800               
                    INC.w $073A                 
                    RTL                         

DATA_15832A:        db $00,$40,$80,$C0

CODE_15832E:        LDA.w $0772                 
                    BEQ   CODE_158342           
                    LDA.w $0200                 
                    STA.w $0204                 
                    LDA.w $0201                 
                    STA.w $0205                 
                    BRL   CODE_1583E6           

CODE_158342:        LDA.w $0535                 
                    AND.b #$04                  
                    BNE   CODE_158399           
                    LDA.w $0535                 
                    AND.b #$07                  
                    BNE   CODE_158365           
                    LDA.w $0201                 
                    BNE   CODE_158365           
                    STZ.w $0205                 
                    LDA.w $0200                 
                    LSR   A                     
                    LSR   A                     
                    ORA.b #$C0                  
                    STA.w $0204                 
                    JMP.w CODE_1583E6           

CODE_158365:        LDA.b #$01                  
                    STA.w $0205                 
                    LDA.w $0200                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0204                 
                    LDA.w $0535                 
                    AND.b #$03                  
                    TAX                         
                    LDA.w $0535                 
                    AND.b #$01                  
                    BEQ   CODE_158386           
                    LDA.w $0201                 
                    BEQ   CODE_15838C           
                    BRA   CODE_15838B           

CODE_158386:        LDA.w $0201                 
                    BNE   CODE_15838C           
CODE_15838B:        DEX                         
CODE_15838C:        LDA.l DATA_15832A,x             
                    CLC                         
                    ADC.w $0204                 
                    STA.w $0204                 
                    BRA   CODE_1583E6           

CODE_158399:        LDA.w $0535                 
                    CMP.b #$04                  
                    BNE   CODE_1583B6           
                    LDA.w $0201                 
                    BNE   CODE_1583B6           
                    LDA.b #$01                  
                    STA.w $0205                 
                    LDA.w $0200                 
                    LSR   A                     
                    LSR   A                     
                    ORA.b #$C0                  
                    STA.w $0204                 
                    BRA   CODE_1583E6           

CODE_1583B6:        STZ.w $0205                 
                    LDA.w $0200                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0204                 
                    LDA.w $0535                 
                    AND.b #$03                  
                    TAX                         
                    LDA.w $0535                 
                    AND.b #$01                  
                    BEQ   CODE_1583D5           
                    LDA.w $0201                 
                    BEQ   CODE_1583DB           
                    BRA   CODE_1583DA           

CODE_1583D5:        LDA.w $0201                 
                    BNE   CODE_1583DB           
CODE_1583DA:        DEX                         
CODE_1583DB:        LDA.l DATA_15832A,x             
                    CLC                         
                    ADC.w $0204                 
                    STA.w $0204                 
CODE_1583E6:        LDA.w $0204                 
                    AND.b #$F0                  
                    STA.w $0750                 
                    STZ.w $0751                 
                    RTS                         

CODE_1583F2:        LDX.w $0533              ; \ Get room + level number into index.
                    LDA.l DATA_11D098,x      ;  |
                    CLC                      ;  |
                    ADC.w $0534              ;  |
                    TAX                      ;  |
                    LDA.l DATA_15916B,x      ;  | Load which set of Layer 3 Map16 tiles to use (the cloud tiles or the light beams of the shining door) 
                    ASL   A                  ;  | Multiply by 2.
                    TAX                      ;  |
                    LDA   PNTR_159233,x      ;  | Get low byte of Map16 table.   
                    STA.w $0744              ;  |
                    INX                      ;  |
                    LDA   PNTR_159233,x      ;  | Get high byte of Map16 table.   
                    STA.w $0745              ;  |
                    LDA.b #$15               ;  | Bank number = $15.
                    STA.w $0746              ; /
                    RTS                      ; Return.

CODE_158419:        LDX.b #$44                  
                    LDY.b #$00                  
                    LDA.w $0628                 
                    CMP.b #$01                  
                    BNE   CODE_158428           
                    LDX.b #$84                  
                    BRA   CODE_15842F           

CODE_158428:        LDA.b $EB                   
                    BEQ   CODE_15842F           
                    LDX.b #$40                  
                    INY                         
CODE_15842F:        STX.b $03                   
                    STZ.b $04                   
                    TYA                         
                    ORA.b #$80                  
                    STA.w $2115                 
                    LDA.b #$7F                  
                    STA.w $4314                 
                    REP   #$10                  
                    LDX.w #$1801                
                    STX.w $4310                 
                    LDX.w #$0002                
                    LDA.l $7F0800,x             
                    BMI   CODE_15847F           
CODE_15844F:        REP   #$20                  
                    LDA.l $7F0800,x             
                    XBA                         
                    STA.w $2116                 
                    LDA.l $7F0802,x             
                    XBA                         
                    STA.w $4315                 
                    TXA                         
                    CLC                         
                    ADC.w #$0004                
                    CLC                         
                    ADC.w #$0800                
                    STA.w $4312                 
                    TXA                         
                    CLC                         
                    ADC.b $03                   
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $420B                 
                    LDA.l $7F0800,x             
                    BPL   CODE_15844F           
CODE_15847F:        SEP   #$30                  
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF              ; /

CODE_158500:        LDA.w $0724
                    BNE   CODE_158554
                    LDA.b #$02
                    STA.w $073B               
                    LDA.w $0772   
                    BNE   CODE_158523           
                    LDX.w $0535                 
                    LDA.l DATA_11D038,x             
                    STA.w $0725                 
                    STA.w $0726                 
                    LDA.l DATA_11D042,x             
                    STA.w $0727                 
CODE_158523:        LDA.w $0535                 
                    LDY.b #$00                  
                    JSR.w CODE_158107           
                    LDA.b #$02                  
                    STA.w $0747                 
                    LDA.b #$00                  
                    STA.w $0748                 
                    LDA.b #$20                  
                    STA.w $073D                 
                    LDA.b #$A0                  
                    STA.w $073E                 
                    INC.w $0724                 
                    LDA.b #$E0                  
                    STA.b $E2                   
                    LDA.b #$01                  
                    STA.b $E4                   
                    STA.w $0729                 
                    LSR   A                     
                    STA.w $073C                 
                    JSR.w CODE_1583F2           
CODE_158554:        STZ.b $06                   
                    LDA.b #$FF                  
                    STA.w $072A                 
                    LDA.b #$A0                  
                    STA.w $072B                 
                    JSL.l CODE_1585F8           
                    LDA.w $0729                 
                    BNE   CODE_158571           
                    LDA.b #$E8                  
                    STA.b $E1                   
                    LDA.b #$C8                  
                    STA.b $E2                   
CODE_158571:        RTL                         

                    LDA.w $020A                 
                    STA.w $0731                 
                    LDA.w $0204                 
                    STA.w $0732                 
                    LDA.w $0749                 
                    STA.w $074B                 
                    LDA.w $074A                 
                    STA.w $074C                 
                    LDA.w $0734                 
                    STA.w $074D                 
                    STZ.w $020A                 
                    STZ.w $0204                 
                    RTL                         

                    LDA.w $0731                 
                    STA.w $020A                 
                    LDA.w $0732                 
                    STA.w $0204                 
                    LDA.w $074B                 
                    STA.w $0749                 
                    LDA.w $074C                 
                    STA.w $074A                 
                    LDA.w $074D                 
                    STA.w $0734                 
                    RTL                         

                    LDA.w $0726                 
                    AND.b #$10                  
                    BEQ   CODE_1585C4           
                    LDA.b $E1                   
                    SEC                         
                    SBC.b #$08                  
                    STA.b $E1                   
CODE_1585C4:        LDA.b #$01                  
                    STA.b $E4                   
                    LDA.w $0726                 
                    STA.w $0725                 
                    LDA.b #$10                  
                    STA.b $01                   
                    LDX.b #$00                  
                    JSL.l CODE_15873F           
                    LDA.w $073D                 
                    STA.w $073C                 
                    LDA.b $E1                   
                    STA.b $E2                   
                    LDA.b #$F0                  
                    STA.w $0730                 
                    STA.w $072B                 
                    LDA.w $0727                 
                    STA.w $072A                 
                    INC.w $074F                 
                    LDA.b #$01                  
                    STA.b $06                   
                    RTL                         

CODE_1585F8:        LDX.b #$00                  
                    STX.w $0739                 
                    JSL.l CODE_1586F1           
                    JSL.l CODE_15876F           
                    LDX.b #$00                  
                    JSL.l CODE_15866E           
                    LDA.w $0730                 
                    CMP.w $073B                 
                    BNE   CODE_158635           
                    LDA.w $072B                 
                    CLC                         
                    ADC.b #$20                  
                    CMP.w $073C                 
                    BNE   CODE_158635           
CODE_15861E:        LDA.b $06                   
                    TAX                         
                    BEQ   CODE_158628           
                    LDA.w $0519                 
                    STA.b $E1                   
CODE_158628:        INC.w $0739                 
                    STZ.w $0729                 
                    STZ.w $0736                 
                    STZ.w $0738                 
                    RTL                         

CODE_158635:        LDA.w $073C                 
                    AND.b #$20                  
                    BNE   CODE_15864A           
                    LDA.w $0725                 
                    CMP.w $072A                 
                    BEQ   CODE_15861E           
                    LDX.b #$00                  
                    JSL.l CODE_1586CA           
CODE_15864A:        RTL                         

CODE_15864B:        LDA.w $073D,x               
                    SEC                         
                    SBC.b #$20                  
                    STA.w $073D,x               
                    BCS   CODE_15866D                   
                    LDA.w $0747,x               
                    SEC                         
                    SBC.b #$01                  
                    CMP.b #$FF                  
                    BNE   CODE_158664           
                    LDA.b #$0B                  
                    BRA   CODE_15866A           

CODE_158664:        CMP.b #$07                  
                    BNE   CODE_15869C           
                    LDA.b #$03                  
CODE_15866A:        STA.w $0747,x               
CODE_15866D:        RTL                         

CODE_15866E:        LDA.w $073C,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $073C,x               
                    BCC   CODE_15869F           
                    CPX.b #$00                  
                    BNE   CODE_158687           
                    LDA.w $073B                 
                    CLC                         
                    ADC.b #$01                  
                    STA.w $073B                 
                    RTL                         

CODE_158687:        DEX                         
                    LDA.w $0747,x               
                    CLC                         
                    ADC.b #$01                  
                    CMP.b #$04                  
                    BNE   CODE_158696           
                    LDA.b #$08                  
                    BRA   CODE_15869C           
CODE_158696:        CMP.b #$0C                  
                    BNE   CODE_15869C           
                    LDA.b #$00                  
CODE_15869C:        STA.w $0747,x               
CODE_15869F:        RTL                         

CODE_1586A0:        LDA.w $0726,x               
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0726,x               
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_1586C9           
                    LDA.w $0726,x               
                    AND.b #$0F                  
                    CLC                         
                    ADC.b #$E0                  
                    STA.w $0726,x               
                    DEC.w $0726,x               
                    LDA.w $0726,x               
                    CMP.b #$DF                  
                    BNE   CODE_1586C9           
                    LDA.b #$E9                  
                    STA.w $0726,x               
CODE_1586C9:        RTL                         

CODE_1586CA:        LDA.w $0725,x               
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0725,x               
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_1586F0           
                    LDA.w $0725,x               
                    AND.b #$0F                  
                    STA.w $0725,x               
                    INC.w $0725,x               
                    LDA.w $0725,x               
                    CMP.b #$0A                  
                    BNE   CODE_1586F0           
                    LDA.b #$00                  
                    STA.w $0725,x               
CODE_1586F0:        RTL                         

CODE_1586F1:        PHX                         
                    LDA.w $0725,x               
                    AND.b #$0F                  
                    TAY                         
                    LDA   DATA_11AB1B,y               
                    STA.w $073F                 
                    LDA   DATA_11AB25,y               
                    STA.w $0740                 
                    LDA.b #$7F                  
                    STA.w $0741                 
                    LDA.w $0725,x               
                    AND.b #$F0                  
                    STA.w $0742                 
                    CPX.b #$00                  
                    BNE   CODE_158730           
                    LDA.w $073B                 
                    CMP.b #$FF                  
                    BNE   CODE_158720           
                    LDA.b #$0B                  
                    BRA   CODE_158734           

CODE_158720:        CMP.b #$04                  
                    BNE   CODE_158728           
                    LDA.b #$08                  
                    BRA   CODE_158734           

CODE_158728:        CMP.b #$0C                  
                    BNE   CODE_158734           
                    LDA.b #$00                  
                    BRA   CODE_158734           

CODE_158730:        DEX                         
                    LDA.w $0747,x               
CODE_158734:        STA.w $073B                 
                    PLX                         
                    LDA.w $073C,x               
                    STA.w $073C                 
CODE_15873E:        RTL                         

CODE_15873F:        LDA.w $0725,x               
                    AND.b #$10                  
                    BEQ   CODE_15873E           
                    LDA.w $0725,x               
                    STA.b $03                   
                    SEC                         
                    SBC.b $01                   
                    STA.w $0725,x               
                    JSL.l CODE_1586F1           
                    LDA.b #$0F                  
                    STA.b $E3                   
                    LDA.b #$00                  
                    STA.w $0743                 
CODE_15875E:        DEC.b $E3                   
                    LDA.b $E3                   
                    BPL   CODE_15875E           
                    LDA.b $03                   
                    STA.w $0725,x               
                    DEC.b $E4                   
                    JML.l CODE_1586F1           

CODE_15876F:        LDA.l $7F0800               
                    TAX                         
                    LDA.w $073F                 
                    STA.b $C4                   
                    LDA.w $0740                 
                    STA.b $C5                   
                    LDA.w $0741                 
                    STA.b $C6                   
                    LDA.w $073B                 
                    CLC                         
                    ADC.b #$48                  
                    STA.l $7F0802,x             
                    INX                         
                    LDA.w $073C                 
                    STA.l $7F0802,x             
                    INX                         
                    LDA.b #$00                  
                    STA.l $7F0802,x             
                    INX                         
                    LDA.b #$40                  
                    STA.l $7F0802,x             
                    INX                         
                    STZ.w $0743                 
                    LDA.b #$0F                  
                    STA.b $E3                   
CODE_1587AB:        LDA.w $0744               ; \ Map16 table into [$00]
                    STA.b $00                 ;  |
                    LDA.w $0745               ;  |
                    STA.b $01                 ;  |
                    LDA.w $0746               ;  |
                    STA.b $02                 ; /
                    LDY.w $0742                 
                    REP   #$30                ; Accumulator and Index = 16-bit.
                    LDA.b [$C4],y             ; \ Check if tile in Layer 3 Map16 table is #$FF...
                    AND.w #$00FF              ;  |
                    CMP.w #$00FF              ;  |
                    BNE   CODE_1587D9         ; / If not, branch.
                    LDA   DATA_15934F         ; \ Load value for empty tile.
                    STA.b $00                 ;  | ($159351 is empty tile)
                    LDA.w #$0015              ;  |
                    STA.b $02                 ; /
                    LDY.w #$0000              ; Y = #$0000.
                    BRA   CODE_1587DD           

CODE_1587D9:        ASL   A                   ; \ Multiply Map16 num by 8.
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    TAY                       ; / Into Y index.
CODE_1587DD:        LDA.w $074F                 
                    AND.w #$00FF                
                    BEQ   CODE_1587E9           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_1587E9:        REP   #$20                ; Accumulator = 16-bit.
                    LDA.b [$00],y               
                    STA.l $7F0802,x             
                    SEP   #$20                ; Accumulator = 8-bit.
                    INC.w $0743                 
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    LDA.w $0743                 
                    LSR   A                     
                    BCS   CODE_1587E9                   
                    INC.w $0742                 
                    SEP   #$30                ; Accumulator and Index = 8-bit.
                    LDA.w $0743                 
                    CMP.b #$20                  
                    BCC   CODE_1587AB           
                    LDA.b #$FF                ; \ End upload.
                    STA.l $7F0802,x           ; /
                    TXA                       ; \ Amount of tiles transferred...
                    STA.l $7F0800             ; / Into $7F0800.
                    LDA.w $074F                 
                    EOR.b #$01                  
                    STA.w $074F                 
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty data.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  | Free to use if hacked.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; /

DATA_158900:        db $00,$01,$02,$03,$00,$01,$03,$02      ; \ This table here...
                    db $02,$00,$01,$03,$02,$03,$00,$01      ;  | ...serves as index...
                    db $03,$00,$01,$02,$03,$02,$00,$01      ;  | ... for the pointer below.
                    db $01,$02,$03,$00,$01,$03,$02,$00      ;  | Note that the following pointer only determines the clouds right at the start of the level.
                    db $04,$05,$06,$07,$08,$09,$00,$00      ; /

PNTR_158928:        dw DATA_15893C                          ; Cloud 0 (horizontal level cloud part #1)
                    dw DATA_1589C0                          ; Cloud 1 (horizontal level cloud part #2)
                    dw DATA_158A5C                          ; Cloud 2 (horizontal level cloud part #3)
                    dw DATA_158AED                          ; Cloud 3 (horizontal level cloud part #4)
                    dw DATA_158BBF                          ; Cloud 4 (upper part of vertical level cloud)
                    dw DATA_158CB1                          ; Cloud 5 (cloud specifically for the first room of 7-1, also used as part of regular vertical level cloud)
                    dw DATA_158DA3                          ; Cloud 6 (part #3 of regular vertical level cloud)
                    dw DATA_158E95                          ; Cloud 7 (part #4 of regular vertical level cloud)
                    dw DATA_158F87                          ; Cloud 8 (part #5 of regular vertical level cloud)
                    dw DATA_159079                          ; Cloud 9 (part #6 of regular vertical level cloud. This one is so far down that only really long vertical levels feature it, such as in 6-3)
          
DATA_15893C:        db $53,$9C,$00,$00,$00,$00,$00,$00      ; \ First two bytes of each image are header.
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | Their format is as such:
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | YYYYXXXX yyyyxxxx.
                    db $00,$00,$01,$04,$00,$00,$00,$01      ;  | YYYY holds the Y-coordinate at which each image starts.
                    db $00,$00,$00,$01,$07,$09,$04,$00      ;  | XXXX holds the X-coordinate.
                    db $01,$07,$00,$00,$00,$03,$08,$15      ;  | yyyy holds the value to determine the height of each image, minus 1.
                    db $09,$04,$02,$15,$00,$01,$04,$01      ;  | xxxx holds the value to determine the width of each image, minus 1.
                    db $07,$15,$15,$09,$07,$15,$01,$07      ;  | The length of each table's tilemap can be calculated with a simple product.
                    db $09,$07,$15,$15,$15,$15,$15,$15      ;  | Multiply xxxx+1 with yyyy+1 and you will get that length.
                    db $02,$15,$15,$15,$15,$15,$15,$15      ;  | In this case: xxxx+1 = $D (or: 13), yyyy+1 = $A (or: 10).
                    db $15,$15,$03,$12,$08,$15,$15,$15      ;  | 130 tiles to be uploaded. 1 byte per Map16 tile.
                    db $15,$15,$15,$15,$00,$01,$07,$15      ;  | The header is always 2 bytes, so the entire size here is 132 bytes.
                    db $15,$15,$15,$15,$15,$15,$01,$07      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$15      ;  | This here is the first part of the horizontal cloud images.
                    db $02,$15,$15,$15,$15,$15,$15,$15      ;  | Starts at Y pos 5, X pos 3. A height of $A/10 blocks, a width of $D/13 blocks.
                    db $15,$15,$03,$08,$15,$15,$15,$15      ;  |
                    db $15,$15,$15,$15                      ; /

DATA_1589C0:        db $40,$AD,$00,$00,$03,$08,$15,$15      ; \ This here is the second part...
                    db $15,$15,$15,$15,$15,$00,$00,$01      ;  | ...of the cloud images that are used in horizontal levels...
                    db $07,$15,$15,$15,$15,$15,$15,$15      ;  | ...and vary seemingly randomly depending on when you enter the level.
                    db $00,$01,$07,$15,$15,$15,$15,$15      ;  | Starts at Y pos: 4
                    db $15,$15,$15,$00,$02,$15,$15,$15      ;  | Starts at X pos: 0
                    db $15,$15,$15,$15,$15,$15,$01,$07      ;  | Height: $B/11
                    db $15,$15,$15,$15,$15,$15,$15,$15      ;  | Width: $E/14
                    db $15,$02,$15,$15,$15,$15,$15,$15      ;  | Total length of tilemap data: 154.
                    db $15,$15,$15,$15,$03,$12,$08,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$00      ;  |
                    db $00,$03,$08,$15,$15,$15,$15,$15      ;  |
                    db $15,$15,$00,$00,$00,$03,$08,$0A      ;  |
                    db $08,$15,$15,$15,$15,$00,$00,$00      ;  |
                    db $00,$03,$06,$03,$12,$08,$15,$15      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $03,$08,$15,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$03,$08,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $02,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$03                      ; /

DATA_158A5C:        db $41,$AC,$00,$00,$00,$00,$00,$00      ; \ The third part of these horizontal level cloud images.
                    db $01,$04,$00,$00,$00,$00,$00,$00      ;  | Starts at Y pos: 4
                    db $00,$00,$00,$02,$15,$04,$01,$04      ;  | Starts at X pos: 1
                    db $01,$04,$01,$11,$04,$01,$07,$15      ;  | Height: $B/11
                    db $09,$07,$09,$03,$09,$07,$15,$09      ;  | Width: $D/13
                    db $07,$15,$15,$15,$15,$15,$00,$03      ;  | Total length of tilemap data: 143
                    db $08,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $15,$00,$01,$07,$15,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$00,$02,$0A,$08      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$00      ;  |
                    db $03,$06,$02,$15,$15,$15,$15,$0A      ;  |
                    db $08,$15,$00,$00,$00,$03,$08,$0A      ;  |
                    db $08,$0A,$06,$02,$15,$00,$00,$00      ;  |
                    db $00,$03,$06,$03,$06,$00,$03,$08      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$02,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$03,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00                                  ; /

DATA_158AED:        db $20,$CF,$00,$00,$00,$00,$00,$00      ; \ The fourth part and last of these regular horizontal level cloud images.
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | Starts at Y pos: 2
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | Starts at X pos: 0
                    db $00,$00,$00,$01,$00,$00,$01,$11      ;  | Height: $D/13
                    db $04,$00,$00,$00,$00,$01,$04,$01      ;  | Width: $10/16
                    db $07,$00,$00,$02,$15,$09,$04,$01      ;  | Total length of tilemap data: 208
                    db $04,$01,$07,$09,$07,$15,$00,$01      ;  |
                    db $07,$15,$15,$09,$07,$09,$07,$15      ;  |
                    db $15,$15,$15,$01,$07,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $03,$08,$0A,$08,$15,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$15,$00,$03,$06      ;  |
                    db $03,$08,$15,$15,$15,$15,$15,$15      ;  |
                    db $15,$15,$00,$00,$00,$00,$03,$08      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$00      ;  |
                    db $00,$00,$00,$01,$07,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$00,$00,$00,$00      ;  |
                    db $02,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $15,$00,$00,$00,$01,$07,$15,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$00,$00      ;  |
                    db $00,$02,$15,$15,$15,$15,$0A,$08      ;  |
                    db $15,$15,$15,$00,$00,$00,$03,$08      ;  |
                    db $0A,$08,$0A,$06,$03,$08,$15,$15      ;  |
                    db $00,$00,$00,$00,$03,$06,$03,$06      ;  |
                    db $00,$00,$03,$08,$0A,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $03,$06                              ; /

DATA_158BBF:        db $00,$EF,$00,$00,$00,$00,$00,$00      ; \ Upper part of the vertical level cloud image.
                    db $00,$00,$03,$08,$15,$15,$15,$15      ;  | Starts at Y pos: 0
                    db $15,$00,$00,$00,$00,$00,$00,$00      ;  | Starts at X pos: 0
                    db $00,$00,$03,$08,$15,$15,$15,$0B      ;  | Height: $F/15
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | Width: $10/16
                    db $00,$00,$02,$15,$15,$15,$0C,$00      ;  | Total length of tilemap data: 240
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $01,$07,$15,$15,$15,$0D,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$02      ;  |
                    db $15,$15,$15,$15,$15,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$01,$11,$07,$15      ;  |
                    db $0B,$13,$0E,$0B,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$02,$15,$15,$15,$0C      ;  |
                    db $15,$09,$07,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$03,$08,$15,$0B,$07,$15      ;  |
                    db $15,$15,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$03,$0B,$07,$15,$15,$15      ;  |
                    db $15,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$02,$15,$15,$15,$15,$15      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$03,$08,$15,$15,$15,$15,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$03,$12,$08,$15,$15,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$01,$0D,$08,$15,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$01,$04,$01      ;  |
                    db $07,$15,$0C,$15,$00,$00,$00,$00      ;  |
                    db $00,$00,$01,$11,$07,$09,$07,$15      ;  |
                    db $15,$0C,$15,$00,$00,$00,$00,$00      ;  |
                    db $00,$02,$15,$15,$15,$15,$15,$0B      ;  |
                    db $07,$15                              ; /

DATA_158CB1:        db $00,$EF,$0B,$0E,$15,$15,$0B,$15      ; \ Second part of the vertical level cloud image.
                    db $15,$0B,$15,$15,$15,$15,$0C,$15      ;  | This is also used as the starting image of...
                    db $15,$07,$09,$0E,$0B,$07,$15,$0B      ;  | ... the very first room in 7-1.
                    db $07,$15,$15,$15,$15,$0D,$15,$15      ;  | Starts at Y pos: 0
                    db $15,$15,$09,$07,$15,$15,$0C,$15      ;  | Starts at X pos: 0
                    db $15,$15,$15,$15,$15,$0D,$15,$08      ;  | Height: $F/15
                    db $15,$15,$15,$15,$15,$0D,$08,$15      ;  | Width: $10/16
                    db $15,$15,$15,$15,$15,$0C,$0C,$15      ;  | Total length of tilemap data: 240
                    db $15,$15,$15,$15,$15,$0C,$15,$15      ;  |
                    db $15,$15,$15,$0B,$07,$07,$15,$15      ;  |
                    db $0B,$13,$0E,$0B,$07,$15,$15,$15      ;  |
                    db $15,$15,$0C,$15,$15,$15,$15,$0C      ;  |
                    db $15,$09,$07,$15,$15,$15,$15,$15      ;  |
                    db $0B,$15,$15,$15,$15,$15,$0D,$08      ;  |
                    db $15,$15,$15,$15,$15,$15,$0B,$07      ;  |
                    db $15,$15,$15,$15,$15,$15,$0C,$15      ;  |
                    db $15,$15,$15,$15,$0B,$07,$15,$15      ;  |
                    db $0B,$15,$15,$15,$0B,$15,$15,$15      ;  |
                    db $15,$15,$15,$0C,$15,$15,$15,$0C      ;  |
                    db $15,$15,$15,$0C,$15,$15,$15,$15      ;  |
                    db $15,$15,$0D,$08,$15,$0B,$0D,$15      ;  |
                    db $15,$15,$0D,$08,$0A,$08,$15,$15      ;  |
                    db $15,$15,$0D,$0B,$15,$15,$15,$15      ;  |
                    db $15,$15,$0D,$10,$0D,$08,$15,$15      ;  |
                    db $15,$0B,$07,$15,$15,$15,$15,$15      ;  |
                    db $15,$15,$0C,$15,$07,$15,$15,$0B      ;  |
                    db $07,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $15,$0C,$15,$15,$15,$15,$0C,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$0B      ;  |
                    db $07,$15,$15,$15,$0B,$07,$15,$15      ;  |
                    db $15,$15                              ; /

DATA_158DA3:        db $00,$EF,$15,$0B,$0E,$15,$15,$15      ; \ Third part of the vertical level cloud image.
                    db $15,$15,$15,$15,$0D,$08,$15,$15      ;  | Starts at Y pos: 0
                    db $15,$0B,$07,$09,$0E,$15,$15,$15      ;  | Starts at X pos: 0
                    db $15,$15,$15,$0B,$0D,$08,$15,$15      ;  | Height: $F/15
                    db $0C,$15,$15,$0F,$15,$15,$15,$0B      ;  | Width: $10/16
                    db $0E,$0B,$07,$15,$0C,$15,$15,$0D      ;  | Total length of tilemap data: 240
                    db $08,$15,$09,$0E,$15,$0B,$07,$09      ;  |
                    db $15,$15,$0B,$07,$15,$15,$15,$0C      ;  |
                    db $15,$15,$0B,$13,$07,$15,$15,$15      ;  |
                    db $15,$0C,$15,$15,$15,$0B,$07,$15      ;  |
                    db $15,$0C,$15,$15,$15,$15,$0B,$13      ;  |
                    db $07,$15,$0B,$13,$0D,$15,$15,$15      ;  |
                    db $0D,$08,$15,$15,$15,$0C,$15,$15      ;  |
                    db $15,$0C,$15,$0B,$15,$15,$15,$15      ;  |
                    db $0D,$15,$15,$15,$0D,$08,$15,$0B      ;  |
                    db $07,$15,$07,$15,$15,$15,$15,$15      ;  |
                    db $0C,$15,$15,$15,$0D,$0B,$07,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$0B,$15      ;  |
                    db $15,$15,$15,$15,$0C,$15,$15,$15      ;  |
                    db $08,$15,$15,$15,$15,$0C,$15,$15      ;  |
                    db $15,$15,$15,$0D,$08,$15,$15,$07      ;  |
                    db $15,$15,$15,$15,$0D,$08,$0A,$08      ;  |
                    db $15,$15,$15,$0D,$14,$08,$15,$15      ;  |
                    db $15,$15,$15,$15,$0D,$10,$0D,$08      ;  |
                    db $15,$15,$0B,$07,$0D,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$0C,$15      ;  |
                    db $0B,$07,$15,$15,$15,$15,$15,$15      ;  |
                    db $15,$0B,$0E,$15,$15,$0C,$15,$0C      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $0C,$0F,$15,$0B,$07,$0B,$07,$15      ;  |
                    db $15,$0B                              ; /

DATA_158E95:        db $00,$EF,$15,$15,$0B,$0E,$15,$15      ; \ Fourth part of the vertical level cloud image.
                    db $0D,$08,$15,$15,$15,$15,$15,$0A      ;  | Starts at Y pos: 0
                    db $10,$15,$0B,$07,$09,$0E,$15,$15      ;  | Starts at X pos: 0
                    db $0D,$08,$15,$15,$15,$0A,$10,$0D      ;  | Height: $F/15
                    db $15,$0C,$15,$15,$0F,$15,$15,$15      ;  | Width: $10/16
                    db $0C,$15,$15,$15,$0F,$15,$15,$15      ;  | Total length of tilemap data: 240
                    db $0D,$08,$15,$09,$0E,$15,$0B,$0D      ;  |
                    db $08,$15,$15,$09,$0E,$15,$15,$15      ;  |
                    db $0C,$15,$15,$0B,$13,$15,$15,$0D      ;  |
                    db $08,$15,$15,$0F,$15,$0E,$0B,$07      ;  |
                    db $15,$0B,$07,$15,$15,$15,$15,$0D      ;  |
                    db $08,$0A,$10,$15,$09,$07,$15,$15      ;  |
                    db $0C,$15,$15,$15,$15,$15,$15,$0D      ;  |
                    db $10,$15,$0B,$15,$15,$15,$0B,$07      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $0B,$07,$15,$15,$15,$0D,$08,$15      ;  |
                    db $15,$15,$0B,$0E,$15,$15,$0B,$07      ;  |
                    db $15,$15,$15,$15,$15,$0D,$08,$15      ;  |
                    db $15,$0C,$0F,$15,$15,$0C,$15,$15      ;  |
                    db $15,$15,$15,$15,$15,$0C,$15,$15      ;  |
                    db $0D,$10,$15,$15,$0D,$08,$15,$15      ;  |
                    db $15,$15,$15,$15,$0D,$0B,$0E,$15      ;  |
                    db $15,$15,$15,$15,$0D,$08,$08,$15      ;  |
                    db $15,$15,$15,$0B,$15,$09,$0E,$15      ;  |
                    db $15,$15,$15,$0B,$0D,$0C,$15,$15      ;  |
                    db $15,$15,$0C,$15,$15,$0F,$15,$15      ;  |
                    db $15,$0B,$07,$15,$0C,$15,$15,$15      ;  |
                    db $15,$0C,$15,$15,$09,$0E,$15,$15      ;  |
                    db $0C,$15,$0B,$07,$15,$15,$15,$0B      ;  |
                    db $07,$15,$15,$0A,$10,$15,$0B,$07      ;  |
                    db $15,$0C                              ; /

DATA_158F87:        db $00,$EF,$15,$15,$15,$0B,$0E,$15      ; \ Fifth part of the vertical level cloud image.
                    db $15,$0B,$15,$15,$0B,$15,$15,$15      ;  | Starts at Y pos: 0
                    db $15,$15,$15,$15,$0C,$09,$0E,$0B      ;  | Starts at X pos: 0
                    db $07,$15,$0B,$07,$15,$15,$15,$15      ;  | Height: $F/15
                    db $0D,$15,$0B,$07,$15,$09,$07,$15      ;  | Width: $10/16
                    db $15,$0C,$15,$15,$15,$15,$15,$15      ;  | Total length of tilemap data: 240
                    db $0C,$0C,$15,$15,$15,$15,$15,$15      ;  |
                    db $0D,$08,$15,$15,$15,$15,$0B,$15      ;  |
                    db $0D,$08,$15,$15,$15,$15,$15,$15      ;  |
                    db $0C,$15,$15,$15,$15,$0C,$15,$0B      ;  |
                    db $07,$15,$15,$0B,$13,$0E,$0B,$07      ;  |
                    db $15,$15,$15,$15,$15,$15,$0C,$15      ;  |
                    db $15,$15,$0C,$15,$09,$07,$15,$15      ;  |
                    db $15,$15,$15,$15,$0B,$07,$15,$15      ;  |
                    db $15,$0D,$08,$15,$15,$15,$15,$15      ;  |
                    db $15,$0B,$15,$0C,$15,$15,$15,$15      ;  |
                    db $15,$0C,$15,$15,$15,$15,$15,$0B      ;  |
                    db $07,$15,$0D,$08,$15,$15,$15,$0B      ;  |
                    db $15,$15,$15,$15,$15,$15,$0C,$15      ;  |
                    db $15,$15,$0D,$08,$15,$15,$0C,$15      ;  |
                    db $15,$15,$15,$15,$15,$0D,$08,$15      ;  |
                    db $15,$0B,$15,$15,$15,$0D,$08,$0A      ;  |
                    db $08,$15,$15,$15,$15,$0D,$08,$0B      ;  |
                    db $07,$15,$15,$15,$15,$0D,$10,$0D      ;  |
                    db $08,$15,$15,$15,$0B,$0B,$0C,$15      ;  |
                    db $15,$15,$15,$15,$15,$0C,$15,$07      ;  |
                    db $15,$15,$0B,$07,$07,$0D,$08,$15      ;  |
                    db $15,$15,$15,$15,$0C,$15,$15,$15      ;  |
                    db $15,$0C,$15,$15,$0B,$07,$15,$15      ;  |
                    db $15,$15,$0B,$07,$15,$15,$15,$0B      ;  |
                    db $07,$15                              ; /

DATA_159079:        db $00,$EF,$0C,$15,$15,$15,$0B,$0E      ; \ Sixth, last and bottom-most part of the vertical level cloud image.
                    db $15,$15,$15,$15,$15,$15,$15,$0D      ;  | This image is so deep down that few rooms feature it at all.
                    db $08,$0D,$15,$15,$0B,$07,$09,$0E      ;  | One of the rooms (if more than one) that do feature it...
                    db $15,$15,$15,$15,$15,$15,$0B,$0D      ;  | ...include the big vertical room in 6-3, as you climb up your way to the pyramid high in the sky.
                    db $15,$0D,$15,$0C,$15,$15,$0F,$15      ;  | However, even in a room this big, only the upper part of this image is visible.
                    db $15,$15,$0B,$0E,$0B,$07,$15,$15      ;  | Starts at Y pos: 0
                    db $15,$0C,$0D,$08,$15,$09,$0E,$15      ;  | Starts at X pos: 0
                    db $0B,$07,$09,$15,$15,$0B,$15,$0B      ;  | Height: $F/15
                    db $07,$15,$0C,$15,$15,$0B,$13,$07      ;  | Width: $10/16
                    db $15,$15,$15,$15,$0C,$15,$0C,$15      ;  | Total length of tilemap data: 240
                    db $0B,$07,$15,$15,$0C,$15,$15,$15      ;  |
                    db $15,$0B,$13,$07,$0B,$15,$15,$0D      ;  |
                    db $15,$15,$15,$0D,$08,$15,$15,$15      ;  |
                    db $0C,$15,$15,$07,$15,$15,$0B,$15      ;  |
                    db $15,$15,$15,$0D,$15,$15,$15,$0D      ;  |
                    db $08,$15,$15,$15,$0B,$07,$15,$15      ;  |
                    db $15,$15,$15,$0C,$15,$15,$15,$0D      ;  |
                    db $0B,$15,$15,$0C,$15,$15,$15,$15      ;  |
                    db $15,$0B,$15,$15,$15,$15,$15,$0C      ;  |
                    db $15,$0B,$0D,$08,$15,$15,$15,$15      ;  |
                    db $0C,$15,$15,$15,$15,$15,$0D,$0B      ;  |
                    db $15,$15,$07,$15,$15,$15,$15,$0D      ;  |
                    db $08,$0A,$08,$15,$15,$15,$07,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$0D      ;  |
                    db $10,$0D,$08,$15,$15,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$15,$15,$15,$15      ;  |
                    db $15,$0C,$15,$0B,$15,$15,$15,$15      ;  |
                    db $15,$15,$15,$15,$0B,$0E,$15,$15      ;  |
                    db $0C,$15,$0C,$15,$15,$15,$15,$15      ;  |
                    db $15,$15,$15,$0C,$0F,$15,$0B,$07      ;  |
                    db $0B,$07                              ; /

DATA_15916B:        db $00,$00,$00,$01,$01,$00,$00,$00      ; \
                    db $00,$00,$00,$01,$00,$00,$00,$00      ;  | This table here determines...
                    db $00,$00,$00,$00,$00,$00,$01,$01      ;  | ...per room in each level (10 rooms in 20 levels)...
                    db $01,$00,$00,$00,$00,$00,$00,$01      ;  | ...if the Layer 3 Map16 table should hold cloud tiles...
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | ...or door-tiles.
                    db $01,$00,$01,$00,$00,$00,$00,$00      ;  | The former set can technically make use of the door tiles by using tiles 1A-22...
                    db $00,$00,$00,$00,$01,$01,$00,$00      ;  | ..., even though it never seems to have been done in the original SMB2,...
                    db $01,$00,$00,$00,$00,$00,$01,$00      ;  | ... but the latter set cannot make use of the cloud tiles.
                    db $01,$00,$00,$00,$00,$00,$00,$00      ;  | As a result, where the door tiles are situated at 1A-22 in the first set...
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  | ... these tiles are 00-08 in the second set.
                    db $01,$00,$01,$00,$00,$00,$00,$00      ;  |
                    db $01,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $01,$00,$00,$00,$00,$00,$01,$00      ;  |
                    db $00,$00,$00,$00,$00,$01,$00,$00      ;  |
                    db $00,$01,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$01      ;  |
                    db $00,$01,$00,$00,$00,$00,$00,$01      ;  |
                    db $01,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $01,$00,$01,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$01,$00,$00,$01      ;  |
                    db $01,$00,$00,$00,$00,$00,$00,$00      ;  |
                    db $00,$00,$00,$00,$00,$00,$00,$01      ;  |
                    db $00,$00,$00,$01,$00,$00,$00,$00      ; /

PNTR_159233:        dw DATA_159237                          ; \ "Cloud" Map16 table (1A-22 are overlap with 00-08 of the following table)
                    dw DATA_159307                          ; / "Door" Map16 table (used for door light effects)

DATA_159237:        db $3F,$01,$3F,$01,$3F,$01,$3F,$01      ; Tile 00. (Layer 3 Map16 table).
                    db $00,$05,$01,$05,$10,$05,$13,$05      ; Tile 01.
                    db $02,$05,$03,$05,$13,$05,$13,$05      ; Tile 02
                    db $04,$05,$05,$05,$13,$05,$15,$05      ; Tile 03
                    db $20,$05,$13,$05,$30,$05,$31,$05      ; Tile 04
                    db $13,$05,$13,$05,$32,$05,$33,$05      ; Tile 05
                    db $13,$05,$25,$05,$34,$05,$35,$05      ; Tile 06
                    db $21,$05,$13,$05,$13,$05,$13,$05      ; Tile 07
                    db $13,$05,$11,$05,$13,$05,$13,$05      ; Tile 08
                    db $13,$05,$13,$05,$22,$05,$13,$05      ; Tile 09
                    db $13,$05,$13,$05,$13,$05,$12,$05      ; Tile 0A
                    db $06,$05,$07,$05,$16,$05,$13,$05      ; Tile 0B
                    db $08,$05,$09,$05,$13,$05,$13,$05      ; Tile 0C
                    db $0A,$05,$0B,$05,$13,$05,$1B,$05      ; Tile 0D
                    db $26,$05,$13,$05,$36,$05,$37,$05      ; Tile 0E
                    db $13,$05,$13,$05,$38,$05,$39,$05      ; Tile 0F
                    db $13,$05,$2B,$05,$3A,$05,$3B,$05      ; Tile 10
                    db $14,$05,$13,$05,$24,$05,$13,$05      ; Tile 11
                    db $13,$05,$17,$05,$13,$05,$27,$05      ; Tile 12
                    db $18,$05,$13,$05,$28,$05,$13,$05      ; Tile 13
                    db $13,$05,$19,$05,$13,$05,$29,$05      ; Tile 14
                    db $13,$05,$13,$05,$13,$05,$13,$05      ; Tile 15
                    db $0C,$1D,$3F,$01,$3F,$01,$3F,$01      ; Tile 16
                    db $3F,$01,$3F,$01,$0D,$1D,$3F,$01      ; Tile 17
                    db $3F,$01,$3F,$01,$3F,$01,$0E,$1D      ; Tile 18
                    db $3F,$01,$0F,$1D,$3F,$01,$3F,$01      ; Tile 19

DATA_159307:        db $3C,$21,$3C,$21,$3C,$21,$3C,$21      ; Tile 1A/00
                    db $2C,$21,$3F,$21,$3C,$21,$2C,$21      ; Tile 1B/01
                    db $3C,$21,$3C,$21,$3C,$21,$3C,$21      ; Tile 1C/02
                    db $3C,$21,$3C,$21,$3C,$21,$3C,$21      ; Tile 1D/03
                    db $3C,$21,$3C,$21,$3C,$21,$3C,$21      ; Tile 1E/04
                    db $3F,$21,$2C,$61,$2C,$61,$3C,$61      ; Tile 1F/05
                    db $3C,$61,$3C,$21,$3C,$21,$3C,$21      ; Tile 20/06
                    db $1C,$21,$3C,$21,$3C,$21,$3C,$21      ; Tile 21/07
                    db $3C,$21,$1D,$21,$3C,$21,$3C,$21      ; Tile 22/08

DATA_15934F:        dw $9351                                ; Pointer to the below table.

                    db $3F,$01,$3F,$01,$3F,$01,$3F,$01      ; Empty tile.

DATA_159359:        db $07,$08,$01,$FF,$FF,$FF,$02,$02
                    db $03,$01,$FF,$FF,$02,$02,$02,$03
                    db $01,$FF,$02,$02,$02,$02,$03,$01

PNTR_159371:        dw DATA_15937B                          ; Layer 3 stars placement 0
                    dw DATA_159394                          ; Layer 3 stars placement 1
                    dw DATA_1593A9                          ; Layer 3 stars placement 2
                    dw DATA_1593C6                          ; Layer 3 stars placement 3
                    dw DATA_1593DF                          ; Layer 3 stars placement 4

DATA_15937B:        db $10,$19,$1B,$19,$1E,$19,$24,$16      ; \ The format is simple.
                    db $2E,$18,$38,$18,$3E,$16,$52,$17      ;  | Every star = 2 bytes. First byte: yyyyxxxx, denotes position.
                    db $55,$19,$5C,$17,$70,$19,$A2,$18      ;  | Second byte - tile num in Layer 3 Map16. Table is terminated with an $FF byte.
                    db $FF                                  ; / This table here places 12 stars on screen.

DATA_159394:        db $13,$17,$2A,$16,$31,$18,$4D,$19      ; \
                    db $68,$19,$6B,$17,$6D,$18,$8C,$16      ;  | This table here places 10 stars on screen.
                    db $BC,$19,$CE,$17,$FF                  ; /

DATA_1593A9:        db $0D,$16,$23,$19,$30,$17,$35,$18      ; \
                    db $38,$16,$5C,$17,$72,$16,$7B,$16      ;  | This table here places 14 stars on screen.
                    db $80,$19,$8B,$19,$BC,$18,$BF,$19      ;  |
                    db $D0,$17,$EE,$19,$FF                  ; /

DATA_1593C6:        db $04,$19,$1E,$18,$20,$19,$2A,$16      ; \
                    db $39,$17,$3C,$18,$3E,$19,$71,$18      ;  | This table here places 12 stars on screen.
                    db $90,$16,$AF,$18,$BE,$17,$E0,$17      ;  |
                    db $FF                                  ; /

DATA_1593DF:        db $20,$19,$71,$18,$43,$16,$14,$19      ; \
                    db $56,$17,$39,$17,$2A,$16,$5B,$18      ;  | This table here places 10 stars on screen.
                    db $8C,$16,$4E,$19,$FF                  ; /

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty data.
                    db $FF,$FF,$FF,$FF                      ; /

CODE_159400:        LDA.w $0533
                    CMP.b #$0E                  
                    BNE   CODE_159411           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BNE   CODE_159411           
                    JMP.w CODE_159E65           

CODE_159411:        STZ.w $0542                 
                    LDA.b #$FF                  
                    STA.w $0756                 
                    STZ.b $09                   
CODE_15941B:        STZ.w $0757                 
                    LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BNE   CODE_159433           
                    LDA.w $0541                 
                    INC   A                     
                    INC   A                     
                    STA.w $0542                 
                    STZ.b $0E                   
                    STZ.w $02C8                 
                    BRA   CODE_159479           

CODE_159433:        LDA.b ($D9),y               
                    AND.b #$F0                  
                    BEQ   CODE_15945D           
                    CMP.b #$F0                  
                    BNE   CODE_159461           
                    STZ.w $02C8                 
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    STY.b $0F                   
                    JSL.l CODE_12F69F           
                    LDY.b $0F                   
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    CMP.b #$02                  
                    BCC   CODE_159479           
                    CMP.b #$06                  
                    BEQ   CODE_15945D           
                    CMP.b #$05                  
                    BNE   CODE_15945E           
                    INY                         
CODE_15945D:        INY                         
CODE_15945E:        INY                         
                    BRA   CODE_15941B           

CODE_159461:        CLC                         
                    ADC.b $09                   
                    BCC   CODE_15946A           
                    ADC.b #$0F                  
                    BRA   CODE_159470           

CODE_15946A:        CMP.b #$F0                  
                    BNE   CODE_159473           
                    LDA.b #$00                  
CODE_159470:        INC.w $0542                 
CODE_159473:        STA.b $09                   
                    INY                         
                    INY                         
                    BRA   CODE_15941B           

CODE_159479:        LDA.b $E5                   
                    INC   A                     
                    CMP.b $0E                   
                    BCC   CODE_159489           
                    LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BEQ   CODE_159489           
                    JSR.w CODE_159691           
CODE_159489:        JSR.w CODE_1594EC           
                    JSR.w CODE_159995           
                    LDA.w $0764                 
                    BEQ   CODE_15949A           
                    JSL.l CODE_12F7CE           
                    BRA   CODE_1594A6           

CODE_15949A:        LDA.b $EB                   
                    BEQ   CODE_1594A3           
                    JSR.w CODE_159517           
                    BRA   CODE_1594A6           

CODE_1594A3:        JSR.w CODE_1599F1           
CODE_1594A6:        STZ.w $0757                 
                    LDA.b $EB                   
                    BEQ   CODE_1594BB           
                    INC.b $E5                   
                    LDA.b $E5                   
                    CMP.b #$10                  
                    BNE   CODE_1594C0           
                    INC.b $E9                   
                    STZ.b $E5                   
                    BRA   CODE_1594C0           

CODE_1594BB:        LDA.b #$10                  
                    JSR.w CODE_15967D           
CODE_1594C0:        LDA.b $E9                   
                    CMP.w $0542                 
                    BNE   CODE_159489           
                    LDA.b $EB                   
                    BEQ   CODE_1594D3           
                    LDA.b $E5                   
                    CMP.b $0E                   
                    BCC   CODE_159479           
                    BCS   CODE_1594D9                   
CODE_1594D3:        LDA.b $E6                   
                    CMP.b $0E                   
                    BCC   CODE_159479           
CODE_1594D9:        LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BEQ   CODE_1594EB           
                    INY                         
                    LDA.b ($D9),y               
                    AND.b #$1F                  
                    STA.w $0543                 
                    INY                         
                    JMP.w CODE_15941B           

CODE_1594EB:        RTL                         

CODE_1594EC:        STY.w $0713                 
                    LDX.b $E9                   
CODE_1594F1:        LDY.w $0534                 
                    LDA   DATA_11AB11,y               
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.w DATA_11AB06,x               
                    STA.b $03                   
                    LDA.b $E6                   
                    CLC                         
                    ADC.b $E5                   
                    STA.b $E7                   
                    LDY.w $0713                 
                    RTS                         

DATA_159512:        db $0F,$1E,$2D,$3C,$4B

CODE_159517:        STY.b $04                   
                    INC.w $0756                 
                    LDA.w $0543                 
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
                    LDA.w $02C8                 
                    BNE   CODE_15954D           
                    LDA.w $075A                 
                    BEQ   CODE_159541           
                    STZ.w $075A                 
                    BRA   CODE_159577           

CODE_159541:        LDA.w $0757                 
                    CMP.b #$01                  
                    BNE   CODE_159561           
                    INC.w $075A                 
                    BRA   CODE_159561           

CODE_15954D:        LDA.w $0757                 
                    BEQ   CODE_159561           
                    CMP.b #$FF                  
                    BEQ   CODE_159561           
                    CMP.b #$01                  
                    BEQ   CODE_15955E           
                    LDX.b #$04                  
                    BRA   CODE_159567           

CODE_15955E:        INC.w $075A                 
CODE_159561:        LDA.w $0756                 
                    AND.b #$03                  
                    TAX                         
CODE_159567:        LDA.l DATA_159512,x             
                    REP   #$20                  
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $C4                   
                    STA.b $C4                   
                    SEP   #$20                  
CODE_159577:        LDY.b $E7                   
                    JSR.w CODE_15958C           
                    LDY.b $E7                   
                    JSR.w CODE_1597B7           
                    LDA.w $02C8                 
                    BNE   CODE_159589           
                    INC.w $02C8                 
CODE_159589:        LDY.b $04                   
                    RTS                         

CODE_15958C:        STZ.w $0713                 
                    LDA.b $C4                   
                    STA.w $0716                 
                    LDA.b $C5                   
                    STA.w $0717                 
                    LDA.w $0757                 
                    AND.b #$F0                  
                    BNE   CODE_1595AF           
                    LDA.w $075B                 
                    AND.b #$0F                  
                    BEQ   CODE_1595C2           
CODE_1595A7:        LDA.b #$0E                  
                    SEC                         
                    SBC.w $075C                 
                    BRA   CODE_1595BC           

CODE_1595AF:        LDA.w $075B                 
                    AND.b #$0F                  
                    BNE   CODE_1595A7           
                    LDA.b #$0E                  
                    SEC                         
                    SBC.w $0758                 
CODE_1595BC:        STA.w $0715                 
                    STZ.w $0757                 
CODE_1595C2:        LDA.w $0715                 
                    BEQ   CODE_1595FE           
                    CMP.w $0713                 
                    BPL   CODE_1595FE           
                    LDA.b $C4                   
                    STA.w $0716                 
                    LDA.b $C5                   
                    STA.w $0717                 
                    LDA.w $0543                 
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C5                   
                    LDA.w $0756                 
                    AND.b #$03                  
                    TAX                         
                    LDA.l DATA_159512,x             
                    REP   #$20                  
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $C4                   
                    STA.b $C4                   
                    SEP   #$20                  
CODE_1595FE:        STY.w $0714                 
                    LDY.w $0713                 
                    LDA.b [$C4],y               
                    LDY.w $0714                 
                    STA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_159625           
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    CLC                         
                    ADC.w #$7000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.b [$01],y               
                    SEP   #$10                  
                    LDY.w $0714                 
CODE_159625:        LDA.w $0716                 
                    STA.b $C4                   
                    LDA.w $0717                 
                    STA.b $C5                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    INC.w $0713                 
                    LDA.w $0713                 
                    CMP.b #$0F                  
                    BEQ   CODE_159641           
                    BRL   CODE_1595C2           
CODE_159641:        LDA.w $0757                 
                    STA.w $075B                 
                    LDA.w $0758                 
                    STA.w $075C                 
                    STZ.w $0715                 
                    RTS                         

CODE_159651:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_159668           
                    TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    STX.b $0B                   
                    LDX.b $E9                   
                    INX                         
                    STX.b $0D                   
                    JSR.w CODE_1594F1           
                    LDX.b $0B                   
CODE_159668:        RTS                         

                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    CMP.b #$F0                  
                    BCC   CODE_15967C           
                    LDX.b $E9                   
                    INX                         
                    JSR.w CODE_1594F1           
                    TYA                         
                    AND.b #$0F                  
                    TAY                         
CODE_15967C:        RTS                         

CODE_15967D:        CLC                         
                    ADC.b $E6                   
                    BCC   CODE_159686           
                    ADC.b #$0F                  
                    BRA   CODE_15968C           
CODE_159686:        CMP.b #$F0                  
                    BNE   CODE_15968E           
                    LDA.b #$00                  
CODE_15968C:        INC.b $E9                   
CODE_15968E:        STA.b $E6                   
                    RTS                         

CODE_159691:        STY.w $0712                 
                    INY                         
                    LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BNE   CODE_15969E           
                    BRL   CODE_1597AD           

CODE_15969E:        AND.b #$1F                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
                    STZ.w $0716                 
                    STZ.w $0717                 
                    STZ.w $071A                 
                    LDY.b #$00                  
CODE_1596BE:        LDA.b [$C4],y               
                    CMP.b #$40                  
                    BEQ   CODE_1596CC           
                    LDX.w $071A                 
                    INC.w $0716,x               
                    BRA   CODE_1596DE           

CODE_1596CC:        CPY.b #$00                  
                    BEQ   CODE_1596D8           
                    DEY                         
                    LDA.b [$C4],y               
                    CMP.b #$40                  
                    BEQ   CODE_1596DD           
                    INY                         
CODE_1596D8:        INC.w $071A                 
                    BRA   CODE_1596DE           

CODE_1596DD:        INY                         
CODE_1596DE:        INY                         
                    CPY.b #$0F                  
                    BNE   CODE_1596BE           
                    LDA.w $0716                 
                    CMP.b #$0F                  
                    BNE   CODE_1596ED           
                    STA.w $0717                 
CODE_1596ED:        LDA.w $0543                 
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15A90E,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
                    STZ.w $0718                 
                    STZ.w $0719                 
                    STZ.w $071A                 
                    LDY.b #$00                  
CODE_15970E:        LDA.b [$C4],y               
                    CMP.b #$40                  
                    BEQ   CODE_15971C           
                    LDX.w $071A                 
                    INC.w $0718,x               
                    BRA   CODE_15972E           
CODE_15971C:        CPY.b #$00                  
                    BEQ   CODE_159728           
                    DEY                         
                    LDA.b [$C4],y               
                    CMP.b #$40                  
                    BEQ   CODE_15972D           
                    INY                         
CODE_159728:        INC.w $071A                 
                    BRA   CODE_15972E           

CODE_15972D:        INY                         
CODE_15972E:        INY                         
                    CPY.b #$0F                  
                    BNE   CODE_15970E           
                    LDA.w $0718                 
                    CMP.b #$0F                  
                    BNE   CODE_15973D           
                    STA.w $0719                 
CODE_15973D:        LDA.w $0719                 
                    CMP.w $0717                 
                    BEQ   CODE_159754           
                    BMI   CODE_159761           
                    LDA.b #$10                  
                    STA.w $0757                 
                    LDA.w $0717                 
                    STA.w $0758                 
                    BRA   CODE_15976C           

CODE_159754:        LDA.b #$FF                  
                    STA.w $0757                 
                    LDA.w $0717                 
                    STA.w $0758                 
                    BRA   CODE_15976C           

CODE_159761:        LDA.b #$01                  
                    STA.w $0757                 
                    LDA.w $0719                 
                    STA.w $0758                 
CODE_15976C:        LDA.w $0718                 
                    CMP.w $0716                 
                    BEQ   CODE_159788           
                    BMI   CODE_159797           
                    LDA.w $0716                 
                    BEQ   CODE_1597AD           
                    LDA.b #$10                  
                    STA.w $075D                 
                    LDA.w $0716                 
                    STA.w $075E                 
                    BRA   CODE_1597AD           

CODE_159788:        LDA.w $0718                 
                    BEQ   CODE_1597AD           
                    STA.w $075E                 
                    LDA.b #$FF                  
                    STA.w $075D                 
                    BRA   CODE_1597AD           

CODE_159797:        LDA.w $0718                 
                    BEQ   CODE_1597AD           
                    LDA.b #$11                  
                    STA.w $075D                 
                    LDA.w $0718                 
                    STA.w $075E                 
                    LDA.w $0716                 
                    STA.w $0763                 
CODE_1597AD:        LDY.w $0712                 
                    RTS                         

DATA_1597B1:        db $05,$06

DATA_1597B3:        db $11,$12,$04,$10

CODE_1597B7:        STZ.w $0713                 
                    LDA.w $075D                 
                    AND.b #$F0                  
                    BNE   CODE_1597CB           
                    LDA.w $075F                 
                    AND.b #$0F                  
                    BNE   CODE_1597D6           
                    BRL   CODE_159882           

CODE_1597CB:        LDA.w $075E                 
                    STA.w $0715                 
                    STZ.w $0761                 
                    BRA   CODE_1597E3           

CODE_1597D6:        LDA.w $0760                 
                    STA.w $0715                 
                    LDA.b #$01                  
                    STA.w $0761                 
                    BRA   CODE_15981C           

CODE_1597E3:        TYA                         
                    AND.b #$10                  
                    BNE   CODE_159802           
                    LDA.b [$01],y               
                    CMP.b #$07                  
                    BNE   CODE_1597F5           
                    LDA.w $0756                 
                    AND.b #$01                  
                    BRA   CODE_159855           

CODE_1597F5:        CMP.b #$13                  
                    BNE   CODE_159863           
                    LDA.w $0756                 
                    AND.b #$01                  
                    EOR.b #$01                  
                    BRA   CODE_159855           

CODE_159802:        LDA.b [$01],y               
                    CMP.b #$07                  
                    BNE   CODE_159811           
                    LDA.w $0756                 
                    AND.b #$01                  
                    EOR.b #$01                  
                    BRA   CODE_15985C           

CODE_159811:        CMP.b #$13                  
                    BNE   CODE_159863           
                    LDA.w $0756                 
                    AND.b #$01                  
                    BRA   CODE_15985C           
CODE_15981C:        TYA                         
                    AND.b #$10                  
                    BNE   CODE_15983B           
                    LDA.b [$01],y               
                    CMP.b #$04                  
                    BNE   CODE_15982E           
                    LDA.w $0756                 
                    AND.b #$01                  
                    BRA   CODE_159855           

CODE_15982E:        CMP.b #$10                  
                    BNE   CODE_159863           
                    LDA.w $0756                 
                    AND.b #$01                  
                    EOR.b #$01                  
                    BRA   CODE_159855           

CODE_15983B:        LDA.b [$01],y               
                    CMP.b #$04                  
                    BNE   CODE_15984A           
                    LDA.w $0756                 
                    AND.b #$01                  
                    EOR.b #$01                  
                    BRA   CODE_15985C           

CODE_15984A:        CMP.b #$10                  
                    BNE   CODE_159863           
                    LDA.w $0756                 
                    AND.b #$01                  
                    BRA   CODE_15985C           

CODE_159855:        TAX                         
                    LDA.l DATA_1597B1,x             
                    BRA   CODE_159861           

CODE_15985C:        TAX                         
                    LDA.l DATA_1597B3,x             
CODE_159861:        STA.b [$01],y               
CODE_159863:        LDA.b $EB                   
                    BNE   CODE_15986A           
                    INY                         
                    BRA   CODE_15986F           
CODE_15986A:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
CODE_15986F:        INC.w $0713                 
                    LDA.w $0713                 
                    CMP.w $0715                 
                    BPL   CODE_159882           
                    LDA.w $0761                 
                    BNE   CODE_15981C           
                    BRL   CODE_1597E3           
CODE_159882:        LDA.w $075D                 
                    STA.w $075F                 
                    LDA.w $075E                 
                    STA.w $0760                 
                    STZ.w $075D                 
                    STZ.w $0715                 
                    RTS                         

CODE_159895:        STY.w $0712                 
                    JSR.w CODE_159929           
                    LDA.w $0713                 
                    BEQ   CODE_1598DE           
                    LDA.b [$01],y               
                    CMP.b #$01                  
                    BEQ   CODE_1598C4           
                    CMP.b #$02                  
                    BEQ   CODE_1598C4           
                    CMP.b #$05                  
                    BEQ   CODE_1598C8           
                    CMP.b #$06                  
                    BEQ   CODE_1598C8           
                    CMP.b #$11                  
                    BEQ   CODE_1598C8           
                    CMP.b #$12                  
                    BEQ   CODE_1598C8           
                    CMP.b #$15                  
                    BEQ   CODE_1598D7           
                    CMP.b #$16                  
                    BEQ   CODE_1598D7           
                    BRA   CODE_1598DE           

CODE_1598C4:        LDA.b #$03                  
                    BRA   CODE_1598D9           

CODE_1598C8:        LDA.w $0712                 
                    AND.b #$10                  
                    BNE   CODE_1598D3           
                    LDA.b #$07                  
                    BRA   CODE_1598D9           

CODE_1598D3:        LDA.b #$13                  
                    BRA   CODE_1598D9           

CODE_1598D7:        LDA.b #$17                  
CODE_1598D9:        LDY.w $0712                 
                    STA.b [$01],y               
CODE_1598DE:        RTL                         

CODE_1598DF:        STY.w $0712                 
                    JSR.w CODE_159929           
                    LDA.w $0713                 
                    BEQ   CODE_159928           
                    LDA.b [$01],y               
                    CMP.b #$01                  
                    BEQ   CODE_15990E           
                    CMP.b #$02                  
                    BEQ   CODE_15990E           
                    CMP.b #$05                  
                    BEQ   CODE_159912           
                    CMP.b #$06                  
                    BEQ   CODE_159912           
                    CMP.b #$11                  
                    BEQ   CODE_159912           
                    CMP.b #$12                  
                    BEQ   CODE_159912           
                    CMP.b #$15                  
                    BEQ   CODE_159921           
                    CMP.b #$16                  
                    BEQ   CODE_159921           
                    BRA   CODE_159928           

CODE_15990E:        LDA.b #$00                  
                    BRA   CODE_159923           

CODE_159912:        LDA.w $0712                 
                    AND.b #$10                  
                    BNE   CODE_15991D           
                    LDA.b #$04                  
                    BRA   CODE_159923           
CODE_15991D:        LDA.b #$10                  
                    BRA   CODE_159923           
CODE_159921:        LDA.b #$14                  
CODE_159923:        LDY.w $0712                 
                    STA.b [$01],y               
CODE_159928:        RTL                         

CODE_159929:        REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    CLC                         
                    ADC.w #$7000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b [$01],y               
                    STA.w $0713                 
                    SEP   #$10                  
                    RTS                         

CODE_15993E:        LDA.w $0533                 
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15B3F8,x             
                    STA.b $01                   
                    INX                         
                    LDA   PNTR_15B3F8,x             
                    STA.b $02                   
                    LDA.b #$15                  
                    STA.b $03                   
                    LDA.b #$7E                  
                    STA.b $0F                   
                    REP   #$10                  
                    LDY.w #$0000                
CODE_15995D:        REP   #$30                  
                    LDA.b [$01],y               
                    CMP.w #$FFFF                
                    BEQ   CODE_159992           
                    AND.w #$FF00                
                    CMP.w #$FE00                
                    BNE   CODE_159978           
                    LDA.b [$01],y               
                    AND.w #$00FF                
                    STA.w $0721                 
                    INY                         
                    INY                         
CODE_159978:        LDA.b [$01],y               
                    STA.b $0D                   
                    SEP   #$20                  
                    LDA.w $0721                 
                    STA.b [$0D]                 
                    LDA.b $0E                   
                    CLC                         
                    ADC.b #$70                  
                    STA.b $0E                   
                    LDA.b #$01                  
                    STA.b [$0D]                 
                    INY                         
                    INY                         
                    BRA   CODE_15995D           

CODE_159992:        SEP   #$30                  
                    RTL                         

CODE_159995:        STY.w $0712                 
                    LDA.b $01                   
                    STA.w $0713                 
                    LDA.b $02                   
                    STA.w $0714                 
                    LDA.b $03                   
                    STA.w $0715                 
                    STZ.w $0764                 
                    LDA.w $0533                 
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15B3A8,x             
                    STA.b $01                   
                    INX                         
                    LDA   PNTR_15B3A8,x             
                    STA.b $02                   
                    LDA.b #$15                  
                    STA.b $03                   
                    LDY.b #$00                  
CODE_1599C2:        LDA.b [$01],y               
                    CMP.b #$FF                  
                    BEQ   CODE_1599DE           
                    CMP.w $0534                 
                    BNE   CODE_1599DA           
                    INY                         
                    LDA.b [$01],y               
                    CMP.w $0543                 
                    BNE   CODE_1599DB           
                    INC.w $0764                 
                    BRA   CODE_1599DE           

CODE_1599DA:        INY                         
CODE_1599DB:        INY                         
                    BRA   CODE_1599C2           

CODE_1599DE:        LDY.w $0712                 
                    LDA.w $0713                 
                    STA.b $01                   
                    LDA.w $0714                 
                    STA.b $02                   
                    LDA.w $0715                 
                    STA.b $03                   
                    RTS                         

CODE_1599F1:        STY.b $04                   
                    INC.w $0756                 
                    LDA.w $0533                 
                    CMP.b #$0D                  
                    BNE   CODE_159A18           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BNE   CODE_159A18           
                    LDA.b $E9                   
                    CMP.b #$01                  
                    BNE   CODE_159A0E           
                    LDA.b #$1F                  
                    BRA   CODE_159A1B           

CODE_159A0E:        LDA.b $E9                   
                    CMP.b #$02                  
                    BNE   CODE_159A18           
                    LDA.b #$20                  
                    BRA   CODE_159A1B           

CODE_159A18:        LDA.w $0543                 
CODE_159A1B:        ASL   A                     
                    TAX                         
                    LDA   PNTR_15B106,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15B106,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
                    LDA.w $0756                 
                    AND.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    REP   #$20                  
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $C4                   
                    STA.b $C4                   
                    SEP   #$20                  
                    LDY.b $E7                   
                    JSR.w CODE_159A4B           
                    LDY.b $04                   
                    RTS                         

CODE_159A4B:        STZ.w $0713                 
CODE_159A4E:        STY.w $0714                 
                    LDY.w $0713                 
                    LDA.b [$C4],y               
                    CMP.b #$9D                  
                    BNE   CODE_159A6A           
                    LDX.w $0533                 
                    CPX.b #$06                  
                    BNE   CODE_159A6A           
                    LDX.w $0534                 
                    CPX.b #$01                  
                    BNE   CODE_159A6A           
                    LDA.b #$05                  
CODE_159A6A:        LDY.w $0714                 
                    STA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_159A76           
                    JMP.w CODE_159AF8           

CODE_159A76:        CMP.b #$9D                  
                    BEQ   CODE_159AF8           
                    CMP.b #$05                  
                    BNE   CODE_159AB4           
                    LDA.w $0543                 
                    CMP.b #$0C                  
                    BEQ   CODE_159AF8           
                    CMP.b #$0A                  
                    BNE   CODE_159A92           
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$0F                  
                    BNE   CODE_159AF8           
                    BRA   CODE_159AB4           

CODE_159A92:        CMP.b #$11                  
                    BNE   CODE_159AA3           
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$06                  
                    BMI   CODE_159AE5           
                    CMP.b #$0F                  
                    BEQ   CODE_159AE5           
                    BRA   CODE_159AF8           

CODE_159AA3:        CMP.b #$0B                  
                    BNE   CODE_159AE5           
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$07                  
                    BEQ   CODE_159AE5           
                    CMP.b #$0F                  
                    BEQ   CODE_159AE5           
                    BRA   CODE_159AF8           

CODE_159AB4:        CMP.b #$06                  
                    BNE   CODE_159AE5           
                    LDA.w $0533                 
                    CMP.b #$06                  
                    BNE   CODE_159AE5           
                    LDA.b $E9                   
                    CMP.b #$09                  
                    BCC   CODE_159AE5           
                    BNE   CODE_159AF8           
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$C0                  
                    BNE   CODE_159AD4           
                    LDA.b #$05                  
                    STA.b [$01],y               
                    BRA   CODE_159AF8           

CODE_159AD4:        CPY.b #$D0                  
                    BCC   CODE_159AE5           
                    TYA                         
                    AND.b #$0F                  
                    BEQ   CODE_159AE5           
                    CMP.b #$06                  
                    BCC   CODE_159AF8           

                    CMP.b #$0A                  
                    BCS   CODE_159AF8                   
CODE_159AE5:        LDA.b $02                   
                    STA.w $0715                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b #$01                  
                    STA.b [$01],y               
                    LDA.w $0715                 
                    STA.b $02                   
CODE_159AF8:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    STA.w $0713                 
                    BEQ   CODE_159B04           
                    JMP.w CODE_159A4E           

CODE_159B04:        RTS                         

CODE_159B05:        LDA.b $05                   
                    STA.w $0717                 
                    LDA.b $06                   
                    STA.w $0718                 
                    LDY.b #$00                  
CODE_159B11:        LDA.w $076B                 
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15C440,x             
                    STA.b $05                   
                    INX                         
                    LDA   PNTR_15C440,x             
                    STA.b $06                   
                    LDA.b #$15                  
                    STA.b $07                   
                    LDA.b [$05],y               
                    CMP.b #$FF                  
                    BEQ   CODE_159B38           
                    STA.w $076D                 
                    PHY                         
                    JSR.w CODE_159B43           
                    PLY                         
                    INY                         
                    BRA   CODE_159B11           

CODE_159B38:        LDA.w $0717                 
                    STA.b $05                   
                    LDA.w $0718                 
                    STA.b $06                   
                    RTL                         

CODE_159B43:        ASL   A                     
                    TAX                         
                    LDA   PNTR_15C140,x             
                    STA.b $05                   
                    INX                         
                    LDA   PNTR_15C140,x             
                    STA.b $06                   
                    LDA.b #$15                  
                    STA.b $07                   
                    LDY.b #$00                  
                    LDA.b [$05],y               
                    STA.b $E7                   
                    INY                         
                    LDA.b [$05],y               
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $0E                   
                    STA.b $0D                   
                    LDA.b [$05],y               
                    AND.b #$0F                  
                    STA.b $0F                   
                    JSR.w CODE_159B76           
                    STZ.w $02E4                 
                    RTS                         

CODE_159B76:        LDA.b #$02                  
                    STA.w $02E3                 
                    LDA.b $E7                   
                    STA.w $02E2                 
                    STA.b $0C                   
CODE_159B82:        STZ.w $076C                 
                    LDY.w $02E2                 
                    LDA.b [$C4],y               
                    CMP.b #$5B                  
                    BEQ   CODE_159BC6           
                    LDY.w $02E3                 
                    LDA.b [$05],y               
                    CMP.b #$40                  
                    BEQ   CODE_159BA9           
                    CMP.b #$AB                  
                    BEQ   CODE_159BA9           
                    CMP.b #$9D                  
                    BEQ   CODE_159BA9           
                    CMP.b #$9C                  
                    BEQ   CODE_159BA9           
                    CLC                         
                    ADC.b #$2C                  
                    INC.w $076C                 
CODE_159BA9:        LDY.w $02E2                 
                    STA.b [$C4],y               
                    LDX.w $076C                 
                    BEQ   CODE_159BC6           
                    LDA.b $C5                   
                    STA.w $0714                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $C5                   
                    LDA.b #$01                  
                    STA.b [$C4],y               
                    LDA.w $0714                 
                    STA.b $C5                   
CODE_159BC6:        INC.w $02E3                 
                    LDY.w $02E2                 
                    JSR.w CODE_159BEF           
                    STY.w $02E2                 
                    DEC.b $0E                   
                    LDA.b $0E                   
                    BPL   CODE_159B82           
                    DEC.b $0F                   
                    LDA.b $0F                   
                    BMI   CODE_159BEE           
                    LDY.b $0C                   
                    JSR.w CODE_159C04           
                    STY.b $0C                   
                    STY.w $02E2                 
                    LDA.b $0D                   
                    STA.b $0E                   
                    BRA   CODE_159B82           

CODE_159BEE:        RTS                         

CODE_159BEF:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    CMP.b #$F0                  
                    BCC   CODE_159C03           
                    INC.b $E9                   
                    LDX.b $E9                   
                    JSR.w CODE_159C2D           
                    TYA                         
                    AND.b #$0F                  
                    TAY                         
CODE_159C03:        RTS                         

CODE_159C04:        INY                         
                    LDA.w $0628                 
                    BEQ   CODE_159C0E           
                    LDX.b #$0A                  
                    BRA   CODE_159C29           
CODE_159C0E:        LDA.w $076D                 
                    CMP.b #$07                  
                    BEQ   CODE_159C27           
                    CMP.b #$08                  
                    BEQ   CODE_159C27           
                    DEC.b $E9                   
                    LDX.b $E9                   
                    CPX.b #$FF                  
                    BNE   CODE_159C29           
                    LDX.b #$00                  
                    STX.b $E9                   
                    BRA   CODE_159C29           

CODE_159C27:        LDX.b #$01                  
CODE_159C29:        JSR.w CODE_159C2D           
                    RTS                         

CODE_159C2D:        PHY                         
                    LDA.w $0628                 
                    BEQ   CODE_159C37           
                    LDY.b #$00                  
                    BRA   CODE_159C3A           
CODE_159C37:        LDY.w $0534                 
CODE_159C3A:        LDA   DATA_11AB11,y               
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $C5                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $C4                   
                    LDA.w DATA_11AB06,x               
                    STA.b $C6                   
                    PLY                         
                    RTS                         

DATA_159C4F:        db $15,$16

DATA_159C51:        db $01,$02

CODE_159C53:        LDA.w $0533                 
                    CMP.b #$05                  
                    BNE   CODE_159C85           
                    LDA.b #$11                  
                    STA.b $00                   
                    LDA.b #$C1                  
                    STA.b $03                   
                    LDA.b #$6D                  
                    STA.b $01                   
                    STA.b $04                   
                    LDA.b #$7E                  
                    STA.b $02                   
                    STA.b $05                   
                    LDY.b #$00                  
CODE_159C70:        TYA                         
                    AND.b #$01                  
                    TAX                         
                    LDA.l DATA_159C4F,x             
                    STA.b [$00],y               
                    LDA.l DATA_159C51,x             
                    STA.b [$03],y               
                    INY                         
                    CPY.b #$0E                  
                    BNE   CODE_159C70           
CODE_159C85:        RTL                         

DATA_159C86:        db $F1,$F2,$F3,$F4,$EF,$F0

CODE_159C8C:        LDA.w $0533
                    CMP.b #$13
                    BNE   CODE_159C85
                    LDA.w $0534
                    CMP.b #$05                  
                    BNE   CODE_159C85           
                    STZ.w $0712                 
                    STZ.w $0713                 
                    STZ.w $0714                 
CODE_159CA3:        LDX.b #$00                  
                    JSR.w CODE_159C2D           
                    REP   #$20                  
                    LDA.w $0712                 
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $C4                   
                    STA.b $C4                   
                    SEP   #$20                  
                    LDA.w $0541                 
                    STA.w $0715                 
                    LDA.w $0713                 
                    STA.w $0714                 
CODE_159CC7:        LDY.b #$00                  
CODE_159CC9:        LDA.b [$C4],y               
                    CMP.b #$AA                  
                    BEQ   CODE_159CD7           
                    CMP.b #$DD                  
                    BEQ   CODE_159CD7           
                    CMP.b #$2D                  
                    BNE   CODE_159CE0           
CODE_159CD7:        LDX.w $0714                 
                    LDA.l DATA_159C86,x             
                    STA.b [$C4],y               
CODE_159CE0:        INC.w $0714                 
                    LDA.w $0714                 
                    CMP.b #$06                  
                    BNE   CODE_159CED           
                    STZ.w $0714                 
CODE_159CED:        INY                         
                    CPY.b #$10                  
                    BNE   CODE_159CC9           
                    REP   #$20                  
                    LDA.b $C4                   
                    CLC                         
                    ADC.w #$00F0                
                    STA.b $C4                   
                    SEP   #$20                  
                    DEC.w $0715                 
                    BPL   CODE_159CC7           
                    INC.w $0713                 
                    LDA.w $0713                 
                    CMP.b #$06                  
                    BNE   CODE_159D10           
                    STZ.w $0713                 
CODE_159D10:        INC.w $0712                 
                    LDA.w $0712                 
                    CMP.b #$0F                  
                    BNE   CODE_159CA3           
                    RTL                         

DATA_159D1B:        db $00,$01,$02,$03,$04,$05,$06,$07
                    db $08,$09,$0A,$0B,$10,$11,$12,$13
                    db $14,$15,$16,$17,$18,$19,$1A,$1B

DATA_159D33:        db $20,$21,$22,$23,$24,$25,$26,$27
                    db $28,$29,$2A,$2B,$20,$21,$22,$23
                    db $24,$25,$26,$27,$28,$29,$2A,$2B

CODE_159D4B:        STY.w $0712                 
                    STX.w $0715                 
                    LDA.w $050F                 
                    CMP.b #$0A                  
                    BNE   CODE_159DBC           
                    LDA.w $0534                 
                    CMP.b #$02                  
                    BNE   CODE_159D66           
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$90                  
                    BEQ   CODE_159DBC           
CODE_159D66:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_159DBC           
                    STA.w $0716                 
                    LDA.b $01                   
                    STA.w $0713                 
                    LDA.b $02                   
                    STA.w $0714                 
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$7000                
                    STA.b $01                   
                    SEP   #$20                  
                    LDA.b [$01],y               
                    BEQ   CODE_159DB2           
                    LDA.w $0713                 
                    STA.b $01                   
                    LDA.w $0714                 
                    STA.b $02                   
                    LDA.w $0716                 
                    SEC                         
                    SBC.b #$5C                  
                    LDX.b #$17                  
CODE_159DA0:        CMP   DATA_159D1B,x             
                    BEQ   CODE_159DA9           
                    DEX                         
                    BPL   CODE_159DA0           
CODE_159DA9:        LDA.l DATA_159D33,x             
                    CLC                         
                    ADC.b #$5C                  
                    STA.b [$01],y               
CODE_159DB2:        LDA.w $0713                 
                    STA.b $01                   
                    LDA.w $0714                 
                    STA.b $02                   
CODE_159DBC:        LDY.w $0712                 
                    LDX.w $0715                 
                    RTL                         

DATA_159DC3:        db $06,$05,$12,$11,$0A

DATA_159DC8:        db $01,$02

CODE_159DCA:        STZ.w $0714                 
                    STZ.w $0716                 
CODE_159DD0:        LDX.b $E9                   
                    JSR.w CODE_159E48           
                    LDA.w $050E                 
                    STA.b $07                   
                    LDY.b $E7                   
CODE_159DDC:        LDX.b #$00                  
                    TYA                         
                    AND.b #$10                  
                    BEQ   CODE_159DE5           
                    INX                         
                    INX                         
CODE_159DE5:        TYA                         
                    AND.b #$01                  
                    BEQ   CODE_159DEB           
                    INX                         
CODE_159DEB:        LDA.w $0714                 
                    BEQ   CODE_159DF2           
                    LDX.b #$04                  
CODE_159DF2:        LDA.w $0716                 
                    BNE   CODE_159E07           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_159E07           
                    TXA                         
                    AND.b #$01                  
                    TAX                         
                    LDA.l DATA_159DC8,x             
                    BRA   CODE_159E0B           

CODE_159E07:        LDA.l DATA_159DC3,x             
CODE_159E0B:        STA.b [$01],y               
                    LDA.b $02                   
                    STA.w $0715                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.w $0714                 
                    BNE   CODE_159E20           
                    LDA.b #$01                  
                    BRA   CODE_159E22           

CODE_159E20:        LDA.b #$00                  
CODE_159E22:        STA.b [$01],y               
                    LDA.w $0715                 
                    STA.b $02                   
                    JSR.w CODE_159651           
                    DEC.b $07                   
                    BPL   CODE_159DDC           
                    LDA.b #$01                  
                    STA.w $0716                 
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    CMP.b #$C0                  
                    BCC   CODE_159DD0           
                    INC.w $0714                 
                    CMP.b #$D0                  
                    BCC   CODE_159DD0           
                    RTL                         

CODE_159E48:        STY.w $02F5                 
                    LDY.w $0534                 
                    LDA   DATA_11AB11,y               
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.w DATA_11AB06,x               
                    STA.b $03                   
                    LDY.w $02F5                 
                    RTS                         

CODE_159E65:        STZ.b $E9                   
                    JSR.w CODE_1594EC           
                    STZ.b $0F                   
CODE_159E6C:        LDX.b $0F                   
                    LDA.l DATA_15C5CE,x             
                    CMP.b #$FF                  
                    BEQ   CODE_159E9C           
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15C466,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15C466,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
                    LDX.b $0F                   
                    INX                         
                    LDA.l DATA_15C5CE,x             
                    DEC   A                     
                    STA.b $0E                   
                    JSR.w CODE_159E9D           
                    INC.b $0F                   
                    INC.b $0F                   
                    BRA   CODE_159E6C           

CODE_159E9C:        RTL                         

CODE_159E9D:        LDY.b #$00                  
CODE_159E9F:        LDA.b [$C4],y               
                    STA.b [$01],y               
                    INY                         
                    CPY.b #$10                  
                    BMI   CODE_159E9F           
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $01                   
                    SEP   #$20                  
                    DEC.b $0E                   
                    BPL   CODE_159E9D           
                    RTS                         

CODE_159EB9:        LDA.w $0533                 
                    CMP.b #$13                  
                    BEQ   CODE_159EDD           
                    CMP.b #$12                  
                    BNE   CODE_159EC7           
                    JMP.w CODE_159FC3           

CODE_159EC7:        CMP.b #$01                  
                    BNE   CODE_159ECE           
                    JMP.w CODE_159FF2           

CODE_159ECE:        CMP.b #$02                  
                    BNE   CODE_159ED5           
                    JMP.w CODE_15A037           

CODE_159ED5:        CMP.b #$0D                  
                    BNE   CODE_159EDC           
                    JMP.w CODE_15A03F           

CODE_159EDC:        RTL                         

CODE_159EDD:        STZ.b $0F                   
                    LDX.b #$00                  
                    LDA   PNTR_15C625,x             
                    STA.b $04                   
                    INX                         
                    LDA   PNTR_15C625,x             
                    STA.b $05                   
                    INX                         
                    LDA   PNTR_15C625,x             
                    STA.b $06                   
CODE_159EF5:        LDY.b #$00                  
                    LDA.b [$04],y               
                    CMP.b #$FF                  
                    BEQ   CODE_159F60           
                    CMP.b #$01                  
                    BEQ   CODE_159F19           
                    INY                         
                    LDA.b [$04],y               
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15C890,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15C890,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
                    BRA   CODE_159F2F           

CODE_159F19:        INY                         
                    LDA.b [$04],y               
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_15C8B4,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_15C8B4,x             
                    STA.b $C5                   
                    LDA.b #$15                  
                    STA.b $C6                   
CODE_159F2F:        INY                         
                    LDA.b [$04],y               
                    DEC   A                     
                    STA.w $0721                 
                    INY                         
                    LDA.b [$04],y               
                    STA.b $01                   
                    INY                         
                    LDA.b [$04],y               
                    STA.b $02                   
                    LDA.b #$7E                  
                    STA.b $03                   
                    LDY.b #$00                  
                    LDA.b [$04],y               
                    BNE   CODE_159F4F           
                    JSR.w CODE_159F61           
                    BRA   CODE_159F52           

CODE_159F4F:        JSR.w CODE_159F88           
CODE_159F52:        REP   #$20                  
                    LDA.b $04                   
                    CLC                         
                    ADC.w #$0005                
                    STA.b $04                   
                    SEP   #$20                  
                    BRA   CODE_159EF5           

CODE_159F60:        RTL                         

CODE_159F61:        STZ.w $0712                 
CODE_159F64:        LDA.w $0712                 
                    AND.b #$01                  
                    TAY                         
                    LDA.b [$C4],y               
                    STA.b [$01]                 
                    JSR.w CODE_15A06B           
                    DEC.w $0721                 
                    BMI   CODE_159F87           
                    INC.w $0712                 
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $01                   
                    SEP   #$20                  
                    BRA   CODE_159F64           
CODE_159F87:        RTS                         

CODE_159F88:        STZ.w $0712                 
CODE_159F8B:        LDA.w $0712                 
                    AND.b #$01                  
                    TAY                         
                    LDA.b [$C4],y               
                    STA.b [$01]                 
                    JSR.w CODE_15A06B           
                    DEC.w $0721                 
                    BMI   CODE_159FC0           
                    INC.w $0712                 
                    LDA.b $01                   
                    AND.b #$0F                  
                    CMP.b #$0F                  
                    BEQ   CODE_159FAC           
                    INC.b $01                   
                    BRA   CODE_159F8B           

CODE_159FAC:        LDA.b $01                   
                    AND.b #$F0                  
                    STA.b $01                   
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$00F0                
                    STA.b $01                   
                    SEP   #$20                  
                    BRA   CODE_159F8B           

CODE_159FC0:        RTS                         

DATA_159FC1:        db $07,$13
      
CODE_159FC3:        LDA.b #$20                  
                    STA.b $01                   
                    LDA.b #$57                  
                    STA.b $02                   
                    LDA.b #$7E                  
                    STA.b $03                   
                    STZ.w $0712                 
CODE_159FD2:        LDA.w $0712                 
                    AND.b #$01                  
                    TAX                         
                    LDA.w $0712                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.l DATA_159FC1,x             
                    STA.b [$01],y               
                    INC.w $0712                 
                    CPY.b #$A0                  
                    BNE   CODE_159FD2           
                    RTL                         


DATA_159FEE:        db $11,$05

DATA_159FF0:        db $12,$06


CODE_159FF2:        STZ.w $0713                 
                    LDA.b #$9F                  
                    STA.b $01                   
                    LDA.b #$26                  
                    STA.b $02                   
CODE_159FFD:        LDA.b #$7E                  
                    STA.b $03                   
                    STZ.w $0712                 
CODE_15A004:        LDA.w $0712                 
                    AND.b #$01                  
                    CLC                         
                    ADC.w $0713                 
                    TAX                         
                    LDA.w $0712                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.l DATA_159FEE,x             
                    STA.b [$01],y               
                    INC.w $0712                 
                    CPY.b #$C0                  
                    BNE   CODE_15A004           
                    LDA.w $0713                 
                    BNE   CODE_15A036           
                    STZ.b $01                   
                    LDA.b #$36                  
                    STA.b $02                   
                    INC.w $0713                 
                    INC.w $0713                 
                    BRA   CODE_159FFD           

CODE_15A036:        RTL                         

CODE_15A037:        STZ.b $01                   
                    LDA.b #$20                  
                    STA.b $02                   
                    BRA   CODE_15A047           

CODE_15A03F:        LDA.b #$7F                  
                    STA.b $01                   
                    LDA.b #$33                  
                    STA.b $02                   
CODE_15A047:        LDA.b #$7E                  
                    STA.w $03                 
                    STZ.w $0712                 
CODE_15A04F:        LDA.w $0712                 
                    AND.b #$01                  
                    TAX                         
                    LDA.w $0712                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.l DATA_159FF0,x             
                    STA.b [$01],y               
                    INC.w $0712                 
                    CPY.b #$A0                  
                    BNE   CODE_15A04F           
                    RTL                         

CODE_15A06B:        LDY.b #$00                  
CODE_15A06D:        STA.w $076E                 
                    LDA.b $02                   
                    STA.w $076F                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b #$01                  
                    STA.b [$01],y               
                    LDA.w $076F                 
                    STA.b $02                   
                    LDA.w $076E                 
                    RTS                         

DATA_15A087:        db $04,$10,$14

DATA_15A08A:        db $06,$05,$15

DATA_15A08D:        db $12,$11,$16
               
CODE_15A090:        STZ.w $0719                 
CODE_15A093:        LDA.b $E7              
                    TAY                   
                    AND.b #$F0                  
                    CMP.b #$C0                  
                    BEQ   CODE_15A0A5           
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    BRA   CODE_15A0AA 
          
CODE_15A0A5:        INC.w $0719                 
                    LDX.b #$02                  
CODE_15A0AA:        LDA.l DATA_15A087,x             
                    STA.b [$01],y               
                    JSR.w CODE_15A06D           
                    INY                         
CODE_15A0B4:        LDA.w $0719                 
                    BNE   CODE_15A0BF           
                    TYA                         
                    AND.b #$01                  
                    TAX                         
                    BRA   CODE_15A0C1           

CODE_15A0BF:        LDX.b #$02                  
CODE_15A0C1:        TYA                         
                    AND.b #$10                  
                    BNE   CODE_15A0CC           
                    LDA.l DATA_15A08A,x             
                    BRA   CODE_15A0D0
           
CODE_15A0CC:        LDA.l DATA_15A08D,x             
CODE_15A0D0:        STA.b [$01],y               
                    JSR.w CODE_15A06D           
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_15A0B4           
                    LDA.w $0719                 
                    BNE   CODE_15A0E9           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    BRA   CODE_15A093
           
CODE_15A0E9:        RTL                         

DATA_15A0EA:        db $02,$05,$08,$0B,$0E,$11

DATA_15A0F0:        db $04,$06,$08,$07,$05,$06

DATA_15A0F6:        db $2C,$A9,$DC,$2C,$A9,$DC,$2C,$A9
                    db $DC,$2C,$A9,$DC,$2C,$A9,$DC

DATA_15A105:        db $BA,$BD,$BE,$BB,$BC,$BF,$BA,$BD
                    db $BE,$BB,$BC,$BF,$BA,$BD,$BE

DATA_15A114:        db $BB,$BC,$BF,$BA,$BD,$BE,$BB,$BC
                    db $BF,$BA,$BD,$BE,$BB,$BC,$BF

CODE_15A123:        LDX.b #$05            
                    LDA.w $0533
CODE_15A128:        CMP   DATA_15A0EA,x             
                    BEQ   CODE_15A132           
                    DEX                         
                    BPL   CODE_15A128           
CODE_15A131:        RTL                         

CODE_15A132:        LDA.w $0534                 
                    CMP   DATA_15A0F0,x             
                    BNE   CODE_15A131           
                    STZ.b $E9                   
CODE_15A13D:        LDX.b $E9                   
                    JSR.w CODE_15A177           
                    STZ.b $E7                   
                    LDA.b $E7                   
CODE_15A146:        TAY                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b [$01],y               
                    CMP   DATA_15A0F6,x             
                    BNE   CODE_15A166           
                    LDA.b $E7                   
                    AND.b #$01                  
                    BNE   CODE_15A160           
                    LDA.l DATA_15A105,x             
                    BRA   CODE_15A164           

CODE_15A160:        LDA.l DATA_15A114,x             
CODE_15A164:        STA.b [$01],y               
CODE_15A166:        INC.b $E7                   
                    LDA.b $E7                   
                    CMP.b #$F0                  
                    BNE   CODE_15A146           
                    LDA.b $E9                   
                    BNE   CODE_15A176           
                    INC.b $E9                   
                    BRA   CODE_15A13D           

CODE_15A176:        RTL                         

CODE_15A177:        STY.w $02F5                 
                    LDY.w $0534                 
                    LDA   DATA_11AB11,y               
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.w DATA_11AB06,x               
                    STA.b $03                   
                    LDY.w $02F5                 
                    RTS                         

DATA_15A194:        db $5C,$2F,$7E,$36,$86,$4C,$63,$4E
                    db $44,$51

DATA_15A19E:        db $03,$05,$0D,$04,$07

CODE_15A1A3:        LDA.w $0533                 
                    CMP.b #$0E                  
                    BNE   CODE_15A1EF           
                    LDX.b #$04                  
CODE_15A1AC:        STX.w $0714                 
                    TXA                         
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_15A194,x             
                    STA.b $01                   
                    SEP   #$20                  
                    LDA.b #$7E                  
                    STA.b $03                   
                    LDX.w $0714                 
                    LDA.b $01                   
                    AND.b #$0F                  
                    TAY                         
                    LDA.b $01                   
                    AND.b #$F0                  
                    STA.b $01                   
                    LDA.b #$B2                  
                    STA.b [$01],y               
                    JSR.w CODE_15A1F0           
                    LDA.l DATA_15A19E,x             
                    STA.w $0713                 
CODE_15A1DC:        LDA.b #$FD                  
                    STA.b [$01],y               
                    JSR.w CODE_15A1F0           
                    DEC.w $0713                 
                    BPL   CODE_15A1DC           
                    LDA.b #$FE                  
                    STA.b [$01],y               
                    DEX                         
                    BPL   CODE_15A1AC           
CODE_15A1EF:        RTL                         

CODE_15A1F0:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_15A1F8           
                    LDY.b #$F0                  
CODE_15A1F8:        RTS                         

CODE_15A1F9:        LDA.w $0533                 
                    CMP.b #$06                  
                    BNE   CODE_15A22F           
                    LDA.w $0534                 
                    CMP.b #$01                  
                    BNE   CODE_15A22F           
                    LDA.b #$7E                  
                    STA.b $03                   
                    LDA.b #$31                  
                    STA.b $02                   
                    LDA.b #$80                  
                    STA.b $01                   
                    REP   #$10                  
                    LDY.w #$02DF                
CODE_15A218:        LDA.b [$01],y               
                    CMP.b #$04                  
                    BNE   CODE_15A222           
                    LDA.b #$1C                  
                    BRA   CODE_15A228           

CODE_15A222:        CMP.b #$07                  
                    BNE   CODE_15A22A           
                    LDA.b #$1D                  
CODE_15A228:        STA.b [$01],y               
CODE_15A22A:        DEY                         
                    BPL   CODE_15A218           
                    SEP   #$10                  
CODE_15A22F:        RTL                         

DATA_15A230:        db $BA,$BB,$BC,$BD,$BE,$BF,$70,$F5
                    db $3F,$76,$62,$63,$A4,$A5,$CA,$CE
                    db $C7,$C9,$D2,$D3

CODE_15A244:        LDX.b #$97
CODE_15A246:        LDA.w $0533                 
                    CMP   DATA_15C8D8,x             
                    BNE   CODE_15A298           
                    LDA.w $0534                 
                    CMP   DATA_15C970,x             
                    BNE   CODE_15A298           
                    STX.w $0719                 
                    REP   #$30                  
                    TXA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA.l DATA_15CA08,x             
                    STA.b $01                   
                    SEP   #$30                  
                    LDA.b #$7E                  
                    STA.b $03                   
                    LDX.w $0719                 
                    LDA.l DATA_15CB38,x             
                    STA.w $071A                 
                    LDX.b #$13                  
CODE_15A27B:        CMP   DATA_15A230,x             
                    BEQ   CODE_15A293           
                    DEX                         
                    BPL   CODE_15A27B           
                    LDX.w $0534                 
                    LDA.l DATA_11AB11,x             
                    CLC                         
                    ADC.b $02                   
                    STA.b $02                   
                    LDA.w $071A                 
CODE_15A293:        STA.b [$01]                 
                    LDX.w $0719                 
CODE_15A298:        DEX                         
                    CPX.b #$FF                  
                    BEQ   CODE_15A2A0           
                    BRL   CODE_15A246           

CODE_15A2A0:        RTL                         

DATA_15A2A1:        db $28,$29,$26,$2A,$2B,$27
     
CODE_15A2A7:        REP   #$20                 
                    LDA.b $01           
                    CLC                         
                    ADC.w #$0050                  
                    STA.b $01                 
                    SEP   #$20
                    LDY.b $E7
                    LDX.b #$00                  
CODE_15A2B7:        LDA.l DATA_15A2A1,x             
                    STA.b [$01],y               
                    JSR.w CODE_15A06D           
                    PHY                         
                    TYA                         
                    CLC                         
                    ADC.b #$20                  
                    TAY                         
                    LDA.l DATA_15A2A1,x             
                    STA.b [$01],y               
                    JSR.w CODE_15A06D           
                    PLY                         
                    INY                         
                    INX                         
                    CPX.b #$06                  
                    BEQ   CODE_15A2E5           
                    CPX.b #$03                  
                    BNE   CODE_15A2B7           
                    LDA.b $01                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $01                   
                    LDY.b $E7                   
                    BRA   CODE_15A2B7           

CODE_15A2E5:        RTL                         

CODE_15A2E6:        LDA.b #$02                  
                    STA.w $0712                 
                    STZ.w $0713                 
                    STZ.w $0714                 
                    LDX.b #$00                  
                    JSR.w CODE_15A3D4           
                    LDY.w $04EE                 
                    TYA                         
                    JSR.w CODE_15A395           
                    STY.w $142A                 
                    STA.w $142C                 
                    LDA.b #$15                  
                    STA.w $142D                 
                    CPY.b #$BF                  
                    BNE   CODE_15A313           
                    LDA.b #$BD                  
                    STA.w $142A                 
                    LDA.b #$09                  
CODE_15A313:        STA.w $142B                 
CODE_15A316:        INC.w $062B                 
                    LDA.w $062B                 
                    JSR.w CODE_15A395           
                    CPY.b #$BF                  
                    BNE   CODE_15A326           
                    TAX                         
                    TYA                         
                    TXY                         
CODE_15A326:        STY.w $1408                 
                    STA.w $140A                 
                    LDX.b #$15                  
                    CMP.b #$BF                  
                    BNE   CODE_15A339           
                    LDA.b #$BD                  
                    STA.w $140A                 
                    LDX.b #$09                  
CODE_15A339:        STX.w $140B                 
                    LDA.b #$15                  
                    CPY.b #$BF                  
                    BNE   CODE_15A349           
                    LDA.b #$BD                  
                    STA.w $1408                 
                    LDA.b #$09                  
CODE_15A349:        STA.w $1409                 
                    LDA.b #$01                  
                    STA.b $11                   
                    LDA.b #$01                  
                    STA.w $1DE3                 
                    JSL.l CODE_118014           
                    LDA.b #$04                  
                    STA.w $0782                 
CODE_15A35E:        LDA.w DATA_15CAFC                 
                    STA.b $11                   
                    LDA.b #$0A                  
                    STA.w $0783                 
CODE_15A368:        JSL.l CODE_118014           
                    JSR.w CODE_15A3B9           
                    INC.w $0713                 
                    DEC.w $0783                 
                    BNE   CODE_15A368           
                    DEC.w $0782                 
                    BPL   CODE_15A35E           
                    DEC.w $0712                 
                    BPL   CODE_15A316           
                    LDA.b #$FF                  
                    STA.w $0796                 
                    LDX.b #$0A                  
                    JSR.w CODE_15A3D4           
                    LDA.w DATA_11CAFB                 
                    STA.b $11                   
                    JSL.l CODE_118014           
                    RTL                         

CODE_15A395:        LDY.b #$C0                  
CODE_15A397:        CMP.b #$0A                  
                    BCC   CODE_15A3A0           
                    SBC.b #$0A                  
                    INY                         
                    BRA   CODE_15A397           

CODE_15A3A0:        ORA.b #$C0                  
                    CPY.b #$C0                  
                    BNE   CODE_15A3A8           
                    LDY.b #$BF                  
CODE_15A3A8:        RTS                         

DATA_15A3A9:        dw $125F

DATA_15A3AB:        dw $12FF

DATA_15A3AD:        dw $1B7F,$125F,$12FF,$35AD
                    dw $4631,$56B5

CODE_15A3B9:        LDA.w $0713                 
                    CMP.b #$06                  
                    BNE   CODE_15A3C6           
                    STZ.w $0713                 
                    INC.w $0714                 
CODE_15A3C6:        LDA.w $0714                 
                    CMP.b #$03                  
                    BNE   CODE_15A3D2           
                    LDA.b #$00                  
                    STA.w $0714                 
CODE_15A3D2:        ASL   A                     
                    TAX                         
CODE_15A3D4:        REP   #$20                  
                    LDA.l DATA_15A3A9,x             
                    STA.w $0B1A                 
                    LDA.l DATA_15A3AB,x             
                    STA.w $0B1C                 
                    LDA.l DATA_15A3AD,x             
                    STA.w $0B1E                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $02A9                 
                    RTS                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty data.
                    db $FF,$FF,$FF,$FF,$FF                  ; /

DATA_15A400:        db $00,$00,$00,$01,$01,$01,$00,$00
                    db $00,$00,$01,$01,$01,$03,$02,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$01
                    db $01,$00,$04,$00,$00,$00,$00,$00
                    db $01,$01,$01,$01,$04,$01,$00,$00
                    db $00,$00,$00,$00,$01,$01,$03,$01
                    db $00,$01,$00,$00,$01,$01,$01,$01
                    db $01,$00,$00,$00,$00,$00,$01,$01
                    db $01,$00,$00,$00,$00,$00,$00,$00
                    db $01,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$01,$01,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$00,$00,$01
                    db $01,$00,$00,$00,$00,$00,$01,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$01,$01,$00,$00,$00,$00,$00
                    db $00,$00,$01,$00,$01,$01,$05,$01
                    db $00,$00,$00,$00,$01,$00,$01,$01
                    db $01,$00,$00,$00,$00,$00,$00,$01
                    db $01,$07,$03,$06,$02,$00,$00,$00
                    db $01,$01,$01,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $01,$01,$00,$00,$00,$00,$00,$01
                    db $01,$01,$01,$00,$01,$01,$01,$01

PNTR_15A4C8:        dw DATA_15A4CE
                    dw DATA_15A62E
                    dw DATA_15A7AE

DATA_15A4CE:        db $00,$11,$01,$11,$10,$11,$11,$11
                    db $02,$11,$03,$11,$12,$11,$13,$11
                    db $04,$11,$05,$11,$14,$11,$15,$11
                    db $06,$11,$07,$11,$16,$11,$17,$11
                    db $08,$11,$09,$11,$18,$11,$19,$11
                    db $0A,$11,$0B,$11,$1A,$11,$1B,$11
                    db $0C,$11,$0D,$11,$1C,$11,$1D,$11
                    db $0E,$11,$0F,$11,$1E,$11,$1F,$11
                    db $00,$11,$07,$11,$10,$11,$17,$11
                    db $08,$11,$0F,$11,$18,$11,$1F,$11
                    db $00,$11,$01,$11,$38,$11,$39,$11
                    db $02,$11,$03,$11,$3A,$11,$3B,$11
                    db $04,$11,$05,$11,$3C,$11,$3D,$11
                    db $06,$11,$07,$11,$3E,$11,$3F,$11
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $20,$11,$21,$11,$30,$11,$31,$11
                    db $22,$11,$23,$11,$32,$11,$33,$11
                    db $24,$11,$25,$11,$34,$11,$35,$11
                    db $26,$11,$27,$11,$36,$11,$37,$11
                    db $28,$11,$29,$11,$38,$11,$39,$11
                    db $2A,$11,$2B,$11,$3A,$11,$3B,$11
                    db $2C,$11,$2D,$11,$3C,$11,$3D,$11
                    db $2E,$11,$2F,$11,$3E,$11,$3F,$11
                    db $20,$11,$27,$11,$30,$11,$37,$11
                    db $28,$11,$2F,$11,$38,$11,$3F,$11
                    db $39,$10,$01,$11,$10,$11,$11,$11
                    db $06,$11,$39,$50,$16,$11,$17,$11
                    db $AC,$10,$09,$11,$18,$11,$19,$11
                    db $0E,$11,$AD,$10,$1E,$11,$1F,$11
                    db $39,$10,$39,$50,$10,$11,$17,$11
                    db $AC,$10,$AD,$10,$18,$11,$1F,$11
                    db $28,$11,$29,$11,$3A,$10,$4F,$10
                    db $2A,$11,$2B,$11,$4E,$10,$4F,$10
                    db $2C,$11,$2D,$11,$97,$10,$4F,$10
                    db $2E,$11,$2F,$11,$4E,$10,$3A,$50
                    db $28,$11,$2F,$11,$3A,$10,$3A,$50
                    db $00,$11,$07,$11,$38,$11,$3F,$11
                    db $60,$12,$61,$12,$70,$12,$71,$12
                    db $62,$12,$63,$12,$72,$12,$73,$12
                    db $68,$12,$69,$12,$78,$12,$79,$12
                    db $6A,$12,$6B,$12,$7A,$12,$7B,$12
                    db $6C,$12,$6D,$12,$7C,$12,$7D,$12
                    db $6E,$12,$6F,$12,$7E,$12,$7F,$12

DATA_15A62E:        db $0D,$72,$0B,$32,$0A,$32,$00,$32
                    db $0B,$32,$0D,$32,$00,$32,$0A,$72
                    db $0A,$32,$0C,$32,$0A,$32,$00,$32
                    db $0C,$72,$0A,$72,$00,$72,$0A,$72
                    db $0A,$32,$00,$32,$0D,$F2,$0B,$B2
                    db $00,$32,$0A,$72,$0C,$F2,$0A,$72
                    db $0A,$32,$00,$72,$0A,$32,$0C,$B2
                    db $00,$72,$0A,$72,$0B,$F2,$0D,$B2
                    db $BF,$00,$01,$32,$04,$32,$05,$32
                    db $02,$32,$03,$32,$06,$32,$0C,$B2
                    db $0C,$72,$0C,$32,$0B,$F2,$0B,$F2
                    db $0B,$32,$0D,$32,$0B,$F2,$0D,$B2
                    db $0D,$72,$0B,$72,$0D,$F2,$0B,$B2
                    db $0C,$72,$0C,$32,$0B,$B2,$0B,$B2
                    db $03,$72,$02,$72,$0C,$F2,$06,$72
                    db $01,$72,$BF,$00,$05,$72,$04,$72
                    db $00,$B2,$00,$B2,$0B,$B2,$0B,$B2
                    db $0A,$32,$0A,$72,$0A,$32,$0A,$72
                    db $08,$72,$07,$72,$0C,$F2,$09,$72
                    db $07,$32,$08,$32,$09,$32,$0C,$B2
                    db $0A,$32,$00,$72,$0A,$32,$00,$32
                    db $00,$B2,$0C,$32,$00,$B2,$00,$32
                    db $0C,$72,$00,$72,$00,$F2,$00,$F2
                    db $00,$72,$0A,$72,$00,$72,$0A,$72
                    db $00,$B2,$0C,$32,$0B,$B2,$0B,$B2
                    db $0B,$32,$0B,$32,$0B,$B2,$0B,$B2
                    db $0C,$72,$00,$F2,$0B,$B2,$0B,$B2
                    db $0B,$32,$0B,$32,$00,$32,$00,$32
                    db $00,$32,$0C,$32,$0C,$F2,$00,$32
                    db $0B,$32,$0B,$32,$00,$32,$0C,$B2
                    db $0B,$32,$0B,$72,$0C,$F2,$00,$72
                    db $0C,$72,$00,$F2,$00,$72,$0C,$B2
                    db $02,$32,$03,$32,$06,$32,$00,$32
                    db $03,$72,$02,$72,$00,$72,$06,$72
                    db $0A,$32,$0C,$32,$0D,$F2,$0B,$B2
                    db $0C,$72,$0A,$72,$0B,$B2,$0D,$B2
                    db $09,$B2,$00,$32,$07,$B2,$00,$32
                    db $04,$B2,$05,$B2,$BF,$00,$01,$B2
                    db $06,$B2,$0C,$32,$02,$B2,$03,$B2
                    db $0C,$72,$06,$F2,$03,$F2,$02,$F2
                    db $05,$F2,$04,$F2,$01,$F2,$BF,$00
                    db $00,$72,$09,$F2,$00,$72,$07,$F2
                    db $0C,$72,$00,$F2,$0C,$F2,$00,$F2
                    db $00,$B2,$0C,$32,$00,$B2,$0C,$B2
                    db $00,$B2,$00,$32,$00,$32,$00,$32
                    db $0B,$32,$0D,$32,$0C,$F2,$0A,$72
                    db $0D,$72,$0B,$72,$0A,$32,$0C,$B2
                    db $50,$30,$52,$30,$51,$30,$53,$30

DATA_15A7AE:        db $2B,$52,$2A,$52,$3B,$52,$3A,$52
                    db $29,$52,$28,$52,$39,$52,$38,$52
                    db $27,$52,$26,$52,$37,$52,$36,$52
                    db $25,$52,$24,$52,$35,$52,$34,$52
                    db $23,$52,$22,$52,$33,$52,$32,$52
                    db $21,$52,$20,$52,$31,$52,$30,$52
                    db $20,$12,$21,$12,$30,$12,$31,$12
                    db $22,$12,$23,$12,$32,$12,$33,$12
                    db $24,$12,$25,$12,$34,$12,$35,$12
                    db $26,$12,$27,$12,$36,$12,$37,$12
                    db $28,$12,$29,$12,$38,$12,$39,$12
                    db $2A,$12,$2B,$12,$3A,$12,$3B,$12
                    db $2C,$12,$2D,$12,$3C,$12,$3D,$12
                    db $2E,$12,$2F,$12,$3E,$12,$3F,$12
                    db $2F,$52,$2E,$52,$3F,$52,$3E,$52
                    db $2D,$52,$2C,$52,$3D,$52,$3C,$52
                    db $2B,$D2,$2A,$D2,$3B,$D2,$3A,$D2
                    db $29,$D2,$28,$D2,$39,$D2,$38,$D2
                    db $27,$D2,$26,$D2,$37,$D2,$36,$D2
                    db $25,$D2,$24,$D2,$35,$D2,$34,$D2
                    db $23,$D2,$22,$D2,$33,$D2,$32,$D2
                    db $21,$D2,$20,$D2,$31,$D2,$30,$D2
                    db $20,$92,$21,$92,$30,$92,$31,$92
                    db $22,$92,$23,$92,$32,$92,$33,$92
                    db $24,$92,$25,$92,$34,$92,$35,$92
                    db $26,$92,$27,$92,$36,$92,$37,$92
                    db $28,$92,$29,$92,$38,$92,$39,$92
                    db $2A,$92,$2B,$92,$3A,$92,$3B,$92
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $FF,$50,$FE,$50,$3B,$52,$3A,$52
                    db $FD,$50,$FC,$50,$39,$52,$38,$52
                    db $FB,$50,$FA,$50,$37,$52,$36,$52
                    db $F9,$50,$F8,$50,$35,$52,$34,$52
                    db $F7,$50,$F6,$50,$33,$52,$32,$52
                    db $F5,$50,$F4,$50,$31,$52,$30,$52
                    db $F4,$10,$F5,$10,$30,$12,$31,$12
                    db $F6,$10,$F7,$10,$32,$12,$33,$12
                    db $F8,$10,$F9,$10,$34,$12,$35,$12
                    db $FA,$10,$FB,$10,$36,$12,$37,$12
                    db $FC,$10,$FD,$10,$38,$12,$39,$12
                    db $FE,$10,$FF,$10,$3A,$12,$3B,$12

PNTR_15A90E:        dw DATA_15A94A
                    dw DATA_15A9A4
                    dw DATA_15A9FE
                    dw DATA_15A9FE
                    dw DATA_15A9FE
                    dw DATA_15A9FE
                    dw DATA_15A9FE
                    dw DATA_15A9FE
                    dw DATA_15AA58
                    dw DATA_15AAB2
                    dw DATA_15AAB2
                    dw DATA_15AB0C
                    dw DATA_15AB66
                    dw DATA_15ABC0
                    dw DATA_15AC1A
                    dw DATA_15AC74
                    dw DATA_15ACCE
                    dw DATA_15AD28
                    dw DATA_15AD82
                    dw DATA_15ADDC
                    dw DATA_15AE36
                    dw DATA_15AE90
                    dw DATA_15AEEA
                    dw DATA_15AF44
                    dw DATA_15AF9E
                    dw DATA_15AF9E
                    dw DATA_15AFF8
                    dw DATA_15B052
                    dw DATA_15B0AC
                    dw PNTR_15B106

DATA_15A94A:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$00,$10,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$01,$06,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$02,$05,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$01,$06,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$02,$05,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $03,$13

DATA_15A9A4:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$00,$10,$04,$10,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$01,$06,$12,$06,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$02,$05,$11,$05,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $01,$06,$12,$06,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$02
                    db $05,$11,$05,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$03,$13
                    db $07,$13

DATA_15A9FE:        db $40,$40,$40,$40,$40,$40,$40,$00
                    db $10,$04,$10,$04,$10,$04,$10,$40
                    db $40,$40,$40,$40,$40,$40,$01,$06
                    db $12,$06,$12,$06,$12,$06,$40,$40
                    db $40,$40,$40,$40,$40,$02,$05,$11
                    db $05,$11,$05,$11,$05,$40,$40,$40
                    db $40,$40,$40,$40,$01,$06,$12,$06
                    db $12,$06,$12,$06,$40,$40,$40,$40
                    db $40,$40,$40,$02,$05,$11,$05,$11
                    db $05,$11,$05,$40,$40,$40,$40,$40
                    db $40,$40,$03,$13,$07,$13,$07,$13
                    db $07,$13

DATA_15AA58:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40

DATA_15AAB2:        db $04,$10,$04,$10,$04,$10,$04,$10
                    db $04,$10,$04,$10,$04,$10,$04,$05
                    db $11,$05,$11,$05,$11,$05,$11,$05
                    db $11,$05,$11,$05,$11,$05,$06,$12
                    db $06,$12,$06,$12,$06,$12,$06,$12
                    db $06,$12,$06,$12,$06,$05,$11,$05
                    db $11,$05,$11,$05,$11,$05,$11,$05
                    db $11,$05,$11,$05,$06,$12,$06,$12
                    db $06,$12,$06,$12,$06,$12,$06,$12
                    db $06,$12,$06,$07,$13,$07,$13,$07
                    db $13,$07,$13,$07,$13,$07,$13,$07
                    db $13,$07

DATA_15AB0C:        db $40,$40,$40,$40,$40,$40
                    db $00,$10,$04,$10,$04,$10,$04,$10
                    db $04,$40,$40,$40,$40,$40,$40,$01
                    db $11,$05,$11,$05,$11,$05,$11,$05
                    db $40,$40,$40,$40,$40,$40,$02,$12
                    db $06,$12,$06,$12,$06,$12,$06,$40
                    db $40,$40,$40,$40,$40,$01,$11,$05
                    db $11,$05,$11,$05,$11,$05,$40,$40
                    db $40,$40,$40,$40,$02,$12,$06,$12
                    db $06,$12,$06,$12,$06,$40,$40,$40
                    db $40,$40,$40,$03,$13,$07,$13,$07
                    db $13,$07,$13,$07

DATA_15AB66:        db $40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$00,$10
                    db $04,$10,$04,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$01,$11,$05
                    db $11,$05,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$02,$12,$06,$12
                    db $06,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$01,$11,$05,$11,$05
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$02,$12,$06,$12,$06,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$03,$13,$07,$13,$07

DATA_15ABC0:        db $40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$00,$10,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$01,$06,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$02,$05,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $01,$06,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$02
                    db $05,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$03,$13

DATA_15AC1A:        db $04,$14,$40,$40,$40,$40,$00,$10
                    db $04,$10,$04,$10,$04,$10,$04,$05
                    db $15,$40,$40,$40,$40,$01,$11,$05
                    db $11,$05,$11,$05,$11,$05,$06,$16
                    db $40,$40,$40,$40,$02,$12,$06,$12
                    db $06,$12,$06,$12,$06,$05,$15,$40
                    db $40,$40,$40,$01,$11,$05,$11,$05
                    db $11,$05,$11,$05,$06,$16,$40,$40
                    db $40,$40,$02,$12,$06,$12,$06,$12
                    db $06,$12,$06,$07,$17,$40,$40,$40
                    db $40,$03,$13,$07,$13,$07,$13,$07
                    db $13,$07

DATA_15AC74:        db $10,$04,$14,$40,$40,$40

                    db $40,$40,$40,$40,$00,$10,$04,$10
                    db $04,$06,$12,$15,$40,$40,$40,$40
                    db $40,$40,$40,$01,$11,$05,$11,$05
                    db $05,$11,$16,$40,$40,$40,$40,$40
                    db $40,$40,$02,$12,$06,$12,$06,$06
                    db $12,$15,$40,$40,$40,$40,$40,$40
                    db $40,$01,$11,$05,$11,$05,$05,$11
                    db $16,$40,$40,$40,$40,$40,$40,$40
                    db $02,$12,$06,$12,$06,$13,$07,$17
                    db $40,$40,$40,$40,$40,$40,$40,$03
                    db $13,$07,$13,$07

DATA_15ACCE:        db $10,$04,$14,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$00,$10,$06,$12,$15,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $01,$06,$05,$11,$16,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$02
                    db $05,$06,$12,$15,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$01,$06
                    db $05,$11,$16,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$02,$05,$13
                    db $07,$17,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$03,$13

DATA_15AD28:        db $04,$10
                    db $04,$10,$04,$14,$40,$40,$40,$40
                    db $00,$10,$04,$10,$04,$05,$11,$05
                    db $11,$05,$15,$40,$40,$40,$40,$01
                    db $11,$05,$11,$05,$06,$12,$06,$12
                    db $06,$16,$40,$40,$40,$40,$02,$12
                    db $06,$12,$06,$05,$11,$05,$11,$05
                    db $15,$40,$40,$40,$40,$01,$11,$05
                    db $11,$05,$06,$12,$06,$12,$06,$16
                    db $40,$40,$40,$40,$02,$12,$06,$12
                    db $06,$07,$13,$07,$13,$07,$17,$40
                    db $40,$40,$40,$03,$13,$07,$13,$07
              
DATA_15AD82:        db $04,$10,$04,$10,$04,$10,$04,$10
                    db $04,$14,$40,$40,$40,$00,$10,$05
                    db $11,$05,$11,$05,$11,$05,$11,$05
                    db $15,$40,$40,$40,$01,$06,$06,$12
                    db $06,$12,$06,$12,$06,$12,$06,$16
                    db $40,$40,$40,$02,$05,$05,$11,$05
                    db $11,$05,$11,$05,$11,$05,$15,$40
                    db $40,$40,$01,$06,$06,$12,$06,$12
                    db $06,$12,$06,$12,$06,$16,$40,$40
                    db $40,$02,$05,$07,$13,$07,$13,$07
                    db $13,$07,$13,$07,$17,$40,$40,$40
                    db $03,$13

DATA_15ADDC:        db $10,$04,$10,$04,$10,$04
                    db $10,$04,$14,$40,$40,$40,$40,$00
                    db $10,$06,$12,$06,$12,$06,$12,$06
                    db $12,$15,$40,$40,$40,$40,$01,$06
                    db $05,$11,$05,$11,$05,$11,$05,$11
                    db $16,$40,$40,$40,$40,$02,$05,$06
                    db $12,$06,$12,$06,$12,$06,$12,$15
                    db $40,$40,$40,$40,$01,$06,$05,$11
                    db $05,$11,$05,$11,$05,$11,$16,$40
                    db $40,$40,$40,$02,$05,$13,$07,$13
                    db $07,$13,$07,$13,$07,$17,$40,$40
                    db $40,$40,$03,$13

DATA_15AE36:        db $10,$04,$10,$04
                    db $10,$04,$14,$40,$40,$40,$40,$40
                    db $40,$00,$10,$06,$12,$06,$12,$06
                    db $12,$15,$40,$40,$40,$40,$40,$40
                    db $01,$06,$05,$11,$05,$11,$05,$11
                    db $16,$40,$40,$40,$40,$40,$40,$02
                    db $05,$06,$12,$06,$12,$06,$12,$15
                    db $40,$40,$40,$40,$40,$40,$01,$06
                    db $05,$11,$05,$11,$05,$11,$16,$40
                    db $40,$40,$40,$40,$40,$02,$05,$13
                    db $07,$13,$07,$13,$07,$17,$40,$40
                    db $40,$40,$40,$40,$03,$13

DATA_15AE90:        db $04,$14
                    db $40,$40,$40,$40,$00,$10,$14,$40
                    db $40,$40,$40,$00,$10,$05,$15,$40
                    db $40,$40,$40,$01,$06,$15,$40,$40
                    db $40,$40,$01,$06,$06,$16,$40,$40
                    db $40,$40,$01,$05,$16,$40,$40,$40
                    db $40,$02,$05,$05,$15,$40,$40,$40
                    db $40,$02,$06,$15,$40,$40,$40,$40
                    db $01,$06,$06,$16,$40,$40,$40,$40
                    db $02,$05,$16,$40,$40,$40,$40,$02
                    db $05,$07,$17,$40,$40,$40,$40,$03
                    db $13,$17,$40,$40,$40,$40,$03,$13

DATA_15AEEA:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$00,$10,$04,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$01,$11,$05,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$02,$12,$06,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$01,$11,$05,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $02,$12,$06,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$03
                    db $13,$07

DATA_15AF44:        db $10,$04,$14,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$06,$12,$15,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $05,$11,$16,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$06
                    db $12,$15,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$05,$11
                    db $16,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$13,$07,$17
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40

DATA_15AF9E:        db $04,$10,$04,$10
                    db $04,$14,$40,$40,$40,$40,$40,$00
                    db $10,$04,$10,$05,$11,$05,$11,$05
                    db $15,$40,$40,$40,$40,$40,$01,$06
                    db $12,$06,$06,$12,$06,$12,$06,$16
                    db $40,$40,$40,$40,$40,$02,$05,$11
                    db $05,$05,$11,$05,$11,$05,$15,$40
                    db $40,$40,$40,$40,$01,$06,$12,$06
                    db $06,$12,$06,$12,$06,$16,$40,$40
                    db $40,$40,$40,$02,$05,$11,$05,$07
                    db $13,$07,$13,$07,$17,$40,$40,$40
                    db $40,$40,$03,$13,$07,$13

DATA_15AFF8:        db $04,$14
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$00,$10,$04,$10,$05,$15,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $01,$06,$12,$06,$06,$16,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$02
                    db $05,$11,$05,$05,$15,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$01,$06
                    db $12,$06,$06,$16,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$02,$05,$11
                    db $05,$07,$17,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$03,$13,$07,$13

DATA_15B052:        db $04,$10,$04,$10,$04,$14,$40,$40
                    db $40,$40,$40,$40,$40,$00,$10,$05
                    db $11,$05,$11,$05,$15,$40,$40,$40
                    db $40,$40,$40,$40,$01,$06,$06,$12
                    db $06,$12,$06,$16,$40,$40,$40,$40
                    db $40,$40,$40,$02,$05,$05,$11,$05
                    db $11,$05,$15,$40,$40,$40,$40,$40
                    db $40,$40,$01,$06,$06,$12,$06,$12
                    db $06,$16,$40,$40,$40,$40,$40,$40
                    db $40,$02,$05,$07,$13,$07,$13,$07
                    db $17,$40,$40,$40,$40,$40,$40,$40
                    db $03,$13

DATA_15B0AC:        db $04,$14,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$00
                    db $10,$05,$15,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$01,$06
                    db $06,$16,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$02,$05,$05
                    db $15,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$01,$06,$06,$16
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$02,$05,$07,$17,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$03,$13

PNTR_15B106:        dw DATA_15B148
                    dw DATA_15B168
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B188
                    dw DATA_15B1A8
                    dw DATA_15B1C8
                    dw DATA_15B1E8
                    dw DATA_15B208
                    dw DATA_15B228
                    dw DATA_15B248
                    dw DATA_15B248
                    dw DATA_15B268
                    dw DATA_15B288
                    dw DATA_15B168
                    dw DATA_15B2A8
                    dw DATA_15B2C8
                    dw DATA_15B2E8
                    dw DATA_15B308
                    dw DATA_15B328
                    dw DATA_15B328
                    dw DATA_15B328
                    dw DATA_15B328
                    dw DATA_15B348
                    dw DATA_15B348
                    dw DATA_15B368
                    dw DATA_15B388

DATA_15B148:        db $06,$05,$06,$05,$06,$05,$06,$05
                    db $06,$05,$06,$05,$06,$05,$06,$05
                    db $12,$11,$12,$11,$12,$11,$12,$11
                    db $12,$11,$12,$11,$12,$11,$12,$11

DATA_15B168:        db $07,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$04
                    db $13,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$10

DATA_15B188:        db $06,$07,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$05,$04,$05
                    db $12,$13,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$05,$10,$11

DATA_15B1A8:        db $06,$07,$06,$06,$06,$06,$04,$05
                    db $06,$07,$06,$06,$06,$06,$04,$05
                    db $12,$13,$06,$06,$06,$06,$10,$11
                    db $12,$13,$06,$06,$06,$06,$10,$11

DATA_15B1C8:        db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$05,$05,$05

DATA_15B1E8:        db $07,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$04
                    db $13,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$10

DATA_15B208:        db $07,$9D,$9D,$9D,$9D,$9D,$04,$05
                    db $06,$07,$9D,$9D,$9D,$9D,$9D,$04
                    db $13,$9D,$9D,$9D,$9D,$9D,$10,$11
                    db $12,$13,$9D,$9D,$9D,$9D,$9D,$10

DATA_15B228:        db $06,$05,$06,$07,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$04,$05,$06,$05
                    db $12,$11,$12,$13,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$10,$11,$12,$11

DATA_15B248:        db $06,$05,$06,$05,$06,$07,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$04,$05
                    db $12,$11,$12,$11,$12,$13,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$10,$11

DATA_15B268:        db $06,$07,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$04,$05,$06,$05,$06,$05
                    db $12,$13,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$10,$11,$12,$11,$12,$11

DATA_15B288:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40

DATA_15B2A8:        db $06,$07,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$04,$05
                    db $12,$13,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$10,$11

DATA_15B2C8:        db $06,$05,$06,$07,$40,$40,$40,$40
                    db $40,$40,$40,$40,$04,$05,$06,$05
                    db $12,$11,$12,$13,$40,$40,$40,$40
                    db $40,$40,$40,$40,$10,$11,$12,$11

DATA_15B2E8:        db $06,$05,$06,$05,$06,$07,$40,$40
                    db $40,$40,$04,$05,$06,$05,$06,$05
                    db $12,$11,$12,$11,$12,$13,$40,$40
                    db $40,$40,$10,$11,$12,$11,$12,$11

DATA_15B308:        db $07,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$04,$05,$06,$05,$06,$05
                    db $13,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$10,$11,$12,$11,$12,$11

DATA_15B328:        db $06,$07,$40,$40,$40,$40,$04,$05
                    db $06,$07,$40,$40,$40,$40,$04,$05
                    db $12,$13,$40,$40,$40,$40,$10,$11
                    db $12,$13,$40,$40,$40,$40,$10,$11

DATA_15B348:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$04,$05
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$10,$11

DATA_15B368:        db $06,$05,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$06,$05
                    db $12,$11,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$12,$11

DATA_15B388:        db $06,$05,$06,$07,$40,$40,$40,$40
                    db $40,$40,$40,$40,$06,$05,$06,$05
                    db $12,$11,$12,$13,$40,$40,$40,$40
                    db $40,$40,$40,$40,$12,$11,$12,$11

PNTR_15B3A8:        dw DATA_15B3D0
                    dw DATA_15B3D1
                    dw DATA_15B3D8
                    dw DATA_15B3D8
                    dw DATA_15B3D9
                    dw DATA_15B3E0
                    dw DATA_15B3E1
                    dw DATA_15B3E4
                    dw DATA_15B3EF
                    dw DATA_15B3F0
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7
                    dw DATA_15B3F7

DATA_15B3D0:        db $FF

DATA_15B3D1:        db $00,$00,$00,$02,$02,$00,$FF

DATA_15B3D8:        db $FF

DATA_15B3D9:        db $01,$0D,$01,$0C,$01,$02,$FF

DATA_15B3E0:        db $FF

DATA_15B3E1:        db $01,$13,$FF

DATA_15B3E4:        db $00,$02,$00,$03
                    db $00,$04,$00,$05,$00,$06,$FF

DATA_15B3EF:        db $FF

DATA_15B3F0:        db $00,$16,$01,$01,$01,$00,$FF

DATA_15B3F7:        db $FF

PNTR_15B3F8:        dw DATA_15B420
                    dw DATA_15B44E
                    dw DATA_15B4DC
                    dw DATA_15B4DE
                    dw DATA_15B568
                    dw DATA_15B692
                    dw DATA_15B76C
                    dw DATA_15B804
                    dw DATA_15B88E
                    dw DATA_15B8B8
                    dw DATA_15B94C
                    dw DATA_15B9DA
                    dw DATA_15BA1C
                    dw DATA_15BBB8
                    dw DATA_15BCC2
                    dw DATA_15BD44
                    dw DATA_15BE14
                    dw DATA_15BEA8
                    dw DATA_15BFA0
                    dw DATA_15BFD2

DATA_15B420:        db $15,$FE,$18,$41,$5E,$41,$14,$FE
                    db $2C,$41,$5D,$41,$6F,$41,$75,$43
                    db $04,$FE,$3D,$41,$65,$43,$10,$FE
                    db $4D,$41,$55,$43,$05,$FE,$24,$5B
                    db $06,$FE,$25,$5B,$02,$FE,$6B,$5B
                    db $16,$FE,$29,$4C,$FF,$FF

DATA_15B44E:        db $02,$FE
                    db $3B,$27,$3C,$27,$A4,$36,$12,$FE
                    db $4B,$27,$3E,$27,$5C,$27,$06,$FE
                    db $5B,$27,$F9,$2B,$4C,$27,$05,$FE
                    db $EA,$2C,$0A,$2D,$2A,$2D,$DA,$2D
                    db $13,$FE,$30,$2B,$50,$2B,$70,$2B
                    db $90,$2B,$B0,$2B,$1F,$2D,$07,$FE
                    db $40,$2B,$60,$2B,$80,$2B,$A0,$2B
                    db $C0,$2B,$2F,$2D,$17,$FE,$18,$2C
                    db $3F,$2D,$F9,$2D,$16,$FE,$09,$2C
                    db $11,$2C,$13,$2C,$14,$FE,$07,$2D
                    db $38,$2D,$32,$38,$10,$FE,$18,$2D
                    db $A0,$38,$F2,$37,$12,$38,$A3,$37
                    db $04,$FE,$28,$2D,$E2,$37,$02,$38
                    db $22,$38,$B3,$37,$11,$FE,$FA,$2C
                    db $1A,$2D,$3D,$27,$15,$FE,$3A,$2D
                    db $EA,$2D,$33,$38,$2E,$2B,$16,$2C
                    db $00,$FE,$90,$38,$93,$37,$01,$FE
                    db $A3,$36,$FF,$FF

DATA_15B4DC:        db $FF,$FF

DATA_15B4DE:        db $06,$FE
                    db $A7,$36,$00,$FE,$64,$38,$86,$2B
                    db $C3,$2D,$9A,$2E,$10,$FE,$74,$38
                    db $94,$38,$B4,$38,$04,$FE,$84,$38
                    db $A4,$38,$16,$FE,$12,$2B,$35,$2E
                    db $37,$2E,$39,$2E,$3B,$2E,$3D,$2E
                    db $17,$FE,$13,$2B,$91,$2B,$31,$2E
                    db $14,$FE,$1C,$2B,$9E,$2B,$33,$2E
                    db $15,$FE,$1D,$2B,$34,$2E,$36,$2E
                    db $38,$2E,$3A,$2E,$3C,$2E,$3E,$2E
                    db $01,$FE,$87,$2B,$C4,$2D,$C6,$2D
                    db $C8,$2D,$CA,$2D,$CC,$2D,$CE,$2D
                    db $9B,$2E,$9D,$2E,$A1,$2E,$A3,$2E
                    db $A5,$2E,$A7,$2E,$A9,$2E,$02,$FE
                    db $88,$2B,$C5,$2D,$C7,$2D,$C9,$2D
                    db $CB,$2D,$CD,$2D,$9C,$2E,$9E,$2E
                    db $A2,$2E,$A4,$2E,$A6,$2E,$A8,$2E
                    db $03,$FE,$89,$2B,$C1,$2D,$FF,$FF

DATA_15B568:        db $05,$FE,$0B,$20,$AE,$20,$90,$21
                    db $94,$2F,$6F,$30,$8F,$30,$1B,$34
                    db $3B,$34,$5B,$34,$07,$36,$11,$FE
                    db $1B,$20,$80,$21,$A4,$2F,$5F,$30
                    db $7F,$30,$9F,$30,$2B,$34,$4B,$34
                    db $6B,$34,$17,$36,$16,$FE,$2B,$20
                    db $27,$36,$0D,$37,$01,$21,$0C,$42
                    db $92,$42,$94,$42,$06,$FE,$AF,$20
                    db $F1,$20,$E3,$2B,$4E,$30,$6E,$30
                    db $8E,$30,$1A,$34,$3A,$34,$4A,$34
                    db $FD,$36,$71,$21,$FF,$33,$1F,$34
                    db $3F,$34,$5F,$34,$01,$FE,$8F,$20
                    db $70,$21,$D2,$2B,$12,$42,$14,$42
                    db $97,$43,$A1,$44,$A3,$44,$A5,$44
                    db $AA,$44,$AC,$44,$AE,$44,$EF,$33
                    db $12,$FE,$9F,$20,$81,$21,$3E,$30
                    db $5E,$30,$7E,$30,$9E,$30,$2A,$34
                    db $4A,$34,$5A,$34,$0F,$34,$2F,$34
                    db $4F,$34,$17,$FE,$10,$21,$73,$58
                    db $95,$42,$02,$FE,$D3,$2B,$2E,$30
                    db $13,$42,$98,$43,$A2,$44,$A4,$44
                    db $AB,$44,$AD,$44,$03,$FE,$2F,$30
                    db $15,$42,$99,$43,$00,$FE,$EE,$33
                    db $8E,$20,$EA,$33,$96,$43,$34,$2F
                    db $10,$FE,$FE,$33,$1E,$34,$3E,$34
                    db $5E,$34,$16,$38,$10,$58,$30,$58
                    db $50,$58,$0A,$34,$44,$2F,$64,$2F
                    db $84,$2F,$04,$FE,$0E,$34,$2E,$34
                    db $4E,$34,$26,$38,$36,$38,$20,$58
                    db $40,$58,$60,$58,$9E,$20,$FA,$33
                    db $54,$2F,$74,$2F,$14,$FE,$03,$38
                    db $46,$38,$2A,$57,$70,$58,$0A,$42
                    db $9E,$42,$13,$FE,$F3,$57,$13,$58
                    db $33,$58,$53,$58,$07,$FE,$03,$58
                    db $23,$58,$43,$58,$63,$58,$15,$FE
                    db $0B,$42,$0D,$42,$91,$42,$93,$42
                    db $16,$37,$1A,$37,$16,$FE,$13,$37
                    db $FF,$FF

DATA_15B692:        db $14,$FE,$2C,$57,$06,$59
                    db $D0,$5B,$06,$43,$86,$43,$5E,$44
                    db $EA,$44,$AC,$45,$F6,$46,$17,$FE
                    db $2F,$57,$01,$59,$09,$43,$89,$43
                    db $51,$44,$A3,$45,$F9,$46,$12,$FE
                    db $E0,$58,$00,$2B,$20,$2B,$40,$2B
                    db $60,$2B,$80,$2B,$06,$FE,$F0,$58
                    db $E2,$58,$10,$2B,$30,$2B,$50,$2B
                    db $70,$2B,$90,$2B,$11,$FE,$B0,$59
                    db $05,$FE,$C0,$59,$10,$FE,$B0,$5B
                    db $04,$FE,$C0,$5B,$15,$FE,$C6,$5C
                    db $F2,$58,$2D,$57,$07,$43,$87,$43
                    db $5F,$44,$EB,$44,$A1,$45,$AD,$45
                    db $F7,$46,$03,$FE,$AF,$57,$11,$41
                    db $89,$41,$69,$43,$91,$44,$F3,$44
                    db $A9,$46,$49,$47,$13,$FE,$BF,$57
                    db $07,$FE,$CF,$57,$16,$FE,$F5,$58
                    db $2E,$57,$08,$43,$88,$43,$50,$44
                    db $A2,$45,$AD,$45,$F8,$46,$00,$FE
                    db $1E,$41,$86,$41,$66,$43,$9A,$44
                    db $A6,$46,$46,$47,$01,$FE,$87,$41
                    db $67,$43,$9B,$44,$9D,$44,$9F,$44
                    db $A7,$46,$47,$47,$71,$47,$73,$47
                    db $75,$47,$7B,$47,$7D,$47,$02,$FE
                    db $88,$41,$68,$43,$90,$44,$9C,$44
                    db $9E,$44,$F2,$44,$A8,$46,$48,$47
                    db $72,$47,$74,$47,$7A,$47,$7C,$47
                    db $7E,$47,$FF,$FF

DATA_15B76C:        db $02,$FE,$23,$45
                    db $61,$31,$63,$31,$38,$34,$05,$FE
                    db $33,$45,$34,$46,$11,$FE,$43,$45
                    db $24,$46,$4C,$4D,$13,$FE,$73,$45
                    db $30,$4C,$7F,$4C,$9F,$4C,$BF,$4C
                    db $DF,$4C,$FF,$4D,$1F,$4E,$3F,$4E
                    db $07,$FE,$83,$45,$B3,$45,$20,$4C
                    db $0F,$4C,$8F,$4C,$AF,$4C,$EF,$4D
                    db $0F,$4E,$2F,$4E,$04,$FE,$C4,$44
                    db $74,$46,$D2,$4E,$1C,$FE,$8A,$21
                    db $AA,$21,$CA,$21,$14,$FE,$D4,$44
                    db $E2,$4E,$17,$FE,$C3,$45,$1F,$4C
                    db $23,$FE,$45,$32,$01,$FE,$14,$46
                    db $1E,$46,$60,$31,$62,$31,$64,$31
                    db $6F,$31,$37,$34,$03,$FE,$6F,$4C
                    db $1B,$FE,$65,$31,$39,$34,$10,$FE
                    db $4A,$4D,$12,$FE,$4B,$4D,$4D,$4D
                    db $1A,$FE,$6E,$31,$36,$34,$6A,$21
                    db $22,$FE,$42,$32,$44,$32,$21,$FE
                    db $43,$32,$FF,$FF

DATA_15B804:        db $04,$FE,$7D,$28
                    db $9D,$28,$66,$2F,$9E,$31,$10,$FE
                    db $8D,$28,$AD,$28,$AE,$31,$05,$FE
                    db $F4,$2B,$E6,$2C,$A0,$30,$2D,$30
                    db $E0,$37,$15,$FE,$04,$2C,$F6,$2C
                    db $FC,$2D,$FE,$2D,$E6,$2E,$EA,$2E
                    db $C8,$2F,$B0,$30,$20,$31,$A2,$31
                    db $02,$37,$F0,$37,$12,$2C,$17,$FE
                    db $13,$2C,$6F,$2D,$A3,$31,$03,$FE
                    db $4F,$2D,$BF,$2D,$63,$32,$13,$FE
                    db $5F,$2D,$EF,$2F,$0F,$30,$14,$FE
                    db $F0,$2D,$16,$FE,$E1,$2E,$E3,$2E
                    db $E7,$2E,$3D,$30,$07,$37,$27,$2B
                    db $2D,$2B,$07,$FE,$67,$2F,$DF,$2F
                    db $FF,$2F,$93,$31,$01,$FE,$1D,$30
                    db $00,$31,$70,$31,$CC,$2C,$06,$FE
                    db $10,$31,$9B,$2C,$00,$FE,$46,$2F
                    db $11,$FE,$B0,$38,$FF,$FF

DATA_15B88E:        db $13,$FE
                    db $21,$21,$41,$21,$07,$FE,$31,$21
                    db $17,$FE,$51,$21,$14,$21,$12,$FE
                    db $C3,$21,$05,$FE,$94,$21,$B4,$21
                    db $06,$FE,$F5,$20,$16,$FE,$05,$21
                    db $11,$FE,$A4,$21,$C4,$21,$FF,$FF

DATA_15B8B8:        db $00,$FE,$5D,$2D,$2B,$33,$38,$33
                    db $F3,$28,$C6,$28,$10,$FE,$6D,$2D
                    db $8D,$2D,$13,$29,$D6,$28,$04,$FE
                    db $7D,$2D,$23,$29,$E6,$28,$11,$FE
                    db $20,$32,$40,$32,$60,$32,$01,$34
                    db $5A,$33,$58,$33,$56,$33,$05,$FE
                    db $30,$32,$50,$32,$7E,$31,$7C,$31
                    db $7A,$31,$2F,$33,$4A,$33,$48,$33
                    db $66,$33,$68,$33,$6A,$33,$01,$FE
                    db $1F,$33,$39,$33,$06,$FE,$4F,$31
                    db $6F,$31,$7D,$31,$7B,$31,$10,$34
                    db $2E,$33,$49,$33,$65,$33,$67,$33
                    db $69,$33,$12,$FE,$5F,$31,$7F,$31
                    db $59,$33,$57,$33,$55,$33,$03,$FE
                    db $C9,$28,$1C,$29,$13,$FE,$D9,$28
                    db $F9,$28,$CD,$20,$ED,$20,$07,$FE
                    db $E9,$28,$09,$29,$2C,$29,$DD,$20
                    db $02,$FE,$3F,$31,$47,$33,$3A,$33
                    db $00,$34,$FF,$FF

DATA_15B94C:        db $14,$FE,$61,$43
                    db $04,$FE,$51,$43,$31,$43,$11,$43
                    db $F1,$42,$86,$39,$6B,$39,$8B,$39
                    db $30,$3A,$50,$3A,$70,$3A,$32,$3E
                    db $25,$3F,$10,$FE,$41,$43,$21,$43
                    db $01,$43,$E1,$42,$76,$39,$7B,$39
                    db $20,$3A,$40,$3A,$60,$3A,$15,$3F
                    db $13,$FE,$31,$44,$78,$39,$7D,$39
                    db $22,$3A,$42,$3A,$62,$3A,$1B,$3F
                    db $07,$FE,$41,$44,$88,$39,$6D,$39
                    db $8D,$39,$32,$3A,$52,$3A,$72,$3A
                    db $35,$3E,$2B,$3F,$17,$FE,$51,$44
                    db $02,$FE,$23,$3E,$A1,$4C,$01,$FE
                    db $7E,$44,$15,$FE,$02,$4E,$04,$4E
                    db $1E,$4D,$16,$FE,$01,$4E,$07,$4E
                    db $00,$FE,$5B,$39,$66,$39,$10,$3A
                    db $22,$3E,$05,$3F,$03,$FE,$5D,$39
                    db $68,$39,$12,$3A,$25,$3E,$0B,$3F
                    db $FF,$FF

DATA_15B9DA:        db $07,$FE,$27,$20,$47,$20
                    db $2A,$30,$4A,$30,$6A,$30,$13,$FE
                    db $37,$20,$57,$20,$3A,$30,$5A,$30
                    db $02,$FE,$68,$20,$06,$FE,$78,$20
                    db $08,$20,$15,$FE,$88,$20,$04,$FE
                    db $76,$20,$62,$30,$44,$30,$26,$30
                    db $14,$FE,$86,$20,$03,$FE,$6C,$20
                    db $1A,$30,$00,$FE,$16,$30,$34,$30
                    db $52,$30,$FF,$FF

DATA_15BA1C:        db $00,$FE,$BB,$21
                    db $A4,$22,$A9,$22,$E0,$30,$1A,$FE
                    db $95,$2C,$68,$2C,$72,$2E,$2D,$2F
                    db $44,$2F,$5F,$30,$0D,$31,$66,$31
                    db $F3,$31,$10,$FE,$CB,$21,$B4,$22
                    db $B9,$22,$A5,$2C,$C5,$22,$88,$2C
                    db $82,$2E,$A2,$2E,$54,$2F,$74,$2F
                    db $94,$2F,$3D,$2F,$5D,$2F,$7D,$2F
                    db $9D,$2F,$76,$31,$6F,$30,$8F,$30
                    db $97,$32,$D7,$32,$9B,$32,$DB,$32
                    db $FC,$32,$C5,$2C,$1D,$31,$3D,$31
                    db $5D,$31,$7D,$31,$03,$32,$23,$32
                    db $43,$32,$63,$32,$01,$FE,$BF,$21
                    db $97,$2C,$2F,$2F,$40,$31,$42,$31
                    db $10,$30,$11,$FE,$CF,$21,$A7,$2C
                    db $C7,$2C,$3F,$2F,$5F,$2F,$7F,$2F
                    db $9F,$2F,$C0,$37,$02,$FE,$A0,$22
                    db $41,$31,$5F,$33,$12,$FE,$B0,$22
                    db $00,$37,$00,$20,$20,$20,$40,$20
                    db $60,$20,$BF,$32,$DF,$32,$FF,$32
                    db $04,$FE,$87,$32,$A7,$32,$C7,$32
                    db $8B,$32,$AB,$32,$CB,$32,$0C,$33
                    db $DB,$21,$C4,$22,$C9,$22,$1C,$FE
                    db $78,$2C,$B5,$2C,$92,$2E,$4D,$2F
                    db $6D,$2F,$8D,$2F,$64,$2F,$84,$2F
                    db $AD,$2F,$A4,$2F,$7F,$30,$9F,$30
                    db $86,$31,$D5,$2C,$B2,$2E,$2D,$31
                    db $4D,$31,$6D,$31,$8D,$31,$13,$32
                    db $33,$32,$53,$32,$73,$32,$05,$FE
                    db $B7,$2C,$D7,$2C,$AF,$2F,$4F,$2F
                    db $6F,$2F,$8F,$2F,$E3,$32,$DF,$21
                    db $C5,$22,$14,$FE,$6E,$2B,$F2,$32
                    db $E7,$32,$EB,$32,$1C,$33,$20,$FE
                    db $F0,$30,$15,$FE,$10,$37,$14,$37
                    db $21,$FE,$F1,$30,$17,$FE,$E9,$32
                    db $E5,$32,$F4,$32,$23,$FE,$F2,$30
                    db $06,$FE,$E2,$32,$E4,$32,$E8,$32
                    db $F0,$36,$C0,$22,$10,$20,$30,$20
                    db $50,$20,$CF,$32,$EF,$32,$0F,$33
                    db $19,$FE,$13,$33,$08,$33,$07,$FE
                    db $85,$32,$A5,$32,$C5,$32,$89,$32
                    db $A9,$32,$C9,$32,$1D,$FE,$7A,$2C
                    db $9A,$2C,$BA,$2C,$DA,$2C,$97,$2E
                    db $B7,$2E,$67,$2F,$87,$2F,$A7,$2F
                    db $31,$30,$51,$30,$71,$30,$91,$30
                    db $2F,$31,$4F,$31,$63,$31,$6F,$31
                    db $83,$31,$89,$31,$8F,$31,$15,$32
                    db $35,$32,$55,$32,$75,$32,$13,$FE
                    db $95,$32,$D5,$32,$99,$32,$D9,$32
                    db $1B,$FE,$6A,$2C,$77,$2E,$47,$2F
                    db $11,$30,$0F,$31,$43,$31,$69,$31
                    db $F5,$31,$16,$FE,$1F,$33,$FF,$FF

DATA_15BBB8:        db $05,$FE,$F0,$20,$10,$21,$30,$21
                    db $CD,$36,$EF,$46,$0F,$47,$2F,$47
                    db $4B,$44,$6B,$44,$06,$FE,$CE,$36
                    db $EE,$36,$0E,$47,$2E,$47,$4C,$44
                    db $6C,$44,$5D,$21,$7D,$21,$AF,$59
                    db $15,$FE,$40,$21,$ED,$36,$C9,$45
                    db $EB,$45,$0D,$46,$11,$FE,$C0,$21
                    db $BD,$36,$DD,$36,$FF,$46,$1F,$47
                    db $5B,$44,$00,$21,$20,$21,$08,$FE
                    db $75,$31,$79,$31,$2F,$31,$51,$32
                    db $35,$32,$18,$FE,$3F,$31,$5F,$31
                    db $7F,$31,$09,$FE,$4F,$31,$6F,$31
                    db $02,$FE,$A2,$57,$AD,$36,$AE,$36
                    db $42,$47,$4D,$47,$03,$FE,$9F,$58
                    db $43,$47,$61,$41,$13,$FE,$AF,$58
                    db $CF,$58,$94,$43,$A6,$44,$07,$FE
                    db $88,$43,$54,$44,$00,$FE,$6E,$36
                    db $AC,$36,$7E,$37,$4C,$47,$12,$FE
                    db $BE,$36,$DE,$36,$1E,$47,$3E,$47
                    db $5C,$44,$6D,$21,$8D,$21,$9F,$59
                    db $BF,$59,$14,$FE,$EC,$36,$0E,$37
                    db $9C,$38,$BD,$38,$C7,$43,$C8,$45
                    db $EA,$45,$0C,$46,$2E,$46,$17,$FE
                    db $A4,$43,$F6,$44,$E5,$45,$03,$46
                    db $21,$46,$19,$FE,$F8,$43,$16,$FE
                    db $E4,$45,$02,$46,$04,$FE,$EC,$42
                    db $0F,$36,$2F,$36,$4F,$36,$1F,$37
                    db $3F,$37,$5F,$37,$10,$FE,$FC,$42
                    db $1F,$36,$3F,$36,$5F,$36,$2F,$37
                    db $4F,$37,$6F,$37,$1D,$FE,$C9,$57
                    db $E9,$57,$BF,$58,$DF,$58,$63,$47
                    db $83,$47,$1C,$FE,$BE,$58,$DE,$58
                    db $AA,$59,$CA,$59,$6C,$47,$8C,$47
                    db $FF,$FF

DATA_15BCC2:        db $06,$FE,$F0,$20,$47,$3A
                    db $1B,$55,$1D,$55,$0C,$55,$CC,$54
                    db $3F,$55,$5F,$55,$12,$FE,$00,$21
                    db $37,$3A,$0B,$55,$FC,$54,$4F,$55
                    db $15,$FE,$10,$21,$D2,$39,$11,$FE
                    db $C0,$21,$7F,$54,$9F,$54,$BF,$54
                    db $DF,$54,$FF,$54,$1F,$55,$04,$FE
                    db $D0,$38,$87,$3A,$CC,$54,$14,$FE
                    db $E0,$38,$50,$39,$44,$3A,$00,$FE
                    db $30,$39,$24,$3A,$FA,$54,$16,$FE
                    db $D3,$39,$03,$FE,$21,$3A,$13,$FE
                    db $31,$3A,$83,$3A,$10,$FE,$34,$3A
                    db $82,$3A,$17,$FE,$41,$3A,$02,$FE
                    db $27,$3A,$01,$FE,$FB,$54,$05,$FE
                    db $1A,$55,$1C,$55,$1E,$55,$8F,$54
                    db $AF,$54,$CF,$54,$EF,$54,$0F,$55
                    db $2F,$55,$FF,$FF

DATA_15BD44:        db $11,$FE,$5F,$26
                    db $7F,$26,$7A,$2B,$E1,$20,$E3,$20
                    db $E5,$20,$E7,$20,$E9,$20,$7F,$28
                    db $9F,$28,$BF,$28,$DF,$28,$FF,$28
                    db $12,$FE,$FB,$2C,$7E,$26,$E2,$20
                    db $E4,$20,$E6,$20,$E8,$20,$EA,$20
                    db $00,$20,$20,$20,$40,$20,$60,$20
                    db $80,$20,$A0,$20,$C0,$20,$E0,$20
                    db $01,$FE,$D4,$20,$D6,$20,$D8,$20
                    db $4F,$26,$6A,$2B,$DA,$20,$02,$FE
                    db $D5,$20,$D7,$20,$D9,$20,$05,$FE
                    db $6F,$26,$8A,$2B,$D1,$20,$D3,$20
                    db $8F,$26,$8F,$28,$AF,$28,$CF,$28
                    db $EF,$28,$0F,$29,$04,$FE,$7C,$28
                    db $9C,$28,$BC,$28,$E0,$3F,$F0,$37
                    db $10,$FE,$8C,$28,$AC,$28,$E0,$37
                    db $15,$FE,$1A,$2B,$1C,$2B,$13,$FE
                    db $CA,$2B,$09,$2E,$1F,$36,$3F,$36
                    db $57,$37,$67,$37,$06,$FE,$8B,$2B
                    db $EB,$2C,$D2,$20,$10,$20,$30,$20
                    db $50,$20,$70,$20,$90,$20,$B0,$20
                    db $D0,$20,$17,$FE,$AB,$2B,$7E,$2B
                    db $29,$2E,$5F,$36,$07,$FE,$19,$2E
                    db $0F,$36,$2F,$36,$4F,$36,$16,$FE
                    db $7D,$2B,$14,$FE,$00,$38,$0B,$FE
                    db $6F,$2B,$0C,$FE,$50,$2C,$0D,$FE
                    db $51,$2C,$FF,$FF

DATA_15BE14:        db $05,$FE,$0C,$20
                    db $F6,$20,$E0,$37,$6E,$38,$8A,$38
                    db $8C,$38,$40,$30,$60,$30,$80,$30
                    db $11,$FE,$50,$30,$70,$30,$B0,$38
                    db $5E,$38,$90,$30,$15,$FE,$2C,$20
                    db $06,$21,$F0,$37,$17,$FE,$6B,$20
                    db $15,$21,$1F,$37,$07,$FE,$3B,$20
                    db $5B,$20,$13,$FE,$4B,$20,$02,$FE
                    db $B3,$2B,$30,$30,$DC,$33,$5D,$38
                    db $00,$FE,$A9,$2D,$4F,$2F,$34,$30
                    db $00,$34,$5A,$38,$10,$FE,$B9,$2D
                    db $6F,$2F,$8F,$2F,$44,$30,$64,$30
                    db $84,$30,$20,$34,$40,$34,$6A,$38
                    db $AF,$2F,$04,$FE,$5F,$2F,$7F,$2F
                    db $9F,$2F,$54,$30,$74,$30,$10,$34
                    db $30,$34,$7A,$38,$94,$30,$50,$34
                    db $14,$FE,$14,$37,$08,$38,$12,$FE
                    db $1C,$20,$7D,$38,$7E,$38,$06,$FE
                    db $6D,$38,$8B,$38,$8D,$38,$FF,$FF

DATA_15BEA8:        db $04,$FE,$3A,$37,$10,$FE,$2A,$37
                    db $06,$FE,$00,$2C,$20,$2C,$40,$2C
                    db $60,$2C,$80,$2C,$EF,$37,$0F,$38
                    db $2F,$38,$2E,$49,$4E,$49,$6E,$49
                    db $6C,$49,$00,$2B,$20,$2B,$40,$2B
                    db $60,$2B,$80,$2B,$DF,$2E,$FF,$2E
                    db $1F,$2F,$3F,$2F,$5F,$2F,$12,$FE
                    db $FF,$37,$1F,$38,$F0,$2B,$10,$2C
                    db $30,$2C,$50,$2C,$70,$2C,$3E,$49
                    db $5E,$49,$5C,$49,$10,$2B,$30,$2B
                    db $50,$2B,$70,$2B,$90,$2B,$CF,$2E
                    db $EF,$2E,$0F,$2F,$2F,$2F,$4F,$2F
                    db $01,$FE,$90,$37,$4C,$49,$91,$49
                    db $93,$49,$14,$FE,$4A,$37,$15,$FE
                    db $34,$38,$E4,$38,$D8,$39,$BC,$3B
                    db $16,$FE,$37,$38,$3F,$38,$C7,$3A
                    db $C9,$3A,$B1,$3B,$B3,$3B,$05,$FE
                    db $1F,$2B,$3F,$2B,$5F,$2B,$7F,$2B
                    db $9F,$2B,$D4,$38,$6F,$49,$4F,$49
                    db $2F,$49,$0F,$49,$4D,$49,$6D,$49
                    db $C9,$49,$E9,$49,$09,$4A,$29,$4A
                    db $49,$4A,$07,$FE,$97,$3C,$B7,$3C
                    db $D7,$3C,$13,$FE,$A7,$3C,$C7,$3C
                    db $4F,$39,$17,$FE,$E7,$3C,$5F,$39
                    db $11,$FE,$0F,$2B,$2F,$2B,$4F,$2B
                    db $6F,$2B,$8F,$2B,$5F,$49,$3F,$49
                    db $1F,$49,$5D,$49,$B9,$49,$D9,$49
                    db $F9,$49,$19,$4A,$39,$4A,$59,$4A
                    db $03,$FE,$3F,$39,$90,$48,$95,$49
                    db $00,$FE,$9F,$48,$7A,$49,$B8,$49
                    db $02,$FE,$92,$49,$94,$49,$FF,$FF

DATA_15BFA0:        db $00,$FE,$7A,$4D,$01,$FE,$7B,$4D
                    db $7D,$4D,$02,$FE,$7C,$4D,$12,$FE
                    db $8B,$4D,$8D,$4D,$11,$FE,$8C,$4D
                    db $8E,$4D,$06,$FE,$9B,$4D,$9D,$4D
                    db $7F,$4D,$05,$FE,$9C,$4D,$7E,$4D
                    db $04,$FE,$8A,$4D,$10,$FE,$9A,$4D
                    db $FF,$FF

DATA_15BFD2:        db $14,$FE,$51,$2C,$58,$2C
                    db $38,$2E,$12,$38,$23,$38,$F2,$39
                    db $03,$3A,$49,$37,$29,$39,$09,$3B
                    db $20,$42,$20,$43,$9E,$4D,$19,$62
                    db $16,$63,$A6,$63,$36,$64,$C6,$64
                    db $E9,$6A,$B9,$68,$29,$39,$19,$6D
                    db $2E,$6F,$16,$7C,$22,$7D,$1E,$7C
                    db $DE,$7D,$69,$86,$17,$FE,$52,$2C
                    db $59,$2C,$5C,$2C,$39,$2E,$C7,$30
                    db $2D,$37,$3C,$37,$0D,$39,$1C,$39
                    db $47,$37,$0D,$3B,$A1,$3D,$9F,$4D
                    db $17,$62,$19,$63,$A9,$63,$39,$64
                    db $C9,$64,$E7,$6A,$B7,$68,$17,$6D
                    db $21,$6F,$19,$7C,$DC,$7D,$81,$7C
                    db $67,$86,$19,$FE,$65,$2C,$6B,$2C
                    db $9B,$4D,$57,$7D,$7D,$83,$08,$FE
                    db $9F,$2C,$7D,$2E,$74,$2F,$8B,$4D
                    db $6D,$83,$25,$FE,$57,$2F,$5C,$41
                    db $66,$4C,$87,$4D,$72,$4F,$75,$4F
                    db $67,$70,$17,$7E,$6B,$84,$FC,$84
                    db $8B,$85,$00,$FE,$26,$31,$65,$31
                    db $93,$38,$A2,$38,$73,$3A,$82,$3A
                    db $40,$4D,$8E,$4D,$18,$50,$E6,$62
                    db $76,$63,$06,$64,$96,$64,$A8,$70
                    db $76,$7B,$C2,$7C,$78,$7E,$29,$68
                    db $79,$6A,$19,$86,$B0,$42,$90,$43
                    db $6E,$6E,$2E,$7A,$AE,$7D,$16,$FE
                    db $2F,$36,$83,$3E,$E6,$6A,$66,$86
                    db $02,$FE,$DF,$36,$26,$68,$06,$FE
                    db $3B,$37,$A3,$38,$1B,$39,$83,$3A
                    db $05,$FE,$BC,$37,$24,$38,$9C,$39
                    db $03,$FE,$AC,$37,$BD,$37,$8C,$39
                    db $9D,$39,$41,$4D,$8F,$4D,$19,$50
                    db $E9,$62,$79,$63,$09,$64,$99,$64
                    db $A6,$70,$79,$7B,$AC,$7D,$76,$7E
                    db $27,$68,$77,$6A,$17,$86,$CF,$2C
                    db $61,$6E,$21,$7A,$12,$FE,$F3,$39
                    db $15,$FE,$16,$3A,$C6,$3B,$9A,$54
                    db $13,$FE,$07,$62,$07,$6D,$A6,$2F
                    db $DF,$2C,$10,$FE,$09,$62,$09,$6D
                    db $A8,$2F,$0A,$FE,$26,$6F,$69,$78
                    db $AC,$83,$37,$22,$0D,$FE,$29,$6F
                    db $AD,$83,$04,$FE,$C8,$38,$88,$3C
                    db $D8,$4D,$AE,$50,$B8,$70,$88,$7E
                    db $07,$FE,$C6,$38,$86,$3C,$D6,$4D
                    db $AC,$50,$B6,$70,$86,$7E,$FF,$FF

PNTR_15C140:        dw DATA_15C152
                    dw DATA_15C188
                    dw DATA_15C1BE
                    dw DATA_15C1CE
                    dw DATA_15C1FA
                    dw DATA_15C226
                    dw DATA_15C2B8
                    dw DATA_15C31C
                    dw DATA_15C3AE

DATA_15C152:        db $01,$C3,$40,$40,$40,$08,$13,$11
                    db $11,$11,$11,$11,$11,$11,$02,$00
                    db $04,$40,$09,$07,$40,$40,$40,$40
                    db $40,$40,$40,$01,$01,$05,$11,$0A
                    db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$0B,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40

DATA_15C188:        db $0B,$C3
                    db $40,$40,$40,$0C,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$00,$06,$11
                    db $0D,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$01,$07,$40,$0E,$04,$40
                    db $40,$40,$40,$40,$40,$40,$00,$40
                    db $40,$40,$0F,$12,$11,$11,$11,$11
                    db $11,$11,$11,$03

DATA_15C1BE:        db $D1,$0D,$04,$18
                    db $19,$0B,$AB,$AB,$AB,$AB,$AB,$AB
                    db $0C,$19,$1A,$07

DATA_15C1CE:        db $B1,$2D,$02,$14
                    db $04,$01,$15,$10,$40,$01,$18,$40
                    db $40,$19,$40,$40,$19,$40,$40,$19
                    db $40,$40,$19,$40,$40,$19,$40,$40
                    db $19,$40,$40,$19,$40,$40,$19,$40
                    db $00,$1A,$00,$16,$10,$03,$17,$07

DATA_15C1FA:        db $B1,$2D,$02,$14,$04,$01,$15,$10
                    db $40,$01,$18,$40,$40,$0B,$40,$40
                    db $AB,$40,$40,$AB,$40,$40,$AB,$40
                    db $40,$AB,$40,$40,$AB,$40,$40,$AB
                    db $40,$40,$0C,$40,$00,$1A,$00,$16
                    db $10,$03,$17,$07

DATA_15C226:        db $D0,$8F,$40,$08
                    db $13,$11,$11,$11,$11,$11,$22,$04
                    db $20,$10,$40,$40,$40,$40,$40,$19
                    db $1C,$16,$10,$40,$40,$40,$40,$40
                    db $19,$1D,$17,$07,$40,$40,$40,$40
                    db $40,$19,$0B,$40,$40,$40,$40,$40
                    db $40,$40,$19,$AB,$40,$40,$40,$40
                    db $40,$40,$40,$19,$AB,$40,$40,$40
                    db $40,$40,$40,$40,$19,$AB,$40,$40
                    db $40,$40,$40,$40,$40,$19,$AB,$40
                    db $40,$40,$40,$40,$40,$40,$19,$AB
                    db $40,$40,$40,$40,$40,$40,$40,$19
                    db $AB,$40,$40,$40,$40,$40,$40,$40
                    db $19,$0C,$40,$40,$40,$40,$40,$40
                    db $40,$19,$1E,$14,$04,$40,$40,$40
                    db $40,$40,$19,$1F,$15,$10,$40,$40
                    db $40,$40,$40,$19,$07,$21,$10,$40
                    db $40,$40,$40,$40,$19,$40,$0F,$12
                    db $11,$11,$11,$11,$11,$23

DATA_15C2B8:        db $D1,$6D
                    db $14,$14,$14,$06,$11,$11,$11,$2B
                    db $17,$17,$07,$9D,$9D,$9D,$19,$9D
                    db $9D,$9D,$9D,$9D,$9D,$0B,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9C,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9C,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$0C,$9D
                    db $9D,$9D,$9D,$9D,$9D,$19,$9D,$9D
                    db $9D,$9D,$9D,$9D,$2A,$14,$14,$04
                    db $9D,$9D,$9D,$17,$17,$17,$05,$11
                    db $11,$11

DATA_15C31C:        db $50,$8F,$2E,$11,$11,$11
                    db $11,$11,$02,$24,$25,$23,$9D,$9D
                    db $9D,$9D,$9D,$01,$17,$26,$9D,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$19,$9D
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$19
                    db $9D,$9C,$9D,$9D,$9D,$9D,$9D,$9D
                    db $19,$9D,$9C,$9D,$9D,$9D,$9D,$9D
                    db $9D,$19,$9D,$9D,$9D,$40,$40,$40
                    db $00,$14,$1A,$9D,$9D,$9D,$40,$40
                    db $40,$1B,$2C,$10,$9D,$9D,$9D,$40
                    db $40,$40,$1B,$2C,$10,$9D,$9D,$9D
                    db $40,$40,$40,$01,$17,$18,$9D,$9C
                    db $9D,$9D,$9D,$9D,$9D,$9D,$19,$9D
                    db $9C,$9D,$9D,$9D,$9D,$9D,$9D,$19
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $19,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$19,$22,$9D,$9D,$9D,$9D,$9D
                    db $00,$14,$27,$2D,$11,$11,$11,$11
                    db $11,$03,$29,$28

DATA_15C3AE:        db $50,$8F,$2E,$11
                    db $11,$11,$11,$11,$02,$24,$25,$23
                    db $9D,$9D,$9D,$9D,$9D,$01,$17,$26
                    db $9D,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $19,$9D,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$19,$9D,$9C,$9D,$9D,$9D,$9D
                    db $9D,$9D,$19,$9D,$9C,$9D,$9D,$9D
                    db $9D,$9D,$9D,$19,$9D,$9D,$9D,$9D
                    db $9D,$40,$00,$14,$1A,$9D,$9D,$9D
                    db $9D,$9D,$9D,$1B,$2C,$10,$9D,$40
                    db $9D,$9D,$9D,$9D,$1B,$2C,$10,$9D
                    db $9D,$9D,$9D,$9D,$9D,$01,$17,$18
                    db $9D,$9C,$9D,$9D,$9D,$9D,$9D,$9D
                    db $19,$9D,$9C,$9D,$9D,$9D,$9D,$9D
                    db $9D,$19,$9D,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$19,$9D,$9D,$9D,$9D,$9D
                    db $9D,$9D,$9D,$19,$22,$9D,$9D,$9D
                    db $9D,$9D,$00,$14,$27,$2D,$11,$11
                    db $11,$11,$11,$03,$29,$28

PNTR_15C440:        dw DATA_15C44C
                    dw DATA_15C450
                    dw DATA_15C454
                    dw DATA_15C458
                    dw DATA_15C45C
                    dw DATA_15C461

DATA_15C44C:        db $00,$01,$02,$FF

DATA_15C450:        db $00,$01,$03,$FF

DATA_15C454:        db $00,$01,$04,$FF

DATA_15C458:        db $00,$01,$05,$FF

DATA_15C45C:        db $00,$01,$06,$07,$FF
              
DATA_15C461:        db $00,$01,$06,$08,$FF
   
PNTR_15C466:        dw DATA_15C48E
                    dw DATA_15C49E
                    dw DATA_15C4AE
                    dw DATA_15C4BE
                    dw DATA_15C4CE
                    dw DATA_15C4DE
                    dw DATA_15C4EE
                    dw DATA_15C4FE
                    dw DATA_15C50E
                    dw DATA_15C51E
                    dw DATA_15C52E
                    dw DATA_15C53E
                    dw DATA_15C54E
                    dw DATA_15C55E
                    dw DATA_15C56E
                    dw DATA_15C57E
                    dw DATA_15C58E
                    dw DATA_15C59E
                    dw DATA_15C5AE
                    dw DATA_15C5BE

DATA_15C48E:        db $77,$77,$77,$77,$77,$77,$77,$77
                    db $77,$77,$77,$77,$77,$77,$77,$77

DATA_15C49E:        db $77,$7B,$F8,$F8,$F8,$F8,$F8,$F8
                    db $F8,$F8,$F8,$F8,$F8,$F8,$7A,$77

DATA_15C4AE:        db $F8,$F6,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$7F,$F8

DATA_15C4BE:        db $40,$40,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$40,$40

DATA_15C4CE:        db $F7,$7E,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$7D,$F7

DATA_15C4DE:        db $77,$FA,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$F9,$77

DATA_15C4EE:        db $7B,$F6,$40,$40,$40,$40,$40,$40
                    db $40,$40,$40,$40,$40,$40,$F9,$77

DATA_15C4FE:        db $FA,$40,$40,$40,$40,$40,$7D,$F7
                    db $F7,$F7,$F7,$F7,$F7,$F7,$78,$77

DATA_15C50E:        db $FA,$40,$40,$40,$40,$40,$FB,$F8
                    db $F8,$F8,$F8,$F8,$F8,$F8,$7A,$77

DATA_15C51E:        db $79,$7E,$40,$40,$40,$40,$7C,$40
                    db $40,$40,$40,$40,$40,$40,$F9,$77

DATA_15C52E:        db $77,$FA,$40,$40,$40,$40,$7C,$40
                    db $40,$40,$40,$40,$40,$40,$F9,$77

DATA_15C53E:        db $77,$FA,$40,$40,$40,$40,$FC,$F7
                    db $F7,$7E,$40,$40,$40,$40,$F9,$77

DATA_15C54E:        db $77,$FA,$40,$40,$40,$40,$F9,$77
                    db $77,$FA,$40,$40,$40,$40,$F9,$77

DATA_15C55E:        db $77,$FA,$40,$40,$40,$40,$F9,$7B
                    db $F8,$F6,$40,$40,$40,$40,$F9,$77

DATA_15C56E:        db $77,$FA,$40,$40,$40,$40,$F9,$FA
                    db $40,$40,$40,$40,$40,$40,$F9,$77

DATA_15C57E:        db $77,$FA,$40,$40,$40,$40,$7F,$F6
                    db $40,$40,$40,$40,$40,$40,$F9,$77

DATA_15C58E:        db $77,$FA,$40,$40,$40,$40,$7D,$F7
                    db $F7,$7E,$40,$40,$40,$40,$F9,$77

DATA_15C59E:        db $77,$79,$F7,$7E,$40,$40,$40,$40
                    db $40,$40,$40,$40,$7D,$F7,$78,$77

DATA_15C5AE:        db $77,$77,$77,$FA,$40,$40,$40,$40
                    db $40,$40,$40,$40,$F9,$77,$77,$77

DATA_15C5BE:        db $77,$77,$77,$79,$F7,$F7,$F7,$F7
                    db $F7,$F7,$F7,$F7,$78,$77,$77,$77

DATA_15C5CE:        db $00,$03,$01,$01,$02,$01,$03,$04
                    db $04,$01,$05,$03,$02,$01,$03,$03
                    db $04,$01,$05,$02,$02,$01,$03,$03
                    db $04,$01,$05,$02,$02,$01,$03,$03
                    db $04,$01,$05,$04,$02,$01,$03,$03
                    db $04,$01,$05,$07,$06,$01,$07,$01
                    db $08,$01,$09,$01,$0A,$01,$0B,$01
                    db $0C,$04,$0D,$01,$0E,$05,$0F,$01
                    db $05,$03,$10,$01,$0C,$06,$0D,$01
                    db $0E,$06,$0F,$01,$05,$08,$11,$01
                    db $12,$02,$13,$01,$00,$01,$FF

PNTR_15C625:        dl DATA_15C628

DATA_15C628:        db $00,$00,$03,$21,$2C,$00,$06,$03
                    db $22,$2C,$00,$00,$03,$28,$2C,$00
                    db $06,$03,$29,$2C,$00,$06,$03,$2C
                    db $2C,$00,$02,$02,$FF,$2B,$01,$07
                    db $04,$1F,$2C,$01,$07,$12,$11,$2C
                    db $00,$00,$03,$08,$2E,$00,$06,$03
                    db $09,$2E,$00,$04,$04,$29,$31,$00
                    db $03,$04,$38,$31,$00,$05,$04,$37
                    db $31,$00,$00,$03,$36,$31,$01,$02
                    db $04,$66,$31,$00,$06,$02,$A7,$30
                    db $00,$00,$03,$A9,$30,$01,$05,$04
                    db $75,$31,$01,$00,$02,$27,$31,$00
                    db $08,$04,$25,$2C,$00,$00,$04,$2B
                    db $2C,$00,$08,$02,$AF,$2C,$00,$08
                    db $03,$7D,$2E,$00,$08,$02,$74,$2F
                    db $01,$06,$02,$F8,$2D,$01,$07,$03
                    db $27,$36,$00,$02,$02,$0F,$36,$00
                    db $08,$0A,$3F,$36,$01,$02,$02,$1C
                    db $37,$01,$05,$02,$2B,$37,$00,$05
                    db $02,$AB,$37,$01,$04,$02,$CC,$37
                    db $01,$02,$02,$02,$38,$01,$05,$02
                    db $13,$38,$00,$03,$02,$94,$38,$01
                    db $04,$02,$B2,$38,$00,$07,$02,$96
                    db $38,$00,$01,$02,$98,$38,$00,$02
                    db $06,$E8,$37,$01,$02,$02,$FC,$38
                    db $01,$05,$02,$0B,$39,$00,$05,$02
                    db $8B,$39,$01,$04,$02,$AC,$39,$01
                    db $02,$02,$E2,$39,$00,$03,$02,$F4
                    db $39,$00,$03,$02,$74,$3A,$01,$04
                    db $02,$92,$3A,$00,$02,$06,$CA,$39
                    db $00,$06,$06,$D7,$38,$00,$06,$06
                    db $B7,$3A,$00,$04,$03,$AE,$3B,$00
                    db $00,$03,$83,$3D,$00,$07,$05,$F7
                    db $36,$00,$01,$05,$F9,$36,$00,$01
                    db $05,$D9,$38,$00,$01,$05,$B9,$3A
                    db $00,$07,$02,$ED,$3A,$00,$07,$02
                    db $81,$3D,$01,$01,$03,$D7,$36,$01
                    db $06,$10,$21,$42,$01,$06,$10,$21
                    db $43,$01,$00,$10,$B1,$42,$01,$00
                    db $10,$91,$43,$01,$03,$20,$10,$42
                    db $01,$05,$20,$C0,$42,$01,$05,$10
                    db $10,$43,$01,$03,$10,$A0,$43,$00
                    db $03,$04,$80,$44,$00,$02,$05,$D0
                    db $43,$00,$00,$07,$50,$4D,$00,$06
                    db $07,$51,$4D,$00,$00,$07,$28,$50
                    db $00,$06,$07,$29,$50,$00,$04,$03
                    db $CE,$4F,$01,$06,$05,$12,$62,$01
                    db $06,$04,$1A,$62,$01,$01,$02,$E7
                    db $62,$01,$07,$02,$17,$63,$01,$01
                    db $02,$77,$63,$01,$07,$02,$A7,$63
                    db $01,$01,$02,$07,$64,$01,$07,$02
                    db $37,$64,$01,$01,$02,$97,$64,$01
                    db $07,$02,$C7,$64,$01,$00,$0C,$A2
                    db $65,$01,$06,$04,$D6,$67,$00,$06
                    db $08,$37,$68,$00,$00,$08,$39,$68
                    db $01,$06,$03,$B4,$68,$01,$06,$02
                    db $BA,$68,$01,$00,$03,$74,$6A,$01
                    db $00,$02,$7A,$6A,$00,$06,$06,$87
                    db $6A,$00,$00,$06,$89,$6A,$01,$00
                    db $04,$46,$6B,$01,$07,$06,$11,$6D
                    db $01,$06,$05,$1A,$6D,$01,$01,$05
                    db $A1,$70,$01,$01,$06,$A9,$70,$01
                    db $08,$02,$27,$6F,$01,$07,$0E,$11
                    db $78,$01,$08,$05,$6A,$78,$01,$01
                    db $02,$77,$7B,$01,$07,$02,$17,$7C
                    db $00,$04,$07,$20,$7C,$00,$06,$07
                    db $21,$7C,$01,$01,$0C,$C3,$7C,$01
                    db $07,$0C,$23,$7D,$00,$00,$05,$D2
                    db $7C,$00,$06,$07,$C0,$7C,$00,$08
                    db $02,$37,$7D,$00,$06,$02,$BC,$7D
                    db $00,$00,$02,$BE,$7D,$01,$00,$0B
                    db $A1,$7D,$01,$06,$0B,$D1,$7D,$01
                    db $00,$05,$71,$7E,$01,$00,$06,$79
                    db $7E,$00,$01,$03,$BE,$7D,$01,$00
                    db $07,$10,$86,$01,$00,$04,$1A,$86
                    db $01,$00,$04,$A6,$86,$00,$06,$04
                    db $27,$86,$00,$00,$04,$29,$86,$FF

PNTR_15C890:        dw DATA_15C8A2
                    dw DATA_15C8A4
                    dw DATA_15C8A6
                    dw DATA_15C8A8
                    dw DATA_15C8AA
                    dw DATA_15C8AC
                    dw DATA_15C8AE
                    dw DATA_15C8B0
                    dw DATA_15C8B2

DATA_15C8A2:        db $04,$10

DATA_15C8A4:        db $10,$04

DATA_15C8A6:        db $05,$11

DATA_15C8A8:        db $11,$05

DATA_15C8AA:        db $06,$12

DATA_15C8AC:        db $12,$06

DATA_15C8AE:        db $07,$13

DATA_15C8B0:        db $13,$07

DATA_15C8B2:        db $09,$18

PNTR_15C8B4:        dw DATA_15C8C6
                    dw DATA_15C8C8
                    dw DATA_15C8CA
                    dw DATA_15C8CC
                    dw DATA_15C8CE
                    dw DATA_15C8D0
                    dw DATA_15C8D2
                    dw DATA_15C8D4
                    dw DATA_15C8D6

DATA_15C8C6:        db $01,$02

DATA_15C8C8:        db $02,$01

DATA_15C8CA:        db $05,$06

DATA_15C8CC:        db $06,$05

DATA_15C8CE:        db $11,$12

DATA_15C8D0:        db $12,$11

DATA_15C8D2:        db $15,$16

DATA_15C8D4:        db $16,$15

DATA_15C8D6:        db $0B,$0C
     
DATA_15C8D8:        db $07,$07,$07,$0D,$0D,$0D,$0D,$0E
                    db $0E,$0E,$0D,$11,$11,$11,$0E,$0E
                    db $0E,$0E,$0E,$0E,$13,$13,$01,$0E
                    db $00,$07,$07,$0D,$0D,$0D,$0D,$0E
                    db $0E,$0E,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$07,$0E,$0E,$08,$08
                    db $08,$08,$08,$08,$08,$08,$08,$08
                    db $08,$08,$08,$08,$08,$08,$08,$08
                    db $08,$08,$08,$08,$08,$08,$08,$08
                    db $08,$08,$08,$08,$00,$00,$02,$02
                    db $02,$02,$02,$02,$02,$02,$02,$02
                    db $02,$02,$06,$06,$06,$06,$06,$06
                    db $06,$0D,$0D,$0D,$0D,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$09
                    db $09,$09,$09,$09,$09,$09,$09,$09
                    db $09,$05,$05,$05,$05,$05,$05,$05
                    db $05,$0B,$0B,$0B,$0B,$0B,$0B,$0B
                    db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
                    db $0B,$0B,$0B,$0E,$0E,$0E,$11,$11

DATA_15C970:        db $00,$00,$00,$01,$01,$01,$01,$01
                    db $01,$01,$01,$01,$01,$01,$01,$01
                    db $01,$01,$01,$01,$06,$06,$00,$01
                    db $01,$00,$00,$01,$01,$01,$01,$01
                    db $02,$02,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$01,$01,$07,$07
                    db $07,$07,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$07,$02,$02,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$01,$01,$01,$01,$01,$01
                    db $00,$01,$01,$01,$01,$02,$02,$02
                    db $02,$02,$02,$02,$02,$02,$02,$00
                    db $00,$01,$01,$01,$01,$01,$01,$01
                    db $01,$06,$06,$06,$06,$06,$06,$06
                    db $06,$07,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$05,$05,$05,$06,$06

DATA_15CA08:        db $85,$25,$10,$26,$70,$26,$20,$29
                    db $30,$29,$40,$29,$9D,$22,$85,$20
                    db $8B,$20,$BE,$22,$C9,$21,$97,$21
                    db $99,$21,$C7,$21,$DD,$20,$DE,$20
                    db $6D,$27,$6E,$27,$5B,$28,$5C,$28
                    db $E8,$27,$58,$28,$7F,$26,$C7,$20
                    db $D6,$2D,$B1,$22,$91,$24,$AC,$22
                    db $BC,$22,$AD,$22,$BD,$22,$1B,$33
                    db $62,$38,$73,$38,$D2,$21,$B1,$23
                    db $91,$25,$95,$25,$61,$28,$C3,$22
                    db $A3,$24,$93,$25,$80,$26,$63,$28
                    db $67,$28,$69,$28,$CF,$6E,$DF,$6E
                    db $2E,$71,$3E,$71,$4E,$71,$5E,$71
                    db $6E,$71,$7E,$71,$8E,$71,$9E,$71
                    db $AE,$71,$92,$71,$A2,$71,$2B,$71
                    db $3B,$71,$4B,$71,$5B,$71,$6B,$71
                    db $7B,$71,$8B,$71,$85,$6D,$95,$6D
                    db $A5,$6D,$B5,$6D,$C5,$6D,$89,$6D
                    db $99,$6D,$A9,$6D,$B9,$6D,$C9,$6D
                    db $9F,$3A,$78,$39,$A0,$21,$A4,$21
                    db $86,$21,$8D,$21,$A6,$22,$9A,$22
                    db $9D,$22,$60,$25,$61,$25,$64,$25
                    db $65,$25,$68,$25,$C2,$30,$03,$31
                    db $34,$31,$E6,$33,$E7,$33,$09,$34
                    db $48,$21,$D9,$21,$CC,$22,$CD,$22
                    db $50,$29,$B5,$3C,$C5,$3C,$D5,$3C
                    db $E5,$3C,$F5,$3C,$BA,$3C,$CA,$3C
                    db $DA,$3C,$EA,$3C,$FA,$3C,$3E,$29
                    db $3F,$29,$B6,$21,$C6,$21,$D6,$21
                    db $94,$23,$A4,$23,$B4,$23,$93,$25
                    db $7A,$27,$8C,$63

DATA_15CAFC:        db $8D,$63,$9C,$63,$9D,$63,$AC,$63
                    db $AD,$63,$BC,$63,$BD,$63,$00,$6D
                    db $01,$6D,$0E,$6D,$0F,$6D,$10,$6D
                    db $11,$6D,$1E,$6D,$1F,$6D,$60,$6D
                    db $61,$6D,$6E,$6D,$6F,$6D,$70,$6D
                    db $71,$6D,$7E,$6D,$7F,$6D,$C2,$6D
                    db $CD,$6D,$A6,$58,$B6,$58,$C6,$58
                    db $7B,$63,$8B,$63

DATA_15CB38:        db $3A,$DB,$39,$37,$39,$39,$39,$A7
                    db $A7,$39,$39,$A7,$A7,$A7,$3A,$37
                    db $38,$39,$3A,$37,$19,$19,$3A,$A7
                    db $D2,$A7,$A7,$A7,$A7,$39,$39,$70
                    db $F5,$F5,$3A,$3A,$3A,$3A,$3A,$39
                    db $39,$39,$39,$39,$3A,$39,$76,$76
                    db $76,$76,$76,$76,$76,$76,$76,$76
                    db $76,$3F,$3F,$3F,$3F,$3F,$3F,$3F
                    db $3F,$3F,$62,$62,$62,$62,$62,$63
                    db $63,$63,$63,$63,$A4,$A5,$A4,$A5
                    db $A4,$A5,$A5,$A4,$A5,$A4,$A5,$A4
                    db $A5,$A4,$A5,$A5,$A5,$A4,$A5,$A5
                    db $A5,$39,$A7,$39,$39,$CE,$C9,$C9
                    db $C9,$D3,$CA,$C7,$C7,$C7,$D2,$0A
                    db $0A,$39,$39,$39,$39,$39,$39,$A7
                    db $39,$BB,$BA,$BC,$BD,$BF,$BE,$BA
                    db $BB,$BC,$BD,$BC,$BD,$BF,$BE,$BF
                    db $BE,$BC,$BD,$BC,$BD,$BF,$BE,$BF
                    db $BE,$BA,$BB,$BF,$BA,$BD,$BE,$BA

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; /

DATA_15D000:        db $8C,$68,$A6,$6A,$6A,$A6,$68

CODE_15D007:        PHX                         
                    LDX.b $12                   
                    LDA.b $90,x                 
                    CMP.b #$36                  
                    BNE   CODE_15D038           
                    LDA.b $79,x                 
                    BEQ   CODE_15D038           
                    INC.w $079E                 
                    LDA.w $079E                 
                    CMP.b #$0E                  
                    BCC   CODE_15D023           
                    LDA.b #$00                  
                    STA.w $079E                 
CODE_15D023:        LSR   A                     
                    TAX                         
                    LDA.l DATA_15D000,x             
                    STA.w $0712                 
                    CPX.b #$04                  
                    BCC   CODE_15D038           
                    LDA.w $0713                 
                    ORA.b #$40                  
                    STA.w $0713                 
CODE_15D038:        PLX                         
                    RTL                         

CODE_15D03A:        PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    LDA.b #$01                  
                    STA.b $85                   
                    LDA.w $0779                 
                    ASL   A                     
                    TAX                         
                    LDA.w PNTR_15D055,x               
                    STA.b $00                   
                    LDA.w PNTR_15D055+1,x               
                    STA.b $01                   
                    JMP.w ($0000)               

PNTR_15D055:        dw CODE_15D067
                    dw CODE_15D084
                    dw CODE_15D05D
                    dw CODE_15D072

CODE_15D05D:        DEC.w $0795
                    BPL   CODE_15D084           
                    INC.w $0779                 
                    BRA   CODE_15D084           

CODE_15D067:        STZ.w $04BE                 
                    INC.w $0779                 
                    INC.w $041B                 
                    BRA   CODE_15D084           

CODE_15D072:        DEC.w $04BE                 
                    LDA.w $04BE                 
                    BPL   CODE_15D084           
                    LDA.b #$FF                  
                    STA.w $0778                 
                    STZ.w $041B                 
                    BRA   CODE_15D084           

CODE_15D084:        REP   #$10                  
                    LDY.w #$01FC                
                    LDX.w #$0007                
                    LDA.w $04C1                 
                    STA.b $00                   
                    LDA.w $04BF                 
                    STA.b $01                   
                    LDA.w $0779                 
                    CMP.b #$03                  
                    BNE   CODE_15D0A0           
                    LDY.w #$007C                
CODE_15D0A0:        JSR.w CODE_15D197           
                    LDA.l DATA_15D1AD,x             
                    CPX.w #$0002                
                    BCC   CODE_15D0B0           
                    SEC                         
                    SBC.w $04BE                 
CODE_15D0B0:        CMP.b #$60                  
                    BCS   CODE_15D0B6                   
                    LDA.b #$F0                  
CODE_15D0B6:        DEC   A                     
                    STA.w $0801,y               
                    LDA.l DATA_15D1B5,x             
                    STA.w $0802,y               
                    LDA.l DATA_15D1BD,x             
                    STA.w $0803,y               
                    LDA.b #$04                  
                    XBA                         
                    LDA.l DATA_15D1A5,x             
                    REP   #$20                  
                    SEC                         
                    SBC.b $00                   
                    STA.b $02                   
                    SEP   #$20                  
                    STA.w $0800,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $03                   
                    BEQ   CODE_15D0EA           
                    LDA.b #$01                  
CODE_15D0EA:        ORA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    DEX                         
                    BPL   CODE_15D0A0           
                    LDA.w $0779                 
                    CMP.b #$01                  
                    BNE   CODE_15D10C           
                    INC.w $04BE                 
                    LDA.w $04BE                 
                    CMP.b #$20                  
                    BCC   CODE_15D10C           
                    INC.w $0779                 
                    LDA.b #$10                  
                    STA.w $0795                 
CODE_15D10C:        LDA.w $0778                 
                    BPL   CODE_15D117           
                    STZ.w $0779                 
                    STZ.w $04BE                 
CODE_15D117:        SEP   #$10                  
                    PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

CODE_15D11D:        LDA.w $0779                 
                    BNE   CODE_15D196           
                    LDA.w $0533                 
                    CMP.b #$11                  
                    BNE   CODE_15D196           
                    LDA.w $0534                 
                    CMP.b #$01                  
                    BNE   CODE_15D196           
                    LDA.b $14                   
                    CMP.b #$04                  
                    BCC   CODE_15D196           
                    PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    REP   #$10                  
                    LDX.w #$0007                
                    LDY.w #$01FC                
                    LDA.w $04C1                 
                    STA.b $00                   
                    LDA.w $04BF                 
                    STA.b $01                   
CODE_15D14D:        JSR.w CODE_15D197           
                    LDA.l DATA_15D1AD,x             
                    DEC   A                     
                    STA.w $0801,y               
                    LDA.l DATA_15D1B5,x             
                    STA.w $0802,y               
                    LDA.l DATA_15D1BD,x             
                    STA.w $0803,y               
                    LDA.b #$04                  
                    XBA                         
                    LDA.l DATA_15D1A5,x             
                    REP   #$20                  
                    SEC                         
                    SBC.b $00                   
                    STA.b $02                   
                    SEP   #$20                  
                    STA.w $0800,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $03                   
                    BEQ   CODE_15D188           
                    LDA.b #$01                  
CODE_15D188:        ORA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    DEX                         
                    BPL   CODE_15D14D           
                    SEP   #$10                  
                    PLY                         
                    PLX                         
                    PLB                         
CODE_15D196:        RTL                         

CODE_15D197:        LDA.w $0801,y               
                    CMP.b #$F0                  
                    BEQ   CODE_15D1A4           
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    BRA   CODE_15D197           

CODE_15D1A4:        RTS                         

DATA_15D1A5:        db $90,$A0,$90,$A0,$90,$A0,$90,$A0

DATA_15D1AD:        db $60,$60,$70,$70,$80,$80,$90,$90

DATA_15D1B5:        db $A0,$A2,$A4,$A6,$62,$64,$66,$AE

DATA_15D1BD:        db $27,$27,$27,$27,$26,$26,$26,$27

CODE_15D1C5:        LDA.w $0533                 
                    CMP.b #$11                  
                    BNE   CODE_15D1F9           
                    LDA.w $0534                 
                    CMP.b #$02                  
                    BEQ   CODE_15D1E9           
                    CMP.b #$01                  
                    BNE   CODE_15D1F9           
                    LDA.b $14                   
                    CMP.b #$04                  
                    BNE   CODE_15D1F9           
                    LDA.b $28                   
                    CMP.b #$90                  
                    BCC   CODE_15D1F9           
                    CMP.b #$A0                  
                    BCS   CODE_15D1F9                   
                    SEC                         
                    RTL                         

CODE_15D1E9:        LDA.b $14                   
                    BNE   CODE_15D1F9           
                    LDA.b $28                   
                    CMP.b #$50                  
                    BCC   CODE_15D1F9           
                    CMP.b #$60                  
                    BCS   CODE_15D1F9                   
                    SEC                         
                    RTL                         

CODE_15D1F9:        CLC                         
                    RTL                         

DATA_15D1FB:        db $A6

DATA_15D1FC:        db $A7

DATA_15D1FD:        db $A8

DATA_15D1FE:        db $A9,$AA,$AB,$AC,$AD,$B6
                    db $B7,$B8,$B9,$BA,$BB,$BC,$BD,$BD
                    db $BC,$BB,$BA,$B9,$B8,$B7,$B6,$AD
                    db $AC,$AB,$AA,$A9,$A8,$A7,$A6

CODE_15D21B:        SEP   #$30                  
                    SEC                         
                    RTL                         
CODE_15D21F:        LDA.b $EB                   
                    BNE   CODE_15D226           
                    STZ.w $021F                 
CODE_15D226:        LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$20                  
                    CMP.w #$0180                
                    BCC   CODE_15D239           
                    CMP.w #$FF80                
                    BCC   CODE_15D21B           
CODE_15D239:        LDA.w $02F8                 
                    STA.w $070B                 
                    SEP   #$20                  
                    LDA.b $10                   
                    LSR   A                     
                    LSR   A                     
                    AND.b #$07                  
                    LDY.b $3D,x                 
                    BMI   CODE_15D24B           
CODE_15D24B:        TAX                         
                    ASL   A                     
                    ASL   A                     
                    STA.b $0E                   
                    STZ.b $0F                   
                    LDA.w DATA_119AA6,x               
                    LDX.b $12                   
                    STA.b $6F,x                 
                    LDA.w $044A,x               
                    AND.b #$02                  
                    LSR   A                     
                    LDX.b $ED                   
                    BEQ   CODE_15D265           
                    LDA.b #$00                  
CODE_15D265:        ADC.w $0429                 
                    STA.w $0713                 
                    LDA.w $042C                 
                    LDX.b $EE                   
                    BEQ   CODE_15D274           
                    LDA.b #$F0                  
CODE_15D274:        REP   #$10                  
                    LDY.w $070B                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    STA.w $0712                 
                    LDA.w $0713                 
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    STA.w $0713                 
                    LDX.b $0E                   
                    LDA.l DATA_15D1FB,x             
                    STA.w $0802,y               
                    LDA.l DATA_15D1FC,x             
                    STA.w $0806,y               
                    LDA.b #$00                  
                    LDX.b $0E                   
                    CPX.w #$0010                
                    BCC   CODE_15D2AC           
                    LDA.b #$40                  
CODE_15D2AC:        ORA.b #$2D                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $0714                 
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDY.w $02F8                 
                    STY.w $070D                 
                    LDA.w $0712                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    LDA.w $0713                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    LDX.b $0E                   
                    LDA.l DATA_15D1FD,x             
                    STA.w $0802,y               
                    LDA.l DATA_15D1FE,x             
                    STA.w $0806,y               
                    LDA.w $0714                 
                    STA.w $0803,y               
                    STA.w $0807,y               
                    CLC                         
                    RTL                         

DATA_15D2F6:        db $58,$C8,$DF,$30,$60,$C8,$79,$31
                    db $68,$C8,$2F,$31,$70,$C8,$CF,$30
                    db $80,$C8,$2F,$31,$88,$C8,$3F,$31
                    db $90,$C8,$C8,$30,$98,$C8,$1F,$31
                    db $A0,$C8,$3F,$31


CODE_15D31A:        LDX.b #$23
CODE_15D31C:        LDA.l DATA_15D2F6,x             
                    STA.w $0900,x               
                    DEX                         
                    BPL   CODE_15D31C           
                    STZ.w $0A60                 
                    STZ.w $0A61                 
                    STZ.w $0A62                 
                    STZ.w $0A63                 
                    STZ.w $0A64                 
                    STZ.w $0A65                 
                    STZ.w $0A66                 
                    STZ.w $0A67                 
                    STZ.w $0A68                 
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty data.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  | 3262 bytes full of $FF.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF              ; /

PNTR_15E000:        dl $000302                              ; 00 - RAM upload table.
                    dl DATA_15E00F                          ; 01 - Border of the 'Super Mario Bros. 2' screen.
                    dl DATA_15E250                          ; 02 - 'Super Mario Bros. 2' and '?1988-1992 Nintendo.'
                    dl DATA_15E41F                          ; 03 - Border of the Game Over screen.
                    dl DATA_15E660                          ;
     
DATA_15E00F:        db $0C,$00,$47,$FE,$BD,$09,$0C,$01
                    db $C0,$3E,$BE,$04,$0C,$02,$C0,$3E
                    db $BE,$04,$0C,$03,$C0,$3E,$BE,$04
                    db $0C,$1C,$C0,$3E,$BE,$04,$0C,$1D
                    db $C0,$3E,$BE,$04,$0C,$1E,$C0,$3E
                    db $BE,$04,$0C,$04,$40,$2E,$BE,$04
                    db $0C,$24,$40,$2E,$BE,$04,$0C,$44
                    db $40,$2E,$BE,$04,$0F,$44,$40,$2E
                    db $BE,$04,$0F,$64,$40,$2E,$BE,$04
                    db $0F,$84,$40,$2E,$BE,$04,$0F,$A4
                    db $40,$2E,$BE,$04,$0C,$44,$00,$17
                    db $BE,$04,$02,$04,$03,$04,$04,$04
                    db $05,$04,$06,$04,$07,$04,$08,$04
                    db $09,$04,$0A,$04,$0B,$04,$0C,$04
                    db $0C,$50,$00,$17,$0C,$44,$0B,$44
                    db $0A,$44,$09,$44,$08,$44,$07,$44
                    db $06,$44,$05,$44,$04,$44,$03,$44
                    db $02,$44,$BE,$04,$0C,$64,$00,$0F
                    db $0D,$04,$0E,$04,$0F,$04,$10,$04
                    db $11,$04,$12,$04,$13,$04,$14,$04
                    db $0C,$74,$00,$0F,$14,$44,$13,$44
                    db $12,$44,$11,$44,$10,$44,$0F,$44
                    db $0E,$44,$0D,$44,$0C,$83,$00,$09
                    db $15,$04,$16,$04,$17,$04,$18,$04
                    db $19,$04,$0C,$98,$00,$09,$19,$44
                    db $18,$44,$17,$44,$16,$44,$15,$44
                    db $0C,$A3,$00,$07,$1A,$04,$1B,$04
                    db $1C,$04,$1D,$04,$0C,$B9,$00,$07
                    db $1D,$44,$1C,$44,$1B,$44,$1A,$44
                    db $0C,$C3,$00,$05,$1E,$04,$1F,$04
                    db $20,$04,$0C,$DA,$00,$05,$20,$44
                    db $1F,$44,$1E,$44,$0C,$E3,$00,$01
                    db $21,$04,$0C,$FC,$00,$01,$21,$44
                    db $0D,$03,$C0,$1E,$23,$04,$0D,$1C
                    db $C0,$1E,$23,$44,$0E,$42,$C0,$0C
                    db $01,$04,$0E,$5D,$C0,$0C,$01,$44
                    db $0D,$A3,$00,$01,$24,$04,$0D,$BC
                    db $00,$01,$24,$44,$0D,$C2,$00,$03
                    db $25,$04,$26,$04,$0D,$DC,$00,$03
                    db $26,$44,$25,$44,$0D,$E2,$00,$03
                    db $27,$04,$28,$04,$0D,$FC,$00,$03
                    db $28,$44,$27,$44,$0E,$02,$00,$03
                    db $29,$04,$2A,$04,$0E,$1C,$00,$03
                    db $2A,$44,$29,$44,$0F,$03,$00,$01
                    db $2B,$04,$0F,$23,$00,$01,$2C,$04
                    db $0F,$26,$40,$26,$2F,$04,$0F,$46
                    db $40,$2A,$34,$04,$0E,$A4,$80,$0B
                    db $94,$1C,$96,$1C,$80,$10,$82,$10
                    db $84,$10,$86,$10,$0E,$A5,$80,$0B
                    db $95,$1C,$97,$1C,$81,$10,$83,$10
                    db $85,$10,$87,$10,$0F,$47,$00,$03
                    db $A0,$1C,$A1,$1C,$0F,$59,$00,$03
                    db $A0,$1C,$A1,$1C,$0F,$09,$80,$03
                    db $B2,$1C,$B4,$1C,$0F,$0A,$80,$03
                    db $B3,$1C,$B5,$1C,$0E,$F4,$00,$03
                    db $90,$1C,$91,$1C,$0F,$14,$00,$05
                    db $92,$1C,$93,$1C,$9F,$18,$0E,$F7
                    db $80,$07,$88,$18,$8A,$18,$8C,$18
                    db $8E,$18,$0E,$F8,$80,$07,$89,$18
                    db $8B,$18,$8D,$18,$8F,$18,$0E,$DA
                    db $80,$07,$A2,$0C,$A4,$0C,$A6,$0C
                    db $A8,$0C,$0E,$DB,$80,$07,$A3,$0C
                    db $A5,$0C,$A7,$0C,$A9,$0C,$0E,$DC
                    db $80,$07,$AA,$14,$AC,$14,$AE,$14
                    db $B0,$14,$0E,$DD,$80,$07,$AB,$14
                    db $AD,$14,$AF,$14,$B1,$14,$0F,$0D
                    db $00,$05,$98,$04,$2D,$04,$2E,$04
                    db $0F,$10,$00,$05,$2E,$44,$2D,$44
                    db $98,$44,$0F,$2C,$00,$07,$30,$04
                    db $31,$04,$32,$04,$33,$04,$0F,$30
                    db $00,$07,$33,$44,$32,$44,$31,$44
                    db $30,$44,$0F,$4F,$40,$03,$BE,$04
                    db $FF

DATA_15E250:        db $0C,$AB,$00,$13,$70,$08,$71
                    db $08,$67,$08,$67,$08,$64,$08,$59
                    db $48,$64,$08,$51,$08,$64,$08,$59
                    db $48,$0C,$CB,$00,$13,$72,$08,$73
                    db $08,$5C,$08,$5C,$08,$5C,$08,$7E
                    db $08,$5C,$08,$52,$08,$5C,$08,$57
                    db $08,$0C,$EB,$00,$13,$75,$08,$76
                    db $08,$7C,$08,$7D,$08,$50,$08,$4F
                    db $08,$53,$08,$54,$08,$50,$08,$58
                    db $08,$0D,$0B,$00,$13,$46,$08,$47
                    db $08,$46,$08,$47,$08,$55,$08,$BF
                    db $00,$55,$08,$56,$08,$55,$08,$55
                    db $08,$0D,$38,$00,$03,$F0,$09,$F1
                    db $09,$0D,$46,$00,$25,$59,$08,$5A
                    db $08,$59,$48,$59,$08,$59,$48,$64
                    db $08,$59,$48,$67,$08,$59,$08,$59
                    db $48,$BF,$00,$64,$08,$59,$48,$64
                    db $08,$59,$48,$59,$08,$59,$48,$59
                    db $08,$59,$48,$0D,$66,$00,$25,$5C
                    db $08,$5C,$08,$5D,$08,$5C,$08,$5D
                    db $08,$5C,$08,$5D,$08,$5C,$08,$5C
                    db $08,$5D,$08,$BF,$00,$5C,$08,$5D
                    db $08,$5C,$08,$5D,$08,$5C,$08,$5D
                    db $08,$5C,$08,$6C,$08,$0D,$86,$00
                    db $25,$5E,$08,$5E,$08,$5E,$08,$5E
                    db $08,$5E,$08,$5E,$08,$65,$08,$5E
                    db $08,$5E,$08,$5E,$08,$BF,$00,$5E
                    db $08,$65,$08,$5E,$08,$65,$08,$5E
                    db $08,$5E,$08,$6D,$08,$6E,$08,$0D
                    db $A6,$00,$25,$5F,$08,$5F,$08,$5F
                    db $08,$61,$08,$62,$08,$5F,$08,$66
                    db $08,$5F,$08,$5F,$08,$5F,$08,$BF
                    db $00,$5F,$08,$66,$08,$5F,$08,$66
                    db $08,$5F,$08,$5F,$08,$B8,$08,$6F
                    db $08,$0D,$C6,$00,$27,$60,$08,$60
                    db $08,$60,$08,$60,$08,$63,$08,$60
                    db $08,$60,$08,$60,$08,$68,$08,$69
                    db $08,$BF,$00,$60,$08,$6A,$08,$60
                    db $08,$60,$08,$68,$08,$69,$08,$68
                    db $08,$69,$08,$5B,$08,$0D,$E6,$00
                    db $27,$55,$08,$55,$08,$55,$08,$55
                    db $08,$55,$08,$55,$08,$55,$08,$55
                    db $08,$46,$08,$47,$08,$BF,$00,$55
                    db $08,$6B,$08,$55,$08,$55,$08,$46
                    db $08,$47,$08,$46,$08,$47,$08,$55
                    db $08,$0E,$2E,$00,$07,$40,$08,$41
                    db $08,$42,$08,$43,$08,$0E,$4E,$00
                    db $07,$44,$08,$45,$08,$48,$08,$49
                    db $08,$0E,$6E,$00,$07,$4A,$08,$4B
                    db $08,$4C,$08,$4D,$08,$0E,$8E,$00
                    db $07,$4E,$08,$77,$08,$78,$08,$79
                    db $08,$0E,$AE,$00,$07,$7A,$08,$7B
                    db $08,$7B,$08,$7B,$08,$0E,$C7,$00
                    db $25,$F9,$15,$C1,$15,$C9,$15,$C8
                    db $15,$C8,$15,$E8,$15,$C1,$15,$C9
                    db $15,$C9,$15,$C3,$15,$BF,$09,$D7
                    db $15,$D2,$15,$D7,$15,$DD,$15,$CE
                    db $15,$D7,$15,$CD,$15,$D8,$15,$FF

DATA_15E41F:        db $08,$00,$47,$FE,$BD,$09,$08,$01
                    db $C0,$3E,$BE,$04,$08,$02,$C0,$3E
                    db $BE,$04,$08,$03,$C0,$3E,$BE,$04
                    db $08,$1C,$C0,$3E,$BE,$04,$08,$1D
                    db $C0,$3E,$BE,$04,$08,$1E,$C0,$3E
                    db $BE,$04,$08,$04,$40,$2E,$BE,$04
                    db $08,$24,$40,$2E,$BE,$04,$08,$44
                    db $40,$2E,$BE,$04,$0B,$44,$40,$2E
                    db $BE,$04,$0B,$64,$40,$2E,$BE,$04
                    db $0B,$84,$40,$2E,$BE,$04,$0B,$A4
                    db $40,$2E,$BE,$04,$08,$44,$00,$17
                    db $BE,$04,$02,$04,$03,$04,$04,$04
                    db $05,$04,$06,$04,$07,$04,$08,$04
                    db $09,$04,$0A,$04,$0B,$04,$0C,$04
                    db $08,$50,$00,$17,$0C,$44,$0B,$44
                    db $0A,$44,$09,$44,$08,$44,$07,$44
                    db $06,$44,$05,$44,$04,$44,$03,$44
                    db $02,$44,$BE,$04,$08,$64,$00,$0F
                    db $0D,$04,$0E,$04,$0F,$04,$10,$04
                    db $11,$04,$12,$04,$13,$04,$14,$04
                    db $08,$74,$00,$0F,$14,$44,$13,$44
                    db $12,$44,$11,$44,$10,$44,$0F,$44
                    db $0E,$44,$0D,$44,$08,$83,$00,$09
                    db $15,$04,$16,$04,$17,$04,$18,$04
                    db $19,$04,$08,$98,$00,$09,$19,$44
                    db $18,$44,$17,$44,$16,$44,$15,$44
                    db $08,$A3,$00,$07,$1A,$04,$1B,$04
                    db $1C,$04,$1D,$04,$08,$B9,$00,$07
                    db $1D,$44,$1C,$44,$1B,$44,$1A,$44
                    db $08,$C3,$00,$05,$1E,$04,$1F,$04
                    db $20,$04,$08,$DA,$00,$05,$20,$44
                    db $1F,$44,$1E,$44,$08,$E3,$00,$01
                    db $21,$04,$08,$FC,$00,$01,$21,$44
                    db $09,$03,$C0,$1E,$23,$04,$09,$1C
                    db $C0,$1E,$23,$44,$0A,$42,$C0,$0C
                    db $01,$04,$0A,$5D,$C0,$0C,$01,$44
                    db $09,$A3,$00,$01,$24,$04,$09,$BC
                    db $00,$01,$24,$44,$09,$C2,$00,$03
                    db $25,$04,$26,$04,$09,$DC,$00,$03
                    db $26,$44,$25,$44,$09,$E2,$00,$03
                    db $27,$04,$28,$04,$09,$FC,$00,$03
                    db $28,$44,$27,$44,$0A,$02,$00,$03
                    db $29,$04,$2A,$04,$0A,$1C,$00,$03
                    db $2A,$44,$29,$44,$0B,$03,$00,$01
                    db $2B,$04,$0B,$23,$00,$01,$2C,$04
                    db $0B,$26,$40,$26,$2F,$04,$0B,$46
                    db $40,$2A,$34,$04,$0A,$A4,$80,$0B
                    db $94,$1C,$96,$1C,$80,$10,$82,$10
                    db $84,$10,$86,$10,$0A,$A5,$80,$0B
                    db $95,$1C,$97,$1C,$81,$10,$83,$10
                    db $85,$10,$87,$10,$0B,$47,$00,$03
                    db $A0,$1C,$A1,$1C,$0B,$59,$00,$03
                    db $A0,$1C,$A1,$1C,$0B,$09,$80,$03
                    db $B2,$1C,$B4,$1C,$0B,$0A,$80,$03
                    db $B3,$1C,$B5,$1C,$0A,$F4,$00,$03
                    db $90,$1C,$91,$1C,$0B,$14,$00,$05
                    db $92,$1C,$93,$1C,$9F,$18,$0A,$F7
                    db $80,$07,$88,$18,$8A,$18,$8C,$18
                    db $8E,$18,$0A,$F8,$80,$07,$89,$18
                    db $8B,$18,$8D,$18,$8F,$18,$0A,$DA
                    db $80,$07,$A2,$0C,$A4,$0C,$A6,$0C
                    db $A8,$0C,$0A,$DB,$80,$07,$A3,$0C
                    db $A5,$0C,$A7,$0C,$A9,$0C,$0A,$DC
                    db $80,$07,$AA,$14,$AC,$14,$AE,$14
                    db $B0,$14,$0A,$DD,$80,$07,$AB,$14
                    db $AD,$14,$AF,$14,$B1,$14,$0B,$0D
                    db $00,$05,$98,$04,$2D,$04,$2E,$04
                    db $0B,$10,$00,$05,$2E,$44,$2D,$44
                    db $98,$44,$0B,$2C,$00,$07,$30,$04
                    db $31,$04,$32,$04,$33,$04,$0B,$30
                    db $00,$07,$33,$44,$32,$44,$31,$44
                    db $30,$44,$0B,$4F,$40,$03,$BE,$04
                    db $FF

DATA_15E660:        db $0C,$CD,$00,$0B,$C0,$08,$C1
                    db $08,$C2,$08,$C3,$08,$C4,$08,$C5
                    db $08,$0C,$ED,$00,$0B,$D0,$08,$D1
                    db $08,$D2,$08,$D3,$08,$D4,$08,$D5
                    db $08,$0D,$0D,$00,$0B,$E0,$08,$E1
                    db $08,$E2,$08,$E3,$08,$E4,$08,$E5
                    db $08,$0D,$CA,$00,$0B,$C0,$08,$C1
                    db $08,$BD,$09,$BD,$09,$EC,$08,$ED
                    db $08,$0D,$EA,$00,$0B,$D0,$08,$F4
                    db $08,$CD,$08,$CE,$08,$CF,$08,$EB
                    db $08,$0E,$0A,$00,$0B,$E0,$08,$F5
                    db $08,$DD,$08,$DE,$08,$DF,$08,$FB
                    db $08,$0D,$94,$00,$05,$C6,$00,$C7
                    db $00,$C8,$00,$0D,$B4,$00,$05,$D6
                    db $00,$D7,$00,$D8,$00,$0D,$D3,$00
                    db $07,$C9,$00,$CA,$00,$CB,$00,$CC
                    db $00,$0D,$F3,$00,$07,$D9,$00,$DA
                    db $00,$DB,$00,$DC,$00,$0E,$13,$00
                    db $09,$E6,$00,$E7,$00,$E8,$00,$E9
                    db $00,$EA,$00,$0E,$33,$00,$09,$F6
                    db $00,$F7,$00,$F8,$00,$F9,$00,$FA
                    db $00,$0E,$54,$00,$07,$F0,$00,$F1
                    db $00,$F2,$00,$F3,$00,$FF

DATA_15E715:        db $00,$00,$FF,$7F,$00,$00,$96,$28
                    db $1A,$39,$9E,$49,$1F,$5A,$14,$00
                    db $1A,$00,$DF,$00,$DF,$01,$9C,$73
                    db $29,$25,$AD,$35,$31,$46,$B5,$56

DATA_15E735:        db $00,$00,$9F,$03,$00,$00,$0B,$00
                    db $0F,$00,$13,$00,$17,$00,$1B,$00
                    db $1F,$00,$2F,$09,$36,$2A,$DB,$3E
                    db $7F,$4F,$99,$01,$3B,$02,$DD,$02

DATA_15E755:        db $00,$00,$FF,$7F,$00,$00,$18,$63
                    db $EF,$3D,$7F,$1B,$FF,$12,$5F,$12
                    db $BF,$15,$1D,$3B,$58,$1E,$31,$7F
                    db $8D,$76,$C4,$75,$95,$15,$F0,$00

DATA_15E775:        db $00,$00,$FF,$7F,$00,$00,$13,$01
                    db $1C,$1A,$9C,$2D,$BF,$3A,$96,$10
                    db $DF,$14,$E5,$48,$E7,$49,$0D,$5B
                    db $2F,$09,$36,$2A,$D8,$3E,$7F,$4F

DATA_15E795:        db $00,$00,$FF,$7F,$00,$00,$13,$01
                    db $1C,$1A,$9C,$2D,$BF,$3A,$69,$3A
                    db $91,$5B,$88,$50,$6F,$6D,$56,$7E
                    db $2F,$09,$36,$2A,$DB,$3E,$1B,$00

DATA_15E7B5:        db $00,$00,$FF,$7F,$00,$00,$30,$01
                    db $1B,$00,$9C,$2D,$BF,$3A,$7A,$02
                    db $9F,$03,$96,$28,$5F,$49,$9F,$6E
                    db $2F,$09,$36,$2A,$DB,$3E,$7F,$4F

DATA_15E7D5:        db $00,$00,$FF,$7F,$00,$00,$E8,$69
                    db $CF,$7E,$9C,$2D,$BF,$3A,$2F,$09
                    db $1C,$2F,$12,$00,$D9,$18,$1F,$19
                    db $36,$2A,$DB,$3E,$7F,$4F,$1B,$00

DATA_15E7F5:        db $00,$00,$FF,$7F,$00,$00,$86,$49
                    db $0A,$5E,$D0,$72,$DB,$3E,$7F,$4F
                    db $47,$21,$2F,$09,$0D,$00,$13,$00
                    db $19,$00,$A5,$11,$C4,$1A,$CC,$3F

DATA_15E815:        db $00,$00,$FF,$7F,$00,$00,$BF,$7F
                    db $84,$10,$7F,$1B,$FF,$12,$5F,$12
                    db $BF,$15,$88,$25,$B6,$7F,$31,$7F
                    db $8D,$76,$C4,$75,$20,$5D,$80,$44

DATA_15E835:        db $DC,$15,$DD,$15,$D8,$15,$DB,$15
                    db $E2,$15

PNTR_15E83F:        db $E8,$E8,$E8,$E8,$E9,$E9,$E9,$E9      ; \ High byte of pointer to the "Story" tilemap.
                    db $E9,$E9,$E9,$E9,$EA,$EA,$EA,$EA      ;  | Indexed by line number.
                    db $EA                                  ; / Tables only contain tile data, not location.

PNTR_15E850:        db $61,$89,$B1,$D9,$01,$29,$51,$79      ; \ Low byte of pointer to the "Story" tilemap.
                    db $79,$A1,$C9,$F1,$19,$41,$69,$91      ;  | Indexed by line number.
                    db $B9                                  ; / Tables only contain tile data, not location.

                    db $E0,$15,$D1,$15,$CE,$15,$D7,$15      ; \
                    db $BD,$09,$BD,$09,$D6,$15,$CA,$15      ;  |
                    db $DB,$15,$D2,$15,$D8,$15,$BD,$09      ;  | Line 1, page 1, of story data.
                    db $D8,$15,$D9,$15,$CE,$15,$D7,$15      ;  |
                    db $CE,$15,$CD,$15,$BD,$09,$CA,$15      ; /

                    db $CD,$15,$D8,$15,$D8,$15,$DB,$15      ; \
                    db $BD,$09,$CA,$15,$CF,$15,$DD,$15      ;  |
                    db $CE,$15,$DB,$15,$BD,$09,$BD,$09      ;  | Line 2, page 1, of story data.
                    db $CC,$15,$D5,$15,$D2,$15,$D6,$15      ;  |
                    db $CB,$15,$D2,$15,$D7,$15,$D0,$15      ; /

                    db $CA,$15,$BD,$09,$D5,$15,$D8,$15      ; \
                    db $D7,$15,$D0,$15,$BD,$09,$DC,$15      ;  |
                    db $DD,$15,$CA,$15,$D2,$15,$DB,$15      ;  | Line 3, page 1, of story data.
                    db $BD,$09,$D2,$15,$D7,$15,$BD,$09      ;  |
                    db $BD,$09,$D1,$15,$D2,$15,$DC,$15      ; /

                    db $CD,$15,$DB,$15,$CE,$15,$CA,$15      ; \
                    db $D6,$15,$E7,$15,$BD,$09,$CA,$15      ;  |
                    db $D7,$15,$D8,$15,$DD,$15,$D1,$15      ;  | Line 4, page 1, of story data.
                    db $CE,$15,$DB,$15,$BD,$09,$E0,$15      ;  |
                    db $D8,$15,$DB,$15,$D5,$15,$CD,$15      ; /

                    db $DC,$15,$D9,$15,$DB,$15,$CE,$15      ; \
                    db $CA,$15,$CD,$15,$BD,$09,$BD,$09      ;  |
                    db $BD,$09,$CB,$15,$CE,$15,$CF,$15      ;  | Line 5, page 1, of story data.
                    db $D8,$15,$DB,$15,$CE,$15,$BD,$09      ;  |
                    db $BD,$09,$D1,$15,$D2,$15,$D6,$15      ; /

                    db $CA,$15,$D7,$15,$CD,$15,$BD,$09      ; \
                    db $D1,$15,$CE,$15,$BD,$09,$D1,$15      ;  |
                    db $CE,$15,$CA,$15,$DB,$15,$CD,$15      ;  | Line 6, page 1, of story data.
                    db $BD,$09,$CA,$15,$BD,$09,$DF,$15      ;  |
                    db $D8,$15,$D2,$15,$CC,$15,$CE,$15      ; /

                    db $CC,$15,$CA,$15,$D5,$15,$D5,$15      ; \
                    db $BD,$09,$CF,$15,$D8,$15,$DB,$15      ;  |
                    db $BD,$09,$D1,$15,$CE,$15,$D5,$15      ;  | Line 7, page 1, of story data.
                    db $D9,$15,$BD,$09,$DD,$15,$D8,$15      ;  |
                    db $BD,$09,$BD,$09,$CB,$15,$CE,$15      ; /

                    db $BD,$09,$CF,$15,$DB,$15,$CE,$15      ; \
                    db $CE,$15,$CD,$15,$BD,$09,$BD,$09      ;  |
                    db $CF,$15,$DB,$15,$D8,$15,$D6,$15      ;  | Line 8, page 1, of story data.
                    db $BD,$09,$CA,$15,$BD,$09,$DC,$15      ;  |
                    db $D9,$15,$CE,$15,$D5,$15,$D5,$15      ; /

                    db $CA,$15,$CF,$15,$DD,$15,$CE,$15      ; \
                    db $DB,$15,$BD,$09,$BD,$09,$CA,$15      ;  |
                    db $E0,$15,$CA,$15,$D4,$15,$CE,$15      ;  | Line 1, page 2, of story data.
                    db $D7,$15,$D2,$15,$D7,$15,$D0,$15      ;  |
                    db $E7,$15,$BD,$09,$BD,$09,$BD,$09      ; /

                    db $D6,$15,$CA,$15,$DB,$15,$D2,$15      ; \
                    db $D8,$15,$BD,$09,$BD,$09,$E0,$15      ;  |
                    db $CE,$15,$D7,$15,$DD,$15,$BD,$09      ;  | Line 2, page 2, of story data.
                    db $DD,$15,$D8,$15,$BD,$09,$BD,$09      ;  |
                    db $CA,$15,$BD,$09,$BD,$09,$BD,$09      ; /

                    db $CC,$15,$CA,$15,$DF,$15,$CE,$15      ; \
                    db $BD,$09,$BD,$09,$D7,$15,$CE,$15      ;  |
                    db $CA,$15,$DB,$15,$CB,$15,$E2,$15      ;  | Line 3, page 2, of story data.
                    db $BD,$09,$CA,$15,$D7,$15,$CD,$15      ;  |
                    db $BD,$09,$BD,$09,$DD,$15,$D8,$15      ; /

                    db $D1,$15,$D2,$15,$DC,$15,$BD,$09      ; \
                    db $BD,$09,$DC,$15,$DE,$15,$DB,$15      ;  |
                    db $D9,$15,$DB,$15,$D2,$15,$DC,$15      ;  | Line 4, page 2, of story data.
                    db $CE,$15,$BD,$09,$D1,$15,$CE,$15      ;  |
                    db $BD,$09,$DC,$15,$CA,$15,$E0,$15      ; /

                    db $CE,$15,$E1,$15,$CA,$15,$CC,$15      ; \
                    db $DD,$15,$D5,$15,$E2,$15,$BD,$09      ;  |
                    db $BD,$09,$E0,$15,$D1,$15,$CA,$15      ;  | Line 5, page 2, of story data.
                    db $DD,$15,$BD,$09,$D1,$15,$CE,$15      ;  |
                    db $BD,$09,$DC,$15,$CA,$15,$E0,$15      ; /

                    db $D2,$15,$D7,$15,$BD,$09,$D1,$15      ; \
                    db $D2,$15,$DC,$15,$BD,$09,$CD,$15      ;  |
                    db $DB,$15,$CE,$15,$CA,$15,$D6,$15      ;  | Line 6, page 2, of story data.
                    db $E8,$15,$E8,$15,$E8,$15,$E8,$15      ;  |
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ; /

                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ; \
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ;  |
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ;  | Line 7, page 2, of story data.
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ;  | (Empty line.)
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ; /

                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ; \
                    db $BD,$09,$D9,$15,$DE,$15,$DC,$15      ;  |
                    db $D1,$15,$BD,$09,$BD,$09,$DC,$15      ;  | Line 8, page 2, of story data.
                    db $DD,$15,$CA,$15,$DB,$15,$DD,$15      ;  |
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09      ; /

DATA_15EAE1:        db $02,$49,$80,$07,$88,$0D,$98,$0D
                    db $A8,$0D,$B8,$0D,$02,$4A,$80,$07
                    db $88,$4D,$98,$4D,$A8,$4D,$B8,$4D

                    db $02,$4D,$80,$07,$A9,$11,$B9,$11
                    db $8D,$11,$9D,$11,$02,$4E,$80,$07
                    db $A9,$51,$B9,$51,$8D,$51,$9D,$51

                    db $02,$51,$80,$07,$BD,$09,$B0,$19
                    db $AA,$19,$BA,$19,$02,$52,$80,$07
                    db $BD,$09,$B0,$59,$AA,$59,$BA,$59

                    db $02,$55,$80,$07,$A4,$15,$B4,$15
                    db $A5,$15,$B5,$15,$02,$56,$80,$07
                    db $A4,$55,$B4,$55,$A5,$55,$B5,$55

DATA_15EB41:        db $02,$49,$80,$07,$88,$0D,$98,$0D
                    db $89,$0D,$99,$0D,$02,$4A,$80,$07
                    db $8A,$0D,$9A,$0D,$8B,$0D,$9B,$0D
                    db $02,$4D,$80,$07,$8C,$11,$9C,$11
                    db $8D,$11,$9D,$11,$02,$4E,$80,$07
                    db $8E,$11,$9E,$11,$8F,$11,$9F,$11
                    db $02,$51,$80,$07,$BD,$09,$B0,$19
                    db $A1,$19,$B1,$19,$02,$52,$80,$07
                    db $BD,$09,$B2,$19,$A3,$19,$B3,$19
                    db $02,$55,$80,$07,$AB,$15,$BB,$15
                    db $A5,$15,$B5,$15,$02,$56,$80,$07
                    db $A6,$15,$B6,$15,$A7,$15,$B7,$15

DATA_15EBA1:        db $00,$48,$30,$18

DATA_15EBA5:        db $81,$83,$83,$85,$83,$83,$87,$85
                    db $8D,$87,$81,$81,$81,$83,$83,$83
                    db $87,$81,$8D,$83,$87,$81,$81,$83
                    db $83,$83,$8F,$06,$8B,$8B,$83,$8B
                    db $82,$8B,$8B,$83,$85,$89,$8D,$83
                    db $83,$8F,$8B,$8B,$8B,$86,$CB,$CB
                    db $CB,$CB,$89,$89,$81,$82,$82,$82
                    db $87,$89,$82,$8F,$82,$82,$82,$83
                    db $82,$0D,$86,$86,$82,$83,$80

DATA_15EBEC:        db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$06,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00

DATA_15EC33:        db $03,$09,$00,$1F,$CE,$15,$E1,$15
                    db $DD,$15,$DB,$15,$CA,$15,$BD,$09
                    db $D5,$15,$D2,$15,$CF,$15,$CE,$15
                    db $E8,$15,$E8,$15,$E8,$15,$BD,$09
                    db $BD,$09,$C0,$15

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty data.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF                                  ; /

PNTR_15EF00:        dl DATA_15EF15                          ; World 1, grassy image. (Images during 'World x-x' screen.)
                    dl DATA_15F0A5                          ; World 2, desert image.
                    dl DATA_15EF15                          ; World 3, grassy image.
                    dl DATA_15F235                          ; World 4, ice image.
                    dl DATA_15EF15                          ; World 5, grassy image.
                    dl DATA_15F0A5                          ; World 6, desert image.
                    dl DATA_15F3C5                          ; World 7, air image.

DATA_15EF15:        db $FF,$00,$FF,$00,$46,$04,$47,$04      ; \ The entire image of the grassland...
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | ...shown in the intro screen.
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | This applies to 3 worlds: Worlds 1, 3 and 5.
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | Format is tttttttt YXPCCCTT.
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | Odd bytes indicating tile number, even bytes indicating properties.
                    db $FF,$00,$FF,$00,$56,$04,$57,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$00,$1C,$01,$1C,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$42,$04,$43,$04      ;  |
                    db $44,$04,$43,$04,$44,$04,$43,$04      ;  |
                    db $44,$04,$45,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$52,$04,$53,$04      ;  |
                    db $54,$04,$53,$04,$54,$04,$53,$04      ;  |
                    db $54,$04,$55,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$52,$04,$53,$04      ;  |
                    db $54,$04,$53,$04,$54,$04,$53,$04      ;  |
                    db $54,$04,$55,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$00,$1C,$01,$1C      ;  |
                    db $FF,$00,$FF,$00,$52,$04,$53,$04      ;  |
                    db $54,$04,$53,$04,$54,$04,$53,$04      ;  |
                    db $54,$04,$55,$04,$FF,$00,$FF,$00      ;  |
                    db $40,$08,$41,$08,$40,$08,$41,$08      ;  |
                    db $40,$08,$41,$08,$40,$08,$41,$08      ;  |
                    db $40,$08,$41,$08,$40,$08,$41,$08      ;  |
                    db $40,$08,$41,$08,$40,$08,$41,$08      ;  |
                    db $40,$08,$41,$08,$40,$08,$41,$08      ;  |
                    db $50,$08,$51,$08,$50,$08,$51,$08      ;  |
                    db $50,$08,$51,$08,$50,$08,$51,$08      ;  |
                    db $50,$08,$51,$08,$50,$08,$51,$08      ;  |
                    db $50,$08,$51,$08,$50,$08,$51,$08      ;  |
                    db $50,$08,$51,$08,$50,$08,$51,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ; /

DATA_15F0A5:        db $FF,$00,$FF,$00,$46,$04,$47,$04      ; \
                    db $FF,$00,$FF,$00,$66,$04,$FF,$00      ;  | The entire image of the desert...
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | ...shown in the intro screen.
                    db $FF,$00,$FF,$00,$76,$04,$FF,$00      ;  | Applies to worlds 2 and 6.
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$56,$04,$57,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$66,$04,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$76,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$64,$04,$62,$08,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $76,$04,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $73,$04,$74,$04,$72,$08,$63,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$73,$04      ;  |
                    db $75,$04,$74,$04,$72,$08,$65,$08      ;  |
                    db $63,$08,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$00,$1C,$01,$1C      ;  |
                    db $FF,$00,$FF,$00,$73,$04,$75,$04      ;  |
                    db $75,$04,$74,$04,$72,$08,$65,$08      ;  |
                    db $65,$08,$63,$08,$FF,$00,$FF,$00      ;  |
                    db $60,$08,$61,$08,$60,$08,$61,$08      ;  |
                    db $60,$08,$61,$08,$60,$08,$61,$08      ;  |
                    db $60,$08,$61,$08,$60,$08,$61,$08      ;  |
                    db $60,$08,$61,$08,$60,$08,$61,$08      ;  |
                    db $60,$08,$61,$08,$60,$08,$61,$08      ;  |
                    db $70,$08,$71,$08,$70,$08,$71,$08      ;  |
                    db $70,$08,$71,$08,$70,$08,$71,$08      ;  |
                    db $70,$08,$71,$08,$70,$08,$71,$08      ;  |
                    db $70,$08,$71,$08,$70,$08,$71,$08      ;  |
                    db $70,$08,$71,$08,$70,$08,$71,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ; /

DATA_15F235:        db $FF,$00,$FF,$00,$46,$04,$47,$04      ; \
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | The entire image of the ice world...
                    db $67,$08,$77,$08,$FF,$00,$FF,$00      ;  | ...shown in the intro screen.
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  | Applies merely to world 4.
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$56,$04,$57,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$00,$1C,$01,$1C,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$4C,$04,$4D,$04      ;  |
                    db $4E,$04,$4D,$04,$4E,$04,$4D,$04      ;  |
                    db $4E,$04,$4F,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$5C,$04,$5D,$04      ;  |
                    db $5E,$04,$5D,$04,$5E,$04,$5D,$04      ;  |
                    db $5E,$04,$5F,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$5C,$04,$5D,$04      ;  |
                    db $5E,$04,$5D,$04,$5E,$04,$5D,$04      ;  |
                    db $5E,$04,$5F,$04,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$48,$08,$49,$08      ;  |
                    db $FF,$00,$FF,$00,$00,$1C,$01,$1C      ;  |
                    db $FF,$00,$FF,$00,$5C,$04,$5D,$04      ;  |
                    db $5E,$04,$5D,$04,$5E,$04,$5D,$04      ;  |
                    db $5E,$04,$5F,$04,$FF,$00,$FF,$00      ;  |
                    db $4A,$08,$4B,$08,$4A,$08,$4B,$08      ;  |
                    db $4A,$08,$4B,$08,$4A,$08,$4B,$08      ;  |
                    db $4A,$08,$4B,$08,$4A,$08,$4B,$08      ;  |
                    db $4A,$08,$4B,$08,$4A,$08,$4B,$08      ;  |
                    db $4A,$08,$4B,$08,$4A,$08,$4B,$08      ;  |
                    db $5A,$08,$5B,$08,$5A,$08,$5B,$08      ;  |
                    db $5A,$08,$5B,$08,$5A,$08,$5B,$08      ;  |
                    db $5A,$08,$5B,$08,$5A,$08,$5B,$08      ;  |
                    db $5A,$08,$5B,$08,$5A,$08,$5B,$08      ;  |
                    db $5A,$08,$5B,$08,$5A,$08,$5B,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $58,$08,$59,$08,$58,$08,$59,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ;  |
                    db $59,$08,$58,$08,$59,$08,$58,$08      ; /

DATA_15F3C5:        db $FF,$00,$FF,$00,$7C,$04,$7D,$04      ; \
                    db $FF,$00,$FF,$00,$FF,$00,$67,$08      ;  | The entire image of the sky world...
                    db $77,$08,$FF,$00,$68,$08,$69,$08      ;  | ...shown in the intro screen.
                    db $6A,$08,$69,$08,$6A,$08,$69,$08      ;  | Applies merely to world 7.
                    db $6A,$08,$6B,$08,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$7E,$04,$7F,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$78,$08,$79,$08      ;  |
                    db $7A,$08,$79,$08,$7A,$08,$79,$08      ;  |
                    db $7A,$08,$7B,$08,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$7E,$04,$7F,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$6C,$08,$6D,$08      ;  |
                    db $6E,$08,$6D,$08,$6E,$08,$6D,$08      ;  |
                    db $6E,$08,$6F,$08,$BF,$00,$BF,$00      ;  |
                    db $FF,$00,$FF,$00,$7E,$04,$7F,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$6C,$08,$6D,$08      ;  |
                    db $6E,$08,$6D,$08,$6E,$08,$6D,$08      ;  |
                    db $6E,$08,$6F,$08,$BF,$00,$BF,$00      ;  |
                    db $FF,$00,$FF,$00,$7E,$04,$7F,$04      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$6C,$08,$6D,$08      ;  |
                    db $6E,$08,$6D,$08,$6E,$08,$6D,$08      ;  |
                    db $6E,$08,$6F,$08,$BF,$00,$BF,$00      ;  |
                    db $FF,$00,$FF,$00,$7E,$04,$7F,$04      ;  |
                    db $FF,$00,$FF,$00,$00,$1C,$01,$1C      ;  |
                    db $FF,$00,$FF,$00,$6C,$08,$6D,$08      ;  |
                    db $6E,$08,$6D,$08,$6E,$08,$6D,$08      ;  |
                    db $6E,$08,$6F,$08,$BF,$00,$BF,$00      ;  |
                    db $1B,$14,$1F,$14,$1D,$14,$1F,$14      ;  |
                    db $1D,$14,$1F,$14,$1D,$14,$1F,$14      ;  |
                    db $1D,$14,$1F,$14,$1D,$14,$1F,$14      ;  |
                    db $1D,$14,$1F,$14,$1D,$14,$1F,$14      ;  |
                    db $1D,$14,$1F,$14,$1D,$14,$21,$14      ;  |
                    db $1C,$14,$20,$14,$1E,$14,$20,$14      ;  |
                    db $1E,$14,$20,$14,$1E,$14,$20,$14      ;  |
                    db $1E,$14,$20,$14,$1E,$14,$20,$14      ;  |
                    db $1E,$14,$20,$14,$1E,$14,$20,$14      ;  |
                    db $1E,$14,$20,$14,$1E,$14,$22,$14      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ;  |
                    db $FF,$00,$FF,$00,$FF,$00,$FF,$00      ; /

DATA_15F555:        db $B4,$7F,$9F,$03,$00,$00,$0B,$00
                    db $0F,$00,$13,$00,$17,$00,$1B,$00
                    db $1F,$00,$C0,$15,$62,$2A,$05,$3F
                    db $AA,$53,$99,$01,$3B,$02,$DD,$02

DATA_15F575:        db $B4,$7F,$FF,$7F,$00,$00,$07,$02
                    db $AC,$0A,$52,$1B,$FF,$12,$5F,$12
                    db $BF,$15,$F9,$33,$9E,$26,$31,$7F
                    db $8D,$76,$C4,$75,$96,$01,$1A,$02

DATA_15F595:        db $B4,$7F,$FF,$7F,$00,$00,$37,$08
                    db $BF,$10,$1F,$06,$82,$59,$00,$00
                    db $4D,$6D,$13,$76,$76,$7A,$1B,$7F
                    db $0F,$11,$E4,$65,$47,$76,$2D,$7F

                    db $F5,$7E,$9F,$03,$00,$00,$0B,$00
                    db $0F,$00,$13,$00,$17,$00,$1B,$00
                    db $1F,$00,$CE,$7E,$52,$7F,$D6,$7F
                    db $FF,$7F,$99,$01,$3B,$02,$DD,$02

                    db $F5,$7E,$FF,$7F,$00,$00,$07,$02
                    db $AC,$0A,$52,$1B,$FF,$12,$5F,$12
                    db $BF,$15,$F9,$33,$9E,$26,$31,$7F
                    db $8D,$76,$C4,$75,$96,$01,$1A,$02

                    db $F5,$7E,$FF,$7F,$00,$00,$37,$08
                    db $BF,$10,$1F,$06,$82,$59,$00,$00
                    db $4D,$6D,$13,$76,$76,$7A,$1B,$7F
                    db $0F,$11,$E4,$65,$47,$76,$2D,$7F

                    db $F5,$7E,$9F,$03,$00,$00,$0B,$00
                    db $0F,$00,$13,$00,$17,$00,$1B,$00
                    db $1F,$00,$30,$3E,$93,$4A,$F6,$56
                    db $59,$63,$99,$01,$3B,$02,$DD,$02

                    db $F5,$7E,$FF,$7F,$00,$00,$07,$02
                    db $AC,$0A,$52,$1B,$FF,$12,$5F,$12
                    db $BF,$15,$F9,$33,$9E,$26,$31,$7F
                    db $8D,$76,$C4,$75,$54,$01,$1A,$02

                    db $F5,$7E,$FF,$7F,$00,$00,$37,$08
                    db $BF,$10,$1F,$06,$82,$59,$00,$00
                    db $4D,$6D,$13,$76,$76,$7A,$1B,$7F
                    db $0F,$11,$E4,$65,$47,$76,$2D,$7F

PNTR_15F675:        dl DATA_15F67E
                    dl DATA_15F83E
                    dl DATA_15FB1E

DATA_15F67E:        db $38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8

DATA_15F83E:        db $38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$30,$D0,$30,$D0,$30,$D0,$30
                    db $D0,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$08,$F8,$08,$F8,$08,$F8,$08
                    db $F8,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00

DATA_15FB1E:        db $38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$38,$C8,$38,$C8,$38,$C8,$38
                    db $C8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$28,$D8,$28,$D8,$28,$D8,$28
                    db $D8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$18,$E8,$18,$E8,$18,$E8,$18
                    db $E8,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$08,$FF,$08,$FF,$08,$FF,$08
                    db $FF,$18,$E0,$18,$E0,$18,$E0,$18
                    db $E0,$18,$E0,$18,$E0,$18,$E0,$18
                    db $E0,$18,$E0,$18,$E0,$18,$E0,$18
                    db $E0,$18,$E0,$18,$E0,$18,$E0,$18
                    db $E0,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00,$FF,$00,$FF,$00,$FF,$00,$FF
                    db $00