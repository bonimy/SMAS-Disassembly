; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $298000
    fillbyte $FF : fill   $8000

ORG $298000
CODE_298000:        LDA.b $5F,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.b $5F,x                 
                    LDA.b $71,x                 
                    STA.b $68,x                 
                    LDA.b $56,x                 
                    STA.b $4D,x                 
                    RTL                         

CODE_298010:        LDA.w $0691,x               
                    BEQ   CODE_298018           
                    DEC.w $0691,x               
CODE_298018:        LDA.w $0518,x               
                    BNE   CODE_298066           
                    LDA.w $0691,x               
                    BNE   CODE_298066           
                    LDY.b $9E,x                 
                    BPL   CODE_298066           
                    CPY.b #$E0                  
                    BCS   CODE_298066                   
                    LDA.b #$04                  
                    STA.w $0691,x               
                    JSL.l CODE_278A72           
                    LDA.w $2137                 
                    LDA.w $213C                 
                    AND.b #$07                  
                    CLC                         
                    ADC.b $5F,x                 
                    STA.w $05C9,y               
                    LDA.b $44,x                 
                    ADC.b #$00                  
                    STA.w $E2,y               
                    LDA.b $71,x                 
                    CLC                         
                    ADC.b #$0E                  
                    STA.w $05BF,y               
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $1FD7,y               
                    LDA.b #$00                  
                    STA.w $06BD,y               
                    LDA.b #$04                  
                    STA.w $06D1,y               
                    LDA.b #$17                  
                    STA.w $1FC8,y               
CODE_298066:        LDA.w $0518,x               
                    BEQ   CODE_2980B6           
                    STA.w $0651,x               
                    CMP.b #$01                  
                    BNE   CODE_2980B5           
                    LDA.b #$27                  
                    STA.w $1203                 
CODE_298077:        JSL.l CODE_27A27C           
                    LDY.b #$08                  
                    JSL.l CODE_278A74           
                    LDA.b $5F,x                 
                    STA.w $05C9,y               
                    LDA.b $44,x                 
                    STA.w $E2,y               
                    LDA.w $0518,x               
                    BEQ   CODE_29809C           
                    LDA.b $71,x                 
                    STA.w $05BF,y               
                    LDA.b $56,x                 
                    STA.w $1FD7,y               
                    BRA   CODE_2980AB           

CODE_29809C:        LDA.b $71,x                 
                    CLC                         
                    ADC.b #$04                  
                    STA.w $05BF,y               
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $1FD7,y               
CODE_2980AB:        LDA.b #$18                  
                    STA.w $1FC8,y               
                    LDA.b #$18                  
                    STA.w $06D1,y               
CODE_2980B5:        RTL                         

CODE_2980B6:        LDA.b $9C                   
                    BEQ   CODE_2980BD           
                    JMP.w CODE_298143           

CODE_2980BD:        JSL.l CODE_279B6F           
                    LDA.b #$00                  
                    LDY.b $9E,x                 
                    BMI   CODE_2980C9           
                    LDA.b #$80                  
CODE_2980C9:        STA.w $0679,x               
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_2980E1           
                    INC.w $0669,x               
                    LDA.w $0669,x               
                    CMP.b #$03                  
                    BNE   CODE_2980E1           
                    LDA.b #$00                  
                    STA.w $0669,x               
CODE_2980E1:        LDA.b $9E,x                 
                    BMI   CODE_298129           
                    JSL.l CODE_278B93           
                    LDA.w $1F76                 
                    CMP.b #$94                  
                    BNE   CODE_298129           
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b $68,x                 
                    STA.b $00                   
                    LDA.b $56,x                 
                    SBC.b $4D,x                 
                    LSR   A                     
                    ROR.b $00                   
                    LDA.b $00                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $C548,y               
                    BMI   CODE_29810E           
                    STA.w $06A6,x               
                    LDA.b #$80                  
CODE_29810E:        STA.b $9E,x                 
                    LDA.b $71,x                 
                    PHA                         
                    SBC.b #$04                  
                    STA.b $71,x                 
                    JSL.l CODE_298077           
                    PLA                         
                    STA.b $71,x                 
                    LDA.w $0783,x               
                    AND.b #$3F                  
                    ORA.b #$40                  
                    STA.w $0518,x               
                    RTL                         

CODE_298129:        JSL.l CODE_27A7E4           
                    LDA.w $06A6,x               
                    BNE   CODE_29813F           
                    LDA.b $9E,x                 
                    BMI   CODE_29813A           
                    CMP.b #$70                  
                    BCS   CODE_29813F                   
CODE_29813A:        CLC                         
                    ADC.b #$02                  
                    STA.b $9E,x                 
CODE_29813F:        JSL.l CODE_279BC3           
CODE_298143:        JSL.l CODE_279EDD           
                    RTL                         

CODE_298148:        JSL.l CODE_27A837           
                    LDA.w $C55E,y               
                    STA.b $8C,x                 
                    RTL                         

CODE_298152:        LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    STA.w $0669,x               
                    TAY                         
                    LDA.w $C560,y               
                    STA.w $1FE9,x               
                    JSL.l CODE_279EBB           
                    LDA.w $0802,y               
                    AND.b #$3F                  
                    STA.w $0802,y               
                    ORA.b #$C0                  
                    STA.w $0806,y               
                    LDA.w $0661,x               
                    CMP.b #$02                  
                    BNE   CODE_2981AE           
                    LDA.b $9C                   
                    BNE   CODE_2981AE           
                    LDA.b $15                   
                    LSR   A                     
                    NOP                         
                    NOP                         
                    AND.b #$01                  
                    STA.w $0669,x               
                    JSL.l CODE_279BC3           
                    JSL.l CODE_279B6F           
                    JSL.l CODE_27983B           
                    LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_2981B3           
                    JSL.l CODE_278B67           
                    LDA.w $0518,x               
                    BNE   CODE_2981AE           
                    LDA.w $07B5                 
                    CMP.b $4D,x                 
                    BEQ   CODE_2981AE           
                    JSR.w CODE_2981B9           
CODE_2981AE:        LDA.w $07B5                 
                    STA.b $4D,x                 
CODE_2981B3:        LDA.b $A7,x                 
                    AND.b #$03                  
                    BEQ   CODE_2981CA           
CODE_2981B9:        LDA.b #$20                  
                    STA.w $0518,x               
                    JSL.l CODE_279905           
                    JSL.l CODE_27A7EF           
                    JSL.l CODE_27A7EF           
CODE_2981CA:        RTL                         

CODE_2981CB:        JSL.l CODE_279BC3           
                    JSR.w CODE_2981E6           
                    LDA.w $0661,x               
                    CMP.b #$02                  
                    BNE   CODE_2981CA           
                    LDA.b $9C                   
                    BNE   CODE_2981CA           
                    JSL.l CODE_27A7EF           
                    JSL.l CODE_279B6F           
                    RTL                         

CODE_2981E6:        LDA.b #$00                  
                    STA.w $0669,x               
                    STA.w $0679,x               
                    LDA.w $0651,x               
                    STA.w $1CEF                 
                    LDA.b $5F,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$08                  
                    STA.b $5F,x                 
                    LDA.b $44,x                 
                    PHA                         
                    ADC.b #$00                  
                    STA.b $44,x                 
                    ASL.w $0651,x               
                    JSL.l CODE_279F51           
                    PLA                         
                    STA.b $44,x                 
                    PLA                         
                    STA.b $5F,x                 
                    JSL.l CODE_279DC2           
                    LDA.w $0681,x               
                    BEQ   CODE_29821C           
                    BRL   CODE_2982BE           

CODE_29821C:        REP   #$10                  
                    LDA.b $83,x                 
                    STA.b $00                   
                    LDY.b $C6,x                 
                    LDA.w $1CEF                 
                    BMI   CODE_298237           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0811,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0819,y               
CODE_298237:        LDA.w $1CEF                 
                    AND.b #$10                  
                    BNE   CODE_29824C           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0815,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,y               
CODE_29824C:        LDA.b #$2A                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b #$B8                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b #$92                  
                    STA.w $0812,y               
                    INC   A                     
                    STA.w $081A,y               
                    LDA.b #$9A                  
                    STA.w $0816,y               
                    INC   A                     
                    STA.w $081E,y               
                    LDA.b #$2A                  
                    STA.w $0813,y               
                    STA.w $0817,y               
                    STA.w $081B,y               
                    STA.w $081F,y               
                    REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.b $7A,x                 
                    STA.w $0810,y               
                    STA.w $0818,y               
                    CLC                         
                    ADC.b #$18                  
                    STA.w $0814,y               
                    STA.w $081C,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A24,y               
                    STA.w $0A25,y               
                    STA.w $0A26,y               
                    STA.w $0A27,y               
                    SEP   #$10                  
CODE_2982BE:        RTS                         

CODE_2982BF:        LDA.b $71,x                 
                    CLC                         
                    ADC.b #$0F                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.b $56,x                 
                    RTL                         

CODE_2982CD:        DEC.b $71,x                 
                    LDA.b $71,x                 
                    CMP.b #$FF                  
                    BNE   CODE_2982D7           
                    DEC.b $56,x                 
CODE_2982D7:        RTL                         

CODE_2982D8:        JSL.l CODE_279BC3           
                    LDA.b $9C                   
                    BNE   CODE_298301           
                    LDA.w $0518,x               
                    BNE   CODE_298301           
                    INC.b $4D,x                 
                    LDA.b $4D,x                 
                    CMP.b #$06                  
                    BCC   CODE_2982EF           
                    LDA.b #$00                  
CODE_2982EF:        STA.b $4D,x                 
                    TAY                         
                    LDA.w $C597,y               
                    STA.w $0518,x               
                    CPY.b #$03                  
                    BNE   CODE_298301           
                    LDA.b #$17                  
                    STA.w $1203                 
CODE_298301:        LDA.w $0671,x               
                    CMP.b #$9D                  
                    BEQ   CODE_298310           
                    CMP.b #$B2                  
                    BEQ   CODE_29837E           
                    JSR.w CODE_2983F7           
                    RTL                         

CODE_298310:        LDA.b $5F,x                 
                    PHA                         
                    LDY.b $4D,x                 
                    BEQ   CODE_29837A           
                    LDA.w $0565                 
                    LSR   A                     
                    CPY.b #$03                  
                    BEQ   CODE_298322           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
CODE_298322:        LSR   A                     
                    LDA.b #$00                  
                    BCC   CODE_298329           
                    LDA.b #$40                  
CODE_298329:        STA.w $0679,x               
                    CPY.b #$03                  
                    BEQ   CODE_29833E           
                    LDA.b #$04                  
                    LDY.w $0679,x               
                    BEQ   CODE_298339           
                    LDA.b #$FC                  
CODE_298339:        CLC                         
                    ADC.b $5F,x                 
                    STA.b $5F,x                 
CODE_29833E:        LDY.b $4D,x                 
                    LDA.w $C59D,y               
                    PHA                         
                    STA.w $0669,x               
                    JSL.l CODE_279F51           
                    PLA                         
                    CLC                         
                    ADC.b #$06                  
                    STA.w $0669,x               
                    LDA.b $71,x                 
                    PHA                         
                    SEC                         
                    SBC.b #$10                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    PHA                         
                    SBC.b #$00                  
                    STA.b $56,x                 
                    REP   #$20                  
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0010                
                    STA.b $C6,x                 
                    SEP   #$20                  
                    JSL.l CODE_279EBB           
                    PLA                         
                    STA.b $56,x                 
                    PLA                         
                    STA.b $71,x                 
                    JSR.w CODE_2984EA           
CODE_29837A:        PLA                         
                    STA.b $5F,x                 
                    RTL                         

CODE_29837E:        LDA.b #$80                  
                    STA.w $0679,x               
                    LDA.b $5F,x                 
                    PHA                         
                    LDY.b $4D,x                 
                    BEQ   CODE_2983F3           
                    LDA.w $0565                 
                    LSR   A                     
                    CPY.b #$03                  
                    BEQ   CODE_298395           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
CODE_298395:        LSR   A                     
                    LDA.b #$80                  
                    BCC   CODE_29839C           
                    LDA.b #$C0                  
CODE_29839C:        STA.w $0679,x               
                    CPY.b #$03                  
                    BEQ   CODE_2983B3           
                    LDA.w $0679,x               
                    ASL   A                     
                    ASL   A                     
                    LDA.b #$04                  
                    BCC   CODE_2983AE           
                    LDA.b #$FC                  
CODE_2983AE:        CLC                         
                    ADC.b $5F,x                 
                    STA.b $5F,x                 
CODE_2983B3:        LDY.b $4D,x                 
                    LDA.w $C59D,y               
                    PHA                         
                    STA.w $0669,x               
                    JSL.l CODE_279F51           
                    PLA                         
                    CLC                         
                    ADC.b #$06                  
                    STA.w $0669,x               
                    LDA.b $71,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$20                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    PHA                         
                    ADC.b #$00                  
                    STA.b $56,x                 
                    REP   #$20                  
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0010                
                    STA.b $C6,x                 
                    SEP   #$20                  
                    JSL.l CODE_279EBB           
                    PLA                         
                    STA.b $56,x                 
                    PLA                         
                    STA.b $71,x                 
                    JSL.l CODE_279DC2           
                    JSR.w CODE_2984EA           
CODE_2983F3:        PLA                         
                    STA.b $5F,x                 
                    RTL                         

CODE_2983F7:        STZ.b $0F                   
                    LDY.b $4D,x                 
                    BNE   CODE_2983FE           
                    RTS                         

CODE_2983FE:        LDA.w $C59D,y               
                    STA.w $0669,x               
                    JSL.l CODE_279DC2           
                    LDA.b $83,x                 
                    SEC                         
                    SBC.b #$01                  
                    STA.b $00                   
                    LDA.b $7A,x                 
                    STA.b $01                   
CODE_298413:        LDA.b $01                   
                    JSL.l CODE_2989AB           
                    BCC   CODE_29841E           
                    BRL   CODE_2984D8           

CODE_29841E:        REP   #$30                  
                    LDA.b $0F                   
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b $C6,x                 
                    TAY                         
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0565                 
                    STA.b $02                   
                    LDA.b $4D,x                 
                    LSR.b $02                   
                    CMP.b #$03                  
                    BEQ   CODE_298453           
                    LSR.b $02                   
                    LSR.b $02                   
                    LSR.b $02                   
CODE_298453:        LSR.b $02                   
                    PHP                         
                    REP   #$20                  
                    LDA.w $0671,x               
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$22                  
                    CPX.w #$00B1                
                    BNE   CODE_29846A           
                    LDA.b #$62                  
CODE_29846A:        PLP                         
                    BCC   CODE_29846F           
                    ORA.b #$A2                  
CODE_29846F:        STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.b $0F                   
                    STA.b $D8                   
                    STZ.b $D9                   
                    LDA.w $0671,x               
                    CMP.b #$B1                  
                    BNE   CODE_298493           
                    LDA.b #$05                  
                    SEC                         
                    SBC.b $0F                   
                    STA.b $D8                   
CODE_298493:        REP   #$20                  
                    LDA.w $0669,x               
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b $D8                   
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C5A3,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_2984C2           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_2984C2:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $DB                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    LDX.b $9B                   
CODE_2984D8:        LDA.b $01                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $01                   
                    INC.b $0F                   
                    LDA.b $0F                   
                    CMP.b #$06                  
                    BEQ   CODE_2984EA           
                    BRL   CODE_298413           

CODE_2984EA:        LDA.b $4D,x                 
                    CMP.b #$03                  
                    BNE   CODE_2984F4           
                    JSL.l CODE_279B6F           
CODE_2984F4:        RTS                         

CODE_2984F5:        LDY.b #$21                  
                    LDA.b #$10                  
                    BNE   CODE_2984FF           
CODE_2984FB:        LDY.b #$19                  
                    LDA.b #$08                  
CODE_2984FF:        CLC                         
                    ADC.b $71,x                 
                    STA.b $71,x                 
                    LDA.b #$80                  
                    STA.w $0679,x               
                    BNE   CODE_298511           
CODE_29850B:        LDY.b #$21                  
                    BNE   CODE_298511           
CODE_29850F:        LDY.b #$19                  
CODE_298511:        LDA.b $71,x                 
                    STA.b $68,x                 
                    TYA                         
                    STA.w $077B,x               
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0689,x               
                    LDA.b $56,x                 
                    STA.w $1021,x               
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.b $5F,x                 
                    RTL                         

CODE_29852C:        JSL.l CODE_279BC3           
                    LDA.b $4D,x                 
                    LDY.w $0679,x               
                    BPL   CODE_29853A           
                    CLC                         
                    ADC.b #$02                  
CODE_29853A:        AND.b #$03                  
                    BNE   CODE_29854A           
                    JSL.l CODE_279DC2           
                    LDA.b #$01                  
                    STA.w $0651,x               
                    JMP.w CODE_298747           

CODE_29854A:        JSL.l CODE_27A837           
                    LDA.w $0679,x               
                    AND.b #$BF                  
                    ORA.w $C5C3,y               
                    STA.w $0679,x               
                    REP   #$20                  
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0010                
                    STA.b $C6,x                 
                    SEP   #$20                  
                    LDA.w $1FD2,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$01                  
                    STA.w $0669,x               
                    LDA.w $0671,x               
                    SEC                         
                    SBC.b #$A0                  
                    TAY                         
                    LDA.w $C5BB,y               
                    STA.w $0691,x               
                    AND.b #$01                  
                    STA.b $01                   
                    LDA.b $68,x                 
                    SEC                         
                    SBC.b $71,x                 
                    LDY.b $01                   
                    BEQ   CODE_298591           
                    CMP.w $0689,x               
                    BCC   CODE_29859B           
                    BCS   CODE_298595                   
CODE_298591:        CMP.b #$11                  
                    BCS   CODE_29859B                   
CODE_298595:        INC.w $0669,x               
                    INC.w $0669,x               
CODE_29859B:        JSL.l CODE_279F51           
                    JSL.l CODE_27A848           
                    STY.b $00                   
                    STZ.b $01                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.w $0691,x               
                    BMI   CODE_2985E0           
                    LDA.w $0679,x               
                    BMI   CODE_2985CA           
                    LDA.w $07F3,y               
                    AND.b #$BF                  
                    STA.w $07F3,y               
                    STA.w $07FB,y               
                    ORA.b #$40                  
                    STA.w $07F7,y               
                    STA.w $07FF,y               
                    BNE   CODE_29861F           
CODE_2985CA:        LDA.w $0803,y               
                    AND.b #$BF                  
                    STA.w $0803,y               
                    STA.w $080B,y               
                    ORA.b #$40                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    BRL   CODE_29866B           

CODE_2985E0:        LDA.w $0679,x               
                    BMI   CODE_298631           
                    LDX.b $00                   
                    LDA.w $07F3,y               
                    AND.b #$7F                  
                    ORA.w $C5C5,x               
                    AND.b #$CF                  
                    ORA.b #$20                  
                    STA.w $07F3,y               
                    STA.w $07F7,y               
                    STA.w $07FB,y               
                    STA.w $07FF,y               
                    AND.b #$80                  
                    BEQ   CODE_29861F           
                    LDA.w $07F2,y               
                    PHA                         
                    LDA.w $07FA,y               
                    STA.w $07F2,y               
                    PLA                         
                    STA.w $07FA,y               
                    LDA.w $07F6,y               
                    PHA                         
                    LDA.w $07FE,y               
                    STA.w $07F6,y               
                    PLA                         
                    STA.w $07FE,y               
CODE_29861F:        LDA.b #$24                  
                    STA.w $0803,y               
                    STA.w $080B,y               
                    LDA.b #$64                  
                    STA.w $0807,y               
                    STA.w $080F,y               
                    BRA   CODE_29867B           

CODE_298631:        LDX.b $00                   
                    LDA.w $0803,y               
                    AND.b #$7F                  
                    ORA.w $C5C5,x               
                    AND.b #$CF                  
                    ORA.b #$10                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    AND.b #$80                  
                    BNE   CODE_29866B           
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
CODE_29866B:        LDA.b #$A4                  
                    STA.w $07F3,y               
                    STA.w $07FB,y               
                    LDA.b #$E4                  
                    STA.w $07F7,y               
                    STA.w $07FF,y               
CODE_29867B:        REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.b $00                   
                    STZ.b $01                   
                    LDA.b #$FF                  
                    STA.b $DC                   
                    STA.b $DD                   
                    LDA.w $0691,x               
                    AND.b #$01                  
                    BEQ   CODE_2986A1           
                    LDA.w $0689,x               
                    STA.b $00                   
                    LDA.b #$F4                  
                    STA.b $DC                   
CODE_2986A1:        LDA.w $0425                 
                    BEQ   CODE_2986AA           
                    LDA.b #$F9                  
                    STA.b $DC                   
CODE_2986AA:        LDA.w $0543                 
                    STA.b $D8                   
                    LDA.w $0542                 
                    STA.b $D9                   
                    LDA.w $1021,x               
                    XBA                         
                    LDA.b $68,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.b $00                   
                    SEC                         
                    SBC.b $D8                   
                    STA.b $DA                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $D8                   
                    LDA.b $DA                   
                    CMP.w #$00F0                
                    BCC   CODE_2986D5           
                    CMP.b $DC                   
                    BCC   CODE_2986DF           
CODE_2986D5:        SEP   #$20                  
                    STA.w $07E1,y               
                    STA.w $07E9,y               
                    REP   #$20                  
CODE_2986DF:        LDA.b $D8                   
                    CMP.w #$00F0                
                    BCC   CODE_2986EA           
                    CMP.b $DC                   
                    BCC   CODE_2986F2           
CODE_2986EA:        SEP   #$20                  
                    STA.w $07E5,y               
                    STA.w $07ED,y               
CODE_2986F2:        SEP   #$20                  
                    LDA.b #$76                  
                    STA.w $07E2,y               
                    STA.w $07EA,y               
                    STA.w $07E6,y               
                    STA.w $07EE,y               
                    LDA.b #$12                  
                    STA.w $07E3,y               
                    STA.w $07E7,y               
                    STA.w $07EB,y               
                    STA.w $07EF,y               
                    LDA.b $5F,x                 
                    SEC                         
                    SBC.w $0210                 
                    STA.w $07E0,y               
                    STA.w $07E4,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $07E8,y               
                    STA.w $07EC,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0651,x               
                    ROL   A                     
                    ROL   A                     
                    PHP                         
                    AND.b #$01                  
                    STA.w $0A18,y               
                    STA.w $0A19,y               
                    PLP                         
                    ROL   A                     
                    AND.b #$01                  
                    STA.w $0A1A,y               
                    STA.w $0A1B,y               
                    PLY                         
CODE_298747:        SEP   #$10                  
                    LDA.b $9C                   
                    BNE   CODE_298750           
                    JSR.w CODE_298751           
CODE_298750:        RTL                         

CODE_298751:        JSL.l CODE_279B6F           
                    INC.w $1FD2,x               
                    LDA.b $4D,x                 
                    AND.b #$03                  
                    JSL.l CODE_20FB1F           

                    dw CODE_2987F6
                    dw CODE_298768
                    dw CODE_2987A2
                    dw CODE_298783

CODE_298768:        LDA.b $68,x
                    SEC                         
                    SBC.w $077B,x               
                    PHA                         
                    LDA.w $1021,x               
                    SBC.b #$00                  
                    STA.b $00                   
                    PLA                         
                    CMP.b $71,x                 
                    LDA.b $00                   
                    SBC.b $56,x                 
                    BCS   CODE_2987E6                   
                    LDA.b #$F0                  
                    BNE   CODE_29879B           
CODE_298783:        LDA.b $71,x                 
                    CLC                         
                    ADC.b #$01                  
                    PHA                         
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.b $00                   
                    PLA                         
                    CMP.b $68,x                 
                    LDA.b $00                   
                    SBC.w $1021,x               
                    BCS   CODE_2987E6
                    LDA.b #$10                  
CODE_29879B:        STA.b $9E,x                 
                    JSL.l CODE_27A7E4           
                    RTS                         

CODE_2987A2:        LDA.w $0691,x               
                    BPL   CODE_2987C9           
                    LDA.w $0679,x               
                    BMI   CODE_2987C9           
                    LDA.b #$00                  
                    STA.w $1FD2,x               
                    LDA.w $0518,x               
                    LDY.w $0727                 
                    BNE   CODE_2987BE           
                    CMP.b #$28                  
                    BEQ   CODE_2987C6           
                    TYA                         
CODE_2987BE:        CMP.b #$10                  
                    BEQ   CODE_2987C6           
                    CMP.b #$40                  
                    BNE   CODE_2987C9           
CODE_2987C6:        JSR.w CODE_29883B           
CODE_2987C9:        LDA.w $0518,x               
                    BNE   CODE_29883A           
                    LDA.w $0679,x               
                    BPL   CODE_2987E6           
                    LDA.w $0691,x               
                    LSR   A                     
                    BCS   CODE_2987E6                   
                    JSL.l CODE_27A837           
                    LDA.b $0F                   
                    CLC                         
                    ADC.b #$1B                  
                    CMP.b #$37                  
                    BCC   CODE_2987F5           
CODE_2987E6:        INC.b $4D,x                 
                    LDA.b #$30                  
                    LDY.w $0671,x               
                    CPY.b #$A4                  
                    BCC   CODE_2987F2           
                    ASL   A                     
CODE_2987F2:        STA.w $0518,x               
CODE_2987F5:        RTS                         

CODE_2987F6:        LDA.w $0691,x               
                    BPL   CODE_29881D           
                    LDA.w $0679,x               
                    BPL   CODE_29881D           
                    LDA.b #$00                  
                    STA.w $1FD2,x               
                    LDA.w $0518,x               
                    LDY.w $0727                 
                    BNE   CODE_298812           
                    CMP.b #$28                  
                    BEQ   CODE_29881A           
                    TYA                         
CODE_298812:        CMP.b #$10                  
                    BEQ   CODE_29881A           
                    CMP.b #$40                  
                    BNE   CODE_29881D           
CODE_29881A:        JSR.w CODE_29883B           
CODE_29881D:        LDA.w $0518,x               
                    BNE   CODE_29883A           
                    LDA.w $0679,x               
                    BMI   CODE_2987E6           
                    LDA.w $0691,x               
                    LSR   A                     
                    BCS   CODE_2987E6                   
                    JSL.l CODE_27A837           
                    LDA.b $0F                   
                    CLC                         
                    ADC.b #$1B                  
                    CMP.b #$37                  
                    BCS   CODE_2987E6                   
CODE_29883A:        RTS                         

CODE_29883B:        LDY.b #$00                  
                    LDA.w $0679,x               
                    BPL   CODE_298844           
                    LDY.b #$10                  
CODE_298844:        STY.b $00                   
                    LDY.b #$03                  
                    JSL.l CODE_278A74           
                    BNE   CODE_29883A           
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.b #$03                  
                    STA.w $05C9,y               
                    LDA.b $44,x                 
                    ADC.b #$00                  
                    STA.w $E2,y               
                    LDA.b $71,x                 
                    CLC                         
                    ADC.b $00                   
                    STA.w $05BF,y               
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $1FD7,y               
                    LDA.b #$05                  
                    STA.w $1FC8,y               
                    STY.b $00                   
                    JSL.l CODE_27A848           
                    STY.b $05                   
                    JSL.l CODE_27A837           
                    STY.b $06                   
                    LDX.b #$00                  
                    LDA.b $0F                   
                    CLC                         
                    ADC.b #$50                  
                    CMP.b #$A0                  
                    BCC   CODE_29888B           
                    INX                         
CODE_29888B:        LDY.b $00                   
                    LDA.w $C5C7,x               
                    LSR.b $05                   
                    BCC   CODE_298898           
                    JSL.l CODE_27A859           
CODE_298898:        STA.w $05D3,y               
                    LDA.w $C5C9,x               
                    LSR.b $06                   
                    BCC   CODE_2988A6           
                    JSL.l CODE_27A859           
CODE_2988A6:        STA.w $05DD,y               
                    LDA.b #$00                  
                    STA.w $05AB,y               
                    STA.w $05A1,y               
                    LDX.b $9B                   
                    RTS                         

CODE_2988B4:        LDA.b $71,x                 
                    CLC                         
                    ADC.b #$03                  
                    STA.b $71,x                 
CODE_2988BB:        RTL                         

CODE_2988BC:        JSL.l CODE_279BC3           
                    LDA.w $0681,x               
                    BNE   CODE_2988BB           
                    JSL.l CODE_279DC2           
                    LDA.b $83,x                 
                    STA.b $00                   
                    LDA.b $44,x                 
                    XBA                         
                    LDA.b $5F,x                 
                    REP   #$30                  
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    STA.b $DA                   
                    SEP   #$20                  
                    LDY.b $C6,x                 
                    LDA.b $7A,x                 
                    STA.w $0800,y               
                    STA.w $0808,y               
                    STA.w $0804,y               
                    STA.w $080C,y               
                    LDA.b #$D0                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $080A,y               
                    LDA.b #$D2                  
                    STA.w $0806,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b #$2C                  
                    STA.b $02                   
                    LDX.w #$0000                
                    LDA.w $0565                 
                    AND.b #$02                  
                    BEQ   CODE_298913           
                    LDA.b #$AC                  
                    STA.b $02                   
                    INX                         
CODE_298913:        LDA.w $0565                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LDA.b $02                   
                    STA.w $0807,y               
                    STA.w $0803,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    BCC   CODE_298949           
                    ORA.b #$40                  
                    STA.w $0803,y               
                    STA.w $080B,y               
                    LDA.w $0800,y               
                    CLC                         
                    ADC.b #$02                  
                    STA.w $0800,y               
                    STA.w $0808,y               
                    REP   #$20                  
                    LDA.b $D8                   
                    CLC                         
                    ADC.w #$0002                
                    STA.b $D8                   
                    SEP   #$20                  
CODE_298949:        LDA.w $0803,y               
                    AND.b #$80                  
                    BEQ   CODE_29896C           
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
CODE_29896C:        LDA.b $00                   
                    CLC                         
                    ADC.w $C5CB,x               
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    LDA.b $00                   
                    CLC                         
                    ADC.w $C5CD,x               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $080D,y               
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
                    RTL                         

CODE_2989AB:        STX.b $03                   
                    STY.b $02                   
                    STA.b $01                   
                    LDX.b $9B                   
                    LDA.w $0681,x               
                    BNE   CODE_2989E0           
                    LDA.b $01                   
                    SEC                         
                    SBC.b $7A,x                 
                    STA.b $DA                   
                    STZ.b $DB                   
                    LDA.b $5F,x                 
                    STA.b $DC                   
                    LDA.b $44,x                 
                    STA.b $DD                   
                    REP   #$20                  
                    LDA.b $DC                   
                    CLC                         
                    ADC.b $DA                   
                    SEC                         
                    SBC.w $0210                 
                    STA.b $DA                   
                    CMP.w #$0100                
                    BCC   CODE_2989E5           
                    CMP.w #$FFE0                
                    BCS   CODE_2989E5                   
CODE_2989E0:        SEP   #$20                  
                    SEC                         
                    BRA   CODE_2989E8           

CODE_2989E5:        SEP   #$20                  
                    CLC                         
CODE_2989E8:        LDY.b $02                   
                    LDA.b $01                   
                    LDX.b $03                   
                    RTL                         

CODE_2989EF:        DEC.b $71,x                 
                    LDY.b $71,x                 
                    INY                         
                    BNE   CODE_2989F8           
                    DEC.b $56,x                 
CODE_2989F8:        RTL                         

CODE_2989F9:        INC.b $4D,x                 
CODE_2989FB:        JSL.l CODE_27A837           
                    LDA.w $C5CF,y               
                    STA.w $0679,x               
                    RTL                         

CODE_298A06:        LDA.w $0661,x               
                    CMP.b #$02                  
                    BEQ   CODE_298A11           
                    JSR.w CODE_298BF2           
                    RTL                         

CODE_298A11:        LDA.w $0679,x               
                    AND.b #$40                  
                    ORA.b #$10                  
                    STA.w $0679,x               
                    JSL.l CODE_279BC3           
                    LDA.b $44,x                 
                    XBA                         
                    LDA.b $5F,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    BPL   CODE_298A30           
                    EOR.w #$FFFF                
                    INC   A                     
CODE_298A30:        CMP.w #$0140                
                    BCS   CODE_298A9D                   
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0010                
                    STA.b $C6,x                 
                    SEP   #$20                  
                    JSL.l CODE_279EBB           
                    LDA.w $0669,x               
                    CMP.b #$01                  
                    BNE   CODE_298A9D           
                    JSL.l CODE_27A85F           
                    BNE   CODE_298A9D           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b $83,x                 
                    SEC                         
                    SBC.b #$08                  
                    STA.w $07F1,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $07F5,y               
                    LDA.w $0679,x               
                    ASL   A                     
                    ASL   A                     
                    LDA.b #$00                  
                    BCS   CODE_298A6D                   
                    LDA.b #$08                  
CODE_298A6D:        CLC                         
                    ADC.b $7A,x                 
                    STA.w $07F0,y               
                    STA.w $07F4,y               
                    LDA.b #$F2                  
                    STA.w $07F2,y               
                    INC   A                     
                    STA.w $07F6,y               
                    LDA.b #$20                  
                    STA.w $07F3,y               
                    STA.w $07F7,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    SEC                         
                    SBC.w #$0010                
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    PLY                         
CODE_298A9D:        SEP   #$30                  
                    LDA.b $9C                   
                    BNE   CODE_298AA9           
                    JSR.w CODE_298B58           
                    JSR.w CODE_298AAA           
CODE_298AA9:        RTL                         

CODE_298AAA:        LDA.b $68,x                 
                    JSL.l CODE_20FB1F           

                    dw CODE_298ABE
                    dw CODE_298AD7
                    dw CODE_298AE7
                    dw CODE_298AFC
                    dw CODE_298B04
                    dw CODE_298B22
                    dw CODE_298B47

CODE_298ABE:        LDA.w $0518,x               
                    BNE   CODE_298AE6           
                    JSL.l CODE_2989FB           
                    LDA.b $71,x                 
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    SEC                         
                    SBC.b #$06                  
                    STA.b $71,x                 
                    BCS   CODE_298AD7                   
                    DEC.b $56,x                 
CODE_298AD7:        LDA.w $0518,x               
                    BNE   CODE_298AE6           
                    INC.b $68,x                 
                    LDY.b $68,x                 
                    LDA.w $C5D1,y               
                    STA.w $0518,x               
CODE_298AE6:        RTS                         

CODE_298AE7:        LDA.b #$00                  
                    JSR.w CODE_298AFE           
                    LDA.w $0518,x               
                    LSR   A                     
                    BCS   CODE_298AFB                   
                    DEC.b $71,x                 
                    LDY.b $71,x                 
                    INY                         
                    BNE   CODE_298AFB           
                    DEC.b $56,x                 
CODE_298AFB:        RTS                         

CODE_298AFC:        LDA.b #$01                  
CODE_298AFE:        STA.w $0669,x               
                    JMP.w CODE_298AD7           

CODE_298B04:        LDA.b #$02                  
                    JSR.w CODE_298AFE           
                    LDA.w $0518,x               
                    CMP.b #$1F                  
                    BNE   CODE_298B21           
                    LDA.w $0681,x               
                    BNE   CODE_298B21           
                    LDA.w $0651,x               
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BEQ   CODE_298B21           
                    JSR.w CODE_298BA4           
CODE_298B21:        RTS                         

CODE_298B22:        LDA.w $0518,x               
                    BNE   CODE_298B3B           
                    LDA.b $4D,x                 
                    BNE   CODE_298B31           
                    LDA.b #$00                  
                    STA.w $0661,x               
                    RTS                         

CODE_298B31:        LDA.b #$00                  
                    STA.b $68,x                 
                    LDA.b #$40                  
                    STA.w $0518,x               
                    RTS                         

CODE_298B3B:        INC.b $71,x                 
                    BNE   CODE_298B41           
                    INC.b $56,x                 
CODE_298B41:        LDA.b #$00                  
                    STA.w $0669,x               
                    RTS                         

CODE_298B47:        LDA.w $0518,x               
                    BNE   CODE_298B52           
                    LDA.b #$06                  
                    STA.w $0661,x               
                    RTS                         

CODE_298B52:        LDA.b #$03                  
                    STA.w $0669,x               
                    RTS                         

CODE_298B58:        LDA.b $68,x                 
                    CMP.b #$06                  
                    BEQ   CODE_298BA3           
                    INC.w $05F4                 
                    JSL.l CODE_279B6B           
                    DEC.w $05F4                 
                    LDA.w $0797,x               
                    BEQ   CODE_298BA3           
                    LDA.b $9D                   
                    BMI   CODE_298BA3           
                    CMP.b #$10                  
                    BCS   CODE_298B87                   
                    LDA.b #$00                  
                    STA.b $A6                   
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$1F                  
                    STA.b $70                   
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $55                   
                    RTS                         

CODE_298B87:        LDA.b #$06                  
                    STA.b $68,x                 
                    LDA.b #$0C                  
                    STA.w $0518,x               
                    LDA.b #$D0                  
                    STA.b $9D                   
                    LDA.b #$03                  
                    STA.w $1200                 
                    LDA.w $05F4                 
                    INC.w $05F4                 
                    JSL.l CODE_278A8A           
CODE_298BA3:        RTS                         

CODE_298BA4:        JSL.l CODE_278A72           
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$08                  
                    STA.w $05BF,y               
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.w $1FD7,y               
                    LDA.b $5F,x                 
                    STA.w $05C9,y               
                    LDA.b $44,x                 
                    STA.w $E2,y               
                    LDA.w $1A0E                 
                    CMP.b #$0E                  
                    LDA.b #$10                  
                    BCC   CODE_298BCC           
                    LDA.b #$18                  
CODE_298BCC:        STA.b $02                   
                    LDA.w $0679,x               
                    ASL   A                     
                    ASL   A                     
                    STY.b $00                   
                    LDA.b $02                   
                    BCS   CODE_298BDB                   
                    LDA.b #$F0                  
CODE_298BDB:        STA.w $05DD,y               
                    LDA.w $0783,x               
                    AND.b #$07                  
                    TAY                         
                    LDA.w $C5D7,y               
                    LDY.b $00                   
                    STA.w $05D3,y               
                    LDA.b #$0A                  
                    STA.w $1FC8,y               
                    RTS                         

CODE_298BF2:        LDY.b #$02                  
                    LDA.w $0565                 
                    AND.b #$10                  
                    BEQ   CODE_298BFC           
                    INY                         
CODE_298BFC:        TYA                         
                    STA.w $0669,x               
                    LDA.b #$10                  
                    STA.w $0679,x               
                    JSL.l CODE_279EE1           
                    RTS                         

CODE_298C0A:        LDA.b $71,x                 
                    SEC                         
                    SBC.b #$01                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $56,x                 
CODE_298C17:        RTL                         

CODE_298C18:        JSL.l CODE_279BC3           
                    JSL.l CODE_279EBB           
                    LDA.w $0651,x               
                    PHA                         
                    ASL   A                     
                    ASL   A                     
                    STA.w $0651,x               
                    LDA.b $5F,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.b $5F,x                 
                    LDA.b $44,x                 
                    PHA                         
                    ADC.b #$00                  
                    STA.b $44,x                 
                    REP   #$20                  
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.w #$0010                
                    STA.b $C6,x                 
                    SEP   #$20                  
                    JSL.l CODE_279EBB           
                    PLA                         
                    STA.b $44,x                 
                    PLA                         
                    STA.b $5F,x                 
                    PLA                         
                    STA.w $0651,x               
                    JSL.l CODE_279DC2           
                    LDA.b $9C                   
                    BNE   CODE_298C17           
                    LDA.b $8C,x                 
                    BEQ   CODE_298C84           
                    BPL   CODE_298C64           
                    JSL.l CODE_27A859           
CODE_298C64:        ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b #$60                  
                    ADC.w $1021,x               
                    STA.w $1021,x               
                    BCC   CODE_298C84           
                    LDA.b $8C,x                 
                    ASL   A                     
                    LDA.b #$01                  
                    BCC   CODE_298C7B           
                    LDA.b #$FF                  
CODE_298C7B:        CLC                         
                    ADC.w $0669,x               
                    AND.b #$03                  
                    STA.w $0669,x               
CODE_298C84:        LDA.b $68,x                 
                    BEQ   CODE_298C8C           
                    JSR.w CODE_298D18           
                    RTL                         

CODE_298C8C:        LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_298C9E           
                    LDA.b $8C,x                 
                    BEQ   CODE_298C9E           
                    BPL   CODE_298C9C           
                    INC.b $8C,x                 
                    INC.b $8C,x                 
CODE_298C9C:        DEC.b $8C,x                 
CODE_298C9E:        JSR.w CODE_298D1D           
                    JSL.l CODE_278B93           
                    LDA.w $1F77                 
                    CMP.b #$9D                  
                    BNE   CODE_298CB2           
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    INC.b $A7,x                 
CODE_298CB2:        JSL.l CODE_298D58           
                    JSL.l CODE_27A7EF           
                    LDA.b $8C,x                 
                    BEQ   CODE_298CC3           
                    LDA.w $0518,x               
                    BNE   CODE_298D17           
CODE_298CC3:        JSL.l CODE_279DC2           
                    JSL.l CODE_27A312           
                    BCC   CODE_298D17           
                    LDA.b $82                   
                    ADC.b #$17                  
                    CMP.b $83,x                 
                    BCS   CODE_298CF7                   
                    LDA.b $9D                   
                    BMI   CODE_298CF6           
                    LDA.b $A7,x                 
                    BNE   CODE_298CE1           
                    LDA.b #$05                  
                    STA.b $8C,x                 
CODE_298CE1:        LDA.b #$10                  
                    STA.w $0518,x               
                    STA.w $101F                 
                    LDA.b #$00                  
                    STA.b $9D                   
                    STA.b $A6                   
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$1E                  
                    STA.b $70                   
CODE_298CF6:        RTL                         

CODE_298CF7:        LDA.b #$FC                  
                    LDY.b $BB                   
                    BNE   CODE_298CFF           
                    LDA.b #$0C                  
CODE_298CFF:        CLC                         
                    ADC.b $82                   
                    CMP.b $83,x                 
                    BCC   CODE_298D13           
                    LDA.b $9D                   
                    BPL   CODE_298D12           
                    LDA.b #$FB                  
                    STA.b $8C,x                 
                    LDA.b #$10                  
                    STA.b $9D                   
CODE_298D12:        RTL                         

CODE_298D13:        LDA.b #$00                  
                    STA.b $8B                   
CODE_298D17:        RTL                         

CODE_298D18:        JSL.l CODE_27983B           
                    RTS                         

CODE_298D1D:        LDA.b #$E2                  
                    LDY.b $8C,x                 
                    BEQ   CODE_298D57           
                    BPL   CODE_298D27           
                    LDA.b #$1E                  
CODE_298D27:        LDY.b #$00                  
                    CMP.b #$00                  
                    BPL   CODE_298D2E           
                    DEY                         
CODE_298D2E:        STA.b $00                   
                    LDA.b $5F,x                 
                    PHA                         
                    CLC                         
                    ADC.b $00                   
                    STA.b $5F,x                 
                    LDA.b $44,x                 
                    PHA                         
                    TYA                         
                    ADC.b $44,x                 
                    STA.b $44,x                 
                    JSL.l CODE_278B93           
                    PLA                         
                    STA.b $44,x                 
                    PLA                         
                    STA.b $5F,x                 
                    LDA.w $1F77                 
                    CMP.b #$9D                  
                    BEQ   CODE_298D57           
                    CMP.b #$81                  
                    BEQ   CODE_298D57           
                    INC.b $68,x                 
CODE_298D57:        RTS                         

CODE_298D58:        LDA.w $0681,x               
                    BNE   CODE_298DCE           
                    LDA.w $0651,x               
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BEQ   CODE_298DCE           
                    JSL.l CODE_27A439           
                    TXA                         
                    BEQ   CODE_298DCE           
                    DEX                         
CODE_298D6E:        LDA.w $0661,x               
                    CMP.b #$02                  
                    BNE   CODE_298DC9           
                    LDA.w $0671,x               
                    CMP.b #$AE                  
                    BNE   CODE_298DC9           
                    LDA.w $0681,x               
                    BNE   CODE_298DC9           
                    LDA.w $0651,x               
                    AND.b #$C0                  
                    CMP.b #$C0                  
                    BEQ   CODE_298DC9           
                    JSL.l CODE_279DC2           
                    JSL.l CODE_27A413           
                    JSL.l CODE_27A45F           
                    BCC   CODE_298DC9           
                    LDY.b $9B                   
                    LDA.b $5F,x                 
                    SEC                         
                    SBC.w $005F,y               
                    PHA                         
                    LDA.b $44,x                 
                    SBC.w $0044,y               
                    STA.b $00                   
                    ROL.b $01                   
                    PLA                         
                    ADC.b #$80                  
                    LDA.b $00                   
                    ADC.b #$00                  
                    BNE   CODE_298DC9           
                    LSR.b $01                   
                    LDA.b #$FF                  
                    BCS   CODE_298DBB                   
                    LDA.b #$01                  
CODE_298DBB:        STX.b $0F                   
                    LDX.b $9B                   
                    STA.b $8C,x                 
                    PHA                         
                    LDX.b $0F                   
                    PLA                         
                    EOR.b #$FF                  
                    STA.b $8C,x                 
CODE_298DC9:        DEX                         
                    BPL   CODE_298D6E           
                    LDX.b $9B                   
CODE_298DCE:        RTL                         

CODE_298DCF:        LDA.w $0661,x               
                    CMP.b #$02                  
                    BEQ   CODE_298DDF           
                    LDA.b #$01                  
                    STA.w $0669,x               
                    JSR.w CODE_298F21           
                    RTL                         

CODE_298DDF:        JSL.l CODE_279BC3           
                    LDA.w $1021,x               
                    BEQ   CODE_298DEC           
                    JSL.l CODE_279B6F           
CODE_298DEC:        LDA.b $9C                   
                    BNE   CODE_298E04           
                    LDY.b #$00                  
                    BNE   CODE_298E0B           
                    LDA.w $0781                 
                    BPL   CODE_298DFA           
                    DEY                         
CODE_298DFA:        CLC                         
                    ADC.b $5F,x                 
                    STA.b $5F,x                 
                    TYA                         
                    ADC.b $44,x                 
                    STA.b $44,x                 
CODE_298E04:        JSR.w CODE_298F21           
                    LDA.b $9C                   
                    BNE   CODE_298E1B           
CODE_298E0B:        LDY.b #$00                  
                    LDA.b $15                   
                    AND.b #$0C                  
                    BEQ   CODE_298E14           
                    INY                         
CODE_298E14:        TYA                         
                    STA.w $0669,x               
                    JSR.w CODE_298E1C           
CODE_298E1B:        RTL                         

CODE_298E1C:        LDA.w $1021,x               
                    JSL.l CODE_20FB1F           

                    dw CODE_298E31
                    dw CODE_298E46
                    dw CODE_298ED9
                    dw CODE_298E76
                    dw CODE_298E5F
                    dw CODE_298ED9
                    dw CODE_298EAA

CODE_298E31:        LDA.b #$00
                    STA.w $0669,x               
                    LDA.b $44,x                 
                    CMP.b #$05                  
                    BNE   CODE_298E45           
                    LDA.b $5F,x                 
                    CMP.b #$B0                  
                    BCC   CODE_298E45           
                    JSR.w CODE_298EBE           
CODE_298E45:        RTS                         

CODE_298E46:        JSR.w CODE_298EEA           
                    LDA.w $0518,x               
                    BNE   CODE_298E5E           
                    INC.w $1021,x               
                    LDA.b #$40                  
                    STA.b $9E,x                 
                    LDA.b #$14                  
                    STA.b $8C,x                 
CODE_298E59:        LDA.b #$10                  
                    STA.w $0518,x               
CODE_298E5E:        RTS                         

CODE_298E5F:        JSR.w CODE_298EEA           
                    LDA.w $0518,x               
                    BNE   CODE_298E75           
                    INC.w $1021,x               
                    LDA.b #$40                  
                    STA.b $9E,x                 
                    LDA.b #$EC                  
                    STA.b $8C,x                 
                    JMP.w CODE_298E59           

CODE_298E75:        RTS                         

CODE_298E76:        JSL.l CODE_27A7EF           
                    JSL.l CODE_27A7E4           
                    DEC.b $9E,x                 
                    LDA.b $71,x                 
                    CMP.b #$10                  
                    BCS   CODE_298EA9                   
                    LDA.b #$10                  
                    STA.b $71,x                 
                    INC.w $1021,x               
                    LDA.b #$01                  
                    STA.w $077B,x               
                    STA.w $0776,x               
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    LDA.b #$C0                  
                    STA.b $9E,x                 
CODE_298E9D:        LDA.w $0783,x               
                    AND.b #$03                  
                    TAY                         
                    LDA.w $C5EF,y               
                    STA.w $0518,x               
CODE_298EA9:        RTS                         

CODE_298EAA:        JSL.l CODE_27A7EF           
                    JSL.l CODE_27A7E4           
                    DEC.b $9E,x                 
                    LDA.b $71,x                 
                    CMP.b #$10                  
                    BCS   CODE_298ED8                   
                    LDA.b #$10                  
                    STA.b $71,x                 
CODE_298EBE:        LDA.b #$01                  
                    STA.w $1021,x               
                    LDA.b #$01                  
                    STA.w $077B,x               
                    LDA.b #$00                  
                    STA.w $0776,x               
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    LDA.b #$C0                  
                    STA.b $9E,x                 
                    JMP.w CODE_298E9D           

CODE_298ED8:        RTS                         

CODE_298ED9:        LDA.w $0518,x               
                    BNE   CODE_298EE9           
                    INC.w $1021,x               
                    LDY.w $1021,x               
                    LDA.b #$20                  
                    STA.w $0518,x               
CODE_298EE9:        RTS                         

CODE_298EEA:        JSL.l CODE_27A7EF           
                    JSL.l CODE_27A7E4           
                    LDA.w $0776,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.b $8C,x                 
                    CMP.w $C5EB,y               
                    BNE   CODE_298F03           
                    INC.w $0776,x               
                    INY                         
CODE_298F03:        CLC                         
                    ADC.w $C5E7,y               
                    STA.b $8C,x                 
                    LDA.w $077B,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.b $9E,x                 
                    CMP.w $C5EB,y               
                    BNE   CODE_298F1A           
                    INC.w $077B,x               
                    INY                         
CODE_298F1A:        CLC                         
                    ADC.w $C5E7,y               
                    STA.b $9E,x                 
CODE_298F20:        RTS                         

CODE_298F21:        LDA.w $0679,x               
                    AND.b #$CF                  
                    ORA.b #$20                  
                    LDY.w $1021,x               
                    BNE   CODE_298F31           
                    AND.b #$CF                  
                    ORA.b #$10                  
CODE_298F31:        STA.w $0679,x               
                    LDA.w $0651,x               
                    STA.w $1CEF                 
                    LDA.b $5F,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$08                  
                    STA.b $5F,x                 
                    LDA.b $44,x                 
                    PHA                         
                    ADC.b #$00                  
                    STA.b $44,x                 
                    ASL.w $0651,x               
                    JSL.l CODE_279EE1           
                    PLA                         
                    STA.b $44,x                 
                    PLA                         
                    STA.b $5F,x                 
                    JSL.l CODE_279DC2           
                    LDA.b $C6,x                 
                    STA.b $D8                   
                    LDA.b $C7,x                 
                    STA.b $D9                   
                    LDA.w $0681,x               
                    BNE   CODE_298F20           
                    LDA.b $83,x                 
                    STA.b $00                   
                    LDA.w $0669,x               
                    TAX                         
                    REP   #$10                  
                    LDY.b $D8                   
                    LDA.w $1CEF                 
                    BMI   CODE_298F87           
                    LDA.b $00                   
                    CLC                         
                    ADC.w $C5F5,x               
                    STA.w $0811,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0819,y               
CODE_298F87:        LDA.w $1CEF                 
                    AND.b #$10                  
                    BNE   CODE_298F9D           
                    LDA.b $00                   
                    CLC                         
                    ADC.w $C5F5,x               
                    STA.w $0815,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,y               
CODE_298F9D:        LDA.w $C5F3,x               
                    STA.w $0812,y               
                    STA.w $0816,y               
                    INC   A                     
                    STA.w $081A,y               
                    STA.w $081E,y               
                    LDA.w $0803,y               
                    AND.b #$7F                  
                    STA.b $0E                   
                    STA.w $0813,y               
                    STA.w $081B,y               
                    LDA.w $0807,y               
                    AND.b #$7F                  
                    STA.b $0F                   
                    STA.w $0817,y               
                    STA.w $081F,y               
                    REP   #$20                  
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.b $7A,x                 
                    STA.b $01                   
                    STA.w $0810,y               
                    STA.w $0818,y               
                    CLC                         
                    ADC.b #$18                  
                    STA.w $0814,y               
                    STA.w $081C,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A24,y               
                    STA.w $0A25,y               
                    STA.w $0A26,y               
                    STA.w $0A27,y               
                    SEP   #$10                  
                    LDA.w $0669,x               
                    BEQ   CODE_299076           
                    JSL.l CODE_27A19D           
                    REP   #$10                  
                    LDY.b $C6,x                 
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.b $0E                   
                    ORA.b #$80                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    LDA.b #$B0                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $080D,y               
                    LDA.b $01                   
                    CLC                         
                    ADC.b #$18                  
                    STA.w $0808,y               
                    STA.w $080C,y               
                    LDA.b $0F                   
                    ORA.b #$80                  
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b #$B0                  
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
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
CODE_299076:        RTS                         

CODE_299077:        JSR.w CODE_29915E           
                    LDA.b $83,x                 
                    CMP.b #$C8                  
                    BCC   CODE_299086           
CODE_299080:        LDA.b #$00                  
                    STA.w $0661,x               
CODE_299085:        RTL                         

CODE_299086:        LDA.b $9C                   
                    BNE   CODE_299085           
                    LDA.w $0565                 
                    AND.b #$03                  
                    BNE   CODE_299095           
                    DEC.b $68,x                 
                    BEQ   CODE_299080           
CODE_299095:        JSL.l CODE_279BC3           
                    LDY.b $4D,x                 
                    LDA.w $C5F7,y               
                    STA.b $8C,x                 
                    LDA.w $C5FB,y               
                    STA.b $9E,x                 
                    JSL.l CODE_27A7E4           
                    JSL.l CODE_27A7EF           
                    LDA.b #$00                  
                    STA.b $44,x                 
                    JSL.l CODE_27A312           
                    BCC   CODE_29912B           
                    LDA.b $82                   
                    CLC                         
                    ADC.b #$18                  
                    CMP.b $83,x                 
                    BCS   CODE_29912C                   
                    LDA.b $9D                   
                    BMI   CODE_29912B           
                    LDY.w $0671,x               
                    CPY.b #$A9                  
                    BNE   CODE_2990E2           
                    CMP.b #$10                  
                    BCC   CODE_2990E2           
                    LDA.b #$23                  
                    STA.w $1203                 
                    LDA.b #$08                  
                    STA.w $0518,x               
                    LDA.b $4D,x                 
                    CLC                         
                    ADC.b #$01                  
                    AND.b #$03                  
                    STA.b $4D,x                 
CODE_2990E2:        STZ.b $9D                   
                    STZ.b $A6                   
                    LDA.b #$01                  
                    STA.w $07BD                 
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$1F                  
                    STA.b $70                   
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $55                   
                    LDY.b #$00                  
                    LDA.w $074D                 
                    BPL   CODE_299100           
                    DEY                         
CODE_299100:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    TYA                         
                    ADC.b $43                   
                    STA.b $43                   
                    JSR.w CODE_299282           
                    BCC   CODE_29912B           
                    STA.b $00                   
                    LDA.b #$00                  
                    STA.w $0661,x               
                    LDY.w $0560                 
                    LDA.w $AF3A,y               
                    CMP.b #$FF                  
                    BEQ   CODE_29912B           
                    SEC                         
                    SBC.b $00                   
                    CMP.b #$02                  
                    BCS   CODE_29912B                   
                    JSL.l CODE_27A4C6           
CODE_29912B:        RTL                         

CODE_29912C:        LDA.b #$F8                  
                    LDY.b $BB                   
                    BNE   CODE_299134           
                    LDA.b #$08                  
CODE_299134:        CLC                         
                    ADC.b $82                   
                    CMP.b $83,x                 
                    BCC   CODE_299144           
                    LDA.b $9D                   
                    BPL   CODE_299143           
                    LDA.b #$10                  
                    STA.b $9D                   
CODE_299143:        RTL                         

CODE_299144:        LDA.b $8C,x                 
                    BEQ   CODE_299159           
                    LDA.b $5E                   
                    SEC                         
                    SBC.b $5F,x                 
                    EOR.b $8C,x                 
                    BMI   CODE_299156           
                    LDA.b $8C,x                 
                    STA.b $8B                   
                    RTL                         

CODE_299156:        STZ.b $8B                   
                    RTL                         

CODE_299159:        JSL.l CODE_299912           
                    RTL                         

CODE_29915E:        JSL.l CODE_279DC2           
                    LDA.b #$00                  
                    STA.w $0651,x               
                    LDA.b $68,x                 
                    CMP.b #$20                  
                    BCS   CODE_29917C                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $0565                 
                    AND.w $C618,y               
                    BNE   CODE_29917C           
                    BRL   CODE_29922A           

CODE_29917C:        LDA.b $7A,x                 
                    STA.b $01                   
                    LDY.b $4D,x                 
                    LDA.w $0518,x               
                    BEQ   CODE_299189           
                    LDY.b #$04                  
CODE_299189:        STY.b $02                   
                    STZ.b $03                   
                    LDA.b $C6,x                 
                    STA.b $DA                   
                    LDA.b $C7,x                 
                    STA.b $DB                   
                    JSL.l CODE_27A19D           
                    LDA.b $C6,x                 
                    STA.b $DC                   
                    LDA.b $C7,x                 
                    STA.b $DD                   
                    REP   #$10                  
                    LDY.b $DA                   
                    STZ.b $D8                   
                    STZ.b $D9                   
CODE_2991A9:        LDA.b $83,x                 
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.b $01                   
                    REP   #$20                  
                    LDA.b $02                   
                    ASL   A                     
                    ASL   A                     
                    ADC.b $D8                   
                    TAX                         
                    SEP   #$20                  
                    LDA.w $C5FF,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDX.b $02                   
                    LDA.w $C613,x               
                    CPX.w #$0004                
                    BNE   CODE_2991E9           
                    LDX.b $D8                   
                    CPX.w #$0002                
                    BNE   CODE_2991E9           
                    LDA.b #$44                  
CODE_2991E9:        ORA.b #$20                  
                    STA.w $0803,y               
                    STA.w $0807,y               
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
                    PLY                         
                    PHY                         
                    JSR.w CODE_29922B           
                    PLY                         
                    REP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.w #$0008                
                    TAY                         
                    LDA.b $DC                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $DC                   
                    LDA.b $9B                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    INC.b $D8                   
                    LDA.b $D8                   
                    CMP.b #$04                  
                    BNE   CODE_2991A9           
                    SEP   #$10                  
CODE_29922A:        RTS                         

CODE_29922B:        LDA.w $0425                 
                    BEQ   CODE_29922A           
                    LDA.w $0800,y               
                    CMP.b #$F8                  
                    BCC   CODE_29922A           
                    LDX.b $DC                   
                    LDA.w $0800,y               
                    STA.w $0800,x               
                    STA.w $0804,x               
                    LDA.w $0801,y               
                    STA.w $0801,x               
                    LDA.w $0805,y               
                    STA.w $0805,x               
                    LDA.w $0802,y               
                    STA.w $0802,x               
                    LDA.w $0806,y               
                    STA.w $0806,x               
                    LDA.w $0803,y               
                    STA.w $0803,x               
                    LDA.w $0807,y               
                    STA.w $0807,x               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,x               
                    STA.w $0A21,x               
                    INC   A                     
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    RTS                         

CODE_299282:        LDA.b #$06                  
                    LDY.w $056F                 
                    BNE   CODE_29928D           
                    LDY.b $BB                   
                    BNE   CODE_29928F           
CODE_29928D:        LDA.b #$12                  
CODE_29928F:        ADC.b $70                   
                    AND.b #$F0                  
                    STA.b $02                   
                    LDA.b $55                   
                    ADC.b #$00                  
                    CMP.b #$10                  
                    BCS   CODE_2992C6                   
                    ADC.b #$20                  
                    STA.b $01                   
                    STA.b $D9                   
                    LDA.b $5E                   
                    CLC                         
                    ADC.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    STA.b $00                   
                    STA.b $D8                   
                    LDA.b #$7E                  
                    STA.b $DA                   
                    LDY.b #$00                  
                    LDA.b [$D8],y               
                    PHA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    TAY                         
                    PLA                         
                    CMP.w $1E9A,y               
                    RTS                         

CODE_2992C6:        CLC                         
                    RTS                         

CODE_2992C8:        LDA.b #$00                  
                    LDY.b $8C,x                 
                    BMI   CODE_2992D0           
                    LDA.b #$40                  
CODE_2992D0:        STA.w $0679,x               
                    RTS                         

CODE_2992D4:        JSL.l CODE_27A837           
                    LDA.w $C61C,y               
                    STA.b $8C,x                 
CODE_2992DD:        RTL                         

CODE_2992DE:        LDA.b $8C,x                 
                    BPL   CODE_2992E6           
                    JSL.l CODE_27A859           
CODE_2992E6:        CMP.b #$10                  
                    LDA.b #$01                  
                    BCC   CODE_2992EE           
                    ADC.b #$00                  
CODE_2992EE:        STA.w $1FE9,x               
                    JSL.l CODE_279BC3           
                    JSR.w CODE_2992C8           
                    LDA.w $1FD2,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$01                  
                    STA.w $0669,x               
                    JSL.l CODE_279EBB           
                    LDA.b $9C                   
                    BNE   CODE_2992DD           
                    INC.w $1FD2,x               
                    JSL.l CODE_27A7E4           
                    JSL.l CODE_27A7EF           
                    LDA.w $0797,x               
                    STA.w $1CEF                 
                    INC.w $05F4                 
                    JSL.l CODE_279B6F           
                    DEC.w $05F4                 
                    LDA.w $0797,x               
                    BEQ   CODE_299397           
                    CMP.w $1CEF                 
                    BEQ   CODE_29933A           
                    LDA.b #$0C                  
                    LDY.b $BB                   
                    BEQ   CODE_299338           
                    LDA.b #$14                  
CODE_299338:        STA.b $9E,x                 
CODE_29933A:        INC.w $1FD2,x               
                    INC.w $1FD2,x               
                    LDA.b #$F4                  
                    LDY.b $BB                   
                    BNE   CODE_299348           
                    LDA.b #$F0                  
CODE_299348:        CMP.b $9E,x                 
                    BPL   CODE_299350           
                    DEC.b $9E,x                 
                    DEC.b $9E,x                 
CODE_299350:        INC.b $9E,x                 
                    LDA.b #$05                  
                    STA.w $101F                 
                    LDA.b $9D                   
                    BMI   CODE_299396           
                    LDY.b #$00                  
                    LDA.w $074D                 
                    BPL   CODE_299363           
                    DEY                         
CODE_299363:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    TYA                         
                    ADC.b $43                   
                    STA.b $43                   
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$1B                  
                    STA.b $70                   
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $55                   
                    LDA.b #$00                  
                    STA.b $9D                   
                    STA.b $A6                   
                    LDA.b $17                   
                    AND.b #$03                  
                    BNE   CODE_299396           
                    JSL.l CODE_279DD9           
                    LDA.b $8B                   
                    BEQ   CODE_299396           
                    BPL   CODE_299394           
                    INC.b $8B                   
                    INC.b $8B                   
CODE_299394:        DEC.b $8B                   
CODE_299396:        RTL                         

CODE_299397:        LDA.b $9E,x                 
                    BEQ   CODE_2993A3           
                    BPL   CODE_2993A1           
                    INC.b $9E,x                 
                    INC.b $9E,x                 
CODE_2993A1:        DEC.b $9E,x                 
CODE_2993A3:        RTL                         

CODE_2993A4:        LDA.b #$02                  
                    STA.w $0679,x               
CODE_2993A9:        LDA.b #$00                  
                    STA.b $94,x                 
                    STA.b $68,x                 
                    STA.w $1021,x               
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$0C                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $56,x                 
                    RTL                         

CODE_2993C0:        LDA.b #$30                  
                    STA.b $68,x                 
CODE_2993C4:        JSR.w CODE_2997CF           
                    JSR.w CODE_2995F3           
                    JSR.w CODE_2996A7           
                    JMP.w CODE_299431           

CODE_2993D0:        JSL.l CODE_2993C4           
                    LDA.b $9C                   
                    BNE   CODE_2993FE           
                    LDA.b $4D,x                 
                    AND.b #$01                  
                    ORA.w $0679,x               
                    TAY                         
                    LDA.w $0518,x               
                    BNE   CODE_2993ED           
                    LDA.w $C61E,y               
                    STA.w $0518,x               
                    INC.b $4D,x                 
CODE_2993ED:        AND.b #$00                  
                    BNE   CODE_2993FE           
                    LDA.b $68,x                 
                    CMP.w $C626,y               
                    BEQ   CODE_2993FE           
                    CLC                         
                    ADC.w $C622,y               
                    STA.b $68,x                 
CODE_2993FE:        RTL                         

CODE_2993FF:        LDA.w $0518,x               
                    BNE   CODE_299427           
                    LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_299427           
                    LDY.w $1021,x               
                    LDA.b $8C,x                 
                    CLC                         
                    ADC.w $C649,y               
                    STA.b $8C,x                 
                    CMP.w $C64B,y               
                    BNE   CODE_299427           
                    LDA.w $1021,x               
                    EOR.b #$01                  
                    STA.w $1021,x               
                    LDA.b #$A0                  
                    STA.w $0518,x               
CODE_299427:        LDA.b #$00                  
                    STA.b $8C,x                 
                    JSR.w CODE_2995B8           
                    JSR.w CODE_2996A7           
CODE_299431:        JSL.l CODE_279BC7           
                    LDA.w $0583                 
                    BNE   CODE_2994A0           
                    LDA.w $0671,x               
                    SEC                         
                    SBC.b #$90                  
                    STA.b $0E                   
                    JSL.l CODE_27A85F           
                    BNE   CODE_2994A0           
                    LDY.b #$06                  
CODE_29944A:        STY.b $00                   
                    CPY.b #$06                  
                    BNE   CODE_299456           
                    REP   #$20                  
                    LDA.b $D8                   
                    BRA   CODE_299461           

CODE_299456:        REP   #$20                  
                    TYA                         
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $DA                   
CODE_299461:        STA.b $0F                   
                    SEP   #$20                  
                    LDA.b $70                   
                    SEC                         
                    SBC.w $0543                 
                    CLC                         
                    ADC.b #$18                  
                    LDY.b $9D                   
                    BPL   CODE_299475           
                    SEC                         
                    SBC.b #$10                  
CODE_299475:        REP   #$10                  
                    LDY.b $0F                   
                    SEC                         
                    SBC.w $0801,y               
                    CMP.b #$09                  
                    BCS   CODE_299499                   
                    LDA.b $43                   
                    SEC                         
                    SBC.b $44,x                 
                    BNE   CODE_299499           
                    LDA.b $5E                   
                    SEC                         
                    SBC.w $0210                 
                    CLC                         
                    ADC.b #$08                  
                    SEC                         
                    SBC.w $0800,y               
                    CMP.b #$09                  
                    BCC   CODE_2994A3           
CODE_299499:        SEP   #$30                  
                    LDY.b $00                   
                    DEY                         
                    BPL   CODE_29944A           
CODE_2994A0:        SEP   #$30                  
                    RTL                         

CODE_2994A3:        LDA.b $BF                   
                    BNE   CODE_2994A0           
                    LDA.w $0801,y               
                    CMP.b #$F0                  
                    BEQ   CODE_299499           
                    SEP   #$10                  
                    LDA.b $0E                   
                    BEQ   CODE_29951F           
                    LDA.b $68,x                 
                    BNE   CODE_2994E3           
                    LDA.b $9D                   
                    BPL   CODE_2994C1           
                    LDA.b #$00                  
                    STA.b $9D                   
                    RTL                         

CODE_2994C1:        LDA.b $17                   
                    AND.b #$03                  
                    BNE   CODE_2994D3           
                    LDA.b $8B                   
                    BEQ   CODE_2994D3           
                    BPL   CODE_2994D1           
                    INC.b $8B                   
                    INC.b $8B                   
CODE_2994D1:        DEC.b $8B                   
CODE_2994D3:        LDA.b #$00                  
                    STA.b $9D                   
                    STA.b $A6                   
                    JSL.l CODE_299596           
                    LDA.b #$10                  
                    STA.w $101F                 
                    RTL                         

CODE_2994E3:        LDA.b $68,x                 
                    LDY.b $00                   
                    CPY.b #$04                  
                    BCC   CODE_2994ED           
                    EOR.b #$80                  
CODE_2994ED:        ASL   A                     
                    BCS   CODE_299511                   
                    LDA.b $05                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $9D                   
                    LDA.b $04                   
                    EOR.b #$FF                  
CODE_2994FB:        ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    BPL   CODE_299508           
                    CMP.b #$C0                  
                    BCS   CODE_29950E                   
                    LDA.b #$C0                  
                    BNE   CODE_29950E           
CODE_299508:        CMP.b #$40                  
                    BCC   CODE_29950E           
                    LDA.b #$40                  
CODE_29950E:        STA.b $8B                   
                    RTL                         

CODE_299511:        LDA.b $04                   
                    JSL.l CODE_2994FB           
                    LDA.b $05                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $9D                   
                    RTL                         

CODE_29951F:        LDY.b $00                   
                    LDA.b $94,x                 
                    CMP.b #$10                  
                    BCC   CODE_299530           
                    CMP.b #$30                  
                    BCS   CODE_299530                   
                    TYA                         
                    CLC                         
                    ADC.b #$07                  
                    TAY                         
CODE_299530:        LDA.b $9D                   
                    BMI   CODE_29953A           
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_29954B           
CODE_29953A:        LDA.w $C63B,y               
                    LDY.b $9D                   
                    BPL   CODE_299546           
                    JSL.l CODE_27A859           
                    ASL   A                     
CODE_299546:        CLC                         
                    ADC.b $68,x                 
                    STA.b $68,x                 
CODE_29954B:        LDA.b $04                   
                    EOR.b $05                   
                    BPL   CODE_299557           
                    LDA.b $04                   
                    BPL   CODE_29955B           
                    BMI   CODE_29955F           
CODE_299557:        LDA.b $04                   
                    BPL   CODE_29955F           
CODE_29955B:        JSL.l CODE_27A859           
CODE_29955F:        LDY.b $9D                   
                    BPL   CODE_29956F           
                    JSL.l CODE_27A859           
                    ASL   A                     
                    STA.b $8B                   
                    LDA.b #$00                  
                    STA.b $9D                   
                    RTL                         

CODE_29956F:        LDY.b #$20                  
                    STA.b $00                   
                    ASL.b $00                   
                    ROR   A                     
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    NOP                         
                    CLC                         
                    ADC.b $8B                   
                    CLC                         
                    ADC.b $8C,x                 
                    STA.b $8B                   
                    BPL   CODE_29958C           
                    JSL.l CODE_27A859           
                    LDY.b #$E0                  
CODE_29958C:        CMP.b #$20                  
                    BCC   CODE_299592           
                    STY.b $8B                   
CODE_299592:        LDA.b #$10                  
                    STA.b $9D                   
CODE_299596:        LDA.b $70                   
                    PHA                         
                    REP   #$10                  
                    LDY.b $0F                   
                    LDA.w $0801,y               
                    SEP   #$10                  
                    CLC                         
                    ADC.w $0543                 
                    SEC                         
                    SBC.b #$18                  
                    STA.b $70                   
                    PLA                         
                    CMP.b $70                   
                    BCS   CODE_2995B2                   
                    DEC.b $55                   
CODE_2995B2:        LDA.b #$08                  
                    STA.w $101F                 
                    RTL                         

CODE_2995B8:        JSR.w CODE_2997CF           
                    LDA.b $94,x                 
                    CLC                         
                    ADC.b #$07                  
                    AND.b #$3F                  
                    LDY.b $68,x                 
                    BMI   CODE_2995D5           
                    CMP.b #$10                  
                    BCC   CODE_2995E1           
                    CMP.b #$18                  
                    BCS   CODE_2995D5                  
                    LDA.b #$08                  
                    STA.b $94,x                 
                    JMP.w CODE_2995DD           

CODE_2995D5:        AND.b #$20                  
                    BEQ   CODE_2995E1           
                    LDA.b #$38                  
                    STA.b $94,x                 
CODE_2995DD:        LDA.b #$00                  
                    STA.b $68,x                 
CODE_2995E1:        LDA.b $15                   
                    AND.b #$07                  
                    BNE   CODE_2995F3           
                    LDA.b $68,x                 
                    BEQ   CODE_2995F3           
                    BMI   CODE_2995F1           
                    DEC.b $68,x                 
                    BPL   CODE_2995F3           
CODE_2995F1:        INC.b $68,x                 
CODE_2995F3:        LDA.b $94,x                 
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $C62A,y               
                    STA.b $09                   
                    TYA                         
                    EOR.b #$FF                  
                    AND.b #$0F                  
                    CLC                         
                    ADC.b #$01                  
                    TAY                         
                    LDA.w $C62A,y               
                    STA.b $08                   
                    LDA.b $94,x                 
                    AND.b #$10                  
                    BEQ   CODE_29961B           
                    LDA.b $08                   
                    PHA                         
                    LDA.b $09                   
                    STA.b $08                   
                    PLA                         
                    STA.b $09                   
CODE_29961B:        LDA.b $09                   
                    CMP.b #$03                  
                    BCS   CODE_29962D                   
                    LSR   A                     
                    STA.b $01                   
                    STA.b $05                   
                    LDA.b #$00                  
                    STA.b $03                   
                    JMP.w CODE_299649           

CODE_29962D:        LDY.b #$FF                  
                    SEC                         
CODE_299630:        SBC.b #$03                  
                    INY                         
                    BCS   CODE_299630                  
                    ADC.b #$03                  
                    STA.b $03                   
                    STY.b $01                   
                    STY.b $03                   
                    STY.b $05                   
                    TAY                         
                    BEQ   CODE_299649           
                    INC.b $01                   
                    DEY                         
                    BEQ   CODE_299649           
                    INC.b $05                   
CODE_299649:        LDA.b $08                   
                    CMP.b #$03                  
                    BCS   CODE_29965B                   
                    LSR   A                     
                    STA.b $00                   
                    STA.b $04                   
                    LDA.b #$00                  
                    STA.b $02                   
                    JMP.w CODE_299675           

CODE_29965B:        LDY.b #$FF                  
                    SEC                         
CODE_29965E:        SBC.b #$03                  
                    INY                         
                    BCS   CODE_29965E                   
                    ADC.b #$03                  
                    STY.b $00                   
                    STY.b $02                   
                    STY.b $04                   
                    TAY                         
                    BEQ   CODE_299675           
                    INC.b $00                   
                    DEY                         
                    BEQ   CODE_299675           
                    INC.b $04                   
CODE_299675:        LDA.b $94,x                 
                    AND.b #$30                  
                    BEQ   CODE_2996A0           
                    CMP.b #$10                  
                    BEQ   CODE_299686           
                    CMP.b #$30                  
                    BEQ   CODE_2996A3           
                    JSR.w CODE_2996A3           
CODE_299686:        LDX.b #$01                  
CODE_299688:        LDA.b $00,x                 
                    JSL.l CODE_27A859           
                    STA.b $00,x                 
                    LDA.b $02,x                 
                    JSL.l CODE_27A859           
                    STA.b $02,x                 
                    LDA.b $04,x                 
                    JSL.l CODE_27A859           
                    STA.b $04,x                 
CODE_2996A0:        LDX.b $9B                   
                    RTS                         

CODE_2996A3:        LDX.b #$00                  
                    BEQ   CODE_299688           
CODE_2996A7:        LDA.b $C6,x                 
                    STA.b $DA                   
                    LDA.b $C7,x                 
                    STA.b $DB                   
                    JSL.l CODE_27A227           
                    JSR.w CODE_2997F6           
                    REP   #$10                  
                    LDY.b $DA                   
                    LDA.b $0D                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b $00                   
                    STA.w $0805,y               
                    CLC                         
                    ADC.b $02                   
                    STA.w $0809,y               
                    CLC                         
                    ADC.b $04                   
                    STA.w $080D,y               
                    LDA.b $0D                   
                    SEC                         
                    SBC.b $00                   
                    STA.w $0811,y               
                    SEC                         
                    SBC.b $02                   
                    STA.w $0815,y               
                    SEC                         
                    SBC.b $04                   
                    LDY.b $C6,x                 
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0819,y               
                    LDY.b $DA                   
                    LDA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0819,y               
                    LDA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $081D,y               
                    LDA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0821,y               
                    LDA.w $080D,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0825,y               
                    LDA.w $0811,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0829,y               
                    LDA.w $0815,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $082D,y               
                    LDA.b $0E                   
                    STA.w $0800,y               
                    STA.w $0818,y               
                    CLC                         
                    ADC.b $01                   
                    STA.w $0804,y               
                    STA.w $081C,y               
                    CLC                         
                    ADC.b $03                   
                    STA.w $0808,y               
                    STA.w $0820,y               
                    CLC                         
                    ADC.b $05                   
                    STA.w $080C,y               
                    STA.w $0824,y               
                    LDA.b $0E                   
                    SEC                         
                    SBC.b $01                   
                    STA.w $0810,y               
                    STA.w $0828,y               
                    SEC                         
                    SBC.b $03                   
                    STA.w $0814,y               
                    STA.w $082C,y               
                    SEC                         
                    SBC.b $05                   
                    LDY.b $C6,x                 
                    STA.w $0800,y               
                    STA.w $0818,y               
                    LDA.b $C6,x                 
                    STA.b $D8                   
                    LDA.b $C7,x                 
                    STA.b $D9                   
                    LDY.b $DA                   
                    LDX.w #$0006                
CODE_299774:        CPX.w #$0000                
                    BNE   CODE_29977B           
                    LDY.b $D8                   
CODE_29977B:        LDA.b $0C                   
                    CMP.b #$FF                  
                    BEQ   CODE_299788           
                    LDA.w $0801,y               
                    CMP.b #$C2                  
                    BCC   CODE_299792           
CODE_299788:        LDA.b #$F0                  
                    STA.w $0801,y               
                    STA.w $0819,y               
                    BNE   CODE_2997AA           
CODE_299792:        LDA.b #$22                  
                    CPX.w #$0006                
                    BNE   CODE_29979B           
                    LDA.b #$24                  
CODE_29979B:        STA.w $0803,y               
                    STA.w $081B,y               
                    LDA.b #$EC                  
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $081A,y               
CODE_2997AA:        PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $0C                   
                    AND.w $C65A,x               
                    BEQ   CODE_2997BC           
                    LDA.b #$01                  
CODE_2997BC:        STA.w $0A20,y               
                    STA.w $0A26,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_299774           
                    SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

CODE_2997CF:        LDA.b $9C                   
                    BNE   CODE_2997F5           
                    LDA.w $68,x               
                    PHA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $0689,x               
                    STA.w $0689,x               
                    PLA                         
                    PHP                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_2997EE           
                    ORA.b #$F0                  
CODE_2997EE:        PLP                         
                    ADC.b $94,x                 
                    AND.b #$3F                  
                    STA.b $94,x                 
CODE_2997F5:        RTS                         

CODE_2997F6:        LDA.b #$00                  
                    STA.b $0C                   
                    STA.b $0A                   
                    LDA.b $01                   
                    CLC                         
                    ADC.b $03                   
                    CLC                         
                    ADC.b $05                   
                    STA.b $0B                   
                    PHA                         
                    LDA.b $5F,x                 
                    SEC                         
                    SBC.b $0B                   
                    STA.b $0B                   
                    PLA                         
                    BPL   CODE_299813           
                    DEC.b $0A                   
CODE_299813:        LDA.b $44,x                 
                    SBC.b $0A                   
                    STA.b $0A                   
                    LDY.b #$00                  
CODE_29981B:        LDA.b $0B                   
                    CMP.w $0210                 
                    LDA.b $0A                   
                    SBC.b $12                   
                    BEQ   CODE_29982D           
                    LDA.w $C653,y               
                    ORA.b $0C                   
                    STA.b $0C                   
CODE_29982D:        STX.b $0E                   
                    LDX.w $C64D,y               
                    LDA.b $00,x                 
                    PHA                         
                    CLC                         
                    ADC.b $0B                   
                    STA.b $0B                   
                    LDX.b $0E                   
                    STY.b $0F                   
                    LDY.b #$00                  
                    PLA                         
                    BPL   CODE_299844           
                    DEY                         
CODE_299844:        TYA                         
                    ADC.b $0A                   
                    STA.b $0A                   
                    LDY.b $0F                   
                    INY                         
                    CPY.b #$07                  
                    BNE   CODE_29981B           
                    LDA.b $5F,x                 
                    SEC                         
                    SBC.w $0210                 
                    STA.b $0E                   
                    LDA.b $71,x                 
                    SEC                         
                    SBC.w $0543                 
                    STA.b $0D                   
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    CMP.b #$01                  
                    BNE   CODE_29986E           
                    LDA.b $0D                   
                    CMP.b #$E0                  
                    BCC   CODE_299872           
CODE_29986E:        LDA.b #$FF                  
                    STA.b $0C                   
CODE_299872:        RTS                         

CODE_299873:        LDA.b $71,x                 
                    BNE   CODE_299879           
                    DEC.b $56,x                 
CODE_299879:        DEC.b $71,x                 
                    LDY.b $44,x                 
                    LDA.w $07E3                 
                    AND.w $C661,y               
                    BEQ   CODE_299888           
                    INC.w $0669,x               
CODE_299888:        RTL                         

CODE_299889:        JSL.l CODE_279BC3           
                    JSR.w CODE_299994           
                    LDA.b $9C                   
                    BNE   CODE_299888           
                    LDA.b $68,x                 
                    BEQ   CODE_2998AC           
                    LDA.w $0520,x               
                    BNE   CODE_2998AC           
                    LDY.b #$04                  
CODE_29989F:        LDA.w $0661,y               
                    BEQ   CODE_2998A7           
                    DEY                         
                    BNE   CODE_29989F           
CODE_2998A7:        JSR.w CODE_299959           
                    DEC.b $68,x                 
CODE_2998AC:        LDY.w $0518,x               
                    LDA.w $C669,y               
                    STA.b $9E,x                 
                    JSL.l CODE_27A7D8           
                    JSL.l CODE_27A312           
                    BCC   CODE_299928           
                    LDA.b $82                   
                    CLC                         
                    ADC.b #$18                  
                    CMP.b $83,x                 
                    BCS   CODE_2998ED                   
                    LDA.b $9D                   
                    BMI   CODE_2998EC           
                    LDA.b $71,x                 
                    SEC                         
                    SBC.b #$1F                  
                    STA.b $70                   
                    LDA.b $56,x                 
                    SBC.b #$00                  
                    STA.b $55                   
                    LDY.b #$00                  
                    STY.b $A6                   
                    LDA.w $074D                 
                    BPL   CODE_2998E2           
                    DEY                         
CODE_2998E2:        CLC                         
                    ADC.b $5E                   
                    STA.b $5E                   
                    TYA                         
                    ADC.b $43                   
                    STA.b $43                   
CODE_2998EC:        RTL                         

CODE_2998ED:        LDA.b #$E8                  
                    LDY.b $BB                   
                    BEQ   CODE_2998F8           
                    LDY.w $056F                 
                    BEQ   CODE_2998FA           
CODE_2998F8:        LDA.b #$F8                  
CODE_2998FA:        CLC                         
                    ADC.b $82                   
                    CMP.b $83,x                 
                    BCC   CODE_299912           
                    LDA.b $9D                   
                    BPL   CODE_299911           
                    LDA.b #$01                  
                    STA.w $1200                 
                    LDA.b #$10                  
                    STA.b $9D                   
                    JSR.w CODE_29992B           
CODE_299911:        RTL                         

CODE_299912:        JSL.l CODE_27A837           
                    INY                         
                    LDA.b $17                   
                    AND.b #$03                  
                    STA.b $00                   
                    LDA.b #$00                  
                    CPY.b $00                   
                    BNE   CODE_299926           
                    LDA.w $9928,y               
CODE_299926:        STA.b $8B                   
CODE_299928:        RTL                         

                    db $04,$FC

CODE_29992B:        LDA.w $0669,x               
                    BNE   CODE_299958           
                    LDY.b #$05                  
                    JSR.w CODE_299959           
                    LDA.w $0671,x               
                    CMP.b #$94                  
                    BNE   CODE_299940           
                    LDA.b #$02                  
                    STA.b $68,x                 
CODE_299940:        LDA.b #$40                  
                    STA.w $1CF3                 
                    LDA.b #$0A                  
                    STA.w $0518,x               
                    INC.w $0669,x               
                    LDY.b $44,x                 
                    LDA.w $07E3                 
                    ORA.w $C661,y               
                    STA.w $07E3                 
CODE_299958:        RTS                         

CODE_299959:        LDA.b #$01                  
                    STA.w $0661,y               
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $5F,y               
                    LDA.b $44,x                 
                    ADC.b #$00                  
                    STA.w $44,y               
                    LDA.b $71,x                 
                    STA.w $71,y               
                    LDA.b $56,x                 
                    STA.w $56,y               
                    LDA.w $0671,x               
                    TAX                         
                    LDA.w $C5DF,x               
                    STA.w $0671,y               
                    LDA.w $C5E6,x               
                    STA.w $0586                 
                    LDA.b #$01                  
                    STA.w $057D                 
                    LDX.b $9B                   
                    LDA.b #$50                  
                    STA.w $0520,x               
                    RTS                         

CODE_299994:        JSL.l CODE_279DF8           
                    LDX.b $9B                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    STY.b $0A                   
                    LDA.b $07                   
                    STA.b $0E                   
                    LDA.w $0669,x               
                    LDX.w #$0006                
                    CMP.b #$00                  
                    BEQ   CODE_2999AF           
                    INX                         
CODE_2999AF:        ASL.b $0E                   
                    BCS   CODE_2999D7                   
                    LDA.b $04                   
                    STA.b $0F                   
                    LDA.b $00                   
                    LSR.b $0F                   
                    BCS   CODE_2999C6                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
CODE_2999C6:        LDA.b $00                   
                    LSR.b $0F                   
                    BCS   CODE_2999D7                   
                    ADC.b #$10                  
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $080D,y               
CODE_2999D7:        LDA.w $C681,x               
                    STA.w $0802,y               
                    INC   A                     
                    STA.w $0806,y               
                    LDA.w $C689,x               
                    STA.w $080A,y               
                    INC   A                     
                    STA.w $080E,y               
                    LDA.b #$21                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    LDA.b $01                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    STA.w $0808,y               
                    STA.w $080C,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.b $01                   
                    REP   #$20                  
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w #$0000                
                    STA.w $0A20,y               
                    STA.w $0A22,y               
                    PLY                         
                    TYA                         
                    CLC                         
                    ADC.w #$0010                
                    TAY                         
                    SEP   #$20                  
                    DEX                         
                    DEX                         
                    BMI   CODE_299A48           
                    CPX.w #$0002                
                    BCC   CODE_299A31           
                    JMP.w CODE_2999AF           

CODE_299A31:        SEP   #$10                  
                    PHX                         
                    LDX.b $9B                   
                    JSL.l CODE_27A19D           
                    PLX                         
                    LDY.b $9B                   
                    REP   #$30                  
                    LDA.w $C6,y               
                    TAY                         
                    SEP   #$20                  
                    JMP.w CODE_2999AF           

CODE_299A48:        SEP   #$10                  
                    LDX.b $9B                   
                    LDA.w $0520,x               
                    BEQ   CODE_299A95           
                    REP   #$10                  
                    LDY.b $0A                   
                    LDX.w #$0000                
CODE_299A58:        REP   #$20                  
                    LDA.w $0810,y               
                    STA.w $0830,x               
                    INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.w #$0010                
                    BCS   CODE_299A76                   
                    CPX.w #$0008                
                    BNE   CODE_299A58           
                    TYA                         
                    CLC                         
                    ADC.w #$0008                
                    TAY                         
                    BNE   CODE_299A58           
CODE_299A76:        LDA.w #$0000                
                    STA.w $0A2C                 
                    STA.w $0A2D                 
                    STA.w $0A2E                 
                    STA.w $0A2F                 
                    SEP   #$20                  
                    LDA.b #$F0                  
                    STA.w $07FD,y               
                    STA.w $07F9,y               
                    STA.w $080D,y               
                    STA.w $0809,y               
CODE_299A95:        SEP   #$10                  
                    LDX.b $9B                   
                    RTS                         

CODE_299A9A:        JSR.w CODE_299A9E           
                    RTL                         

CODE_299A9E:        JSR.w CODE_29A100           
                    LDA.w $057C                 
                    BEQ   CODE_299AD4           
                    LDX.b #$06                  
                    LDA.w $0661,x               
                    BEQ   CODE_299ABB           
                    INX                         
                    LDA.w $0661,x               
                    BEQ   CODE_299ABB           
                    LDA.b #$00                  
                    STA.w $057C                 
                    JMP.w CODE_299AD4           

CODE_299ABB:        LDY.b #$06                  
                    LDA.w $057D                 
                    AND.b #$7F                  
                    CMP.b #$02                  
                    BMI   CODE_299AC8           
                    LDY.b #$1B                  
CODE_299AC8:        TYA                         
                    STA.w $0671,x               
                    LDA.b #$01                  
                    STA.w $0661,x               
                    JMP.w CODE_299ADF           

CODE_299AD4:        LDA.w $0425                 
                    BEQ   CODE_299ADC           
                    JMP.w CODE_299DCD           

CODE_299ADC:        JMP.w CODE_299AE0           

CODE_299ADF:        RTS                         

CODE_299AE0:        LDY.b $25                   
                    LDA.w $0210                 
                    CLC                         
                    ADC.w $C699,y               
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.b $12                   
                    ADC.w $C69B,y               
                    STA.b $06                   
                    CMP.b $22                   
                    BEQ   CODE_299AFD           
                    BCC   CODE_299AFD           
                    JMP.w CODE_299C42           

CODE_299AFD:        LDX.b $06                   
                    LDA.w $1B00,x               
                    BMI   CODE_299B1D           
                    STA.b $01                   
                    TAX                         
                    ASL   A                     
                    CLC                         
                    ADC.b $01                   
                    TAY                         
                    DEY                         
                    DEX                         
CODE_299B0E:        INX                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.w $1B40,y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b $06                   
                    BEQ   CODE_299B1E           
CODE_299B1D:        RTS                         

CODE_299B1E:        LDA.w $1B3F,y               
                    CMP.b #$FF                  
                    BEQ   CODE_299B1D           
                    LDA.w $1B10,x               
                    CMP.b #$00                  
                    BMI   CODE_299B0E           
                    LDA.w $1B40,y               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CMP.b $05                   
                    BNE   CODE_299B0E           
                    STX.b $01                   
                    STA.b $00                   
                    LDA.w $1B3F,y               
                    CMP.b #$D5                  
                    BNE   CODE_299B47           
                    INC.w $05FD                 
                    BNE   CODE_299B6B           
CODE_299B47:        CMP.b #$D4                  
                    BNE   CODE_299B60           
                    LDA.w $1B41,y               
                    PHA                         
                    AND.b #$01                  
                    TAX                         
                    INC   A                     
                    STA.l $7E3964               
                    PLA                         
                    AND.b #$7F                  
                    STA.l $7E3965               
                    BPL   CODE_299B6B           
CODE_299B60:        CMP.b #$D3                  
                    BNE   CODE_299B78           
                    TYA                         
                    PHA                         
                    JSR.w CODE_299C43           
                    PLA                         
                    TAY                         
CODE_299B6B:        LDX.b $01                   
                    LDA.w $1B10,x               
                    ORA.b #$80                  
                    STA.w $1B10,x               
                    JMP.w CODE_299B0E           

CODE_299B78:        LDA.w $1B3F,y               
                    CMP.b #$D6                  
                    BNE   CODE_299B89           
                    LDA.w $1B41,y               
                    STA.l $7E3963               
                    JMP.w CODE_299B6B           

CODE_299B89:        CMP.b #$B4                  
                    BCC   CODE_299BB7           
                    CMP.b #$D1                  
                    BNE   CODE_299B97           
                    JSR.w CODE_299C8B           
                    JMP.w CODE_299B0E           

CODE_299B97:        CMP.b #$D2                  
                    BNE   CODE_299BA1           
                    JSR.w CODE_299C8B           
                    JMP.w CODE_299B0E           

CODE_299BA1:        CMP.b #$BC                  
                    BCC   CODE_299BB0           
                    SBC.b #$BC                  
                    CLC                         
                    ADC.b #$01                  
                    JSR.w CODE_299D2D           
                    JMP.w CODE_299B0E           

CODE_299BB0:        SEC                         
                    SBC.b #$B3                  
                    STA.w $0566                 
                    RTS                         

CODE_299BB7:        CMP.b #$41                  
                    BNE   CODE_299BBF           
                    LDX.b #$06                  
                    BNE   CODE_299BCC           
CODE_299BBF:        LDX.b #$04                  
CODE_299BC1:        LDA.w $0661,x               
                    BEQ   CODE_299BCC           
                    DEX                         
                    BPL   CODE_299BC1           
                    JMP.w CODE_299C42           

CODE_299BCC:        LDA.b $00                   
                    STA.b $5F,x                 
                    STA.l $7FC532,x             
                    STA.l $7FC53A,x             
                    LDA.b $06                   
                    STA.b $44,x                 
                    STA.l $7FC542,x             
                    STA.l $7FC54A,x             
                    INY                         
                    LDA.w $1B40,y               
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $56,x                 
                    STA.l $7FC562,x             
                    STA.l $7FC56A,x             
                    LDA.w $1B40,y               
                    AND.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $71,x                 
                    STA.l $7FC552,x             
                    STA.l $7FC55A,x             
                    DEY                         
                    DEY                         
                    LDA.w $1B40,y               
                    STA.w $0671,x               
                    LDY.b $01                   
                    LDA.b #$04                  
                    STA.l $7FC572,x             
                    LDA.b #$00                  
                    STA.l $7FC57A,x             
                    LDA.w $0671,x               
                    CMP.b #$43                  
                    BNE   CODE_299C33           
                    LDA.w $02BF                 
                    CMP.b #$01                  
                    BNE   CODE_299C33           
                    LDA.b #$B0                  
                    STA.b $71,x                 
CODE_299C33:        LDA.w $1B10,y               
                    ORA.b #$80                  
                    STA.w $1B10,y               
                    TYA                         
                    STA.w $0659,x               
                    INC.w $0661,x               
CODE_299C42:        RTS                         

CODE_299C43:        LDA.w $1B41,y               
                    CMP.b #$60                  
                    BNE   CODE_299C50           
                    LDA.b #$03                  
                    STA.w $0427                 
                    RTS                         

CODE_299C50:        PHA                         
                    LDY.b #$14                  
                    LDA.b #$00                  
CODE_299C55:        STA.w $19FF,y               
                    DEY                         
                    BNE   CODE_299C55           
                    PLA                         
                    PHA                         
                    AND.b #$0F                  
                    TAY                         
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $1A01                 
                    CMP.b #$03                  
                    BCS   CODE_299C7E                   
                    CMP.b #$01                  
                    BNE   CODE_299C74           
                    TYA                         
                    ORA.b #$10                  
                    TAY                         
CODE_299C74:        PHX                         
                    TYX                         
                    LDA   DATA_27AA5E,x             
                    STA.w $1A03                 
                    PLX                         
CODE_299C7E:        STY.w $1A02                 
                    LDA.w $0216                 
                    STA.w $1A0D                 
                    INC.w $0580                 
                    RTS                         

CODE_299C8B:        STA.w $1CEF                 
                    TXA                         
                    PHA                         
                    TYA                         
                    PHA                         
                    LDA.w $1B41,y               
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $08                   
                    LDA.w $1B41,y               
                    AND.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $09                   
                    LDA.b $06                   
                    STA.b $0A                   
                    LDA.b $00                   
                    STA.b $0B                   
                    LDX.b $01                   
                    LDA.w $1B10,x               
                    ORA.b #$80                  
                    STA.w $1B10,x               
                    LDA.b #$02                  
                    STA.b $0C                   
CODE_299CBE:        LDX.b #$04                  
CODE_299CC0:        LDA.w $0661,x               
                    BEQ   CODE_299CCB           
                    DEX                         
                    BPL   CODE_299CC0           
                    JMP.w CODE_299D24           

CODE_299CCB:        JSL.l CODE_279C96           
                    LDA.b $08                   
                    STA.b $56,x                 
                    LDA.b $09                   
                    STA.b $71,x                 
                    LDA.b $0B                   
                    STA.b $5F,x                 
                    LDA.b $0A                   
                    STA.b $44,x                 
                    JSL.l CODE_27A837           
                    LDA.w $C69D,y               
                    STA.w $0679,x               
                    LDA.b $0B                   
                    CLC                         
                    ADC.w $C69F,y               
                    STA.b $0B                   
                    LDA.b $0A                   
                    ADC.w $C6A1,y               
                    STA.b $0A                   
                    LDA.w $1CEF                 
                    CMP.b #$D1                  
                    BEQ   CODE_299D12           
                    LDY.b $0C                   
                    LDA.w $C6A3,y               
                    STA.b $9E,x                 
                    LDA.w $C6A6,y               
                    STA.b $4D,x                 
                    INC.w $06B7,x               
                    LDA.b #$88                  
                    BNE   CODE_299D14           
CODE_299D12:        LDA.b #$6E                  
CODE_299D14:        STA.w $0671,x               
                    LDA.b #$02                  
                    STA.w $0661,x               
                    LDA.b #$02                  
                    STA.w $1FE9,x               
                    STA.w $1FF1,x               
CODE_299D24:        DEC.b $0C                   
                    BPL   CODE_299CBE           
                    PLA                         
                    TAY                         
                    PLA                         
                    TAX                         
                    RTS                         

CODE_299D2D:        STA.b $0F                   
                    TXA                         
                    PHA                         
                    LDA.w $1A1C                 
                    PHA                         
                    LDA.w $1A44                 
                    PHA                         
                    LDX.b #$06                  
CODE_299D3B:        LDA.w $1A15,x               
                    STA.w $1A16,x               
                    LDA.w $1A1D,x               
                    STA.w $1A1E,x               
                    LDA.w $1A25,x               
                    STA.w $1A26,x               
                    LDA.w $1A2D,x               
                    STA.w $1A2E,x               
                    LDA.w $1A35,x               
                    STA.w $1A36,x               
                    LDA.w $1A3D,x               
                    STA.w $1A3E,x               
                    LDA.w $06E3,x               
                    STA.w $06E4,x               
                    LDA.w $06DB,x               
                    STA.w $06DC,x               
                    LDA.w $1A57,x               
                    STA.w $1A58,x               
                    DEX                         
                    BPL   CODE_299D3B           
                    PLA                         
                    TAX                         
                    PLA                         
                    BEQ   CODE_299D81           
                    LDA.w $1B10,x               
                    AND.b #$7F                  
                    STA.w $1B10,x               
CODE_299D81:        LDA.w $1B41,y               
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $1A1D                 
                    LDA.w $1B41,y               
                    AND.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.w $1A25                 
                    LDA.b $06                   
                    STA.w $1A2D                 
                    LDA.b $00                   
                    STA.w $1A35                 
                    LDA.b #$00                  
                    STA.w $06DB                 
                    STA.w $1A57                 
                    LDA.b #$60                  
                    LDX.b $0F                   
                    CPX.b #$04                  
                    BNE   CODE_299DB5           
                    LDA.b #$00                  
CODE_299DB5:        STA.w $06E3                 
                    LDX.b $01                   
                    STX.w $1A3D                 
                    LDA.w $1B10,x               
                    ORA.b #$80                  
                    STA.w $1B10,x               
                    LDA.b $0F                   
                    STA.w $1A15                 
                    PLA                         
                    TAX                         
                    RTS                         

CODE_299DCD:        LDY.b $25                   
                    LDA.w $0543                 
                    CLC                         
                    ADC.w $C6A9,y               
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.w $0542                 
                    ADC.w $C6AB,y               
                    STA.b $06                   
                    LDY.b $22                   
                    CMP.w $CEEE,y               
                    BCC   CODE_299DF5           
                    BNE   CODE_299DF2           
                    LDA.b $05                   
                    CMP.w $CEFE,y               
                    BCC   CODE_299DF5           
CODE_299DF2:        JMP.w CODE_299E7A           

CODE_299DF5:        LDX.b $06                   
                    LDA.w $1B00,x               
                    BMI   CODE_299E12           
                    STA.b $01                   
                    TAX                         
                    ASL   A                     
                    CLC                         
                    ADC.b $01                   
                    TAY                         
CODE_299E04:        INY                         
                    INY                         
                    INY                         
                    LDA.w $1B40,y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b $06                   
                    BEQ   CODE_299E13           
CODE_299E12:        RTS                         

CODE_299E13:        LDA.w $1B3E,y               
                    CMP.b #$FF                  
                    BEQ   CODE_299E12           
                    LDA.w $1B10,x               
                    INX                         
                    CMP.b #$00                  
                    BMI   CODE_299E04           
                    LDA.w $1B40,y               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CMP.b $05                   
                    BNE   CODE_299E04           
                    DEX                         
                    STX.b $01                   
                    STA.b $00                   
                    LDA.w $1B3F,y               
                    CMP.b #$B4                  
                    BCC   CODE_299E3F           
                    SBC.b #$B3                  
                    STA.w $0566                 
                    RTS                         

CODE_299E3F:        LDX.b #$04                  
CODE_299E41:        LDA.w $0661,x               
                    BEQ   CODE_299E4C           
                    DEX                         
                    BPL   CODE_299E41           
                    JMP.w CODE_299E7A           

CODE_299E4C:        LDA.b $00                   
                    STA.b $71,x                 
                    LDA.b $06                   
                    STA.b $56,x                 
                    LDA.b #$00                  
                    STA.b $44,x                 
                    DEY                         
                    LDA.w $1B40,y               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $5F,x                 
                    DEY                         
                    LDA.w $1B40,y               
                    STA.w $0671,x               
                    LDY.b $01                   
                    LDA.w $1B10,y               
                    ORA.b #$80                  
                    STA.w $1B10,y               
                    TYA                         
                    STA.w $0659,x               
                    INC.w $0661,x               
CODE_299E7A:        RTS                         

CODE_299E7B:        JSR.w CODE_299E7F           
                    RTL                         

CODE_299E7F:        LDA.w $0566                 
                    BEQ   CODE_299EA4           
                    JSL.l CODE_20FB1F           

                    dw CODE_299E7A
                    dw CODE_299FD1
                    dw CODE_29A02A
                    dw CODE_299E9A
                    dw CODE_29A084
                    dw CODE_299F24
                    dw CODE_299EA5
                    dw CODE_299F7E
                    dw CODE_299E9F
  
CODE_299E9A:        LDA.b #$00
                    STA.w $1CF0                 
CODE_299E9F:        LDA.b #$00                  
                    STA.w $0566                 
CODE_299EA4:        RTS                         

CODE_299EA5:        LDA.w $0565                 
                    AND.b #$7F                  
                    BNE   CODE_299F23           
                    LDA.b #$36                  
                    JSR.w CODE_29A0DD           
                    CPY.b #$03                  
                    BCS   CODE_299F23                   
                    JSR.w CODE_29A0D0           
                    LDA.b #$00                  
                    STA.w $0671,x               
                    LDA.w $0783,x               
CODE_299EC0:        AND.b #$7F                  
                    CLC                         
                    ADC.b #$40                  
                    CLC                         
                    ADC.w $0543                 
                    AND.b #$E0                  
                    ORA.b #$0F                  
                    STA.b $00                   
                    PHP                         
                    LDY.b #$04                  
CODE_299ED2:        LDA.w $0661,y               
                    BEQ   CODE_299EF2           
                    LDA.w $0671,y               
                    CMP.b #$36                  
                    BNE   CODE_299EF2           
                    LDA.w $71,y               
                    CMP.b $00                   
                    BNE   CODE_299EF2           
                    LDA.w $0783,x               
                    CLC                         
                    ADC.b #$30                  
                    STA.w $0783,x               
                    PLP                         
                    JMP.w CODE_299EC0           

CODE_299EF2:        DEY                         
                    BPL   CODE_299ED2           
                    LDA.b $00                   
                    STA.b $71,x                 
                    PLP                         
                    LDA.b $13                   
                    ADC.b #$00                  
                    STA.b $56,x                 
                    LDA.w $0210                 
                    CLC                         
                    ADC.b #$FF                  
                    STA.b $5F,x                 
                    LDA.b $12                   
                    ADC.b #$00                  
                    STA.b $44,x                 
                    LDA.w $0783,x               
                    AND.b #$03                  
                    TAY                         
                    LDA.w $C6AD,y               
                    STA.b $8C,x                 
                    LDA.b #$03                  
                    STA.w $1FE9,x               
                    LDA.b #$36                  
                    STA.w $0671,x               
CODE_299F23:        RTS                         

CODE_299F24:        LDA.w $0565                 
                    AND.b #$03                  
                    BNE   CODE_299F7D           
                    INC.w $1CF1                 
                    LDA.w $1CF1                 
                    CMP.b #$C0                  
                    BNE   CODE_299F7D           
                    LDA.b #$00                  
                    STA.w $1CF1                 
                    LDA.b #$49                  
                    JSR.w CODE_29A0DD           
                    CPY.b #$02                  
                    BCS   CODE_299F7D                   
                    JSR.w CODE_29A0D0           
                    LDA.b #$49                  
                    STA.w $0671,x               
                    LDA.w $0783,x               
                    AND.b #$7F                  
                    CLC                         
                    ADC.b #$30                  
                    CLC                         
                    ADC.w $0543                 
                    STA.b $71,x                 
                    LDA.b $13                   
                    ADC.b #$00                  
                    STA.b $56,x                 
                    LDA.w $0210                 
                    SEC                         
                    SBC.b #$20                  
                    STA.b $5F,x                 
                    LDA.b $12                   
                    SBC.b #$00                  
                    STA.b $44,x                 
                    LDA.w $0783,x               
                    AND.b #$03                  
                    TAY                         
                    LDA.w $C6B1,y               
                    STA.b $68,x                 
                    LDA.w $C6B5,y               
                    STA.b $8C,x                 
CODE_299F7D:        RTS                         

CODE_299F7E:        LDY.w $1CF1                 
                    BEQ   CODE_299F91           
                    DEC.w $1CF1                 
                    BNE   CODE_299F90           
                    INC.w $0014                 
                    LDA.b #$00                  
                    STA.w $0713                 
CODE_299F90:        RTS                         

CODE_299F91:        LDY.b #$07                  
CODE_299F93:        LDA.w $1FC8,y               
                    BNE   CODE_299FD0           
                    CPY.b #$05                  
                    BCS   CODE_299FA8                   
                    LDA.w $0671,y               
                    CMP.b #$47                  
                    BEQ   CODE_299FA8           
                    LDA.w $0661,y               
                    BNE   CODE_299FD0           
CODE_299FA8:        DEY                         
                    BPL   CODE_299F93           
                    LDA.b #$01                  
                    STA.w $0661                 
                    LDA.b #$52                  
                    STA.w $0671                 
                    LDA.b #$01                  
                    STA.b $56                   
                    LDA.b #$70                  
                    STA.b $71                   
                    LDA.b #$30                  
                    LDY.b $5E                   
                    BMI   CODE_299FC5           
                    LDA.b #$C0                  
CODE_299FC5:        ADC.w $0210                 
                    STA.b $5F                   
                    LDA.b $12                   
                    ADC.b #$00                  
                    STA.b $44                   
CODE_299FD0:        RTS                         

CODE_299FD1:        LDA.w $0565                 
                    AND.b #$1F                  
                    BNE   CODE_29A029           
                    LDA.b #$76                  
                    JSR.w CODE_29A0DD           
                    CPY.b #$03                  
                    BCS   CODE_29A029                   
                    JSR.w CODE_29A0D0           
                    LDA.b #$76                  
                    STA.w $0671,x               
                    LDA.w $0543                 
                    CLC                         
                    ADC.b #$C0                  
                    STA.b $71,x                 
                    LDA.b $13                   
                    ADC.b #$00                  
                    STA.b $56,x                 
                    LDA.w $0783,x               
                    PHP                         
                    PHP                         
                    AND.b #$03                  
                    TAY                         
                    LDA.w $C6B9,y               
                    PLP                         
                    BPL   CODE_29A007           
                    EOR.b #$FF                  
CODE_29A007:        CLC                         
                    ADC.w $0210                 
                    STA.b $5F,x                 
                    LDA.b $12                   
                    ADC.b #$00                  
                    STA.b $44,x                 
                    LDA.w $0785,x               
                    AND.b #$03                  
                    TAY                         
                    LDA.w $C6BD,y               
                    PLP                         
                    BPL   CODE_29A023           
                    JSL.l CODE_27A859           
CODE_29A023:        STA.b $8C,x                 
                    LDA.b #$B8                  
                    STA.b $9E,x                 
CODE_29A029:        RTS                         

CODE_29A02A:        INC.w $1CF1                 
                    LDA.w $1CF1                 
                    CMP.b #$AA                  
                    BNE   CODE_29A083           
                    LDA.b #$00                  
                    STA.w $1CF1                 
                    LDX.b #$02                  
                    JSR.w CODE_29A0D2           
                    LDA.b #$77                  
                    STA.w $0671,x               
                    LDA.w $0783,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $0210                 
                    CLC                         
                    ADC.w $C6C1,y               
                    STA.b $5F,x                 
                    LDA.b $12                   
                    ADC.b #$00                  
                    STA.b $44,x                 
                    LDA.w $C6C3,y               
                    LDY.w $05FC                 
                    BEQ   CODE_29A064           
                    CLC                         
                    ADC.w $1A0E                 
CODE_29A064:        STA.b $8C,x                 
                    LDA.w $0783,x               
                    AND.b #$F0                  
                    ADC.b #$20                  
                    AND.b #$7F                  
                    ADC.w $0543                 
                    STA.b $71,x                 
                    LDA.w $0542                 
                    ADC.b #$00                  
                    STA.b $56,x                 
                    LDA.b #$01                  
                    STA.w $0689,x               
                    STA.w $06B7,x               
CODE_29A083:        RTS                         

CODE_29A084:        LDA.w $0565                 
                    AND.b #$3F                  
                    BNE   CODE_29A0CF           
                    LDA.b #$9F                  
                    JSR.w CODE_29A0DD           
                    CPY.b #$04                  
                    BCS   CODE_29A0CF                   
                    JSR.w CODE_29A0D0           
                    LDA.b #$9F                  
                    STA.w $0671,x               
                    LDA.w $0783,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.w $0210                 
                    CLC                         
                    ADC.w $C6C5,y               
                    STA.b $5F,x                 
                    LDA.b $12                   
                    ADC.b #$00                  
                    STA.b $44,x                 
                    LDA.w $C6C7,y               
                    LDY.w $0784,x               
                    BPL   CODE_29A0BA           
                    ASL   A                     
CODE_29A0BA:        STA.b $8C,x                 
                    LDA.w $0783,x               
                    AND.b #$7F                  
                    CLC                         
                    ADC.b #$10                  
                    ADC.w $0543                 
                    STA.b $71,x                 
                    LDA.b $13                   
                    ADC.b #$00                  
                    STA.b $56,x                 
CODE_29A0CF:        RTS                         

CODE_29A0D0:        LDX.b #$04                  
CODE_29A0D2:        LDA.w $0661,x               
                    BEQ   CODE_29A0F6           
                    DEX                         
                    BPL   CODE_29A0D2           
                    PLA                         
                    PLA                         
                    RTS                         

CODE_29A0DD:        STA.b $00                   
                    LDY.b #$00                  
                    LDX.b #$04                  
CODE_29A0E3:        LDA.w $0661,x               
                    BEQ   CODE_29A0F0           
                    LDA.w $0671,x               
                    CMP.b $00                   
                    BNE   CODE_29A0F0           
                    INY                         
CODE_29A0F0:        DEX                         
                    BPL   CODE_29A0E3           
                    LDX.b $9B                   
                    RTS                         

CODE_29A0F6:        JSL.l CODE_279C96           
                    LDA.b #$02                  
                    STA.w $0661,x               
                    RTS                         

CODE_29A100:        LDA.w $0561                 
                    BEQ   CODE_29A106           
                    RTS                         

CODE_29A106:        LDY.b #$09                  
CODE_29A108:        STA.w $1FC8,y               
                    CPY.b #$08                  
                    BCS   CODE_29A112                   
                    STA.w $1A15,y               
CODE_29A112:        CPY.b #$05                  
                    BCS   CODE_29A11C                   
                    STA.w $079F,y               
                    STA.w $07A4,y               
CODE_29A11C:        CPY.b #$03                  
                    BEQ   CODE_29A135           
                    BCS   CODE_29A138                   
                    STA.w $1F7C,y               
                    STA.w $1F90,y               
                    STA.w $1F9C,y               
                    CPY.b #$02                  
                    BCS   CODE_29A135                   
                    STA.w $06B4,y               
                    STA.w $1CE1,y               
CODE_29A135:        STA.w $1FB4,y               
CODE_29A138:        DEY                         
                    BPL   CODE_29A108           
                    STA.w $1CFF                 
                    STA.l $7E3973               
                    STA.w $1CFB                 
                    STA.w $1CF5                 
                    STA.w $1CF3                 
                    STA.w $1CF2                 
                    STA.w $1CF4                 
                    STA.w $0566                 
                    STA.w $1CF1                 
                    STA.w $1A45                 
                    STA.w $0781                 
                    STA.w $0780                 
                    LDY.b #$2F                  
CODE_29A162:        STA.w $1B10,y               
                    DEY                         
                    BPL   CODE_29A162           
                    STY.w $0561                 
                    STA.w $058B                 
                    STA.w $1B00                 
                    STA.w $0575                 
                    STA.w $0546                 
                    STA.w $05FE                 
                    STA.w $05FF                 
                    STA.w $05FD                 
                    STA.w $1A0F                 
                    STA.b $00                   
                    TAX                         
                    TAY                         
                    INY                         
CODE_29A188:        CPX.b #$10                  
                    BEQ   CODE_29A1CE           
                    LDA.w $1B40,y               
                    CMP.b #$FF                  
                    BEQ   CODE_29A1B7           
                    LDA.w $0425                 
                    PHP                         
                    LDA.w $1B41,y               
                    PLP                         
                    BEQ   CODE_29A1A0           
                    LDA.w $1B42,y               
CODE_29A1A0:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $01                   
                    CPX.b $01                   
                    BNE   CODE_29A1B7           
                    INC.b $00                   
                    LDA.b $00                   
                    STA.w $1B01,x               
                    INY                         
                    INY                         
                    INY                         
                    JMP.w CODE_29A188           

CODE_29A1B7:        LDA.b $00                   
                    CPX.b #$0F                  
                    BEQ   CODE_29A1C0           
                    STA.w $1B01,x               
CODE_29A1C0:        CMP.w $1B00,x               
                    BNE   CODE_29A1CA           
                    LDA.b #$FF                  
                    STA.w $1B00,x               
CODE_29A1CA:        INX                         
                    JMP.w CODE_29A188           

CODE_29A1CE:        LDX.b #$07                  
CODE_29A1D0:        LDA.b #$00                  
                    STA.w $0661,x               
                    DEX                         
                    BPL   CODE_29A1D0           
                    LDA.b #$4F                  
                    STA.w $071E                 
                    LDA.w $0560                 
                    CMP.b #$0A                  
                    BNE   CODE_29A1EE           
                    LDA.b #$01                  
                    STA.w $0665                 
                    LDA.b #$47                  
                    STA.w $0675                 
CODE_29A1EE:        LDA.w $0425                 
                    BNE   CODE_29A24A           
                    LDA.w $0210                 
                    PHA                         
                    LDA.w $C699                 
                    SEC                         
                    SBC.w $C69A                 
                    CLC                         
                    ADC.w $0210                 
                    AND.b #$F0                  
                    STA.b $0D                   
                    LDA.b $12                   
                    PHA                         
                    ADC.w $C69B                 
                    STA.b $0E                   
                    LDA.b #$01                  
                    STA.b $25                   
                    LDA.w $0210                 
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0210                 
                    BCS   CODE_29A21F                   
                    DEC.b $12                   
CODE_29A21F:        LDA.w $0210                 
                    ADC.b #$10                  
                    AND.b #$F0                  
                    STA.w $0210                 
                    BCC   CODE_29A22D           
                    INC.b $12                   
CODE_29A22D:        JSR.w CODE_299AE0           
                    JSR.w CODE_299AE0           
                    LDA.b $0E                   
                    CMP.b $12                   
                    BNE   CODE_29A21F           
                    LDA.b $0D                   
                    CMP.w $0210                 
                    BNE   CODE_29A21F           
                    PLA                         
                    STA.b $12                   
                    PLA                         
                    STA.w $0210                 
                    PLA                         
                    PLA                         
                    RTS                         

CODE_29A24A:        LDA.w $0543                 
                    PHA                         
                    CLC                         
                    ADC.w $C6AA                 
                    AND.b #$F0                  
                    STA.b $0D                   
                    LDA.w $0542                 
                    PHA                         
                    CLC                         
                    ADC.w $C6AC                 
                    STA.b $0E                   
                    LDA.b #$00                  
                    STA.b $25                   
                    LDA.w $0543                 
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0543                 
                    BCS   CODE_29A272                   
                    DEC.w $0542                 
CODE_29A272:        LDA.w $0543                 
                    ADC.b #$10                  
                    AND.b #$F0                  
                    STA.w $0543                 
                    BCC   CODE_29A281           
                    INC.w $0542                 
CODE_29A281:        JSR.w CODE_299DCD           
                    JSR.w CODE_299DCD           
                    LDA.b $0E                   
                    CMP.w $0542                 
                    BNE   CODE_29A272           
                    LDA.b $0D                   
                    CMP.w $0543                 
                    BNE   CODE_29A272           
                    PLA                         
                    STA.w $0542                 
                    PLA                         
                    STA.w $0543                 
                    PLA                         
                    PLA                         
                    RTS                         

DATA_29A2A0:        db $71,$A4,$A5,$A9,$98,$99,$AA,$A6
                    db $9A,$9B,$A7,$A8,$9A,$9B,$A7,$A8
                    db $98,$99,$AA,$A6,$71,$A4,$A5,$A9
                    db $71,$A4,$A5,$BE,$98,$99,$BF,$20
                    db $9A,$9B,$21,$22,$9A,$9B,$21,$22
                    db $98,$99,$BF,$20,$71,$A4,$A5,$BE

DATA_29A2D0:        db $22,$22,$22,$22,$22,$22,$22,$22
                    db $22,$22,$22,$22,$62,$62,$62,$62
                    db $62,$62,$62,$62,$62,$62,$62,$62
                    db $22,$22,$22,$22,$22,$22,$22,$23
                    db $22,$22,$23,$23,$62,$62,$63,$63
                    db $62,$62,$62,$63,$62,$62,$62,$62

CODE_29A300:        PHB
                    PHK
                    PLB                         
                    LDA.b $5F,x                 
                    STA.b $0A                   
                    LDA.b $44,x                 
                    STA.b $0B                   
                    LDA.b $83,x                 
                    STA.b $07                   
                    REP   #$30                  
                    LDA.b $0A                   
                    SEC                         
                    SBC.w $0210                 
                    STA.b $0A                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $0C                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $0E                   
                    SEP   #$20                  
                    LDY.w $00C6,x               
                    PHY                         
                    LDA.w $0679,x               
                    LDX.w #$000C                
                    STX.b $08                   
                    CMP.b #$40                  
                    BNE   CODE_29A33A           
                    LDX.w #$0000                
CODE_29A33A:        LDA.w $1EBF                 
                    CMP.b #$1B                  
                    BNE   CODE_29A346           
                    TXA                         
                    CLC                         
                    ADC.b #$18                  
                    TAX                         
CODE_29A346:        LDA.w DATA_29A2A0,x               
                    STA.w $0802,y               
                    LDA.w DATA_29A2D0,x               
                    STA.w $0803,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    DEC.b $08                   
                    BNE   CODE_29A346           
                    LDX.w #$0000                
                    PLY                         
                    PHY                         
CODE_29A360:        LDA.b $0A,x                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    STA.w $0808,y               
                    STA.w $080C,y               
                    LDA.b $07                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $080D,y               
                    REP   #$20                  
                    TYA                         
                    CLC                         
                    ADC.w #$0010                
                    TAY                         
                    SEP   #$20                  
                    INX                         
                    INX                         
                    CPX.w #$0006                
                    BCC   CODE_29A360           
                    SEP   #$10                  
                    REP   #$20                  
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDX.b #$00                  
CODE_29A3A2:        LDA.b $0B,x                 
                    BEQ   CODE_29A3A8           
                    LDA.b #$01                  
CODE_29A3A8:        STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0A22,y               
                    STA.w $0A23,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.b #$06                  
                    BCC   CODE_29A3A2           
                    LDX.b $9B                   
                    PLB                         
                    RTL                         

CODE_29A3C2:        LDA.l $7FC57A,x             
                    BNE   CODE_29A3DE           
                    JSR.w CODE_29A52D           
                    LDA.w $0671,x               
                    CMP.b #$5E                  
                    BEQ   CODE_29A3DE           
                    CMP.b #$60                  
                    BEQ   CODE_29A3DE           
                    CMP.b #$51                  
                    BEQ   CODE_29A3DE           
                    CMP.b #$5F                  
                    BNE   CODE_29A3E8           
CODE_29A3DE:        LDA.l $7FC57A,x             
                    EOR.b #$01                  
                    STA.l $7FC57A,x             
CODE_29A3E8:        LDA.w $0671,x               
                    CMP.b #$2F                  
                    BEQ   CODE_29A412           
                    LDA.b #$8C                  
                    STA.b $01                   
                    LDA.w $0669,x               
                    BEQ   CODE_29A3FE           
                    STZ.b $03                   
                    LDA.b #$88                  
                    BRA   CODE_29A404           

CODE_29A3FE:        LDA.b #$C0                  
                    STA.b $03                   
                    LDA.b #$8A                  
CODE_29A404:        STA.b $00                   
                    LDA.b $15                   
                    AND.b #$0E                  
                    ORA.b #$20                  
                    STA.b $02                   
                    TSB.b $03                   
                    BRA   CODE_29A452           

CODE_29A412:        REP   #$10                  
                    LDY.w $00C6,x               
                    LDA.b #$F0                  
                    STA.w $0801,y               
                    STA.w $0805,y               
                    STA.w $0809,y               
                    STA.w $080D,y               
                    SEP   #$10                  
                    LDA.w $0679,x               
                    BEQ   CODE_29A42E           
                    LDA.b #$40                  
CODE_29A42E:        ORA.b #$2A                  
                    STA.b $02                   
                    STA.b $03                   
                    LDA.b #$AC                  
                    STA.b $00                   
                    LDA.w $0661,x               
                    CMP.b #$06                  
                    BNE   CODE_29A445           
                    LDA.b #$AA                  
                    STA.b $02                   
                    BRA   CODE_29A4C0           

CODE_29A445:        LDA.w $0669,x               
                    BEQ   CODE_29A4C0           
                    LDA.b #$AE                  
                    STA.b $00                   
                    LDA.b #$84                  
                    STA.b $01                   
CODE_29A452:        LDA.b $01                   
                    STA.b $0A                   
                    LDA.b $03                   
                    STA.b $0B                   
                    LDA.l $7FC572,x             
                    CMP.b #$01                  
                    BEQ   CODE_29A48F           
                    CMP.b #$03                  
                    BEQ   CODE_29A48F           
                    LDA.l $7FC53A,x             
                    STA.b $0C                   
                    LDA.l $7FC54A,x             
                    STA.b $0D                   
                    LDA.l $7FC55A,x             
                    STA.b $0E                   
                    LDA.l $7FC56A,x             
                    STA.b $0F                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    JSR.w CODE_29A4E2           
                    SEP   #$10                  
CODE_29A48F:        LDA.l $7FC572,x             
                    CMP.b #$02                  
                    BEQ   CODE_29A4C0           
                    CMP.b #$05                  
                    BEQ   CODE_29A4C0           
                    LDA.l $7FC532,x             
                    STA.b $0C                   
                    LDA.l $7FC542,x             
                    STA.b $0D                   
                    LDA.l $7FC552,x             
                    STA.b $0E                   
                    LDA.l $7FC562,x             
                    STA.b $0F                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    JSR.w CODE_29A4E2           
                    SEP   #$10                  
CODE_29A4C0:        LDA.b $00                   
                    STA.b $0A                   
                    LDA.b $02                   
                    STA.b $0B                   
                    LDA.b $5F,x                 
                    STA.b $0C                   
                    LDA.b $44,x                 
                    STA.b $0D                   
                    LDA.b $71,x                 
                    STA.b $0E                   
                    LDA.b $56,x                 
                    STA.b $0F                   
                    REP   #$10                  
                    LDY.b $C6,x                 
                    JSR.w CODE_29A4E2           
                    SEP   #$10                  
                    RTL                         

CODE_29A4E2:        REP   #$20                  
                    LDA.b $0C                   
                    SEC                         
                    SBC.w $0210                 
                    STA.b $0C                   
                    LDA.b $0E                   
                    SEC                         
                    SBC.w $0216                 
                    STA.b $0E                   
                    SEP   #$20                  
                    LDA.b $0C                   
                    STA.w $0800,y               
                    LDA.b $0E                   
                    STA.w $0801,y               
                    LDA.b $0A                   
                    STA.w $0802,y               
                    LDA.b $0B                   
                    STA.w $0803,y               
                    LDA.b $0F                   
                    BNE   CODE_29A514           
                    LDA.b $0E                   
                    CMP.b #$F0                  
                    BCC   CODE_29A519           
CODE_29A514:        LDA.b #$F0                  
                    STA.w $0801,y               
CODE_29A519:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $0D                   
                    BEQ   CODE_29A527           
                    LDA.b #$01                  
CODE_29A527:        ORA.b #$02                  
                    STA.w $0A20,y               
                    RTS                         

CODE_29A52D:        LDA.l $7FC572,x             
                    DEC   A                     
                    BPL   CODE_29A579           
                    LDA.l $7FC532,x             
                    STA.l $7FC53A,x             
                    LDA.l $7FC542,x             
                    STA.l $7FC54A,x             
                    LDA.l $7FC552,x             
                    STA.l $7FC55A,x             
                    LDA.l $7FC562,x             
                    STA.l $7FC56A,x             
                    LDA.b $5F,x                 
                    STA.l $7FC532,x             
                    LDA.b $44,x                 
                    STA.l $7FC542,x             
                    LDA.b $71,x                 
                    STA.l $7FC552,x             
                    LDA.b $56,x                 
                    STA.l $7FC562,x             
                    LDA.w $0671,x               
                    CMP.b #$2F                  
                    BNE   CODE_29A577           
                    LDA.b #$05                  
                    BRA   CODE_29A579           

CODE_29A577:        LDA.b #$04                  
CODE_29A579:        STA.l $7FC572,x             
                    RTS                         

CODE_29A57E:        LDA.w $1CD7,x               
                    SEC                         
                    SBC.b $5F,x                 
                    PHA                         
                    LDA.w $1CC8,x               
                    SBC.b $44,x                 
                    TAY                         
                    PLA                         
                    CLC                         
                    ADC.w $1CD7,x               
                    STA.b $5F,x                 
                    TYA                         
                    ADC.w $1CC8,x               
                    STA.b $44,x                 
                    LDA.w $1CD7,x               
                    SEC                         
                    SBC.l $7FC532,x             
                    PHA                         
                    LDA.w $1CC8,x               
                    SBC.l $7FC542,x             
                    TAY                         
                    PLA                         
                    CLC                         
                    ADC.w $1CD7,x               
                    STA.l $7FC532,x             
                    TYA                         
                    ADC.w $1CC8,x               
                    STA.l $7FC542,x             
                    LDA.w $1CD7,x               
                    SEC                         
                    SBC.l $7FC53A,x             
                    PHA                         
                    LDA.w $1CC8,x               
                    SBC.l $7FC54A,x             
                    TAY                         
                    PLA                         
                    CLC                         
                    ADC.w $1CD7,x               
                    STA.l $7FC53A,x             
                    TYA                         
                    ADC.w $1CC8,x               
                    STA.l $7FC54A,x             
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.b $C6,x                 
                    RTL                         

CODE_29A5E4:        LDA.w $1CDC,x               
                    SEC                         
                    SBC.b $71,x                 
                    PHA                         
                    LDA.w $0689,x               
                    SBC.b $56,x                 
                    TAY                         
                    PLA                         
                    CLC                         
                    ADC.w $1CDC,x               
                    STA.b $71,x                 
                    TYA                         
                    ADC.w $0689,x               
                    STA.b $56,x                 
                    LDA.w $1CDC,x               
                    SEC                         
                    SBC.l $7FC552,x             
                    PHA                         
                    LDA.w $0689,x               
                    SBC.l $7FC562,x             
                    TAY                         
                    PLA                         
                    CLC                         
                    ADC.w $1CDC,x               
                    STA.l $7FC552,x             
                    TYA                         
                    ADC.w $0689,x               
                    STA.l $7FC562,x             
                    LDA.w $1CDC,x               
                    SEC                         
                    SBC.l $7FC55A,x             
                    PHA                         
                    LDA.w $0689,x               
                    SBC.l $7FC56A,x             
                    TAY                         
                    PLA                         
                    CLC                         
                    ADC.w $1CDC,x               
                    STA.l $7FC55A,x             
                    TYA                         
                    ADC.w $0689,x               
                    STA.l $7FC56A,x             
                    LDA.b $C6,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.b $C6,x                 
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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

CODE_29A700:        JSR.w CODE_29A7C3
                    LDX.w $0727
                    LDA.w $E3A5,x               
                    STA.w $1EEC                 
                    TXA                         
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w $E3AD,x               
                    STA.b $0A                   
                    LDA.w $E3BD,x               
                    STA.b $0C                   
                    LDA.w $E3CD,x               
                    STA.b $0E                   
                    LDA.w $E3DD,x               
                    STA.b $08                   
                    LDA.w $E3ED,x               
                    STA.b $06                   
                    SEP   #$20                  
                    LDY.b #$08                  
CODE_29A72E:        LDA.b ($0A),y               
                    STA.w $1EED,y               
                    LDA.b ($0C),y               
                    STA.w $1F09,y               
                    LDA.b ($0E),y               
                    STA.w $1EFB,y               
                    LDA.b ($08),y               
                    STA.w $1F17,y               
                    TYX                         
                    LDA.b ($06),y               
                    STA.l $7E3956,x             
                    DEY                         
                    BPL   CODE_29A72E           
                    LDY.w $0727                 
                    LDX.w $072B                 
                    DEX                         
CODE_29A753:        LDA.w $C96D,y               
                    STA.l $7E3975,x             
                    STA.w $43                 
                    STA.w $44                 
                    STA.l $7E397D               
                    STA.l $7E397E               
                    LDA.b #$20                  
                    STA.l $7E3979,x             
                    STA.w $47                 
                    STA.w $48                 
                    STA.l $7E3981               
                    STA.l $7E3982               
                    LDA.b #$01                  
                    STA.l $7E3992,x             
                    LDA.b #$00                  
                    STA.l $7E397B,x             
                    STA.l $7E3977,x             
                    STA.w $45                 
                    STA.w $46                 
                    STA.l $7E397F               
                    STA.l $7E3980               
                    STA.l $7E3983,x             
                    STA.l $7E3985,x             
                    STA.l $7E3987,x             
                    STA.l $7E3989,x             
                    STA.w $0722,x               
                    STA.w $0724,x               
                    DEX                         
                    BPL   CODE_29A753           
                    STX.w $1F26                 
                    STA.l $7E3994               
                    STA.l $7E3970               
                    STA.l $7E3971               
                    RTL                         

CODE_29A7C3:        LDY.w $0727                 
                    LDA.w $0783                 
                    AND.b #$0F                  
                    TAX                         
                    LDA.w $E57D,x               
                    CLC                         
                    ADC.w $E575,y               
                    STA.w $0743                 
                    RTS                         

                    LDX.w $0726                 
                    LDA.w $E58D,x               
                    STA.b $00                   
                    LDA.w $0738                 
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    LDA.w $1D80,x               
                    CMP.b #$01                  
                    BEQ   CODE_29A7F2           
                    JSL.l CODE_238C1B           
                    RTS                         

CODE_29A7F2:        LDX.w $0738                 
                    LDA.w $1DC6,x               
                    JSL.l CODE_20FB1F           

                    dw CODE_29B99E
                    dw CODE_29A81C
                    dw CODE_29A81C
                    dw CODE_29A81C
                    dw CODE_29A81C
                    dw CODE_29B99E
                    dw CODE_29A81C
                    dw CODE_29A821
                    dw CODE_29A81C
                    dw CODE_29A81C
                    dw CODE_29B99E
                    dw CODE_29B99E
                    dw CODE_29B99E
                    dw CODE_29B99E
                    dw CODE_29B99E
                    dw CODE_29B99E
  
CODE_29A81C:        JSL.l CODE_238C1B           
                    RTS                         

CODE_29A821:        LDA.b $59                   
                    JSL.l CODE_20FB1F           

                    dw CODE_29A88D
                    dw CODE_29A8D7
                    dw CODE_29A8E5
                    dw CODE_29A936
                    dw CODE_29A96E
                    dw CODE_29A8D7

CODE_29A833:        JSR.w CODE_29A821           
                    RTL                         

CODE_29A837:        LDA.b $57                   
                    BNE   CODE_29A85D           
                    LDA.b #$20                  
                    STA.b $57                   
                    LDA.b #$12                  
                    STA.w $0208                 
                    LDA.b #$01                  
                    STA.w $0209                 
                    LDA.b #$02                  
                    STA.w $0203                 
                    LDA.b #$20                  
                    STA.w $0204                 
                    LDA.w $0598                 
                    BEQ   CODE_29A85D           
                    LDA.b #$01                  
                    STA.w $020B                 
CODE_29A85D:        LDA.b $57                   
                    AND.b #$04                  
                    LSR   A                     
                    TAX                         
                    REP   #$20                  
                    LDA   DATA_29A889,x             
                    STA.w $1300                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    DEC.b $57                   
                    BNE   CODE_29A888           
                    LDA.b #$13                  
                    STA.w $0208                 
                    STZ.w $0209                 
                    STZ.w $0203                 
                    STZ.w $0204                 
                    STZ.w $020B                 
CODE_29A888:        RTS                         

DATA_29A889:        dw $0000
                    dw $7FFF

CODE_29A88D:        LDY.w $0726
                    LDX.b #$00
                    LDA.w $47,y
                    SEC                         
                    SBC.w $0210                 
                    CMP.b #$80                  
                    BCS   CODE_29A89F                   
                    LDX.b #$01                  
CODE_29A89F:        STX.b $58                   
                    LDA.w $E58F,x               
                    STA.b $56                   
                    LDA.w $43,y               
                    STA.b $54                   
                    STA.l $7E3974               
                    LDX.b #$05                  
                    LDA.w $0730                 
                    BNE   CODE_29A8D0           
                    LDA.w $43,y               
                    STA.w $0730                 
                    LDA.w $47,y               
                    STA.w $0732                 
                    LDA.w $45,y               
                    STA.w $0731                 
                    LDA.w $52,y               
                    STA.w $0733                 
                    LDX.b #$01                  
CODE_29A8D0:        STX.b $59                   
                    JSL.l CODE_238C1B           
                    RTS                         

CODE_29A8D7:        JSR.w CODE_29A837           
                    LDA.b $57                   
                    BNE   CODE_29A8E0           
                    INC.b $59                   
CODE_29A8E0:        JSL.l CODE_238C1B           
                    RTS                         

CODE_29A8E5:        INC.b $57                   
                    LDY.w $0726                 
                    LDX.b $58                   
                    LDA.b $56                   
                    CLC                         
                    ADC.w $E591,x               
                    STA.b $56                   
                    LDA.w $47,y               
                    SEC                         
                    SBC.w $0210                 
                    CMP.b $56                   
                    BNE   CODE_29A908           
                    LDA.b #$F0                  
                    STA.l $7E3974               
                    JMP.w CODE_29A927           

CODE_29A908:        LDA.b $56                   
                    CMP.w $E593,x               
                    BNE   CODE_29A927           
                    LDA.w $0727                 
                    STA.w $042A                 
                    LDA.b #$08                  
                    STA.w $0727                 
                    LDY.b #$0D                  
                    LDA.b #$00                  
CODE_29A91E:        STA.w $1F17,y               
                    DEY                         
                    BPL   CODE_29A91E           
                    INC.b $59                   
                    RTS                         

CODE_29A927:        JSL.l CODE_238C1B           
                    LDA.b $56                   
                    STA.b $01                   
                    LDA.b #$01                  
                    STA.b $02                   
                    JMP.w CODE_29AA70           

CODE_29A936:        LDA.b #$00                  
                    STA.b $57                   
                    LDA.b #$F8                  
                    STA.b $56                   
                    INC.b $59                   
                    LDY.w $042A                 
                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.w $0722,x               
                    STA.w $0724,x               
                    STA.b $45,x                 
                    LDA.w $E5A7,y               
                    STA.b $47,x                 
                    LDA.b #$F0                  
                    STA.b $56                   
                    LDA.w $E595,y               
                    STA.b $54                   
                    LDA.b #$80                  
                    STA.w $0711                 
                    LDA.b #$03                  
                    STA.w $0713                 
                    LDA.b #$00                  
                    STA.w $072C                 
                    RTS                         

CODE_29A96E:        LDA.b #$00                  
                    STA.w $0713                 
                    LDY.w $042A                 
                    LDX.w $0726                 
                    INC.b $57                   
                    LDY.w $042A                 
                    LDX.b $58                   
                    LDA.b $56                   
                    CLC                         
                    ADC.w $E591,x               
                    STA.b $56                   
                    CMP.w $E5A7,y               
                    BNE   CODE_29A99C           
                    LDX.w $0726                 
                    LDA.w $E595,y               
                    STA.l $7E3974               
                    STA.b $43,x                 
                    JMP.w CODE_29A9AB           

CODE_29A99C:        CMP.w $E593,x               
                    BNE   CODE_29A9AB           
                    LDA.b #$00                  
                    STA.b $57                   
                    STA.b $59                   
                    LDA.b #$F8                  
                    STA.b $56                   
CODE_29A9AB:        JMP.w CODE_29A927           

CODE_29A9AE:        LDA.w $072E                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29A9BB
                    dw CODE_29A9D9
                    dw CODE_29A9EF


CODE_29A9BB:        LDX.w $0726
                    LDA.b $43,x                 
                    STA.l $7E3974               
                    CLC                         
                    ADC.b #$10                  
                    STA.b $54                   
                    LDA.b $45,x                 
                    STA.b $55                   
                    LDA.b $47,x                 
                    STA.b $56                   
                    INC.w $072E                 
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_29A9D9:        JSR.w CODE_29A837           
                    LDA.b $57                   
                    BNE   CODE_29A9EA           
                    INC.w $072E                 
                    LDA.b #$02                  
                    LDA.b #$43                  
                    STA.w $1203                 
CODE_29A9EA:        JSL.l CODE_238C1B           
                    RTL                         

CODE_29A9EF:        LDA.b #$01                  
                    STA.b $00                   
                    JSR.w CODE_29AA47           
                    LDA.b $57                   
                    CMP.b #$20                  
                    BNE   CODE_29AA10           
                    LDA.b #$10                  
                    STA.w $0729                 
                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.w $073F,x               
                    STA.w $0728                 
                    STA.w $072E                 
                    RTL                         

CODE_29AA10:        JSL.l CODE_238C1B           
                    LDX.w $0726                 
                    LDA.b $43,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    STA.b $01                   
                    LDA.b #$00                  
                    STA.b $02                   
                    LDA.b $47,x                 
                    STA.w $0804                 
                    LDA.b #$80                  
                    STA.w $0805                 
                    LDA.b #$00                  
                    STA.w $0806                 
                    LDA.b #$21                  
                    STA.w $0807                 
                    LDA.b #$02                  
                    STA.w $0A21                 
                    JSR.w CODE_29AA70           
                    RTL                         

CODE_29AA47:        LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_29AA6F           
                    LDA.b $57                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDX.w $0726                 
                    LDA.b $54                   
                    CLC                         
                    ADC.w $E5B0,y               
                    STA.b $54                   
                    INC.b $57                   
                    LDA.b $57                   
                    AND.b #$10                  
                    BEQ   CODE_29AA6F           
                    LDA.b $54                   
                    STA.l $7E3974               
CODE_29AA6F:        RTS                         

CODE_29AA70:        LDX.b $02                   
                    LDA.b $54                   
                    STA.w $0861                 
                    LDA.b $02                   
                    BEQ   CODE_29AA8C           
                    LDA.l $7E3974               
                    CMP.b #$F0                  
                    BNE   CODE_29AAAB           
                    STA.w $0885                 
                    STA.w $0889                 
                    JMP.w CODE_29AAAB           

CODE_29AA8C:        LDA.b $57                   
                    AND.b #$10                  
                    BEQ   CODE_29AAAB           
                    LDA.l $7E3974               
                    STA.w $0889                 
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0885                 
                    LDA.w $0886                 
                    CMP.b #$26                  
                    BNE   CODE_29AAAB           
                    LDA.b #$F0                  
                    STA.w $0885                 
CODE_29AAAB:        LDA.w $E5B2,x               
                    STA.w $0863                 
                    LDA.b $01                   
                    STA.w $0860                 
                    LDA.b #$02                  
                    STA.w $0A38                 
                    LDY.w $E5B4,x               
                    LDA.b $57                   
                    AND.b #$10                  
                    BEQ   CODE_29AAC7           
                    LDY.w $E5B6,x               
CODE_29AAC7:        STY.w $0862                 
                    LDA.b $58                   
                    BEQ   CODE_29AAD6           
                    LDA.w $0863                 
                    ORA.b #$40                  
                    STA.w $0863                 
CODE_29AAD6:        LDA.b $54                   
                    STA.w $0801                 
                    LDA.b #$A8                  
                    STA.w $0802                 
                    LDA.b #$22                  
                    STA.w $0803                 
                    STZ.w $0800                 
                    LDA.b #$02                  
                    STA.w $0A20                 
                    LDA.b $01                   
                    AND.b #$80                  
                    BEQ   CODE_29AAFD           
                    LDA.b #$F0                  
                    STA.w $0800                 
                    LDA.b #$AA                  
                    STA.w $0802                 
CODE_29AAFD:        RTS                         

CODE_29AAFE:        LDX.w $0726                 
                    LDA.b $93                   
                    BNE   CODE_29AB5E           
                    LDY.w $0727                 
                    LDA.b $43,x                 
                    SEC                         
                    SBC.w $C96D,y               
                    STA.b $5C                   
                    LDA.b $47,x                 
                    SEC                         
                    SBC.b #$20                  
                    STA.b $60                   
                    LDA.b #$00                  
                    STA.b $66                   
                    STA.b $61                   
                    STA.b $5D                   
                    LDA.b $47,x                 
                    CMP.b #$20                  
                    BCS   CODE_29AB31                   
                    LDA.b #$01                  
                    STA.b $66                   
                    LDA.b #$FF                  
                    EOR.b $60                   
                    TAY                         
                    INY                         
                    STY.b $60                   
CODE_29AB31:        LDY.w $0727                 
                    LDA.b $43,x                 
                    CMP.w $C96D,y               
                    BCS   CODE_29AB49                   
                    LDA.b #$FF                  
                    EOR.b $5C                   
                    TAY                         
                    INY                         
                    STY.b $5C                   
                    LDA.b $66                   
                    ORA.b #$02                  
                    STA.b $66                   
CODE_29AB49:        LDY.b #$04                  
CODE_29AB4B:        CLC                         
                    LSR.b $5C                   
                    ROR.b $5D                   
                    CLC                         
                    LSR.b $60                   
                    ROR.b $61                   
                    DEY                         
                    BPL   CODE_29AB4B           
                    LDA.b #$20                  
                    STA.b $65                   
                    INC.b $93                   
CODE_29AB5E:        LDA.b #$04                  
                    STA.w $1203                 
                    LDA.b $66                   
                    AND.b #$01                  
                    BEQ   CODE_29AB7F           
                    LDA.b $62                   
                    CLC                         
                    ADC.b $61                   
                    STA.b $62                   
                    LDA.b $47,x                 
                    ADC.b $60                   
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    ADC.b #$00                  
                    STA.b $45,x                 
                    JMP.w CODE_29AB92           

CODE_29AB7F:        LDA.b $62                   
                    SEC                         
                    SBC.b $61                   
                    STA.b $62                   
                    LDA.b $47,x                 
                    SBC.b $60                   
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    SBC.b #$00                  
                    STA.b $45,x                 
CODE_29AB92:        LDA.b $66                   
                    AND.b #$02                  
                    BEQ   CODE_29ABA8           
                    LDA.b $5E                   
                    CLC                         
                    ADC.b $5D                   
                    STA.b $5E                   
                    LDA.b $43,x                 
                    ADC.b $5C                   
                    STA.b $43,x                 
                    JMP.w CODE_29ABB5           

CODE_29ABA8:        LDA.b $5E                   
                    SEC                         
                    SBC.b $5D                   
                    STA.b $5E                   
                    LDA.b $43,x                 
                    SBC.b $5C                   
                    STA.b $43,x                 
CODE_29ABB5:        DEC.b $65                   
                    BNE   CODE_29ABE2           
CODE_29ABB9:        LDA.b #$08                  
                    STA.w $0728                 
                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.b $93                   
                    STA.w $5A,x               
                    STA.l $7E3985,x             
                    STA.l $7E3987,x             
                    LDA.b $43,x                 
                    STA.l $7E397D,x             
                    LDA.b $45,x                 
                    STA.l $7E397F,x             
                    LDA.b $47,x                 
                    STA.l $7E3981,x             
CODE_29ABE2:        JSL.l CODE_238C1B           
                    RTL                         

CODE_29ABE7:        LDX.w $0726                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.b #$02                  
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    SBC.b #$00                  
                    STA.b $45,x                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    BNE   CODE_29AC0E           
                    LDA.b #$00                  
                    STA.w $0722,x               
                    STA.w $0724,x               
                    STA.l $7E3977,x             
                    INC.w $0728                 
CODE_29AC0E:        LDA.b #$04                  
                    STA.w $1203                 
                    JSR.w CODE_29AC1B           
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_29AC1B:        LDX.w $0726                 
                    LDA.b $43,x                 
                    STA.w $0801                 
                    LDA.b #$A8                  
                    STA.w $0802                 
                    LDA.b #$20                  
                    STA.w $0803                 
                    LDA.b #$00                  
                    STA.w $0800                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    AND.b #$80                  
                    BEQ   CODE_29AC46           
                    LDA.b #$F0                  
                    STA.w $0800                 
                    LDA.b #$AA                  
                    STA.w $0802                 
CODE_29AC46:        LDA.b #$02                  
                    STA.w $0A20                 
                    RTS                         

CODE_29AC4C:        LDX.w $0726                 
                    LDA.b #$F0                  
                    STA.b $47,x                 
                    LDY.w $0727                 
                    LDA.w $C96D,y               
                    STA.b $43,x                 
                    INC.w $0728                 
                    JMP.w CODE_29AC0E           

CODE_29AC61:        LDX.w $0726                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.b #$02                  
                    STA.b $47,x                 
                    CMP.b #$20                  
                    BNE   CODE_29AC72           
                    JMP.w CODE_29ABB9           

CODE_29AC72:        LDA.b #$04                  
                    STA.w $1203                 
                    JMP.w CODE_29AC0E           

CODE_29AC7A:        LDX.w $0726                 
                    LDA.b $93                   
                    BEQ   CODE_29AC84           
                    JMP.w CODE_29AD61           

CODE_29AC84:        LDY.b #$0D                  
CODE_29AC86:        LDA.w $1F17,y               
                    BNE   CODE_29AC91           
CODE_29AC8B:        DEY                         
                    BNE   CODE_29AC86           
                    JMP.w CODE_29ACC1           

CODE_29AC91:        LDA.b $43,x                 
                    CMP.w $1EED,y               
                    BNE   CODE_29AC8B           
                    LDA.b $45,x                 
                    CMP.w $1F09,y               
                    BNE   CODE_29AC8B           
                    LDA.b $47,x                 
                    CMP.w $1EFB,y               
                    BNE   CODE_29AC8B           
                    LDA.w $1F17,y               
                    CMP.b #$02                  
                    BNE   CODE_29ACB5           
                    LDA.b #$20                  
                    STA.w $053D                 
                    JMP.w CODE_29AC8B           

CODE_29ACB5:        CMP.b #$0B                  
                    BNE   CODE_29AC8B           
                    LDA.b #$03                  
                    STA.w $1F17,y               
                    JMP.w CODE_29AC8B           

CODE_29ACC1:        LDA.l $7E397D,x             
                    SEC                         
                    SBC.b $43,x                 
                    STA.b $5C                   
                    LDA.l $7E397F,x             
                    CMP.b $45,x                 
                    BEQ   CODE_29ACD6           
                    BCS   CODE_29ACDE                   
                    BCC   CODE_29ACF4           
CODE_29ACD6:        LDA.l $7E3981,x             
                    CMP.b $47,x                 
                    BCC   CODE_29ACF4           
CODE_29ACDE:        LDA.l $7E3981,x             
                    SEC                         
                    SBC.b $47,x                 
                    STA.b $61                   
                    LDA.l $7E397F,x             
                    SBC.b $45,x                 
                    STA.b $60                   
                    LDY.b #$00                  
                    JMP.w CODE_29AD07           

CODE_29ACF4:        LDA.b $47,x                 
                    SEC                         
                    SBC.l $7E3981,x             
                    STA.b $61                   
                    LDA.b $45,x                 
                    SBC.l $7E397F,x             
                    STA.b $60                   
                    LDY.b #$01                  
CODE_29AD07:        STY.b $66                   
                    LDA.b #$00                  
                    STA.b $62                   
                    STA.b $5D                   
                    LDA.l $7E397D,x             
                    CMP.b $43,x                 
                    BCS   CODE_29AD25                   
                    LDA.b #$FF                  
                    EOR.b $5C                   
                    TAY                         
                    INY                         
                    STY.b $5C                   
                    LDA.b $66                   
                    ORA.b #$02                  
                    STA.b $66                   
CODE_29AD25:        LDA.b $60                   
                    BNE   CODE_29AD44           
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    TAY                         
                    LDA.b $66                   
                    AND.b #$01                  
                    BNE   CODE_29AD3E           
                    TYA                         
                    CLC                         
                    ADC.b $61                   
                    BCC   CODE_29AD4A           
                    BCS   CODE_29AD44                   
CODE_29AD3E:        TYA                         
                    SEC                         
                    SBC.b $61                   
                    BCS   CODE_29AD4A                   
CODE_29AD44:        INC.w $0729                 
                    JMP.w CODE_29ADFC           

CODE_29AD4A:        LDY.b #$04                  
CODE_29AD4C:        CLC                         
                    LSR.b $5C                   
                    ROR.b $5D                   
                    CLC                         
                    LSR.b $60                   
                    ROR.b $61                   
                    ROR.b $62                   
                    DEY                         
                    BPL   CODE_29AD4C           
                    LDA.b #$20                  
                    STA.b $65                   
                    INC.b $93                   
CODE_29AD61:        LDA.b $65                   
                    BEQ   CODE_29ADBE           
                    LDA.b #$04                  
                    STA.w $1203                 
                    LDA.b $66                   
                    AND.b #$01                  
                    BNE   CODE_29AD86           
                    LDA.b $63                   
                    CLC                         
                    ADC.b $62                   
                    STA.b $63                   
                    LDA.b $47,x                 
                    ADC.b $61                   
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    ADC.b $60                   
                    STA.b $45,x                 
                    JMP.w CODE_29AD99           

CODE_29AD86:        LDA.b $63                   
                    SEC                         
                    SBC.b $62                   
                    STA.b $63                   
                    LDA.b $47,x                 
                    SBC.b $61                   
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    SBC.b $60                   
                    STA.b $45,x                 
CODE_29AD99:        LDA.b $66                   
                    AND.b #$02                  
                    BNE   CODE_29ADAF           
                    LDA.b $5E                   
                    CLC                         
                    ADC.b $5D                   
                    STA.b $5E                   
                    LDA.b $43,x                 
                    ADC.b $5C                   
                    STA.b $43,x                 
                    JMP.w CODE_29ADBC           

CODE_29ADAF:        LDA.b $5E                   
                    SEC                         
                    SBC.b $5D                   
                    STA.b $5E                   
                    LDA.b $43,x                 
                    SBC.b $5C                   
                    STA.b $43,x                 
CODE_29ADBC:        DEC.b $65                   
CODE_29ADBE:        JSL.l CODE_238C1B           
                    LDA.b $65                   
                    ORA.w $053D                 
                    ORA.w $0710                 
                    BNE   CODE_29ADFB           
                    LDA.b #$0B                  
                    STA.w $0729                 
                    LDX.w $0726                 
                    LDA.b $43,x                 
                    STA.l $7E3975,x             
                    LDA.b $45,x                 
                    STA.l $7E3977,x             
                    LDA.b $47,x                 
                    STA.l $7E3979,x             
                    LDA.l $7E3985,x             
                    STA.w $0722,x               
                    LDA.l $7E3987,x             
                    STA.w $0724,x               
                    LDA.b #$00                  
                    STA.b $93                   
                    STA.w $073F,x               
CODE_29ADFB:        RTL                         

CODE_29ADFC:        LDX.w $0726                 
                    LDA.b $66                   
                    AND.b #$01                  
                    BEQ   CODE_29AE1D           
                    LDA.b $47,x                 
                    SEC                         
                    SBC.b #$02                  
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    SBC.b #$00                  
                    STA.b $45,x                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    BEQ   CODE_29AE34           
                    JMP.w CODE_29AE45           

CODE_29AE1D:        LDA.b $47,x                 
                    CLC                         
                    ADC.b #$02                  
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    ADC.b #$00                  
                    STA.b $45,x                 
                    LDA.b $47,x                 
                    SEC                         
                    SBC.w $0210                 
                    CMP.b #$F0                  
                    BNE   CODE_29AE45           
CODE_29AE34:        LDA.l $7E3985,x             
                    STA.w $0722,x               
                    LDA.l $7E3987,x             
                    STA.w $0724,x               
                    INC.w $0729                 
CODE_29AE45:        LDA.b #$04                  
                    STA.w $1203                 
                    JSR.w CODE_29AC1B           
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_29AE52:        LDX.w $0726                 
                    LDA.l $7E397D,x             
                    STA.b $43,x                 
                    LDA.l $7E397F,x             
                    STA.b $45,x                 
                    LDA.b $66                   
                    AND.b #$01                  
                    BEQ   CODE_29AE85           
                    LDY.b #$F0                  
                    LDA.w $0210                 
                    BEQ   CODE_29AE80           
                    LDA.l $7E3981,x             
                    CLC                         
                    ADC.w $0210                 
                    LDA.l $7E397F,x             
                    ADC.b #$00                  
                    STA.b $45,x                 
                    LDY.b #$70                  
CODE_29AE80:        STY.b $47,x                 
                    JMP.w CODE_29AE9F           

CODE_29AE85:        LDA.w $0210                 
                    BEQ   CODE_29AE9A           
                    LDA.l $7E3981,x             
                    SEC                         
                    SBC.w $0210                 
                    LDA.l $7E397F,x             
                    SBC.b #$00                  
                    STA.b $45,x                 
CODE_29AE9A:        LDA.w $0210                 
                    STA.b $47,x                 
CODE_29AE9F:        LDA.b #$04                  
                    STA.w $1203                 
                    INC.w $0729                 
                    JMP.w CODE_29AE45           

CODE_29AEAA:        LDX.w $0726                 
                    LDA.b $66                   
                    AND.b #$01                  
                    BEQ   CODE_29AECB           
                    LDA.b $47,x                 
                    SEC                         
                    SBC.b #$02                  
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    SBC.b #$00                  
                    STA.b $45,x                 
                    LDA.b $47,x                 
                    CMP.l $7E3981,x             
                    BEQ   CODE_29AEE0           
                    JMP.w CODE_29AEFE           

CODE_29AECB:        LDA.b $47,x                 
                    CLC                         
                    ADC.b #$02                  
                    STA.b $47,x                 
                    LDA.b $45,x                 
                    ADC.b #$00                  
                    STA.b $45,x                 
                    LDA.b $47,x                 
                    CMP.l $7E3981,x             
                    BNE   CODE_29AEFE           
CODE_29AEE0:        LDA.b #$0B                  
                    STA.w $0729                 
                    LDA.b $43,x                 
                    STA.l $7E3975,x             
                    LDA.b $45,x                 
                    STA.l $7E3977,x             
                    LDA.b $47,x                 
                    STA.l $7E3979,x             
                    LDA.b #$00                  
                    STA.b $93                   
                    STA.w $073F,x               
CODE_29AEFE:        JMP.w CODE_29AE45           

                    db $00,$00,$00,$00

CODE_29AF05:        JSL.l CODE_238DD8           
                    LDX.b #$04                  
CODE_29AF0B:        CMP.w $E5F2,x               
                    BEQ   CODE_29AF16           
                    DEX                         
                    BPL   CODE_29AF0B           
                    JMP.w CODE_29AF1F           

CODE_29AF16:        LDA.l $7E396D               
                    INC   A                     
                    STA.l $7E396D               
CODE_29AF1F:        JSL.l CODE_238DD8           
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDX.b #$04                  
                    LDA.b $B3                   
CODE_29AF2E:        CMP.w $E5CD,x               
                    BEQ   CODE_29AF3B           
                    DEX                         
                    BPL   CODE_29AF2E           
                    CMP.w $1E9A,y               
                    BCC   CODE_29AF48           
CODE_29AF3B:        LDA.b $20                   
                    BEQ   CODE_29AF4B           
                    LDA.b $15                   
                    AND.b #$03                  
                    BEQ   CODE_29AF74           
CODE_29AF45:        JMP.w CODE_29B071           

CODE_29AF48:        JMP.w CODE_29B0AB           

CODE_29AF4B:        CPY.b #$00                  
                    BNE   CODE_29AF61           
                    LDA.l $7E3995               
                    BNE   CODE_29AF48           
                    LDA.b #$07                  
                    STA.b $20                   
                    LDA.b #$1C                  
                    STA.w $1203                 
                    JMP.w CODE_29AF45           

CODE_29AF61:        LDA.b $B3                   
                    CMP.b #$67                  
                    BEQ   CODE_29AF74           
                    CMP.b #$6A                  
                    BEQ   CODE_29AF74           
                    CMP.b #$EB                  
                    BEQ   CODE_29AF74           
                    LDA.b #$0C                  
                    STA.w $1200                 
CODE_29AF74:        INC.b $20                   
                    LDA.b $20                   
                    CMP.b #$07                  
                    BEQ   CODE_29AF80           
                    CMP.b #$0A                  
                    BNE   CODE_29AF45           
CODE_29AF80:        STZ.b $20                   
                    LDA.l $7E3995               
                    BEQ   CODE_29AF91           
                    LDA.b #$04                  
                    STA.b $20                   
                    LDY.b $A5                   
                    JMP.w CODE_29B0F6           

CODE_29AF91:        LDY.w $0726                 
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.w $45,y               
                    ASL   A                     
                    TAX                         
                    LDA.w $8200,x               
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $2E                   
                    LDA.w $8201,x               
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.w $47,y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.w $0043,y               
                    TAY                         
                    LDA.b [$2E],y               
                    PHA                         
                    AND.b #$C0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w $0726                 
                    BEQ   CODE_29AFC8           
                    INX                         
CODE_29AFC8:        PLA                         
                    CMP.b #$67                  
                    BEQ   CODE_29AFD1           
                    CMP.b #$6A                  
                    BNE   CODE_29AFD8           
CODE_29AFD1:        LDA.b #$16                  
                    STA.w $1203                 
                    LDX.b #$08                  
CODE_29AFD8:        CMP.b #$EB                  
                    BNE   CODE_29AFE3           
                    LDA.b #$16                  
                    STA.w $1203                 
                    LDX.b #$09                  
CODE_29AFE3:        LDA.w $E5C2,x               
                    STA.b [$2E],y               
                    STA.b $B3                   
                    JSR.w CODE_29BC69           
                    LDY.w $0726                 
                    LDX.b $47,y                 
                    LDA.w $43,y               
                    SEC                         
                    SBC.b #$10                  
                    JSL.l CODE_20973C           
                    LDX.w $1600                 
                    LDY.w $0726                 
                    LDA.w $45,y               
                    AND.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    ORA.b $0E                   
                    STA.w $1602,x               
                    STA.w $160A,x               
                    LDA.b $0F                   
                    STA.w $1603,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $160B,x               
                    STZ.w $1604,x               
                    STZ.w $160C,x               
                    LDA.b #$03                  
                    STA.w $1605,x               
                    STA.w $160D,x               
                    LDY.b #$10                  
                    LDA.b $B3                   
                    CMP.b #$60                  
                    BEQ   CODE_29B041           
                    LDY.b #$18                  
                    CMP.b #$E3                  
                    BEQ   CODE_29B041           
                    LDY.b #$00                  
                    LDX.w $0726                 
                    BEQ   CODE_29B041           
                    LDY.b #$08                  
CODE_29B041:        REP   #$20                  
                    LDX.w $1600                 
                    LDA.w $E5D2,y               
                    STA.w $1606,x               
                    LDA.w $E5D4,y               
                    STA.w $160E,x               
                    LDA.w $E5D6,y               
                    STA.w $1608,x               
                    LDA.w $E5D8,y               
                    STA.w $1610,x               
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $1612,x               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1600                 
                    JMP.w CODE_29B0AB           

CODE_29B071:        LDX.w $0726                 
                    LDA.b $43,x                 
                    STA.b $00                   
                    LDA.b $47,x                 
                    STA.b $01                   
                    LDY.b $20                   
                    CPY.b #$05                  
                    BCC   CODE_29B0A4           
                    LDA.b $00                   
                    STA.w $0861                 
                    DEY                         
                    LDA.w $E5B8,y               
                    STA.w $0862                 
                    LDA.b #$27                  
                    STA.w $0863                 
                    LDA.b $01                   
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0860                 
                    LDA.b #$02                  
                    STA.w $0A38                 
CODE_29B0A1:        JMP.w CODE_29B107           

CODE_29B0A4:        JSL.l CODE_29B11F           
                    JMP.w CODE_29B11A           

CODE_29B0AB:        LDA.l $7E3972               
                    BNE   CODE_29B0A1           
                    LDY.b #$0D                  
                    LDX.w $0726                 
CODE_29B0B6:        LDA.w $1F17,y               
                    BEQ   CODE_29B0D4           
                    LDA.w $1EED,y               
                    STA.b $00                   
                    CMP.b $43,x                 
                    BNE   CODE_29B0D4           
                    LDA.w $1F09,y               
                    CMP.b $45,x                 
                    BNE   CODE_29B0D4           
                    LDA.w $1EFB,y               
                    STA.b $01                   
                    CMP.b $47,x                 
                    BEQ   CODE_29B0D9           
CODE_29B0D4:        DEY                         
                    BPL   CODE_29B0B6           
                    BRA   CODE_29B107           

CODE_29B0D9:        STY.b $A5                   
                    LDA.w $1F17,y               
                    CMP.b #$02                  
                    BNE   CODE_29B0E7           
                    INC.w $0729                 
                    BRA   CODE_29B11A           

CODE_29B0E7:        LDA.b $20                   
                    BNE   CODE_29B0F0           
                    LDA.b #$0C                  
                    STA.w $1200                 
CODE_29B0F0:        LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_29B0A4           
CODE_29B0F6:        INC.b $20                   
                    LDA.b $20                   
                    CMP.b #$05                  
                    BNE   CODE_29B0A4           
                    LDA.b #$00                  
                    STA.w $1F17,y               
                    STZ.b $20                   
                    STZ.b $A5                   
CODE_29B107:        LDA.b $20                   
                    BNE   CODE_29B11A           
                    LDA.b #$00                  
                    STA.l $7E3972               
                    STA.l $7E3995               
                    LDA.b #$08                  
                    STA.w $0729                 
CODE_29B11A:        JSL.l CODE_29B7AE           
                    RTL                         

CODE_29B11F:        LDA.b $00                   
                    SEC                         
                    SBC.b #$08                  
                    STA.w $0861                 
                    STA.w $0865                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0869                 
                    STA.w $086D                 
                    LDA.b $01                   
                    SEC                         
                    SBC.w $0210                 
                    SEC                         
                    SBC.b #$08                  
                    STA.w $0860                 
                    STA.w $0868                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0864                 
                    STA.w $086C                 
                    LDA.b #$27                  
                    STA.w $0863                 
                    LDA.b #$67                  
                    STA.w $0867                 
                    LDA.b #$A7                  
                    STA.w $086B                 
                    LDA.b #$E7                  
                    STA.w $086F                 
                    LDX.b $20                   
                    LDA.w $E5B8,x               
                    STA.w $0862                 
                    STA.w $0866                 
                    STA.w $086A                 
                    STA.w $086E                 
                    LDA.b #$02                  
                    STA.w $0A38                 
                    STA.w $0A39                 
                    STA.w $0A3A                 
                    STA.w $0A3B                 
                    RTL                         

CODE_29B17F:        LDA.b #$03                  
                    STA.b $0F                   
CODE_29B183:        LDY.b $0F                   
                    LDX.b #$0D                  
                    LDA.w $E5F7,y               
CODE_29B18A:        CMP.w $1F17,x               
                    BEQ   CODE_29B195           
                    DEX                         
                    BPL   CODE_29B18A           
                    JSR.w CODE_29B1A1           
CODE_29B195:        DEC.b $0F                   
                    BPL   CODE_29B183           
                    INC.w $0729                 
                    JSL.l CODE_238C1B           
                    RTL                         

CODE_29B1A1:        LDA.b $0F                   
                    JSL.l CODE_20FB1F           

                    dw CODE_29B1AF
                    dw CODE_29B22C
                    dw CODE_29B279
                    dw CODE_29B2AF

CODE_29B1AF:        LDA.w $0727
                    CMP.b #$07                  
                    BEQ   CODE_29B22B           
                    LDX.w $0726                 
                    LDA.w $0715                 
                    CMP.l $7E3967               
                    BCC   CODE_29B22B           
                    BEQ   CODE_29B1C7           
                    JMP.w CODE_29B1DE           

CODE_29B1C7:        LDA.w $0716                 
                    CMP.l $7E3968               
                    BCC   CODE_29B22B           
                    BEQ   CODE_29B1D5           
                    JMP.w CODE_29B1DE           

CODE_29B1D5:        LDA.w $0717                 
                    CMP.l $7E3969               
                    BCC   CODE_29B22B           
CODE_29B1DE:        JSR.w CODE_29B2ED           
                    LDA.l $7E396A               
                    STA.w $1EED,y               
                    STA.w $0500,y               
                    LDA.l $7E396B               
                    STA.w $1F09,y               
                    STA.w $051E,y               
                    LDA.l $7E396C               
                    STA.w $1EFB,y               
                    STA.w $050F,y               
                    LDX.b $0F                   
                    LDA.w $E5F7,x               
                    STA.w $1F17,y               
                    LDA.l $7E3969               
                    CLC                         
                    ADC.b #$40                  
                    STA.l $7E3969               
                    LDA.l $7E3968               
                    ADC.b #$1F                  
                    STA.l $7E3968               
                    LDA.l $7E3967               
                    ADC.b #$00                  
                    STA.l $7E3967               
                    LDA.b #$15                  
                    STA.w $1203                 
CODE_29B22B:        RTS                         

CODE_29B22C:        LDA.l $7E3970               
                    BNE   CODE_29B278           
                    LDA.l $7E3964               
                    CMP.b #$01                  
                    BNE   CODE_29B278           
                    LDA.l $7E3966               
                    CMP.l $7E3965               
                    BCC   CODE_29B278           
                    JSR.w CODE_29B2ED           
                    LDA.b #$0A                  
                    STA.w $1F17,y               
                    LDA.l $7E396A               
                    STA.w $1EED,y               
                    STA.w $0500,y               
                    LDA.l $7E396B               
                    STA.w $1F09,y               
                    STA.w $051E,y               
                    LDA.l $7E396C               
                    STA.w $1EFB,y               
                    STA.w $050F,y               
                    LDA.l $7E3970               
                    INC   A                     
                    STA.l $7E3970               
                    LDA.b #$15                  
                    STA.w $1203                 
CODE_29B278:        RTS                         

CODE_29B279:        LDA.l $7E3971               
                    BNE   CODE_29B2AE           
                    LDA.w $1F48                 
                    CMP.w $1F49                 
                    BNE   CODE_29B2AE           
                    CMP.w $1F51                 
                    BNE   CODE_29B2AE           
                    LDY.b #$00                  
CODE_29B28E:        LDA.w $1F17,y               
                    CMP.b #$03                  
                    BEQ   CODE_29B29B           
                    INY                         
                    CPY.b #$0E                  
                    BNE   CODE_29B28E           
                    RTS                         

CODE_29B29B:        LDA.b #$0B                  
                    STA.w $1F17,y               
                    LDA.l $7E3971               
                    INC   A                     
                    STA.l $7E3971               
                    LDA.b #$15                  
                    STA.w $1203                 
CODE_29B2AE:        RTS                         

CODE_29B2AF:        LDA.l $7E3964               
                    CMP.b #$02                  
                    BNE   CODE_29B2EC           
                    LDA.l $7E3966               
                    CMP.l $7E3965               
                    BCC   CODE_29B2EC           
                    JSR.w CODE_29B2ED           
                    LDA.b #$0C                  
                    STA.w $1F17,y               
                    LDA.w $E5FB                 
                    STA.w $1EED,y               
                    STA.w $0500,y               
                    LDA.w $E5FC                 
                    PHA                         
                    AND.b #$0F                  
                    STA.w $1F09,y               
                    STA.w $051E,y               
                    PLA                         
                    AND.b #$F0                  
                    STA.w $1EFB,y               
                    STA.w $050F,y               
                    LDA.b #$15                  
                    STA.w $1203                 
CODE_29B2EC:        RTS                         

CODE_29B2ED:        LDY.b #$02                  
CODE_29B2EF:        LDA.w $1F17,y               
                    BEQ   CODE_29B2F8           
                    INY                         
                    JMP.w CODE_29B2EF           

CODE_29B2F8:        RTS                         

CODE_29B2F9:        LDA.l $7E396D               
                    BNE   CODE_29B331           
                    LDY.b #$0D                  
                    STY.b $0C                   
                    LDA.w $0729                 
                    CMP.b #$0B                  
                    BNE   CODE_29B323           
                    LDA.w $0596                 
                    BNE   CODE_29B323           
CODE_29B30F:        LDA.w $1F17,y               
                    BEQ   CODE_29B31B           
                    TAX                         
                    LDA.w $E5FD,x               
                    STA.w $053C,y               
CODE_29B31B:        DEY                         
                    CPY.b #$01                  
                    BNE   CODE_29B30F           
                    INC.w $0596                 
CODE_29B323:        LDX.b $0C                   
                    LDA.w $1F17,x               
                    BEQ   CODE_29B32D           
                    JSR.w CODE_29B332           
CODE_29B32D:        DEC.b $0C                   
                    BPL   CODE_29B323           
CODE_29B331:        RTS                         

CODE_29B332:        JSR.w CODE_29BCBE           
                    LDA.w $1F17,x               
                    CMP.b #$10                  
                    BCS   CODE_29B348                   
                    LDY.w $0729                 
                    CPY.b #$0B                  
                    BNE   CODE_29B348           
                    LDY.w $053C,x               
                    BEQ   CODE_29B331           
CODE_29B348:        JSL.l CODE_20FB1F           

                    dw CODE_29B331
                    dw CODE_29B331
                    dw CODE_29B490
                    dw CODE_29B36E
                    dw CODE_29B36E
                    dw CODE_29B36E
                    dw CODE_29B36E
                    dw CODE_29B486
                    dw CODE_29B36E
                    dw CODE_29B36E
                    dw CODE_29B36E
                    dw CODE_29B36E
                    dw CODE_29B486
                    dw CODE_29B486
                    dw CODE_29B486
                    dw CODE_29B486
                    dw CODE_29BCEA

CODE_29B36E:        LDA.w $0729
                    CMP.b #$0D
                    BNE   CODE_29B3C4
                    LDA.w $1F17,x               
                    CMP.b #$09                  
                    BCC   CODE_29B380           
                    CMP.b #$0D                  
                    BCC   CODE_29B385           
CODE_29B380:        LDA.w $1F55                 
                    BNE   CODE_29B3C3           
CODE_29B385:        TXA                         
                    AND.b #$01                  
                    STA.b $0F                   
                    LDA.w $053C                 
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $052D,x               
                    LDA.b $0F                   
                    BEQ   CODE_29B3A0           
                    EOR.w $052D,x               
                    STA.w $052D,x               
CODE_29B3A0:        LDA.b $0F                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $0F                   
                    LDA.w $053C                 
                    AND.b #$1F                  
                    EOR.b $0F                   
                    TAY                         
                    LDA.w $1EFB,x               
                    CLC                         
                    ADC.w $E61D,y               
                    STA.w $050F,x               
                    LDA.w $051E,x               
                    ADC.w $E63D,y               
                    STA.w $051E,x               
CODE_29B3C3:        RTS                         

CODE_29B3C4:        CMP.b #$0B                  
                    BNE   CODE_29B3C3           
                    LDA.w $1F55                 
                    BNE   CODE_29B438           
                    LDY.b $0C                   
                    LDX.b #$01                  
CODE_29B3D1:        LDA.b $43,x                 
                    CMP.w $0500,y               
                    BNE   CODE_29B3EC           
                    LDA.b $45,x                 
                    CMP.w $051E,y               
                    BNE   CODE_29B3EC           
                    LDA.b $47,x                 
                    CMP.w $050F,y               
                    BNE   CODE_29B3EC           
                    LDA.b #$00                  
                    STA.w $053C,y               
                    RTS                         

CODE_29B3EC:        DEX                         
                    BPL   CODE_29B3D1           
                    LDA.w $053C,y               
                    AND.b #$1F                  
                    BNE   CODE_29B3FE           
                    LDA.w $0783,y               
                    AND.b #$03                  
                    JSR.w CODE_29B6DA           
CODE_29B3FE:        LDY.b $0C                   
                    LDA.w $1F17,y               
                    BEQ   CODE_29B438           
                    CMP.b #$03                  
                    BCC   CODE_29B418           
                    CMP.b #$07                  
                    BCS   CODE_29B418                   
                    LDA.b $15                   
                    AND.b #$0F                  
                    BNE   CODE_29B418           
                    LDA.b #$36                  
                    STA.w $1200                 
CODE_29B418:        LDX.w $052D,y               
                    LDA.w $0500,y               
                    CLC                         
                    ADC.w $E611,x               
                    STA.w $0500,y               
                    LDA.w $050F,y               
                    CLC                         
                    ADC.w $E615,x               
                    STA.w $050F,y               
                    LDA.w $051E,y               
                    ADC.w $E619,x               
                    STA.w $051E,y               
CODE_29B438:        LDX.b $0C                   
                    JSR.w CODE_29B6CD           
                    DEC.w $053C,x               
                    BNE   CODE_29B476           
                    LDA.w $1F55                 
                    BNE   CODE_29B476           
                    LDY.b #$0D                  
CODE_29B449:        CPY.b $0C                   
                    BEQ   CODE_29B473           
                    LDA.w $1F17,y               
                    BEQ   CODE_29B473           
                    CMP.b #$10                  
                    BCS   CODE_29B473                   
                    LDA.w $053C,y               
                    BNE   CODE_29B473           
                    LDA.w $0500,y               
                    CMP.w $0500,x               
                    BNE   CODE_29B473           
                    LDA.w $051E,y               
                    CMP.w $051E,x               
                    BNE   CODE_29B473           
                    LDA.w $050F,y               
                    CMP.w $050F,x               
                    BEQ   CODE_29B477           
CODE_29B473:        DEY                         
                    BNE   CODE_29B449           
CODE_29B476:        RTS                         

CODE_29B477:        LDA.b #$20                  
                    STA.w $053C,x               
                    CPY.b #$01                  
                    BEQ   CODE_29B485           
                    LDA.b #$20                  
                    STA.w $053C,y               
CODE_29B485:        RTS                         

CODE_29B486:        LDA.w $0729                 
                    CMP.b #$0B                  
                    BNE   CODE_29B485           
                    JMP.w CODE_29B438           

CODE_29B490:        LDA.w $0729                 
                    CMP.b #$0D                  
                    BNE   CODE_29B4BC           
                    LDA.b #$00                  
                    STA.b $0E                   
                    LDY.w $0726                 
                    LDA.w $45,y               
                    CMP.w $051F                 
                    BEQ   CODE_29B4AA           
                    BCS   CODE_29B4B6                   
                    BCC   CODE_29B4B2           
CODE_29B4AA:        LDA.w $47,y               
                    CMP.w $0510                 
                    BCS   CODE_29B4B6                   
CODE_29B4B2:        LDA.b #$01                  
                    STA.b $0E                   
CODE_29B4B6:        LDA.b $0E                   
                    STA.w $052E                 
CODE_29B4BB:        RTS                         

CODE_29B4BC:        LDA.w $0743                 
                    ASL   A                     
                    TAY                         
                    LDA.w $E65D,y               
                    STA.b $00                   
                    LDA.w $E65E,y               
                    STA.b $01                   
                    LDA.w $E68D,y               
                    STA.b $02                   
                    LDA.w $E68E,y               
                    STA.b $03                   
                    LDA.w $0729                 
                    CMP.b #$04                  
                    BNE   CODE_29B512           
                    LDA.l $7E396F               
                    BEQ   CODE_29B4E5           
                    JMP.w CODE_29B626           

CODE_29B4E5:        LDA.b #$00                  
                    STA.w $053D                 
                    LDY.w $1F2F                 
                    CPY.b #$06                  
                    BCS   CODE_29B50D                   
                    LDA.b ($00),y               
                    STA.w $0501                 
                    STA.w $1EEE                 
                    LDA.b ($02),y               
                    PHA                         
                    AND.b #$0F                  
                    STA.w $051F                 
                    STA.w $1F0A                 
                    PLA                         
                    AND.b #$F0                  
                    STA.w $0510                 
                    STA.w $1EFC                 
CODE_29B50D:        LDX.b #$01                  
                    JMP.w CODE_29B6CD           

CODE_29B512:        LDA.w $053D                 
                    BEQ   CODE_29B4BB           
                    LDA.b $9D                   
                    BEQ   CODE_29B51E           
                    JMP.w CODE_29B626           

CODE_29B51E:        LDY.w $1F2F                 
                    CPY.b #$06                  
                    BCC   CODE_29B528           
                    JMP.w CODE_29B58F           

CODE_29B528:        LDA.w $051F                 
                    ORA.w $0510                 
                    CMP.b ($02),y               
                    BNE   CODE_29B539           
                    LDA.w $0501                 
                    CMP.b ($00),y               
                    BEQ   CODE_29B589           
CODE_29B539:        LDA.b ($00),y               
                    STA.b $04                   
                    LDA.b ($02),y               
                    AND.b #$0F                  
                    STA.b $06                   
                    LDA.b ($02),y               
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.b $04                   
                    SEC                         
                    SBC.b #$20                  
                    STA.b $04                   
                    LDA.b $05                   
                    SEC                         
                    SBC.b #$20                  
                    STA.b $05                   
                    LDA.b $06                   
                    SBC.b #$00                  
                    STA.b $06                   
                    LDX.w $072B                 
                    DEX                         
CODE_29B561:        LDA.l $7E397D,x             
                    SEC                         
                    SBC.b $04                   
                    CMP.b #$41                  
                    BCS   CODE_29B583                   
                    LDA.l $7E3981,x             
                    SEC                         
                    SBC.b $05                   
                    STA.b $05                   
                    LDA.l $7E397F,x             
                    SBC.b $06                   
                    BNE   CODE_29B583           
                    LDA.b $05                   
                    CMP.b #$41                  
                    BCC   CODE_29B589           
CODE_29B583:        DEX                         
                    BPL   CODE_29B561           
                    JMP.w CODE_29B597           

CODE_29B589:        INC.w $1F2F                 
                    JMP.w CODE_29B51E           

CODE_29B58F:        LDX.b $0C                   
                    LDA.b #$00                  
                    STA.w $053D                 
                    RTS                         

CODE_29B597:        LDX.b $0C                   
                    LDY.w $1F2F                 
                    LDA.b #$00                  
                    STA.w $052E                 
                    STA.b $A4                   
                    LDA.b ($00),y               
                    SEC                         
                    SBC.w $0501                 
                    STA.b $9E                   
                    LDA.b ($02),y               
                    AND.b #$F0                  
                    SEC                         
                    SBC.w $0510                 
                    STA.b $A2                   
                    LDA.b ($02),y               
                    AND.b #$0F                  
                    SBC.w $051F                 
                    STA.b $A1                   
                    LDA.b ($02),y               
                    AND.b #$0F                  
                    CMP.w $051F                 
                    BEQ   CODE_29B5CB           
                    BPL   CODE_29B5EB           
                    BMI   CODE_29B5D4           
CODE_29B5CB:        LDA.b ($02),y               
                    AND.b #$F0                  
                    CMP.w $0510                 
                    BCS   CODE_29B5EB                   
CODE_29B5D4:        LDA.b #$01                  
                    STA.b $A4                   
                    LDA.b #$FF                  
                    EOR.b $A1                   
                    STA.b $A1                   
                    LDA.b #$FF                  
                    EOR.b $A2                   
                    STA.b $A2                   
                    INC.b $A2                   
                    LDA.b #$01                  
                    STA.w $052E                 
CODE_29B5EB:        LDA.b ($00),y               
                    CMP.w $0501                 
                    BCS   CODE_29B600                   
                    LDA.b #$FF                  
                    EOR.b $9E                   
                    STA.b $9E                   
                    INC.b $9E                   
                    LDA.b $A4                   
                    ORA.b #$02                  
                    STA.b $A4                   
CODE_29B600:        LDY.b #$04                  
CODE_29B602:        CLC                         
                    LSR.b $9E                   
                    ROR.b $9F                   
                    CLC                         
                    LSR.b $A1                   
                    ROR.b $A2                   
                    ROR.b $A3                   
                    DEY                         
                    BPL   CODE_29B602           
                    LDA.b $A2                   
                    STA.b $A1                   
                    LDA.b $A3                   
                    STA.b $A2                   
                    LDA.b #$00                  
                    STA.b $A3                   
                    LDA.b #$01                  
                    STA.b $9D                   
                    LDA.b #$20                  
                    STA.w $0711                 
CODE_29B626:        LDA.w $0711                 
                    BEQ   CODE_29B630           
                    JSL.l CODE_23878D           
                    RTS                         

CODE_29B630:        LDA.l $7E396F               
                    BEQ   CODE_29B641           
                    LDA.b #$00                  
                    STA.w $053D                 
                    STA.w $1F2F                 
                    JMP.w CODE_29B6CD           

CODE_29B641:        LDA.b #$47                  
                    STA.w $1203                 
                    LDX.b #$01                  
                    LDA.b $15                   
                    AND.b #$03                  
                    BEQ   CODE_29B651           
                    JMP.w CODE_29B6CD           

CODE_29B651:        LDA.b $A4                   
                    AND.b #$01                  
                    BNE   CODE_29B671           
                    LDA.b $A3                   
                    CLC                         
                    ADC.b $A2                   
                    STA.b $A3                   
                    LDA.w $0510                 
                    ADC.b $A1                   
                    STA.w $0510                 
                    LDA.w $051F                 
                    ADC.b #$00                  
                    STA.w $051F                 
                    JMP.w CODE_29B688           

CODE_29B671:        LDA.b $A3                   
                    SEC                         
                    SBC.b $A2                   
                    STA.b $A3                   
                    LDA.w $0510                 
                    SBC.b $A1                   
                    STA.w $0510                 
                    LDA.w $051F                 
                    SBC.b #$00                  
                    STA.w $051F                 
CODE_29B688:        LDA.b $A4                   
                    AND.b #$02                  
                    BNE   CODE_29B6A0           
                    LDA.b $A0                   
                    CLC                         
                    ADC.b $9F                   
                    STA.b $A0                   
                    LDA.w $0501                 
                    ADC.b $9E                   
                    STA.w $0501                 
                    JMP.w CODE_29B6AF           

CODE_29B6A0:        LDA.b $A0                   
                    SEC                         
                    SBC.b $9F                   
                    STA.b $A0                   
                    LDA.w $0501                 
                    SBC.b $9E                   
                    STA.w $0501                 
CODE_29B6AF:        LDX.b #$01                  
                    DEC.w $053D                 
                    BNE   CODE_29B6CD           
                    LDA.w $0501                 
                    STA.w $1EEE                 
                    LDA.w $051F                 
                    STA.w $1F0A                 
                    LDA.w $0510                 
                    STA.w $1EFC                 
                    LDX.b #$01                  
                    INC.w $1F2F                 
CODE_29B6CD:        LDA.w $050F,x               
                    STA.w $1EFB,x               
                    LDA.w $051E,x               
                    STA.w $1F09,x               
                    RTS                         

CODE_29B6DA:        STA.b $00                   
                    LDA.b #$04                  
                    STA.b $01                   
CODE_29B6E0:        LDY.b $0C                   
                    DEC.b $00                   
                    LDA.w $0783,y               
                    ASL   A                     
                    BCC   CODE_29B6EE           
                    INC.b $00                   
                    INC.b $00                   
CODE_29B6EE:        LDA.b $00                   
                    AND.b #$03                  
                    STA.b $00                   
                    EOR.w $052D,y               
                    CMP.b #$01                  
                    BEQ   CODE_29B6E0           
                    DEC.b $01                   
                    BPL   CODE_29B707           
                    LDA.b #$00                  
                    STA.w $053C,y               
                    PLA                         
                    PLA                         
                    RTS                         

CODE_29B707:        BNE   CODE_29B710           
                    LDA.w $052D,y               
                    EOR.b #$01                  
                    STA.b $00                   
CODE_29B710:        LDX.b $00                   
                    JSR.w CODE_29B778           
                    LDA.b $00                   
                    ASL   A                     
                    TAX                         
                    LDA.w $8DBC,x               
                    STA.b $0E                   
                    LDA.w $8DBD,x               
                    STA.b $0F                   
                    LDY.b $02                   
                    LDA.b [$2E],y               
                    LDY.b #$08                  
CODE_29B729:        CMP.b ($0E),y               
                    BEQ   CODE_29B732           
                    DEY                         
                    BPL   CODE_29B729           
                    BMI   CODE_29B6E0           
CODE_29B732:        LDY.b $0C                   
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$04                  
                    TAX                         
                    JSR.w CODE_29B778           
                    LDY.b $02                   
                    LDA.b [$2E],y               
                    LDY.b #$11                  
CODE_29B743:        CMP.w $E7FC,y               
                    BNE   CODE_29B74B           
                    JMP.w CODE_29B6E0           

CODE_29B74B:        DEY                         
                    BNE   CODE_29B743           
                    LDX.b $0C                   
                    LDY.b #$04                  
CODE_29B752:        CMP.w $E80D,y               
                    BEQ   CODE_29B767           
                    DEY                         
                    BNE   CODE_29B752           
                    PHA                         
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    AND.b #$03                  
                    TAY                         
                    PLA                         
                    CMP.w $1E9A,y               
                    BCC   CODE_29B772           
CODE_29B767:        LDA.b #$20                  
                    CMP.w $053C,x               
                    BNE   CODE_29B772           
                    ASL   A                     
                    STA.w $053C,x               
CODE_29B772:        LDA.b $00                   
                    STA.w $052D,x               
                    RTS                         

CODE_29B778:        LDA.w $0500,y               
                    CLC                         
                    ADC.w $E7E5,x               
                    STA.b $02                   
                    LDA.w $050F,y               
                    CLC                         
                    ADC.w $E7ED,x               
                    STA.b $03                   
                    LDA.w $051E,y               
                    ADC.w $E7F5,x               
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_218200,x             
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $2E                   
                    LDA   PNTR_218200+1,x             
                    ADC.b #$00                  
                    STA.b $2F                   
                    LDA.b $03                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $02                   
                    STA.b $02                   
                    RTS                         

CODE_29B7AE:        JSR.w CODE_29B2F9           
                    JSR.w CODE_29BD33           
                    LDA.b #$0D                  
                    STA.b $0C                   
                    INC.w $1F25                 
                    LDA.w $1F25                 
                    CMP.b #$0B                  
                    BCC   CODE_29B7C5           
                    STZ.w $1F25                 
CODE_29B7C5:        STZ.b $05                   
                    LDY.b $0C                   
                    BEQ   CODE_29B7DD           
                    DEY                         
                    TYA                         
                    CLC                         
                    ADC.w $1F25                 
                    CMP.b #$0B                  
                    BCC   CODE_29B7D7           
                    SBC.b #$0B                  
CODE_29B7D7:        TAX                         
                    LDA.w $E872,x               
                    STA.b $05                   
CODE_29B7DD:        LDX.b $0C                   
                    LDA.w $0587,x               
                    BEQ   CODE_29B7E7           
                    JSR.w CODE_29B7FC           
CODE_29B7E7:        DEC.b $0C                   
                    BPL   CODE_29B7C5           
CODE_29B7EB:        LDA.w $0729                 
                    CMP.b #$0D                  
                    BNE   CODE_29B7FB           
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_29B7FB           
                    INC.w $053C                 
CODE_29B7FB:        RTL                         

CODE_29B7FC:        LDA.w $1F17,x               
                    CPX.b $A5                   
                    BNE   CODE_29B808           
                    CPX.b #$00                  
                    BEQ   CODE_29B808           
                    RTS                         

CODE_29B808:        JSL.l CODE_20FB1F           

                    dw CODE_29B331
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E
                    dw CODE_29B82E

CODE_29B82E:        LDA.b #$00                  
                    LDY.w $1F17,x               
                    CPY.b #$10                  
                    BNE   CODE_29B840           
                    LDY.w $0500,x               
                    CPY.b #$F0                  
                    BEQ   CODE_29B840           
                    LDA.b #$07                  
CODE_29B840:        LDY.b $05                   
                    CLC                         
                    ADC.w $0500,x               
                    STA.w $0899,y               
                    LDA.w $050F,x               
                    SEC                         
                    SBC.w $0210                 
                    STA.w $0898,y               
                    LDX.b $0C                   
                    LDA.w $1F17,x               
                    STA.b $07                   
                    LDX.b #$08                  
                    CMP.b #$10                  
                    BCS   CODE_29B879                   
                    CMP.b #$01                  
                    BNE   CODE_29B869           
                    LDX.b #$30                  
                    JMP.w CODE_29B879           

CODE_29B869:        LDA.w $0729                 
                    CMP.b #$0B                  
                    BNE   CODE_29B879           
                    LDY.b $0C                   
                    LDA.w $053C,y               
                    BEQ   CODE_29B879           
                    LDX.b #$04                  
CODE_29B879:        STX.b $08                   
                    LDA.b $07                   
                    ASL   A                     
                    CLC                         
                    ADC.b $07                   
                    TAX                         
                    CPX.b #$09                  
                    BCC   CODE_29B897           
                    CPX.b #$30                  
                    BEQ   CODE_29B897           
                    CPX.b #$27                  
                    BCC   CODE_29B892           
                    CPX.b #$30                  
                    BCC   CODE_29B897           
CODE_29B892:        LDA.w $1F55                 
                    BNE   CODE_29B89F           
CODE_29B897:        INX                         
                    LDA.b $15                   
                    AND.b $08                   
                    BEQ   CODE_29B89F           
                    INX                         
CODE_29B89F:        LDY.b $05                   
                    LDA.w $E80F,x               
                    STA.w $089A,y               
                    LDA.w $E83F,x               
                    STA.w $089B,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b #$02                  
                    STA.w $0A46,x               
                    LDX.b $0C                   
                    LDA.w $1F17,x               
                    CMP.b #$01                  
                    BEQ   CODE_29B8C3           
                    CMP.b #$10                  
                    BCC   CODE_29B8C4           
CODE_29B8C3:        RTS                         

CODE_29B8C4:        CMP.b #$07                  
                    BEQ   CODE_29B8DD           
                    CMP.b #$09                  
                    BCC   CODE_29B8D0           
                    CMP.b #$0D                  
                    BCC   CODE_29B8DD           
CODE_29B8D0:        LDA.w $052D,x               
                    BNE   CODE_29B8DD           
                    LDA.w $089B,y               
                    EOR.b #$40                  
                    STA.w $089B,y               
CODE_29B8DD:        LDY.b $0C                   
                    LDA.w $1F17,y               
                    CMP.b #$02                  
                    BEQ   CODE_29B8F3           
                    CMP.b #$09                  
                    BCC   CODE_29B8EE           
                    CMP.b #$10                  
                    BCC   CODE_29B8F3           
CODE_29B8EE:        LDA.w $1F55                 
                    BNE   CODE_29B953           
CODE_29B8F3:        LDA.w $0417                 
                    BNE   CODE_29B953           
                    LDA.w $0710                 
                    BNE   CODE_29B953           
                    LDA.w $0729                 
                    CMP.b #$0D                  
                    BNE   CODE_29B953           
                    LDX.w $0726                 
                    LDA.w $1EED,y               
                    CMP.b $43,x                 
                    BNE   CODE_29B953           
                    LDA.w $1F09,y               
                    CMP.b $45,x                 
                    BNE   CODE_29B953           
                    LDA.w $1EFB,y               
                    CMP.b $47,x                 
                    BNE   CODE_29B953           
                    LDX.w $0726                 
                    LDA.b #$00                  
                    STA.w $073F,x               
                    STA.w $0728                 
                    LDA.w $1F17,y               
                    STA.b $1E                   
                    CMP.b #$09                  
                    BEQ   CODE_29B934           
                    CMP.b #$0A                  
                    BNE   CODE_29B93D           
CODE_29B934:        LDA.l $7E396D               
                    INC   A                     
                    STA.l $7E396D               
CODE_29B93D:        PHB                         
                    LDA.b #$7E                  
                    PHA                         
                    PLB                         
                    LDA.w $3956,y               
                    STA.w $3963                 
                    PLB                         
                    LDA.b #$0F                  
                    STA.w $0729                 
                    PLA                         
                    PLA                         
                    JMP.w CODE_29B7EB           

CODE_29B953:        RTS                         

                    LDX.w $0726                 
                    LDA.b $4B,x                 
                    EOR.b #$03                  
                    CMP.b #$03                  
                    BNE   CODE_29B961           
                    EOR.b #$0F                  
CODE_29B961:        STA.b $4B,x                 
                    RTS                         

                    LDX.w $0726                 
                    LDA.b $43,x                 
                    CLC                         
                    ADC.w $E87E,y               
                    STA.b $0E                   
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $E886,y               
                    STA.b $0F                   
                    LDA.b $45,x                 
                    ADC.w $E882,y               
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_218200,x             
                    STA.b $2E                   
                    LDA   PNTR_218200+1,x             
                    STA.b $2F                   
                    INC.b $2F                   
                    LDA.b $0F                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $0F                   
                    LDA.b $0E                   
                    AND.b #$F0                  
                    ORA.b $0F                   
                    TAY                         
                    LDA.b ($2E),y               
                    RTS                         

CODE_29B99E:        LDX.w $0738                 
                    LDA.w $1DC6,x               
                    CMP.b #$09                  
                    BCC   CODE_29B9C4           
                    LDA.b #$01                  
                    STA.b $92                   
                    LDX.w $0726                 
                    LDA.l $7E3991               
                    TAY                         
                    INY                         
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CMP.b $49,x                 
                    BEQ   CODE_29B9C4           
                    JSL.l CODE_238C1B           
                    RTS                         

CODE_29B9C4:        LDA.w $59                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29B9D5
                    dw CODE_29A8D7
                    dw CODE_29BA66

CODE_29B9D1:        JSR.w CODE_29B9C4           
                    RTL                         

CODE_29B9D5:        LDA.b #$24                  
                    STA.w $1203                 
                    LDX.b #$07                  
CODE_29B9DC:        LDA.w $E88A,x               
                    STA.b $8A,x                 
                    DEX                         
                    BPL   CODE_29B9DC           
                    LDX.b $92                   
                    BNE   CODE_29B9F0           
                    LDA.b #$80                  
                    STA.b $7F                   
                    STA.b $80                   
                    BNE   CODE_29BA45           
CODE_29B9F0:        CPX.b #$01                  
                    BNE   CODE_29BA10           
                    LDX.w $0726                 
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $0210                 
                    STA.b $7F                   
                    LDA.b $43,x                 
                    STA.b $80                   
                    LDA.b #$86                  
                    STA.w $0411                 
                    LDA.b #$D0                  
                    STA.w $0412                 
                    JMP.w CODE_29BA2B           

CODE_29BA10:        LDA.b #$88                  
                    STA.b $7F                   
                    LDA.b #$5C                  
                    STA.b $80                   
                    LDX.w $0726                 
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $0210                 
                    STA.w $0411                 
                    LDA.b $43,x                 
                    STA.w $0412                 
                    INC.b $59                   
CODE_29BA2B:        LDX.b $7F                   
                    LDA.w $0411                 
                    JSR.w CODE_29BC37           
                    STA.b $7D                   
                    STX.w $03FF                 
                    LDX.b $80                   
                    LDA.w $0412                 
                    JSR.w CODE_29BC37           
                    STA.b $88                   
                    STX.w $0400                 
CODE_29BA45:        LDA.b #$00                  
                    STA.b $85                   
                    STA.b $87                   
                    STA.b $79                   
                    LDA.b #$4C                  
                    STA.b $86                   
                    LDA.b #$09                  
                    STA.b $82                   
                    INC.w $0059                 
                    LDX.b $92                   
                    CPX.b #$02                  
                    BEQ   CODE_29BA62           
                    JSL.l CODE_238C1B           
CODE_29BA62:        RTS                         

                    JMP.w CODE_29BAF9           

CODE_29BA66:        LDA.b $87                   
                    BNE   CODE_29BA7A           
                    LDA.b $79                   
                    CLC                         
                    ADC.b #$04                  
                    CMP.b #$5F                  
                    BCS   CODE_29BA76                   
                    JMP.w CODE_29BAF7           

CODE_29BA76:        LDA.b #$01                  
                    STA.b $87                   
CODE_29BA7A:        LDA.b $92                   
                    BEQ   CODE_29BABA           
                    LDA.b $7F                   
                    CMP.w $0411                 
                    BCS   CODE_29BA91                   
                    ADC.w $03FF                 
                    TAX                         
                    DEC.b $7D                   
                    BMI   CODE_29BA9A           
                    INX                         
                    JMP.w CODE_29BA9A           

CODE_29BA91:        SBC.w $03FF                 
                    TAX                         
                    DEC.b $7D                   
                    BMI   CODE_29BA9A           
                    DEX                         
CODE_29BA9A:        STX.b $7F                   
                    LDA.b $80                   
                    CMP.w $0412                 
                    BCS   CODE_29BAAF                   
                    ADC.w $0400                 
                    TAX                         
                    DEC.b $88                   
                    BMI   CODE_29BAB8           
                    INX                         
                    JMP.w CODE_29BAB8           

CODE_29BAAF:        SBC.w $0400                 
                    TAX                         
                    DEC.b $88                   
                    BMI   CODE_29BAB8           
                    DEX                         
CODE_29BAB8:        STX.b $80                   
CODE_29BABA:        LDA.b $79                   
                    SEC                         
                    SBC.b #$04                  
                    BNE   CODE_29BAF7           
                    LDA.b #$00                  
                    STA.w $59                 
                    STA.b $87                   
                    LDA.b $92                   
                    CMP.b #$02                  
                    BEQ   CODE_29BAEC           
                    LDX.w $0738                 
                    LDA.w $1DC6,x               
                    CMP.b #$09                  
                    BCC   CODE_29BAEC           
                    SEC                         
                    SBC.b #$0A                  
                    STA.l $7E3991               
                    LDX.w $0726                 
                    TAY                         
                    INY                         
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $49,x                 
CODE_29BAEC:        LDX.b $92                   
                    CPX.b #$02                  
                    BEQ   CODE_29BAF6           
                    JSL.l CODE_238C1B           
CODE_29BAF6:        RTS                         

CODE_29BAF7:        STA.b $79                   
CODE_29BAF9:        LDA.b $84                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $84                   
                    BCC   CODE_29BB0E           
                    LDA.b $85                   
                    EOR.b #$01                  
                    STA.b $85                   
                    TAX                         
                    LDA.w $E8A2,x               
                    STA.b $86                   
CODE_29BB0E:        LDY.b #$00                  
                    LDX.b #$07                  
                    LDA.b $7E                   
                    CLC                         
                    ADC.b #$70                  
                    STA.b $7E                   
                    BCC   CODE_29BB1D           
                    LDY.b #$01                  
CODE_29BB1D:        STY.b $81                   
CODE_29BB1F:        LDA.b $8A,x                 
                    CLC                         
                    ADC.b $81                   
                    AND.b #$1F                  
                    STA.b $8A,x                 
                    JSR.w CODE_29BB3C           
                    JSR.w CODE_29BBF3           
                    DEX                         
                    BPL   CODE_29BB1F           
                    LDX.b $92                   
                    CPX.b #$02                  
                    BEQ   CODE_29BB3B           
                    JSL.l CODE_238C1B           
CODE_29BB3B:        RTS                         

CODE_29BB3C:        LDA.b $8A,x                 
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $E892,y               
                    STA.b $00                   
                    LDA.b $79                   
                    LDY.b $82                   
                    JSR.w CODE_29BBD4           
                    LDA.b $8A,x                 
                    AND.b #$18                  
                    CMP.b #$10                  
                    BCC   CODE_29BB60           
                    LDA.b #$FF                  
                    STA.b $00                   
                    LDA.b $7F                   
                    SBC.b $02                   
                    JMP.w CODE_29BB68           

CODE_29BB60:        LDA.b #$01                  
                    STA.b $00                   
                    LDA.b $7F                   
                    ADC.b $02                   
CODE_29BB68:        STA.b $69,x                 
                    STA.b $06                   
                    LDA.b $7F                   
                    STA.b $07                   
                    JSR.w CODE_29BC17           
                    LDA.b $05                   
                    BMI   CODE_29BBC9           
                    LDA.b $69,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.b $09                   
                    STA.b $06                   
                    JSR.w CODE_29BC17           
                    LDA.b $05                   
                    BMI   CODE_29BBC9           
                    LDA.b $8A,x                 
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $E892,y               
                    STA.b $00                   
                    LDA.b $79                   
                    LDY.b $82                   
                    JSR.w CODE_29BBD4           
                    LDA.b $8A,x                 
                    SEC                         
                    SBC.b #$08                  
                    AND.b #$18                  
                    CMP.b #$10                  
                    BCC   CODE_29BBB1           
                    LDA.b #$FF                  
                    STA.b $00                   
                    LDA.b $80                   
                    SBC.b $02                   
                    JMP.w CODE_29BBB9           

CODE_29BBB1:        LDA.b #$01                  
                    STA.b $00                   
                    LDA.b $80                   
                    ADC.b $02                   
CODE_29BBB9:        STA.b $71,x                 
                    STA.b $06                   
                    LDA.b $80                   
                    STA.b $07                   
                    JSR.w CODE_29BC17           
                    LDA.b $05                   
                    BMI   CODE_29BBC9           
                    RTS                         

CODE_29BBC9:        LDA.b #$F0                  
                    STA.b $71,x                 
                    LDA.b #$00                  
                    STA.b $69,x                 
                    STA.b $09                   
                    RTS                         

CODE_29BBD4:        STA.b $01                   
                    LDA.b #$00                  
                    STA.b $02                   
                    STA.b $03                   
CODE_29BBDC:        ASL.b $03                   
                    ROL.b $02                   
                    ASL.b $00                   
                    BCC   CODE_29BBEF           
                    LDA.b $03                   
                    CLC                         
                    ADC.b $01                   
                    STA.b $03                   
                    BCC   CODE_29BBEF           
                    INC.b $02                   
CODE_29BBEF:        DEY                         
                    BNE   CODE_29BBDC           
                    RTS                         

CODE_29BBF3:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $69,x                 
                    STA.w $0898,y               
                    LDA.b $71,x                 
                    STA.w $0899,y               
                    LDA.b $86                   
                    STA.w $089A,y               
                    LDA.b #$32                  
                    STA.w $089B,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A46,y               
                    PLY                         
                    RTS                         

CODE_29BC17:        LDA.b $06                   
                    EOR.b $07                   
                    AND.b #$80                  
                    BEQ   CODE_29BC2D           
                    LDA.b $00                   
                    BPL   CODE_29BC29           
                    LDA.b $06                   
                    BMI   CODE_29BC32           
                    BPL   CODE_29BC2D           
CODE_29BC29:        LDA.b $06                   
                    BPL   CODE_29BC32           
CODE_29BC2D:        LDA.b #$01                  
                    STA.b $05                   
                    RTS                         

CODE_29BC32:        LDA.b #$FF                  
                    STA.b $05                   
                    RTS                         

CODE_29BC37:        STX.b $03                   
                    STA.b $04                   
                    SEC                         
                    SBC.b $03                   
                    STA.b $00                   
                    LDA.b $04                   
                    CMP.b $03                   
                    BCS   CODE_29BC4E                   
                    LDA.b $00                   
                    EOR.b #$FF                  
                    ADC.b #$01                  
                    STA.b $00                   
CODE_29BC4E:        LDA.b #$00                  
                    STA.b $02                   
                    LDY.b #$07                  
CODE_29BC54:        ASL.b $02                   
                    ROL.b $00                   
                    ROL   A                     
                    BCS   CODE_29BC5F                   
                    CMP.b #$17                  
                    BCC   CODE_29BC63           
CODE_29BC5F:        SBC.b #$17                  
                    INC.b $02                   
CODE_29BC63:        DEY                         
                    BPL   CODE_29BC54           
                    LDX.b $02                   
                    RTS                         

CODE_29BC69:        LDX.w $0726                 
                    LDA.w $073F,x               
                    BNE   CODE_29BCBD           
                    LDY.b #$06                  
                    LDA.b $43,x                 
CODE_29BC75:        CMP.w $E8A4,y               
                    BEQ   CODE_29BC7F           
                    DEY                         
                    BPL   CODE_29BC75           
                    LDY.b #$07                  
CODE_29BC7F:        STY.b $0C                   
                    LDA.b $45,x                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $00                   
                    LDA.b $47,x                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $00                   
                    TAY                         
                    CPX.b #$00                  
                    BEQ   CODE_29BC9B           
                    TYA                         
                    CLC                         
                    ADC.b #$40                  
                    TAY                         
CODE_29BC9B:        LDX.b $0C                   
                    LDA.w $1D00,y               
                    ORA.w $E8AB,x               
                    STA.w $1D00,y               
                    LDA.b $B3                   
                    CMP.b #$60                  
                    BEQ   CODE_29BCB0           
                    CMP.b #$E3                  
                    BNE   CODE_29BCBD           
CODE_29BCB0:        TYA                         
                    EOR.b #$40                  
                    TAY                         
                    LDA.w $1D00,y               
                    ORA.w $E8AB,x               
                    STA.w $1D00,y               
CODE_29BCBD:        RTS                         

CODE_29BCBE:        LDY.b #$00                  
                    LDA.w $1F09,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $01                   
                    LDA.w $1EFB,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $01                   
                    STA.b $01                   
                    LDA.b $23                   
                    SEC                         
                    SBC.b #$02                  
                    CMP.b $01                   
                    BCC   CODE_29BCE5           
                    LDA.b $24                   
                    CMP.b $01                   
                    BCS   CODE_29BCE5                   
                    LDY.b #$01                  
CODE_29BCE5:        TYA                         
                    STA.w $0587,x               
                    RTS                         

CODE_29BCEA:        LDY.w $0726                 
                    LDA.w $0597                 
                    BEQ   CODE_29BD0D           
                    LDA.w $43,y               
                    STA.w $1EED,x               
                    STA.w $0500,x               
                    LDA.w $47,y               
                    STA.w $1EFB,x               
                    STA.w $050F,x               
                    LDA.w $45,y               
                    STA.w $1F09,x               
                    STA.w $051E,x               
CODE_29BD0D:        LDA.w $49,y               
                    ORA.w $073F,y               
                    BNE   CODE_29BD32           
                    LDA.w $43,y               
                    CMP.w $0500,x               
                    BNE   CODE_29BD32           
                    LDA.w $45,y               
                    CMP.w $051E,x               
                    BNE   CODE_29BD32           
                    LDA.w $47,y               
                    CMP.w $050F,x               
                    BNE   CODE_29BD32           
                    LDA.b #$01                  
                    STA.w $0597                 
CODE_29BD32:        RTS                         

CODE_29BD33:        NOP                         
                    RTS                         

CODE_29BD35:        LDX.w $0727                 
                    CPX.b #$07                  
                    BNE   CODE_29BD4D           
                    LDY.w $0726                 
                    LDA.w $45,y               
                    CMP.b #$03                  
                    BNE   CODE_29BD4D           
                    LDA.b #$FF                  
                    STA.w $0243                 
                    BRA   CODE_29BD70           

CODE_29BD4D:        LDY.w $0599                 
                    DEC.w $059A                 
                    BPL   CODE_29BD70           
                    STZ.w $0243                 
                    INY                         
                    TYA                         
                    AND.b #$03                  
                    STA.w $0599                 
                    TAY                         
                    TXA                         
                    ASL   A                     
                    ASL   A                     
                    ORA.w $0599                 
                    TAX                         
                    LDA.w $E8E9,x               
                    STA.w $059A                 
                    STY.w $0244                 
CODE_29BD70:        LDA.w $0243                 
                    BMI   CODE_29BDCB           
                    CMP.b #$08                  
                    BCC   CODE_29BD7F           
                    LDA.b #$FF                  
                    STA.w $0243                 
                    RTL                         

CODE_29BD7F:        STZ.b $00                   
                    LDX.w $0727                 
                    CPX.b #$04                  
                    BNE   CODE_29BD8C           
                    LDA.b #$04                  
                    STA.b $00                   
CODE_29BD8C:        LDA.w $0244                 
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    LDA.w $E90D,x               
                    STA.w $0242                 
                    LDA.w $E915,x               
                    STA.w $0241                 
                    LDA.w $E91D,x               
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
                    LDA.w #$2000                
                    CLC                         
                    ADC.w $E935,y               
                    STA.w $023E                 
                    SEP   #$20                  
                    INC.w $0243                 
CODE_29BDCB:        RTL                         

                   db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF

DATA_29BE00:        db $03,$67,$BF,$E9,$03,$67,$BF,$E9

CODE_29BE08:        JSR.w CODE_29BE10
                    JSL.l CODE_20990B
                    RTS                 

CODE_29BE10:        LDX.b #$00                  
CODE_29BE12:        LDA.b #$02                  
                    JSL.l CODE_2098A8           
                    JSL.l CODE_209844           
                    CPX.b #$F0                  
                    BNE   CODE_29BE12           
                    RTS                         

CODE_29BE21:        JSR.w CODE_29BE10           
                    STZ.w $420C                 
                    LDY.b #$80                  
                    LDA.w $072B                 
                    CMP.b #$02                  
                    BEQ   CODE_29BE32           
                    LDY.b #$40                  
CODE_29BE32:        STY.b $DC                   
                    LDA.b #$7E                  
                    STA.b $30                   
                    STA.b $DA                   
                    LDA.w $0727                 
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.l $218200               
                    CLC                         
                    ADC.w #$0110                
                    STA.b $2E                   
                    CLC                         
                    ADC.w #$2000                
                    STA.b $D8                   
                    PHX                         
                    TYX                         
                    LDA.l $2AE256,x             
                    STA.b $00                   
                    PLX                         
                    SEP   #$20                  
                    LDA.b #$2A                  
                    STA.b $02                   
CODE_29BE60:        LDY.b #$00                  
CODE_29BE62:        LDA.b [$00],y               
                    CMP.b #$FF                  
                    BEQ   CODE_29BE99           
                    CMP.b #$03                  
                    BCS   CODE_29BE79                   
                    PHA                         
                    LDA.w $0727                 
                    CMP.b #$07                  
                    BNE   CODE_29BE78           
                    LDA.b #$01                  
                    STA.b [$D8],y               
CODE_29BE78:        PLA                         
CODE_29BE79:        STA.b [$2E],y               
                    INY                         
                    CPY.b #$90                  
                    BNE   CODE_29BE62           
                    REP   #$20                  
                    TYA                         
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $00                   
                    STA.b $00                   
                    LDA.b $2E                   
                    CLC                         
                    ADC.w #$01B0                
                    STA.b $2E                   
                    STA.b $D8                   
                    SEP   #$20                  
                    BRA   CODE_29BE60           

CODE_29BE99:        LDX.b #$E0                  
                    LDY.w $0727                 
                    LDA.w $D7AD,y               
CODE_29BEA1:        JSL.l CODE_2098A8           
                    INX                         
                    CPX.b #$F0                  
                    BNE   CODE_29BEA1           
                    LDA.w $D776,y               
                    STA.w $073B                 
                    LDA.w $D77F,y               
                    STA.w $073C                 
                    STZ.b $00                   
CODE_29BEB8:        LDA.b #$80                  
                    STA.b $01                   
CODE_29BEBC:        LDY.b $00                   
                    LDA.w $1D00,y               
                    AND.b $01                   
                    BNE   CODE_29BEC8           
                    JMP.w CODE_29BF71           

CODE_29BEC8:        TYA                         
                    AND.b #$30                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA   PNTR_218200,x             
                    STA.b $2E                   
                    LDA   PNTR_218200+1,x             
                    INC   A                     
                    STA.b $2F                   
                    LDX.b #$07                  
CODE_29BEE2:        LDA.b $01                   
                    CMP.w $D788,x               
                    BEQ   CODE_29BEEC           
                    DEX                         
                    BNE   CODE_29BEE2           
CODE_29BEEC:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b #$10                  
                    STA.b $02                   
                    TYA                         
                    AND.b #$0F                  
                    ORA.b $02                   
                    TAY                         
CODE_29BEFC:        LDA.b [$2E],y               
                    STY.b $04                   
                    STA.b $B3                   
                    AND.b #$C0                  
                    CLC                         
                    ROL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAX                         
                    LDY.b #$04                  
                    LDA.b $B3                   
CODE_29BF0D:        CMP.w $D7A0,y               
                    BEQ   CODE_29BF48           
                    DEY                         
                    BPL   CODE_29BF0D           
                    CMP.b #$67                  
                    BEQ   CODE_29BF23           
                    CMP.b #$EB                  
                    BEQ   CODE_29BF23           
                    CMP   DATA_29BE00,x             
                    BCS   CODE_29BF48                   
CODE_29BF23:        LDX.b #$07                  
CODE_29BF25:        CMP.w $D790,x               
                    BEQ   CODE_29BF2F           
                    DEX                         
                    BPL   CODE_29BF25           
                    BMI   CODE_29BF34           
CODE_29BF2F:        LDA.w $D798,x               
                    BRA   CODE_29BF59           

CODE_29BF34:        LDA.b $01                   
                    CMP.b #$01                  
                    BNE   CODE_29BF71           
                    LDY.b $04                   
                    CPY.b #$90                  
                    BCS   CODE_29BF71                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    JMP.w CODE_29BEFC           

CODE_29BF48:        TXA                         
                    ASL   A                     
                    STA.b $03                   
                    LDA.b $00                   
                    AND.b #$40                  
                    BEQ   CODE_29BF54           
                    INC.b $03                   
CODE_29BF54:        LDX.b $03                   
                    LDA.w $D7A5,x               
CODE_29BF59:        PHA                         
                    LDA.b $2E                   
                    STA.b $D8                   
                    LDA.b $2F                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $D9                   
                    LDA.b [$D8],y               
                    BNE   CODE_29BF70           
                    PLA                         
                    LDY.b $04                   
                    STA.b [$2E],y               
                    BRA   CODE_29BF71           

CODE_29BF70:        PLA                         
CODE_29BF71:        LSR.b $01                   
                    BEQ   CODE_29BF78           
                    JMP.w CODE_29BEBC           

CODE_29BF78:        INC.b $00                   
                    LDA.b $00                   
                    CMP.b $DC                   
                    BEQ   CODE_29BF83           
                    JMP.w CODE_29BEB8           

CODE_29BF83:        RTL                         

CODE_29BF84:        LDX.w $0726                 
                    LDA.w $073D,x               
                    BEQ   CODE_29BF90           
                    JSR.w CODE_29C0C7           
                    RTL                         

CODE_29BF90:        LDA.w $0727                 
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $D87D,y               
                    STA.b $00                   
                    LDA.w $D88F,y               
                    STA.b $02                   
                    LDA.w $D8A1,y               
                    STA.b $04                   
                    LDA.w $D8B3,y               
                    STA.b $06                   
                    LDA.w $D86B,y               
                    STA.b $08                   
                    SEP   #$20                  
                    LDY.b $45,x                 
                    LDA.b ($08),y               
                    TAY                         
                    STZ.b $0E                   
CODE_29BFB9:        LDA.b ($00),y               
                    AND.b #$F0                  
                    CMP.b $43,x                 
                    BEQ   CODE_29BFCB           
                    INY                         
                    BNE   CODE_29BFB9           
                    INC.b $01                   
                    INC.b $0E                   
                    JMP.w CODE_29BFB9           

CODE_29BFCB:        LDA.b $03                   
                    CLC                         
                    ADC.b $0E                   
                    STA.b $03                   
                    STZ.b $0E                   
                    LDA.b $47,x                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $08                   
                    LDA.b $45,x                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ORA.b $08                   
CODE_29BFE4:        CMP.b ($02),y               
                    BEQ   CODE_29BFF2           
                    INY                         
                    BNE   CODE_29BFE4           
                    INC.b $03                   
                    INC.b $0E                   
                    JMP.w CODE_29BFE4           

CODE_29BFF2:        LDA.b $01                   
                    CLC                         
                    ADC.b $0E                   
                    STA.b $01                   
                    LDA.w $0727                 
                    CMP.b #$08                  
                    BNE   CODE_29C008           
                    LDA.b ($00),y               
                    AND.b #$0F                  
                    STA.w $042A                 
                    RTL                         

CODE_29C008:        LDA.b ($00),y               
                    AND.b #$0F                  
                    STA.w $070A                 
                    LDA.b $05                   
                    CLC                         
                    ADC.b $0E                   
                    STA.b $05                   
                    LDA.b $07                   
                    CLC                         
                    ADC.b $0E                   
                    STA.b $07                   
                    TYA                         
                    STA.b $0F                   
                    ASL   A                     
                    TAY                         
                    BCC   CODE_29C030           
                    LDA.b $05                   
                    ADC.b #$00                  
                    STA.b $05                   
                    LDA.b $07                   
                    ADC.b #$00                  
                    STA.b $07                   
CODE_29C030:        TYA                         
                    CLC                         
                    ADC.b $0F                   
                    TAY                         
                    STY.b $0F                   
                    REP   #$20                  
                    LDA.b ($04),y               
                    STA.b $31                   
                    STA.w $023A                 
                    LDA.b ($06),y               
                    STA.b $2B                   
                    STA.w $1EBB                 
                    SEP   #$20                  
                    INY                         
                    INY                         
                    LDA.b ($04),y               
                    STA.b $33                   
                    LDA.b ($06),y               
                    STA.b $2D                   
                    STA.w $1EBD                 
                    LDA.b $1E                   
                    BNE   CODE_29C06B           
                    LDA.w $070A                 
                    CMP.b #$0F                  
                    BNE   CODE_29C065           
                    JSR.w CODE_29C19E           
                    RTL                         

CODE_29C065:        LDA.b #$03                  
                    STA.w $0728                 
                    RTL                         

CODE_29C06B:        JSR.w CODE_29C06F           
                    RTL                         

CODE_29C06F:        JSL.l CODE_20FB1F           

                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C0E9
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10C
                    dw CODE_29C138
                    dw CODE_29C163
                    dw CODE_29C185
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10B
                    dw CODE_29C10B
    
                    LDY.w $0726
                    LDA.b #$7E                  
                    STA.b $30                   
                    LDA.w $45,y               
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_218200,x             
                    STA.b $2E                   
                    LDA   PNTR_218200+1,x             
                    INC   A                     
                    STA.b $2F                   
                    LDA.w $47,y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    LDA.w $43,y               
                    SEC                         
                    SBC.b #$10                  
                    AND.b #$F0                  
                    ORA.b $00                   
                    TAY                         
                    LDA.b [$2E],y               
                    STA.b $B3                   
                    RTS                         

CODE_29C0C7:        LDA.w $0727                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0727                 
                    TAX                         
                    REP   #$20                  
                    LDA.w $D7C2,x               
                    STA.b $2B                   
                    LDA.w $D7DA                 
                    STA.b $31                   
                    SEP   #$20                  
                    LDA.w $D7C4,x               
                    STA.b $2D                   
                    LDA.b #$02                  
                    STA.w $070A                 
                    RTS                         

CODE_29C0E9:        LDA.w $0727                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0727                 
                    TAY                         
                    REP   #$20                  
                    LDA.w $D7DD,y               
                    STA.b $2B                   
                    LDA.w $D7F5,y               
                    STA.b $31                   
                    SEP   #$20                  
                    LDA.w $D7DF,y               
                    STA.b $2D                   
                    LDA.b #$0A                  
                    STA.w $070A                 
                    RTS                         

CODE_29C10B:        RTS                         

CODE_29C10C:        LDA.b #$0F                  
                    STA.w $070A                 
                    LDA.b #$02                  
                    STA.w $1042                 
                    LDY.b #$00                  
                    STY.w $1043                 
                    STY.w $1034                 
                    LDA.w $963A,y               
                    STA.b $2B                   
                    LDA.w $963B,y               
                    STA.b $2C                   
                    LDA.b #$21                  
                    STA.b $2D                   
                    LDA.b #$03                  
                    STA.w $0728                 
                    LDA.b #$01                  
                    STA.l $7E3995               
                    RTS                         

CODE_29C138:        PHX                         
                    LDA.w $0727                 
                    ASL   A                     
                    TAX                         
                    CLC                         
                    ADC.w $0727                 
                    TAY                         
                    REP   #$20                  
                    LDA.w $D80D,y               
                    STA.b $2B                   
                    LDA.w $D825,x               
                    STA.b $31                   
                    SEP   #$20                  
                    LDA.w $D80F,y               
                    STA.b $2D                   
                    LDA.b #$07                  
                    STA.w $070A                 
                    PLX                         
                    LDA.b #$01                  
                    STA.l $7E3995               
                    RTS                         

CODE_29C163:        LDA.w $0727                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0727                 
                    TAY                         
                    REP   #$20                  
                    LDA.w $D835,y               
                    STA.b $2B                   
                    LDA.w $D84D,y               
                    STA.b $31                   
                    SEP   #$20                  
                    LDA.w $D837,y               
                    STA.b $2D                   
                    LDA.b #$0A                  
                    STA.w $070A                 
                    RTS                         

CODE_29C185:        REP   #$20                  
                    LDA.w $D865                 
                    STA.b $2B                   
                    LDA.w $D868                 
                    STA.b $31                   
                    SEP   #$20                  
                    LDA.w $D867                 
                    STA.b $2D                   
                    LDA.b #$01                  
                    STA.w $070A                 
                    RTS                         

CODE_29C19E:        LDX.w $0726                 
                    LDA.b $43,x                 
                    STA.l $7E3975,x             
                    LDA.b $45,x                 
                    STA.l $7E3977,x             
                    LDA.b $47,x                 
                    STA.l $7E3979,x             
                    LDA.b $52,x                 
                    STA.l $7E397B,x             
                    LDA.b #$0F                  
                    STA.w $070A                 
                    LDY.b $0F                   
                    LDA.b ($04),y               
                    STA.w $1042                 
                    LDA.b ($06),y               
                    STA.w $1043                 
                    INY                         
                    LDA.b ($04),y               
                    STA.w $1034                 
                    LDA.b ($06),y               
                    ASL   A                     
                    CLC                         
                    ADC.b ($06),y               
                    TAY                         
                    LDA.w $963A,y               
                    STA.b $2B                   
                    LDA.w $963B,y               
                    STA.b $2C                   
                    LDA.w $963C,y               
                    STA.b $2D                   
                    LDA.b #$03                  
                    STA.w $0728                 
                    RTS                         

DATA_29C1EC:        db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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

CODE_29C280:        LDA.w $0711                 
                    BEQ   CODE_29C288           
                    DEC.w $0711                 
CODE_29C288:        LDA.w $1A08                 
                    BEQ   CODE_29C290           
                    DEC.w $1A08                 
CODE_29C290:        LDA.w $1A09                 
                    BEQ   CODE_29C29E           
                    LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_29C29E           
                    DEC.w $1A09                 
CODE_29C29E:        JSL.l CODE_22E0A9           
                    JSR.w CODE_29C2AC           
                    JSR.w CODE_29C53C           
                    JSR.w CODE_29C6D3           
                    RTL                         

CODE_29C2AC:        LDA.w $0728                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29C2BD
                    dw CODE_29C43A
                    dw CODE_29C4BA
                    dw CODE_29C312
                    dw CODE_29C350

CODE_29C2BD:        LDA.b #$50
                    STA.w $070B
                    LDA.b #$64
                    STA.w $070C
                    LDA.b #$80
                    STA.w $0711
                    LDA.b #$00                  
                    STA.w $02D4                 
                    STA.b $70                   
                    LDY.b #$14                  
CODE_29C2D5:        STA.w $19FF,y               
                    DEY                         
                    BNE   CODE_29C2D5           
                    LDA.b #$FF                  
                    STA.b $55                   
                    LDA.b #$70                  
                    STA.b $5E                   
                    LDA.b #$40                  
                    STA.b $BD                   
                    STA.w $1A0F                 
                    LDY.w $0726                 
                    LDA.w $0747,y               
                    STA.b $BB                   
                    LDA.b #$72                  
                    STA.w $1A0C                 
                    LDA.b #$1E                  
                    STA.w $0711                 
                    LDX.b #$00                  
                    LDA.b #$F0                  
                    STA.b $8C,x                 
                    STZ.b $4F,x                 
                    STZ.b $5F,x                 
                    STZ.w $0669                 
                    LDA.b #$17                  
                    STA.w $0518,x               
                    INC.w $0728                 
                    RTS                         

CODE_29C312:        LDA.w $0711                 
                    BEQ   CODE_29C31D           
                    LSR   A                     
                    BNE   CODE_29C34F           
                    JMP.w CODE_29D2CE           

CODE_29C31D:        LDA.b $15                   
                    AND.b #$03                  
                    BNE   CODE_29C34F           
                    DEC.b $16                   
                    BNE   CODE_29C34F           
                    JSR.w CODE_29CCF8           
                    LDA.b #$01                  
                    STA.w $1500                 
                    LDA.b #$18                  
                    STA.w $0216                 
                    STZ.w $0218                 
                    LDA.w $0208                 
                    AND.b #$FB                  
                    STA.w $0208                 
                    LDA.b #$61                  
                    STA.w $0204                 
                    LDA.b #$01                  
                    STA.w $0542                 
                    JSR.w CODE_29C418           
                    INC.w $0728                 
CODE_29C34F:        RTS                         

CODE_29C350:        LDA.w $0727                 
                    CMP.b #$06                  
                    BEQ   CODE_29C36B           
                    LDY.b #$18                  
CODE_29C359:        LDA.w $F0CC,y               
                    STA.w $08AF,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.b #$02                  
                    STA.w $0A4C,x               
                    DEY                         
                    BNE   CODE_29C359           
CODE_29C36B:        LDA.b $16                   
                    CMP.b #$0F                  
                    BEQ   CODE_29C395           
                    LDA.b $15                   
                    AND.b #$03                  
                    BEQ   CODE_29C37A           
                    JMP.w CODE_29C3FA           

CODE_29C37A:        INC.b $16                   
                    LDA.b $16                   
                    CMP.b #$0F                  
                    BNE   CODE_29C3FA           
                    LDY.b #$18                  
                    LDA.w $0727                 
                    CMP.b #$06                  
                    BNE   CODE_29C392           
                    LDA.b #$78                  
                    STA.w $0711                 
                    LDY.b #$17                  
CODE_29C392:        STY.w $1202                 
CODE_29C395:        LDA.w $0711                 
                    BEQ   CODE_29C3A5           
                    LSR   A                     
                    BNE   CODE_29C3A2           
                    LDA.b #$80                  
                    STA.w $1202                 
CODE_29C3A2:        JSR.w CODE_29C400           
CODE_29C3A5:        LDY.w $0726                 
                    LDA.w $F8,y               
                    ORA.b $18                   
                    AND.b #$80                  
                    BEQ   CODE_29C3BA           
                    INC.b $14                   
                    LDA.b #$00                  
                    STA.w $0728                 
                    STA.b $A2                   
CODE_29C3BA:        LDY.b #$02                  
                    LDA.b $16                   
                    CMP.b #$0F                  
                    BNE   CODE_29C3DE           
                    LDA.b $A2                   
                    BMI   CODE_29C3DE           
                    DEY                         
                    LDA.b $15                   
                    AND.b #$38                  
                    BNE   CODE_29C3D1           
                    STY.b $A2                   
                    BRA   CODE_29C3DE           

CODE_29C3D1:        LSR   A                     
                    LSR   A                     
                    AND.b #$02                  
                    TAY                         
                    LDA.b $A2                   
                    BEQ   CODE_29C3DE           
                    DEC.b $A2                   
                    DEC.b $A2                   
CODE_29C3DE:        LDA.w $F0CA,y               
                    STA.w $08B2                 
                    LDA.b $15                   
                    AND.b #$18                  
                    BEQ   CODE_29C3FA           
                    LDY.b $68                   
                    LDA.w $F0AF,y               
                    STA.w $08C6                 
                    LDA.w $F0BC,y               
                    STA.w $08C7                 
                    BRA   CODE_29C3FF           

CODE_29C3FA:        LDA.b #$F0                  
                    STA.w $08C5                 
CODE_29C3FF:        RTS                         

CODE_29C400:        LDA.w $0711                 
                    AND.b #$02                  
                    TAY                         
                    LDA.w $F0E5,y               
                    STA.w $1300                 
                    LDA.w $F0E6,y               
                    STA.w $1301                 
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTS                         

CODE_29C418:        LDY.w $0727                 
                    LDA.w $F0A9,y               
                    STA.b $68                   
                    BEQ   CODE_29C439           
                    LDY.w $0726                 
                    BEQ   CODE_29C429           
                    LDY.b #$23                  
CODE_29C429:        LDX.b #$1B                  
CODE_29C42B:        LDA.w $1D80,y               
                    BEQ   CODE_29C434           
                    INY                         
                    DEX                         
                    BNE   CODE_29C42B           
CODE_29C434:        LDA.b $68                   
                    STA.w $1D80,y               
CODE_29C439:        RTS                         

CODE_29C43A:        LDA.w $0711                 
                    BNE   CODE_29C4B9           
                    LDX.w $1600                 
                    LDA.w $070B                 
                    STA.w $1602,x               
                    LDA.w $070C                 
                    STA.w $1603,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $070C                 
                    BCC   CODE_29C459           
                    INC.w $070B                 
CODE_29C459:        LDA.b #$00                  
                    STA.w $1604,x               
                    LDA.b #$2F                  
                    STA.w $1605,x               
                    INC   A                     
                    LSR   A                     
                    STA.b $00                   
                    LDY.w $02D4                 
                    LDA.w $F17D,y               
                    TAY                         
CODE_29C46E:        REP   #$20                  
                    LDA.w $F0ED,y               
                    STA.w $1606,x               
                    SEP   #$20                  
                    INY                         
                    INY                         
                    INX                         
                    INX                         
                    DEC.b $00                   
                    BNE   CODE_29C46E           
                    LDA.b #$FF                  
                    STA.w $1606,x               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    STX.w $1600                 
                    INC.w $02D4                 
                    LDA.w $02D4                 
                    CMP.b #$08                  
                    BCC   CODE_29C4B9           
                    REP   #$20                  
                    LDA.b $BB                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA.w $F395,y               
                    STA.w $02D4                 
                    SEP   #$20                  
                    LDA.b #$50                  
                    STA.w $070B                 
                    LDA.b #$85                  
                    STA.w $070C                 
                    LDA.b #$10                  
                    STA.w $0711                 
                    INC.w $0728                 
CODE_29C4B9:        RTS                         

CODE_29C4BA:        LDA.w $0711                 
                    BEQ   CODE_29C4C0           
                    RTS                         

CODE_29C4C0:        REP   #$10                  
                    LDX.w $02D4                 
                    LDA.w $F185,x               
                    STA.b $00                   
                    SEP   #$10                  
                    LDY.w $1600                 
                    STA.w $1606,y               
                    LDA.b #$21                  
                    STA.w $1607,y               
                    LDA.w $070B                 
                    STA.w $1602,y               
                    LDA.b #$01                  
                    STA.w $1605,y               
                    LDA.b #$00                  
                    STA.w $1604,y               
                    LDA.b #$FF                  
                    STA.w $1608,y               
                    TYA                         
                    CLC                         
                    ADC.b #$06                  
                    STA.w $1600                 
                    LDA.w $070C                 
                    STA.w $1603,y               
                    REP   #$20                  
                    INC.w $02D4                 
                    SEP   #$20                  
                    INC.w $070C                 
                    LDA.w $070C                 
                    AND.b #$1F                  
                    CMP.b #$1B                  
                    BNE   CODE_29C52E           
                    LDA.w $070C                 
                    ADC.b #$09                  
                    STA.w $070C                 
                    BCC   CODE_29C519           
                    INC.w $070B                 
CODE_29C519:        CMP.b #$45                  
                    BNE   CODE_29C52E           
                    STZ.w $02D4                 
                    STZ.w $02D5                 
                    STA.b $68                   
                    LDA.b #$FF                  
                    STA.w $0711                 
                    INC.w $0728                 
                    RTS                         

CODE_29C52E:        LDY.b #$04                  
                    LDA.b $00                   
                    CMP.b #$FE                  
                    BNE   CODE_29C538           
                    LDY.b #$01                  
CODE_29C538:        STY.w $0711                 
                    RTS                         

CODE_29C53C:        LDA.w $0216                 
                    BMI   CODE_29C542           
                    RTS                         

CODE_29C542:        LDX.b #$1C                  
CODE_29C544:        LDA.w $F442,x               
                    STA.w $087F,x               
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A40,y               
                    DEX                         
                    BNE   CODE_29C544           
                    LDX.w $0727                 
                    LDY.w $F3B8,x               
                    LDA.w $0728                 
                    CMP.b #$02                  
                    BNE   CODE_29C56A           
                    LDA.b $15                   
                    AND.b #$10                  
                    BEQ   CODE_29C56A           
                    INY                         
CODE_29C56A:        LDX.b #$0C                  
CODE_29C56C:        LDA.w $F3BF,y               
                    STA.w $0886,x               
                    LDA.w $F3F7,y               
                    STA.w $0887,x               
                    INY                         
                    INY                         
                    DEX                         
                    DEX                         
                    DEX                         
                    DEX                         
                    BPL   CODE_29C56C           
                    LDY.w $1A01                 
                    CPY.b #$02                  
                    BCC   CODE_29C58E           
                    LDA.b #$E0                  
                    STA.w $0882                 
                    BRA   CODE_29C5F2           

CODE_29C58E:        LDA.b $15                   
                    AND.w $F43F,y               
                    BNE   CODE_29C5A1           
                    LDA.w $1A02                 
                    CLC                         
                    ADC.w $F441,y               
                    AND.b #$07                  
                    STA.w $1A02                 
CODE_29C5A1:        JSR.w CODE_29C69A           
                    LDA.w $1A0D                 
                    LDY.w $1A01                 
                    BNE   CODE_29C5C1           
                    CMP.b #$90                  
                    BCC   CODE_29C5D2           
                    LDA.b #$38                  
                    STA.w $1200                 
                    LDA.b #$10                  
                    STA.w $1A0E                 
                    LDA.b #$B0                  
                    STA.w $1A0F                 
                    BRA   CODE_29C5CF           

CODE_29C5C1:        CMP.b #$68                  
                    BCC   CODE_29C5D2           
                    LDA.w $1A0F                 
                    BMI   CODE_29C5D2           
                    LDA.b #$13                  
                    STA.w $1202                 
CODE_29C5CF:        INC.w $1A01                 
CODE_29C5D2:        LDA.w $1A0D                 
                    STA.w $0841                 
                    LDY.w $1A02                 
                    LDA.w $F42F,y               
                    STA.w $0842                 
                    LDA.w $F437,y               
                    STA.w $0843                 
                    LDA.w $1A0C                 
                    STA.w $0840                 
                    LDA.b #$02                  
                    STA.w $0A30                 
CODE_29C5F2:        LDA.w $0669                 
                    CMP.b #$04                  
                    BEQ   CODE_29C648           
                    LDX.b #$00                  
                    AND.b #$01                  
                    BNE   CODE_29C614           
                    LDA.w $0518                 
                    BEQ   CODE_29C60B           
                    DEC.w $0518                 
                    LDX.b #$00                  
                    BRA   CODE_29C677           

CODE_29C60B:        INC.w $0669                 
                    LDA.b #$F0                  
                    STA.b $8C,x                 
                    STZ.b $5F,x                 
CODE_29C614:        STX.b $9B                   
                    LDA.b $8C,x                 
                    CLC                         
                    ADC.b #$01                  
                    STA.b $8C,x                 
                    JSL.l CODE_27A7EF           
                    LDA.b $5F,x                 
                    BEQ   CODE_29C629           
                    LDX.b #$06                  
                    BRA   CODE_29C677           

CODE_29C629:        LDA.w $0669                 
                    CMP.b #$03                  
                    BEQ   CODE_29C63C           
                    INC.w $0669                 
                    LDX.b #$00                  
                    LDA.b #$07                  
                    STA.w $0518                 
                    BRA   CODE_29C677           

CODE_29C63C:        LDX.b $9B                   
                    STZ.b $8C,x                 
                    STZ.b $4F,x                 
                    STZ.w $1A03                 
                    STZ.w $1A08                 
CODE_29C648:        LDY.w $1A03                 
                    LDA.w $1A08                 
                    BNE   CODE_29C674           
                    DEY                         
                    BPL   CODE_29C66B           
                    LDA.w $0669                 
                    CMP.b #$04                  
                    BNE   CODE_29C666           
                    STZ.w $0669                 
                    LDX.b #$00                  
                    LDA.b #$17                  
                    STA.w $0518                 
                    BRA   CODE_29C677           

CODE_29C666:        INC.w $0669                 
                    LDY.b #$07                  
CODE_29C66B:        STY.w $1A03                 
                    LDA.w $F46F,y               
                    STA.w $1A08                 
CODE_29C674:        LDX.w $F467,y               
CODE_29C677:        LDY.b #$04                  
CODE_29C679:        LDA.w $F45F,x               
                    STA.w $0896,y               
                    INX                         
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    BPL   CODE_29C679           
                    LDX.b #$00                  
                    LDY.b #$04                  
CODE_29C68A:        LDA.w $0895,y               
                    CLC                         
                    ADC.b $5F,x                 
                    STA.w $0895,y               
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    BPL   CODE_29C68A           
                    RTS                         

CODE_29C69A:        LDX.b #$01                  
                    JSR.w CODE_29C6AF           
                    LDA.w $1A0F                 
                    BMI   CODE_29C6A8           
                    CMP.b #$40                  
                    BCS   CODE_29C6AE                   
CODE_29C6A8:        INC.w $1A0F                 
                    INC.w $1A0F                 
CODE_29C6AE:        DEX                         
CODE_29C6AF:        LDA.w $1A0E,x               
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $1A10,x               
                    STA.w $1A10,x               
                    PHP                         
                    LDA.w $1A0E,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_29C6CB           
                    ORA.b #$F0                  
CODE_29C6CB:        PLP                         
                    ADC.w $1A0C,x               
                    STA.w $1A0C,x               
                    RTS                         

CODE_29C6D3:        LDY.b $BB                   
                    LDA.b $70                   
                    CMP.b #$80                  
                    BCC   CODE_29C6DF           
                    LDX.b $55                   
                    BEQ   CODE_29C6F0           
CODE_29C6DF:        CLC                         
                    ADC.b #$04                  
                    STA.b $70                   
                    BCC   CODE_29C6E8           
                    INC.b $55                   
CODE_29C6E8:        INC.w $0711                 
                    LDA.w $F477,y               
                    BRA   CODE_29C6F3           

CODE_29C6F0:        LDA.w $F47E,y               
CODE_29C6F3:        STA.b $BC                   
                    JSL.l CODE_20E237           
                    RTS                         

CODE_29C6FA:        LDX.w $0727                 
                    LDY.w $F835,x               
                    LDX.b #$06                  
                    LDA.b #$80                  
                    STA.w $2115                 
CODE_29C707:        LDA.w $F843,x               
                    STA.w $2116                 
                    LDA.w $F83C,x               
                    STA.w $2117                 
CODE_29C713:        INY                         
                    LDA.w $F784,y               
                    BEQ   CODE_29C727           
                    CMP.b #$FF                  
                    BEQ   CODE_29C72A           
                    STA.w $2118                 
                    LDA.b #$14                  
                    STA.w $2119                 
                    BRA   CODE_29C713           

CODE_29C727:        DEX                         
                    BPL   CODE_29C707           
CODE_29C72A:        LDA.w $0727                 
                    ASL   A                     
                    TAX                         
                    LDA.w $F485,x               
                    STA.b $00                   
                    LDA.w $F486,x               
                    STA.b $01                   
                    LDY.b #$00                  
                    LDX.b #$05                  
CODE_29C73D:        LDA.w $F6DB,x               
                    STA.w $2116                 
                    LDA.w $F6E1,x               
                    STA.w $2117                 
CODE_29C749:        LDA.b ($00),y               
                    INY                         
                    CMP.b #$00                  
                    BEQ   CODE_29C75E           
                    CMP.b #$FF                  
                    BEQ   CODE_29C761           
                    STA.w $2118                 
                    LDA.b #$14                  
                    STA.w $2119                 
                    BRA   CODE_29C749           

CODE_29C75E:        DEX                         
                    BPL   CODE_29C73D           
CODE_29C761:        LDA.w $0727                 
                    CMP.b #$06                  
                    BNE   CODE_29C793           
                    REP   #$20                  
                    LDX.b #$08                  
                    LDY.b #$00                  
                    LDA.w #$11C6                
                    STA.b $00                   
CODE_29C773:        LDA.b $00                   
                    STA.w $2116                 
CODE_29C778:        LDA.w $F6E7,y               
                    BMI   CODE_29C784           
                    STA.w $2118                 
                    INY                         
                    INY                         
                    BRA   CODE_29C778           

CODE_29C784:        INY                         
                    INY                         
                    LDA.b $00                   
                    CLC                         
                    ADC.w #$0020                
                    STA.b $00                   
                    DEX                         
                    BNE   CODE_29C773           
                    SEP   #$20                  
CODE_29C793:        RTL                         

CODE_29C794:        JSL.l CODE_29C82B           
                    RTL                         

DATA_29C799:        dw $1000
                    dw $9000
                    dw $9580
                    dw $9B00
                    dw $9160
                    dw $9B00
                    dw $96E0
                    dw $2002
                    dw $9B00
                    dw $92C0
                    dw $9840
                    dw $9000
                    dw $99A0
                    dw $9160
                    dw $9420
                    dw $2000
                    dw $2001
                    dw $2002
                    dw $3000

DATA_29C7BF:        dw $9E00
                    dw $9E80
                    dw $9E00
                    dw $9F00
                    dw $9F00
                    dw $9F80
                    dw $A000
                    dw $A080
                    dw $9E00
                    dw $9D80

DATA_29C7D3:        dw $8960
                    dw $8980
                    dw $89A0
                    dw $89C0
                    dw $89E0
                    dw $8A00
                    dw $8960
                    dw $0000

DATA_29C7E3:        dw $88A0
                    dw $88A0
                    dw $8920
                    dw $88A0
                    dw $88E0
                    dw $88C0
                    dw $8900
                    dw $88E0
                    dw $88E0
                    dw $8940
                    dw $88E0
                    dw $88E0
                    dw $88C0
                    dw $8900

DATA_29C7FF:        dw $9C80
                    dw $9C90
                    dw $9CA0
                    dw $9CB0
                    dw $9CC0
                    dw $9CD0
                    dw $9CE0
                    dw $9CF0
                    dw $9D00
                    dw $9D10
                    dw $9D20
                    dw $9D30
                    dw $9D40
                    dw $9D50
                    dw $9D60

DATA_29C81D:        dw $0700

DATA_29C81F:        dw $0040
                    dw $0040
                    dw $0020

DATA_29C825:        dw $8BC0
                    dw $8B60
                    dw $8BC0

CODE_29C82B:        LDA.b #$20                  
                    STA.w $0205                 
                    ASL   A                     
                    STA.w $0206                 
                    ASL   A                     
                    STA.w $0207                 
                    REP   #$30                  
                    PHB                         
                    LDX.w #$A100                
                    LDY.w #$1300                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    PHB                         
                    LDX.w #$8800                
                    LDY.w #$1400                
                    LDA.w #$009F                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w $070A                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_29C799,x             
                    AND.w #$F000                
                    BEQ   CODE_29C89D           
                    CMP.w #$1000                
                    BEQ   CODE_29C8A4           
                    CMP.w #$2000                
                    BEQ   CODE_29C8A9           
                    CMP.w #$3000                
                    BEQ   CODE_29C89F           
                    CPX.w #$0004                
                    BNE   CODE_29C886           
                    LDA.w $1EBF                 
                    AND.w #$00FF                
                    CMP.w #$0016                
                    BEQ   CODE_29C89A           
CODE_29C886:        JSR.w CODE_29CAA0           
                    JSR.w CODE_29CBC0           
                    LDA.w $073C                 
                    AND.w #$0007                
                    ASL   A                     
                    TAX                         
                    LDA.l $3C9C60,x             
                    BRA   CODE_29C90E           

CODE_29C89A:        JSR.w CODE_29CB7E           
CODE_29C89D:        BRA   CODE_29C90B           

CODE_29C89F:        JSR.w CODE_29CCB6           
                    BRA   CODE_29C90B           

CODE_29C8A4:        JSR.w CODE_29CC14           
                    BRA   CODE_29C90B           

CODE_29C8A9:        PHX                         
                    PHB                         
                    LDX.w #$A120                
                    LDY.w #$1320                
                    LDA.w #$00DF                
                    MVN.w $3C00                 
                    LDX.w #$8A60                
                    LDY.w #$14C0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w $070A                 
                    AND.w #$00FF                
                    CMP.w #$000F                
                    BNE   CODE_29C8E5           
                    LDA.w $0726                 
                    AND.w #$0001                
                    BEQ   CODE_29C8E5           
                    PHB                         
                    LDX.w #$88E0                
                    LDY.w #$13E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
CODE_29C8E5:        PLX                         
                    LDA   DATA_29C799,x             
                    AND.w #$000F                
                    ASL   A                     
                    TAX                         
                    PHX                         
                    PHB                         
                    LDA   DATA_29C825,x             
                    TAX                         
                    LDY.w #$14A0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    PLX                         
                    LDA   DATA_29C81F,x             
                    TAX                         
                    LDA.w $1320,x               
                    BRA   CODE_29C90E           

CODE_29C90B:        LDA.w $1380                 
CODE_29C90E:        STA.w $02B9                 
                    STA.w $1300                 
                    AND.w #$001F                
                    ORA.w #$0020                
                    STA.b $D8                   
                    LDA.w $02B9                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    ORA.w #$0040                
                    STA.b $DA                   
                    LDA.w $02B9                 
                    XBA                         
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    ORA.w #$0080                
                    STA.b $DC                   
                    SEP   #$30                  
                    STZ.w $1300                 
                    STZ.w $1301                 
                    LDA.b $D8                   
                    STA.w $0205                 
                    LDA.b $DA                   
                    STA.w $0206                 
                    LDA.b $DC                   
                    STA.w $0207                 
                    LDA.w $0350                 
                    CMP.b #$03                  
                    BNE   CODE_29C95D           
                    LDA.b #$83                  
                    STA.w $0207                 
CODE_29C95D:        LDA.b #$01                  
                    STA.w $1500                 
                    RTL                         

DATA_29C963:        dw $0000
                    dw $C983
                    dw $C98B
                    dw $C993
                    dw $C99B
                    dw $C9A3
                    dw $C9AB
                    dw $C983
                    dw $C9B3
                    dw $C9BB
                    dw $C9C3
                    dw $C9CB
                    dw $C9D3
                    dw $C9DB
                    dw $C9E3
                    dw $0000
                    dw $9060
                    dw $90A0
                    dw $90E0
                    dw $9120
                    dw $95E0
                    dw $9620
                    dw $9660
                    dw $96A0
                    dw $9B60
                    dw $9BA0
                    dw $9BE0
                    dw $9C20
                    dw $91C0
                    dw $9200
                    dw $9240
                    dw $9280
                    dw $9B60
                    dw $9BA0
                    dw $9BE0
                    dw $9C20
                    dw $9740
                    dw $9780
                    dw $97C0
                    dw $9800
                    dw $9B60
                    dw $9BA0
                    dw $9BE0
                    dw $9C20
                    dw $9320
                    dw $9360
                    dw $93A0
                    dw $93E0
                    dw $98A0
                    dw $98E0
                    dw $9920
                    dw $9960
                    dw $9060
                    dw $90A0
                    dw $90E0
                    dw $9120
                    dw $9A00
                    dw $9A40
                    dw $9A80
                    dw $9AC0
                    dw $91C0
                    dw $9200
                    dw $9240
                    dw $9280
                    dw $9480
                    dw $94C0
                    dw $9500
                    dw $9540

DATA_29C9EB:        dw $A600
                    dw $A640
                    dw $A680
                    dw $A6C0
                    dw $A700
                    dw $A740
                    dw $A780
                    dw $A7C0
                    dw $A800
                    dw $A840
                    dw $A880
                    dw $A8C0
                    dw $A900
                    dw $A940
                    dw $A700
                    dw $A9C0
                    dw $AA00
                    dw $AA40
                    dw $AA80
                    dw $AAC0
                    dw $AB00
                    dw $AB40
                    dw $AB80
                    dw $ABC0
                    dw $A980

DATA_29CA1D:        dw $0000
                    dw $0103
                    dw $0403
                    dw $0103
                    dw $0103
                    dw $0103
                    dw $0105
                    dw $000C
                    dw $0109
                    dw $0103
                    dw $0302
                    dw $0103
                    dw $0100
                    dw $0103
                    dw $0000
                    dw $000D
                    dw $0000
                    dw $0000
                    dw $0000
                    dw $0100
                    dw $0100
                    dw $0102
                    dw $060C
                    dw $0403
                    dw $0103
                    dw $0105
                    dw $0403
                    dw $0105
                    dw $0103
                    dw $0403
                    dw $0103
                    dw $0100
                    dw $0100
                    dw $0103
                    dw $0103
                    dw $0103
                    dw $0100
                    dw $0403
                    dw $0100
                    dw $0105
                    dw $0100
                    dw $0100
                    dw $0403
                    dw $0403
                    dw $0403
                    dw $0302
                    dw $0105
                    dw $0103

DATA_29CA7D:        db $08,$08,$07,$07,$08,$08,$08

DATA_29CA84:        dw $8A40
                    dw $8A60
                    dw $8A80
                    dw $8AA0
                    dw $8AC0
                    dw $8AE0
                    dw $8B00
                    dw $8B20
                    dw $8B40
                    dw $8B60
                    dw $8B80
                    dw $8BA0
                    dw $8BC0
                    dw $8BE0

CODE_29CAA0:        LDA   DATA_29C799,x             
                    PHB                         
                    TAX                         
                    LDY.w #$1360                  
                    LDA.w #$005F
                    MVN.w $3C00
                    PLB
                    LDA.w $02BE
                    AND.w #$00FF
                    BEQ   CODE_29CACB
                    DEC   A                     
                    ASL   A                     
                    TAX                         
                    PHB                         
                    LDA   DATA_29C7FF,x             
                    TAX                         
                    LDY.w #$1310                  
                    LDA.w #$000F
                    MVN.w $3C00
                    PLB
CODE_29CACB:        LDA.w $070A
                    AND.w #$00FF
                    ASL   A
                    TAX
                    LDA   DATA_29C963,x             
                    STA.b $00                   
                    LDA.w #$0029                
                    STA.b $02                  
                    LDA.w $073B
                    AND.w #$0003
                    ASL   A                     
                    TAY                         
                    LDA.b [$00],y               
                    PHB                         
                    TAX                         
                    LDA.w $0350                 
                    AND.w #$00FF                                  
                    CMP.w #$000B
                    BNE   CODE_29CAF8
                    LDX.w #$94C0
CODE_29CAF8:        LDY.w #$13C0                  
                    LDA.w #$003F
                    MVN.w $3C00
                    PLB
                    LDA.w $02C5
                    AND.w #$00FF                  
                    ASL   A
                    TAX                         
                    LDA   DATA_29C9EB,x             
                    PHB                         
                    TAX                         
                    LDY.w #$1320                
                    LDA.w #$003F                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w $1EBF                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_29CA1D,x             
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $D8                   
                    LDA   DATA_29CA1D+1,x             
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $DA                   
CODE_29CB36:        LDA.w $0726                 
                    AND.w #$00FF                
                    TAY                         
                    LDA.w $073D,y               
                    AND.w #$00FF                
                    BEQ   CODE_29CB56           
                    LDA.w $0727                 
                    AND.w #$00FF                
                    TAX                         
                    LDA   DATA_29CA7D,x             
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $DA                   
CODE_29CB56:        LDX.b $D8                   
                    LDA   DATA_29CA84,x             
                    TAX                         
                    PHB                         
                    TAX                         
                    LDY.w #$14A0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    LDX.b $DA                   
                    LDA   DATA_29CA84,x             
                    TAX                         
                    PHB                         
                    TAX                         
                    LDY.w #$14C0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    BRL   CODE_29CC7C           

CODE_29CB7E:        PHB                         
                    LDX.w #$A500                
                    LDY.w #$1320                
                    LDA.w #$00DF                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w $1EBF                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_29CA1D,x             
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $D8                   
                    LDA   DATA_29CA1D+1,x             
                    AND.w #$00FF                
                    ASL   A                     
                    STA.b $DA                   
                    LDA.w $0727                 
                    AND.w #$00FF                
                    CMP.w #$0003                
                    BEQ   CODE_29CBB8           
                    CMP.w #$0004                
                    BNE   CODE_29CBBD           
CODE_29CBB8:        LDA.w #$0016                
                    STA.b $DA                   
CODE_29CBBD:        BRL   CODE_29CB36           

CODE_29CBC0:        LDA.w $0727                 
                    AND.w #$00FF                
                    CMP.w #$0007                
                    BNE   CODE_29CBEE           
                    LDA.w $0726                 
                    AND.w #$00FF                
                    TAX                         
                    LDA.l $7E3977,x             
                    AND.w #$00FF                
                    CMP.w #$0003                
                    BNE   CODE_29CC13           
                    LDA.w $070A                 
                    AND.w #$00FF                
                    CMP.w #$0002                
                    BNE   CODE_29CC13           
                    LDA.w #$8A20                
                    BRA   CODE_29CC07           

CODE_29CBEE:        LDA.w $070A                 
                    AND.w #$00FF                
                    CMP.w #$000A                
                    BNE   CODE_29CC13           
                    LDA.w $0727                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_29C7D3,x             
                    BEQ   CODE_29CC13           
CODE_29CC07:        PHB                         
                    TAX                         
                    LDY.w #$1480                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
CODE_29CC13:        RTS                         

CODE_29CC14:        PHB                         
                    LDX.w #$A3A0                
                    LDY.w #$1320                
                    LDA.w #$005F                
                    MVN.w $3C00                 
                    PLB                         
                    LDA.w $0727                 
                    AND.w #$00FF                
                    CMP.w #$0004                
                    BNE   CODE_29CC59           
                    LDA.w $0726                 
                    AND.w #$00FF                
                    TAX                         
                    LDA.l $7E3977,x             
                    AND.w #$00FF                
                    BEQ   CODE_29CC42           
                    LDA.w #$0009                
                    BRA   CODE_29CC5F           

CODE_29CC42:        LDA.w $0726                 
                    AND.w #$00FF                
                    TAY                         
                    LDA.w $47,y               
                    AND.w #$00FF                
                    CMP.w #$00E0                
                    BCC   CODE_29CC59           
                    LDA.w #$0009                
                    BRA   CODE_29CC5F           

CODE_29CC59:        LDA.w $0727                 
                    AND.w #$00FF                
CODE_29CC5F:        ASL   A                     
                    TAX                         
                    LDA   DATA_29C7BF,x             
                    PHB                         
                    TAX                         
                    LDY.w #$1380                
                    LDA.w #$007F                
                    MVN.w $3C00                 
                    LDX.w #$8C00                
                    LDY.w #$14A0                
                    LDA.w #$003F                
                    MVN.w $3C00                 
CODE_29CC7C:        LDA.w $0726                 
                    AND.w #$0001                
                    TAX                         
                    LDA.w $0747,x               
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
                    TAX                         
                    LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    LDX.w #$0020                
CODE_29CCAA:        LDA.w $14E0,x               
                    STA.l $7FC500,x             
                    DEX                         
                    DEX                         
                    BPL   CODE_29CCAA           
                    RTS                         

CODE_29CCB6:        PHB                         
                    LDX.w #$A920                
                    LDY.w #$1340                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    LDX.w #$96E0                
                    LDY.w #$1360                
                    LDA.w #$005F                
                    MVN.w $3C00                 
                    LDX.w #$9780                
                    LDY.w #$13C0                
                    LDA.w #$003F                
                    MVN.w $3C00                 
                    LDX.w #$8C00                
                    LDY.w #$14A0                
                    LDA.w #$003F                
                    MVN.w $3C00                 
                    LDX.w #$88A0                
                    LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    STZ.w $1380                 
                    PLB                         
                    RTS                         

CODE_29CCF8:        REP   #$30                  
                    PHB                         
                    LDX.w #$8800                
                    LDY.w #$1400                
                    LDA.w #$009F                
                    MVN.w $3C00                 
                    LDX.w #$8BE0                
                    LDY.w #$14A0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    SEP   #$30                  
                    RTS                         

DATA_29CD17:        db $BC,$45,$A5,$14,$FF,$7F,$3F,$02
                    db $D8,$01,$36,$01,$FF,$42,$BF,$3A
                    db $9C,$2D,$3F,$5B,$76,$69,$F0,$50
                    db $88,$3C,$36,$01,$D8,$01,$3F,$02

DATA_29CD37:        db $BC,$45,$FF,$7F,$A5,$14,$92,$00
                    db $98,$00,$9F,$00,$5B,$21,$1D,$26
                    db $BE,$36,$2F,$15,$95,$2C,$3A,$41
                    db $DF,$55,$1F,$03,$7A,$02,$D5,$01

DATA_29CD57:        db $BC,$45,$A5,$14,$FF,$7F,$DF,$55
                    db $3A,$41,$95,$2C,$FF,$42,$BF,$3A
                    db $9C,$2D,$3F,$5B,$7F,$21,$D9,$14
                    db $53,$04,$00,$02,$E0,$02,$E0,$03

PNTR_29CD77:        dl $7FC500
                    dl DATA_29CD17
                    dl DATA_29CD37
                    dl DATA_29CD57

CODE_29CD83:        LDY.w $0553
                    CPY.b #$01                  
                    BNE   CODE_29CD8F           
                    STZ.w $02C7                 
                    BRA   CODE_29CDB2           

CODE_29CD8F:        DEC.w $02C6                 
                    BPL   CODE_29CDB2           
                    LDA.b #$03                  
                    CPY.b #$40                  
                    BCS   CODE_29CDA2                   
                    LDA.b #$06                  
                    CPY.b #$1E                  
                    BCC   CODE_29CDA2           
                    LDA.b #$05                  
CODE_29CDA2:        STA.w $02C6                 
                    INC.w $02C7                 
                    LDA.w $0553                 
                    CMP.b #$05                  
                    BCS   CODE_29CDB2                   
                    STZ.w $02C7                 
CODE_29CDB2:        LDA.w $02C7                 
                    AND.b #$03                  
                    STA.b $D8                   
                    ASL   A                     
                    CLC                         
                    ADC.b $D8                   
                    TAX                         
                    LDA   PNTR_29CD77,x             
                    STA.b $0D                   
                    LDA   PNTR_29CD77+1,x             
                    STA.b $0E                   
                    LDA   PNTR_29CD77+2,x             
                    STA.b $0F                   
                    REP   #$20                  
                    LDY.b #$1E                  
CODE_29CDD4:        LDA.b [$0D],y               
                    STA.w $14E0,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_29CDD4           
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTL                         

CODE_29CDE5:        REP   #$30                  
                    PHB                         
                    LDX.w #$8800                
                    LDY.w #$1400                
                    LDA.w #$009F                
                    MVN.w $3C00                 
                    LDX.w #$8C00                
                    LDY.w #$14A0                
                    LDA.w #$003F                
                    MVN.w $3C00                 
                    LDX.w #$88A0                
                    LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    SEP   #$30                  
                    RTL                         

CODE_29CE10:        REP   #$30                  
                    LDA.w $1300                 
                    STA.b $DC                   
                    AND.w #$001F                
                    ORA.w #$0020                
                    STA.b $D8                   
                    LDA.b $DC                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    ORA.w #$0040                
                    STA.b $DA                   
                    LDA.b $DC                   
                    XBA                         
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    ORA.w #$0080                
                    STA.b $DC                   
                    STZ.w $1300                 
                    SEP   #$30                  
                    LDA.b $D8                   
                    STA.w $0205                 
                    LDA.b $DA                   
                    STA.w $0206                 
                    LDA.b $DC                   
                    STA.w $0207                 
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTL                         

DATA_29CE55:        dw $AC00
                    dw $AD00
                    dw $AE00
                    dw $AF00
                    dw $B000
                    dw $B100
                    dw $B200
                    dw $B300

DATA_29CE65:        dw $88A0
                    dw $88A0
                    dw $88E0
                    dw $88A0
                    dw $88C0
                    dw $88A0
                    dw $8900
                    dw $88A0

DATA_29CE75:        dw $0000
                    dw $0000
                    dw $8AE0
                    dw $0000
                    dw $0000
                    dw $8A40
                    dw $8A40
                    dw $0000

DATA_29CE85:        dw $88E0
                    dw $88E0
                    dw $88E0
                    dw $88E0
                    dw $88C0
                    dw $88E0
                    dw $8900
                    dw $88E0

CODE_29CE95:        REP   #$30                  
                    PHB                         
                    LDA.b $4D                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_29CE55,x             
                    TAX                         
                    LDY.w #$9400                
                    LDA.w #$00FF                
                    MVN.w $3C7F                 
                    LDX.w #$8800                
                    LDY.w #$9500                
                    LDA.w #$007F                
                    MVN.w $3C7F                 
                    LDX.w #$8A20                
                    LDY.w #$9580                
                    LDA.w #$001F                
                    MVN.w $3C7F                 
                    PLB                         
                    LDA.b $4D                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA   DATA_29CE75,x             
                    BEQ   CODE_29CEDF           
                    PHB                         
                    TAX                         
                    LDY.w #$95A0                
                    LDA.w #$001F                
                    MVN.w $3C7F                 
                    PLB                         
CODE_29CEDF:        LDA.b $4D                   
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA.w $0726                 
                    AND.w #$00FF                
                    BEQ   CODE_29CEF4           
                    LDA   DATA_29CE85,x             
                    BRA   CODE_29CEF8           

CODE_29CEF4:        LDA   DATA_29CE65,x             
CODE_29CEF8:        PHB                         
                    TAX                         
                    LDY.w #$95E0                
                    LDA.w #$001F                
                    MVN.w $3C7F                 
                    PLB                         
                    LDX.w #$0000                
                    TXA                         
CODE_29CF08:        STA.w $1320,x               
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
                    INX                         
                    INX                         
                    CPX.w #$0020                
                    BNE   CODE_29CF08           
                    STA.w $1300                 
                    STA.w $1310                 
                    STA.w $1312                 
                    STA.w $1314                 
                    STA.w $1316                 
                    STA.w $1318                 
                    STA.w $131A                 
                    STA.w $131C                 
                    STA.w $131E                 
                    STZ.w $02B7                 
                    SEP   #$30                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTL                         

CODE_29CF62:        REP   #$30                  
                    PHB                         
                    LDX.w #$A400                
                    LDY.w #$9400                
                    LDA.w #$001F                
                    MVN.w $3C7F                 
                    LDX.w #$A480                
                    LDY.w #$9480                
                    LDA.w #$007F                
                    MVN.w $3C7F                 
                    PLB                         
                    LDX.w #$0000                
                    TXA                         
CODE_29CF82:        STA.w $1300,x               
                    STA.w $1380,x               
                    STA.w $13A0,x               
                    STA.w $13C0,x               
                    STA.w $13E0,x               
                    INX                         
                    INX                         
                    CPX.w #$0020                
                    BNE   CODE_29CF82           
                    LDA.l $3CA43E               
                    STA.l $7F943E               
                    LDA.l $3CA45E               
                    STA.l $7F945E               
                    LDA.w #$FF00                
                    STA.w $02B7                 
                    SEP   #$30                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTL                         

CODE_29CFB6:        REP   #$30                  
                    PHB                         
                    LDX.w #$8840                
                    LDY.w #$9540                
                    LDA.w #$001F                
                    MVN.w $3C7F                 
                    PLB                         
                    STZ.w $02B3                 
                    LDA.w #$0000                
                    STA.l $7F9400               
                    SEP   #$30                  
                    STZ.w $02B7                 
                    RTL                         

DATA_29CFD6:        db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
                    db $FF,$7F,$FF,$7F,$DF,$7F,$FF,$FB

DATA_29CFE6:        db $7F,$7F,$7F,$7F,$F7,$7D,$BF,$EF
                    db $DF,$7B,$DF,$7B,$BB,$77,$EF,$DD

DATA_29CFF6:        db $77,$77,$77,$77,$DD,$6E,$77,$BB
                    db $B7,$6D,$B7,$6D,$6D,$5B,$DB,$B6

DATA_29D006:        db $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
                    db $55,$55,$6B,$AD,$55,$55,$AB,$AA

DATA_29D016:        db $55,$55,$55,$55,$55,$2A,$55,$55
                    db $55,$2A,$55,$2A,$4A,$29,$95,$52

DATA_29D026:        db $25,$25,$25,$25,$92,$24,$25,$49
                    db $49,$12,$49,$12,$22,$11,$89,$44

DATA_29D036:        db $11,$11,$11,$11,$44,$08,$11,$22
                    db $21,$04,$21,$04,$08,$02,$41,$10

DATA_29D046:        db $01,$01,$01,$01,$20,$00,$01,$04
                    db $01,$00,$01,$00,$00,$00,$01,$00

DATA_29D056:        dw $D06A
                    dw $D05A
                    dw $0000
                    dw $FFFF
                    dw $FFE0
                    dw $FFDF
                    dw $FC00
                    dw $FBFF
                    dw $FBE0
                    dw $FBDF
                    dw $0000
                    dw $0001
                    dw $0020
                    dw $0021
                    dw $0400
                    dw $0401
                    dw $0420
                    dw $0421

DATA_29D07A:        dw $8000
                    dw $4000
                    dw $2000
                    dw $1000
                    dw $0800
                    dw $0400
                    dw $0200
                    dw $0100
                    dw $0080
                    dw $0040
                    dw $0020
                    dw $0010
                    dw $0008
                    dw $0004
                    dw $0002
                    dw $0001

CODE_29D09A:        REP   #$30
                    LDX.w $02B3
                    LDA   DATA_29D056,x             
                    STA.b $D8                   
                    LDA.w #$0029                
                    STA.b $DA
                    LDA.w $02B5                 
                    AND.w #$000F
                    ASL
                    TAX                         
                    LDA   DATA_29D07A,x             
                    STA.b $DB                   
                    LDX.w #$0000
                    TXY
                    LDA.w $02B5                 
                    CMP.w #$0010                  
                    BCC   CODE_29D0C6
                    INX
                    INX                         
CODE_29D0C6:        SEP   #$20                  
                    PHB                         
                    LDA.b #$7F                  
                    PHA                         
                    PLB                         
                    REP   #$20                  
CODE_29D0CF:        LDA   DATA_29CFD6,x             
                    AND.b $DB                   
                    STA.w $9600,y               
                    LDA   DATA_29CFE6,x             
                    AND.b $DB                   
                    STA.w $9608,y               
                    LDA   DATA_29CFF6,x             
                    AND.b $DB                   
                    STA.w $9610,y               
                    LDA   DATA_29D006,x             
                    AND.b $DB                   
                    STA.w $9618,y               
                    LDA   DATA_29D016,x             
                    AND.b $DB                   
                    STA.w $9620,y               
                    LDA   DATA_29D026,x             
                    AND.b $DB                   
                    STA.w $9628,y               
                    LDA   DATA_29D036,x             
                    AND.b $DB                   
                    STA.w $9630,y               
                    LDA   DATA_29D046,x             
                    AND.b $DB                   
                    STA.w $9638,y               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPY.w #$0008                  
                    BNE   CODE_29D0CF
                    SEP   #$20
                    PLB                         
                    REP   #$20                  
                    LDX.w #$0000                  
                    STZ.w $029A     
CODE_29D12D:        STZ.b $DB
                    STX.w $029F                 
                    LDA.l $7F9400,x             
                    STA.w $0299                 
                    AND.w #$001F                
                    ASL   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D149           
                    LDA.w #$0002                
                    STA.b $DB                   
CODE_29D149:        LDA.w $0299                 
                    AND.w #$03E0                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D15F           
                    LDA.w #$0004                
                    TSB.b $DB                   
CODE_29D15F:        LDA.w $029A                 
                    LSR   A                     
                    LSR   A                     
                    ASL   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D171           
                    LDA.w #$0008                
                    TSB.b $DB                   
CODE_29D171:        LDX.w $029F                 
                    LDY.b $DB                   
                    LDA.w $1300,x               
                    ADC.b [$D8],y               
                    STA.w $1300,x               
                    INX                         
                    INX                         
                    TXA                         
                    AND.w #$FF80                
                    BNE   CODE_29D189           
                    LDX.w #$0080                  
CODE_29D189:        TXA
                    AND.w $02B7                 
                    BNE   CODE_29D19C           
                    TXA                         
                    AND.w #$001F                
                    BNE   CODE_29D12D           
                    INX                         
                    INX                         
                    CPX.w #$0202                  
                    BNE   CODE_29D12D                  
CODE_29D19C:        INC.w $02B5
                    LDA.w $02B5                 
                    CMP.w #$0020                
                    BNE   CODE_29D1B3           
                    LDA.w $02B3                 
                    EOR.w #$0002                
                    STA.w $02B3                 
                    STZ.w $02B5                 
CODE_29D1B3:        SEP   #$30                  
                    LDA.b #$01                  
                    STA.w $1500                 
                    RTL                         

CODE_29D1BB:        REP   #$30                  
                    LDX.w #$0002                
                    STZ.w $029A                 
CODE_29D1C3:        STZ.b $DB                   
                    STX.w $029F                 
                    LDA.l $7F9400,x             
                    STA.w $0299                 
                    AND.w #$001F                
                    ASL   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D1DF           
                    LDA.w #$0002                
                    STA.b $DB                   
CODE_29D1DF:        LDA.w $0299                 
                    AND.w #$03E0                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D1F5           
                    LDA.w #$0004                
                    TSB.b $DB                   
CODE_29D1F5:        LDA.w $029A                 
                    LSR   A                     
                    LSR   A                     
                    ASL   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D207           
                    LDA.w #$0008                
                    TSB.b $DB                   
CODE_29D207:        LDX.w $029F                 
                    LDY.b $DB                   
                    LDA.w $1300,x               
                    ADC.b [$D8],y               
                    STA.w $1300,x               
                    INX                         
                    INX                         
                    CPX.w #$0020                
                    BCC   CODE_29D1C3           
                    LDA.w #$003E                
                    CPX.w #$0020                
                    BEQ   CODE_29D22B           
                    LDA.w #$005E                
                    CPX.w #$0040                
                    BNE   CODE_29D22F           
CODE_29D22B:        TAX                         
                    BRL   CODE_29D1C3           

CODE_29D22F:        SEP   #$30                  
                    RTL                         

CODE_29D232:        REP   #$30                  
                    LDX.w #$0010                
                    STZ.w $029A                 
CODE_29D23A:        STZ.b $DB                   
                    STX.w $029F                 
                    LDA.l $7F9400,x             
                    STA.w $0299                 
                    AND.w #$001F                
                    ASL   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D256           
                    LDA.w #$0002                
                    STA.b $DB                   
CODE_29D256:        LDA.w $0299                 
                    AND.w #$03E0                
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D26C           
                    LDA.w #$0004                
                    TSB.b $DB                   
CODE_29D26C:        LDA.w $029A                 
                    LSR   A                     
                    LSR   A                     
                    ASL   A                     
                    TAX                         
                    LDA.l $7F9600,x             
                    BNE   CODE_29D27E           
                    LDA.w #$0008                
                    TSB.b $DB                   
CODE_29D27E:        LDX.w $029F                 
                    LDY.b $DB                   
                    LDA.w $1300,x               
                    ADC.b [$D8],y               
                    STA.w $1300,x               
                    INX                         
                    INX                         
                    CPX.w #$0080                
                    BNE   CODE_29D23A           
                    SEP   #$30                  
                    RTL                         

CODE_29D295:        LDA.b #$0B                  
                    STA.w $101D                 
                    LDA.b #$04                  
                    STA.w $101C                 
                    RTS                         

                    LDA.w $101C                 
                    BEQ   CODE_29D2A8           
                    DEC.w $101C                 
CODE_29D2A8:        LDA.w $101D                 
                    BEQ   CODE_29D2CD           
                    LDA.w $101C                 
                    BNE   CODE_29D2CD           
                    LDA.b #$04                  
                    STA.w $101C                 
                    DEC.w $101D                 
                    BNE   CODE_29D2CD           
                    LDA.w $0727                 
                    CMP.b #$06                  
                    BNE   CODE_29D2CD           
                    LDA.b #$06                  
                    STA.w $1202                 
                    LDA.b #$78                  
                    STA.w $0711                 
CODE_29D2CD:        RTS                         

CODE_29D2CE:        LDA.w $101E                 
                    BNE   CODE_29D2D7           
                    SEC                         
                    JMP.w CODE_29D295           

CODE_29D2D7:        RTS                         

                    LDA.w $101E                 
                    BNE   CODE_29D2F8           
                    LDA.w $101C                 
                    BEQ   CODE_29D2E5           
                    DEC.w $101C                 
CODE_29D2E5:        LDA.w $101D                 
                    BEQ   CODE_29D2F8           
                    LDA.w $101C                 
                    BNE   CODE_29D2F7           
                    LDA.b #$04                  
                    STA.w $101C                 
                    DEC.w $101D                 
CODE_29D2F7:        RTS                         

CODE_29D2F8:        LDA.b #$00                  
                    STA.w $101E                 
                    RTS                         

PNTR_29D2FE:        dw DATA_29D31A
                    dw DATA_29D32A
                    dw DATA_29D31A
                    dw DATA_29D32A
                    dw DATA_29D33A
                    dw DATA_29D30A

DATA_29D30A:        db $00,$00,$A0,$30,$20,$20,$00,$0C
                    db $00,$00,$A0,$30,$B5,$5A,$52,$4E

DATA_29D31A:        db $00,$00,$E0,$38,$DA,$7F,$9F,$1F
                    db $00,$00,$E0,$38,$B5,$66,$D1,$6E

DATA_29D32A:        db $00,$00,$20,$41,$35,$7B,$D1,$6E
                    db $00,$00,$20,$41,$B5,$66,$4D,$5E

DATA_29D33A:        db $00,$00,$60,$49,$6F,$76,$0B,$5E
                    db $00,$00,$60,$49,$73,$66,$10,$5A

DATA_29D34A:        db $BB,$7F,$4D,$6E,$BB,$7F,$4D,$6E
                    db $44,$45,$00,$0C

CODE_29D356:        PHB
                    PHK
                    PLB                         
                    LDA.w $0356                 
                    BNE   CODE_29D368           
                    LDA.w $0783                 
                    CMP.b #$06                  
                    BCS   CODE_29D3AB                   
                    STZ.w $0356                 
CODE_29D368:        LDA.w $0356                 
                    BNE   CODE_29D374           
                    LDA.b #$45                  
                    STA.w $1200                 
                    LDA.b #$00                  
CODE_29D374:        ASL   A                     
                    AND.b #$0E                  
                    TAX                         
                    REP   #$20                  
                    LDA.w DATA_29D34A,x               
                    STA.w $1300                 
                    LDA.w PNTR_29D2FE,x               
                    STA.b $00                   
                    LDY.b #$00                  
                    TYX                         
CODE_29D388:        LDA.b ($00),y               
                    BEQ   CODE_29D38F           
                    STA.w $1310,x               
CODE_29D38F:        INX                         
                    INX                         
                    INY                         
                    INY                         
                    TYA                         
                    AND.w #$000F                
                    BNE   CODE_29D388           
                    SEP   #$20                  
                    INC.w $1500                 
                    INC.w $0356                 
                    LDA.w $0356                 
                    CMP.b #$06                  
                    BNE   CODE_29D3AB           
                    STZ.w $0356                 
CODE_29D3AB:        PLB                         
                    RTL                         

DATA_29D3AD:        db $BB,$7F,$00,$0C,$BB,$7F,$14,$7B
                    db $90,$66,$ED,$51,$48,$3D,$C4,$2C
                    db $40,$1C,$00,$0C

CODE_29D3C1:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0356                 
                    BNE   CODE_29D3D8           
                    LDA.w $07BE                 
                    BNE   CODE_29D401           
                    LDA.w $0783                 
                    CMP.b #$05                  
                    BCS   CODE_29D401                   
                    STZ.w $0356                 
CODE_29D3D8:        LDA.w $0356                 
                    BNE   CODE_29D3E4           
                    LDA.b #$45                  
                    STA.w $1200                 
                    LDA.b #$00                  
CODE_29D3E4:        AND.b #$FE                  
                    TAX                         
                    REP   #$20                  
                    LDA.w DATA_29D3AD,x               
                    STA.w $135E                 
                    SEP   #$20                  
                    INC.w $1500                 
                    INC.w $0356                 
                    LDA.w $0356                 
                    CMP.b #$14                  
                    BNE   CODE_29D401           
                    STZ.w $0356                 
CODE_29D401:        PLB                         
                    RTL                         

DATA_29D403:        db $0F,$2A

DATA_29D405:        db $72,$36

DATA_29D407:        db $69,$25,$51,$32
                    db $B4,$3E,$8A,$29,$93,$3A,$F6,$46
                    db $AB,$2D,$D5,$42,$38,$4F,$CC,$31
                    db $93,$3A,$F6,$46,$AB,$2D,$51,$32
                    db $B4,$3E,$8A,$29,$0F,$2A,$72,$36
                    db $69,$25,$CD,$21,$30,$2E,$48,$21

PNTR_29D433:        dw DATA_29D443
                    dw DATA_29D463
                    dw DATA_29D483
                    dw DATA_29D4A3
                    dw DATA_29D4C3
                    dw DATA_29D4E3
                    dw DATA_29D503
                    dw DATA_29D523

DATA_29D443:        db $54,$7F,$C0,$3D,$C0,$3D,$C0,$3D
                    db $C0,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$89,$46,$89,$46
                    db $46,$46,$46,$46,$46,$46,$46,$46

DATA_29D463:        db $54,$7F,$C0,$3D,$C0,$3D,$C0,$3D
                    db $E2,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$89,$46,$AB,$46
                    db $46,$46,$46,$46,$46,$46,$68,$46

DATA_29D483:        db $54,$7F,$C0,$3D,$C0,$3D,$E2,$3D
                    db $E4,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$89,$46,$CD,$46
                    db $46,$46,$68,$46,$68,$46,$8A,$46

DATA_29D4A3:        db $54,$7F,$C0,$3D,$E2,$3D,$E4,$3D
                    db $C0,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$AB,$46,$AB,$46
                    db $68,$46,$8A,$46,$8A,$46,$46,$46

DATA_29D4C3:        db $54,$7F,$E4,$3D,$C0,$3D,$C0,$3D
                    db $C0,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$CD,$46,$89,$46
                    db $8A,$46,$8A,$46,$8A,$46,$46,$46

DATA_29D4E3:        db $54,$7F,$E4,$3D,$C0,$3D,$C0,$3D
                    db $C0,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$AB,$46,$89,$46
                    db $46,$46,$46,$46,$46,$46,$46,$46

DATA_29D503:        db $54,$7F,$C0,$3D,$C0,$3D,$C0,$3D
                    db $C0,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$89,$46,$89,$46
                    db $46,$46,$46,$46,$46,$46,$46,$46

DATA_29D523:        db $54,$7F,$C0,$3D,$C0,$3D,$C0,$3D
                    db $C0,$3D,$20,$3D,$80,$3D,$60,$39
                    db $80,$35,$E3,$39,$89,$46,$89,$46
                    db $46,$46,$46,$46,$46,$46,$46,$46

DATA_29D543:        db $82,$72

DATA_29D545:        db $A5,$72

DATA_29D547:        db $C7,$72

DATA_29D549:        db $0B,$73
                    db $0B,$73,$82,$72,$A5,$72,$C7,$72
                    db $C7,$72,$0B,$73,$82,$72,$A5,$72
                    db $A5,$72,$C7,$72,$0B,$73,$82,$72

DATA_29D563:        db $3F,$1F

DATA_29D565:        db $7F,$3F

DATA_29D567:        db $BF,$5F

DATA_29D569:        db $FF,$7F
                    db $3F,$1F,$3F,$1F,$7F,$3F,$BF,$5F
                    db $3F,$1F,$3F,$1F,$3F,$1F,$7F,$3F
                    db $3F,$1F,$3F,$1F,$3F,$1F,$3F,$1F
                    db $7F,$3F,$3F,$1F,$3F,$1F,$3F,$1F
                    db $FF,$7F,$7F,$3F,$3F,$1F,$3F,$1F
                    db $BF,$5F,$FF,$7F,$7F,$3F,$3F,$1F
                    db $7F,$3F,$BF,$5F,$FF,$7F,$7F,$3F

DATA_29D5A3:        db $00,$00

DATA_29D5A5:        db $00,$00

DATA_29D5A7:        db $0B,$0D

DATA_29D5A9:        db $34,$36

DATA_29D5AB:        db $FF,$73

DATA_29D5AD:        db $05,$04

DATA_29D5AF:        db $08,$10

DATA_29D5B1:        db $F1,$28
                    db $00,$00,$00,$00,$A8,$00,$6E,$1D
                    db $F7,$52,$07,$08,$AF,$20,$92,$1C
                    db $00,$00,$00,$00,$45,$00,$A8,$04
                    db $EF,$31,$4B,$10,$92,$1C,$99,$51
                    db $00,$00,$00,$00,$A8,$00,$6E,$1D
                    db $F7,$52,$07,$08,$AF,$20,$92,$1C

DATA_29D5E3:        db $FF,$FF

DATA_29D5E5:        db $00,$00

DATA_29D5E7:        db $02,$31

DATA_29D5E9:        db $2D,$56

DATA_29D5EB:        db $FC,$7F

DATA_29D5ED:        db $02,$24

DATA_29D5EF:        db $04,$30

DATA_29D5F1:        db $CA,$48
                    db $FF,$FF,$00,$00,$A0,$24,$88,$41
                    db $31,$7F,$02,$2C,$A9,$4C,$D0,$65
                    db $FF,$FF,$00,$00,$40,$18,$E3,$2C
                    db $E9,$61,$87,$3C,$B3,$5D,$79,$72
                    db $FF,$FF,$00,$00,$A0,$24,$88,$41
                    db $31,$7F,$02,$2C,$A9,$4C,$D0,$65

DATA_29D623:        db $CA,$14,$0E,$1D,$52,$21,$97,$29
                    db $EB,$1C,$4E,$29,$B1,$35,$39,$46
                    db $C9,$14,$0D,$1D,$50,$25,$93,$2D
                    db $EA,$1C,$4D,$29,$B0,$35,$37,$46
                    db $C9,$14,$0C,$1D,$4F,$25,$91,$2D
                    db $E9,$1C,$4C,$29,$AF,$35,$35,$46
                    db $C8,$14,$0B,$1D,$4D,$25,$8F,$2D
                    db $E8,$1C,$4B,$29,$AE,$35,$33,$46
                    db $E8,$18,$2A,$21,$6C,$29,$AE,$31
                    db $E7,$1C,$4A,$29,$AD,$35,$31,$46
                    db $C8,$14,$0B,$1D,$4D,$25,$8F,$2D
                    db $E8,$1C,$4B,$29,$AE,$35,$33,$46
                    db $C9,$14,$0C,$1D,$4F,$25,$91,$2D
                    db $E9,$1C,$4C,$29,$AF,$35,$35,$46
                    db $C9,$14,$0D,$1D,$50,$25,$93,$2D
                    db $EA,$1C,$4D,$29,$B0,$35,$37,$46

DATA_29D6A3:        db $CA,$14,$C9,$14,$C9,$14,$C8,$14
                    db $E8,$18,$C8,$14,$C9,$14,$C9,$14

DATA_29D6B3:        db $70,$29,$6F,$29,$6E,$29,$6D,$29
                    db $6C,$29,$6D,$29,$6E,$29,$6F,$29

DATA_29D6C3:        db $B2,$31,$B1,$31,$B0,$31,$AF,$31
                    db $AE,$31,$AF,$31,$B0,$31,$B1,$31

DATA_29D6D3:        db $39,$46,$37,$46,$35,$46,$33,$46
                    db $31,$46,$33,$46,$35,$46,$37,$46

DATA_29D6E3:        db $0E,$1D,$0D,$1D,$0C,$1D,$0B,$1D
                    db $2A,$21,$0B,$1D,$0C,$1D,$0D,$1D

DATA_29D6F3:        db $52,$21,$50,$25,$4F,$25,$4D,$25
                    db $6C,$29,$4D,$25,$4F,$25,$50,$25

DATA_29D703:        db $97,$29,$93,$2D,$91,$2D,$8F,$2D
                    db $AE,$31,$8F,$2D,$91,$2D,$93,$2D

CODE_29D713:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0350                 
                    CMP.b #$06                  
                    BNE   CODE_29D74A           
                    LDA.w $0356                 
                    INC   A                     
                    STA.w $0356                 
                    AND.b #$38                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w DATA_29D403,x               
                    STA.w $132E                 
                    LDA.w DATA_29D405,x               
                    STA.w $1330                 
                    LDA.w DATA_29D407,x               
                    STA.w $1332                 
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D74A:        CMP.b #$14                  
                    BNE   CODE_29D772           
                    INC.w $0356                 
                    LDA.w $0356                 
                    AND.b #$38                  
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w PNTR_29D433,x               
                    STA.b $00                   
                    LDY.b #$00                  
CODE_29D762:        LDA.b ($00),y               
                    STA.w $1340,y               
                    INY                         
                    INY                         
                    CPY.b #$20                  
                    BNE   CODE_29D762           
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D772:        CMP.b #$16                  
                    BEQ   CODE_29D77A           
                    CMP.b #$1E                  
                    BNE   CODE_29D7A5           
CODE_29D77A:        INC.w $0356                 
                    LDA.w $0356                 
                    AND.b #$18                  
                    TAY                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    REP   #$20                  
                    LDA   DATA_29D543,y               
                    STA.w $1330                 
                    LDA   DATA_29D545,y               
                    STA.w $1332                 
                    LDA   DATA_29D547,y               
                    STA.w $1334                 
                    LDA   DATA_29D549,y               
                    STA.w $1336                 
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D7A5:        CMP.b #$17                  
                    BNE   CODE_29D7D1           
                    INC.w $0356                 
                    LDA.w $0356                 
                    AND.b #$38                  
                    TAY                         
                    REP   #$20                  
                    LDA   DATA_29D563,y               
                    STA.w $134E                 
                    LDA   DATA_29D565,y               
                    STA.w $1350                 
                    LDA   DATA_29D567,y               
                    STA.w $1352                 
                    LDA   DATA_29D569,y               
                    STA.w $1354                 
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D7D1:        CMP.b #$1C                  
                    BNE   CODE_29D815           
                    INC.w $0356                 
                    LDA.w $0356                 
                    AND.b #$30                  
                    TAY                         
                    REP   #$20                  
                    LDA   DATA_29D5A3,y               
                    STA.w $1350                 
                    LDA   DATA_29D5A5,y               
                    STA.w $1352                 
                    LDA   DATA_29D5A7,y               
                    STA.w $1354                 
                    LDA   DATA_29D5A9,y               
                    STA.w $1356                 
                    LDA   DATA_29D5AB,y               
                    STA.w $1358                 
                    LDA   DATA_29D5AD,y               
                    STA.w $135A                 
                    LDA   DATA_29D5AF,y               
                    STA.w $135C                 
                    LDA   DATA_29D5B1,y               
                    STA.w $135E                 
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D815:        CMP.b #$1D                  
                    BNE   CODE_29D859           
                    INC.w $0356                 
                    LDA.w $0356                 
                    AND.b #$30                  
                    TAY                         
                    REP   #$20                  
                    LDA   DATA_29D5E3,y               
                    STA.w $1342                 
                    LDA   DATA_29D5E5,y               
                    STA.w $1344                 
                    LDA   DATA_29D5E7,y               
                    STA.w $1346                 
                    LDA   DATA_29D5E9,y               
                    STA.w $1348                 
                    LDA   DATA_29D5EB,y               
                    STA.w $134A                 
                    LDA   DATA_29D5ED,y               
                    STA.w $134C                 
                    LDA   DATA_29D5EF,y               
                    STA.w $134E                 
                    LDA   DATA_29D5F1,y               
                    STA.w $1350                 
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D859:        CMP.b #$1F                  
                    BNE   CODE_29D8AD           
                    INC.w $0356                 
                    LDA.w $0356                 
                    AND.b #$38                  
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w DATA_29D6A3,x               
                    STA.w $1342                 
                    LDA.w DATA_29D6B3,x               
                    STA.w $134E                 
                    LDA.w DATA_29D6C3,x               
                    STA.w $1350                 
                    LDA.w DATA_29D6D3,x               
                    STA.w $1358                 
                    LDA.w DATA_29D6E3,x               
                    STA.w $135A                 
                    LDA.w DATA_29D6F3,x               
                    STA.w $135C                 
                    LDA.w DATA_29D703,x               
                    STA.w $135E                 
                    LDX.b #$00                  
CODE_29D89A:        LDA   DATA_29D623,y               
                    STA.w $132A,x               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPX.b #$10                  
                    BNE   CODE_29D89A           
                    SEP   #$20                  
                    INC.w $1500                 
CODE_29D8AD:        PLB                         
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF

CODE_29D8E0:        LDA.w $0423
                    BEQ   CODE_29D8E8           
                    JSR.w CODE_29DE9E           
CODE_29D8E8:        LDA.w $05F2                 
                    BEQ   CODE_29D8F2           
                    LDA.b #$02                  
                    STA.w $0556                 
CODE_29D8F2:        JSR.w CODE_29D8F6           
                    RTL                         

CODE_29D8F6:        LDA.w $041C                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29D907
                    dw CODE_29D93D
                    dw CODE_29D988
                    dw CODE_29D98C
                    dw CODE_29DAF5
  
CODE_29D907:        LDA.b #$0F                  
                    STA.w $0419                 
                    LDA.b #$00                  
                    STA.w $041F                 
                    LDX.w $070A                 
                    CPX.b #$07                  
                    BEQ   CODE_29D91B           
                    STA.w $041D                 
CODE_29D91B:        LDA.b #$48                  
                    STA.w $041E                 
                    LDX.b #$00                  
                    STX.w $041B                 
                    INC.w $041C                 
                    LDA.w $05F2                 
                    BEQ   CODE_29D93C           
                    LDA.w $041D                 
                    LDX.w $0726                 
                    BEQ   CODE_29D938           
                    CLC                         
                    ADC.b #$23                  
CODE_29D938:        TAX                         
                    LDA.w $1D80,x               
CODE_29D93C:        RTS                         

CODE_29D93D:        LDX.w $1600                 
                    LDA.w $0419                 
                    STA.w $1602,x               
                    LDY.w $041B                 
                    LDA.w $EDED,y               
                    STA.w $1603,x               
                    LDA.b #$40                  
                    STA.w $1604,x               
                    LDA.b #$3E                  
                    STA.w $1605,x               
                    LDA.b #$AE                  
                    STA.w $1606,x               
                    LDA.b #$02                  
                    STA.w $1607,x               
                    LDA.b #$FF                  
                    STA.w $1608,x               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$06                  
                    STA.w $1600                 
                    INY                         
                    TYA                         
                    AND.b #$03                  
                    STA.w $041B                 
                    BNE   CODE_29D987           
                    LDX.w $05F2                 
                    BEQ   CODE_29D981           
                    LDA.b #$08                  
CODE_29D981:        STA.w $041B                 
                    INC.w $041C                 
CODE_29D987:        RTS                         

CODE_29D988:        INC.w $041C                 
                    RTS                         

CODE_29D98C:        LDA.w $05F2                 
                    ASL   A                     
                    TAX                         
                    LDA.w $EDF1,x               
                    STA.b $0D                   
                    LDA.w $EDF2,x               
                    STA.b $0E                   
                    LDA.b #$22                  
                    STA.b $0F                   
                    REP   #$30                  
                    LDA.w $041B                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    LDA.w $EE15,y               
                    STA.b $0B                   
                    LDA.w $EDF5,y               
                    TAY                         
                    LDX.w $1600                 
                    STX.b $08                   
CODE_29D9B7:        LDA.b [$0D],y               
                    STA.w $1602,x               
                    INX                         
                    INY                         
                    CPY.b $0B                   
                    BNE   CODE_29D9B7           
                    SEP   #$30                  
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$16                  
                    STA.b $0C                   
                    DEX                         
                    STX.w $1600                 
                    LDA.w $041B                 
                    AND.b #$07                  
                    TAX                         
                    DEX                         
                    SEC                         
                    SBC.b #$04                  
                    CMP.b #$02                  
                    BCS   CODE_29D9E1                   
                    JSR.w CODE_29D9FD           
CODE_29D9E1:        JSR.w CODE_29DA81           
                    INC.w $041B                 
                    LDA.w $041B                 
                    AND.b #$07                  
                    BNE   CODE_29D9FC           
                    LDA.w $05F2                 
                    BNE   CODE_29D9F9           
                    LDA.b #$00                  
                    STA.w $041C                 
                    RTS                         

CODE_29D9F9:        INC.w $041C                 
CODE_29D9FC:        RTS                         

CODE_29D9FD:        LDA.w $05F2                 
                    BNE   CODE_29DA19           
                    LDA.b #$1C                  
                    LDX.w $0726                 
                    BEQ   CODE_29DA0B           
                    LDA.b #$3F                  
CODE_29DA0B:        STA.b $0B                   
                    LDA.b $0C                   
                    CLC                         
                    ADC.b #$1A                  
                    STA.b $0C                   
                    LDA.b #$02                  
                    JMP.w CODE_29DA2A           

CODE_29DA19:        LDA.b #$00                  
                    LDX.w $0726                 
                    BEQ   CODE_29DA22           
                    LDA.b #$23                  
CODE_29DA22:        CLC                         
                    ADC.w $041D                 
                    STA.b $0B                   
                    LDA.b #$06                  
CODE_29DA2A:        STA.b $0A                   
                    LDA.w $05F2                 
                    ASL   A                     
                    TAX                         
                    LDA.w $EE35,x               
                    STA.b $0D                   
                    LDA.w $EE36,x               
                    STA.b $0E                   
                    LDA.b #$21                  
                    STA.b $0F                   
CODE_29DA3F:        LDY.b $0B                   
                    LDA.w $1D80,y               
                    BEQ   CODE_29DA73           
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.w $041B                 
                    AND.b #$07                  
                    CMP.b #$04                  
                    BEQ   CODE_29DA56           
                    TYA                         
                    ORA.b #$02                  
                    TAY                         
CODE_29DA56:        LDX.b $0C                   
                    REP   #$30                  
                    TXA                         
                    AND.w #$00FF                
                    TAX                         
                    TYA                         
                    ASL   A                     
                    TAY                         
CODE_29DA62:        LDA.b [$0D],y               
                    STA.w $1602,x               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    TYA                         
                    AND.w #$0002                
                    BNE   CODE_29DA62           
                    SEP   #$30                  
CODE_29DA73:        LDA.b $0C                   
                    CLC                         
                    ADC.b #$06                  
                    STA.b $0C                   
                    INC.b $0B                   
                    DEC.b $0A                   
                    BPL   CODE_29DA3F           
CODE_29DA80:        RTS                         

CODE_29DA81:        LDA.w $041B                 
                    AND.b #$07                  
                    JSL.l CODE_20FB1F           

                    dw CODE_29DA80
                    dw CODE_29DA80
                    dw CODE_29DA80
                    dw CODE_29DA80
                    dw CODE_29DA9A
                    dw CODE_29DABD
                    dw CODE_29DA80
                    dw CODE_29DA80

CODE_29DA9A:        JSL.l CODE_29E730           
                    LDA.w $041B                 
                    AND.b #$08                  
                    BNE   CODE_29DABC           
                    JSR.w CODE_29E6E0           
                    LDX.b $08                   
                    LDA.w $1F48                 
                    CMP.b #$F0                  
                    BNE   CODE_29DAB3           
                    LDA.b #$FE                  
CODE_29DAB3:        STA.w $162A,x               
                    LDA.w $1F49                 
                    STA.w $162C,x               
CODE_29DABC:        RTS                         

CODE_29DABD:        JSL.l CODE_29E766           
                    JSR.w CODE_29E6AA           
                    LDX.b $08                   
                    LDA.w $1F4A                 
                    CMP.b #$F0                  
                    BNE   CODE_29DACF           
                    LDA.b #$FE                  
CODE_29DACF:        STA.w $1610,x               
                    LDA.w $1F4B                 
                    STA.w $1612,x               
                    LDA.w $041B                 
                    AND.b #$08                  
                    BNE   CODE_29DAF4           
                    JSL.l CODE_29E7AA           
                    LDX.b $08                   
                    LDY.b #$00                  
CODE_29DAE7:        LDA.w $1F4C,y               
                    STA.w $1616,x               
                    INX                         
                    INX                         
                    INY                         
                    CPY.b #$06                  
                    BNE   CODE_29DAE7           
CODE_29DAF4:        RTS                         

CODE_29DAF5:        LDA.w $0423                 
                    BNE   CODE_29DA80           
                    LDA.b $A8                   
                    BEQ   CODE_29DB01           
                    JMP.w CODE_29DC21           

CODE_29DB01:        LDX.w $0726                 
                    LDA.b $F8,x                 
                    ORA.b $18                   
                    AND.b #$40                  
                    BEQ   CODE_29DB21           
                    LDA.b #$1C                  
                    STA.w $1203                 
CODE_29DB11:        LDA.w $05F2                 
                    EOR.b #$01                  
                    STA.w $05F2                 
                    LDA.b #$00                  
                    STA.w $041C                 
                    JMP.w CODE_29D907           

CODE_29DB21:        LDX.b #$07                  
                    LDA.w $0726                 
                    BEQ   CODE_29DB2A           
                    LDX.b #$2A                  
CODE_29DB2A:        LDA.w $1D80,x               
                    BEQ   CODE_29DBA5           
                    LDA.w $18                 
                    AND.b #$0C                  
                    BEQ   CODE_29DBA5           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    BNE   CODE_29DB56           
                    LDA.w $041D                 
                    CMP.b #$15                  
                    BEQ   CODE_29DB54           
                    CLC                         
                    ADC.b #$07                  
                    LDX.w $0726                 
                    BEQ   CODE_29DB4E           
                    CLC                         
                    ADC.b #$23                  
CODE_29DB4E:        TAX                         
                    LDA.w $1D80,x               
                    BNE   CODE_29DB5B           
CODE_29DB54:        BRA   CODE_29DBA5           

CODE_29DB56:        LDA.w $041D                 
                    BEQ   CODE_29DB54           
CODE_29DB5B:        LDA.b #$23                  
                    STA.w $1203                 
                    LDA.w $041D                 
                    CLC                         
                    ADC.w $EEC9,y               
                    STA.w $041D                 
                    CMP.w $EECB,y               
                    BNE   CODE_29DB75           
                    LDA.w $EECD,y               
                    STA.w $041D                 
CODE_29DB75:        LDX.w $041D                 
                    LDA.w $0726                 
                    BEQ   CODE_29DB82           
                    TXA                         
                    CLC                         
                    ADC.b #$23                  
                    TAX                         
CODE_29DB82:        LDY.w $0726                 
                    TXA                         
                    CMP.w $EED9,y               
                    BEQ   CODE_29DB90           
                    LDA.w $1D80,x               
                    BEQ   CODE_29DB21           
CODE_29DB90:        LDA.b #$0C                  
                    STA.w $041B                 
                    LDA.b #$03                  
                    STA.w $041C                 
                    LDA.b #$00                  
                    STA.w $041F                 
                    LDA.b #$48                  
                    STA.w $041E                 
                    RTS                         

CODE_29DBA5:        LDA.w $070A                 
                    CMP.b #$07                  
                    BEQ   CODE_29DBBA           
                    LDY.b #$00                  
                    LDX.w $0726                 
                    BEQ   CODE_29DBB5           
                    LDY.b #$23                  
CODE_29DBB5:        LDA.w $1D80,y               
                    BNE   CODE_29DBBB           
CODE_29DBBA:        RTS                         

CODE_29DBBB:        LDX.b #$01                  
                    LDA.w $0726                 
                    BEQ   CODE_29DBC4           
                    LDX.b #$24                  
CODE_29DBC4:        LDA.w $1D80,x               
                    BEQ   CODE_29DC15           
                    LDA.b $18                   
                    AND.b #$03                  
                    BEQ   CODE_29DC15           
                    LSR   A                     
                    TAX                         
                    LDA.b #$23                  
                    STA.w $1203                 
CODE_29DBD6:        LDA.w $041F                 
                    CLC                         
                    ADC.w $EED5,x               
                    STA.w $041F                 
                    LDA.w $041E                 
                    CLC                         
                    ADC.w $EECF,x               
                    STA.w $041E                 
                    CMP.w $EED1,x               
                    BNE   CODE_29DBFB           
                    LDA.w $EED7,x               
                    STA.w $041F                 
                    LDA.w $EED3,x               
                    STA.w $041E                 
CODE_29DBFB:        LDA.w $041F                 
                    CLC                         
                    ADC.w $041D                 
                    TAY                         
                    LDA.w $0726                 
                    BEQ   CODE_29DC0D           
                    TYA                         
                    CLC                         
                    ADC.b #$23                  
                    TAY                         
CODE_29DC0D:        LDA.w $1D80,y               
                    BEQ   CODE_29DBD6           
                    JMP.w CODE_29DC49           

CODE_29DC15:        LDY.w $0726                 
                    LDA.w $F8,y               
                    ORA.b $18                   
                    AND.b #$80                  
                    BEQ   CODE_29DC49           
CODE_29DC21:        LDA.w $041F                 
                    CLC                         
                    ADC.w $041D                 
                    TAY                         
                    LDA.w $0726                 
                    BEQ   CODE_29DC33           
                    TYA                         
                    CLC                         
                    ADC.b #$23                  
                    TAY                         
CODE_29DC33:        LDA.w $1D80,y               
                    CMP.b #$0C                  
                    BNE   CODE_29DC46           
                    LDA.w $0597                 
                    BEQ   CODE_29DC46           
                    LDA.b #$2A                  
                    STA.w $1203                 
                    BRA   CODE_29DC49           

CODE_29DC46:        JMP.w CODE_29DC65           

CODE_29DC49:        JMP.w CODE_29DF1D           

                    LDX.w $070A                 
                    CPX.b #$07                  
                    BEQ   CODE_29DC64           
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w $EEDB,x               
                    STA.w $1464                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $1500                 
CODE_29DC64:        RTS                         

CODE_29DC65:        LDA.w $1D80,y               
                    JSL.l CODE_20FB1F           

                    dw CODE_29DBBA
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DC88
                    dw CODE_29DD4A
                    dw CODE_29DD60
                    dw CODE_29DD90
                    dw CODE_29DE4B
                    dw CODE_29DD80
                    
CODE_29DC88:        LDA.w $041F                 
                    CLC                         
                    ADC.w $041D                 
                    TAY                         
                    LDA.w $0726                 
                    BEQ   CODE_29DC9A           
                    TYA                         
                    CLC                         
                    ADC.b #$23                  
                    TAY                         
CODE_29DC9A:        LDX.w $1D80,y               
                    TXA                         
                    ASL   A                     
                    TAY                         
                    LDA.w $0726                 
                    BEQ   CODE_29DCAA           
                    TYA                         
                    CLC                         
                    ADC.b #$12                  
                    TAY                         
CODE_29DCAA:        PHX                         
                    REP   #$30                  
                    TYA                         
                    AND.w #$00FF                
                    TAY                         
                    PHB                         
                    LDX.w $EF09,y               
                    LDY.w #$14E0                
                    LDA.w #$001F                
                    MVN.w $3C00                 
                    PLB                         
                    SEP   #$30                  
                    PLX                         
                    LDA.b #$01                  
                    STA.w $1500                 
                    LDA.w $EEF7,x               
                    STA.w $1200                 
                    LDA.w $EF00,x               
                    LDX.w $0726                 
                    STA.w $0429                 
                    CMP.b #$07                  
                    BEQ   CODE_29DCE4           
                    CMP.b #$08                  
                    BNE   CODE_29DCE1           
                    LDA.b #$03                  
CODE_29DCE1:        STA.w $0747,x               
CODE_29DCE4:        LDA.b #$14                  
                    STA.w $0423                 
                    LDX.w $0726                 
                    LDA.b $43,x                 
                    STA.b $A6                   
                    LDA.b $47,x                 
                    STA.b $A7                   
CODE_29DCF4:        LDA.b #$1B                  
                    STA.b $0E                   
                    LDA.w $041F                 
                    CLC                         
                    ADC.w $041D                 
                    TAY                         
                    LDA.w $0726                 
                    BEQ   CODE_29DD11           
                    LDA.b #$1B                  
                    CLC                         
                    ADC.b #$23                  
                    STA.b $0E                   
                    TYA                         
                    CLC                         
                    ADC.b #$23                  
                    TAY                         
CODE_29DD11:        CPY.b $0E                   
                    BEQ   CODE_29DD1F           
                    LDA.w $1D81,y               
                    STA.w $1D80,y               
                    INY                         
                    JMP.w CODE_29DD11           

CODE_29DD1F:        LDA.b #$00                  
                    STA.w $1D80,y               
CODE_29DD24:        LDY.w $041D                 
                    BEQ   CODE_29DD44           
                    LDA.w $0726                 
                    BEQ   CODE_29DD33           
                    TYA                         
                    CLC                         
                    ADC.b #$23                  
                    TAY                         
CODE_29DD33:        LDA.w $1D80,y               
                    BNE   CODE_29DD44           
                    LDA.w $041D                 
                    SEC                         
                    SBC.b #$07                  
                    STA.w $041D                 
                    JMP.w CODE_29DD24           

CODE_29DD44:        JSR.w CODE_29DB90           
                    JMP.w CODE_29DF1D           

CODE_29DD4A:        INC.w $0428                 
                    LDA.b #$03                  
                    STA.w $02C6                 
                    STZ.w $02C7                 
                    LDA.b #$0A                  
                    STA.w $1200                 
                    JSR.w CODE_29DCF4           
                    JMP.w CODE_29DB11           

CODE_29DD60:        LDA.l $7E396F               
                    BEQ   CODE_29DD6C           
CODE_29DD66:        LDA.b #$2A                  
                    STA.w $1203                 
                    RTS                         

CODE_29DD6C:        LDA.l $7E396F               
                    INC   A                     
                    STA.l $7E396F               
                    LDA.b #$0C                  
                    STA.w $1200                 
                    JSR.w CODE_29DCF4           
                    JMP.w CODE_29DB11           

CODE_29DD80:        LDA.b #$02                  
                    STA.w $1F55                 
                    LDA.b #$0E                  
                    STA.w $1202                 
                    JSR.w CODE_29DCF4           
                    JMP.w CODE_29DB11           

CODE_29DD90:        LDA.b #$03                  
                    STA.b $00                   
CODE_29DD94:        LDY.b $00                   
                    JSL.l CODE_238EFC           
                    SEC                         
                    SBC.b #$51                  
                    CMP.b #$02                  
                    BCC   CODE_29DDA8           
                    DEC.b $00                   
                    BPL   CODE_29DD94           
                    JMP.w CODE_29DD66           

CODE_29DDA8:        STX.b $01                   
                    LSR.b $01                   
                    PHA                         
                    TAX                         
                    LDA.w $EF2D,x               
                    STA.b [$2E],y               
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $A7                   
                    STA.b $02                   
                    TYA                         
                    AND.b #$F0                  
                    CLC                         
                    ADC.b #$10                  
                    STA.b $A6                   
                    STA.b $00                   
                    JSR.w CODE_29DF76           
                    TYA                         
                    EOR.b #$40                  
                    TAY                         
                    LDA.w $1D00,y               
                    ORA.w $EF4E,x               
                    STA.w $1D00,y               
                    LDX.b $A7                   
                    LDA.b $A6                   
                    SEC                         
                    SBC.b #$10                  
                    JSL.l CODE_20973C           
                    LDX.w $0726                 
                    LDA.b $45,x                 
                    AND.b #$01                  
                    BEQ   CODE_29DDF0           
                    LDA.b $0E                   
                    ORA.b #$04                  
                    STA.b $0E                   
CODE_29DDF0:        PLA                         
                    PHA                         
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDY.w $1600                 
                    LDA.b $0E                   
                    STA.w $1602,y               
                    CLC                         
                    ADC.w #$0100                
                    STA.w $160A,y               
                    LDA.w #$8003                
                    XBA                         
                    STA.w $1604,y               
                    STA.w $160C,y               
                    LDA.w $EF2F,x               
                    STA.w $1606,y               
                    LDA.w $EF33,x               
                    STA.w $1608,y               
                    LDA.w $EF37,x               
                    STA.w $160E,y               
                    LDA.w $EF3B,x               
                    STA.w $1610,y               
                    LDA.w #$FFFF                
                    STA.w $1612,y               
                    LDA.w $1600                 
                    CLC                         
                    ADC.w #$0010                
                    STA.w $1600                 
                    SEP   #$20                  
                    PLA                         
                    TAX                         
                    LDA.b #$07                  
                    STA.w $1203                 
                    LDA.b #$14                  
                    STA.w $0423                 
                    JSR.w CODE_29DE9E           
                    JMP.w CODE_29DCF4           

CODE_29DE4B:        LDY.w $0726                 
                    LDX.b #$00                  
                    LDA.w $47,y               
                    SEC                         
                    SBC.w $0210                 
                    CMP.b #$80                  
                    BCS   CODE_29DE5D                   
                    LDX.b #$01                  
CODE_29DE5D:        STX.b $58                   
                    LDA.w $EF3F,x               
                    STA.b $56                   
                    LDA.w $43,y               
                    STA.b $54                   
                    STA.l $7E3974               
                    LDA.w $43,y               
                    STA.w $0730                 
                    LDA.w $47,y               
                    STA.w $0732                 
                    LDA.w $45,y               
                    STA.w $0731                 
                    LDA.w $52,y               
                    STA.w $0733                 
                    LDX.b #$01                  
                    LDA.b #$00                  
                    STA.w $0722,y               
                    STA.w $0724,y               
                    STA.b $25                   
                    STX.b $59                   
                    JSR.w CODE_29DCF4           
                    LDA.b #$0B                  
                    STA.w $1202                 
                    JMP.w CODE_29DB11           

CODE_29DE9E:        LDA.b $A6                   
                    SEC                         
                    SBC.b #$08                  
                    STA.w $0861                 
                    STA.w $0865                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0869                 
                    STA.w $086D                 
                    LDA.b $A7                   
                    SEC                         
                    SBC.w $0210                 
                    SEC                         
                    SBC.b #$08                  
                    STA.w $0860                 
                    STA.w $0868                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0864                 
                    STA.w $086C                 
                    LDA.b #$27                  
                    STA.w $0863                 
                    LDA.b #$67                  
                    STA.w $0867                 
                    LDA.b #$A7                  
                    STA.w $086B                 
                    LDA.b #$E7                  
                    STA.w $086F                 
                    LDA.w $0423                 
                    AND.b #$1C                  
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $EF41,y               
                    STA.w $0862                 
                    STA.w $0866                 
                    STA.w $086A                 
                    STA.w $086E                 
                    LDA.b #$02                  
                    STA.w $0A38                 
                    STA.w $0A39                 
                    STA.w $0A3A                 
                    STA.w $0A3B                 
                    DEC.w $0423                 
                    LDA.w $0423                 
                    BNE   CODE_29DF0E           
                    JMP.w CODE_29DB11           

CODE_29DF0E:        RTS                         

DATA_29DF0F:        db $00,$01,$02,$01,$02,$01,$03,$00
                    db $01,$00,$00,$00,$03,$00

CODE_29DF1D:        LDY.b #$C7                  
                    LDA.b $A8                   
                    BEQ   CODE_29DF2B           
                    LDA.b $15                   
                    AND.b #$18                  
                    BNE   CODE_29DF2B           
                    LDY.b #$F0                  
CODE_29DF2B:        STY.w $0801                 
                    LDA.w $041D                 
                    CLC                         
                    ADC.w $041F                 
                    TAY                         
                    LDA.w $0726                 
                    BEQ   CODE_29DF40           
                    TYA                         
                    CLC                         
                    ADC.b #$23                  
                    TAY                         
CODE_29DF40:        LDA.w $041E                 
                    STA.w $0800                 
                    REP   #$20                  
                    LDA.w $1D80,y               
                    AND.w #$00FF                
                    TAX                         
                    AND.w #$0007                
                    ASL   A                     
                    STA.b $00                   
                    TXA                         
                    AND.w #$0008                
                    ASL   A                     
                    ASL   A                     
                    ORA.b $00                   
                    CLC                         
                    ADC.w #$00C0                
                    STA.w $0802                 
                    SEP   #$20                  
                    LDA   DATA_29DF0F,x             
                    ASL   A                     
                    ORA.b #$21                  
                    STA.w $0803                 
                    LDA.b #$02                  
                    STA.w $0A20                 
                    RTS                         

CODE_29DF76:        LDY.b #$06                  
                    LDA.b $00                   
CODE_29DF7A:        CMP.w $EF47,y               
                    BEQ   CODE_29DF84           
                    DEY                         
                    BPL   CODE_29DF7A           
                    LDY.b #$07                  
CODE_29DF84:        STY.b $04                   
                    LDA.b $01                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $03                   
                    LDA.b $02                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $03                   
                    TAY                         
                    LDX.w $0726                 
                    BEQ   CODE_29DFA1           
                    TYA                         
                    CLC                         
                    ADC.b #$40                  
                    TAY                         
CODE_29DFA1:        LDX.b $04                   
                    LDA.w $1D00,y               
                    ORA.w $EF4E,x               
                    STA.w $1D00,y               
                    RTS                         

CODE_29DFAD:        JSL.l CODE_20804D           
                    LDA.w $15                 
                    AND.b #$01                  
                    BNE   CODE_29DFAD           
                    DEC.b $16                   
                    BNE   CODE_29DFAD           
                    LDA.b #$80                  
                    STA.w $2100                 
                    STZ.w $05FC                 
                    LDA.l $7E3955               
                    INC   A                     
                    STA.l $7E3955               
                    JSR.w CODE_29E01B           
                    LDA.w $0210                 
                    STA.l $7E398C               
                    LDA.b $12                   
                    STA.l $7E398B               
                    LDA.w $0216                 
                    STA.l $7E398E               
                    LDA.b $13                   
                    STA.l $7E398D               
                    LDA.b #$01                  
                    STA.w $0713                 
                    LDA.b #$20                  
                    STA.w $0612                 
                    LDX.b $25                   
                    BNE   CODE_29E002           
                    LDA.b $23                   
                    SEC                         
                    SBC.b #$10                  
                    STA.b $23                   
                    JMP.w CODE_29E009           

CODE_29E002:        LDA.b $24                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $24                   
CODE_29E009:        LDA.w $0414                 
                    CMP.b #$02                  
                    BEQ   CODE_29E017           
                    LDA.l $7E398C               
                    STA.w $0210                 
CODE_29E017:        JML.l CODE_208753           

CODE_29E01B:        LDA.w $0414                 
                    JSL.l CODE_20FB1F           

                    dw $0000
                    dw CODE_29E02E
                    dw CODE_29E065
                    dw CODE_29E117
                    dw CODE_29E1D9
                    dw CODE_29E228

CODE_29E02E:        LDA.w $1DFE
                    STA.b $2B
                    STA.w $1EBB                 
                    LDA.w $1DFF                 
                    STA.b $2C                   
                    STA.w $1EBC                 
                    LDA.w $1E00                 
                    STA.b $2D                   
                    STA.w $1EBD                 
                    LDA.w $1E01                 
                    STA.b $31                   
                    STA.w $023A                 
                    LDA.w $1E02                 
                    STA.b $32                   
                    STA.w $023B                 
                    LDA.w $1EBA                 
                    STA.w $070A                 
                    LDA.w $0415                 
                    EOR.b #$01                  
                    STA.w $0415                 
                    RTS                         

CODE_29E065:        LDA.w $1EB8                 
                    EOR.b #$01                  
                    STA.w $1EB8                 
                    BNE   CODE_29E072           
                    BRL   CODE_29E0F5           

CODE_29E072:        LDA.w $070A                 
                    STA.w $1EB9                 
                    LDY.w $0727                 
                    LDA.w $EF86,y               
                    STA.w $070A                 
                    TYA                         
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.w $EF56,y               
                    STA.b $2B                   
                    LDA.w $EF57,y               
                    STA.b $2C                   
                    LDA.w $EF58,y               
                    STA.b $2D                   
                    LDA.w $EF6E,y               
                    STA.b $31                   
                    LDA.w $EF6F,y               
                    STA.b $32                   
                    LDX.b $43                   
                    LDA.w $1F66,x               
                    PHA                         
                    AND.b #$0F                  
                    STA.b $43                   
                    STA.b $12                   
                    PLA                         
                    AND.b #$F0                  
                    ORA.b #$08                  
                    STA.b $5E                   
                    LDA.w $1F56,x               
                    PHA                         
                    PHA                         
                    AND.b #$0F                  
                    STA.w $0377                 
                    CMP.b #$03                  
                    BCC   CODE_29E0C9           
                    LDA.b $5E                   
                    AND.b #$F0                  
                    STA.b $5E                   
CODE_29E0C9:        PLA                         
                    AND.b #$80                  
                    STA.w $0378                 
                    STA.w $0425                 
                    PLA                         
                    AND.b #$70                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $EF8E,y               
                    PHA                         
                    AND.b #$0F                  
                    STA.b $55                   
                    PLA                         
                    AND.b #$F0                  
                    STA.b $70                   
                    LDA.w $EF96,y               
                    STA.w $0216                 
                    LDA.b #$00                  
                    STA.w $0210                 
                    JMP.w CODE_29E1CD           

CODE_29E0F5:        LDA.w $1EB9                 
                    STA.w $070A                 
                    LDA.w $1EBB                 
                    STA.b $2B                   
                    LDA.w $1EBC                 
                    STA.b $2C                   
                    LDA.w $1EBD                 
                    STA.b $2D                   
                    LDA.w $023A                 
                    STA.b $31                   
                    LDA.w $023B                 
                    STA.b $32                   
                    JMP.w CODE_29E11A           

CODE_29E117:        JSR.w CODE_29E02E           
CODE_29E11A:        LDX.b $43                   
                    LDA.w $0425                 
                    BEQ   CODE_29E12B           
                    LDY.b $55                   
                    LDA.b $70                   
                    JSL.l CODE_209FC1           
                    TYA                         
                    TAX                         
CODE_29E12B:        LDA.w $1F66,x               
                    PHA                         
                    AND.b #$0F                  
                    STA.b $43                   
                    PLA                         
                    AND.b #$F0                  
                    ORA.b #$08                  
                    STA.b $5E                   
                    LDA.w $1F56,x               
                    PHA                         
                    PHA                         
                    AND.b #$0F                  
                    STA.w $0377                 
                    CMP.b #$03                  
                    BCC   CODE_29E14E           
                    LDA.b $5E                   
                    AND.b #$F0                  
                    STA.b $5E                   
CODE_29E14E:        PLA                         
                    AND.b #$80                  
                    STA.w $0378                 
                    STA.w $0425                 
                    PLA                         
                    AND.b #$70                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $EF8E,y               
                    PHA                         
                    AND.b #$0F                  
                    STA.b $55                   
                    PLA                         
                    AND.b #$F0                  
                    STA.b $70                   
                    LDA.w $EF96,y               
                    STA.w $0216                 
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
                    STZ.w $0210                 
                    STZ.w $0211                 
                    STZ.b $12                   
                    STZ.b $13                   
                    STZ.w $0212                 
                    STZ.w $0213                 
                    LDA.w $0378                 
                    BNE   CODE_29E1CD           
                    LDA.b $43                   
                    STA.b $12                   
                    BNE   CODE_29E1A9           
                    LDA.b $5E                   
                    CMP.b #$80                  
                    BCC   CODE_29E1C4           
CODE_29E1A9:        LDA.b $5E                   
                    SEC                         
                    SBC.b #$80                  
                    STA.w $0210                 
                    STA.w $0212                 
                    LDA.b $12                   
                    SBC.b #$00                  
                    STA.b $12                   
                    STA.w $0211                 
                    LSR   A                     
                    STA.w $0213                 
                    ROR.w $0212                 
CODE_29E1C4:        LDA.b $55                   
                    BEQ   CODE_29E1CD           
                    LDA.b #$EF                  
                    STA.w $0216                 
CODE_29E1CD:        LDA.w $0210                 
                    STA.b $B7                   
                    LDA.b $12                   
                    JSL.l CODE_2097F5           
                    RTS                         

CODE_29E1D9:        LDY.w $0727                 
                    LDA.w $EFCE,y               
                    STA.w $070A                 
                    TYA                         
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAY                         
                    LDA.w $EF9E,y               
                    STA.b $2B                   
                    LDA.w $EF9F,y               
                    STA.b $2C                   
                    LDA.w $EFA0,y               
                    STA.b $2D                   
                    LDA.w $EFB6,y               
                    STA.b $31                   
                    LDA.w $EFB7,y               
                    STA.b $32                   
                    LDA.b #$00                  
                    STA.b $43                   
                    STA.w $0210                 
                    STA.b $13                   
                    STA.b $12                   
                    STA.w $0425                 
                    LDA.b #$EF                  
                    STA.w $0216                 
                    LDA.b #$28                  
                    STA.b $5E                   
                    LDA.b #$01                  
                    STA.b $55                   
                    STA.w $0377                 
                    LDA.b #$80                  
                    STA.b $70                   
                    JMP.w CODE_29E1CD           

CODE_29E228:        LDA.b #$00                  
                    STA.w $0210                 
                    STA.b $12                   
                    STA.b $13                   
                    STA.b $43                   
                    STA.w $0425                 
                    LDA.b #$20                  
                    STA.b $5E                   
                    LDA.b #$01                  
                    STA.b $55                   
                    LDA.b #$40                  
                    STA.b $70                   
                    LDA.b #$07                  
                    STA.w $070A                 
                    JMP.w CODE_29E1CD           

CODE_29E24A:        LDA.b #$04                  
                    STA.w $101D                 
                    STA.w $101C                 
                    INC.w $101B                 
                    RTS                         

CODE_29E256:        LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_29E26A           
                    INC.b $16                   
                    LDA.b $16                   
                    CMP.b #$0F                  
                    BNE   CODE_29E26A           
                    STZ.w $101D                 
                    STZ.w $101B                 
CODE_29E26A:        RTS                         

CODE_29E26B:        LDA.w $101E                 
                    BNE   CODE_29E273           
                    JSR.w CODE_29E24A           
CODE_29E273:        RTL                         

                    LDA.w $101E                 
                    BNE   CODE_29E294           
                    LDA.w $101C                 
                    BEQ   CODE_29E281           
                    DEC.w $101C                 
CODE_29E281:        LDA.w $101D                 
                    BEQ   CODE_29E294           
                    LDA.w $101C                 
                    BNE   CODE_29E293           
                    LDA.b #$04                  
                    STA.w $101C                 
                    DEC.w $101D                 
CODE_29E293:        RTS                         

CODE_29E294:        LDA.b #$00                  
                    STA.w $101B                 
                    STA.w $101E                 
                    RTS                         

CODE_29E29D:        JSR.w CODE_29E24A           
                    LDA.b #$80                  
                    STA.w $4200                 
                    LDA.b #$00                  
                    STA.b $16                   
CODE_29E2A9:        JSL.l CODE_20804D           
                    JSR.w CODE_29E256           
                    LDA.w $101D                 
                    BNE   CODE_29E2A9           
                    RTL                         

CODE_29E2B6:        JSL.l CODE_29E26B           
                    LDA.b #$A0                  
                    STA.w $4200                 
                    LDA.b #$0F                  
                    STA.b $16                   
                    LDA.b #$07                  
                    STA.w $020D                 
CODE_29E2C8:        JSL.l CODE_20804D           
                    LDA.b $15                   
                    AND.b #$01                  
                    BNE   CODE_29E2C8           
                    LDA.w $0350                 
                    CMP.b #$1B                  
                    BNE   CODE_29E2E7           
                    LDA.w $078E                 
                    BEQ   CODE_29E2E7           
                    LDA.w $020D                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $020D                 
CODE_29E2E7:        DEC.b $16                   
                    LDA.b $16                   
                    BNE   CODE_29E2C8           
                    JSL.l CODE_20804D           
                    RTL                         

                    PHB                         
                    LDA.b #$21                  
                    PHA                         
                    PLB                         
                    LDX.w $104F                 
                    LDA.w $1047,x               
                    STA.w $1051                 
                    LDA.w $104B,x               
                    STA.w $1053                 
                    LDY.w $1045                 
                    LDX.b #$80                  
                    LDA.w $104F                 
                    AND.b #$02                  
                    BEQ   CODE_29E317           
                    LDY.w $1046                 
                    LDX.b #$81                  
CODE_29E317:        STX.w $2115                 
                    STX.b $FF                   
                    LDA.w $1053                 
                    STA.w $2116                 
                    LDA.w $1051                 
                    STA.w $2117                 
CODE_29E328:        LDA.b #$FF                  
                    STA.w $2118                 
                    LDA.b #$00                  
                    STA.w $2119                 
                    LDA.w $104F                 
                    AND.b #$02                  
                    BNE   CODE_29E356           
                    INC.w $1053                 
                    LDA.w $1053                 
                    AND.b #$1F                  
                    BNE   CODE_29E37D           
                    LDA.w $1053                 
                    SEC                         
                    SBC.b #$20                  
                    STA.w $1053                 
                    LDA.w $1051                 
                    EOR.b #$04                  
                    STA.w $1051                 
                    BRA   CODE_29E378           

CODE_29E356:        LDA.w $1053                 
                    CLC                         
                    ADC.b #$20                  
                    STA.w $1053                 
                    AND.b #$E0                  
                    BNE   CODE_29E37D           
                    LDA.w $1051                 
                    ADC.b #$00                  
                    STA.w $1051                 
                    AND.b #$03                  
                    BNE   CODE_29E37D           
                    LDA.w $1051                 
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1051                 
CODE_29E378:        DEY                         
                    BPL   CODE_29E317           
                    BRA   CODE_29E380           

CODE_29E37D:        DEY                         
                    BPL   CODE_29E328           
CODE_29E380:        JSR.w CODE_29E3B7           
                    INC.w $104F                 
                    LDA.w $104F                 
                    AND.b #$03                  
                    STA.w $104F                 
                    LDY.w $1050                 
                    CPY.b #$06                  
                    BCS   CODE_29E3B5                   
                    LDA.b $FF                   
                    AND.b #$01                  
                    BNE   CODE_29E3B5           
                    LDX.b #$1F                  
                    LDA.b #$7B                  
                    STA.w $2117                 
                    LDA.w $EFD6,y               
                    STA.w $2116                 
CODE_29E3A8:        LDA.b #$FF                  
                    STA.w $2118                 
                    LDA.b #$00                  
                    STA.w $2119                 
                    DEX                         
                    BPL   CODE_29E3A8           
CODE_29E3B5:        PLB                         
                    RTL                         

CODE_29E3B7:        LDA.w $104F                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29E3C6
                    dw CODE_29E429
                    dw CODE_29E405
                    dw CODE_29E444

CODE_29E3C6:        LDX.w $104F
                    LDA.w $104B,x
                    AND.b #$1F
                    CMP.b #$1F
                    BEQ   CODE_29E3F3
                    LDA.w $104B,x
                    CLC
                    ADC.b #$21                  
                    STA.w $104B,x               
                    BCC   CODE_29E3F2           
                    LDA.w $1047,x               
                    ADC.b #$00                  
                    STA.w $1047,x               
                    AND.b #$03                  
                    BNE   CODE_29E3F2           
                    LDA.w $1047,x               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1047,x               
CODE_29E3F2:        RTS                         

CODE_29E3F3:        LDA.w $104B,x               
                    CLC                         
                    ADC.b #$01                  
                    STA.w $104B,x               
                    LDA.w $1047,x               
                    ADC.b #$00                  
                    STA.w $1047,x               
                    RTS                         

CODE_29E405:        LDX.w $104F                 
                    LDA.w $104B,x               
                    CLC                         
                    ADC.b #$1F                  
                    STA.w $104B,x               
                    BCC   CODE_29E428           
                    LDA.w $1047,x               
                    ADC.b #$00                  
                    STA.w $1047,x               
                    AND.b #$03                  
                    BNE   CODE_29E428           
                    LDA.w $1047,x               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1047,x               
CODE_29E428:        RTS                         

CODE_29E429:        LDX.w $104F                 
                    LDA.w $104B,x               
                    SEC                         
                    SBC.b #$1F                  
                    STA.w $104B,x               
                    LDA.w $1047,x               
                    SBC.b #$00                  
                    STA.w $1047,x               
                    DEC.w $1045                 
                    DEC.w $1045                 
                    RTS                         

CODE_29E444:        LDX.w $104F                 
                    LDA.w $104B,x               
                    CLC                         
                    ADC.b #$21                  
                    STA.w $104B,x               
                    BCC   CODE_29E467           
                    LDA.w $1047,x               
                    ADC.b #$00                  
                    STA.w $1047,x               
                    AND.b #$03                  
                    BNE   CODE_29E467           
                    LDA.w $1047,x               
                    CLC                         
                    ADC.b #$04                  
                    STA.w $1047,x               
CODE_29E467:        DEC.w $1046                 
                    DEC.w $1046                 
                    RTS                         

                    PHB                         
                    LDA.b #$21                  
                    PHA                         
                    PLB                         
                    LDY.w $1045                 
                    LDX.b #$80                  
                    LDA.w $104F                 
                    AND.b #$02                  
                    BEQ   CODE_29E484           
                    LDY.w $1046                 
                    LDX.b #$81                  
CODE_29E484:        TYA                         
                    ASL   A                     
                    TAY                         
                    STX.b $FF                   
                    STX.w $2115                 
                    LDX.w $104F                 
                    LDA.w $1047,x               
                    STA.w $2117                 
                    LDA.w $104B,x               
                    STA.w $2116                 
CODE_29E49B:        LDA.w $0382,y               
                    STA.w $2118                 
                    LDA.w $0383,y               
                    STA.w $2119                 
                    CPY.w $105F                 
                    BEQ   CODE_29E4B3           
                    DEY                         
                    DEY                         
                    BPL   CODE_29E49B           
                    JMP.w CODE_29E4D7           

CODE_29E4B3:        LDA.b #$FE                  
                    STA.w $105F                 
                    LDA.b #$08                  
                    STA.w $2117                 
                    LDA.w $104B,x               
                    AND.b #$1F                  
                    STA.w $2116                 
                    DEY                         
                    DEY                         
CODE_29E4C7:        LDA.w $0382,y               
                    STA.w $2118                 
                    LDA.w $0383,y               
                    STA.w $2119                 
                    DEY                         
                    DEY                         
                    BPL   CODE_29E4C7           
CODE_29E4D7:        JSR.w CODE_29E4EA           
                    INC.w $104F                 
                    LDA.w $104F                 
                    AND.b #$03                  
                    STA.w $104F                 
                    INC.w $1050                 
                    PLB                         
                    RTL                         

CODE_29E4EA:        LDA.w $104F                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29E4F9
                    dw CODE_29E568
                    dw CODE_29E52F
                    dw CODE_29E5B9

CODE_29E4F9:        LDY.w $1060
                    LDX.w $104F
                    LDA.w $EFDC,y
                    CMP.w $1047,x
                    BNE   CODE_29E511           
                    LDA.w $104B,x               
                    CMP.w $EFE1,y               
                    BCS   CODE_29E511                   
                    BCC   CODE_29E522           
CODE_29E511:        LDA.w $104B,x               
                    SEC                         
                    SBC.b #$21                  
                    STA.w $104B,x               
                    LDA.w $1047,x               
                    SBC.b #$00                  
                    STA.w $1047,x               
CODE_29E522:        LDA.w $1047,x               
                    CMP.b #$07                  
                    BNE   CODE_29E52E           
                    LDA.b #$03                  
                    STA.w $1047,x               
CODE_29E52E:        RTS                         

CODE_29E52F:        LDX.w $1060                 
                    LDA.w $EFDC,x               
                    LDX.w $104F                 
                    CMP.w $1047,x               
                    BNE   CODE_29E54A           
                    LDA.w $104B,x               
                    CMP.b #$1E                  
                    BNE   CODE_29E54A           
                    INC.w $104B,x               
                    JMP.w CODE_29E55B           

CODE_29E54A:        LDA.w $104B,x               
                    SEC                         
                    SBC.b #$1F                  
                    STA.w $104B,x               
                    LDA.w $1047,x               
                    SBC.b #$00                  
                    STA.w $1047,x               
CODE_29E55B:        LDA.w $1047,x               
                    CMP.b #$07                  
                    BNE   CODE_29E567           
                    LDA.b #$03                  
                    STA.w $1047,x               
CODE_29E567:        RTS                         

CODE_29E568:        LDX.w $1060                 
                    LDA.w $EFE6,x               
                    LDX.w $104F                 
                    CMP.w $1047,x               
                    BNE   CODE_29E586           
                    LDA.w $1060                 
                    CMP.b #$04                  
                    BCC   CODE_29E59D           
                    LDA.w $104B,x               
                    CMP.b #$E0                  
                    BCC   CODE_29E586           
                    BCS   CODE_29E59D                   
CODE_29E586:        LDA.w $104B,x               
                    CLC                         
                    ADC.b #$1F                  
                    STA.w $104B,x               
                    LDA.w $1047,x               
                    ADC.b #$00                  
                    STA.w $1047,x               
                    INC.w $1045                 
                    INC.w $1045                 
CODE_29E59D:        LDA.w $1047,x               
                    CMP.b #$04                  
                    BNE   CODE_29E5B8           
                    LDA.w $104B,x               
                    CMP.b #$00                  
                    BCC   CODE_29E5B8           
                    LDA.b #$08                  
                    STA.w $1047,x               
                    LDA.w $104B,x               
                    AND.b #$1F                  
                    STA.w $104B,x               
CODE_29E5B8:        RTS                         

CODE_29E5B9:        LDX.w $1060                 
                    LDA.w $EFDC,x               
                    LDX.w $104F                 
                    CMP.w $1047,x               
                    BNE   CODE_29E5DA           
                    LDA.w $104B,x               
                    CMP.b #$02                  
                    BNE   CODE_29E5DA           
                    DEC.w $104B,x               
                    LDA.w $1060                 
                    CMP.b #$04                  
                    BCC   CODE_29E5EE           
                    BEQ   CODE_29E5F1           
CODE_29E5DA:        LDA.w $104B,x               
                    SEC                         
                    SBC.b #$21                  
                    STA.w $104B,x               
                    LDA.w $1047,x               
                    SBC.b #$00                  
                    STA.w $1047,x               
                    INC.w $1046                 
CODE_29E5EE:        INC.w $1046                 
CODE_29E5F1:        LDA.w $1047,x               
                    CMP.b #$07                  
                    BNE   CODE_29E5FD           
                    LDA.b #$03                  
                    STA.w $1047,x               
CODE_29E5FD:        RTS                         

CODE_29E5FE:        LDA.w $070A                 
                    BEQ   CODE_29E655           
                    CMP.b #$07                  
                    BEQ   CODE_29E655           
                    CMP.b #$0F                  
                    BCS   CODE_29E655                   
                    LDA.w $05F3                 
                    AND.b #$7F                  
                    ORA.w $058C                 
                    BNE   CODE_29E655           
                    DEC.w $05F1                 
                    BPL   CODE_29E655           
                    LDA.b #$28                  
                    STA.w $05F1                 
                    DEC.w $05F0                 
                    BPL   CODE_29E641           
                    LDA.b #$09                  
                    STA.w $05F0                 
                    DEC.w $05EF                 
                    BPL   CODE_29E641           
                    STA.w $05EF                 
                    DEC.w $05EE                 
                    BPL   CODE_29E641           
                    LDA.b #$00                  
                    STA.w $05EE                 
                    STA.w $05EF                 
                    STA.w $05F0                 
CODE_29E641:        LDA.w $05EE                 
                    CMP.b #$01                  
                    BNE   CODE_29E655           
                    LDA.w $05EF                 
                    ORA.w $05F0                 
                    BNE   CODE_29E655           
                    LDA.b #$FF                  
                    STA.w $1200                 
CODE_29E655:        LDX.b #$02                  
CODE_29E657:        LDA.w $05EE,x               
                    ORA.b #$90                  
                    STA.w $1F52,x               
                    DEX                         
                    BPL   CODE_29E657           
                    RTS                         

                    LDX.w $1600                 
                    LDA.b #$0F                  
                    STA.w $1602,x               
                    LDA.b #$51                  
                    STA.w $1603,x               
                    LDA.b #$00                  
                    STA.w $1604,x               
                    LDA.b #$03                  
                    STA.w $1605,x               
                    LDA.w $05EE                 
                    ORA.b #$90                  
                    STA.w $1606,x               
                    LDA.w $05EF                 
                    ORA.b #$90                  
                    STA.w $1608,x               
                    LDA.w $05F0                 
                    ORA.b #$90                  
                    STA.w $160A,x               
                    LDA.b #$FF                  
                    STA.w $160C,x               
                    LDA.b #$22                  
                    STA.w $1607,x               
                    STA.w $1609,x               
                    STA.w $160B,x               
                    TXA                         
                    CLC                         
                    ADC.b #$0A                  
                    STA.w $1600                 
                    RTS                         

CODE_29E6AA:        LDX.w $0726                 
                    LDY.b #$00                  
                    LDA.w $0736,x               
                    CMP.b #$FF                  
                    BNE   CODE_29E6BA           
                    LDA.b #$90                  
                    BRA   CODE_29E6D0           

CODE_29E6BA:        CMP.b #$63                  
                    BMI   CODE_29E6C3           
                    LDA.b #$62                  
                    STA.w $0736,x               
CODE_29E6C3:        INC   A                     
CODE_29E6C4:        CMP.b #$0A                  
                    BMI   CODE_29E6CE           
                    SEC                         
                    SBC.b #$0A                  
                    INY                         
                    BRA   CODE_29E6C4           

CODE_29E6CE:        ORA.b #$90                  
CODE_29E6D0:        STA.w $1F4B                 
                    TYA                         
                    BNE   CODE_29E6DA           
                    LDA.b #$AD                  
                    BRA   CODE_29E6DC           

CODE_29E6DA:        ORA.b #$90                  
CODE_29E6DC:        STA.w $1F4A                 
                    RTS                         

CODE_29E6E0:        LDA.b #$22                  
                    LDX.w $0726                 
                    BEQ   CODE_29E6EA           
                    CLC                         
                    ADC.b #$23                  
CODE_29E6EA:        LDY.b #$00                  
                    TAX                         
                    LDA.w $1D80,x               
                    CLC                         
                    ADC.w $0422                 
                    STA.w $1D80,x               
                    CMP.b #$64                  
                    BCC   CODE_29E70C           
                    SEC                         
                    SBC.b #$64                  
                    STA.w $1D80,x               
                    LDX.w $0726                 
                    INC.w $0736,x               
                    LDA.b #$05                  
                    STA.w $1203                 
CODE_29E70C:        CMP.b #$0A                  
                    BMI   CODE_29E716           
                    SEC                         
                    SBC.b #$0A                  
                    INY                         
                    BRA   CODE_29E70C           

CODE_29E716:        LDX.w $1600                 
                    ORA.b #$90                  
                    STA.w $1F49                 
                    TYA                         
                    BNE   CODE_29E725           
                    LDA.b #$AD                  
                    BRA   CODE_29E727           

CODE_29E725:        ORA.b #$90                  
CODE_29E727:        STA.w $1F48                 
                    LDA.b #$00                  
                    STA.w $0422                 
                    RTS                         

CODE_29E730:        LDY.w $1600                 
                    LDX.w $0727                 
                    INX                         
                    TXA                         
                    ORA.b #$90                  
                    STA.w $1606,y               
                    LDA.b #$22                  
                    STA.w $1607,y               
                    LDA.b #$FF                  
                    STA.w $1608,y               
                    LDX.b #$0F                  
                    TXA                         
                    STA.w $1602,y               
                    LDA.b #$26                  
                    STA.w $1603,y               
                    LDA.b #$00                  
                    STA.w $1604,y               
                    LDA.b #$01                  
                    STA.w $1605,y               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$06                  
                    STA.w $1600                 
                    RTL                         

CODE_29E766:        LDA.w $0726                 
                    ASL   A                     
                    TAX                         
                    LDA.b #$01                  
                    STA.b $0E                   
                    LDY.w $1600                 
CODE_29E772:        LDA.w $EFEB,x               
                    STA.w $1606,y               
                    LDA.b #$22                  
                    STA.w $1607,y               
                    INX                         
                    INY                         
                    INY                         
                    DEC.b $0E                   
                    BPL   CODE_29E772           
                    LDA.b #$FF                  
                    STA.w $1606,y               
                    LDY.w $1600                 
                    LDA.b #$0F                  
                    STA.w $1602,y               
                    LDA.b #$42                  
                    STA.w $1603,y               
                    LDA.b #$00                  
                    STA.w $1604,y               
                    LDA.b #$03                  
                    STA.w $1605,y               
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $1600                 
                    RTL                         

CODE_29E7AA:        LDA.w $0717                 
                    CLC                         
                    ADC.w $069C                 
                    STA.w $0717                 
                    STA.b $00                   
                    LDA.w $0716                 
                    ADC.w $069D                 
                    STA.w $0716                 
                    STA.b $01                   
                    LDA.w $0715                 
                    ADC.b #$00                  
                    STA.w $0715                 
                    STA.b $02                   
                    LDY.b #$00                  
                    LDX.b #$05                  
CODE_29E7CF:        LDA.b $00                   
                    SEC                         
                    SBC.l $21F00C,x             
                    STA.b $00                   
                    LDA.b $01                   
                    SBC.l $21F006,x             
                    STA.b $01                   
                    LDA.b $02                   
                    SBC.l $21F000,x             
                    STA.b $02                   
                    BCC   CODE_29E7EF           
                    INC.w $069E                 
                    BRA   CODE_29E7CF           

CODE_29E7EF:        LDA.b $00                   
                    CLC                         
                    ADC.l $21F00C,x             
                    STA.b $00                   
                    LDA.b $01                   
                    ADC.l $21F006,x             
                    STA.b $01                   
                    LDA.b $02                   
                    ADC.l $21F000,x             
                    STA.b $02                   
                    LDA.w $069E                 
                    ORA.b #$90                  
                    STA.w $1F4C,y               
                    LDA.b #$00                  
                    STA.w $069E                 
                    INY                         
                    DEX                         
                    BPL   CODE_29E7CF           
                    LDA.w $1F4C                 
                    CMP.b #$9A                  
                    BCC   CODE_29E835           
                    LDX.b #$02                  
CODE_29E822:        LDA.w $F012,x               
                    STA.w $0715,x               
                    DEX                         
                    BPL   CODE_29E822           
                    LDX.b #$05                  
                    LDA.b #$99                  
CODE_29E82F:        STA.w $1F4C,x               
                    DEX                         
                    BPL   CODE_29E82F           
CODE_29E835:        STZ.w $069C                 
                    STZ.w $069D                 
                    RTL                         

                    LDX.w $1600                 
                    LDY.b #$00                  
CODE_29E841:        LDA.w $EFEF,y               
                    STA.w $1602,x               
                    INX                         
                    INY                         
                    CPY.b #$11                  
                    BNE   CODE_29E841           
                    LDX.w $1600                 
                    LDY.b #$00                  
CODE_29E852:        LDA.w $1F4C,y               
                    STA.w $1606,x               
                    INX                         
                    INX                         
                    INY                         
                    CPY.b #$06                  
                    BNE   CODE_29E852           
                    LDY.w $1600                 
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.w $1600                 
                    RTS                         

CODE_29E86A:        LDY.b #$00                  
                    LDA.b #$01                  
                    STA.b $0E                   
CODE_29E870:        LDX.b #$9F                  
                    LDA.w $0413                 
                    AND.b $0E                   
                    BEQ   CODE_29E87A           
                    DEX                         
CODE_29E87A:        TXA                         
                    STA.w $1F40,y               
                    INY                         
                    ASL.b $0E                   
                    LDA.b $0E                   
                    CMP.b #$40                  
                    BNE   CODE_29E870           
                    LDA.b #$8C                  
                    STA.w $1F40,y               
                    LDX.b #$8D                  
                    LDA.w $0413                 
                    AND.b $0E                   
                    BEQ   CODE_29E8A6           
                    DEC.w $0714                 
                    LDA.w $0714                 
                    AND.b #$08                  
                    BNE   CODE_29E8A6           
                    LDA.b #$8E                  
                    STA.w $1F40,y               
                    INC   A                     
                    TAX                         
CODE_29E8A6:        TXA                         
                    STA.w $1F41,y               
                    RTS                         

CODE_29E8AB:        LDA.b $38                   
                    STA.w $4314                 
                    REP   #$10                  
                    LDY.w #$0000                
                    LDA.b [$36],y               
                    BPL   CODE_29E8BC           
                    SEP   #$30                  
                    RTL                         

CODE_29E8BC:        STZ.b $06                   
CODE_29E8BE:        STA.b $04                   
                    INY                         
                    LDA.b [$36],y               
                    STA.b $03                   
                    INY                         
                    LDA.b [$36],y               
                    AND.b #$80                  
                    ASL   A                     
                    ROL   A                     
                    STA.b $07                   
                    LDA.b [$36],y               
                    AND.b #$40                  
                    STA.b $05                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b #$01                  
                    STA.w $4310                 
                    LDA.b #$18                  
                    STA.w $4311                 
                    REP   #$20                  
                    LDA.b $03                   
                    STA.w $2116                 
                    LDA.b [$36],y               
                    XBA                         
                    AND.w #$3FFF                
                    TAX                         
                    INX                         
                    STX.w $4315                 
                    INY                         
                    INY                         
                    TYA                         
                    CLC                         
                    ADC.b $36                   
                    STA.w $4312                 
                    LDA.b $05                   
                    BEQ   CODE_29E934           
                    INX                         
                    TXA                         
                    LSR   A                     
                    TAX                         
                    STX.w $4315                 
                    SEP   #$20                  
                    LDA.b $05                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $4310                 
                    LDA.b $07                   
                    STA.w $2115                 
                    LDA.b #$02                  
                    STA.w $420B                 
                    LDA.b #$19                  
                    STA.w $4311                 
                    REP   #$21                  
                    TYA                         
                    ADC.b $36                   
                    INC   A                     
                    STA.w $4312                 
                    LDA.b $03                   
                    STA.w $2116                 
                    STX.w $4315                 
                    LDX.w #$0002                  
CODE_29E934:        STX.b $03
                    TYA
                    CLC                         
                    ADC.b $03                   
                    TAY                         
                    SEP   #$20                  
                    LDA.b $07                   
                    ORA.b #$80                  
                    STA.w $2115                 
                    LDA.b #$02                  
                    STA.w $420B                 
                    LDA.b [$36],y               
                    BMI   CODE_29E950           
                    JMP.w CODE_29E8BE           

CODE_29E950:        SEP   #$30                  
                    RTL                         

CODE_29E953:        LDA.w $0380                 
                    BMI   CODE_29E9A2           
                    REP   #$20                  
                    LDA.w $0380                 
                    XBA                         
                    STA.w $2116                 
                    LDX.b #$81                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$0382                
                    STA.w $4302                 
                    LDX.b #$00                  
                    STX.w $4304                 
                    LDA.w #$0040                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.w $0380                 
                    XBA                         
                    ORA.w #$0800                
                    STA.w $2116                 
                    LDA.w #$03C2                
                    STA.w $4302                 
                    LDA.w #$002C                
                    STA.w $4305                 
                    STX.w $420B                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $0380                 
CODE_29E9A2:        RTL                         

CODE_29E9A3:        LDA.l $7F2000               
                    BMI   CODE_29E9F7           
                    LDX.b #$81                  
                    STX.w $2115                 
                    REP   #$20                  
                    LDA.l $7F2000               
                    XBA                         
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$2002                
                    STA.w $4302                 
                    LDX.b #$7F                  
                    STX.w $4304                 
                    LDA.w #$0040                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.l $7F2000               
                    XBA                         
                    CLC                         
                    ADC.w #$0800                
                    STA.w $2116                 
                    LDA.w #$2042                
                    STA.w $4302                 
                    LDA.w #$002C                
                    STA.w $4305                 
                    STX.w $420B                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.l $7F2000               
CODE_29E9F7:        RTL                         

CODE_29E9F8:        LDA.l $7F2000               
                    BMI   CODE_29EA31           
                    REP   #$20                  
                    LDA.l $7F2000               
                    XBA                         
                    STA.w $2116                 
                    LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$2002                
                    STA.w $4302                 
                    LDX.b #$7F                  
                    STX.w $4304                 
                    LDA.w #$0040                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.l $7F2000               
CODE_29EA31:        RTL                         

CODE_29EA32:        LDA.w $0380                 
                    BMI   CODE_29EA68           
                    LDX.b #$80                  
                    STX.w $2115                 
                    REP   #$20                  
                    LDA.w $0380                 
                    XBA                         
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.w $4300                 
                    LDA.w #$0382                
                    STA.w $4302                 
                    LDX.b #$00                  
                    STX.w $4304                 
                    LDA.w #$0040                
                    STA.w $4305                 
                    LDX.b #$01                  
                    STX.w $420B                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $0380                 
CODE_29EA68:        RTL                         

CODE_29EA69:        LDY.w $036C                 
                    BMI   CODE_29EA68           
                    LDX.b #$80                  
                    STX.w $2115                 
                    STY.w $2117                 
                    LDA.w $036D                 
                    STA.w $2116                 
                    CLC                         
                    ADC.b #$20                  
                    TAX                         
                    REP   #$20                  
                    LDA.w $036E                 
                    STA.w $2118                 
                    LDA.w $0370                 
                    STA.w $2118                 
                    STX.w $2116                 
                    LDA.w $0372                 
                    STA.w $2118                 
                    LDA.w $0374                 
                    STA.w $2118                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $036C                 
                    RTL                         

CODE_29EAA5:        JSR.w CODE_29E86A           
                    JSR.w CODE_29E6E0           
                    JSR.w CODE_29E6AA           
                    JSL.l CODE_29E7AA           
                    JSR.w CODE_29E5FE           
                    LDX.b #$00                  
                    LDY.w $1600                 
                    BEQ   CODE_29EAC3           
                    TXA                         
                    STA.l $7E3954               
                    BRA   CODE_29EAD7           

CODE_29EAC3:        LDA.l $7E3954               
                    INC   A                     
                    STA.l $7E3954               
                    AND.b #$01                  
                    BNE   CODE_29EAD7           
                    LDA.b #$00                  
                    STA.l $7E3954               
                    RTL                         

CODE_29EAD7:        LDA.l $21F02A,x             
                    STA.w $1602,y               
                    INY                         
                    INX                         
                    CPX.b #$3F                  
                    BNE   CODE_29EAD7           
                    LDY.w $1600                 
                    LDX.b #$00                  
CODE_29EAE9:        LDA.w $1F40,x               
                    STA.w $1606,y               
                    INY                         
                    INY                         
                    INX                         
                    CPX.b #$08                  
                    BNE   CODE_29EAE9           
                    LDY.w $1600                 
                    LDA.w $1F48                 
                    STA.w $161A,y               
                    LDA.w $1F49                 
                    STA.w $161C,y               
                    LDY.w $1600                 
                    LDA.w $1F4A                 
                    STA.w $1622,y               
                    LDA.w $1F4B                 
                    STA.w $1624,y               
                    LDY.w $1600                 
                    LDX.b #$00                  
CODE_29EB19:        LDA.w $1F4C,x               
                    STA.w $1628,y               
                    INY                         
                    INY                         
                    INX                         
                    CPX.b #$06                  
                    BNE   CODE_29EB19           
                    LDY.w $1600                 
                    LDX.b #$00                  
CODE_29EB2B:        LDA.w $1F52,x               
                    STA.w $163A,y               
                    INY                         
                    INY                         
                    INX                         
                    CPX.b #$03                  
                    BNE   CODE_29EB2B           
                    LDA.w $1600                 
                    CLC                         
                    ADC.b #$3E                  
                    STA.w $1600                 
                    RTL                         

CODE_29EB42:        LDY.b #$00                  
                    LDA.b [$31],y               
                    STA.w $1B40,y               
CODE_29EB49:        INY                         
                    LDA.b [$31],y               
                    STA.w $1B40,y               
                    CMP.b #$FF                  
                    BEQ   CODE_29EB62           
                    INY                         
                    LDA.b [$31],y               
                    STA.w $1B40,y               
                    INY                         
                    LDA.b [$31],y               
                    STA.w $1B40,y               
                    JMP.w CODE_29EB49           

CODE_29EB62:        RTL                         

CODE_29EB63:        REP   #$20                  
                    LDA.w #$7C00                
                    STA.w $023E                 
                    LDA.w #$B000                
                    STA.w $0240                 
                    LDX.b #$38                  
                    STX.w $0242                 
                    LDA.w #$0800                
                    STA.w $02CA                 
                    SEP   #$20                  
                    RTS                         

CODE_29EB7F:        REP   #$20                  
                    LDA.w #$7C00                
                    STA.w $023E                 
                    LDA.w #$B800                
                    STA.w $0240                 
                    LDX.b #$3F                  
                    STX.w $0242                 
                    LDA.w #$0800                
                    STA.w $02CA                 
                    SEP   #$20                  
                    RTS                         

CODE_29EB9B:        REP   #$20                  
                    LDA.w #$7C00                
                    STA.w $023E                 
                    LDA.w #$F800                
                    STA.w $0240                 
                    LDX.b #$38                  
                    STX.w $0242                 
                    LDA.w #$0800                
                    STA.w $02CA                 
                    SEP   #$20                  
                    RTS                         

CODE_29EBB7:        PHX                         
                    PHY                         
                    LDA.w $028C                 
                    BNE   CODE_29EBEA           
                    JSR.w CODE_29EB63           
                    JSR.w CODE_29F153           
                    JSR.w CODE_29F0E1           
                    JSR.w CODE_29EC16           
                    LDA.b #$01                  
                    STA.w $396D                 
                    STA.w $028C                 
                    STZ.w $028E                 
                    STZ.w $028F                 
                    STZ.w $0290                 
                    STZ.w $02DD                 
                    LDA.b #$F1                  
                    STA.w $1202                 
                    LDA.b #$43                  
                    STA.w $1200                 
                    BRA   CODE_29EBF4           

CODE_29EBEA:        LDA.b #$11                  
                    STA.w $028B                 
                    LDA.b #$03                  
                    STA.w $028C                 
CODE_29EBF4:        PLY                         
                    PLX                         
                    RTL                         

CODE_29EBF7:        PHB                         
                    PHK                         
                    PLB                         
                    PHX                         
                    PHY                         
                    LDA.w $028C                 
                    ASL   A                     
                    TAX                         
                    LDA.w PNTR_29EC0E,x               
                    STA.b $00                   
                    LDA.w PNTR_29EC0E+1,x               
                    STA.b $01                   
                    JMP.w ($0000)               

PNTR_29EC0E:        dw $0000
                    dw CODE_29EFB3
                    dw CODE_29EC39
                    dw CODE_29F01F
   
CODE_29EC16:        REP   #$20           
                    LDA.w #$0010
                    STA.w $028B        
                    LDA.w #$0064
                    STA.w $0281                 
                    LDA.w #$00A4         
                    STA.w $0283
                    LDA.w #$00C0                 
                    STA.w $0285
                    LDA.w #$00D0                
                    STA.w $0289
                    SEP   #$20                  
                    RTS                         

CODE_29EC39:        REP   #$10                  
                    LDY.w #$0010                
                    LDX.w #$0000                
                    LDA.b #$48                  
                    STA.b $01                   
CODE_29EC45:        LDA.b #$58                  
                    STA.b $00                   
CODE_29EC49:        LDA.w $02E5                 
                    BEQ   CODE_29EC53           
                    LDA.w DATA_29EF64,x               
                    BRA   CODE_29EC56           

CODE_29EC53:        LDA.w DATA_29EF15,x               
CODE_29EC56:        BPL   CODE_29EC70           
                    INX                         
                    INC   A                     
                    BEQ   CODE_29ECA5           
CODE_29EC5C:        LDA.b $00                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $00                   
                    CMP.b #$C0                  
                    BCC   CODE_29EC49           
                    LDA.b $01                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $01                   
                    BRA   CODE_29EC45           

CODE_29EC70:        CLC                         
                    ADC.b #$C0                  
                    STA.w $0802,y               
                    LDA.b $00                   
                    STA.w $0800,y               
                    LDA.b $01                   
                    STA.w $0801,y               
                    LDA.w $0598                 
                    BEQ   CODE_29EC89           
                    LDA.b #$2B                  
                    BRA   CODE_29EC8B           

CODE_29EC89:        LDA.b #$21                  
CODE_29EC8B:        STA.w $0803,y               
                    REP   #$20                  
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w #$0000                
                    STA.w $0A20,y               
                    PLY                         
                    SEP   #$20                  
                    INX                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    BRA   CODE_29EC5C           

CODE_29ECA5:        LDA.b #$40                  
                    STA.b $01                   
CODE_29ECA9:        LDA.b #$40                  
                    STA.b $00                   
CODE_29ECAD:        LDA.b $00                   
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    LDA.b $01                   
                    STA.w $0801,y               
                    LDA.b #$CD                  
                    STA.w $0802,y               
                    LDA.w $0598                 
                    BEQ   CODE_29ECCA           
                    LDA.b #$2B                  
                    BRA   CODE_29ECCC           

CODE_29ECCA:        LDA.b #$21                  
CODE_29ECCC:        STA.w $0803,y               
                    REP   #$20                  
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w #$0002                
                    STA.w $0A20,y               
                    PLY                         
                    SEP   #$20                  
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    LDA.b $00                   
                    CMP.b #$D0                  
                    BCC   CODE_29ECAD           
                    LDA.b $01                   
                    CMP.b #$80                  
                    BCS   CODE_29ECF6                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $01                   
                    BRA   CODE_29ECA9           

CODE_29ECF6:        SEP   #$10                  
                    LDY.b #$00                  
                    LDA.w $02E5                 
                    BNE   CODE_29ED02           
                    JMP.w CODE_29EE07           

CODE_29ED02:        LDX.w $0726                 
                    LDA.b $F6,x                 
                    AND.b #$2C                  
                    STA.b $0F                   
                    LDA.w $028C                 
                    CMP.b #$01                  
                    BEQ   CODE_29ED4A           
                    LDA.b $0F                   
                    AND.b #$20                  
                    BEQ   CODE_29ED22           
                    LDA.b #$01                  
                    EOR.w $028E                 
                    STA.w $028E                 
                    BRA   CODE_29ED42           

CODE_29ED22:        LDA.b $0F                   
                    AND.b #$08                  
                    BEQ   CODE_29ED32           
                    LDA.w $028E                 
                    BEQ   CODE_29ED4A           
                    STZ.w $028E                 
                    BRA   CODE_29ED42           

CODE_29ED32:        LDA.b $0F                   
                    AND.b #$04                  
                    BEQ   CODE_29ED4A           
                    LDA.w $028E                 
                    BNE   CODE_29ED4A           
                    LDA.b #$01                  
                    STA.w $028E                 
CODE_29ED42:        LDA.b #$01                  
                    STA.w $1203                 
                    STZ.w $028F                 
CODE_29ED4A:        INC.w $028F                 
                    LDA.b #$5C                  
                    STA.w $0800,y               
                    LDX.w $028E                 
                    LDA.w DATA_29EF11,x               
                    STA.w $0801,y               
                    LDA.w $028F                 
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w DATA_29EF13,x               
                    STA.w $0802,y               
                    LDA.b #$23                  
                    STA.w $0803,y               
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    LDA.w $028C                 
                    CMP.b #$01                  
                    BEQ   CODE_29EDB5           
                    LDX.w $0726                 
                    LDA.b $F6,x                 
                    AND.b #$10                  
                    BEQ   CODE_29EDB5           
                    LDA.b #$22                  
                    STA.w $02DD                 
                    LDA.w $028E                 
                    BNE   CODE_29ED96           
                    LDA.b #$43                  
                    STA.w $1200                 
                    BRA   CODE_29ED9B           

CODE_29ED96:        LDA.b #$3B                  
                    STA.w $1200                 
CODE_29ED9B:        JSL.l CODE_20804D           
                    DEC.w $02DD                 
                    BNE   CODE_29ED9B           
                    LDA.w $028E                 
                    BEQ   CODE_29EDAC           
                    JSR.w CODE_29EDB9           
CODE_29EDAC:        LDA.b #$F3                  
                    STA.w $1202                 
                    JML.l CODE_0080DE           

CODE_29EDB5:        PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

CODE_29EDB9:        LDX.b #$00                  
                    LDA.w $0726                 
                    BEQ   CODE_29EDC2           
                    LDX.b #$23                  
CODE_29EDC2:        LDA.w $0715                 
                    STA.w $1D9F,x               
                    LDA.w $0716                 
                    STA.w $1DA0,x               
                    LDA.w $0717                 
                    STA.w $1DA1,x               
                    REP   #$20                  
                    LDX.b #$08                  
CODE_29EDD8:        LDA.l $21E43C,x             
                    STA.w $1EED,x               
                    LDA.l $21E484,x             
                    STA.w $1F09,x               
                    LDA.l $21E4CC,x             
                    STA.w $1EFB,x               
                    LDA.l $21E514,x             
                    STA.w $1F17,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_29EDD8           
                    SEP   #$20                  
                    LDX.b #$7F                  
CODE_29EDFC:        STZ.w $1D00,x               
                    DEX                         
                    BPL   CODE_29EDFC           
                    JSL.l CODE_00922D           
                    RTS                         

CODE_29EE07:        LDX.w $0726                 
                    LDA.w $F6,x               
                    AND.b #$2C                  
                    STA.b $0F                   
                    LDA.w $028C                 
                    CMP.b #$01                  
                    BEQ   CODE_29EE6F           
                    CMP.b #$03                  
                    BEQ   CODE_29EE6F           
                    LDA.b $0F                   
                    BEQ   CODE_29EE6F           
                    AND.b #$20                  
                    BNE   CODE_29EE5A           
                    LDA.b $0F                   
                    AND.b #$08                  
                    BNE   CODE_29EE43           
                    INC.w $028E                 
                    LDA.w $028E                 
                    CMP.b #$03                  
                    BCC   CODE_29EE39           
                    DEC.w $028E                 
                    BRA   CODE_29EE6F           

CODE_29EE39:        LDA.b #$01                  
                    STA.w $1203                 
                    STZ.w $028F                 
                    BRA   CODE_29EE6F           

CODE_29EE43:        DEC.w $028E                 
                    LDA.w $028E                 
                    BPL   CODE_29EE50           
                    INC.w $028E                 
                    BRA   CODE_29EE6F           

CODE_29EE50:        LDA.b #$01                  
                    STA.w $1203                 
                    STZ.w $028F                 
                    BRA   CODE_29EE6F           

CODE_29EE5A:        INC.w $028E                 
                    LDA.w $028E                 
                    CMP.b #$03                  
                    BCC   CODE_29EE67           
                    STZ.w $028E                 
CODE_29EE67:        LDA.b #$01                  
                    STA.w $1203                 
                    STZ.w $028F                 
CODE_29EE6F:        LDA.b #$4C                  
                    STA.w $0800,y               
                    LDX.w $028E                 
                    LDA.w DATA_29EF0E,x               
                    STA.w $0801,y               
                    LDA.w $028F                 
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.w DATA_29EF13,x               
                    STA.w $0802,y               
                    LDA.w $0598                 
                    BEQ   CODE_29EE96           
                    LDA.b #$2B                  
                    BRA   CODE_29EE98           

CODE_29EE96:        LDA.b #$23                  
CODE_29EE98:        STA.w $0803,y               
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    INC.w $028F                 
                    LDA.w $0290                 
                    BEQ   CODE_29EF07           
                    LDA.b $18                   
                    AND.b #$10                  
                    BEQ   CODE_29EF07           
                    LDA.w $028E                 
                    BEQ   CODE_29EF07           
                    LDX.b #$00                  
                    LDY.w $0726                 
                    BEQ   CODE_29EEBC           
                    LDX.b #$23                  
CODE_29EEBC:        LDA.w $0715                 
                    STA.w $1D9F,x               
                    LDA.w $0716                 
                    STA.w $1DA0,x               
                    LDA.w $0717                 
                    STA.w $1DA1,x               
                    LDA.b #$3B                  
                    STA.w $1200                 
                    LDA.w $028E                 
                    CMP.b #$01                  
                    BEQ   CODE_29EEDF           
                    LDA.b #$F3                  
                    STA.w $1202                 
CODE_29EEDF:        JSL.l CODE_00922D           
                    LDA.b #$22                  
                    STA.w $02DD                 
CODE_29EEE8:        JSL.l CODE_20804D           
                    DEC.w $02DD                 
                    BNE   CODE_29EEE8           
                    STZ.w $0290                 
                    LDA.w $028E                 
                    CMP.b #$01                  
                    BEQ   CODE_29EF07           
                    STZ.w $1200                 
                    LDA.b #$80                  
                    STA.w $1202                 
                    JML.l CODE_0080DE           

CODE_29EF07:        STZ.w $02DD                 
                    PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

DATA_29EF0E:        db $50,$60,$70

DATA_29EF11:        db $58,$68

DATA_29EF13:        db $D0,$DE

DATA_29EF15:        db $AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$14,$15,$16,$17
                    db $18,$19,$1A,$1B,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$28,$29
                    db $2A,$2B,$1C,$14,$15,$16,$17,$18
                    db $19,$1A,$1B,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $28,$29,$2A,$2B,$1C,$24,$25,$26
                    db $27,$AA,$AA,$AA,$AA,$FF

DATA_29EF64:        db $AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$24,$25,$26,$27,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$28,$29,$2A,$2B
                    db $1C,$24,$25,$26,$27,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                    db $AA,$AA,$AA,$AA,$FF

CODE_29EFB3:        LDA.w $028B
                    BEQ   CODE_29F016           
                    BMI   CODE_29F016           
                    REP   #$30                  
                    DEC.w $028B                 
                    DEC.w $0281                 
                    DEC.w $0281                 
                    INC.w $0283                 
                    INC.w $0283                 
                    DEC.w $0285                 
                    DEC.w $0285                 
                    DEC.w $0285                 
                    DEC.w $0285                 
                    INC.w $0289                 
                    INC.w $0289                 
                    INC.w $0289                 
                    INC.w $0289                 
                    LDX.w #$007E                
                    LDA.w #$00FF                
CODE_29EFE9:        STA.l $7F9000,x             
                    STA.l $7F9080,x             
                    STA.l $7F9100,x             
                    STA.l $7F9180,x             
                    DEX                         
                    DEX                         
                    BPL   CODE_29EFE9           
                    LDA.w $0283                 
                    XBA                         
                    ORA.w $0281                 
                    LDX.w $0285                 
CODE_29F007:        STA.l $7F9000,x             
                    INX                         
                    INX                         
                    CPX.w $0289                 
                    BNE   CODE_29F007           
                    SEP   #$30                  
                    BRA   CODE_29F01C           

CODE_29F016:        INC.w $028C                 
                    INC.w $0290                 
CODE_29F01C:        JMP.w CODE_29EC39           

CODE_29F01F:        LDA.w $028B                 
                    CMP.b #$11                  
                    BNE   CODE_29F02C           
                    DEC.w $028B                 
                    JMP.w CODE_29EC39           

CODE_29F02C:        CMP.b #$10                  
                    BNE   CODE_29F03F           
                    LDA.b #$F2                  
                    STA.w $1202                 
                    LDA.w $028E                 
                    BNE   CODE_29F03F           
                    LDA.b #$43                  
                    STA.w $1200                 
CODE_29F03F:        LDA.w $028B                 
                    BEQ   CODE_29F0A2           
                    BMI   CODE_29F0A2           
                    REP   #$30                  
                    INC.w $0281                 
                    INC.w $0281                 
                    DEC.w $0283                 
                    DEC.w $0283                 
                    INC.w $0285                 
                    INC.w $0285                 
                    INC.w $0285                 
                    INC.w $0285                 
                    DEC.w $0289                 
                    DEC.w $0289                 
                    DEC.w $0289                 
                    DEC.w $0289                 
                    DEC.w $028B                 
                    LDX.w #$007E                
                    LDA.w #$00FF                
CODE_29F075:        STA.l $7F9000,x             
                    STA.l $7F9080,x             
                    STA.l $7F9100,x             
                    STA.l $7F9180,x             
                    DEX                         
                    DEX                         
                    BPL   CODE_29F075           
                    LDA.w $0283                 
                    XBA                         
                    ORA.w $0281                 
                    LDX.w $0285                 
CODE_29F093:        STA.l $7F9000,x             
                    INX                         
                    INX                         
                    CPX.w $0289                 
                    BNE   CODE_29F093           
                    SEP   #$30                  
                    BRA   CODE_29F0DE           

CODE_29F0A2:        STZ.w $028C                 
                    STZ.w $396D                 
                    STZ.w $0200                 
                    STZ.w $0201                 
                    LDA.w $0202                 
                    EOR.b #$33                  
                    STA.w $0202                 
                    LDA.w $0287                 
                    STA.w $020A                 
                    LDA.w $0288                 
                    STA.w $020B                 
                    LDA.w $037A                 
                    BNE   CODE_29F0CC           
                    JSR.w CODE_29EB9B           
                    BRA   CODE_29F0CF           

CODE_29F0CC:        JSR.w CODE_29EB7F           
CODE_29F0CF:        STZ.w $037A                 
                    LDA.w $0293                 
                    AND.b #$F7                  
                    STA.w $0293                 
                    PLY                         
                    PLX                         
                    PLB                         
                    RTL                         

CODE_29F0DE:        JMP.w CODE_29EC39           

CODE_29F0E1:        PHB                         
                    LDA.b #$7F                  
                    PHA                         
                    PLB                         
                    REP   #$30                  
                    LDX.w #$007E                
                    LDA.w #$0000                
CODE_29F0EE:        STA.w $9000,x               
                    STA.w $9080,x               
                    STA.w $9100,x               
                    STA.w $9180,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_29F0EE           
                    PLB                         
                    SEP   #$20                  
                    LDX.w #$2641                
                    STX.w $4330                 
                    LDX.w #$F14C                
                    STX.w $4332                 
                    LDA.b #$29                  
                    STA.w $4334                 
                    LDA.b #$7F                  
                    STA.w $4337                 
                    LDA.b #$22                  
                    STA.w $0200                 
                    LDA.b #$02                  
                    STA.w $0201                 
                    LDA.w $0202                 
                    ORA.b #$33                  
                    STA.w $0202                 
                    LDA.w $020A                 
                    STA.w $0287                 
                    LDA.w $020B                 
                    STA.w $0288                 
                    LDA.w $0208                 
                    STA.w $020A                 
                    LDA.w $0209                 
                    STA.w $020B                 
                    SEP   #$10                  
                    LDA.w $0293                 
                    ORA.b #$08                  
                    STA.w $0293                 
                    RTS                         

                    db $F8,$00,$90,$F8,$F0,$90,$00

CODE_29F153:        PHB
                    LDA.b #$7F                  
                    PHA                         
                    PLB                         
                    REP   #$30                  
                    LDX.w #$01A0                
CODE_29F15D:        LDA.w #$00FF                
                    STA.w $9000,x               
                    STA.w $9002,x               
                    STA.w $9004,x               
                    STA.w $9006,x               
                    STA.w $9008,x               
                    STA.w $900A,x               
                    STA.w $900C,x               
                    STA.w $900E,x               
                    STA.w $9010,x               
                    STA.w $9012,x               
                    STA.w $9014,x               
                    STA.w $9016,x               
                    STA.w $9018,x               
                    STA.w $901A,x               
                    STA.w $901C,x               
                    STA.w $901E,x               
                    TXA                         
                    SEC                         
                    SBC.w #$0020                
                    TAX                         
                    BPL   CODE_29F15D           
                    SEP   #$30                  
                    PLB                         
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
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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

CODE_29F800:        LDA.b #$22                  
                    STA.w $1CF6,x               
                    INC.w $1FF9,x               
                    RTL                         

CODE_29F809:        LDA.b $9C                   
                    BNE   CODE_29F851           
                    LDA.w $0520,x               
                    BEQ   CODE_29F816           
                    JSL.l CODE_27DF26           
CODE_29F816:        LDA.w $1A63                 
                    BEQ   CODE_29F81E           
                    DEC.w $1A63                 
CODE_29F81E:        LDA.w $1A64                 
                    AND.b #$1F                  
                    BEQ   CODE_29F828           
                    DEC.w $1A64                 
CODE_29F828:        JSR.w CODE_29F864           
                    JSR.w CODE_29FA82           
                    JSL.l CODE_279B6F           
                    LDA.w $0797,x               
                    BEQ   CODE_29F851           
                    LDA.b #$08                  
                    STA.w $0520,x               
                    LDA.b $9D                   
                    BMI   CODE_29F851           
                    LDA.b #$D0                  
                    STA.b $9D                   
                    JSR.w CODE_29FD18           
                    LDA.w $C8A7,y               
                    STA.b $8B                   
                    LDA.b #$01                  
                    STA.w $1200                 
CODE_29F851:        LDA.b $68,x                 
                    BEQ   CODE_29F85E           
                    JSR.w CODE_29FC2A           
                    LDA.b $68,x                 
                    CMP.b #$01                  
                    BEQ   CODE_29F863           
CODE_29F85E:        LDA.b #$FF                  
                    STA.w $0651,x               
CODE_29F863:        RTL                         

CODE_29F864:        LDA.b $68,x                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29F876
                    dw CODE_29F8AB
                    dw CODE_29FD5E
                    dw CODE_29FDC3
                    dw CODE_29FDDA
                    dw CODE_29FDE9

CODE_29F876:        LDA.w $0651,x               
                    BNE   CODE_29F8AA           
                    LDA.w $0210                 
                    CMP.b #$07                  
                    BCS   CODE_29F8AA                   
                    LDA.b #$00                  
                    STA.w $0210                 
                    STA.b $8B                   
                    LDA.b $A6                   
                    BNE   CODE_29F8AA           
                    LDA.b #$EF                  
                    STA.w $0216                 
                    LDA.b #$05                  
                    STA.w $1202                 
                    INC.w $1EB8                 
                    LDA.b #$02                  
                    STA.w $0424                 
                    LDA.b #$03                  
                    STA.b $4D,x                 
                    LDA.b #$30                  
                    STA.w $06A6,x               
                    INC.b $68,x                 
CODE_29F8AA:        RTS                         

CODE_29F8AB:        JSR.w CODE_29FD28           
                    LDA.w $0565                 
                    AND.b #$1F                  
                    ORA.w $1A63                 
                    BNE   CODE_29F8CA           
                    LDA.w $0679,x               
                    PHA                         
                    JSR.w CODE_29FA78           
                    PLA                         
                    CMP.w $0679,x               
                    BEQ   CODE_29F8CA           
                    ORA.b #$13                  
                    STA.w $1A64                 
CODE_29F8CA:        LDA.b $4D,x                 
                    JSL.l CODE_20FB1F           

                    dw CODE_29F8D8
                    dw CODE_29F964
                    dw CODE_29F9E8
                    dw CODE_29FA1A

CODE_29F8D8:        JSR.w CODE_29FB22           
                    LDA.w $1A64                 
                    AND.b #$1F                  
                    BEQ   CODE_29F8F5           
                    LSR   A                     
                    LSR   A                     
                    AND.b #$07                  
                    TAY                         
                    LDA.w $1A64                 
                    AND.b #$40                  
                    EOR.w $C8BE,y               
                    STA.w $0679,x               
                    LDA.w $C8B9,y               
CODE_29F8F5:        STA.w $0669,x               
                    LDA.w $0518,x               
                    BNE   CODE_29F91F           
                    JSR.w CODE_29FB3B           
                    LDA.b $9E,x                 
                    CMP.b #$40                  
                    BPL   CODE_29F908           
                    INC.b $9E,x                 
CODE_29F908:        LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_29F91E           
                    JSL.l CODE_278B67           
                    LDA.b #$10                  
                    LDY.w $06A6,x               
                    BNE   CODE_29F91B           
                    LDA.b #$B0                  
CODE_29F91B:        STA.w $0518,x               
CODE_29F91E:        RTS                         

CODE_29F91F:        LDA.w $1A64                 
                    AND.b #$1F                  
                    BNE   CODE_29F929           
                    INC.w $0669,x               
CODE_29F929:        LDA.w $0518,x               
                    CMP.b #$01                  
                    BEQ   CODE_29F95F           
                    CMP.b #$80                  
                    BNE   CODE_29F95E           
                    LDA.b #$01                  
                    STA.b $4D,x                 
                    LDA.b #$A0                  
                    STA.b $9E,x                 
                    JSR.w CODE_29FD18           
                    STY.b $00                   
                    LDA.b $0F                   
                    BPL   CODE_29F949           
                    JSL.l CODE_27A859           
CODE_29F949:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $C8A9,y               
                    LDY.b $00                   
                    DEY                         
                    BNE   CODE_29F95C           
                    JSL.l CODE_27A859           
CODE_29F95C:        STA.b $8C,x                 
CODE_29F95E:        RTS                         

CODE_29F95F:        LDA.b #$F0                  
                    STA.b $9E,x                 
                    RTS                         

CODE_29F964:        LDA.b $9E,x                 
                    BPL   CODE_29F96B           
                    JSR.w CODE_29FB22           
CODE_29F96B:        LDA.b #$00                  
                    STA.w $0669,x               
                    JSR.w CODE_29FB3B           
                    LDA.b $9E,x                 
                    BMI   CODE_29F97B           
                    CMP.b #$50                  
                    BCS   CODE_29F981                   
CODE_29F97B:        INC.b $9E,x                 
                    INC.b $9E,x                 
                    INC.b $9E,x                 
CODE_29F981:        LDA.b $9E,x                 
                    BPL   CODE_29F989           
                    CMP.b #$E0                  
                    BCC   CODE_29F9B6           
CODE_29F989:        JSR.w CODE_29FD18           
                    LDA.w $C8C3,y               
                    EOR.b $8C,x                 
                    BPL   CODE_29F9B6           
                    JSL.l CODE_27A848           
                    DEY                         
                    BEQ   CODE_29F9B6           
                    LDA.b #$02                  
                    STA.b $4D,x                 
                    LDA.b #$0A                  
                    STA.w $0518,x               
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.w $0776,x               
                    LDA.b #$E0                  
                    STA.b $9E,x                 
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    RTS                         

CODE_29F9B6:        LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_29F9E7           
                    JSL.l CODE_278B67           
                    STA.b $8C,x                 
                    LDA.b #$2C                  
                    STA.w $1CF3                 
                    LDA.b #$09                  
                    STA.w $1203                 
                    LDA.b #$0C                  
                    STA.w $0520,x               
                    LDA.b #$35                  
                    STA.w $0518,x               
                    LDA.w $0783,x               
                    AND.b #$1F                  
                    ADC.b #$67                  
                    STA.w $06A6,x               
                    STA.w $1021,x               
                    LDA.b #$03                  
                    STA.b $4D,x                 
CODE_29F9E7:        RTS                         

CODE_29F9E8:        LDA.b #$00                  
                    STA.w $1A63                 
                    LDA.b #$06                  
                    STA.w $0669,x               
                    LDA.w $0518,x               
                    BEQ   CODE_29FA07           
                    LDA.b $5F,x                 
                    CMP.w $0776,x               
                    BEQ   CODE_29FA06           
                    INC.b $5F,x                 
                    BCC   CODE_29FA06           
                    DEC.b $5F,x                 
                    DEC.b $5F,x                 
CODE_29FA06:        RTS                         

CODE_29FA07:        JSR.w CODE_29FB3B           
                    LDA.b $9E,x                 
                    BMI   CODE_29FA12           
                    CMP.b #$70                  
                    BCS   CODE_29FA17                   
CODE_29FA12:        CLC                         
                    ADC.b #$06                  
                    STA.b $9E,x                 
CODE_29FA17:        JMP.w CODE_29F9B6           

CODE_29FA1A:        JSR.w CODE_29FB3B           
                    LDA.b $9E,x                 
                    CMP.b #$40                  
                    BPL   CODE_29FA27           
                    INC.b $9E,x                 
                    INC.b $9E,x                 
CODE_29FA27:        JSR.w CODE_29FB8D           
                    LDA.b $A7,x                 
                    AND.b #$04                  
                    BEQ   CODE_29FA34           
                    JSL.l CODE_278B67           
CODE_29FA34:        LDA.w $0518,x               
                    BEQ   CODE_29FA3F           
                    LDA.b #$07                  
                    STA.w $0669,x               
                    RTS                         

CODE_29FA3F:        LDA.w $06A6,x               
                    BNE   CODE_29FA53           
                    LDA.b #$00                  
                    STA.b $4D,x                 
                    LDA.w $0783,x               
                    AND.b #$7F                  
                    ORA.b #$80                  
                    STA.w $06A6,x               
                    RTS                         

CODE_29FA53:        CMP.b #$20                  
                    BCC   CODE_29FA6D           
                    LSR   A                     
                    LSR   A                     
                    CLC                         
                    ADC.w $1021,x               
                    AND.b #$07                  
                    TAY                         
                    LDA.w $C8C5,y               
                    STA.w $0669,x               
                    LDA.w $C8CD,y               
                    STA.w $0679,x               
                    RTS                         

CODE_29FA6D:        CMP.b #$0C                  
                    LDA.b #$05                  
                    BCS   CODE_29FA75                   
                    LDA.b #$08                  
CODE_29FA75:        STA.w $0669,x               
CODE_29FA78:        JSR.w CODE_29FD18           
                    LDA.w $C8D5,y               
                    STA.w $0679,x               
                    RTS                         

CODE_29FA82:        LDA.w $1A63                 
                    BEQ   CODE_29FA9E           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$07                  
                    TAY                         
                    LDA.w $C8D7,y               
                    STA.w $0669,x               
                    LDA.w $1A63                 
                    CMP.b #$10                  
                    BNE   CODE_29FA9E           
                    JSR.w CODE_29FA9F           
CODE_29FA9E:        RTS                         

CODE_29FA9F:        LDY.b #$04                  
CODE_29FAA1:        LDA.w $0661,y               
                    BEQ   CODE_29FAAA           
                    DEY                         
                    BPL   CODE_29FAA1           
                    RTS                         

CODE_29FAAA:        TYA                         
                    TAX                         
                    JSL.l CODE_279C96           
                    LDA.b #$02                  
                    STA.w $0661,x               
                    LDA.b #$75                  
                    STA.w $0671,x               
                    LDA.b #$02                  
                    STA.b $68,x                 
                    LDA.b #$10                  
                    STA.w $9E,y               
                    LDX.b $9B                   
                    LDA.b $71,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $71,y               
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $56,y               
                    LDA.w $0679,x               
                    ASL   A                     
                    ASL   A                     
                    ROL   A                     
                    AND.b #$01                  
                    TAX                         
                    STX.b $00                   
                    LDA.w $C8DF,x               
                    STA.w $8C,y               
                    LDX.b $9B                   
                    LDA.b $44,x                 
                    STA.w $44,y               
                    LDA.b $5F,x                 
                    LDX.b $00                   
                    CLC                         
                    ADC.w $C8E1,x               
                    STA.w $5F,y               
                    CMP.b #$F0                  
                    BCC   CODE_29FB05           
                    LDX.b $9B                   
                    LDA.w $0679,x               
                    BNE   CODE_29FB05           
                    STA.w $5F,y               
CODE_29FB05:        LDA.w $0783,y               
                    AND.b #$07                  
                    TAX                         
                    LDA.w $C8E3,x               
                    STA.w $077B,y               
                    LDA.b #$01                  
                    STA.w $1FE9,y               
                    ASL   A                     
                    STA.w $0518,y               
                    LDA.b #$3A                  
                    STA.w $1200                 
                    LDX.b $9B                   
                    RTS                         

CODE_29FB22:        LDA.w $1A65                 
                    BNE   CODE_29FB37           
                    LDA.w $0783,x               
                    AND.b #$3F                  
                    ADC.b #$60                  
                    STA.w $1A65                 
                    LDA.b #$3F                  
                    STA.w $1A63                 
                    RTS                         

CODE_29FB37:        DEC.w $1A65                 
                    RTS                         

CODE_29FB3B:        JSL.l CODE_27A7EF           
                    JSL.l CODE_27A7E4           
                    LDY.b $5F,x                 
                    LDA.b $8C,x                 
                    BEQ   CODE_29FB59           
                    BMI   CODE_29FB51           
                    CPY.b #$E0                  
                    BCS   CODE_29FB55                   
                    BCC   CODE_29FB59           
CODE_29FB51:        CPY.b #$08                  
                    BCS   CODE_29FB59                   
CODE_29FB55:        LDA.b #$00                  
                    STA.b $8C,x                 
CODE_29FB59:        JSL.l CODE_278B93           
                    LDA.b $4D,x                 
                    CMP.b #$02                  
                    BNE   CODE_29FB69           
                    LDA.w $1F76                 
                    STA.w $1A61                 
CODE_29FB69:        LDA.b $A7,x                 
                    PHA                         
                    LDA.b $5F,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.b $5F,x                 
                    JSL.l CODE_278B93           
                    PLA                         
                    STA.b $5F,x                 
                    PLA                         
                    ORA.b $A7,x                 
                    STA.b $A7,x                 
                    LDA.b $4D,x                 
                    CMP.b #$02                  
                    BNE   CODE_29FB8C           
                    LDA.w $1F76                 
                    STA.w $1A62                 
CODE_29FB8C:        RTS                         

CODE_29FB8D:        LDY.b #$01                  
CODE_29FB8F:        LDA.w $1A61,y               
                    CMP.b #$9C                  
                    BNE   CODE_29FBC6           
                    LDA.b #$00                  
                    STA.w $1A61,y               
                    LDA.b #$02                  
                    STA.w $0564                 
                    LDA.b $71,x                 
                    CLC                         
                    ADC.b #$30                  
                    AND.b #$F0                  
                    STA.w $052B                 
                    LDA.b $56,x                 
                    ADC.b #$00                  
                    STA.w $052A                 
                    LDA.b $5F,x                 
                    CLC                         
                    ADC.w $C8EB,y               
                    AND.b #$F0                  
                    STA.w $0529                 
                    LDA.b $44,x                 
                    ADC.b #$00                  
                    STA.w $0528                 
                    JMP.w CODE_29FBCA           

CODE_29FBC6:        DEY                         
                    BPL   CODE_29FB8F           
                    RTS                         

CODE_29FBCA:        LDA.b #$18                  
                    STA.w $1203                 
                    JSL.l CODE_279544           
                    LDA.b #$02                  
                    STA.w $1F9C                 
                    LDA.w $0543                 
                    STA.b $D8                   
                    LDA.w $0542                 
                    STA.b $D9                   
                    LDA.w $052A                 
                    XBA                         
                    LDA.w $052B                 
                    REP   #$20                  
                    SEC                         
                    SBC.b $D8                   
                    STA.b $D8                   
                    CLC                         
                    ADC.w #$0008                
                    SEP   #$20                  
                    STA.w $1FAB                 
                    XBA                         
                    STA.b $DF                   
                    LDA.b $D8                   
                    STA.w $1F9F                 
                    LDA.b $D9                   
                    STA.w $1FB1                 
                    LDA.w $0528                 
                    XBA                         
                    LDA.w $0529                 
                    REP   #$20                  
                    SEC                         
                    SBC.w $0210                 
                    SEP   #$20                  
                    STA.w $1FA2                 
                    XBA                         
                    STA.w $02AE                 
                    LDA.b #$00                  
                    STA.w $1FA8                 
                    STA.w $1FAE                 
                    LDA.b #$FA                  
                    STA.w $1FA5                 
                    RTS                         

CODE_29FC2A:        JSL.l CODE_279DC2           
                    LDA.b $83,x                 
                    STA.b $00                   
                    LDA.b $7A,x                 
                    STA.b $01                   
                    LDA.w $0679,x               
                    STA.b $02                   
                    STA.b $03                   
                    LDA.w $0651,x               
                    STA.b $04                   
                    LDA.w $0681,x               
                    STA.b $05                   
                    LDY.w $0669,x               
                    CPY.b #$01                  
                    BEQ   CODE_29FC52           
                    CPY.b #$07                  
                    BNE   CODE_29FC59           
CODE_29FC52:        LDA.b $00                   
                    CLC                         
                    ADC.b #$04                  
                    STA.b $00                   
CODE_29FC59:        CPY.b #$08                  
                    BEQ   CODE_29FC70           
                    CPY.b #$04                  
                    BEQ   CODE_29FC65           
                    CPY.b #$06                  
                    BCC   CODE_29FC70           
CODE_29FC65:        LDA.w $0679,x               
                    AND.b #$80                  
                    STA.b $02                   
                    ORA.b #$40                  
                    STA.b $03                   
CODE_29FC70:        LDA.w $0669,x               
                    ASL   A                     
                    STA.b $0E                   
                    ASL   A                     
                    ADC.b $0E                   
                    STA.b $0E                   
                    STZ.b $0F                   
CODE_29FC7D:        LDA.b $15                   
                    AND.b #$01                  
                    ASL   A                     
                    STA.b $07                   
                    ASL   A                     
                    ADC.b $07                   
                    CLC                         
                    ADC.b $0F                   
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $C945,y               
                    STA.b $C6                   
                    SEP   #$20                  
                    LDX.b $0F                   
                    LDA.b $05                   
                    AND.w $C93F,x               
                    BEQ   CODE_29FCA1           
                    JMP.w CODE_29FD0A           

CODE_29FCA1:        LDA.b $0E                   
                    CLC                         
                    ADC.b $0F                   
                    TAX                         
                    LDA.w $C8ED,x               
                    REP   #$10                  
                    LDY.b $C6                   
                    STA.w $0802,y               
                    SEP   #$10                  
                    LDX.b $0F                   
                    LDA.b $02                   
                    BPL   CODE_29FCBE           
                    TXA                         
                    CLC                         
                    ADC.b #$06                  
                    TAX                         
CODE_29FCBE:        LDA.b $00                   
                    CLC                         
                    ADC.w $C92F,x               
                    REP   #$10                  
                    LDY.b $C6                   
                    STA.w $0801,y               
                    SEP   #$10                  
                    LDX.b $0F                   
                    TXA                         
                    AND.b #$01                  
                    ROR   A                     
                    LDA.b $02                   
                    BCC   CODE_29FCD9           
                    LDA.b $03                   
CODE_29FCD9:        ORA.b #$29                  
                    REP   #$10                  
                    LDY.b $C6                   
                    STA.w $0803,y               
                    SEP   #$10                  
                    LDA.b $02                   
                    AND.b #$40                  
                    BEQ   CODE_29FCEF           
                    TXA                         
                    CLC                         
                    ADC.b #$06                  
                    TAX                         
CODE_29FCEF:        LDA.b $01                   
                    CLC                         
                    ADC.w $C923,x               
                    REP   #$10                  
                    LDY.b $C6                   
                    STA.w $0800,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w #$0002                
                    STA.w $0A20,y               
                    SEP   #$30                  
CODE_29FD0A:        INC.b $0F                   
                    LDA.b $0F                   
                    CMP.b #$06                  
                    BEQ   CODE_29FD15           
                    JMP.w CODE_29FC7D           

CODE_29FD15:        LDX.b $9B                   
                    RTS                         

CODE_29FD18:        LDA.b $5F,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$08                  
                    STA.b $5F,x                 
                    JSL.l CODE_27A837           
                    PLA                         
                    STA.b $5F,x                 
                    RTS                         

CODE_29FD28:        LDA.b $56,x                 
                    CMP.b #$01                  
                    BMI   CODE_29FD34           
                    LDA.b $83,x                 
                    CMP.b #$88                  
                    BCS   CODE_29FD44                   
CODE_29FD34:        LDA.w $0661,x               
                    CMP.b #$02                  
                    BEQ   CODE_29FD5D           
                    LDA.b #$02                  
                    STA.w $0661,x               
                    LDA.b #$D0                  
                    STA.b $9E,x                 
CODE_29FD44:        LDA.b #$02                  
                    STA.b $68,x                 
                    LSR   A                     
                    STA.w $05F3                 
                    LDA.b #$06                  
                    STA.w $0669,x               
                    LDA.b #$00                  
                    STA.b $8C,x                 
                    STA.w $1A63                 
                    LDA.b #$30                  
                    STA.w $06A6,x               
CODE_29FD5D:        RTS                         

CODE_29FD5E:        LDY.w $06A6,x               
                    DEY                         
                    BNE   CODE_29FD6E           
                    LDA.b #$01                  
                    STA.w $02D9                 
                    LDA.b #$0E                  
                    STA.w $1202                 
CODE_29FD6E:        LDA.w $1CF6,x               
                    CMP.b #$01                  
                    BPL   CODE_29FD7C           
                    ASL.w $0679,x               
                    SEC                         
                    ROR.w $0679,x               
CODE_29FD7C:        JSL.l CODE_27A7E4           
                    LDA.b $9E,x                 
                    CMP.b #$25                  
                    BPL   CODE_29FD88           
                    INC.b $9E,x                 
CODE_29FD88:        LDA.b $56,x                 
                    CMP.b #$04                  
                    BMI   CODE_29FDA9           
                    INC.b $68,x                 
                    LDA.b #$D0                  
                    STA.w $0518,x               
                    LDA.b #$80                  
                    STA.w $1CF3                 
                    LDA.b #$09                  
                    STA.w $1203                 
                    LDA.b $A6                   
                    BNE   CODE_29FDA9           
                    LDA.b #$C0                  
                    STA.b $9D                   
                    INC.b $A6                   
CODE_29FDA9:        LDA.b $71,x                 
                    PHA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.b $71,x                 
                    LDA.b $56,x                 
                    PHA                         
                    ADC.b #$00                  
                    STA.b $56,x                 
                    JSL.l CODE_27A2C8           
                    PLA                         
                    STA.b $56,x                 
                    PLA                         
                    STA.b $71,x                 
                    RTS                         

CODE_29FDC3:        LDA.w $0518,x               
                    BNE   CODE_29FDD9           
                    LDA.b #$13                  
                    STA.w $1202                 
                    LDA.b #$00                  
                    STA.w $02E3                 
                    LDA.b #$02                  
                    STA.w $02E4                 
                    INC.b $68,x                 
CODE_29FDD9:        RTS                         

CODE_29FDDA:        JSL.l CODE_278A17           
                    BNE   CODE_29FDE8           
                    LDA.b #$30                  
                    STA.l $7FC587               
                    INC.b $68,x                 
CODE_29FDE8:        RTS                         

CODE_29FDE9:        LDA.l $7FC587               
                    BEQ   CODE_29FE1E           
                    DEC   A                     
                    STA.l $7FC587               
                    CMP.b #$10                  
                    BNE   CODE_29FE1D           
                    LDA.b #$39                  
                    STA.w $1200                 
                    LDA.b #$F0                  
                    STA.w $1202                 
                    LDY.b #$01                  
CODE_29FE04:        LDA.b #$01                  
                    STA.w $1F9C,y               
                    LDA.w $C95D,y               
                    STA.w $1F9F,y               
                    LDA.w $C95F,y               
                    STA.w $1FA2,y               
                    LDA.b #$1F                  
                    STA.w $1FAE,y               
                    DEY                         
                    BPL   CODE_29FE04           
CODE_29FE1D:        RTS                         

CODE_29FE1E:        REP   #$10                  
                    LDY.w #$0001                
                    LDX.w #$0080                
CODE_29FE26:        LDA.w $C95F,y               
                    STA.w $0800,x               
                    LDA.w $C95D,y               
                    STA.w $0801,x               
                    LDA.b #$6A                  
                    STA.w $0802,x               
                    LDA.b #$23                  
                    STA.w $0803,x               
                    PHX                         
                    REP   #$20                  
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $0A20,x               
                    PLX                         
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    DEY                         
                    BPL   CODE_29FE26           
                    SEP   #$10                  
                    LDA.b $55                   
                    BEQ   CODE_29FE78           
                    LDA.b $5E                   
                    SEC                         
                    SBC.b #$E4                  
                    CMP.b #$08                  
                    BCS   CODE_29FE78                   
                    LDA.b $70                   
                    CMP.b #$48                  
                    BCC   CODE_29FE78           
                    LDA.b $17                   
                    AND.b #$08                  
                    BEQ   CODE_29FE78           
                    STA.w $078E                 
                    LDA.b #$00                  
                    STA.w $0713                 
                    INC.w $0014                 
CODE_29FE78:        LDA.b $15                   
                    AND.b #$0C                  
                    LSR   A                     
                    TAY                         
                    REP   #$20                  
                    LDA.w $C963,y               
                    STA.l $001422               
                    SEP   #$20                  
                    INC.w $1500                 
                    LDX.b $9B                   
                    RTS                         

CODE_29FE8F:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $0691,x               
                    BEQ   CODE_29FE9A           
                    DEC.w $0691,x               
CODE_29FE9A:        REP   #$10                  
                    STZ.b $DD                   
                    LDY.b $C6,x                 
                    STZ.b $D8                   
                    LDA.w $0669,x               
                    BNE   CODE_29FEB9           
                    LDA.b #$F0                  
                    STA.w $0801,y               
                    STA.w $0805,y               
                    STA.w $0809,y               
                    STA.w $080D,y               
                    SEP   #$10                  
                    PLB                         
                    RTL                         

CODE_29FEB9:        CMP.b #$07                  
                    BEQ   CODE_29FEC1           
                    LDA.b #$0C                  
                    STA.b $DD                   
CODE_29FEC1:        LDA.w $0691,x               
                    BNE   CODE_29FECB           
                    LDA.b #$17                  
                    STA.w $0691,x               
CODE_29FECB:        AND.b #$F8                  
                    LSR   A                     
                    CLC                         
                    ADC.b $DD                   
                    PHX                         
                    XBA                         
                    LDA.b #$00                  
                    XBA                         
                    TAX                         
                    LDA.w DATA_29FF6C,x               
                    STA.w $0802,y               
                    LDA.w DATA_29FF6C+1,x               
                    STA.w $0806,y               
                    LDA.w DATA_29FF6C+2,x               
                    STA.w $080A,y               
                    PLX                         
                    LDA.b $5F,x                 
                    STA.b $D8                   
                    LDA.b $44,x                 
                    STA.b $D9                   
                    REP   #$20                  
                    LDA.w $0679,x               
                    AND.w #$0040                
                    BNE   CODE_29FF01           
                    LDA.w #$0010                
                    BRA   CODE_29FF04           

CODE_29FF01:        LDA.w #$FFF8                
CODE_29FF04:        STA.b $DA                   
                    LDA.b $D8                   
                    SEC                         
                    SBC.w $0210                 
                    STA.b $D8                   
                    CLC                         
                    ADC.b $DA                   
                    STA.b $DA                   
                    SEP   #$20                  
                    STA.w $0804,y               
                    STA.w $0808,y               
                    LDA.b $D8                   
                    STA.w $0800,y               
                    LDA.b $71,x                 
                    SEC                         
                    SBC.w $0216                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    LDA.b #$F0                  
                    STA.w $080D,y               
                    LDA.w $0679,x               
                    AND.b #$40                  
                    ORA.b #$23                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $D9                   
                    BEQ   CODE_29FF57           
                    LDA.b #$03                  
                    BRA   CODE_29FF59           

CODE_29FF57:        LDA.b #$02                  
CODE_29FF59:        STA.w $0A20,y               
                    LDA.b $DB                   
                    BEQ   CODE_29FF62           
                    LDA.b #$01                  
CODE_29FF62:        STA.w $0A21,y               
                    STA.w $0A22,y               
                    SEP   #$10                  
                    PLB                         
                    RTL                         

DATA_29FF6C:        db $88,$8A,$9A,$00,$8B,$8D,$9D,$00
                    db $8E,$A8,$B8,$00,$A9,$AB,$BB,$00
                    db $AC,$AE,$BE,$00,$68,$AF,$BF,$00