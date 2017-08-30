; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $208000
    fillbyte $FF : fill   $8000

ORG $208000
CODE_208000:        JMP.w CODE_20A116           

CODE_208003:        JMP.w CODE_20F000         ;Entry point of SMB3's NMI

CODE_208006:        JMP.w CODE_20F304         ;Entry point of SMB3's IRQ

                    db $20,$20,$21,$21,$22,$22,$23,$23
                    db $24,$24,$25,$25,$26,$26,$27,$27
                    db $28,$28,$29,$29,$2A,$2A                   

CODE_20801F:        LDA.b $28                   
                    STA.b $36                   
                    ASL   A                     
                    CLC                         
                    ADC.b $36                   
                    TAY                         
                    PHB                         
                    LDA.b #$22                  
                    PHA                         
                    PLB                         
                    LDA   PNTR_228B5C,y               
                    STA.b $36                   
                    LDA   PNTR_228B5C+1,y               
                    STA.b $37                   
                    LDA   PNTR_228B5C+2,y               
                    STA.b $38                   
                    PLB                         
                    LDA.b #$01                  
                    STA.b $1C                   
                    STZ.w $0154                 
CODE_208044:        LDA.w $0154                 
                    BPL   CODE_208044           
                    STZ.b $1C                   
                    CLI                         
                    RTS                         

CODE_20804D:        JSR.w CODE_20801F           
                    RTL                         

CODE_208051:        LDA.b #$1F                  
                    STA.l $7E3968               
                    LDA.b #$40                  
                    STA.l $7E3969               
                    LDA.b #$01                  
                    STA.w $1503                 
                    STZ.w $0103                 
                    LDA.b #$00                  
                    STA.l $7FFF03               
                    LDA.b #$FF                  
                    STA.l $001602               
                    STA.l $001603               
                    LDA.b #$02                  
                    STA.b $36                   
                    LDA.b #$16                  
                    STA.b $37                   
                    INC.w $0154                 
                    LDA.b #$81                  
                    STA.w $4200                 
                    STA.w $2100                 
                    STA.b $16                   
                    JSL.l CODE_22E0A9           
                    JSR.w CODE_20F9EB           
                    LDA.b #$5C                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    LDA.b #$20                  
                    STA.w $0100                 
                    STA.w $0101                 
                    LDA.b #$01                  
                    STA.w $02D7                 
                    LDA.b #$15                  
                    STA.w $1202                 
                    JSR.w CODE_20B0FE           
                    LDA.w $072B                 
                    CMP.b #$03                  
                    BNE   CODE_2080B9           
                    JMP.w CODE_20A2D0           

CODE_2080B9:        JSL.l CODE_29A700           
                    STZ.w $0729                 
                    STZ.w $07E3                 
                    STZ.w $1F2F                 
                    LDA.b #$00                  
                    STA.l $7E396E               
                    STA.l $7E396F               
                    LDA.b #$F8                  
                    STA.b $95                   
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
                    LDX.b #$7F                  
CODE_2080DF:        STZ.w $1D00,x               
                    DEX                         
                    BPL   CODE_2080DF           
CODE_2080E5:        STZ.w $4200                 
                    LDA.w $1503                 
                    BEQ   CODE_2080F1           
                    JSL.l CODE_008B63           
CODE_2080F1:        STZ.w $1503                 
                    JSL.l CODE_22E0A9           
                    JSR.w CODE_20F9EB           
                    LDA.b #$FF                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    LDA.b #$0B                  
                    STA.w $070B                 
                    LDA.b #$35                  
                    STA.w $070C                 
                    STZ.w $070A                 
                    STZ.w $072C                 
                    STZ.w $053C                 
                    STZ.w $0101                 
                    STZ.w $0351                 
                    STZ.w $02CC                 
                    STZ.w $02CD                 
                    STZ.w $02CE                 
                    STZ.w $02CF                 
                    STZ.w $0243                 
                    STZ.w $02D9                 
                    STZ.w $02E0                 
                    STZ.w $02E1                 
                    LDA.b #$00                  
                    STA.l $7E3955               
                    STA.l $7FC522               
                    STA.l $7FC523               
                    STZ.w $1CF2                 
                    LDA.b #$FF                  
                    STA.w $07BF                 
                    LDA.b #$04                  
                    STA.w $070E                 
                    STA.w $069A                 
                    LDA.b #$28                  
                    STA.w $05F1                 
                    LDA.b #$03                  
                    STA.w $0699                 
                    LDA.b #$C0                  
                    STA.w $0100                 
                    LDA.b #$1F                  
                    LDX.w $0726                 
                    BEQ   CODE_20816C           
                    CLC                         
                    ADC.b #$23                  
CODE_20816C:        TAY                         
                    LDX.b #$00                  
CODE_20816F:        LDA.w $1D80,y               
                    STA.w $0715,x               
                    INY                         
                    INX                         
                    CPX.b #$03                  
                    BNE   CODE_20816F           
                    LDX.w $072B                 
                    DEX                         
CODE_20817F:        LDA.l $7E3975,x             
                    STA.b $43,x                 
                    LDA.l $7E3977,x             
                    STA.b $45,x                 
                    LDA.l $7E3979,x             
                    STA.b $47,x                 
                    LDA.l $7E397B,x             
                    STA.b $52,x                 
                    LDA.b #$20                  
                    STA.b $4D,x                 
                    DEX                         
                    BPL   CODE_20817F           
                    STZ.w $070A                 
                    STZ.w $0728                 
                    STZ.b $20                   
                    STZ.b $9A                   
                    STZ.b $59                   
                    STZ.w $0711                 
                    LDA.w $0103                 
                    BEQ   CODE_2081B5           
                    JMP.w CODE_208251           

CODE_2081B5:        REP   #$20                  
                    LDA.l $7FFB02               
                    STA.w $0736                 
                    LDX.b #$1A                  
CODE_2081C0:        LDA.l $7FFBBC,x             
                    STA.w $1D80,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2081C0           
                    LDX.b #$3D                  
CODE_2081CD:        LDA.l $7FFBBC,x             
                    STA.w $1D80,x               
                    DEX                         
                    DEX                         
                    CPX.b #$21                  
                    BNE   CODE_2081CD           
                    SEP   #$20                  
                    LDA.l $7FFB00               
                    CMP.l $7FFF02               
                    BEQ   CODE_2081E9           
                    JMP.w CODE_20824E           
CODE_2081E9:        LDA.l $7FFC02               
                    STA.l $7E3971               
                    REP   #$30                  
                    LDX.w #$0036                
CODE_2081F6:        LDA.l $7FFB04,x             
                    STA.w $1EED,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_2081F6           
                    LDX.w #$007E                
CODE_208204:        LDA.l $7FFB3C,x             
                    STA.w $1D00,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_208204           
                    LDX.w #$003E                
                    LDA.w $0727                 
                    AND.w #$00FF                
                    INC   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    DEC   A                     
                    DEC   A                     
                    TAY                         
CODE_208222:        LDA.w $1D00,x               
                    AND.w $8000,y               
                    STA.w $1D00,x               
                    STA.w $1D40,x               
                    DEY                         
                    DEY                         
                    DEX                         
                    DEX                         
                    BPL   CODE_208222           
                    SEP   #$30                  
                    LDA.w $0727                 
                    CMP.b #$02                  
                    BNE   CODE_20824E           
                    LDY.b #$04                  
                    LDA.b #$80                  
                    STA.w $1EED,y               
                    LDA.b #$50                  
                    STA.w $1EFB,y               
                    LDA.b #$01                  
                    STA.w $1F09,y               
CODE_20824E:        INC.w $0103                 
CODE_208251:        JSL.l CODE_22E0A9           
                    JSR.w CODE_20F9EB           
                    LDA.b #$FF                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    LDX.w $0726                 
                    LDA.w $0747,x               
                    STA.w $0429                 
                    LDY.b #$00                  
                    LDA.w $0727                 
                    CMP.b #$07                  
                    BNE   CODE_20827A           
                    LDA.b $45,x                 
                    CMP.b #$02                  
                    BNE   CODE_20827A           
                    INY                         
CODE_20827A:        STY.w $0598                 
                    STZ.w $070F                 
                    LDA.b #$10                  
                    STA.w $0349                 
                    JSL.l CODE_29BE21           
                    JSR.w CODE_209683           
                    LDA.w $05F2                 
                    BNE   CODE_20829A           
                    LDX.w $0726                 
                    LDA.l $7E3992,x             
                    STA.b $4B,x                 
CODE_20829A:        LDY.w $0726                 
                    LDA.w $0722,y               
                    STA.b $B7                   
                    LDA.w $0724,y               
                    JSL.l CODE_2097F5           
                    STZ.b $25                   
                    LDA.b $24                   
                    STA.b $23                   
                    STZ.w $1EBF                 
                    LDA.b #$20                  
                    STA.w $0612                 
                    LDA.b #$02                  
                    JSR.w CODE_209610           
                    JSL.l CODE_20F58C           
                    JSL.l CODE_29EAA5           
                    JSL.l CODE_29E766           
                    JSL.l CODE_29E730           
                    LDA.b #$00                  
                    JSR.w CODE_209610           
                    JSR.w CODE_209CC0           
                    JSR.w CODE_2095B9           
                    JSL.l CODE_2A8B4B           
                    LDY.b #$0D                  
                    LDA.b #$00                  
CODE_2082DF:        STA.w $0500,y               
                    DEY                         
                    BPL   CODE_2082DF           
                    LDA.w $0727                 
                    CMP.b #$08                  
                    BNE   CODE_2082F1           
                    LDA.b #$2D                  
                    JSR.w CODE_209610           
CODE_2082F1:        LDY.w $0726                 
                    LDA.w $0722,y               
                    STA.w $0210                 
                    STA.b $B7                   
                    LDA.w $0724,y               
                    STA.w $0211                 
                    STA.b $12                   
                    LDA.w $0729                 
                    BNE   CODE_208346           
                    LDA.w $05F2                 
                    BNE   CODE_208346           
                    JSL.l CODE_238000           
                    LDX.b #$0E                  
                    LDA.w $0726                 
                    BEQ   CODE_20831A           
                    INX                         
CODE_20831A:        TXA                         
                    JSR.w CODE_209610           
                    JSL.l CODE_238036           
                    LDA.b #$00                  
                    JSR.w CODE_209610           
                    LDX.w $0727                 
                    LDY.w $CA0B,x               
                    CPX.b #$04                  
                    BNE   CODE_20833C           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    BEQ   CODE_20833C           
                    LDY.b #$10                  
                    BRA   CODE_208343           

CODE_20833C:        LDA.w $1F55                 
                    BEQ   CODE_208343           
                    LDY.b #$0E                  
CODE_208343:        STY.w $1202                 
CODE_208346:        STZ.w $05F2                 
                    LDA.b #$EF                  
                    STA.w $0216                 
                    STZ.w $021A                 
                    STZ.w $021B                 
                    LDA.b #$C0                  
                    STA.w $0100                 
                    JSL.l CODE_29BD35           
                    LDA.b #$00                  
                    STA.l $7E3955               
                    JSL.l CODE_29C794           
                    PHB                         
                    REP   #$30                  
                    LDY.w #$14A0                
                    LDX.w #$8B80                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    SEP   #$30                  
                    PLB                         
                    STZ.w $4200                 
                    PHD                         
                    REP   #$20                  
                    LDA.w #$4300                
                    TCD                         
                    LDA.w #$2000                
                    STA.w $2116                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.b $30                   
                    STA.b $40                   
                    STA.b $50                   
                    LDY.b #$08                  
                    LDX.w $0727                 
                    CPX.b #$04                  
                    BNE   CODE_2083CA           
                    LDA.w #$C000                
                    STA.b $32                   
                    LDX.b #$39                  
                    STX.b $34                   
                    LDA.w #$1000                
                    STA.b $35                   
                    STY.w $420B                 
                    LDA.w #$2800                
                    STA.w $2116                 
                    LDA.w #$B000                
                    STA.b $32                   
                    LDX.b #$31                  
                    STX.b $34                   
                    LDA.w #$3000                
                    STA.b $35                   
                    STY.w $420B                 
                    BRA   CODE_2083DB           

CODE_2083CA:        LDA.w #$A000                
                    STA.b $32                   
                    LDX.b #$31                  
                    STX.b $34                   
                    LDA.w #$4000                
                    STA.b $35                   
                    STY.w $420B                 
CODE_2083DB:        LDA.w #$5800                
                    STA.w $2116                 
                    LDA.w #$8000                
                    STA.b $42                   
                    LDX.b #$38                  
                    STX.b $44                   
                    STX.b $54                   
                    LDA.w #$1000                
                    STA.b $45                   
                    LDA.w #$C000                
                    STA.b $52                   
                    LDA.w #$4000                
                    STA.b $55                   
                    LDX.b #$30                  
                    STX.w $420B                 
                    SEP   #$20                  
                    PLD                         
                    LDA.b #$01                  
                    STA.w $020E                 
                    LDA.b #$11                  
                    STA.w $020F                 
                    LDA.b #$09                  
                    STA.w $020C                 
                    STA.w $2105                 
                    LDA.b #$17                  
                    STA.w $0208                 
                    LDA.b #$03                  
                    STA.w $021E                 
                    LDA.b #$80                  
                    STA.w $4200                 
                    LDA.w $0598                 
                    BEQ   CODE_208452           
                    LDA.b #$03                  
                    STA.w $0291                 
                    LDA.w $0729                 
                    BEQ   CODE_208452           
                    JSL.l CODE_2AF9A9           
                    JSL.l CODE_2AFCAA           
CODE_20843B:        LDA.b #$0F                  
                    STA.b $16                   
                    LDA.w $0598                 
                    BEQ   CODE_208452           
                    LDA.w $0729                 
                    BEQ   CODE_208452           
                    LDA.w $028C                 
                    BNE   CODE_208452           
                    JSL.l CODE_2AFCAA           
CODE_208452:        JSR.w CODE_20801F           
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_29BD35           
                    LDA.w $041C                 
                    BNE   CODE_208467           
                    LDA.w $05F2                 
                    BEQ   CODE_208475           
CODE_208467:        JSL.l CODE_29D8E0           
                    JSL.l CODE_2382A3           
                    JSL.l CODE_238C1B           
                    BRA   CODE_20843B           

CODE_208475:        JSL.l CODE_2380AB           
                    LDA.w $0729                 
                    CMP.b #$02                  
                    BCC   CODE_208484           
                    JSL.l CODE_29EAA5           
CODE_208484:        LDY.w $0729                 
                    CPY.b #$0D                  
                    BNE   CODE_208491           
                    LDA.b $59                   
                    CMP.b #$03                  
                    BEQ   CODE_2084A1           
CODE_208491:        CPY.b #$04                  
                    BEQ   CODE_2084A1           
                    CPY.b #$0F                  
                    BCC   CODE_20843B           
                    LDX.w $0726                 
                    LDA.w $073F,x               
                    BEQ   CODE_208516           
CODE_2084A1:        JSL.l CODE_29E2B6           
                    JSR.w CODE_20801F           
                    LDA.b #$80                  
                    STA.b $16                   
                    STZ.w $0293                 
                    STZ.w $020A                 
                    STZ.w $420C                 
                    STZ.w $4200                 
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
                    LDA.b $59                   
                    BNE   CODE_2084CC           
                    LDA.w $0729                 
                    CMP.b #$04                  
                    BNE   CODE_2084CF           
CODE_2084CC:        JMP.w CODE_208251           

CODE_2084CF:        LDX.w $0726                 
                    LDA.w $0210                 
                    STA.w $0722,x               
                    LDA.b $12                   
                    STA.w $0724,x               
                    LDA.b $43,x                 
                    STA.l $7E3975,x             
                    LDA.b $45,x                 
                    STA.l $7E3977,x             
                    LDA.b $47,x                 
                    STA.l $7E3979,x             
                    LDA.b $52,x                 
                    STA.l $7E397B,x             
                    STZ.w $073F,x               
CODE_2084F8:        INX                         
                    STX.w $0726                 
                    CPX.w $072B                 
                    BNE   CODE_208504           
                    STZ.w $0726                 
CODE_208504:        LDA.w $0726                 
                    TAX                         
                    LDA.w $0736,x               
                    BMI   CODE_2084F8           
                    STZ.w $0729                 
                    STZ.w $078C                 
                    JMP.w CODE_2080E5           
CODE_208516:        JSR.w CODE_20801F           
                    LDX.w $0726                 
                    LDA.w $0210                 
                    STA.w $0722,x               
                    LDA.b $12                   
                    STA.w $0724,x               
                    LDA.b $43,x                 
                    STA.l $7E3975,x             
                    LDA.b $45,x                 
                    STA.l $7E3977,x             
                    LDA.b $47,x                 
                    STA.l $7E3979,x             
                    LDA.b $52,x                 
                    STA.l $7E397B,x             
                    STZ.b $20                   
                    STZ.w $104F                 
                    STZ.w $0100                 
                    STZ.w $0728                 
                    JSR.w CODE_2096AA           
                    LDA.b #$03                  
                    STA.w $1047                 
                    STA.w $1049                 
                    STA.w $104A                 
                    LDA.b #$0A                  
                    STA.w $1048                 
                    LDA.b #$C0                  
                    STA.w $104B                 
                    LDA.b #$E0                  
                    STA.w $104E                 
                    LDA.b #$FF                  
                    STA.w $104D                 
                    LDA.b #$1F                  
                    STA.w $1045                 
                    LDA.b #$E0                  
                    STA.w $104C                 
                    LDA.b #$17                  
                    STA.w $1046                 
                    LDX.b #$03                  
CODE_20857D:        LDA.b $24                   
                    AND.b #$0F                  
                    ASL   A                     
                    CLC                         
                    ADC.w $104B,x               
                    STA.w $104B,x               
                    LDA.b $24                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    ORA.w $1047,x               
                    STA.w $1047,x               
                    DEX                         
                    BPL   CODE_20857D           
                    LDX.b #$03                  
                    LDA.b $24                   
                    TAY                         
                    CLC                         
                    ADC.b #$08                  
                    STA.b $00                   
                    AND.b #$10                  
                    BEQ   CODE_2085A8           
                    LDX.b #$07                  
CODE_2085A8:        STX.w $1049                 
                    TYA                         
                    AND.b #$08                  
                    BEQ   CODE_2085BA           
                    LDA.w $104D                 
                    AND.b #$1F                  
                    ORA.b #$E0                  
                    STA.w $104D                 
CODE_2085BA:        LDA.b #$30                  
                    STA.w $1050                 
                    LDA.b #$43                  
                    STA.w $1203                 
                    LDA.b #$80                  
                    STA.w $1202                 
                    LDY.b #$01                  
                    LDA.w $0598                 
                    BEQ   CODE_2085D2           
                    LDY.b #$04                  
CODE_2085D2:        STY.w $0291                 
                    JSL.l CODE_2AF9A9           
CODE_2085D9:        LDA.b #$01                  
                    STA.b $20                   
                    JSL.l CODE_2AFA63           
                    JSR.w CODE_20801F           
                    LDA.w $1050                 
                    BPL   CODE_2085D9           
CODE_2085E9:        JSR.w CODE_20801F           
                    LDA.b $16                   
                    SEC                         
                    SBC.b #$02                  
                    STA.b $16                   
                    BPL   CODE_2085E9           
                    STZ.w $0285                 
                    STZ.w $0291                 
                    STZ.w $0293                 
                    STZ.w $0200                 
                    STZ.w $0201                 
                    STZ.w $0202                 
                    LDA.b #$10                  
                    STA.w $0208                 
                    STA.w $020F                 
                    STZ.w $020A                 
                    LDA.b #$20                  
                    STA.w $0205                 
                    LDA.b #$40                  
                    STA.w $0206                 
                    LDA.b #$80                  
                    STA.w $0207                 
                    LDA.b #$80                  
                    STA.w $2100                 
                    STA.b $16                   
                    JSR.w CODE_20801F           
                    LDA.w $1E                 
                    CMP.b #$03                  
                    BEQ   CODE_20866D           
                    CMP.b #$09                  
                    BEQ   CODE_208680           
                    CMP.b #$0A                  
                    BEQ   CODE_208680           
                    LDA.w $B3                 
                    CMP.b #$BC                  
                    BNE   CODE_208651           
                    LDA.w $0727                 
                    CMP.b #$04                  
                    BNE   CODE_208680           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    BNE   CODE_208660           
                    BRA   CODE_208680           

CODE_208651:        LDA.w $B3                 
                    CMP.b #$50                  
                    BEQ   CODE_208680           
                    CMP.b #$E0                  
                    BEQ   CODE_208680           
                    CMP.b #$E8                  
                    BEQ   CODE_208680           
CODE_208660:        LDA.w $0598                 
                    BEQ   CODE_20866D           
                    LDX.b #$2C                  
CODE_208667:        JSR.w CODE_20801F           
                    DEX                         
                    BNE   CODE_208667           
CODE_20866D:        JSL.l CODE_2A82EA           
                    JSR.w CODE_20801F           
                    STZ.w $4200                 
                    JSL.l CODE_008B47           
                    INC.w $1503                 
                    BRA   CODE_208683           

CODE_208680:        STZ.w $4200                 
CODE_208683:        LDA.b #$11                  
                    STA.w $020F                 
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
CODE_208691:        STZ.b $12                   
                    STZ.w $0210                 
                    STZ.w $0211                 
                    STZ.b $13                   
                    STZ.w $0216                 
                    STZ.w $0217                 
                    STZ.b $23                   
                    STZ.b $24                   
                    STZ.b $25                   
                    LDA.b #$00                  
                    STA.l $7E3966               
                    STA.l $7E3965               
                    STA.l $7E3964               
                    STZ.b $00                   
                    LDX.b #$05                  
                    STX.b $01                   
                    LDY.b #$9D                  
CODE_2086BD:        STA.b ($00),y               
                    DEY                         
                    BNE   CODE_2086BD           
                    STA.b ($00),y               
                    LDA.b $1D                   
                    BEQ   CODE_2086F7           
                    LDA.b $B3                   
                    CMP.b #$BC                  
                    BEQ   CODE_2086F7           
                    LDA.b #$12                  
                    STA.w $070A                 
                    JSR.w CODE_20960F           
                    INC.w $1F26                 
                    LDA.w $1F26                 
                    CMP.b #$0C                  
                    BNE   CODE_2086E5           
                    LDA.b #$00                  
                    STA.w $1F26                 
CODE_2086E5:        ASL   A                     
                    TAX                         
                    LDA.w $A381,x               
                    STA.b $2B                   
                    LDA.w $A382,x               
                    STA.b $2C                   
                    LDA.b #$21                  
                    STA.b $2D                   
                    BRA   CODE_2086FB           

CODE_2086F7:        JSL.l CODE_29BF84           
CODE_2086FB:        LDA.w $0727                 
                    CMP.b #$08                  
                    BNE   CODE_208710           
                    LDA.b #$80                  
                    STA.w $1202                 
                    LDA.w $042A                 
                    STA.w $0727                 
                    JMP.w CODE_2080B9           

CODE_208710:        LDY.w $070A                 
                    LDA.w $C975,y               
                    STA.w $0739                 
                    CPY.b #$07                  
                    BNE   CODE_20873C           
                    LDA.b $31                   
                    STA.w $0420                 
                    LDA.b $32                   
                    STA.w $0421                 
                    LDA.b #$E3                  
                    STA.b $31                   
                    STA.w $023A                 
                    LDA.b #$E5                  
                    STA.b $32                   
                    STA.w $023B                 
                    LDA.b #$27                  
                    STA.b $33                   
                    STA.w $023C                 
CODE_20873C:        LDY.b #$7F                  
                    LDA.b #$00                  
CODE_208740:        STA.w $1E04,y               
                    DEY                         
                    BPL   CODE_208740           
                    LDY.b #$80                  
                    LDA.b #$00                  
                    STA.w $1EB8                 
CODE_20874D:        STA.w $43,y               
                    DEY                         
                    BNE   CODE_20874D           
CODE_208753:        STZ.w $1CF2                 
                    LDA.w $070A                 
                    CMP.b #$10                  
                    BEQ   CODE_208777           
                    CMP.b #$11                  
                    BEQ   CODE_208777           
                    JSL.l CODE_209C00           
                    JSL.l CODE_22E0A9           
                    JSR.w CODE_209683           
                    LDA.b #$26                  
                    STA.w $0612                 
                    STZ.b $01                   
                    LDA.b #$FF                  
                    STA.b $00                   
CODE_208777:        JSR.w CODE_20FA17           
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_20AC81           
                    LDA.w $070A                 
                    CMP.b #$10                  
                    BEQ   CODE_20878C           
                    JMP.w CODE_2087F0           

CODE_20878C:        LDA.b #$AE                  
                    STA.b $00                   
                    LDA.b #$02                  
                    STA.b $01                   
                    JSR.w CODE_20FA1A           
                    JSL.l CODE_20AF85           
                    JSL.l CODE_239D00           
                    JSL.l CODE_239871           
                    LDA.b #$07                  
                    JSR.w CODE_209610           
                    LDA.b #$02                  
                    JSR.w CODE_209610           
                    JSL.l CODE_20F58C           
                    JSL.l CODE_29EAA5           
                    JSL.l CODE_29E766           
                    JSL.l CODE_29E730           
                    LDA.b #$00                  
                    JSR.w CODE_209610           
                    LDA.b #$C0                  
                    STA.w $0100                 
                    JSR.w CODE_20F9EB           
                    LDA.b #$01                  
                    STA.w $021B                 
                    LDA.b #$00                  
                    STA.l $7E3955               
                    STA.w $100B                 
                    JSL.l CODE_29C794           
                    JSL.l CODE_29E29D           
                    LDA.b #$02                  
                    STA.w $0427                 
                    JSR.w CODE_20801F           
                    LDA.b #$C0                  
                    STA.w $0100                 
                    JMP.w CODE_208FA5           

CODE_2087F0:        CMP.b #$11                  
                    BEQ   CODE_2087F7           
                    JMP.w CODE_208876           
CODE_2087F7:        JSL.l CODE_20AF6F           
                    LDA.b #$0E                  
                    STA.w $1028                 
                    STZ.w $1041                 
                    LDA.b #$FF                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA1A           
                    LDA.b #$0D                  
                    JSR.w CODE_209610           
CODE_208811:        JSL.l CODE_239DE8           
                    LDA.b $28                   
                    JSR.w CODE_209610           
                    LDA.w $1041                 
                    CMP.b #$03                  
                    BNE   CODE_208811           
                    LDA.b #$02                  
                    JSR.w CODE_209610           
                    JSL.l CODE_20F58C           
                    JSL.l CODE_29EAA5           
                    JSL.l CODE_29E766           
                    JSL.l CODE_29E730           
                    LDA.b #$00                  
                    JSR.w CODE_209610           
                    LDA.b #$C0                  
                    STA.w $0100                 
                    JSR.w CODE_20F9EB           
                    LDA.b #$01                  
                    STA.w $021B                 
                    LDA.b #$00                  
                    STA.l $7E3955               
                    JSL.l CODE_29C794           
                    LDA.b #$80                  
                    STA.w $4200                 
                    JSL.l CODE_29E29D           
CODE_20885B:        JSR.w CODE_20801F           
                    JSL.l CODE_239E62           
                    JSL.l CODE_29EAA5           
                    LDA.b $14                   
                    BEQ   CODE_20885B           
                    LDA.b #$80                  
                    STA.w $1202                 
                    JSL.l CODE_29E2B6           
                    JMP.w CODE_208FA5           

CODE_208876:        CMP.b #$12                  
                    BNE   CODE_20887D           
                    JMP.w CODE_2094AE           

CODE_20887D:        STZ.w $0427                 
                    LDX.b #$C0                  
                    LDY.w $0425                 
                    BEQ   CODE_208889           
                    LDX.b #$80                  
CODE_208889:        STX.w $0100                 
                    LDA.b #$15                  
                    STA.w $0208                 
                    LDA.b #$02                  
                    STA.w $0209                 
                    LDA.b #$02                  
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    LDX.b #$17                  
                    LDA.w $02BF                 
                    CMP.b #$01                  
                    BEQ   CODE_2088AD           
                    CMP.b #$07                  
                    BNE   CODE_2088C3           
CODE_2088AD:        STX.w $0208                 
                    JSL.l CODE_22E134           
                    STZ.w $021A                 
                    LDA.b #$01                  
                    STA.w $021B                 
                    LDA.b #$C0                  
                    STA.w $0100                 
                    BRA   CODE_2088DD           

CODE_2088C3:        CMP.b #$06                  
                    BNE   CODE_2088D0           
                    STX.w $0208                 
                    JSL.l CODE_22E499           
                    BRA   CODE_2088DD           

CODE_2088D0:        CMP.b #$05                  
                    BNE   CODE_2088F6           
                    LDX.b #$17                  
                    STX.w $0208                 
                    JSL.l CODE_22E483           
CODE_2088DD:        LDA.b #$64                  
                    STA.w $0204                 
                    LDA.w $02BF                 
                    CMP.b #$07                  
                    BNE   CODE_2088EE           
                    LDA.b #$24                  
                    STA.w $0204                 
CODE_2088EE:        LDA.b #$13                  
                    STA.w $0209                 
                    JMP.w CODE_208982           

CODE_2088F6:        CMP.b #$02                  
                    BNE   CODE_208901           
                    JSL.l CODE_22E2E4           
                    JMP.w CODE_208982           

CODE_208901:        CMP.b #$0E                  
                    BNE   CODE_20890B           
                    JSL.l CODE_22E5AC           
                    BRA   CODE_208982           

CODE_20890B:        CMP.b #$09                  
                    BNE   CODE_208915           
                    JSL.l CODE_22E4D1           
                    BRA   CODE_208935           

CODE_208915:        CMP.b #$0F                  
                    BNE   CODE_20891F           
                    JSL.l CODE_22E64D           
                    BRA   CODE_208935           

CODE_20891F:        CMP.b #$0A                  
                    BNE   CODE_208929           
                    JSL.l CODE_22E3E5           
                    BRA   CODE_208935           

CODE_208929:        CMP.b #$0C                  
                    BEQ   CODE_208935           
                    CMP.b #$0B                  
                    BNE   CODE_208941           
                    JSL.l CODE_22E4F5           
CODE_208935:        LDA.b #$11                  
                    STA.w $0208                 
                    LDA.b #$06                  
                    STA.w $0209                 
                    BRA   CODE_208982           

CODE_208941:        CMP.b #$0D                  
                    BNE   CODE_208953           
                    JSL.l CODE_22E518           
                    STZ.w $021A                 
                    LDA.b #$01                  
                    STA.w $021B                 
                    BRA   CODE_208982           

CODE_208953:        CMP.b #$03                  
                    BEQ   CODE_20896F           
                    CMP.b #$04                  
                    BEQ   CODE_20896F           
                    CMP.b #$08                  
                    BNE   CODE_208982           
                    JSL.l CODE_22E4B1           
                    LDA.b #$24                  
                    STA.w $0204                 
                    LDA.b #$13                  
                    STA.w $0209                 
                    BRA   CODE_208982           

CODE_20896F:        JSL.l CODE_22E338           
                    LDA.b #$22                  
                    STA.w $0204                 
                    LDA.b #$13                  
                    STA.w $0208                 
                    LDA.b #$15                  
                    STA.w $0209                 
CODE_208982:        LDA.b #$02                  
                    JSR.w CODE_209610           
                    JSL.l CODE_20F58C           
                    JSL.l CODE_29EAA5           
                    JSL.l CODE_29E766           
                    JSL.l CODE_29E730           
                    LDA.b #$00                  
                    JSR.w CODE_209610           
                    INC.b $24                   
                    INC.b $24                   
                    DEC.b $23                   
                    DEC.b $23                   
                    JSR.w CODE_209CC0           
                    LDA.b #$40                  
                    STA.w $0612                 
                    JSL.l CODE_2AB48E           
                    LDA.w $070A                 
                    CMP.b #$0F                  
                    BNE   CODE_2089BA           
                    JMP.w CODE_208A48           

CODE_2089BA:        JSL.l CODE_29EB42           
                    LDX.w $0726                 
                    LDA.w $073D,x               
                    BNE   CODE_2089D6           
                    LDA.w $05F2                 
                    BNE   CODE_2089D9           
                    LDA.w $0414                 
                    BNE   CODE_2089D9           
                    LDA.w $C976                 
                    STA.w $0739                 
CODE_2089D6:        JMP.w CODE_208A48           

CODE_2089D9:        LDA.l $7E398C               
                    STA.w $0210                 
                    STA.w $0212                 
                    LDA.l $7E398B               
                    STA.b $12                   
                    STA.w $0211                 
                    LSR   A                     
                    STA.w $0213                 
                    ROR.w $0212                 
                    LDA.l $7E398E               
                    STA.w $0216                 
                    LDA.l $7E398D               
                    STA.b $13                   
                    STA.w $0217                 
                    REP   #$20                  
                    LDA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
                    SEP   #$20                  
                    STZ.w $05F2                 
                    STZ.w $0414                 
                    LDA.w $0350                 
                    CMP.b #$02                  
                    BEQ   CODE_208A2A           
                    CMP.b #$23                  
                    BNE   CODE_208A2F           
CODE_208A2A:        LDA.b #$40                  
                    STA.w $0218                 
CODE_208A2F:        CMP.b #$03                  
                    BEQ   CODE_208A37           
                    CMP.b #$24                  
                    BNE   CODE_208A3D           
CODE_208A37:        STZ.w $0218                 
                    STZ.w $0219                 
CODE_208A3D:        LDA.w $034F                 
                    BEQ   CODE_208A48           
                    LDA.w $0216                 
                    STA.w $0218                 
CODE_208A48:        LDX.w $0726                 
                    LDA.w $073D,x               
                    BEQ   CODE_208A53           
                    JMP.w CODE_208FFD           

CODE_208A53:        STZ.w $0101                 
                    LDA.b #$00                  
                    STA.l $7E3955               
                    JSL.l CODE_29C794           
                    LDA.b #$80                  
                    STA.b $16                   
                    LDA.w $0713                 
                    BEQ   CODE_208A75           
                    LDA.w $0425                 
                    BNE   CODE_208A72           
                    LDA.b #$0F                  
                    STA.b $16                   
CODE_208A72:        JMP.w CODE_208BD5           

CODE_208A75:        STZ.b $20                   
                    JSR.w CODE_2096AA           
                    LDA.b #$FE                  
                    STA.w $105F                 
                    LDA.w $0425                 
                    BEQ   CODE_208A94           
                    LDY.w $0376                 
                    LDA.w $823C,y               
                    STA.b $2E                   
                    LDA.w $824C,y               
                    STA.b $2F                   
                    JMP.w CODE_208A9E           

CODE_208A94:        LDA.w $8200                 
                    STA.b $2E                   
                    LDA.w $8201                 
                    STA.b $2F                   
CODE_208A9E:        STZ.w $1044                 
                    LDA.w $0216                 
                    BEQ   CODE_208AB0           
                    LDA.b $2E                   
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $2E                   
                    INC.w $1044                 
CODE_208AB0:        LDY.b #$04                  
CODE_208AB2:        LDA.w $0216                 
                    CMP.w $CDDE,y               
                    BEQ   CODE_208ABD           
                    DEY                         
                    BPL   CODE_208AB2           
CODE_208ABD:        STY.w $1060                 
                    LDA.w $CDE3,y               
                    STA.w $1047                 
                    STA.w $1048                 
                    STA.w $1049                 
                    STA.w $104A                 
                    LDA.w $CDE8,y               
                    STA.w $104B                 
                    LDA.w $CDF2,y               
                    STA.w $104D                 
                    LDA.w $CDED,y               
                    STA.w $104C                 
                    LDA.w $CDF7,y               
                    STA.w $104E                 
                    STZ.w $104F                 
                    LDA.b #$03                  
                    STA.w $1045                 
                    LDY.b #$01                  
                    STY.w $1046                 
                    LDA.b #$02                  
                    STA.w $0291                 
                    JSL.l CODE_2AF9A9           
                    STZ.w $0100                 
                    LDA.b #$80                  
                    STA.w $4200                 
                    LDA.b #$15                  
                    STA.w $0208                 
                    LDA.b #$02                  
                    STA.w $0209                 
                    LDA.b #$02                  
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    LDA.w $02BF                 
                    CMP.b #$01                  
                    BEQ   CODE_208B31           
                    CMP.b #$06                  
                    BEQ   CODE_208B31           
                    CMP.b #$07                  
                    BEQ   CODE_208B31           
                    CMP.b #$05                  
                    BNE   CODE_208B4C           
                    LDA.b #$17                  
                    STA.w $0208                 
CODE_208B31:        LDA.b #$C0                  
                    STA.w $0100                 
                    LDA.b #$64                  
                    STA.w $0204                 
                    LDA.b #$13                  
                    STA.w $0209                 
                    LDA.w $02BF                 
                    CMP.b #$07                  
                    BNE   CODE_208B4C           
                    LDA.b #$24                  
                    STA.w $0204                 
CODE_208B4C:        CMP.b #$03                  
                    BEQ   CODE_208B64           
                    CMP.b #$04                  
                    BEQ   CODE_208B64           
                    CMP.b #$08                  
                    BNE   CODE_208B75           
                    LDA.b #$64                  
                    STA.w $0204                 
                    LDA.b #$13                  
                    STA.w $0209                 
                    BRA   CODE_208B93           

CODE_208B64:        LDA.b #$22                  
                    STA.w $0204                 
                    LDA.b #$13                  
                    STA.w $0208                 
                    LDA.b #$15                  
                    STA.w $0209                 
                    BRA   CODE_208B93           
CODE_208B75:        CMP.b #$09                  
                    BEQ   CODE_208B89           
                    CMP.b #$0A                  
                    BEQ   CODE_208B89           
                    CMP.b #$0B                  
                    BEQ   CODE_208B89           
                    CMP.b #$0F                  
                    BEQ   CODE_208B89           
                    CMP.b #$0C                  
                    BNE   CODE_208B93           
CODE_208B89:        LDA.b #$11                  
                    STA.w $0208                 
                    LDA.b #$06                  
                    STA.w $0209                 
CODE_208B93:        LDA.b #$80                  
                    STA.w $16                 
                    JSL.l CODE_2AFA63           
                    LDA.w $0350                 
                    CMP.b #$01                  
                    BEQ   CODE_208BAB           
                    CMP.b #$21                  
                    BEQ   CODE_208BAB           
                    CMP.b #$25                  
                    BNE   CODE_208BAB           
CODE_208BAB:        JSR.w CODE_20801F           
                    INC.w $0016                 
                    INC.w $0016                 
                    LDA.w $16                 
                    AND.b #$0F                  
                    STA.w $16                 
                    BNE   CODE_208BAB           
                    LDA.b #$0F                  
                    STA.w $16                 
CODE_208BC3:        JSR.w CODE_20801F           
                    JSL.l CODE_2AFA63           
                    JSL.l CODE_239344           
                    LDA.w $1050                 
                    CMP.b #$38                  
                    BNE   CODE_208BC3           
CODE_208BD5:        STZ.b $20                   
                    LDX.b #$C0                  
                    LDA.w $0425                 
                    BEQ   CODE_208BE0           
                    LDX.b #$80                  
CODE_208BE0:        STX.w $0100                 
                    LDA.w $070A                 
                    CMP.b #$0F                  
                    BEQ   CODE_208BED           
                    JMP.w CODE_208CC0           

CODE_208BED:        STZ.w $0211                 
                    LDA.b #$15                  
                    STA.w $0208                 
                    LDA.b #$04                  
                    STA.w $070E                 
                    STA.w $070F                 
                    LDA.b #$50                  
                    STA.w $05E7                 
                    LDA.b #$C4                  
                    STA.w $05E8                 
                    LDA.b #$0B                  
                    STA.w $070B                 
                    LDA.b #$35                  
                    STA.w $070C                 
                    LDA.b #$A0                  
                    STA.b $97                   
                    LDA.b #$78                  
                    STA.b $95                   
                    STA.b $96                   
                    STZ.w $1040                 
                    STZ.w $1028                 
                    LDA.b #$0D                  
                    STA.w $1202                 
                    LDA.b #$80                  
                    STA.w $4200                 
CODE_208C2B:        JSR.w CODE_20801F           
                    JSL.l CODE_239486           
                    JSL.l CODE_29E7AA           
                    LDA.b $14                   
                    BEQ   CODE_208C2B           
                    LDA.w $1042                 
                    CMP.b #$04                  
                    BNE   CODE_208C49           
                    LDA.b #$01                  
                    STA.w $072D                 
                    JMP.w CODE_208C50           
CODE_208C49:        CMP.b #$07                  
                    BNE   CODE_208C50           
                    JSR.w $95C1           
CODE_208C50:        STZ.w $02D4                 
                    STZ.w $070F                 
                    JSL.l CODE_29E2B6           
                    LDA.b #$80                  
                    STA.b $16                   
                    JSR.w CODE_20801F           
                    STZ.w $4200                 
                    LDA.w $069A                 
                    BEQ   CODE_208CBA           
                    LDY.b #$00                  
                    LDA.w $1042                 
                    CMP.b #$01                  
                    BNE   CODE_208C7B           
                    LDA.b #$01                  
                    STA.w $073B                 
                    LDY.b #$10                  
                    BNE   CODE_208C86           
CODE_208C7B:        CMP.b #$02                  
                    BNE   CODE_208C86           
                    LDA.b #$02                  
                    STA.w $073B                 
                    LDY.b #$11                  
CODE_208C86:        STY.w $070A                 
                    STY.w $1EBF                 
                    CPY.b #$00                  
                    BEQ   CODE_208CBA           
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
                    LDY.b #$FD                  
                    LDA.b #$00                  
CODE_208C9D:        STA.w $00,y               
                    DEY                         
                    CPY.b #$75                  
                    BCS   $04                   
                    CPY.b #$69                  
                    BCS   $F7                   
                    CPY.b #$FF                  
                    BNE   CODE_208C9D           
                    LDY.b #$CF                  
CODE_208CAF:        STA.w $0400,y               
                    DEY                         
                    CPY.b #$FF                  
                    BNE   CODE_208CAF           
                    JMP.w CODE_208753           

CODE_208CBA:        STZ.w $069A                 
                    JMP.w CODE_208FB1           

CODE_208CC0:        LDA.b #$10                  
                    STA.w $0349                 
                    LDA.b #$01                  
                    LDX.w $070A                 
                    CPX.b #$07                  
                    BNE   CODE_208CD0           
                    LDA.b #$11                  
CODE_208CD0:        STA.w $020F                 
                    STZ.w $034D                 
                    LDA.w $0727                 
                    CMP.b #$06                  
                    BEQ   CODE_208D0E           
                    LDA.w $0350                 
                    CMP.b #$01                  
                    BEQ   CODE_208CEC           
                    CMP.b #$21                  
                    BEQ   CODE_208CEC           
                    CMP.b #$25                  
                    BNE   CODE_208D0E           
CODE_208CEC:        REP   #$20                  
                    LDA.w #$0F42                
                    STA.w $4370                 
                    LDA.w #$F860                
                    STA.w $4372                 
                    LDX.b #$2A                  
                    STX.w $4374                 
                    LDX.b #$7F                  
                    STX.w $4377                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $034D                 
                    STZ.w $0249                 
CODE_208D0E:        LDA.b #$A1                  
                    STA.w $4200                 
                    LDY.w $070A                 
                    CPY.b #$05                  
                    BNE   CODE_208D20           
                    LDA.w $C98E                 
                    STA.w $1E9F                 
CODE_208D20:        LDA.w $034D                 
                    BEQ   CODE_208D29           
                    JSL.l CODE_2A841C           
CODE_208D29:        JSR.w CODE_20801F           
                    LDA.w $1206                 
                    CMP.b #$04                  
                    BEQ   CODE_208D40           
                    LDA.w $1061                 
                    BEQ   CODE_208D43           
                    CMP.w $1206                 
                    BEQ   CODE_208D40           
                    STA.w $1202                 
CODE_208D40:        STZ.w $1061                 
CODE_208D43:        LDA.w $05F3                 
                    BMI   CODE_208D8A           
                    LDY.w $070A                 
                    CPY.b #$05                  
                    BNE   CODE_208D71           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_208D6C           
                    INC.b $1B                   
                    LDA.b $1B                   
                    CMP.w $1E9F                 
                    BNE   CODE_208D62           
                    LDA.b #$00                  
                    STA.b $1B                   
CODE_208D62:        TAY                         
                    LDA.w $C98F,y               
                    STA.w $0245                 
                    STZ.w $0243                 
CODE_208D6C:        JSR.w CODE_20A07B           
                    BRA   CODE_208DCB           

CODE_208D71:        CPY.b #$07                  
                    BEQ   CODE_208D8A           
                    LDA.w $0567                 
                    BEQ   CODE_208D8C           
                    BPL   CODE_208D84           
                    STZ.w $0243                 
                    LDA.b #$7F                  
                    STA.w $0567                 
CODE_208D84:        STZ.w $0245                 
                    JSR.w CODE_20A07B           
CODE_208D8A:        BRA   CODE_208DCB           

CODE_208D8C:        CPY.b #$0A                  
                    BNE   CODE_208DB2           
                    LDA.w $1EBF                 
                    CMP.b #$15                  
                    BNE   CODE_208DCB           
                    LDY.w $0246                 
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_208DAD           
                    STZ.w $0243                 
                    INY                         
                    CPY.b #$03                  
                    BNE   CODE_208DAA           
                    LDY.b #$00                  
CODE_208DAA:        STY.w $0246                 
CODE_208DAD:        JSR.w CODE_20A0C6           
                    BRA   CODE_208DCB           

CODE_208DB2:        LDA.b $15                   
                    AND.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $C9DF,x               
                    CMP.w $0245                 
                    BEQ   CODE_208DC5           
                    STZ.w $0243                 
CODE_208DC5:        STA.w $0245                 
                    JSR.w CODE_20A07B           
CODE_208DCB:        LDA.l $700007               
                    BEQ   CODE_208DEE           
                    LDA.b $F8                   
                    ORA.b $F9                   
                    AND.b #$20                  
                    BEQ   CODE_208DDC           
                    INC.w $00EC                 
CODE_208DDC:        LDA.b $F8                   
                    ORA.b $F9                   
                    AND.b #$10                  
                    BNE   CODE_208DEE           
                    LDA.w $EC                 
                    AND.b #$01                  
                    BEQ   CODE_208DEE           
                    BRL   CODE_208D20           

CODE_208DEE:        LDA.w $0349                 
                    BEQ   CODE_208DF9           
                    DEC.w $0349                 
                    JMP.w CODE_208E54           

CODE_208DF9:        LDA.w $0571                 
                    BNE   CODE_208E54           
                    LDA.w $028C                 
                    CMP.b #$01                  
                    BEQ   CODE_208E54           
                    CMP.b #$03                  
                    BEQ   CODE_208E54           
                    LDA.w $1206                 
                    CMP.b #$80                  
                    BEQ   CODE_208E54           
                    CMP.b #$F0                  
                    BEQ   CODE_208E54           
                    LDA.b $18                   
                    AND.b #$10                  
                    BEQ   CODE_208E54           
                    LDA.w $1EBF                 
                    CMP.b #$16                  
                    BEQ   CODE_208E54           
                    CMP.b #$2D                  
                    BEQ   CODE_208E54           
                    LDA.w $02D9                 
                    BNE   CODE_208E54           
                    LDA.w $1061                 
                    BNE   CODE_208E54           
                    LDA.b $BC                   
                    CMP.b #$A4                  
                    BEQ   CODE_208E39           
                    STA.l $7FC520               
CODE_208E39:        LDY.b #$A4                  
                    LDA.w $037A                 
                    EOR.b #$01                  
                    STA.w $037A                 
                    BNE   CODE_208E4A           
                    LDA.l $7FC520               
                    TAY                         
CODE_208E4A:        STY.b $BC                   
                    JSL.l CODE_22E000           
                    JSL.l CODE_29EBB7           
CODE_208E54:        LDA.w $028C                 
                    CMP.b #$03                  
                    BNE   CODE_208E60           
                    LDA.b #$01                  
                    STA.w $037A                 
CODE_208E60:        LDA.w $037A                 
                    BEQ   CODE_208E70           
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_29EBF7           
                    JMP.w CODE_208D20           

CODE_208E70:        LDA.b $BF                   
                    BNE   CODE_208E9A           
                    LDY.b $25                   
                    LDA.w $0425                 
                    BEQ   CODE_208E86           
                    LDA.w $0216                 
                    AND.b #$F0                  
                    ORA.b $13                   
                    STA.b $B7                   
                    BRA   CODE_208E8D           
CODE_208E86:        LDA.w $0210                 
                    STA.b $B7                   
                    LDA.b $12                   
CODE_208E8D:        JSL.l CODE_2097F5           
                    LDA.w $0425                 
                    BNE   CODE_208E9A           
                    DEC.b $24                   
                    INC.b $23                   
CODE_208E9A:        LDA.b $B7                   
                    PHA                         
                    LDA.w $0425                 
                    BEQ   CODE_208EAE           
                    LDA.w $0218                 
                    AND.b #$F0                  
                    ORA.w $0219                 
                    STA.b $B7                   
                    BRA   CODE_208EB6           

CODE_208EAE:        LDA.w $0212                 
                    STA.b $B7                   
                    LDA.w $0213                 
CODE_208EB6:        PLA                         
                    STA.b $B7                   
                    LDA.w $0414                 
                    BEQ   CODE_208F21           
                    LDA.w $034E                 
                    BEQ   CODE_208F16           
                    LDY.b #$08                  
                    LDA.b $BB                   
                    BNE   CODE_208ECB           
                    LDY.b #$94                  
CODE_208ECB:        STY.b $BC                   
                    LDA.b #$01                  
                    STA.b $9C                   
                    STZ.w $0781                 
                    STZ.w $0780                 
CODE_208ED7:        JSR.w CODE_20801F           
                    JMP.w CODE_208EF5           

                    LDA.b $F8                   
                    AND.b #$20                  
                    BEQ   CODE_208EE6           
                    INC.w $00EC                 
CODE_208EE6:        LDA.b $F8                   
                    AND.b #$10                  
                    BNE   CODE_208EF5           
                    LDA.w $EC                 
                    AND.b #$01                  
                    BEQ   CODE_208EF5           
                    BRA   CODE_208ED7           

CODE_208EF5:        JSL.l CODE_22E0A9           
                    JSL.l CODE_20E237           
                    JSL.l CODE_278FC1           
                    JSL.l CODE_27BE7E           
                    JSL.l CODE_27B299           
                    JSL.l CODE_27DC9E           
                    LDA.w $034E                 
                    CMP.b #$20                  
                    BCC   CODE_208ED7           
                    STZ.b $9C                   
CODE_208F16:        STZ.w $034E                 
                    JSL.l CODE_29C794           
                    JML.l CODE_29DFAD           

CODE_208F21:        JSL.l CODE_22E0A9           
                    JSL.l CODE_209D5A           
                    STZ.w $0781                 
                    STZ.w $0780                 
                    JSL.l CODE_23BFA7           
                    LDA.b $BF                   
                    CMP.b #$03                  
                    BEQ   CODE_208F52           
                    JSL.l CODE_278FC1           
                    JSL.l CODE_27BE7E           
                    JSL.l CODE_27B299           
                    JSL.l CODE_27DC9E           
                    LDA.w $0580                 
                    BEQ   CODE_208F52           
                    JSL.l CODE_278500           
CODE_208F52:        LDA.b $14                   
                    BEQ   CODE_208F61           
                    LDX.w $0726                 
                    LDA.b $BB                   
                    STA.w $0747,x               
                    STZ.w $07BE                 
CODE_208F61:        JSL.l CODE_278000           
                    LDA.w $0380                 
                    CMP.b #$FF                  
                    BNE   CODE_208F8C           
                    LDA.w $03EE                 
                    BNE   CODE_208F8C           
                    LDA.w $037B                 
                    BNE   CODE_208F8C           
                    LDA.b $28                   
                    BNE   CODE_208F8C           
                    LDA.w $041C                 
                    BNE   CODE_208F88           
                    JSL.l CODE_29EAA5           
                    LDA.w $05F2                 
                    BEQ   CODE_208F92           
CODE_208F88:        JSL.l CODE_29D8E0           
CODE_208F8C:        LDA.b #$00                  
                    STA.l $7E3954               
CODE_208F92:        STZ.w $037B                 
                    LDA.b $14                   
                    BEQ   CODE_208FFA           
                    LDX.w $0726                 
                    LDA.b #$01                  
                    STA.w $074A,x               
                    JSL.l CODE_29E2B6           
CODE_208FA5:        LDA.b #$80                  
                    STA.b $16                   
                    LDA.b #$80                  
                    STA.w $1202                 
                    JSR.w CODE_20801F           
CODE_208FB1:        STZ.w $0728                 
                    STZ.w $4200                 
CODE_208FB7:        LDX.w $0726                 
                    LDA.w $073D,x               
                    BEQ   CODE_208FD0           
                    LDA.w $0713                 
                    BNE   CODE_208FD0           
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
                    JMP.w CODE_208691           

CODE_208FD0:        LDY.b #$06                  
                    JSR.w CODE_20982D           
                    STZ.w $1CF2                 
                    LDA.b #$80                  
                    STA.w $1202                 
                    LDA.w $0713                 
                    BNE   CODE_208FF3           
                    LDA.w $078E                 
                    BEQ   CODE_208FF3           
                    LDA.b #$A8                  
                    STA.b $FF                   
                    LDA.b #$20                  
                    STA.w $0100                 
                    JMP.w CODE_20C617           

CODE_208FF3:        LDA.b #$28                  
                    STA.b $FF                   
                    JMP.w CODE_2090FA           

CODE_208FFA:        JMP.w CODE_208D20           

CODE_208FFD:        LDA.b #$C0                  
                    STA.w $0100                 
                    LDA.b #$00                  
                    STA.w $0101                 
                    STZ.w $0728                 
                    STZ.b $14                   
                    JSL.l CODE_29C6FA           
                    LDA.b #$00                  
                    STA.l $7E3955               
                    JSL.l CODE_29C794           
                    LDA.b #$80                  
                    STA.w $2100                 
                    STZ.w $4200                 
                    REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$2800                
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    STA.w $4310                 
                    STA.w $4320                 
                    LDA.w #$B000                
                    STA.w $4302                 
                    LDA.w #$8000                
                    STA.w $4312                 
                    LDA.w #$8800                
                    STA.w $4322                 
                    LDX.b #$33                  
                    STX.w $4304                 
                    LDX.b #$39                  
                    STX.w $4314                 
                    LDX.b #$32                  
                    STX.w $4324                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    LDA.w #$4000                
                    STA.w $4315                 
                    LDA.w #$0800                
                    STA.w $4325                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.w #$6000                
                    STA.w $2116                 
                    INX                         
                    STX.w $420B                 
                    LDA.w #$3400                
                    STA.w $2116                 
                    LDX.b #$04                  
                    STX.w $420B                 
                    SEP   #$20                  
                    JSL.l CODE_29E29D           
CODE_20908E:        JSR.w CODE_20801F           
                    JSL.l CODE_29C280           
                    LDA.b $14                   
                    BEQ   CODE_20908E           
                    LDA.b #$80                  
                    STA.w $1202                 
                    LDA.b #$03                  
                    STA.w $020D                 
CODE_2090A3:        JSR.w CODE_20801F           
                    LDA.w $0727                 
                    CMP.b #$06                  
                    BNE   CODE_2090B6           
                    LDA.w $020D                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $020D                 
CODE_2090B6:        DEC.b $16                   
                    BPL   CODE_2090A3           
                    LDA.b #$80                  
                    STA.b $16                   
                    STZ.w $020D                 
                    LDY.b #$06                  
                    JSR.w CODE_20982D           
                    LDX.w $072B                 
                    DEX                         
CODE_2090CA:        STZ.w $073D,x               
                    STZ.w $0713                 
                    STZ.w $0722,x               
                    STZ.w $0724,x               
                    DEX                         
                    BPL   CODE_2090CA           
                    LDX.w $0726                 
                    LDA.b #$1F                  
                    CPX.b #$00                  
                    BEQ   CODE_2090E5           
                    CLC                         
                    ADC.b #$23                  
CODE_2090E5:        TAY                         
                    LDX.b #$00                  
CODE_2090E8:        LDA.w $0715,x               
                    STA.w $1D80,y               
                    INY                         
                    INX                         
                    CPX.b #$03                  
                    BNE   CODE_2090E8           
                    INC.w $0727                 
                    JMP.w CODE_2080B9           

CODE_2090FA:        LDA.b #$C0                  
                    STA.w $0100                 
                    LDA.b #$00                  
                    STA.w $0101                 
                    LDX.w $0726                 
                    LDA.b #$1F                  
                    CPX.b #$00                  
                    BEQ   CODE_209110           
                    CLC                         
                    ADC.b #$23                  
CODE_209110:        TAY                         
                    LDX.b #$00                  
CODE_209113:        LDA.w $0715,x               
                    STA.w $1D80,y               
                    INY                         
                    INX                         
                    CPX.b #$03                  
                    BNE   CODE_209113           
                    LDA.w $1F55                 
                    BEQ   CODE_209127           
                    DEC.w $1F55                 
CODE_209127:        LDY.b #$06                  
                    LDA.w $0713                 
                    BNE   CODE_209185           
                    LDA.w $070A                 
                    CMP.b #$0F                  
                    BCS   $48                   
                    CMP.b #$07                  
                    BEQ   CODE_20917D           
                    LDX.w $0726                 
                    LDA.l $7E397D,x             
                    STA.l $7E396A               
                    LDA.l $7E397F,x             
                    STA.l $7E396B               
                    LDA.l $7E3981,x             
                    STA.l $7E396C               
                    LDA.l $7E3975,x             
                    STA.l $7E397D,x             
                    LDA.l $7E3977,x             
                    STA.l $7E397F,x             
                    LDA.l $7E3979,x             
                    STA.l $7E3981,x             
                    LDA.w $0722,x               
                    STA.l $7E3985,x             
                    LDA.w $0724,x               
                    STA.l $7E3987,x             
                    JMP.w CODE_20919F           

CODE_20917D:        LDA.b #$01                  
                    STA.l $7FFF03               
                    BRA   CODE_20919F           
CODE_209185:        LDY.b #$02                  
                    STZ.w $0713                 
                    STZ.w $07E3                 
                    LDX.w $0726                 
                    LDA.b #$01                  
                    STA.w $073F,x               
                    LDA.w $078C                 
                    BNE   CODE_20919F           
                    DEC.w $0736,x               
                    BMI   CODE_2091AA           
CODE_20919F:        LDA.b #$80                  
                    STA.w $1202                 
                    STY.w $0729                 
                    JMP.w CODE_2080E5           

CODE_2091AA:        LDA.b #$01                  
                    STA.w $5A,x               
                    STZ.w $070A                 
                    STZ.b $20                   
                    STZ.b $59                   
                    STZ.w $0711                 
                    LDA.b #$58                  
                    STA.w $1DCB                 
                    STZ.w $034D                 
CODE_2091C1:        STZ.w $4200                 
                    JSL.l CODE_22E0A9           
                    JSR.w CODE_20F9EB           
                    LDA.b #$FF                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    LDA.b #$80                  
                    STA.b $16                   
                    STA.w $2100                 
                    LDA.w $0728                 
                    BNE   CODE_2091EA           
                    LDA.b #$0A                  
                    STA.w $1202                 
                    LDA.b #$A0                  
                    STA.w $02D8                 
CODE_2091EA:        REP   #$20                  
                    LDA.w #$2000                
                    STA.w $2116                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    STA.w $4310                 
                    STA.w $4320                 
                    LDY.b #$01                  
                    LDX.w $0727                 
                    CPX.b #$04                  
                    BNE   CODE_20923C           
                    LDA.w #$C000                
                    STA.w $4302                 
                    LDX.b #$39                  
                    STX.w $4304                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    STY.w $420B                 
                    LDA.w #$2800                
                    STA.w $2116                 
                    LDA.w #$B000                
                    STA.w $4302                 
                    LDX.b #$31                  
                    STX.w $4304                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    STY.w $420B                 
                    BRA   CODE_209250           
CODE_20923C:        LDA.w #$A000                
                    STA.w $4302                 
                    LDX.b #$31                  
                    STX.w $4304                 
                    LDA.w #$2000                
                    STA.w $4305                 
                    STY.w $420B                 
CODE_209250:        LDA.w #$C000                
                    STA.w $4312                 
                    LDA.w #$8000                
                    STA.w $4322                 
                    LDX.b #$38                  
                    STX.w $4314                 
                    STX.w $4324                 
                    LDA.w #$4000                
                    STA.w $4315                 
                    LDA.w #$1000                
                    STA.w $4325                 
                    LDA.w #$6000                
                    STA.w $2116                 
                    LDX.b #$02                  
                    STX.w $420B                 
                    LDA.w #$5800                
                    STA.w $2116                 
                    LDX.b #$04                  
                    STX.w $420B                 
                    REP   #$10                  
                    PHB                         
                    LDX.w #$BE00                
                    LDY.w #$1300                
                    LDA.w #$01FF                
                    MVN.w $1C00                 
                    PLB                         
                    SEP   #$30                  
                    LDX.w $072B                 
                    DEX                         
CODE_20929C:        LDA.l $7E3975,x             
                    STA.b $43,x                 
                    LDA.l $7E3977,x             
                    STA.b $45,x                 
                    LDA.l $7E3979,x             
                    STA.b $47,x                 
                    LDA.l $7E397B,x             
                    STA.b $52,x                 
                    LDA.l $7E3992,x             
                    STA.b $4B,x                 
                    DEX                         
                    BPL   CODE_20929C           
                    JSL.l CODE_29BE21           
                    LDX.w $0726                 
                    LDA.l $7E3992,x             
                    STA.b $4B,x                 
                    LDY.b #$00                  
                    LDA.w $0727                 
                    CMP.b #$07                  
                    BNE   CODE_2092DD           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    CMP.b #$02                  
                    BNE   CODE_2092DD           
                    INY                         
CODE_2092DD:        STY.w $0598                 
                    LDY.w $0726                 
                    LDA.w $0722,y               
                    STA.b $B7                   
                    LDA.w $0724,y               
                    JSL.l CODE_2097F5           
                    LDA.b $24                   
                    STA.b $23                   
                    STZ.w $1EBF                 
                    LDA.b #$20                  
                    STA.w $0612                 
                    LDA.b #$02                  
                    JSR.w CODE_209610           
                    JSL.l CODE_20F58C           
                    JSL.l CODE_29EAA5           
                    JSL.l CODE_29E766           
                    JSL.l CODE_29E730           
                    LDA.b #$00                  
                    JSR.w CODE_209610           
                    LDA.w $0598                 
                    BNE   CODE_20931D           
                    JSR.w CODE_209CC0           
CODE_20931D:        JSR.w CODE_2095B9           
                    JSL.l CODE_2A8B4B           
                    LDY.w $0726                 
                    LDA.w $0722,y               
                    STA.w $0210                 
                    STA.b $B7                   
                    LDA.w $0724,y               
                    STA.b $12                   
                    STA.w $0211                 
                    JSL.l CODE_2097F5           
                    LDA.w $0728                 
                    BNE   CODE_209382           
                    JSL.l CODE_238000           
                    JSL.l CODE_2AF800           
                    LDA.b #$44                  
                    STA.w $0287                 
                    LDX.b #$14                  
                    LDA.b #$2C                  
                    STA.w $0281                 
                    LDA.b #$01                  
                    STA.w $034D                 
                    LDA.w $072B                 
                    CMP.b #$02                  
                    BNE   CODE_20937A           
                    LDA.w $0726                 
                    EOR.b #$01                  
                    TAY                         
                    LDA.w $0736,y               
                    BMI   CODE_20937A           
                    LDX.b #$15                  
                    STZ.w $034D                 
                    LDA.b #$24                  
                    STA.w $0281                 
                    LDA.b #$60                  
                    STA.w $1DCB                 
CODE_20937A:        TXA                         
                    JSR.w CODE_209610           
                    JSL.l CODE_2AF867           
CODE_209382:        LDA.b #$EF                  
                    STA.w $0216                 
                    STZ.w $021B                 
                    LDA.b #$C0                  
                    STA.w $0100                 
                    JSL.l CODE_29C794           
                    LDA.b #$01                  
                    STA.w $020E                 
                    LDA.b #$11                  
                    STA.w $020F                 
                    LDA.b #$09                  
                    STA.w $020C                 
                    STA.w $2105                 
                    LDA.b #$17                  
                    STA.w $0208                 
                    LDA.b #$03                  
                    STA.w $021E                 
                    LDA.b #$80                  
                    STA.w $4200                 
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_23840D           
                    LDX.w $0726                 
                    LDY.b #$06                  
                    CPX.b #$00                  
                    BEQ   CODE_2093C7           
                    LDY.b #$29                  
CODE_2093C7:        LDA.b #$06                  
                    STA.b $00                   
                    LDA.b #$00                  
CODE_2093CD:        STA.w $1D9C,y               
                    DEY                         
                    DEC.b $00                   
                    BPL   CODE_2093CD           
                    LDY.b #$3F                  
                    CPX.b #$00                  
                    BEQ   CODE_2093DD           
                    LDY.b #$7F                  
CODE_2093DD:        LDA.b #$3F                  
                    STA.b $00                   
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    TAY                         
                    LDA.w $0727                 
                    AND.w #$00FF                
                    INC   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    DEC   A                     
                    TAX                         
                    SEP   #$20                  
CODE_2093F9:        LDA.w $1D00,y               
                    AND.w $8000,x               
                    STA.w $1D00,y               
                    DEX                         
                    DEY                         
                    DEC.b $00                   
                    BPL   CODE_2093F9           
                    SEP   #$10                  
                    JSR.w CODE_2095CF           
                    JSL.l CODE_29E29D           
                    LDA.b #$0F                  
                    STA.b $16                   
                    STA.w $2100                 
CODE_209418:        JSR.w CODE_20801F           
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_23840D           
                    LDA.w $0728                 
                    BEQ   CODE_20942F           
                    DEC   A                     
                    BEQ   CODE_20942F           
                    JSL.l CODE_2382A3           
CODE_20942F:        LDA.w $0728                 
                    CMP.b #$06                  
                    BEQ   CODE_209441           
                    CMP.b #$09                  
                    BNE   CODE_209418           
                    LDA.w $072B                 
                    CMP.b #$01                  
                    BEQ   CODE_209454           
CODE_209441:        LDA.b #$80                  
                    STA.w $1202                 
                    JSL.l CODE_29E2B6           
                    LDA.w $0728                 
                    CMP.b #$09                  
                    BEQ   CODE_209454           
                    JMP.w CODE_2091C1           

CODE_209454:        STZ.w $0728                 
                    LDA.w $1DCB                 
                    CMP.b #$70                  
                    BCC   CODE_209461           
                    JMP.w CODE_20949B           

CODE_209461:        STZ.w $0728                 
                    STZ.w $1DCB                 
                    STZ.w $07E3                 
                    LDX.w $0726                 
                    LDA.w $0210                 
                    STA.w $0722,x               
                    LDA.b $12                   
                    STA.w $0724,x               
                    LDA.b $43,x                 
                    STA.l $7E3975,x             
                    LDA.b $45,x                 
                    STA.l $7E3977,x             
                    LDA.b $47,x                 
                    STA.l $7E3979,x             
                    LDA.b $52,x                 
                    STA.l $7E397B,x             
                    STZ.w $073F,x               
                    LDX.w $0726                 
                    LDA.b #$04                  
                    STA.w $0736,x               
CODE_20949B:        JSR.w CODE_2095CF           
                    LDA.b #$80                  
                    STA.w $2100                 
                    LDY.b #$00                  
                    STY.w $0729                 
                    LDX.w $0726                 
                    JMP.w CODE_2084F8           

CODE_2094AE:        LDA.b #$15                  
                    STA.w $0208                 
                    LDA.b #$02                  
                    STA.w $0209                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    JSL.l CODE_20AFC3           
                    JSR.w CODE_209CC0           
                    JSL.l CODE_2AB48E           
                    LDA.b #$C0                  
                    STA.w $0100                 
                    LDA.b #$80                  
                    STA.w $0101                 
                    LDA.b #$11                  
                    STA.w $1061                 
                    JSL.l CODE_29C794           
                    LDA.b #$00                  
                    STA.l $7E3955               
                    JSL.l CODE_29E29D           
                    LDA.b #$80                  
                    STA.w $4200                 
CODE_2094EA:        JSR.w CODE_20801F           
                    LDA.w $1061                 
                    BEQ   CODE_2094F8           
                    STA.w $1202                 
                    STZ.w $1061                 
CODE_2094F8:        JSL.l CODE_22E0A9           
                    JSL.l CODE_23E190           
                    LDA.w $14                 
                    BEQ   CODE_2094EA           
                    JSL.l CODE_29E2B6           
                    LDA.b #$80                  
                    STA.w $1202                 
                    LDA.b #$80                  
                    STA.b $16                   
                    JSR.w CODE_20801F           
                    LDX.w $078C                 
                    DEX                         
                    CPX.w $0726                 
                    BNE   CODE_209521           
                    JMP.w CODE_2095AC           

CODE_209521:        TXA                         
                    EOR.b #$01                  
                    TAY                         
                    LDA.w $0722,y               
                    STA.b $05                   
                    LDA.w $0724,y               
                    STA.b $06                   
                    PHB                         
                    LDA.b #$7E                  
                    PHA                         
                    PLB                         
                    LDA.w $397D,y               
                    STA.b $00                   
                    LDA.w $397F,y               
                    STA.b $01                   
                    LDA.w $3981,y               
                    STA.b $02                   
                    LDA.w $3985,y               
                    STA.b $03                   
                    LDA.w $3987,y               
                    STA.b $04                   
                    LDA.w $397D,x               
                    STA.w $397D,y               
                    LDA.w $397F,x               
                    STA.w $397F,y               
                    LDA.w $3981,x               
                    STA.w $3981,y               
                    LDA.w $3985,x               
                    STA.w $3985,y               
                    LDA.w $3987,x               
                    STA.w $3987,y               
                    PLB                         
                    LDA.b $00                   
                    STA.l $7E397D,x             
                    LDA.b $01                   
                    STA.l $7E397F,x             
                    LDA.b $02                   
                    STA.l $7E3981,x             
                    LDA.b $03                   
                    STA.l $7E3985,x             
                    LDA.b $04                   
                    STA.l $7E3987,x             
                    LDA.b $05                   
                    STA.w $0722,x               
                    LDA.b $06                   
                    STA.w $0724,x               
                    LDA.b #$1F                  
                    CPX.b #$01                  
                    BNE   CODE_20959D           
                    CLC                         
                    ADC.b #$23                  
CODE_20959D:        TAY                         
                    LDX.b #$00                  
CODE_2095A0:        LDA.w $1D80,y               
                    STA.w $0715,x               
                    INY                         
                    INX                         
                    CPX.b #$03                  
                    BNE   CODE_2095A0           
CODE_2095AC:        LDX.w $078C                 
                    STX.w $0713                 
                    DEX                         
                    STX.w $0726                 
                    JMP.w CODE_208FB7           

CODE_2095B9:        LDA.w $0727                 
                    CMP.b #$07                  
                    BNE   CODE_2095CE           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    CMP.b #$01                  
                    BNE   CODE_2095CE           
                    LDA.b #$31                  
                    JSR.w CODE_209610           
CODE_2095CE:        RTS                         

CODE_2095CF:        LDY.w $072B                 
                    CPY.b #$01                  
                    BEQ   CODE_2095DF           
                    DEY                         
CODE_2095D7:        LDA.w $0736,y               
                    BPL   CODE_20960E           
                    DEY                         
                    BPL   CODE_2095D7           
CODE_2095DF:        LDX.b #$02                  
CODE_2095E1:        LDY.b #$0D                  
CODE_2095E3:        LDA.w $1F17,y               
                    BEQ   CODE_2095F2           
                    CMP.w $CDDB,x               
                    BNE   CODE_2095F2           
                    LDA.b #$00                  
                    STA.w $1F17,y               
CODE_2095F2:        DEY                         
                    BPL   CODE_2095E3           
                    DEX                         
                    BPL   CODE_2095E1           
                    LDA.b #$00                  
                    STA.l $7E3967               
                    STA.l $7E396F               
                    LDA.b #$1F                  
                    STA.l $7E3968               
                    LDA.b #$40                  
                    STA.l $7E3969               
CODE_20960E:        RTS                         

CODE_20960F:        RTS                         

CODE_209610:        PHA                         
                    STA.b $36                   
                    ASL   A                     
                    CLC                         
                    ADC.b $36                   
                    TAY                         
                    PHB                         
                    LDA.b #$22                  
                    PHA                         
                    PLB                         
                    LDA   PNTR_228B5C,y               
                    STA.b $36                   
                    LDA   PNTR_228B5C+1,y               
                    STA.b $37                   
                    LDA   PNTR_228B5C+2,y               
                    STA.b $38                   
                    PLB                         
                    JSL.l CODE_29E8AB           
                    PLA                         
                    BNE   CODE_209641           
                    STA.w $1600                 
                    STA.w $1601                 
                    DEC   A                     
                    STA.w $1602                 
                    STA.w $1603                 
CODE_209641:        RTS                         

PNTR_209642:        dl DATA_29BE00
                    dl DATA_248918
                    dl DATA_268828
                    dl $24ADB0
                    dl $24E660
                    dl $25B030
                    dl $258860
                    dl $258860
                    dl $258860
                    dl $25D510
                    dl $26B020
                    dl $25B030
                    dl $24E660
                    dl $25B030
                    dl $24ADB0
                    dl DATA_20967B
                    dl DATA_20967B
                    dl DATA_20967B
                    dl DATA_23A540

DATA_20967B:        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

CODE_209683:        LDA.w $070A                 
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    LDA   PNTR_209642,x             
                    STA.b $00                   
                    LDA   PNTR_209642+1,x             
                    STA.b $01                   
                    LDA   PNTR_209642+2,x             
                    STA.b $02                   
                    LDY.b #$07                  
CODE_2096A1:        LDA.b [$00],y               
                    STA.w $1E96,y               
                    DEY                         
                    BPL   CODE_2096A1           
                    RTS                         

CODE_2096AA:        LDY.b #$1C                  
CODE_2096AC:        LDA.b #$00                  
                    STA.w $1044,y               
                    DEY                         
                    BPL   CODE_2096AC           
                    RTS                         

                    LDA.w $1053                 
                    CLC                         
                    ADC.w $1056                 
                    STA.w $1053                 
                    LDA.w $1051                 
                    ADC.b #$00                  
                    STA.w $1051                 
                    LDA.w $105F                 
                    CMP.b #$FE                  
                    BNE   CODE_2096F6           
                    LDY.w $104F                 
                    LDA.w $1047,y               
                    CMP.b #$08                  
                    BCS   CODE_2096F6                   
                    LDA.w $1051                 
                    CMP.b #$04                  
                    BCC   CODE_2096F6           
                    LDA.b #$08                  
                    STA.w $1051                 
                    LDA.w $1053                 
                    AND.b #$1F                  
                    STA.w $1053                 
                    LDA.w $104F                 
                    AND.b #$02                  
                    BEQ   CODE_2096F6           
                    STX.w $105F                 
CODE_2096F6:        RTS                         

CODE_2096F7:        LDA.w $1053                 
                    AND.b #$C0                  
                    STA.w $1054                 
                    LDA.w $1051                 
                    AND.b #$0F                  
                    STA.w $1052                 
                    CLC                         
                    ROR.w $1052                 
                    ROR.w $1054                 
                    CLC                         
                    ROR.w $1052                 
                    ROR.w $1054                 
                    LDA.w $1053                 
                    AND.b #$1F                  
                    LSR   A                     
                    CLC                         
                    ADC.w $1054                 
                    STA.w $1054                 
                    RTS                         

CODE_209723:        LDA.w $1053                 
                    AND.b #$01                  
                    STA.w $1055                 
                    LDA.w $1053                 
                    AND.b #$20                  
                    BNE   CODE_209737           
                    ASL.w $1055                 
                    BRA   CODE_20973B           

CODE_209737:        SEC                         
                    ROL.w $1055                 
CODE_20973B:        RTS                         

CODE_20973C:        ASL   A                     
                    ADC.b #$00                  
                    ASL   A                     
                    ADC.b #$00                  
                    STA.b $0C                   
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $0D                   
                    LDA.b $0C                   
                    AND.b #$03                  
                    ORA.b #$08                  
                    STA.b $0E                   
                    LDA.b $0C                   
                    AND.b #$C0                  
                    ORA.b $0D                   
                    STA.b $0F                   
                    RTL                         

CODE_20975B:        TYA                         
                    PHA                         
                    TXA                         
                    PHA                         
                    STZ.b $0F                   
                    LDY.w $0726                 
                    CPY.b #$00                  
                    BEQ   CODE_209772           
CODE_209768:        LDA.b $0F                   
                    CLC                         
                    ADC.b #$23                  
                    STA.b $0F                   
                    DEY                         
                    BNE   CODE_209768           
CODE_209772:        TXA                         
                    CLC                         
                    ADC.b $0F                   
                    TAX                         
                    INC.w $1D9C,x               
                    PLA                         
                    TAX                         
                    PLA                         
                    TAY                         
                    RTL                         

                    JSR.w CODE_2096F7           
                    JSR.w CODE_209723           
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.w $0425                 
                    BEQ   CODE_20979E           
                    LDY.w $0376                 
                    LDA.w $823C,y               
                    STA.b $2E                   
                    LDA.w $824C,y               
                    STA.b $2F                   
                    JMP.w CODE_2097A8           

CODE_20979E:        LDA.w $8200                 
                    STA.b $2E                   
                    LDA.w $8201                 
                    STA.b $2F                   
CODE_2097A8:        LDA.w $1051                 
                    AND.b #$08                  
                    BEQ   CODE_2097B1           
                    INC.b $2F                   
CODE_2097B1:        LDA.w $070A                 
                    ASL   A                     
                    TAY                         
                    LDA.w $CE5A,y               
                    STA.b $0C                   
                    LDA.w $CE5B,y               
                    STA.b $0D                   
                    LDY.w $070A                 
                    LDA.w $CE80,y               
                    STA.b $0E                   
                    LDY.w $1054                 
                    LDA.b [$2E],y               
                    REP   #$30                  
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    TXA                         
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $1055                 
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $00                   
                    TYA                         
                    CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.b [$0C],y               
                    STA.w $0382,x               
                    STY.b $00                   
                    STX.b $02                   
                    SEP   #$30                  
                    RTS                         

CODE_2097F5:        LDY.w $0425                 
                    BNE   CODE_20980C           
                    LDX.b #$03                  
CODE_2097FC:        LSR   A                     
                    ROR.b $B7                   
                    DEX                         
                    BPL   CODE_2097FC           
                    LDA.b $B7                   
                    STA.b $24                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $23                   
                    RTL                         

CODE_20980C:        LDA.b $B7                   
                    BEQ   CODE_209821           
                    SEC                         
                    SBC.b #$10                  
                    STA.b $B7                   
                    CMP.b #$F0                  
                    BCC   CODE_209821           
                    SEC                         
                    SBC.b #$11                  
                    STA.b $B7                   
                    CLC                         
                    ADC.b #$10                  
CODE_209821:        STA.b $23                   
                    CLC                         
                    ADC.b #$E0                  
                    BCC   CODE_20982A           
                    ADC.b #$00                  
CODE_20982A:        STA.b $24                   
                    RTL                         

CODE_20982D:        STY.b $01                   
                    LDY.b #$00                  
                    STY.b $00                   
                    TYA                         
CODE_209834:        LDX.b $01                   
                    CPX.b #$01                  
                    BEQ   CODE_20983C           
                    STA.b ($00),y               
CODE_20983C:        DEY                         
                    BNE   CODE_209834           
                    DEC.b $01                   
                    BPL   CODE_209834           
                    RTS                         

CODE_209844:        PHY                         
                    PHB                         
                    LDY.b #$7E                  
                    PHY                         
                    PLB                         
                    STA.w $2000,x               
                    STA.w $21B0,x               
                    STA.w $2360,x               
                    STA.w $2510,x               
                    STA.w $26C0,x               
                    STA.w $2870,x               
                    STA.w $2A20,x               
                    STA.w $2BD0,x               
                    STA.w $2D80,x               
                    STA.w $2F30,x               
                    STA.w $30E0,x               
                    STA.w $3290,x               
                    STA.w $3440,x               
                    STA.w $35F0,x               
                    STA.w $37A0,x               
                    STZ.w $4000,x               
                    STZ.w $41B0,x               
                    STZ.w $4360,x               
                    STZ.w $4510,x               
                    STZ.w $46C0,x               
                    STZ.w $4870,x               
                    STZ.w $4A20,x               
                    STZ.w $4BD0,x               
                    STZ.w $4D80,x               
                    STZ.w $4F30,x               
                    STZ.w $50E0,x               
                    STZ.w $5290,x               
                    STZ.w $5440,x               
                    STZ.w $55F0,x               
                    STZ.w $57A0,x               
                    INX                         
                    PLB                         
                    PLY                         
                    RTL                         

CODE_2098A8:        PHY                         
                    PHB                         
                    LDY.b #$7E                  
                    PHY                         
                    PLB                         
                    STA.w $20C0,x               
                    STA.w $2270,x               
                    STA.w $2420,x               
                    STA.w $25D0,x               
                    STA.w $2780,x               
                    STA.w $2930,x               
                    STA.w $2AE0,x               
                    STA.w $2C90,x               
                    STA.w $2E40,x               
                    STA.w $2FF0,x               
                    STA.w $31A0,x               
                    STA.w $3350,x               
                    STA.w $3500,x               
                    STA.w $36B0,x               
                    STA.w $3860,x               
                    STZ.w $40C0,x               
                    STZ.w $4270,x               
                    STZ.w $4420,x               
                    STZ.w $45D0,x               
                    STZ.w $4780,x               
                    STZ.w $4930,x               
                    STZ.w $4AE0,x               
                    STZ.w $4C90,x               
                    STZ.w $4E40,x               
                    STZ.w $4FF0,x               
                    STZ.w $51A0,x               
                    STZ.w $5350,x               
                    STZ.w $5500,x               
                    STZ.w $56B0,x               
                    STZ.w $5860,x               
                    PLB                         
                    PLY                         
                    RTL                         

CODE_20990B:        STZ.w $0700                 
                    STZ.w $0704                 
                    STZ.w $0703                 
                    STZ.w $0701                 
                    STZ.w $0702                 
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.w $1DFE                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $1DFF                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $1E00                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $1E01                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $1E02                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $1E03                 
                    INY                         
                    LDA.w $0414                 
                    BNE   CODE_209974           
                    LDA.b [$2B],y               
                    AND.b #$E0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $CE2A,x               
                    STA.b $55                   
                    LDA.w $CE32,x               
                    STA.b $70                   
                    STZ.b $43                   
                    LDA.w $CE3A,x               
                    STA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
CODE_209974:        LDA.b [$2B],y               
                    AND.b #$0F                  
                    STA.b $22                   
                    STA.w $0376                 
                    INY                         
                    LDA.b [$2B],y               
                    AND.b #$03                  
                    STA.w $073B                 
                    LDA.b [$2B],y               
                    AND.b #$1C                  
                    LSR   A                     
                    LSR   A                     
                    STA.w $073C                 
                    LDA.b [$2B],y               
                    AND.b #$60                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0426                 
                    LDA.b [$2B],y               
                    AND.b #$80                  
                    STA.w $0562                 
                    INY                         
                    LDA.b [$2B],y               
                    AND.b #$80                  
                    STA.w $0379                 
                    LDA.b [$2B],y               
                    AND.b #$60                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0424                 
                    CMP.b #$02                  
                    BNE   CODE_2099DB           
                    LDX.b #$00                  
                    LDA.w $0216                 
                    CMP.b #$B0                  
                    BCC   CODE_2099C4           
                    LDX.b #$EF                  
CODE_2099C4:        STX.w $0216                 
                    TXA                         
                    STA.l $7E398E               
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
CODE_2099DB:        LDA.b [$2B],y               
                    AND.b #$10                  
                    STA.w $0425                 
                    BEQ   CODE_209A09           
                    LDX.w $0414                 
                    BNE   CODE_2099F3           
                    LDA.w $0376                 
                    STA.b $13                   
                    STA.b $55                   
                    JMP.w CODE_209A09           

CODE_2099F3:        STZ.w $0376                 
                    LDA.b $55                   
                    BEQ   CODE_209A03           
                    LDA.b $22                   
                    STA.b $13                   
                    STA.b $55                   
                    STA.w $0376                 
CODE_209A03:        LDA.b $13                   
                    STA.l $7E398D               
CODE_209A09:        LDA.b [$2B],y               
                    AND.b #$0F                  
                    STA.w $1EBA                 
                    INY                         
                    LDA.b [$2B],y               
                    AND.b #$E0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0545                 
                    LDA.b [$2B],y               
                    AND.b #$1F                  
                    STA.w $1EBF                 
                    INY                         
                    LDA.b [$2B],y               
                    AND.b #$30                  
                    ASL   A                     
                    ORA.w $1EBF                 
                    STA.w $1EBF                 
                    LDA.w $0414                 
                    BNE   CODE_209A49           
                    LDA.b [$2B],y               
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
                    LDA.w $CE42,x               
                    STA.w $05EE                 
                    BNE   CODE_209A49           
                    INC.w $05F3                 
CODE_209A49:        LDA.b [$2B],y               
                    AND.b #$0F                  
                    CMP.b #$07                  
                    BNE   CODE_209A6A           
                    LDA.w $0727                 
                    BNE   CODE_209A6A           
                    LDA.w $1E                 
                    BNE   CODE_209A6A           
                    LDX.w $0726                 
                    LDA.l $7E3979,x             
                    CMP.b #$A0                  
                    BNE   CODE_209A6A           
                    LDA.b #$04                  
                    BRA   CODE_209A72           

CODE_209A6A:        LDA.b [$2B],y               
                    AND.b #$0F                  
                    TAX                         
                    LDA.w $CE46,x               
CODE_209A72:        STA.w $1061                 
                    STA.w $1062                 
                    LDA.w $2142                 
                    CMP.b #$0D                  
                    BNE   CODE_209A82           
                    STZ.w $1061                 
CODE_209A82:        INY                         
                    LDA.b [$2B],y               
                    AND.b #$0F                  
                    STA.w $02BF                 
                    LDA.b [$2B],y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02BE                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $0350                 
                    LDA.b $2B                   
                    CLC                         
                    ADC.b #$0D                  
                    STA.b $2B                   
                    LDA.b $2C                   
                    ADC.b #$00                  
                    STA.b $2C                   
                    LDA.b [$2B]                 
                    AND.b #$E0                  
                    CMP.b #$C0                  
                    BNE   CODE_209AE0           
                    LDA.b [$2B]                 
                    AND.b #$0F                  
                    CMP.w $0211                 
                    BNE   CODE_209ACF           
                    LDY.b #$01                  
                    LDA.b [$2B],y               
                    PHA                         
                    AND.b #$0F                  
                    STA.w $073B                 
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $073C                 
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $070A                 
CODE_209ACF:        LDA.w $2B                 
                    CLC                         
                    ADC.b #$03                  
                    STA.w $2B                 
                    LDA.b #$00                  
                    ADC.w $002C                 
                    STA.w $2C                 
CODE_209AE0:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    CMP.b #$FF                  
                    BEQ   CODE_209B29           
                    STA.b $0E                   
                    INY                         
                    LDA.b [$2B],y               
                    STA.b $0F                   
                    INY                         
                    LDA.b [$2B],y               
                    STA.w $0706                 
                    INY                         
                    TYA                         
                    CLC                         
                    ADC.b $2B                   
                    STA.b $2B                   
                    LDA.b $2C                   
                    ADC.b #$00                  
                    STA.b $2C                   
                    LDA.b $0E                   
                    AND.b #$E0                  
                    CMP.b #$E0                  
                    BNE   CODE_209B10           
                    JSL.l CODE_23BED4           
                    BRA   CODE_209AE0           

CODE_209B10:        JSL.l CODE_209B65           
                    LDA.w $0706                 
                    AND.b #$F0                  
                    BEQ   CODE_209B22           
                    JSL.l CODE_209C40           
                    JMP.w CODE_209B26           

CODE_209B22:        JSL.l CODE_209C80           
CODE_209B26:        JMP.w CODE_209AE0           

CODE_209B29:        LDA.w $0350                 
                    BEQ   CODE_209B54           
                    JSL.l CODE_2A8DB6           
                    LDA.w $034F                 
                    BEQ   CODE_209B43           
                    LDA.w $0216                 
                    STA.w $0218                 
                    LDA.w $0217                 
                    STA.w $0219                 
CODE_209B43:        LDA.w $0350                 
                    CMP.b #$03                  
                    BEQ   CODE_209B4E           
                    CMP.b #$24                  
                    BNE   CODE_209B54           
CODE_209B4E:        STZ.w $0218                 
                    STZ.w $0219                 
CODE_209B54:        LDA.w $1EBF                 
                    CMP.b #$07                  
                    BNE   CODE_209B64           
                    STZ.w $05EE                 
                    STZ.w $05EF                 
                    STZ.w $05F0                 
CODE_209B64:        RTL                         

CODE_209B65:        LDA.b $0E                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $06                   
                    LDA.b $0F                   
                    AND.b #$0F                  
                    ORA.b $06                   
                    STA.w $0700                 
                    LDA.b $0F                   
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $0425                 
                    BEQ   CODE_209B92           
                    TXA                         
                    LSR   A                     
                    TAX                         
                    LDA.w $823C,x               
                    STA.b $2E                   
                    LDA.w $824C,x               
                    STA.b $2F                   
                    BRA   CODE_209BB2           

CODE_209B92:        CPX.b #$1E                  
                    BNE   CODE_209B98           
                    DEX                         
                    DEX                         
CODE_209B98:        LDA.b #$7E                  
                    STA.w $30                 
                    LDA.w $8200,x               
                    STA.b $2E                   
                    LDA.w $8201,x               
                    STA.b $2F                   
                    INC   A                     
                    STA.b $04                   
                    LDA.b $0E                   
                    AND.b #$10                  
                    BEQ   CODE_209BB2           
                    INC.b $2F                   
CODE_209BB2:        LDA.b $2F                   
                    STA.b $05                   
                    RTL                         

CODE_209BB7:        PHY                         
                    PHX                         
                    LDA.b $0F                   
                    PHA                         
                    LDA.b $0C                   
                    PHA                         
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $0F                   
                    LDA.b $0E                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ORA.b $0F                   
                    STA.b $0F                   
                    LDA.b $0F                   
                    AND.b #$F8                  
                    LSR   A                     
                    LSR   A                     
                    ORA.b $0C                   
                    STA.b $0C                   
                    LDA.w $0415                 
                    BEQ   CODE_209BE7           
                    LDA.b $0C                   
                    CLC                         
                    ADC.b #$40                  
                    STA.b $0C                   
CODE_209BE7:        LDA.b $0F                   
                    AND.b #$07                  
                    TAX                         
                    LDY.b $0C                   
                    LDA.w $1E04,y               
                    ORA.w $CE52,x               
                    STA.w $1E04,y               
                    PLA                         
                    STA.b $0C                   
                    PLA                         
                    STA.b $0F                   
                    PLX                         
                    PLY                         
                    RTL                         

CODE_209C00:        LDA.w $070A                 
                    JSL.l CODE_20FB3A           

                    dl CODE_29BE08
                    dl CODE_248920
                    dl CODE_268830
                    dl CODE_24ADB8
                    dl CODE_24E668
                    dl CODE_25B038
                    dl CODE_258868
                    dl CODE_25887D
                    dl CODE_258915
                    dl CODE_25D518
                    dl CODE_26B028
                    dl CODE_25B038
                    dl CODE_24E668
                    dl CODE_25B04D
                    dl CODE_24ADB8
                    dl CODE_239110
                    dl CODE_239110
                    dl CODE_239110
                    dl CODE_23A548


CODE_209C40:        LDA.w $070A                 
                    JSL.l CODE_20FB3A           

                    dl DATA_29C1EC
                    dl CODE_24893D
                    dl CODE_268891
                    dl CODE_24ADE3
                    dl CODE_24E695
                    dl CODE_25B06A
                    dl CODE_25892F
                    dl CODE_25892F
                    dl CODE_25892F
                    dl CODE_25D540
                    dl CODE_26B045
                    dl CODE_25B06A
                    dl CODE_24E695
                    dl CODE_25B06A
                    dl CODE_24ADE3
                    dl CODE_239135
                    dl CODE_239135
                    dl CODE_239135
                    dl CODE_23A569
               
CODE_209C80:        LDA.w $070A       
                    JSL.l CODE_20FB3A

                    dl DATA_29C1EC
                    dl CODE_2489EA
                    dl CODE_26895F
                    dl CODE_24AEF3
                    dl CODE_24E75A
                    dl CODE_25B126
                    dl CODE_2589FD
                    dl CODE_2589FD
                    dl CODE_2589FD
                    dl CODE_25D617
                    dl CODE_26B113
                    dl CODE_25B126
                    dl CODE_24E75A
                    dl CODE_25B126
                    dl CODE_24AEF3
                    dl CODE_23914A
                    dl CODE_23914A
                    dl CODE_23914A
                    dl CODE_23A5E8
  
CODE_209CC0:        LDA.w $0425                 
                    BNE   CODE_209CFC           
                    LDX.b $25                   
                    LDA.w $0210                 
                    STA.b $26,x                 
CODE_209CCC:        JSR.w CODE_209DB5           
                    JSL.l CODE_29E953           
                    LDX.b $25                   
                    LDA.b $26,x                 
                    CLC                         
                    ADC.w $CE95,x               
                    STA.b $26,x                 
                    LDX.b $25                   
                    LDA.b $26,x                 
                    AND.b #$08                  
                    CMP.w $CE97,x               
                    BNE   CODE_209CF0           
                    LDA.b $23,x                 
                    CLC                         
                    ADC.w $CE93,x               
                    STA.b $23,x                 
CODE_209CF0:        DEC.w $0612                 
                    BNE   CODE_209CCC           
                    LDA.b #$FF                  
                    STA.b $26                   
                    STA.b $27                   
                    RTS                         

CODE_209CFC:        STZ.b $25                   
                    LDA.b #$E0                  
                    STA.w $0216                 
                    CLC                         
                    ADC.b #$08                  
                    STA.b $26                   
                    LDY.w $0376                 
                    DEY                         
                    TYA                         
                    ORA.b #$E0                  
                    STA.b $23                   
                    LDA.w $0376                 
                    BEQ   CODE_209D23           
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $06                   
                    LDA.b $23                   
                    SEC                         
                    SBC.b $06                   
                    STA.b $23                   
CODE_209D23:        JSR.w CODE_209E7E           
                    JSR.w CODE_209EAE           
                    JSL.l CODE_29EA32           
                    LDA.w $0216                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0216                 
                    AND.b #$08                  
                    BNE   CODE_209D4D           
                    LDA.b $23                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $23                   
                    AND.b #$F0                  
                    BNE   CODE_209D4D           
                    INC.b $23                   
                    LDA.b #$0F                  
                    AND.b $23                   
                    STA.b $23                   
CODE_209D4D:        LDA.w $0216                 
                    CMP.b #$D0                  
                    BNE   CODE_209D23           
                    STZ.w $0216                 
                    STZ.b $26                   
                    RTS                         

CODE_209D5A:        LDA.w $0425                 
                    BEQ   CODE_209D63           
                    JSR.w CODE_209D9E           
                    RTL                         

CODE_209D63:        LDX.b $25                   
                    LDA.w $0210                 
                    AND.b #$F8                  
                    CMP.b $26,x                 
                    BEQ   CODE_209D95           
                    TAY                         
                    LDA.w $0612                 
                    BNE   CODE_209D87           
                    LDA.w $0210                 
                    AND.b #$07                  
                    CPX.b #$00                  
                    BNE   CODE_209D83           
                    CMP.b #$02                  
                    BCS   $06                   
                    BRA   CODE_209D95           

CODE_209D83:        CMP.b #$05                  
                    BCS   $0E                   
CODE_209D87:        STY.b $26,x                 
                    LDA.b $25                   
                    EOR.b #$01                  
                    TAX                         
                    LDA.b #$FF                  
                    STA.b $26,x                 
                    JSR.w CODE_209DB5           
CODE_209D95:        LDA.w $0707                 
                    BEQ   CODE_209D9D           
                    JSR.w CODE_209E7D           
CODE_209D9D:        RTL                         

CODE_209D9E:        LDA.w $0216                 
                    AND.b #$F8                  
                    CMP.b $26                   
                    BEQ   CODE_209DB4           
                    LDA.w $0216                 
                    AND.b #$F8                  
                    STA.b $26                   
                    JSR.w CODE_209E7E           
                    JSR.w CODE_209EAE           
CODE_209DB4:        RTS                         

CODE_209DB5:        LDA.b #$FF                  
                    STA.l $7F2000               
                    LDX.b $25                   
                    LDA.b $26,x                 
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $C2                   
                    LDA.w $0210                 
                    AND.b #$0F                  
                    CPX.b #$00                  
                    BNE   CODE_209DD5           
                    CMP.b #$04                  
                    BCS   $06                   
                    BRA   CODE_209DDE           

CODE_209DD5:        CMP.b #$0C                  
                    BCS   CODE_209DDE                  
                    LDA.b #$01                  
                    STA.w $0707                 
CODE_209DDE:        LDY.w $070A                 
                    LDA.w $CE80,y               
                    STA.b $08                   
                    LDA.w $070A                 
                    ASL   A                     
                    TAY                         
                    LDA.w $CE5A,y               
                    STA.b $06                   
                    LDX.w $CE5B,y               
                    STX.b $07                   
                    LDX.b $25                   
                    LDA.b $23,x                 
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$7E                  
                    STA.b $0F                   
                    REP   #$20                  
                    LDA.w $8200,y               
                    STA.b $0D                   
                    LDA.w #$001A                
                    STA.b $00                   
                    LDA.b $23,x                 
                    AND.w #$000F                
                    STA.b $09                   
                    REP   #$10                  
                    LDX.w #$0000                
CODE_209E1B:        LDY.b $09                   
                    LDA.b [$0D],y               
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $C2                   
                    AND.w #$00FF                
                    BEQ   CODE_209E31           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_209E31:        PHY                         
                    LDA.b $09                   
                    CLC                         
                    ADC.w #$2000                
                    TAY                         
                    LDA.b [$0D],y               
                    AND.w #$00FF                
                    BEQ   CODE_209E46           
                    PLA                         
                    CLC                         
                    ADC.w #$0800                
                    PHA                         
CODE_209E46:        PLY                         
                    LDA.b [$06],y               
                    STA.w $0382,x               
                    INY                         
                    INY                         
                    LDA.b [$06],y               
                    STA.w $0384,x               
                    LDA.b $09                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $09                   
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_209E1B           
                    SEP   #$30                  
                    LDX.b $25                   
                    LDA.b $23,x                 
                    AND.b #$0F                  
                    ASL   A                     
                    ORA.b $C2                   
                    STA.w $0381                 
                    LDA.b $23,x                 
                    AND.b #$10                  
                    BEQ   CODE_209E79           
                    LDA.b #$04                  
CODE_209E79:        STA.w $0380                 
                    RTS                         

CODE_209E7D:        RTS                         

CODE_209E7E:        REP   #$20                  
                    LDX.b $25                   
                    LDA.b $23,x                 
                    AND.w #$00F0                
                    ASL   A                     
                    ASL   A                     
                    XBA                         
                    STA.w $0380                 
                    SEP   #$20                  
                    LDA.b $23,x                 
                    AND.b #$01                  
                    BEQ   CODE_209E9D           
                    LDA.w $0380                 
                    EOR.b #$08                  
                    STA.w $0380                 
CODE_209E9D:        LDA.w $0216                 
                    AND.b #$08                  
                    BEQ   CODE_209EAD           
                    LDA.w $0381                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $0381                 
CODE_209EAD:        RTS                         

CODE_209EAE:        LDX.b $25                   
                    LDA.b $23,x                 
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $823C,y               
                    STA.b $2E                   
                    LDA.w $824C,y               
                    STA.b $2F                   
                    REP   #$20                  
                    LDA.b $23,x                 
                    AND.w #$000F                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $2E                   
                    STA.b $2E                   
                    SEP   #$20                  
                    LDA.b $23,x                 
                    AND.b #$F0                  
                    STA.b $06                   
                    STZ.b $07                   
                    STZ.b $08                   
                    STZ.b $09                   
                    REP   #$30                  
CODE_209EDF:        LDY.b $06                   
                    LDA.b [$2E],y               
                    STA.b $0A                   
                    INC.b $06                   
                    SEP   #$30                  
                    JSL.l CODE_209F37           
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDX.b $08                   
                    LDA.w $0216                 
                    AND.w #$0008                
                    BEQ   CODE_209F03           
                    INY                         
                    INY                         
CODE_209F03:        PHY                         
                    LDA.b $06                   
                    DEC   A                     
                    CLC                         
                    ADC.w #$2000                
                    TAY                         
                    LDA.b [$2E],y               
                    AND.w #$00FF                
                    BEQ   CODE_209F19           
                    PLA                         
                    CLC                         
                    ADC.w #$0800                
                    PHA                         
CODE_209F19:        PLY                         
                    LDA.b [$0C],y               
                    STA.w $0382,x               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.b [$0C],y               
                    STA.w $0384,x               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    STX.b $08                   
                    CPX.w #$0040                
                    BCC   CODE_209EDF           
                    SEP   #$30                  
                    RTS                         

                    RTS                         

CODE_209F37:        LDY.w $070A                 
                    LDA.w $CE80,y               
                    STA.b $0E                   
                    LDA.w $070A                 
                    ASL   A                     
                    TAX                         
                    LDA.w $CE5A,x               
                    STA.b $0C                   
                    LDA.w $CE5B,x               
                    STA.b $0D                   
                    LDY.b $0A                   
                    RTL                         
                    LDX.b $07                   
                    LDA.b [$2E],y               
                    ASL   A                     
                    ROL.w $03F0,x               
                    ASL   A                     
                    ROL.w $03F0,x               
                    DEY                         
                    LDA.b [$2E],y               
                    ASL   A                     
                    ROL.w $03F0,x               
                    ASL   A                     
                    ROL.w $03F0,x               
                    RTS                         
CODE_209F69:        LDA.b $0C                   
                    PHA                         
                    TAY                         
                    LDA.b $0D                   
                    PHA                         
                    JSL.l CODE_209FC1           
                    STA.b $0D                   
                    LDA.w $823C,y               
                    STA.b $2E                   
                    STA.b $D8                   
                    LDA.w $824C,y               
                    STA.b $2F                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$7E                  
                    STA.b $DA                   
                    LDA.b $0D                   
                    AND.b #$F0                  
                    STA.b $0E                   
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $0E                   
                    TAY                         
                    PLA                         
                    STA.b $0D                   
                    PLA                         
                    STA.b $0C                   
                    LDA.b [$D8],y               
                    BEQ   CODE_209FBC           
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
                    BRA   CODE_209FBE           
CODE_209FBC:        LDA.b [$2E],y               
CODE_209FBE:        STA.b $B3                   
                    RTL                         

CODE_209FC1:        CPY.b #$00                  
                    BMI   CODE_209FD3           
                    CLC                         
                    ADC.w $CEB2,y               
                    BCS   $04                   
                    CMP.b #$F0                  
                    BCC   CODE_209FD3           
                    CLC                         
                    ADC.b #$10                  
                    INY                         
CODE_209FD3:        RTL                         

CODE_209FD4:        CPY.b #$00                  
                    BMI   CODE_209FDF           
                    SEC                         
                    SBC.w $CEB2,y               
                    BCS   $01                   
                    DEY                         
CODE_209FDF:        RTL                         

CODE_209FE0:        STZ.b $B4                   
                    STZ.b $B5                   
                    STZ.b $B6                   
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $B2                   
                    LDA.b $0E                   
                    AND.b #$0F                  
                    ASL   A                     
                    TAX                         
                    LDA.w $8200,x               
                    STA.b $2E                   
                    LDA.w $8201,x               
                    STA.b $2F                   
                    LDA.w $821E,x               
                    STA.b $D8                   
                    LDA.w $821F,x               
                    STA.b $D9                   
                    LDA.b #$7E                  
                    STA.b $DA                   
                    LDA.b $0C                   
                    BEQ   CODE_20A014           
                    INC.b $2F                   
                    INC.b $D9                   
CODE_20A014:        LDA.b $0D                   
                    AND.b #$F0                  
                    ORA.b $B2                   
                    STA.b $0B                   
                    TAY                         
                    LDA.b [$D8],y               
                    BEQ   CODE_20A037           
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
                    BRA   CODE_20A039           

CODE_20A037:        LDA.b [$2E],y               
CODE_20A039:        STA.b $B3                   
                    LDY.w $070A                 
                    CPY.b #$03                  
                    BEQ   CODE_20A046           
                    CPY.b #$0E                  
                    BNE   CODE_20A074           
CODE_20A046:        STZ.b $00                   
                    LDA.b $B3                   
                    STA.b $01                   
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDA.b $01                   
                    CMP.w $1E96,y               
                    BCC   CODE_20A074           
                    TYA                         
                    ASL   A                     
                    TAX                         
                    LDA.w $AAD0,x               
                    STA.b $02                   
                    LDA.w $AAD1,x               
                    STA.b $03                   
                    LDX.b $00                   
                    LDA.b $01                   
                    SEC                         
                    SBC.w $1E96,y               
                    TAY                         
                    LDA.b ($02),y               
                    STA.b $B4,x                 
CODE_20A074:        LDA.b $B3                   
                    RTL                         
                    JSR.w CODE_208753           
                    RTL                         
CODE_20A07B:        LDA.w $0243                 
                    BMI   CODE_20A0C5           
                    CMP.b #$08                  
                    BCC   CODE_20A08A           
                    LDA.b #$FF                  
                    STA.w $0243                 
                    RTS                         
CODE_20A08A:        LDX.w $0245                 
                    LDA.w $CA14,x               
                    STA.w $0242                 
                    LDA.w $CA19,x               
                    STA.w $0241                 
                    LDA.w $CA1E,x               
                    STA.w $0240                 
                    LDA.w $0243                 
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w #$0200                
                    STA.w $02CA                 
                    LDA.w $0240                 
                    CLC                         
                    ADC.w $E925,y               
                    STA.w $0240                 
                    LDA.w #$2800                
                    CLC                         
                    ADC.w $E935,y               
                    STA.w $023E                 
                    SEP   #$20                  
                    INC.w $0243                 
CODE_20A0C5:        RTS                         
CODE_20A0C6:        LDA.w $0243                 
                    BMI   CODE_20A111           
                    CMP.b #$04                  
                    BCC   CODE_20A0D5           
                    LDA.b #$FF                  
                    STA.w $0243                 
                    RTS                         
CODE_20A0D5:        LDX.w $0246                 
                    LDA.w $CA23,x               
                    STA.w $0242                 
                    LDA.w $CA26,x               
                    STA.w $0241                 
                    LDA.w $CA29,x               
                    STA.w $0240                 
                    LDA.w $0243                 
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w #$0400                
                    STA.w $02CA                 
                    LDA.w $0240                 
                    CLC                         
                    ADC.w $E925,y               
                    STA.w $0240                 
                    LDA.w #$2800                
                    CLC                         
                    ADC.w $E935,y               
                    STA.w $023E                 
                    SEP   #$20                  
                    INC.w $0243                 
CODE_20A111:        RTS                         

CODE_20A112:        JML.l CODE_009641           

CODE_20A116:        NOP                         
                    NOP                         
                    LDA.b #$AA                  
                    STA.l $702000               
                    CMP.l $700000               
                    BNE   CODE_20A112           
                    LDA.b #$55                  
                    STA.l $702000               
                    CMP.l $700000               
                    BNE   CODE_20A112           
                    SEI                         
                    STZ.w $4200                 
                    STZ.w $420B                 
                    STZ.w $420C                 
                    LDA.b #$80                  
                    STA.w $2100                 
                    REP   #$20                  
                    PHD                         
                    LDA.w #$2100                
                    TCD                         
                    SEP   #$30                  
                    LDA.b #$21                  
                    PHA                         
                    PLB                         
                    LDA.b #$03                  
                    STA.w $021E                 
                    STA.b $01                   
                    LDA.b #$09                  
                    STA.b $05                   
                    STA.w $020C                 
                    STZ.w $020D                 
                    LDA.b #$03                  
                    STA.b $07                   
                    LDA.b #$13                  
                    STA.b $08                   
                    LDA.b #$51                  
                    STA.b $09                   
                    STZ.b $0A                   
                    LDA.b #$22                  
                    STA.b $0B                   
                    LDA.b #$05                  
                    STA.b $0C                   
                    LDA.b #$15                  
                    STA.b $2C                   
                    STA.w $0208                 
                    LDA.b #$02                  
                    STA.b $2D                   
                    STA.w $0209                 
                    LDA.b #$00                  
                    STA.b $30                   
                    STA.w $0203                 
                    LDA.b #$00                  
                    STA.b $31                   
                    STA.w $0204                 
                    LDA.b #$20                  
                    STA.w $0205                 
                    LDA.b #$40                  
                    STA.w $0206                 
                    LDA.b #$80                  
                    STA.w $0207                 
                    STZ.b $33                   
                    PLD                         
                    STZ.w $1208                 
                    STZ.w $1209                 
                    STZ.w $120E                 
                    STZ.w $120F                 
                    STZ.w $120A                 
                    STZ.w $120B                 
                    STA.w $120D                 
                    LDA.b #$01                  
                    STA.w $120C                 
                    JMP.w CODE_208051           

CODE_20A1BE:        STA.b $08                   
                    STX.b $09                   
                    STY.b $0A                   
                    STZ.b $00                   
                    LDA.b #$A5                  
                    STA.b $01                   
                    LDA.b #$7F                  
                    STA.b $02                   
                    JSR.w CODE_20A20A           
                    RTL                         

CODE_20A1D2:        STA.b $08                   
                    STX.b $09                   
                    STY.b $0A                   
                    STZ.b $00                   
                    LDA.b #$60                  
                    STA.b $01                   
                    LDA.b #$7E                  
                    STA.b $02                   
                    JSR.w CODE_20A20A           
                    RTL                         

CODE_20A1E6:        STA.b $08                   
                    STX.b $09                   
                    STY.b $0A                   
                    STZ.b $00                   
                    LDA.b #$80                  
                    STA.b $01                   
                    LDA.b #$7E                  
                    STA.b $02                   
                    JSR.w CODE_20A20A           
                    RTL                         

                    STA.b $08                   
                    STX.b $09                   
                    STY.b $0A                   
                    STZ.b $00                   
                    LDA.b #$00                  
                    STA.b $01                   
                    LDA.b #$7F                  
                    STA.b $02                   
CODE_20A20A:        REP   #$10                  
                    LDY.w #$0000                
CODE_20A20F:        JSR.w CODE_20A2A5           
                    CMP.b #$FF                  
                    BNE   CODE_20A219           
                    SEP   #$10                  
                    RTS                         

CODE_20A219:        STA.b $05                   
                    AND.b #$E0                  
                    CMP.b #$E0                  
                    BEQ   CODE_20A22B           
                    PHA                         
                    LDA.b $05                   
                    REP   #$20                  
                    AND.w #$001F                
                    BRA   CODE_20A23D           

CODE_20A22B:        LDA.b $05                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    AND.b #$E0                
                     PHA
                    LDA.b $05                   
                    AND.b #$03       
                     XBA         
                    JSR.w CODE_20A2A5           
                    REP   #$20                  
CODE_20A23D:        INC   A                     
                    STA.b $03                   
                    SEP   #$20                  
                    PLA                         
                    BEQ   CODE_20A25B           
                    BMI   CODE_20A28D           
                    ASL   A                     
                    BPL   CODE_20A26A           
                    ASL   A                     
                    BPL   CODE_20A277           
                    JSR.w CODE_20A2A5           
                    LDX.b $03                   
CODE_20A252:        STA.b [$00],y               
                    INC   A                     
                    INY                         
                    DEX                         
                    BNE   CODE_20A252           
                    BRA   CODE_20A20F           

CODE_20A25B:        JSR.w CODE_20A2A5           
                    STA.b [$00],y               
                    INY                         
                    LDX.b $03                   
                    DEX                         
                    STX.b $03                   
                    BNE   CODE_20A25B           
                    BRA   CODE_20A20F           

CODE_20A26A:        JSR.w CODE_20A2A5           
                    LDX.b $03                   
CODE_20A26F:        STA.b [$00],y               
                    INY                         
                    DEX                         
                    BNE   CODE_20A26F           
                    BRA   CODE_20A20F           

CODE_20A277:        JSR.w CODE_20A2B4           
                    LDX.b $03                   
CODE_20A27C:        XBA                         
                    STA.b [$00],y               
                    INY                         
                    DEX                         
                    BEQ   CODE_20A28A           
                    XBA                         
                    STA.b [$00],y               
                    INY                         
                    DEX                         
                    BNE   CODE_20A27C           
CODE_20A28A:        JMP.w CODE_20A20F           

CODE_20A28D:        JSR.w CODE_20A2B4           
                    TAX                         
CODE_20A291:        PHY                         
                    TXY                         
                    LDA.b [$00],y               
                    PLY                         
CODE_20A296:        STA.b [$00],y               
                    INY                         
                    INX                         
                    REP   #$20                  
                    DEC.b $03                   
                    SEP   #$20                  
                    BNE   CODE_20A291           
                    JMP.w CODE_20A20F           

CODE_20A2A5:        LDA.b [$08]                 
                    LDX.b $08                   
                    INX                         
                    BNE   CODE_20A2B1           
                    LDX.b #$00                  
                    BRA   CODE_20A296           

                    ASL   A                     
CODE_20A2B1:        STX.b $08                   
                    RTS                         

CODE_20A2B4:        LDA.b [$08]                 
                    LDX.b $08                   
                    INX                         
                    BNE   CODE_20A2C0           
                    LDX.b #$00                  
                    BRA   CODE_20A2A5           

                    ASL   A                   ;0 S:01FF P:EnvMxdIzc HC:17998 VC:000 FC:00 I:00
CODE_20A2C0:        STX.b $08                 ;0 S:01FF P:EnvMxdIzc HC:18014 VC:000 FC:00 I:00
                    XBA                       ;0 S:01FF P:EnvMxdIzc HC:18030 VC:000 FC:00 I:00
                    LDA.b [$08]               ;0 S:01FF P:EnvMxdIzc HC:18046 VC:000 FC:00 I:00
                    INX                       ;0 S:01FF P:EnvMxdIzc HC:18062 VC:000 FC:00 I:00
                    BNE   CODE_20A2CD         ;0 S:01FF P:EnvMxdIzc HC:18078 VC:000 FC:00 I:00
                    LDX.w #$8000              ;0 S:01FF P:EnvMxdIzc HC:18094 VC:000 FC:00 I:00
                    INC.b $0A                 ;0 S:01FF P:EnvMxdIzc HC:18110 VC:000 FC:00 I:00
CODE_20A2CD:        STX.b $08                 ;0 S:01FF P:EnvMxdIzc HC:18126 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMxdIzc HC:18142 VC:000 FC:00 I:00

CODE_20A2D0:        STZ.b $01                   
                    LDA.b #$BF                  
                    STA.b $00                   
                    JSR.w CODE_20FA17           
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_25F05A           
                    JSL.l CODE_25F934           
                    STZ.w $4200                 
                    LDA.b #$11                  
                    STA.w $020F                 
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
                    LDA.b #$04                  
                    STA.w $05EE                 
                    STZ.b $12                   
                    STZ.w $0210                 
                    STZ.w $0211                 
                    STZ.b $13                   
                    STZ.w $0216                 
                    STZ.w $0217                 
                    STZ.b $23                   
                    STZ.b $24                   
                    STZ.b $25                   
                    LDA.b #$00                  
                    STA.l $7E3966               
                    STA.l $7E3965               
                    STA.l $7E3964               
                    STZ.b $00                   
                    LDX.b #$05                  
                    STX.b $01                   
                    LDY.b #$9D                  
CODE_20A327:        STA.b ($00),y               
                    DEY                         
                    BPL   CODE_20A327           
                    LDA.w $A381                 
                    STA.b $2B                   
                    LDA.w $A382                 
                    STA.b $2C                   
                    LDA.b #$21                  
                    STA.b $2D                   
                    LDY.w $070A                 
                    LDA.w $C975,y               
                    STA.w $0739                 
                    STZ.w $1CF2                 
                    JSL.l CODE_209C00           
                    JSR.w CODE_209683           
                    LDA.b #$11                  
                    STA.w $0208                 
                    LDA.b #$02                  
                    STA.w $0209                 
                    LDA.b #$02                  
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    JSL.l CODE_20AFC3           
                    LDA.b #$26                  
                    STA.w $0612                 
                    JSR.w CODE_209CC0           
                    JSL.l CODE_25F0A6           
                    LDA.b #$00                  
                    STA.l $7E3955               
                    JSL.l CODE_29E29D           
                    LDA.b #$80                  
                    STA.w $4200                 
CODE_20A380:        LDA.b #$16                  
                    LDY.w $1F26                 
                    BEQ   CODE_20A389           
                    LDA.b #$11                  
CODE_20A389:        STA.w $1202                 
CODE_20A38C:        JSR.w CODE_20801F           
                    JSL.l CODE_22E0A9           
                    JSL.l CODE_26CBB0           
                    LDA.w $14                 
                    BEQ   CODE_20A38C           
                    LDA.w $078C                 
                    DEC   A                     
                    EOR.b #$01                  
                    TAX                         
                    LDA.b #$01                  
                    STA.w $1203                 
                    INC.w $02DA,x               
                    LDA.w $02DA,x               
                    CMP.b #$05                  
                    BCC   CODE_20A3BA           
                    INC.w $02DE,x               
                    LDA.b #$05                  
                    STA.w $1203                 
CODE_20A3BA:        JSL.l CODE_25F1E1           
                    JSL.l CODE_22E0A9           
CODE_20A3C2:        JSL.l CODE_25F956           
                    JSR.w CODE_20801F           
                    LDA.w $14                 
                    BNE   CODE_20A3C2           
                    REP   #$20                  
                    LDA.w #$4900                
                    STA.l $001602               
                    LDA.w #$5400                
                    STA.l $001610               
                    LDA.w #$0900                
                    STA.l $001604               
                    STA.l $001612               
                    LDA.w #$182D                
                    STA.l $001606               
                    STA.l $001608               
                    STA.l $00160A               
                    STA.l $00160C               
                    STA.l $00160E               
                    LDA.w #$1C2D                
                    STA.l $001614               
                    STA.l $001616               
                    STA.l $001618               
                    STA.l $00161A               
                    STA.l $00161C               
                    LDA.w #$FFFF                
                    STA.l $00161E               
                    SEP   #$20                  
                    JSL.l CODE_26CC15           
                    INC.w $0211                 
                    INC.w $0014                 
                    STZ.w $0356                 
                    JSL.l CODE_25F384           
                    LDA.l $7F300C               
                    BEQ   CODE_20A43E           
                    JSR.w CODE_20801F           
                    JML.l CODE_0080DE           

CODE_20A43E:        JSR.w CODE_20801F           
                    JSL.l CODE_25F9A1           
                    LDA.w $14                 
                    BNE   CODE_20A43E           
                    STZ.w $0075                 
                    STZ.w $192E                 
                    STZ.w $192F                 
                    JMP.w CODE_20A380           

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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

DATA_20A4B0:        db $01,$FF,$02,$FF,$00,$01

CODE_20A4B6:        LDA.b $28                   
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20D301,x             
                    STA.b $36                   
                    LDA   PNTR_20D301+1,x             
                    STA.b $37                   
                    LDA.b #$20                  
                    STA.b $38                   
                    LDA.b #$01                  
                    STA.b $1C                   
                    STZ.w $0154                 
CODE_20A4D1:        LDA.w $0154                 
                    BPL   CODE_20A4D1           
                    STZ.b $1C                   
                    CLI                         
                    RTS                         

CODE_20A4DA:        REP   #$20                  
                    LDA.w #$C000                
                    STA.b $0D                   
                    LDX.b #$37                  
                    STX.b $0F                   
                    LDA.w #$2000                
                    STA.b $0B                   
                    JSR.w CODE_20AFF0           
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$3A                  
                    STX.b $0F                   
                    LDA.w #$3000                
                    STA.b $0B                   
                    JSR.w CODE_20AFF0           
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$3A                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3C00                
                    JSR.w CODE_20AFF0           
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$35                  
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$4800                
                    JSR.w CODE_20AFF0           
                    LDA.w #$C800                
                    STA.b $0D                   
                    LDX.b #$37                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$6400                
                    JSR.w CODE_20B016           
                    LDA.w #$A000                
                    STA.b $0D                   
                    LDX.b #$30                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$6800                
                    JSR.w CODE_20B016           
                    LDA.w #$F800                
                    STA.b $0D                   
                    LDX.b #$37                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$6C00                
                    JSR.w CODE_20B016           
                    LDA.w #$F800                
                    STA.b $0D                   
                    LDX.b #$35                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7000                
                    JSR.w CODE_20B016           
                    LDA.w #$F000                
                    STA.b $0D                   
                    LDX.b #$37                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7800                
                    JSR.w CODE_20B016           
                    SEP   #$20                  
                    RTS                         

CODE_20A58D:        LDA.w #$8000                  
                    STA.b $0D
                    LDX.b #$39                 
                    STX.b $0F                   
                    LDA.w #$4000                
                    STA.b $0B                   
                    JSR.w CODE_20B013           
                    BRL   CODE_20AEDC           

DATA_20A5A1:        db $00,$80,$00,$C0,$00,$80,$00,$E0
                    db $00,$E0,$00,$C0,$00,$C0,$00,$E0
                    db $00,$C0,$00,$80,$00,$A0,$00,$F0
                    db $00,$C0,$00,$C0,$00,$E0,$00,$A0
                    db $00,$E0,$00,$E0,$00,$C0,$00,$E0
                    db $00,$C0,$00,$A0,$00,$C0,$00,$80
                    db $00,$E0,$00,$80,$00,$80,$00,$E0
                    db $00,$C0,$00,$E0,$00,$F0,$00,$C0
                    db $00,$C0,$00,$C0,$00,$E0,$00,$C0
                    db $00,$E0,$00,$C0,$00,$E0,$00,$E0
                    db $00,$80,$00,$C0,$00,$80,$00,$F0
                    db $00,$80,$00,$A0,$00,$F0,$00,$F0

DATA_20A601:        db $30,$30,$31,$31,$30,$35,$35,$35
                    db $35,$33,$33,$36,$31,$33,$31,$32
                    db $32,$35,$35,$36,$36,$33,$32,$33
                    db $36,$31,$31,$36,$30,$31,$36,$30
                    db $30,$30,$31,$31,$31,$31,$36,$31
                    db $33,$30,$31,$36,$31,$33,$36,$36

DATA_20A631:        db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$F0,$00,$80,$00,$F0
                    db $00,$80,$00,$80,$00,$D0,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$F0
                    db $00,$F0,$00,$F0,$00,$F0,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$D0,$00,$80,$00,$80

DATA_20A691:        db $30,$36,$36,$36,$36,$33,$36,$35
                    db $36,$36,$36,$36,$36,$36,$36,$35
                    db $32,$35,$3F,$36,$36,$37,$36,$36
                    db $36,$36,$36,$36,$36,$36,$36,$36
                    db $36,$36,$36,$36,$36,$36,$36,$36
                    db $36,$36,$36,$36,$36,$36,$36,$36

DATA_20A6C1:        db $00,$80,$00,$98,$00,$80,$00,$A0
                    db $00,$90,$00,$F0,$00,$98,$00,$F0
                    db $00,$A0,$00,$E8,$00,$D8,$00,$90
                    db $00,$A8,$00,$80,$00,$80,$00,$F0
                    db $00,$F0,$00,$90,$00,$80,$00,$98
                    db $00,$90,$00,$F0,$00,$80,$00,$80
                    db $00,$98,$00,$80,$00,$80,$00,$98
                    db $00,$A8,$00,$A0,$00,$90,$00,$A8
                    db $00,$80,$00,$80,$00,$A0,$00,$A8
                    db $00,$A0,$00,$80,$00,$98,$00,$A0
                    db $00,$80,$00,$98,$00,$80,$00,$90
                    db $00,$80,$00,$D8,$00,$90,$00,$90

DATA_20A721:        db $30,$3A,$36,$3A,$3A,$33,$3A,$35
                    db $2D,$3A,$3A,$3A,$3A,$36,$36,$35
                    db $32,$3A,$36,$3A,$3A,$31,$36,$36
                    db $3A,$36,$36,$3A,$3A,$3A,$3A,$3A
                    db $36,$36,$3A,$3A,$3A,$36,$3A,$3A
                    db $36,$3A,$36,$3A,$36,$3A,$3A,$3A

DATA_20A751:        db $80,$36,$C0,$3A,$D0,$3A,$D8,$3A
                    db $F0,$3A,$E0,$3A,$80,$2D,$B0,$2D
                    db $90,$2D,$A0,$2D,$C0,$2D,$F8,$3A
                    db $B8,$2D,$D0,$2D,$D0,$2D,$E0,$2D
                    db $B0,$30,$F0,$31,$B0,$32,$E8,$3A
                    db $90,$33,$F8,$3A,$D0,$33,$B0,$3A
                    db $F0,$2D,$D0,$2D,$E0,$3A,$C0,$34
                    db $A0,$35,$E0,$2D,$D0,$33,$B0,$30
                    db $80,$36,$C0,$3A,$90,$32,$D0,$3A
                    db $D8,$3A,$C0,$3A

DATA_20A79D:        db $80,$36,$C8,$3A
                    db $80,$36,$80,$36,$F8,$3A,$80,$36
                    db $88,$2D,$A8,$2D,$98,$2D,$A8,$2D
                    db $C8,$2D,$80,$36,$80,$36,$D8,$2D
                    db $D8,$2D,$E8,$2D,$80,$36,$F8,$31
                    db $B0,$32,$80,$36,$80,$36,$80,$36
                    db $80,$36,$80,$36,$F8,$2D,$D8,$2D
                    db $80,$36,$C8,$34,$A8,$35,$E8,$2D
                    db $80,$36,$80,$36,$C8,$3A,$C8,$3A
                    db $98,$32,$80,$36,$80,$36,$C8,$3A

DATA_20A7E9:        db $00,$80,$00,$D0,$00,$80,$00,$80
                    db $00,$D0,$00,$F8,$00,$80,$00,$F8
                    db $00,$80,$00,$E8,$00,$D0,$00,$D0
                    db $00,$80,$00,$80,$00,$80,$00,$F8
                    db $00,$F8,$00,$F8,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$D0
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$E8,$00,$E8,$00,$80
                    db $00,$90,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$D8,$00,$80,$00,$80

DATA_20A849:        db $30,$33,$36,$36,$33,$33,$36,$35
                    db $36,$3A,$3A,$33,$36,$36,$36,$35
                    db $32,$35,$36,$36,$36,$37,$36,$36
                    db $36,$36,$36,$33,$36,$36,$36,$36
                    db $36,$3A,$3A,$36,$33,$36,$36,$36
                    db $36,$36,$36,$36,$36,$36,$3A,$36

DATA_20A879:        db $00,$80,$00,$A8,$00,$80,$00,$80
                    db $00,$A8,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$A8,$00,$80,$00,$80
                    db $00,$A8,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$A8
                    db $00,$A8,$00,$80,$00,$80,$00,$80
                    db $00,$A8,$00,$80,$00,$80,$00,$80
                    db $00,$A8,$00,$80,$00,$80,$00,$A8
                    db $00,$80,$00,$A8,$00,$A8,$00,$A8
                    db $00,$80,$00,$80,$00,$A8,$00,$80
                    db $00,$80,$00,$A8,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$80,$00,$80

DATA_20A8D9:        db $30,$3A,$36,$36,$3A,$36,$36,$36
                    db $36,$3A,$36,$36,$3A,$36,$36,$36
                    db $36,$36,$36,$3A,$3A,$36,$36,$36
                    db $3A,$36,$36,$36,$3A,$36,$36,$3A
                    db $36,$3A,$3A,$3A,$36,$36,$3A,$36
                    db $36,$3A,$36,$3A,$36,$36,$36,$36

DATA_20A909:        db $00,$80,$00,$A0,$00,$A0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$E0
                    db $00,$A0,$00,$A0,$00,$E0,$00,$A0
                    db $00,$E0,$00,$E0,$00,$A8,$00,$A0
                    db $00,$A0,$00,$A0,$00,$C0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$A0
                    db $00,$E0,$00,$A0,$00,$A0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$A0
                    db $00,$A0,$00,$A0,$00,$A0,$00,$A0

DATA_20A969:        db $30,$30,$30,$30,$30,$30,$30,$30
                    db $30,$30,$30,$33,$30,$30,$36,$35
                    db $32,$35,$30,$30,$30,$30,$36,$30
                    db $30,$30,$30,$30,$33,$30,$30,$30
                    db $30,$30,$30,$30,$30,$30,$30,$30
                    db $30,$30,$30,$30,$30,$30,$30,$30

DATA_20A999:        db $00,$80,$00,$A0,$00,$90,$00,$D8
                    db $00,$F0,$00,$C0,$00,$D0,$00,$A8
                    db $00,$D0,$00,$98,$00,$88,$00,$E8
                    db $00,$D0,$00,$F0,$00,$E0,$00,$D8
                    db $00,$90,$00,$D0,$00,$B0,$00,$F0
                    db $00,$D0,$00,$90,$00,$D0,$00,$90
                    db $00,$98,$00,$D0,$00,$90,$00,$D0
                    db $00,$E8,$00,$90,$00,$80,$00,$D0
                    db $00,$A0,$00,$E0,$00,$E0,$00,$F0
                    db $00,$D0,$00,$90,$00,$D0,$00,$D0
                    db $00,$D0,$00,$D0,$00,$90,$00,$90
                    db $00,$90,$00,$88,$00,$D0,$00,$80

DATA_20A9F9:        db $30,$34,$31,$30,$30,$33,$31,$30
                    db $35,$30,$30,$33,$30,$30,$36,$32
                    db $33,$35,$30,$30,$30,$30,$32,$31
                    db $30,$31,$31,$31,$33,$31,$30,$30
                    db $34,$34,$34,$30,$30,$31,$30,$31
                    db $30,$30,$31,$31,$31,$30,$31,$30

DATA_20AA29:        db $00,$80,$00,$F8,$00,$98,$00,$F8
                    db $00,$F8,$00,$F8,$00,$F8,$00,$F8
                    db $00,$F8,$00,$F8,$00,$80,$00,$F8
                    db $00,$F8,$00,$F8,$00,$E0,$00,$A0
                    db $00,$A8,$00,$D8,$00,$B8,$00,$F8
                    db $00,$F8,$00,$80,$00,$C0,$00,$98
                    db $00,$F8,$00,$F8,$00,$F8,$00,$F8
                    db $00,$F8,$00,$98,$00,$F8,$00,$F8
                    db $00,$F8,$00,$F8,$00,$F8,$00,$F8
                    db $00,$F8,$00,$98,$00,$F8,$00,$F8
                    db $00,$F8,$00,$F8,$00,$98,$00,$98
                    db $00,$98,$00,$80,$00,$F8,$00,$F8

DATA_20AA89:        db $30,$34,$31,$34,$34,$34,$34,$34
                    db $34,$34,$30,$34,$34,$34,$36,$35
                    db $35,$32,$30,$34,$34,$30,$36,$31
                    db $34,$34,$34,$34,$34,$31,$34,$34
                    db $34,$34,$34,$34,$34,$31,$34,$34
                    db $34,$34,$35,$35,$31,$30,$34,$34

DATA_20AAB9:        db $00,$80,$00,$D8,$00,$E8,$00,$D8
                    db $00,$F8,$00,$C0,$00,$D8,$00,$E0
                    db $00,$A0,$00,$80,$00,$D8,$00,$F0
                    db $00,$C0,$00,$D8,$00,$E0,$00,$A0
                    db $00,$A8,$00,$D8,$00,$B8,$00,$D8
                    db $00,$D8,$00,$E8,$00,$C0,$00,$E8
                    db $00,$80,$00,$80,$00,$E8,$00,$D8
                    db $00,$F0,$00,$E8,$00,$D8,$00,$D8
                    db $00,$D8,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$E8,$00,$80,$00,$D8
                    db $00,$80,$00,$D8,$00,$E8,$00,$E8
                    db $00,$80,$00,$D8,$00,$D8,$00,$80

DATA_20AB19:        db $30,$30,$34,$30,$34,$33,$31,$35
                    db $36,$36,$34,$33,$36,$30,$36,$35
                    db $35,$32,$30,$30,$30,$34,$36,$34
                    db $36,$36,$34,$31,$33,$34,$30,$30
                    db $30,$30,$30,$30,$30,$34,$30,$31
                    db $30,$30,$34,$34,$35,$34,$31,$30

DATA_20AB49:        db $00,$80,$00,$F0,$00,$98,$00,$E0
                    db $00,$F8,$00,$C0,$00,$C0,$00,$E0
                    db $00,$A0,$00,$F0,$00,$A0,$00,$F0
                    db $00,$F0,$00,$F0,$00,$E0,$00,$A0
                    db $00,$A8,$00,$D8,$00,$B8,$00,$F0
                    db $00,$C0,$00,$98,$00,$C0,$00,$98
                    db $00,$80,$00,$80,$00,$98,$00,$C0
                    db $00,$F0,$00,$98,$00,$98,$00,$98
                    db $00,$98,$00,$80,$00,$80,$00,$80
                    db $00,$80,$00,$98,$00,$80,$00,$80
                    db $00,$80,$00,$80,$00,$98,$00,$98
                    db $00,$88,$00,$F0,$00,$80,$00,$F0

DATA_20ABA9:        db $30,$34,$33,$36,$34,$33,$36,$35
                    db $36,$34,$36,$34,$34,$34,$36,$35
                    db $35,$32,$30,$34,$36,$33,$36,$33
                    db $36,$36,$33,$36,$36,$33,$34,$34
                    db $34,$30,$30,$30,$30,$33,$30,$30
                    db $30,$30,$33,$33,$35,$34,$30,$34

DATA_20ABD9:        db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$E0
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$E0,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$E0,$00,$E0,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$A8,$00,$A8,$00,$A8,$00,$A8
                    db $00,$90,$00,$A8,$00,$A8,$00,$A8

DATA_20AC39:        db $30,$30,$30,$30,$30,$30,$30,$30
                    db $30,$30,$30,$34,$30,$30,$30,$30
                    db $30,$30,$30,$30,$30,$30,$30,$30
                    db $30,$30,$30,$30,$34,$30,$30,$30
                    db $30,$34,$34,$30,$30,$30,$30,$30
                    db $30,$30,$30,$30,$35,$30,$30,$30
                    db $34,$34,$34,$34,$34,$34,$34,$34

DATA_20AC71:        db $00,$80,$00,$80,$00,$88,$00,$88
                    db $00,$90,$00,$90,$00,$98,$00,$F0

CODE_20AC81:        PHB                         
                    PHK                         
                    PLB                         
                    REP   #$20                  
                    LDY.w $1EBF                 
                    STY.b $00                   
                    LDA   DATA_20A601,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A5A1,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$2000                
                    JSR.w CODE_20AFF0           
                    LDX.b $00                   
                    CPX.b #$0F                  
                    BNE   CODE_20ACC7           
                    LDX.w $0726                 
                    BEQ   CODE_20ACC7           
                    STZ.b $0D                   
                    LDA.w #$3280                
                    STA.b $0E                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2400                
                    JSR.w CODE_20AFF0           
CODE_20ACC7:        LDA.w $0567                 
                    AND.w #$00FF                
                    BEQ   CODE_20ACDA           
                    LDY.b #$33                  
                    STY.b $0F                   
                    LDA.w #$F000                
                    STA.b $0D                   
                    BRA   CODE_20ACE7           

CODE_20ACDA:        LDA   DATA_20A631,y               
                    STA.b $0D                   
                    LDY.b $00                   
                    LDA   DATA_20A691,y               
                    TAX                         
                    STX.b $0F                   
CODE_20ACE7:        LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$2800                
                    JSR.w CODE_20AFF0           
                    LDY.w $1EBF                 
                    LDA   DATA_20A721,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A6C1,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3000                
                    JSR.w CODE_20AFF0           
                    STZ.b $0D                   
                    LDA.w $0350                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A751,y               
                    STA.b $0E                   
                    LDA.w $02BF                 
                    AND.w #$00FF                
                    CMP.w #$0006                
                    BNE   CODE_20AD33           
                    LDA.w #$3AC0                
                    STA.b $0E                   
CODE_20AD33:        LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3400                
                    JSR.w CODE_20AFF0           
                    STZ.b $0D                   
                    LDA.w $0350                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A79D,y               
                    STA.b $0E                   
                    LDA.w $02BF                 
                    AND.w #$00FF                
                    CMP.w #$0006                
                    BNE   CODE_20AD5D           
                    LDA.w #$3AC8                
                    STA.b $0E                   
CODE_20AD5D:        LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3800                
                    JSR.w CODE_20AFF0           
                    LDY.w $1EBF                 
                    LDA   DATA_20A849,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A7E9,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3C00                
                    JSR.w CODE_20AFF0           
                    LDY.w $1EBF                 
                    LDA   DATA_20A8D9,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A879,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$4000                
                    JSR.w CODE_20AFF0           
                    LDA.w #$B800                
                    STA.b $0D                   
                    LDX.b #$32                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$4400                
                    JSR.w CODE_20AFF0           
                    LDY.w $1EBF                 
                    CPY.b #$16                  
                    BNE   CODE_20ADCA           
                    BRL   CODE_20A58D           
CODE_20ADCA:        LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$3F                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    JSR.w CODE_20B013           
                    LDY.w $1EBF                 
                    LDA   DATA_20A969,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A909,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$6400                
                    JSR.w CODE_20B016           
                    LDY.w $1EBF                 
                    LDA   DATA_20A9F9,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20A999,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$6800                
                    JSR.w CODE_20B016           
                    LDY.w $1EBF                 
                    LDA   DATA_20AA89,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20AA29,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$6C00                
                    JSR.w CODE_20B016           
                    LDY.w $1EBF                 
                    LDA   DATA_20AB19,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20AAB9,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7000                
                    JSR.w CODE_20B016           
                    LDY.w $1EBF                 
                    CPY.b #$0A                  
                    BNE   CODE_20AE87           
                    LDA.w $0727                 
                    AND.w #$00FF                
                    TAY                         
                    LDA.w $AC69,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20AC71,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    BRA   CODE_20AE9B           

CODE_20AE87:        LDA   DATA_20ABA9,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20AB49,y               
                    STA.b $0D                   
                    STX.b $0F                   
CODE_20AE9B:        LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7400                
                    JSR.w CODE_20B016           
                    LDY.w $1EBF                 
                    LDA   DATA_20AC39,y               
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA   DATA_20ABD9,y               
                    STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7800                
                    JSR.w CODE_20B016           
                    LDA.w #$B800                
                    STA.b $0D                   
                    LDX.b #$3F                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7C00                
                    JSR.w CODE_20B016           
CODE_20AEDC:        SEP   #$20                  
                    LDA.w $02BF                 
                    CMP.b #$02                  
                    BEQ   CODE_20AF14           
                    CMP.b #$05                  
                    BEQ   CODE_20AF14           
                    CMP.b #$07                  
                    BEQ   CODE_20AF14           
                    CMP.b #$08                  
                    BEQ   CODE_20AF14           
                    CMP.b #$09                  
                    BEQ   CODE_20AF27           
                    CMP.b #$0A                  
                    BEQ   CODE_20AF3A           
                    CMP.b #$0B                  
                    BEQ   CODE_20AF27           
                    CMP.b #$0C                  
                    BEQ   CODE_20AF14           
                    CMP.b #$0E                  
                    BEQ   CODE_20AF14           
                    CMP.b #$0F                  
                    BEQ   CODE_20AF27           
                    CMP.b #$03                  
                    BEQ   CODE_20AF4D           
                    CMP.b #$04                  
                    BEQ   CODE_20AF4D           
                    JMP.w CODE_20AF6D           

CODE_20AF14:        REP   #$20                  
                    LDA.w #$5800                
                    STA.w $2116                 
                    LDA.w #$0400                
                    STA.w $4305                 
                    LDA.w #$A000                
                    BRA   CODE_20AF5E           

CODE_20AF27:        REP   #$20                  
                    LDA.w #$5800                
                    STA.w $2116                 
                    LDA.w #$0400                
                    STA.w $4305                 
                    LDA.w #$A400                
                    BRA   CODE_20AF5E           

CODE_20AF3A:        REP   #$20                  
                    LDA.w #$5800                
                    STA.w $2116                 
                    LDA.w #$0400                
                    STA.w $4305                 
                    LDA.w #$A800                
                    BRA   CODE_20AF5E           

CODE_20AF4D:        REP   #$20                  
                    LDA.w #$5800                
                    STA.w $2116                 
                    LDA.w #$0400                
                    STA.w $4305                 
                    LDA.w #$AC00                
CODE_20AF5E:        STA.w $4302                 
                    SEP   #$20                  
                    LDA.b #$38                  
                    STA.w $4304                 
                    LDA.b #$01                  
                    STA.w $420B                 
CODE_20AF6D:        PLB                         
                    RTL                         

CODE_20AF6F:        REP   #$20                  
                    LDA.w #$C000                
                    STA.b $0D                   
                    LDX.b #$32                  
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    JSR.w CODE_20B013           
                    SEP   #$20                  
                    RTL                         

CODE_20AF85:        REP   #$20                  
                    LDA.w #$8000                
                    STA.b $0D                   
                    LDX.b #$3A                  
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$3800                
                    JSR.w CODE_20AFF0           
                    LDA.w #$B400                
                    STA.b $0D                   
                    LDX.b #$3F                  
                    STX.b $0F                   
                    LDA.w #$0400                
                    STA.b $0B                   
                    JSR.w CODE_20B013           
                    LDA.w #$D400                
                    STA.b $0D                   
                    LDX.b #$32                  
                    STX.b $0F                   
                    LDA.w #$0C00                
                    STA.b $0B                   
                    LDA.w #$6200                
                    JSR.w CODE_20B016           
                    SEP   #$20                  
                    RTL                         

CODE_20AFC3:        REP   #$20                  
                    LDA.w #$E000                
                    STA.b $0D                   
                    LDX.b #$3F                  
                    STX.b $0F                   
                    LDA.w #$2000                
                    STA.b $0B                   
                    LDA.w #$6000                
                    JSR.w CODE_20B016           
                    LDA.w #$A000                
                    STA.b $0D                   
                    LDX.b #$3D                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7000                
                    JSR.w CODE_20B016           
                    SEP   #$20                  
                    RTL                         

CODE_20AFF0:        LDX.b #$80                  
                    STX.w $2115                 
                    STA.w $2116                 
                    LDA.b #$01                  
                    CLC                         
                    STA.w $4300                 
                    LDA.b $0D                   
                    STA.w $4302                 
                    LDX.b $0F                   
                    STX.w $4304                 
                    LDA.b $0B                   
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    RTS                         

CODE_20B013:        LDA.b #$00                  
                    RTS                         

CODE_20B016:        LDX.b #$80                  
                    STX.w $2115                 
                    STA.w $2116                 
                    LDA.b #$01                  
                    CLC                         
                    STA.w $4300                 
                    LDA.b $0D                   
                    STA.w $4302                 
                    LDX.b $0F                   
                    STX.w $4304                 
                    LDA.b $0B                   
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    RTS                         

CODE_20B039:        REP   #$30                  
                    LDX.w #$001E                
                    LDA.w #$0000                
CODE_20B041:        STA.w $1300,x               
                    STA.w $1320,x               
                    STA.w $1340,x               
                    STA.w $1360,x               
                    STA.w $1380,x               
                    STA.w $13A0,x               
                    STA.w $13C0,x               
                    STA.w $13E0,x               
                    STA.w $1400,x               
                    STA.w $1420,x               
                    STA.w $1440,x               
                    STA.w $1460,x               
                    STA.w $1480,x               
                    STA.w $14A0,x               
                    STA.w $14C0,x               
                    STA.w $14E0,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_20B041           
                    PHB                         
                    LDX.w #$A400                
                    LDY.w #$1300                
                    LDA.w #$007F                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w #$0000                
                    STA.w $1300                 
                    STA.w $1310                 
                    STA.w $133E                 
                    STA.w $135E                 
                    SEP   #$30                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

CODE_20B09A:        REP   #$30                  
                    LDX.w #$001E                
                    LDA.w #$0000                
CODE_20B0A2:        STA.w $1300,x               
                    STA.w $1320,x               
                    STA.w $1340,x               
                    STA.w $1360,x               
                    STA.w $1380,x               
                    STA.w $13A0,x               
                    STA.w $13C0,x               
                    STA.w $13E0,x               
                    STA.w $1400,x               
                    STA.w $1420,x               
                    STA.w $1440,x               
                    STA.w $1460,x               
                    STA.w $1480,x               
                    STA.w $14A0,x               
                    STA.w $14C0,x               
                    STA.w $14E0,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_20B0A2           
                    PHB                         
                    LDX.w #$AC00                
                    LDY.w #$1300                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w #$0000                
                    STA.w $1300                 
                    SEP   #$30                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

DATA_20B0F2:        db $02,$00,$01,$03,$04,$05

DATA_20B0F8:        db $03,$03,$06,$12,$11,$00
  
CODE_20B0FE:        LDA.b #$11                  
                    STA.w $0208                 
                    LDA.b #$02                  
                    STA.w $0209                 
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    JSR.w CODE_20A4B6           
                    JSR.w CODE_20A4DA           
                    JSL.l CODE_0086B5           
CODE_20B11A:        JSL.l CODE_22E0A9           
                    LDA.b #$5C                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    LDX.b #$F5                  
CODE_20B129:        STZ.b $00,x                 
                    DEX                         
                    BNE   CODE_20B129           
                    LDX.b #$15                  
CODE_20B130:        STZ.w $0510,x               
                    DEX                         
                    BPL   CODE_20B130           
                    LDA.b #$04                  
                    STA.w $0736                 
                    STA.w $0737                 
                    STZ.w $072B                 
                    STZ.w $0726                 
                    LDA.l $7FFC03               
                    BMI   CODE_20B14E           
                    DEC   A                     
                    STA.w $072B                 
CODE_20B14E:        LDA.b #$FF                  
                    STA.b $BE                   
                    LDA.b #$A0                  
                    STA.b $5B                   
                    STA.b $5C                   
                    LDA.b #$F0                  
                    STA.b $53                   
                    STZ.b $54                   
                    LDA.b #$01                  
                    STA.b $8F                   
                    STA.b $90                   
                    LDA.b #$88                  
                    STA.w $0782                 
                    LDA.b #$00                  
                    STA.l $7F0000               
                    STA.l $7F0001               
                    LDA.b #$20                  
                    STA.w $0205                 
                    ASL   A                     
                    STA.w $0206                 
                    ASL   A                     
                    STA.w $0207                 
                    JSR.w CODE_20B2EE           
                    LDA.b #$1D                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20D301,x             
                    STA.b $36                   
                    LDA   PNTR_20D301+1,x             
                    STA.b $37                   
                    LDA.b #$20                  
                    STA.b $38                   
                    JSL.l CODE_29E8AB           
                    JSR.w CODE_20B328           
                    JSR.w CODE_20B039           
                    JSL.l CODE_29CDE5           
                    LDA.b #$1E                  
                    STA.b $28                   
                    LDA.b #$35                  
                    STA.b $B1                   
CODE_20B1AD:        JSR.w CODE_20A4B6           
CODE_20B1B0:        INC.b $16                   
                    LDA.b $16                   
                    AND.b #$10                  
                    BNE   CODE_20B1BD           
                    JSR.w CODE_20A4B6           
                    BRA   CODE_20B1B0           

CODE_20B1BD:        LDA.b #$0F                  
                    STA.b $16                   
                    LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$10                  
                    BEQ   CODE_20B1E4           
                    LDA.l $701FF2               
                    BEQ   CODE_20B1D3           
                    JML.l CODE_0080DE           

CODE_20B1D3:        LDA.b $AC                   
                    CMP.b #$06                  
                    BEQ   CODE_20B1DE           
                    LDA.b #$29                  
                    STA.w $1203                 
CODE_20B1DE:        LDA.b #$06                  
                    STA.b $AC                   
                    BEQ   CODE_20B200           
CODE_20B1E4:        LDA.b $F4                   
                    ORA.b $F5                   
                    AND.b #$40                  
                    BEQ   CODE_20B1F0           
                    JML.l CODE_0080DE           

CODE_20B1F0:        LDA.b $F2                   
                    ORA.b $F3                   
                    AND.b #$40                  
                    BEQ   CODE_20B1FC           
                    JML.l CODE_0080DE           

CODE_20B1FC:        DEC.b $B1                   
                    BPL   CODE_20B1AD           
CODE_20B200:        JSR.w CODE_20A4B6           
                    LDX.b $BE                   
                    CPX.b #$06                  
                    BCS   $16                   
                    DEC.b $BF                   
                    BNE   CODE_20B21F           
                    LDA   DATA_20B0F8,x             
                    STA.b $BF                   
                    LDA   DATA_20B0F2,x             
                    TAY                         
                    LDA.b #$01                  
                    STA.w $A6,y               
                    INC.b $BE                   
CODE_20B21F:        JSR.w CODE_20B3A5           
                    LDA.b $AF                   
                    BEQ   CODE_20B240           
CODE_20B226:        DEC.b $16                   
                    BMI   CODE_20B22F           
                    JSR.w CODE_20A4B6           
                    BRA   CODE_20B226           
CODE_20B22F:        LDA.l $701FF2               
                    BEQ   CODE_20B239           
                    JML.l CODE_008139           

CODE_20B239:        LDA.b #$80                  
                    STA.b $16                   
                    JMP.w CODE_20B11A           

CODE_20B240:        LDA.b $AC                   
                    CMP.b #$05                  
                    BNE   CODE_20B200           
                    LDX.b #$80                  
CODE_20B248:        STZ.b $43,x                 
                    DEX                         
                    BPL   CODE_20B248           
CODE_20B24D:        DEC.b $16                   
                    BMI   CODE_20B256           
                    JSR.w CODE_20A4B6           
                    BRA   CODE_20B24D           

CODE_20B256:        LDA.b #$80                  
                    STA.b $16                   
                    STZ.w $02D7                 
                    RTS                         
CODE_20B25E:        LDA.b #$38                  
                    STA.b $00                   
                    LDX.b #$00                  
                    LDY.b #$40                  
CODE_20B266:        LDA   DATA_20B2E3,x             
                    BPL   CODE_20B28D           
                    STA.w $0802,y               
                    LDA.b #$35                  
                    STA.w $0803,y               
                    LDA.b $00                   
                    STA.w $0800,y               
                    LDA.b #$C8                  
                    STA.w $0801,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_20B28D:        LDA.b $00                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $00                   
                    INX                         
                    CPX.b #$0B                  
                    BNE   CODE_20B266           
                    REP   #$20                  
                    LDA.w #$C498                
                    STA.w $0800,y               
                    CLC                         
                    ADC.w #$0010                
                    STA.w $0804,y               
                    CLC                         
                    ADC.w #$0010                
                    STA.w $0808,y               
                    CLC                         
                    ADC.w #$0008                
                    STA.w $080C,y               
                    LDA.w #$3585                
                    STA.w $0802,y               
                    LDA.w #$3587                
                    STA.w $0806,y               
                    LDA.w #$3589                
                    STA.w $080A,y               
                    LDA.w #$358A                
                    STA.w $080E,y               
                    SEP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    RTS                         


DATA_20B2E3:     db $84,$00,$80,$81,$83,$83,$00,$80
          db $81,$81,$82


CODE_20B2EE:         REP #$20
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1000                  
                    STA.b $D8           
                    LDA.w #$1562                  
                    STA.b $DA                
                    JSR.w CODE_20B312           
                    JSR.w CODE_20B312           
                    LDY.b #$0B                  
CODE_20B307:        INC.b $DA                   
                    JSR.w CODE_20B312           
                    DEY                         
                    BNE   CODE_20B307           
                    SEP   #$20                  
                    RTS                         

CODE_20B312:        LDA.b $D8                   
                    STA.w $2116                 
                    CLC                         
                    ADC.w #$0020                  
                    STA.b $D8                 
                    LDX.b #$20                  
CODE_20B31F:        LDA.b $DA                   
                    STA.w $2118                 
                    DEX                         
                    BNE   CODE_20B31F           
                    RTS                       
  
CODE_20B328:        REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$0000                
                    STA.w $2116                 
                    LDA.w #$000B                
                    STA.b $00                   
CODE_20B33A:        LDY.b #$08                  
CODE_20B33C:        LDA.w #$01F0                
                    STA.w $2118                 
                    INC   A                     
                    STA.w $2118                 
                    LDA.w #$41F1                
                    STA.w $2118                 
                    DEC   A                     
                    STA.w $2118                 
                    DEY                         
                    BNE   CODE_20B33C           
                    LDY.b #$08                  
CODE_20B355:        LDA.w #$01F2                
                    STA.w $2118                 
                    INC   A                     
                    STA.w $2118                 
                    LDA.w #$41F3                
                    STA.w $2118                 
                    DEC   A                     
                    STA.w $2118                 
                    DEY                         
                    BNE   CODE_20B355           
                    DEC.b $00                   
                    BNE   CODE_20B33A           
                    LDY.b #$08                  
CODE_20B372:        LDA.w #$01F4                
                    STA.w $2118                 
                    INC   A                     
                    STA.w $2118                 
                    LDA.w #$41F5                
                    STA.w $2118                 
                    DEC   A                     
                    STA.w $2118                 
                    DEY                         
                    BNE   CODE_20B372           
                    LDY.b #$08                  
CODE_20B38B:        LDA.w #$01F6                
                    STA.w $2118                 
                    INC   A                     
                    STA.w $2118                 
                    LDA.w #$41F7                
                    STA.w $2118                 
                    DEC   A                     
                    STA.w $2118                 
                    DEY                         
                    BNE   CODE_20B38B           
                    SEP   #$20                  
                    RTS                         

CODE_20B3A5:        STZ.b $BA                   
                    STZ.b $BB                   
                    LDA.b $AC                   
                    ASL   A                     
                    TAX                         
                    JMP.w (PNTR_20B3B0,x)             

PNTR_20B3B0:          dw CODE_20B3C0
               dw CODE_20B515
               dw CODE_20B76F
               dw CODE_20B79E
               dw CODE_20B8E1
               dw CODE_20B663
               dw CODE_20B586
               dw CODE_20B943

CODE_20B3C0:        LDY.b #$01                  
CODE_20B3C2:        INC.w $0216                 
                    LDA.w $0216                 
                    CMP.b #$D0                  
                    BEQ   CODE_20B41B           
                    CMP.b #$4E                  
                    BNE   CODE_20B3D7           
                    LDA.b #$40                  
                    STA.b $9E                   
                    STA.w $0512                 
CODE_20B3D7:        DEY                         
                    BPL   CODE_20B3C2           
                    LDA.b $9E                   
                    BEQ   CODE_20B3E1           
                    JSR.w CODE_20BB4D           
CODE_20B3E1:        LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$10                  
                    BEQ   CODE_20B402           
                    LDA.l $701FF2               
                    BEQ   CODE_20B3F3           
                    JML.l CODE_0080DE           

CODE_20B3F3:        LDA.b $AC                   
                    CMP.b #$06                  
                    BEQ   CODE_20B3FE           
                    LDA.b #$29                  
                    STA.w $1203                 
CODE_20B3FE:        LDA.b #$06                  
                    STA.b $AC                   
CODE_20B402:        LDA.b $F4                   
                    ORA.b $F5                   
                    AND.b #$40                  
                    BEQ   CODE_20B40E           
                    JML.l CODE_0080DE           

CODE_20B40E:        LDA.b $F2                   
                    ORA.b $F3                   
                    AND.b #$40                  
                    BEQ   CODE_20B41A           
                    JML.l CODE_0080DE           

CODE_20B41A:        RTS                         

CODE_20B41B:        LDA.b #$02                  
                    STA.b $BC                   
                    LDA.b #$02                  
                    STA.b $BD                   
                    INC.b $AC                   
                    STZ.b $9E                   
                    RTS                         

DATA_20B428:        db $4C,$02,$14,$00,$20,$04,$03,$00
                    db $FF,$03,$BD,$00,$30,$08,$17,$80
                    db $05,$00,$23,$82,$02,$00,$25,$80
                    db $20,$00,$35,$01,$05,$10,$04,$01
                    db $05,$00,$04,$01,$05,$00,$04,$01
                    db $05,$00,$04,$01,$05,$00,$04,$01
                    db $50,$00,$42,$02,$01,$80,$12,$02
                    db $05,$01,$20,$00,$10,$01,$05,$20
                    db $20,$01,$05,$40,$C0,$00,$02,$02
                    db $10,$00,$36,$41,$38,$42,$60,$00
                    db $60,$51,$FF,$08,$10,$00,$FE,$00

DATA_20B480:        db $2C,$01,$50,$80,$F0,$01,$90,$00
                    db $70,$00,$10,$02,$10,$22,$09,$00
                    db $15,$02,$34,$00,$02,$42,$90,$00
                    db $65,$01,$F0,$00,$FF

CODE_20B49D:        DEC.b $B1                   
                    BPL   CODE_20B4D4           
                    LDA.b #$04                  
                    STA.b $B1                   
                    LDA.b $C1                   
                    AND.b #$07                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA   DATA_20B4D5,x             
                    STA.w $1326                 
                    LDA   DATA_20B4D7,x             
                    STA.w $1328                 
                    LDA   DATA_20B4D9,x             
                    STA.w $132A                 
                    LDA   DATA_20B4DB,x             
                    STA.w $132C                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    INC.b $C1                   
CODE_20B4D4:        RTS                         

DATA_20B4D5:        db $D8,$08

DATA_20B4D7:        db $5D,$09

DATA_20B4D9:        db $1F,$1E

DATA_20B4DB:        db $FF,$32,$3B,$15,$BF,$15,$7F,$2A
                    db $5F,$3F,$9E,$21,$1F,$22,$DF,$36
                    db $FF,$4B,$3F,$36,$BF,$36,$7F,$4B
                    db $FF,$5F,$3F,$36,$BF,$36,$7F,$4B
                    db $FF,$5F,$9E,$21,$1F,$22,$DF,$36
                    db $FF,$4B,$3B,$15,$BF,$15,$7F,$2A
                    db $5F,$3F,$D8,$08,$5D,$09,$1F,$1E
                    db $FF,$32   

CODE_20B515:        DEC.b $B4                   
                    LDA.b $B4                   
                    CMP.b #$FF                  
                    BNE   CODE_20B520           
                    JSR.w CODE_20B5F3           
CODE_20B520:        DEC.b $B5                   
                    LDA.b $B5                   
                    CMP.b #$FF                  
                    BNE   CODE_20B52B           
                    JSR.w CODE_20B628           
CODE_20B52B:        LDA.b $B6                   
                    STA.b $B8                   
                    LDA.b $B7                   
                    STA.b $B9                   
                    JSR.w CODE_20B649           
                    JSR.w CODE_20BB4D           
                    LDA.b $C0                   
                    BEQ   CODE_20B540           
                    JSR.w CODE_20B49D           
CODE_20B540:        LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$10                  
                    BEQ   CODE_20B56D           
                    LDA.b $B0                   
                    BNE   CODE_20B567           
                    LDA.l $701FF2               
                    BEQ   CODE_20B556           
                    JML.l CODE_0080DE           

CODE_20B556:        LDA.b $AC                   
                    CMP.b #$06                  
                    BEQ   CODE_20B561           
                    LDA.b #$29                  
                    STA.w $1203                 
CODE_20B561:        LDA.b #$06                  
                    STA.b $AC                   
                    BRA   CODE_20B56D           

CODE_20B567:        INC.b $AC                   
                    LDA.b #$01                  
                    STA.b $28                   
CODE_20B56D:        LDA.b $F4                   
                    ORA.b $F5                   
                    AND.b #$40                  
                    BEQ   CODE_20B579           
                    JML.l CODE_0080DE           

CODE_20B579:        LDA.b $F2                   
                    ORA.b $F3                   
                    AND.b #$40                  
                    BEQ   CODE_20B585           
                    JML.l CODE_0080DE           

CODE_20B585:        RTS                         

CODE_20B586:        STZ.w $0216                 
                    STZ.w $0217                 
                    LDA.b #$B1                  
                    STA.b $36                   
                    LDA.b #$F1                  
                    STA.b $37                   
                    LDA.b #$2A                  
                    STA.b $38                   
                    LDA.b #$01                  
                    STA.b $1C                   
                    STZ.w $0154                 
CODE_20B59F:        LDA.w $0154                 
                    BPL   CODE_20B59F           
                    STZ.b $1C                   
                    CLI                         
                    JSR.w CODE_20B5DD           
                    LDA.b #$06                  
                    STA.w $1501                 
                    JSL.l CODE_22E65F           
                    JSR.w CODE_20B70E           
                    STZ.w $02B5                 
                    JSR.w CODE_20B2EE           
                    LDA.b #$1D                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20D301,x             
                    STA.b $36                   
                    LDA   PNTR_20D301+1,x             
                    STA.b $37                   
                    LDA.b #$20                  
                    STA.b $38                   
                    JSL.l CODE_29E8AB           
                    LDA.b #$0F                  
                    STA.b $16                   
                    LDA.b #$02                  
                    STA.b $AC                   
                    RTS                         

CODE_20B5DD:        LDA.l $7FFC03               
                    BMI   CODE_20B5EB           
                    DEC   A                     
                    TAX                         
                    LDA   DATA_20B76D,x             
                    BRA   CODE_20B5ED           

CODE_20B5EB:        LDA.b #$01                  
CODE_20B5ED:        STA.b $28                   
                    JSR.w CODE_20A4B6           
                    RTS                         

CODE_20B5F3:        STZ.b $B6                   
                    STZ.b $BA                   
                    LDX.b $B2                   
                    LDA   DATA_20B428,x             
                    CMP.b #$FF                  
                    BEQ   CODE_20B615           
                    CMP.b #$FE                  
                    BEQ   CODE_20B623           
                    STA.b $B4                   
                    INX                         
                    LDA   DATA_20B428,x             
                    STA.b $B6                   
                    STA.b $BA                   
                    INC.b $B2                   
                    INC.b $B2                   
                    RTS                         

CODE_20B615:        INX                         
                    LDA   DATA_20B428,x             
                    STA.b $BC                   
                    INC.b $B2                   
                    INC.b $B2                   
                    STZ.b $B4                   
                    RTS                         

CODE_20B623:        INC.b $AC                   
                    STZ.b $B2                   
                    RTS                         

CODE_20B628:        STZ.b $B7                   
                    STZ.b $BB                   
                    LDX.b $B3                   
                    LDA   DATA_20B480,x             
                    CMP.b #$FF                  
                    BEQ   CODE_20B646           
                    STA.b $B5                   
                    INX                         
                    LDA   DATA_20B480,x             
                    STA.b $B7                   
                    STA.b $BB                   
                    INC.b $B3                   
                    INC.b $B3                   
                    RTS                         

CODE_20B646:        STZ.b $B3                   
                    RTS                         

CODE_20B649:        LDA.b $BC                   
                    JSL.l CODE_20FB1F

                      dw CODE_20B663
               dw CODE_20B663
               dw CODE_20B664
               dw CODE_20B68B
               dw CODE_20B6A0
               dw CODE_20B6B1
               dw CODE_20B6D2
               dw CODE_20B6EA
               dw CODE_20B752
               dw CODE_20B663

CODE_20B663:        RTS

CODE_20B664:        LDA.b $BD                   
                    STA.w $28                 
                    INC.b $BD                   
                    LDA.b $BD                   
                    CMP.b #$1D                  
                    BNE   CODE_20B68A           
                    STZ.b $BC                   
                    REP   #$20                  
                    LDX.b #$08                  
                    LDA.w #$0000                
CODE_20B67A:        STA.w $1300,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_20B67A           
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
CODE_20B68A:        RTS                         

CODE_20B68B:        LDY.b #$04                  
CODE_20B68D:        DEC.w $0216                 
                    LDA.w $0216                 
                    BEQ   CODE_20B699           
                    DEY                         
                    BPL   CODE_20B68D           
                    RTS                         

CODE_20B699:        LDA.b #$10                  
                    STA.b $B1                   
                    INC.b $BC                   
                    RTS                         

CODE_20B6A0:        REP   #$20                  
                    LDA.w $0216                 
                    SEC                         
                    SBC.w #$0002                
                    STA.w $0216                 
                    SEP   #$20                  
                    INC.b $BC                   
                    RTS                         

CODE_20B6B1:        REP   #$20                  
                    LDA.w $0216                 
                    CLC                         
                    ADC.w #$0002                
                    STA.w $0216                 
                    SEP   #$20                  
                    DEC.b $BC                   
                    DEC.b $B1                   
                    BPL   CODE_20B6D1           
                    INC.b $BC                   
                    INC.b $BC                   
                    LDA.b #$03                  
                    STA.b $BD                   
                    LDA.b #$02                  
                    STA.b $B1                   
CODE_20B6D1:        RTS                         

CODE_20B6D2:        DEC.b $B1                   
                    BPL   CODE_20B6E9           
                    STZ.b $BE                   
                    LDA.b #$01                  
                    STA.b $BF                   
                    INC.b $BC                   
                    LDA.b #$16                  
                    STA.b $B1                   
                    JSL.l CODE_29CF62           
                    STZ.w $02B3                 
CODE_20B6E9:        RTS                         

CODE_20B6EA:        REP   #$20                  
                    LDA.l $7F0000               
                    STA.w $1300                 
                    SEP   #$20                  
                    JSL.l CODE_29D09A           
                    JSL.l CODE_29D1BB           
                    LDA.w $02B3                 
                    CMP.b #$02                  
                    BNE   CODE_20B70A           
                    STZ.b $BC                   
                    LDA.b #$01                  
                    STA.b $C0                   
CODE_20B70A:        JSR.w CODE_20B70E           
                    RTS                         

CODE_20B70E:        REP   #$20                  
                    LDA.w $1300                 
                    STA.l $7F0000               
                    AND.w #$001F                
                    ORA.w #$0020                
                    STA.b $D8                   
                    LDA.w $1300                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    ORA.w #$0040                
                    STA.b $DA                   
                    LDA.w $1300                 
                    XBA                         
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    ORA.w #$0080                
                    STA.b $DC                   
                    STZ.w $1300                 
                    SEP   #$20                  
                    LDA.b $D8                   
                    STA.w $0205                 
                    LDA.b $DA                   
                    STA.w $0206                 
                    LDA.b $DC                   
                    STA.w $0207                 
                    RTS                         

CODE_20B752:        LDA.l $701FF2               
                    BNE   CODE_20B766           
                    LDA.l $7FFC03               
                    BMI   CODE_20B766           
                    DEC   A                     
                    TAX                         
                    LDA   DATA_20B76D,x             
                    BRA   CODE_20B768           

CODE_20B766:        LDA.b #$01                  
CODE_20B768:        STA.b $28                   
                    INC.b $BC                   
                    RTS                         

DATA_20B76D:        db $5D,$5C

CODE_20B76F:        STZ.b $A7
                    STZ.b $A8                   
                    STZ.b $A9                   
                    STZ.b $AA                   
                    LDA.b #$01                  
                    STA.b $A6                   
                    LDA.b #$14                  
                    STA.b $AD                   
                    LDA.b #$3C                  
                    STA.b $AE                   
                    REP   #$20                  
                    LDA.w #$0000                
                    STA.w $1402                 
                    LDA.w #$001F                
                    STA.w $1406                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    INC.b $AC                   
                    RTS                         

DATA_20B79B:        db $8F,$9F,$AF

CODE_20B79E:        LDA.b $F3
                    AND.b #$C0
                    CMP.b #$C0                  
                    BNE   CODE_20B7AB                  
                    NOP                     
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
CODE_20B7AB:        DEC.b $AE                   
                    BNE   CODE_20B7BB           
                    LDA.b #$60                  
                    STA.b $AE                   
                    DEC.b $AD                   
                    BNE   CODE_20B7BB           
                    LDA.b #$FF                  
                    STA.b $AF                   
CODE_20B7BB:        JSR.w CODE_20C520           
                    LDA.l $701FF2               
                    BEQ   CODE_20B7C7           
                    JMP.w CODE_20B83C           

CODE_20B7C7:        LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$2C                  
                    BEQ   CODE_20B81E           
                    LDX.b #$23                  
                    STX.w $1203                 
                    LDA.l $7FFC03               
                    BMI   CODE_20B7EC           
                    LDA.w $072B                 
                    CMP.b #$02                  
                    BNE   CODE_20B7E8           
                    LDA.l $7FFC03               
                    DEC   A                     
                    BRA   CODE_20B800           

CODE_20B7E8:        LDA.b #$02                  
                    BRA   CODE_20B800           

CODE_20B7EC:        LDA.b $F6                   
                    ORA.b $F7                   
                    BIT.b #$20                  
                    BEQ   CODE_20B805           
                    INC.w $072B                 
                    LDA.w $072B                 
                    CMP.b #$03                  
                    BNE   CODE_20B800           
                    LDA.b #$00                  
CODE_20B800:        STA.w $072B                 
                    BRA   CODE_20B81E           

CODE_20B805:        LDX.w $072B                 
                    AND.b #$08                  
                    BEQ   CODE_20B812           
                    DEX                         
                    BPL   CODE_20B81B           
                    INX                         
                    BRA   CODE_20B818           

CODE_20B812:        INX                         
                    CPX.b #$03                  
                    BNE   CODE_20B81B           
                    DEX                         
CODE_20B818:        STZ.w $1203                 
CODE_20B81B:        STX.w $072B                 
CODE_20B81E:        LDX.w $072B                 
                    LDA.b #$48                  
                    STA.w $09F0                 
                    LDA   DATA_20B79B,x             
                    STA.w $09F1                 
                    LDA.b #$4F                  
                    STA.w $09F2                 
                    LDA.b #$20                  
                    STA.w $09F3                 
                    LDA.b #$00                  
                    STA.w $0A9C                 
CODE_20B83C:        JSR.w CODE_20B25E           
                    JSR.w CODE_20B49D           
                    JMP.w CODE_20B850           

                    LDA.b $F8                   
                    AND.b #$C0                  
                    BEQ   CODE_20B850           
                    LDA.b #$01                  
                    STA.w $078E                 
CODE_20B850:        LDA.l $7FFB00               
                    STA.w $0727                 
                    LDA.l $701FF4               
                    BNE   CODE_20B875           
                    LDA.l $701FF6               
                    BEQ   CODE_20B875           
                    LDA.b $F7                   
                    AND.b #$10                  
                    BEQ   CODE_20B875           
                    LDA.w $072B                 
                    BNE   CODE_20B895           
                    LDA.b #$2A                  
                    STA.w $1203                 
                    BRA   CODE_20B8DA           

CODE_20B875:        LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$10                  
                    BNE   CODE_20B895           
                    LDA.b $F4                   
                    ORA.b $F5                   
                    AND.b #$40                  
                    BEQ   CODE_20B889           
                    JML.l CODE_0080DE           

CODE_20B889:        LDA.b $F2                   
                    ORA.b $F3                   
                    AND.b #$40                  
                    BEQ   CODE_20B8DA           
                    JML.l CODE_0080DE           

CODE_20B895:        LDA.w $072B                 
                    CMP.b #$02                  
                    BNE   CODE_20B8AA           
                    LDA.l $701FF4               
                    BNE   CODE_20B8DB           
                    LDA.l $701FF6               
                    CMP.b #$02                  
                    BNE   CODE_20B8DB           
CODE_20B8AA:        LDA.b #$29                  
                    STA.w $1203                 
                    LDA.w $08F1                 
                    STA.b $BD                   
                    LDA.l $701FF2               
                    BEQ   CODE_20B8BE           
                    JML.l CODE_0080DE           

CODE_20B8BE:        JSR.w CODE_20A4B6           
                    INC.b $AD                   
                    LDY.b #$F8                  
                    LDA.b $AD                   
                    AND.b #$18                  
                    BEQ   CODE_20B8CD           
                    LDY.b $BD                   
CODE_20B8CD:        STY.w $08F1                 
                    JSR.w CODE_20B49D           
                    LDA.w $04E2                 
                    BNE   CODE_20B8BE           
                    INC.b $AC                   
CODE_20B8DA:        RTS                         

CODE_20B8DB:        LDA.b #$2A                  
                    STA.w $1203                 
                    RTS                         

CODE_20B8E1:        STZ.w $0747                 
                    STZ.w $0748                 
                    INC.w $072B                 
                    LDA.w $0727                 
                    ASL   A                     
                    TAX                         
                    LDA.w $E3AD,x               
                    STA.b $0A                   
                    LDA.w $E3AE,x               
                    STA.b $0B                   
                    LDA.w $E3BD,x               
                    STA.b $0C                   
                    LDA.w $E3BE,x               
                    STA.b $0D                   
                    LDA.w $E3CD,x               
                    STA.b $0E                   
                    LDA.w $E3CE,x               
                    STA.b $0F                   
                    LDA.w $E3DD,x               
                    STA.b $08                   
                    LDA.w $E3DE,x               
                    STA.b $09                   
                    LDY.b #$08                  
CODE_20B919:        LDA.b ($0A),y               
                    STA.w $1EED,y               
                    LDA.b ($0C),y               
                    STA.w $1F09,y               
                    LDA.b ($0E),y               
                    STA.w $1EFB,y               
                    LDA.b ($08),y               
                    STA.w $1F17,y               
                    DEY                         
                    BPL   CODE_20B919           
                    INC.b $AC                   
                    REP   #$20                  
                    LDX.b #$44                  
                    LDA.w #$0000                
CODE_20B939:        STA.w $1D80,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_20B939           
                    SEP   #$20                  
                    RTS                         

CODE_20B943:        JSR.w CODE_20C520           
                    LDA.b $F3                   
                    AND.b #$C1                  
                    CMP.b #$C1                  
                    BNE   CODE_20B951           
                    JMP.w CODE_20CB96           

CODE_20B951:        LDA.b $F3                   
                    AND.b #$C4                  
                    CMP.b #$C4                  
                    BNE   CODE_20B95C           
                    JMP.w CODE_20C617           

CODE_20B95C:        LDA.b $18                   
                    AND.b #$0C                  
                    BEQ   CODE_20B975           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $03FE                 
                    CLC                         
                    ADC.w DATA_20A4B0,x               
                    AND.b #$07                  
                    STA.w $03FE                 
                    JMP.w CODE_20BA1F           

CODE_20B975:        LDA.b $18                   
                    AND.b #$20                  
                    BEQ   CODE_20B986           
                    INC.w $072B                 
                    LDA.w $072B                 
                    AND.b #$01                  
                    STA.w $072B                 
CODE_20B986:        LDY.w $072B                 
                    LDA.b #$48                  
                    STA.w $09F0                 
                    LDA   DATA_20B79B,y               
                    STA.w $09F1                 
                    LDA.b #$4F                  
                    STA.w $09F2                 
                    LDA.b #$20                  
                    STA.w $09F3                 
                    LDA.b #$00                  
                    STA.w $0A9C                 
                    LDA.b $18                   
                    AND.b #$80                  
                    BEQ   CODE_20B9D7           
                    LDA.w $0736                 
                    CMP.b #$63                  
                    BEQ   CODE_20B9B9           
                    LDA.w $0736                 
                    CLC                         
                    ADC.b #$05                  
                    STA.w $0736                 
CODE_20B9B9:        REP   #$20                  
                    LDA.w #$1401                
                    STA.w $1602                 
                    LDA.w #$0100                
                    STA.w $1604                 
                    LDA.w $0736                 
                    AND.w #$00FF                
                    STA.w $1606                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $1608                 
CODE_20B9D7:        LDA.b $18                   
                    AND.b #$10                  
                    BEQ   CODE_20BA1F           
                    LDA.b #$80                  
                    STA.w $0160                 
                    LDA.b #$04                  
                    STA.b $AC                   
                    LDX.w $072B                 
                    LDY.w $0736                 
CODE_20B9EC:        TYA                         
                    STA.w $0736,x               
                    LDA.b #$00                  
                    STA.w $0747,x               
                    DEX                         
                    BPL   CODE_20B9EC           
                    LDA.w $03FE                 
                    STA.w $0727                 
                    LDX.b #$1B                  
                    LDA.b #$08                  
CODE_20BA02:        STA.w $1D80,x               
                    STA.w $1DA3,x               
                    DEX                         
                    BPL   CODE_20BA02           
                    LDX.b #$0D                  
                    LDA.b #$0C                  
                    STA.w $1D80,x               
                    STA.w $1DA3,x               
CODE_20BA15:        TXA                         
                    STA.w $1D7F,x               
                    STA.w $1DA2,x               
                    DEX                         
                    BNE   CODE_20BA15           
CODE_20BA1F:        LDA.w $03FE                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b #$30                  
                    STA.w $0851                 
                    LDA.b #$6F                  
                    STA.w $0852                 
                    LDA.b #$00                  
                    STA.w $0853                 
                    LDA.b #$20                  
                    STA.w $0850                 
                    LDA.b #$00                  
                    STA.w $0A34                 
                    RTS                         

DATA_20BA41:        db $00,$06,$0C,$12,$18,$1E,$24,$2A
                    db $30,$36,$3C,$42,$48,$4E,$54,$5A
                    db $60,$66,$6C,$72,$78,$7E,$84,$8A
                    db $90,$96,$9C,$A2,$00,$02,$10,$04
                    db $06,$10,$0A,$0C,$10,$0E,$28,$10
                    db $2C,$2E,$10,$18,$1A,$10,$00,$02
                    db $10,$04,$06,$08,$0A,$0C,$10,$0E
                    db $28,$2A,$2C,$2E,$10,$18,$1A,$1C
                    db $30,$32,$10,$34,$36,$10,$30,$32
                    db $10,$34,$36,$38,$00,$02,$10,$04
                    db $06,$38,$00,$02,$10,$04,$06,$3A
                    db $24,$24,$10,$26,$26,$10,$30,$32
                    db $10,$34,$36,$10,$28,$2A,$10,$2C
                    db $2E,$10,$26,$18,$10,$1C,$1E,$1A
                    db $00,$02,$10,$04,$06,$08,$00,$02
                    db $10,$0A,$0C,$0E,$00,$02,$10,$20
                    db $22,$24,$10,$10,$10,$04,$06,$10
                    db $10,$10,$10,$00,$02,$10,$10,$10
                    db $10,$20,$22,$10,$18,$1A,$10,$1C
                    db $20,$10,$18,$1A,$10,$1C,$20,$22
                    db $00,$02,$04,$06,$08,$0A,$0C,$0E
                    db $1E,$10,$12,$1E,$10,$10,$10,$10
                    db $10,$10,$24,$26,$3E,$28,$2A,$3E
                    db $2C,$2E,$3E,$18,$1A,$3E,$30,$32
                    db $3E,$34,$36,$3E

DATA_20BB05:        db $00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$F3
                    db $10,$10,$10,$10,$10,$18,$18,$18
                    db $18,$18,$F4,$F4,$00,$F5,$F5,$F5

DATA_20BB21:        db $11,$12,$11,$12

DATA_20BB25:        db $00,$01,$02,$01
                    db $03,$04,$05,$04

DATA_20BB2D:        db $1A,$1B,$1A,$1B
                    db $12,$06,$07,$13,$0C

DATA_20BB36:        db $09,$03,$08
                    db $0E,$0F,$10,$0E,$11,$0B,$11,$0B
                    db $11,$0B,$02,$0B,$02,$0B,$02,$0B

DATA_20BB49:        db $F0,$00

DATA_20BB4B:        db $00,$40

CODE_20BB4D:        JSL.l CODE_22E0A9           
                    LDA.w $0510                 
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$90                  
                    STA.w $0510                 
                    LDA.b #$10                  
                    STA.b $91                   
                    LDA.b #$40                  
                    STA.b $92                   
                    LDX.b #$01                  
CODE_20BB66:        STX.b $9F                   
                    LDA.b $9E                   
                    BEQ   CODE_20BB95           
                    LDA.b #$08                  
                    LDY.w $0512                 
                    BEQ   CODE_20BB78           
                    DEC.w $0512                 
                    LDA.b #$00                  
CODE_20BB78:        STA.b $63,x                 
                    LDA   DATA_20BB49,x             
                    STA.b $53,x                 
                    LDA.b #$A0                  
                    STA.b $5B,x                 
                    LDA   DATA_20BB4B,x             
                    STA.b $85,x                 
                    JSR.w CODE_20BD2F           
                    JSR.w CODE_20BE94           
                    STZ.b $63,x                 
                    JMP.w CODE_20BBC6           

CODE_20BB95:        JSR.w CODE_20BBD3           
                    JSR.w CODE_20BC62           
                    JSR.w CODE_20BD2F           
                    JSR.w CODE_20C027           
                    JSR.w CODE_20C059           
                    LDA.w $0511                 
                    BNE   CODE_20BBAC           
                    JSR.w CODE_20BE94           
CODE_20BBAC:        LDA.b $43,x                 
                    BEQ   CODE_20BBC6           
                    BPL   CODE_20BBBC           
                    LDA.b $53,x                 
                    CMP.b #$C0                  
                    BCS   $0E                   
                    LDA.b #$C0                  
                    BRA   CODE_20BBC4           

CODE_20BBBC:        LDA.b $53,x                 
                    CMP.b #$40                  
                    BCC   CODE_20BBC6           
                    LDA.b #$3F                  
CODE_20BBC4:        STA.b $53,x                 
CODE_20BBC6:        DEX                         
                    BPL   CODE_20BB66           
                    JSR.w CODE_20C0E7           
                    RTS                         

DATA_20BBCD:        db $FF,$00,$01

DATA_20BBD0:        db $60,$E0,$70

CODE_20BBD3:        PHB                         
                    PHK                         
                    PLB                         
                    LDY.b #$02                  
                    LDA.b $63,x                 
                    BPL   CODE_20BBE3           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    LDY.b #$01                  
CODE_20BBE3:        BNE   CODE_20BBE6           
                    TAY                         
CODE_20BBE6:        STA.b $0E                   
                    STY.b $87,x                 
                    LDY.b #$18                  
                    LDA.b $B8,x                 
                    AND.b #$40                  
                    BEQ   CODE_20BBF4           
                    LDY.b #$28                  
CODE_20BBF4:        STY.b $0D                   
                    LDY.b #$00                  
                    LDA.b $B8,x                 
                    AND.b #$03                  
                    BNE   CODE_20BC0A           
                    LDA.b $83,x                 
                    BNE   CODE_20BC52           
                    LDA.b $63,x                 
                    BEQ   CODE_20BC52           
                    BMI   CODE_20BC24           
                    BPL   CODE_20BC3C           
CODE_20BC0A:        INY                         
                    INY                         
                    AND.b $87,x                 
                    BNE   CODE_20BC1E           
                    DEY                         
                    LDA.b $0E                   
                    CMP.b $0D                   
                    BEQ   CODE_20BC52           
                    BMI   CODE_20BC1E           
                    LDA.b $83,x                 
                    BNE   CODE_20BC52           
                    DEY                         
CODE_20BC1E:        LDA.b $B8,x                 
                    AND.b #$01                  
                    BNE   CODE_20BC3C           
CODE_20BC24:        LDA.b #$00                  
                    SEC                         
                    SBC   DATA_20BBD0,y               
                    STA.b $00                   
                    LDA   DATA_20BBCD,y               
                    EOR.b #$FF                  
                    STA.b $01                   
                    LDA.b $00                   
                    BNE   CODE_20BC46           
                    INC.b $01                   
                    JMP.w CODE_20BC46           

CODE_20BC3C:        LDA   DATA_20BBD0,y               
                    STA.b $00                   
                    LDA   DATA_20BBCD,y               
                    STA.b $01                   
CODE_20BC46:        LDA.b $00                   
                    CLC                         
                    ADC.w $0510                 
                    LDA.b $63,x                 
                    ADC.b $01                   
                    STA.b $63,x                 
CODE_20BC52:        JSR.w CODE_20BCDF           
                    PLB                         
                    RTS                         

                    db $D0,$CE,$CC,$CA,$CA,$CA

DATA_20BC5D:        db $C8

DATA_20BC5E:        db $00,$02,$04,$08                 

CODE_20BC62:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b $BA,x                 
                    AND.b #$80                  
                    STA.b $00                   
                    BEQ   CODE_20BC90           
                    LDA.b $83,x                 
                    BNE   CODE_20BC90           
                    LDA.b $63,x                 
                    BPL   CODE_20BC7A           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_20BC7A:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w DATA_20BC5D             
                    SEC                         
                    SBC   DATA_20BC5E,y               
                    STA.b $6B,x                 
                    LDA.b #$01                  
                    STA.b $83,x                 
                    LDA.b #$00                  
                    STA.b $95,x                 
CODE_20BC90:        LDA.b $83,x                 
                    BEQ   CODE_20BCC0           
                    LDY.b #$05                  
                    LDA.b $6B,x                 
                    CMP.b #$E0                  
                    BPL   CODE_20BCA4           
                    LDA.b $B8,x                 
                    AND.b #$80                  
                    BEQ   CODE_20BCA4           
                    LDY.b #$01                  
CODE_20BCA4:        TYA                         
                    CLC                         
                    ADC.b $6B,x                 
                    STA.b $6B,x                 
                    LDA.b $8F,x                 
                    CMP.b #$02                  
                    BNE   CODE_20BCC0           
                    LDA.b $B8,x                 
                    AND.b #$80                  
                    BEQ   CODE_20BCC0           
                    LDA.b $6B,x                 
                    CMP.b #$08                  
                    BMI   CODE_20BCC0           
                    LDA.b #$08                  
                    STA.b $6B,x                 
CODE_20BCC0:        JSR.w CODE_20BD0E           
                    LDA.b $4B,x                 
                    BEQ   CODE_20BCCD           
                    LDA.b #$20                  
                    STA.b $6B,x                 
                    BNE   CODE_20BCDD           
CODE_20BCCD:        LDA.b $5B,x                 
                    CMP.b #$A0                  
                    BCC   CODE_20BCDD           
                    LDA.b #$A0                  
                    STA.b $5B,x                 
                    LDA.b #$00                  
                    STA.b $83,x                 
                    STA.b $6B,x                 
CODE_20BCDD:        PLB                         
                    RTS                         

CODE_20BCDF:        LDA.b $63,x                 
                    PHA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $0B                   
                    LDY.b #$00                  
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_20BCF6           
                    DEY                         
                    ORA.b #$F0                  
CODE_20BCF6:        STA.b $0A                   
                    STY.b $0C                   
                    LDA.b $73,x                 
                    CLC                         
                    ADC.b $0B                   
                    STA.b $73,x                 
                    LDA.b $53,x                 
                    ADC.b $0A                   
                    STA.b $53,x                 
                    LDA.b $43,x                 
                    ADC.b $0C                   
                    STA.b $43,x                 
                    RTS                         

CODE_20BD0E:        LDA.b $6B,x                 
                    BMI   CODE_20BD1A           
                    CMP.b #$40                  
                    BMI   CODE_20BD1A           
                    LDA.b #$40                  
                    STA.b $6B,x                 
CODE_20BD1A:        TXA                         
                    PHA                         
                    CLC                         
                    ADC.b #$08                  
                    TAX                         
                    JSR.w CODE_20BCDF           
                    PLA                         
                    TAX                         
                    RTS                         

DATA_20BD26:        db $07,$06,$05,$04,$03,$02,$01,$01
                    db $01
        
CODE_20BD2F:        PHB               
                    PHK                         
                    PLB                         
                    LDA.b $63,x                 
                    BPL   CODE_20BD3B           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_20BD3B:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    INC.b $8B,x                 
                    LDA.b $8B,x                 
                    CMP   DATA_20BD26,y               
                    BMI   CODE_20BD58           
                    LDA.b #$00                  
                    STA.b $8B,x                 
                    INC.b $89,x                 
                    LDA.b $89,x                 
                    CMP.b #$04                  
                    BMI   CODE_20BD58           
                    LDA.b #$00                  
                    STA.b $89,x                 
CODE_20BD58:        LDA.b $B8,x                 
                    AND.b #$03                  
                    BNE   CODE_20BD66           
                    LDA.b $63,x                 
                    BNE   CODE_20BD66           
                    LDA.b #$02                  
                    STA.b $89,x                 
CODE_20BD66:        LDA.b $85,x                 
                    STA.b $00                   
                    LDA.b $B8,x                 
                    AND.b #$03                  
                    BEQ   CODE_20BD7A           
                    LDY.b #$00                  
                    AND.b #$02                  
                    BNE   CODE_20BD78           
                    LDY.b #$40                  
CODE_20BD78:        STY.b $85,x                 
CODE_20BD7A:        LDA.b $85,x                 
                    EOR.b $00                   
                    STA.b $00                   
                    PHX                         
                    LDA.b $8F,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $89,x                 
                    TAX                         
                    LDA   DATA_20BB21,x             
                    PLX                         
                    STA.b $8D,x                 
                    LDA.b $63,x                 
                    CLC                         
                    ADC.b #$01                  
                    CMP.b #$03                  
                    BCC   CODE_20BDA9           
                    LDA.b $87,x                 
                    AND.b $B8,x                 
                    BEQ   CODE_20BDA9           
                    LDY.b $8F,x                 
                    BEQ   CODE_20BDA4           
                    LDY.b #$01                  
CODE_20BDA4:        LDA.w $BB34,y               
                    STA.b $8D,x                 
CODE_20BDA9:        LDA.b $B8,x                 
                    AND.b #$04                  
                    BEQ   CODE_20BDCA           
                    LDY.b $8F,x                 
                    LDA.w $BB31,y               
                    STA.b $8D,x                 
                    LDA.b $BA,x                 
                    AND.b #$04                  
                    BEQ   CODE_20BDCA           
                    LDY.b #$00                  
                    TXA                         
                    BNE   CODE_20BDC2           
                    INY                         
CODE_20BDC2:        LDA.b #$A0                  
                    STA.w $83,y               
                    STA.w $6B,y               
CODE_20BDCA:        LDA.b $B8,x                 
                    AND.b #$08                  
                    BEQ   CODE_20BDD4           
                    LDA.b #$17                  
                    STA.b $8D,x                 
CODE_20BDD4:        LDA.b $83,x                 
                    BEQ   CODE_20BE0E           
                    LDA.b $8F,x                 
                    BEQ   CODE_20BE0E           
                    CMP.b #$02                  
                    BNE   CODE_20BE04           
                    LDA.b #$15                  
                    LDY.b $6B,x                 
                    BMI   CODE_20BE0C           
                    LDA.b $95,x                 
                    BEQ   CODE_20BDEF           
                    DEC.b $95,x                 
                    JMP.w CODE_20BDF9           

CODE_20BDEF:        LDA.b $B8,x                 
                    AND.b #$80                  
                    BEQ   CODE_20BDF9           
                    LDA.b #$0A                  
                    STA.b $95,x                 
CODE_20BDF9:        LDA.b $95,x                 
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA   DATA_20BB36,y               
                    JMP.w CODE_20BE0C           

CODE_20BE04:        LDA.b #$14                  
                    LDY.b $6B,x                 
                    BMI   CODE_20BE0C           
                    LDA.b #$00                  
CODE_20BE0C:        STA.b $8D,x                 
CODE_20BE0E:        LDA.b $9B,x                 
                    BEQ   CODE_20BE18           
                    DEC.b $9B,x                 
                    LDA.b #$0D                  
                    STA.b $8D,x                 
CODE_20BE18:        LDA.b $99,x                 
                    BEQ   CODE_20BE22           
                    DEC.b $99,x                 
                    LDA.b #$16                  
                    STA.b $8D,x                 
CODE_20BE22:        TXA                         
                    BNE   CODE_20BE3D           
                    LDA.b $9D                   
                    BEQ   CODE_20BE3D           
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $BB3D,y               
                    STA.b $8D                   
                    LDY.b #$00                  
                    CMP.b #$11                  
                    BEQ   CODE_20BE39           
                    LDY.b #$01                  
CODE_20BE39:        STY.b $8F                   
                    DEC.b $9D                   
CODE_20BE3D:        LDA.b $97,x                 
                    BNE   CODE_20BE49           
                    LDA.b $BA,x                 
                    AND.b #$20                  
                    BEQ   CODE_20BE76           
                    STA.b $97,x                 
CODE_20BE49:        LDY.b $89,x                 
                    LDA.b $83,x                 
                    BEQ   CODE_20BE51           
                    LDY.b #$00                  
CODE_20BE51:        LDA.w $BB39,y               
                    STA.b $8D,x                 
                    LDA.b $00                   
                    BEQ   CODE_20BE5E           
                    LDA.b #$08                  
                    STA.b $99,x                 
CODE_20BE5E:        LDA.b $99,x                 
                    BEQ   CODE_20BE68           
                    DEC.b $99,x                 
                    LDA.b #$0A                  
                    STA.b $8D,x                 
CODE_20BE68:        LDA.b $BA,x                 
                    AND.b #$40                  
                    BEQ   CODE_20BE76           
                    STZ.b $97,x                 
                    STZ.b $99,x                 
                    LDA.b #$0A                  
                    STA.b $9B,x                 
CODE_20BE76:        PLB                         
                    RTS                         

DATA_20BE78:        db $10,$08,$00

DATA_20BE7B:        db $00,$02,$04

DATA_20BE7E:        db $06,$08,$0A,$10,$12,$14,$16,$18
                    db $1A

DATA_20BE87:        db $00,$06

DATA_20BE89:        db $0A,$1A

DATA_20BE8B:        db $07,$05

CODE_20BE8D:        PHX                       ;0 S:01FF P:EnvMXdIzc HC:16846 VC:000 FC:00 I:00
                    JSR.w CODE_20E07C         ;0 S:01FF P:EnvMXdIzc HC:16862 VC:000 FC:00 I:00
                    PLX                       ;0 S:01FF P:EnvMXdIzc HC:16878 VC:000 FC:00 I:00
                    BRA   CODE_20BE99         ;0 S:01FF P:EnvMXdIzc HC:16894 VC:000 FC:00 I:00

CODE_20BE94:        PHX                         
                    JSR.w CODE_20E0A2           
                    PLX                         
CODE_20BE99:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b #$20                  
                    STA.b $0B                   
                    LDA.b $8F,x                 
                    BNE   CODE_20BEAC           
                    LDA.b $B8,x                 
                    AND.b #$10                  
                    BEQ   CODE_20BEAC           
                    STA.b $0B                   
CODE_20BEAC:        LDA.b $5B,x                 
                    STA.b $0E                   
                    LDA.b $53,x                 
                    STA.b $0F                   
                    LDA.b $85,x                 
                    STA.b $0D                   
                    LDA.b $93,x                 
                    STA.b $0C                   
                    PHX                         
                    LDX.b $9F                   
                    LDA   DATA_20BE8B,x             
                    ASL   A                     
                    STA.b $08                   
                    PLX                         
                    LDA.w DATA_20BE87,x               
                    STA.b $00                   
                    LDA.b $91,x                 
                    TAX                         
                    PHX                         
                    LDY.b #$02                  
CODE_20BED2:        PHY                         
                    LDY.b $00                   
                    LDA   DATA_20BE7B,y               
                    STA.w $081A,x               
                    INC   A                     
                    STA.w $081E,x               
                    LDA   DATA_20BE7E,y               
                    STA.w $0802,x               
                    INC   A                     
                    STA.w $0806,x               
                    PLY                         
                    LDA.b $0D                   
                    AND.b #$C0                  
                    ORA.b $08                   
                    ORA.b $0B                   
                    STA.w $0803,x               
                    STA.w $0807,x               
                    STA.w $081B,x               
                    STA.w $081F,x               
                    ASL.b $0C                   
                    BCS   $17                   
                    LDA.b $0E                   
                    STA.w $0819,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0801,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,x               
                    LDA.b $0F                   
                    CLC                         
                    ADC   DATA_20BE78,y               
                    STA.w $0800,x               
                    STA.w $0804,x               
                    STA.w $0818,x               
                    STA.w $081C,x               
                    PHX                         
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b #$00                  
                    STA.w $0A20,x               
                    STA.w $0A21,x               
                    STA.w $0A26,x               
                    STA.w $0A27,x               
                    PLX                         
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    INC.b $00                   
                    DEY                         
                    BPL   CODE_20BED2           
                    PLX                         
                    LDA.b $0D                   
                    AND.b #$40                  
                    BEQ   CODE_20BF9D           
                    LDA.w $0802,x               
                    PHA                         
                    LDA.w $080A,x               
                    STA.w $0802,x               
                    PLA                         
                    STA.w $080A,x               
                    LDA.w $0806,x               
                    PHA                         
                    LDA.w $080E,x               
                    STA.w $0806,x               
                    PLA                         
                    STA.w $080E,x               
                    LDA.w $0810,x               
                    CLC                         
                    ADC.b #$E8                  
                    STA.w $0810,x               
                    STA.w $0814,x               
                    STA.w $0828,x               
                    STA.w $082C,x               
                    LDA.w $081A,x               
                    PHA                         
                    LDA.w $0822,x               
                    STA.w $081A,x               
                    PLA                         
                    STA.w $0822,x               
                    LDA.w $081E,x               
                    PHA                         
                    LDA.w $0826,x               
                    STA.w $081E,x               
                    PLA                         
                    STA.w $0826,x               
CODE_20BF9D:        REP   #$20                  
                    LDY.b #$0C                  
                    LDA.b $9F                   
                    AND.w #$00FF                
                    BNE   CODE_20BFAA           
                    LDY.b #$00                  
CODE_20BFAA:        LDA.w $0226,y               
                    CMP.w $0228,y               
                    BNE   CODE_20BFD3           
                    SEP   #$20                  
                    LDA.w $081B,x               
                    AND.b #$BF                  
                    STA.w $0803,x               
                    STA.w $0807,x               
                    STA.w $081B,x               
                    STA.w $081F,x               
                    ORA.b #$40                  
                    STA.w $080B,x               
                    STA.w $080F,x               
                    STA.w $0823,x               
                    STA.w $0827,x               
CODE_20BFD3:        SEP   #$20                  
                    LDY.b $9F                   
                    LDA.w $8D,y               
                    CMP.b #$0D                  
                    BNE   CODE_20C011           
                    LDA.w $0801,x               
                    STA.w $0811,x               
                    LDA.w $0805,x               
                    STA.w $0815,x               
                    LDA.b #$F8                  
                    LDY.b $0D                   
                    BEQ   CODE_20BFF2           
                    LDA.b #$10                  
CODE_20BFF2:        CLC                         
                    ADC.w $0818,x               
                    STA.w $0810,x               
                    STA.w $0814,x               
                    LDY.b $9F                   
                    LDA   DATA_20BE89,y               
                    STA.w $0812,x               
                    INC   A                     
                    STA.w $0816,x               
                    LDA.w $081B,x               
                    STA.w $0813,x               
                    STA.w $0817,x               
CODE_20C011:        LDX.b $9F                   
                    PLB                         
                    RTS                         

DATA_20C015:        db $00,$00,$00,$00,$00,$FF

DATA_20C01B:        db $00,$08,$10,$00,$08,$F8

DATA_20C021:        db $80,$40,$20,$80,$40,$20

CODE_20C027:         PHB       
                    PHK           
                    PLB                         
                    LDA.b #$00                  
                    STA.b $93,x                 
                    LDY.b #$02                  
                    LDA.b $85,x                 
                    AND.b #$40                  
                    BEQ   CODE_20C038           
                    LDY.b #$05                  
CODE_20C038:        LDA.b $53,x                 
                    CLC                         
                    ADC   DATA_20C01B,y               
                    LDA.b $43,x                 
                    ADC   DATA_20C015,y               
                    BEQ   CODE_20C04C           
                    LDA.b $93,x                 
                    ORA   DATA_20C021,y               
                    STA.b $93,x                 
CODE_20C04C:        DEY                         
                    BMI   CODE_20C053           
                    CPY.b #$02                  
                    BNE   CODE_20C038           
CODE_20C053:        PLB                         
                    RTS                         

DATA_20C055:        db $86,$84,$82,$80

CODE_20C059:        PHX
                    TXA                         
                    BNE   CODE_20C062           
                    LDA.w $0511                 
                    BNE   CODE_20C065           
CODE_20C062:        BRL   CODE_20C0E5           

CODE_20C065:        DEC.w $0511                 
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA   DATA_20C055,x             
                    STA.b $01                   
                    LDY.b $91                   
                    LDA.b #$C0                  
                    STA.b $00                   
CODE_20C079:        LDA.b $5B                   
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b $01                   
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b $00                   
                    ORA.b #$24                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    LDA.b $53                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b $00                   
                    AND.b #$F0                  
                    BEQ   CODE_20C0C2           
                    LDA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    PHA                         
                    LDA.w $0805,y               
                    STA.w $0801,y               
                    PLA                         
                    STA.w $0805,y               
CODE_20C0C2:        PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.b $00                   
                    SEC                         
                    SBC.b #$C0                  
                    STA.b $00                   
                    BCS   CODE_20C079                   
                    STZ.b $6B                   
                    STZ.b $63                   
CODE_20C0E5:        PLX                         
                    RTS                         

CODE_20C0E7:        LDX.b #$05                  
CODE_20C0E9:        LDA.b $A6,x                 
                    BEQ   CODE_20C0FA           
                    CMP.b #$01                  
                    BNE   CODE_20C0F7           
                    JSR.w CODE_20C10C           
                    JMP.w CODE_20C0FA           

CODE_20C0F7:        JSR.w CODE_20C140           
CODE_20C0FA:        LDA.w $0513,x               
                    BEQ   CODE_20C102           
                    DEC.w $0513,x               
CODE_20C102:        DEX                         
                    BPL   CODE_20C0E9           
                    RTS                         

DATA_20C106:        db $D0,$20,$60,$43,$B0,$78

CODE_20C10C:        LDA   DATA_20C106,x             
                    STA.b $55,x                 
                    STZ.b $5D,x                 
                    STZ.b $65,x                 
                    STZ.b $6D,x                 
                    INC.b $A6,x                 
                    TXA                         
                    JSL.l CODE_20FB1F           

                      dw CODE_20C139
               dw CODE_20C139
               dw CODE_20C12B
               dw CODE_20C13A
               dw CODE_20C139
               dw CODE_20C139

CODE_20C12B:        STZ.b $65,x
                    STZ.w $0519,x
                    LDA.b #$10
                    STA.w $0513,x      
                    LDA.b #$04                  
                    STA.b $6D,x                 
CODE_20C139:        RTS                         

CODE_20C13A:        LDA.b #$B9                  
                    STA.w $0519,x               
                    RTS                         

CODE_20C140:        TXA                         
                    JSL.l CODE_20FB1F           

                      dw CODE_20C151
               dw CODE_20C164
               dw CODE_20C17A
               dw CODE_20C1DD
               dw CODE_20C229
               dw CODE_20C273

CODE_20C151:        JSR.w CODE_20C3B2           
                    BNE   CODE_20C15E           
                    LDA.b #$20                  
                    STA.b $65,x                 
                    LDA.b #$B0                  
                    STA.b $6D,x                 
CODE_20C15E:        JSR.w CODE_20C418           
                    JMP.w CODE_20C3CE           

CODE_20C164:        JSR.w CODE_20C3B2           
                    BNE   CODE_20C16D           
                    LDA.b #$F0                  
                    STA.b $65,x                 
CODE_20C16D:        JSR.w CODE_20C418           
                    JMP.w CODE_20C3CE           

DATA_20C173:        db $02,$FE

DATA_20C175:        db $20,$E0

DATA_20C177:        db $0A,$F6,$08

CODE_20C17A:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0513,x               
                    BEQ   CODE_20C18E           
                    JSR.w CODE_20C508           
                    INC.b $6D,x                 
                    LDA.b $6D,x                 
                    BNE   CODE_20C1B7           
                    STZ.w $0513,x               
CODE_20C18E:        LDA.w $0519,x               
                    AND.b #$01                  
                    TAY                         
                    LDA   DATA_20C173,y               
                    CLC                         
                    ADC.b $65,x                 
                    STA.b $65,x                 
                    CMP   DATA_20C175,y               
                    BNE   CODE_20C1A4           
                    INC.w $0519,x               
CODE_20C1A4:        LDA.b $65,x                 
                    BPL   CODE_20C1A9           
                    INY                         
CODE_20C1A9:        LDA   DATA_20C177,y               
                    CLC                         
                    ADC.b #$06                  
                    STA.b $6D,x                 
                    JSR.w CODE_20C500           
                    JSR.w CODE_20C508           
CODE_20C1B7:        LDA.b #$40                  
                    LDY.b $65,x                 
                    BEQ   CODE_20C1C3           
                    BPL   CODE_20C1C1           
                    LDA.b #$00                  
CODE_20C1C1:        STA.b $A0,x                 
CODE_20C1C3:        JSR.w CODE_20C418           
                    LDA.b $5D,x                 
                    AND.b #$F0                  
                    CMP.b #$50                  
                    BNE   CODE_20C1DB           
                    LDA.b #$00                  
                    STA.b $A6,x                 
                    LDA.b #$13                  
                    STA.w $0511                 
                    LDA.b #$02                  
                    STA.b $8F                   
CODE_20C1DB:        PLB                         
                    RTS                         

CODE_20C1DD:        JSR.w CODE_20C3B2           
                    BNE   CODE_20C21D           
                    LDA.w $0519,x               
                    BEQ   CODE_20C1ED           
                    DEC.w $0519,x               
                    JMP.w CODE_20C418           

CODE_20C1ED:        LDA.b $55,x                 
                    CMP.b #$30                  
                    BCS   CODE_20C219                  
                    LDA.w $0513,x               
                    BNE   CODE_20C1FD           
                    LDA.b #$10                  
                    STA.w $0513,x               
CODE_20C1FD:        CMP.b #$01                  
                    BNE   CODE_20C205           
                    LDA.b #$00                  
                    STA.b $A6,x                 
CODE_20C205:        LDA.b $65,x                 
                    BEQ   CODE_20C211           
                    LDA.b #$00                  
                    STA.b $65,x                 
                    LDA.b #$D0                  
                    STA.b $6B                   
CODE_20C211:        LDA.b #$01                  
                    STA.w $051F,x               
                    JMP.w CODE_20C418           

CODE_20C219:        LDA.b #$F8                  
                    STA.b $65,x                 
CODE_20C21D:        LDA.b $15                   
                    AND.b #$08                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $A0,x                 
                    JMP.w CODE_20C418           

CODE_20C229:        LDA.w $0519,x               
                    BNE   CODE_20C23A           
                    LDA.b $55,x                 
                    SEC                         
                    SBC.b $5A                   
                    CMP.b #$10                  
                    BCS   CODE_20C260                  
                    INC.w $0519,x               
CODE_20C23A:        LDA.b $65,x                 
                    BNE   CODE_20C24A           
                    LDA.b #$10                  
                    STA.b $65,x                 
                    LDA.b #$C0                  
                    STA.b $6D,x                 
                    LDA.b #$80                  
                    STA.b $A0,x                 
CODE_20C24A:        LDA.b $6D,x                 
                    CLC                         
                    ADC.b #$04                  
                    STA.b $6D,x                 
                    JSR.w CODE_20C500           
                    JSR.w CODE_20C508           
                    LDA.b $4D,x                 
                    BEQ   CODE_20C270           
                    LDA.b #$00                  
                    STA.b $A6,x                 
                    RTS                         

CODE_20C260:        JSR.w CODE_20C3B2           
                    BNE   CODE_20C270           
                    LDA.b #$20                  
                    SEC                         
                    SBC.b $6D,x                 
                    BCC   CODE_20C26E           
                    LDA.b #$00                  
CODE_20C26E:        STA.b $6D,x                 
CODE_20C270:        JMP.w CODE_20C418           

CODE_20C273:        LDA.b $A6,x                 
                    SEC                         
                    SBC.b #$02                  
                    JSL.l CODE_20FB1F           

                      dw CODE_20C286
               dw CODE_20C2A8
               dw CODE_20C2CA
               dw CODE_20C2F3
               dw CODE_20C31A

CODE_20C286:        JSR.w CODE_20C3B2
                    BNE   CODE_20C291           
                    INC.b $A6,x                 
                    STZ.b $65,x                 
                    BRA   CODE_20C2A5           

CODE_20C291:        LDA.b $5D,x                 
                    CMP.b #$90                  
                    BCC   CODE_20C2A5           
                    LDA.b $65,x                 
                    BNE   CODE_20C2A5           
                    LDA.b #$E8                  
                    STA.b $65,x                 
                    STA.b $6D,x                 
                    LDA.b #$10                  
                    STA.b $99                   
CODE_20C2A5:        JMP.w CODE_20C342           

CODE_20C2A8:        JSR.w CODE_20C3B2           
                    LDA.b $BA                   
                    AND.b #$10                  
                    BEQ   CODE_20C2B9           
                    LDA.b #$0A                  
                    STA.b $9B                   
                    LDA.b #$30                  
                    STA.b $65,x                 
CODE_20C2B9:        LDA.b $45,x                 
                    BEQ   CODE_20C2C1           
                    LDA.b #$00                  
                    STA.b $65,x                 
CODE_20C2C1:        LDA.b $98                   
                    BEQ   CODE_20C2C7           
                    INC.b $A6,x                 
CODE_20C2C7:        JMP.w CODE_20C342           

CODE_20C2CA:        LDA.b $98                   
                    BEQ   CODE_20C2D7           
                    LDA.b #$D0                  
                    STA.b $65,x                 
                    LDY.b #$01                  
                    JMP.w CODE_20C36F           

CODE_20C2D7:        JSR.w CODE_20C3B2           
                    LDA.b $55,x                 
                    CMP.b #$38                  
                    BCS   CODE_20C2EA                
                    LDA.b $65,x                 
                    BEQ   CODE_20C2EA           
                    STZ.b $65,x                 
                    LDA.b #$D0                  
                    STA.b $6B                   
CODE_20C2EA:        LDA.b $97                   
                    BEQ   CODE_20C2F0           
                    INC.b $A6,x                 
CODE_20C2F0:        JMP.w CODE_20C342           

CODE_20C2F3:        LDA.b $97                   
                    BEQ   CODE_20C2FC           
                    LDY.b #$00                  
                    JMP.w CODE_20C36F           

CODE_20C2FC:        JSR.w CODE_20C3B2           
                    LDA.b #$30                  
                    STA.b $65,x                 
                    LDA.b $45,x                 
                    BEQ   CODE_20C317           
                    LDA.b #$FF                  
                    STA.b $45,x                 
                    LDA.b #$F0                  
                    STA.b $55,x                 
                    LDA.b #$30                  
                    STA.w $0513,x               
                    INC.b $A6,x                 
                    RTS                         

CODE_20C317:        JMP.w CODE_20C342           

CODE_20C31A:        LDA.w $0513,x               
                    BNE   CODE_20C341           
                    LDA.b $9D                   
                    BNE   CODE_20C33B           
                    JSR.w CODE_20C3B2           
                    LDA.b $45,x                 
                    BNE   CODE_20C33B           
                    LDA.b $8F                   
                    BEQ   CODE_20C33B           
                    LDA.b $53                   
                    SEC                         
                    SBC.b $55,x                 
                    CMP.b #$10                  
                    BCS   CODE_20C33B                   
                    LDA.b #$2C                  
                    STA.b $9D                   
CODE_20C33B:        JSR.w CODE_20C3CE           
                    JSR.w CODE_20C342           
CODE_20C341:        RTS                         

CODE_20C342:        LDA.b $65,x                 
                    BEQ   CODE_20C35C           
                    LDA.b $9D                   
                    BNE   CODE_20C35C           
                    LDA.b $15                   
                    AND.b #$06                  
                    PHA                         
                    LSR   A                     
                    STA.w $051F,x               
                    PLA                         
                    AND.b #$04                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $A0,x                 
CODE_20C35C:        JMP.w CODE_20C418           

DATA_20C35F:        db $F4,$F6,$FA,$FE,$02,$06,$0A,$0C
                    db $0C,$0A,$06,$02,$FE,$FA,$F6,$F4

CODE_20C36F:        LDA.w $53,y                 
                    STA.b $55,x                  
                    LDA.w $43,y               
                    STA.b $45,x                 
                    LDA.w $5B,y               
                    CLC                         
                    ADC.b #$0D                  
                    STA.b $5D,x                 
                    LDA.w $85,y               
                    PHP                         
                    LDA.w $99,y               
                    PLP                         
                    PHA                         
                    BEQ   CODE_20C38F           
                    CLC                         
                    ADC.b #$08                  
CODE_20C38F:        STX.b $0F                   
                    TAX                         
                    LDA   DATA_20C35F,x             
                    BPL   CODE_20C39C           
                    LDX.b $0F                   
                    DEC.b $45,x                 
CODE_20C39C:        LDX.b $0F                   
                    CLC                         
                    ADC.b $55,x                 
                    STA.b $55,x                 
                    BCC   CODE_20C3A7           
                    INC.b $45,x                 
CODE_20C3A7:        PLA                         
                    BNE   CODE_20C3AD           
                    JMP.w CODE_20C418           

CODE_20C3AD:        LDA.b #$00                  
                    JMP.w CODE_20C41C           

CODE_20C3B2:        LDA.b $6D,x                 
                    CLC                         
                    ADC.b #$04                  
                    STA.b $6D,x                 
                    JSR.w CODE_20C508           
                    JSR.w CODE_20C500           
                    LDA.b $5D,x                 
                    AND.b #$F0                  
                    CMP.b #$B0                  
                    BNE   CODE_20C3C9           
                    STA.b $5D,x                 
CODE_20C3C9:        RTS                         

DATA_20C3CA:        db $F0,$30

DATA_20C3CC:        db $FF,$00

CODE_20C3CE:        PHX            
                    TXY           
                    LDX.b #$00                  
                    LDA.w $45,y               
                    BEQ   CODE_20C3F0           
                    BPL   CODE_20C3DA           
                    INX                         
CODE_20C3DA:        LDA.w $55,y               
                    CLC                         
                    ADC   DATA_20C3CA,x             
                    LDA.w $45,y               
                    ADC   DATA_20C3CC,x             
                    BEQ   CODE_20C3F0           
                    LDA.b #$00                  
                    STA.w $A6,y               
CODE_20C3F0:        PLX                         
                    RTS                         

DATA_20C3F2:        db $F8,$F8,$F4,$F4,$F0,$F2,$FA,$FC
                    db $FE,$FE,$DC,$DC,$D4,$D4,$D6,$D8
                    db $DA,$DA,$D6,$D8

DATA_20C406:        db $00,$02,$04,$06,$0A,$0C

DATA_20C40C:        db $00,$10,$20,$50,$40,$30

DATA_20C412:        db $01,$01,$01,$01,$02,$02

CODE_20C418:        LDA   DATA_20C40C,x
CODE_20C41C:        PHA                         
                    LDA   DATA_20C412,x             
                    ASL   A                     
                    STA.b $02                   
                    PHX                         
                    LDA.w $051F,x               
                    ASL   A                     
                    CLC                         
                    ADC   DATA_20C406,x             
                    TAX                         
                    LDA   DATA_20C3F2,x             
                    STA.b $00                   
                    LDA   DATA_20C3F2+1,x             
                    STA.b $01                   
                    PLX                         
                    PLA                         
                    TAY                         
                    LDA.b $5D,x                 
                    CMP.b #$E8                  
                    BCC   CODE_20C445           
                    RTS                         

CODE_20C445:        STA.w $0901,y               
                    STA.w $0905,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0909,y               
                    STA.w $090D,y               
                    LDA.b $55,x                 
                    STA.w $0900,y               
                    STA.w $0908,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0904,y               
                    STA.w $090C,y               
                    LDA.b $02                   
                    ORA.b $A0,x                 
                    ORA.b #$30                  
                    STA.w $0903,y               
                    STA.w $0907,y               
                    STA.w $090B,y               
                    STA.w $090F,y               
                    LDA.b $00                   
                    PHA                         
                    STA.w $0902,y               
                    INC   A                     
                    STA.w $090A,y               
                    LDA.b $01                   
                    STA.w $0906,y               
                    INC   A                     
                    STA.w $090E,y               
                    LDA.b $A0,x                 
                    BEQ   CODE_20C4A0           
                    LDA.b $01                   
                    STA.w $0902,y               
                    INC   A                     
                    STA.w $090A,y               
                    LDA.b $00                   
                    STA.w $0906,y               
                    INC   A                     
                    STA.w $090E,y               
CODE_20C4A0:        LDA.b $A0,x                 
                    AND.b #$80                  
                    BEQ   CODE_20C4B8           
                    LDA.b $01                   
                    STA.w $090A,y               
                    INC   A                     
                    STA.w $0902,y               
                    LDA.b $00                   
                    STA.w $090E,y               
                    INC   A                     
                    STA.w $0906,y               
CODE_20C4B8:        PLA                         
                    CMP.b $01                   
                    BNE   CODE_20C4D0           
                    LDA.w $0903,y               
                    AND.b #$BF                  
                    STA.w $0903,y               
                    STA.w $090B,y               
                    ORA.b #$40                  
                    STA.w $0907,y               
                    STA.w $090F,y               
CODE_20C4D0:        STZ.b $D8                   
                    STZ.b $D9                   
                    LDA.b $45,x                 
                    BEQ   CODE_20C4DA           
                    INC.b $D8                   
CODE_20C4DA:        LDA.b $55,x                 
                    CLC                         
                    ADC.b #$08                  
                    LDA.b #$00                  
                    ADC.b $45,x                 
                    BEQ   CODE_20C4E7           
                    INC.b $D9                   
CODE_20C4E7:        TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $D8                   
                    AND.b #$01                  
                    STA.w $0A60,y               
                    STA.w $0A62,y               
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A61,y               
                    STA.w $0A63,y               
                    RTS                         

CODE_20C500:        INX                         
                    INX                         
                    JSR.w CODE_20BCDF           
                    DEX                         
                    DEX                         
                    RTS                         

CODE_20C508:        LDA.b $6D,x                 
                    BMI   CODE_20C514           
                    CMP.b #$60                  
                    BMI   CODE_20C514           
                    LDA.b #$60                  
                    STA.b $6D,x                 
CODE_20C514:        INX                         
                    INX                         
                    JSR.w CODE_20BD1A           
                    DEX                         
                    DEX                         
                    RTS                         

DATA_20C51C:        db $00,$30,$60,$90

CODE_20C520:        JSL.l CODE_22E0A9
                    LDX.b #$03
CODE_20C526:        LDA.b $A6,x
                    BEQ   CODE_20C536
                    CMP.b #$01
                    BNE   CODE_20C533           
                    JSR.w CODE_20C53A           
                    BRA   CODE_20C536           

CODE_20C533:        JSR.w CODE_20C568           
CODE_20C536:        DEX                         
                    BPL   CODE_20C526           
                    RTS                         

CODE_20C53A:        INC.b $A6,x                 
                    LDA.b #$FF                  
                    STA.b $45,x                 
                    LDA.b #$F0                  
                    STA.b $55,x                 
                    LDA.b #$08                  
                    CPX.b #$03                  
                    BNE   CODE_20C54C           
                    LDA.b #$12                  
CODE_20C54C:        STA.b $65,x                 
                    RTS                         

DATA_20C54F:        db $E0,$F0,$00

DATA_20C552:        db $20,$20,$90,$00

DATA_20C556:        db $44,$44,$44

DATA_20C559:        db $44,$44,$44

DATA_20C55C:        db $B0,$E4,$E8,$B0,$E4,$EE

DATA_20C562:        db $E0,$E2,$E6,$E0,$EA,$EC

CODE_20C568:        JSR.w CODE_20C500
                    JSR.w CODE_20C3CE
                    LDA.b $45,x
                    BNE   CODE_20C584                 
                    LDA   DATA_20C552,x
                    BEQ   CODE_20C584
                    CMP.b $55,x                 
                    BCS   $08                   
                    INX                         
                    LDA.b $A6,x                 
                    BNE   CODE_20C583           
                    INC.b $A6,x                 
CODE_20C583:        DEX                         
CODE_20C584:        LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    CPX.b #$03                  
                    BEQ   CODE_20C58D           
                    LSR   A                     
CODE_20C58D:        AND.b #$01                  
                    BEQ   CODE_20C593           
                    LDA.b #$03                  
CODE_20C593:        STA.w $051F,x               
                    STX.b $02                   
                    LDA.b $55,x                 
                    STA.b $00                   
                    LDA.w $051F,x               
                    STA.b $01                   
                    LDA   DATA_20C51C,x             
                    TAY                         
                    LDX.b #$02                  
CODE_20C5A8:        LDA.b #$BA                  
                    CLC                         
                    ADC   DATA_20C54F,x             
                    STA.w $0901,y               
                    STA.w $0905,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0909,y               
                    STA.w $090D,y               
                    TXA                         
                    PHA                         
                    CLC                         
                    ADC.b $01                   
                    TAX                         
                    LDA   DATA_20C55C,x             
                    STA.w $0902,y               
                    INC   A                     
                    STA.w $090A,y               
                    LDA   DATA_20C562,x             
                    STA.w $0906,y               
                    INC   A                     
                    STA.w $090E,y               
                    PHY                         
                    LDX.b $02                   
                    JSR.w CODE_20C4D0           
                    PLY                         
                    PLA                         
                    TAX                         
                    LDA   DATA_20C556,x             
                    ORA.b #$20                  
                    STA.w $0903,y               
                    STA.w $090B,y               
                    LDA   DATA_20C559,x             
                    ORA.b #$20                  
                    STA.w $0907,y               
                    STA.w $090F,y               
                    LDA.b $00                   
                    STA.w $0900,y               
                    STA.w $0908,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0904,y               
                    STA.w $090C,y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    DEX                         
                    BPL   CODE_20C5A8           
                    LDX.b $02                   
                    RTS                         

CODE_20C617:        STZ.w $1EBF                 
                    STZ.w $4200                 
                    JSL.l CODE_008B63           
                    REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$2000                
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$E000                
                    STA.w $4302                 
                    LDX.b #$35                  
                    STX.w $4304                 
                    LDA.w #$2000                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.w #$3400                
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$9000                
                    STA.w $4302                 
                    LDX.b #$32                  
                    STX.w $4304                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    REP   #$10                  
                    PHB                         
                    LDX.w #$A120                
                    LDY.w #$1320                
                    LDA.w #$00DF                
                    MVN.w $3C00                 
                    LDX.w #$A8C0                
                    LDY.w #$1320                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    LDX.w #$8800                
                    LDY.w #$1400                
                    LDA.w #$009F                
                    MVN.w $3C00                 
                    LDX.w #$8BE0                
                    LDY.w #$14A0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    PHB                         
                    LDX.w #$88A0                
                    LDA.w $0726                 
                    AND.w #$00FF                
                    BEQ   CODE_20C6AF           
                    LDX.w #$88E0                
CODE_20C6AF:        LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    SEP   #$30                  
                    REP   #$20                  
                    LDX.b #$00                  
                    LDA.w #$00FF                
CODE_20C6C2:        STA.l $7F9000,x             
                    STA.l $7F9070,x             
                    STA.l $7F90E0,x             
                    STA.l $7F9150,x             
                    STA.l $7F9200,x             
                    STA.l $7F9270,x             
                    STA.l $7F92E0,x             
                    STA.l $7F9350,x             
                    INX                         
                    INX                         
                    CPX.b #$70                  
                    BNE   CODE_20C6C2           
                    LDA.w #$2641                
                    STA.w $4370                 
                    LDA.w #$F859                
                    STA.w $4372                 
                    LDX.b #$2A                  
                    STX.w $4374                 
                    LDX.b #$7F                  
                    STX.w $4377                 
                    LDA.w #$2841                
                    STA.w $4360                 
                    LDA.w #$F860                
                    STA.w $4362                 
                    LDX.b #$2A                  
                    STX.w $4364                 
                    LDX.b #$7F                  
                    STX.w $4367                 
                    STZ.w $212A                 
                    SEP   #$20                  
                    LDA.b #$25                  
                    STA.w $0205                 
                    LDA.b #$45                  
                    STA.w $0206                 
                    LDA.b #$85                  
                    STA.w $0207                 
                    LDA.b #$A0                  
                    STA.w $0202                 
                    LDA.b #$10                  
                    STA.w $0203                 
                    LDA.b #$32                  
                    STA.w $0204                 
                    LDX.b #$01                  
                    STX.w $1500                 
                    LDA.b #$FF                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    LDA.b #$80                  
                    STA.w $0101                 
                    LDX.b #$F5                  
CODE_20C74C:        STZ.b $00,x                 
                    DEX                         
                    BNE   CODE_20C74C           
                    LDA.b #$EF                  
                    STA.w $0216                 
                    LDA.b #$B0                  
                    STA.w $0218                 
                    JSR.w CODE_20B328           
                    LDA.b #$51                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20D301,x             
                    STA.b $36                   
                    LDA   PNTR_20D301+1,x             
                    STA.b $37                   
                    LDA.b #$20                  
                    STA.b $38                   
                    JSL.l CODE_29E8AB           
                    LDA.b #$22                  
                    STA.w $0350                 
                    JSL.l CODE_2A8DB6           
                    LDA.b #$20                  
                    STA.w $0612                 
                    JSL.l CODE_2AB48E           
                    LDA.b #$C0                  
                    STA.w $0293                 
                    STZ.w $0249                 
                    STZ.w $024A                 
                    LDA.b #$01                  
                    STA.w $020E                 
                    LDA.b #$11                  
                    STA.w $020F                 
                    LDA.b #$00                  
                    STA.b $16                   
                    STA.w $2100                 
                    LDA.b #$09                  
                    STA.w $020C                 
                    STA.w $2105                 
                    LDA.b #$03                  
                    STA.w $021E                 
                    LDA.b #$17                  
                    STA.w $0208                 
                    LDA.b #$80                  
                    STA.w $4200                 
CODE_20C7BB:        JSR.w CODE_20A4B6           
                    JSR.w CODE_20C7CA           
                    LDA.b $A3                   
                    CMP.b #$07                  
                    BNE   CODE_20C7BB           
                    JMP.w CODE_20CB96           

CODE_20C7CA:        JSL.l CODE_22E0A9           
                    LDA.b #$10                  
                    STA.b $91                   
                    LDA.b #$40                  
                    STA.b $92                   
                    LDX.b #$02                  
CODE_20C7D8:        LDA.b $A0,x                 
                    BEQ   CODE_20C7DE           
                    DEC.b $A0,x                 
CODE_20C7DE:        DEX                         
                    BPL   CODE_20C7D8           
                    JSR.w CODE_20C809           
                    LDX.b #$00                  
                    STX.b $9F                   
                    JSR.w CODE_20BE8D           
                    LDA.w $0726                 
                    BEQ   CODE_20C802           
                    LDY.b #$24                  
CODE_20C7F2:        LDA.w $0803,y               
                    ORA.b #$02                  
                    STA.w $0803,y               
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    CPY.b #$10                  
                    BPL   CODE_20C7F2           
CODE_20C802:        INX                         
                    STX.b $9F                   
                    JSR.w CODE_20BE99           
                    RTS                         

CODE_20C809:        LDA.b $A3                   
                    JSL.l CODE_20FB1F           

                      dw CODE_20C81F
               dw CODE_20C856
               dw CODE_20C863
               dw CODE_20C895
               dw CODE_20C8B5
               dw CODE_20C986
               dw CODE_20C9C6
               dw CODE_20C9CE    

CODE_20C81F:        LDA.b #$EC
                    STA.b $53                
                    LDA.b #$FF                  
                    STA.b $43                   
                    LDA.b #$C8                  
                    STA.b $54                   
                    LDA.b #$A0                  
                    STA.b $5B                   
                    STA.b $5C                   
                    LDA.b #$18                  
                    STA.b $8D                   
                    LDA.b #$19                  
                    STA.b $8E                   
                    LDA.b #$40                  
                    STA.b $85                   
                    STA.b $86                   
                    LDA.b #$01                  
                    STA.b $8F                   
                    LDA.b #$0F                  
                    STA.b $A0                   
                    INC.b $A3                   
                    LDA.b #$00                  
                    STA.b $A6                   
                    LDA.b #$50                  
                    STA.b $A5                   
                    LDA.b #$C7                  
                    STA.b $A4                   
                    RTS                         

CODE_20C856:        LDA.b $A0                   
                    EOR.b #$0F                  
                    STA.b $16                   
                    CMP.b #$0F                  
                    BNE   CODE_20C862           
                    INC.b $A3                   
CODE_20C862:        RTS                         

CODE_20C863:        LDA.b $53                   
                    CLC                         
                    ADC.b #$01                  
                    STA.b $53                   
                    LDA.b $43                   
                    ADC.b #$00                  
                    STA.b $43                   
                    PHX                         
                    LDA.b $15                   
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA   DATA_20BB25,x             
                    STA.b $8D                   
                    LDX.b #$00                  
                    JSR.w CODE_20C027           
                    PLX                         
                    LDA.b $53                   
                    CMP.b #$20                  
                    BNE   CODE_20C894           
                    LDA.b #$02                  
                    STA.b $8D                   
                    INC.b $A3                   
                    LDA.b #$30                  
                    STA.b $A0                   
CODE_20C894:        RTS                         

CODE_20C895:        LDA.b $A0                   
                    CMP.b #$01                  
                    BNE   CODE_20C8A8           
                    LDA.b #$02                  
                    STA.b $8D                   
                    LDA.b #$80                  
                    STA.b $A1                   
                    LDA.b #$01                  
                    STA.w $1202                 
CODE_20C8A8:        LDA.b $A1                   
                    CMP.b #$01                  
                    BNE   CODE_20C8B4           
                    LDA.b #$13                  
                    STA.b $A0                   
                    INC.b $A3                   
CODE_20C8B4:        RTS                         

CODE_20C8B5:        LDA.b $A0                   
                    BEQ   CODE_20C916           
                    LDY.b #$30                  
                    STY.b $A1                   
                    AND.b #$FE                  
                    TAX                         
                    LDA.b #$2A                  
                    STA.b $DA                   
                    REP   #$20                  
                    LDA   PNTR_20C972,x             
                    BEQ   CODE_20C914           
                    STA.b $D8                   
                    LDY.b #$00                  
CODE_20C8D0:        LDA.b [$D8],y               
                    STA.w $1320,y               
                    INY                         
                    INY                         
                    CPY.b #$20                  
                    BNE   CODE_20C8D0           
                    LDY.b #$01                  
                    STY.w $1500                 
                    LDY.b $A0                   
                    CPY.b #$09                  
                    BPL   CODE_20C914           
                    PHB                         
                    LDY.b #$7F                  
                    PHY                         
                    PLB                         
                    REP   #$10                  
                    LDY.w #$0000                
                    LDA.l $0249               
                    TAX                         
CODE_20C8F5:        LDA.l $2AEEB1,x             
                    STA.w $9000,x               
                    LDA.l $2AF031,x             
                    STA.w $9200,x               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPY.w #$0030                
                    BNE   CODE_20C8F5           
                    TXA                         
                    STA.l $000249               
                    SEP   #$10                  
                    PLB                         
CODE_20C914:        SEP   #$20                  
CODE_20C916:        LDA.b $A1                   
                    BNE   CODE_20C971           
                    INC.b $A3                   
                    LDA.b #$80                  
                    STA.b $A0                   
                    LDA.b #$1A                  
                    STA.b $8E                   
                    BRA   CODE_20C971           

                    PHX                         
                    LDX.b #$00                  
                    LDA.w $0726                 
                    BEQ   CODE_20C930           
                    LDX.b #$23                  
CODE_20C930:        LDA.w $0715                 
                    STA.w $1D9F,x               
                    LDA.w $0716                 
                    STA.w $1DA0,x               
                    LDA.w $0717                 
                    STA.w $1DA1,x               
                    REP   #$20                  
                    LDX.b #$08                  
CODE_20C946:        LDA.w $E43C,x               
                    STA.w $1EED,x               
                    LDA.w $E484,x               
                    STA.w $1F09,x               
                    LDA.w $E4CC,x               
                    STA.w $1EFB,x               
                    LDA.w $E514,x               
                    STA.w $1F17,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_20C946           
                    SEP   #$20                  
                    LDX.b #$7F                  
CODE_20C966:        STZ.w $1D00,x               
                    DEX                         
                    BPL   CODE_20C966           
                    JSL.l CODE_00922D           
                    PLX                         
CODE_20C971:        RTS                         

PNTR_20C972:          dw $EE91
               dw $EE71
               dw $EE51
               dw $EE31
               dw $EE11
               dw $EDF1
               dw $EDD1
               dw $EDB1
               dw $0000
               dw $0000

CODE_20C986:        LDA.b $A0                   
                    BEQ   CODE_20C993           
                    CMP.b #$60                  
                    BCS   CODE_20C992                   
                    LDA.b #$00                  
                    STA.b $86                   
CODE_20C992:        RTS                         

CODE_20C993:        LDA.b $53                   
                    CMP.b #$68                  
                    BCC   CODE_20C9A8           
                    LDA.b #$02                  
                    STA.b $8D                   
                    LDA.b #$1A                  
                    STA.b $8E                   
                    INC.b $A3                   
                    LDA.b #$B0                  
                    STA.b $A0                   
                    RTS                         

CODE_20C9A8:        LDA.b #$50                  
                    STA.b $A1                   
                    INC.b $53                   
                    DEC.b $54                   
                    PHX                         
                    LDA.b $15                   
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA   DATA_20BB25,x             
                    STA.b $8D                   
                    LDA   DATA_20BB2D,x             
                    STA.b $8E                   
                    PLX                         
                    RTS                         

CODE_20C9C6:        LDA.b $A0                   
                    BNE   CODE_20C9CD           
                    JMP.w CODE_20C9E3           

CODE_20C9CD:        RTS                         

CODE_20C9CE:        LDA.b $A0                   
                    BNE   CODE_20C9DB           
                    STA.b $16                   
                    LDA.b $A1                   
                    BNE   CODE_20C9DA           
                    INC.b $A3                   
CODE_20C9DA:        RTS                         

CODE_20C9DB:        STA.b $16                   
                    LDA.b #$10                  
                    STA.w $A1                 
                    RTS                         

CODE_20C9E3:        LDA.b $A7                   
                    JSL.l CODE_20FB1F           

                      dw CODE_20CA69
               dw CODE_20CB26
               dw CODE_20CB8B

DATA_20C9EF:        db $92,$21,$90,$21,$90,$21,$90,$21
                    db $90,$21,$90,$21,$90,$21,$90,$21
                    db $90,$21,$90,$21,$90,$21,$90,$21
                    db $90,$21,$90,$21,$90,$21,$90,$21
                    db $90,$21,$90,$21,$92,$61,$91,$21
                    db $FE,$21,$FE,$21,$FE,$21,$FE,$21
                    db $FE,$21,$FE,$21,$FE,$21,$FE,$21
                    db $FE,$21,$FE,$21,$FE,$21,$FE,$21
                    db $FE,$21,$FE,$21,$FE,$21,$FE,$21
                    db $FE,$21,$91,$61,$92,$A1,$90,$A1
                    db $90,$A1,$90,$A1,$90,$A1,$90,$A1
                    db $90,$A1,$90,$A1,$90,$A1,$90,$A1
                    db $90,$A1,$90,$A1,$90,$A1,$90,$A1
                    db $90,$A1,$90,$A1,$90,$A1,$90,$A1
                    db $92,$E1

DATA_20CA61:        db $00,$26,$26,$26,$26,$26
                    db $26,$4C

CODE_20CA69:         PHB
                    PHK           
                    PLB                         
                    LDX.w $1600                 
                    LDA.b $A5                   
                    STA.w $1602,x               
                    LDA.b $A4                   
                    STA.w $1603,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.b $A4                   
                    BCC   CODE_20CA82           
                    INC.b $A5                   
CODE_20CA82:        LDA.b #$00                  
                    STA.w $1604,x               
                    LDA.b #$25                  
                    STA.w $1605,x               
                    STA.b $00                   
                    LDY.b $A6                   
                    LDA   DATA_20CA61,y               
                    TAY                         
CODE_20CA94:        LDA   DATA_20C9EF,y               
                    STA.w $1606,x               
                    INY                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_20CA94           
                    LDA.b #$FF                  
                    STA.w $1606,x               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    STX.w $1600                 
                    INC.b $A6                   
                    LDA.b $A6                   
                    CMP.b #$08                  
                    BCC   CODE_20CAC9           
                    LDY.b #$00                  
                    LDA   DATA_20CB25,y               
                    STA.b $A6                   
                    LDA.b #$50                  
                    STA.b $A5                   
                    LDA.b #$E9                  
                    STA.b $A4                   
                    LDA.b #$10                  
                    STA.b $A2                   
                    INC.b $A7                   
CODE_20CAC9:        PLB                         
                    RTS                         

DATA_20CACB:        db $CD,$A7,$A0,$AD,$AA,$FE,$B8,$AE
                    db $B4,$D7,$FE,$BB,$B4,$B3,$FE,$AE
                    db $B4,$B1,$FE,$C9,$B1,$A8,$AD,$A2
                    db $A4,$B2,$B2,$FE,$A8,$B2,$A8,$AD
                    db $FE,$A0,$AD,$AE,$B3,$A7,$A4,$B1
                    db $FE,$FE,$FE,$FE,$FE,$A2,$A0,$B2
                    db $B3,$AB,$A4,$D4,$D7,$D7,$D7,$C3
                    db $B4,$B2,$B3,$FE,$AA,$A8,$A3,$A3
                    db $A8,$AD,$A6,$D4,$FE,$C1,$A0,$FE
                    db $A7,$A0,$FE,$A7,$A0,$D4,$FE,$BB
                    db $B8,$A4,$FE,$A1,$B8,$A4,$D7,$FE
                    db $FE,$FE

DATA_20CB25:        db $00

CODE_20CB26:        PHB
                    PHK                         
                    PLB                         
                    LDA.b $A2                   
                    BNE   CODE_20CB89           
                    LDX.w $1600                 
                    LDY.b $A6                   
                    LDA.b $A5                   
                    STA.w $1602,x               
                    LDA.b #$00                  
                    STA.w $1604,x               
                    LDA.b #$01                  
                    STA.w $1605,x               
                    LDA   DATA_20CACB,y               
                    STA.w $1606,x               
                    LDA.b #$21                  
                    STA.w $1607,x               
                    LDA.b #$FF                  
                    STA.w $1608,x               
                    TXA                         
                    CLC                         
                    ADC.b #$06                  
                    STA.w $1600                 
                    LDA.b $A4                   
                    STA.w $1603,x               
                    INC.b $A6                   
                    INC.b $A4                   
                    AND.b #$1F                  
                    CMP.b #$17                  
                    BNE   CODE_20CB7C           
                    LDA.b $A4                   
                    CLC                         
                    ADC.b #$11                  
                    STA.b $A4                   
                    BCC   CODE_20CB72           
                    INC.b $A5                   
CODE_20CB72:        CMP.b #$A9                  
                    BNE   CODE_20CB7C           
                    INC.b $A7                   
                    LDA.b #$4A                  
                    STA.b $A1                   
CODE_20CB7C:        LDX.b #$10                  
                    LDA   DATA_20CACB,y               
                    CMP.b #$FE                  
                    BNE   CODE_20CB87           
                    LDX.b #$01                  
CODE_20CB87:        STX.b $A0                   
CODE_20CB89:        PLB                         
                    RTS                         

CODE_20CB8B:        LDA.b $A1                   
                    BNE   CODE_20CB95           
                    LDA.b #$0F                  
                    STA.b $A0                   
                    INC.b $A3                   
CODE_20CB95:        RTS                         

CODE_20CB96:        LDA.b #$0F                  
                    STA.b $16                   
CODE_20CB9A:        JSR.w CODE_20A4B6           
                    DEC.b $16                   
                    BNE   CODE_20CB9A           
                    STZ.w $4200                 
                    STZ.b $16                   
                    STZ.w $0293                 
                    STZ.w $420C                 
                    LDA.b #$80                  
                    STA.w $2100                 
                    LDA.b #$02                  
                    STA.w $2107                 
                    LDA.b #$0A                  
                    STA.w $2108                 
                    LDA.b #$13                  
                    STA.w $2109                 
                    JSL.l CODE_22E0A9           
                    LDA.b #$5C                  
                    STA.b $00                   
                    STZ.b $01                   
                    JSR.w CODE_20FA0A           
                    REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$2000                
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    STA.w $4310                 
                    STA.w $4320                 
                    STA.w $4330                 
                    LDA.w #$E000                
                    STA.w $4302                 
                    LDA.w #$B000                
                    STA.w $4312                 
                    LDA.w #$D000                
                    STA.w $4322                 
                    LDA.w #$B000                
                    STA.w $4332                 
                    LDX.b #$37                  
                    STX.w $4304                 
                    STX.w $4314                 
                    LDX.b #$0C                  
                    STX.w $4324                 
                    LDX.b #$3A                  
                    STX.w $4334                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    STA.w $4315                 
                    STA.w $4335                 
                    LDA.w #$2800                
                    STA.w $4325                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    INX                         
                    STX.w $420B                 
                    LDA.w #$6000                
                    STA.w $2116                 
                    LDX.b #$04                  
                    STX.w $420B                 
                    LDA.w #$3000                
                    STA.w $2116                 
                    LDX.b #$08                  
                    STX.w $420B                 
                    LDX.w $0726                 
                    BEQ   CODE_20CC7F           
                    LDA.w #$E000                
                    STA.w $4302                 
                    LDA.w #$F000                
                    STA.w $4312                 
                    LDX.b #$3D                  
                    STX.w $4304                 
                    STX.w $4314                 
                    LDA.w #$1000                
                    STA.w $4305                 
                    LDA.w #$0800                
                    STA.w $4315                 
                    LDA.w #$6000                
                    STA.w $2116                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.w #$6C00                
                    STA.w $2116                 
                    LDX.b #$02                  
                    STX.w $420B                 
CODE_20CC7F:        SEP   #$20                  
                    LDA.b #$05                  
                    STA.w $0350                 
                    JSL.l CODE_2A8DB6           
                    JSL.l CODE_2A84B0           
                    REP   #$20                  
                    LDA.w #$00FF                
                    STA.b $00                   
                    STZ.w $2115                 
                    LDA.w #$0400                
                    STA.w $2116                 
                    LDA.w #$1808                
                    STA.w $4300                 
                    STZ.w $4302                 
                    STZ.w $4304                 
                    LDA.w #$0800                
                    STA.w $4305                 
                    LDY.b #$01                  
                    STY.w $420B                 
                    STZ.w $2115                 
                    LDA.w #$0800                
                    STA.w $2116                 
                    LDA.w #$1808                
                    STA.w $4300                 
                    STZ.w $4302                 
                    STZ.w $4304                 
                    LDA.w #$0800                
                    STA.w $4305                 
                    STY.w $420B                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.l $7E3955               
                    LDA.b #$20                  
                    STA.w $0101                 
                    STZ.w $0238                 
                    STZ.w $0239                 
                    LDX.b #$F4                  
CODE_20CCE8:        LDA.b #$00                  
                    STA.b $00,x                 
CODE_20CCEC:        DEX                         
                    CPX.b #$6B                  
                    BCC   CODE_20CCF5           
                    CPX.b #$75                  
                    BCC   CODE_20CCEC           
CODE_20CCF5:        CPX.b #$FF                  
                    BNE   CODE_20CCE8           
                    LDX.b #$15                  
CODE_20CCFB:        LDA.b #$00                  
                    STA.w $0510,x               
                    DEX                         
                    BPL   CODE_20CCFB           
                    JSR.w CODE_20B328           
                    JSR.w CODE_20B09A           
                    JSL.l CODE_29CE10           
                    REP   #$20                  
                    LDX.b #$1E                  
                    LDA.w #$0000                
CODE_20CD14:        STA.w $1340,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_20CD14           
                    SEP   #$20                  
                    LDA.b #$20                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20D301,x             
                    STA.b $36                   
                    LDA   PNTR_20D301+1,x             
                    STA.b $37                   
                    LDA.b #$20                  
                    STA.b $38                   
                    JSL.l CODE_29E8AB           
                    LDA.b #$B0                  
                    STA.w $0216                 
                    STZ.w $0218                 
                    STZ.w $0219                 
                    STZ.w $021A                 
                    STZ.w $021B                 
                    LDA.b #$00                  
                    STA.l $7E3955               
                    LDA.b #$1F                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20D301,x             
                    STA.b $36                   
                    LDA   PNTR_20D301+1,x             
                    STA.b $37                   
                    LDA.b #$20                  
                    STA.b $38                   
                    JSL.l CODE_29E8AB           
                    LDA.b #$13                  
                    STA.w $0208                 
                    LDA.b #$04                  
                    STA.w $0209                 
                    LDA.b #$02                  
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    LDA.b #$00                  
                    LDX.b #$C6                  
                    LDY.b #$3C                  
                    JSL.l CODE_20A1D2           
                    LDA.b #$00                  
                    LDX.b #$D0                  
                    LDY.b #$3C                  
                    JSL.l CODE_20A1E6           
                    LDA.b #$01                  
                    STA.w $02BF                 
                    LDA.b #$1E                  
                    STA.w $02C1                 
                    REP   #$20                  
                    JSL.l CODE_22E1C5           
                    REP   #$20                  
                    LDA.w #$B800                
                    STA.b $0D                   
                    LDX.b #$32                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$4400                
                    JSR.w CODE_20AFF0           
                    LDA.w #$E000                
                    STA.b $0D                   
                    LDX.b #$37                  
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$4800                
                    JSR.w CODE_20AFF0           
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$3A                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3C00                
                    JSR.w CODE_20AFF0           
                    SEP   #$20                  
                    LDA.b #$07                  
                    STA.w $0243                 
                    LDA.b #$01                  
                    STA.w $0245                 
                    JSR.w CODE_20A07B           
                    LDA.b #$81                  
                    STA.w $4200                 
                    STA.w $02D9                 
                    LDA.b #$0F                  
                    STA.b $16                   
                    LDA.b #$58                  
                    STA.b $BD                   
                    LDA.b #$05                  
                    STA.b $B1                   
CODE_20CDFD:        JSR.w CODE_20A4B6           
                    DEC.b $B1                   
                    BPL   CODE_20CDFD           
                    LDA.b #$03                  
                    STA.b $B1                   
                    LDA.b $BD                   
                    STA.w $28                 
                    INC.b $BD                   
                    LDA.b $BD                   
                    CMP.b #$5B                  
                    BNE   CODE_20CDFD           
                    LDA.b #$14                  
                    STA.b $4B                   
                    LDA.b #$20                  
                    STA.b $4C                   
                    LDA.b #$00                  
                    STA.b $BD                   
CODE_20CE21:        JSR.w CODE_20A4B6           
                    LDA.b $BD                   
                    BNE   CODE_20CE35           
                    LDA.w $0216                 
                    SEC                         
                    SBC.b #$01                  
                    STA.w $0216                 
                    BNE   CODE_20CE35           
                    INC.b $BD                   
CODE_20CE35:        LDA.b $4C                   
                    SEC                         
                    SBC.b #$01                  
                    STA.b $4C                   
                    BCS   CODE_20CE21                   
                    LDA.b #$16                  
                    STA.b $4C                   
                    DEC.b $4B                   
                    BPL   CODE_20CE21           
CODE_20CE46:        JSR.w CODE_20A4B6           
                    JSR.w CODE_20D0BA           
                    LDA.b $4D                   
                    CMP.b #$08                  
                    BNE   CODE_20CE46           
                    LDA.b #$00                  
                    STA.b $4D                   
                    STZ.w $02D3                 
                    LDA.b #$B0                  
                    STA.w $0216                 
                    STZ.w $0217                 
                    REP   #$30                  
                    LDA.w #$0000                
                    LDX.w #$001E                
CODE_20CE69:        STA.l $7F94E0,x             
                    DEX                         
                    DEX                         
                    BPL   CODE_20CE69           
                    PHB                         
                    LDX.w #$A4C0                
                    LDY.w #$13E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    SEP   #$30                  
                    INC.w $1500                 
                    JSL.l CODE_22E0A9           
CODE_20CE88:        JSR.w CODE_20A4B6           
                    DEC.w $0216                 
                    LDA.w $0216                 
                    BNE   CODE_20CE88           
                    LDA.b #$55                  
                    STA.b $B1                   
CODE_20CE97:        JSR.w CODE_20A4B6           
                    DEC.b $B1                   
                    BPL   CODE_20CE97           
                    LDA.b #$1B                  
                    STA.w $071E                 
                    LDA.b #$00                  
                    STA.l $7FC587               
                    JSR.w CODE_20CEAE           
                    BRA   CODE_20CEE5           

CODE_20CEAE:        LDX.b #$00                  
                    TXY                         
CODE_20CEB1:        TXA                         
                    AND.b #$03                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b #$60                  
                    STA.w $0800,y               
                    LDA.b #$60                  
                    STA.w $0801,y               
                    TXA                         
                    AND.b #$03                  
                    ASL   A                     
                    CLC                         
                    ADC.b #$C0                  
                    STA.w $0802,y               
                    LDA.b #$04                  
                    ORA.l $7FC587               
                    STA.w $0803,y               
                    LDA.b #$02                  
                    STA.w $0A20,x               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.b #$04                  
                    BNE   CODE_20CEB1           
                    RTS                         

CODE_20CEE5:        JSL.l CODE_29CFB6           
                    LDA.b #$03                  
                    STA.b $B1                   
                    LDA.b #$03                  
                    STA.b $BD                   
CODE_20CEF1:        JSR.w CODE_20A4B6           
                    JSL.l CODE_29D09A           
                    LDA.l $7FC587               
                    CLC                         
                    ADC.b #$03                  
                    CMP.b #$30                  
                    BCC   CODE_20CF05           
                    LDA.b #$30                  
CODE_20CF05:        STA.l $7FC587               
                    PHA                         
                    AND.b #$30                  
                    STA.l $7FC587               
                    JSR.w CODE_20CEAE           
                    PLA                         
                    STA.l $7FC587               
                    LDA.w $02B3                 
                    CMP.b #$02                  
                    BNE   CODE_20CEF1           
                    LDA.b #$C0                  
                    STA.w $1CFC                 
CODE_20CF24:        JSR.w CODE_20A4B6           
                    DEC.w $1CFC                 
                    BNE   CODE_20CF24           
                    LDA.b #$15                  
                    STA.w $1203                 
CODE_20CF31:        JSR.w CODE_20A4B6           
                    LDA.w $02E5                 
                    BNE   CODE_20CF62           
                    JSL.l CODE_2AFE63           
                    LDX.w $0726                 
                    LDA.b $F6,x                 
                    AND.b #$10                  
                    BEQ   CODE_20CF31           
                    REP   #$10                  
                    LDX.w #$0000                
                    LDA.b #$F0                  
CODE_20CF4D:        STA.w $0801,x               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    CPX.w #$0200                
                    BCC   CODE_20CF4D           
                    SEP   #$10                  
                    JSL.l CODE_29EBB7           
                    INC.w $02E5                 
CODE_20CF62:        JSL.l CODE_29EBF7           
                    JMP.w CODE_20CF31           

CODE_20CF69:        DEC.b $C2                   
                    LDA.b $C2                   
                    JSL.l CODE_20FB1F           

                      dw CODE_20D11A
               dw CODE_20D157

DATA_20CF75:        db $30,$33,$35,$36,$33,$31,$30,$31
                    db $30,$33,$35,$36,$33,$31,$30,$31
                    db $36,$3A,$3A,$3A,$36,$3A,$36,$36
                    db $3A,$2D,$3A,$2D,$36,$2D,$2D,$34
                    db $36,$2D,$3A,$36,$36,$2D,$2D,$34

DATA_20CF9D:        db $C0,$80,$C0,$F0,$C0,$C0,$C0,$80
                    db $C8,$88,$C8,$F8,$C8,$C8,$C8,$88
                    db $80,$E8,$98,$90,$80,$A8,$80,$80
                    db $E0,$D0,$C0,$B8,$80,$F0,$C0,$C0
                    db $80,$D8,$C8,$80,$80,$F8,$C8,$C8
DATA_20CFC5:        db $00,$08,$10,$18,$20

DATA_20CFCA:        db $00,$00,$00
                    db $04,$00,$10,$00,$14,$00,$18

DATA_20CFD4:        db $00
                    db $00,$00,$08,$00,$10,$00,$18

CODE_20CFDC:        LDA.w $02D3                 
                    CMP.b #$FF                  
                    BEQ   CODE_20D026           
                    BPL   CODE_20D026           
                    AND.b #$7F                  
                    CMP.b #$05                  
                    BEQ   CODE_20D027           
                    CMP.b #$06                  
                    BNE   CODE_20CFF2           
                    JMP.w CODE_20D06F           

CODE_20CFF2:        TAX                         
                    ASL   A                     
                    STA.b $00                   
                    LDA   DATA_20CFC5,x             
                    CLC                         
                    ADC.w $004D                 
                    TAX                         
                    LDA   DATA_20CF75,x             
                    STA.b $0F                   
                    LDA   DATA_20CF9D,x             
                    STA.b $0E                   
                    STZ.b $0D                   
                    REP   #$20                  
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDX.b $00                   
                    LDA.w #$2000                
                    CLC                         
                    ADC   DATA_20CFCA,x             
                    JSR.w CODE_20AFF0           
                    SEP   #$20                  
                    INC.w $02D3                 
CODE_20D026:        RTS                         

CODE_20D027:        INC.w $02D3                 
                    REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$0800                
                    STA.w $4305                 
                    LDA.w #$6000                
                    LDY.w $004D                 
                    CPY.b #$04                  
                    BCC   CODE_20D04A           
                    LDA.w #$8000                
CODE_20D04A:        STA.b $00                   
                    TYA                         
                    AND.w #$0003                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_20CFD4,x             
                    CLC                         
                    ADC.b $00                   
                    STA.w $4302                 
                    LDX.b #$7E                  
                    STX.w $4304                 
                    LDA.w #$0400                
                    STA.w $2116                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    SEP   #$20                  
                    RTS                         

CODE_20D06F:        LDA.b #$FF                  
                    STA.w $02D3                 
                    REP   #$20                  
                    LDA.w #$0800                
                    STA.w $2116                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$2000                
                    STA.w $4302                 
                    LDX.b #$7F                  
                    STX.w $4304                 
                    LDA.w #$0600                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    SEP   #$20                  
                    RTS                         

CODE_20D0A0:        LDA.b $15                   
                    AND.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $C9DF,x               
                    CMP.w $0245                 
                    BEQ   CODE_20D0B3           
                    STZ.w $0243                 
CODE_20D0B3:        STA.w $0245                 
                    JSR.w CODE_20A07B           
                    RTS                         

CODE_20D0BA:        LDA.b #$00                  
                    STA.b $C2                   
                    LDA.b $43                   
                    JSL.l CODE_20FB1F           

                      dw CODE_20D0DF
               dw CODE_20D102
               dw CODE_20D115
               dw CODE_20D0DA
               dw CODE_20D149
               dw CODE_20D152
               dw CODE_20D15F
               dw CODE_20D162
               dw CODE_20D1E9
               dw CODE_20D206
               dw CODE_20D268

CODE_20D0DA:        INC.b $43
                    NOP
                    NOP                         
                    RTS                         

CODE_20D0DF:        LDY.b #$01                  
CODE_20D0E1:        INC.w $0216                 
                    LDA.w $0216                 
                    CMP.b #$D0                  
                    BEQ   CODE_20D0EF           
                    DEY                         
                    BPL   CODE_20D0E1           
                    RTS                         

CODE_20D0EF:        INC.b $43                   
                    LDA.b #$10                  
                    STA.w $0216                 
                    LDA.b #$01                  
                    STA.w $0217                 
                    STZ.w $0218                 
                    STZ.w $0219                 
                    RTS                         

CODE_20D102:        LDA.b #$03                  
                    STA.b $46                   
                    LDA.b #$20                  
                    STA.b $47                   
                    LDA.b #$06                  
                    STA.b $44                   
                    LDA.b #$5C                  
                    STA.b $45                   
                    INC.b $43                   
                    RTS                         

CODE_20D115:        LDA.b #$01                  
                    STA.b $C2                   
                    RTS                         

CODE_20D11A:        REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.b $46                   
                    XBA                         
                    STA.w $2116                 
                    LDY.b #$1F                  
                    LDA.w #$085C                
CODE_20D12C:        STA.w $2118                 
                    DEY                         
                    BPL   CODE_20D12C           
                    SEP   #$20                  
                    DEC.b $44                   
                    BPL   CODE_20D13B           
                    INC.b $43                   
                    RTS                         

CODE_20D13B:        JSR.w CODE_20D2C1           
                    RTS                         

                    INC.b $43                   
                    LDA.b $47                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $47                   
                    RTS                         

CODE_20D149:        INC.b $43                   
                    LDA.b #$0C                  
                    STA.b $44                   
                    STZ.b $48                   
                    RTS                         

CODE_20D152:        LDA.b #$02                  
                    STA.b $C2                   
                    RTS                         

CODE_20D157:        INC.b $43                   
                    LDA.b #$80                  
                    STA.w $02D3                 
                    RTS                         

CODE_20D15F:        INC.b $43                   
                    RTS                         

CODE_20D162:        JSL.l CODE_22E0A9           
                    PHB                         
                    LDA.b #$22                  
                    PHA                         
                    PLB                         
                    LDX.b $4D                   
                    LDA.w $923E,x               
                    XBA                         
                    LDA.w $9246,x               
                    REP   #$10                  
                    TAX                         
                    LDY.w #$0000                
CODE_20D17A:        LDA.w $9256,x               
                    CMP.b #$FF                  
                    BEQ   CODE_20D1C5           
                    STA.w $0800,y               
                    STA.w $0804,y               
                    INX                         
                    LDA.w $9256,x               
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    INX                         
                    LDA.w $9256,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    INX                         
                    LDA.w $9256,x               
                    STA.w $0803,y               
                    STA.w $0807,y               
                    INX                         
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w #$0000                
                    STA.w $0A20,y               
                    PLY                         
                    TYA                         
                    CLC                         
                    ADC.w #$0008                
                    TAY                         
                    SEP   #$20                  
                    BRA   CODE_20D17A           
CODE_20D1C5:        SEP   #$10                  
                    LDA.b $4D                   
                    CMP.b #$03                  
                    BNE   CODE_20D1DA           
                    LDA.b #$34                  
                    STA.w $0897                 
                    STA.w $089F                 
                    LDA.b #$74                  
                    STA.w $08A7                 
CODE_20D1DA:        INC.b $43                   
                    LDA.b #$03                  
                    STA.b $49                   
                    PLB                         
                    JSL.l CODE_29CE95           
                    STZ.w $02B3                 
                    RTS                         

CODE_20D1E9:        JSR.w CODE_20D0A0           
                    JSL.l CODE_29D09A           
                    JSL.l CODE_29D232           
                    LDA.w $02B3                 
                    CMP.b #$02                  
                    BNE   CODE_20D205           
                    INC.b $43                   
                    LDA.b #$0F                  
                    STA.b $4B                   
                    LDA.b #$16                  
                    STA.b $4C                   
CODE_20D205:        RTS                         

CODE_20D206:        JSR.w CODE_20D0A0           
                    LDA.b $4C                   
                    SEC                         
                    SBC.b #$01                  
                    STA.b $4C                   
                    BCS   $4D                   
                    LDA.b $4B                   
                    BEQ   CODE_20D24D           
                    DEC   A                     
                    BEQ   CODE_20D22E           
                    DEC   A                     
                    BNE   CODE_20D251           
                    LDX.w $004D                 
                    LDA   DATA_20D260,x             
                    STA.w $0350                 
                    BEQ   CODE_20D251           
                    JSL.l CODE_2A8DB6           
                    BRA   CODE_20D251           

CODE_20D22E:        LDA.w $4D                 
                    CMP.b #$06                  
                    BNE   CODE_20D251           
                    PHB                         
                    PHK                         
                    PLB                         
                    LDA.b #$00                  
                    XBA                         
                    REP   #$10                  
                    LDY.w #$00B0                
                    LDX.w #$00F0                
                    LDA.b #$BF                  
                    MVN.w $7F7F                 
                    SEP   #$10                  
                    PLB                         
                    BRA   CODE_20D251           
CODE_20D24D:        JSL.l CODE_2A84B0           
CODE_20D251:        LDA.b #$16                  
                    STA.b $4C                   
                    DEC.b $4B                   
                    BPL   CODE_20D25F           
                    INC.b $43                   
                    LDA.b #$03                  
                    STA.b $49                   
CODE_20D25F:        RTS                         

DATA_20D260:        db $0E,$01,$0C,$00,$18,$0A,$1B,$00

CODE_20D268:        JSR.w CODE_20D0A0         
                    JSL.l CODE_29D09A           
                    JSL.l CODE_29D232           
                    LDA.w $02B3                 
                    BNE   CODE_20D2C0           
                    LDA.b #$01                  
                    STA.b $43                   
                    INC.b $4D                   
                    LDA.b $4D                   
                    CMP.b #$02                  
                    BNE   CODE_20D29E           
                    LDA.b #$EF                  
                    STA.w $021A                 
                    LDA.b #$00                  
                    STA.w $021B                 
                    LDA.b #$17                  
                    STA.w $0208                 
                    LDA.b #$13                  
                    STA.w $0209                 
                    LDA.b #$64                  
                    STA.w $0204                 
                    RTS                         

CODE_20D29E:        STZ.w $021A                 
                    STZ.w $021B                 
                    LDA.b #$13                  
                    STA.w $0208                 
                    LDA.b #$04                  
                    STA.w $0209                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    LDA.b #$20                  
                    STA.w $0205                 
                    ASL   A                     
                    STA.w $0206                 
                    ASL   A                     
                    STA.w $0207                 
CODE_20D2C0:        RTS                         

CODE_20D2C1:        LDA.b $47                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $47                   
                    LDA.b $46                   
                    ADC.b #$00                  
                    STA.b $46                   
                    CMP.b #$18                  
                    BCS   $0E                   
                    CMP.b #$14                  
                    BCC   CODE_20D2E0           
                    LDA.b #$18                  
                    STA.b $46                   
                    LDA.b $47                   
                    AND.b #$1F                  
                    STA.b $47                   
CODE_20D2E0:        RTS                         

                    db $57,$53,$51,$00,$43,$02,$44,$54
                    db $00,$04,$00,$76,$76,$76,$04,$76
                    db $57,$4E,$1A,$1A,$00,$0B,$00,$00
                    db $4F,$4F,$00,$00,$4F,$4F,$4F,$00

PNTR_20D301:          dw $1602
               dw DATA_20DBA0
               dw DATA_20D502
               dw DATA_20D547
               dw DATA_20D58C
               dw DATA_20D5D1
               dw DATA_20D616
               dw DATA_20D64D
               dw DATA_20D684
               dw DATA_20D6BB
               dw DATA_20D6F2
               dw DATA_20D737
               dw DATA_20D77C
               dw DATA_20D7C1
               dw DATA_20D806
               dw DATA_20D84B
               dw DATA_20D87A
               dw DATA_20D8A9
               dw DATA_20D8D8
               dw DATA_20D91D
               dw DATA_20D962
               dw DATA_20D9A7
               dw DATA_20D9CE
               dw DATA_20D9F5
               dw DATA_20DA20
               dw DATA_20DA4F
               dw DATA_20DA7E
               dw DATA_20DA7E
               dw DATA_20DA7E
               dw DATA_20DA7F
               dw DATA_20D3BD
               dw DATA_20DC30
               dw DATA_20DC75
               dw DATA_20DDBA
               dw DATA_20DDFA
               dw DATA_20DE3A
               dw DATA_20DE7A
               dw DATA_20DEBA
               dw DATA_20DEFA
               dw DATA_20DEFA
               dw DATA_20DEFA
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFB
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC           
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFC       
               dw DATA_20DEFC    
               dw DATA_20DEFC    
               dw DATA_20DEFD
               dw DATA_20E002
               dw DATA_20E042
               dw DATA_20E042
               dw DATA_20E042
               dw DATA_20E042
               dw DATA_20E043
               dw DATA_20E063
               dw DATA_20E063
               dw DATA_20E063
               dw DATA_20E063
               dw DATA_20DBBE
               dw DATA_20DBF7
      
DATA_20D3BD:        db $13,$00,$01,$3F,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$15,$2C,$15,$2C
                    db $16,$2C,$16,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$E6,$2C,$E6,$2C
                    db $E7,$2C,$E7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$F6,$2C,$F6,$2C
                    db $F7,$2C,$F7,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$5F,$2C,$5F,$2C
                    db $5D,$2C,$5D,$2C,$FF

DATA_20D502:        db $00,$00,$00
                    db $3F,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$F4,$01,$F5,$01,$F5,$41,$F4
                    db $41,$FF

DATA_20D547:        db $00,$20,$00,$3F,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$F6,$01
                    db $F7,$01,$F7,$41,$F6,$41,$FF

DATA_20D58C:        db $00
                    db $40,$00,$3F,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$F8,$01,$F9,$01,$F9
                    db $41,$F8,$41,$FF

DATA_20D5D1:        db $00,$60,$00,$3F
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $5C,$00,$FA,$01,$FA,$41,$5C,$00
                    db $FF

DATA_20D616:        db $00,$80,$40,$12,$5C,$00,$00
                    db $8A,$00,$2B,$45,$09,$30,$08,$31
                    db $08,$32,$08,$33,$08,$34,$08,$35
                    db $08,$36,$08,$37,$08,$38,$08,$39
                    db $08,$3A,$08,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$3B,$1C,$3C,$1C,$3D
                    db $1C,$3E,$1C,$5C,$00,$5C,$00,$FF

DATA_20D64D:        db $00,$A0,$40,$12,$5C,$00,$00,$AA
                    db $00,$2B,$46,$09,$40,$08,$41,$08
                    db $42,$08,$43,$08,$44,$08,$45,$08
                    db $46,$08,$47,$08,$48,$08,$49,$08
                    db $4A,$08,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$4B,$1C,$4C,$1C,$4D,$1C
                    db $4E,$1C,$5C,$00,$5C,$00,$FF

DATA_20D684:        db $00
                    db $C0,$00,$2B,$5C,$00,$5C,$00,$3B
                    db $1C,$3C,$1C,$3D,$1C,$3E,$1C,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$47
                    db $09,$50,$08,$51,$08,$52,$08,$53
                    db $08,$54,$08,$55,$08,$56,$08,$57
                    db $08,$58,$08,$59,$08,$5A,$08,$00
                    db $D6,$40,$12,$5C,$00,$FF

DATA_20D6BB:        db $00,$E0
                    db $00,$2B,$5C,$00,$5C,$00,$4B,$1C
                    db $4C,$1C,$4D,$1C,$4E,$1C,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$48,$09
                    db $60,$08,$61,$08,$62,$08,$63,$08
                    db $64,$08,$5C,$00,$66,$08,$67,$08
                    db $68,$08,$69,$08,$6A,$08,$00,$F6
                    db $40,$12,$5C,$00,$FF

DATA_20D6F2:        db $01,$00,$00
                    db $3F,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$40,$09,$70,$08,$71,$08,$72
                    db $08,$73,$08,$74,$08,$75,$08,$76
                    db $08,$77,$08,$78,$08,$79,$08,$5C
                    db $00,$5C,$00,$5C,$00,$7D,$08,$7E
                    db $08,$7F,$08,$C0,$08,$C1,$08,$C2
                    db $08,$5C,$00,$C4,$08,$C5,$08,$CE
                    db $08,$CF,$08,$5C,$00,$5C,$00,$5C
                    db $00,$FF

DATA_20D737:        db $01,$20,$00,$3F,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$41,$09
                    db $80,$08,$81,$08,$82,$08,$83,$08
                    db $84,$08,$85,$08,$86,$08,$87,$08
                    db $88,$08,$89,$08,$8A,$08,$8B,$08
                    db $8C,$08,$8D,$08,$8E,$08,$8F,$08
                    db $D0,$08,$D1,$08,$D2,$08,$D3,$08
                    db $D4,$08,$D5,$08,$49,$09,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$FF

DATA_20D77C:        db $01
                    db $40,$00,$3F,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$42,$09,$90,$08,$91
                    db $08,$92,$08,$93,$08,$94,$08,$95
                    db $08,$96,$08,$97,$08,$98,$08,$99
                    db $08,$9A,$08,$9B,$08,$9C,$08,$9D
                    db $08,$9E,$08,$9F,$08,$E0,$08,$E1
                    db $08,$E2,$08,$E3,$08,$E4,$08,$E5
                    db $08,$4A,$09,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$FF

DATA_20D7C1:        db $01,$60,$00,$3F
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $43,$09,$A0,$08,$A1,$08,$A2,$08
                    db $A3,$08,$A4,$08,$A5,$08,$A6,$08
                    db $A7,$08,$A8,$08,$A9,$08,$AA,$08
                    db $AB,$08,$AC,$08,$AD,$08,$AE,$08
                    db $AF,$08,$F0,$08,$F1,$08,$F2,$08
                    db $F3,$08,$F4,$08,$F5,$08,$4B,$09
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $FF

DATA_20D806:        db $01,$80,$00,$3F,$5B,$1C,$6B
                    db $1C,$5C,$00,$5C,$00,$44,$09,$B0
                    db $08,$B1,$08,$B2,$08,$B3,$08,$B4
                    db $08,$B5,$08,$B6,$08,$B7,$08,$B8
                    db $08,$B9,$08,$BA,$08,$BB,$08,$BC
                    db $08,$BD,$08,$BE,$08,$BF,$08,$C6
                    db $08,$C7,$08,$C8,$08,$D6,$08,$D7
                    db $08,$D8,$08,$E8,$08,$04,$1C,$05
                    db $1C,$06,$1C,$07,$1C,$FF

DATA_20D84B:        db $01,$A0
                    db $40,$1A,$5C,$00,$01,$AE,$00,$23
                    db $C9,$04,$CA,$04,$CB,$04,$CC,$04
                    db $CD,$04,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$14,$1C,$3B,$1D
                    db $3C,$1D,$17,$1C,$FF

DATA_20D87A:        db $01,$C0,$40
                    db $1A,$5C,$00,$01,$CE,$00,$23,$D9
                    db $04,$DA,$04,$DB,$04,$DC,$04,$DD
                    db $04,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$3F,$1D,$21,$1C,$3D
                    db $1D,$12,$1C,$FF

DATA_20D8A9:        db $01,$E0,$40,$1A
                    db $5C,$00,$01,$EE,$00,$23,$E9,$04
                    db $EA,$04,$EB,$04,$EC,$04,$ED,$04
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$3F,$1D,$21,$1C,$3D,$1D
                    db $12,$1C,$FF

DATA_20D8D8:        db $02,$00,$00,$3F,$04
                    db $1C,$05,$1C,$06,$1C,$07,$1C,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$F9,$04,$FA,$04,$FB
                    db $04,$FF,$04,$FD,$04,$FE,$04,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$04,$1C,$05,$1C,$02
                    db $1C,$03,$1C,$3D,$1D,$12,$1C,$FF

DATA_20D91D:        db $02,$20,$00,$3F,$14,$1C,$3B,$1D
                    db $3C,$1D,$17,$1C,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $6C,$04,$6D,$04,$6E,$04,$6F,$04
                    db $DE,$04,$DF,$04,$5C,$00,$5C,$00
                    db $5C,$00,$5C,$00,$5C,$00,$5C,$00
                    db $14,$1C,$3B,$1D,$3C,$1D,$13,$1C
                    db $3D,$1D,$12,$1C,$FF

DATA_20D962:        db $02,$40,$00
                    db $3F,$3F,$1D,$21,$1C,$3D,$1D,$12
                    db $1C,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$EE,$04,$EF,$04,$5C,$00,$5C
                    db $00,$5C,$00,$5C,$00,$5C,$00,$5C
                    db $00,$5C,$00,$5C,$00,$3F,$1D,$21
                    db $1C,$3D,$1D,$23,$1C,$3D,$1D,$12
                    db $1C,$FF

DATA_20D9A7:        db $02,$60,$00,$0B,$3F,$1D
                    db $21,$1C,$3D,$1D,$12,$1C,$5C,$00
                    db $5C,$00,$02,$66,$40,$26,$5C,$00
                    db $02,$7A,$00,$0B,$3F,$1D,$21,$1C
                    db $3D,$1D,$23,$1C,$3D,$1D,$12,$1C
                    db $FF

DATA_20D9CE:        db $02,$80,$00,$0B,$3F,$1D,$21
                    db $1C,$00,$1C,$01,$1C,$06,$1C,$07
                    db $1C,$02,$86,$40,$26,$5C,$00,$02
                    db $9A,$00,$0B,$3F,$1D,$21,$1C,$3D
                    db $1D,$23,$1C,$3D,$1D,$12,$1C,$FF

DATA_20D9F5:        db $02,$A0,$00,$0F,$3F,$1D,$21,$1C
                    db $10,$1C,$3B,$1D,$3C,$1D,$17,$1C
                    db $5C,$00,$5C,$00,$02,$A8,$40,$22
                    db $5C,$00,$02,$BA,$00,$0B,$3F,$1D
                    db $21,$1C,$3D,$1D,$23,$1C,$3D,$1D
                    db $12,$1C,$FF

DATA_20DA20:        db $02,$C0,$00,$0F,$3F
                    db $1D,$21,$1C,$20,$1C,$21,$1C,$3D
                    db $1D,$12,$1C,$5C,$00,$5C,$00,$02
                    db $C8,$40,$22,$5C,$00,$02,$D8,$00
                    db $0F,$04,$1C,$05,$1C,$02,$1C,$03
                    db $1C,$3D,$1D,$23,$1C,$3D,$1D,$12
                    db $1C,$FF

DATA_20DA4F:        db $02,$E0,$00,$0F,$3F,$1D
                    db $21,$1C,$20,$1C,$21,$1C,$3D,$1D
                    db $12,$1C,$5C,$00,$5C,$00,$02,$E8
                    db $40,$22,$5C,$00,$02,$F8,$00,$0F
                    db $14,$1C,$3B,$1D,$3C,$1D,$13,$1C
                    db $3D,$1D,$23,$1C,$3D,$1D,$12,$1C
                    db $FF

DATA_20DA7E:        db $FF

DATA_20DA7F:        db $12,$08,$00,$01,$53,$11
                    db $12,$27,$00,$05,$4C,$11,$55,$11
                    db $56,$11,$12,$37,$00,$01,$53,$11
                    db $12,$46,$00,$09,$4D,$11,$4E,$11
                    db $58,$11,$57,$11,$56,$11,$12,$51
                    db $00,$01,$53,$11,$12,$56,$00,$05
                    db $4C,$11,$55,$11,$56,$11,$12,$65
                    db $00,$0D,$54,$11,$4F,$11,$58,$11
                    db $58,$11,$58,$11,$57,$11,$56,$11
                    db $12,$70,$00,$05,$4C,$11,$55,$11
                    db $56,$11,$12,$75,$00,$09,$4D,$11
                    db $4E,$11,$58,$11,$57,$11,$56,$11
                    db $12,$84,$00,$11,$54,$11,$50,$11
                    db $51,$11,$58,$11,$58,$11,$58,$11
                    db $58,$11,$57,$11,$56,$11,$12,$8F
                    db $00,$17,$4D,$11,$4E,$11,$58,$11
                    db $57,$11,$56,$11,$54,$11,$4F,$11
                    db $58,$11,$58,$11,$58,$11,$57,$11
                    db $56,$11,$12,$A5,$00,$2B,$52,$11
                    db $5C,$11,$5B,$11,$5C,$11,$5B,$11
                    db $58,$11,$58,$11,$57,$11,$56,$11
                    db $54,$11,$4F,$11,$58,$11,$58,$11
                    db $58,$11,$57,$11,$59,$11,$5A,$11
                    db $58,$11,$58,$11,$5B,$11,$5C,$11
                    db $57,$11,$12,$C5,$00,$2B,$51,$11
                    db $5E,$11,$5F,$11,$5E,$11,$5F,$11
                    db $5C,$11,$5B,$11,$5C,$11,$57,$11
                    db $59,$11,$5A,$11,$58,$11,$5B,$11
                    db $58,$11,$58,$11,$5B,$11,$58,$11
                    db $5B,$11,$5C,$11,$5E,$11,$5F,$11
                    db $58,$11,$12,$E5,$00,$2B,$58,$11
                    db $60,$11,$61,$11,$60,$11,$61,$11
                    db $5D,$11,$5E,$11,$5F,$11,$5C,$11
                    db $5B,$11,$5C,$11,$5C,$11,$5D,$11
                    db $5B,$11,$5C,$11,$5D,$11,$5C,$11
                    db $5E,$11,$5F,$11,$60,$11,$61,$11
                    db $58,$11,$FF

DATA_20DBA0:        db $02,$4A,$00,$19,$0E
                    db $1C,$5C,$00,$0A,$1C,$0B,$1C,$0C
                    db $1C,$1A,$1C,$1B,$1C,$0D,$1C,$5C
                    db $00,$1C,$1C,$0C,$1C,$1D,$1C,$1B
                    db $1C

DATA_20DBBE:        db $02,$8A,$00,$19,$1E,$1C,$5C
                    db $00,$0A,$1C,$0B,$1C,$0C,$1C,$1A
                    db $1C,$1B,$1C,$0D,$1C,$5C,$00,$1C
                    db $1C,$0C,$1C,$1D,$1C,$1B,$1C,$02
                    db $CA,$00,$15,$08,$1C,$0C,$1C,$19
                    db $1C,$19,$1C,$0B,$1C,$1B,$1C,$5C
                    db $00,$1C,$1C,$0C,$1C,$1D,$1C,$1B
                    db $1C,$FF

DATA_20DBF7:        db $02,$CA,$00,$15,$08,$1C
                    db $0C,$1C,$19,$1C,$19,$1C,$0B,$1C
                    db $1B,$1C,$5C,$00,$1C,$1C,$0C,$1C
                    db $1D,$1C,$1B,$1C,$02,$4A,$00,$19
                    db $0E,$1C,$5C,$00,$0A,$1C,$0B,$1C
                    db $0C,$1C,$1A,$1C,$1B,$1C,$0D,$1C
                    db $5C,$00,$1C,$1C,$0C,$1C,$1D,$1C
                    db $1B,$1C,$FF

DATA_20DC30:        db $03,$00,$00,$3F,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$F8
                    db $01,$F9,$01,$F9,$41,$F8,$41,$FF

DATA_20DC75:        db $0B,$00,$01,$3F,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$95,$22,$95,$22
                    db $96,$22,$96,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F6,$22,$F6,$22
                    db $F7,$22,$F7,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$F8,$22,$F8,$22
                    db $F9,$22,$F9,$22,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FD,$20,$FD,$20
                    db $FC,$20,$FC,$20,$FF

DATA_20DDBA:        db $00,$00,$00
                    db $00,$FF,$7F,$1F,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00

DATA_20DDFA:        db $00,$00,$00
                    db $00,$FF,$7F,$1F,$00,$00,$00,$00
                    db $00,$00,$00,$4A,$29,$00,$00,$00
                    db $00,$4A,$29,$00,$00,$00,$00,$00
                    db $00,$4A,$29,$4A,$29,$00,$00,$00
                    db $00,$00,$00,$4A,$29,$00,$00,$4A
                    db $29,$00,$00,$00,$00,$00,$00,$4A
                    db $29,$00,$00,$00,$00,$00,$00,$4A
                    db $29,$00,$00,$00,$00

DATA_20DE3A:        db $00,$00,$00
                    db $00,$FF,$7F,$1F,$00,$00,$00,$00
                    db $00,$4A,$29,$B5,$56,$00,$00,$4A
                    db $29,$B5,$56,$4A,$29,$00,$00,$4A
                    db $29,$B5,$56,$B5,$56,$00,$00,$4A
                    db $29,$4A,$29,$B5,$56,$00,$00,$B5
                    db $56,$4A,$29,$4A,$29,$00,$00,$B5
                    db $56,$4A,$29,$4A,$29,$00,$00,$B5
                    db $56,$4A,$29,$4A,$29

DATA_20DE7A:        db $00,$00,$00
                    db $00,$FF,$7F,$1F,$00,$00,$00,$4A
                    db $29,$B5,$56,$FF,$7F,$00,$00,$B5
                    db $56,$FF,$7F,$B5,$56,$00,$00,$B5
                    db $56,$FF,$7F,$FF,$7F,$00,$00,$B5
                    db $56,$B5,$56,$FF,$7F,$00,$00,$FF
                    db $7F,$B5,$56,$B5,$56,$00,$00,$FF
                    db $7F,$B5,$56,$B5,$56,$00,$00,$FF
                    db $7F,$B5,$56,$B5,$56

DATA_20DEBA:        db $00,$00,$00
                    db $00,$FF,$7F,$1F,$00,$00,$00,$FF
                    db $02,$34,$23,$DF,$3A,$00,$00,$F6
                    db $6B,$FF,$7F,$FF,$03,$00,$00,$F1
                    db $76,$34,$23,$DF,$3A,$00,$00,$B5
                    db $56,$DF,$3A,$00,$00,$00,$00,$5F
                    db $62,$DF,$3A,$00,$00,$00,$00,$10
                    db $03,$DF,$3A,$00,$00,$00,$00,$10
                    db $03,$DF,$3A,$00,$00

DATA_20DEFA:        db $FF

DATA_20DEFB:        db $FF

DATA_20DEFC:        db $FF

DATA_20DEFD:        db $0A,$C0,$00,$FF,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$63,$14,$63,$14
                    db $62,$14,$62,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$71,$14,$71,$14
                    db $70,$14,$70,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$73,$14,$73,$14
                    db $72,$14,$72,$14,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FC,$10,$FC,$10
                    db $FD,$10,$FD,$10,$FF

DATA_20E002:        db $00,$00,$00
                    db $00,$FF,$7F,$F6,$6B,$00,$00,$40
                    db $30,$8B,$62,$96,$7F,$00,$00,$FF
                    db $02,$FF,$7F,$7A,$11,$00,$00,$B6
                    db $5D,$F7,$7F,$F1,$76,$00,$00,$1F
                    db $00,$DF,$3A,$00,$00,$00,$00,$DF
                    db $3A,$5F,$62,$B0,$14,$00,$00,$34
                    db $23,$DF,$3A,$00,$00,$00,$00,$FF
                    db $7F,$FF,$7F,$FF,$7F

DATA_20E042:        db $FF

DATA_20E043:        db $00,$00
                    db $F1,$76,$FF,$7F,$00,$00,$00,$00
                    db $31,$72,$B5,$56,$00,$00,$00,$00
                    db $B6,$5D,$4A,$29,$00,$00,$00,$00
                    db $40,$30,$00,$00,$00,$00

DATA_20E063:        db $FF

DATA_20E064:        db $E0,$80,$80,$C8,$A0,$A4

DATA_20E06A:        db $E0,$C0,$C0
                    db $C8,$A0,$A4

DATA_20E070:        db $3E,$3F,$3E,$3E,$3F
                    db $3F

DATA_20E076:        db $2E,$3F,$3E,$2E,$3F,$3F

CODE_20E07C:        LDA.w $0726                 
                    BEQ   CODE_20E0A2           
                    LDX.b $8D                   
                    LDA   DATA_20BB05,x             
                    LDX.b $8F                   
                    CMP.b #$F0                  
                    BCC   CODE_20E093           
                    SEC                         
                    SBC.b #$F0                  
                    TAX                         
                    LDA.b #$00                  
CODE_20E093:        CLC                         
                    ADC   DATA_20E06A,x             
                    STA.b $01                   
                    STZ.b $00                   
                    LDA   DATA_20E076,x             
                    BRA   CODE_20E0C1           

CODE_20E0A2:        LDX.b $8D                   
                    LDA   DATA_20BB05,x             
                    LDX.b $8F                   
                    CMP.b #$F0                  
                    BCC   CODE_20E0B4           
                    SEC                         
                    SBC.b #$F0                  
                    TAX                         
                    LDA.b #$00                  
CODE_20E0B4:        CLC                         
                    ADC   DATA_20E064,x             
                    STA.b $01                   
                    STZ.b $00                   
                    LDA   DATA_20E070,x             
CODE_20E0C1:        STA.w $0238                 
                    LDA.b #$20                  
                    STA.b $06                   
                    REP   #$30                  
                    LDA.w #$BA5D                
                    STA.b $04                   
                    LDA.b $8D                   
                    AND.w #$00FF                
                    TAX                         
                    LDA   DATA_20BA41,x             
                    AND.w #$00FF                
                    TAY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0220                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0222                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0224                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0226                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0228                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $022A                 
                    SEP   #$30                  
                    LDX.b $8E                   
                    LDA   DATA_20BB05,x             
                    LDX.b $90                   
                    CMP.b #$F0                  
                    BCC   CODE_20E150           
                    SEC                         
                    SBC.b #$F0                  
                    TAX                         
                    LDA.b #$00                  
CODE_20E150:        CLC                         
                    ADC   DATA_20E06A,x             
                    STA.b $01                   
                    STZ.b $00                   
                    LDA   DATA_20E076,x             
                    STA.w $0239                 
                    REP   #$30                  
                    LDA.b $8E                   
                    AND.w #$00FF                
                    TAX                         
                    LDA   DATA_20BA41,x             
                    AND.w #$00FF                
                    TAY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $022C                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $022E                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0230                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0232                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0234                 
                    INY                         
                    LDA.b [$04],y               
                    AND.w #$00FF                
                    TAX                         
                    LDA.w $89E7,x               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0236                 
                    SEP   #$30                  
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
                    db $FF,$FF,$FF,$FF,$FF,$FF

DATA_20E230:        db $D0,$D2,$D2,$D4,$D6,$D6,$D2

CODE_20E237:        PHX
                    JSL.l CODE_22E000           
                    PLX                         
                    LDX.b $BC                   
                    LDA.b $5E                   
                    STA.b $00                   
                    LDA.b $43                   
                    STA.b $01                   
                    REP   #$20                  
                    LDA.b $00                   
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DA                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DC                   
                    SEP   #$20                  
                    LDA.b $D8                   
                    STA.b $79                   
                    LDA.w $0425                 
                    BEQ   CODE_20E26E           
                    STZ.b $D9                   
                    STZ.b $DB                   
                    STZ.b $DD                   
CODE_20E26E:        LDA.b $70                   
                    SEC                         
                    SBC.w $0543                 
                    STA.b $82                   
                    LDA.b $55                   
                    SBC.w $0542                 
                    STA.w $0544                 
                    LDA.w $0552                 
                    BEQ   CODE_20E28D           
                    DEC.w $0552                 
                    AND.b #$02                  
                    BEQ   CODE_20E28D           
                    JMP.w CODE_20E5EA           
CODE_20E28D:        LDA.w $0555                 
                    BNE   CODE_20E2A0           
                    LDA.w $0553                 
                    BEQ   CODE_20E2C1           
                    LDA.b $15                   
                    AND.b #$01                  
                    BEQ   CODE_20E2A0           
                    DEC.w $0553                 
CODE_20E2A0:        LDA.b $15                   
                    AND.b #$0F                  
                    LDY.w $0555                 
                    BNE   CODE_20E2BD           
                    LDY.w $0553                 
                    CPY.b #$20                  
                    BNE   CODE_20E2BB           
                    LDY.w $0567                 
                    BNE   CODE_20E2BB           
                    LDY.w $1062                 
                    STY.w $1202                 
CODE_20E2BB:        BCS   $02                   
CODE_20E2BD:        LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
CODE_20E2C1:        ASL   A                     
                    ORA.b #$20                  
                    CMP.b #$20                  
                    BNE   CODE_20E2CA           
                    ORA.b #$0E                  
CODE_20E2CA:        STA.b $00                   
                    LDA.w $0553                 
                    BEQ   CODE_20E2DD           
                    JSL.l CODE_29CD83           
                    LDA.b $00                   
                    AND.b #$F1                  
                    ORA.b #$0E                  
                    STA.b $00                   
CODE_20E2DD:        LDA.w $0588                 
                    ORA.w $058A                 
                    BEQ   CODE_20E2ED           
                    LDA.b $00                   
                    AND.b #$CF                  
                    ORA.b #$10                  
                    STA.b $00                   
CODE_20E2ED:        REP   #$10                  
                    LDX.b $C4                   
                    LDA.b #$00                  
                    STA.w $081A,x               
                    INC   A                     
                    STA.w $081E,x               
                    INC   A                     
                    STA.w $0822,x               
                    INC   A                     
                    STA.w $0826,x               
                    INC   A                     
                    STA.w $082A,x               
                    INC   A                     
                    STA.w $082E,x               
                    INC   A                     
                    STA.w $0802,x               
                    INC   A                     
                    STA.w $0806,x               
                    INC   A                     
                    STA.w $080A,x               
                    INC   A                     
                    STA.w $080E,x               
                    INC   A                     
                    STA.w $0812,x               
                    INC   A                     
                    STA.w $0816,x               
                    LDA.b $BD                   
                    AND.b #$C0                  
                    ORA.b $00                   
                    STA.w $0803,x               
                    STA.w $0807,x               
                    STA.w $080B,x               
                    STA.w $080F,x               
                    STA.w $0813,x               
                    STA.w $0817,x               
                    STA.w $081B,x               
                    STA.w $081F,x               
                    STA.w $0823,x               
                    STA.w $0827,x               
                    STA.w $082B,x               
                    STA.w $082F,x               
                    REP   #$20                  
                    LDA.w $0226                 
                    CMP.w $0228                 
                    BNE   CODE_20E377           
                    SEP   #$20                  
                    LDA.w $081B,x               
                    AND.b #$BF                  
                    STA.w $081B,x               
                    STA.w $081F,x               
                    STA.w $0803,x               
                    STA.w $0807,x               
                    ORA.b #$40                  
                    STA.w $080B,x               
                    STA.w $080F,x               
                    STA.w $0823,x               
                    STA.w $0827,x               
CODE_20E377:        SEP   #$20                  
                    LDA.b $82                   
                    STA.w $0819,x               
                    STA.w $0821,x               
                    STA.w $0829,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,x               
                    STA.w $0825,x               
                    STA.w $082D,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0801,x               
                    STA.w $0809,x               
                    STA.w $0811,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,x               
                    STA.w $080D,x               
                    STA.w $0815,x               
                    LDA.b $79                   
                    STA.w $0800,x               
                    STA.w $0804,x               
                    STA.w $0818,x               
                    STA.w $081C,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,x               
                    STA.w $080C,x               
                    STA.w $0820,x               
                    STA.w $0824,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0810,x               
                    STA.w $0814,x               
                    STA.w $0828,x               
                    STA.w $082C,x               
                    PHX                         
                    REP   #$20                  
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    AND.b #$01                  
                    STA.w $0A20,x               
                    STA.w $0A21,x               
                    STA.w $0A26,x               
                    STA.w $0A27,x               
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A22,x               
                    STA.w $0A23,x               
                    STA.w $0A28,x               
                    STA.w $0A29,x               
                    LDA.b $DD                   
                    AND.b #$01                  
                    STA.w $0A24,x               
                    STA.w $0A25,x               
                    STA.w $0A2A,x               
                    STA.w $0A2B,x               
                    PLX                         
                    LDA.b $BD                   
                    AND.b #$40                  
                    BNE   CODE_20E417           
                    BRL   CODE_20E4C3           

CODE_20E417:        LDA.w $0802,x               
                    PHA                         
                    LDA.w $080A,x               
                    STA.w $0802,x               
                    PLA                         
                    STA.w $080A,x               
                    LDA.w $0806,x               
                    PHA                         
                    LDA.w $080E,x               
                    STA.w $0806,x               
                    PLA                         
                    STA.w $080E,x               
                    LDA.w $0810,x               
                    CLC                         
                    ADC.b #$E8                  
                    STA.w $0810,x               
                    STA.w $0814,x               
                    STA.w $0828,x               
                    STA.w $082C,x               
                    LDA.w $0425                 
                    BNE   CODE_20E46C           
                    PHX                         
                    REP   #$20                  
                    LDA.b $DC                   
                    SEC                         
                    SBC.w #$0018                
                    STA.b $DC                   
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.b $DD                   
                    AND.b #$01                  
                    STA.w $0A24,x               
                    STA.w $0A25,x               
                    STA.w $0A2A,x               
                    STA.w $0A2B,x               
                    PLX                         
CODE_20E46C:        LDA.w $081A,x               
                    PHA                         
                    LDA.w $0822,x               
                    STA.w $081A,x               
                    PLA                         
                    STA.w $0822,x               
                    LDA.w $081E,x               
                    PHA                         
                    LDA.w $0826,x               
                    STA.w $081E,x               
                    PLA                         
                    STA.w $0826,x               
                    LDA.w $054F                 
                    BEQ   CODE_20E4C3           
                    LDA.w $0800,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0800,x               
                    STA.w $0804,x               
                    STA.w $0818,x               
                    STA.w $081C,x               
                    LDA.w $0808,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,x               
                    STA.w $080C,x               
                    STA.w $0820,x               
                    STA.w $0824,x               
                    LDA.w $0810,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0810,x               
                    STA.w $0814,x               
                    STA.w $0828,x               
                    STA.w $082C,x               
CODE_20E4C3:        LDA.w $0577                 
                    BNE   CODE_20E4CB           
                    BRL   CODE_20E559           

CODE_20E4CB:        LDY.w #$0000                
                    LDA.b $BB                   
                    BNE   CODE_20E4D5           
                    LDY.w #$0006                
CODE_20E4D5:        STY.b $00                   
                    LDA.b $A6                   
                    BEQ   CODE_20E4EE           
                    LDA.b $9D                   
                    BPL   CODE_20E4E1           
                    EOR.b #$FF                  
CODE_20E4E1:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    SEC                         
                    SBC.b #$03                  
                    EOR.b #$FF                  
                    BPL   CODE_20E4EE           
                    LDA.b #$00                  
CODE_20E4EE:        CLC                         
                    ADC.b $00                   
                    CLC                         
                    ADC.b $82                   
                    STA.w $0819,x               
                    STA.w $0821,x               
                    STA.w $0829,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,x               
                    STA.w $0825,x               
                    STA.w $082D,x               
                    LDA.b #$28                  
                    STA.w $0802,x               
                    LDA.b #$29                  
                    STA.w $0806,x               
                    LDY.w #$002A                
                    LDA.b $15                   
                    AND.b #$08                  
                    BEQ   CODE_20E51E           
                    INY                         
                    INY                         
CODE_20E51E:        TYA                         
                    STA.w $080A,x               
                    INC   A                     
                    STA.w $080E,x               
                    LDA.w $0803,x               
                    AND.b #$F0                  
                    ORA.b #$05                  
                    STA.w $0803,x               
                    STA.w $0807,x               
                    STA.w $080B,x               
                    STA.w $080F,x               
                    AND.b #$40                  
                    BEQ   CODE_20E559           
                    LDA.w $080A,x               
                    PHA                         
                    LDA.w $0802,x               
                    STA.w $080A,x               
                    PLA                         
                    STA.w $0802,x               
                    LDA.w $080E,x               
                    PHA                         
                    LDA.w $0806,x               
                    STA.w $080E,x               
                    PLA                         
                    STA.w $0806,x               
CODE_20E559:        LDA.b $BC                   
                    CMP.b #$5A                  
                    BNE   CODE_20E5B4           
                    LDA.w $054F                 
                    BNE   CODE_20E5B4           
                    LDA.w $0801,x               
                    STA.w $0829,x               
                    LDA.w $0805,x               
                    STA.w $082D,x               
                    REP   #$20                  
                    LDA.b $BD                   
                    AND.w #$00FF                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$F8                  
                    CPY.w #$0000                
                    BEQ   CODE_20E583           
                    LDA.b #$10                  
CODE_20E583:        CLC                         
                    ADC.w $0818,x               
                    STA.w $0828,x               
                    STA.w $082C,x               
                    PHX                         
                    REP   #$20                  
                    LDA.b $BB                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA   DATA_20E230,x             
                    PLX                         
                    STA.w $082A,x               
                    INC   A                     
                    STA.w $082E,x               
                    LDA.w $081B,x               
                    ORA.b #$01                  
                    STA.w $082B,x               
                    LDA.w $081F,x               
                    ORA.b #$01                  
                    STA.w $082F,x               
CODE_20E5B4:        LDA.b $BD                   
                    AND.b #$80                  
                    BEQ   CODE_20E5EA           
                    LDA.w $0801,x               
                    STA.w $081D,x               
                    STA.w $0825,x               
                    STA.w $082D,x               
                    CLC                         
                    ADC.b #$F8                  
                    STA.w $0801,x               
                    STA.w $0809,x               
                    STA.w $0811,x               
                    LDA.w $0805,x               
                    STA.w $0819,x               
                    STA.w $0821,x               
                    STA.w $0829,x               
                    CLC                         
                    ADC.b #$E8                  
                    STA.w $0805,x               
                    STA.w $080D,x               
                    STA.w $0815,x               
CODE_20E5EA:        REP   #$10                  
                    STZ.w $0583                 
                    LDY.w #$00F0                
                    LDA.w $0544                 
                    BPL   CODE_20E63A           
                    LDA.b $82                   
                    CLC                         
                    ADC.b #$10                  
                    LDA.b #$00                  
                    ADC.w $0544                 
                    BEQ   CODE_20E638           
                    INC.w $0583                 
                    TYA                         
                    STA.w $0819,x               
                    STA.w $0821,x               
                    STA.w $0829,x               
                    STA.w $081D,x               
                    STA.w $0825,x               
                    STA.w $082D,x               
                    LDA.b $82                   
                    CLC                         
                    ADC.b #$20                  
                    LDA.b #$00                  
                    ADC.w $0544                 
                    BEQ   CODE_20E638           
                    TYA                         
                    STA.w $0801,x               
                    STA.w $0809,x               
                    STA.w $0811,x               
                    STA.w $0805,x               
                    STA.w $080D,x               
                    STA.w $0815,x               
CODE_20E638:        BRA   CODE_20E671           

CODE_20E63A:        BNE   CODE_20E648           
                    LDA.b $82                   
                    CMP.b #$C0                  
                    BCS   $06                   
                    CMP.b #$B0                  
                    BCS   $18                   
                    BCC   CODE_20E671           
CODE_20E648:        INC.w $0583                 
                    TYA                         
                    STA.w $0819,x               
                    STA.w $0821,x               
                    STA.w $0829,x               
                    STA.w $081D,x               
                    STA.w $0825,x               
                    STA.w $082D,x               
                    TYA                         
                    STA.w $0801,x               
                    STA.w $0809,x               
                    STA.w $0811,x               
                    STA.w $0805,x               
                    STA.w $080D,x               
                    STA.w $0815,x               
CODE_20E671:        SEP   #$10                  
                    LDA.b $52                   
                    CMP.b $53                   
                    BNE   CODE_20E67C           
                    INC   A                     
                    BEQ   CODE_20E681           
CODE_20E67C:        LDA.w $0571                 
                    BNE   CODE_20E684           
CODE_20E681:        BRL   CODE_20E761           

CODE_20E684:        LDA.w $0350                 
                    CMP.b #$03                  
                    BEQ   CODE_20E681           
                    LDA.b #$00                  
                    STA.l $7FC522               
                    STA.l $7FC523               
                    LDA.b $52                   
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0800                 
                    STA.w $0804                 
                    STA.w $0808                 
                    STA.w $080C                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0810                 
                    STA.w $0814                 
                    STA.w $0818                 
                    STA.w $081C                 
                    LDA.b $53                   
                    SEC                         
                    SBC.w $0543                 
                    PHA                         
                    CMP.b #$F0                  
                    BCC   CODE_20E6C3           
                    LDA.b #$00                  
CODE_20E6C3:        STA.w $0801                 
                    STA.w $0811                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805                 
                    STA.w $0815                 
                    PLA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0809                 
                    STA.w $0819                 
                    CLC                         
                    ADC.b #$07                  
                    STA.w $080D                 
                    STA.w $081D                 
                    LDA.b #$FE                  
                    STA.w $0802                 
                    STA.w $0806                 
                    STA.w $080A                 
                    STA.w $080E                 
                    STA.w $0812                 
                    STA.w $0816                 
                    STA.w $081A                 
                    STA.w $081E                 
                    LDA.b #$11                  
                    STA.w $0803                 
                    STA.w $0807                 
                    STA.w $080B                 
                    STA.w $080F                 
                    STA.w $0813                 
                    STA.w $0817                 
                    STA.w $081B                 
                    STA.w $081F                 
                    LDA.b #$00                  
                    STA.w $0A20                 
                    STA.w $0A21                 
                    STA.w $0A22                 
                    STA.w $0A23                 
                    LDA.w $0571                 
                    CMP.b #$10                  
                    BNE   CODE_20E742           
CODE_20E72E:        LDA.w $0819                 
                    DEC   A                     
                    DEC   A                     
                    STA.w $0819                 
                    STA.w $081D                 
                    LDA.b #$EE                  
                    STA.w $081E                 
                    LDA.b #$02                  
                    BRA   CODE_20E752           

CODE_20E742:        LDA.w $1EBB                 
                    CMP.b #$A4                  
                    BNE   CODE_20E750           
                    LDA.w $1EBC                 
                    CMP.b #$B7                  
                    BEQ   CODE_20E72E           
CODE_20E750:        LDA.b #$00                  
CODE_20E752:        STA.w $0A24                 
                    STA.w $0A25                 
                    STA.w $0A26                 
                    STA.w $0A27                 
                    BRL   CODE_20E802           

CODE_20E761:        LDX.b $C4                   
                    LDA.w $0425                 
                    BEQ   CODE_20E783           
                    LDY.b #$00                  
                    LDA.w $0800,x               
                    CMP.b #$F8                  
                    BCS   $14                   
                    LDY.b #$08                  
                    LDA.w $0808,x               
                    CMP.b #$F8                  
                    BCS   $0B                   
                    LDY.b #$10                  
                    LDA.w $0810,x               
                    CMP.b #$F8                  
                    BCS   $02                   
CODE_20E783:        BRA   CODE_20E802           
                    STY.b $D8                   
                    TXA                         
                    CLC                         
                    ADC.b $D8                   
                    TAY                         
                    LDA.w $0800,y               
                    STA.w $0800                 
                    STA.w $0804                 
                    STA.w $0808                 
                    STA.w $080C                 
                    LDA.w $0801,y               
                    STA.w $0801                 
                    LDA.w $0805,y               
                    STA.w $0805                 
                    LDA.w $0819,y               
                    STA.w $0809                 
                    LDA.w $081D,y               
                    STA.w $080D                 
                    LDA.w $0802,y               
                    STA.w $0802                 
                    LDA.w $0806,y               
                    STA.w $0806                 
                    LDA.w $081A,y               
                    STA.w $080A                 
                    LDA.w $081E,y               
                    STA.w $080E                 
                    LDA.w $0803,y               
                    STA.w $0803                 
                    LDA.w $0807,y               
                    STA.w $0807                 
                    LDA.w $081B,y               
                    STA.w $080B                 
                    LDA.w $081F,y               
                    STA.w $080F                 
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A26,y               
                    STA.w $0A27,y               
                    DEC   A                     
                    STA.w $0A20                 
                    STA.w $0A21                 
                    STA.w $0A22                 
                    STA.w $0A23                 
CODE_20E802:        RTL                         

CODE_20E803:        LDA.b #$84                  
                    SEC                         
                    SBC.w $0602                 
                    CMP.b #$04                  
                    BCS   $46                   
                    LDY.b #$00                  
                    LDA.b $5E                   
                    CMP.b #$60                  
                    BCC   CODE_20E81B           
                    INY                         
                    CMP.b #$90                  
                    BCC   CODE_20E81B           
                    INY                         
CODE_20E81B:        LDA.b #$80                  
                    STA.w $052B                 
                    LDA.b #$01                  
                    STA.w $052A                 
                    LSR   A                     
                    STA.w $0528                 
                    LDA.w $8AA7,y               
                    STA.w $0529                 
                    LDA.b #$14                  
                    STA.w $037B                 
                    STA.w $0564                 
                    LDX.w $0421                 
                    DEX                         
                    CPX.b #$05                  
                    BMI   CODE_20E84D           
                    LDA.w $0783                 
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $8A97,y               
                    CLC                         
                    ADC.w $8A8D,x               
                    TAX                         
CODE_20E84D:        LDA.w $8A7E,x               
                    TAX                         
                    INX                         
                    RTL                         

                    LDX.b #$00                  
                    RTL                         

CODE_20E856:        LDA.w $0556                 
                    BEQ   CODE_20E86C           
                    DEC.w $0556                 
                    JSL.l CODE_20E237           
                    LDA.w $05FC                 
                    BEQ   CODE_20E86B           
                    JSL.l CODE_23D10E           
CODE_20E86B:        RTL                         

CODE_20E86C:        LDA.b $BF                   
                    BEQ   CODE_20E874           
                    JSR.w CODE_20EE03           
                    RTL                         

CODE_20E874:        LDA.w $0572                 
                    BPL   CODE_20E8A4           
                    LDA.b #$00                  
                    STA.w $06A4                 
                    STA.b $8B                   
                    INC.w $0572                 
                    LDA.w $0572                 
                    STA.b $9D                   
                    BNE   CODE_20E88D           
                    INC.w $0572                 
CODE_20E88D:        LDA.b $55                   
                    BPL   CODE_20E8A4           
                    LDA.b #$01                  
                    STA.b $55                   
                    LDA.b #$B0                  
                    STA.b $70                   
                    LDA.b #$D0                  
                    STA.w $0572                 
                    LDA.b #$03                  
                    STA.w $0414                 
                    RTL                         

CODE_20E8A4:        LDA.w $0554                 
                    BEQ   CODE_20E8AD           
                    JSR.w CODE_20EF39           
                    RTL                         

CODE_20E8AD:        LDA.w $0555                 
                    BEQ   CODE_20E8C4           
                    CMP.b #$1F                  
                    BNE   CODE_20E8BC           
                    DEC.w $0555                 
                    JMP.w CODE_20E8C4           
CODE_20E8BC:        JSL.l CODE_20E237           
                    DEC.w $0555                 
                    RTL                         

CODE_20E8C4:        LDA.w $0551                 
                    BEQ   CODE_20E8F3           
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDY.b $BB                   
                    BNE   CODE_20E8D8           
                    STX.b $00                   
                    LDA.b #$0B                  
                    SEC                         
                    SBC.b $00                   
                    TAX                         
CODE_20E8D8:        AND.b #$01                  
                    PHP                         
                    LDA.w $E974,x               
                    STA.b $BC                   
                    PLP                         
                    LDA.b $BB                   
                    PHA                         
                    LDA.b #$01                  
                    STA.b $BB                   
                    JSL.l CODE_20E237           
                    PLA                         
                    STA.b $BB                   
                    DEC.w $0551                 
                    RTL                         

CODE_20E8F3:        LDA.w $0559                 
                    BEQ   CODE_20E928           
                    LDA.w $0577                 
                    BEQ   CODE_20E905           
                    STZ.w $0577                 
                    LDA.b #$18                  
                    STA.w $0554                 
CODE_20E905:        LDA.b #$41                  
                    STA.b $BD                   
                    JSL.l CODE_20E237           
                    LDA.b $A6                   
                    BNE   CODE_20E928           
                    DEC.w $0559                 
                    LDA.b #$14                  
                    STA.b $8B                   
                    JSR.w CODE_20EB60           
                    LDA.w $057A                 
                    BEQ   CODE_20E927           
                    STZ.w $057A                 
                    JSL.l CODE_23C463           
CODE_20E927:        RTL                         

CODE_20E928:        LDA.w $055A                 
                    BNE   CODE_20E930           
                    BRL   CODE_20EA0C           
CODE_20E930:        PHA                         
                    LDA.b #$00                  
                    STA.b $25                   
                    INC.w $0210                 
                    BNE   CODE_20E93F           
                    INC.b $12                   
                    INC.w $0211                 
CODE_20E93F:        REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0212                 
                    SEP   #$20                  
                    LDA.b $12                   
                    BNE   CODE_20E956           
                    LDA.w $0210                 
                    CMP.b #$60                  
                    BCC   CODE_20E970           
CODE_20E956:        INC.w $0550                 
                    LDA.w $0550                 
                    CLC                         
                    ADC.w $055C                 
                    BCC   CODE_20E970           
                    INC.w $0216                 
                    LDA.b $75                   
                    SEC                         
                    SBC.b #$01                  
                    STA.b $75                   
                    BCS   $02                   
                    DEC.b $5A                   
CODE_20E970:        PLA                         
                    JSR.w CODE_20E975           
                    RTL                         

CODE_20E975:        JSL.l CODE_20FB1F           

                      dw CODE_20E983
               dw CODE_20E984
               dw CODE_20E9A2
               dw CODE_20E9CD
               dw CODE_20E9E8

CODE_20E983:        RTS

CODE_20E984:        LDA.b #$EF                  
                    STA.w $0543                 
                    LDA.w $0210                 
                    CMP.b #$80                  
                    BCC   CODE_20E997           
                    LDA.b #$A0                  
                    STA.b $9D                   
                    INC.w $055A                 
CODE_20E997:        LDA.b #$01                  
                    STA.b $BD                   
                    LDA.b #$20                  
                    STA.b $8B                   
                    JMP.w CODE_20EB60           

CODE_20E9A2:        LDA.b $5E                   
                    CMP.b #$36                  
                    BCC   CODE_20E9CA           
                    JSL.l CODE_23DEA3           
                    JSL.l CODE_23DE53           
                    LDA.b $9D                   
                    CLC                         
                    ADC.b #$04                  
                    STA.b $9D                   
                    CMP.b #$0F                  
                    BMI   CODE_20E9BE           
                    INC.w $055A                 
CODE_20E9BE:        LDY.b $BB                   
                    LDA.w $E9E5,y               
                    STA.b $BC                   
                    JSL.l CODE_20E237           
                    RTS                         

CODE_20E9CA:        JMP.w CODE_20EB60           

CODE_20E9CD:        LDA.b #$02                  
                    STA.b $BD                   
                    LDA.b #$EC                  
                    STA.b $9D                   
                    JSR.w CODE_20EB60           
                    LDA.w $0216                 
                    CMP.b #$70                  
                    BCC   CODE_20E9E7           
                    LDA.b #$03                  
                    STA.w $0414                 
                    INC.w $055A                 
CODE_20E9E7:        RTS                         

CODE_20E9E8:        LDA.w $05FC                 
                    BEQ   CODE_20EA0B           
                    JSL.l CODE_23DEA3           
                    LDA.b $9D                   
                    BMI   CODE_20E9FD           
                    LDA.b #$00                  
                    STA.w $055A                 
                    STA.w $05F3                 
CODE_20E9FD:        LDA.b $9D                   
                    CLC                         
                    ADC.b #$04                  
                    STA.b $9D                   
                    JSL.l CODE_23CFCA           
                    JSR.w CODE_20E9BE           
CODE_20EA0B:        RTS                         

CODE_20EA0C:        LDA.w $07BE                 
                    CMP.b #$03                  
                    BMI   CODE_20EA31           
                    CMP.b #$07                  
                    BMI   CODE_20EA22           
                    LDA.b $70                   
                    CLC                         
                    ADC.b #$02                  
                    STA.b $70                   
                    BCC   CODE_20EA22           
                    INC.b $55                   
CODE_20EA22:        LDY.b $BB                   
                    LDA.w $E9E5,y               
                    STA.b $BC                   
                    JSL.l CODE_20E237           
                    JSR.w CODE_20EADC           
                    RTL                         

CODE_20EA31:        LDA.w $0571                 
                    BPL   CODE_20EA3A           
                    JSR.w CODE_20EBBA           
                    RTL                         

CODE_20EA3A:        BNE   CODE_20EA3F           
                    JMP.w CODE_20EADB           

CODE_20EA3F:        LDA.w $0510                 
                    BNE   CODE_20EA70           
                    LDA.w $0571                 
                    AND.b #$1C                  
                    CMP.b #$14                  
                    BNE   CODE_20EA54           
                    LDA.b #$05                  
                    STA.w $0377                 
                    BRA   CODE_20EA65           

CODE_20EA54:        LSR   A                     
                    LSR   A                     
                    STA.w $0414                 
                    CMP.b #$01                  
                    BNE   CODE_20EA65           
                    INC.b $14                   
                    LDA.b #$00                  
                    STA.w $0713                 
                    RTL                         

CODE_20EA65:        LDA.w $0571                 
                    AND.b #$03                  
                    ORA.b #$80                  
                    STA.w $0571                 
                    RTL                         

CODE_20EA70:        LDA.w $0571                 
                    AND.b #$03                  
                    CMP.b #$02                  
                    BPL   CODE_20EAB2           
                    LDA.w $0510                 
                    CMP.b #$10                  
                    BMI   CODE_20EAB1           
                    PHA                         
                    JSR.w CODE_20EEF2           
                    PLA                         
                    CMP.b #$24                  
                    BPL   CODE_20EAB1           
                    LDX.b $C4                   
                    LDA.b #$F0                  
                    STA.w $0801,x               
                    STA.w $0805,x               
                    STA.w $0809,x               
                    STA.w $080D,x               
                    STA.w $0811,x               
                    STA.w $0815,x               
                    STA.w $0819,x               
                    STA.w $081D,x               
                    STA.w $0821,x               
                    STA.w $0825,x               
                    STA.w $0829,x               
                    STA.w $082D,x               
CODE_20EAB1:        RTL                         

CODE_20EAB2:        JSR.w CODE_20EF15           
                    LDA.w $0510                 
                    CMP.b #$10                  
                    BCS   CODE_20EADA                   
                    LDA.b $C4                   
                    LDX.b $9D                   
                    BPL   CODE_20EAC5           
                    CLC                         
                    ADC.b #$18                  
CODE_20EAC5:        TAX                         
                    LDA.b #$F0                  
                    STA.w $0801,x               
                    STA.w $0805,x               
                    STA.w $0809,x               
                    STA.w $080D,x               
                    STA.w $0811,x               
                    STA.w $0815,x               
CODE_20EADA:        RTL                         

CODE_20EADB:        RTL                         

CODE_20EADC:        LDY.b #$40                  
                    LDX.b $BB                   
                    LDA.b $BD                   
                    PHP                         
                    LDA.w $8AB1,x               
                    PLP                         
                    BNE   CODE_20EAEC           
                    LDA.w $8AAA,x               
CODE_20EAEC:        CLC                         
                    ADC.b $79                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,y               
                    STA.w $080C,y               
                    LDA.b $55                   
                    STA.b $00                   
                    LDA.w $8AB8,x               
                    BPL   CODE_20EB09           
                    DEC.b $00                   
CODE_20EB09:        CLC                         
                    ADC.b $82                   
                    BCC   CODE_20EB10           
                    INC.b $00                   
CODE_20EB10:        LDX.b $00                   
                    CPX.b #$01                  
                    BPL   CODE_20EB5F           
                    CMP.b #$F0                  
                    BCS   $45                   
                    STA.w $0801,y               
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    STA.w $080D,y               
                    LDA.b #$B0                  
                    STA.w $0802,y               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0806,y               
                    STA.w $080E,y               
                    JSL.l CODE_27AA8D           
                    ASL   A                     
                    ORA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    ORA.b #$40                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
CODE_20EB5F:        RTS                         

CODE_20EB60:        LDA.b $BD                   
                    AND.b #$02                  
                    BEQ   CODE_20EB72           
                    JSL.l CODE_23DEA3           
                    LDY.b $BB                   
                    LDA.w $99C7,y               
                    JMP.w CODE_20EBA7           
CODE_20EB72:        LDA.b $BD                   
                    AND.b #$01                  
                    TAY                         
                    LDA.w $8ABF,y               
                    ORA.b $BD                   
                    STA.b $BD                   
                    JSL.l CODE_23DE53           
                    LDA.b $15                   
                    AND.b #$06                  
                    LSR   A                     
                    STA.b $00                   
CODE_20EB89:        LDY.w $0577                 
                    BEQ   CODE_20EB9D           
                    ASL   A                     
                    AND.b #$02                  
                    LDY.b $BB                   
                    BEQ   CODE_20EB97           
                    LDY.b #$01                  
CODE_20EB97:        CLC                         
                    ADC.w $E9A4,y               
                    BNE   CODE_20EBA7           
CODE_20EB9D:        LDA.b $BB                   
                    ASL   A                     
                    ASL   A                     
                    ORA.b $00                   
                    TAY                         
                    LDA.w $E958,y               
CODE_20EBA7:        STA.b $BC                   
                    JSL.l CODE_20E237           
                    RTS                         

PNTR_20EBAE:          dw CODE_20EBD5
               dw CODE_20EBD6
               dw CODE_20EBF1
               dw CODE_20EC17
               dw CODE_20EC6C
               dw CODE_20EC7A

CODE_20EBBA:        LDA.b #$08
                    STA.w $1A45                 
                    LDA.w $0377                 
                    ASL   A                     
                    TAY                         
                    PHB                         
                    PHK                         
                    PLB                         
                    LDA   PNTR_20EBAE,y               
                    STA.b $00                   
                    LDA   PNTR_20EBAE+1,y               
                    STA.b $01                   
                    PLB                         
                    JMP.w ($0000)               

CODE_20EBD5:        RTS                         

CODE_20EBD6:        LDA.b #$83                  
                    STA.w $0571                 
                    JSR.w CODE_20EF15           
                    LDA.w $0510                 
                    BNE   CODE_20EBE6           
                    JMP.w CODE_20EF2D           
CODE_20EBE6:        CMP.b #$20                  
                    LDA.b $C4                   
                    BCC   CODE_20EBF0           
                    JSL.l CODE_20EAC5           
CODE_20EBF0:        RTS                         

CODE_20EBF1:        LDA.b #$82                  
                    STA.w $0571                 
                    STA.b $A6                   
                    LDA.b #$30                  
                    STA.b $9D                   
                    JSL.l CODE_23DEA3           
                    JSR.w CODE_20EF15           
                    LDA.w $0510                 
                    BNE   CODE_20EC16           
                    LDA.b #$00                  
                    STA.w $056F                 
                    STA.w $0571                 
                    STA.b $8B                   
                    LDA.b #$38                  
                    STA.b $9D                   
CODE_20EC16:        RTS                         

CODE_20EC17:        LDA.b #$80                  
                    STA.w $0571                 
                    LDA.b #$40                  
                    STA.b $BD                   
                    LDY.b #$00                  
CODE_20EC22:        LDA.b $15                   
                    LSR   A                     
                    BCC   CODE_20EC56           
                    LDA.w $8AC5,y               
                    STA.b $25                   
                    LDA.w $0210                 
                    LDX.b $12                   
                    BNE   CODE_20EC37           
                    CMP.b #$80                  
                    BCC   CODE_20EC56           
CODE_20EC37:        CLC                         
                    ADC.w $8AC7,y               
                    STA.w $0210                 
                    STA.w $0212                 
                    LDA.w $8AC9,y               
                    ADC.b $12                   
                    STA.b $12                   
                    STA.w $0211                 
                    LSR   A                     
                    STA.w $0213                 
                    LDA.w $0212                 
                    ROR   A                     
                    STA.w $0212                 
CODE_20EC56:        JSR.w CODE_20EEF2           
                    LDX.b $C4                   
                    LDA.b #$F0                  
                    STA.w $0811,x               
                    STA.w $0815,x               
                    LDA.w $0510                 
                    BNE   CODE_20EC6B           
                    JSR.w CODE_20EF2D           
CODE_20EC6B:        RTS                         

CODE_20EC6C:        LDA.b #$81                  
                    STA.w $0571                 
                    LDA.b #$00                  
                    STA.b $BD                   
                    LDY.b #$01                  
                    JMP.w CODE_20EC22           

CODE_20EC7A:        LDA.w $0425                 
                    BEQ   CODE_20EC82           
                    JMP.w CODE_20ED06           

CODE_20EC82:        LDA.b #$FE                  
                    LDX.b #$01                  
                    LDY.b $9D                   
                    BMI   CODE_20EC8D           
                    LDA.b #$02                  
                    DEX                         
CODE_20EC8D:        STA.w $0780                 
                    CLC                         
                    ADC.w $0216                 
                    STA.w $0216                 
                    STA.w $0543                 
                    LDY.b $9D                   
                    BPL   CODE_20ECA4           
                    BCS   CODE_20ECBF                   
                    LDA.b #$00                  
                    BEQ   CODE_20ECAA           
CODE_20ECA4:        CMP.b #$EF                  
                    BCC   CODE_20ECBF           
                    LDA.b #$EF                  
CODE_20ECAA:        STA.w $0216                 
                    LDA.b #$01                  
                    STA.w $0377                 
                    LDY.b $9D                   
                    BMI   CODE_20ECB9           
                    INC.w $0377                 
CODE_20ECB9:        JSL.l CODE_23C227           
                    BRA   CODE_20ECE8           

CODE_20ECBF:        LDA.w $8ACB,x               
                    STA.b $09                   
                    LDA.b #$08                  
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    SEC                         
                    SBC.b #$B3                  
                    CMP.b #$02                  
                    BCC   CODE_20ECE8           
                    LDA.b #$10                  
                    CPX.b #$00                  
                    BEQ   CODE_20ECDD           
                    DEC.b $55                   
                    LDA.b #$F0                  
CODE_20ECDD:        CLC                         
                    ADC.b $70                   
                    AND.b #$F0                  
                    STA.b $70                   
                    BCC   CODE_20ECE8           
                    INC.b $55                   
CODE_20ECE8:        LDA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
                    LDA.w $034F                 
                    BEQ   CODE_20ED05           
                    LDA.w $0216                 
                    STA.w $0218                 
CODE_20ED05:        RTS                         

CODE_20ED06:        LDA.w $0571                 
                    AND.b #$03                  
                    PHA                         
                    TAY                         
                    LDX.b #$00                  
                    CPY.b #$02                  
                    BMI   CODE_20ED2F           
                    LDX.b #$12                  
                    LDA.w $8ADD,y               
                    BPL   CODE_20ED27           
                    LDA.b $82                   
                    CMP.b #$68                  
                    LDA.b #$00                  
                    BCC   CODE_20ED32           
                    DEC.b $43,x                 
                    JMP.w CODE_20ED2F           

CODE_20ED27:        LDA.b $82                   
                    CMP.b #$38                  
                    LDA.b #$00                  
                    BCS   $03                   
CODE_20ED2F:        LDA.w $8ADD,y               
CODE_20ED32:        CLC                         
                    ADC.b $5E,x                 
                    AND.b #$FE                  
                    STA.b $5E,x                 
                    BCC   CODE_20ED3D           
                    INC.b $43,x                 
CODE_20ED3D:        AND.b #$0F                  
                    TAX                         
                    CPY.b #$02                  
                    BMI   CODE_20ED95           
                    LDA.b $5E                   
                    AND.b #$F0                  
                    ORA.b #$08                  
                    STA.b $5E                   
                    LDA.b #$01                  
                    STA.b $25                   
                    LDA.w $8ADD,y               
                    BPL   CODE_20ED5A           
                    DEC.b $25                   
                    DEC.w $0542                 
CODE_20ED5A:        STA.w $0780                 
                    CLC                         
                    ADC.w $0543                 
                    STA.w $0543                 
                    BCC   CODE_20ED69           
                    INC.w $0542                 
CODE_20ED69:        STA.w $0216                 
                    LDY.w $0542                 
                    STY.w $0217                 
                    STY.b $13                   
                    STY.w $0219                 
                    REP   #$20                  
                    LDA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
                    SEP   #$20                  
                    LDA.b $70                   
                    SEC                         
                    SBC.w $0543                 
                    STA.b $82                   
CODE_20ED95:        PLA                         
                    CPX.b #$00                  
                    BNE   CODE_20EDE0           
                    ASL   A                     
                    ASL   A                     
                    LDX.b #$01                  
                    TAY                         
CODE_20ED9F:        LDA.w $8ACD,y               
                    STA.b $09                   
                    LDA.w $8ACE,y               
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    STA.b $00                   
                    SEC                         
                    SBC.b #$92                  
                    CMP.b #$02                  
                    BCS   $03                   
                    JMP.w CODE_20EDE1           

                    LDA.b $00                   
                    CMP.b #$9E                  
                    BNE   CODE_20EDC2           
                    JMP.w CODE_20EDE1           

CODE_20EDC2:        LDA.b $00                   
                    SEC                         
                    SBC.b #$50                  
                    CMP.b #$04                  
                    BCS   $10                   
                    STX.b $00                   
                    LDA.w $0571                 
                    AND.b #$82                  
                    EOR.b #$02                  
                    ORA.b $00                   
                    STA.w $0571                 
                    LDX.b #$00                  
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_20ED9F           
CODE_20EDE0:        RTS                         

CODE_20EDE1:        LDA.w $0571                 
                    AND.b #$03                  
                    TAY                         
                    BNE   CODE_20EDF0           
                    LDA.b $5E                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $5E                   
CODE_20EDF0:        LDA.w $8AE1,y               
                    STA.w $0377                 
                    JSL.l CODE_23C227           
                    RTS                         

PNTR_20EDFB:          dw CODE_20EBD5
               dw CODE_20EE16
               dw CODE_20EE3F
               dw CODE_20EE5A

CODE_20EE03:        LDA.b $BF                   
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_20EDFB,x             
                    STA.b $00                   
                    LDA   PNTR_20EDFB+1,x             
                    STA.b $01                   
                    JMP.w ($0000)               

CODE_20EE16:        LDA.w $0544                 
                    BNE   CODE_20EE23           
                    LDA.b $82                   
                    AND.b #$F0                  
                    CMP.b #$B0                  
                    BEQ   CODE_20EE2E           
CODE_20EE23:        LDA.w $0510                 
                    BNE   CODE_20EE2B           
                    JMP.w CODE_20EEDF           

CODE_20EE2B:        JMP.w CODE_20EEE9           

CODE_20EE2E:        LDA.w $0510                 
                    BNE   CODE_20EE38           
                    LDA.b #$40                  
                    STA.w $0510                 
CODE_20EE38:        CMP.b #$01                  
                    BNE   CODE_20EE3E           
                    BEQ   CODE_20EE44           
CODE_20EE3E:        RTS                         

CODE_20EE3F:        LDA.w $0510                 
                    BNE   CODE_20EE4B           
CODE_20EE44:        INC.b $14                   
                    LDA.b #$01                  
                    STA.w $0713                 
CODE_20EE4B:        RTS                         

DATA_20EE4C:        db $00,$02,$04,$06,$FF,$2C,$2E

DATA_20EE53:        db $60,$68,$70,$78,$80,$88,$90

CODE_20EE5A:         LDA $0544
                     BNE CODE_20EE67
                    LDA.b $82                   
                    AND.b #$F0                  
                    CMP.b #$B0                  
                    BEQ   CODE_20EE72           
CODE_20EE67:        LDA.w $0510                 
                    BNE   CODE_20EE6F           
                    JMP.w CODE_20EEDF           

CODE_20EE6F:        JMP.w CODE_20EEE9           

CODE_20EE72:        DEC.b $53                   
                    LDA.b $52                   
                    CMP.b #$60                  
                    BCC   CODE_20EE84           
                    CLC                         
                    ADC.b $53                   
                    STA.b $52                   
                    LDA.b #$70                  
                    STA.w $0510                 
CODE_20EE84:        LDA.w $0510                 
                    BEQ   CODE_20EE44           
                    LDA.b #$A2                  
                    STA.b $BC                   
                    JSL.l CODE_22E000           
                    LDX.b #$06                  
                    LDY.b $C4                   
CODE_20EE95:        LDA   DATA_20EE4C,x             
                    CMP.b #$FF                  
                    BEQ   CODE_20EEB3           
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b $52                   
                    CMP.b #$E0                  
                    BCS   $09                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
CODE_20EEB3:        LDA   DATA_20EE53,x             
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b #$32                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_20EE95           
                    RTS                         

CODE_20EEDF:        INC.b $9D                   
                    INC.b $9D                   
                    LDX.b #$00                  
                    JSL.l CODE_23DEA3           
CODE_20EEE9:        LDA.b #$96                  
                    STA.b $BC                   
                    JSL.l CODE_20E237           
                    RTS                         

CODE_20EEF2:        LDA.w $0571                 
                    AND.b #$01                  
                    TAY                         
                    LDA.w $8AC1,y               
                    STA.b $8B                   
                    JSL.l CODE_23DE53           
                    DEC.b $70                   
                    DEC.b $70                   
                    LDA.b $15                   
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    JSR.w CODE_20EB89           
                    INC.b $70                   
                    INC.b $70                   
                    RTS                         

CODE_20EF15:        LDA.w $0571                 
                    AND.b #$01                  
                    TAY                         
                    LDA.w $8AC3,y               
                    STA.b $9D                   
                    JSL.l CODE_23DEA3           
                    JSL.l CODE_23DDBB           
                    JSL.l CODE_20E237           
                    RTS                         

CODE_20EF2D:        LDA.b #$00                  
                    STA.w $0571                 
                    STA.b $8B                   
                    STA.b $9D                   
                    STA.b $A6                   
                    RTS                         

CODE_20EF39:        DEC.w $0554                 
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $8AE5,y               
                    STA.b $01                   
                    REP   #$10                  
                    LDY.b $C4                   
                    LDA.b #$C2                  
                    STA.b $00                   
CODE_20EF4E:        LDA.b $82                   
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $70                 
                    SEC                         
                    SBC.w $0216                 
                    LDA.w $55                 
                    SBC.w $0217                 
                    BPL   CODE_20EF73           
                    LDA.b #$F0                  
                    STA.w $0801,y               
                    STA.w $0805,y               
CODE_20EF73:        LDA.b $01                   
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    PHX                         
                    LDA.b #$20                  
                    LDX.w $0588                 
                    BEQ   CODE_20EF86           
                    LDA.b #$10                  
CODE_20EF86:        ORA.b $00                   
                    STA.w $0803,y               
                    STA.w $0807,y               
                    AND.b #$80                  
                    BEQ   CODE_20EFA0           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_20EFA0:        PLX                         
                    LDA.b $5E                   
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b $00                   
                    AND.b #$F0                  
                    BEQ   CODE_20EFBF           
                    LDA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0800,y               
                    STA.w $0804,y               
CODE_20EFBF:        PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.b $00                   
                    SEC                         
                    SBC.b #$C0                  
                    STA.b $00                   
                    BCC   CODE_20EFE5           
                    JMP.w CODE_20EF4E           

CODE_20EFE5:        SEP   #$10                  
                    RTS                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

CODE_20F000:        LDA.w $4210                 
                    LDA.b $02                   
                    PHA                         
                    LDA.b #$80                  
                    STA.w $2100                 
                    STZ.w $420C                 
                    LDA.w $021E                 
                    STA.w $2101                 
                    LDA.w $0427                 
                    BEQ   CODE_20F02A           
                    AND.b #$7F                  
                    TAX                         
                    LDA.l $21CEC3,x             
                    STA.w $0100                 
                    LDA.l $21CECB,x             
                    STA.w $0101                 
CODE_20F02A:        LDA.l $7E3955               
                    BEQ   CODE_20F033           
                    JMP.w CODE_20F0BA           

CODE_20F033:        LDA.w $0100                 
                    BNE   CODE_20F03B           
                    JMP.w CODE_20F11A           

CODE_20F03B:        CMP.b #$80                  
                    BNE   CODE_20F042           
                    JMP.w CODE_20F0CF           

CODE_20F042:        CMP.b #$40                  
                    BNE   CODE_20F049           
                    JMP.w CODE_20F25A           

CODE_20F049:        CMP.b #$A0                  
                    BNE   CODE_20F050           
                    JMP.w CODE_20F141           

CODE_20F050:        CMP.b #$20                  
                    BNE   CODE_20F057           
                    JMP.w CODE_20F18C           

CODE_20F057:        CMP.b #$95                  
                    BNE   CODE_20F05E           
                    JMP.w CODE_20F1C0           

CODE_20F05E:        JSR.w CODE_20F650           
                    LDA.w $0154                 
                    BNE   CODE_20F08F           
                    JSL.l CODE_29E953           
                    LDA.w $02BB                 
                    BEQ   CODE_20F074           
                    JSR.w CODE_20FF06           
                    STZ.b $28                   
CODE_20F074:        JSL.l CODE_29E8AB           
                    JSL.l CODE_29EA69           
                    LDA.b $28                   
                    BNE   CODE_20F08D           
                    STZ.w $1600                 
                    STZ.w $1601                 
                    DEC   A                     
                    STA.w $1602                 
                    STA.w $1603                 
CODE_20F08D:        STZ.b $28                   
CODE_20F08F:        JSR.w CODE_20F20B           
                    JSR.w CODE_20FCBF           
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
                    CLI                         
CODE_20F0AC:        LDA.b $1C                   
                    BEQ   CODE_20F0BA           
                    JSR.w CODE_20FB5E           
                    JSL.l CODE_22E103           
CODE_20F0B7:        DEC.w $0154                 
CODE_20F0BA:        INC.b $15                   
                    LDA.b $16                   
                    STA.w $2100                 
                    LDA.w $0293                 
                    STA.w $420C                 
CODE_20F0C7:        JSL.l CODE_22E677           
                    PLA                         
                    STA.b $02                   
                    RTL                         

CODE_20F0CF:        JSR.w CODE_20F650           
                    LDA.w $0154                 
                    BNE   CODE_20F0FA           
                    JSL.l CODE_29EA32           
                    JSL.l CODE_29E9F8           
                    JSL.l CODE_29E8AB           
                    JSL.l CODE_29EA69           
                    LDA.b $28                   
                    BNE   CODE_20F0F8           
                    STZ.w $1600                 
                    STZ.w $1601                 
                    DEC   A                     
                    STA.w $1602                 
                    STA.w $1603                 
CODE_20F0F8:        STZ.b $28                   
CODE_20F0FA:        JSR.w CODE_20F20B           
                    JSR.w CODE_20FBC5           
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
                    CLI                         
                    JMP.w CODE_20F0AC           
CODE_20F11A:        JSR.w CODE_20F650           
                    LDA.b $20                   
                    BEQ   CODE_20F121           
CODE_20F121:        JSR.w CODE_20F20B           
                    JSR.w CODE_20FCBF           
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
                    CLI                         
                    JMP.w CODE_20F0B7           

CODE_20F141:        JSR.w CODE_20F650           
                    LDA.w $0154                 
                    BNE   CODE_20F16C           
                    JSL.l CODE_29E953           
                    JSL.l CODE_29E9A3           
                    JSL.l CODE_29E8AB           
                    JSL.l CODE_29EA69           
                    LDA.b $28                   
                    BNE   CODE_20F16A           
                    STZ.w $1600                 
                    STZ.w $1601                 
                    DEC   A                     
                    STA.w $1602                 
                    STA.w $1603                 
CODE_20F16A:        STZ.b $28                   
CODE_20F16C:        JSR.w CODE_20F20B           
                    JSR.w CODE_20FBC5           
                    LDA.w $4211                 
                    LDA.b #$A0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
                    CLI                         
                    JMP.w CODE_20F0AC           

CODE_20F18C:        JSR.w CODE_20F650           
                    LDA.w $0154                 
                    BNE   CODE_20F1B4           
                    LDA.b $C2                   
                    BEQ   CODE_20F19D           
                    JSR.w CODE_20CF69           
                    BRA   CODE_20F1B4           

CODE_20F19D:        JSL.l CODE_29E8AB           
                    LDA.b $28                   
                    BNE   CODE_20F1B2           
                    STZ.w $1600                 
                    STZ.w $1601                 
                    DEC   A                     
                    STA.w $1602                 
                    STA.w $1603                 
CODE_20F1B2:        STZ.b $28                   
CODE_20F1B4:        JSR.w CODE_20CFDC           
                    JSR.w CODE_20F20B           
                    JSR.w CODE_20FBC5           
                    JMP.w CODE_20F0AC           

CODE_20F1C0:        JSR.w CODE_20F650           
                    LDA.w $0154                 
                    BNE   CODE_20F1EB           
                    JSL.l CODE_29E953           
                    JSL.l CODE_29E9A3           
                    JSL.l CODE_29E8AB           
                    JSL.l CODE_29EA69           
                    LDA.b $28                   
                    BNE   CODE_20F1E9           
                    STZ.w $1600                 
                    STZ.w $1601                 
                    DEC   A                     
                    STA.w $1602                 
                    STA.w $1603                 
CODE_20F1E9:        STZ.b $28                   
CODE_20F1EB:        JSR.w CODE_20F20B           
                    JSR.w CODE_20FCBF           
                    LDA.w $4211                 
                    LDA.b #$91                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
                    CLI                         
                    JMP.w CODE_20F0AC           

CODE_20F20B:        PHD                         
                    LDA.b #$21                  
                    XBA                         
                    LDA.b #$00                  
                    TCD                         
                    LDA.w $0200                 
                    STA.b $23                   
                    LDA.w $0201                 
                    STA.b $24                   
                    LDA.w $0202                 
                    STA.b $25                   
                    LDA.w $0203                 
                    STA.b $30                   
                    LDA.w $0204                 
                    STA.b $31                   
                    LDA.w $0205                 
                    STA.b $32                   
                    LDA.w $0206                 
                    STA.b $32                   
                    LDA.w $0207                 
                    STA.b $32                   
                    LDA.w $0208                 
                    STA.b $2C                   
                    LDA.w $0209                 
                    STA.b $2D                   
                    LDA.w $020A                 
                    STA.b $2E                   
                    LDA.w $020B                 
                    STA.b $2F                   
                    LDA.w $020D                 
                    STA.b $06                   
                    LDA.w $020C                 
                    STA.b $05                   
                    PLD                         
                    RTS                         

CODE_20F25A:        JSR.w CODE_20F64C           
                    LDA   PNTR_2282BB               
                    STA.b $36                   
                    LDA   PNTR_2282BB+1
                    STA.b $37                   
                    LDA   PNTR_2282BB+2               
                    STA.b $38                   
                    JSL.l CODE_29E8AB           
                    STZ.b $28                   
                    REP   #$20                  
                    STZ.w $1600                 
                    LDA.w #$FFFF                
                    STA.w $1602                 
                    SEP   #$20                  
                    JSR.w CODE_20F20B           
                    LDA.w $0210                 
                    STA.w $210D                 
                    LDA.w $0211                 
                    STA.w $210D                 
                    LDA.w $0216                 
                    STA.w $210E                 
                    LDA.w $0217                 
                    STA.w $210E                 
                    LDA.w $0212                 
                    STA.w $210F                 
                    LDA.w $0213                 
                    STA.w $210F                 
                    LDA.w $0218                 
                    STA.w $2110                 
                    LDA.w $0219                 
                    STA.w $2110                 
                    LDA.w $4211                 
                    LDA.b #$28                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
                    CLI                         
                    LDX.b #$00                  
                    LDY.b #$02                  
                    LDA.w $0782                 
                    AND.b #$02                  
                    STA.b $00                   
                    LDA.w $0783                 
                    AND.b #$02                  
                    EOR.b $00                   
                    CLC                         
                    BEQ   CODE_20F2E2           
                    SEC                         
CODE_20F2E2:        ROR.w $0782,x               
                    INX                         
                    DEY                         
                    BNE   CODE_20F2E2           
                    JSR.w CODE_20FB5E           
                    JSL.l CODE_239953           
                    INC.b $15                   
                    LDA.b $16                   
                    STA.w $2100                 
                    LDA.w $0293                 
                    STA.w $420C                 
                    JSL.l CODE_29EAA5           
                    JMP.w CODE_20F0C7           

CODE_20F304:        LDA.w $4211                 
                    BMI   CODE_20F30C           
                    JMP.w CODE_20F38E           

CODE_20F30C:        LDA.b #$21                  
                    XBA                         
                    LDA.b #$00                  
                    TCD                         
                    LDA.w $0101                 
                    CMP.b #$80                  
                    BNE   CODE_20F31C           
                    JMP.w CODE_20F38E           

CODE_20F31C:        CMP.b #$40                  
                    BNE   CODE_20F323           
                    JMP.w CODE_20F392           

CODE_20F323:        CMP.b #$20                  
                    BNE   CODE_20F32A           
                    JMP.w CODE_20F4C3           

CODE_20F32A:        CMP.b #$60                  
                    BNE   CODE_20F331           
                    JMP.w CODE_20F408           

CODE_20F331:        CMP.b #$A0                  
                    BNE   CODE_20F338           
                    JMP.w CODE_20F462           

CODE_20F338:        CMP.b #$55                  
                    BNE   CODE_20F33F           
                    JMP.w CODE_20F4C6           

CODE_20F33F:        CMP.b #$75                  
                    BNE   CODE_20F346           
                    JMP.w CODE_20F4F4           

CODE_20F346:        CMP.b #$95                  
                    BNE   CODE_20F34D           
                    JMP.w CODE_20F528           

CODE_20F34D:        LDA.w $0425                 
                    BEQ   CODE_20F352           
CODE_20F352:        BIT.w $4212                 
                    BVC   $FB                   
                    LDA.b #$80                  
                    STA.b $00                   
                    STZ.w $420C                 
                    STZ.b $23                   
                    STZ.b $24                   
                    STZ.b $2F                   
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $020E                 
                    STA.b $05                   
                    LDA.w $020F                 
                    STA.b $2C                   
                    LDA.b #$20                  
                    STA.b $31                   
                    STZ.b $0D                   
                    LDA.b #$01                  
                    STA.b $0D                   
                    STZ.b $0E                   
                    STA.b $0E                   
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $16                 
                    STA.b $00                   
                    INC.w $021C                 
CODE_20F38E:        RTL                         

                    JMP.w CODE_20F38E           

CODE_20F392:        LDX.w $037C                 
                    BNE   CODE_20F3E6           
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.b #$EF                  
                    STA.b $0E                   
                    LDA.b #$00                  
                    STA.b $0E                   
                    LDA.w $0210                 
                    STA.b $0D                   
                    LDA.w $0211                 
                    STA.b $0D                   
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.w $0727                 
                    CMP.b #$07                  
                    BNE   CODE_20F3DF           
                    LDA.l $7E3977               
                    BNE   CODE_20F3DF           
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $0208                 
                    AND.b #$0F                  
                    STA.b $2C                   
                    LDA.w $0209                 
                    ORA.b #$10                  
                    STA.b $2D                   
CODE_20F3DF:        INX                         
                    STX.w $037C                 
                    JMP.w CODE_20F38E           

CODE_20F3E6:        BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $020E                 
                    STA.b $05                   
                    LDA.w $020F                 
                    STA.b $2C                   
                    STZ.b $0D                   
                    LDA.b #$01                  
                    STA.b $0D                   
                    STZ.b $0E                   
                    STA.b $0E                   
                    STZ.w $037C                 
                    INC.w $021C                 
                    JMP.w CODE_20F38E           

CODE_20F408:        LDX.w $037C                 
                    CPX.b #$03                  
                    BEQ   CODE_20F440           
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.b #$00                  
                    STA.b $0E                   
                    STA.b $0E                   
                    LDA.w $1000,x               
                    STA.b $0D                   
                    LDA.w $1003,x               
                    AND.b #$01                  
                    STA.b $0D                   
                    LDA.w $4211                 
                    LDA.l $21CEE4,x             
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    INX                         
                    STX.w $037C                 
                    JMP.w CODE_20F38E           

CODE_20F440:        BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $020E                 
                    STA.b $05                   
                    LDA.w $020F                 
                    STA.b $2C                   
                    STZ.b $0D                   
                    LDA.b #$01                  
                    STA.b $0D                   
                    STZ.b $0E                   
                    STA.b $0E                   
                    STZ.w $037C                 
                    INC.w $021C                 
                    JMP.w CODE_20F38E           

CODE_20F462:        LDA.w $037C                 
                    BNE   CODE_20F495           
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.b #$EF                  
                    STA.b $0E                   
                    LDA.b #$00                  
                    STA.b $0E                   
                    LDA.w $0210                 
                    STA.b $0D                   
                    LDA.w $0211                 
                    STA.b $0D                   
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    INC.w $037C                 
                    JMP.w CODE_20F38E           

CODE_20F495:        BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $020E                 
                    STA.b $05                   
                    LDA.w $020F                 
                    STA.b $2C                   
                    LDA.b #$20                  
                    STA.b $31                   
                    STZ.b $23                   
                    STZ.b $2F                   
                    STZ.w $037C                 
                    STZ.w $210D                 
                    LDA.b #$01                  
                    STA.w $210D                 
                    STZ.w $210E                 
                    STA.w $210E                 
                    INC.w $021C                 
                    JMP.w CODE_20F38E           

CODE_20F4C3:        JMP.w CODE_20F38E           

CODE_20F4C6:        LDA.w $037C                 
                    BNE   CODE_20F495           
                    REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    SEP   #$20                  
                    BIT.w $4212                 
                    BVC   $FB                   
                    STA.b $0D                   
                    XBA                         
                    STA.b $0D                   
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    INC.w $037C                 
                    JMP.w CODE_20F38E           

CODE_20F4F4:        LDA.w $037C                 
                    BNE   CODE_20F55F           
                    REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    SEP   #$20                  
                    BIT.w $4212                 
                    BVC   $FB                   
                    STA.b $0D                   
                    XBA                         
                    STA.b $0D                   
                    LDA.b #$EF                  
                    STA.b $0E                   
                    STZ.b $0E                   
                    LDA.w $4211                 
                    LDA.b #$C0                  
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    INC.w $037C                 
                    JMP.w CODE_20F38E           

CODE_20F528:        LDX.w $037C                 
                    CPX.b #$08                  
                    BCS   $30                   
                    INC.w $037C                 
                    INC.w $037C                 
                    BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $0357,x               
                    STA.b $11                   
                    LDA.w $0358,x               
                    AND.b #$01                  
                    STA.b $11                   
                    TXA                         
                    LSR   A                     
                    TAX                         
                    LDA.w $4211                 
                    LDA.l $21CEE8,x             
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    JMP.w CODE_20F38E           

CODE_20F55F:        BIT.w $4212                 
                    BVC   $FB                   
                    STZ.b $0D                   
                    LDA.b #$01                  
                    STA.b $0D                   
                    STZ.b $0E                   
                    STA.b $0E                   
                    LDA.w $020E                 
                    STA.b $05                   
                    LDA.w $020F                 
                    STA.b $2C                   
                    LDA.b #$20                  
                    STA.b $31                   
                    STZ.b $24                   
                    STZ.b $2F                   
                    STZ.w $037C                 
                    INC.w $021C                 
                    JMP.w CODE_20F38E           

CODE_20F589:        JSR.w CODE_20F60C           
CODE_20F58C:        LDA.w $0726                 
                    BEQ   CODE_20F593           
                    LDA.b #$23                  
CODE_20F593:        STA.b $00                   
                    LDA.b #$02                  
                    STA.b $01                   
CODE_20F599:        LDY.b $00                   
                    JSL.l CODE_20F5A6           
                    INC.b $00                   
                    DEC.b $01                   
                    BPL   CODE_20F599           
                    RTL                         

CODE_20F5A6:        STY.b $02                   
                    LDA.w $1D9C,y               
                    ASL   A                     
                    TAX                         
                    LDY.w $1600                 
                    REP   #$20                  
                    LDA.w $CF0D,x               
                    STA.w $1606,y               
                    LDA.w $CF15,x               
                    STA.w $1608,y               
                    LDA.w $CF1D,x               
                    STA.w $160E,y               
                    LDA.w $CF25,x               
                    STA.w $1610,y               
                    SEP   #$20                  
                    LDX.w $0726                 
                    BEQ   CODE_20F5D3           
                    LDX.b #$23                  
CODE_20F5D3:        LDA.b $02                   
                    STX.b $02                   
                    SEC                         
                    SBC.b $02                   
                    TAX                         
                    LDA.w $CF2D,x               
                    STA.w $1603,y               
                    LDA.w $CF30,x               
                    STA.w $160B,y               
                    LDA.b #$0F                  
                    STA.w $1602,y               
                    STA.w $160A,y               
                    LDA.b #$00                  
                    STA.w $1604,y               
                    STA.w $160C,y               
                    LDA.b #$03                  
                    STA.w $1605,y               
                    STA.w $160D,y               
                    LDA.b #$FF                  
                    STA.w $1612,y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1600                 
                    RTL                         

CODE_20F60C:        PHA                         
                    LDY.w $0726                 
                    BEQ   CODE_20F614           
                    LDY.b #$23                  
CODE_20F614:        LDA.w $1D9C,y               
                    BEQ   CODE_20F62F           
                    INY                         
                    CPY.b #$03                  
                    BEQ   CODE_20F622           
                    CPY.b #$26                  
                    BNE   CODE_20F614           
CODE_20F622:        LDA.w $1D9A,y               
                    STA.w $1D99,y               
                    LDA.w $1D9B,y               
                    STA.w $1D9A,y               
                    DEY                         
CODE_20F62F:        PLA                         
                    STA.w $1D9C,y               
                    RTL                         

CODE_20F634:        PHA                         
                    LDY.w $0726                 
                    BEQ   CODE_20F63C           
                    LDY.b #$23                  
CODE_20F63C:        LDX.b #$1B                  
CODE_20F63E:        LDA.w $1D80,y               
                    BEQ   CODE_20F647           
                    INY                         
                    DEX                         
                    BNE   CODE_20F63E           
CODE_20F647:        PLA                         
                    STA.w $1D80,y               
                    RTL                         

CODE_20F64C:        PHD                         
                    BRL   CODE_20F94B           

CODE_20F650:        PHB                         
                    LDA.b #$21                  
                    PHA                         
                    PLB                         
                    PHD                         
                    LDA.b #$43                  
                    XBA                         
                    LDA.b #$00                  
                    TCD                         
                    LDA.b #$80                  
                    STA.w $2115                 
                    REP   #$10                  
                    LDX.w #$1801                
                    STX.b $00                   
                    LDA.w $0238                 
                    BNE   CODE_20F670           
                    JMP.w CODE_20F703           

CODE_20F670:        STA.b $04                   
                    LDX.w #$6000                
                    STX.w $2116                 
                    LDX.w $0220                 
                    STX.b $02                   
                    LDY.w #$0040                
                    STY.b $05                   
                    LDA.b #$01                  
                    STA.w $420B                 
                    LDX.w $0222                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0224                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0226                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0228                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $022A                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w #$6100                
                    STX.w $2116                 
                    LDX.w $0239                 
                    STX.b $04                   
                    LDX.w $022C                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $022E                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0230                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0232                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0234                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    LDX.w $0236                 
                    STX.b $02                   
                    STY.b $05                   
                    STA.w $420B                 
                    STZ.w $0238                 
CODE_20F703:        LDA.w $072B                 
                    CMP.b #$03                  
                    BNE   CODE_20F77A           
                    REP   #$20                  
                    SEP   #$10                  
                    LDA.l $7F3004               
                    BEQ   CODE_20F732           
                    STA.w $2116                 
                    LDA.w #$5000                
                    STA.b $02                   
                    LDX.b #$7F                  
                    STX.b $04                   
                    LDA.l $7F3006               
                    STA.b $05                   
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.w #$0000                
                    STA.l $7F3004               
CODE_20F732:        LDA.l $7F3008               
                    BEQ   CODE_20F754           
                    STA.w $2116                 
                    LDA.w #$3800                
                    STA.b $02                   
                    LDA.w #$007F                
                    STA.b $04                   
                    LDA.w #$0800                
                    STA.b $05                   
                    STX.w $420B                 
                    LDA.w #$0000                
                    STA.l $7F3008               
CODE_20F754:        LDA.l $7F300A               
                    BEQ   CODE_20F776           
                    STA.w $2116                 
                    LDA.w #$4000                
                    STA.b $02                   
                    LDA.w #$007F                
                    STA.b $04                   
                    LDA.w #$0800                
                    STA.b $05                   
                    STX.w $420B                 
                    LDA.w #$0000                
                    STA.l $7F300A               
CODE_20F776:        SEP   #$20                  
                    REP   #$10                  
CODE_20F77A:        LDA.w $02D1                 
                    BPL   CODE_20F7CC           
                    REP   #$20                  
                    SEP   #$10                  
                    STZ.w $2115                 
                    LDA.w #$21FF                
                    STA.w $02                 
                    LDA.w #$5000                
                    STA.w $2116                 
                    LDA.w #$1808                
                    STA.b $00                   
                    STZ.b $04                   
                    LDA.w #$0002                
                    STA.b $02                   
                    LDA.w #$0300                
                    STA.b $05                   
                    LDY.b #$01                  
                    STY.w $420B                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    STA.b $05                   
                    LDA.w #$5000                
                    STA.w $2116                 
                    LDA.w #$1908                
                    STA.b $00                   
                    LDA.w #$0003                
                    STA.b $02                   
                    STY.w $420B                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $02D1                 
                    JMP.w CODE_20F923           

CODE_20F7CC:        LDX.w $023E                 
                    BEQ   CODE_20F7EE           
                    STX.w $2116                 
                    LDA.w $0242                 
                    STA.b $04                   
                    LDX.w $0240                 
                    STX.b $02                   
                    LDX.w $02CA                 
                    STX.b $05                   
                    LDA.b #$01                  
                    STA.w $420B                 
                    STZ.w $023E                 
                    STZ.w $023F                 
CODE_20F7EE:        SEP   #$10                  
                    LDA.w $02D3                 
                    BMI   CODE_20F84F           
                    LDA.w $1EBF                 
                    BNE   CODE_20F82D           
                    LDA.w $0727                 
                    CMP.b #$02                  
                    BNE   CODE_20F82A           
                    LDA.w $02D7                 
                    BNE   CODE_20F82A           
                    LDX.w $07BC                 
                    REP   #$20                  
                    LDA.w #$2320                
                    STA.w $2116                 
                    LDA.w #$0100                
                    STA.b $05                   
                    SEP   #$20                  
                    LDA.b #$37                  
                    STA.b $04                   
                    LDA.w $CA3E,x               
                    STA.b $03                   
                    LDA.b #$40                  
                    STA.b $02                   
                    LDA.b #$01                  
                    STA.w $420B                 
CODE_20F82A:        JMP.w CODE_20F923           

CODE_20F82D:        CMP.b #$07                  
                    BEQ   CODE_20F82A           
                    CMP.b #$0F                  
                    BCC   CODE_20F848           
                    CMP.b #$11                  
                    BNE   CODE_20F83C           
                    JMP.w CODE_20F9C4           

CODE_20F83C:        CMP.b #$13                  
                    BCC   CODE_20F82A           
                    CMP.b #$16                  
                    BEQ   CODE_20F82A           
                    CMP.b #$2C                  
                    BEQ   CODE_20F82A           
CODE_20F848:        LDX.b #$00                  
                    LDA.w $0567                 
                    BNE   CODE_20F8A7           
CODE_20F84F:        REP   #$20                  
                    LDA.w #$2980                
                    STA.w $2116                 
                    SEP   #$20                  
                    LDA.w $02B1                 
                    AND.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b #$36                  
                    STA.b $04                   
                    LDA.w $CA2C,x               
                    STA.b $03                   
                    STZ.b $02                   
                    LDY.b #$80                  
                    STY.b $05                   
                    LDA.b #$01                  
                    STA.w $420B                 
                    REP   #$20                  
                    LDA.w #$2DC0                
                    STA.w $2116                 
                    SEP   #$20                  
                    LDA.w $CA30,x               
                    STA.b $03                   
                    LDA.b #$80                  
                    STA.b $02                   
                    STY.b $05                   
                    LDA.b #$01                  
                    STA.w $420B                 
                    INC.w $02B1                 
                    LDX.w $0245                 
                    BMI   CODE_20F8C8           
                    BEQ   CODE_20F8A7           
                    LDA.w $0243                 
                    CMP.b #$04                  
                    BNE   CODE_20F8A4           
                    STX.w $02B2                 
CODE_20F8A4:        LDX.w $02B2                 
CODE_20F8A7:        REP   #$20                  
                    LDA.w #$60C0                
                    STA.w $2116                 
                    SEP   #$20                  
                    LDA.b #$31                  
                    STA.b $04                   
                    LDA.w $CA34,x               
                    STA.b $03                   
                    LDA.w $CA39,x               
                    STA.b $02                   
                    LDY.b #$80                  
                    STY.b $05                   
                    LDA.b #$01                  
                    STA.w $420B                 
CODE_20F8C8:        LDX.b #$00                  
                    LDA.w $02BF                 
                    CMP.b #$01                  
                    BEQ   CODE_20F8E3           
                    CMP.b #$05                  
                    BEQ   CODE_20F8E3           
                    CMP.b #$06                  
                    BEQ   CODE_20F8E3           
                    CMP.b #$07                  
                    BEQ   CODE_20F8E3           
                    LDX.b #$04                  
                    CMP.b #$0D                  
                    BNE   CODE_20F923           
CODE_20F8E3:        STX.w $0004                 
                    REP   #$20                  
                    LDA.w #$5A00                
                    STA.w $2116                 
                    LDA.w #$0100                
                    STA.b $05                   
                    SEP   #$20                  
                    LDA.w $02C2                 
                    INC   A                     
                    CMP.b #$0A                  
                    BNE   CODE_20F908           
                    LDA.w $02C0                 
                    INC   A                     
                    AND.b #$03                  
                    STA.w $02C0                 
                    LDA.b #$00                  
CODE_20F908:        STA.w $02C2                 
                    LDA.w $02C0                 
                    CLC                         
                    ADC.w $0004                 
                    TAX                         
                    LDA.b #$38                  
                    STA.b $04                   
                    LDA.w $CA40,x               
                    STA.b $03                   
                    STZ.b $02                   
                    LDA.b #$01                  
                    STA.w $420B                 
CODE_20F923:        LDA.w $1500                 
                    BEQ   CODE_20F94A           
                    STZ.w $2121                 
                    REP   #$20                  
                    LDA.w #$2200                
                    STA.b $10                   
                    LDA.w #$1300                
                    STA.b $12                   
                    LDY.b #$00                  
                    STY.b $14                   
                    LDA.w #$0200                
                    STA.b $15                   
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $420B                 
                    STZ.w $1500                 
CODE_20F94A:        PLB                         
CODE_20F94B:        LDA.b #$0A                  
                    XBA                         
                    LDA.b #$00                  
                    TCD                         
                    LDY.b #$1C                  
CODE_20F953:        TYA                         
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDA.b $23,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $22,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $21,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $20,x                 
                    STA.w $0A00,y               
                    LDA.b $27,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $26,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $25,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $24,x                 
                    STA.w $0A01,y               
                    LDA.b $2B,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $2A,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $29,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $28,x                 
                    STA.w $0A02,y               
                    LDA.b $2F,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $2E,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $2D,x                 
                    ASL   A                     
                    ASL   A                     
                    ORA.b $2C,x                 
                    STA.w $0A03,y               
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    BPL   CODE_20F953           
                    REP   #$20                  
                    LDA.w #$4300                
                    TCD                         
                    STZ.w $2102                 
                    LDA.w #$0400                
                    STA.b $00                   
                    LDA.w #$0800                
                    STA.b $02                   
                    STZ.b $04                   
                    LDA.w #$0220                
                    STA.b $05                   
                    LDY.b #$01                  
                    STY.w $420B                 
                    SEP   #$20                  
                    PLD                         
                    RTS                         

CODE_20F9C4:        REP   #$20                  
                    LDA.w #$3060                
                    STA.w $2116                 
                    SEP   #$20                  
                    LDX.w $02D2                 
                    LDA.b #$33                  
                    STA.b $04                   
                    LDA.w $CA48,x               
                    STA.b $03                   
                    LDA.w $CA4C,x               
                    STA.b $02                   
                    LDY.b #$80                  
                    STY.b $05                   
                    LDA.b #$01                  
                    STA.w $420B                 
                    JMP.w CODE_20F923           

CODE_20F9EB:        REP   #$20                  
                    STZ.w $0210                 
                    STZ.w $0212                 
                    STZ.w $0214                 
                    STZ.w $0216                 
                    STZ.w $0218                 
                    STZ.w $021A                 
                    SEP   #$20                  
                    RTS                         

CODE_20FA02:        LDA.b #$80                  
                    STA.b $16                   
                    STA.w $2100                 
                    RTS                         

CODE_20FA0A:        REP   #$20                  
                    STZ.w $1600                 
                    LDA.w #$FFFF                
                    STA.w $1602                 
                    SEP   #$20                  
CODE_20FA17:        JSR.w CODE_20FA02           
CODE_20FA1A:        REP   #$20                  
                    STZ.w $2115                 
                    STZ.w $2116                 
                    LDA.w #$1808                
                    STA.w $4310                 
                    STZ.w $4314                 
                    LDA.w #$0000                
                    STA.w $4312                 
                    LDA.w #$2000                
                    STA.w $4315                 
                    LDY.b #$02                  
                    STY.w $420B                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    STZ.w $2116                 
                    STA.w $4315                 
                    LDA.w #$1908                
                    STA.w $4310                 
                    LDA.w #$0001                
                    STA.w $4312                 
                    STY.w $420B                 
                    STZ.w $2115                 
                    LDA.w #$01FF                
                    STA.b $02                   
                    LDA.w #$5000                
                    STA.w $2116                 
                    LDA.w #$1808                
                    STA.w $4310                 
                    LDA.w #$0002                
                    STA.w $4312                 
                    LDA.w #$0800                
                    STA.w $4315                 
                    STY.w $420B                 
                    STX.w $2115                 
                    STA.w $4315                 
                    LDA.w #$5000                
                    STA.w $2116                 
                    LDA.w #$1908                
                    STA.w $4310                 
                    LDA.w #$0003                
                    STA.w $4312                 
                    STY.w $420B                 
                    SEP   #$20                  
                    RTS                         

                    STZ.w $2115                 
                    REP   #$20                  
                    STZ.w $2116                 
                    LDA.w #$1808                
                    STA.w $4310                 
                    STZ.w $4314                 
                    LDA.w #$0739                
                    STA.w $4312                 
                    LDA.w #$2000                
                    STA.w $4315                 
                    LDY.b #$02                  
                    STY.w $420B                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    STZ.w $2116                 
                    STA.w $4315                 
                    LDA.w #$1908                
                    STA.w $4310                 
                    LDA.w #$073A                
                    STA.w $4312                 
                    STY.w $420B                 
                    SEP   #$20                  
                    RTS                         

                    LDY.b #$04                  
                    LDA.w $0216                 
CODE_20FADB:        CMP.w $CF33,y               
                    BEQ   CODE_20FAE3           
                    DEY                         
                    BPL   CODE_20FADB           
CODE_20FAE3:        LDA.w $CF38,y               
                    STA.b $01                   
                    LDA.w $CF3D,y               
                    STA.b $00                   
                    REP   #$10                  
                    LDY.w #$0300                
                    LDA.b #$80                  
                    STA.w $2115                 
CODE_20FAF7:        REP   #$20                  
                    LDA.b $00                   
                    STA.w $2116                 
CODE_20FAFE:        LDA.w $0739                 
                    STA.w $2118                 
                    DEY                         
                    BEQ   CODE_20FB1C           
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0001                
                    STA.b $00                   
                    AND.w #$03FF                
                    BNE   CODE_20FAFE           
                    LDA.w #$0800                
                    STA.b $00                   
                    JMP.w CODE_20FAF7           
CODE_20FB1C:        SEP   #$30                  
                    RTS                         

CODE_20FB1F:        STY.b $03                   
                    PLY                         
                    STY.b $00                   
                    REP   #$30                  
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    PLA                         
                    STA.b $01                   
                    INY                         
                    LDA.b [$00],y               
                    STA.b $00                   
                    SEP   #$30                  
                    LDY.b $03                   
                    JML.w [$0000]               

CODE_20FB3A:        STY.b $05        ; ExecutePtrLong | Preserve Y       
                    PLY                   ; Get bank of source
                    STY.b $02             ; Store in Y
                    REP   #$30            ;
                    AND.w #$00FF          ; Get A  
                    STA.b $03             ; Store in $03
                    ASL   A               ;\ *3 since the table entries are three bytes
                    ADC.b $03             ;/  
                    TAY                   ; A -> Y
                    PLA                   ; Get Low and High byte of source
                    STA.b $03             ;   
                    INY                   ; +1 so we don't read the last byte of the JSL   
                    LDA.b [$02],y         ;\ Read low and high byte of spot to jump to
                    STA.b $00             ;/  
                    INY                   ; +1 so we don't read the same data again
                    LDA.b [$02],y         ;\ Get high and bank byte
                    STA.b $01             ;/  
                    SEP   #$30            ;
                    LDY.b $05             ; Restore A   
                    JML.w [$0000]         ; Jump to pointer

CODE_20FB5E:        STZ.w $4016                 
                    LDA.l $701FF4               
                    TAX                         
                    LDA.w $4218,x               
                    STA.b $00                   
                    LDA.w $4219,x               
                    STA.b $01                   
                    LDA.b $00                   
                    STA.b $F4                   
                    TAY                         
                    EOR.b $FC                   
                    AND.b $F4                   
                    STA.b $F8                   
                    STY.b $FC                   
                    LDA.b $01                   
                    STA.b $F2                   
                    STA.b $17                   
                    TAY                         
                    EOR.b $FA                   
                    AND.b $F2                   
                    STA.b $F6                   
                    STA.b $18                   
                    STY.b $FA                   
                    LDA.l $701FF6               
                    TAX                         
                    LDA.w $4218,x               
                    STA.b $00                   
                    LDA.w $4219,x               
                    STA.b $01                   
                    LDA.b $00                   
                    STA.b $F5                   
                    TAY                         
                    EOR.b $FD                   
                    AND.b $F5                   
                    STA.b $F9                   
                    STY.b $FD                   
                    LDA.b $01                   
                    STA.b $F3                   
                    TAY                         
                    EOR.b $FB                   
                    AND.b $F3                   
                    STA.b $F7                   
                    STY.b $FB                   
                    LDA.w $0726                 
                    BEQ   CODE_20FBC4           
                    LDA.b $F3                   
                    STA.b $17                   
                    LDA.b $F7                   
                    STA.b $18                   
CODE_20FBC4:        RTS                         

CODE_20FBC5:        LDA.w $0210                 
                    STA.w $210D                 
                    LDA.w $0211                 
                    STA.w $210D                 
                    LDA.w $0216                 
                    STA.w $210E                 
                    STA.b $02                   
                    LDA.w $0217                 
                    STA.w $210E                 
                    STA.b $03                   
                    LDA.w $0212                 
                    STA.w $210F                 
                    LDA.w $0213                 
                    STA.w $210F                 
                    LDA.w $0218                 
                    STA.w $2110                 
                    LDA.w $0219                 
                    STA.w $2110                 
                    LDA.w $0100                 
                    CMP.b #$20                  
                    BNE   CODE_20FC03           
                    JMP.w CODE_20FCA6           

CODE_20FC03:        LDA.w $02BF                 
                    CMP.b #$01                  
                    BNE   CODE_20FC47           
                    LDX.w $02C1                 
                    CPX.b #$1C                  
                    BNE   CODE_20FC3C           
                    REP   #$20                  
                    LDA.w #$0000                
                    STA.w $02CC                 
                    LDA.w $0216                 
                    CMP.w #$0950                
                    BCC   CODE_20FC2B           
                    LDA.w $0216                 
                    SEC                         
                    SBC.w #$0950                
                    STA.w $02CC                 
CODE_20FC2B:        SEP   #$20                  
                    LDA.w $02CC                 
                    STA.w $2112                 
                    LDA.w $02CD                 
                    STA.w $2112                 
                    JMP.w CODE_20FCB2           

CODE_20FC3C:        STZ.w $2112                 
                    LDA.b #$01                  
                    STA.w $2112                 
                    JMP.w CODE_20FCB2           

CODE_20FC47:        CMP.b #$08                  
                    BNE   CODE_20FC7B           
                    REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    LDA.b $02                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02C3                 
                    LDA.b $02                   
                    SEC                         
                    SBC.w $02C3                 
                    STA.w $02C3                 
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $2111                 
                    LDA.b $01                   
                    STA.w $2111                 
                    LDA.b #$17                  
                    STA.w $2112                 
                    STZ.w $2112                 
                    RTS                         

CODE_20FC7B:        CMP.b #$09                  
                    BNE   CODE_20FCA6           
                    REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $2111                 
                    LDA.b $01                   
                    STA.w $2111                 
                    LDA.w $0218                 
                    CLC                         
                    ADC.b #$11                  
                    STA.w $2112                 
                    LDA.w $0219                 
                    ADC.b #$00                  
                    STA.w $2112                 
                    RTS                         

CODE_20FCA6:        LDA.w $021A                 
                    STA.w $2112                 
                    LDA.w $021B                 
                    STA.w $2112                 
CODE_20FCB2:        LDA.w $0214                 
                    STA.w $2111                 
                    LDA.w $0215                 
                    STA.w $2111                 
                    RTS                         

CODE_20FCBF:        LDA.w $0210                 
                    STA.w $210D                 
                    LDA.w $0211                 
                    STA.w $210D                 
                    LDA.w $0216                 
                    CLC                         
                    ADC.w $1CF2                 
                    STA.w $210E                 
                    STA.b $02                   
                    LDA.w $0217                 
                    STA.w $210E                 
                    STA.b $03                   
                    LDA.w $02BF                 
                    CMP.b #$03                  
                    BEQ   CODE_20FCEC           
                    CMP.b #$04                  
                    BEQ   CODE_20FCEC           
                    BRA   CODE_20FD25           

CODE_20FCEC:        LDA.b $9C                   
                    BNE   CODE_20FCF8           
                    LDA.w $037A                 
                    BNE   CODE_20FCF8           
                    JSR.w CODE_20FF4A           
CODE_20FCF8:        LDA.w $0353                 
                    STA.w $210F                 
                    LDA.w $0354                 
                    STA.w $210F                 
                    LDA.b #$3F                  
                    STA.w $2110                 
                    STZ.w $2110                 
                    LDA.w $0212                 
                    STA.w $2111                 
                    LDA.w $0213                 
                    STA.w $2111                 
                    LDA.w $0218                 
                    STA.w $2112                 
                    LDA.w $0219                 
                    STA.w $2112                 
                    RTS                         

CODE_20FD25:        LDA.w $0350                 
                    CMP.b #$12                  
                    BNE   CODE_20FD85           
                    LDA.w $02BF                 
                    BEQ   CODE_20FD6A           
                    REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    STA.b $00                   
                    LDA.b $02                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02C3                 
                    LDA.b $02                   
                    SEC                         
                    SBC.w $02C3                 
                    STA.w $02C3                 
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $210F                 
                    LDA.b $01                   
                    STA.w $210F                 
                    LDA.w $02C3                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $2110                 
                    LDA.w $02C4                 
                    ADC.b #$00                  
                    STA.w $2110                 
                    JMP.w CODE_20FEED           

CODE_20FD6A:        LDA.w $02CC                 
                    STA.w $2110                 
                    LDA.w $02CD                 
                    STA.w $2110                 
                    LDA.w $02CE                 
                    STA.w $210F                 
                    LDA.w $02CF                 
                    STA.w $210F                 
                    JMP.w CODE_20FEED           

CODE_20FD85:        LDA.w $0212                 
                    STA.w $210F                 
                    LDA.w $0213                 
                    STA.w $210F                 
                    LDA.w $0218                 
                    STA.w $2110                 
                    LDA.w $0219                 
                    STA.w $2110                 
                    LDA.w $02BF                 
                    CMP.b #$01                  
                    BNE   CODE_20FDCC           
                    LDA.w $02C1                 
                    CMP.b #$34                  
                    BNE   CODE_20FDB5           
                    STZ.w $2112                 
                    LDA.b #$01                  
                    STA.w $2112                 
                    BRA   CODE_20FDBF           

CODE_20FDB5:        LDA.b $02                   
                    STA.w $2112                 
                    LDA.b $03                   
                    STA.w $2112                 
CODE_20FDBF:        LDA.w $0210                 
                    STA.w $2111                 
                    LDA.w $0211                 
                    STA.w $2111                 
                    RTS                         

CODE_20FDCC:        CMP.b #$08                  
                    BNE   CODE_20FDDA           
                    LDA.b #$17                  
                    STA.w $2112                 
                    STZ.w $2112                 
                    BRA   CODE_20FDBF           

CODE_20FDDA:        CMP.b #$05                  
                    BNE   CODE_20FDE6           
                    STZ.w $2112                 
                    STZ.w $2112                 
                    BRA   CODE_20FDBF           

CODE_20FDE6:        CMP.b #$06                  
                    BNE   CODE_20FDF4           
                    STZ.w $2112                 
                    LDA.b #$01                  
                    STA.w $2112                 
                    BRA   CODE_20FDBF           

CODE_20FDF4:        CMP.b #$07                  
                    BNE   CODE_20FE10           
                    REP   #$20                  
                    LDA.w #$00B8                
                    CLC                         
                    ADC.b $02                   
                    STA.b $04                   
                    SEP   #$20                  
                    LDA.b $04                   
                    STA.w $2110                 
                    LDA.b $05                   
                    STA.w $2110                 
                    BRA   CODE_20FDB5           

CODE_20FE10:        CMP.b #$02                  
                    BEQ   CODE_20FE4A           
                    CMP.b #$09                  
                    BEQ   CODE_20FE23           
                    CMP.b #$0A                  
                    BEQ   CODE_20FE23           
                    CMP.b #$0F                  
                    BEQ   CODE_20FE23           
                    JMP.w CODE_20FE85           

CODE_20FE23:        REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $2111                 
                    LDA.b $01                   
                    STA.w $2111                 
                    LDA.w $0218                 
                    CLC                         
                    ADC.b #$11                  
                    STA.w $2112                 
                    LDA.w $0219                 
                    ADC.b #$00                  
                    STA.w $2112                 
                    RTS                         

CODE_20FE4A:        REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    STA.w $0353                 
                    LDA.b $02                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02C3                 
                    LDA.b $02                   
                    SEC                         
                    SBC.w $02C3                 
                    STA.w $02C3                 
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $2111                 
                    LDA.b $01                   
                    STA.w $2111                 
                    LDA.w $02C3                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $2112                 
                    LDA.w $02C4                 
                    ADC.b #$00                  
                    STA.w $2112                 
                    RTS                         

CODE_20FE85:        CMP.b #$0E                  
                    BNE   CODE_20FEAA           
                    LDA.b $02                   
                    STA.w $2112                 
                    LDA.b $03                   
                    STA.w $2112                 
                    REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $2111                 
                    LDA.b $01                   
                    STA.w $2111                 
                    RTS                         

CODE_20FEAA:        CMP.b #$0B                  
                    BNE   CODE_20FEED           
                    LDA.b $9C                   
                    BNE   CODE_20FEBA           
                    LDA.w $037A                 
                    BNE   CODE_20FEBA           
                    JSR.w CODE_20FF4A           
CODE_20FEBA:        REP   #$20                  
                    LDA.b $02                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02C3                 
                    LDA.b $02                   
                    SEC                         
                    SBC.w $02C3                 
                    STA.w $02C3                 
                    SEP   #$20                  
                    LDA.w $0353                 
                    STA.w $2111                 
                    LDA.w $0354                 
                    STA.w $2111                 
                    LDA.w $02C3                 
                    CLC                         
                    ADC.b #$28                  
                    STA.w $2112                 
                    LDA.w $02C4                 
                    ADC.b #$00                  
                    STA.w $2112                 
                    RTS                         

CODE_20FEED:        LDA.w $0214                 
                    STA.w $2111                 
                    LDA.w $0215                 
                    STA.w $2111                 
                    LDA.w $021A                 
                    STA.w $2112                 
                    LDA.w $021B                 
                    STA.w $2112                 
                    RTS                         

CODE_20FF06:        LDA.w $0210                 
                    CLC                         
                    ADC.b #$10                  
                    LDA.w $0211                 
                    ADC.b #$00                  
                    AND.b #$01                  
                    TAY                         
                    REP   #$20                  
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$0400                
                    STA.w $4305                 
                    LDA.w #$A000                
                    STA.w $4302                 
                    LDX.b #$7F                  
                    STX.w $4304                 
                    LDA.w #$0080                
                    LDX.b #$01                  
                    CPY.b #$00                  
                    BEQ   CODE_20FF3E           
                    LDA.w #$0480                
CODE_20FF3E:        STA.w $2116                 
                    STX.w $420B                 
                    SEP   #$20                  
                    STZ.w $02BB                 
                    RTS                         

CODE_20FF4A:        LDA.w $0351                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $0352                 
                    STA.w $0352                 
                    PHP                         
                    LDY.b #$00                  
                    LDA.w $0351                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_20FF69           
                    ORA.b #$F0                  
                    DEY                         
CODE_20FF69:        PLP                         
                    ADC.w $0353                 
                    STA.w $0353                 
                    TYA                         
                    ADC.w $0354                 
                    STA.w $0354                 
                    RTS                         