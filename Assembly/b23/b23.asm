; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $238000
    fillbyte $FF : fill   $8000

ORG $238000
CODE_238000:        RTL                         

                    LDY.w $0726                 
                    LDX.b #$00                  
                    CPY.b #$00                  
                    BEQ   CODE_23800C           
                    LDX.b #$0B                  
CODE_23800C:        LDY.b #$00                  
CODE_23800E:        LDA.w $8AE9,x               
                    STA.w $1606,y               
                    INX                         
                    INY                         
                    CPY.b #$0B                  
                    BNE   CODE_23800E           
                    LDA.b #$51                  
                    STA.w $1602                 
                    STZ.w $1604                 
                    LDA.b #$09                  
                    STA.w $1605                 
                    LDA.b #$2A                  
                    STA.w $1603                 
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$0E                  
                    STA.w $1600                 
                    RTL                         

CODE_238036:        LDX.b #$51                  
                    STX.w $1602                 
                    LDA.b #$52                  
                    STA.w $1603                 
                    STZ.w $1604                 
                    LDA.b #$01                  
                    STA.w $1605                 
                    LDA.w $0727                 
                    INC   A                     
                    ORA.b #$F0                  
                    STA.w $1606                 
                    STX.w $1608                 
                    LDA.b #$B4                  
                    STA.w $1609                 
                    STZ.w $160A                 
                    LDA.b #$03                  
                    STA.w $160B                 
                    LDA.w $1F4A                 
                    CMP.b #$AD                  
                    BNE   CODE_23806A           
                    LDA.b #$0E                  
CODE_23806A:        AND.b #$0F                  
                    ORA.b #$F0                  
                    STA.w $160C                 
                    LDA.w $1F4B                 
                    AND.b #$0F                  
                    ORA.b #$F0                  
                    STA.w $160E                 
                    LDA.b #$01                  
                    STA.w $1607                 
                    STA.w $160D                 
                    STA.w $160F                 
                    LDA.b #$FF                  
                    STA.w $1610                 
                    RTL                         

                    LDX.b #$80                  
                    STX.w $2115                 
                    STZ.w $4200                 
                    REP   #$30                  
                    LDA.w #$0840                
                    STA.w $2116                 
                    LDY.w #$0260                
                    LDA.w #$00FF                
CODE_2380A2:        STA.w $2118                 
                    DEY                         
                    BNE   CODE_2380A2           
                    SEP   #$30                  
                    RTL                         

CODE_2380AB:        JSL.l CODE_2382A3           
                    LDA.w $0729                 
                    CMP.b #$0D                  
                    BNE   CODE_23810B           
                    LDX.w $0727                 
                    LDY.w $8B03,x               
                    CPX.b #$04                  
                    BNE   CODE_2380C9           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    BEQ   CODE_2380C9           
                    LDY.b #$10                  
CODE_2380C9:        LDA.w $1F55                 
                    BEQ   CODE_2380D0           
                    LDY.b #$0E                  
CODE_2380D0:        LDA.w $1206                 
                    BPL   CODE_2380E0           
                    CMP.b #$F1                  
                    BEQ   CODE_2380E0           
                    CMP.b #$F2                  
                    BEQ   CODE_2380E0           
                    STY.w $1202                 
CODE_2380E0:        LDX.w $0726                 
                    LDA.b $49,x                 
                    BNE   CODE_238102           
                    LDA.l $7E3950,x             
                    CMP.b #$18                  
                    BEQ   CODE_2380F8           
                    LDA.l $7E3950,x             
                    INC   A                     
                    STA.l $7E3950,x             
CODE_2380F8:        LDA.b $17                   
                    BNE   CODE_238102           
                    LDA.b #$FF                  
                    STA.l $7E3950,x             
CODE_238102:        LDA.b $59                   
                    BEQ   CODE_23810B           
                    JSL.l CODE_29A833           
                    RTL                         

CODE_23810B:        LDA.w $0710                 
                    BEQ   CODE_238113           
                    JMP.w CODE_2381ED           

CODE_238113:        LDX.w $0726                 
                    LDA.b $49,x                 
                    BEQ   CODE_23811D           
                    JMP.w CODE_238226           

CODE_23811D:        LDA.w $0729                 
                    CMP.b #$0D                  
                    BEQ   CODE_238127           
                    JMP.w CODE_238226           

CODE_238127:        LDA.w $0349                 
                    BEQ   CODE_238132           
                    DEC.w $0349                 
                    JMP.w CODE_23818F           

CODE_238132:        LDA.w $0727                 
                    CMP.b #$08                  
                    BEQ   CODE_23818F           
                    LDA.w $028C                 
                    CMP.b #$01                  
                    BEQ   CODE_23818F           
                    CMP.b #$03                  
                    BEQ   CODE_23818F           
                    LDA.b $18                   
                    AND.b #$10                  
                    BEQ   CODE_23818F           
                    LDA.w $028C                 
                    BNE   CODE_238177           
                    LDA.w $0598                 
                    BEQ   CODE_238175           
                    LDA.b #$04                  
                    STA.w $0291                 
                    JSL.l CODE_2AF9A9           
                    LDA.b #$03                  
                    STA.w $0200                 
CODE_238162:        JSL.l CODE_2AFA63           
                    JSL.l CODE_20804D           
                    LDA.w $1050                 
                    BPL   CODE_238162           
                    STZ.w $1050                 
                    STZ.w $0293                 
CODE_238175:        BRA   CODE_238177           

CODE_238177:        JSL.l CODE_29EBB7           
                    LDA.w $0598                 
                    BEQ   CODE_23818F           
                    LDA.b #$13                  
                    STA.w $0208                 
                    LDA.b #$23                  
                    STA.w $0200                 
                    LDA.b #$33                  
                    STA.w $0202                 
CODE_23818F:        LDA.w $028C                 
                    BEQ   CODE_2381D1           
                    JSL.l CODE_29EBF7           
                    LDA.w $0598                 
                    BEQ   CODE_2381CF           
                    LDA.w $028C                 
                    BNE   CODE_2381CF           
                    LDA.b #$05                  
                    STA.w $0291                 
                    JSL.l CODE_2AF9A9           
                    LDA.w $0598                 
                    BEQ   CODE_2381BF           
                    LDA.b #$23                  
                    STA.w $0200                 
                    LDA.b #$03                  
                    STA.w $0201                 
                    LDA.b #$30                  
                    STA.w $0202                 
CODE_2381BF:        JSL.l CODE_2AFA63           
                    JSL.l CODE_20804D           
                    LDA.w $1050                 
                    BPL   CODE_2381BF           
                    STZ.w $1050                 
CODE_2381CF:        BRA   CODE_238226           

CODE_2381D1:        LDY.w $0726                 
                    LDA.w $F8,y               
                    ORA.b $18                   
                    AND.b #$40                  
                    BEQ   CODE_238226           
                    LDA.b #$1C                  
                    STA.w $1203                 
                    LDA.w $05F2                 
                    EOR.b #$01                  
                    STA.w $05F2                 
                    BRL   CODE_238C1B           

CODE_2381ED:        LDA.w $0417                 
                    BEQ   CODE_2381F9           
                    JSL.l CODE_238891           
                    BRL   CODE_238C1B           

CODE_2381F9:        LDY.b $25                   
                    LDA.w $0210                 
                    CLC                         
                    ADC.w $8AFF,y               
                    STA.w $0210                 
                    STA.b $B7                   
                    LDA.w $0211                 
                    ADC.w $8B01,y               
                    STA.w $0211                 
                    STA.b $12                   
                    JSL.l CODE_2097F5           
                    JSL.l CODE_209D5A           
                    JSL.l CODE_238DD7           
                    DEC.w $0710                 
                    DEC.w $0710                 
                    BEQ   CODE_23822B           
CODE_238226:        LDA.w $0417                 
                    BEQ   CODE_23823E           
CODE_23822B:        JSL.l CODE_238891           
                    JSL.l CODE_238C1B           
                    LDA.w $0417                 
                    BNE   CODE_23823E           
                    LDA.b #$01                  
                    STA.w $0728                 
                    RTL                         

CODE_23823E:        LDA.w $0500                 
                    BNE   CODE_238269           
                    LDY.b #$0D                  
CODE_238245:        LDA.w $1EED,y               
                    STA.w $0500,y               
                    LDA.w $1F09,y               
                    STA.w $051E,y               
                    LDA.w $1EFB,y               
                    STA.w $050F,y               
                    LDA.w $1F17,y               
                    CMP.b #$10                  
                    BCS   CODE_238266                   
                    LDA.w $0783,y               
                    AND.b #$03                  
                    STA.w $052D,y               
CODE_238266:        DEY                         
                    BPL   CODE_238245           
CODE_238269:        LDA.w $028C                 
                    BEQ   CODE_23826F           
                    RTL                         

CODE_23826F:        LDA.w $0729                 
                    JSL.l CODE_20FB3A           

POINTER_238276:     dl CODE_2382C5
                    dl CODE_238631
                    dl CODE_29AC7A
                    dl CODE_29ADFC
                    dl CODE_29AE52
                    dl CODE_29AEAA
                    dl CODE_23863B
                    dl CODE_29AF05
                    dl CODE_238652
                    dl CODE_29B17F
                    dl CODE_23863B
                    dl CODE_2387E4
                    dl CODE_23882E
                    dl CODE_238A4E
                    dl CODE_29A9AE

CODE_2382A3:        LDA.w $0727                 
                    CMP.b #$04                  
                    BNE   CODE_2382C4           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    BEQ   CODE_2382C4           
                    LDY.b #$07                  
CODE_2382B3:        LDA.w $8B0C,y               
                    STA.w $0850,y               
                    DEY                         
                    BPL   CODE_2382B3           
                    LDA.b #$02                  
                    STA.w $0A34                 
                    STA.w $0A35                 
CODE_2382C4:        RTL                         

CODE_2382C5:        LDA.w $0728                 
                    JSL.l CODE_20FB1F           

POINTER_2382CC:     dw CODE_2382D2
                    dw CODE_238338
                    dw CODE_2383D1

CODE_2382D2:        JSR.w CODE_238306
                    LDA.w $0711                 
                    BNE   CODE_2382E3           
                    LDA.b #$80                  
                    STA.w $0711                 
                    JSL.l CODE_2AF800           
CODE_2382E3:        DEC.w $0711                 
                    BNE   CODE_2382EE           
                    INC.w $0285                 
                    INC.w $0728                 
CODE_2382EE:        JSL.l CODE_2AF867           
                    RTL                         

CODE_2382F3:        LDA.w $0711                 
                    BNE   CODE_2382FD           
                    LDA.b #$80                  
                    STA.w $0711                 
CODE_2382FD:        DEC.w $0711                 
                    BNE   CODE_238305           
                    INC.w $0728                 
CODE_238305:        RTL                         

CODE_238306:        LDY.b #$03                  
CODE_238308:        LDA.w $8B14,y               
                    STA.w $0884,y               
                    DEY                         
                    BPL   CODE_238308           
                    LDX.w $0726                 
                    BEQ   CODE_238329           
                    LDY.b #$03                  
                    LDA.w $0884,y               
                    ORA.b #$01                  
                    STA.w $0884,y               
                    LDA.w $0747,x               
                    CLC                         
                    ADC.b #$07                  
                    TAY                         
                    BRA   CODE_23832C           

CODE_238329:        LDY.w $0747,x               
CODE_23832C:        LDA.w $8B18,y               
                    STA.w $0886                 
                    LDA.b #$02                  
                    STA.w $0A41                 
                    RTS                         

CODE_238338:        JSL.l CODE_2AF867           
                    RTL                         

                    LDA.b $20                   
                    BNE   CODE_23836A           
                    LDA.b $23                   
                    AND.b #$08                  
                    CLC                         
                    ADC.b #$34                  
                    STA.b $20                   
                    LDA.b $24                   
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $8200,y               
                    STA.b $2E                   
                    LDA.w $8201,y               
                    STA.b $2F                   
                    INC.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.b #$08                  
                    STA.b $9B                   
                    LDA.b #$02                  
                    STA.b $92                   
CODE_23836A:        REP   #$20                  
                    LDA.w #$20FF                
                    STA.w $1606                 
                    STA.w $160C                 
                    SEP   #$20                  
                    LDA.b #$11                  
                    STA.w $1602                 
                    STA.w $1608                 
                    LDA.b #$C0                  
                    STA.w $1604                 
                    STA.w $160A                 
                    LDA.b #$0E                  
                    STA.w $1605                 
                    STA.w $160B                 
                    LDX.b $9B                   
                    STX.w $1603                 
                    INX                         
                    STX.w $1609                 
                    LDA.b #$FF                  
                    STA.w $160E                 
                    LDX.b $20                   
                    INX                         
                    STX.b $20                   
                    TXA                         
                    AND.b #$01                  
                    BNE   CODE_2383B6           
                    LDX.b $9C                   
                    INX                         
                    TXA                         
                    AND.b #$07                  
                    BNE   CODE_2383B4           
                    LDA.b $9C                   
                    AND.b #$F0                  
                    TAX                         
CODE_2383B4:        STX.b $9C                   
CODE_2383B6:        LDX.b $9B                   
                    INX                         
                    INX                         
                    TXA                         
                    AND.b #$1F                  
                    BNE   CODE_2383C1           
                    LDX.b #$00                  
CODE_2383C1:        STX.b $9B                   
                    INC.b $9A                   
                    LDA.b $9A                   
                    CMP.b #$08                  
                    BNE   CODE_2383D0           
                    STZ.b $20                   
                    INC.w $0728                 
CODE_2383D0:        RTS                         

CODE_2383D1:        JSL.l CODE_29B9D1           
                    LDA.w $59                 
                    BNE   CODE_2383F1           
                    INC.w $0729                 
                    STZ.w $0728                 
                    JSR.w CODE_238C27           
                    LDA.w $0598                 
                    BEQ   CODE_2383F1           
                    LDA.b #$03                  
                    STA.w $0291                 
                    JSL.l CODE_2AF9A9           
CODE_2383F1:        RTL                         

CODE_2383F2:        LDA.w $0711                 
                    BNE   CODE_2383FC           
                    LDA.b #$10                  
                    STA.w $0711                 
CODE_2383FC:        JSL.l CODE_2382FD           
                    LDA.w $0711                 
                    BNE   CODE_238408           
                    STZ.w $0500                 
CODE_238408:        JSL.l CODE_238C1B           
                    RTL                         

CODE_23840D:        LDA.w $0728                 
                    JSL.l CODE_20FB3A           

POINTER_238414:     dl CODE_23842F
                    dl CODE_238441
                    dl CODE_238606
                    dl CODE_23860B
                    dl CODE_29AAFE
                    dl CODE_29ABE7
                    dl CODE_29AC4C
                    dl CODE_29AC61
                    dl CODE_2383F2

CODE_23842F:        DEC.w $02D8                 
                    BNE   CODE_23843A           
                    INC.w $0728                 
                    STZ.w $02DD                 
CODE_23843A:        JSL.l CODE_2AF867           
                    JMP.w CODE_2385B0           

CODE_238441:        LDA.w $02DD                 
                    BEQ   CODE_238452           
                    DEC.w $02DD                 
                    BNE   CODE_23844F           
                    JML.l CODE_0080DE           

CODE_23844F:        JMP.w CODE_238577           

CODE_238452:        JSL.l CODE_2AF867           
                    LDA.w $034D                 
                    BEQ   CODE_2384AD           
                    LDA.b $18                   
                    AND.b #$20                  
                    BEQ   CODE_238478           
                    LDA.b #$23                  
                    STA.w $1203                 
                    LDA.w $1DCB                 
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$88                  
                    BNE   CODE_238472           
                    LDA.b #$58                  
CODE_238472:        STA.w $1DCB                 
                    JMP.w CODE_238577           

CODE_238478:        LDA.b $18                   
                    AND.b #$0C                  
                    BEQ   CODE_2384E5           
                    LDX.b #$23                  
                    STX.w $1203                 
                    AND.b #$08                  
                    BEQ   CODE_238498           
                    LDA.w $1DCB                 
                    SEC                         
                    SBC.b #$10                  
                    CMP.b #$48                  
                    BNE   CODE_2384A7           
                    STZ.w $1203                 
                    LDA.b #$58                  
                    BRA   CODE_2384A7           

CODE_238498:        LDA.w $1DCB                 
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$88                  
                    BNE   CODE_2384A7           
                    STZ.w $1203                 
                    LDA.b #$78                  
CODE_2384A7:        STA.w $1DCB                 
                    JMP.w CODE_238577           

CODE_2384AD:        LDA.b $18                   
                    AND.b #$20                  
                    BEQ   CODE_2384C3           
                    LDA.b #$23                  
                    STA.w $1203                 
                    LDA.w $1DCB                 
                    EOR.b #$10                  
                    STA.w $1DCB                 
                    JMP.w CODE_238577           

CODE_2384C3:        LDA.b $18                   
                    AND.b #$0C                  
                    BEQ   CODE_2384E5           
                    LDX.b #$23                  
                    STX.w $1203                 
                    LDX.b #$60                  
                    AND.b #$08                  
                    BNE   CODE_2384D6           
                    LDX.b #$70                  
CODE_2384D6:        TXA                         
                    EOR.w $1DCB                 
                    BNE   CODE_2384DF           
                    STZ.w $1203                 
CODE_2384DF:        STX.w $1DCB                 
                    JMP.w CODE_238577           

CODE_2384E5:        LDA.b $18                   
                    AND.b #$10                  
                    BNE   CODE_2384EE           
                    JMP.w CODE_238577           

CODE_2384EE:        LDA.b #$01                  
                    STA.w $1203                 
                    LDX.b #$02                  
                    LDA.w $1DCB                 
                    CMP.b #$70                  
                    BCC   CODE_2384FE           
                    LDX.b #$09                  
CODE_2384FE:        STX.w $0728                 
                    STX.w $0285                 
                    LDA.w $1DCB                 
                    CMP.b #$68                  
                    BCC   CODE_23853E           
                    JSL.l CODE_238593           
                    LDA.w $034D                 
                    BEQ   CODE_23853E           
                    LDA.b #$3B                  
                    STA.w $1200                 
                    LDA.w $1DCB                 
                    CMP.b #$78                  
                    BNE   CODE_238525           
                    LDA.b #$F3                  
                    STA.w $1202                 
CODE_238525:        JSL.l CODE_00922D           
                    LDA.w $1DCB                 
                    CMP.b #$78                  
                    BNE   CODE_23853E           
                    LDA.b #$20                  
                    STA.w $02DD                 
                    LDA.b #$01                  
                    STA.w $0728                 
                    STZ.w $0285                 
                    RTL                         

CODE_23853E:        CPX.b #$09                  
                    BNE   CODE_238573           
                    STZ.w $0285                 
                    STZ.w $0202                 
                    STZ.w $0201                 
                    STZ.w $0200                 
                    STZ.w $0293                 
                    STZ.w $0291                 
                    STZ.w $020A                 
                    LDA.b #$03                  
                    STA.w $0208                 
                    LDA.w $072B                 
                    CMP.b #$02                  
                    BNE   CODE_238568           
                    LDA.w $034D                 
                    BEQ   CODE_2385D8           
CODE_238568:        STZ.w $0103                 
                    LDY.w $0726                 
                    LDA.b #$00                  
                    STA.w $073F,y               
CODE_238573:        LDA.b #$F0                  
                    STA.b $95                   
CODE_238577:        LDY.b #$0D                  
                    LDA.b #$F0                  
CODE_23857B:        STA.w $0500,y               
                    DEY                         
                    BPL   CODE_23857B           
                    LDA.b $18                   
                    AND.b #$2C                  
                    BNE   CODE_238590           
                    LDA.w $028F                 
                    AND.b #$10                  
                    BEQ   CODE_238593           
                    BRA   CODE_2385AD           

CODE_238590:        STZ.w $028F                 
CODE_238593:        LDA.w $1DCB                 
                    STA.w $0895                 
                    LDA.b #$73                  
                    STA.w $0896                 
                    LDA.b #$33                  
                    STA.w $0897                 
                    LDA.b #$4F                  
                    STA.w $0894                 
                    LDA.b #$00                  
                    STA.w $0A45                 
CODE_2385AD:        INC.w $028F                 
CODE_2385B0:        LDY.b #$03                  
CODE_2385B2:        LDA.w $8B26,y               
                    STA.w $0884,y               
                    DEY                         
                    BPL   CODE_2385B2           
                    LDA.w $034D                 
                    BNE   CODE_2385C5           
                    LDA.b #$42                  
                    STA.w $0885                 
CODE_2385C5:        LDA.w $0726                 
                    BEQ   CODE_2385D2           
                    LDA.b #$7E                  
                    STA.w $0886                 
                    INC.w $0887                 
CODE_2385D2:        LDA.b #$02                  
                    STA.w $0A41                 
                    RTL                         

CODE_2385D8:        PHX                         
                    LDX.w $0726                 
                    LDA.l $7E397D,x             
                    STA.l $7E3975,x             
                    LDA.l $7E397F,x             
                    STA.l $7E3977,x             
                    LDA.l $7E3981,x             
                    STA.l $7E3979,x             
                    LDA.l $7E3985,x             
                    STA.w $0722,x               
                    LDA.l $7E3987,x             
                    STA.w $0724,x               
                    PLX                         
                    JMP.w CODE_238573           

CODE_238606:        JSL.l CODE_2AF867           
                    RTL                         

CODE_23860B:        LDA.w $0711                 
                    BNE   CODE_238615           
                    LDA.b #$10                  
                    STA.w $0711                 
CODE_238615:        JSL.l CODE_2382F3           
                    LDA.w $0728                 
                    CMP.b #$04                  
                    BNE   CODE_23862C           
                    LDA.b $12                   
                    BNE   CODE_238629           
                    LDA.w $0210                 
                    BEQ   CODE_23862C           
CODE_238629:        INC.w $0728                 
CODE_23862C:        JSL.l CODE_238C1B           
                    RTL                         

CODE_238631:        LDA.b #$0D                  
                    STA.w $0729                 
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_23863B:        LDA.w $0711                 
                    BNE   CODE_238645           
                    LDA.b #$0E                  
                    STA.w $0711                 
CODE_238645:        DEC.w $0711                 
                    BNE   CODE_23864D           
                    INC.w $0729                 
CODE_23864D:        JSL.l CODE_238C1B           
                    RTL                         

CODE_238652:        LDA.b $20                   
                    BEQ   CODE_238659           
                    JMP.w CODE_238758           

CODE_238659:        LDA.w $0746                 
                    BNE   CODE_238661           
                    JMP.w CODE_238785           

CODE_238661:        LDA.w $0711                 
                    BNE   CODE_23866B           
                    LDA.b #$20                  
                    STA.w $0711                 
CODE_23866B:        JSL.l CODE_23878D           
                    LDA.w $0711                 
                    BEQ   CODE_238679           
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_238679:        DEC.w $0746                 
                    LDA.b #$15                  
                    STA.w $1203                 
                    LDY.w $0727                 
                    LDA.w $8C49,y               
                    CLC                         
                    ADC.w $0746                 
                    TAY                         
                    LDA.w $8C29,y               
                    STA.w $0746                 
                    LDA.b #$01                  
                    STA.b $20                   
                    LDY.w $1600                 
                    LDX.w $0746                 
                    LDA.w $8B2A,x               
                    STA.b $0A                   
                    STA.w $1602,y               
                    INY                         
                    LDA.w $8B3B,x               
                    STA.b $0B                   
                    STA.w $1602,y               
                    INY                         
                    LDA.b #$00                  
                    STA.w $1602,y               
                    INY                         
                    LDA.b #$03                  
                    STA.w $1602,y               
                    INY                         
                    LDA.w $0746                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w $8B6E,x               
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    LDA.w $8B70,x               
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    LDA.b $0A                   
                    CLC                         
                    ADC.w #$2000                
                    STA.b $0A                   
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    LDA.w #$0300                
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    LDA.w $8B72,x               
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    LDA.w $8B74,x               
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $1602,y               
                    STY.w $1600                 
                    LDA.w $0746                 
                    ASL   A                     
                    TAY                         
                    LDA.w $8B4C,y               
                    STA.b $0A                   
                    INY                         
                    LDA.w $8B4C,y               
                    STA.b $0B                   
                    LDY.b $0A                   
                    LDA.w $1D00,y               
                    AND.b $0B                   
                    BNE   CODE_238780           
                    LDA.w $1D00,y               
                    ORA.b $0B                   
                    STA.w $1D00,y               
                    LDA.w $1D40,y               
                    ORA.b $0B                   
                    STA.w $1D40,y               
                    LDX.w $0746                 
                    LDA.w $8C07,x               
                    AND.b #$0F                  
                    ASL   A                     
                    TAY                         
                    LDA.w $8200,y               
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $0D                   
                    LDA.w $8201,y               
                    ADC.b #$00                  
                    STA.b $0E                   
                    LDA.b #$7E                  
                    STA.b $0F                   
                    LDA.w $8C07,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.w $8BF6,x               
                    TAY                         
                    LDA.w $8C18,x               
                    STA.b [$0D],y               
CODE_238758:        LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_238766           
                    INC.b $20                   
                    LDA.b $20                   
                    CMP.b #$05                  
                    BEQ   CODE_238780           
CODE_238766:        LDY.w $0746                 
                    LDA.w $8BF6,y               
                    STA.b $00                   
                    LDA.w $8C07,y               
                    AND.b #$F0                  
                    STA.b $01                   
                    LDY.b $20                   
                    JSL.l CODE_29B11F           
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_238780:        STZ.w $0746                 
                    STZ.b $20                   
CODE_238785:        INC.w $0729                 
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_23878D:        LDA.w $0711                 
                    AND.b #$1F                  
                    BNE   CODE_2387B2           
                    LDA.b #$12                  
                    STA.w $0208                 
                    LDA.b #$01                  
                    STA.w $0209                 
                    LDA.b #$02                  
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    LDA.w $0598                 
                    BEQ   CODE_2387B2           
                    LDA.b #$01                  
                    STA.w $020B                 
CODE_2387B2:        LDA.w $0711                 
                    AND.b #$04                  
                    LSR   A                     
                    TAX                         
                    REP   #$20                  
                    LDA   DATA_2387E0,x             
                    STA.w $1300                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    DEC.w $0711                 
                    BNE   CODE_2387DF           
                    LDA.b #$17                  
                    STA.w $0208                 
                    STZ.w $0209                 
                    STZ.w $0203                 
                    STZ.w $0204                 
                    STZ.w $020B                 
CODE_2387DF:        RTL                         

DATA_2387E0:        db $00,$00,$FF,$7F

CODE_2387E4:        LDA.l $7E396D
                    BEQ   CODE_2387F4
                    LDA.b #$0C                  
                    STA.w $0729                 
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_2387F4:        JSL.l CODE_238C1B           
                    LDY.b #$0D                  
CODE_2387FA:        LDA.w $053C,y               
                    BNE   CODE_23882D           
                    DEY                         
                    BPL   CODE_2387FA           
                    LDA.b #$08                  
                    STA.w $053C                 
                    INC.w $0729                 
                    LDY.b #$0D                  
CODE_23880C:        LDA.w $0500,y               
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.w $1EED,y               
                    LDA.w $050F,y               
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.w $1EFB,y               
                    LDA.w $051E,y               
                    ADC.b #$00                  
                    STA.w $1F09,y               
                    DEY                         
                    BPL   CODE_23880C           
CODE_23882D:        RTL                         

CODE_23882E:        LDA.w $0711                 
                    BNE   CODE_238838           
                    LDA.b #$08                  
                    STA.w $0711                 
CODE_238838:        DEC.w $0711                 
                    BNE   CODE_23887F           
                    LDX.w $0726                 
                    STZ.b $F2                   
                    STZ.b $F6                   
                    STZ.b $F3                   
                    STZ.b $F7                   
                    LDA.b #$FF                  
                    STA.l $7E3950,x             
                    LDA.l $7E396D               
                    BNE   CODE_238879           
                    LDA.w $0727                 
                    CMP.b #$02                  
                    BNE   CODE_238863           
                    LDA.w $07BC                 
                    EOR.b #$01                  
                    STA.w $07BC                 
CODE_238863:        LDA.w $072B                 
                    CMP.b #$01                  
                    BEQ   CODE_238879           
                    LDX.w $0726                 
                    LDA.b #$01                  
                    STA.w $073F,x               
                    LDA.b #$0F                  
                    STA.w $0729                 
                    BRA   CODE_23887F           
CODE_238879:        INC.w $0729                 
                    STZ.w $0728                 
CODE_23887F:        JSL.l CODE_238C1B           
                    RTL                         

                    LDA.w $0728                 
                    JSL.l CODE_20FB3A           

POINTER_23888B:     dl CODE_238A0E
                    dl CODE_238A4E

CODE_238891:        LDA.w $0417                 
                    JSL.l CODE_20FB1F           

POINTER_238898:     dw CODE_2388A6
                    dw CODE_2388A6
                    dw CODE_238922
                    dw CODE_238922
                    dw CODE_238951
                    dw CODE_238956
                    dw CODE_2389FE

CODE_2388A6:        LDX.b $20                   
                    LDA.b $24
                    CLC                         
                    ADC.w $8C5A,x               
                    PHA                         
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $8200,y               
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $2E                   
                    LDA.w $8201,y               
                    ADC.b #$00                  
                    STA.b $2F                   
                    PLA                         
                    AND.b #$0F                  
                    STA.b $04                   
                    LDX.b #$00                  
                    LDA.b $20                   
                    AND.b #$01                  
                    BEQ   CODE_2388D3           
                    LDX.b #$06                  
CODE_2388D3:        LDY.b $04                   
                    LDA.b [$2E],y               
                    AND.b #$C0                  
                    STA.b $00                   
                    INY                         
                    LDA.b [$2E],y               
                    AND.b #$C0                  
                    STA.b $01                   
                    TYA                         
                    CLC                         
                    ADC.b #$0F                  
                    TAY                         
                    LDA.b [$2E],y               
                    AND.b #$C0                  
                    STA.b $02                   
                    INY                         
                    LDA.b [$2E],y               
                    AND.b #$C0                  
                    STA.b $03                   
                    LDA.b $00                   
                    LSR   A                     
                    LSR   A                     
                    ORA.b $01                   
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    LSR   A                     
                    LSR   A                     
                    ORA.b $03                   
                    STA.w $1EC0,x               
                    INX                         
                    LDA.b $04                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $04                   
                    AND.b #$F0                  
                    CMP.b #$C0                  
                    BNE   CODE_2388D3           
                    INC.b $20                   
                    LDA.b $20                   
                    AND.b #$01                  
                    BNE   CODE_23891F           
                    LDA.b #$00                  
                    STA.b $20                   
CODE_23891F:        JMP.w CODE_23894C           

CODE_238922:        LDA.w $0417                 
                    CMP.b #$02                  
                    BNE   CODE_23893D           
                    LDY.b #$12                  
                    INC.b $20                   
                    LDA.b $20                   
                    CMP.b #$04                  
                    BNE   CODE_23893A           
                    LDA.b #$00                  
                    STA.b $20                   
                    INC.w $0417                 
CODE_23893A:        JMP.w CODE_23894C           

CODE_23893D:        INC.b $20                   
                    LDA.b $20                   
                    AND.b #$01                  
                    BNE   CODE_23894C           
                    LDA.b #$00                  
                    STA.w $0417                 
                    STA.b $20                   
CODE_23894C:        JSL.l CODE_238DD7           
                    RTL                         

CODE_238951:        STZ.b $20                   
                    INC.w $0417                 
CODE_238956:        LDY.b $20                   
                    LDA.b $24                   
                    CLC                         
                    ADC.w $8C97,y               
                    STA.b $24                   
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $8200,y               
                    STA.b $2E                   
                    LDA.w $8201,y               
                    STA.b $2F                   
                    INC.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.b $24                   
                    AND.b #$0F                  
                    STA.b $00                   
                    LDX.b #$00                  
CODE_23897E:        LDA.w $070A                 
                    ASL   A                     
                    TAY                         
                    LDA.w $CE5A,y               
                    STA.b $0D                   
                    LDA.w $CE5B,y               
                    STA.b $0E                   
                    LDY.w $070A                 
                    LDA.w $CE80,y               
                    STA.b $0F                   
                    LDY.b $00                   
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
                    LDA.b $20                   
                    AND.w #$0001                
                    BNE   CODE_2389B2           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_2389B2:        LDA.b [$0D],y               
                    STA.w $03C2,x               
                    INY                         
                    INY                         
                    LDA.b [$0D],y               
                    STA.w $03C4,x               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    SEP   #$30                  
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    AND.b #$F0                  
                    CMP.b #$B0                  
                    BNE   CODE_23897E           
                    LDA.b $24                   
                    AND.b #$0F                  
                    ASL   A                     
                    TAY                         
                    LDA.b $20                   
                    AND.b #$01                  
                    BNE   CODE_2389DE           
                    INY                         
CODE_2389DE:        STY.w $0381                 
                    LDX.b #$00                  
                    LDA.b $24                   
                    AND.b #$10                  
                    BEQ   CODE_2389EB           
                    LDX.b #$04                  
CODE_2389EB:        STX.w $0380                 
                    INC.b $20                   
                    LDA.b $20                   
                    CMP.b #$04                  
                    BNE   CODE_2389FB           
                    STZ.b $20                   
                    INC.w $0417                 
CODE_2389FB:        JMP.w CODE_23894C           

CODE_2389FE:        INC.b $20                   
                    LDA.b $20                   
                    AND.b #$01                  
                    BNE   CODE_238A0B           
                    STZ.w $0417                 
                    STZ.b $20                   
CODE_238A0B:        JMP.w CODE_23894C           

CODE_238A0E:        INC.w $0728                 
                    JSL.l CODE_238C1B           
                    RTL                         

                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.w $072C                 
                    STA.l $7E3994               
                    STA.w $073D,x               
                    STA.w $070F                 
                    JSL.l CODE_238C1B           
                    RTS                         

                    LDA.b #$03                  
                    STA.w $0713                 
                    LDA.b #$80                  
                    STA.w $0711                 
                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.w $072C                 
                    STA.l $7E3994               
                    STA.w $073D,x               
                    INC.w $0728                 
                    JSL.l CODE_238C1B           
                    RTS                         

CODE_238A4E:        LDA.b #$00                  
                    STA.l $7E396D               
                    STA.l $7E3972               
                    LDX.w $0726                 
                    LDA.b $49,x                 
                    BEQ   CODE_238A62           
                    JMP.w CODE_238BD5           

CODE_238A62:        LDA.w $0710                 
                    BEQ   CODE_238A6A           
                    BRL   CODE_238B9D           

CODE_238A6A:        LDA.b $18                   
                    AND.b #$0F                  
                    BEQ   CODE_238A75           
                    LDA.b #$01                  
                    STA.w $1200                 
CODE_238A75:        JSL.l CODE_238DD8           
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDA.b $B3                   
                    CMP.w $1E9A,y               
                    BCC   CODE_238A9F           
                    LDA.b $17                   
                    AND.b #$0F                  
                    BEQ   CODE_238A9F           
                    LDY.b #$03                  
CODE_238A8F:        CMP.w $8DB4,y               
                    BEQ   CODE_238A97           
                    DEY                         
                    BNE   CODE_238A8F           
CODE_238A97:        LDA.w $1DD5                 
                    CMP.w $8DB8,y               
                    BNE   CODE_238AA2           
CODE_238A9F:        BRL   CODE_238B1A           

CODE_238AA2:        LDA.w $1DD5                 
                    PHA                         
                    JSR.w CODE_238E15           
                    PLA                         
                    STA.w $1DD5                 
                    LDA.w $1203                 
                    BEQ   CODE_238B17           
                    LDA.w $0429                 
                    CMP.b #$07                  
                    BEQ   CODE_238ACB           
                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.b $49,x                 
                    STA.w $1203                 
                    LDA.b #$01                  
                    STA.w $1200                 
                    JMP.w CODE_238B27           

CODE_238ACB:        LDA.b $03                   
                    AND.b #$0F                  
                    STA.w $1DD5                 
                    LDX.w $0726                 
                    LDA.w $0747,x               
                    STA.w $0429                 
                    REP   #$30                  
                    LDA.w $0429                 
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $D8                   
                    LDA   DATA_29C81D,x             
                    AND.w #$00FF                
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    LDA   DATA_29C7E3,x             
                    PHB                         
                    TAX                         
                    LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    LDX.w #$001E                
CODE_238B05:        LDA.w $14E0,x               
                    STA.l $7FC500,x             
                    DEX                         
                    DEX                         
                    BPL   CODE_238B05           
                    SEP   #$30                  
                    LDA.b #$01                  
                    STA.w $1500                 
CODE_238B17:        JMP.w CODE_238B1D           

CODE_238B1A:        JSR.w CODE_238E15           
CODE_238B1D:        LDX.w $0726                 
                    LDA.b $49,x                 
                    BEQ   CODE_238B27           
                    JMP.w CODE_238BD5           

CODE_238B27:        LDA.b $B3                   
                    CMP.b #$BC                  
                    BNE   CODE_238B3C           
                    LDX.w $0726                 
                    LDA.b $F8,x                 
                    BMI   CODE_238B4D           
                    LDA.b $F6,x                 
                    AND.b #$80                  
                    BNE   CODE_238B4D           
                    BRA   CODE_238B4A           

CODE_238B3C:        LDA.b $F8                   
                    ORA.b $F9                   
                    BMI   CODE_238B4D           
                    LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$80                  
                    BNE   CODE_238B4D           
CODE_238B4A:        JMP.w CODE_238BD0           

CODE_238B4D:        LDA.w $072B                 
                    CMP.b #$02                  
                    BNE   CODE_238BA7           
                    LDX.w $0726                 
                    TXA                         
                    EOR.b #$01                  
                    TAY                         
                    LDA.w $0736,y               
                    CMP.b #$FF                  
                    BEQ   CODE_238BA7           
                    LDA.b $45,x                 
                    CMP.w $0045,y               
                    BNE   CODE_238BA7           
                    LDA.b $43,x                 
                    CMP.w $0043,y               
                    BNE   CODE_238BA7           
                    LDA.b $47,x                 
                    CMP.w $0047,y               
                    BNE   CODE_238BA7           
                    LDA.l $701FF4               
                    BNE   CODE_238BA2           
                    LDA.l $701FF6               
                    CMP.b #$02                  
                    BNE   CODE_238BA2           
                    LDA.b #$12                  
                    STA.b $1D                   
CODE_238B89:        LDA.b #$10                  
                    STA.w $0729                 
CODE_238B8E:        LDX.w $0726                 
                    LDA.b #$00                  
                    STA.w $073F,x               
                    STA.w $0728                 
                    STA.l $7E396D               
CODE_238B9D:        JSL.l CODE_238C1B           
                    RTL                         

CODE_238BA2:        LDA.b #$2A                  
                    STA.w $1203                 
CODE_238BA7:        LDX.w $0726                 
                    LDA.b $F8,x                 
                    BMI   CODE_238BB4           
                    LDA.b $18                   
                    AND.b #$80                  
                    BEQ   CODE_238BD0           
CODE_238BB4:        LDA.b $B3                   
                    LDY.b #$0A                  
CODE_238BB8:        CMP.w $8CD9,y               
                    BEQ   CODE_238B89           
                    DEY                         
                    BPL   CODE_238BB8           
                    LDA.b $B3                   
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDA.b $B3                   
                    CMP.w $1E9A,y               
                    BCS   CODE_238B89                   
CODE_238BD0:        JSL.l CODE_238C1B           
                    RTL                         

CODE_238BD5:        DEC.b $49,x                 
                    DEC.b $49,x                 
                    LDA.b $4B,x                 
                    LDY.w $0597                 
                    BEQ   CODE_238BE5           
                    CLC                         
                    ADC.b #$1B                  
                    INC.b $49,x                 
CODE_238BE5:        TAY                         
                    LDA.b $43,x                 
                    CLC                         
                    ADC.w $8C9B,y               
                    STA.b $43,x                 
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $8CA4,y               
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    ADC.w $8CAD,y               
                    STA.b $45,x                 
                    LDA.b $49,x                 
                    AND.b #$1F                  
                    BNE   CODE_238C1B           
                    JSL.l CODE_238DD8           
                    CMP.b #$E6                  
                    BNE   CODE_238C1B           
                    LDX.w $0726                 
                    LDA.w $0783,x               
                    AND.b #$01                  
                    BNE   CODE_238C1B           
                    INC.w $0729                 
                    JMP.w CODE_238B8E           

CODE_238C1B:        LDY.w $0726                 
                    LDA.w $52,y               
                    STA.b $02                   
                    JSR.w CODE_238C27           
                    RTL                         

CODE_238C27:        LDX.w $0726                 
                    LDA.b $43,x                 
                    CMP.b #$F0                  
                    BEQ   CODE_238C39           
                    STA.w $0889                 
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0885                 
CODE_238C39:        LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0884                 
                    STA.w $0888                 
                    LDA.w $0429                 
                    ASL   A                     
                    TAX                         
                    LDA.b $15                   
                    AND.b #$08                  
                    BEQ   CODE_238C55           
                    TXA                         
                    CLC                         
                    ADC.b #$12                  
                    TAX                         
CODE_238C55:        LDA.w $0726                 
                    BEQ   CODE_238C6A           
                    LDA.w $8D54,x               
                    ORA.b #$01                  
                    STA.w $0887                 
                    LDA.w $8D30,x               
                    STA.w $0886                 
                    BRA   CODE_238C76           

CODE_238C6A:        LDA.w $8D54,x               
                    STA.w $0887                 
                    LDA.w $8D0C,x               
                    STA.w $0886                 
CODE_238C76:        LDA.w $0726                 
                    BEQ   CODE_238C8B           
                    LDA.w $8D31,x               
                    STA.w $088A                 
                    LDA.w $8D55,x               
                    ORA.b #$01                  
                    STA.w $088B                 
                    BRA   CODE_238C97           

CODE_238C8B:        LDA.w $8D0D,x               
                    STA.w $088A                 
                    LDA.w $8D55,x               
                    STA.w $088B                 
CODE_238C97:        LDA.w $0428                 
                    BEQ   CODE_238CAD           
                    DEC.w $02C6                 
                    BPL   CODE_238CA9           
                    LDA.b #$03                  
                    STA.w $02C6                 
                    INC.w $02C7                 
CODE_238CA9:        JSL.l CODE_29CDB2           
CODE_238CAD:        LDA.b #$02                  
                    STA.w $0A41                 
                    STA.w $0A42                 
                    LDA.w $0886                 
                    CMP.b #$26                  
                    BNE   CODE_238CC1           
                    LDA.b #$F0                  
                    STA.w $0885                 
CODE_238CC1:        LDX.w $0726                 
                    LDA.w $5A,x               
                    BNE   CODE_238CEE           
                    LDA.w $0729                 
                    CMP.b #$06                  
                    BCC   CODE_238D02           
                    CMP.b #$0D                  
                    BCC   CODE_238CD8           
                    CMP.b #$0F                  
                    BNE   CODE_238D02           
CODE_238CD8:        LDX.w $0726                 
                    LDA.w $8D78,x               
                    STA.w $088A                 
                    LDA.w $8D7A,x               
                    STA.w $088B                 
                    LDA.b #$F0                  
                    STA.w $0885                 
                    BRA   CODE_238D02           

CODE_238CEE:        DEC.b $64                   
                    LDA.b $64                   
                    AND.b #$06                  
                    LSR   A                     
                    TAY                         
                    LDA.w $8D80,y               
                    STA.w $088A                 
                    LDA.w $8D84,y               
                    STA.w $088B                 
CODE_238D02:        LDA.w $0729                 
                    CMP.b #$02                  
                    BEQ   CODE_238D15           
                    LDX.w $0726                 
                    LDA.w $073F,x               
                    BNE   CODE_238D53           
                    LDA.b $59                   
                    BNE   CODE_238D53           
CODE_238D15:        LDA.w $0710                 
                    BNE   CODE_238D53           
                    LDA.w $0727                 
                    CMP.b #$07                  
                    BEQ   CODE_238D53           
                    CMP.b #$04                  
                    BEQ   CODE_238D53           
                    LDA.w $0884                 
                    CMP.b #$D0                  
                    BCC   CODE_238D3A           
                    LDY.w $0727                 
                    LDA.b $23                   
                    CMP.w $8D04,y               
                    BEQ   CODE_238D53           
                    LDX.b #$00                  
                    BRA   CODE_238D47           

CODE_238D3A:        LDA.b $24                   
                    BEQ   CODE_238D53           
                    LDA.w $0884                 
                    CMP.b #$21                  
                    BCS   CODE_238D53                   
                    LDX.b #$01                  
CODE_238D47:        STX.b $25                   
                    LDA.b #$80                  
                    STA.w $0710                 
                    LDA.b #$04                  
                    STA.w $0417                 
CODE_238D53:        LDA.w $072B                 
                    CMP.b #$01                  
                    BEQ   CODE_238D9E           
                    LDA.w $0727                 
                    CMP.b #$08                  
                    BEQ   CODE_238D9E           
                    LDA.w $0726                 
                    EOR.b #$01                  
                    TAX                         
                    LDA.w $0736,x               
                    BMI   CODE_238D9E           
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    BEQ   CODE_238D9E           
                    LDA.b $45,x                 
                    SBC.b #$00                  
                    CMP.b $12                   
                    BNE   CODE_238D9E           
                    LDA.b $43,x                 
                    STA.w $0895                 
                    LDA.w $8D78,x               
                    STA.w $0896                 
                    LDA.w $8D7A,x               
                    STA.w $0897                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    SEC                         
                    SBC.b #$04                  
                    STA.w $0894                 
                    LDA.b #$02                  
                    STA.w $0A45                 
CODE_238D9E:        LDA.w $0729                 
                    CMP.b #$01                  
                    BCC   CODE_238DA9           
                    JSL.l CODE_29B7AE           
CODE_238DA9:        LDA.w $0727                 
                    CMP.b #$08                  
                    BNE   CODE_238DB3           
                    JSR.w CODE_238DB4           
CODE_238DB3:        RTS                         

CODE_238DB4:        LDY.b #$1B                  
CODE_238DB6:        LDA.w $8D98,y               
                    STA.w $0898,y               
                    DEY                         
                    BPL   CODE_238DB6           
                    LDA.b #$00                  
                    STA.w $0A46                 
                    STA.w $0A47                 
                    STA.w $0A48                 
                    STA.w $0A49                 
                    STA.w $0A4A                 
                    STA.w $0A4B                 
                    STA.w $0A4C                 
                    RTS                         

CODE_238DD7:        RTL                         

CODE_238DD8:        LDX.w $0726                 
                    LDA.b $45,x                 
                    ASL   A                     
                    TAY                         
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.w $8200,y               
                    STA.b $2E                   
                    LDA.w $8201,y               
                    INC   A                     
                    STA.b $2F                   
                    LDA.b $47,x                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    LDA.b $43,x                 
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$F0                  
                    ORA.b $00                   
                    TAY                         
                    LDA.b [$2E],y               
                    STA.b $B3                   
                    RTL                         

                    LDX.w $0726                 
                    LDA.b $4B,x                 
                    EOR.b #$03                  
                    CMP.b #$03                  
                    BNE   CODE_238E12           
                    EOR.b #$0F                  
CODE_238E12:        STA.b $4B,x                 
                    RTS                         

CODE_238E15:        LDA.b $17                   
                    STA.b $03                   
                    LDA.w $0597                 
                    BNE   CODE_238E2C           
                    LDX.w $0726                 
                    LDA.l $7E3950,x             
                    BEQ   CODE_238E2C           
                    CMP.b #$18                  
                    BEQ   CODE_238E2C           
                    RTS                         

CODE_238E2C:        LDY.b #$03                  
                    LDA.b $03                   
                    AND.b #$0F                  
CODE_238E32:        CMP.w $8DB4,y               
                    BEQ   CODE_238E3B           
                    DEY                         
                    BPL   CODE_238E32           
                    RTS                         

CODE_238E3B:        LDY.b #$00                  
CODE_238E3D:        LSR   A                     
                    BCS   CODE_238E43                   
                    INY                         
                    BNE   CODE_238E3D           
CODE_238E43:        TYA                         
                    STA.b $04                   
                    ASL   A                     
                    TAX                         
                    LDA.w $8DBC,x               
                    STA.b $00                   
                    LDA.w $8DBD,x               
                    STA.b $01                   
                    LDA.b #$21                  
                    STA.b $02                   
                    JSL.l CODE_238EFC           
                    LDY.b #$08                  
CODE_238E5C:        CMP.b [$00],y               
                    BEQ   CODE_238ED1           
                    DEY                         
                    BPL   CODE_238E5C           
                    LDY.w $0597                 
                    BEQ   CODE_238E7C           
                    CMP.b #$4B                  
                    BNE   CODE_238E73           
                    LDA.b #$00                  
                    STA.w $0597                 
                    BEQ   CODE_238ECD           
CODE_238E73:        CMP.b #$82                  
                    BCC   CODE_238EAB           
                    CMP.b #$AA                  
                    BCC   CODE_238ECD           
                    RTS                         

CODE_238E7C:        LDY.w $00B3                 
                    CPY.b #$4B                  
                    BNE   CODE_238EAB           
                    LDY.b $04                   
                    LDX.w $0726                 
                    LDA.b $43,x                 
                    CLC                         
                    ADC.w $8DF0,y               
                    STA.b $00                   
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $8DF4,y               
                    STA.b $01                   
                    LDA.b $45,x                 
                    ADC.w $8DF8,y               
                    STA.b $04                   
                    LDX.b #$0D                  
CODE_238EA1:        LDY.w $1F17,x               
                    CPY.b #$10                  
                    BEQ   CODE_238EB8           
                    DEX                         
                    BNE   CODE_238EA1           
CODE_238EAB:        LDA.w $18                 
                    AND.b #$0F                  
                    BEQ   CODE_238EB7           
                    LDA.b #$01                  
                    STA.w $1200                 
CODE_238EB7:        RTS                         

CODE_238EB8:        LDY.w $0500,x               
                    CPY.b $00                   
                    BNE   CODE_238EAB           
                    LDY.w $050F,x               
                    CPY.b $01                   
                    BNE   CODE_238EAB           
                    LDY.w $051E,x               
                    CPY.b $04                   
                    BNE   CODE_238EAB           
CODE_238ECD:        LDA.b #$10                  
                    BNE   CODE_238EE2           
CODE_238ED1:        LDY.b $04                   
                    CMP.w $8DE8,y               
                    BNE   CODE_238EE0           
                    LDA.w $07BC                 
                    CMP.w $8DEC,y               
                    BNE   CODE_238EF8           
CODE_238EE0:        LDA.b #$20                  
CODE_238EE2:        LDX.w $0726                 
                    STA.b $49,x                 
                    LDA.b $03                   
                    AND.b #$0F                  
                    STA.b $4B,x                 
                    STA.w $1DD5                 
                    LDX.b #$23                  
                    STX.w $1203                 
                    STZ.w $1200                 
CODE_238EF8:        RTS                         

DATA_238EF9:        db $AA,$AF,$B7

CODE_238EFC:        LDX.w $0726
                    LDA.b $43,x
                    CLC
                    ADC.w $8DFC,y               
                    AND.b #$F0                  
                    STA.b $0E                   
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $8E04,y               
                    STA.b $0F                   
                    LDA.b $45,x                 
                    ADC.w $8E00,y               
                    ASL   A                     
                    TAX                         
                    LDA.w $8200,x               
                    STA.b $2E                   
                    STA.b $D8                   
                    LDA.w $8201,x               
                    INC   A                     
                    STA.b $2F                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    STA.b $DA                   
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $0E                   
                    TAY                         
                    PHX                         
                    LDA.b [$2E],y               
                    TAX                         
                    PHA                         
                    LDA.b [$D8],y               
                    BEQ   CODE_238F48           
                    PLA                         
                    LDA   DATA_238EF9,x             
                    PHA                         
CODE_238F48:        PLA                         
                    PLX                         
                    RTL                         

                    STA.w $1059                 
                    STY.w $1058                 
                    STX.w $105B                 
                    LDY.b #$00                  
                    LDX.b #$00                  
                    LDA.w $105B                 
                    AND.b #$03                  
                    BEQ   CODE_238F85           
                    LDY.b #$86                  
                    STY.b $02                   
                    AND.b #$02                  
                    BNE   CODE_238F68           
                    INX                         
CODE_238F68:        LDA.w $105E                 
                    BEQ   CODE_238F6F           
                    INX                         
                    INX                         
CODE_238F6F:        LDA.w $1059                 
                    CLC                         
                    ADC.w $8E08,x               
                    STA.w $105C                 
                    LDA.w $1058                 
                    SEC                         
                    SBC.b #$10                  
                    STA.w $105D                 
                    JMP.w CODE_238FAD           

CODE_238F85:        LDY.b #$06                  
                    STY.b $02                   
                    LDX.b #$00                  
                    LDA.w $105B                 
                    AND.b #$08                  
                    BNE   CODE_238F93           
                    INX                         
CODE_238F93:        LDA.w $105E                 
                    BEQ   CODE_238F9A           
                    INX                         
                    INX                         
CODE_238F9A:        LDA.w $1058                 
                    CLC                         
                    ADC.w $8E0C,x               
                    STA.w $105D                 
                    LDA.w $1059                 
                    SEC                         
                    SBC.b #$10                  
                    STA.w $105C                 
CODE_238FAD:        LDA.w $105D                 
                    SEC                         
                    SBC.b #$10                  
                    LDX.w $105C                 
                    JSR.w CODE_2390AA           
                    LDA.b $0E                   
                    STA.w $1047                 
                    LDA.b $0F                   
                    STA.w $104B                 
                    JSR.w CODE_239052           
                    LDA.w $1047                 
                    STA.w $1051                 
                    LDA.w $104B                 
                    STA.w $1053                 
                    JSR.w CODE_238FDE           
                    LDA.b #$FF                  
                    STA.w $1602,y               
                    STY.w $1600                 
                    RTL                         

CODE_238FDE:        LDA.w $105B                 
                    AND.b #$03                  
                    BNE   CODE_238FEA           
                    LDA.b #$01                  
                    TAX                         
                    BNE   CODE_238FEE           
CODE_238FEA:        LDA.b #$20                  
                    LDX.b #$10                  
CODE_238FEE:        STA.b $05                   
                    STX.b $06                   
                    LDY.w $1600                 
                    LDX.b #$05                  
                    LDA.w $1051                 
                    STA.w $1602,y               
                    INY                         
                    LDA.w $1053                 
                    STA.w $1602,y               
                    INY                         
                    LDA.b $02                   
                    AND.b #$C0                  
                    STA.w $1602,y               
                    INY                         
                    LDA.b $02                   
                    AND.b #$3F                  
                    ASL   A                     
                    DEC   A                     
                    STA.w $1602,y               
                    INY                         
CODE_239017:        LDA.w $105E                 
                    BEQ   CODE_239025           
                    LDA.b #$00                  
                    STA.w $1603,y               
                    LDA.b #$FF                  
                    BNE   CODE_23902A           
CODE_239025:        JSR.w CODE_239068           
                    BRA   CODE_23902D           

CODE_23902A:        STA.w $1602,y               
CODE_23902D:        INY                         
                    INY                         
                    LDA.w $1053                 
                    CLC                         
                    ADC.b $05                   
                    STA.w $1053                 
                    LDA.w $1051                 
                    ADC.b #$00                  
                    STA.w $1051                 
                    TXA                         
                    AND.b #$01                  
                    BNE   CODE_23904E           
                    LDA.w $105A                 
                    CLC                         
                    ADC.b $06                   
                    STA.w $105A                 
CODE_23904E:        DEX                         
                    BPL   CODE_239017           
                    RTS                         

CODE_239052:        LDA.w $105D                 
                    AND.b #$F0                  
                    STA.w $105A                 
                    LDA.w $105C                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.w $105A                 
                    STA.w $105A                 
                    RTS                         

CODE_239068:        STY.b $01                   
                    STX.b $04                   
                    JSR.w CODE_2390C9           
                    LDX.w $105A                 
                    LDA.l $7E2450,x             
                    STA.b $0A                   
                    JSL.l CODE_209F37           
                    REP   #$30                  
                    LDA.b $02                   
                    PHA                         
                    LDA.w $1055                 
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $02                   
                    LDA.b $01                   
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $02                   
                    TAY                         
                    LDA.b [$0C],y               
                    STA.w $1602,x               
                    PLA                         
                    STA.b $02                   
                    SEP   #$30                  
                    LDY.b $01                   
                    LDX.b $04                   
                    RTS                         

CODE_2390AA:        ASL   A                     
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
                    AND.b #$E0                  
                    ORA.b $0D                   
                    STA.b $0F                   
                    RTS                         

CODE_2390C9:        LDA.w $1053                 
                    AND.b #$01                  
                    STA.w $1055                 
                    LDA.w $1053                 
                    AND.b #$20                  
                    BNE   CODE_2390DD           
                    ASL.w $1055                 
                    BRA   CODE_2390E1           
CODE_2390DD:        SEC                         
                    ROL.w $1055                 
CODE_2390E1:        RTS                         

                    LDY.w $8E34,x               
                    LDX.b #$04                  
                    REP   #$20                  
CODE_2390E9:        LDA.w $8E10,y               
                    STA.w $1402,x               
                    DEY                         
                    DEY                         
                    DEX                         
                    DEX                         
                    BPL   CODE_2390E9           
                    LDA.w #$0001                
                    STA.w $1500                 
                    RTS                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF

CODE_239110:        LDX.b #$00                ;0 S:01FF P:EnvMXdIzc HC:15022 VC:000 FC:00 I:00
CODE_239112:        LDA.b #$09                ;0 S:01FF P:EnvMXdIzc HC:15038 VC:000 FC:00 I:00
                    JSL.l CODE_2098A8         ;0 S:01FF P:EnvMXdIzc HC:15054 VC:000 FC:00 I:00
                    JSL.l CODE_209844         ;0 S:01FF P:EnvMXdIzc HC:15070 VC:000 FC:00 I:00
                    CPX.b #$40                ;0 S:01FF P:EnvMXdIzc HC:15086 VC:000 FC:00 I:00
                    BNE   CODE_239112         ;0 S:01FF P:EnvMXdIzc HC:15102 VC:000 FC:00 I:00
CODE_239120:        LDA.b #$40                ;0 S:01FF P:EnvMXdIzc HC:15118 VC:000 FC:00 I:00
                    JSL.l CODE_2098A8         ;0 S:01FF P:EnvMXdIzc HC:15134 VC:000 FC:00 I:00
                    LDA.b #$09                ;0 S:01FF P:EnvMXdIzc HC:15150 VC:000 FC:00 I:00
                    JSL.l CODE_209844         ;0 S:01FF P:EnvMXdIzc HC:15166 VC:000 FC:00 I:00
                    CPX.b #$F0                ;0 S:01FF P:EnvMXdIzc HC:15182 VC:000 FC:00 I:00
                    BNE   CODE_239120         ;0 S:01FF P:EnvMXdIzc HC:15198 VC:000 FC:00 I:00
                    JSL.l CODE_20990B         ;0 S:01FF P:EnvMXdIzc HC:15214 VC:000 FC:00 I:00
                    RTL                       ;

CODE_239135:        JSR.w CODE_239139           
                    RTL                         

CODE_239139:        LDA.w $0706                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    DEX                         
                    TXA                         
                    JSL.l CODE_20FB3A           

POINTER_239147:     dl CODE_2392D2

CODE_23914A:        JSR.w CODE_23914E
                    RTL

CODE_23914E:        LDA.w $0706                 
                    JSL.l CODE_20FB3A           

POINTER_239155:     dl CODE_2391EF
                    dl CODE_23922C
                    dl CODE_23924F
                    dl CODE_23928C
                    dl CODE_23916A
                    dl CODE_2391AF
                    dl CODE_2392AF

CODE_23916A:        LDA.b #$00                  
                    STA.b $00                   
CODE_23916E:        LDX.b $00                   
                    LDA.w $96B9,x               
                    STA.b $01                   
                    LDA.w $96BA,x               
                    STA.b $02                   
                    LDA.w $96BB,x               
                    STA.b $03                   
                    TXA                         
                    CLC                         
                    ADC.b #$03                  
                    STA.b $00                   
                    LDX.b #$00                  
                    LDY.w $0700                 
                    LDA.b $01                   
                    STA.b [$2E],y               
CODE_23918E:        INY                         
                    INX                         
                    LDA.b $02                   
                    STA.b [$2E],y               
                    TXA                         
                    AND.b #$07                  
                    CMP.b #$05                  
                    BNE   CODE_23918E           
                    LDA.b $03                   
                    STA.b [$2E],y               
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $00                   
                    CMP.b #$06                  
                    BNE   CODE_23916E           
                    RTS                         

CODE_2391AF:        LDY.w $0700                 
                    LDX.b #$00                  
                    STX.b $0B                   
CODE_2391B6:        LDX.b $0B                   
                    LDA.w $96BF,x               
                    STA.b $00                   
                    CMP.b #$FF                  
                    BNE   CODE_2391C2           
                    RTS                         

CODE_2391C2:        CMP.b #$80                  
                    BNE   CODE_2391D5           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    INC.b $0B                   
                    JMP.w CODE_2391B6           

CODE_2391D5:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b $00                   
                    AND.b #$0F                  
                    STA.b $0A                   
CODE_2391E0:        LDA.w $96EA,x               
                    STA.b [$2E],y               
                    INY                         
                    DEC.b $0A                   
                    BPL   CODE_2391E0           
                    INC.b $0B                   
                    JMP.w CODE_2391B6           

CODE_2391EF:        LDX.b #$02                  
                    LDY.w $0726                 
                    LDA.w $0747,y               
CODE_2391F7:        CMP.w $9716,x               
                    BEQ   CODE_2391FF           
                    DEX                         
                    BNE   CODE_2391F7           
CODE_2391FF:        LDA.w $9719,x               
                    TAX                         
                    LDA.b #$00                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23920A:        LDA.b #$02                  
                    STA.b $00                   
CODE_23920E:        LDA.w $96F2,x               
                    STA.b [$2E],y               
                    INY                         
                    INX                         
                    INC.b $02                   
                    DEC.b $00                   
                    BPL   CODE_23920E           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $02                   
                    CMP.b #$0C                  
                    BNE   CODE_23920A           
                    RTS                         

CODE_23922C:        LDX.b #$00                  
                    LDY.w $0700                 
CODE_239231:        LDA.b #$01                  
                    STA.b $00                   
CODE_239235:        LDA.w $971C,x               
                    STA.b [$2E],y               
                    INY                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_239235           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    CPX.b #$08                  
                    BNE   CODE_239231           
                    RTS                         

CODE_23924F:        LDY.w $0700                 
                    LDA.b #$C1                  
                    STA.b [$2E],y               
CODE_239256:        INY                         
                    LDA.b #$C4                  
                    STA.b [$2E],y               
                    CPY.b #$0F                  
                    BNE   CODE_239256           
                    LDA.b #$C6                  
                    STA.b [$2E],y               
CODE_239263:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23926D           
                    LDA.b #$C2                  
                    BNE   CODE_239273           
CODE_23926D:        CMP.b #$0F                  
                    BNE   CODE_239263           
                    LDA.b #$C7                  
CODE_239273:        STA.b [$2E],y               
                    CPY.b #$9F                  
                    BNE   CODE_239263           
                    INY                         
                    LDA.b #$C3                  
                    STA.b [$2E],y               
CODE_23927E:        INY                         
                    LDA.b #$C5                  
                    STA.b [$2E],y               
                    CPY.b #$AF                  
                    BNE   CODE_23927E           
                    LDA.b #$C8                  
                    STA.b [$2E],y               
                    RTS                         

CODE_23928C:        LDX.b #$00                  
                    LDY.w $0700                 
CODE_239291:        LDA.b #$01                  
                    STA.b $00                   
CODE_239295:        LDA.w $9724,x               
                    STA.b [$2E],y               
                    INY                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_239295           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    CPX.b #$04                  
                    BNE   CODE_239291           
                    RTS                         

CODE_2392AF:        LDX.b #$00                  
                    LDY.w $0700                 
CODE_2392B4:        LDA.b #$01                  
                    STA.b $00                   
CODE_2392B8:        LDA.w $9728,x               
                    STA.b [$2E],y               
                    INY                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_2392B8           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    CPX.b #$04                  
                    BNE   CODE_2392B4           
                    RTS                         

CODE_2392D2:        LDA.b #$01                  
                    STA.b $00                   
                    LDY.w $0700                 
CODE_2392D9:        LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
CODE_2392DF:        LDA.b #$C0                  
                    STA.b [$2E],y               
                    INY                         
                    DEX                         
                    BPL   CODE_2392DF           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    DEC.b $00                   
                    BPL   CODE_2392D9           
                    RTS                         
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    RTS                         

                    LDA.b $05                   
                    STA.b $2F                   
                    LDY.w $0700                 
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_239340           
                    LDY.b #$00                  
                    LDA.b $0E                   
                    AND.b #$10                  
                    BEQ   CODE_239318           
                    INY                         
CODE_239318:        STY.b $09                   
                    LDA.b $2E                   
                    CLC                         
                    ADC.b #$B0                  
                    STA.b $2E                   
                    LDA.b $2F                   
                    ADC.b $09                   
                    STA.b $2F                   
                    STA.b $05                   
                    LDA.b $0F                   
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    INY                         
                    INY                         
                    LDA.w $8201,y               
                    STA.b $04                   
                    INC.b $04                   
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
CODE_239340:        STY.w $0700                 
                    RTS                         

CODE_239344:        LDA.w $1EBF                 
                    CMP.b #$0F                  
                    BNE   CODE_23934E           
                    JSR.w CODE_23934F           
CODE_23934E:        RTL                         

CODE_23934F:        LDA.w $1034                 
                    JSL.l CODE_20FB1F           

POINTER_239356:     dw CODE_23935E
                    dw CODE_239362
                    dw CODE_23936B
                    dw CODE_23936F

CODE_23935E:        JSR.w CODE_239373
                    RTS                         

CODE_239362:        JSR.w CODE_2393BC           
                    LDA.b #$3F                  
                    JSR.w CODE_239410           
                    RTS                         

CODE_23936B:        JSR.w CODE_2393BC           
                    RTS                         

CODE_23936F:        JSR.w CODE_2393E6           
                    RTS                         

CODE_239373:        LDA.b #$94                  
                    STA.b $0A                   
                    LDY.b #$00                  
                    LDX.b #$0A                  
CODE_23937B:        LDA.w $9737,x               
                    STA.w $0810,y               
                    STA.w $0814,y               
                    LDA.w $972C,x               
                    STA.w $0811,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0815,y               
                    LDA.b $0A                   
                    STA.w $0812,y               
                    INC   A                     
                    STA.w $0816,y               
                    LDA.b #$2A                  
                    STA.w $0813,y               
                    STA.w $0817,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A24,y               
                    STA.w $0A25,y               
                    PLY                         
                    DEC.b $0A                   
                    DEC.b $0A                   
                    TYA                         
                    CLC                         
                    ADC.b #$08                  
                    TAY                         
                    DEX                         
                    BPL   CODE_23937B           
                    RTS                         

CODE_2393BC:        LDA.b #$99                  
                    STA.b $0A                   
                    LDY.b #$00                  
                    LDX.b #$09                  
CODE_2393C4:        LDA.w $9742,x               
                    STA.w $0810,y               
                    INY                         
                    LDA.b $0A                   
                    STA.w $0810,y               
                    INY                         
                    LDA.b #$00                  
                    STA.w $0810,y               
                    INY                         
                    LDA.w $974C,x               
                    STA.w $0810,y               
                    INY                         
                    DEC.b $0A                   
                    DEC.b $0A                   
                    DEX                         
                    BPL   CODE_2393C4           
                    RTS                         

CODE_2393E6:        LDA.b #$AF                  
                    STA.b $0A                   
                    LDY.b #$00                  
                    LDX.b #$0A                  
CODE_2393EE:        LDA.w $9756,x               
                    STA.w $0810,y               
                    INY                         
                    LDA.b $0A                   
                    STA.w $0810,y               
                    INY                         
                    LDA.b #$00                  
                    STA.w $0810,y               
                    INY                         
                    LDA.w $9761,x               
                    STA.w $0810,y               
                    INY                         
                    DEC.b $0A                   
                    DEC.b $0A                   
                    DEX                         
                    BPL   CODE_2393EE           
                    RTS                         

CODE_239410:        STA.b $0A                   
                    LDX.b #$07                  
CODE_239414:        LDA.w $976C,x               
                    STA.w $0810,y               
                    INY                         
                    LDA.b $0A                   
                    STA.w $0810,y               
                    INY                         
                    LDA.b #$00                  
                    STA.w $0810,y               
                    INY                         
                    LDA.w $9774,x               
                    STA.w $0810,y               
                    INY                         
                    DEC.b $0A                   
                    DEC.b $0A                   
                    DEX                         
                    BPL   CODE_239414           
                    LDA.w $1040                 
                    CMP.b #$02                  
                    BCC   CODE_239485           
                    LDX.w $1043                 
                    LDA.w $977E,x               
                    STA.b $0A                   
                    LDA.w $1026                 
                    STA.b $0B                   
                    LDX.b #$01                  
CODE_23944B:        LDA.w $1027                 
                    STA.w $0810,y               
                    INY                         
                    LDA.b $0A                   
                    STA.w $0810,y               
                    INY                         
                    LDA.w $977C,x               
                    STA.w $0810,y               
                    INY                         
                    LDA.b $0B                   
                    STA.w $0810,y               
                    INY                         
                    LDA.b $0B                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $0B                   
                    DEX                         
                    BPL   CODE_23944B           
                    LDA.w $1027                 
                    CMP.b #$60                  
                    BEQ   CODE_239485           
                    DEC.w $1027                 
                    LDA.w $1027                 
                    CMP.b #$5F                  
                    BCS   CODE_239485                   
                    LDA.b #$60                  
                    STA.w $1027                 
CODE_239485:        RTS                         

CODE_239486:        JSR.w CODE_23934F           
                    LDA.w $1040                 
                    CMP.b #$07                  
                    BCC   CODE_23949E           
                    JSR.w CODE_23A4DC           
                    BCC   CODE_23949E           
                    LDA.b #$09                  
                    STA.w $1040                 
                    LDA.b #$01                  
                    STA.b $14                   
CODE_23949E:        JSR.w CODE_2394A2           
                    RTL                         

CODE_2394A2:        LDA.w $1040                 
                    JSL.l CODE_20FB1F           

POINTER_2394A9:     dw CODE_2394BD
                    dw CODE_239513
                    dw CODE_2395F5
                    dw CODE_239752
                    dw CODE_239853
                    dw CODE_2396EB
                    dw CODE_2395B0
                    dw CODE_239513
                    dw CODE_2394FC
                    dw CODE_2395B1
  
CODE_2394BD:        LDA.b #$51
                    STA.w $2109                  
                    LDA.w $1028                 
                    CLC                         
                    ADC.b #$08                  
                    STA.b $28                   
                    INC.w $1028                 
                    CMP.b #$0C                  
                    BNE   CODE_2394FB           
                    LDA.b #$00                  
                    STA.w $070F                 
                    INC.w $1040                 
                    LDY.w $1042                 
                    LDA.w $9782,y               
                    STA.b $2E                   
                    LDA.w $978A,y               
                    STA.b $2F                   
                    LDA.b #$21                  
                    STA.b $30                   
                    CPY.b #$01                  
                    BEQ   CODE_2394F2           
                    CPY.b #$02                  
                    BNE   CODE_2394FB           
CODE_2394F2:        LDA.b #$F8                  
                    STA.b $95                   
                    LDA.b #$07                  
                    STA.w $1040                 
CODE_2394FB:        RTS                         

CODE_2394FC:        LDA.w $0711                 
                    BNE   CODE_239506           
                    LDA.b #$A0                  
                    STA.w $0711                 
CODE_239506:        DEC.w $0711                 
                    BNE   CODE_239512           
                    INC.w $1040                 
                    LDA.b #$01                  
                    STA.b $14                   
CODE_239512:        RTS                         

CODE_239513:        DEC.w $070E                 
                    BEQ   CODE_239519           
                    RTS                         

CODE_239519:        LDA.b #$04                  
                    STA.w $070E                 
CODE_23951E:        LDA.w $02D4                 
                    AND.b #$01                  
                    BEQ   CODE_23952A           
                    LDA.b #$19                  
                    STA.w $1200                 
CODE_23952A:        LDY.w $02D4                 
                    LDA.b [$2E],y               
                    BNE   CODE_23954D           
                    LDA.w $05E8                 
                    CLC                         
                    ADC.b #$20                  
                    TAY                         
                    LDA.w $05E7                 
                    ADC.b #$00                  
                    STA.w $05E7                 
                    TYA                         
                    AND.b #$E0                  
                    ORA.b #$04                  
                    STA.w $05E8                 
                    INC.w $02D4                 
                    BRA   CODE_23951E           

CODE_23954D:        CMP.b #$FF                  
                    BEQ   CODE_239592           
                    CMP.b #$FE                  
                    BNE   CODE_23955C           
                    LDY.b #$00                  
                    STY.w $1200                 
                    BRA   CODE_23958B           

CODE_23955C:        LDX.w $1600                 
                    STA.w $1606,x               
                    LDA.b #$21                  
                    STA.w $1607,x               
                    LDA.w $05E7                 
                    STA.w $1602,x               
                    LDA.w $05E8                 
                    STA.w $1603,x               
                    LDA.b #$00                  
                    STA.w $1604,x               
                    LDA.b #$01                  
                    STA.w $1605,x               
                    LDA.b #$FF                  
                    STA.w $1608,x               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$06                  
                    STA.w $1600                 
CODE_23958B:        INC.w $05E8                 
                    INC.w $02D4                 
                    RTS                         

CODE_239592:        LDA.w $1040                 
                    CMP.b #$07                  
                    BEQ   CODE_2395A1           
                    LDA.b #$78                  
                    STA.w $1027                 
                    STA.w $1026                 
CODE_2395A1:        LDA.b #$00                  
                    STA.w $02D4                 
                    INC.w $1040                 
                    INY                         
                    LDA.b [$2E],y               
                    STA.w $102A                 
                    RTS                         

CODE_2395B0:        RTS                         

CODE_2395B1:        LDA.w $1034                 
                    CMP.b #$01                  
                    BNE   CODE_2395BF           
                    LDA.w $1027                 
                    CMP.b #$60                  
                    BNE   CODE_2395BF           
CODE_2395BF:        RTS                         

                    RTS                         

                    LDA.w $1043                 
                    ASL   A                     
                    STA.b $00                   
                    LDX.w $0726                 
                    LDA.l $7E3992,x             
                    AND.b #$0A                  
                    BEQ   CODE_2395D4           
                    INC.b $00                   
CODE_2395D4:        LDY.b $00                   
                    LDA.w $9976,y               
                    STA.l $7E397D,x             
                    LDA.w $997A,y               
                    AND.b #$F0                  
                    STA.l $7E3981,x             
                    LDA.w $997A,y               
                    AND.b #$0F                  
                    STA.l $7E397F,x             
                    LDA.b #$01                  
                    STA.w $0713                 
                    RTS                         

CODE_2395F5:        INC.w $069A                 
                    LDA.w $069A                 
                    AND.b #$03                  
                    BNE   CODE_239612           
                    LDA.l $7E3991               
                    INC   A                     
                    STA.l $7E3991               
                    CMP.b #$06                  
                    BNE   CODE_239612           
                    LDA.b #$00                  
                    STA.l $7E3991               
CODE_239612:        LDA.b $18                   
                    AND.b #$80                  
                    BEQ   CODE_239657           
                    LDA.b #$00                  
                    STA.w $069A                 
                    STA.w $070F                 
                    LDY.b #$00                  
                    LDA.w $1042                 
                    CMP.b #$01                  
                    BEQ   CODE_23962E           
                    INY                         
                    CMP.b #$02                  
                    BNE   CODE_239647           
CODE_23962E:        LDA.l $7E3991               
                    AND.b #$01                  
                    CMP.w $997E,y               
                    BNE   CODE_23963F           
                    LDA.w $9980,y               
                    STA.w $069A                 
CODE_23963F:        LDA.b #$04                  
                    STA.w $1040                 
                    JMP.w CODE_239657           

CODE_239647:        LDA.l $7E3991               
                    TAX                         
                    CPX.b #$02                  
                    BCC   CODE_239654           
                    INX                         
                    STX.w $069C                 
CODE_239654:        INC.w $1040                 
CODE_239657:        LDA.b $96                   
                    STA.w $08F8                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $08FC                 
                    LDA.b $95                   
                    STA.w $08F9                 
                    STA.w $08FD                 
                    LDA.l $7E3991               
                    ASL   A                     
                    ORA.b #$10                  
                    STA.w $08FA                 
                    STA.w $08FE                 
                    LDA.b #$26                  
                    STA.w $08FB                 
                    LDA.b #$E6                  
                    STA.w $08FF                 
                    LDA.b #$00                  
                    STA.w $0A5E                 
                    STA.w $0A5F                 
                    RTS                         

                    RTS                         

                    LDA.w $070F                 
                    BNE   CODE_2396EA           
                    INC.w $070E                 
                    LDA.w $070E                 
                    AND.b #$03                  
                    BNE   CODE_2396EA           
CODE_23969A:        LDX.w $02D4                 
                    LDA.w $9982,x               
                    BNE   CODE_2396AD           
                    LDA.b #$55                  
                    STA.w $070C                 
                    INC.w $02D4                 
                    JMP.w CODE_23969A           

CODE_2396AD:        CMP.b #$FF                  
                    BNE   CODE_2396BF           
                    LDA.b #$35                  
                    STA.w $070C                 
                    LDA.b #$00                  
                    STA.w $02D4                 
                    INC.w $070F                 
                    RTS                         

CODE_2396BF:        LDY.w $1600                 
                    STA.w $1604,y               
                    LDA.w $070B                 
                    STA.w $1601,y               
                    LDA.w $070C                 
                    STA.w $1602,y               
                    LDA.b #$01                  
                    STA.w $1603,y               
                    LDA.b #$00                  
                    STA.w $1605,y               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1600                 
                    INC.w $070C                 
                    INC.w $02D4                 
CODE_2396EA:        RTS                         

CODE_2396EB:        LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_239704           
                    LDA.l $7E3991               
                    INC   A                     
                    STA.l $7E3991               
                    CMP.b #$06                  
                    BNE   CODE_239704           
                    LDA.b #$00                  
                    STA.l $7E3991               
CODE_239704:        LDA.b $97                   
                    CMP.b #$80                  
                    BEQ   CODE_23970F           
                    SEC                         
                    SBC.b #$08                  
                    STA.b $97                   
CODE_23970F:        LDA.b $97                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $00                   
                    LDA.b $97                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_239723           
                    ORA.b #$F0                  
CODE_239723:        STA.b $01                   
                    LDA.b $98                   
                    CLC                         
                    ADC.b $00                   
                    STA.b $98                   
                    LDA.b $95                   
                    ADC.b $01                   
                    STA.b $95                   
                    LDA.b $95                   
                    CMP.b #$F8                  
                    BCC   CODE_239751           
                    LDA.b #$F8                  
                    STA.b $95                   
                    LDA.b #$00                  
                    STA.b $97                   
                    STA.w $070F                 
                    LDA.w $069A                 
                    BEQ   CODE_23974C           
                    INC.w $1040                 
                    RTS                         

CODE_23974C:        LDA.b #$08                  
                    STA.w $1040                 
CODE_239751:        RTS                         

CODE_239752:        LDA.l $7E3991               
                    CMP.b #$02                  
                    BCS   CODE_239772                   
                    CMP.b #$01                  
                    BNE   CODE_239768           
                    LDX.b #$03                  
                    JSL.l CODE_20975B           
                    INC.w $1040                 
                    RTS                         

CODE_239768:        LDX.w $0726                 
                    INC.w $0736,x               
                    INC.w $1040                 
                    RTS                         

CODE_239772:        LDA.w $59                 
                    JSL.l CODE_20FB1F           

POINTER_239779:     dw CODE_23977D
                    dw CODE_2397B1

CODE_23977D:        LDA.l $7E3991
                    TAY
CODE_239782:        LDA.b #$78    
                    STA.w $061F,y               
                    STA.w $062B,y               
                    LDX.b #$F0                  
                    LDA.w $0783,y               
                    ASL   A                     
                    PHA                         
                    BCC   CODE_239795           
                    LDX.b #$00                  
CODE_239795:        TXA                         
                    STA.b $00                   
                    PLA                         
                    AND.b #$0F                  
                    ORA.b $00                   
                    STA.w $0625,y               
                    LDA.w $0783,y               
                    AND.b #$07                  
                    ORA.b #$C0                  
                    STA.w $0619,y               
                    DEY                         
                    BPL   CODE_239782           
                    INC.w $0059                 
                    RTS                         

CODE_2397B1:        LDA.l $7E3991               
                    TAY                         
CODE_2397B6:        JSR.w CODE_2397EC           
                    JSR.w CODE_2397DE           
                    LDA.w $0619,y               
                    CLC                         
                    ADC.b #$02                  
                    STA.w $0619,y               
                    DEY                         
                    BPL   CODE_2397B6           
                    JSR.w CODE_239827           
                    LDA.l $7E3991               
                    TAY                         
CODE_2397D0:        LDA.w $061F,y               
                    CMP.b #$F8                  
                    BNE   CODE_2397DD           
                    DEY                         
                    BPL   CODE_2397D0           
                    INC.w $1040                 
CODE_2397DD:        RTS                         

CODE_2397DE:        TYA                         
                    CLC                         
                    ADC.b #$0C                  
                    TAY                         
                    JSR.w CODE_2397FA           
                    TYA                         
                    SEC                         
                    SBC.b #$0C                  
                    TAY                         
                    RTS                         

CODE_2397EC:        LDA.w $0619,y               
                    BMI   CODE_2397FA           
                    CMP.b #$40                  
                    BMI   CODE_2397FA           
                    LDA.b #$40                  
                    STA.w $0619,y               
CODE_2397FA:        LDA.w $0619,y               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $00                   
                    LDX.b #$00                  
                    LDA.w $0619,y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_239813           
                    DEX                         
                    ORA.b #$F0                  
CODE_239813:        STA.b $01                   
                    LDA.w $0631,y               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0631,y               
                    LDA.w $061F,y               
                    ADC.b $01                   
                    STA.w $061F,y               
                    RTS                         

CODE_239827:        LDA.l $7E3991               
                    TAY                         
CODE_23982C:        TYA                         
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDA.w $061F,y               
                    CMP.b #$C0                  
                    BCC   CODE_23983C           
                    LDA.b #$F8                  
                    STA.w $061F,y               
CODE_23983C:        STA.w $0880,x               
                    LDA.b #$61                  
                    STA.w $0881,x               
                    LDA.b #$01                  
                    STA.w $0882,x               
                    LDA.w $062B,y               
                    STA.w $0883,x               
                    DEY                         
                    BPL   CODE_23982C           
                    RTS                         

CODE_239853:        LDA.w $0711                 
                    BNE   CODE_23985D           
                    LDA.b #$80                  
                    STA.w $0711                 
CODE_23985D:        DEC.w $0711                 
                    BNE   CODE_239870           
                    INC.w $1040                 
                    LDA.w $1040                 
                    CMP.b #$09                  
                    BNE   CODE_239870           
                    LDA.b #$01                  
                    STA.b $14                   
CODE_239870:        RTS                         

CODE_239871:        REP   #$10                  
                    LDA.b #$1F                  
                    STA.b $00                   
                    LDY.w #$0160                
CODE_23987A:        LDA.b #$08                  
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b #$F0                  
                    STA.w $0808,y               
                    STA.w $080C,y               
                    LDA.b #$F8                  
                    STA.w $0810,y               
                    STA.w $0814,y               
                    LDA.b #$00                  
                    STA.w $0818,y               
                    STA.w $081C,y               
                    LDA.b $00                   
                    STA.w $0801,y               
                    STA.w $0809,y               
                    STA.w $0811,y               
                    STA.w $0819,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    STA.w $080D,y               
                    STA.w $0815,y               
                    STA.w $081D,y               
                    LDA.b #$70                  
                    STA.w $0802,y               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0806,y               
                    STA.w $080E,y               
                    LDA.b #$7A                  
                    STA.w $0812,y               
                    STA.w $081A,y               
                    INC   A                     
                    STA.w $0816,y               
                    STA.w $081E,y               
                    LDA.b #$2A                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    STA.w $0813,y               
                    STA.w $0817,y               
                    STA.w $081B,y               
                    STA.w $081F,y               
                    PHY                         
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
                    STA.w $0A24,y               
                    STA.w $0A25,y               
                    STA.w $0A26,y               
                    STA.w $0A27,y               
                    PLY                         
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    REP   #$20                  
                    TYA                         
                    SEC                         
                    SBC.w #$0020                
                    TAY                         
                    SEP   #$20                  
                    CPY.w #$0020                
                    BEQ   CODE_23992C           
                    BRL   CODE_23987A           

CODE_23992C:        SEP   #$10                  
                    LDY.b #$2F                  
CODE_239930:        LDA.w $998B,y               
                    STA.w $0800,y               
                    DEY                         
                    BPL   CODE_239930           
                    REP   #$20                  
                    LDA.w #$0000                
                    STA.w $0A20                 
                    STA.w $0A22                 
                    STA.w $0A24                 
                    STA.w $0A26                 
                    STA.w $0A28                 
                    STA.w $0A2A                 
                    SEP   #$20                  
                    RTL                         

CODE_239953:        JSR.w CODE_239957           
                    RTL                         

CODE_239957:        LDA.w $1009                 
                    ASL   A                     
                    TAX                         
                    JMP.w (POINTER_23995F,x)             

POINTER_23995F:     dw CODE_239963
                    dw CODE_23997B

CODE_239963:        LDA.w $100A
                    JSL.l CODE_20FB1F

POINTER_23996A:     dw CODE_23996E
                    dw CODE_239972

CODE_23996E:        INC.w $100A                 
                    RTS                         

CODE_239972:        INC.w $1009                 
                    LDA.b #$00                  
                    STA.w $1019                 
                    RTS                         

CODE_23997B:        JSL.l CODE_2A8000           
                    LDA.w $100B                 
                    ASL   A                     
                    TAX                         
                    JMP.w (POINTER_239987,x)             

POINTER_239987:     dw CODE_239993
                    dw CODE_2399D5
                    dw CODE_239B98
                    dw CODE_239BB5
                    dw CODE_239BCD
                    dw CODE_239BE1
   
CODE_239993:        STZ.w $100C                 
                    STZ.w $100D                 
                    STZ.w $100E                 
                    STZ.w $1FF9                 
                    LDA.b #$70                  
                    STA.w $100F                 
                    LDA.b #$90                  
                    STA.w $1010                 
                    LDA.b #$7F                  
                    STA.w $1011                 
                    STZ.w $1A5F                 
                    STZ.w $1015                 
                    STZ.w $1016                 
                    STZ.w $1017                 
                    STZ.w $1000                 
                    STZ.w $1001                 
                    STZ.w $1002                 
                    STZ.w $1003                 
                    STZ.w $1004                 
                    STZ.w $1005                 
                    LDA.b #$30                  
                    STA.w $1A60                 
                    INC.w $100B                 
                    RTS                         

CODE_2399D5:        JSR.w CODE_23A4DC           
                    BCC   CODE_239A29           
                    LDA.w $100C                 
                    BNE   CODE_2399EF           
                    INC.w $100C                 
                    LDA.w $0783                 
                    AND.b #$0F                  
                    ORA.b #$20                  
                    STA.w $1012                 
                    JMP.w CODE_239A24           

CODE_2399EF:        LDA.w $100D                 
                    BNE   CODE_239A0B           
                    LDA.w $100C                 
                    CMP.b #$02                  
                    BCC   CODE_239A0B           
                    INC.w $100D                 
                    LDA.w $0784                 
                    AND.b #$1F                  
                    ORA.b #$20                  
                    STA.w $1013                 
                    JMP.w CODE_239A24           

CODE_239A0B:        LDA.w $100E                 
                    BNE   CODE_239A29           
                    LDA.w $100D                 
                    CMP.b #$02                  
                    BCC   CODE_239A29           
                    INC.w $100E                 
                    LDA.w $0785                 
                    AND.b #$3F                  
                    ORA.b #$40                  
                    STA.w $1014                 
CODE_239A24:        LDA.b #$23                  
                    STA.w $1203                 
CODE_239A29:        LDX.b #$02                  
CODE_239A2B:        STX.b $19                   
                    LDA.w $1012,x               
                    BEQ   CODE_239A35           
                    DEC.w $1012,x               
CODE_239A35:        JSR.w CODE_239A3C           
                    DEX                         
                    BPL   CODE_239A2B           
                    RTS                         

CODE_239A3C:        LDA.w $100C,x               
                    JSL.l CODE_20FB1F           

POINTER_239A43:     dw CODE_239A4F
                    dw CODE_239A6F
                    dw CODE_239A7A
                    dw CODE_239ABB
                    dw CODE_239AE5
                    dw CODE_239B6D

CODE_239A4F:        CPX.b #$02
                    BNE   CODE_239A6C
                    LDA.w $1A5F
                    CLC                         
                    ADC.w $1A60                 
                    STA.w $1A5F                 
                    DEC.w $02E0                 
                    BPL   CODE_239A6C           
                    LDA.b #$06                  
                    STA.w $02E0                 
                    LDA.b #$41                  
                    STA.w $1200                 
CODE_239A6C:        JMP.w CODE_239CC5           

CODE_239A6F:        LDA.w $1012,x               
                    BNE   CODE_239A4F           
                    INC.w $100C,x               
                    JMP.w CODE_239A4F           

CODE_239A7A:        LDA.w $100F,x               
                    CLC                         
                    ADC.b #$3F                  
                    CMP.b #$7F                  
                    BCS   CODE_239A8A                   
                    INC.w $100C,x               
                    JMP.w CODE_239A4F           

CODE_239A8A:        CPX.b #$02                  
                    BNE   CODE_239AA1           
                    LDA.w $1A60                 
                    CMP.b #$11                  
                    BCC   CODE_239AA1           
                    DEC.w $1A60                 
                    LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_239AA1           
                    DEC.w $1A60                 
CODE_239AA1:        LDA.w $100F,x               
                    BPL   CODE_239AAF           
                    LDA.w $100F,x               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $100F,x               
CODE_239AAF:        LDA.w $100F,x               
                    SEC                         
                    SBC.b #$02                  
                    STA.w $100F,x               
                    JMP.w CODE_239A4F           

CODE_239ABB:        LDA.w $1000,x               
                    AND.b #$7C                  
                    BNE   CODE_239AE2           
                    LDA.b #$3E                  
                    STA.w $1203                 
                    LDA.b #$12                  
                    STA.w $1012,x               
                    LDA.w $1000,x               
                    CLC                         
                    ADC.b #$20                  
                    AND.b #$80                  
                    STA.w $1000,x               
                    LDA.w $1003,x               
                    ADC.b #$00                  
                    STA.w $1003,x               
                    INC.w $100C,x               
CODE_239AE2:        JMP.w CODE_239A4F           

CODE_239AE5:        LDA.w $1012,x               
                    BNE   CODE_239B5E           
                    LDA.w $1000,x               
                    CLC                         
                    ADC.b #$20                  
                    AND.b #$80                  
                    STA.w $1000,x               
                    STA.b $00                   
                    LDA.w $1003,x               
                    ADC.b #$00                  
                    STA.w $1003,x               
                    ASL.b $00                   
                    ROL   A                     
                    AND.b #$03                  
                    STA.w $1006,x               
                    CPX.b #$02                  
                    BNE   CODE_239B58           
                    LDA.b #$50                  
                    STA.w $1012,x               
                    LDA.w $1006                 
                    ASL   A                     
                    TAX                         
                    LDY.b #$01                  
CODE_239B17:        LDA.w $1007,y               
                    CMP.l $2199BB,x             
                    BEQ   CODE_239B26           
                    CMP.l $2199BC,x             
                    BNE   CODE_239B53           
CODE_239B26:        DEY                         
                    BPL   CODE_239B17           
                    LDX.w $1006                 
                    LDA.l $2199C3,x             
                    STA.w $1FF9                 
                    JSL.l CODE_2A810D           
                    LDA.b #$07                  
                    STA.w $1202                 
                    LDA.b #$60                  
                    STA.w $02D8                 
                    LDA.b #$04                  
                    STA.w $100B                 
                    LDA.b #$F0                  
                    STA.w $100C                 
                    STZ.w $1012                 
                    LDX.b $19                   
                    PLA                         
                    PLA                         
                    RTS                         

CODE_239B53:        LDA.b #$2A                  
                    STA.w $1203                 
CODE_239B58:        LDX.b $19                   
                    INC.w $100C,x               
                    RTS                         

CODE_239B5E:        LDY.b #$10                  
                    AND.b #$04                  
                    BNE   CODE_239B66           
                    LDY.b #$F0                  
CODE_239B66:        TYA                         
                    STA.w $100F,x               
                    JMP.w CODE_239A4F           

CODE_239B6D:        CPX.b #$02                  
                    BNE   CODE_239B76           
                    LDA.w $1012,x               
                    BEQ   CODE_239B77           
CODE_239B76:        RTS                         

CODE_239B77:        LDA.w $1019                 
                    BEQ   CODE_239B8B           
                    LDA.b $17                   
                    AND.b #$D0                  
                    BEQ   CODE_239B8A           
                    DEC.w $1019                 
                    LDA.b #$00                  
                    STA.w $100B                 
CODE_239B8A:        RTS                         

CODE_239B8B:        PLA                         
                    PLA                         
CODE_239B8D:        LDA.b #$02                  
                    STA.w $100B                 
                    LDA.b #$00                  
                    STA.w $100C                 
                    RTS                         

CODE_239B98:        LDA.w $100C                 
                    BNE   CODE_239BA5           
                    INC.w $100C                 
                    JSL.l CODE_29E26B           
                    RTS                         

CODE_239BA5:        LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_239BB4           
                    DEC.b $16                   
                    LDA.b $16                   
                    BNE   CODE_239BB4           
                    INC.w $100B                 
CODE_239BB4:        RTS                         

CODE_239BB5:        LDA.b #$01                  
                    STA.w $101E                 
                    LDA.b #$01                  
                    STA.b $14                   
                    LDA.b #$80                  
                    STA.b $16                   
                    LDA.b #$C0                  
                    STA.w $0100                 
                    LDA.b #$00                  
                    STA.w $0427                 
                    RTS                         

CODE_239BCD:        LDA.w $02D8                 
                    BNE   CODE_239BD8           
                    LDA.b #$05                  
                    STA.w $100B                 
                    RTS                         

CODE_239BD8:        DEC.w $02D8                 
                    RTS                         

DATA_239BDC:        db $32,$34,$36,$00,$38   

CODE_239BE1:        LDA.w $1012                 
                    BEQ   CODE_239C14           
                    DEC.w $1012                 
                    BNE   CODE_239BEE           
                    JMP.w CODE_239B8D           

CODE_239BEE:        LDA.b $15                   
                    AND.b #$1F                  
                    BNE   CODE_239C11           
                    LDA.w $100D                 
                    BEQ   CODE_239C11           
                    LDA.b #$A0                  
                    STA.w $1012                 
                    DEC.w $100D                 
                    LDA.b #$05                  
                    STA.w $1203                 
                    LDX.w $0726                 
                    LDA.w $0736,x               
                    BMI   CODE_239C11           
                    INC.w $0736,x               
CODE_239C11:        JMP.w CODE_239C32           

CODE_239C14:        DEC.w $100C                 
                    DEC.w $100C                 
                    DEC.w $100C                 
                    DEC.w $100C                 
                    LDA.w $100C                 
                    CMP.b #$60                  
                    BCS   CODE_239C32                   
                    LDA.w $1FF9                 
                    STA.w $100D                 
                    LDA.b #$50                  
                    STA.w $1012                 
CODE_239C32:        LDA.b #$70                  
                    STA.w $09D0                 
                    STA.w $09DC                 
                    LDA.b #$7C                  
                    STA.w $09D4                 
                    STA.w $09E0                 
                    LDA.b #$84                  
                    STA.w $09D8                 
                    STA.w $09E4                 
                    LDA.w $100C                 
                    STA.w $09D1                 
                    STA.w $09D5                 
                    STA.w $09D9                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $09DD                 
                    STA.w $09E1                 
                    STA.w $09E5                 
                    LDX.w $1FF9                 
                    LDA   DATA_239BDC-1,x             
                    STA.w $09D2                 
                    INC   A                     
                    STA.w $09DE                 
                    LDA.b #$0C                  
                    STA.w $09D6                 
                    INC   A                     
                    STA.w $09E2                 
                    INC   A                     
                    STA.w $09DA                 
                    INC   A                     
                    STA.w $09E6                 
                    LDA.b #$22                  
                    STA.w $09D3                 
                    STA.w $09DF                 
                    STA.w $09D7                 
                    STA.w $09E3                 
                    STA.w $09DB                 
                    STA.w $09E7                 
                    LDA.b #$00                  
                    STA.w $0A94                 
                    STA.w $0A95                 
                    STA.w $0A96                 
                    STA.w $0A97                 
                    STA.w $0A98                 
                    STA.w $0A99                 
                    RTS                         

                    LDA.w $101C                 
                    BEQ   CODE_239CB2           
                    DEC.w $101C                 
CODE_239CB2:        LDA.w $101D                 
                    BEQ   CODE_239CC4           
                    LDA.w $101C                 
                    BNE   CODE_239CC4           
                    LDA.b #$04                  
                    STA.w $101C                 
                    DEC.w $101D                 
CODE_239CC4:        RTS                         

CODE_239CC5:        LDA.w $100F,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $01                   
                    LDA.w $100F,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_239CDB           
                    ORA.b #$F0                  
CODE_239CDB:        STA.b $00                   
                    LDY.b #$00                  
                    CMP.b #$00                  
                    BPL   CODE_239CE4           
                    DEY                         
CODE_239CE4:        STY.b $02                   
                    LDA.w $1015,x               
                    CLC                         
                    ADC.b $01                   
                    STA.w $1015,x               
                    LDA.w $1000,x               
                    ADC.b $00                   
                    STA.w $1000,x               
                    LDA.w $1003,x               
                    ADC.b $02                   
                    STA.w $1003,x               
                    RTS                         

CODE_239D00:        JSL.l CODE_2A81A5           
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.b #$80                  
                    STA.w $2116                 
                    LDA.b #$00                  
                    STA.w $2117                 
                    JSL.l CODE_239D21           
                    LDA.b #$80                  
                    STA.w $2116                 
                    LDA.b #$04                  
                    STA.w $2117                 
CODE_239D21:        REP   #$30                  
                    LDY.w #$0000                
CODE_239D26:        LDA.w #$00FC                
                    STA.w $2118                 
                    STA.w $2118                 
                    INY                         
                    CPY.w #$0130                
                    BNE   CODE_239D26           
                    AND.w #$0000                
                    SEP   #$30                  
                    REP   #$10                  
                    STZ.b $01                   
                    STZ.b $04                   
CODE_239D40:        LDA.b #$C0                  
                    STA.b $00                   
                    LDY.w #$000C                
CODE_239D47:        LDA.b $04                   
                    ASL   A                     
                    CLC                         
                    ADC.b $04                   
                    TAX                         
                    LDA   PNTR_2282FB,x             
                    STA.b $0D                   
                    LDA   PNTR_2282FB+1,x             
                    STA.b $0E                   
                    LDA   PNTR_2282FB+2,x             
                    STA.b $0F                   
CODE_239D60:        REP   #$20                  
                    LDA.b $00                   
                    STA.w $2116                 
                    LDX.w #$0000                
CODE_239D6A:        LDA.b [$0D],y               
                    STA.w $2118                 
                    INY                         
                    INY                         
                    INX                         
                    CPX.w #$0006                
                    BNE   CODE_239D6A           
                    TYA                         
                    CLC                         
                    ADC.w #$000C                
                    TAY                         
                    AND.w #$00FF                
                    SEP   #$20                  
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$20                  
                    BCC   CODE_239D8B           
                    INC.b $01                   
CODE_239D8B:        STA.b $00                   
                    AND.b #$E0                  
                    CMP.b #$80                  
                    BNE   CODE_239D60           
                    LDA.b $01                   
                    AND.b #$03                  
                    CMP.b #$02                  
                    BNE   CODE_239D60           
                    DEC.b $01                   
                    DEC.b $01                   
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$46                  
                    STA.b $00                   
                    LDA.b $04                   
                    CMP.b #$01                  
                    BNE   CODE_239DB6           
                    CPY.w #$015C                
                    BEQ   CODE_239DB6           
                    LDY.w #$000C                
                    BRA   CODE_239D60           

CODE_239DB6:        LDA.b $00                   
                    CLC                         
                    ADC.b #$04                  
                    STA.b $00                   
                    LDY.w #$0000                
                    LDA.b $01                   
                    CMP.b #$04                  
                    BEQ   CODE_239DD5           
                    INC.b $04                   
                    LDA.b $04                   
                    CMP.b #$03                  
                    BEQ   CODE_239DD1           
                    BRL   CODE_239D47           

CODE_239DD1:        LDA.b #$04                  
                    STA.b $01                   
CODE_239DD5:        DEC.b $04                   
                    BMI   CODE_239DE2           
                    LDA.b $04                   
                    CMP.b #$02                  
                    BEQ   CODE_239DE5           
                    JMP.w CODE_239D47           

CODE_239DE2:        SEP   #$10                  
                    RTL                         

CODE_239DE5:        BRL   CODE_239D40           

CODE_239DE8:        JSR.w CODE_239DEC           
                    RTL                         

CODE_239DEC:        LDA.w $1041                 
                    JSL.l CODE_20FB1F           

POINTER_239DF3:     dw CODE_239DF9
                    dw CODE_239E18
                    dw CODE_239E36

CODE_239DF9:        LDA.w $0742                 
                    BNE   CODE_239E0F           
                    LDY.b #$11                  
CODE_239E00:        LDA.w $9A1C,y               
                    STA.w $1E84,y               
                    DEY                         
                    BPL   CODE_239E00           
                    JSR.w CODE_239FE6           
                    INC.w $0742                 
CODE_239E0F:        INC.w $1041                 
                    LDA.b #$11                  
                    STA.w $1028                 
                    RTS                         

CODE_239E18:        LDY.w $1028                 
                    STY.b $0A                   
                    LDA.w $1E84,y               
                    AND.b #$80                  
                    BNE   CODE_239E2A           
                    JSR.w CODE_23A0DA           
                    JMP.w CODE_239E2D           

CODE_239E2A:        JSR.w CODE_23A02A           
CODE_239E2D:        DEC.w $1028                 
                    BPL   CODE_239E35           
                    INC.w $1041                 
CODE_239E35:        RTS                         

CODE_239E36:        INC.w $1041                 
                    LDY.b #$19                  
CODE_239E3B:        LDA.b #$00                  
                    STA.w $1026,y               
                    DEY                         
                    BPL   CODE_239E3B           
                    LDY.b #$03                  
CODE_239E45:        LDA.b #$FF                  
                    STA.w $1037,y               
                    DEY                         
                    BPL   CODE_239E45           
                    LDA.b #$20                  
                    STA.w $1032                 
                    LDA.b #$DA                  
                    STA.w $1033                 
                    LDA.b #$CE                  
                    STA.w $103B                 
                    LDA.b #$01                  
                    STA.w $1035                 
                    RTS                         

CODE_239E62:        LDA.w $103E                 
                    BEQ   CODE_239E72           
                    INC.w $0422                 
                    LDA.b #$0A                  
                    STA.w $069C                 
                    DEC.w $103E                 
CODE_239E72:        JSR.w CODE_239E76           
                    RTL                         

CODE_239E76:        LDA.w $1034                 
                    JSL.l CODE_20FB1F           

POINTER_239E7D:     dw CODE_239E8F
                    dw CODE_239E99
                    dw CODE_239EC4
                    dw CODE_239EF0
                    dw CODE_239EF7
                    dw CODE_239F46
                    dw CODE_239F7E
                    dw CODE_239F86
                    dw CODE_239FA6
   
CODE_239E8F:        JSR.w CODE_23A269   
                    JSR.w CODE_23A309           
                    STZ.w $02D2                 
                    RTS                         

CODE_239E99:        LDY.w $1028                 
                    LDA.w $1E84,y               
                    AND.b #$80                  
                    BNE   CODE_239EC0           
                    LDA.b #$04                  
                    STA.w $1036                 
                    LDA.w $1028                 
                    STA.b $0A                   
                    JSR.w CODE_23A1C0           
                    LDA.b #$00                  
                    STA.w $102D                 
                    INC.w $1034                 
                    LDA.b #$41                  
                    STA.w $1200                 
                    JMP.w CODE_239EC4           

CODE_239EC0:        DEC.w $1034                 
                    RTS                         

CODE_239EC4:        LDA.w $102D                 
                    BEQ   CODE_239ECD           
                    DEC.w $102D                 
                    RTS                         

CODE_239ECD:        LDA.w $1028                 
                    STA.b $0A                   
                    JSR.w CODE_23A383           
                    DEC.w $1036                 
                    LDA.w $1036                 
                    CMP.b #$FE                  
                    BNE   CODE_239EEA           
                    LDA.w $1028                 
                    STA.b $0A                   
                    JSR.w CODE_23A02A           
                    INC.w $1034                 
CODE_239EEA:        LDA.b #$04                  
                    STA.w $102D                 
                    RTS                         

CODE_239EF0:        INC.w $1030                 
                    JSR.w CODE_23A20B           
                    RTS                         

CODE_239EF7:        LDY.w $1028                 
                    LDA.w $1E84,y               
                    ORA.b #$80                  
                    STA.w $1E84,y               
                    LDA.b #$04                  
                    STA.w $1034                 
                    LDA.w $103D                 
                    BNE   CODE_239F12           
                    JSR.w CODE_23A454           
                    INC.w $0741                 
CODE_239F12:        INC.w $103D                 
                    LDA.w $103D                 
                    CMP.b #$51                  
                    BEQ   CODE_239F20           
                    JSR.w CODE_23A49F           
                    RTS                         

CODE_239F20:        STZ.w $1034                 
                    STZ.w $103D                 
                    LDY.b #$00                  
                    JSR.w CODE_23A4B0           
                    STZ.w $02D2                 
                    LDA.w $0741                 
                    CMP.b #$09                  
                    BNE   CODE_239F45           
                    LDA.b #$06                  
                    STA.w $1034                 
                    LDA.b #$40                  
                    STA.w $102B                 
                    STZ.w $0742                 
                    STZ.w $0741                 
CODE_239F45:        RTS                         

CODE_239F46:        LDA.b #$00                  
                    STA.w $1036                 
                    LDA.b #$01                  
                    STA.b $0B                   
                    INC.w $1034                 
                    INC.w $1034                 
                    LDA.b #$40                  
                    STA.w $102B                 
                    LDY.w $1028                 
                    LDA.w $1E84,y               
                    AND.b #$7F                  
                    STA.w $1E84,y               
                    LDY.w $1029                 
                    LDA.w $1E84,y               
                    AND.b #$7F                  
                    STA.w $1E84,y               
                    LDA.b #$2A                  
                    STA.w $1203                 
                    DEC.w $1035                 
                    BPL   CODE_239F7D           
                    DEC.w $1034                 
CODE_239F7D:        RTS                         

CODE_239F7E:        DEC.w $102B                 
                    BPL   CODE_239F85           
                    INC.b $14                   
CODE_239F85:        RTS                         

CODE_239F86:        LDA.w $102B                 
                    BEQ   CODE_239F8F           
                    DEC.w $102B                 
                    RTS                         

CODE_239F8F:        LDA.b #$00                  
                    STA.w $1036                 
                    LDY.b $0B                   
                    LDA.w $1028,y               
                    STA.b $0A                   
                    JSR.w CODE_23A1C0           
                    INC.w $1034                 
                    LDA.b #$00                  
                    STA.w $102D                 
CODE_239FA6:        LDA.w $102D                 
                    BEQ   CODE_239FAF           
                    DEC.w $102D                 
                    RTS                         

CODE_239FAF:        LDY.b $0B                   
                    LDA.w $1028,y               
                    STA.b $0A                   
                    JSR.w CODE_23A383           
                    INC.w $1036                 
                    LDA.w $1036                 
                    CMP.b #$06                  
                    BCC   CODE_239FE0           
                    LDY.b $0B                   
                    LDA.w $1028,y               
                    STA.b $0A                   
                    JSR.w CODE_23A0DA           
                    DEC.b $0B                   
                    BPL   CODE_239FD7           
                    LDA.b #$00                  
                    STA.w $1034                 
                    RTS                         

CODE_239FD7:        LDA.b #$02                  
                    STA.w $102B                 
                    DEC.w $1034                 
                    RTS                         

CODE_239FE0:        LDA.b #$04                  
                    STA.w $102D                 
                    RTS                         

CODE_239FE6:        LDA.b #$02                  
                    STA.b $0A                   
CODE_239FEA:        JSL.l CODE_22E103           
                    AND.b #$1F                  
                    TAY                         
CODE_239FF1:        LDA.w $1E92                 
                    STA.b $0B                   
                    LDX.b #$0D                  
CODE_239FF8:        LDA.w $1E84,x               
                    STA.w $1E85,x               
                    DEX                         
                    BPL   CODE_239FF8           
                    LDA.b $0B                   
                    STA.w $1E84                 
                    DEY                         
                    BPL   CODE_239FF1           
                    LDX.b #$00                  
CODE_23A00B:        LDA.w $1E84,x               
                    STA.b $0B                   
                    LDA.w $1E89,x               
                    STA.w $1E84,x               
                    LDA.w $1E8E,x               
                    STA.w $1E89,x               
                    LDA.b $0B                   
                    STA.w $1E8E,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_23A00B           
                    DEC.b $0A                   
                    BPL   CODE_239FEA           
                    RTS                         

CODE_23A02A:        REP   #$20                  
                    LDY.b #$3A                  
CODE_23A02E:        LDA.w $9AC3,y               
                    STA.w $1602,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_23A02E           
                    LDA.b $0A                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA.w $9A2E,y               
                    STA.w $102E                 
                    LDY.b #$00                  
                    LDX.b #$04                  
CODE_23A049:        LDA.w $102E                 
                    STA.w $1602,y               
                    SEP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b #$0C                  
                    TAY                         
                    LDA.w $102F                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $102F                 
                    LDA.w $102E                 
                    ADC.b #$00                  
                    STA.w $102E                 
                    REP   #$20                  
                    DEX                         
                    BPL   CODE_23A049           
                    SEP   #$20                  
                    LDY.b $0A                   
                    LDA.w $1E84,y               
                    AND.b #$7F                  
                    STA.b $0B                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $9A52,y               
                    STA.w $1614                 
                    INY                         
                    INY                         
                    LDA.w $9A52,y               
                    STA.w $1616                 
                    INY                         
                    INY                         
                    LDA.w $9A52,y               
                    STA.w $1620                 
                    INY                         
                    INY                         
                    LDA.w $9A52,y               
                    STA.w $1622                 
                    LDA.w #$FFFF                
                    STA.w $163E                 
                    SEP   #$20                  
                    LDA.b #$3C                  
                    STA.w $1600                 
                    LDA.b $0B                   
                    CMP.b #$03                  
                    BCC   CODE_23A0BF           
                    SEC                         
                    SBC.b #$03                  
                    ASL   A                     
                    TAY                         
                    LDA.w $9A87,y               
                    STA.w $162C                 
                    LDA.w $9A8D,y               
                    STA.w $162E                 
CODE_23A0BF:        LDA.b #$F0                  
                    STA.w $081D                 
                    STA.w $0821                 
                    STA.w $0825                 
                    STA.w $0829                 
                    STA.w $082D                 
                    STA.w $0831                 
                    STA.w $0835                 
                    STA.w $0839                 
                    RTS                         

CODE_23A0DA:        REP   #$20                  
                    LDY.b #$3A                  
CODE_23A0DE:        LDA.w $9B3D,y               
                    STA.w $1602,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_23A0DE           
                    LDA.b $0A                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA.w $9A2E,y               
                    STA.w $102E                 
                    LDY.b #$00                  
                    LDX.b #$04                  
CODE_23A0F9:        LDA.w $102E                 
                    STA.w $1602,y               
                    SEP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b #$0C                  
                    TAY                         
                    LDA.w $102F                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $102F                 
                    LDA.w $102E                 
                    ADC.b #$00                  
                    STA.w $102E                 
                    REP   #$20                  
                    DEX                         
                    BPL   CODE_23A0F9           
                    LDA.w #$FFFF                
                    STA.w $163E                 
                    SEP   #$20                  
                    LDA.b #$3C                  
                    STA.w $1600                 
                    LDA.b #$F0                  
                    STA.w $081D                 
                    STA.w $0821                 
                    STA.w $0825                 
                    STA.w $0829                 
                    STA.w $082D                 
                    STA.w $0831                 
                    STA.w $0835                 
                    STA.w $0839                 
                    RTS                         
                    LDY.b #$00                  
                    LDA.b #$01                  
                    STA.b $0A                   
                    LDX.w $1028                 
                    LDA.w $1E84,x               
                    STA.b $0B                   
                    ASL   A                     
                    ASL   A                     
                    TAX                         
CODE_23A155:        REP   #$20                  
                    LDA.w $1033                 
                    STA.w $1602,y               
                    INY                         
                    INY                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $1602,y               
                    INY                         
                    LDA.w $9A52,x               
                    STA.w $1602,y               
                    INY                         
                    INX                         
                    LDA.w $9A52,x               
                    STA.w $1602,y               
                    INY                         
                    INX                         
                    LDA.w $1033                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $1033                 
                    LDA.w $1032                 
                    ADC.b #$00                  
                    STA.w $1032                 
                    DEC.b $0A                   
                    BPL   CODE_23A155           
                    LDA.w $103D                 
                    AND.b #$01                  
                    BEQ   CODE_23A1A1           
                    INC.w $103C                 
                    LDA.w $9A82,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b #$F0                  
                    BNE   CODE_23A1AD           
CODE_23A1A1:        LDA.w $103B                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $103B                 
                    LDA.w $9A82,x               
CODE_23A1AD:        LDX.w $103C                 
                    AND.w $1037,x               
                    STA.w $1037,x               
                    STA.w $1602,y               
                    INY                         
                    LDA.b #$FF                  
                    STA.w $1602,y               
                    RTS                         

CODE_23A1C0:        REP   #$20                  
                    LDY.b #$3C                  
CODE_23A1C4:        LDA.w $9AFF,y               
                    STA.w $1602,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_23A1C4           
                    LDA.b $0A                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA.w $9A2E,y               
                    STA.w $102E                 
                    LDA.w #$003C                
                    STA.w $1600                 
                    LDY.b #$00                  
                    LDX.b #$04                  
CODE_23A1E5:        LDA.w $102E                 
                    STA.w $1602,y               
                    SEP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b #$0C                  
                    TAY                         
                    LDA.w $102F                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $102F                 
                    LDA.w $102E                 
                    ADC.b #$00                  
                    STA.w $102E                 
                    REP   #$20                  
                    DEX                         
                    BPL   CODE_23A1E5           
                    SEP   #$20                  
                    RTS                         

CODE_23A20B:        LDA.w $1030                 
                    AND.b #$01                  
                    BNE   CODE_23A24B           
                    LDY.w $1028                 
                    LDA.w $1E84,y               
                    CMP.w $1031                 
                    BEQ   CODE_23A265           
                    LDA.w $1E84,y               
                    CMP.b #$08                  
                    BNE   CODE_23A22A           
                    LDA.w $1031                 
                    JMP.w CODE_23A239           

CODE_23A22A:        LDA.w $1031                 
                    CMP.b #$08                  
                    BNE   CODE_23A23F           
                    LDA.w $1E84,y               
                    ORA.b #$80                  
                    LDY.w $1029                 
CODE_23A239:        STA.w $1E84,y               
                    JMP.w CODE_23A265           

CODE_23A23F:        INC.w $1034                 
                    INC.w $1034                 
                    LDA.b #$30                  
                    STA.w $102B                 
                    RTS                         

CODE_23A24B:        LDY.w $1028                 
                    STY.w $1029                 
                    LDA.w $1E84,y               
                    STA.w $1031                 
                    LDA.w $1E84,y               
                    ORA.b #$80                  
                    STA.w $1E84,y               
                    LDA.b #$00                  
                    STA.w $1034                 
                    RTS                         

CODE_23A265:        INC.w $1034                 
                    RTS                         

CODE_23A269:        LDA.w $102B                 
                    BEQ   CODE_23A272           
                    DEC.w $102B                 
                    RTS                         

CODE_23A272:        JSR.w CODE_23A4DC           
                    BCC   CODE_23A27B           
                    INC.w $1034                 
                    RTS                         

CODE_23A27B:        LDA.b $17                   
                    AND.b #$0F                  
                    BEQ   CODE_23A2E9           
                    LDA.b #$08                  
                    STA.w $102B                 
                    LDA.b #$01                  
                    STA.w $1203                 
                    LDA.b $17                   
                    AND.b #$08                  
                    BEQ   CODE_23A2A5           
                    LDA.w $1028                 
                    SEC                         
                    SBC.b #$06                  
                    STA.w $1028                 
                    BCS   CODE_23A2A5                   
                    LDA.w $1028                 
                    CLC                         
                    ADC.b #$12                  
                    STA.w $1028                 
CODE_23A2A5:        LDA.b $17                   
                    AND.b #$04                  
                    BEQ   CODE_23A2C4           
                    LDA.w $1028                 
                    CLC                         
                    ADC.b #$06                  
                    STA.w $1028                 
                    LDA.w $1028                 
                    CMP.b #$12                  
                    BCC   CODE_23A2C4           
                    LDA.w $1028                 
                    SEC                         
                    SBC.b #$12                  
                    STA.w $1028                 
CODE_23A2C4:        LDA.b $17                   
                    AND.b #$01                  
                    BEQ   CODE_23A2D9           
                    INC.w $1028                 
                    LDA.w $1028                 
                    CMP.b #$12                  
                    BCC   CODE_23A2D9           
                    LDA.b #$00                  
                    STA.w $1028                 
CODE_23A2D9:        LDA.b $17                   
                    AND.b #$02                  
                    BEQ   CODE_23A2E9           
                    DEC.w $1028                 
                    BPL   CODE_23A2E9           
                    LDA.b #$11                  
                    STA.w $1028                 
CODE_23A2E9:        RTS                         

CODE_23A2EA:        LDA.w $1026                 
                    STA.w $0804,y               
                    LDA.w $1027                 
                    STA.w $0805,y               
                    LDA.w $99CE,x               
                    STA.w $0806,y               
                    LDA.w $99D4,x               
                    STA.w $0807,y               
                    TYA                         
                    CLC                         
                    ADC.b #$04                  
                    TAY                         
                    INX                         
                    RTS                         

CODE_23A309:        LDX.w $1028                 
                    LDA.w $99DA,x               
                    STA.w $1026                 
                    STA.w $102A                 
                    LDA.w $99EC,x               
                    STA.w $1027                 
                    LDX.b #$00                  
                    LDY.b #$00                  
CODE_23A31F:        JSR.w CODE_23A2EA           
                    LDA.w $1026                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1026                 
                    CPX.b #$02                  
                    BCC   CODE_23A31F           
                    LDA.w $1027                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1027                 
                    LDA.w $102A                 
                    STA.w $1026                 
                    JSR.w CODE_23A2EA           
                    LDA.w $1026                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1026                 
                    JSR.w CODE_23A2EA           
                    LDA.w $1027                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1027                 
                    LDA.w $102A                 
                    STA.w $1026                 
CODE_23A35C:        JSR.w CODE_23A2EA           
                    LDA.w $1026                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1026                 
                    CPX.b #$06                  
                    BCC   CODE_23A35C           
                    STY.w $102C                 
                    REP   #$20                  
                    LDA.w #$0202                
                    STA.w $0A20                 
                    STA.w $0A22                 
                    STA.w $0A24                 
                    STA.w $0A26                 
                    SEP   #$20                  
                    RTS                         

CODE_23A383:        LDX.b $0A                   
                    LDA.w $99DA,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $1026                 
                    STA.w $102A                 
                    LDA.w $99EC,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $1027                 
                    LDX.b #$00                  
                    LDY.w $102C                 
CODE_23A39F:        LDA.w $1026                 
                    STA.w $0804,y               
                    STA.w $0808,y               
                    INY                         
                    LDA.w $1027                 
                    STA.w $0804,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0808,y               
                    INY                         
                    JSR.w CODE_23A439           
                    STA.w $0804,y               
                    CPX.b #$02                  
                    BCC   CODE_23A3C7           
                    LDA.b $00                   
                    STA.w $0808,y               
                    BRA   CODE_23A3CB           

CODE_23A3C7:        INC   A                     
                    STA.w $0808,y               
CODE_23A3CB:        INY                         
                    LDA.b #$00                  
                    LDA.b #$0C                  
                    STA.w $0804,y               
                    STA.w $0808,y               
                    TYA                         
                    CLC                         
                    ADC.b #$05                  
                    TAY                         
                    INX                         
                    CPX.b #$04                  
                    BCS   CODE_23A400                  
                    LDA.w $1026                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $1026                 
                    TXA                         
                    AND.b #$01                  
                    BNE   CODE_23A3FD           
                    LDA.w $1027                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1027                 
                    LDA.w $102A                 
                    STA.w $1026                 
CODE_23A3FD:        JMP.w CODE_23A39F           

CODE_23A400:        LDA.w $0827                 
                    ORA.b #$40                  
                    STA.w $0827                 
                    LDA.w $082B                 
                    ORA.b #$40                  
                    STA.w $082B                 
                    LDA.w $0833                 
                    ORA.b #$80                  
                    STA.w $0833                 
                    LDA.w $0837                 
                    ORA.b #$40                  
                    STA.w $0837                 
                    LDA.w $083B                 
                    ORA.b #$C0                  
                    STA.w $083B                 
                    REP   #$20                  
                    STZ.w $0A27                 
                    STZ.w $0A29                 
                    STZ.w $0A2B                 
                    STZ.w $0A2D                 
                    SEP   #$20                  
                    RTS                         

CODE_23A439:        STX.b $0A                   
                    LDX.w $1036                 
                    LDA.w $9A17,x               
                    CLC                         
                    ADC.b $0A                   
                    TAX                         
                    LDA.w $9A03,x               
                    LDX.b $0A                   
                    CPX.b #$02                  
                    BCS   CODE_23A450                   
                    STA.b $00                   
CODE_23A450:        RTS                        

DATA_23A451:        db $01,$02,$09

CODE_23A454:        LDY.w $1028    
                    LDA.w $1E84,y                 
                    AND.b #$0F                  
                    STA.b $0C                   
                    CMP.b #$03                  
                    BNE   CODE_23A46F           
                    LDX.w $0726                 
                    INC.w $0736,x               
                    LDA.b #$05                  
                    STA.w $1203                 
                    BNE   CODE_23A49E           
CODE_23A46F:        CMP.b #$04                  
                    BCC   CODE_23A48A           
                    LDY.b #$0A                  
                    CMP.b #$04                  
                    BEQ   CODE_23A47B           
                    LDY.b #$14                  
CODE_23A47B:        TYA                         
                    CLC                         
                    ADC.w $103E                 
                    STA.w $103E                 
                    LDA.b #$01                  
                    STA.w $1203                 
                    BNE   CODE_23A49E           
CODE_23A48A:        LDA.b $0C                   
                    CMP.b #$03                  
                    BCS   CODE_23A49E                   
                    TAX                         
                    LDA   DATA_23A451,x             
                    JSL.l CODE_20F634           
                    LDA.b #$29                  
                    STA.w $1203                 
CODE_23A49E:        RTS                         

CODE_23A49F:        LDA.w $103D                 
                    DEC   A                     
                    PHA                         
                    AND.b #$06                  
                    TAY                         
                    PLA                         
                    AND.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02D2                 
CODE_23A4B0:        REP   #$20                  
                    LDA.w $9A93,y               
                    STA.w $1386                 
                    LDA.w $9A9B,y               
                    STA.w $1392                 
                    LDA.w $9AA3,y               
                    STA.w $1394                 
                    LDA.w $9AAB,y               
                    STA.w $1396                 
                    LDA.w $9AB3,y               
                    STA.w $1398                 
                    LDA.w $9ABB,y               
                    STA.w $139C                 
                    SEP   #$20                  
                    INC.w $1500                 
                    RTS                         

CODE_23A4DC:        LDA.b $18                   
                    AND.b #$C0                  
                    BNE   CODE_23A4EC           
                    LDX.w $0726                 
                    LDA.w $F8,x               
                    AND.b #$C0                  
                    BEQ   CODE_23A4EE           
CODE_23A4EC:        SEC                         
                    RTS                         

CODE_23A4EE:        CLC                         
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

DATA_23A540:        db $32,$50,$AD,$C1,$32,$50,$AD,$C1

CODE_23A548:        LDX.b #$00
CODE_23A54A:        LDA.b #$02
                    JSL.l CODE_2098A8               
                    JSL.l CODE_209844    
                    CPX.b #$F0
                    BNE   CODE_23A54A           
                    LDX.b #$D0                  
CODE_23A55A:        LDA.b #$50                  
                    JSL.l CODE_209844           
                    CPX.b #$F0                  
                    BNE   CODE_23A55A           
                    JSL.l CODE_20990B           
                    RTL                         

CODE_23A569:        LDA.b $0E                   
                    AND.b #$E0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $0706                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.w $A379,x               
                    TAX                         
                    DEX                         
                    TXA                         
                    JSL.l CODE_20FB3A           

POINTER_23A585:     dl CODE_23A5FE
                    dl CODE_23A603
                    dl CODE_23A608
                    dl CODE_23A920
                    dl CODE_23A61F

                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00
    
POINTER_23A5CD:     dl CODE_23A6C1
                    dl CODE_23A6C1
                    dl CODE_23A6C1
                    dl CODE_23A728
                    dl CODE_23A728
                    dl CODE_23A81D
                    dl CODE_23A81D
                    dl CODE_23A8AE
                    dl CODE_23A8AE

CODE_23A5E8:        LDA.b $0E                   
                    AND.b #$E0                  
                    LSR   A                     
                    CLC                         
                    ADC.w $0706                 
                    TAX                         
                    JSL.l CODE_20FB1F           

POINTER_23A5F6:     dw CODE_23A635
                    dw CODE_23A63A
                    dw CODE_23A658
                    dw CODE_23A660

CODE_23A5FE:        LDX.b #$00
                    JMP.w CODE_23A60A

CODE_23A603:        LDX.b #$01
                    JMP.w CODE_23A60A

CODE_23A608:        LDX.b #$02
CODE_23A60A:        LDA.w $0706
                    AND.b #$0F                  
                    STA.b $00                   
                    LDY.w $0700                 
CODE_23A614:        LDA.w $A464,x               
                    STA.b [$2E],y               
                    INY                         
                    DEC.b $00                   
                    BPL   CODE_23A614           
                    RTL                         

CODE_23A61F:        LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDY.w $0700                 
CODE_23A628:        LDA.b #$C0                  
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    DEX                         
                    BPL   CODE_23A628           
                    RTL                         

CODE_23A635:        LDX.b #$00                  
                    JMP.w CODE_23A63C           

CODE_23A63A:        LDX.b #$04                  
CODE_23A63C:        LDY.w $0700                 
CODE_23A63F:        LDA.w $A467,x               
                    STA.b [$2E],y               
                    INY                         
                    INX                         
                    TXA                         
                    AND.b #$01                  
                    BNE   CODE_23A63F           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    TXA                         
                    AND.b #$03                  
                    BNE   CODE_23A63F           
                    RTL                         

CODE_23A658:        LDY.w $0700                 
                    LDA.b #$BC                  
                    STA.b [$2E],y               
                    RTL                         

CODE_23A660:        LDX.b #$00                  
CODE_23A662:        LDY.w $0700                 
                    LDA.b #$09                  
                    STA.b $00                   
CODE_23A669:        LDA.w $A46F,x               
                    STA.b [$2E],y               
                    INY                         
                    INX                         
                    DEC.b $00                   
                    BPL   CODE_23A669           
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    CPX.b #$14                  
                    BNE   CODE_23A662           
                    RTL                         

CODE_23A682:        LDY.w $0700                 
                    LDA.b #$42                  
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.b #$42                  
                    STA.b [$2E],y               
                    RTL                         

CODE_23A699:        LDY.w $0700                 
                    LDA.b #$00                  
                    STA.b [$2E],y               
                    REP   #$30                  
                    TYA                         
                    ORA.w #$2000                
                    TAY                         
                    LDA.w #$0100                
                    XBA                         
                    SEP   #$20                  
                    STA.b [$2E],y               
                    SEP   #$10                  
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.b #$43                  
                    STA.b [$2E],y               
                    RTL                         

CODE_23A6C1:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    SEC                         
                    SBC.b #$90                  
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
                    LDA.w $A483,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.w $A484,x               
                    STA.b [$2E],y               
                    BRA   CODE_23A706           

CODE_23A6F3:        LDY.w $0700                 
                    LDA.b #$BA                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.b #$BB                  
                    STA.b [$2E],y               
CODE_23A706:        JSL.l CODE_2AB73A           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $02                   
                    BPL   CODE_23A6F3           
                    RTL                         

CODE_23A728:        LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$C0                  
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    PLA                         
                    AND.b #$0F                  
                    STA.b $02                   
CODE_23A73A:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
CODE_23A742:        LDY.w $0700                 
                    LDA.b #$BA                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.b #$BB                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $02                   
                    BNE   CODE_23A742           
                    LDY.w $0700                 
                    LDA.w $A483,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.w $A484,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    RTL                         

CODE_23A790:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDX.b #$06                  
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
                    LDA.b [$2E],y               
                    CMP.w $A483,x               
                    BEQ   CODE_23A7C3           
                    LDA.w $A483,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.w $A484,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    BRA   CODE_23A7DA           

CODE_23A7C3:        LDY.w $0700                 
                    LDA.b #$BA                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.b #$BB                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
CODE_23A7DA:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $02                   
                    BNE   CODE_23A7C3           
                    LDY.w $0700                 
                    LDA.w $A483,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    LDA.w $A484,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    RTL                         

CODE_23A811:        LDX.b #$08                  
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    JMP.w CODE_23A73A           

CODE_23A81D:        LDA.w $0706                 
                    SEC                         
                    SBC.b #$E0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
CODE_23A828:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
                    LDA.w $A48D,x               
                    STA.b [$2E],y               
                    BRA   CODE_23A857           

CODE_23A841:        LDA.b [$2E],y               
                    CMP.b #$BA                  
                    BEQ   CODE_23A84F           
                    CMP.b #$BB                  
                    BEQ   CODE_23A853           
                    LDA.b #$B8                  
                    BRA   CODE_23A855           

CODE_23A84F:        LDA.b #$A5                  
                    BRA   CODE_23A855           

CODE_23A853:        LDA.b #$A6                  
CODE_23A855:        STA.b [$2E],y               
CODE_23A857:        JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23A841           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDA.w $A490,x               
                    STA.b [$2E],y               
                    BRA   CODE_23A8A1           

CODE_23A88B:        LDA.b [$2E],y               
                    CMP.b #$BA                  
                    BEQ   CODE_23A899           
                    CMP.b #$BB                  
                    BEQ   CODE_23A89D           
                    LDA.b #$B9                  
                    BRA   CODE_23A89F           

CODE_23A899:        LDA.b #$AA                  
                    BRA   CODE_23A89F           

CODE_23A89D:        LDA.b #$AB                  
CODE_23A89F:        STA.b [$2E],y               
CODE_23A8A1:        JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23A88B           
                    RTL                         

CODE_23A8AE:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    SEC                         
                    SBC.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23A8CB:        LDA.b #$B8                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BNE   CODE_23A8CB           
                    LDA.w $A48D,x               
                    STA.b [$2E],y               
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
CODE_23A901:        LDA.b #$B9                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BNE   CODE_23A901           
                    LDA.w $A490,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    RTL                         

CODE_23A91B:        LDX.b #$02                  
                    JMP.w CODE_23A828           

CODE_23A920:        LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23A92A:        LDX.b #$41                  
                    JSR.w CODE_23BE71           
                    CMP.b #$00                  
                    BNE   CODE_23A935           
                    LDX.b #$40                  
CODE_23A935:        TXA                         
                    STA.b [$2E],y               
                    INC.b $0F                   
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23A92A           
                    RTL                         

CODE_23A943:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDX.b #$00                  
                    STX.b $03                   
CODE_23A94F:        LDA.b #$19                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23A956:        LDA.w $A493,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEC.b $02                   
                    BPL   CODE_23A956           
                    LDA.b [$2E],y               
                    CMP.b #$2C                  
                    BEQ   CODE_23A978           
                    CMP.b #$9A                  
                    BNE   CODE_23A987           
CODE_23A978:        LDA.b #$0D                  
                    STA.b [$2E],y               
                    LDA.b $2F                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $2F                   
                    LDA.b #$01                  
                    STA.b [$2E],y               
CODE_23A987:        REP   #$20                  
                    LDA.b $00                   
                    STA.b $2E                   
                    SEP   #$20                  
                    LDY.w $0700                 
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23A9D6           
                    LDA.w $070A                 
                    CMP.b #$01                  
                    BEQ   CODE_23A9B7           
                    CMP.b #$04                  
                    BEQ   CODE_23A9B7           
                    CMP.b #$0C                  
                    BEQ   CODE_23A9B7           
                    CMP.b #$09                  
                    BEQ   CODE_23A9B7           
                    CMP.b #$03                  
                    BEQ   CODE_23A9B7           
                    CMP.b #$0E                  
                    BEQ   CODE_23A9B7           
                    CMP.b #$0D                  
                    BNE   CODE_23A9C0           
CODE_23A9B7:        LDA.b $03                   
                    CMP.b #$01                  
                    BNE   CODE_23A9C0           
                    JSR.w CODE_23A9E5           
CODE_23A9C0:        REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    INC.b $03                   
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
CODE_23A9D6:        STY.w $0700                 
                    LDX.b #$01                  
                    LDA.b $03                   
                    CMP.b #$02                  
                    BEQ   CODE_23A9E4           
                    JMP.w CODE_23A94F           

CODE_23A9E4:        RTL                         

CODE_23A9E5:        PHB                         
                    LDA.b #$2A                  
                    PHA                         
                    PLB                         
                    INC.b $2F                   
                    LDA.b $2E                   
                    CLC                         
                    ADC.b #$40                  
                    STA.b $2E                   
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDY.b #$00                  
                    STY.b $06                   
                    LDX.b #$06                  
                    LDA.w $070A                 
CODE_23AA02:        CMP.w $B9F1,x               
                    BEQ   CODE_23AA0A           
                    DEX                         
                    BNE   CODE_23AA02           
CODE_23AA0A:        TXA                         
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w $B9E3,x               
                    STA.b $0C                   
                    LDA.w $BBD8,x               
                    STA.b $D8                   
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$2000                
                    STA.b $DB                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DD                   
CODE_23AA27:        LDX.b #$0F                  
CODE_23AA29:        LDA.b ($0C),y               
                    STA.b [$2E],y               
                    LDA.b ($D8),y               
                    STA.b [$DB],y               
                    INY                         
                    DEX                         
                    BPL   CODE_23AA29           
                    INC.b $06                   
                    LDA.b $06                   
                    CMP.b #$06                  
                    BNE   CODE_23AA27           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    PLB                         
                    RTS                         

CODE_23AA47:        TXA                         
                    SEC                         
                    SBC.b #$10                  
                    TAX                         
                    LDY.w $0700                 
                    CPX.b #$0B                  
                    BEQ   CODE_23AA57           
                    CPX.b #$0F                  
                    BNE   CODE_23AA67           
CODE_23AA57:        JSR.w CODE_23BE71           
                    CMP.b #$00                  
                    BEQ   CODE_23AA67           
                    LDA.b #$5F                  
                    CPX.b #$0B                  
                    BEQ   CODE_23AA6A           
                    JMP.w CODE_23AA89           

CODE_23AA67:        LDA.w $A495,x               
CODE_23AA6A:        STA.b [$2E],y               
                    PHA                         
                    JSL.l CODE_2AB73A           
                    PLA                         
                    CMP.b #$70                  
                    BNE   CODE_23AA89           
                    TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    SBC.b #$00                  
                    STA.b $2F                   
                    LDA.b #$C1                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
CODE_23AA89:        RTL                         

CODE_23AA8A:        LDA.w $0706                 
                    SEC                         
                    SBC.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
CODE_23AA95:        LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23AA9F:        CPX.b #$07                  
                    BNE   CODE_23AAAA           
                    JSR.w CODE_23BE71           
                    CMP.b #$00                  
                    BNE   CODE_23AAB3           
CODE_23AAAA:        LDA.w $A4AE,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
CODE_23AAB3:        JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23AA9F           
                    RTL                         

CODE_23AABC:        LDX.b #$08                  
                    JMP.w CODE_23AA95           

CODE_23AAC1:        LDX.b #$00                  
                    LDY.b #$00                  
                    BRA   CODE_23AAD1           

CODE_23AAC7:        LDX.b #$15                  
                    LDY.b #$01                  
                    BRA   CODE_23AAD1           

CODE_23AACD:        LDX.b #$22                  
                    LDY.b #$02                  
CODE_23AAD1:        LDA.b $30                   
                    STA.b $DA                   
                    STZ.b $DB                   
                    LDA.w $1EBF                 
                    CMP.b #$01                  
                    BEQ   CODE_23AAF2           
                    CMP.b #$14                  
                    BEQ   CODE_23AAF2           
                    CMP.b #$1C                  
                    BEQ   CODE_23AAF2           
                    CMP.b #$1F                  
                    BEQ   CODE_23AAF2           
                    CMP.b #$20                  
                    BEQ   CODE_23AAF2           
                    CMP.b #$29                  
                    BNE   CODE_23AAF4           
CODE_23AAF2:        INC.b $DB                   
CODE_23AAF4:        REP   #$21                  
                    LDA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    STY.b $0C                   
CODE_23AAFE:        LDY.b $0C                   
                    LDA.w $A5B0,y               
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23AB08:        REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $DB                   
                    BNE   CODE_23AB1C           
                    LDA.w $A4B7,x               
                    BRA   CODE_23AB1F           

CODE_23AB1C:        LDA.w $A50A,x               
CODE_23AB1F:        CMP.b #$80                  
                    BNE   CODE_23AB26           
                    JMP.w CODE_23ABE9           

CODE_23AB26:        STA.b $03                   
                    CMP.b #$92                  
                    BEQ   CODE_23AB34           
                    CMP.b #$93                  
                    BNE   CODE_23AB3B           
                    LDA.b $DB                   
                    BNE   CODE_23AB3B           
CODE_23AB34:        LDA.b #$00                  
                    STA.b [$D8],y               
                    JMP.w CODE_23ABD9           

CODE_23AB3B:        LDA.b $DB                   
                    BNE   CODE_23AB46           
                    LDA.b [$D8],y               
                    BEQ   CODE_23AB46           
CODE_23AB43:        JMP.w CODE_23ABE9           

CODE_23AB46:        LDA.w $A55D,x               
                    STA.b [$D8],y               
                    BEQ   CODE_23AB50           
                    JMP.w CODE_23ABD9           

CODE_23AB50:        LDA.b [$2E],y               
                    CMP.b #$03                  
                    BEQ   CODE_23ABBB           
                    CMP.b #$90                  
                    BCC   CODE_23ABD9           
                    CMP.b #$9F                  
                    BCS   CODE_23ABD9                   
                    CMP.b $03                   
                    BEQ   CODE_23AB43           
                    LDA.b $DB                   
                    BEQ   CODE_23AB8C           
                    LDA.b $03                   
                    CMP.b #$94                  
                    BEQ   CODE_23AB70           
                    CMP.b #$95                  
                    BNE   CODE_23AB8C           
CODE_23AB70:        LDA.b [$2E],y               
                    CMP.b #$94                  
                    BEQ   CODE_23ABD5           
                    CMP.b #$91                  
                    BEQ   CODE_23ABBB           
                    CMP.b #$95                  
                    BEQ   CODE_23ABBB           
                    CMP.b #$98                  
                    BEQ   CODE_23ABD5           
                    LDA.b #$01                  
                    STA.b [$D8],y               
                    LDA.b #$03                  
                    STA.b $03                   
                    BRA   CODE_23ABD9           

CODE_23AB8C:        LDA.b $03                   
                    CMP.b #$94                  
                    BCS   CODE_23ABBB                   
                    INC.b $03                   
                    INC.b $03                   
                    LDA.w $1EBF                 
                    CMP.b #$01                  
                    BEQ   CODE_23ABAB           
                    LDA.w $0727                 
                    CMP.b #$06                  
                    BNE   CODE_23ABD9           
                    LDA.w $1EBF                 
                    CMP.b #$29                  
                    BNE   CODE_23ABD9           
CODE_23ABAB:        LDA.b [$2E],y               
                    CMP.b #$98                  
                    BNE   CODE_23ABD9           
                    LDA.b #$01                  
                    STA.b [$D8],y               
                    LDA.b #$02                  
                    STA.b $03                   
                    BRA   CODE_23ABD9           

CODE_23ABBB:        LDA.b $DB                   
                    BEQ   CODE_23ABD5           
                    LDA.b $03                   
                    CMP.b #$93                  
                    BEQ   CODE_23ABD9           
                    LDA.b [$2E],y               
                    INC   A                     
                    INC   A                     
                    STA.b $03                   
                    AND.b #$F0                  
                    BNE   CODE_23ABD9           
                    LDA.b #$01                  
                    STA.b [$D8],y               
                    BRA   CODE_23ABD9           

CODE_23ABD5:        LDA.b #$98                  
                    STA.b $03                   
CODE_23ABD9:        LDA.b $03                   
                    STA.b [$2E],y               
                    CMP.b #$98                  
                    BNE   CODE_23ABE5           
                    JSL.l CODE_2AB73A           
CODE_23ABE5:        JSL.l CODE_2A8794           
CODE_23ABE9:        JSL.l CODE_23BEBB           
                    INX                         
                    DEC.b $02                   
                    BMI   CODE_23ABF5           
                    JMP.w CODE_23AB08           

CODE_23ABF5:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.w $A4B7,x               
                    CMP.b #$FF                  
                    BEQ   CODE_23AC18           
                    JMP.w CODE_23AAFE           

CODE_23AC18:        RTL                         

CODE_23AC19:        JSR.w CODE_23ACF3           
CODE_23AC1C:        LDA.w $A5B3,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23AC1C           
                    RTL                         

CODE_23AC2A:        JSR.w CODE_23ACF3           
CODE_23AC2D:        LDA.w $A5B5,x               
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEC.b $02                   
                    BPL   CODE_23AC2D           
                    RTL                         

CODE_23AC42:        JSR.w CODE_23ACF3           
CODE_23AC45:        LDA.w $A5B7,x               
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23AC45           
                    RTL                         

CODE_23AC61:        JSR.w CODE_23ACF3           
CODE_23AC64:        LDA.w $A5B9,x               
                    STA.b [$2E],y               
                    TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    STA.w $0700                 
                    LDA.b $2F                   
                    SBC.b #$00                  
                    STA.b $2F                   
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23AC64           
                    RTL                         

CODE_23AC80:        JSR.w CODE_23ACF3           
CODE_23AC83:        LDA.w $A5BB,x               
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.w $A5BD,x               
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STY.w $0700                 
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23AC83           
                    RTL                         

CODE_23ACAF:        JSR.w CODE_23ACF3           
CODE_23ACB2:        LDA.w $A5BF,x               
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.w $A5C1,x               
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEY                         
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$0F                  
                    BNE   CODE_23ACEE           
                    LDA.b $2E                   
                    SEC                         
                    SBC.b #$B0                  
                    STA.b $2E                   
                    LDA.b $2F                   
                    SBC.b #$01                  
                    STA.b $2F                   
                    INY                         
                    TYA                         
                    AND.b #$F0                  
                    ORA.b #$0F                  
                    TAY                         
CODE_23ACEE:        DEC.b $02                   
                    BPL   CODE_23ACB2           
                    RTL                         

CODE_23ACF3:        LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
                    LDX.b #$00                  
                    LDA.w $070A                 
                    CMP.b #$02                  
                    BNE   CODE_23AD08           
                    LDX.b #$01                  
CODE_23AD08:        RTS                         

CODE_23AD09:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.b $02                   
                    REP   #$20                  
                    INC.b $2B                   
                    LDA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $03                   
                    LDX.b #$00                  
CODE_23AD22:        STZ.b $D8                   
                    LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    BPL   CODE_23AD3A           
                    LDA.w $0727                 
                    CMP.b #$04                  
                    BNE   CODE_23AD3A           
                    DEC.b $04                   
                    LDA.b #$8B                  
                    STA.b $D8                   
CODE_23AD3A:        LDA.b $D8                   
                    BNE   CODE_23AD41           
                    LDA.w $A5C3,x               
CODE_23AD41:        STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    LDA.b $04                   
                    CMP.b #$FF                  
                    BNE   CODE_23AD3A           
                    REP   #$20                  
                    LDA.b $00                   
                    STA.b $2E                   
                    SEP   #$20                  
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDX.b #$01                  
                    DEC.b $03                   
                    BPL   CODE_23AD22           
                    RTL                         

CODE_23AD6F:        LDX.b #$00                  
                    BEQ   CODE_23AD75           
CODE_23AD73:        LDX.b #$01                  
CODE_23AD75:        STX.b $02                   
                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $03                   
                    LDY.w $0700                 
CODE_23AD89:        LDX.b $02                   
                    LDA.w $A5C5,x               
                    STA.b [$2E],y               
CODE_23AD90:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BNE   CODE_23ADA8           
                    LDA.w $A5C7,x               
                    STA.b [$2E],y               
                    BRA   CODE_23AD90           

CODE_23ADA8:        TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    SBC.b #$00                  
                    STA.b $2F                   
                    LDA.w $A5C9,x               
                    STA.b [$2E],y               
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDY.w $0700                 
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23ADDD           
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
CODE_23ADDD:        STY.w $0700                 
CODE_23ADE0:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.b [$2E],y               
                    CMP.w $A5CF,x               
                    BNE   CODE_23ADF9           
                    LDA.w $A5CD,x               
                    STA.b [$2E],y               
                    BRA   CODE_23ADE0           

CODE_23ADF9:        DEC.b $03                   
                    BMI   CODE_23AE2D           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDX.b #$02                  
                    LDY.w $0700                 
CODE_23AE0A:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23AE24           
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
CODE_23AE24:        DEX                         
                    BPL   CODE_23AE0A           
                    STY.w $0700                 
                    JMP.w CODE_23AD89           

CODE_23AE2D:        RTL                         

CODE_23AE2E:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDY.w $0700                 
                    LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
CODE_23AE3F:        LDA.b #$9C                  
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEX                         
                    BPL   CODE_23AE3F           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDA.b #$90                  
                    STA.b [$2E],y               
                    JMP.w CODE_23AE73           

CODE_23AE6F:        LDA.b #$8E                  
                    STA.b [$2E],y               
CODE_23AE73:        JSL.l CODE_23BEBB           
                    DEX                         
                    BPL   CODE_23AE6F           
                    RTL                         

CODE_23AE7B:        LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDY.w $0700                 
                    LDA.b #$76                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEX                         
                    BMI   CODE_23AEC6           
                    LDA.b #$77                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEX                         
                    BMI   CODE_23AEC6           
CODE_23AEB0:        LDA.b #$78                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEX                         
                    BPL   CODE_23AEB0           
CODE_23AEC6:        RTL                         

CODE_23AEC7:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$40                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    PLA                         
                    AND.b #$0F                  
                    STA.b $02                   
                    STA.b $03                   
                    LDY.w $0700                 
CODE_23AEE5:        LDA.w $A5CF,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    BPL   CODE_23AEE5           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.b $02                   
                    STA.b $03                   
CODE_23AF14:        LDA.w $A5D1,x               
                    CMP.b #$C1                  
                    BEQ   CODE_23AF29           
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    BPL   CODE_23AF14           
CODE_23AF29:        RTL                         

CODE_23AF2A:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.b $02                   
                    REP   #$20                  
                    INC.b $2B                   
                    LDA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$60                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    PLA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    LDA.b $02                   
                    STA.b $04                   
                    LDY.w $0700                 
                    LDA.w $02BF                 
                    CMP.b #$01                  
                    BEQ   CODE_23AF69           
                    CMP.b #$05                  
                    BEQ   CODE_23AF69           
                    CMP.b #$06                  
                    BEQ   CODE_23AF69           
                    CMP.b #$07                  
                    BEQ   CODE_23AF69           
                    CMP.b #$0D                  
                    BNE   CODE_23AF6D           
CODE_23AF69:        CPX.b #$02                  
                    BEQ   CODE_23AF87           
CODE_23AF6D:        LDA.w $A5D3,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    LDA.b $04                   
                    CMP.b #$FF                  
                    BNE   CODE_23AF6D           
CODE_23AF82:        DEC.b $03                   
                    BPL   CODE_23AFB1           
                    RTL                         

CODE_23AF87:        LDX.b #$08                  
                    LDA.w $A5D3,x               
                    STA.b [$2E],y               
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    ORA.w #$2000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.b [$2E],y               
                    SEP   #$10                  
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    LDA.b $04                   
                    CMP.b #$FF                  
                    BNE   CODE_23AF87           
                    DEC.b $03                   
                    BPL   CODE_23AFB1           
                    RTL                         

CODE_23AFB1:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.b $02                   
                    STA.b $04                   
CODE_23AFCF:        CPX.b #$07                  
                    BNE   CODE_23AFE2           
                    REP   #$30                  
                    TYA                         
                    ORA.w #$2000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.b [$2E],y               
                    SEP   #$10                  
CODE_23AFE2:        CPX.b #$08                  
                    BEQ   CODE_23AFFE           
                    LDA.w $A5DC,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    LDA.b $04                   
                    CMP.b #$FF                  
                    BNE   CODE_23AFCF           
                    JMP.w CODE_23AF82           

CODE_23AFFE:        LDA.w $A5DC,x               
                    STA.b [$2E],y               
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    ORA.w #$2000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.b [$2E],y               
                    SEP   #$10                  
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    LDA.b $04                   
                    CMP.b #$FF                  
                    BNE   CODE_23AFCF           
                    JMP.w CODE_23AF82           

CODE_23B024:        LDX.b #$01                  
                    BEQ   CODE_23B02A           
CODE_23B028:        LDX.b #$00                  
CODE_23B02A:        LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23B034:        LDA.w $A5E5,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23B034           
                    RTL                         

CODE_23B042:        LDX.b #$02                  
                    LDA.w $0706                 
                    JMP.w CODE_23B057           

CODE_23B04A:        LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$50                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    PLA                         
CODE_23B057:        AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23B05E:        LDA.w $A5E7,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BPL   CODE_23B05E           
                    RTL                         

CODE_23B06C:        LDY.w $0700                 
                    LDA.b #$06                  
                    STA.b [$2E],y               
                    RTL                         

CODE_23B074:        LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDY.w $0700                 
CODE_23B07D:        LDA.b #$5B                  
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEX                         
                    BPL   CODE_23B07D           
                    RTL                         

CODE_23B089:        STX.b $0B                   
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $02                   
                    SEP   #$20                  
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $00                   
                    LDX.b #$00                  
CODE_23B09C:        TXA                         
                    LDX.b $0B                   
                    CLC                         
                    ADC.w $A644,x               
                    STA.b $0C                   
                    TAX                         
                    LDA.w $0706                 
                    AND.b #$C0                  
                    STA.b $01                   
                    LDY.w $0700                 
                    CPX.b #$06                  
                    BNE   CODE_23B0C8           
                    LDA.w $0350                 
                    CMP.b #$0C                  
                    BNE   CODE_23B0C8           
                    LDA.b [$2E],y               
                    CMP.b #$80                  
                    BEQ   CODE_23B0C8           
                    JSR.w CODE_23B1A5           
                    LDA.b #$0A                  
                    BRA   CODE_23B0CB           

CODE_23B0C8:        LDA.w $A5EA,x               
CODE_23B0CB:        STA.b [$2E],y               
CODE_23B0CD:        JSR.w CODE_23B36A           
                    LDA.b [$2E],y               
                    CMP.b #$53                  
                    BEQ   CODE_23B0FB           
                    CMP.b #$55                  
                    BEQ   CODE_23B0FB           
                    LDX.b $0C                   
                    CPX.b #$06                  
                    BNE   CODE_23B0F4           
                    LDA.w $0350                 
                    CMP.b #$0C                  
                    BNE   CODE_23B0F4           
                    LDA.b [$2E],y               
                    CMP.b #$80                  
                    BEQ   CODE_23B0F4           
                    JSR.w CODE_23B1A5           
                    LDA.b #$0B                  
                    BRA   CODE_23B0F7           

CODE_23B0F4:        LDA.w $A5F6,x               
CODE_23B0F7:        STA.b [$2E],y               
                    BRA   CODE_23B0CD           

CODE_23B0FB:        TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    SBC.b #$00                  
                    STA.b $2F                   
                    LDX.b $0C                   
                    CPX.b #$06                  
                    BNE   CODE_23B11D           
                    LDA.w $0350                 
                    CMP.b #$0C                  
                    BNE   CODE_23B11D           
                    LDA.b [$2E],y               
                    CMP.b #$0B                  
                    BNE   CODE_23B11D           
                    LDA.b #$0C                  
                    BRA   CODE_23B120           

CODE_23B11D:        LDA.w $A602,x               
CODE_23B120:        STA.b [$2E],y               
                    REP   #$20                  
                    LDA.b $02                   
                    STA.b $2E                   
                    SEP   #$20                  
                    LDY.w $0700                 
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23B153           
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $02                   
                    SEP   #$20                  
                    LDA.b $03                   
                    STA.b $04                   
                    LDA.b $0E                   
                    AND.b #$10                  
                    BNE   CODE_23B153           
                    INC.b $04                   
CODE_23B153:        STY.w $0700                 
                    DEC.b $00                   
                    LDX.b #$01                  
                    LDA.b $00                   
                    CMP.b #$01                  
                    BPL   CODE_23B165           
                    INX                         
                    CMP.b #$00                  
                    BNE   CODE_23B16A           
CODE_23B165:        STX.b $0C                   
                    JMP.w CODE_23B09C           

CODE_23B16A:        LDA.b [$2E],y               
                    CMP.b #$80                  
                    BEQ   CODE_23B182           
                    CMP.b #$90                  
                    BCC   CODE_23B17C           
                    CMP.b #$9F                  
                    BCS   CODE_23B17C                   
                    LDA.b #$9D                  
                    BRA   CODE_23B180           

CODE_23B17C:        AND.b #$C0                  
                    ORA.b #$0B                  
CODE_23B180:        STA.b [$2E],y               
CODE_23B182:        JSR.w CODE_23B36A           
                    LDA.b [$2E],y               
                    CMP.b #$53                  
                    BEQ   CODE_23B18F           
                    CMP.b #$57                  
                    BNE   CODE_23B190           
CODE_23B18F:        RTL                         

CODE_23B190:        LDX.b #$18                  
                    LDA.b [$2E],y               
CODE_23B194:        CMP.w $A60E,x               
                    BEQ   CODE_23B19E           
                    DEX                         
                    BPL   CODE_23B194           
                    BRA   CODE_23B182           

CODE_23B19E:        LDA.w $A627,x               
                    STA.b [$2E],y               
                    BRA   CODE_23B182           

CODE_23B1A5:        PHX                         
                    PHY                         
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    ORA.w #$2000                
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.b [$2E],y               
                    SEP   #$10                  
                    PLY                         
                    PLX                         
                    RTS                         

CODE_23B1BC:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    SEC                         
                    SBC.b #$50                  
                    PHA                         
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $02                   
                    PLA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    STA.b $05                   
                    STZ.b $04                   
CODE_23B1DC:        LDX.b $02                   
                    LDA.b $04                   
                    CLC                         
                    ADC.w $A644,x               
                    TAX                         
                    LDY.w $0700                 
                    LDA.w $A648,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $05                   
CODE_23B1F3:        LDA.w $A654,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $05                   
                    LDA.b $05                   
                    CMP.b #$01                  
                    BNE   CODE_23B1F3           
                    LDA.w $A660,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.b $03                   
                    STA.b $05                   
                    INC.b $04                   
                    LDA.b $04                   
                    CMP.b #$02                  
                    BNE   CODE_23B1DC           
                    RTL                         

CODE_23B233:        LDA.b #$3B                  
                    STA.w $05ED                 
                    JSL.l CODE_22E103           
                    RTL                         

CODE_23B23D:        LDY.w $0700                 
CODE_23B240:        LDA.b [$2E],y               
                    CMP.b #$80                  
                    BEQ   CODE_23B24A           
                    CMP.b #$80                  
                    BNE   CODE_23B253           
CODE_23B24A:        LDA.b #$85                  
                    STA.b [$2E],y               
                    JSR.w CODE_23B36A           
                    BRA   CODE_23B240           

CODE_23B253:        RTL                         

CODE_23B254:        LDA.w $0706                 
                    AND.b #$0F                  
                    TAX                         
                    LDY.w $0700                 
CODE_23B25D:        LDA.b #$86                  
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEX                         
                    BPL   CODE_23B25D           
                    RTL                         

CODE_23B269:        LDX.b #$00                  
                    BEQ   CODE_23B26F           
CODE_23B26D:        LDX.b #$02                  
CODE_23B26F:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
CODE_23B281:        LDA.b $02                   
                    STA.b $03                   
                    LDA.w $A67B,x               
                    STA.b [$2E],y               
                    BRA   CODE_23B291           

CODE_23B28C:        LDA.w $A67F,x               
                    STA.b [$2E],y               
CODE_23B291:        JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    BNE   CODE_23B28C           
                    LDA.w $A683,x               
                    STA.b [$2E],y               
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    INX                         
                    CPY.b #$B0                  
                    BCC   CODE_23B281           
                    RTL                         

CODE_23B2BE:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.b $02                   
                    LDA.b $2B                   
                    CLC                         
                    ADC.b #$01                  
                    STA.b $2B                   
                    LDA.b $2C                   
                    ADC.b #$00                  
                    STA.b $2C                   
                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$C0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDX.w $A693,y               
                    PLA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    LDA.b $02                   
                    STA.b $04                   
                    LDY.w $0700                 
                    LDA.w $A687,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BEQ   CODE_23B316           
CODE_23B305:        LDA.w $A688,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BNE   CODE_23B305           
CODE_23B316:        LDA.w $A689,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $03                   
                    BMI   CODE_23B368           
                    LDA.b $02                   
                    STA.b $04                   
                    LDA.w $A68D,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BEQ   CODE_23B363           
CODE_23B352:        LDA.w $A68E,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BNE   CODE_23B352           
CODE_23B363:        LDA.w $A68F,x               
                    STA.b [$2E],y               
CODE_23B368:        RTL                         

CODE_23B369:        RTL                         

CODE_23B36A:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    RTS                         

                    LDA.b $05                   
                    STA.b $2F                   
                    LDY.w $0700                 
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23B3B4           
                    LDY.b #$00                  
                    LDA.b $0E                   
                    AND.b #$10                  
                    BEQ   CODE_23B38C           
                    INY                         
CODE_23B38C:        STY.b $09                   
                    LDA.b $2E                   
                    CLC                         
                    ADC.b #$B0                  
                    STA.b $2E                   
                    LDA.b $2F                   
                    ADC.b $09                   
                    STA.b $2F                   
                    STA.b $05                   
                    LDA.b $0F                   
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    INY                         
                    INY                         
                    LDA.w $8201,y               
                    STA.b $04                   
                    INC.b $04                   
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
CODE_23B3B4:        STY.w $0700                 
                    RTS                         

CODE_23B3B8:        LDX.w $0706                 
                    LDY.w $0700                 
                    LDA.w $A69B,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    PHX                         
                    LDX.b #$00                  
                    CMP.b #$33                  
                    BEQ   CODE_23B3E5           
                    CMP.b #$35                  
                    BEQ   CODE_23B3E4           
                    CMP.b #$A7                  
                    BEQ   CODE_23B3E3           
                    CMP.b #$AC                  
                    BEQ   CODE_23B3E2           
                    CMP.b #$A9                  
                    BEQ   CODE_23B3E1           
                    JMP.w CODE_23B48E           

CODE_23B3E1:        INX                         
CODE_23B3E2:        INX                         
CODE_23B3E3:        INX                         
CODE_23B3E4:        INX                         
CODE_23B3E5:        LDA.b $30                   
                    STA.b $DA                   
                    STA.b $DD                   
                    REP   #$20                  
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$000F                
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0020                
                    STA.b $DB                   
                    SEP   #$20                  
                    PHY                         
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23B417           
                    REP   #$21                  
                    LDA.b $D8                   
                    ADC.w #$01A0                
                    STA.b $D8                   
                    LDA.b $DB                   
                    CLC                         
                    ADC.w #$01A0                
                    STA.b $DB                   
                    SEP   #$20                  
CODE_23B417:        PLY                         
                    LDA.b [$D8],y               
                    CMP.b #$34                  
                    BEQ   CODE_23B43F           
                    LDA.b [$DB],y               
                    CMP.b #$9A                  
                    BEQ   CODE_23B433           
                    CMP.b #$26                  
                    BEQ   CODE_23B433           
                    DEY                         
                    DEY                         
                    LDA.b [$D8],y               
                    CMP.b #$A0                  
                    BNE   CODE_23B472           
                    INY                         
                    BRA   CODE_23B44A           

CODE_23B433:        REP   #$20                  
                    LDA.b $DB                   
                    SEC                         
                    SBC.w #$0011                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_23B43F:        REP   #$21                  
                    LDA.b $D8                   
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_23B44A:        PHY                         
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23B45D           
                    REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$01A0                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_23B45D:        PLY                         
                    LDA   DATA_23B49E,x             
                    STA.b [$D8],y               
                    LDA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$01                  
                    STA.b [$D8],y               
                    PLX                         
                    BRA   CODE_23B49D           

CODE_23B472:        REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$0020                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$9A                  
                    BNE   CODE_23B48E           
                    LDA.w $0350                 
                    CMP.b #$1D                  
                    BEQ   CODE_23B48E           
                    INY                         
                    BRA   CODE_23B44A           
CODE_23B48E:        PLX                         
                    LDA.b [$2E],y               
                    CMP.b #$0D                  
                    BEQ   CODE_23B49D           
                    CMP.b #$04                  
                    BEQ   CODE_23B49D           
                    JSL.l CODE_2AB73A           
CODE_23B49D:        RTL                         

DATA_23B49E:        db $09,$0A,$02,$05,$04

CODE_23B4A3:        LDA.b $2E
                    STA.b $00
                    LDA.b $2F                   
                    STA.b $01                   
                    STZ.b $02                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B4C0:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    BEQ   CODE_23B4E5           
CODE_23B4C9:        TXA                         
                    BNE   CODE_23B4D2           
                    JSL.l CODE_2AB73A           
                    BRA   CODE_23B4D8           

CODE_23B4D2:        LDA.b [$2E],y               
                    CMP.b #$04                  
                    BEQ   CODE_23B4DD           
CODE_23B4D8:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B4DD:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BNE   CODE_23B4C9           
CODE_23B4E5:        LDA.w $A6AA,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2A89DC           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    INC.b $02                   
                    DEC.b $03                   
                    BPL   CODE_23B4C0           
                    RTL                         

CODE_23B50E:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    STZ.b $02                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B52B:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    LDA.w $A6AD,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2A8AE2           
                    BRA   CODE_23B55F           

CODE_23B53D:        REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BEQ   CODE_23B55A           
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BEQ   CODE_23B55F           
                    CMP.b #$09                  
                    BEQ   CODE_23B55F           
CODE_23B55A:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B55F:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BPL   CODE_23B53D           
                    INC.b $02                   
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$0F                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$0F                  
                    BNE   CODE_23B5A2           
                    REP   #$20                  
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$01B0                
                    STA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
CODE_23B5A2:        STY.w $0700                 
                    DEC.b $03                   
                    BPL   CODE_23B52B           
                    RTL                         

CODE_23B5AA:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $02                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B5C5:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    LDA.w $A6B0,x               
                    STA.b [$2E],y               
                    TXA                         
                    BEQ   CODE_23B5DF           
                    JSL.l CODE_2A881E           
                    BRA   CODE_23B5DF           

CODE_23B5DA:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B5DF:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BPL   CODE_23B5DA           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23B617           
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    DEY                         
                    TYA                         
                    AND.b #$F0                  
                    TAY                         
CODE_23B617:        STY.w $0700                 
                    DEC.b $02                   
                    BMI   CODE_23B621           
                    JMP.w CODE_23B5C5           

CODE_23B621:        RTL                         

CODE_23B622:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $02                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B63D:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    BEQ   CODE_23B666           
CODE_23B646:        REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BNE   CODE_23B65E           
                    LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B65E:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BNE   CODE_23B646           
CODE_23B666:        LDA.w $A6B3,x               
                    STA.b [$2E],y               
                    TXA                         
                    BEQ   CODE_23B67A           
                    PHX                         
                    LDX.b #$00                  
                    JSL.l CODE_2A8844           
                    JSL.l CODE_2A87B2           
                    PLX                         
CODE_23B67A:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $02                   
                    BPL   CODE_23B63D           
                    RTL                         

CODE_23B698:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.b #$00                  
                    STA.b $02                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B6B7:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    BEQ   CODE_23B6DF           
CODE_23B6C0:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    TXA                         
                    BEQ   CODE_23B6D2           
                    LDA.b [$2E],y               
                    CMP.b #$08                  
                    BEQ   CODE_23B6D7           
CODE_23B6D2:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B6D7:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BNE   CODE_23B6C0           
CODE_23B6DF:        LDA.w $A6B6,x               
                    STA.b [$2E],y               
                    TXA                         
                    BNE   CODE_23B6EF           
                    PHX                         
                    LDX.b #$04                  
                    JSL.l CODE_2A89DC           
                    PLX                         
CODE_23B6EF:        JSL.l CODE_23BEBB           
                    LDA.w $A6B9,x               
                    STA.b [$2E],y               
                    CMP.b #$9F                  
                    BNE   CODE_23B700           
                    JSL.l CODE_2A89DC           
CODE_23B700:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    INC.b $02                   
                    DEC.b $03                   
                    BPL   CODE_23B6B7           
                    RTL                         

CODE_23B720:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.b #$00                  
                    STA.b $02                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B73F:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    LDA.w $A6BC,x               
                    STA.b [$2E],y               
                    CMP.b #$9C                  
                    BNE   CODE_23B757           
                    PHX                         
                    LDX.b #$03                  
                    JSL.l CODE_2A8AE2           
                    PLX                         
CODE_23B757:        JSL.l CODE_23BEBB           
                    LDA.w $A6BF,x               
                    STA.b [$2E],y               
                    CMP.b #$9D                  
                    BNE   CODE_23B795           
                    JSL.l CODE_2A87B2           
                    BRA   CODE_23B795           

CODE_23B76A:        REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BEQ   CODE_23B787           
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BEQ   CODE_23B78C           
                    CMP.b #$07                  
                    BEQ   CODE_23B78C           
CODE_23B787:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B78C:        JSL.l CODE_23BEBB           
                    LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B795:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BPL   CODE_23B76A           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$0E                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$0E                  
                    BCC   CODE_23B7D7           
                    LDA.b $2E                   
                    SEC                         
                    SBC.b #$B0                  
                    STA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    SBC.b #$01                  
                    STA.b $2F                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
CODE_23B7D7:        STY.w $0700                 
                    INC.b $02                   
                    DEC.b $03                   
                    BMI   CODE_23B7E3           
                    JMP.w CODE_23B73F           

CODE_23B7E3:        RTL                         

CODE_23B7E4:        REP   #$20                  
                    LDA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $02                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B7FF:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    LDA.w $A6C2,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2A8776           
                    JSL.l CODE_23BEBB           
                    LDA.w $A6C5,x               
                    STA.b [$2E],y               
                    BRA   CODE_23B828           

CODE_23B81A:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    LDA.w $A6A7,x               
                    STA.b [$2E],y               
CODE_23B828:        JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BPL   CODE_23B81A           
                    REP   #$20                  
                    LDA.b $00                   
                    STA.b $2E                   
                    SEP   #$20                  
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    INY                         
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$02                  
                    BCS   CODE_23B863                   
                    REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $00                   
                    SEP   #$20                  
                    DEY                         
                    DEY                         
                    TYA                         
                    AND.b #$F1                  
                    TAY                         
CODE_23B863:        STY.w $0700                 
                    DEC.b $02                   
                    BPL   CODE_23B7FF           
                    RTL                         

CODE_23B86B:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $02                   
                    PLA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
CODE_23B886:        LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    BEQ   CODE_23B8A5           
CODE_23B88F:        LDA.w $A6A7,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    LDA.w $A6A7,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BNE   CODE_23B88F           
CODE_23B8A5:        LDA.w $A6C8,x               
                    STA.b [$2E],y               
                    CPX.b #$01                  
                    BNE   CODE_23B8B2           
                    JSL.l CODE_2A87B2           
CODE_23B8B2:        JSL.l CODE_23BEBB           
                    LDA.w $A6CB,x               
                    STA.b [$2E],y               
                    CMP.b #$A5                  
                    BNE   CODE_23B8C7           
                    PHX                         
                    LDX.b #$01                  
                    JSL.l CODE_2A8844           
                    PLX                         
CODE_23B8C7:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $02                   
                    BPL   CODE_23B886           
                    RTL                         

CODE_23B8E5:        LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $00                   
                    PLA                         
                    SEC                         
                    SBC.b #$D0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDY.w $0700                 
CODE_23B8F9:        LDA.w $A6CE,x               
                    STA.b [$2E],y               
                    TXA                         
                    BNE   CODE_23B932           
                    PHY                         
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    TYA                         
                    CLC                         
                    ADC.b #$0F                  
                    TAY                         
                    LDA.b [$D8],y               
                    CMP.b #$25                  
                    BEQ   CODE_23B921           
                    CMP.b #$26                  
                    BEQ   CODE_23B921           
                    CMP.b #$33                  
                    BNE   CODE_23B931           
CODE_23B921:        INY                         
                    LDA.b #$09                  
                    STA.b [$D8],y               
                    LDA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$01                  
                    STA.b [$D8],y               
CODE_23B931:        PLY                         
CODE_23B932:        JSL.l CODE_2AB73A           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    DEC.b $00                   
                    BPL   CODE_23B8F9           
                    RTL                         

CODE_23B946:        LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $00                   
                    PLA                         
                    SEC                         
                    SBC.b #$D0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.b #$03                  
                    TAX                         
                    LDY.w $0700                 
                    JMP.w CODE_23B8F9           

CODE_23B960:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.b $02                   
                    LDA.b $2B                   
                    CLC                         
                    ADC.b #$01                  
                    STA.b $2B                   
                    LDA.b $2C                   
                    ADC.b #$00                  
                    STA.b $2C                   
                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    AND.b #$0F                  
                    STA.b $04                   
                    PLA                         
                    SEC                         
                    SBC.b #$40                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $03                   
CODE_23B993:        CPX.b #$03                  
                    BCS   CODE_23B9C4                   
                    REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BEQ   CODE_23B9C4           
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BEQ   CODE_23B9D9           
                    CMP.b #$04                  
                    BEQ   CODE_23B9D9           
                    CMP.b #$05                  
                    BEQ   CODE_23B9D9           
                    CMP.b #$07                  
                    BEQ   CODE_23B9D9           
                    CMP.b #$09                  
                    BEQ   CODE_23B9D9           
                    CMP.b #$0A                  
                    BEQ   CODE_23B9D9           
CODE_23B9C4:        JSL.l CODE_2AB73A           
                    LDA.w $A6D4,x               
                    STA.b [$2E],y               
                    CMP.b #$37                  
                    BEQ   CODE_23B9D9           
                    CMP.b #$AB                  
                    BEQ   CODE_23B9D9           
                    JSL.l CODE_2A892C           
CODE_23B9D9:        JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    LDA.b $03                   
                    CMP.b #$FF                  
                    BNE   CODE_23B993           
                    BRA   CODE_23BA0F           

CODE_23B9E7:        REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BNE   CODE_23BA03           
                    LDA.w $A6DA,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
CODE_23BA03:        JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    LDA.b $03                   
                    CMP.b #$FF                  
                    BNE   CODE_23B9E7           
CODE_23BA0F:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    LDA.b $02                   
                    STA.b $03                   
                    DEC.b $04                   
                    BPL   CODE_23B9E7           
                    RTL                         

CODE_23BA32:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.b $02                   
                    LDA.b $2B                   
                    CLC                         
                    ADC.b #$01                  
                    STA.b $2B                   
                    LDA.b $2C                   
                    ADC.b #$00                  
                    STA.b $2C                   
                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    SEC                         
                    SBC.b #$A0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $04                   
CODE_23BA5F:        LDA.b $02                   
                    STA.b $03                   
                    LDY.w $0700                 
                    LDA.b $04                   
                    BEQ   CODE_23BAD0           
CODE_23BA6A:        REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    LDA.b $2E                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $DB                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    STA.b $DD                   
                    LDA.b [$DB],y               
                    CMP.b #$26                  
                    BEQ   CODE_23BA97           
                    LDA.b [$D8],y               
                    BEQ   CODE_23BA97           
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BEQ   CODE_23BAA0           
                    CMP.b #$04                  
                    BEQ   CODE_23BAA0           
CODE_23BA97:        LDA.w $A6E0,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
CODE_23BAA0:        JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    LDA.b $03                   
                    CMP.b #$FF                  
                    BNE   CODE_23BA6A           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $04                   
                    BNE   CODE_23BA5F           
                    LDA.b $02                   
                    STA.b $03                   
                    LDY.w $0700                 
CODE_23BAD0:        PHY                         
                    REP   #$20                  
                    LDA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
CODE_23BAD9:        LDA.w $A6E3,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_2A886F           
                    JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    LDA.b $03                   
                    CMP.b #$FF                  
                    BNE   CODE_23BAD9           
                    PLY                         
                    LDA.b [$D8],y               
                    CMP.b #$F4                  
                    BEQ   CODE_23BAFD           
                    CMP.b #$A6                  
                    BNE   CODE_23BB31           
CODE_23BAFD:        REP   #$21                  
                    LDA.b $D8                   
                    ADC.w #$000F                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$F8                  
                    BEQ   CODE_23BB16           
                    CMP.b #$AA                  
                    BEQ   CODE_23BB16           
                    CMP.b #$BF                  
                    BNE   CODE_23BB31           
CODE_23BB16:        REP   #$20                  
                    LDA.b $D8                   
                    SEC                         
                    SBC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b #$06                  
                    STA.b [$D8],y               
                    LDA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$01                  
                    STA.b [$D8],y               
CODE_23BB31:        RTL                         

CODE_23BB32:        LDY.b #$00                  
                    LDA.b [$2B],y               
                    STA.b $02                   
                    LDA.b $2B                   
                    CLC                         
                    ADC.b #$01                  
                    STA.b $2B                   
                    LDA.b $2C                   
                    ADC.b #$00                  
                    STA.b $2C                   
                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    PLA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    LDY.w $0700                 
                    LDA.b $02                   
                    STA.b $04                   
                    LDA.b $03                   
                    BEQ   CODE_23BB83           
CODE_23BB69:        LDA.w $A6E6,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    LDA.b $04                   
                    CMP.b #$FF                  
                    BNE   CODE_23BB69           
                    BRA   CODE_23BB90           

CODE_23BB7C:        LDA.b $02                   
                    STA.b $04                   
                    LDY.w $0700                 
CODE_23BB83:        LDA.w $A6E9,x               
                    STA.b [$2E],y               
                    JSL.l CODE_23BEBB           
                    DEC.b $04                   
                    BPL   CODE_23BB83           
CODE_23BB90:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    DEC.b $03                   
                    BPL   CODE_23BB7C           
                    RTL                         

CODE_23BBAE:        RTL                         

CODE_23BBAF:        LDA.w $0706                 
                    SEC                         
                    SBC.b #$0D                  
                    TAY                         
                    LDX.w $0700                 
                    LDA.b $0E                   
                    AND.b #$10                  
                    BNE   CODE_23BBC3           
                    CPX.b #$C0                  
                    BCC   CODE_23BBCB           
CODE_23BBC3:        TXA                         
                    SEC                         
                    SBC.b #$C0                  
                    TAX                         
                    JMP.w CODE_23BBD6           

CODE_23BBCB:        LDA.w $A6EC,y               
                    JSL.l CODE_209844           
                    CPX.b #$00                  
                    BNE   CODE_23BBCB           
CODE_23BBD6:        LDA.w $A6EC,y               
                    JSL.l CODE_2098A8           
                    INX                         
                    CPX.b #$F0                  
                    BNE   CODE_23BBD6           
                    RTL                         

                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $03                   
CODE_23BBFA:        LDY.w $0700                 
CODE_23BBFD:        LDA.b #$47                  
                    STA.b [$2E],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    BCC   CODE_23BC0E           
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
CODE_23BC0E:        LDA.b $04                   
                    CMP.b $2F                   
                    BNE   CODE_23BBFD           
                    CPY.b #$B0                  
                    BCC   CODE_23BBFD           
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDY.w $0700                 
                    INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23BC51           
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
                    INC.b $03                   
                    LDA.b $03                   
                    ASL   A                     
                    TAX                         
                    LDA.w $8200,x               
                    STA.b $2E                   
                    STA.b $00                   
                    LDA.w $8201,x               
                    STA.b $2F                   
                    STA.b $01                   
                    STA.b $04                   
                    INC.b $04                   
                    LDA.b $0E                   
                    AND.b #$10                  
                    BEQ   CODE_23BC51           
                    INC.b $2F                   
                    INC.b $01                   
CODE_23BC51:        STY.w $0700                 
                    DEC.b $02                   
                    BPL   CODE_23BBFA           
                    RTS                         

CODE_23BC59:        LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDA.b $30                   
                    STA.b $DA                   
                    LDY.w $0700                 
                    LDA.b #$81                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSR.w CODE_23BC93           
                    BRA   CODE_23BC7F           

CODE_23BC74:        LDA.b #$82                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSR.w CODE_23BC93           
CODE_23BC7F:        JSL.l CODE_23BEBB           
                    DEC.b $02                   
                    BNE   CODE_23BC74           
                    LDA.b #$83                  
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSR.w CODE_23BC93           
                    RTL                         

CODE_23BC93:        REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$9A                  
                    BNE   CODE_23BCB4           
                    LDA.b #$0D                  
                    STA.b [$D8],y               
                    LDA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$01                  
                    STA.b [$D8],y               
CODE_23BCB4:        RTS                         

CODE_23BCB5:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    AND.b #$0F                  
                    STA.b $02                   
                    LDY.w $0700                 
                    LDX.b #$00                  
CODE_23BCC9:        LDA.b $02                   
                    STA.b $03                   
                    LDA.w $A6EF,x               
                    STA.b [$2E],y               
                    BRA   CODE_23BCD9           

CODE_23BCD4:        LDA.w $A6F1,x               
                    STA.b [$2E],y               
CODE_23BCD9:        JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    BNE   CODE_23BCD4           
                    LDA.w $A6F3,x               
                    STA.b [$2E],y               
                    LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDA.w $0700                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0700                 
                    TAY                         
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    STA.b $01                   
                    INX                         
                    CPX.b #$02                  
                    BNE   CODE_23BCC9           
                    RTL                         

CODE_23BD06:        LDA.w $0706                 
                    PHA                         
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    BNE   CODE_23BD2F           
                    PLA                         
                    AND.b #$0F                  
                    STA.b $03                   
                    LDY.w $0700                 
CODE_23BD1E:        LDA.w $A6F5,x               
                    STA.b [$2E],y               
                    JSL.l CODE_2AB73A           
                    JSL.l CODE_23BEBB           
                    DEC.b $03                   
                    BPL   CODE_23BD1E           
CODE_23BD2F:        RTL                         

CODE_23BD30:        LDX.w $0706                 
                    LDY.w $0700                 
                    LDA.w $A6F7,x               
                    STA.b [$2E],y               
                    RTL                         

CODE_23BD3C:        LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    LDA.w $0706                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $04                   
CODE_23BD4C:        LDA.w $0700                 
                    STA.b $05                   
                    STZ.b $06                   
                    LDA.b $04                   
                    ASL   A                     
                    TAX                         
                    LDA.w $A817,x               
                    STA.b $02                   
                    LDA.w $A818,x               
                    STA.b $03                   
CODE_23BD61:        LDY.b $05                   
                    REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b $30                   
                    STA.b $DA                   
                    LDA.b [$D8],y               
                    BEQ   CODE_23BD84           
                    LDA.b [$2E],y               
                    CMP.b #$02                  
                    BEQ   CODE_23BDAD           
                    CMP.b #$04                  
                    BEQ   CODE_23BDAD           
                    CMP.b #$06                  
                    BEQ   CODE_23BDAD           
CODE_23BD84:        LDY.b $06                   
                    LDA.b ($02),y               
                    LDY.b $05                   
                    REP   #$21                  
                    LDA.b $2E                   
                    ADC.w #$2000                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    BNE   CODE_23BDA1           
                    LDY.b $06                   
                    LDA.b ($02),y               
                    LDY.b $05                   
                    STA.b [$2E],y               
CODE_23BDA1:        CMP.b #$E3                  
                    BNE   CODE_23BDAD           
                    PHX                         
                    LDX.b #$02                  
                    JSL.l CODE_2A89DC           
                    PLX                         
CODE_23BDAD:        CMP.b #$99                  
                    BNE   CODE_23BDB9           
                    PHX                         
                    LDX.b #$02                  
                    JSL.l CODE_2A8AE2           
                    PLX                         
CODE_23BDB9:        CMP.b #$A8                  
                    BEQ   CODE_23BDC1           
                    CMP.b #$F6                  
                    BNE   CODE_23BDC9           
CODE_23BDC1:        PHX                         
                    LDX.b #$00                  
                    JSL.l CODE_2A88E8           
                    PLX                         
CODE_23BDC9:        CMP.b #$A1                  
                    BNE   CODE_23BDD5           
                    PHX                         
                    LDX.b #$00                  
                    JSL.l CODE_2A8844           
                    PLX                         
CODE_23BDD5:        CMP.b #$A0                  
                    BNE   CODE_23BDDD           
                    JSL.l CODE_2A881E           
CODE_23BDDD:        CMP.b #$26                  
                    BNE   CODE_23BDE5           
                    JSL.l CODE_2A892C           
CODE_23BDE5:        CMP.b #$A7                  
                    BNE   CODE_23BE14           
                    LDA.b $30                   
                    STA.b $DA                   
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$000F                
                    STA.b $D8                   
                    SEP   #$20                  
                    LDA.b [$D8],y               
                    CMP.b #$A7                  
                    BEQ   CODE_23BE03           
                    CMP.b #$9A                  
                    BNE   CODE_23BE14           
CODE_23BE03:        INC.b $D8                   
                    LDA.b #$02                  
                    STA.b [$D8],y               
                    LDA.b $D9                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b #$01                  
                    STA.b [$D8],y               
CODE_23BE14:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.b $05                   
                    LDA.b $2F                   
                    ADC.b #$00                  
                    STA.b $2F                   
                    INC.b $06                   
                    LDA.b $06                   
                    CMP.b #$06                  
                    BEQ   CODE_23BE2B           
                    JMP.w CODE_23BD61           

CODE_23BE2B:        LDA.b $00                   
                    STA.b $2E                   
                    LDA.b $01                   
                    STA.b $2F                   
                    LDY.w $0700                 
                    JSL.l CODE_23BEBB           
                    STY.w $0700                 
                    LDA.b $2E                   
                    STA.b $00                   
                    LDA.b $2F                   
                    STA.b $01                   
                    INC.b $04                   
                    LDA.b $04                   
                    AND.b #$07                  
                    BEQ   CODE_23BE50           
                    JMP.w CODE_23BD4C          
 
CODE_23BE50:        RTL                         

CODE_23BE51:        LDY.w $0700                 
                    LDA.b #$17                  
                    STA.b $00                   
                    LDA.b #$A9                  
                    STA.b $01                   
CODE_23BE5C:        LDA.b ($00),y               
                    CMP.b #$FF                  
                    BEQ   CODE_23BE70           
                    STA.b [$2E],y               
                    INY                         
                    CPY.b #$00                  
                    BNE   CODE_23BE6D           
                    INC.b $2F                   
                    INC.b $01                   
CODE_23BE6D:        INX                         
                    BRA   CODE_23BE5C           

CODE_23BE70:        RTL                         

CODE_23BE71:        STX.b $0B                   
                    STY.b $0C                   
                    LDA.b $0E                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $0D                   
                    LDY.b $0F                   
                    LDA.w $0706                 
                    AND.b #$F0                  
                    BEQ   CODE_23BE94           
                    LDA.w $0706                 
                    AND.b #$0F                  
                    SEC                         
                    SBC.b $02                   
                    CLC                         
                    ADC.b $0F                   
                    TAY                         
CODE_23BE94:        TYA                         
                    AND.b #$F8                  
                    LSR   A                     
                    LSR   A                     
                    ORA.b $0D                   
                    STA.b $0D                   
                    LDA.w $0415                 
                    BEQ   CODE_23BEA9           
                    LDA.b $0D                   
                    CLC                         
                    ADC.b #$40                  
                    STA.b $0D                   
CODE_23BEA9:        LDA.b $0C                   
                    AND.b #$07                  
                    TAX                         
                    LDY.b $0D                   
                    LDA.w $1E04,y               
                    AND.w $AAA8,x               
                    LDX.b $0B                   
                    LDY.b $0C                   
                    RTS                         

CODE_23BEBB:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_23BED3           
                    REP   #$20                  
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    SEP   #$20                  
                    LDA.w $0700                 
                    AND.b #$F0                  
                    TAY                         
CODE_23BED3:        RTL                         

CODE_23BED4:        LDA.b $0E                   
                    AND.b #$0F                  
                    TAY                         
                    LDA.b $0F                   
                    STA.w $1F56,y               
                    LDA.w $0706                 
                    STA.w $1F66,y               
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF

CODE_23BF00:        LDA.b $82
                    CMP.b #$B8
                    BCS   CODE_23BF7D                   
                    LDA.w $1A45                 
                    BNE   CODE_23BF65           
                    STA.b $00                   
                    LDA.b $BB                   
                    BEQ   CODE_23BF16           
                    LDA.w $056F                 
                    BEQ   CODE_23BF1A           
CODE_23BF16:        LDA.b #$0A                  
                    STA.b $00                   
CODE_23BF1A:        LDA.b #$01                  
                    STA.w $1F90                 
                    LSR   A                     
                    STA.w $1F99                 
                    LDA.w $05FC                 
                    BEQ   CODE_23BF38           
                    LDA.b $82                   
                    CMP.b #$80                  
                    BCC   CODE_23BF38           
                    LDA.b #$00                  
                    XBA                         
                    LDA.b #$93                  
                    STA.w $1F99                 
                    BNE   CODE_23BF53           
CODE_23BF38:        STZ.b $D9                   
                    LDA.b $00                   
                    STA.b $D8                   
                    BPL   CODE_23BF42           
                    DEC.b $D9                   
CODE_23BF42:        LDA.b $55                   
                    XBA                         
                    LDA.b $70                   
                    REP   #$20                  
                    CLC                         
                    ADC.b $D8                   
                    AND.w #$FFF0                
                    CLC                         
                    ADC.w #$0002                
CODE_23BF53:        SEP   #$20                  
                    STA.w $1F93                 
                    XBA                         
                    STA.w $058E                 
                    LDA.b $5E                   
                    STA.w $1F96                 
                    LDA.b $43                   
                    STA.b $EF                   
CODE_23BF65:        LDA.b $9D                   
                    BMI   CODE_23BF7D           
                    LDA.b #$00                  
                    STA.b $9D                   
                    LDY.b $A6                   
                    BEQ   CODE_23BF73           
                    STA.b $8B                   
CODE_23BF73:        LDY.b #$02                  
CODE_23BF75:        LDA.w $1F7C,y               
                    BEQ   CODE_23BF7E           
CODE_23BF7A:        DEY                         
                    BPL   CODE_23BF75           
CODE_23BF7D:        RTL                         

CODE_23BF7E:        LDA.w $0783,y               
                    ORA.b #$10                  
                    STA.w $1F7C,y               
                    LDA.b $70                   
                    ADC.w $E9FB,y               
                    STA.w $1F84,y               
                    LDA.b $55                   
                    ADC.b #$00                  
                    STA.w $1F80,y               
                    LDA.b $5E                   
                    ADC.w $E9FE,y               
                    STA.w $1F8C,y               
                    LDA.b $43                   
                    ADC.b #$00                  
                    STA.w $1F88,y               
                    JMP.w CODE_23BF7A           

CODE_23BFA7:        LDY.w $070A                 
                    LDA.w $E945,y               
                    STA.w $0560                 
                    JSL.l CODE_23DF67           
                    JSR.w CODE_23C0CD           
                    JSR.w CODE_23C1E7           
                    LDA.w $070A                 
                    CMP.b #$07                  
                    BEQ   CODE_23BFCD           
                    LDA.w $05F3                 
                    BEQ   CODE_23BFD2           
                    LDA.w $0350                 
                    CMP.b #$0B                  
                    BNE   CODE_23BFD2           
CODE_23BFCD:        STZ.w $0428                 
                    BRA   CODE_23BFF7           

CODE_23BFD2:        LDA.w $0428                 
                    BEQ   CODE_23BFF7           
                    LDA.w $1B41                 
                    CMP.b #$D5                  
                    BEQ   CODE_23BFF7           
                    CMP.b #$09                  
                    BEQ   CODE_23BFF7           
                    DEC.w $0428                 
                    LDA.b #$E0                  
                    STA.w $0553                 
                    STZ.w $02C7                 
                    LDA.b #$03                  
                    STA.w $02C6                 
                    LDA.b #$0D                  
                    STA.w $1202                 
CODE_23BFF7:        LDA.w $055C                 
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$90                  
                    STA.w $055C                 
                    JSR.w CODE_23C261           
                    LDA.w $0552                 
                    BEQ   CODE_23C022           
                    LDA.l $7FC586               
                    BEQ   CODE_23C022           
                    LDA.l $7FC586               
                    DEC   A                     
                    STA.l $7FC586               
                    LDA.b #$02                  
                    ORA.b $BF                   
                    STA.w $0556                 
                    BRA   CODE_23C024           

CODE_23C022:        LDA.b $BF                   
CODE_23C024:        ORA.w $0571                 
                    ORA.w $0554                 
                    ORA.w $0555                 
                    ORA.w $0551                 
                    STA.w $9C                 
                    BNE   CODE_23C038           
                    INC.w $0565                 
CODE_23C038:        LDA.w $0564                 
                    CMP.b #$01                  
                    BNE   CODE_23C054           
                    LDA.w $069C                 
                    CLC                         
                    ADC.b #$05                  
                    STA.w $069C                 
                    INC.w $0422                 
                    LDA.l $7E3966               
                    INC   A                     
                    STA.l $7E3966               
CODE_23C054:        LDA.b #$00                  
                    STA.w $0585                 
                    LDX.b #$07                  
CODE_23C05B:        LDA.w $0510,x               
                    BEQ   CODE_23C063           
                    DEC.w $0510,x               
CODE_23C063:        DEX                         
                    BPL   CODE_23C05B           
                    LDA.w $0567                 
                    BEQ   CODE_23C089           
                    CMP.b #$01                  
                    BNE   CODE_23C080           
                    LDY.b #$0D                  
                    LDA.w $0553                 
                    CMP.b #$20                  
                    BCS   CODE_23C07B                   
                    LDY.w $1062                 
CODE_23C07B:        STY.w $1202                 
                    BNE   CODE_23C086           
CODE_23C080:        LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_23C089           
CODE_23C086:        DEC.w $0567                 
CODE_23C089:        RTL                         

CODE_23C08A:        JSL.l CODE_20E237           
                    RTS                         

CODE_23C08F:        STZ.w $058C                 
                    JSL.l CODE_20E856           
                    LDA.w $0280                 
                    BEQ   CODE_23C09F           
                    STZ.b $17                   
                    STZ.b $18                   
CODE_23C09F:        LDA.w $0414                 
                    CMP.b #$03                  
                    BEQ   CODE_23C0C6           
                    LDA.w $07BE                 
                    CMP.b #$03                  
                    BCS   CODE_23C0C6                   
                    LDA.w $0556                 
                    ORA.b $BF                   
                    ORA.w $0554                 
                    ORA.w $0555                 
                    ORA.w $0551                 
                    ORA.w $0559                 
                    ORA.w $0571                 
                    ORA.w $055A                 
                    BEQ   CODE_23C0CB           
CODE_23C0C6:        INC.w $058C                 
                    PLA                         
                    PLA                         
CODE_23C0CB:        RTS                         

                    RTS                         

CODE_23C0CD:        LDA.b $B9                   
                    BEQ   CODE_23C0D2           
                    RTS                         

CODE_23C0D2:        STA.w $0561                 
                    LDA.b #$50                  
                    STA.b $C4                   
                    STZ.b $C5                   
                    LDX.w $0726                 
                    LDA.w $0747,x               
                    STA.b $BB                   
                    JSR.w CODE_23C467           
                    LDA.b #$40                  
                    STA.b $BD                   
                    LDY.w $0426                 
                    LDA.w $EA01,y               
                    STA.b $5E                   
                    STA.b $B9                   
                    JSR.w CODE_23C14C           
                    LDA.w $0429                 
                    CMP.b #$08                  
                    BNE   CODE_23C108           
                    LDA.b #$7F                  
                    STA.w $0413                 
                    LDA.b #$FF                  
                    STA.w $056E                 
CODE_23C108:        JSR.w CODE_23C1C9           
CODE_23C10B:        LDA.w $0425                 
                    BEQ   CODE_23C130           
                    LDY.b $55                   
                    LDA.w $CEED,y               
                    STA.w $0542                 
                    LDA.w $CEFD,y               
                    STA.w $0543                 
                    LDA.b $70                   
                    LDY.b $55                   
                    JSL.l CODE_209FD4           
                    STY.b $55                   
                    STA.b $70                   
                    LDA.b #$01                  
                    STA.w $0562                 
                    RTS                         

CODE_23C130:        LDA.w $0216                 
                    STA.w $0543                 
                    LDA.b $13                   
                    STA.w $0542                 
                    RTS                         

POINTER_23C13C:     dw CODE_23C173
                    dw CODE_23C167
                    dw CODE_23C174
                    dw CODE_23C17B
                    dw CODE_23C182
                    dw CODE_23C189
                    dw CODE_23C190
                    dw CODE_23C19F

CODE_23C14C:        PHB
                    PHK                         
                    PLB                         
                    LDA.w $0545                 
                    ASL   A                     
                    TAY                         
                    LDA   POINTER_23C13C,y               
                    STA.b $00                   
                    LDA   POINTER_23C13C+1,y               
                    STA.b $01                   
                    LDA.b #$00                  
                    STA.w $0545                 
                    PLB                         
                    JMP.w ($0000)               

CODE_23C167:        LDY.b $BB                   
                    LDA.w $AF64,y               
                    AND.b #$02                  
                    BNE   CODE_23C173           
                    INC.w $0545                 
CODE_23C173:        RTS                         

CODE_23C174:        LDA.b #$83                  
                    LDY.b #$01                  
                    JMP.w CODE_23C1BF           

CODE_23C17B:        LDA.b #$82                  
                    LDY.b #$02                  
                    JMP.w CODE_23C1BF           

CODE_23C182:        LDA.b #$80                  
                    LDY.b #$03                  
                    JMP.w CODE_23C1BF           

CODE_23C189:        LDA.b #$81                  
                    LDY.b #$04                  
                    JMP.w CODE_23C1BF           

CODE_23C190:        LDA.b #$01                  
                    STA.w $055A                 
                    LDA.b #$06                  
                    STA.w $0427                 
                    LSR   A                     
                    STA.w $0216                 
                    RTS                         

CODE_23C19F:        LDA.b #$04                  
                    STA.w $055A                 
                    LDA.b #$40                  
                    STA.b $BD                   
                    STA.b $A6                   
                    LDA.b #$90                  
                    STA.b $9D                   
                    STA.b $5E                   
                    LDA.w $0216                 
                    CLC                         
                    ADC.b #$80                  
                    STA.b $70                   
                    LDA.b #$00                  
                    ADC.b #$00                  
                    STA.b $55                   
                    RTS                         

CODE_23C1BF:        STA.w $0571                 
                    STY.w $0377                 
                    JSL.l CODE_23C227           
CODE_23C1C9:        LDY.b #$01                  
                    LDA.w $070A                 
                    CMP.b #$03                  
                    BEQ   CODE_23C1E3           
                    CMP.b #$0E                  
                    BEQ   CODE_23C1E3           
                    CMP.b #$05                  
                    BNE   CODE_23C1E1           
                    LDA.w $1E9E                 
                    CMP.b #$02                  
                    BEQ   CODE_23C1E3           
CODE_23C1E1:        LDY.b #$00                  
CODE_23C1E3:        STY.w $0563                 
                    RTS                         

CODE_23C1E7:        LDA.w $055F                 
                    BEQ   CODE_23C226           
                    LDA.b #$00                  
                    STA.w $055F                 
                    STA.w $0580                 
                    STA.w $05FC                 
                    STA.w $0569                 
                    STA.w $0561                 
                    JSR.w CODE_23C467           
                    JSR.w CODE_23C10B           
                    JSR.w CODE_23C1C9           
                    LDA.w $055A                 
                    BEQ   CODE_23C215           
                    LDA.b #$00                  
                    STA.b $8B                   
                    STA.w $0545                 
                    JSR.w CODE_23C19F           
CODE_23C215:        LDA.w $0545                 
                    CMP.b #$06                  
                    BNE   CODE_23C21F           
                    JSR.w CODE_23C190           
CODE_23C21F:        JSL.l CODE_23C227           
                    PLA                         
                    PLA                         
                    RTL                         

CODE_23C226:        RTS                         

CODE_23C227:        LDA.w $0571                 
                    BEQ   CODE_23C260           
                    LDA.b #$04                  
                    STA.w $1200                 
                    LDA.b $5E                   
                    STA.b $52                   
                    LDA.b $70                   
                    AND.b #$F0                  
                    STA.b $53                   
                    DEC.b $53                   
                    LDA.w $0425                 
                    BNE   CODE_23C24D           
                    LDA.w $0216                 
                    STA.w $0543                 
                    LDA.b $13                   
                    STA.w $0542                 
CODE_23C24D:        LDA.w $0377                 
                    BNE   CODE_23C257           
                    LDA.b #$02                  
                    STA.w $0377                 
CODE_23C257:        AND.b #$0F                  
                    TAY                         
                    LDA.w $EA05,y               
                    STA.w $0510                 
CODE_23C260:        RTL                         

CODE_23C261:        LDA.w $0578                 
                    BEQ   CODE_23C2C2           
                    CMP.b #$0F                  
                    BMI   CODE_23C286           
                    CMP.b #$80                  
                    BNE   CODE_23C276           
                    INC.w $0577                 
                    STZ.w $057A                 
                    BRA   CODE_23C2BA           

CODE_23C276:        CMP.b #$40                  
                    BEQ   CODE_23C281           
                    LDA.b #$C0                  
                    STA.w $057A                 
                    BNE   CODE_23C2BA           
CODE_23C281:        INC.w $0575                 
                    BNE   CODE_23C2BA           
CODE_23C286:        AND.b #$0F                  
                    TAY                         
                    LDA.b $BB                   
                    CMP.b #$02                  
                    BEQ   CODE_23C293           
                    CMP.b #$03                  
                    BNE   CODE_23C2A2           
CODE_23C293:        LDA.w $05EE                 
                    ORA.w $05EF                 
                    ORA.w $05F0                 
                    BEQ   CODE_23C29E           
CODE_23C29E:        LDA.b #$20                  
                    BRA   CODE_23C2A4           

CODE_23C2A2:        LDA.b #$00                  
CODE_23C2A4:        STA.l $7FC586               
                    DEY                         
                    STY.b $BB                   
                    PHY                         
                    PHX                         
                    JSR.w CODE_23CC62           
                    LDA.b $BB                   
                    LDX.w $0726                 
                    STA.w $0747,x               
                    PLX                         
                    PLY                         
CODE_23C2BA:        LDA.b #$00                  
                    STA.w $0578                 
                    JSR.w CODE_23C467           
CODE_23C2C2:        LDA.b $BF                   
                    ORA.w $0556                 
                    BNE   CODE_23C33D           
                    LDA.w $07BE                 
                    CMP.b #$03                  
                    BPL   CODE_23C33D           
                    LDA.w $0544                 
                    BNE   CODE_23C2F0           
                    LDA.b $82                   
                    AND.b #$F0                  
                    CMP.b #$C0                  
                    BNE   CODE_23C2F0           
                    LDA.b #$00                  
                    STA.b $BB                   
                    JSL.l CODE_27A546           
                    LDA.b #$C0                  
                    STA.w $0510                 
                    LDA.b #$02                  
                    STA.b $BF                   
                    BNE   CODE_23C33D           
CODE_23C2F0:        LDA.w $0160                 
                    CMP.b #$80                  
                    BEQ   CODE_23C324           
                    LDA.w $05F3                 
                    AND.b #$7F                  
                    BNE   CODE_23C33D           
                    LDA.w $05EE                 
                    ORA.w $05EF                 
                    ORA.w $05F0                 
                    BNE   CODE_23C324           
                    JSL.l CODE_27A546           
                    LDA.b #$03                  
                    STA.b $BF                   
                    LDA.b #$FF                  
                    STA.b $52                   
                    STA.b $53                   
CODE_23C317:        LDA.b #$01                  
                    STA.w $0578                 
                    LDA.b #$50                  
                    STA.w $0510                 
                    JMP.w CODE_23C33D           

CODE_23C324:        LDA.b $79                   
                    CMP.b #$F8                  
                    BCC   CODE_23C33D           
                    LDA.w $0425                 
                    ORA.w $0559                 
                    BNE   CODE_23C33D           
                    JSL.l CODE_27A546           
                    LDA.b #$01                  
                    STA.b $BF                   
                    JMP.w CODE_23C317           

CODE_23C33D:        JSR.w CODE_23C08F           
                    LDA.l $700007               
                    BEQ   CODE_23C37D           
                    LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$20                  
                    BEQ   CODE_23C35B           
                    LDA.b #$E0                  
                    STA.w $0553                 
                    LDA.b #$03                  
                    STA.w $02C6                 
                    STZ.w $02C7                 
CODE_23C35B:        LDA.b $F8                   
                    ORA.b $F9                   
                    AND.b #$80                  
                    BEQ   CODE_23C36B           
                    LDA.w $023D                 
                    EOR.b #$01                  
                    STA.w $023D                 
CODE_23C36B:        LDA.b $F8                   
                    ORA.b $F9                   
                    AND.b #$40                  
                    BEQ   CODE_23C37D           
                    INC.b $BB                   
                    LDA.b $BB                   
                    CMP.b #$07                  
                    BNE   CODE_23C37D           
                    STZ.b $BB                   
CODE_23C37D:        LDA.w $1EBF                 
                    CMP.b #$16                  
                    BNE   CODE_23C390           
                    STZ.b $F2                   
                    STZ.b $F6                   
                    STZ.b $F3                   
                    STZ.b $F7                   
                    STZ.b $17                   
                    STZ.b $18                   
CODE_23C390:        JSR.w CODE_23C4FA           
                    JSR.w CODE_23C3DE           
                    JSL.l CODE_23CFCA           
                    JSL.l CODE_27A93C           
                    JSR.w CODE_23D364           
                    JSR.w CODE_23D810           
                    JSR.w CODE_23DAF9           
                    JSR.w CODE_23C3BC           
                    LDA.b $BC                   
                    CMP.b #$2E                  
                    BEQ   CODE_23C3B3           
                    JSR.w CODE_23CD71           
CODE_23C3B3:        JSR.w CODE_23C08A           
                    LDA.b #$00                  
                    STA.w $1020                 
                    RTS                         

CODE_23C3BC:        LDA.w $1CF3                 
                    BEQ   CODE_23C3DA           
                    DEC.w $1CF3                 
                    AND.b #$03                  
                    LDY.w $0216                 
                    BPL   CODE_23C3CD           
                    ORA.b #$04                  
CODE_23C3CD:        TAY                         
                    LDA.w $EA0A,y               
                    PHA                         
                    CLC                         
                    ADC.w $0543                 
                    STA.w $0543                 
                    PLA                         
CODE_23C3DA:        STA.w $1CF2                 
                    RTS                         

CODE_23C3DE:        LDY.w $056E                 
                    BEQ   CODE_23C40C           
                    CPY.b #$FF                  
                    BEQ   CODE_23C3F7           
                    LDA.b $15                   
                    AND.b #$01                  
                    BEQ   CODE_23C3F1           
                    DEY                         
                    STY.w $056E                 
CODE_23C3F1:        TYA                         
                    BNE   CODE_23C3F7           
                    STY.w $0413                 
CODE_23C3F7:        LDA.w $02D8                 
                    BNE   CODE_23C40B           
                    DEC.w $02E0                 
                    BPL   CODE_23C40B           
                    LDA.b #$06                  
                    STA.w $02E0                 
                    LDA.b #$41                  
                    STA.w $1200                 
CODE_23C40B:        RTS                         

CODE_23C40C:        LDA.w $0413                 
                    CMP.b #$7F                  
                    BNE   CODE_23C420           
                    JSR.w CODE_23C3F7           
                    LDA.w $057B                 
                    BEQ   CODE_23C420           
                    LDY.b #$10                  
                    JMP.w CODE_23C442           

CODE_23C420:        LDA.w $0515                 
                    BNE   CODE_23C44B           
                    SEC                         
                    ROL.w $0413                 
                    LDA.w $057B                 
                    BNE   CODE_23C434           
                    ROR.w $0413                 
                    LSR.w $0413                 
CODE_23C434:        LDY.b #$18                  
                    LDA.w $0413                 
                    BEQ   CODE_23C448           
                    LDA.w $057B                 
                    BEQ   CODE_23C442           
                    LDY.b #$08                  
CODE_23C442:        STY.w $0515                 
                    JMP.w CODE_23C44B           

CODE_23C448:        STA.w $056E                 
CODE_23C44B:        LDA.b #$00                  
                    STA.w $057B                 
                    RTS                         

DATA_23C451:     dw $88A0
                    dw $88E0
                    dw $8920
                    dw $88A0
                    dw $88E0
                    dw $88C0
                    dw $8900
                    dw $88C0
                    dw $8940

CODE_23C463:        JSR.w CODE_23C467                 
                    RTL                         

CODE_23C467:        LDY.b #$07                  
                    LDA.w $0726                 
                    BEQ   CODE_23C477           
                    LDA.b $BB                   
                    CMP.b #$02                  
                    BNE   CODE_23C477           
                    INY                         
                    BRA   CODE_23C48A           

CODE_23C477:        LDA.w $057A                 
                    BNE   CODE_23C48A           
                    LDA.b $BB                   
                    TAY                         
                    CMP.b #$03                  
                    BEQ   CODE_23C487           
                    CMP.b #$02                  
                    BPL   CODE_23C48A           
CODE_23C487:        LDY.w $0726                 
CODE_23C48A:        PHX                         
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_23C451,x             
                    PHB                         
                    TAX                         
                    LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    LDX.w #$001E                
CODE_23C4A6:        LDA.w $14E0,x               
                    STA.l $7FC500,x             
                    DEX                         
                    DEX                         
                    BPL   CODE_23C4A6           
                    SEP   #$30                  
                    PLX                         
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

CODE_23C4BA:        LDY.b #$01                  
                    STY.b $0E                   
                    LDA.w $0584                 
                    AND.w $EB1E,x               
                    BNE   CODE_23C4F8           
                    LDA.b $00,x                 
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA.b $00,x                 
                    CMP.w $1E96,y               
                    BCS   CODE_23C4F9                   
                    CMP.b #$D7                  
                    BNE   CODE_23C4DD           
                    LDY.b #$00                  
                    BEQ   CODE_23C4F6           
CODE_23C4DD:        TYA                         
                    ORA.b $02                   
                    TAY                         
                    LDA.w $AD84,y               
                    LDY.b #$00                  
                    CMP.b $00,x                 
                    BCS   CODE_23C4F6                   
                    INY                         
                    LDA.b $00,x                 
                    CMP.b #$E0                  
                    BEQ   CODE_23C4F5           
                    CMP.b #$E1                  
                    BNE   CODE_23C4F6           
CODE_23C4F5:        INY                         
CODE_23C4F6:        STY.b $0E                   
CODE_23C4F8:        CLC                         
CODE_23C4F9:        RTS                         

CODE_23C4FA:        LDA.l $700007               
                    BEQ   CODE_23C538           
                    LDA.w $023D                 
                    BEQ   CODE_23C538           
                    STZ.b $8B                   
                    STZ.b $9D                   
                    LDX.b #$C0                  
                    LDA.b $F2                   
                    ORA.b $F3                   
                    AND.b #$03                  
                    BEQ   CODE_23C51B           
                    AND.b #$02                  
                    BNE   CODE_23C519           
                    LDX.b #$30                  
CODE_23C519:        STX.b $8B                   
CODE_23C51B:        LDX.b #$C0                  
                    LDA.b $F2                   
                    ORA.b $F3                   
                    AND.b #$0C                  
                    BEQ   CODE_23C52D           
                    AND.b #$08                  
                    BNE   CODE_23C52B           
                    LDX.b #$30                  
CODE_23C52B:        STX.b $9D                   
CODE_23C52D:        JSL.l CODE_23DE53           
                    JSL.l CODE_23DEA3           
                    JMP.w CODE_23C08A           

CODE_23C538:        LDA.b $BD                   
                    STA.w $056C                 
                    LDA.w $0559                 
                    BNE   CODE_23C54A           
                    LDA.w $1CF4                 
                    BEQ   CODE_23C552           
                    DEC.w $1CF4                 
CODE_23C54A:        LDA.b #$00                  
                    STA.b $8B                   
                    STA.b $17                   
                    STA.b $18                   
CODE_23C552:        LDA.w $0545                 
                    BEQ   CODE_23C55D           
                    LDA.b $18                   
                    AND.b #$BF                  
                    STA.b $18                   
CODE_23C55D:        LDY.b $BB                   
                    BEQ   CODE_23C579           
                    CPY.b #$04                  
                    BEQ   CODE_23C579           
                    LDA.w $06A4                 
                    ORA.w $0545                 
                    ORA.w $0577                 
                    BNE   CODE_23C579           
                    LDA.b $A6                   
                    BEQ   CODE_23C587           
                    LDA.w $0575                 
                    BEQ   CODE_23C580           
CODE_23C579:        LDA.b #$00                  
                    STA.w $056F                 
                    BEQ   CODE_23C5A1           
CODE_23C580:        LDA.w $056F                 
                    BNE   CODE_23C59E           
                    BEQ   CODE_23C5A1           
CODE_23C587:        LDA.b #$00                  
                    STA.w $056F                 
                    LDA.w $0563                 
                    BEQ   CODE_23C596           
                    LDA.w $0569                 
                    BNE   CODE_23C5A1           
CODE_23C596:        LDA.b $17                   
                    AND.b #$0F                  
                    CMP.b #$04                  
                    BNE   CODE_23C5A1           
CODE_23C59E:        STY.w $056F                 
CODE_23C5A1:        LDY.b #$14                  
                    LDA.b $BB                   
                    BEQ   CODE_23C5AE           
                    LDA.w $056F                 
                    BNE   CODE_23C5AE           
                    LDY.b #$0A                  
CODE_23C5AE:        STY.b $09                   
                    LDA.b #$08                  
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    STA.w $0602                 
                    STA.b $00                   
                    LDA.w $0603                 
                    STA.b $01                   
                    LDA.w $0588                 
                    STA.w $0587                 
                    BEQ   CODE_23C5EA           
                    LDA.b $15                   
                    LSR   A                     
                    BCC   CODE_23C5D2           
                    DEC.w $0588                 
CODE_23C5D2:        LDY.b #$00                  
                    LDA.b $00                   
                    CMP.b #$41                  
                    BEQ   CODE_23C5E7           
                    CMP.b #$80                  
                    BEQ   CODE_23C5E7           
                    INY                         
                    LDA.w $0588                 
                    BNE   CODE_23C5E7           
                    STY.w $0588                 
CODE_23C5E7:        STY.w $0587                 
CODE_23C5EA:        LDA.b $00                   
                    AND.b #$C0                  
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDA.b $00                   
                    CMP.w $1E9A,y               
                    BCC   CODE_23C619           
                    LDA.b $A6                   
                    ORA.w $0575                 
                    ORA.w $0571                 
                    BNE   CODE_23C619           
                    STA.b $8B                   
                    STA.b $18                   
                    AND.b #$7F                  
                    STA.b $18                   
                    LDA.b #$01                  
                    STA.w $0585                 
                    CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    BCC   CODE_23C619           
                    INC.b $43                   
CODE_23C619:        LDA.w $0560                 
                    ASL   A                     
                    ASL   A                     
                    STA.b $02                   
                    LDX.b #$00                  
                    JSR.w CODE_23C4BA           
                    BCS   CODE_23C62A                   
                    TYA                         
                    BNE   CODE_23C67E           
CODE_23C62A:        LDA.w $0575                 
                    BEQ   CODE_23C694           
                    LDA.b $A6                   
                    BNE   CODE_23C637           
                    BCS   CODE_23C694                   
                    BCC   CODE_23C677           
CODE_23C637:        BCS   CODE_23C63D                   
                    LDA.b $9D                   
                    BMI   CODE_23C64E           
CODE_23C63D:        ROR   A                     
                    STA.b $0F                   
                    LDX.b #$01                  
                    JSR.w CODE_23C4BA           
                    BCS   CODE_23C64A                   
                    TYA                         
                    BEQ   CODE_23C677           
CODE_23C64A:        LDA.b $0F                   
                    BMI   CODE_23C67E           
CODE_23C64E:        LDY.b $9D                   
                    CPY.b #$F4                  
                    BPL   CODE_23C656           
                    LDY.b #$F4                  
CODE_23C656:        LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_23C65D           
                    INY                         
CODE_23C65D:        STY.b $9D                   
                    LDA.b $18                   
                    AND.b #$7F                  
                    STA.b $18                   
                    LDA.b $17                   
                    TAY                         
                    AND.b #$F7                  
                    STA.b $17                   
                    TYA                         
                    AND.b #$88                  
                    CMP.b #$88                  
                    BNE   CODE_23C694           
                    LDA.b #$CC                  
                    STA.b $9D                   
CODE_23C677:        LDY.b #$00                  
                    STY.w $0576                 
                    BEQ   CODE_23C685           
CODE_23C67E:        LDY.b $0E                   
                    CPY.w $0575                 
                    BEQ   CODE_23C694           
CODE_23C685:        TYA                         
                    ORA.w $0575                 
                    STY.w $0575                 
                    CMP.b #$02                  
                    BEQ   CODE_23C694           
                    JSL.l CODE_23BF00           
CODE_23C694:        LDA.b $BD                   
                    AND.b #$7F                  
                    STA.b $BD                   
                    LDX.b #$00                  
                    LDY.w $0560                 
                    LDA.b #$43                  
                    SEC                         
                    SBC.b $00                   
                    BEQ   CODE_23C6AF           
                    CPY.b #$01                  
                    BNE   CODE_23C704           
                    CMP.b #$01                  
                    BNE   CODE_23C704           
                    INX                         
CODE_23C6AF:        LDA.b $18                   
                    AND.b #$08                  
                    BEQ   CODE_23C704           
                    LDA.b $A6                   
                    BNE   CODE_23C704           
                    LDY.b #$01                  
                    LDA.w $0379                 
                    BEQ   CODE_23C6C2           
                    LDY.b #$03                  
CODE_23C6C2:        STY.w $0414                 
                    STZ.w $0713                 
                    STZ.b $8B                   
                    STZ.w $034E                 
                    CPX.b #$01                  
                    BEQ   CODE_23C704           
                    LDA.b $43                   
                    STA.b $D9                   
                    XBA                         
                    LDA.b $5E                   
                    STA.b $D8                   
                    REP   #$30                  
                    LDY.w #$0000                
                    AND.w #$0008                
                    BEQ   CODE_23C6E7           
                    LDY.w #$0010                
CODE_23C6E7:        TYA                         
                    CLC                         
                    ADC.b $D8                   
                    AND.w #$FFF0                
                    SEP   #$30                  
                    STA.b $5E                   
                    XBA                         
                    STA.b $43                   
                    LDY.b #$01                  
                    STY.w $034E                 
                    LDY.b #$0F                  
                    STY.w $1203                 
                    PHX                         
                    JSR.w CODE_23DEB6           
                    PLX                         
CODE_23C704:        LDA.w $0575                 
                    ORA.w $06A4                 
                    ORA.w $0577                 
                    BNE   CODE_23C728           
                    LDA.b $00                   
                    CMP.b #$85                  
                    BNE   CODE_23C728           
                    LDA.w $056B                 
                    BNE   CODE_23C730           
                    LDA.b $17                   
                    AND.b #$0C                  
                    BEQ   CODE_23C728           
                    LDY.b $A6                   
                    BNE   CODE_23C730           
                    AND.b #$08                  
                    BNE   CODE_23C730           
CODE_23C728:        LDA.b #$00                  
                    STA.w $056B                 
                    JMP.w CODE_23C79F           

CODE_23C730:        LDA.b #$01                  
                    STA.w $056B                 
                    LDA.b #$00                  
                    STA.b $8B                   
                    STA.b $9D                   
                    LDY.b #$10                  
                    LDA.b $17                   
                    AND.b #$0C                  
                    BEQ   CODE_23C76E           
                    AND.b #$08                  
                    BEQ   CODE_23C76C           
                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_23C752           
                    LDA.b #$30                  
                    STA.w $1200                 
CODE_23C752:        LDY.b #$10                  
                    LDA.b $BB                   
                    BEQ   CODE_23C75A           
                    LDY.b #$00                  
CODE_23C75A:        STY.b $09                   
                    LDA.b #$08                  
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    CMP.b #$85                  
                    BNE   CODE_23C76E           
                    LDY.b #$F0                  
                    STY.b $A6                   
CODE_23C76C:        STY.b $9D                   
CODE_23C76E:        LDY.b #$10                  
                    LDA.b $17                   
                    AND.b #$03                  
                    BEQ   CODE_23C77E           
                    AND.b #$02                  
                    BEQ   CODE_23C77C           
                    LDY.b #$F0                  
CODE_23C77C:        STY.b $8B                   
CODE_23C77E:        LDA.w $056B                 
                    BEQ   CODE_23C790           
                    LDA.b $A6                   
                    BNE   CODE_23C790           
                    LDA.b $17                   
                    AND.b #$0C                  
                    BNE   CODE_23C790           
                    STA.w $056B                 
CODE_23C790:        JSL.l CODE_23DE53           
                    JSL.l CODE_23DEA3           
                    JSR.w CODE_23CECA           
                    JSR.w CODE_23C08A           
                    RTS                         

CODE_23C79F:        LDA.w $0569                 
                    BEQ   CODE_23C7AC           
                    LDA.b $8B                   
                    CLC                         
                    ADC.w $0569                 
                    STA.b $8B                   
CODE_23C7AC:        JSL.l CODE_23DE53           
                    LDA.w $0569                 
                    BEQ   CODE_23C7BD           
                    LDA.b $8B                   
                    SEC                         
                    SBC.w $0569                 
                    STA.b $8B                   
CODE_23C7BD:        LDA.b #$00                  
                    STA.w $0569                 
                    LDY.b #$02                  
                    LDA.b $8B                   
                    BPL   CODE_23C7CD           
                    JSL.l CODE_27A859           
                    DEY                         
CODE_23C7CD:        BNE   CODE_23C7D0           
                    TAY                         
CODE_23C7D0:        STA.b $02                   
                    STY.w $0573                 
                    LDA.b $A6                   
                    BEQ   CODE_23C7E9           
                    LDA.b $55                   
                    BPL   CODE_23C7E5           
                    LDA.b $70                   
                    BMI   CODE_23C7E5           
                    LDA.b $9D                   
                    BMI   CODE_23C7E9           
CODE_23C7E5:        JSL.l CODE_23DEA3           
CODE_23C7E9:        JSR.w CODE_23CC62           
                    LDA.w $0577                 
                    BEQ   CODE_23C7F5           
                    LDA.b #$0E                  
                    BNE   CODE_23C7FF           
CODE_23C7F5:        LDA.b $BB                   
                    LDY.w $0575                 
                    BEQ   CODE_23C7FF           
                    CLC                         
                    ADC.b #$07                  
CODE_23C7FF:        PHX                         
                    ASL   A                     
                    TAX                         
                    PHB                         
                    PHK                         
                    PLB                         
                    LDA   POINTER_23C816,x             
                    STA.b $00                   
                    LDA   POINTER_23C816+1,x             
                    STA.b $01                   
                    PLB                         
                    PLX                         
                    JMP.w ($0000)               

POINTER_23C816:     dw CODE_23C834
                    dw CODE_23C85F
                    dw CODE_23C86A
                    dw CODE_23C884
                    dw CODE_23C892
                    dw CODE_23C972
                    dw CODE_23C86A
                    dw CODE_23C855
                    dw CODE_23C855
                    dw CODE_23C877
                    dw CODE_23C855
                    dw CODE_23C8D2
                    dw CODE_23C982
                    dw CODE_23C877
                    dw CODE_23C98F

CODE_23C834:        JSR.w CODE_23C9D8
                    JSR.w CODE_23CAB6
                    LDA.w $058A                 
                    LSR   A                     
                    BCS   CODE_23C854                   
                    LDA.w $101F                 
                    BNE   CODE_23C854           
                    LDA.b $A6                   
                    BEQ   CODE_23C854           
                    LDA.b #$80                  
                    LDY.w $056E                 
                    BEQ   CODE_23C852           
                    LDA.b #$9C                  
CODE_23C852:        STA.b $BC                   
CODE_23C854:        RTS                         

CODE_23C855:        JSR.w CODE_23CA96           
                    JSR.w CODE_23CBBB           
                    JSR.w CODE_23CC08           
                    RTS                         

CODE_23C85F:        JSR.w CODE_23C9D8           
                    JSR.w CODE_23CAB6           
                    JSR.w CODE_23CF4E           
                    RTS                         

                    RTS                         

CODE_23C86A:        JSR.w CODE_23C9D8           
                    JSR.w CODE_23CAB6           
                    JSR.w CODE_23CF4E           
                    JSR.w CODE_23CFB5           
                    RTS                         

CODE_23C877:        JSR.w CODE_23CA96           
                    JSR.w CODE_23CBBB           
                    JSR.w CODE_23CC08           
                    JSR.w CODE_23CFB5           
                    RTS                         

CODE_23C884:        JSR.w CODE_23C9D8           
                    JSR.w CODE_23CAB6           
                    JSR.w CODE_23CEE6           
                    JSR.w CODE_23CF74           
                    RTS                         

                    RTS                         

CODE_23C892:        JSR.w CODE_23C9D8           
                    JSR.w CODE_23CAB6           
                    LDA.w $06A4                 
                    BNE   CODE_23C8D1           
                    LDA.b $A6                   
                    BEQ   CODE_23C8B1           
                    LDA.w $058A                 
                    LSR   A                     
                    BCS   CODE_23C8B1                   
                    LDA.b #$00                  
                    STA.w $0513                 
                    LDY.b #$01                  
                    JMP.w CODE_23C8CC           

CODE_23C8B1:        LDA.w $0513                 
                    BNE   CODE_23C8C8           
                    STA.b $8B                   
                    LDA.b $17                   
                    AND.b #$03                  
                    BEQ   CODE_23C8C8           
                    LDA.b #$40                  
                    STA.w $1200                 
                    LDA.b #$1F                  
                    STA.w $0513                 
CODE_23C8C8:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_23C8CC:        LDA.w $E9AE,y               
                    STA.b $BC                   
CODE_23C8D1:        RTS                         

CODE_23C8D2:        LDX.b #$FF                  
                    LDA.b $17                   
                    AND.b #$0C                  
                    BEQ   CODE_23C900           
                    STA.b $A6                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $EB2D,x               
                    BPL   CODE_23C8EC           
                    LDY.w $0544                 
                    BPL   CODE_23C8EC           
                    LDA.b #$00                  
CODE_23C8EC:        LDY.b $17                   
                    BPL   CODE_23C8F1           
                    ASL   A                     
CODE_23C8F1:        CMP.b #$E1                  
                    BCC   CODE_23C8FB           
                    LDY.b $A6                   
                    BNE   CODE_23C8FB           
                    LDA.b #$E0                  
CODE_23C8FB:        STA.b $9D                   
                    JMP.w CODE_23C90D           

CODE_23C900:        LDY.b $9D                   
                    BEQ   CODE_23C90D           
                    INY                         
                    LDA.b $9D                   
                    BMI   CODE_23C90B           
                    DEY                         
                    DEY                         
CODE_23C90B:        STY.b $9D                   
CODE_23C90D:        LDA.b $17                   
                    AND.b #$03                  
                    BEQ   CODE_23C923           
                    LSR   A                     
                    TAY                         
                    LDA.w $EB2D,y               
                    LDY.b $17                   
                    BPL   CODE_23C91D           
                    ASL   A                     
CODE_23C91D:        STA.b $8B                   
                    LDX.b #$02                  
                    BNE   CODE_23C93B           
CODE_23C923:        LDY.b $8B                   
                    BEQ   CODE_23C933           
                    INY                         
                    LDA.b $8B                   
                    BMI   CODE_23C92E           
                    DEY                         
                    DEY                         
CODE_23C92E:        STY.b $8B                   
                    JMP.w CODE_23C93B           

CODE_23C933:        LDA.b $A6                   
                    BNE   CODE_23C93B           
                    LDA.b #$2A                  
                    BNE   CODE_23C96F           
CODE_23C93B:        TXA                         
                    BMI   CODE_23C964           
                    LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    LDY.b #$00                  
                    BIT.b $17                   
                    BMI   CODE_23C94A           
                    LSR   A                     
                    INY                         
CODE_23C94A:        AND.b #$07                  
                    TAY                         
                    BNE   CODE_23C95B           
                    LDA.b $15                   
                    AND.w $EB20,y               
                    BNE   CODE_23C95B           
                    LDA.b #$0E                  
                    STA.w $1200                 
CODE_23C95B:        LDA.w $EB22,x               
                    CLC                         
                    ADC.w $EB25,y               
                    BNE   CODE_23C96F           
CODE_23C964:        LDY.b #$3E                  
                    LDA.b $15                   
                    AND.b #$08                  
                    BEQ   CODE_23C96E           
                    INY                         
                    INY                         
CODE_23C96E:        TYA                         
CODE_23C96F:        STA.b $BC                   
                    RTS                         

CODE_23C972:        JSR.w CODE_23CE61           
                    JSR.w CODE_23C9D8           
                    JSR.w CODE_23CAB6           
                    JSR.w CODE_23CEE6           
                    JSR.w CODE_23CF74           
                    RTS                         

CODE_23C982:        JSR.w CODE_23CE61           
                    JSR.w CODE_23CA96           
                    JSR.w CODE_23CBBB           
                    JSR.w CODE_23CC08           
                    RTS                         

CODE_23C98F:        JSR.w CODE_23C9D8           
                    JSR.w CODE_23CAB6           
                    LDA.b $A6                   
                    BNE   CODE_23C99C           
                    STA.w $0550                 
CODE_23C99C:        LDA.w $0550                 
                    BNE   CODE_23C9B4           
                    LDA.b $A6                   
                    BNE   CODE_23C9C2           
                    LDA.b $17                   
                    AND.b #$03                  
                    STA.w $0550                 
                    BEQ   CODE_23C9C2           
                    INC.b $A6                   
                    LDY.b #$E0                  
                    STY.b $9D                   
CODE_23C9B4:        LDA.b $18                   
                    BPL   CODE_23C9C2           
                    LDA.b #$00                  
                    STA.w $0550                 
                    LDY.w $EAFD                 
                    STY.b $9D                   
CODE_23C9C2:        LDY.b $BB                   
                    BEQ   CODE_23C9C8           
                    LDY.b #$01                  
CODE_23C9C8:        LDA.w $E9A4,y               
                    STA.b $BC                   
                    LDA.b $15                   
                    AND.b #$08                  
                    BEQ   CODE_23C9D7           
                    INC.b $BC                   
                    INC.b $BC                   
CODE_23C9D7:        RTS                         

CODE_23C9D8:        LDA.w $0546                 
                    BEQ   CODE_23C9EA           
                    INC.w $0574                 
                    LDY.b #$0A                  
                    BIT.b $17                   
                    BVC   $09                   
                    LDY.b #$01                  
                    BNE   CODE_23C9EF           
CODE_23C9EA:        LDY.w $06B6                 
                    BEQ   CODE_23C9F6           
CODE_23C9EF:        LDA.w $EB2F,y               
                    TAY                         
                    JMP.w CODE_23CA17           

CODE_23C9F6:        LDY.b #$18                  
                    BIT.b $17                   
                    BVC   $1B                   
                    LDA.b $A6                   
                    ORA.w $0545                 
                    BNE   CODE_23CA0C           
                    LDA.b $02                   
                    CMP.b #$28                  
                    BMI   CODE_23CA0C           
                    INC.w $057B                 
CODE_23CA0C:        LDY.b #$28                  
                    LDA.w $0413                 
                    CMP.b #$7F                  
                    BNE   CODE_23CA17           
                    LDY.b #$38                  
CODE_23CA17:        STY.b $0D                   
                    LDY.w $0589                 
                    BEQ   CODE_23CA2C           
                    INC.w $0574                 
                    DEY                         
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b #$40                  
                    TAY                         
                    BNE   CODE_23CA32           
CODE_23CA2C:        LDA.b $BB                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
CODE_23CA32:        BIT.b $17                   
                    BVC   $04                   
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_23CA3A:        LDA.b $17                   
                    AND.b #$03                  
                    BNE   CODE_23CA4C           
                    LDA.b $A6                   
                    BNE   CODE_23CA95           
                    LDA.b $8B                   
                    BEQ   CODE_23CA95           
                    BMI   CODE_23CA67           
                    BPL   CODE_23CA7F           
CODE_23CA4C:        INY                         
                    INY                         
                    AND.w $0573                 
                    BNE   CODE_23CA61           
                    DEY                         
                    LDA.b $02                   
                    CMP.b $0D                   
                    BEQ   CODE_23CA95           
                    BMI   CODE_23CA61           
                    LDA.b $A6                   
                    BNE   CODE_23CA95           
                    DEY                         
CODE_23CA61:        LDA.b $17                   
                    AND.b #$01                  
                    BNE   CODE_23CA7F           
CODE_23CA67:        LDA.b #$00                  
                    SEC                         
                    SBC.w $EAA2,y               
                    STA.b $00                   
                    LDA.w $EA52,y               
                    EOR.b #$FF                  
                    STA.b $01                   
                    LDA.b $00                   
                    BNE   CODE_23CA89           
                    INC.b $01                   
                    JMP.w CODE_23CA89           

CODE_23CA7F:        LDA.w $EAA2,y               
                    STA.b $00                   
                    LDA.w $EA52,y               
                    STA.b $01                   
CODE_23CA89:        LDA.b $00                   
                    CLC                         
                    ADC.w $055C                 
                    LDA.b $8B                   
                    ADC.b $01                   
                    STA.b $8B                   
CODE_23CA95:        RTS                         

CODE_23CA96:        LDY.b #$38                  
                    LDA.b #$08                  
                    STA.b $0D                   
                    LDA.b $A6                   
                    BEQ   CODE_23CAA8           
                    LDA.b #$18                  
                    STA.b $0D                   
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_23CAA8:        LDA.b $A6                   
                    PHA                         
                    LDA.b #$00                  
                    STA.b $A6                   
                    JSR.w CODE_23CA3A           
                    PLA                         
                    STA.b $A6                   
                    RTS                         

CODE_23CAB6:        LDA.w $101F                 
                    BEQ   CODE_23CABE           
                    DEC.w $101F                 
CODE_23CABE:        LDA.b $18                   
                    AND.b #$80                  
                    STA.b $00                   
                    BEQ   CODE_23CB2A           
                    LDA.w $101F                 
                    BNE   CODE_23CACF           
                    LDA.b $A6                   
                    BNE   CODE_23CB2A           
CODE_23CACF:        LDA.b #$01                  
                    STA.w $1201                 
                    LDA.w $0553                 
                    BEQ   CODE_23CAF7           
                    LDA.w $0413                 
                    CMP.b #$7F                  
                    BEQ   CODE_23CAF7           
                    LDA.w $06A4                 
                    BNE   CODE_23CAF7           
                    LDA.b $BB                   
                    BEQ   CODE_23CAF7           
                    CMP.b #$04                  
                    BEQ   CODE_23CAF7           
                    STA.w $054F                 
                    STA.b $A6                   
                    LDA.b #$00                  
                    STA.w $101F                 
CODE_23CAF7:        LDA.b $8B                   
                    BPL   CODE_23CAFF           
                    JSL.l CODE_27A859           
CODE_23CAFF:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $EAFD                 
                    SEC                         
                    SBC.w $EAFE,x               
                    STA.b $9D                   
                    LDA.b #$01                  
                    STA.b $A6                   
                    LDA.b #$00                  
                    STA.w $BE                 
                    STA.w $101F                 
                    LDA.w $0413                 
                    CMP.b #$7F                  
                    BNE   CODE_23CB2A           
                    LDA.w $056E                 
                    BNE   CODE_23CB2A           
                    LDA.b #$80                  
                    STA.w $056E                 
CODE_23CB2A:        LDA.b $A6                   
                    BNE   CODE_23CB3F           
                    LDY.b $BB                   
                    LDA.w $AF64,y               
                    AND.b #$01                  
                    BNE   CODE_23CBA6           
                    LDA.b #$00                  
                    STA.w $056E                 
                    JMP.w CODE_23CBA6           

CODE_23CB3F:        LDY.b #$05                  
                    LDA.b $9D                   
                    CMP.b #$E0                  
                    BPL   CODE_23CB54           
                    LDA.w $0579                 
                    BNE   CODE_23CB59           
                    LDA.b $17                   
                    BPL   CODE_23CB54           
                    LDY.b #$01                  
                    BNE   CODE_23CB59           
CODE_23CB54:        LDA.b #$00                  
                    STA.w $0579                 
CODE_23CB59:        TYA                         
                    CLC                         
                    ADC.b $9D                   
                    STA.b $9D                   
                    LDA.b $BE                   
                    BEQ   CODE_23CB65           
                    DEC.b $BE                   
CODE_23CB65:        LDA.w $0577                 
                    BNE   CODE_23CB7B           
                    LDX.b $BB                   
                    LDA.w $AF64,x               
                    AND.b #$01                  
                    BEQ   CODE_23CB7B           
                    LDY.b $00                   
                    BEQ   CODE_23CB7B           
                    LDA.b #$10                  
                    STA.b $BE                   
CODE_23CB7B:        LDA.b $BE                   
                    BEQ   CODE_23CBA6           
                    LDA.b $9D                   
                    CMP.b #$E8                  
                    BMI   CODE_23CBA6           
                    LDY.b #$E8                  
                    LDA.w $056E                 
                    BEQ   CODE_23CB9A           
                    CMP.b #$0F                  
                    BCS   CODE_23CBA4                   
                    LDY.b #$F0                  
                    AND.b #$08                  
                    BNE   CODE_23CBA4           
                    LDY.b #$00                  
                    BEQ   CODE_23CBA4           
CODE_23CB9A:        LDA.b $9D                   
                    BMI   CODE_23CBA6           
                    CMP.b #$10                  
                    BCC   CODE_23CBA6           
                    LDY.b #$10                  
CODE_23CBA4:        STY.b $9D                   
CODE_23CBA6:        LDA.w $06B6                 
                    BEQ   CODE_23CBBA           
                    LSR   A                     
                    TAY                         
                    LDA.b $9D                   
                    BPL   CODE_23CBBA           
                    CMP.w $EB3A,y               
                    BMI   CODE_23CBBA           
                    LDA.b #$20                  
                    STA.b $9D                   
CODE_23CBBA:        RTS                         

CODE_23CBBB:        LDA.b $18                   
                    BPL   CODE_23CBD5           
                    LDA.b #$0E                  
                    STA.w $1200                 
                    LDY.b $A6                   
                    BNE   CODE_23CBCE           
                    LDA.b #$E0                  
                    STA.b $A6                   
                    BNE   CODE_23CBD3           
CODE_23CBCE:        LDA.b $9D                   
                    SEC                         
                    SBC.b #$20                  
CODE_23CBD3:        STA.b $9D                   
CODE_23CBD5:        LDA.b $A6                   
                    BEQ   CODE_23CC07           
                    LDA.b $9D                   
                    BMI   CODE_23CBE3           
                    LDA.b $15                   
                    AND.b #$02                  
                    BNE   CODE_23CBE5           
CODE_23CBE3:        INC.b $9D                   
CODE_23CBE5:        LDY.b #$20                  
                    LDA.b $9D                   
                    BPL   CODE_23CBFE           
                    LDY.w $0544                 
                    BPL   CODE_23CBFC           
                    LDY.w $0082                 
                    CPY.b #$F8                  
                    BCS   CODE_23CBFC                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $9D                   
CODE_23CBFC:        LDY.b #$E0                  
CODE_23CBFE:        CLC                         
                    ADC.b #$20                  
                    CMP.b #$40                  
                    BCC   CODE_23CC07           
                    STY.b $9D                   
CODE_23CC07:        RTS                         

CODE_23CC08:        LDA.b $A6                   
                    BEQ   CODE_23CC45           
                    LDA.b $18                   
                    BPL   CODE_23CC23           
                    LDA.w $0576                 
                    BNE   CODE_23CC20           
CODE_23CC15:        LDA.b #$00                  
                    STA.w $0576                 
                    STA.w $057F                 
                    STA.w $0574                 
CODE_23CC20:        INC.w $0576                 
CODE_23CC23:        LDA.w $0576                 
                    BNE   CODE_23CC46           
                    LDA.b $8B                   
                    BNE   CODE_23CC36           
                    LDA.b $15                   
                    AND.b #$30                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $BA                   
CODE_23CC36:        LDY.b $BA                   
                    LDA.b $BB                   
                    BNE   CODE_23CC40           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_23CC40:        LDA.w $E992,y               
                    STA.b $BC                   
CODE_23CC45:        RTS                         

CODE_23CC46:        LDA.w $057F                 
                    CMP.b #$06                  
                    BCC   CODE_23CC54           
                    DEC.w $0576                 
                    BNE   CODE_23CC15           
                    LDA.b #$05                  
CODE_23CC54:        LDY.b $BB                   
                    BNE   CODE_23CC5B           
                    CLC                         
                    ADC.b #$06                  
CODE_23CC5B:        TAY                         
                    LDA.w $E986,y               
                    STA.b $BC                   
                    RTS                         

CODE_23CC62:        LDA.b $8B                   
                    BPL   CODE_23CC6A           
                    JSL.l CODE_27A859           
CODE_23CC6A:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    INC.w $0574                 
                    LDA.w $0574                 
                    CMP.w $EAF4,y               
                    BMI   CODE_23CC8D           
                    LDA.b #$00                  
                    STA.w $0574                 
                    INC.b $BA                   
                    INC.w $057F                 
                    LDA.b $BA                   
                    CMP.b #$04                  
                    BMI   CODE_23CC8D           
                    LDA.b #$00                  
                    STA.b $BA                   
CODE_23CC8D:        LDA.b $17                   
                    AND.b #$03                  
                    BNE   CODE_23CC9B           
                    LDA.b $8B                   
                    BNE   CODE_23CC9B           
                    LDA.b #$02                  
                    STA.b $BA                   
CODE_23CC9B:        LDA.w $0517                 
                    BNE   CODE_23CCB0           
                    LDA.b $17                   
                    AND.b #$03                  
                    BEQ   CODE_23CCB0           
                    LDY.b #$00                  
                    AND.b #$02                  
                    BNE   CODE_23CCAE           
                    LDY.b #$40                  
CODE_23CCAE:        STY.b $BD                   
CODE_23CCB0:        LDA.w $0160                 
                    CMP.b #$80                  
                    BNE   CODE_23CCE2           
                    LDA.b $18                   
                    AND.b #$20                  
                    BEQ   CODE_23CCE2           
                    LDA.b $17                   
                    AND.b #$C0                  
                    BNE   CODE_23CCDA           
                    LDA.b $BB                   
                    CLC                         
                    ADC.b #$01                  
                    STA.w $0578                 
                    CMP.b #$07                  
                    BMI   CODE_23CCD1           
                    LDA.b #$00                  
CODE_23CCD1:        STA.w $0578                 
                    INC.w $0578                 
                    JMP.w CODE_23CCE2           

CODE_23CCDA:        LDA.w $0577                 
                    EOR.b #$01                  
                    STA.w $0577                 
CODE_23CCE2:        LDA.b $BB                   
                    ASL   A                     
                    ASL   A                     
                    ORA.b $BA                   
                    TAY                         
                    LDA.w $E958,y               
                    STA.b $BC                   
                    LDA.w $0575                 
                    BNE   CODE_23CD40           
                    LDA.b $8B                   
                    CLC                         
                    ADC.b #$01                  
                    CMP.b #$03                  
                    BCC   CODE_23CD40           
                    LDA.w $0573                 
                    AND.b $17                   
                    BEQ   CODE_23CD40           
                    LDY.b $BB                   
                    BEQ   CODE_23CD09           
                    LDY.b #$01                  
CODE_23CD09:        LDA.b $A6                   
                    BNE   CODE_23CD40           
                    LDA.w $E984,y               
                    STA.b $BC                   
                    LDA.l $7FC522               
                    ORA.l $7FC523               
                    BNE   CODE_23CD40           
                    LDA.b #$10                  
                    STA.l $7FC522               
                    LDA.b $5E                   
                    STA.l $7FC524               
                    LDA.b $43                   
                    STA.l $7FC526               
                    LDA.b $70                   
                    STA.l $7FC528               
                    LDA.b $55                   
                    STA.l $7FC52A               
                    LDA.b $BD                   
                    STA.l $7FC52C               
CODE_23CD40:        LDA.w $056F                 
                    BEQ   CODE_23CD52           
                    LDY.b $BB                   
                    LDA.w $AF64,y               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $E9A6,y               
                    STA.b $BC                   
CODE_23CD52:        LDA.w $0545                 
                    BEQ   CODE_23CD70           
                    LDA.b $A6                   
                    BNE   CODE_23CD61           
                    LDA.b $17                   
                    AND.b #$0B                  
                    BEQ   CODE_23CD66           
CODE_23CD61:        LDA.b #$00                  
                    STA.w $0545                 
CODE_23CD66:        LDA.b #$62                  
                    LDY.b $BB                   
                    BNE   CODE_23CD6E           
                    LDA.b #$66                  
CODE_23CD6E:        STA.b $BC                   
CODE_23CD70:        RTS                         

CODE_23CD71:        LDA.b $8B                   
                    BPL   CODE_23CD79           
                    JSL.l CODE_27A859           
CODE_23CD79:        CMP.b #$37                  
                    BCC   CODE_23CD9F           
                    LDA.w $056E                 
                    BNE   CODE_23CD9F           
                    LDA.w $056F                 
                    ORA.w $0577                 
                    ORA.w $056B                 
                    ORA.w $0545                 
                    BNE   CODE_23CD9F           
                    LDY.b $BA                   
                    LDA.b $BB                   
                    BNE   CODE_23CD9A           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_23CD9A:        LDA.w $E9B2,y               
                    STA.b $BC                   
CODE_23CD9F:        LDA.w $054F                 
                    BEQ   CODE_23CDBF           
                    LDA.b $15                   
                    LSR   A                     
                    PHA                         
                    AND.b #$07                  
                    TAY                         
                    LDA.w $EB14,y               
                    LDY.b $8B                   
                    BPL   CODE_23CDB4           
                    EOR.b #$40                  
CODE_23CDB4:        STA.b $BD                   
                    PLA                         
                    AND.b #$03                  
                    ASL   A                     
                    CLC                         
                    ADC.b #$34                  
                    STA.b $BC                   
CODE_23CDBF:        LDA.w $06A4                 
                    BEQ   CODE_23CDDE           
                    LDY.b $BA                   
                    LDA.b $A6                   
                    BEQ   CODE_23CDD1           
                    LDY.b #$00                  
                    LDA.b $BB                   
                    BNE   CODE_23CDD1           
                    INY                         
CODE_23CDD1:        LDA.b $BB                   
                    BNE   CODE_23CDD9           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_23CDD9:        LDA.w $E9C6,y               
                    STA.b $BC                   
CODE_23CDDE:        LDA.w $0558                 
                    BNE   CODE_23CDF4           
                    LDA.w $06A4                 
                    BEQ   CODE_23CE01           
                    LDA.b $BD                   
                    CMP.w $056C                 
                    BEQ   CODE_23CE01           
                    LDA.b #$07                  
                    STA.w $0558                 
CODE_23CDF4:        DEC.w $0558                 
                    LDA.b #$0A                  
                    LDY.b $BB                   
                    BNE   CODE_23CDFF           
                    LDA.b #$64                  
CODE_23CDFF:        STA.b $BC                   
CODE_23CE01:        LDA.w $0557                 
                    BEQ   CODE_23CE18           
                    LDA.b #$00                  
                    STA.w $0517                 
                    LDY.b #$84                  
                    LDA.b $BB                   
                    BEQ   CODE_23CE13           
                    LDY.b #$5A                  
CODE_23CE13:        STY.b $BC                   
                    DEC.w $0557                 
CODE_23CE18:        LDA.w $1CF5                 
                    BEQ   CODE_23CE54           
                    DEC.w $1CF5                 
                    LDY.b #$00                  
                    LDA.b $BB                   
                    BEQ   CODE_23CE3A           
                    CMP.b #$04                  
                    BNE   CODE_23CE2E           
                    LDY.b #$0C                  
                    BRA   CODE_23CE3A           

CODE_23CE2E:        LDY.b #$04                  
                    TAX                         
                    LDA.w $AF64,x               
                    AND.b #$01                  
                    BEQ   CODE_23CE3A           
                    LDY.b #$08                  
CODE_23CE3A:        STY.b $00                   
                    LDA.b $15                   
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    PHA                         
                    LSR   A                     
                    TAY                         
                    LDA.w $EB40,y               
                    STA.b $BD                   
                    PLA                         
                    CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.w $E9CE,y               
                    STA.b $BC                   
CODE_23CE54:        LDA.w $1CF4                 
                    BEQ   CODE_23CE60           
                    LDY.b $BB                   
                    LDA.w $E9EC,y               
                    STA.b $BC                   
CODE_23CE60:        RTS                         

CODE_23CE61:        LDA.b $17                   
                    AND.b #$04                  
                    TAY                         
                    BEQ   CODE_23CE96           
                    BIT.b $18                   
                    BVC   $2A                   
                    LDA.w $057A                 
                    BNE   CODE_23CE96           
                    JSR.w CODE_23CEC4           
                    LDA.b #$20                  
                    STA.w $0578                 
                    LDA.b #$17                  
                    STA.w $0554                 
                    BNE   CODE_23CEC3           
CODE_23CE80:        LDA.b #$3C                  
                    STA.b $BC                   
                    LDA.b #$00                  
                    STA.b $8B                   
                    LDA.b $A6                   
                    BEQ   CODE_23CE93           
                    LDA.b $9D                   
                    CLC                         
                    ADC.b #$07                  
                    STA.b $9D                   
CODE_23CE93:        PLA                         
                    PLA                         
                    RTS                         

CODE_23CE96:        LDA.w $057A                 
                    BEQ   CODE_23CEC3           
                    CMP.b #$01                  
                    BEQ   CODE_23CEAE           
                    CMP.b #$60                  
                    BNE   CODE_23CEA8           
                    LDA.b #$60                  
                    STA.w $0552                 
CODE_23CEA8:        DEC.w $057A                 
                    TYA                         
                    BNE   CODE_23CE80           
CODE_23CEAE:        LDA.b #$00                  
                    STA.w $057A                 
                    STA.w $0552                 
                    JSR.w CODE_23C467           
                    JSR.w CODE_23CEC4           
                    LDA.b #$17                  
                    STA.w $0554                 
                    BNE   CODE_23CE80           
CODE_23CEC3:        RTS                         

CODE_23CEC4:        LDA.b #$0C                  
                    STA.w $1200                 
                    RTS                         

CODE_23CECA:        LDA.w $056B                 
                    BEQ   CODE_23CEE5           
                    LDY.b $BB                   
                    LDA.w $E9DE,y               
                    STA.b $BC                   
                    LDA.b $17                   
                    AND.b #$0C                  
                    BEQ   CODE_23CEE5           
                    LDA.b $15                   
                    AND.b #$08                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $BD                   
CODE_23CEE5:        RTS                         

CODE_23CEE6:        LDA.w $058A                 
                    LSR   A                     
                    BCS   CODE_23CF4D                   
                    LDA.w $101F                 
                    BNE   CODE_23CF4D           
                    LDA.b $A6                   
                    BEQ   CODE_23CF4D           
                    LDA.w $056F                 
                    BNE   CODE_23CF2F           
                    LDA.b $18                   
                    BPL   CODE_23CF0F           
                    LDA.w $1201                 
                    CMP.b #$01                  
                    BEQ   CODE_23CF0A           
                    LDA.b #$04                  
                    STA.w $1203                 
CODE_23CF0A:        LDA.b #$0A                  
                    STA.w $0511                 
CODE_23CF0F:        LDA.w $0511                 
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    LDA.b #$00                  
                    LDY.w $056E                 
                    BNE   CODE_23CF1F           
                    LDA.b #$06                  
CODE_23CF1F:        LDY.b $9D                   
                    BMI   CODE_23CF26           
                    CLC                         
                    ADC.b #$03                  
CODE_23CF26:        CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.w $E9BA,y               
                    STA.b $BC                   
CODE_23CF2F:        LDA.w $056E                 
                    ORA.w $00BE                 
                    BEQ   CODE_23CF4D           
                    LDY.b #$FF                  
                    LDA.b $8B                   
                    BPL   CODE_23CF43           
                    LDY.b #$01                  
                    JSL.l CODE_27A859           
CODE_23CF43:        CMP.b #$18                  
                    BMI   CODE_23CF4D           
                    TYA                         
                    CLC                         
                    ADC.b $8B                   
                    STA.b $8B                   
CODE_23CF4D:        RTS                         

CODE_23CF4E:        LDA.w $058A                 
                    LSR   A                     
                    BCS   CODE_23CF73                   
                    LDA.w $101F                 
                    BNE   CODE_23CF73           
                    LDA.b $A6                   
                    BEQ   CODE_23CF73           
                    LDA.w $056F                 
                    BNE   CODE_23CF73           
                    LDA.b #$70                  
                    LDY.w $056E                 
                    BNE   CODE_23CF71           
                    LDA.b #$9E                  
                    LDY.b $9D                   
                    BMI   CODE_23CF71           
                    LDA.b #$0C                  
CODE_23CF71:        STA.b $BC                   
CODE_23CF73:        RTS                         

CODE_23CF74:        LDA.b $17                   
                    AND.b #$04                  
                    BNE   CODE_23CFB4           
                    BIT.b $18                   
                    BVC   $0F                   
                    LDA.w $0517                 
                    BNE   CODE_23CF8D           
                    LDA.b #$12                  
                    STA.w $0517                 
                    LDA.b #$04                  
                    STA.w $1203                 
CODE_23CF8D:        LDA.w $0517                 
                    BEQ   CODE_23CFB4           
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $A6                   
                    BEQ   CODE_23CF9E           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_23CF9E:        LDA.w $E99A,y               
                    STA.b $BC                   
                    LDA.w $0517                 
                    CMP.b #$0B                  
                    BEQ   CODE_23CFAE           
                    CMP.b #$03                  
                    BNE   CODE_23CFB4           
CODE_23CFAE:        LDA.b $BD                   
                    EOR.b #$40                  
                    STA.b $BD                   
CODE_23CFB4:        RTS                         

CODE_23CFB5:        LDA.w $0513                 
                    BEQ   CODE_23CFC9           
                    LSR   A                     
                    LSR   A                     
                    LDY.b $A6                   
                    BEQ   CODE_23CFC3           
                    CLC                         
                    ADC.b #$03                  
CODE_23CFC3:        TAY                         
                    LDA.w $E9A8,y               
                    STA.b $BC                   
CODE_23CFC9:        RTS                         

CODE_23CFCA:        LDA.w $0425                 
                    BEQ   CODE_23CFD2           
                    JMP.w CODE_23D1FC           

CODE_23CFD2:        LDA.w $1EB8                 
                    BEQ   CODE_23CFDA           
                    JMP.w CODE_23D093           

CODE_23CFDA:        LDY.w $05FC                 
                    BEQ   CODE_23D00A           
                    BMI   CODE_23D00A           
                    LDA.w $1A0C                 
                    PHA                         
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0781                 
                    PLA                         
                    STA.w $0210                 
                    STA.w $0212                 
                    LDA.w $1A0A                 
                    STA.b $12                   
                    STA.w $0211                 
                    LSR   A                     
                    STA.w $0213                 
                    ROR.w $0212                 
                    LDA.w $1A07                 
                    STA.b $25                   
                    JMP.w CODE_23D0FA           

CODE_23D00A:        LDA.b $5E                   
                    SEC                         
                    SBC.w $0210                 
                    BPL   CODE_23D052           
                    LDA.b $12                   
                    STA.b $00                   
                    LDA.b #$80                  
                    CLC                         
                    ADC.w $0210                 
                    STA.b $01                   
                    BCC   CODE_23D022           
                    INC.b $00                   
CODE_23D022:        LDA.b $43                   
                    CMP.b $00                   
                    BMI   CODE_23D093           
                    LDA.b $5E                   
                    SEC                         
                    SBC.b $01                   
                    BEQ   CODE_23D093           
                    BMI   CODE_23D093           
                    STA.w $0781                 
                    CLC                         
                    ADC.w $0210                 
                    STA.w $0210                 
                    BCC   CODE_23D042           
                    INC.b $12                   
                    INC.w $0211                 
CODE_23D042:        STZ.b $25                   
                    LDA.b $12                   
                    CMP.b $22                   
                    BMI   CODE_23D093           
                    STZ.w $0210                 
                    STZ.w $0781                 
                    BRA   CODE_23D093           

CODE_23D052:        LDA.b $12                   
                    STA.b $00                   
                    LDA.b #$70                  
                    CLC                         
                    ADC.w $0210                 
                    STA.b $01                   
                    BCC   CODE_23D062           
                    INC.b $00                   
CODE_23D062:        LDA.b $00                   
                    CMP.b $43                   
                    BMI   CODE_23D093           
                    LDA.b $5E                   
                    SEC                         
                    SBC.b $01                   
                    BPL   CODE_23D093           
                    STA.w $0781                 
                    CLC                         
                    ADC.w $0210                 
                    STA.w $0210                 
                    BCS   CODE_23D080                   
                    DEC.b $12                   
                    DEC.w $0211                 
CODE_23D080:        LDA.b #$01                  
                    STA.b $25                   
                    LDA.b $12                   
                    BPL   CODE_23D093           
                    STZ.b $12                   
                    STZ.w $0210                 
                    STZ.w $0211                 
                    STZ.w $0781                 
CODE_23D093:        LDA.w $02BF                 
                    CMP.b #$0B                  
                    BNE   CODE_23D0B0           
                    LDY.b #$00                  
                    LDA.w $0781                 
                    BPL   CODE_23D0A2           
                    DEY                         
CODE_23D0A2:        CLC                         
                    ADC.w $0353                 
                    STA.w $0353                 
                    TYA                         
                    ADC.w $0354                 
                    STA.w $0354                 
CODE_23D0B0:        REP   #$20                  
                    LDA.w $0210                 
                    LSR   A                     
                    STA.w $0212                 
                    SEP   #$20                  
                    LDA.w $0559                 
                    BNE   CODE_23D0FA           
                    LDA.b $79                   
                    LDY.b $8B                   
                    BMI   CODE_23D0CF           
                    CMP.b #$E8                  
                    BCC   CODE_23D0FA           
                    LDA.b #$E8                  
                    JMP.w CODE_23D0D5           

CODE_23D0CF:        CMP.b #$11                  
                    BCS   CODE_23D0FA                   
                    LDA.b #$10                  
CODE_23D0D5:        STA.b $79                   
                    LDY.b #$00                  
                    SEC                         
                    SBC.b $5E                   
                    BPL   CODE_23D0E0           
                    LDY.b #$FF                  
CODE_23D0E0:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    BCC   CODE_23D0E8           
                    INY                         
CODE_23D0E8:        TYA                         
                    CLC                         
                    ADC.b $43                   
                    STA.b $43                   
                    LDA.b $8B                   
                    PHP                         
                    AND.b #$0F                  
                    PLP                         
                    BPL   CODE_23D0F8           
                    ORA.b #$F0                  
CODE_23D0F8:        STA.b $8B                   
CODE_23D0FA:        LDA.w $0424                 
                    BEQ   CODE_23D109           
                    CMP.b #$01                  
                    BNE   CODE_23D106           
                    JMP.w CODE_23D18A           

CODE_23D106:        JMP.w CODE_23D1EF           

CODE_23D109:        LDA.w $05FC                 
                    BEQ   CODE_23D177           
CODE_23D10E:        LDA.w $1A0D                 
                    PHA                         
                    SEC                         
                    SBC.w $0216                 
                    STA.w $0780                 
                    PLA                         
                    STA.w $0216                 
                    STA.w $0543                 
                    LDA.w $0350                 
                    CMP.b #$01                  
                    BEQ   CODE_23D136           
                    CMP.b #$02                  
                    BEQ   CODE_23D15A           
                    CMP.b #$23                  
                    BEQ   CODE_23D15A           
                    LDA.w $0727                 
                    CMP.b #$05                  
                    BNE   CODE_23D15A           
CODE_23D136:        REP   #$20                  
                    LDA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
                    LDA.w $034F                 
                    AND.w #$00FF                
                    BEQ   CODE_23D158           
                    LDA.w $0216                 
                    STA.w $0218                 
CODE_23D158:        SEP   #$20                  
CODE_23D15A:        LDA.b $A6                   
                    BEQ   CODE_23D176           
                    LDA.w $056B                 
                    ORA.w $05FE                 
                    BNE   CODE_23D176           
                    LDA.w $0780                 
                    BPL   CODE_23D16D           
                    DEC.b $55                   
CODE_23D16D:        CLC                         
                    ADC.b $70                   
                    STA.b $70                   
                    BCC   CODE_23D176           
                    INC.b $55                   
CODE_23D176:        RTL                         

CODE_23D177:        LDA.w $0216                 
                    CMP.b #$EF                  
                    BNE   CODE_23D18A           
                    LDA.w $056E                 
                    ORA.w $056B                 
                    PHP                         
                    LDA.b #$EF                  
                    PLP                         
                    BEQ   CODE_23D1F2           
CODE_23D18A:        LDA.b $70                   
                    SEC                         
                    SBC.w $0543                 
                    STA.b $00                   
                    LDA.b $55                   
                    SBC.w $0542                 
                    BMI   CODE_23D1A4           
                    LDA.b $00                   
                    SEC                         
                    SBC.b #$30                  
                    BCS   CODE_23D1B7                   
                    CMP.b #$FD                  
                    BCS   CODE_23D1A6                   
CODE_23D1A4:        LDA.b #$FD                  
CODE_23D1A6:        STA.w $0780                 
                    CLC                         
                    ADC.w $0216                 
                    BCS   CODE_23D1B4                   
                    LDA.b #$00                  
                    STA.w $0780                 
CODE_23D1B4:        JMP.w CODE_23D1D2           

CODE_23D1B7:        LDA.b $00                   
                    SEC                         
                    SBC.b #$79                  
                    BCC   CODE_23D1EF           
                    STA.w $0780                 
                    CLC                         
                    ADC.w $0216                 
                    BCS   CODE_23D1CB                   
                    CMP.b #$EF                  
                    BCC   CODE_23D1D2           
CODE_23D1CB:        LDA.b #$00                  
                    STA.w $0780                 
                    LDA.b #$EF                  
CODE_23D1D2:        STA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
                    LDA.w $034F                 
                    BEQ   CODE_23D1EF           
                    LDA.w $0216                 
                    STA.w $0218                 
CODE_23D1EF:        LDA.w $0216                 
CODE_23D1F2:        STA.w $0543                 
                    LDA.w $0217                 
                    STA.w $0542                 
                    RTL                         

CODE_23D1FC:        LDA.b #$00                  
                    STA.b $43                   
                    LDY.b $22                   
                    LDA.w $CEED,y               
                    STA.b $00                   
                    LDA.w $CEFD,y               
                    STA.b $01                   
                    LDA.b $70                   
                    SEC                         
                    SBC.w $0543                 
                    TAY                         
                    LDA.b $55                   
                    SBC.w $0542                 
                    BEQ   CODE_23D21D           
                    JMP.w CODE_23D2B5           

CODE_23D21D:        TYA                         
                    SEC                         
                    SBC.b #$30                  
                    BCS   CODE_23D24D                   
                    DEC.w $0542                 
                    CMP.b #$FD                  
                    BCS   CODE_23D22C                   
                    LDA.b #$FD                  
CODE_23D22C:        STA.w $0780                 
                    CLC                         
                    ADC.w $0543                 
                    STA.w $0543                 
                    LDA.b #$00                  
                    STA.b $25                   
                    ADC.w $0542                 
                    BPL   CODE_23D247           
                    LDA.b #$00                  
                    STA.w $0543                 
                    STA.w $0780                 
CODE_23D247:        STA.w $0542                 
                    JMP.w CODE_23D28C           

CODE_23D24D:        TYA                         
                    SBC.b #$58                  
                    BCC   CODE_23D2B5           
                    CMP.b #$04                  
                    BCC   CODE_23D258           
                    LDA.b #$04                  
CODE_23D258:        STA.w $0780                 
                    CLC                         
                    ADC.w $0543                 
                    STA.w $0543                 
                    LDA.b #$00                  
                    ADC.w $0542                 
                    STA.w $0542                 
                    CMP.b $00                   
                    PHP                         
                    LDA.b #$01                  
                    STA.b $25                   
                    PLP                         
                    BCC   CODE_23D28C           
                    BNE   CODE_23D27D           
                    LDA.w $0543                 
                    CMP.b $01                   
                    BCC   CODE_23D28C           
CODE_23D27D:        LDA.b $00                   
                    STA.w $0542                 
                    LDA.b $01                   
                    STA.w $0543                 
                    LDA.b #$00                  
                    STA.w $0780                 
CODE_23D28C:        REP   #$20                  
                    LDA.w $0542                 
                    XBA                         
                    STA.w $0216                 
                    LSR   A                     
                    LSR   A                     
                    STA.w $0218                 
                    LDA.w $0216                 
                    SEC                         
                    SBC.w $0218                 
                    STA.w $0218                 
                    SEP   #$20                  
                    LDA.w $0542                 
                    STA.b $13                   
                    LDA.w $0425                 
                    BEQ   CODE_23D2B5           
                    LDA.b #$0F                  
                    STA.w $16                 
CODE_23D2B5:        RTL                         

CODE_23D2B6:        STZ.w $1CEF                 
                    LDA.w $0425                 
                    BNE   CODE_23D331           
                    LDA.w $058B                 
                    BEQ   CODE_23D2E4           
                    LDA.w $0544                 
                    BNE   CODE_23D2E4           
                    LDA.b $70                   
                    CLC                         
                    ADC.b $09                   
                    SEC                         
                    SBC.w $0543                 
                    CMP.b #$A0                  
                    BCC   CODE_23D2E4           
                    SBC.b #$10                  
                    AND.b #$F0                  
                    STA.b $0D                   
                    LDA.b #$01                  
                    STA.b $0C                   
                    STA.w $1CEF                 
                    BNE   CODE_23D2F3           
CODE_23D2E4:        LDA.b $55                   
                    STA.b $0C                   
                    LDA.b $09                   
                    CLC                         
                    ADC.b $70                   
                    STA.b $0D                   
                    BCC   CODE_23D2F3           
                    INC.b $0C                   
CODE_23D2F3:        LDA.b $0C                   
                    BEQ   CODE_23D306           
                    CMP.b #$01                  
                    BNE   CODE_23D301           
                    LDA.b $0D                   
                    CMP.b #$B0                  
                    BCC   CODE_23D306           
CODE_23D301:        LDA.b #$00                  
                    STA.b $B4                   
                    RTL                         

CODE_23D306:        LDA.b $43                   
                    STA.b $0E                   
                    LDA.b $0A                   
                    BPL   CODE_23D310           
                    DEC.b $0E                   
CODE_23D310:        LDA.b $5E                   
                    CLC                         
                    ADC.b $0A                   
                    STA.b $0F                   
                    BCC   CODE_23D31B           
                    INC.b $0E                   
CODE_23D31B:        STY.b $09                   
                    STX.b $0A                   
                    JSL.l CODE_209FE0           
                    LDX.b $0A                   
                    LDY.w $0571                 
                    BNE   CODE_23D32E           
                    JSL.l CODE_278ED2           
CODE_23D32E:        LDY.b $09                   
                    RTL                         

CODE_23D331:        LDA.b $55                   
                    STA.b $0C                   
                    LDA.b $09                   
                    CLC                         
                    ADC.b $70                   
                    STA.b $0D                   
                    BCC   CODE_23D340           
                    INC.b $0C                   
CODE_23D340:        LDA.b $0C                   
                    BPL   CODE_23D347           
                    LDA.b #$00                  
                    RTL                         

CODE_23D347:        LDA.b $5E                   
                    CLC                         
                    ADC.b $0A                   
                    STA.b $0F                   
                    STY.b $09                   
                    JSL.l CODE_209F69           
                    LDY.w $0571                 
                    BNE   CODE_23D35D           
                    JSL.l CODE_278ED2           
CODE_23D35D:        LDY.b #$00                  
                    STY.b $0E                   
                    LDY.b $09                   
                    RTL                         

CODE_23D364:        LDA.b #$00                  
                    STA.w $056D                 
                    LDA.w $0571                 
                    BEQ   CODE_23D36F           
                    RTS                         

CODE_23D36F:        LDA.w $AD82                 
                    STA.b $52                   
                    LDA.w $AD83                 
                    STA.b $53                   
                    LDA.w $0563                 
                    BEQ   CODE_23D396           
                    LDA.w $070A                 
                    CMP.b #$03                  
                    BEQ   CODE_23D393           
                    CMP.b #$0E                  
                    BEQ   CODE_23D393           
                    LDA.w $AD80                 
                    STA.b $52                   
                    LDA.w $AD81                 
                    STA.b $53                   
CODE_23D393:        JMP.w CODE_23D896           

CODE_23D396:        LDY.b #$26                  
                    LDA.b $BB                   
                    BEQ   CODE_23D3A3           
                    LDA.w $056F                 
                    BNE   CODE_23D3A3           
                    LDY.b #$06                  
CODE_23D3A3:        LDX.b #$03                  
                    LDA.b $9D                   
                    BPL   CODE_23D3AE           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
CODE_23D3AE:        LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BMI   CODE_23D3BB           
                    TYA                         
                    CLC                         
                    ADC.b #$08                  
                    TAY                         
CODE_23D3BB:        TYA                         
                    PHA                         
                    LDA.w $EB42,y               
                    STA.b $09                   
                    LDA.w $EB43,y               
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    STA.w $0603,x               
                    PHA                         
                    AND.b #$C0                  
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    STA.w $0608,x               
                    PLA                         
                    JSR.w CODE_23D4C9           
                    PLA                         
                    TAY                         
                    DEY                         
                    DEY                         
                    DEX                         
                    BMI   CODE_23D3E5           
                    JMP.w CODE_23D3BB           

CODE_23D3E5:        LDY.b #$02                  
                    JSR.w CODE_23D4B4           
                    BCC   CODE_23D42D           
                    LDA.w $0585                 
                    BNE   CODE_23D42D           
                    INC.w $0574                 
                    LDY.b #$01                  
                    LDX.b #$00                  
                    LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BPL   CODE_23D403           
                    LDY.b #$FF                  
                    INX                         
CODE_23D403:        LDA.b $BB                   
                    BNE   CODE_23D409           
                    INX                         
                    INX                         
CODE_23D409:        LDA.w $EBA8,x               
                    CLC                         
                    ADC.b $5E                   
                    AND.b #$0F                  
                    BEQ   CODE_23D42D           
                    TYA                         
                    BPL   CODE_23D418           
                    DEC.b $43                   
CODE_23D418:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    BCC   CODE_23D421           
                    INC.b $43                   
CODE_23D421:        INY                         
                    LDA.b $8B                   
                    BPL   CODE_23D428           
                    DEY                         
                    DEY                         
CODE_23D428:        TYA                         
                    BNE   CODE_23D42D           
                    STA.b $8B                   
CODE_23D42D:        LDA.b $9D                   
                    BPL   CODE_23D453           
                    LDA.b $A6                   
                    BEQ   CODE_23D453           
                    LDY.b #$00                  
                    JSR.w CODE_23D4B4           
                    BCC   CODE_23D452           
                    LDA.b #$01                  
                    STA.w $1200                 
                    INY                         
                    STY.w $056D                 
                    LDA.w $1A0F                 
                    JSL.l CODE_27A859           
                    BPL   CODE_23D450           
                    LDA.b #$01                  
CODE_23D450:        STA.b $9D                   
CODE_23D452:        RTS                         

CODE_23D453:        LDX.w $0609                 
                    LDA.w $0604                 
                    CMP.w $1E96,x               
                    BCS   CODE_23D476                   
                    LDX.w $0608                 
                    LDA.w $0603                 
                    CMP.w $1E96,x               
                    BCS   CODE_23D476                   
                    LDA.b $A6                   
                    BNE   CODE_23D4B3           
                    STA.b $9D                   
                    LDA.b #$01                  
                    STA.b $A6                   
                    JMP.w CODE_23D4B3           

CODE_23D476:        LDA.w $1CEF                 
                    BEQ   CODE_23D494           
                    LDA.b $70                   
                    SEC                         
                    SBC.w $0543                 
                    AND.b #$F0                  
                    CLC                         
                    ADC.b #$01                  
                    CLC                         
                    ADC.w $0543                 
                    STA.b $70                   
                    LDA.b #$00                  
                    ADC.b #$00                  
                    STA.b $55                   
                    BPL   CODE_23D4AA           
CODE_23D494:        LDA.b $70                   
                    AND.b #$0F                  
                    CMP.b #$06                  
                    BCS   CODE_23D4B3                   
                    LDA.b $70                   
                    AND.b #$0F                  
                    BEQ   CODE_23D4AA           
                    CMP.b #$01                  
                    BEQ   CODE_23D4A8           
                    DEC.b $70                   
CODE_23D4A8:        DEC.b $70                   
CODE_23D4AA:        LDA.b #$00                  
                    STA.b $A6                   
                    STA.b $9D                   
                    STA.w $05F4                 
CODE_23D4B3:        RTS                         

CODE_23D4B4:        LDX.w $0609,y               
                    LDA.w $0604,y               
                    CMP.w $1E9A,x               
                    BCS   CODE_23D4C8                   
                    LDX.w $0608,y               
                    LDA.w $0603,y               
                    CMP.w $1E9A,x               
CODE_23D4C8:        RTS                         

CODE_23D4C9:        TYA                         
                    PHA                         
                    LDY.w $0577                 
                    BNE   CODE_23D4FC           
                    LDA.b #$32                  
                    CMP.w $0603,x               
                    BNE   CODE_23D4FC           
                    BIT.b $18                   
                    BVC   $21                   
                    CPX.b #$03                  
                    BEQ   CODE_23D4FC           
                    LDA.w $0564                 
                    BNE   CODE_23D4FC           
                    TXA                         
                    PHA                         
                    JSR.w CODE_23D548           
                    TXA                         
                    ASL   A                     
                    PLA                         
                    TAX                         
                    BCS   CODE_23D4FC                   
                    LDA.b #$00                  
                    STA.w $0517                 
                    LDA.b #$02                  
                    JSR.w CODE_23DE37           
                    JMP.w CODE_23D545           

CODE_23D4FC:        LDA.w $0603,x               
                    CMP.b #$40                  
                    BNE   CODE_23D519           
                    LDA.b #$01                  
                    JSR.w CODE_23DE37           
                    JSL.l CODE_209BB7           
                    LDA.b #$01                  
                    STA.w $1203                 
                    LDA.b #$00                  
                    STA.w $0604                 
                    JMP.w CODE_23D545           

CODE_23D519:        CMP.b #$F2                  
                    BNE   CODE_23D542           
                    CPX.b #$02                  
                    BPL   CODE_23D542           
                    LDA.b #$09                  
                    CMP.w $0564                 
                    BEQ   CODE_23D542           
                    JSR.w CODE_23DE37           
                    LDA.b #$10                  
                    STA.w $1CF3                 
                    LDA.b #$0B                  
                    STA.w $1200                 
                    LDA.b #$84                  
                    STA.w $0567                 
                    LDA.b #$04                  
                    STA.w $1202                 
                    JMP.w CODE_23D545           

CODE_23D542:        JSR.w CODE_23D567           
CODE_23D545:        PLA                         
                    TAY                         
                    RTS                         

CODE_23D548:        LDX.b #$04                  
CODE_23D54A:        LDA.w $0661,x               
                    BEQ   CODE_23D553           
                    DEX                         
                    BPL   CODE_23D54A           
                    RTS                         

CODE_23D553:        JSL.l CODE_279C96           
                    LDA.b #$04                  
                    STA.w $0661,x               
                    LDA.b #$5C                  
                    STA.w $0671,x               
                    LDA.b #$80                  
                    STA.w $06A6,x               
                    RTS                         

CODE_23D567:        TYA                         
                    PHA                         
                    LDY.b #$03                  
                    CPX.b #$04                  
                    BEQ   CODE_23D573           
                    LDA.b $9D                   
                    BPL   CODE_23D57E           
CODE_23D573:        INY                         
                    INY                         
                    INY                         
                    LDA.w $0560                 
                    CMP.b #$08                  
                    BNE   CODE_23D57E           
                    INY                         
CODE_23D57E:        LDA.w $0603,x               
                    SEC                         
                    SBC.w $EC13,y               
                    CMP.w $EC03,y               
                    BCC   CODE_23D590           
CODE_23D58A:        DEY                         
                    BPL   CODE_23D57E           
                    JMP.w CODE_23D619           

CODE_23D590:        CLC                         
                    ADC.w $EC0B,y               
                    STA.b $05                   
                    LDA.w $EC23,x               
                    AND.w $EC1B,y               
                    BEQ   CODE_23D58A           
                    LDA.b #$10                  
                    STA.w $1A45                 
                    LDY.b $05                   
                    LDA.w $EBC3,y               
                    JSR.w CODE_23D61C           
                    TYA                         
                    BNE   CODE_23D5B1           
                    JMP.w CODE_23D619           

CODE_23D5B1:        BMI   CODE_23D5D6           
                    LDY.b $05                   
                    ORA.w $EBE3,y               
                    STA.w $057C                 
                    LDA.b #$01                  
                    STA.w $1200                 
                    LDA.b #$02                  
                    STA.b $0B                   
                    CPX.b #$02                  
                    BMI   CODE_23D5D6           
                    LDY.b #$02                  
                    LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BMI   CODE_23D5D3           
                    INY                         
CODE_23D5D3:        JMP.w CODE_23D5E7           

CODE_23D5D6:        LDY.b #$00                  
                    LDA.w $0563                 
                    BEQ   CODE_23D5E2           
                    TXA                         
                    BEQ   CODE_23D5E7           
                    BNE   CODE_23D5E6           
CODE_23D5E2:        LDA.b $9D                   
                    BPL   CODE_23D5E7           
CODE_23D5E6:        INY                         
CODE_23D5E7:        STY.w $057D                 
                    LDY.b #$06                  
                    LDA.w $0661,y               
                    BEQ   CODE_23D5F2           
                    INY                         
CODE_23D5F2:        LDA.b $0D                   
                    AND.b #$F0                  
                    STA.b $0D                   
                    STA.w $71,y               
                    LDA.b $0C                   
                    STA.w $56,y               
                    LDA.b $0E                   
                    STA.w $44,y               
                    LDA.b $0F                   
                    STA.w $5F,y               
                    JSL.l CODE_27A8B1           
                    LDA.w $057D                 
                    BEQ   CODE_23D619           
                    LDA.b #$F3                  
                    JSL.l CODE_27A75D           
CODE_23D619:        PLA                         
                    TAY                         
                    RTS                         

CODE_23D61C:        STA.b $00                   
                    LDA.w $057C                 
                    BNE   CODE_23D645           
                    LDY.b #$06                  
                    LDA.w $0661,y               
                    ORA.w $052E                 
                    BEQ   CODE_23D635           
                    LDA.w $0662,y               
                    ORA.w $052F                 
                    BNE   CODE_23D645           
CODE_23D635:        LDY.b #$05                  
                    LDA.w $0518,y               
                    BEQ   CODE_23D648           
                    LDA.b $0F                   
                    AND.b #$F0                  
                    CMP.w $005F,y               
                    BNE   CODE_23D648           
CODE_23D645:        LDY.b #$00                  
                    RTS                         

CODE_23D648:        LDA.b $0F                   
                    AND.b #$F0                  
                    STA.b $0F                   
                    LDA.b $00                   
                    ASL   A                     
                    TAY                         
                    PHB                         
                    PHK                         
                    PLB                         
                    LDA   POINTER_23D663,y               
                    STA.b $00                   
                    LDA   POINTER_23D663+1,y               
                    STA.b $01                   
                    PLB                         
                    JMP.w ($0000)               

POINTER_23D663:     dw CODE_23D67B
                    dw CODE_23D67E
                    dw CODE_23D68C
                    dw CODE_23D69A
                    dw CODE_23D6A2
                    dw CODE_23D6C2
                    dw CODE_23D6D2
                    dw CODE_23D74D
                    dw CODE_23D757
                    dw CODE_23D76B
                    dw CODE_23D777
                    dw CODE_23D7C8

CODE_23D67B:        LDY.b #$01
                    RTS

CODE_23D67E:        LDA.b #$00                  
                    STA.w $0586                 
                    LDY.b #$05                  
                    LDA.b $BB                   
                    BEQ   CODE_23D68B           
                    LDY.b #$02                  
CODE_23D68B:        RTS                         

CODE_23D68C:        LDA.b #$00                  
                    STA.w $0586                 
                    LDY.b #$05                  
                    LDA.b $BB                   
                    BEQ   CODE_23D699           
                    LDY.b #$03                  
CODE_23D699:        RTS                         

CODE_23D69A:        LDA.b #$80                  
                    STA.w $0586                 
                    LDY.b #$04                  
                    RTS                         

CODE_23D6A2:        JSR.w CODE_23D7D2           
                    LDY.b #$01                  
                    LDA.b $0F                   
                    ORA.b $0E                   
                    CMP.w $0582                 
                    BNE   CODE_23D6C1           
                    LDA.w $0516                 
                    BEQ   CODE_23D6C1           
                    LDA.w $0581                 
                    BMI   CODE_23D6C1           
                    DEC.w $0581                 
                    LDA.b #$17                  
                    STA.b $05                   
CODE_23D6C1:        RTS                         

CODE_23D6C2:        LDA.b #$80                  
                    STA.w $0586                 
                    LDY.b #$04                  
                    LDA.w $0553                 
                    BNE   CODE_23D6D1           
                    JMP.w CODE_23D6A2           

CODE_23D6D1:        RTS                         

CODE_23D6D2:        JSR.w CODE_23D7ED           
                    CPX.b #$04                  
                    BEQ   CODE_23D6E0           
                    LDA.b $BB                   
                    BNE   CODE_23D6E0           
                    LDY.b #$01                  
                    RTS                         

CODE_23D6E0:        LDA.b #$07                  
                    STA.w $1203                 
                    JSL.l CODE_279544           
                    LDA.b #$02                  
                    STA.w $1F9C                 
                    LDA.w $0543                 
                    STA.b $D8                   
                    LDA.w $0542                 
                    STA.b $D9                   
                    LDA.b $0C                   
                    XBA                         
                    LDA.b $0D                   
                    REP   #$20                  
                    AND.w #$FFF0                
                    SEC                         
                    SBC.b $D8                   
                    STA.b $DA                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DC                   
                    SEP   #$20                  
                    LDA.b $DA                   
                    STA.w $1F9F                 
                    LDA.b $DB                   
                    STA.w $1FB1                 
                    LDA.b $DC                   
                    STA.w $1FAB                 
                    LDA.b $DD                   
                    STA.b $DF                   
                    LDA.b $0E                   
                    XBA                         
                    LDA.b $0F                   
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    SEP   #$20                  
                    STA.w $1FA2                 
                    XBA                         
                    STA.w $02AE                 
                    STZ.w $1FA8                 
                    STZ.w $1FAE                 
                    LDA.b #$FA                  
                    STA.w $1FA5                 
                    LDA.b #$01                  
                    STA.w $069C                 
                    LDY.b #$02                  
                    STY.b $0B                   
                    LDY.b #$80                  
                    RTS                         

CODE_23D74D:        LDY.b #$00                  
                    LDA.b #$03                  
                    STA.w $1203                 
                    LDY.b #$06                  
                    RTS                         

CODE_23D757:        LDA.b $0F                   
                    ORA.b $0E                   
                    STA.w $0582                 
                    LDA.b #$09                  
                    STA.w $0581                 
                    LDA.b #$C8                  
                    STA.w $0516                 
                    JMP.w CODE_23D6A2           

CODE_23D76B:        JSL.l CODE_209BB7           
                    LDA.b #$00                  
                    STA.w $0586                 
                    LDY.b #$07                  
                    RTS                         

CODE_23D777:        LDY.b #$05                  
CODE_23D779:        LDA.w $1FC8,y               
                    BEQ   CODE_23D784           
                    DEY                         
                    BPL   CODE_23D779           
                    JMP.w CODE_23D78E           

CODE_23D784:        LDA.b #$16                  
                    STA.w $1FC8,y               
                    LDA.b #$20                  
                    STA.w $06C7,y               
CODE_23D78E:        LDA.b $0D                   
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$10                  
                    PHP                         
                    CPY.b #$00                  
                    BMI   CODE_23D79D           
                    STA.w $05BF,y               
CODE_23D79D:        STA.w $052B                 
                    PLP                         
                    LDA.b $0C                   
                    SBC.b #$00                  
                    CPY.b #$00                  
                    BMI   CODE_23D7AC           
                    STA.w $1FD7,y               
CODE_23D7AC:        STA.w $052A                 
                    LDA.b $0F                   
                    CPY.b #$00                  
                    BMI   CODE_23D7B8           
                    STA.w $05C9,y               
CODE_23D7B8:        STA.w $0529                 
                    LDA.b $0E                   
                    STA.w $0528                 
                    LDA.b #$12                  
                    STA.w $0564                 
                    LDY.b #$01                  
                    RTS                         

CODE_23D7C8:        JSR.w CODE_23D6D2           
                    BEQ   CODE_23D7D1           
                    LDA.b #$0C                  
                    STA.b $0B                   
CODE_23D7D1:        RTS                         

CODE_23D7D2:        INC.w $0422                 
                    LDA.l $7E3966               
                    INC   A                     
                    STA.l $7E3966               
                    LDA.b $0D                   
                    STA.b $00                   
                    LDA.b $0F                   
                    ORA.b #$04                  
                    STA.b $01                   
                    JSL.l CODE_278AE8           
                    RTS                         

CODE_23D7ED:        LDA.b $0D                   
                    PHA                         
                    SEC                         
                    SBC.b #$10                  
                    STA.b $0D                   
                    STX.b $04                   
                    JSL.l CODE_209FE0           
                    LDX.b $04                   
                    CMP.b #$40                  
                    BNE   CODE_23D80C           
                    LDA.b #$02                  
                    JSR.w CODE_23DE37           
                    PLA                         
                    STA.b $0D                   
                    JMP.w CODE_23D7D2           

CODE_23D80C:        PLA                         
                    STA.b $0D                   
                    RTS                         

CODE_23D810:        LDA.w $0517                 
                    CMP.b #$09                  
                    BNE   CODE_23D83A           
                    LDY.b #$00                  
                    LDA.b $BD                   
                    BNE   CODE_23D81F           
                    LDY.b #$02                  
CODE_23D81F:        LDA.w $EC28,y               
                    STA.b $09                   
                    LDA.w $EC29,y               
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    LDX.b #$04                  
                    STA.w $0603,x               
                    JSR.w CODE_23D567           
                    LDA.b #$01                  
                    STA.w $057D                 
CODE_23D83A:        RTS                         

CODE_23D83B:        LDX.b #$04                  
                    STA.w $0603,x               
                    LDA.w $057C                 
                    BNE   CODE_23D895           
                    JSR.w CODE_23D567           
                    LDA.w $057C                 
                    BEQ   CODE_23D855           
                    LDA.b #$01                  
                    STA.w $057D                 
                    STA.w $057E                 
CODE_23D855:        LDA.w $0560                 
                    CMP.b #$0A                  
                    BNE   CODE_23D895           
                    LDX.b #$04                  
                    LDA.w $0518,x               
                    BNE   CODE_23D895           
                    LDA.b $0C                   
                    STA.b $56,x                 
                    LDA.b $0D                   
                    SEC                         
                    SBC.b #$10                  
                    BCS   CODE_23D870                   
                    DEC.b $56,x                 
CODE_23D870:        AND.b #$E0                  
                    ORA.b #$10                  
                    STA.b $71,x                 
                    LDA.b $0E                   
                    STA.b $44,x                 
                    LDA.b $0F                   
                    AND.b #$E0                  
                    STA.b $5F,x                 
                    SEC                         
                    SBC.w $0210                 
                    TAY                         
                    LDA.b $44,x                 
                    SBC.b $12                   
                    BNE   CODE_23D895           
                    CPY.b #$E0                  
                    BCS   CODE_23D895                   
                    LDA.w $0607                 
                    STA.w $0691,x               
CODE_23D895:        RTL                         

CODE_23D896:        LDY.b #$16                  
                    LDA.w $056F                 
                    BNE   CODE_23D8A3           
                    LDA.b $BB                   
                    BEQ   CODE_23D8A3           
                    LDY.b #$06                  
CODE_23D8A3:        LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BPL   CODE_23D8B0           
                    TYA                         
                    CLC                         
                    ADC.b #$08                  
                    TAY                         
CODE_23D8B0:        LDX.b #$03                  
CODE_23D8B2:        JSR.w CODE_23DADA           
                    JSR.w CODE_23D4C9           
                    DEY                         
                    DEY                         
                    DEX                         
                    BPL   CODE_23D8B2           
                    LDX.b #$00                  
                    LDY.b #$00                  
                    LDA.w $060D,x               
                    CMP.b #$04                  
                    BEQ   CODE_23D915           
                    CMP.b #$08                  
                    BEQ   CODE_23D915           
                    LDY.b $A6                   
                    BNE   CODE_23D8D9           
                    LDY.w $027F                 
                    BNE   CODE_23D8D9           
                    CMP.b #$00                  
                    BEQ   CODE_23D90C           
CODE_23D8D9:        STZ.w $027F                 
                    INX                         
                    LDA.w $060D,x               
                    CMP.b #$07                  
                    BEQ   CODE_23D8E8           
                    CMP.b #$04                  
                    BNE   CODE_23D934           
CODE_23D8E8:        LDX.b $BB                   
                    BEQ   CODE_23D8F4           
                    LDX.b #$01                  
                    LDA.w $056F                 
                    BEQ   CODE_23D8F4           
                    DEX                         
CODE_23D8F4:        LDA.b $70                   
                    CLC                         
                    ADC.w $EBA6,x               
                    JSL.l CODE_27A859           
                    AND.b #$0F                  
                    CLC                         
                    ADC.b $70                   
                    BCC   CODE_23D907           
                    INC.b $55                   
CODE_23D907:        STA.b $70                   
                    JMP.w CODE_23D926           

CODE_23D90C:        LDA.b $70                   
                    AND.b #$0F                  
                    CMP.b #$0A                  
                    BMI   CODE_23D934           
                    INY                         
CODE_23D915:        LDA.b $70                   
                    AND.b #$F0                  
                    CLC                         
                    ADC.w $EC2E,y               
                    STA.b $70                   
                    LDA.b $55                   
                    ADC.w $EC2C,y               
                    STA.b $55                   
CODE_23D926:        LDA.w $EC30,x               
                    LDY.b $BB                   
                    BEQ   CODE_23D930           
                    CLC                         
                    ADC.b #$10                  
CODE_23D930:        TAY                         
                    JSR.w CODE_23DADA           
CODE_23D934:        LDY.b #$02                  
                    JSR.w CODE_23D4B4           
                    BCC   CODE_23D979           
                    LDA.w $0585                 
                    BNE   CODE_23D979           
                    LDX.b #$00                  
                    LDY.b #$01                  
                    LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BPL   CODE_23D94F           
                    INX                         
                    LDY.b #$FF                  
CODE_23D94F:        LDA.w $EBAC,x               
                    CLC                         
                    ADC.b $5E                   
                    AND.b #$0F                  
                    BEQ   CODE_23D979           
                    TYA                         
                    BPL   CODE_23D95E           
                    DEC.b $43                   
CODE_23D95E:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    BCC   CODE_23D967           
                    INC.b $43                   
CODE_23D967:        INY                         
                    LDA.b $8B                   
                    BPL   CODE_23D96E           
                    DEY                         
                    DEY                         
CODE_23D96E:        TYA                         
                    BNE   CODE_23D979           
                    STA.b $8B                   
                    STA.w $0545                 
                    INC.w $0574                 
CODE_23D979:        LDX.b #$00                  
                    LDY.w $060D                 
                    LDA.w $EBAE,y               
                    BEQ   CODE_23D984           
                    INX                         
CODE_23D984:        LDA.b $5E                   
                    CLC                         
                    ADC.w $EB83                 
                    AND.b #$0F                  
                    STA.b $00                   
                    LDA.w $060D,x               
                    TAY                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.b $53                   
                    STA.b $53                   
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ORA.b $00                   
                    STA.b $00                   
                    LDA.w $AD5B,y               
                    STA.b $0F                   
                    LDY.b $00                   
                    TXA                         
                    BNE   CODE_23D9B1           
                    JMP.w CODE_23DA2C           

CODE_23D9B1:        LDA.w $060E                 
                    CMP.b #$00                  
                    BNE   CODE_23D9D8           
                    LDA.b $A6                   
                    BNE   CODE_23D9D7           
                    LDX.b #$04                  
                    LDY.b #$20                  
                    LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BPL   CODE_23D9CA           
                    INY                         
                    INY                         
CODE_23D9CA:        JSR.w CODE_23DADA           
                    CMP.b #$03                  
                    BEQ   CODE_23D9D7           
                    LDA.b #$00                  
                    STA.b $9D                   
                    INC.b $A6                   
CODE_23D9D7:        RTS                         

CODE_23D9D8:        LDX.b $BB                   
                    BEQ   CODE_23D9E4           
                    LDX.b #$01                  
                    LDA.w $056F                 
                    BEQ   CODE_23D9E4           
                    DEX                         
CODE_23D9E4:        LDA.b $70                   
                    CLC                         
                    ADC.w $EBA6,x               
                    AND.b #$0F                  
                    STA.b $00                   
                    LDA.b ($52),y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $01                   
                    SEC                         
                    SBC.b $00                   
                    BMI   CODE_23DA2B           
                    INC.w $056D                 
                    PHA                         
                    LDA.b $9D                   
                    BPL   CODE_23DA15           
                    LDA.w $1A0F                 
                    JSL.l CODE_27A859           
                    BPL   CODE_23DA0E           
                    LDA.b #$00                  
CODE_23DA0E:        STA.b $9D                   
                    LDA.b #$01                  
                    STA.w $1200                 
CODE_23DA15:        PLA                         
                    LDY.w $060E                 
                    CPY.b #$03                  
                    BNE   CODE_23DA22           
                    LDY.w $0585                 
                    BNE   CODE_23DA2B           
CODE_23DA22:        CLC                         
                    ADC.b $70                   
                    STA.b $70                   
                    BCC   CODE_23DA2B           
                    INC.b $55                   
CODE_23DA2B:        RTS                         

CODE_23DA2C:        LDX.b $0F                   
                    LDA.b $A6                   
                    BEQ   CODE_23DA41           
                    LDA.b $9D                   
                    CMP.b #$E4                  
                    BMI   CODE_23D9D7           
                    LDA.b $70                   
                    AND.b #$0F                  
                    SEC                         
                    SBC.b ($52),y               
                    BMI   CODE_23D9D7           
CODE_23DA41:        LDA.b #$00                  
                    STA.b $A6                   
                    STA.b $9D                   
                    STA.w $05F4                 
                    LDA.b ($52),y               
                    AND.b #$0F                  
                    STA.b $00                   
                    LDA.b $70                   
                    AND.b #$F0                  
                    CLC                         
                    ADC.b $00                   
                    STA.b $70                   
                    BCC   CODE_23DA5D           
                    INC.b $55                   
CODE_23DA5D:        TXA                         
                    BEQ   CODE_23DA64           
                    EOR.b $8B                   
                    AND.b #$80                  
CODE_23DA64:        STA.w $0546                 
                    LDA.w $0575                 
                    BEQ   CODE_23DA73           
                    LDA.b #$00                  
                    STA.w $0545                 
                    BEQ   CODE_23DAD2           
CODE_23DA73:        TXA                         
                    LDY.w $0545                 
                    BEQ   CODE_23DA83           
                    BPL   CODE_23DA7F           
                    JSL.l CODE_27A859           
CODE_23DA7F:        CMP.b #$00                  
                    BMI   CODE_23DAC2           
CODE_23DA83:        LDA.w $0545                 
                    BNE   CODE_23DAA4           
                    TXA                         
                    BEQ   CODE_23DAD2           
                    LDY.b $BB                   
                    LDA.w $AF64,y               
                    AND.b #$02                  
                    BNE   CODE_23DAD2           
                    LDA.w $0577                 
                    BNE   CODE_23DAD2           
                    LDA.b $17                   
                    AND.b #$07                  
                    CMP.b #$04                  
                    BNE   CODE_23DAD2           
                    JSR.w CODE_23CD66           
CODE_23DAA4:        TXA                         
                    CLC                         
                    ADC.w $0545                 
                    STA.w $0545                 
                    BPL   CODE_23DAB2           
                    JSL.l CODE_27A859           
CODE_23DAB2:        CMP.b #$40                  
                    BMI   CODE_23DAC2           
                    LDY.b #$40                  
                    LDA.w $0545                 
                    BPL   CODE_23DABF           
                    LDY.b #$C0                  
CODE_23DABF:        STY.w $0545                 
CODE_23DAC2:        DEC.w $0545                 
                    BPL   CODE_23DACD           
                    INC.w $0545                 
                    INC.w $0545                 
CODE_23DACD:        LDA.w $0545                 
                    STA.b $8B                   
CODE_23DAD2:        LDA.b $8B                   
                    BEQ   CODE_23DAD9           
                    STX.w $0569                 
CODE_23DAD9:        RTS                         

CODE_23DADA:        LDA.w $EB82,y               
                    STA.b $09                   
                    LDA.w $EB83,y               
                    STA.b $0A                   
                    JSL.l CODE_23D2B6           
                    STA.w $0603,x               
                    AND.b #$C0                  
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    STA.w $0608,x               
                    LDA.b $B4                   
                    STA.w $060D,x               
                    RTS                         

CODE_23DAF9:        LDA.w $057A                 
                    ORA.w $0517                 
                    ORA.w $054F                 
                    BNE   CODE_23DB4E           
                    LDY.w $0560                 
                    LDA.w $EC32,y               
                    STA.b $0F                   
                    LDA.b $A6                   
                    BNE   CODE_23DB51           
                    LDA.w $0605                 
                    LDY.w $0425                 
                    BEQ   CODE_23DB20           
                    LDY.b #$02                  
                    CMP.b #$9E                  
                    BEQ   CODE_23DB2E           
                    LDY.b #$00                  
CODE_23DB20:        CMP.b #$B5                  
                    BEQ   CODE_23DB2E           
                    BIT.b $0F                   
                    BVC   $29                   
                    LDY.b #$03                  
                    CMP.b #$BF                  
                    BNE   CODE_23DB51           
CODE_23DB2E:        LDX.b #$00                  
                    LDA.b $5E                   
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BMI   CODE_23DB39           
                    INX                         
CODE_23DB39:        LDA.b $17                   
                    AND.w $EC43,x               
                    BEQ   CODE_23DB51           
                    TYA                         
                    BNE   CODE_23DB4B           
                    LDY.b #$01                  
                    LDA.w $1EB8                 
                    BEQ   CODE_23DB4B           
                    DEY                         
CODE_23DB4B:        JSR.w CODE_23DDCD           
CODE_23DB4E:        JMP.w CODE_23DBF3           

CODE_23DB51:        LDX.b #$02                  
                    LDA.w $0603                 
                    LDY.b $A6                   
                    BEQ   CODE_23DB6B           
                    LDY.w $056D                 
                    BEQ   CODE_23DB4E           
                    LDY.w $056F                 
                    BEQ   CODE_23DB67           
                    JMP.w CODE_23DBF3           

CODE_23DB67:        INX                         
                    LDA.w $0604                 
CODE_23DB6B:        STA.b $00                   
                    STX.b $02                   
                    LDA.b #$B0                  
                    SEC                         
                    SBC.b $00                   
                    CMP.b #$04                  
                    LDY.w $1EB8                 
                    BEQ   CODE_23DB7D           
                    AND.b #$01                  
CODE_23DB7D:        TAY                         
                    BCC   CODE_23DBA1           
                    LDY.b $0F                   
                    BPL   CODE_23DB8F           
                    LDA.b #$BE                  
                    SEC                         
                    SBC.b $00                   
                    CMP.b #$02                  
                    LDY.b #$06                  
                    BCC   CODE_23DBA1           
CODE_23DB8F:        LDA.b #$B4                  
                    LDY.w $0425                 
                    BEQ   CODE_23DB98           
                    LDA.b #$92                  
CODE_23DB98:        SEC                         
                    SBC.b $00                   
                    CMP.b #$02                  
                    BCS   CODE_23DBF3                   
                    LDY.b #$04                  
CODE_23DBA1:        STY.b $00                   
                    AND.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $01                   
                    LDA.b $17                   
                    AND.w $EC43,x               
                    BEQ   CODE_23DBF3           
                    LDA.w $0571                 
                    BNE   CODE_23DBF3           
                    LDY.b #$00                  
                    LDA.b $A6                   
                    ORA.w $0563                 
                    BNE   CODE_23DBC6           
                    INY                         
                    LDA.b $BB                   
                    BNE   CODE_23DBC6           
                    INY                         
CODE_23DBC6:        LDA.b $5E                   
                    AND.b #$0F                  
                    PHA                         
                    CLC                         
                    ADC.w $EC40,y               
                    AND.b #$10                  
                    BNE   CODE_23DBD7           
                    PLA                         
                    ORA.b #$F0                  
                    PHA                         
CODE_23DBD7:        PLA                         
                    CLC                         
                    ADC.b $01                   
                    SEC                         
                    SBC.b #$03                  
                    CMP.b #$0A                  
                    BCS   CODE_23DBF3                   
                    LDA.b $00                   
                    LSR   A                     
                    TAY                         
                    JSR.w CODE_23DDCD           
                    JSL.l CODE_23DDBB           
                    JSR.w CODE_23C08A           
                    PLA                         
                    PLA                         
                    RTS                         

CODE_23DBF3:        LDY.w $0560                 
                    LDA.b $A6                   
                    BNE   CODE_23DC1B           
                    LDA.w $0567                 
                    BNE   CODE_23DC1B           
                    LDX.b #$01                  
CODE_23DC01:        LDA.w $AF48,y               
                    BEQ   CODE_23DC1B           
                    SEC                         
                    SBC.w $0603,x               
                    CMP.b #$02                  
                    BCS   CODE_23DC18                   
                    TAX                         
                    LDA.w $EC47,x               
                    STA.w $0569                 
                    JMP.w CODE_23DC1B           

CODE_23DC18:        DEX                         
                    BPL   CODE_23DC01           
CODE_23DC1B:        LDX.b #$02                  
CODE_23DC1D:        LDA.w $AF3A,y               
                    CMP.b #$FF                  
                    BEQ   CODE_23DC40           
                    SEC                         
                    SBC.w $0602,x               
                    CMP.b #$02                  
                    BCC   CODE_23DC31           
                    DEX                         
                    BPL   CODE_23DC1D           
                    BMI   CODE_23DC40           
CODE_23DC31:        LDA.w $0577                 
                    BEQ   CODE_23DC3B           
                    LDA.w $056D                 
                    BEQ   CODE_23DC40           
CODE_23DC3B:        JSL.l CODE_27A4C6           
                    RTS                         

CODE_23DC40:        LDX.b #$03                  
CODE_23DC42:        LDA.w $0603,x               
                    CMP.w $AF56,y               
                    BEQ   CODE_23DC4E           
                    CMP.b #$66                  
                    BNE   CODE_23DC5D           
CODE_23DC4E:        LDA.w $0577                 
                    BEQ   CODE_23DC58           
                    LDA.w $056D                 
                    BEQ   CODE_23DC60           
CODE_23DC58:        JSL.l CODE_27A4C6           
                    RTS                         

CODE_23DC5D:        DEX                         
                    BPL   CODE_23DC42           
CODE_23DC60:        LDA.w $070A                 
                    CMP.b #$05                  
                    BNE   CODE_23DC98           
                    LDY.b #$00                  
                    LDA.w $0245                 
                    CMP.b #$01                  
                    BEQ   CODE_23DC75           
                    INY                         
                    CMP.b #$00                  
                    BNE   CODE_23DC98           
CODE_23DC75:        LDX.b #$02                  
CODE_23DC77:        LDA.w $0602,x               
                    PHA                         
                    SEC                         
                    SBC.w $EC4B,y               
                    CMP.b #$01                  
                    PLA                         
                    BCC   CODE_23DC8F           
                    CMP.w $EC4D,y               
                    BEQ   CODE_23DC8F           
                    DEX                         
                    BPL   CODE_23DC77           
                    JMP.w CODE_23DC98           

CODE_23DC8F:        LDA.w $0577                 
                    BNE   CODE_23DC98           
                    JSL.l CODE_27A4C6           
CODE_23DC98:        LDA.b #$00                  
                    STA.w $0589                 
                    LDA.w $0560                 
                    CMP.b #$0B                  
                    BNE   CODE_23DCDE           
                    LDA.b $A6                   
                    BNE   CODE_23DCDE           
                    LDX.b #$01                  
CODE_23DCAA:        LDA.w $0603,x               
                    TAY                         
                    SEC                         
                    SBC.b #$22                  
                    CMP.b #$03                  
                    BCC   CODE_23DCBD           
                    TYA                         
                    SEC                         
                    SBC.b #$4A                  
                    CMP.b #$03                  
                    BCS   CODE_23DCC3                   
CODE_23DCBD:        INC.w $0589                 
                    JMP.w CODE_23DCDE           

CODE_23DCC3:        TYA                         
                    SEC                         
                    SBC.b #$36                  
                    CMP.b #$05                  
                    BCC   CODE_23DCD3           
                    CPY.b #$55                  
                    BEQ   CODE_23DCD3           
                    CPY.b #$56                  
                    BNE   CODE_23DCDB           
CODE_23DCD3:        LDA.b #$02                  
                    STA.w $0589                 
                    JMP.w CODE_23DCDE           

CODE_23DCDB:        DEX                         
                    BPL   CODE_23DCAA           
CODE_23DCDE:        LDA.w $0560                 
                    CMP.b #$00                  
                    BNE   CODE_23DD23           
                    LDY.b #$01                  
CODE_23DCE7:        LDA.w $0603,y               
                    SEC                         
                    SBC.b #$25                  
                    CMP.b #$03                  
                    BCC   CODE_23DCFB           
                    DEY                         
                    BPL   CODE_23DCE7           
CODE_23DCF4:        LDA.b #$00                  
                    STA.w $0570                 
                    BEQ   CODE_23DD23           
CODE_23DCFB:        LDA.b $17                   
                    AND.b #$04                  
                    BEQ   CODE_23DCF4           
                    INC.w $0570                 
                    LDA.w $0570                 
                    CMP.b #$F0                  
                    BNE   CODE_23DD23           
                    LDA.b #$F0                  
                    STA.w $0588                 
                    LDA.b #$00                  
                    STA.b $9D                   
                    LDA.b $70                   
                    CLC                         
                    ADC.b #$06                  
                    STA.b $70                   
                    INC.b $A6                   
                    LDA.b $18                   
                    AND.b #$7F                  
                    STA.b $18                   
CODE_23DD23:        LDA.w $0560                 
                    CMP.b #$02                  
                    BEQ   CODE_23DD2E           
                    CMP.b #$0D                  
                    BNE   CODE_23DD8F           
CODE_23DD2E:        LDA.b $9D                   
                    BMI   CODE_23DD8F           
                    LDX.b #$03                  
CODE_23DD34:        LDA.w $0603,x               
                    CMP.b #$49                  
                    BEQ   CODE_23DD4A           
                    CMP.b #$4A                  
                    BEQ   CODE_23DD4A           
                    DEX                         
                    BPL   CODE_23DD34           
                    LDA.b #$00                  
                    STA.w $058A                 
                    JMP.w CODE_23DD8F           

CODE_23DD4A:        LDA.b #$00                  
                    STA.w $056F                 
                    STA.w $0545                 
                    LDA.w $058A                 
                    BNE   CODE_23DD59           
                    LDA.b $70                   
CODE_23DD59:        AND.b #$F0                  
                    STA.w $058A                 
                    LDA.b $70                   
                    SEC                         
                    SBC.w $058A                 
                    LDY.b #$E0                  
                    TAX                         
                    AND.b #$F0                  
                    BNE   CODE_23DD74           
                    TXA                         
                    AND.b #$0F                  
                    CMP.b #$03                  
                    BCS   CODE_23DD74                   
                    LDY.b #$D0                  
CODE_23DD74:        LDA.b $18                   
                    BMI   CODE_23DD7F           
                    INC.w $058A                 
                    LDY.b #$06                  
                    BNE   CODE_23DD84           
CODE_23DD7F:        LDA.b #$01                  
                    STA.w $1201                 
CODE_23DD84:        STY.b $9D                   
                    LDA.b $8B                   
                    ASL   A                     
                    ROR.b $8B                   
                    BPL   CODE_23DD8F           
                    INC.b $8B                   
CODE_23DD8F:        LDY.w $0560                 
                    CPY.b #$06                  
                    BNE   CODE_23DDBA           
                    LDA.b $18                   
                    BIT.b #$40                  
                    BNE   CODE_23DDAB           
                    LDA.w $F8                 
                    LDY.w $0726                 
                    BEQ   CODE_23DDA7           
                    LDA.w $F9                 
CODE_23DDA7:        AND.b #$40                  
                    BEQ   CODE_23DDBA           
CODE_23DDAB:        JSL.l CODE_20E803           
                    TXA                         
                    BEQ   CODE_23DDBA           
                    DEX                         
                    LDA.w $0529                 
                    JSL.l CODE_27A8D8           
CODE_23DDBA:        RTS                         

CODE_23DDBB:        LDY.b $BB                   
                    BEQ   CODE_23DDC1           
                    LDY.b #$02                  
CODE_23DDC1:        LDA.w $0577                 
                    BEQ   CODE_23DDC7           
                    INY                         
CODE_23DDC7:        LDA.w $E980,y               
                    STA.b $BC                   
                    RTL                         

CODE_23DDCD:        STX.w $0571                 
                    LDA.b #$04                  
                    STA.w $1200                 
                    LDA.w $1503                 
                    BNE   CODE_23DDDF           
                    LDA.b #$80                  
                    STA.w $1202                 
CODE_23DDDF:        LDA.b #$04                  
                    CPY.b #$03                  
                    BEQ   CODE_23DDFF           
                    LDA.b #$05                  
                    CPY.b #$02                  
                    BEQ   CODE_23DDFF           
                    LDA.b #$02                  
                    CPY.b #$00                  
                    BEQ   CODE_23DDFF           
                    LDA.b #$01                  
                    LDY.w $0379                 
                    BNE   CODE_23DDFD           
                    LDY.w $1EB8                 
                    BEQ   CODE_23DDFF           
CODE_23DDFD:        LDA.b #$03                  
CODE_23DDFF:        ASL   A                     
                    ASL   A                     
                    ORA.w $0571                 
                    STA.w $0571                 
                    LDA.b #$3C                  
                    STA.w $0510                 
                    TXA                         
                    ASL   A                     
                    TAX                         
                    LDA.b $5E                   
                    CLC                         
                    ADC.w $EC4F,x               
                    CPX.b #$04                  
                    BPL   CODE_23DE1B           
                    AND.b #$F0                  
CODE_23DE1B:        STA.b $52                   
                    LDA.b $70                   
                    CPX.b #$06                  
                    BNE   CODE_23DE27           
                    LDY.b $BB                   
                    BEQ   CODE_23DE2B           
CODE_23DE27:        CLC                         
                    ADC.w $EC50,x               
CODE_23DE2B:        AND.b #$F0                  
                    CPX.b #$04                  
                    BMI   CODE_23DE34           
                    SEC                         
                    SBC.b #$01                  
CODE_23DE34:        STA.b $53                   
                    RTS                         

CODE_23DE37:        STA.w $0564                 
                    LDA.b $0C                   
                    STA.w $052A                 
                    LDA.b $0D                   
                    AND.b #$F0                  
                    STA.w $052B                 
                    LDA.b $0E                   
                    STA.w $0528                 
                    LDA.b $0F                   
                    AND.b #$F0                  
                    STA.w $0529                 
                    RTS                         

CODE_23DE53:        LDX.b #$00                  
                    LDY.b #$40                  
                    LDA.b $8B                   
                    BPL   CODE_23DE62           
                    LDY.b #$C0                  
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_23DE62:        STA.b $0F                   
                    CMP.b #$40                  
                    BMI   CODE_23DE6A           
                    STY.b $8B                   
CODE_23DE6A:        LDA.b $8B,x                 
                    CPX.b #$00                  
                    BNE   CODE_23DE74           
                    CLC                         
                    ADC.w $1020                 
CODE_23DE74:        PHA                         
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
                    BCC   CODE_23DE89           
                    DEY                         
                    ORA.b #$F0                  
CODE_23DE89:        STA.b $0A                   
                    STY.b $0C                   
                    LDA.w $074E,x               
                    CLC                         
                    ADC.b $0B                   
                    STA.w $074E,x               
                    LDA.b $5E,x                 
                    ADC.b $0A                   
                    STA.b $5E,x                 
                    LDA.b $43,x                 
                    ADC.b $0C                   
                    STA.b $43,x                 
                    RTL                         

CODE_23DEA3:        LDA.b $9D                   
                    BMI   CODE_23DEAF           
                    CMP.b #$40                  
                    BMI   CODE_23DEAF           
                    LDA.b #$40                  
                    STA.b $9D                   
CODE_23DEAF:        LDX.b #$12                  
                    JSL.l CODE_23DE6A           
                    RTL                         

CODE_23DEB6:        REP   #$20                  
                    STZ.b $0A                   
                    AND.w #$0001                
                    BEQ   CODE_23DEC4           
                    LDA.w #$0400                
                    TSB.b $0A                   
CODE_23DEC4:        LDA.b $55                   
                    AND.w #$0001                
                    BEQ   CODE_23DED0           
                    LDA.w #$0800                
                    TSB.b $0A                   
CODE_23DED0:        LDA.b $5E                   
                    AND.w #$00F8                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TSB.b $0A                   
                    LDA.b $70                   
                    AND.w #$0007                
                    BEQ   CODE_23DEEC           
                    LDA.b $70                   
                    AND.w #$00F8                
                    CLC                         
                    ADC.w #$0008                
                    BRA   CODE_23DEF1           

CODE_23DEEC:        LDA.b $70                   
                    AND.w #$00F8                
CODE_23DEF1:        ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $0A                   
                    STA.b $0A                   
                    PHB                         
                    PHK                         
                    PLB                         
                    LDX.w $1600                 
                    LDA.b $0A                   
                    XBA                         
                    STA.w $1602,x               
                    INX                         
                    INX                         
CODE_23DF06:        LDA.w DATA_23DF47-2,x               
                    STA.w $1602,x               
                    INX                         
                    INX                         
                    CMP.w #$FFFF                
                    BNE   CODE_23DF06           
                    LDA.b $0A                   
                    INC   A                     
                    XBA                         
                    STA.w $15E8,x               
                    LDA.b $0A                   
                    PHA                         
                    AND.w #$03FF                
                    CMP.w #$03C0                
                    BCC   CODE_23DF2C           
                    PLA                         
                    CLC                         
                    ADC.w #$0400                
                    BRA   CODE_23DF2D           

CODE_23DF2C:        PLA                         
CODE_23DF2D:        CLC                         
                    ADC.w #$0040                
                    AND.w #$0FFF                
                    XBA                         
                    STA.w $15F0,x               
                    XBA                         
                    INC   A                     
                    XBA                         
                    STA.w $15F8,x               
                    DEX                         
                    DEX                         
                    STX.w $1600                 
                    SEP   #$20                  
                    PLB                         
                    RTS                         

DATA_23DF47:        db $80,$03,$5A,$16,$5B,$16,$00,$00
                    db $80,$03,$5A,$56,$5B,$56,$00,$00
                    db $80,$03,$5B,$16,$5A,$96,$00,$00
                    db $80,$03,$5B,$56,$5A,$D6,$FF,$FF

CODE_23DF67:        PHB
                    PHK
                    PLB
                    LDA.l $700006               
                    BNE   CODE_23DF8A           
                    LDA.b $F4                   
                    AND.b #$C0                  
                    TSB.b $F2                   
                    LDA.b $F8                   
                    AND.b #$C0                  
                    TSB.b $F6                   
                    LDA.b $F5                   
                    AND.b #$C0                  
                    TSB.b $F3                   
                    LDA.b $F9                   
                    AND.b #$C0                  
                    TSB.b $F7                   
                    BRA   CODE_23DFDE           

CODE_23DF8A:        LDA.b $F2                   
                    AND.b #$80                  
                    LSR   A                     
                    TSB.b $F2                   
                    LDA.b $F4                   
                    AND.b #$C0                  
                    STA.b $00                   
                    LDA.b $F2                   
                    AND.b #$7F                  
                    ORA.b $00                   
                    STA.b $F2                   
                    LDA.b $F6                   
                    AND.b #$80                  
                    LSR   A                     
                    TSB.b $F6                   
                    LDA.b $F8                   
                    AND.b #$C0                  
                    STA.b $00                   
                    LDA.b $F6                   
                    AND.b #$7F                  
                    ORA.b $00                   
                    STA.b $F6                   
                    LDA.b $F3                   
                    AND.b #$80                  
                    LSR   A                     
                    TSB.b $F3                   
                    LDA.b $F5                   
                    AND.b #$C0                  
                    STA.b $00                   
                    LDA.b $F3                   
                    AND.b #$7F                  
                    ORA.b $00                   
                    STA.b $F3                   
                    LDA.b $F7                   
                    AND.b #$80                  
                    LSR   A                     
                    TSB.b $F7                   
                    LDA.b $F9                   
                    AND.b #$C0                  
                    STA.b $00                   
                    LDA.b $F7                   
                    AND.b #$7F                  
                    ORA.b $00                   
                    STA.b $F7                   
CODE_23DFDE:        PHX                         
                    LDX.w $0726                 
                    LDA.b $F2,x                 
                    STA.b $17                   
                    LDA.b $F6,x                 
                    STA.b $18                   
                    PLX                         
                    PLB                         
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF

CODE_23E000:        JSR.w CODE_23E071
                    LDX.b #$00                  
                    LDY.b #$00                  
                    JSR.w CODE_23E00E           
                    LDX.b #$23                  
                    LDY.b #$01                  
CODE_23E00E:        STY.b $00                   
                    STX.b $01                   
                    LDA.w $1D9C,x               
                    BEQ   CODE_23E021           
                    LDA.w $1D9D,x               
                    BEQ   CODE_23E021           
                    LDA.w $1D9E,x               
                    BNE   CODE_23E022           
CODE_23E021:        RTS                         

CODE_23E022:        LDY.w $1D9C,x               
                    LDA.w $EC71,y               
                    LDY.w $1D9D,x               
                    ORA.w $EC71,y               
                    LDY.w $1D9E,x               
                    ORA.w $EC71,y               
                    TAY                         
                    LDX.b $00                   
                    ORA.w $EC61,y               
                    STA.w $1203                 
                    LDA.w $EC69,y               
                    STA.w $19A1,x               
                    LDA.w $1822,x               
                    STA.w $19A5,x               
                    LDA.w $1811,x               
                    SEC                         
                    SBC.b #$08                  
                    STA.w $19A3,x               
                    LDA.w $EC59,y               
                    PHA                         
                    STA.w $19A7,x               
                    CLC                         
                    ADC.w $0736,x               
                    STA.w $0736,x               
                    PLA                         
                    BEQ   CODE_23E070           
                    LDX.b $01                   
                    LDA.b #$00                  
                    STA.w $1D9C,x               
                    STA.w $1D9D,x               
                    STA.w $1D9E,x               
CODE_23E070:        RTS                         

CODE_23E071:        LDX.b #$01                  
CODE_23E073:        STX.b $00                   
                    JSR.w CODE_23E07C           
                    DEX                         
                    BPL   CODE_23E073           
                    RTS                         

CODE_23E07C:        LDA.w $19A1,x               
                    BEQ   CODE_23E08A           
                    CMP.b #$20                  
                    BCC   CODE_23E08B           
                    LDA.b #$00                  
                    STA.w $19A1,x               
CODE_23E08A:        RTS                         

CODE_23E08B:        LDA.w $76                 
                    BNE   CODE_23E098           
                    LDA.b $15                   
                    LSR   A                     
                    BCC   CODE_23E098           
                    INC.w $19A1,x               
CODE_23E098:        LDY.w $EC7A,x               
                    LDA.w $19A3,x               
                    SEC                         
                    SBC.w $19A1,x               
                    STA.w $0801,y               
                    LDA.w $19A5,x               
                    STA.w $0800,y               
                    LDA.b #$22                  
                    STA.w $0803,y               
                    LDA.w $19A7,x               
                    TAX                         
                    LDA.w $EC74,x               
                    STA.w $0802,y               
                    LDA.w $19A5,x               
                    SEC                         
                    SBC.b #$08                  
                    CMP.b #$F1                  
                    BCC   CODE_23E0E7           
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,y               
                    STA.w $0805,y               
                    LDA.w $0802,y               
                    STA.w $0806,y               
                    LDA.w $0803,y               
                    STA.w $0807,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$03                  
                    STA.w $0A21,y               
                    BRA   CODE_23E0EB           

CODE_23E0E7:        TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_23E0EB:        LDA.b #$02                  
                    STA.w $0A20,y               
                    LDX.b $00                   
                    RTS                         

CODE_23E0F3:        STZ.b $00                   
                    LDA.b #$02                  
CODE_23E0F7:        STA.b $01                   
                    LDX.b #$02                  
CODE_23E0FB:        LDY.b $01                   
                    STX.b $03                   
                    LDA.w $1D9C,y               
                    BEQ   CODE_23E148           
                    TAY                         
                    LDA.w $EC90,y               
                    LDY.b $00                   
                    STA.w $09E2,y               
                    LDA.b #$D0                  
                    STA.w $09E1,y               
                    LDX.b #$00                  
                    CPY.b #$04                  
                    BEQ   CODE_23E11D           
                    INX                         
                    CPY.b #$0C                  
                    BNE   CODE_23E129           
CODE_23E11D:        LDA.w $1989,x               
                    BEQ   CODE_23E129           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$0E                  
                    BRA   CODE_23E12B           

CODE_23E129:        LDA.b #$24                  
CODE_23E12B:        STA.w $09E3,y               
                    LDX.b $03                   
                    LDA.b #$10                  
                    CPY.b #$0C                  
                    BCC   CODE_23E138           
                    LDA.b #$C0                  
CODE_23E138:        CLC                         
                    ADC.w $EC8E,x               
                    STA.w $09E0,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A98,y               
CODE_23E148:        LDA.b $00                   
                    CLC                         
                    ADC.b #$04                  
                    STA.b $00                   
                    DEC.b $01                   
                    DEX                         
                    BMI   CODE_23E156           
                    BRA   CODE_23E0FB           

CODE_23E156:        LDA.b #$0C                  
                    STA.b $00                   
                    LDA.b #$25                  
                    LDY.b $01                   
                    BMI   CODE_23E0F7           
                    RTS                         

CODE_23E161:        TXA                         
                    PHA                         
                    REP   #$30                  
                    LDY.w #$0000                
                    LDX.w $1600                 
CODE_23E16B:        LDA.w $EC7C,y               
                    STA.w $1602,x               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPY.w #$0008                
                    BNE   CODE_23E16B           
                    SEP   #$30                  
                    LDY.b $0F                   
                    LDA.w $EC8C,y               
                    CLC                         
                    ADC.w $192E,y               
                    STA.w $15FB,x               
                    DEX                         
                    DEX                         
                    STX.w $1600                 
                    PLA                         
                    TAX                         
                    RTS                         

CODE_23E190:        LDA.w $1930                 
                    BNE   CODE_23E1D3           
                    LDA.b $F6                   
                    ORA.b $F7                   
                    AND.b #$10                  
                    BEQ   CODE_23E1D3           
                    LDA.w $76                 
                    EOR.b #$01                  
                    STA.w $76                 
                    BNE   CODE_23E1BE           
                    LDA.b #$F2                  
                    STA.w $1202                 
                    LDA.b #$43                  
                    STA.w $1200                 
                    LDX.b #$0E                  
CODE_23E1B3:        LDA.w $198B,x               
                    STA.w $18CB,x               
                    DEX                         
                    BPL   CODE_23E1B3           
                    BMI   CODE_23E1D3           
CODE_23E1BE:        LDA.b #$F1                  
                    STA.w $1202                 
                    LDA.b #$43                  
                    STA.w $1200                 
                    LDX.b #$0E                  
CODE_23E1CA:        LDA.w $18CB,x               
                    STA.w $198B,x               
                    DEX                         
                    BPL   CODE_23E1CA           
CODE_23E1D3:        LDA.w $76                 
                    BEQ   CODE_23E1E2           
                    LDX.b #$0E                  
                    LDA.b #$FF                  
CODE_23E1DC:        STA.w $18CB,x               
                    DEX                         
                    BPL   CODE_23E1DC           
CODE_23E1E2:        JSR.w CODE_23E1E6           
                    RTL                         

CODE_23E1E6:        LDA.w $75                 
                    JSL.l CODE_20FB1F           

POINTER_23E1ED:     dw CODE_23E1FD
                    dw CODE_23E2AB

DATA_23E1F1:        db $00,$01,$02,$00,$03,$04,$05,$00
                    db $00,$01,$05,$00

CODE_23E1FD:        REP   #$30
                    LDA.w #$0058
                    STA.b $8D
                    STA.b $8E                 
                    LDY.w #$0200
                    LDA.w #$0000
CODE_23E20C:        STA.w $1800,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_23E20C           
                    SEP   #$30                  
                    LDA.b $15                   
                    ORA.b #$91                  
                    STA.w $192B                 
                    INC.w $0075                 
                    LDX.w $1F26                 
                    LDA   DATA_23E1F1,x             
                    STA.w $199A                 
                    TXA                         
                    JSL.l CODE_20FB1F           

POINTER_23E22E:     dw CODE_23E24B
                    dw CODE_23E24B
                    dw CODE_23E24B
                    dw CODE_23E28E
                    dw CODE_23E24B
                    dw CODE_23E24B
                    dw CODE_23E24B
                    dw CODE_23E246
                    dw CODE_23E24B
                    dw CODE_23E24B
                    dw CODE_23E24B
                    dw CODE_23E24C

CODE_23E246:        LDA.b #$01
                    STA.w $1A6D
CODE_23E24B:        RTS                   

CODE_23E24C:        LDX.b #$0D                  
CODE_23E24E:        TXA                         
                    STA.b $00,x                 
                    DEX                         
                    BPL   CODE_23E24E           
                    LDA.b #$FF                  
                    STA.b $0E                   
                    STA.b $0F                   
                    LDX.b #$04                  
CODE_23E25C:        JSR.w CODE_23E27A           
                    TAY                         
                    LDA.w $EC94,y               
                    STA.w $1824,x               
                    LDA.w $ECA2,y               
                    STA.w $1813,x               
                    LDA.b #$01                  
                    STA.w $1802,x               
                    LDA.b #$0B                  
                    STA.w $18BB,x               
                    DEX                         
                    BPL   CODE_23E25C           
                    RTS                         

CODE_23E27A:        JSL.l CODE_25F805           
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $00,y               
                    BMI   CODE_23E27A           
                    PHA                         
                    LDA.b #$FF                  
                    STA.w $00,y               
                    PLA                         
                    RTS                         

CODE_23E28E:        LDX.b #$04                  
CODE_23E290:        INC.w $1802,x               
                    LDA.b #$0B                  
                    STA.w $18BB,x               
                    LDA.w $ECB5,x               
                    STA.w $1813,x               
                    LDA.w $ECB0,x               
                    STA.w $1824,x               
                    JSR.w CODE_23ED8D           
                    DEX                         
                    BPL   CODE_23E290           
                    RTS                         

CODE_23E2AB:        JSR.w CODE_23E0F3           
                    JSR.w CODE_23E000           
                    LDA.w $1F26                 
                    JSL.l CODE_20FB1F           

POINTER_23E2B8:     dw CODE_23E2D0
                    dw CODE_23E2D0
                    dw CODE_23E2D0
                    dw CODE_23E2FA
                    dw CODE_23E2D0
                    dw CODE_23E2D0
                    dw CODE_23E2D0
                    dw CODE_23E2ED
                    dw CODE_23E2D0
                    dw CODE_23E2D0
                    dw CODE_23E2D0
                    dw CODE_23E2E3

CODE_23E2D0:        JSR.w CODE_23E3FA
                    JSR.w CODE_23ED04              
                    JSR.w CODE_23EE51           
                    JSR.w CODE_23F85D           
                    JSR.w CODE_23F6D9           
                    JSR.w CODE_23F9C3           
                    RTS                         

CODE_23E2E3:        JSR.w CODE_23E3FA           
                    JSR.w CODE_23EE51           
                    JSR.w CODE_23F9C3           
                    RTS                         

CODE_23E2ED:        JSR.w CODE_23E3FA           
                    JSR.w CODE_23E31B           
                    JSR.w CODE_23EE51           
                    JSR.w CODE_23F9C3           
                    RTS                         

CODE_23E2FA:        JSR.w CODE_23E3FA           
                    JSR.w CODE_23EE51           
                    JSR.w CODE_23F85D           
                    JSR.w CODE_23F9C3           
                    RTS                         

                    LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_23E31A           
                    INC.w $1941                 
                    BNE   CODE_23E31A           
                    LDA.b #$01                  
                    STA.w $078C                 
                    JMP.w CODE_23E492           

CODE_23E31A:        RTS                         

CODE_23E31B:        LDA.w $18CB                 
                    ORA.w $18CC                 
                    ORA.w $1930                 
                    ORA.w $0076                 
                    BNE   CODE_23E348           
                    DEC.w $1A6D                 
                    BNE   CODE_23E338           
                    LDA.b #$20                  
                    STA.w $1A6D                 
                    LDA.b #$1C                  
                    STA.w $1200                 
CODE_23E338:        LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_23E348           
                    LDX.b #$09                  
CODE_23E340:        LDA.w $1802,x               
                    BEQ   CODE_23E349           
                    DEX                         
                    BPL   CODE_23E340           
CODE_23E348:        RTS                         

CODE_23E349:        INC.w $1802,x               
                    LDY.b #$0B                  
                    LDA.w $192D                 
                    AND.b #$1C                  
                    BNE   CODE_23E357           
                    LDY.b #$06                  
CODE_23E357:        TYA                         
                    STA.w $18BB,x               
                    LDA.b #$B0                  
                    STA.w $1813,x               
                    LDA.b #$7C                  
                    STA.w $1824,x               
                    JSL.l CODE_25F805           
                    AND.b #$0F                  
                    ADC.b #$A8                  
                    STA.w $1835,x               
                    JSL.l CODE_25F805           
                    AND.b #$1F                  
                    SBC.b #$10                  
                    STA.w $1846,x               
                    JSR.w CODE_23ED8D           
                    INC.w $18A6,x               
                    LDA.b #$30                  
                    STA.w $191E,x               
                    RTS                         

CODE_23E387:        LDX.b #$02                  
                    LDY.b #$02                  
                    LDA.w $190E                 
                    BEQ   CODE_23E392           
                    LDY.b #$25                  
CODE_23E392:        STY.b $00                   
                    LDA.w $1D9C,y               
                    BNE   CODE_23E3A1           
                    DEY                         
                    DEX                         
                    BPL   CODE_23E392           
                    LDX.w $190E                 
                    RTS                         

CODE_23E3A1:        LDX.b #$0B                  
CODE_23E3A3:        LDA.w $1802,x               
                    BEQ   CODE_23E3B1           
                    DEX                         
                    CPX.b #$0A                  
                    BNE   CODE_23E3A3           
                    LDX.w $190E                 
                    RTS                         

CODE_23E3B1:        LDA.b #$0F                  
                    STA.w $1200                 
                    LDA.w $1D9C,y               
                    TAY                         
                    CLC                         
                    ADC.b #$0B                  
                    STA.w $18BB,x               
                    LDA.w $ECB9,y               
                    STA.w $1835,x               
                    INC.w $1802,x               
                    LDY.b $00                   
                    LDA.b #$00                  
                    STA.w $1D9C,y               
                    JSR.w CODE_23ED8D           
                    LDY.w $190E                 
                    LDA.w $1822,y               
                    STA.w $1824,x               
                    ASL   A                     
                    LDA.b #$06                  
                    BCC   CODE_23E3E3           
                    LDA.b #$FA                  
CODE_23E3E3:        STA.w $1846,x               
                    LDA.w $1811,y               
                    STA.w $1813,x               
                    LDA.b #$00                  
                    STA.w $1944,x               
                    LDA.b #$20                  
                    STA.w $18E9,x               
                    LDX.w $190E                 
                    RTS                         

CODE_23E3FA:        JSL.l CODE_23DF67           
                    LDA.w $1930                 
                    BEQ   CODE_23E40A           
                    STZ.w $0076                 
                    STZ.b $F2                   
                    STZ.b $F3                   
CODE_23E40A:        LDX.b #$01                  
CODE_23E40C:        STX.w $190E                 
                    LDA.b $F2,x                 
                    AND.b #$03                  
                    CMP.b #$03                  
                    BNE   CODE_23E419           
                    DEC.b $F2,x                 
CODE_23E419:        LDA.b $F2,x                 
                    AND.b #$0C                  
                    CMP.b #$0C                  
                    BNE   CODE_23E427           
                    LDA.b $F2,x                 
                    AND.b #$F7                  
                    STA.b $F2,x                 
CODE_23E427:        LDA.w $76                 
                    BNE   CODE_23E43C           
                    LDA.w $18E7,x               
                    BEQ   CODE_23E434           
                    DEC.w $18E7,x               
CODE_23E434:        LDA.w $1989,x               
                    BEQ   CODE_23E43C           
                    DEC.w $1989,x               
CODE_23E43C:        JSR.w CODE_23E452           
                    STZ.w $193F,x               
                    DEX                         
                    BPL   CODE_23E40C           
                    LDA.w $76                 
                    BNE   CODE_23E44D           
                    JSR.w CODE_23EBDD           
CODE_23E44D:        JSL.l CODE_25F8CE           
                    RTS                         

CODE_23E452:        LDA.w $1930                 
                    BEQ   CODE_23E45A           
                    JMP.w CODE_23E46C           

CODE_23E45A:        LDA.w $18CB,x               
                    BEQ   CODE_23E467           
                    DEC.w $18CB,x               
                    BEQ   CODE_23E467           
                    JMP.w CODE_23E49B           

CODE_23E467:        LDY.w $1930                 
                    BEQ   CODE_23E4D6           
CODE_23E46C:        TXA                         
                    BEQ   CODE_23E478           
                    LDA.w $1801                 
                    CMP.b #$02                  
                    BEQ   CODE_23E4D6           
                    BRA   CODE_23E49B           

CODE_23E478:        LDA.w $76                 
                    BNE   CODE_23E480           
                    DEC.w $1930                 
CODE_23E480:        LDA.w $1800                 
                    CMP.b #$02                  
                    BEQ   CODE_23E4D6           
                    LDA.w $1930                 
                    BNE   CODE_23E49B           
                    INC.w $1930                 
                    JSR.w CODE_23E6CC           
CODE_23E492:        LDA.b #$01                  
                    STA.w $14                 
                    STZ.w $0075                 
CODE_23E49A:        RTS                         

CODE_23E49B:        LDA.w $1800,x               
                    BEQ   CODE_23E49A           
                    LDA.w $76                 
                    ORA.w $1930                 
                    BEQ   CODE_23E4B9           
                    LDA.w $193F,x               
                    BEQ   CODE_23E4B9           
                    LDA.w $1811,x               
                    AND.b #$F8                  
                    CLC                         
                    ADC.w $193F,x               
                    STA.w $1811,x               
CODE_23E4B9:        LDA.w $1800,x               
                    CMP.b #$03                  
                    BNE   CODE_23E4D2           
                    LDA.w $1930                 
                    BEQ   CODE_23E4CF           
                    LDA.w $1895,x               
                    ORA.b #$04                  
                    STA.w $1895,x               
                    BRA   CODE_23E4D2           

CODE_23E4CF:        JMP.w CODE_23E816           

CODE_23E4D2:        JSR.w CODE_23E6CC           
                    RTS                         

CODE_23E4D6:        LDA.w $1800,x               
                    JSL.l CODE_20FB1F           

                 dw CODE_23E4E5
                    dw CODE_23E51E
                    dw CODE_23E82C
                    dw CODE_23E78E

CODE_23E4E5:        LDY.w $18E7,x
                    BEQ   CODE_23E4F4           
                    DEY                         
                    BNE   CODE_23E51D           
                    INX                         
                    STX.w $078C                 
                    JMP.w CODE_23E492           

CODE_23E4F4:        LDA.b #$00                  
                    STA.w $1844,x               
                    STA.w $1833,x               
                    LDA.b #$01                  
                    STA.w $1800,x               
                    TXA                         
                    TAY                         
                    LDA.w $ECC1,y               
                    STA.w $1864,x               
                    LDA.b #$90                  
                    STA.w $1811,x               
                    LDA.w $1F26                 
                    CMP.b #$07                  
                    BNE   CODE_23E517           
                    INY                         
                    INY                         
CODE_23E517:        LDA.w $ECBD,y               
                    STA.w $1822,x               
CODE_23E51D:        RTS                         

CODE_23E51E:        JSR.w CODE_23E525           
                    JSR.w CODE_23E6CC           
                    RTS                         

CODE_23E525:        LDA.w $18B9                 
                    BNE   CODE_23E54C           
                    LDA.b $F2,x                 
                    AND.b #$0C                  
                    BEQ   CODE_23E54C           
                    AND.w $1895,x               
                    BNE   CODE_23E54C           
                    LDA.w $190F,x               
                    CMP.b #$C0                  
                    BNE   CODE_23E54C           
                    LDA.b #$00                  
                    STA.w $1844,x               
                    STA.w $1833,x               
                    LDA.b #$03                  
                    STA.w $1800,x               
                    JMP.w CODE_23EAA1           

CODE_23E54C:        LDA.b $F2,x                 
                    BEQ   CODE_23E555           
                    LDA.b #$00                  
                    STA.w $190A,x               
CODE_23E555:        LDA.w $18B5,x               
                    BEQ   CODE_23E567           
                    CMP.b #$08                  
                    BNE   CODE_23E561           
                    JSR.w CODE_23E387           
CODE_23E561:        LDA.b #$00                  
                    STA.b $F2,x                 
                    STA.b $F6,x                 
CODE_23E567:        LDA.b $F2,x                 
                    AND.b #$03                  
                    BEQ   CODE_23E5C3           
                    STA.w $1864,x               
                    LSR   A                     
                    BCC   CODE_23E59B           
                    LDA.b $F2,x                 
                    AND.b #$40                  
                    BEQ   CODE_23E586           
                    LDA.w $1844,x               
                    CMP.b #$18                  
                    BPL   CODE_23E583           
                    CLC                         
                    ADC.b #$01                  
CODE_23E583:        JMP.w CODE_23E5C0           

CODE_23E586:        LDA.w $1844,x               
                    CMP.b #$0C                  
                    BEQ   CODE_23E598           
                    BPL   CODE_23E595           
                    CLC                         
                    ADC.b #$01                  
                    JMP.w CODE_23E5C0           

CODE_23E595:        SEC                         
                    SBC.b #$01                  
CODE_23E598:        JMP.w CODE_23E5C0           

CODE_23E59B:        LDA.b $F2,x                 
                    AND.b #$40                  
                    BEQ   CODE_23E5AE           
                    LDA.w $1844,x               
                    CMP.b #$E9                  
                    BMI   CODE_23E5AB           
                    SEC                         
                    SBC.b #$01                  
CODE_23E5AB:        JMP.w CODE_23E5C0           

CODE_23E5AE:        LDA.w $1844,x               
                    CMP.b #$F4                  
                    BEQ   CODE_23E5C0           
                    BMI   CODE_23E5BD           
                    SEC                         
                    SBC.b #$01                  
                    JMP.w CODE_23E5C0           

CODE_23E5BD:        CLC                         
                    ADC.b #$01                  
CODE_23E5C0:        STA.w $1844,x               
CODE_23E5C3:        LDA.w $1895,x               
                    AND.b #$04                  
                    BEQ   CODE_23E5CF           
                    LDA.w $1833,x               
                    BPL   CODE_23E5D2           
CODE_23E5CF:        JMP.w CODE_23E656           

CODE_23E5D2:        LDA.w $1811,x               
                    AND.b #$F8                  
                    CLC                         
                    ADC.w $193F,x               
                    STA.w $1811,x               
                    LDA.b #$00                  
                    STA.w $1833,x               
                    STA.w $18F6,x               
                    LDY.w $18F8,x               
                    CPY.b #$C2                  
                    BNE   CODE_23E605           
                    LDA.w $1895,x               
                    AND.b #$C0                  
                    LDY.b #$08                  
                    CMP.b #$C0                  
                    BEQ   CODE_23E602           
                    CMP.b #$80                  
                    BEQ   CODE_23E5FE           
                    LDY.b #$F8                  
CODE_23E5FE:        TYA                         
                    STA.w $1844,x               
CODE_23E602:        JMP.w CODE_23E60A           

CODE_23E605:        LDY.w $18BA                 
                    BEQ   CODE_23E619           
CODE_23E60A:        LDA.b #$12                  
                    STA.w $18B5,x               
                    LDA.b #$02                  
                    STA.w $1200                 
                    LDA.b #$C8                  
                    JMP.w CODE_23E637           

CODE_23E619:        LDA.b $F6,x                 
                    BPL   CODE_23E63A           
                    LDA.b #$01                  
                    STA.w $1201                 
                    LDA.b #$01                  
                    STA.w $18F6,x               
                    LDA.w $1844,x               
                    BPL   CODE_23E631           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_23E631:        LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $ECD9,y               
CODE_23E637:        STA.w $1833,x               
CODE_23E63A:        LDA.b $F2,x                 
                    AND.b #$03                  
                    BNE   CODE_23E656           
                    LDA.w $1844,x               
                    BEQ   CODE_23E656           
                    BPL   CODE_23E650           
                    CLC                         
                    ADC.b #$01                  
                    STA.w $1844,x               
                    JMP.w CODE_23E656           

CODE_23E650:        SEC                         
                    SBC.b #$01                  
                    STA.w $1844,x               
CODE_23E656:        LDY.w $1F26                 
                    LDA.w $ECCD,y               
                    BEQ   CODE_23E679           
                    LDA.b #$01                  
                    LDY.w $1844,x               
                    BPL   CODE_23E666           
                    ASL   A                     
CODE_23E666:        AND.w $1895,x               
                    BEQ   CODE_23E679           
                    AND.b $F2,x                 
                    BEQ   CODE_23E673           
                    TAY                         
                    LDA.w $ECCA,y               
CODE_23E673:        STA.w $1844,x               
                    JMP.w CODE_23E67C           

CODE_23E679:        JSR.w CODE_23F983           
CODE_23E67C:        LDA.w $18B7,x               
                    BEQ   CODE_23E686           
                    DEC.w $18B7,x               
                    BNE   CODE_23E6CB           
CODE_23E686:        LDY.w $1833,x               
                    BPL   CODE_23E6AD           
                    LDA.w $1895,x               
                    AND.b #$08                  
                    BEQ   CODE_23E6AD           
                    TYA                         
                    EOR.b #$FF                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ADC.b #$04                  
                    STA.w $18B7,x               
                    LDA.b #$00                  
                    STA.w $1833,x               
                    LDA.w $1811,x               
                    AND.b #$F0                  
                    CLC                         
                    ADC.b #$0E                  
                    STA.w $1811,x               
CODE_23E6AD:        JSR.w CODE_23F98F           
                    LDA.w $1833,x               
                    BMI   CODE_23E6B9           
                    CMP.b #$40                  
                    BCS   CODE_23E6CB                   
CODE_23E6B9:        LDA.w $1833,x               
                    BPL   CODE_23E6C2           
                    LDY.b $F2,x                 
                    BMI   CODE_23E6C5           
CODE_23E6C2:        CLC                         
                    ADC.b #$03                  
CODE_23E6C5:        CLC                         
                    ADC.b #$02                  
                    STA.w $1833,x               
CODE_23E6CB:        RTS                         

CODE_23E6CC:        LDA.w $1930                 
                    BEQ   CODE_23E6F5           
                    TXA                         
                    EOR.w $078C                 
                    AND.b #$01                  
                    BNE   CODE_23E6F5           
                    LDA.w $1895,x               
                    BIT.b #$04                  
                    BEQ   CODE_23E6F2           
                    LDA.b $8D,x                 
                    CMP.b #$98                  
                    BEQ   CODE_23E6EA           
                    CMP.b #$58                  
                    BNE   CODE_23E6F2           
CODE_23E6EA:        LDA.b #$98                  
                    STA.b $8D,x                 
                    JSR.w CODE_23EAA1           
                    RTS                         

CODE_23E6F2:        JSR.w CODE_23E525           
CODE_23E6F5:        LDY.b #$58                  
                    LDA.w $1844,x               
                    BNE   CODE_23E701           
                    STA.w $1855,x               
                    BEQ   CODE_23E748           
CODE_23E701:        LDY.b #$01                  
                    ASL   A                     
                    BCC   CODE_23E707           
                    INY                         
CODE_23E707:        TYA                         
                    LDY.b #$68                  
                    CMP.w $1864,x               
                    BNE   CODE_23E748           
                    LDA.w $18CB                 
                    ORA.w $18CC                 
                    ORA.w $1930                 
                    BNE   CODE_23E734           
                    LDA.w $1844,x               
                    BPL   CODE_23E722           
                    EOR.b #$FF                  
                    INC   A                     
CODE_23E722:        LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $199C,x               
                    CLC                         
                    ADC.w $ECC3,y               
                    STA.w $199C,x               
                    BCC   CODE_23E734           
                    INC.w $199E,x               
CODE_23E734:        LDA.w $199E,x               
                    TAY                         
                    TYA                         
                    BEQ   CODE_23E742           
                    BIT.b #$01                  
                    BNE   CODE_23E746           
                    STZ.w $199E,x               
CODE_23E742:        LDY.b #$58                  
                    BRA   CODE_23E748           

CODE_23E746:        LDY.b #$60                  
CODE_23E748:        LDA.w $1895,x               
                    AND.b #$04                  
                    BNE   CODE_23E75E           
                    LDA.w $18F6,x               
                    BNE   CODE_23E759           
                    LDY.b #$60                  
                    JMP.w CODE_23E776           

CODE_23E759:        LDY.b #$70                  
                    JMP.w CODE_23E776           

CODE_23E75E:        LDA.w $18B5,x               
                    BEQ   CODE_23E76A           
                    DEC.w $18B5,x               
                    LDY.b #$78                  
                    BRA   CODE_23E776           

CODE_23E76A:        LDA.w $18B3,x               
                    BEQ   CODE_23E776           
                    DEC.w $18B3,x               
                    LDY.b #$80                  
                    BRA   CODE_23E776           

CODE_23E776:        TYA                         
                    STA.b $8D,x                 
                    CMP.b #$68                  
                    BNE   CODE_23E787           
                    LDA.w $1201                 
                    BNE   CODE_23E787           
                    LDA.b #$04                  
                    STA.w $1201                 
CODE_23E787:        JSR.w CODE_23EAA1           
                    JSR.w CODE_23E864           
                    RTS                         

CODE_23E78E:        LDA.b $F2,x                 
                    AND.b #$0C                  
                    BEQ   CODE_23E7B0           
                    AND.w $1895,x               
                    BNE   CODE_23E7B0           
                    LDA.w $1822,x               
                    AND.b #$0F                  
                    BEQ   CODE_23E7B0           
                    CMP.b #$08                  
                    LDY.b #$01                  
                    BCS   CODE_23E7A8                   
                    LDY.b #$FF                  
CODE_23E7A8:        TYA                         
                    CLC                         
                    ADC.w $1822,x               
                    STA.w $1822,x               
CODE_23E7B0:        LDA.b $F2,x                 
                    AND.b #$0C                  
                    BEQ   CODE_23E7E6           
                    STA.b $00                   
                    AND.w $1895,x               
                    BNE   CODE_23E806           
                    LDA.b $00                   
                    CMP.b #$08                  
                    BNE   CODE_23E7E0           
                    LDA.b #$C0                  
                    CMP.w $190F,x               
                    BNE   CODE_23E806           
                    DEC.w $1811,x               
                    JSR.w CODE_23E864           
                    LDA.w $190F,x               
                    CMP.b #$C0                  
                    BEQ   CODE_23E7DA           
                    INC.w $1811,x               
CODE_23E7DA:        INC.w $1855,x               
                    JMP.w CODE_23E816           

CODE_23E7E0:        INC.w $1811,x               
                    INC.w $1855,x               
CODE_23E7E6:        LDA.b $F2,x                 
                    AND.b #$03                  
                    STA.b $00                   
                    AND.w $1895,x               
                    BNE   CODE_23E7FF           
                    LSR.b $00                   
                    BCC   CODE_23E7F8           
                    INC.w $1822,x               
CODE_23E7F8:        LSR.b $00                   
                    BCC   CODE_23E7FF           
                    DEC.w $1822,x               
CODE_23E7FF:        LDA.w $190F,x               
                    CMP.b #$C0                  
                    BEQ   CODE_23E816           
CODE_23E806:        LDA.b #$01                  
                    STA.w $1800,x               
                    LDA.b #$00                  
                    STA.w $1844,x               
                    STA.w $1833,x               
                    STA.w $18F6,x               
CODE_23E816:        LDA.b #$88                  
                    STA.b $8D,x                 
                    JSR.w CODE_23E864           
                    LDA.w $1855,x               
                    AND.b #$04                  
                    LSR   A                     
                    LSR   A                     
                    ADC.b #$01                  
                    STA.w $1864,x               
                    JMP.w CODE_23EAA1           

CODE_23E82C:        LDA.b #$90                  
                    STA.b $8D,x                 
                    JSR.w CODE_23EAA1           
                    LDA.w $18E7,x               
                    BNE   CODE_23E863           
                    JSR.w CODE_23F98F           
                    LDA.w $1833,x               
                    BMI   CODE_23E844           
                    CMP.b #$40                  
                    BCS   CODE_23E84A                   
CODE_23E844:        INC.w $1833,x               
                    INC.w $1833,x               
CODE_23E84A:        LDA.w $1811,x               
                    CMP.b #$EF                  
                    BCC   CODE_23E863           
                    LDA.w $1942,x               
                    BNE   CODE_23E863           
                    LDA.b #$40                  
                    STA.w $18E7,x               
                    STA.w $190A,x               
                    LDA.b #$00                  
                    STA.w $1800,x               
CODE_23E863:        RTS                         

CODE_23E864:        LDA.b #$00                  
                    STA.w $1895,x               
                    STA.w $18F8,x               
                    STA.w $190F,x               
                    LDY.b #$05                  
CODE_23E871:        STY.b $0F                   
                    LDA.w $1811,x               
                    CLC                         
                    ADC.w $ECF3,y               
                    AND.b #$F0                  
                    STA.b $00                   
                    CPX.b #$02                  
                    BCC   CODE_23E88E           
                    LDA.w $18B9,x               
                    CMP.b #$0B                  
                    BNE   CODE_23E88E           
                    TYA                         
                    CLC                         
                    ADC.b #$06                  
                    TAY                         
CODE_23E88E:        LDA.w $1822,x               
                    CLC                         
                    ADC.w $ECE7,y               
                    STA.b $01                   
                    JSR.w CODE_23EA61           
                    LDY.b $0F                   
                    BCS   CODE_23E8A1                   
                    JMP.w CODE_23E9E8           

CODE_23E8A1:        CPY.b #$02                  
                    BCS   CODE_23E900                   
                    LDA.w $1811,x               
                    CMP.b #$D0                  
                    BCS   CODE_23E8FD                   
                    AND.b #$0F                  
                    CMP.b #$09                  
                    BCS   CODE_23E8B5                   
                    JMP.w CODE_23E9E8           

CODE_23E8B5:        CPX.b #$02                  
                    BCS   CODE_23E8FD                   
                    LDA.w $1833,x               
                    BPL   CODE_23E8FD           
                    LDA.w $180F,x               
                    BNE   CODE_23E8FD           
                    LDA.w $1F26                 
                    CMP.b #$0B                  
                    BEQ   CODE_23E8FD           
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDY.b $02                   
                    LDA.b #$C2                  
                    STA.b [$2E],y               
                    TYA                         
                    STA.w $1908,x               
                    LDA.w $1811,x               
                    AND.b #$F0                  
                    STA.w $1820,x               
                    LDA.w $1822,x               
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.w $1831,x               
                    LDA.b #$0E                  
                    STA.w $180F,x               
                    LDA.b #$E0                  
                    STA.w $1842,x               
CODE_23E8FD:        JMP.w CODE_23E9B3           

CODE_23E900:        CPY.b #$04                  
                    BCS   CODE_23E981                   
                    CPX.b #$02                  
                    BCS   CODE_23E97E                   
                    CMP.b #$50                  
                    BEQ   CODE_23E97E           
                    LDA.w $1F26                 
                    CMP.b #$0B                  
                    BNE   CODE_23E97E           
                    LDA.b $F6,x                 
                    AND.b #$40                  
                    BEQ   CODE_23E97E           
                    LDA.b #$0C                  
                    STA.w $18B3,x               
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDY.b $02                   
                    LDA.b #$00                  
                    STA.b [$2E],y               
                    JSR.w CODE_23EA0F           
                    LDX.b #$06                  
CODE_23E93A:        LDA.w $1802,x               
                    BEQ   CODE_23E944           
                    DEX                         
                    BPL   CODE_23E93A           
                    LDX.b #$06                  
CODE_23E944:        STX.b $00                   
                    JSR.w CODE_23ED8D           
                    INC.w $1802,x               
                    LDA.b #$0F                  
                    STA.w $18BB,x               
                    LDA.b $02                   
                    AND.b #$F0                  
                    STA.w $1813,x               
                    LDA.b $02                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.w $1824,x               
                    LDA.b #$C0                  
                    STA.w $1835,x               
                    LDY.b #$10                  
                    LDA.w $1824,x               
                    LDX.w $190E                 
                    CMP.w $1822,x               
                    BCS   CODE_23E975                   
                    LDY.b #$F0                  
CODE_23E975:        LDX.b $00                   
                    TYA                         
                    STA.w $1846,x               
                    LDX.w $190E                 
CODE_23E97E:        JMP.w CODE_23E9B3           

CODE_23E981:        LDA.w $1811,x               
                    AND.b #$0F                  
                    CMP.b #$06                  
                    BCS   CODE_23E9E8                   
                    LDA.w $1833,x               
                    BMI   CODE_23E9E8           
                    LDY.b $02                   
                    LDA.w $18F8,x               
                    CMP.b #$C2                  
                    BEQ   CODE_23E9B3           
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.b [$2E],y               
                    CMP.b #$FE                  
                    BCC   CODE_23E9B0           
                    AND.b #$01                  
                    TAY                         
                    LDA.w $EC57,y               
CODE_23E9B0:        STA.w $18F8,x               
CODE_23E9B3:        LDY.b $0F                   
                    LDA.w $1895,x               
                    ORA.w $ECFF,y               
                    STA.w $1895,x               
                    CPX.b #$02                  
                    BCC   CODE_23E9C9           
                    LDA.w $18B9,x               
                    CMP.b #$01                  
                    BEQ   CODE_23E9DF           
CODE_23E9C9:        LDY.b $02                   
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.b [$2E],y               
                    LDY.b $0F                   
                    CMP.b #$C2                  
                    BNE   CODE_23E9E8           
CODE_23E9DF:        LDA.w $1895,x               
                    ORA.w $ED05,y               
                    STA.w $1895,x               
CODE_23E9E8:        CPY.b #$02                  
                    BCS   CODE_23EA06                   
                    LDY.b $02                   
                    LDA.w $190F,x               
                    CMP.b #$C0                  
                    BEQ   CODE_23EA06           
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.b [$2E],y               
                    STA.w $190F,x               
CODE_23EA06:        LDY.b $0F                   
                    DEY                         
                    BMI   CODE_23EA0E           
                    JMP.w CODE_23E871           

CODE_23EA0E:        RTS                         

CODE_23EA0F:        LDY.w $1600                 
                    LDA.b #$08                  
                    STA.b $03                   
                    LDA.b $02                   
                    AND.b #$F0                  
                    ASL   A                     
                    ROL.b $03                   
                    ASL   A                     
                    ROL.b $03                   
                    STA.b $04                   
                    LDA.b $02                   
                    ASL   A                     
                    AND.b #$1F                  
                    CLC                         
                    ADC.b $04                   
                    STA.w $1603,y               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $1609,y               
                    LDA.b $03                   
                    AND.b #$DF                  
                    STA.w $1602,y               
                    STA.w $1608,y               
                    REP   #$20                  
                    LDA.w #$0240                
                    STA.w $1604,y               
                    STA.w $160A,y               
                    LDA.w #$1CFF                
                    STA.w $1606,y               
                    STA.w $160C,y               
                    LDA.w #$FFFF                
                    STA.w $160E,y               
                    SEP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.b #$0C                  
                    STA.w $1600                 
                    RTS                         

CODE_23EA61:        LDA.b $01                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $00                   
                    TAY                         
                    STY.b $02                   
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.b [$2E],y               
                    CMP.b #$FE                  
                    BCC   CODE_23EA84           
                    AND.b #$01                  
                    TAY                         
                    LDA.w $EC57,y               
CODE_23EA84:        PHA                         
                    ASL   A                     
                    ROL.b $0E                   
                    ASL   A                     
                    ROL.b $0E                   
                    LDA.b $0E                   
                    AND.b #$03                  
                    TAY                         
                    PLA                         
                    CMP.w $1E9A,y               
                    RTS                         

CODE_23EA95:        TXA                         
                    CLC                         
                    ADC.b #$02                  
                    TAX                         
                    JSR.w CODE_23E864           
                    LDX.w $190E                 
                    RTS                         

CODE_23EAA1:        LDA.w $1942,x               
                    BPL   CODE_23EAAE           
                    LDA.w $1811,x               
                    CMP.b #$F0                  
                    BCS   CODE_23EAB1                   
                    RTS                         

CODE_23EAAE:        BEQ   CODE_23EAB1           
                    RTS                         

CODE_23EAB1:        LDA.w $190A,x               
                    BEQ   CODE_23EABD           
                    LDA.b $15                   
                    AND.b #$02                  
                    BEQ   CODE_23EABD           
                    RTS                         

CODE_23EABD:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.w $1822,x               
                    STA.w $0880,y               
                    LDA.w $1811,x               
                    STA.w $0881,y               
                    LDA.b #$0E                  
                    STA.b $0A                   
                    LDA.w $190E                 
                    BEQ   CODE_23EADD           
                    LDA.b #$0A                  
                    STA.b $0A                   
CODE_23EADD:        LDA.w $1864,x               
                    TAX                         
                    LDA.w $ED16,x               
                    ORA.b $0A                   
                    STA.w $0883,y               
                    LDX.w $190E                 
                    LDA.w $1800,x               
                    CMP.b #$02                  
                    BEQ   CODE_23EAFA           
                    LDA.w $1864,x               
                    BIT.b #$01                  
                    BNE   CODE_23EB02           
CODE_23EAFA:        LDA.w $0883,y               
                    AND.b #$BF                  
                    STA.w $0883,y               
CODE_23EB02:        LDA.w $1800,x               
                    CMP.b #$02                  
                    BEQ   CODE_23EB3A           
                    LDA.w $1864,x               
                    BIT.b #$01                  
                    BEQ   CODE_23EB3A           
                    LDA.w $1930                 
                    BEQ   CODE_23EB2D           
                    TXA                         
                    EOR.w $078C                 
                    AND.b #$01                  
                    BNE   CODE_23EB2D           
                    LDA.b $8D,x                 
                    CMP.b #$98                  
                    BNE   CODE_23EB2D           
                    LDA.w $0883,y               
                    AND.b #$BF                  
                    STA.w $0883,y               
                    BRA   CODE_23EB3A           

CODE_23EB2D:        LDA.w $0880,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0880,y               
                    LDA.b #$F8                  
                    BRA   CODE_23EB3C           

CODE_23EB3A:        LDA.b #$08                  
CODE_23EB3C:        STA.w $00                 
                    LDA.b #$04                  
                    STA.w $0882,y               
                    CPX.b #$00                  
                    BEQ   CODE_23EB4D           
                    LDA.b #$14                  
                    STA.w $0882,y               
CODE_23EB4D:        LDA.w $0880,y               
                    STA.w $0888,y               
                    CLC                         
                    ADC.w $0000                 
                    STA.w $0884,y               
                    STA.w $088C,y               
                    LDA.w $0881,y               
                    STA.w $0885,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0889,y               
                    STA.w $088D,y               
                    LDA.w $0882,y               
                    INC   A                     
                    STA.w $0886,y               
                    INC   A                     
                    STA.w $088A,y               
                    INC   A                     
                    STA.w $088E,y               
                    LDA.w $0883,y               
                    STA.w $0887,y               
                    STA.w $088B,y               
                    STA.w $088F,y               
                    STA.b $00                   
                    LDA.w $1822,x               
                    CMP.b #$F1                  
                    BCC   CODE_23EBCA           
                    PHY                         
                    LDA.b #$08                  
                    STA.b $00                   
CODE_23EB95:        LDA.w $0880,y               
                    STA.w $08C0,y               
                    LDA.w $0881,y               
                    STA.w $08C1,y               
                    LDA.w $0882,y               
                    STA.w $08C2,y               
                    LDA.w $0883,y               
                    STA.w $08C3,y               
                    TYA                         
                    CLC                         
                    ADC.b #$04                  
                    TAY                         
                    DEC.b $00                   
                    BNE   CODE_23EB95           
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$01                  
                    STA.w $0A50,y               
                    STA.w $0A52,y               
                    STA.w $0A51,y               
                    STA.w $0A53,y               
                    BRA   CODE_23EBCE           

CODE_23EBCA:        TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_23EBCE:        LDA.b #$00                  
                    STA.w $0A40,y               
                    STA.w $0A41,y               
                    STA.w $0A42,y               
                    STA.w $0A43,y               
                    RTS                         

CODE_23EBDD:        LDA.w $1800                 
                    CMP.b #$02                  
                    BEQ   CODE_23EC16           
                    LDA.w $1801                 
                    CMP.b #$02                  
                    BEQ   CODE_23EC16           
                    LDA.w $18B9                 
                    BNE   CODE_23EC13           
                    LDX.b #$01                  
                    LDY.b #$04                  
CODE_23EBF4:        JSR.w CODE_23ECAC           
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    DEX                         
                    BPL   CODE_23EBF4           
                    JSR.w CODE_23ECC9           
                    BCC   CODE_23EC16           
                    LDA.b #$01                  
                    STA.w $1800                 
                    STA.w $1801                 
                    LDA.b #$08                  
                    STA.w $18B9                 
                    JMP.w CODE_23EC17           

CODE_23EC13:        DEC.w $18B9                 
CODE_23EC16:        RTS
                       
CODE_23EC17:        LDA.w $1811                 
                    SEC                         
                    SBC.w $1812                 
                    PHP                         
                    BPL   CODE_23EC26           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_23EC26:        CMP.b #$08                  
                    BCC   CODE_23EC73           
                    LDY.b #$00                  
                    PLP                         
                    BCC   CODE_23EC30           
                    INY                         
CODE_23EC30:        LDA.w $ED1D,y               
                    AND.w $1833                 
                    BMI   CODE_23EC51           
                    LDA.w $ED1D,y               
                    STA.w $1833                 
                    LDA.w $1895                 
                    AND.b #$04                  
                    BEQ   CODE_23EC51           
                    LDA.w $ED20,y               
                    STA.w $18B5                 
                    LDA.w $ED23,y               
                    STA.w $1200                 
CODE_23EC51:        LDA.w $ED1E,y               
                    AND.w $1834                 
                    BMI   CODE_23EC72           
                    LDA.w $ED1E,y               
                    STA.w $1834                 
                    LDA.w $1896                 
                    AND.b #$04                  
                    BEQ   CODE_23EC72           
                    LDA.w $ED21,y               
                    STA.w $18B6                 
                    LDA.w $ED24,y               
                    STA.w $1200                 
CODE_23EC72:        RTS                         

CODE_23EC73:        PLP                         
                    LDY.b #$00                  
                    LDA.w $1822                 
                    CMP.w $1823                 
                    BCS   CODE_23EC7F                   
                    INY                         
CODE_23EC7F:        EOR.w $1823                 
                    BPL   CODE_23EC91           
                    LDA.b #$EF                  
                    CMP.w $1822                 
                    BCC   CODE_23EC90           
                    CMP.w $1823                 
                    BCS   CODE_23EC91                 
CODE_23EC90:        INY                         
CODE_23EC91:        LDA.w $ED19,y               
                    STA.w $1844                 
                    LDA.w $ED1A,y               
                    STA.w $1845                 
                    TYA                         
                    AND.b #$01                  
                    CLC                         
                    ADC.b #$01                  
                    STA.w $1865                 
                    EOR.b #$03                  
                    STA.w $1864                 
                    RTS                         

CODE_23ECAC:        LDA.w $1811,x               
                    CLC                         
                    ADC.b #$02                  
                    STA.w $00,y               
                    LDA.b #$0E                  
                    STA.w $02,y               
                    LDA.w $1822,x               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $01,y               
                    LDA.b #$08                  
                    STA.w $03,y               
                    RTS                         

CODE_23ECC9:        TXA                         
                    PHA                         
                    LDX.b #$01                  
CODE_23ECCD:        LDA.b $04,x                 
                    SEC                         
                    SBC.b $00,x                 
                    CLC                         
                    ADC.b $06,x                 
                    STA.b $08                   
                    LDA.b $02,x                 
                    CLC                         
                    ADC.b $06,x                 
                    CMP.b $08                   
                    BCC   CODE_23ECE3           
                    DEX                         
                    BPL   CODE_23ECCD           
CODE_23ECE3:        PLA                         
                    TAX                         
                    RTS                         

DATA_23ECE6:        db $00,$00,$00,$00,$00,$01,$01,$01
                    db $01,$01,$00,$01,$00,$01,$00,$00
                    db $02,$00,$02,$00,$01,$02,$01,$02
                    db $01,$02,$02,$02,$02,$02    

CODE_23ED04:        LDA.w $18CB                 
                    ORA.w $18CC                 
                    ORA.w $1930                 
                    BNE   CODE_23ED2C           
                    INC.b $A9                   
                    LDA.b $A9                   
                    AND.b #$1F                  
                    BNE   CODE_23ED2D           
                    INC.w $190D                 
                    BNE   CODE_23ED2D           
                    JSR.w CODE_23ED3D           
                    TXA                         
                    BMI   CODE_23ED2D           
                    LDA.b #$10                  
                    STA.w $1835,x               
                    LDA.b #$05                  
                    STA.w $18BB,x               
CODE_23ED2C:        RTS                         

CODE_23ED2D:        LDA.b $A9                   
                    CMP.b #$80                  
                    BNE   CODE_23EDB1           
                    INC.w $190C                 
                    LDA.w $190C                 
                    AND.b #$07                  
                    BNE   CODE_23EDB1           
CODE_23ED3D:        LDX.b #$06                  
                    JSR.w CODE_23EE04           
                    TXA                         
                    BMI   CODE_23EDB0           
                    DEC.w $18CA                 
                    CPX.b #$05                  
                    BCS   CODE_23ED4F                   
                    JMP.w CODE_23F6B3           

CODE_23ED4F:        LDA.w $190C                 
                    LSR   A                     
                    AND.b #$01                  
                    TAY                         
                    LDA.w $ED3C,y               
                    STA.w $1846,x               
                    LDA.w $ED3A,y               
                    STA.w $1824,x               
                    JSL.l CODE_25F805           
                    LDA.w $192D                 
                    AND.b #$01                  
                    TAY                         
                    LDA.w $1811,y               
                    STA.w $1813,x               
                    LDA.b #$04                  
                    STA.w $18BB,x               
                    LDA.b #$00                  
                    STA.w $1835,x               
                    STA.w $18A6,x               
                    JSR.w CODE_23ED8D           
                    LDA.b #$20                  
                    STA.w $18E9,x               
                    LDA.b #$17                  
                    STA.w $1203                 
                    RTS                         

CODE_23ED8D:        LDA.b #$00                  
                    STA.w $1944,x               
                    STA.w $18A6,x               
                    STA.w $18FA,x               
                    STA.w $1931,x               
                    STA.w $1953,x               
                    STA.w $191E,x               
                    STA.w $18CD,x               
                    STA.w $18DA,x               
                    STA.w $197C,x               
                    STA.w $18E9,x               
                    STA.w $196F,x               
CODE_23EDB0:        RTS                         

CODE_23EDB1:        LDA.w $18CA                 
                    CMP.b #$05                  
                    BEQ   CODE_23EDB0           
                    LDA.b $A9                   
                    AND.b #$FF                  
                    BNE   CODE_23EDB0           
                    PHX                         
                    LDA.w $199A                 
                    ASL   A                     
                    ASL   A                     
                    ADC.w $199A                 
                    ADC.w $18CA                 
                    TAX                         
                    LDA   DATA_23ECE6,x             
                    PLX                         
                    JSL.l CODE_20FB1F           

                 dw CODE_23EE02
                    dw CODE_23EDF6
                    dw CODE_23EDDA

CODE_23EDDA:        JSR.w CODE_23EE02
                    TXA
                    BMI   CODE_23EDF5
                    LDA.b #$02                  
                    STA.w $18BB,x           
                    LDA.w $1960                 
                    BEQ   CODE_23EDF5           
                    DEC.w $1960                 
                    LDA.b #$01                  
                    STA.w $1953,x               
                    JSR.w CODE_23EE2C           
CODE_23EDF5:        RTS                         

CODE_23EDF6:        JSR.w CODE_23EE02           
                    TXA                         
                    BMI   CODE_23EE01           
                    LDA.b #$03                  
                    STA.w $18BB,x               
CODE_23EE01:        RTS                         

CODE_23EE02:        LDX.b #$04                  
CODE_23EE04:        LDA.w $1802,x               
                    BEQ   CODE_23EE0D           
                    DEX                         
                    BPL   CODE_23EE04           
                    RTS                         

CODE_23EE0D:        INC.w $18CA                 
                    LDA.b #$01                  
                    STA.w $1802,x               
                    LDA.b #$20                  
                    STA.w $1813,x               
                    LDA.b #$00                  
                    STA.w $1835,x               
                    LDA.b #$00                  
                    STA.w $18BB,x               
                    JSR.w CODE_23ED8D           
                    LDA.b #$30                  
                    STA.w $191E,x               
CODE_23EE2C:        LDA.w $18CA                 
                    AND.b #$01                  
                    TAY                         
                    LDA.w $ED32,y               
                    STA.w $1824,x               
CODE_23EE38:        LDA.w $18CA                 
                    CMP.b #$05                  
                    BNE   CODE_23EE4A           
                    LDA.w $19A0                 
                    BEQ   CODE_23EE4A           
                    STA.w $1931,x               
                    INY                         
                    INY                         
                    INY                         
CODE_23EE4A:        LDA.w $ED34,y               
                    STA.w $1846,x               
                    RTS
                       
CODE_23EE51:        DEC.w $18C9                 
                    BPL   CODE_23EE5B           
                    LDA.b #$0D                  
                    STA.w $18C9                 
CODE_23EE5B:        LDX.b #$0B                  
CODE_23EE5D:        STX.w $190E                 
                    TXA                         
                    CLC                         
                    ADC.w $18C9                 
                    TAY                         
                    LDA.w $ED3E,y               
                    STA.w $18C8                 
                    JSL.l CODE_25F805           
                    JSR.w CODE_23EE77           
                    DEX                         
                    BPL   CODE_23EE5D           
CODE_23EE76:        RTS                         

CODE_23EE77:        LDA.w $18CD,x               
                    BEQ   CODE_23EE7F           
                    DEC.w $18CD,x               
CODE_23EE7F:        LDA.w $197C,x               
                    BEQ   CODE_23EE87           
                    DEC.w $197C,x               
CODE_23EE87:        LDA.w $1802,x               
                    BEQ   CODE_23EE76           
                    JSL.l CODE_20FB1F           

POINTER_23EE90:     dw CODE_23EE76
                    dw CODE_23EE98
                    dw CODE_23F605
                    dw CODE_23F69D

CODE_23EE98:        LDA.w $18CD,x
                    ORA.w $197C,x
                    ORA.w $1930
                    BEQ   CODE_23EEB3           
                    JSR.w CODE_23EA95           
                    JSR.w CODE_23F1A5           
                    LDA.w $18BB,x               
                    CMP.b #$0B                  
                    BEQ   CODE_23EEC3           
                    JMP.w CODE_23F22E           

CODE_23EEB3:        LDA.w $18DA,x               
                    BEQ   CODE_23EEBB           
                    DEC.w $18DA,x               
CODE_23EEBB:        LDA.w $191E,x               
                    BEQ   CODE_23EEC3           
                    DEC.w $191E,x               
CODE_23EEC3:        LDA.w $18E9,x               
                    BEQ   CODE_23EECB           
                    DEC.w $18E9,x               
CODE_23EECB:        LDA.b #$01                  
                    LDY.w $1846,x               
                    BPL   CODE_23EED4           
                    LDA.b #$02                  
CODE_23EED4:        STA.w $1866,x               
                    LDA.b #$04                  
                    LDY.w $1835,x               
                    BPL   CODE_23EEE0           
                    LDA.b #$08                  
CODE_23EEE0:        STA.w $1962,x               
                    LDA.w $18BB,x               
                    JSL.l CODE_20FB1F           

POINTER_23EEEA:     dw CODE_23F129
                    dw CODE_23F074
                    dw CODE_23F129
                    dw CODE_23F08E
                    dw CODE_23F79C
                    dw CODE_23F79C
                    dw CODE_23F79C
                    dw CODE_23F79C
                    dw CODE_23F79C
                    dw CODE_23F79C
                    dw CODE_23EF34
                    dw CODE_23EF9B
                    dw CODE_23EF3A
                    dw CODE_23EF35
                    dw CODE_23EF3A
                    dw CODE_23EF0A

CODE_23EF0A:        JSR.w CODE_23F971
                    JSR.w CODE_23F977           
                    LDA.w $1835,x               
                    BMI   CODE_23EF19           
                    CMP.b #$7D                  
                    BCS   CODE_23EF22                   
CODE_23EF19:        INC.w $1835,x               
                    INC.w $1835,x               
                    INC.w $1835,x               
CODE_23EF22:        LDA.w $1813,x               
                    CMP.b #$E0                  
                    BCC   CODE_23EF31           
                    LDA.w $1944,x               
                    BNE   CODE_23EF31           
                    JMP.w CODE_23F6B3           

CODE_23EF31:        JSR.w CODE_23F22E           
CODE_23EF34:        RTS                         

CODE_23EF35:        LDA.b #$00                  
                    STA.w $1846,x               
CODE_23EF3A:        JSR.w CODE_23F971           
                    JSR.w CODE_23F977           
                    JSR.w CODE_23EA95           
                    INC.w $1835,x               
                    LDA.w $18BB,x               
                    CMP.b #$0E                  
                    BEQ   CODE_23EF5D           
                    INC.w $1835,x               
                    LDA.w $1897,x               
                    AND.b #$03                  
                    AND.w $1866,x               
                    BEQ   CODE_23EF5D           
                    JSR.w CODE_23F41A           
CODE_23EF5D:        LDA.w $1944,x               
                    BEQ   CODE_23EF69           
                    LDA.w $1813,x               
                    CMP.b #$F0                  
                    BCC   CODE_23EF9A           
CODE_23EF69:        LDA.w $1897,x               
                    AND.b #$04                  
                    BEQ   CODE_23EF87           
                    JSR.w CODE_23F197           
                    LDA.w $18BB,x               
                    CMP.b #$0E                  
                    BNE   CODE_23EF84           
                    LDA.w $1835,x               
                    BMI   CODE_23EF84           
                    LDA.b #$DC                  
                    STA.w $1835,x               
CODE_23EF84:        JSR.w CODE_23F1A5           
CODE_23EF87:        LDY.w $18BB,x               
                    LDX.w $ED81,y               
                    LDA.b $15                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$06                  
                    JSR.w CODE_23F256           
                    JSR.w CODE_23F458           
CODE_23EF9A:        RTS                         

CODE_23EF9B:        LDY.w $18E9,x               
                    BEQ   CODE_23EFA6           
                    DEY                         
                    BNE   CODE_23EFD8           
                    JMP.w CODE_23F6B3           

CODE_23EFA6:        LDA.w $1930                 
                    ORA.w $0076                 
                    ORA.w $18CD,x               
                    BNE   CODE_23EFD8           
                    JSR.w CODE_23EA95           
                    LDA.w $18A6,x               
                    BEQ   CODE_23EFD2           
                    JSR.w CODE_23F971           
                    JSR.w CODE_23F977           
                    INC.w $1835,x               
                    INC.w $1835,x               
                    LDA.w $1813,x               
                    CMP.b #$E0                  
                    BCC   CODE_23EFD2           
                    LDA.b #$00                  
                    STA.w $1802,x               
                    RTS                         

CODE_23EFD2:        JSR.w CODE_23F458           
                    INC.w $1857,x               
CODE_23EFD8:        REP   #$30                  
                    LDA.w $18C8                 
                    AND.w #$00FF                
                    CLC                         
                    ADC.w #$0100                
                    TAY                         
                    SEP   #$20                  
                    LDA.w $18E9,x               
                    BEQ   CODE_23F002           
                    LDA.w $0801                 
                    CMP.b #$F0                  
                    BEQ   CODE_23EFFF           
                    LDA.w $0811                 
                    CMP.b #$F0                  
                    BNE   CODE_23F002           
                    LDY.w #$0010                
                    BNE   CODE_23F002           
CODE_23EFFF:        LDY.w #$0000                
CODE_23F002:        LDA.w $1F26                 
                    CMP.b #$0B                  
                    BNE   CODE_23F013           
                    LDA.w $1897,x               
                    AND.b #$03                  
                    BEQ   CODE_23F013           
                    SEP   #$10                  
                    RTS                         

CODE_23F013:        LDA.b #$00                  
                    CMP.w $191E,x               
                    LDA.b #$22                  
                    BCS   CODE_23F01E                   
                    LDA.b #$12                  
CODE_23F01E:        STA.w $0803,y               
                    LDA.w $1813,x               
                    STA.w $0801,y               
                    LDA.w $1824,x               
                    SEC                         
                    SBC.b #$04                  
                    STA.w $0800,y               
                    LDA.w $18E9,x               
                    BEQ   CODE_23F04D           
                    SEP   #$10                  
                    LSR   A                     
                    AND.b #$07                  
                    TAX                         
                    LDA.w $ED5D,x               
                    STA.w $0802,y               
                    LDX.w $190E                 
                    LDA.b #$02                  
                    STA.w $0803,y               
                    REP   #$10                  
                    BRA   CODE_23F065           

CODE_23F04D:        PHY                         
                    SEP   #$10                  
                    LDA.w $1857,x               
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.w $190E                 
                    AND.b #$03                  
                    TAY                         
                    LDA.w $ED59,y               
                    REP   #$10                  
                    PLY                         
                    STA.w $0802,y               
CODE_23F065:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w #$0002                
                    STA.w $0A20,y               
                    SEP   #$30                  
                    RTS                         

CODE_23F074:        LDA.w $1846,x               
                    PHA                         
                    LDA.w $191E,x               
                    BEQ   CODE_23F086           
                    LDY.w $1866,x               
                    LDA.w $ED6A,y               
                    STA.w $1846,x               
CODE_23F086:        JSR.w CODE_23F971           
                    PLA                         
                    STA.w $1846,x               
                    RTS                         

CODE_23F08E:        JSR.w CODE_23F0EF           
                    LDY.w $18E9,x               
                    BEQ   CODE_23F09E           
                    DEY                         
                    BNE   CODE_23F0B0           
                    LDA.b #$E4                  
                    STA.w $1835,x               
CODE_23F09E:        JSR.w CODE_23F074           
                    JSR.w CODE_23F977           
                    LDA.w $1835,x               
                    BMI   CODE_23F0AD           
                    CMP.b #$40                  
                    BCS   CODE_23F0B0                   
CODE_23F0AD:        INC.w $1835,x               
CODE_23F0B0:        JSR.w CODE_23EA95           
                    LDA.w $1897,x               
                    AND.b #$04                  
                    BNE   CODE_23F0C6           
                    LDA.w $1857,x               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1857,x               
                    JMP.w CODE_23F0EC           

CODE_23F0C6:        ASL   A                     
                    STA.w $1857,x               
                    LDA.w $18E9,x               
                    BNE   CODE_23F0D4           
                    LDA.b #$10                  
                    STA.w $18E9,x               
CODE_23F0D4:        JSR.w CODE_23F197           
                    JSR.w CODE_23F1A5           
                    LDA.w $191E,x               
                    BEQ   CODE_23F0EC           
                    LDA.b #$00                  
                    STA.w $18E9,x               
                    STA.w $1835,x               
                    LDA.b $15                   
                    STA.w $1857,x               
CODE_23F0EC:        JMP.w CODE_23F18D           

CODE_23F0EF:        LDA.w $1813,x               
                    CMP.b #$A0                  
                    BCC   CODE_23F128           
                    LDY.w $1866,x               
                    LDA.w $1824,x               
                    CMP.w $ED64,y               
                    BNE   CODE_23F108           
                    LDA.b #$60                  
                    STA.w $191E,x               
                    BNE   CODE_23F128           
CODE_23F108:        CMP.w $ED66,y               
                    BNE   CODE_23F128           
                    LDA.b #$20                  
                    STA.w $1813,x               
                    LDA.w $0783                 
                    AND.b #$01                  
                    TAY                         
                    LDA.w $ED32,y               
                    STA.w $1824,x               
                    EOR.w $1846,x               
                    BPL   CODE_23F126           
                    JSR.w CODE_23F41A           
CODE_23F126:        PLA                         
                    PLA                         
CODE_23F128:        RTS                         

CODE_23F129:        JSR.w CODE_23F0EF           
                    JSR.w CODE_23F074           
                    JSR.w CODE_23F977           
                    LDA.w $1835,x               
                    BMI   CODE_23F13B           
                    CMP.b #$40                  
                    BCS   CODE_23F141                   
CODE_23F13B:        INC.w $1835,x               
                    INC.w $1835,x               
CODE_23F141:        JSR.w CODE_23EA95           
                    LDA.w $1897,x               
                    AND.b #$04                  
                    BNE   CODE_23F151           
                    STA.w $1857,x               
                    JMP.w CODE_23F18D           

CODE_23F151:        LDA.w $1835,x               
                    PHA                         
                    JSR.w CODE_23F197           
                    JSR.w CODE_23F1A5           
                    LDA.w $18BB,x               
                    CMP.b #$02                  
                    BNE   CODE_23F165           
                    INC.w $1857,x               
CODE_23F165:        LDA.w $1931,x               
                    ORA.w $1953,x               
                    BEQ   CODE_23F170           
                    INC.w $1857,x               
CODE_23F170:        INC.w $1857,x               
                    LDA.w $191E,x               
                    BEQ   CODE_23F17B           
                    INC.w $1857,x               
CODE_23F17B:        PLA                         
                    CMP.b #$10                  
                    BCC   CODE_23F18D           
                    LDA.w $196F,x               
                    BEQ   CODE_23F18D           
                    STA.w $1846,x               
                    LDA.b #$00                  
                    STA.w $196F,x               
CODE_23F18D:        JSR.w CODE_23F22E           
                    JSR.w CODE_23F358           
                    JSR.w CODE_23F458           
                    RTS                         

CODE_23F197:        LDA.w $1813,x               
                    AND.b #$F0                  
                    STA.w $1813,x               
                    LDA.b #$00                  
                    STA.w $1835,x               
CODE_23F1A4:        RTS                         

CODE_23F1A5:        LDA.w $1835,x               
                    BMI   CODE_23F1A4           
                    LDA.w $191E,x               
                    BNE   CODE_23F1A4           
                    LDA.w $18FA,x               
                    CMP.b #$C2                  
                    BEQ   CODE_23F1BB           
                    LDA.w $18BA                 
                    BEQ   CODE_23F22D           
CODE_23F1BB:        LDA.b #$02                  
                    STA.w $1200                 
                    LDA.b #$00                  
                    STA.w $18CD,x               
                    STA.w $197C,x               
                    LDA.w $18BB,x               
                    CMP.b #$0C                  
                    BCS   CODE_23F209                   
                    CMP.b #$02                  
                    BNE   CODE_23F1ED           
                    LDA.w $1802,x               
                    CMP.b #$02                  
                    BEQ   CODE_23F1ED           
                    LDA.w $1953,x               
                    BNE   CODE_23F1ED           
                    LDA.b #$01                  
                    STA.w $1953,x               
                    LDA.w $1846,x               
                    JSR.w CODE_23F626           
                    JMP.w CODE_23F204           

CODE_23F1ED:        LDA.w $1802,x               
                    EOR.b #$03                  
                    STA.w $1802,x               
                    CMP.b #$01                  
                    BNE   CODE_23F204           
                    LDY.w $1866,x               
                    DEY                         
                    JSR.w CODE_23EE38           
                    LDA.b #$00                  
                    BEQ   CODE_23F206           
CODE_23F204:        LDA.b #$FF                  
CODE_23F206:        STA.w $18E9,x               
CODE_23F209:        LDA.w $18FA,x               
                    CMP.b #$C2                  
                    BNE   CODE_23F228           
                    LDA.w $1897,x               
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BEQ   CODE_23F228           
                    LDY.b #$01                  
                    ASL   A                     
                    BCC   CODE_23F21F           
                    DEY                         
CODE_23F21F:        LDA.w $1846,x               
                    STA.w $196F,x               
                    JSR.w CODE_23EE38           
CODE_23F228:        LDA.b #$E0                  
                    STA.w $1835,x               
CODE_23F22D:        RTS                         

CODE_23F22E:        LDY.w $18BB,x               
                    CPY.b #$04                  
                    BEQ   CODE_23F239           
                    CPY.b #$05                  
                    BNE   CODE_23F250           
CODE_23F239:        LDA.w $18E9,x               
                    BEQ   CODE_23F250           
                    LSR   A                     
                    LSR   A                     
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $EDBD,y               
                    STA.w $1857,x               
                    LDX.b #$18                  
                    LDA.b #$06                  
                    JMP.w CODE_23F256           

CODE_23F250:        LDX.w $ED81,y               
                    LDA.w $ED6D,y               
CODE_23F256:        STA.b $00                   
                    STX.b $01                   
                    LDX.w $190E                 
                    LDA.w $1944,x               
                    BEQ   CODE_23F26A           
                    LDA.w $1813,x               
                    CMP.b #$F0                  
                    BCS   CODE_23F26A                   
                    RTS                         

CODE_23F26A:        LDY.w $18BB,x               
                    LDA.w $1931,x               
                    BEQ   CODE_23F276           
                    LDA.b #$0C                  
                    STA.b $00                   
CODE_23F276:        LDA.w $1813,x               
                    STA.b $03                   
                    LDY.b #$20                  
                    LDA.w $1802,x               
                    CMP.b #$02                  
                    BCC   CODE_23F299           
                    LDA.w $18BB,x               
                    CMP.b #$03                  
                    BEQ   CODE_23F299           
                    CMP.b #$02                  
                    BCS   CODE_23F297                   
                    INC.b $03                   
                    INC.b $03                   
                    LDA.b #$1A                  
                    STA.b $01                   
CODE_23F297:        LDY.b #$A0                  
CODE_23F299:        LDA.w $191E,x               
                    BEQ   CODE_23F2A6           
                    DEC.b $03                   
                    DEC.b $03                   
                    DEC.b $03                   
                    LDY.b #$10                  
CODE_23F2A6:        LDA.w $1802,x               
                    CMP.b #$01                  
                    BEQ   CODE_23F2B8           
                    LDA.w $18BB,x               
                    CMP.b #$00                  
                    BEQ   CODE_23F2B8           
                    TYA                         
                    ORA.b #$80                  
                    TAY                         
CODE_23F2B8:        STY.b $02                   
                    LDY.w $18C8                 
                    LDA.w $1824,x               
                    CLC                         
                    ADC.w $199B                 
                    STA.w $0900,y               
                    LDA.b #$00                  
                    STA.w $199B                 
                    LDA.b $03                   
                    STA.w $0901,y               
                    LDA.w $18BB,x               
                    CMP.b #$02                  
                    BNE   CODE_23F2EA           
                    LDA.w $1857,x               
                    LDY.b #$00                  
                    AND.b #$08                  
                    BEQ   CODE_23F2E3           
                    LDY.b #$40                  
CODE_23F2E3:        TYA                         
                    LDY.w $18C8                 
                    JMP.w CODE_23F2F4           

CODE_23F2EA:        LDA.w $1866,x               
                    LSR   A                     
                    LDA.b #$00                  
                    BCC   CODE_23F2F4           
                    LDA.b #$40                  
CODE_23F2F4:        ORA.b $00                   
                    ORA.b $02                   
                    STA.w $0903,y               
                    LDA.w $18BB,x               
                    CMP.b #$02                  
                    BNE   CODE_23F311           
                    LDA.w $1953,x               
                    LDX.b $01                   
                    AND.b #$01                  
                    BNE   CODE_23F31A           
                    BEQ   CODE_23F31B           
                    LDA.b #$00                  
                    BRA   CODE_23F314           

CODE_23F311:        LDA.w $1857,x               
CODE_23F314:        LDX.b $01                   
                    AND.b #$08                  
                    BEQ   CODE_23F31B           
CODE_23F31A:        INX                         
CODE_23F31B:        LDA.w $ED95,x               
                    STA.w $0902,y               
                    LDA.w $0900,y               
                    CMP.b #$F1                  
                    BCC   CODE_23F34B           
                    LDA.w $0900,y               
                    STA.w $0904,y               
                    LDA.w $0901,y               
                    STA.w $0905,y               
                    LDA.w $0902,y               
                    STA.w $0906,y               
                    LDA.w $0903,y               
                    STA.w $0907,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$03                  
                    STA.w $0A61,y               
                    BRA   CODE_23F34F           

CODE_23F34B:        TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_23F34F:        LDA.b #$02                  
                    STA.w $0A60,y               
CODE_23F354:        LDX.w $190E                 
                    RTS                         

CODE_23F358:        CPX.b #$00                  
                    BEQ   CODE_23F36F           
                    TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCC   CODE_23F36F           
                    TXA                         
                    TAY                         
                    DEY                         
                    STY.b $0F                   
CODE_23F368:        JSR.w CODE_23F370           
                    DEC.b $0F                   
                    BPL   CODE_23F368           
CODE_23F36F:        RTS                         

CODE_23F370:        LDY.b $0F                   
                    LDA.w $18BB,y               
                    CMP.b #$04                  
                    BEQ   CODE_23F354           
                    CMP.b #$05                  
                    BEQ   CODE_23F354           
                    LDA.w $1802,y               
                    BEQ   CODE_23F354           
                    CMP.b #$03                  
                    BCS   CODE_23F38E                   
                    LDA.w $191E,x               
                    ORA.w $191E,y               
                    BEQ   CODE_23F391           
CODE_23F38E:        JMP.w CODE_23F416           

CODE_23F391:        LDA.w $18DA,x               
                    BEQ   CODE_23F39B           
                    LDA.w $18DA,y               
                    BNE   CODE_23F416           
CODE_23F39B:        LDX.b $0F                   
                    LDY.b #$04                  
                    JSR.w CODE_23F432           
                    LDX.w $190E                 
                    LDY.b #$00                  
                    JSR.w CODE_23F432           
                    JSR.w CODE_23ECC9           
                    BCC   CODE_23F416           
                    LDY.b $0F                   
                    LDA.w $1897,x               
                    AND.w $1897,y               
                    AND.b #$04                  
                    BEQ   CODE_23F416           
                    LDA.w $18CD,x               
                    BNE   CODE_23F3E5           
                    LDA.b #$28                  
                    STA.w $18DA,x               
                    LDA.w $1802,x               
                    CMP.b #$01                  
                    BNE   CODE_23F3D6           
                    LDA.b #$10                  
                    STA.w $18CD,x               
                    LDA.b #$08                  
                    STA.w $1857,x               
CODE_23F3D6:        LDA.w $1824,x               
                    CMP.w $1824,y               
                    ROR   A                     
                    EOR.w $1846,x               
                    BMI   CODE_23F3E5           
                    JSR.w CODE_23F41A           
CODE_23F3E5:        LDA.w $18CD,y               
                    BNE   CODE_23F416           
                    LDA.b #$28                  
                    STA.w $18DA,y               
                    LDA.w $1802,y               
                    CMP.b #$01                  
                    BNE   CODE_23F400           
                    LDA.b #$10                  
                    STA.w $18CD,y               
                    LDA.b #$08                  
                    STA.w $1857,y               
CODE_23F400:        LDA.w $1824,y               
                    CMP.w $1824,x               
                    ROR   A                     
                    EOR.w $1846,y               
                    BMI   CODE_23F411           
                    LDX.b $0F                   
                    JSR.w CODE_23F41A           
CODE_23F411:        LDY.b $0F                   
                    LDX.w $190E                 
CODE_23F416:        LDX.w $190E                 
                    RTS                         

CODE_23F41A:        LDA.w $1846,x               
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    STA.w $1846,x               
                    RTS                         

CODE_23F426:        LDA.w $1822,y               
                    LDY.b #$00                  
                    SBC.w $1824,x               
                    BPL   CODE_23F431           
                    INY                         
CODE_23F431:        RTS                         

CODE_23F432:        LDA.w $1813,x               
                    CLC                         
                    ADC.b #$06                  
                    STA.w $00,y               
                    LDA.b #$04                  
                    STA.w $02,y               
                    LDA.w $1824,x               
                    CLC                         
                    ADC.b #$02                  
                    STA.w $01,y               
                    LDA.w $18BB,x               
                    CMP.b #$0B                  
                    LDA.b #$0C                  
                    BCC   CODE_23F454           
                    LDA.b #$05                  
CODE_23F454:        STA.w $03,y               
CODE_23F457:        RTS                         

CODE_23F458:        LDA.w $1800                 
                    CMP.b #$03                  
                    BEQ   CODE_23F463           
                    CMP.b #$01                  
                    BNE   CODE_23F457           
CODE_23F463:        LDA.w $1801                 
                    CMP.b #$03                  
                    BEQ   CODE_23F46E           
                    CMP.b #$01                  
                    BNE   CODE_23F457           
CODE_23F46E:        TXA                         
                    CLC                         
                    ADC.b $15                   
                    LSR   A                     
                    BCS   CODE_23F457                   
                    LDA.w $18BB,x               
                    CMP.b #$06                  
                    BEQ   CODE_23F481           
                    LDA.w $191E,x               
                    BNE   CODE_23F457           
CODE_23F481:        LDA.b #$01                  
                    STA.b $0F                   
CODE_23F485:        LDX.b $0F                   
                    LDA.w $1800,x               
                    CMP.b #$01                  
                    BNE   CODE_23F493           
                    LDA.w $190A,x               
                    BEQ   CODE_23F496           
CODE_23F493:        JMP.w CODE_23F559           

CODE_23F496:        LDY.b #$04                  
                    JSR.w CODE_23ECAC           
                    LDY.b #$00                  
                    LDX.w $190E                 
                    JSR.w CODE_23F432           
                    JSR.w CODE_23ECC9           
                    LDY.b $0F                   
                    BCC   CODE_23F493           
                    LDA.w $18BB,x               
                    CMP.b #$0C                  
                    BCC   CODE_23F4B4           
                    JMP.w CODE_23F5D3           

CODE_23F4B4:        CMP.b #$0B                  
                    BNE   CODE_23F4FC           
                    LDA.b #$01                  
                    STA.w $1203                 
                    LDA.b #$0F                  
                    STA.w $18E9,x               
                    LDA.w $192E,y               
                    CLC                         
                    ADC.b #$01                  
                    STA.w $192E,y               
                    LDA.w $192E                 
                    CLC                         
                    ADC.w $192F                 
                    CMP.b #$05                  
                    BNE   CODE_23F4F8           
CODE_23F4D6:        LDY.b #$0B                  
                    LDA.b #$FF                  
CODE_23F4DA:        STA.w $18CD,y               
                    DEY                         
                    BPL   CODE_23F4DA           
                    LDY.b #$01                  
                    LDA.w $192E                 
                    CMP.w $192F                 
                    BCC   CODE_23F4EB           
                    INY                         
CODE_23F4EB:        STY.w $078C                 
                    LDA.b #$C0                  
                    STA.w $1930                 
                    LDA.b #$07                  
                    STA.w $1202                 
CODE_23F4F8:        JSR.w CODE_23E161           
                    RTS                         

CODE_23F4FC:        LDA.w $1802,x               
                    CMP.b #$01                  
                    BNE   CODE_23F564           
                    LDY.b #$0B                  
                    LDA.b #$FF                  
CODE_23F507:        STA.w $18CD,y               
                    DEY                         
                    BPL   CODE_23F507           
                    LDA.b $0F                   
                    EOR.b #$01                  
                    TAY                         
                    LDA.b #$FE                  
                    STA.w $1930                 
                    LDY.b $0F                   
                    LDA.b #$02                  
                    STA.w $078C                 
                    CPY.b #$01                  
                    BEQ   CODE_23F527           
                    LDA.b #$01                  
                    STA.w $078C                 
CODE_23F527:        LDA.b #$20                  
                    STA.w $1857,x               
                    STA.w $18E7,y               
                    LDA.b #$09                  
                    STA.w $1202                 
                    LDA.b #$02                  
                    STA.w $1800,y               
                    LDA.b #$D0                  
                    STA.w $1833,y               
                    LDA.w $18BB,x               
                    CMP.b #$04                  
                    BEQ   CODE_23F551           
                    CMP.b #$05                  
                    BEQ   CODE_23F551           
                    JSR.w CODE_23F426           
                    INY                         
                    TYA                         
                    STA.w $1866,x               
CODE_23F551:        LDX.w $190E                 
                    RTS                         

                    DEY                         
                    JSR.w CODE_23EE38           
CODE_23F559:        DEC.b $0F                   
                    BMI   CODE_23F560           
                    JMP.w CODE_23F485           

CODE_23F560:        LDX.w $190E                 
                    RTS                         

CODE_23F564:        LDA.b #$03                  
                    STA.w $1200                 
                    LDA.w $1844,y               
                    LDY.b #$00                  
                    CMP.b #$00                  
                    BMI   CODE_23F573           
                    INY                         
CODE_23F573:        LDA.w $EDCD,y               
                    STA.w $1846,x               
                    LDY.b $0F                   
                    LDA.b #$03                  
                    STA.w $1802,x               
                    LDA.b #$E0                  
                    STA.w $1835,x               
                    LDA.b #$0C                  
                    STA.w $18B3,y               
                    LDA.w $192E,y               
                    CLC                         
                    ADC.b #$01                  
                    STA.w $192E,y               
                    LDA.w $192E                 
                    CLC                         
                    ADC.w $192F                 
                    CMP.b #$05                  
                    BEQ   CODE_23F5C2           
                    CMP.b #$04                  
                    BNE   CODE_23F5C5           
                    INC.w $19A0                 
                    LDX.b #$04                  
CODE_23F5A7:        LDA.w $1802,x               
                    BEQ   CODE_23F5B0           
                    CMP.b #$03                  
                    BCC   CODE_23F5B5           
CODE_23F5B0:        DEX                         
                    BPL   CODE_23F5A7           
                    BMI   CODE_23F5C5           
CODE_23F5B5:        LDA.w $1846,x               
                    JSR.w CODE_23F626           
                    LDA.b #$01                  
                    STA.w $1931,x               
                    BNE   CODE_23F5C5           
CODE_23F5C2:        JSR.w CODE_23F4D6           
CODE_23F5C5:        LDX.w $190E                 
                    LDY.b $0F                   
                    LDA.b #$05                  
                    STA.w $BC,y               
                    JSR.w CODE_23E161           
                    RTS                         

CODE_23F5D3:        LDA.w $18E9,x               
                    BNE   CODE_23F604           
                    JSR.w CODE_23F6B3           
                    LDA.b #$05                  
                    STA.w $1200                 
                    LDY.b $0F                   
                    LDA.b #$40                  
                    STA.w $1989,y               
                    LDY.b #$00                  
                    LDA.b $0F                   
                    BEQ   CODE_23F5EF           
                    LDY.b #$23                  
CODE_23F5EF:        LDA.w $1D9D,y               
                    STA.w $1D9E,y               
                    LDA.w $1D9C,y               
                    STA.w $1D9D,y               
                    LDA.w $18BB,x               
                    SEC                         
                    SBC.b #$0B                  
                    STA.w $1D9C,y               
CODE_23F604:        RTS                         

CODE_23F605:        LDA.w $18CD,x               
                    BNE   CODE_23F684           
                    LDA.b #$00                  
                    STA.w $1857,x               
                    LDA.w $18E9,x               
                    BNE   CODE_23F647           
                    JSR.w CODE_23F22E           
                    LDA.b #$01                  
                    STA.w $1802,x               
                    LDA.w $196F,x               
                    PHA                         
                    LDA.b #$00                  
                    STA.w $196F,x               
                    PLA                         
CODE_23F626:        PHP                         
                    BPL   CODE_23F62E           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_23F62E:        LDY.b #$00                  
                    CMP.b #$0A                  
                    BCC   CODE_23F636           
                    INY                         
                    INY                         
CODE_23F636:        CMP.b #$0C                  
                    BCC   CODE_23F63C           
                    INY                         
                    INY                         
CODE_23F63C:        PLP                         
                    BPL   CODE_23F640           
                    INY                         
CODE_23F640:        LDA.w $EDD5,y               
                    STA.w $1846,x               
                    RTS                         

CODE_23F647:        LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_23F650           
                    DEC.w $18E9,x               
CODE_23F650:        LDA.w $18E9,x               
                    CMP.b #$60                  
                    BCS   CODE_23F66C                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $15                   
                    AND.w $EDCF,y               
                    BEQ   CODE_23F66C           
                    INC.w $199B                 
                    LDA.b #$08                  
                    STA.w $1857,x               
CODE_23F66C:        JSR.w CODE_23EA95           
                    LDA.w $1897,x               
                    AND.b #$04                  
                    BEQ   CODE_23F681           
                    JSR.w CODE_23F197           
                    LDA.b #$00                  
                    STA.w $1846,x               
                    JSR.w CODE_23F1A5           
CODE_23F681:        JSR.w CODE_23F687           
CODE_23F684:        JMP.w CODE_23F18D           

CODE_23F687:        JSR.w CODE_23F971           
                    JSR.w CODE_23F977           
                    LDA.w $1835,x               
                    BMI   CODE_23F696           
                    CMP.b #$40                  
                    BCS   CODE_23F69C                   
CODE_23F696:        INC.w $1835,x               
                    INC.w $1835,x               
CODE_23F69C:        RTS                         

CODE_23F69D:        LDA.w $1931,x               
                    BNE   CODE_23F6A7           
                    LDA.w $18CD,x               
                    BNE   CODE_23F6D5           
CODE_23F6A7:        LDA.w $1813,x               
                    CMP.b #$E0                  
                    BCC   CODE_23F6B9           
                    LDA.w $1944,x               
                    BNE   CODE_23F6B9           
CODE_23F6B3:        LDA.b #$00                  
                    STA.w $1802,x               
                    RTS                         

CODE_23F6B9:        JSR.w CODE_23F687           
                    INC.w $1835,x               
                    LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_23F6D5           
                    LDA.w $1846,x               
                    BEQ   CODE_23F6D5           
                    BMI   CODE_23F6D2           
                    DEC.w $1846,x               
                    DEC.w $1846,x               
CODE_23F6D2:        INC.w $1846,x               
CODE_23F6D5:        JMP.w CODE_23F22E           

CODE_23F6D8:        RTS                         

CODE_23F6D9:        LDA.w $18BA                 
                    STA.b $00                   
                    BEQ   CODE_23F6ED           
                    DEC.w $18BA                 
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA.w $EDDD,y               
                    STA.w $0216                 
CODE_23F6ED:        LDA.w $193E                 
                    CMP.b #$03                  
                    BEQ   CODE_23F6D8           
                    LDA.b #$98                  
                    SEC                         
                    SBC.w $0216                 
                    STA.w $0821                 
                    LDA.b #$78                  
                    STA.w $0820                 
                    LDA.w $193E                 
                    TAY                         
                    LDA.w $EDE1,y               
                    STA.w $0822                 
                    LDA.b #$04                  
                    STA.w $0823                 
                    LDA.b #$02                  
                    STA.w $0A28                 
                    LDX.b #$01                  
CODE_23F718:        LDA.w $193E                 
                    CMP.b #$03                  
                    BEQ   CODE_23F795           
                    LDA.w $1800,x               
                    CMP.b #$01                  
                    BNE   CODE_23F795           
                    LDY.b #$00                  
                    JSR.w CODE_23ECAC           
                    LDA.b #$98                  
                    STA.b $04                   
                    LDA.b #$78                  
                    STA.b $05                   
                    LDA.b #$10                  
                    STA.b $07                   
                    LDY.w $193E                 
                    SEC                         
                    SBC.w $EDE4,y               
                    STA.b $06                   
                    JSR.w CODE_23ECC9           
                    BCC   CODE_23F795           
                    LDY.w $193E                 
                    LDA.w $EDE4,y               
                    STA.w $193F,x               
                    LDA.w $1811,x               
                    SEC                         
                    SBC.w $193F,x               
                    CMP.b #$8D                  
                    BCS   CODE_23F765                   
                    LDA.w $1833,x               
                    BMI   CODE_23F795           
                    LDA.b #$04                  
                    STA.w $1895,x               
                    BEQ   CODE_23F795           
CODE_23F765:        LDA.w $1811,x               
                    CLC                         
                    ADC.w $193F,x               
                    CMP.b #$A1                  
                    BCC   CODE_23F795           
                    LDA.w $1833,x               
                    BPL   CODE_23F795           
                    LDA.b #$09                  
                    STA.w $1203                 
                    INC.w $193E                 
                    LDA.b #$00                  
                    STA.w $1833,x               
                    LDA.b #$A9                  
                    SEC                         
                    SBC.w $193F,x               
                    STA.w $1811,x               
                    LDA.b #$08                  
                    STA.w $18B7,x               
                    LDA.b #$10                  
                    STA.w $18BA                 
CODE_23F795:        DEX                         
                    BMI   CODE_23F79B           
                    JMP.w CODE_23F718           

CODE_23F79B:        RTS                         

CODE_23F79C:        LDA.w $18E9,x               
                    BEQ   CODE_23F7AB           
                    CMP.b #$20                  
                    BNE   CODE_23F7A8           
                    JMP.w CODE_23F6B3           

CODE_23F7A8:        JMP.w CODE_23F22E           

CODE_23F7AB:        JSR.w CODE_23F22E           
                    LDY.w $18C8                 
                    LDA.w $1857,x               
                    AND.b #$10                  
                    BEQ   CODE_23F7C0           
                    LDA.w $0903,y               
                    EOR.b #$C0                  
                    STA.w $0903,y               
CODE_23F7C0:        INC.w $1857,x               
                    INC.w $1857,x               
                    LDY.w $1866,x               
                    LDA.w $1824,x               
                    CMP.w $EDEA,y               
                    BNE   CODE_23F7DD           
                    LDA.w $18BB,x               
                    CMP.b #$04                  
                    BNE   CODE_23F7DD           
                    LDA.b #$40                  
                    STA.w $18E9,x               
CODE_23F7DD:        JSR.w CODE_23F458           
                    JSR.w CODE_23EA95           
                    LDA.w $18BA                 
                    BNE   CODE_23F7EF           
                    LDA.w $18FA,x               
                    CMP.b #$C2                  
                    BNE   CODE_23F7F4           
CODE_23F7EF:        LDA.b #$40                  
                    STA.w $18E9,x               
CODE_23F7F4:        LDA.w $18BB,x               
                    CMP.b #$04                  
                    BNE   CODE_23F81A           
                    JSR.w CODE_23F971           
                    JSR.w CODE_23F977           
                    LDA.w $18A6,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $1835,x               
                    CLC                         
                    ADC.w $EDE7,y               
                    STA.w $1835,x               
                    CMP.w $EDE9,y               
                    BNE   CODE_23F819           
                    INC.w $18A6,x               
CODE_23F819:        RTS                         

CODE_23F81A:        CMP.b #$06                  
                    BEQ   CODE_23F847           
                    LDA.w $1897,x               
                    AND.b #$03                  
                    AND.w $1866,x               
                    BEQ   CODE_23F82B           
                    JSR.w CODE_23F41A           
CODE_23F82B:        LDA.w $1897,x               
                    AND.b #$0C                  
                    AND.w $1962,x               
                    BEQ   CODE_23F840           
                    LDA.w $1835,x               
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    STA.w $1835,x               
CODE_23F840:        JSR.w CODE_23F971           
                    JSR.w CODE_23F977           
                    RTS                         

CODE_23F847:        JSR.w CODE_23F840           
                    INC.w $1835,x               
                    INC.w $1835,x               
                    LDA.w $1813,x               
                    CMP.b #$E0                  
                    BCC   CODE_23F85C           
                    LDA.b #$00                  
                    STA.w $1802,x               
CODE_23F85C:        RTS                         

CODE_23F85D:        LDX.b #$01                  
CODE_23F85F:        STX.w $190E                 
                    TXA                         
                    CLC                         
                    ADC.w $18C9                 
                    TAY                         
                    LDA.w $ED4A,y               
                    STA.w $18C8                 
                    LDA.w $180F,x               
                    BEQ   CODE_23F899           
                    PHA                         
                    CMP.b #$0E                  
                    BNE   CODE_23F87B           
                    JSR.w CODE_23F8F0           
CODE_23F87B:        PLA                         
                    CMP.b #$01                  
                    BNE   CODE_23F896           
                    JSR.w CODE_23F8DD           
                    LDA.b #$00                  
                    STA.b $2E                   
                    LDA.b #$20                  
                    STA.b $2F                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDY.w $1908,x               
                    LDA.b #$C1                  
                    STA.b [$2E],y               
CODE_23F896:        JSR.w CODE_23F89D           
CODE_23F899:        DEX                         
                    BPL   CODE_23F85F           
                    RTS                         

CODE_23F89D:        LDA.w $76                 
                    ORA.w $18CB                 
                    ORA.w $18CC                 
                    ORA.w $1930                 
                    BNE   CODE_23F8BA           
                    DEC.w $180F,x               
                    JSR.w CODE_23F96B           
                    LDA.w $1842,x               
                    CLC                         
                    ADC.b #$05                  
                    STA.w $1842,x               
CODE_23F8BA:        LDY.w $18C8                 
                    LDA.w $1831,x               
                    STA.w $0900,y               
                    LDA.w $1820,x               
                    STA.w $0901,y               
                    LDA.b #$2C                  
                    STA.w $0903,y               
                    LDA.b #$80                  
                    STA.w $0902,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A60,y               
                    RTS                         

CODE_23F8DD:        LDA.b #$02                  
                    STA.b $0C                   
                    LDA.b #$03                  
                    STA.b $0D                   
                    LDA.b #$12                  
                    STA.b $0E                   
                    LDA.b #$13                  
                    STA.b $0F                   
                    JMP.w CODE_23F8FA           

CODE_23F8F0:        LDA.b #$FF                  
                    STA.b $0C                   
                    STA.b $0D                   
                    STA.b $0E                   
                    STA.b $0F                   
CODE_23F8FA:        LDY.w $1600                 
                    LDA.b #$08                  
                    STA.b $03                   
                    LDA.w $1908,x               
                    PHA                         
                    AND.b #$F0                  
                    ASL   A                     
                    ROL.b $03                   
                    ASL   A                     
                    ROL.b $03                   
                    STA.b $04                   
                    PLA                         
                    ASL   A                     
                    AND.b #$1F                  
                    CLC                         
                    ADC.b $04                   
                    STA.w $1603,y               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $160B,y               
                    LDA.b $03                   
                    AND.b #$DF                  
                    STA.w $1602,y               
                    STA.w $160A,y               
                    LDA.b #$00                  
                    STA.w $1604,y               
                    STA.w $160C,y               
                    LDA.b #$03                  
                    STA.w $1605,y               
                    STA.w $160D,y               
                    LDA.b $0C                   
                    STA.w $1606,y               
                    LDA.b $0D                   
                    STA.w $1608,y               
                    LDA.b $0E                   
                    STA.w $160E,y               
                    LDA.b $0F                   
                    STA.w $1610,y               
                    LDA.b #$18                  
                    STA.w $1607,y               
                    STA.w $1609,y               
                    STA.w $160F,y               
                    STA.w $1611,y               
                    LDA.b #$FF                  
                    STA.w $1612,y               
                    STA.w $1613,y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1600                 
                    RTS                         

CODE_23F96B:        TXA                         
                    CLC                         
                    ADC.b #$0F                  
                    BPL   CODE_23F97B           
CODE_23F971:        TXA                         
                    CLC                         
                    ADC.b #$13                  
                    BPL   CODE_23F97B           
CODE_23F977:        TXA                         
                    CLC                         
                    ADC.b #$02                  
CODE_23F97B:        TAX                         
                    JSR.w CODE_23F98F           
                    LDX.w $190E                 
                    RTS                         

CODE_23F983:        TXA                         
                    CLC                         
                    ADC.b #$11                  
                    TAX                         
                    JSR.w CODE_23F98F           
                    LDX.w $190E                 
                    RTS                         

CODE_23F98F:        LDA.w $1833,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $1873,x               
                    STA.w $1873,x               
                    PHP                         
                    LDY.b #$00                  
                    LDA.w $1833,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_23F9AE           
                    ORA.b #$F0                  
                    DEY                         
CODE_23F9AE:        PLP                         
                    ADC.w $1811,x               
                    STA.w $1811,x               
                    ROL   A                     
                    CPX.b #$11                  
                    BCS   CODE_23F9C2                   
                    ROR   A                     
                    TYA                         
                    ADC.w $1942,x               
                    STA.w $1942,x               
CODE_23F9C2:        RTS                         

CODE_23F9C3:        LDA.w $76                 
                    BEQ   CODE_23F9E7           
                    PHB                         
                    PHK                         
                    PLB                         
                    LDY.b #$00                  
                    REP   #$30                  
                    LDA.w #$FA17                
                    STA.w $00                 
                    LDA.w #$FA2B                
                    STA.w $02                 
                    LDA.w #$0028                
                    STA.w $04                 
                    JSR.w CODE_23F9E8           
                    SEP   #$30                  
                    PLB                         
CODE_23F9E7:        RTS                         

CODE_23F9E8:        LDA.b ($00)                 
                    STA.w $0830,y               
                    LDA.b ($02)                 
                    STA.w $0832,y               
                    INC.w $0000                 
                    INC.w $0000                 
                    INC.w $0002                 
                    INC.w $0002                 
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$30                  
                    LDA.b #$00                  
                    STA.w $0A2C,y               
                    REP   #$30                  
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    CPY.w $0004                 
                    BNE   CODE_23F9E8           
                    RTS                         

                    db $6C,$80,$74,$80,$7C,$80,$84,$80
                    db $8C,$80,$6C,$88,$74,$88,$7C,$88
                    db $84,$88,$8C,$88,$2D,$23,$C6,$22
                    db $C2,$22,$2E,$23,$2F,$23,$3D,$23
                    db $D6,$22,$D2,$22,$3E,$23,$3F,$23

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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
