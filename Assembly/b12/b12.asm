; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $128000
    fillbyte $FF : fill $8000

ORG $128000
CODE_128000:        STZ.b $F6                   
                    STZ.b $FA                   
                    STZ.b $F8                   
                    STZ.b $FC                   
CODE_128008:        LDA.b $50                 ; \ If player not in normal state...
                    CMP.b #$02                ;  | ...nor climbing (not forced)...
                    BCS   CODE_128033         ; / ..don't branch.
                    LDA.b #$00                  
                    LDY.b #$10                  
                    CPY.w $04C3                 
                    ROL   A                     
                    EOR.w $06C2                 
                    BEQ   CODE_128033           
                    LDA.w $0628                 
                    CMP.b #$02                  
                    BEQ   CODE_12802B           
                    LDY.w $06C2               ; \ Player changing size.
                    LDA   DATA_119B3F,y       ;  | Y = 0 = shrinking, Y = 1 = growing.
                    STA.w $1DE0               ; / Store sound effect appropiate to the change.
CODE_12802B:        LDA.b #$1E                ; \ Amount of time to flash = #$1E.
                    STA.b $82                 ; /
                    LDA.b #$08                ; \ Getting into changing size animation.
                    STA.b $50                 ; /
CODE_128033:        JSR.w CODE_128037         ; Execute player state.
                    RTL       
                  
CODE_128037:        STZ.b $64                   
                    LDA.b $50                 ; \ Execute pointer depending on player status.
                    JSL.l CODE_118776         ; /

                    dw CODE_128071                          ; 00 - Walk normal.
                    dw CODE_12813B                          ; 01 - Climbing, normal.
                    dw CODE_128109                          ; 02 - Picking something up.
                    dw CODE_1281F1                          ; 03 - Climbing, entering new room.
                    dw CODE_1281A7                          ; 04 - Moving inside a jar.
                    dw CODE_1281D5                          ; 05 - Moving out of a jar.
                    dw CODE_12822C                          ; 06 - Player walking into Hawkmouth.
                    dw CODE_1280DE                          ; 07 - Dying.
                    dw CODE_12824D                          ; 08 - Hurt / growing.

DATA_128051:        db $00,$00,$00,$00,$40,$40,$40,$00
                    db $C0,$C0,$C0,$00,$00,$00,$00,$00

DATA_128061:        db $00,$40,$C0,$00,$00,$40,$C0,$00
                    db $00,$40,$C0,$00,$00,$00,$00,$00

CODE_128071:        JSL.l CODE_14DE60           
                    LDA.l $700007               
                    BEQ   CODE_1280C3           
                    LDA.b $FC                   
                    AND.b #$80                  
                    BEQ   CODE_12808B           
                    LDA.w $0214                 
                    AND.b #$01                  
                    EOR.b #$01                  
                    STA.w $0214                 
CODE_12808B:        LDA.b $FC                   
                    AND.b #$40                  
                    BEQ   CODE_1280A5           
                    LDA.b #$30                ; \ Flashing timer = #$30.
                    STA.w $04E1               ; /
                    LDA.b #$02                  
                    STA.w $04C4                 
                    LDA.b #$3F                ; \ Invincibility timer = #$3F.
                    STA.w $04C3               ; /
                    LDA.b #$0D                ; \ Star music.
                    STA.w $1DE2               ; /
CODE_1280A5:        LDA.w $0214                 
                    BEQ   CODE_1280C3           
                    LDA.b $F6                   
                    AND.b #$0F                  
                    TAX                         
                    PHX                         
                    LDA.l DATA_128051,x             
                    STA.b $46                   
                    JSR.w CODE_128523           
                    PLX                         
                    LDA.l DATA_128061,x             
                    STA.b $3C                   
                    BRL   CODE_1280D2
           
CODE_1280C3:        JSR.w CODE_12834B           
                    JSR.w CODE_128272           
                    JSR.w CODE_128565           
                    JSR.w CODE_128BBB           
                    JSR.w CODE_128523           
CODE_1280D2:        LDX.b #$00                  
                    JSR.w CODE_128525           
                    LDA.b $EB                   
                    BNE   CODE_1280DD           
                    STA.b $14                   
CODE_1280DD:        RTS
                       
CODE_1280DE:        LDA.b $82                   
                    BNE   CODE_128108           
                    LDA.w $042A                 
                    CMP.b #$02                  
                    BEQ   CODE_1280F9           
                    JSR.w CODE_128523           
                    LDA.b $46                   
                    BMI   CODE_1280F4           
                    CMP.b #$39                  
                    BCS   CODE_128108                   
CODE_1280F4:        INC.b $46                   
                    INC.b $46                   
                    RTS
                       
CODE_1280F9:        LDA.b #$02                  
                    STA.b $C7                   
                    LDY.b #$01                ; \ Return to player select screen.
                    DEC.w $04EE               ;  | If lives are 0...
                    BNE   CODE_128105         ;  | ...
                    INY                       ;  | ... then return to game over screen.
CODE_128105:        STY.w $04ED               ; / <--
CODE_128108:        RTS                       ; Return.
                       
CODE_128109:        LDA.b $82                   
                    BNE   CODE_12813A           
                    LDX.w $042D                 
                    LDY.b $A8,x                 
                    CPY.b #$02                  
                    BCC   CODE_128134           
                    DEC.b $A8,x                 
                    LDA   DATA_119B45,y               
                    STA.b $C7                   
                    LDA.b $51,x                 
                    CMP.b #$06                  
                    BEQ   CODE_128129           
                    LDA.b $90,x                 
                    CMP.b #$32                  
                    BNE   CODE_12812E           
CODE_128129:        LDA   DATA_119B3F,y               
                    BPL   CODE_128131           
CODE_12812E:        LDA.w $0546,y               
CODE_128131:        STA.b $82                   
                    RTS
                       
CODE_128134:        STA.b $50                   
                    INC.b $99                   
                    INC.b $9A                   
CODE_12813A:        RTS
                       
CODE_12813B:        LDA.b $F6                 ; \ Check only if Up and Down are pressed.
                    AND.b #$0C                ;  | LSR twice for a result from 00-03
                    LSR   A                   ;  |
                    LSR   A                   ;  |
                    TAY                       ;  | That into Y for index being used later.
                    CPY.b #$02                ;  | If going upwards, go to an extra subroutine.
                    BNE   CODE_128149         ;  | (Don't branch.)
                    JSR.w CODE_128183         ;  | Flip direction every 8 frames.
CODE_128149:        LDA   DATA_11CBF1,y       ;  | Get appropiate Y speed in for climbing.     
                    STA.b $46                 ; /
                    LDA.b $F6                 ; \ Now do the same horizontally...
                    AND.b #$03                ;  | (left-right)
                    TAY                       ;  | Into Y index to get the value for the X speeds.
                    LDA   DATA_119B4D,y       ;  | <- here
                    STA.b $3C                 ; /
                    LDA.b $28                   
                    CLC                         
                    ADC.b #$04                  
                    AND.b #$0F                  
                    CMP.b #$08                  
                    BCS   CODE_12817E                   
                    LDY.w $CB08                 
                    LDA.b $46                   
                    BMI   CODE_12816B           
                    INY                         
CODE_12816B:        LDX.b #$00                  
                    JSR.w CODE_128195           
                    BCS   CODE_128178                   
                    LDA.b $46                   
                    BPL   CODE_12817E           
                    STX.b $46                   
CODE_128178:        JSR.w CODE_1280D2           
                    JMP.w CODE_128523           

CODE_12817E:        LDA.b #$00                  
                    STA.b $50                   
                    RTS
                       
CODE_128183:        LDA.b $10                 ; \ Run code every 8 frames.
                    AND.b #$07                ;  |
                    BNE   CODE_128194         ; /
                    LDA.b $9D                 ; \ Flip direction.
                    EOR.b #$01                ;  |
                    STA.b $9D                 ; /
                    LDA.b #$30                ; \ Climbing sound effect.
                    STA.w $1DE0               ; /
CODE_128194:        RTS                       ; Return.
                       
CODE_128195:        JSL.l CODE_13F900         ; Prepare Map16 tile being touched by player.
                    LDA.b $00                 ; \ Check if the tile that is being touched is a 'climbing tile'...
                    LDY.b #$0B                ;  | vines, ladders...
CODE_12819D:        CMP   DATA_119B50,y       ;  |
                    BEQ   CODE_1281A6         ;  | If so, return.
                    DEY                       ;  | Otherwise, loop.
                    BPL   CODE_12819D         ;  | When through index, and no match has been found...
                    CLC                       ;  | Clear carry.
CODE_1281A6:        RTS                       ; / Return.
                       
CODE_1281A7:        LDA.b #$20                  
                    STA.b $64                   
                    INC.b $32                 ; Move down.
                    LDA.b $32                 ; \ Skip code if not completely inside the jar.
                    AND.b #$0F                ;  |
                    BNE   CODE_1281A6         ; /
                    PLA                       ; \ Pull return address.
                    PLA                       ; /
                    JSL.l CODE_13FA42           
                    LDA.b #$02                ; \ Generate player on top of screen.
                    STA.w $0536               ; /
                    LDA.w $04EF                 
                    BNE   CODE_1281C9           
                    LDA.b #$04                ; \ Act like a warp jar.
                    STA.w $04ED               ; /
                    RTL                       ; Return.
                      
CODE_1281C9:        CMP.b #$01                  
                    BEQ   CODE_1281D1           
                    STA.w $0627                 
                    RTL
                       
CODE_1281D1:        STA.w $0628                 
                    RTL
                       
CODE_1281D5:        LDA.b #$20                  
                    STA.b $64                   
                    DEC.b $32                 ; Move up.
                    LDA.b $32                 ; \ Generate sound effect on the first frame the player is inside the jar.
                    AND.b #$0F                ;  |
                    CMP.b #$0F                ;  |
                    BNE   CODE_1281E8         ; /
                    LDA.b #$4E                ; \ Going out of jar sound effect.
                    STA.w $1DE3               ; /
CODE_1281E8:        LDA.b $32                 ; \ If still in jar...
                    AND.b #$0F                ;  |
                    BNE   CODE_1281F0         ;  | Return.
                    STA.b $50                 ; / Otherwise, go into normal walking mode.
CODE_1281F0:        RTS                       ; Return.
                       
CODE_1281F1:        LDA.b $46                 ; \ Y speed.
                    ASL   A                   ;  | Result: 80-FF = 01.
                    ROL   A                   ;  | Result: 00-7F = 00.
                    AND.b #$01                ;  |
                    TAY                       ; / Into Y.
                    LDA.w $042A                 
                    CMP   DATA_119B5C,y               
                    BNE   CODE_128211           
                    LDA.w $042B                 
                    CMP   DATA_119B5E,y               
                    BNE   CODE_128211           
                    INC.w $0627                 
                    LDA.b #$03                  
                    STA.w $0536                 
                    RTS
                       
CODE_128211:        LDA.w $042A                 
                    BNE   CODE_12821E           
                    LDA.w $042B                 
                    CMP   DATA_119B60,y               
                    BEQ   CODE_128227           
CODE_12821E:        TYA                         
                    BEQ   CODE_128224           
                    JSR.w CODE_128183           
CODE_128224:        JMP.w CODE_128523           

CODE_128227:        LDA.b #$01                  
                    STA.b $50                   
                    RTS
                       
CODE_12822C:        LDA.b $82                 ; \ Return into normal walking mode if $82 == #$00.
                    BEQ   CODE_12824A         ; /
                    JSR.w CODE_128523           
                    LDA.w $5A                 
                    BEQ   CODE_12824C           
                    LDA.b #$20                  
                    STA.b $64                   
                    LDA.b #$04                ; \ Enter Hawkmouth, X-speed.
                    STA.b $3C                 ; /
                    LDA.b #$01                ; \ Face right.
                    STA.b $9D                 ; /
                    JSR.w CODE_1280D2           
                    JMP.w CODE_1283D1           

CODE_12824A:        STA.b $50                 ; <-- $50 - #$00 = normal player state.
CODE_12824C:        RTS                       ; Return.
                       
CODE_12824D:        LDA.b $82                   
                    BEQ   CODE_128267           
                    INC.b $85                   
                    LDY.b #$04                  
CODE_128255:        CMP   DATA_119B62,y               
                    BNE   CODE_128263           
                    LDA.w $06C2                 
                    EOR.b #$01                  
                    STA.w $06C2                 
                    RTS
                       
CODE_128263:        DEY                         
                    BPL   CODE_128255           
                    RTS
                       
CODE_128267:        LDY.b $C7                   
                    CPY.b #$0A                  
                    BNE   CODE_12826F           
                    LDA.b #$01                  
CODE_12826F:        STA.b $50                   
                    RTS
                       
CODE_128272:        JSR.w CODE_1283D1           
                    LDA.b $99                   
                    BNE   CODE_1282D5           
                    LDA.b $9A                   
                    BEQ   CODE_128286           
                    LDA.b $82                   
                    BEQ   CODE_128284           
                    JMP.w CODE_128304           

CODE_128284:        DEC.b $9A                   
CODE_128286:        LDA.b $FA                   
                    BPL   CODE_12829B           
                    INC.b $99                   
                    LDA.b #$06                  
                    STA.b $C7                   
                    JSR.w CODE_12830B           
                    LDA.b #$01                  
                    STA.w $1DE1                 
                    STZ.w $078C                 
CODE_12829B:        LDA.w $04B2                 
                    BNE   CODE_128304           
                    LDA.w $04E0                 
                    BNE   CODE_1282D5           
                    LDA.b $F6                   
                    AND.b #$04                  
                    BEQ   CODE_1282D5           
                    LDA.w $0778                 
                    BNE   CODE_1282D5           
                    INC.b $9A                   
                    STZ.w $078C                 
                    LDA.b #$04                  
                    STA.b $C7                   
                    LDA.b $99                   
                    BNE   CODE_1282D5           
                    LDA.w $04CB                 
                    CMP.b #$3C                  
                    BCS   CODE_128304                   
                    INC.w $04CB                 
                    LDA.w $04CB                 
                    CMP.b #$3C                  
                    BNE   CODE_128304           
                    LDA.b #$2D                  
                    STA.w $1DE3                 
                    BNE   CODE_128304           
CODE_1282D5:        LDA.w $04CB                 
                    CMP.b #$3C                  
                    BCS   CODE_1282E1                   
                    LDA.b #$00                  
                    STA.w $04CB                 
CODE_1282E1:        LDA.b $F6                   
                    AND.b #$03                  
                    BEQ   CODE_128304           
                    AND.b #$01                  
                    STA.b $9D                   
                    TAY                         
                    LDA.w $0624                 
                    LSR   A                     
                    LSR   A                     
                    AND.b $10                   
                    BNE   CODE_1282FD           
                    LDA.b $3C                   
                    CLC                         
                    ADC   DATA_119B67,y               
                    STA.b $3C                   
CODE_1282FD:        LDA.b #$00                  
                    STA.w $04CB                 
                    BEQ   CODE_128307           
CODE_128304:        JSR.w CODE_128398           
CODE_128307:        JSR.w CODE_128423           
                    RTS
                       
CODE_12830B:        LDA.w $04E0                 
                    CMP.b #$02                  
                    BCC   CODE_128319           
                    LDA.w $0554                 
                    STA.b $46                   
                    BNE   CODE_128345           
CODE_128319:        LDA.b $3C                   
                    BPL   CODE_128322           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_128322:        CMP.b #$08                  
                    LDA.b #$00                  
                    STA.w $0411                 
                    ROL   A                     
                    LDY.w $04CB                 
                    CPY.b #$3C                  
                    BCC   CODE_128335           
                    LDA.b #$00                  
                    STA.b $F6                   
CODE_128335:        ROL   A                     
                    ASL   A                     
                    ORA.b $9C                   
                    TAY                         
                    LDA.w $054E,y               
                    STA.b $46                   
                    LDA.w $0555                 
                    STA.w $04CA                 
CODE_128345:        LDA.b #$00                  
                    STA.w $04CB                 
                    RTS
                       
CODE_12834B:        LDA.w $04E0                 
                    CMP.b #$02                  
                    BCC   CODE_128357           
                    LDA.w $0558                 
                    BNE   CODE_128385           
CODE_128357:        LDA.w $0556                 
                    LDY.b $F6                   
                    BPL   CODE_12837D           
                    LDA.w $0557                 
                    LDY.b $46                   
                    CPY.b #$FC                  
                    BMI   CODE_12837D           
                    LDY.w $04CA                 
                    BEQ   CODE_12837D           
                    DEC.w $04CA                 
                    LDA.b $10                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    LDA   DATA_119B69,y               
                    STA.b $46                   
                    RTS
                       
CODE_12837D:        LDY.b $46                   
                    BMI   CODE_128385           
                    CPY.b #$39                  
                    BCS   CODE_12838A                   
CODE_128385:        CLC                         
                    ADC.b $46                   
                    STA.b $46                   
CODE_12838A:        LDA.w $04CA                 
                    CMP.w $0555                 
                    BEQ   CODE_128397           
                    LDA.b #$00                  
                    STA.w $04CA                 
CODE_128397:        RTS
                       
CODE_128398:        LDA.b $99                   
                    BNE   CODE_1283D0           
                    LDA.b $10                   
                    AND.w $0624                 
                    BNE   CODE_1283B9           
                    LDA.b $3C                   
                    AND.b #$80                  
                    ASL   A                     
                    ROL   A                     
                    TAY                         
                    LDA.b $3C                   
                    ADC   DATA_119B6D,y               
                    TAX                         
                    EOR   DATA_119B67,y               
                    BMI   CODE_1283B7           
                    LDX.b #$00                  
CODE_1283B7:        STX.b $3C                   
CODE_1283B9:        LDA.b $9A                   
                    BNE   CODE_1283D0           
                    LDA.b $C7                   
                    CMP.b #$09                  
                    BEQ   CODE_1283D0           
                    LDA.b #$02                  
                    STA.b $C7                   
                    LDA.b #$00                  
                    STA.b $84                   
                    STA.b $9B                   
                    STA.w $078B                 
CODE_1283D0:        RTS
                       
CODE_1283D1:        LDA.b $9A                   
                    BNE   CODE_128422           
                    LDA.b $99                   
                    BEQ   CODE_1283E7           
                    LDA.b $8F                   
                    CMP.b #$03                  
                    BNE   CODE_128422           
                    LDA.b $84                   
                    BNE   CODE_12841B           
                    LDA.b #$02                  
                    BNE   CODE_128402           

CODE_1283E7:        LDA.b $84                   
                    BNE   CODE_12841B           
                    LDA.b #$05                  
                    LDY.w $0624                 
                    BNE   CODE_128402           
                    LDA.b $3C                   
                    BPL   CODE_1283FB           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_1283FB:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA   DATA_119B6F,y               
CODE_128402:        STA.b $84                   
                    LDA.b #$02                  
                    STA.w $078C                 
                    DEC.w $078B                 
                    BPL   CODE_128413           
                    LDA.b #$02                  
                    STA.w $078B                 
CODE_128413:        DEC.b $9B                   
                    BPL   CODE_12841B           
                    LDA.b #$01                  
                    STA.b $9B                   
CODE_12841B:        LDY.b $9B                   
                    LDA   DATA_119B79,y               
                    STA.b $C7                   
CODE_128422:        RTS
                       
CODE_128423:        LDY.b #$02                  
                    LDA.w $04E0                 
                    CMP.b #$02                  
                    BCS   CODE_128443                   
                    DEY                         
                    LDA.b $9C                   
                    BEQ   CODE_128442           
                    LDX.w $042D                 
                    LDA.b $90,x                 
                    CMP.b #$32                  
                    BCC   CODE_128443           
                    CMP.b #$39                  
                    BCC   CODE_128442           
                    CMP.b #$3B                  
                    BCC   CODE_128443           
CODE_128442:        DEY                         
CODE_128443:        LDA.w $0559,y               
                    BIT.b $F6                   
                    BVC   CODE_12844F                   
                    LSR   A                     
                    CLC                         
                    ADC.w $0559,y               
CODE_12844F:        CMP.b $3C                   
                    BPL   CODE_128455           
                    STA.b $3C                   
CODE_128455:        LDA.w $055C,y               
                    BIT.b $F6                   
                    BVC   CODE_128462                   
                    SEC                         
                    ROR   A                     
                    CLC                         
                    ADC.w $055C,y               
CODE_128462:        CMP.b $3C                   
                    BMI   CODE_128468           
                    STA.b $3C                   
CODE_128468:        BIT.b $FA                   
                    BVC   CODE_1284BD                   
                    LDA.b $9C                   
                    BEQ   CODE_1284BD           
                    LDY.b #$00                  
                    LDX.w $042D                 
                    LDA.b $51,x                 
                    CMP.b #$06                  
                    BEQ   CODE_1284BD           
                    LDA.b $90,x                 
                    CMP.b #$39                  
                    BCC   CODE_128485           
                    CMP.b #$3A                  
                    BCC   CODE_12848B           
CODE_128485:        CMP.b #$37                  
                    BCC   CODE_1284BE           
                    LDY.b #$02                  
CODE_12848B:        STY.b $07                   
                    LDA.b $9D                   
                    ASL   A                     
                    ORA.b $9A                   
                    TAX                         
                    LDY.w $CB03,x               
                    LDX.w $042D                 
                    LDA.b #$36                  
                    CMP.b $90,x                 
                    BCS   CODE_1284AC                   
                    LDA.b $3C                   
                    BPL   CODE_1284A8           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_1284A8:        CMP.b #$08                  
                    BCC   CODE_1284AD           
CODE_1284AC:        INY                         
CODE_1284AD:        LDX.b #$00                  
                    JSL.l CODE_13F900           
                    LDA.b $00                   
                    LDY.b $07                   
                    JSL.l CODE_13F99C           
                    BCC   CODE_1284BE           
CODE_1284BD:        RTS
                       
CODE_1284BE:        LDA.b #$09                  
                    STA.b $C7                   
                    LDA.b #$02                  
                    STA.b $9B                   
                    LDA.b #$0A                  
                    STA.b $84                   
                    DEC.b $9C                   
                    LDA.b #$31                  
                    STA.w $1DE0                 
                    STZ.w $04AF                 
                    STZ.b $9A                   
                    STZ.b $FA                   
                    STZ.b $01                   
                    LDX.w $042D                 
                    LDA.b #$36                  
                    CMP.b $90,x                 
                    ROL.b $01                   
                    LDA.b $3C                   
                    BPL   CODE_1284EC           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_1284EC:        CMP.b #$08                  
                    ROL.b $01                   
                    BNE   CODE_128506           
                    LDY.b $9D                   
                    LDA   DATA_119B88,y               
                    CLC                         
                    ADC.b $29,x                 
                    STA.b $29,x                 
                    LDA.b $EB                   
                    BEQ   CODE_128506           
                    DEY                         
                    TYA                         
                    ADC.b $15,x                 
                    STA.b $15,x                 
CODE_128506:        LDY.b $01                   
                    LDA   DATA_119B84,y               
                    STA.b $47,x                 
                    LDA.b $01                   
                    ASL   A                     
                    ORA.b $9D                   
                    TAY                         
                    LDA   DATA_119B7C,y               
                    STA.b $3D,x                 
                    LDA.b #$01                  
                    STA.w $042F,x               
                    LSR   A                     
                    STA.b $A8,x                 
                    STZ.b $5B,x                 
                    RTS
                       
CODE_128523:        LDX.b #$0A                  
CODE_128525:        LDA.b $3C,x                 
                    CLC                         
                    ADC.w $04CC,x               
                    PHP                         
                    BPL   CODE_128533           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_128533:        PHA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    PLA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $0407,x               
                    STA.w $0407,x               
                    TYA                         
                    ADC.b #$00                  
                    PLP                         
                    BPL   CODE_128550           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_128550:        LDY.b #$00                  
                    CMP.b #$00                  
                    BPL   CODE_128557           
                    DEY                         
CODE_128557:        CLC                         
                    ADC.b $28,x                 
                    STA.b $28,x                 
                    TYA                         
                    ADC.b $14,x                 
                    STA.b $14,x                 
                    STZ.w $04CC,x               
                    RTS
                       
CODE_128565:        LDA.b #$00                  
                    STA.b $5A                   
                    STA.w $0624                 
                    STA.b $07                   
                    STA.b $0A                   
                    STA.b $0E                   
                    STA.b $0C                   
                    JSR.w CODE_12866A           
                    LDA.b $9A                   
                    ASL   A                     
                    ORA.b $9C                   
                    TAX                         
                    LDA.w DATA_11CAFD,x               
                    STA.b $08                   
                    LDA.b $46                   
                    CLC                         
                    ADC.w $04D6                 
                    BPL   CODE_128596           
                    JSR.w CODE_12861D           
                    JSR.w CODE_128662           
                    LDA.b $5A                   
                    BNE   CODE_1285E5           
                    BEQ   CODE_128600           
CODE_128596:        JSR.w CODE_128662           
                    JSR.w CODE_12861D           
                    LDA.b $5A                   
                    BNE   CODE_1285BA           
                    LDA.b #$00                  
                    LDX.b #$01                  
                    LDY.w $0635                 
                    CPY.b #$01                  
                    BEQ   CODE_1285AF           
                    CPY.b #$05                  
                    BNE   CODE_1285B2           
CODE_1285AF:        JSR.w CODE_129A0E           
CODE_1285B2:        STA.w $04E0                 
                    STX.b $99                   
                    JMP.w CODE_128600           

CODE_1285BA:        LDA.b #$00                  
                    STA.w $04E0                 
                    LDA.b $32                   
                    AND.b #$0C                  
                    BNE   CODE_128600           
                    STA.b $99                   
                    LDA.b $32                   
                    AND.b #$F0                  
                    STA.b $32                   
                    LSR.b $0A                   
                    BCC   CODE_1285D9           
                    LDX.b $0A                   
                    LDA.w DATA_119B9A,x               
                    STA.w $04CC                 
CODE_1285D9:        LSR.b $0C                   
                    BCC   CODE_1285E2           
                    LDA.b #$0F                  
                    STA.w $0624                 
CODE_1285E2:        JSR.w CODE_12877B           
CODE_1285E5:        LDA.b #$00                  
                    STA.b $46                   
                    STA.w $04D6                 
                    LDA.w $04E1                 
                    BNE   CODE_128600           
                    LSR.b $0E                   
                    BCC   CODE_128600           
                    LDA.w $0428                 
                    STA.w $0429                 
                    ROR.b $12                   
                    JSR.w CODE_129A52           
CODE_128600:        LDY.b #$02                  
                    LDA.b $3C                   
                    CLC                         
                    ADC.w $04CC                 
                    BMI   CODE_12860E           
                    DEY                         
                    JSR.w CODE_128662           
CODE_12860E:        STY.b $6E                   
                    JSR.w CODE_12861D           
                    LDA.b $5A                   
                    AND.b #$03                  
                    BEQ   CODE_12861C           
                    JSR.w CODE_128BD8           
CODE_12861C:        RTS
                       
CODE_12861D:        JSR.w CODE_128620           
CODE_128620:        LDX.b #$00                  
                    LDY.b $08                   
                    JSL.l CODE_13F900           
                    LDX.b $07                   
                    LDY.w DATA_119B8A,x               
                    LDA.b $00                   
                    JSL.l CODE_13F99C           
                    BCC   CODE_12865F           
                    CMP.b #$2E                  
                    BNE   CODE_128640           
                    LDA.w DATA_119B8A,x               
                    STA.b $0E                   
                    BNE   CODE_128658           

CODE_128640:        CMP.b #$26                  
                    BNE   CODE_12864B           
                    LDA.w DATA_119B8A,x               
                    STA.b $0C                   
                    BNE   CODE_128658           

CODE_12864B:        SEC                         
                    SBC.b #$60                  
                    CMP.b #$02                  
                    BCS   CODE_128658                   
                    ASL   A                     
                    ORA.w DATA_119B8A,x               
                    STA.b $0A                   
CODE_128658:        LDA.w DATA_119B92,x               
                    ORA.b $5A                   
                    STA.b $5A                   
CODE_12865F:        JMP.w CODE_128665           

CODE_128662:        JSR.w CODE_128665           
CODE_128665:        INC.b $07                   
                    INC.b $08                   
                    RTS
                       
CODE_12866A:        LDY.w $CB07                 
                    LDA.b $10                   
                    LSR   A                     
                    BCS   CODE_128673          
                    INY                         
CODE_128673:        LDX.b #$00                ; \ Prepare tile being touched by player.
                    JSR.w CODE_128195         ;  | Check if touching any of the climbing tiles.
                    BCS   CODE_1286A6         ; / If so, branch.
                    LDA.b $00                 ; \ If not cherry tile...
                    CMP.b #$4E                ;  |
                    BNE   CODE_1286CE         ; / branch.
                    INC.w $062A               ; Increment cherry counter.           
                    LDA.w $062A               ; \ If collected 5 times exactly...
                    SBC.b #$05                ;  |
                    BNE   CODE_128690         ;  | don't branch...
                    STA.w $062A               ; / And reset cherry counter.
                    JSR.w CODE_129945         ; Generate star man.
CODE_128690:        LDA.b #$3B                ; \ Collect cherry sound.
                    STA.w $1DE3               ; /
                    LDA.b $06                   
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.w $0212                 
                    LDA.b #$40                ; \ Clear tile.
                    JSL.l CODE_128BF4         ; /
                    RTS
                       
CODE_1286A6:        LDA.b $F6                 ; \ If not pressing Up/Down...
                    AND.b #$0C                ;  |
                    BEQ   CODE_1286CE         ; / Branch.
                    LDY.b $9C                 ; \ If player holding item...
                    BNE   CODE_1286CE         ; / branch.
                    LDA.b $28                 ; \ If not lining up completely with the vine...
                    CLC                       ;  | (horizontally)
                    ADC.b #$04                ;  |
                    AND.b #$0F                ;  |
                    CMP.b #$08                ;  |
                    BCS   CODE_1286CE         ; / return.    
                    LDA.b #$01                ; \ Player = climbing.
                    STA.b $50                 ; /
                    STZ.w $078C                 
                    STY.b $99                   
                    STY.b $9A                   
                    LDA.b #$0A                ; \ Climbing pose.
                    STA.b $C7                 ; /
                    PLA                         
                    PLA                         
                    PLA                         
                    PLA                         
CODE_1286CE:        RTS
                       
CODE_1286CF:        LDX.b #$06                ; \ Check if there's a free sprite slot.
CODE_1286D1:        LDA.b $51,x               ;  | If so ($51,x = #$00), branch.
                    BEQ   CODE_1286DB         ;  | (Break out of loop.)
                    INX                       ;  | Otherwise loop until...
                    CPX.b #$09                ;  | maximum is reached.
                    BCC   CODE_1286D1         ;  | If maximum, not reached, loop, otherwise...
                    RTS                       ; / ...end it.
                       
CODE_1286DB:        LDA.b $00                   
                    STA.b $79,x                 
                    LDA.b $03                   
                    STA.b $15,x                 
                    LDA.b $04                   
                    STA.b $1F,x                 
                    LDA.b $05                   
                    STA.b $29,x                 
                    LDA.b $06                   
                    STA.b $33,x                 
                    LDA.b #$00                  
                    STA.w $042F,x               
                    STA.b $9F,x                 
                    STA.b $B1,x                 
                    STA.w $0D00,x               
                    JSR.w CODE_1299D5           
                    LDA.b #$01                ; Sprite that is spawned will run main routine.
                    LDY.b $09                 ; \ If tile is not a sand tile...
                    CPY.b #$0E                ;  |
                    BNE   CODE_12870C         ; / branch.
                    LDA.b #$20                ; \ How long it takes for the sand digging animation to be done (the actual sprite tile)
                    STA.b $86,x               ; /
                    LDA.b #$06                ; \ Actually dig up the darn sand. Sprite number from table will be #$39 (mushroom block)
CODE_12870C:        STA.b $51,x               ; /
                    LDA   DATA_119B9F,y       ; \ Get sprite to spawn from table.
                    STA.b $90,x               ; /
                    CMP.b #$36                  
                    BNE   CODE_12871A           
                    STZ.w $079E                 
CODE_12871A:        LDY.b #$FF                  
                    CMP.b #$37                  
                    BEQ   CODE_128726           
                    CMP.b #$09                  
                    BNE   CODE_12872B           
                    LDY.b #$50                  
CODE_128726:        TYA                         
                    STA.b $86,x                 
                    BNE   CODE_128750           
CODE_12872B:        CMP.b #$40                  
                    BNE   CODE_12873B           
                    LDA.w $0620               ; \ If 1-Up has already been collected...
                    BEQ   CODE_128750         ;  |
                    LDA.b #$32                ;  | Pick up small vegetable instead.
                    STA.b $90,x               ; /
                    JMP.w CODE_128750           

CODE_12873B:        CMP.b #$33                  
                    BNE   CODE_128750           
                    LDY.w $062C                 
                    INY                         
                    CPY.b #$05                  
                    BCC   CODE_12874D           
                    LDA.b #$46                  
                    STA.b $90,x                 
                    LDY.b #$00                  
CODE_12874D:        STY.w $062C                 
CODE_128750:        JSR.w CODE_129978           
                    LDA.b #$04                  
                    STA.b $5B,x                 
                    LDA.b #$40                ; \ Tile to spawn when object is picked up = #$40.
                    JSL.l CODE_13FA0D         ; / (Empty tile.)
                    LDA.b #$07                  
                    STA.b $A8,x                 
                    STX.w $042D                 
                    LDA.b #$02                  
                    STA.b $50                   
                    LDA.b #$06                  
                    STA.b $82                   
                    LDA.b #$08                  
                    STA.b $C7                   
                    INC.b $9C                   
                    STZ.w $078C                 
                    LDA.b #$2B                  
                    STA.w $1DE0                 
                    RTS
                       
CODE_12877B:        LDY.b $9C                 ; \ If holding item...
                    BNE   CODE_1287F5         ; / branch.
                    LDA.b $9A                   
                    BEQ   CODE_1287CE           
                    LDA.b $00                 ; Get Map16 tile index.
                    LDX.w $0628               ; \ If not in potion room...       
                    CPX.b #$02                ;  |
                    BNE   CODE_128792         ; / branch.
                    CMP.b #$6F                ; \ If on warp jar, run 'entering jar' code.
                    BEQ   CODE_12879C         ; /
                    BNE   CODE_1287F5         ; Otherwise, branch.   
CODE_128792:        INY                       ; \ Y = #$01. (So you're not warping to another world, see $04EF.)
                    CMP.b #$6E                ;  | If tile 6E, Y stays #$01...
                    BEQ   CODE_12879C         ;  |
                    CMP.b #$6A                ;  | If tile 6A, Y becomes #$02   
                    BNE   CODE_1287F5         ;  | If neither, just return.
                    INY                       ; / Y = #$02.
CODE_12879C:        LDA.b $28                 ; \ If not...
                    CLC                       ;  | lining up exactly...
                    ADC.b #$04                ;  | with the middle of the jar...
                    AND.b #$0F                ;  |
                    CMP.b #$08                ;  |   
                    BCS   CODE_1287F5         ; / Return.           
                    LDA.b #$4D                ; \ Sound effect = going down jar.
                    STA.w $1DE3               ; /
                    LDA.b #$00                ; \ X speed = #$00    
                    STA.b $3C                 ; /
                    LDA.b #$04                ; \ Animation = #$04 (going down jar)    
                    STA.b $50                 ; /
                    STY.w $04EF               ; Store result from Y into $04EF.    
                    JSL.l CODE_1287BC           
                    RTS
                       
CODE_1287BC:        LDA.b $28                   
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $28                   
                    BCC   CODE_1287CD           
                    LDA.b $EB                   
                    BEQ   CODE_1287CD           
                    INC.b $14                   
CODE_1287CD:        RTL
                       
CODE_1287CE:        BIT.b $FA                   
                    BVC   CODE_1287F5                   
                    LDA.b $28                   
                    CLC                         
                    ADC.b #$06                  
                    AND.b #$0F                  
                    CMP.b #$0C                  
                    BCS   CODE_1287F5                   
                    LDA.b $00                   
                    CMP.b #$9D                  
                    BNE   CODE_1287E7           
                    LDA.b #$0E                  
                    BNE   CODE_1287F0           
CODE_1287E7:        CMP.b #$68                  
                    BCS   CODE_1287F5                   
                    SEC                         
                    SBC.b #$64                  
                    BCC   CODE_1287F5           
CODE_1287F0:        STA.b $09                   
                    JMP.w CODE_1286CF   
        
CODE_1287F5:        LDA.b $9A                   
                    BNE   CODE_128874           
                    LDA.b $06                   
                    SEC                         
                    SBC.b #$10                  
                    STA.b $06                   
                    STA.b $E6                   
                    LDA.b $04                   
                    SBC.b #$00                  
                    STA.b $04                   
                    STA.b $01                   
                    LDA.b $03                   
                    STA.b $02                   
                    JSR.w CODE_128B6D           
                    BCS   CODE_128874                   
                    LDX.b $03                   
                    PHX                         
                    JSR.w CODE_1299DB           
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$7000                
                    STA.b $C4                   
                    SEP   #$20                  
                    LDA.b $03                   
                    STA.b $C6                   
                    LDY.b $E7                   
                    LDA.b [$C4],y               
                    BEQ   CODE_128840           
                    LDA.b [$01],y               
                    CMP.b #$2B                  
                    BEQ   CODE_128840           
                    CMP.b #$2A                  
                    BEQ   CODE_128840           
                    TAX                         
                    LDA.l DATA_14CCBD,x             
                    BRA   CODE_128842           

CODE_128840:        LDA.b [$01],y               
CODE_128842:        PLX                         
                    STX.b $03                   
                    STA.b $00                   
                    LDX.b $9C                   
                    BEQ   CODE_128854           
                    LDX.w $042D                 
                    LDY.b $90,x                 
                    CPY.b #$3D                  
                    BNE   CODE_128874           
CODE_128854:        LDX.w $0628                 
                    CPX.b #$02                  
                    BEQ   CODE_128865           
                    LDY.b #$07                  
CODE_12885D:        CMP   DATA_119BAE,y               
                    BEQ   CODE_128896           
                    DEY                         
                    BPL   CODE_12885D           
CODE_128865:        BIT.b $FA                   
                    BVC   CODE_128874                   
                    STA.b $00                   
                    CMP.b #$4D                  
                    BCS   CODE_128874                   
                    SEC                         
                    SBC.b #$43                  
                    BCS   CODE_128875                   
CODE_128874:        RTS
                       
CODE_128875:        LDX.w $0628                 
                    CPX.b #$02                  
                    BNE   CODE_128889           
                    LDA.w $0621                 
                    CMP.b #$02                  
                    BCS   CODE_128888                   
                    INC.w $0622                 
                    LDX.b #$00                  
CODE_128888:        TXA                         
CODE_128889:        CLC                         
                    ADC.b #$04                  
                    STA.b $09                   
                    LDA.w $04AE                 
                    BEQ   CODE_128896           
                    JMP.w CODE_1286CF           

CODE_128896:        LDA.w $0778                 
                    INC   A                     
                    BEQ   CODE_128900           
                    LDA.b $FA                   
                    AND.b #$08                  
                    BEQ   CODE_128874           
                    JSL.l CODE_15D1C5           
                    BCS   CODE_1288EE        
                    LDA.b $00                   
                    CMP.w DATA_119BAF         
                    BNE   CODE_1288BC           
                    LDX.b $9C                   
                    BEQ   CODE_128874           
                    LDX.w $042D                 
                    LDA.b $90,x                 
                    CMP.b #$3D                  
                    BNE   CODE_128874           
CODE_1288BC:        LDA.b $28                   
                    CLC                         
                    ADC.b #$05                  
                    AND.b #$0F                  
                    CMP.b #$0A                  
                    BCS   CODE_128874                   
                    LDA.w $0500                 
                    STA.w $079D                 
                    LDA.b #$80                  
                    STA.w $0500                 
                    STA.w $079C                 
                    LDA.b $28                   
                    AND.b #$08                  
                    BEQ   CODE_1288E8           
                    LDA.b $28                   
                    CLC                         
                    ADC.b #$08                  
                    STA.b $28                   
                    LDA.b $14                   
                    ADC.b #$00                  
                    STA.b $14                   
CODE_1288E8:        LDA.b $28                   
                    AND.b #$F0                  
                    STA.b $28                   
CODE_1288EE:        LDA.b #$01                  
                    STA.w $04B3                 
                    STA.b $85                   
                    STZ.b $3C                   
                    STY.w $0778                 
                    STZ.w $0779                 
                    STZ.w $04BE                 
CODE_128900:        CPY.b #$04                  
                    BNE   CODE_128909           
                    DEY                         
                    STY.w $04ED                 
                    RTS
                       
CODE_128909:        LDA.w $0778                 
                    BMI   CODE_128918           
                    CMP.b #$05                  
                    BCC   CODE_128918           
                    LDA.b #$0F                  
                    STA.w $1DE3                 
                    RTS
                       
CODE_128918:        LDA.b #$01                  
                    STA.w $0536                 
                    TYA                         
                    JSL.l CODE_118776  

                    dw CODE_128B1D
                    dw CODE_128B30
                    dw CODE_128B4F
                    dw CODE_128B4F
                    dw CODE_128B4F
                    dw CODE_128B4F
                    dw CODE_128B4F
                    dw CODE_128B4F        
      
CODE_128932:        LDA.w $0778                 
                    CMP.b #$05                  
                    BEQ   CODE_12893E           
                    JSL.l CODE_15D03A           
                    RTL
                       
CODE_12893E:        JSR.w CODE_128942           
                    RTL
                       
CODE_128942:        LDA.b #$01                  
                    STA.b $85                   
                    STY.w $071E                 
                    LDA.w $0779                 
                    JSL.l CODE_118776   

                    dw CODE_128958
                    dw CODE_12896E
                    dw CODE_128AA2
                    dw CODE_128995  
             
CODE_128958:        STZ.w $077A                 
                    INC.w $0779                 
                    LDA.w $04E1                 
                    STA.w $077B                 
                    STZ.w $04E1                 
                    STZ.w $04CB                 
                    INC.w $041B                 
                    RTS
                       
CODE_12896E:        LDA.b #$C0                  
                    STA.w $071C                 
                    LDA.b #$01                  
                    STA.w $071D                 
                    STA.w $071F                 
                    LDA.b #$E0                  
                    STA.w $071E                 
                    JSR.w CODE_1289DD           
                    INC.w $077A                 
                    LDA.w $077A                 
                    CMP.b #$10                  
                    BCS   CODE_12898E                   
                    RTS
                       
CODE_12898E:        INC.w $0779                 
                    STZ.w $077A                 
                    RTS
                       
CODE_128995:        LDA.b #$20                  
                    STA.w $071C                 
                    LDA.b #$00                  
                    STA.w $071D                 
                    STA.w $071F                 
                    LDA.b #$40                  
                    STA.w $071E                 
                    JSR.w CODE_1289DD           
                    DEC.w $077A                 
                    LDA.w $077A                 
                    BMI   CODE_1289B3           
                    RTS
                       
CODE_1289B3:        LDA.b #$FF                  
                    STA.w $0778                 
                    LDA.w $077B                 
                    STA.w $04E1                 
                    STZ.w $041B                 
                    LDA.b #$10                  
                    STA.w $1DE3                 
                    LDA.w $04CC                 
                    BEQ   CODE_1289CC           
                    NOP                         
CODE_1289CC:        RTS
                       
DATA_1289CD:        db $48,$58,$49,$59,$4A,$5A,$4B,$5B
                    db $4C,$5C,$4D,$5D,$4E,$5E,$4F,$5F
          
CODE_1289DD:        PHY
                    PHX               
                    LDA.w $077A                 
                    AND.b #$0C                  
                    XBA                         
                    LDA.b #$00                  
                    XBA                         
                    REP   #$10                  
                    TAX                         
                    LDY.w $071C                 
                    LDA.b #$22                  
                    JSR.w CODE_128A45           
                    LDA.l DATA_1289CD,x             
                    STA.w $0802,y               
                    STA.w $0812,y               
                    INX                         
                    LDA.l DATA_1289CD,x             
                    STA.w $0806,y               
                    STA.w $0816,y               
                    INX                         
                    LDA.l DATA_1289CD,x             
                    STA.w $080A,y               
                    STA.w $081A,y               
                    INX                         
                    LDA.l DATA_1289CD,x             
                    STA.w $080E,y               
                    STA.w $081E,y               
                    LDY.w $071E                 
                    LDA.b #$20                  
                    JSR.w CODE_128A45           
                    LDA.b #$E4                  
                    STA.w $0802,y               
                    STA.w $0812,y               
                    STA.w $0806,y               
                    STA.w $0816,y               
                    STA.w $080A,y               
                    STA.w $081A,y               
                    STA.w $080E,y               
                    STA.w $081E,y               
                    SEP   #$10                  
                    PLX                         
                    PLY                         
                    RTS
                       
CODE_128A45:        STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $080B,y               
                    STA.w $080F,y               
                    ORA.b #$40                  
                    STA.w $0813,y               
                    STA.w $0817,y               
                    STA.w $081B,y               
                    STA.w $081F,y               
                    LDA.w $0428                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    STA.w $0808,y               
                    STA.w $080C,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0810,y               
                    STA.w $0814,y               
                    STA.w $0818,y               
                    STA.w $081C,y               
                    LDA.w $042B                 
                    STA.w $0801,y               
                    STA.w $0811,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    STA.w $0815,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0809,y               
                    STA.w $0819,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $080D,y               
                    STA.w $081D,y               
                    RTS
                       
CODE_128AA2:        REP   #$30                  
                    STZ.w $0720                 
                    LDX.w #$0100                
CODE_128AAA:        LDA.w $0B00,x               
                    STA.w $071C                 
                    AND.w #$7C00                
                    BEQ   CODE_128ABF           
                    LDA.w $071C                 
                    SEC                         
                    SBC.w #$0400                
                    STA.w $071C                 
CODE_128ABF:        LDA.w $071C                 
                    AND.w #$03E0                
                    BEQ   CODE_128AD1           
                    LDA.w $071C                 
                    SEC                         
                    SBC.w #$0020                
                    STA.w $071C                 
CODE_128AD1:        LDA.w $071C                 
                    AND.w #$001F                
                    BEQ   CODE_128ADC           
                    DEC.w $071C                 
CODE_128ADC:        LDA.w $071C                 
                    STA.w $0B00,x               
                    TSB.w $0720                 
                    INX                         
                    INX                         
                    CPX.w #$0120                
                    BNE   CODE_128AAA           
                    SEP   #$30                  
                    INC.w $02A9                 
                    LDA.b #$0F                  
                    STA.w $077A                 
                    LDA.b #$20                  
                    STA.w $071C                 
                    LDA.b #$01                  
                    STZ.w $071D                 
                    STA.w $071F                 
                    LDA.b #$E0                  
                    STA.w $071E                 
                    JSR.w CODE_1289DD           
                    LDA.w $0720                 
                    ORA.w $0721                 
                    BEQ   CODE_128B14           
                    RTS
                       
CODE_128B14:        INC.w $0779                 
                    LDA.b #$0F                  
                    STA.w $077A                 
                    RTS
                       
CODE_128B1D:        JSR.w CODE_1298DD           
CODE_128B20:        INC.w $04BE                 
                    INC.w $041B                 
                    JSL.l CODE_1287BC           
                    LDA.b #$0F                  
                    STA.w $1DE3                 
CODE_128B2F:        RTS
                       
CODE_128B30:        STZ.w $0778                 
                    LDA.b $9C                   
                    BEQ   CODE_128B2F           
                    LDY.w $042D                 
                    LDA.w $90,y               
                    CMP.b #$3D                  
                    BNE   CODE_128B2F           
                    INC.w $04B0                 
                    TYA                         
                    TAX                         
                    JSR.w CODE_1299C0           
                    JSR.w CODE_1298D9           
                    JMP.w CODE_128B20           

CODE_128B4F:        STZ.w $0778                 
                    INC.w $0627                 
                    RTS
                       
CODE_128B56:        STA.b $0F                   
                    TYA                         
                    BMI   CODE_128B6C           
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $0F                   
                    BCS   CODE_128B68                   
                    CMP.b #$F0                  
                    BCC   CODE_128B6C           
CODE_128B68:        CLC                         
                    ADC.b #$10                  
                    INY                         
CODE_128B6C:        RTS
                       
CODE_128B6D:        LDY.b $01                   
                    LDA.b $E6                   
                    JSR.w CODE_128B56           
                    STY.b $01                   
                    STA.b $E6                   
                    LDY.b $EB                   
                    LDA.w $01,y               
                    STA.b $E9                   
                    LDA.b $02                   
                    CMP   DATA_119BB7,y               
                    BCS   CODE_128B8B                   
                    LDA.b $01                   
                    CMP   DATA_119BB6,y               
CODE_128B8B:        RTS
                       
                    LDX.b $D8                   
                    BNE   CODE_128BBA           
                    LDA.b $50                   
                    CMP.b #$02                  
                    BCS   CODE_128BBA                   
                    LDA.w $042B                 
                    LDY.w $042A                 
                    BMI   CODE_128BA8           
                    BNE   CODE_128BAE           
                    CMP.b #$B4                  
                    BCS   CODE_128BAE                   
                    CMP.b #$21                  
                    BCS   CODE_128BB0                   
CODE_128BA8:        LDY.b $99                   
                    BNE   CODE_128BB0           
                    BEQ   CODE_128BAF           
CODE_128BAE:        INX                         
CODE_128BAF:        INX                         
CODE_128BB0:        LDA.w $0425                 
                    STX.w $0425                 
                    BNE   CODE_128BBA           
                    STX.b $D8                   
CODE_128BBA:        RTS
                       
CODE_128BBB:        LDA.b $EB                   
                    BEQ   CODE_128BCC           
                    LDA.w $0428                 
                    LDY.b $6E                   
                    CPY.b #$01                  
                    BEQ   CODE_128BCD           
                    CMP.b #$08                  
                    BCC   CODE_128BD1           
CODE_128BCC:        RTS
                       
CODE_128BCD:        CMP.b #$E8                  
                    BCC   CODE_128BCC           
CODE_128BD1:        LDA.b $5A                   
                    ORA   DATA_119BB8,y               
                    STA.b $5A                   
CODE_128BD8:        LDX.b #$00                  
                    LDY.b $6E                   
                    LDA.b $3C                   
                    EOR   DATA_119BBA,y               
                    BPL   CODE_128BE5           
                    STX.b $3C                   
CODE_128BE5:        LDA.w $04CC                 
                    EOR   DATA_119BBA,y               
                    BPL   CODE_128BF0           
                    STX.w $04CC                 
CODE_128BF0:        STX.w $0407                 
                    RTS
                       
CODE_128BF4:        STX.w $0210                 
                    PHA                         
                    JSR.w CODE_1299DB           
                    PLA                         
                    LDY.b $E7                   
                    STA.b [$01],y               
                    PHA                         
                    LDX.w $0300                 
                    LDA.b #$00                  
                    STA.w $0302,x               
                    LDA.b $EB                   
                    BNE   CODE_128C14           
                    LDA.w $0212                 
                    CLC                         
                    ADC.b $E5                   
                    TAY                         
CODE_128C14:        TYA                         
                    AND.b #$F0                  
                    ASL   A                     
                    ROL.w $0302,x               
                    ASL   A                     
                    ROL.w $0302,x               
                    STA.w $0303,x               
                    TYA                         
                    AND.b #$0F                  
                    ASL   A                     
                    ADC.w $0303,x               
                    STA.w $0303,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $030B,x               
                    PHX                         
                    JSR.w CODE_128CAE           
                    JSR.w CODE_128CFE           
                    PLX                         
                    LDA.w $0228                 
                    BEQ   CODE_128C4A           
                    CPY.b #$00                  
                    BEQ   CODE_128C48           
                    LDA.w $0302,x               
                    BRA   CODE_128C56           

CODE_128C48:        LDY.b #$01                  
CODE_128C4A:        LDA   DATA_119BBD,y               
                    CLC                         
                    ADC.w $0302,x               
                    AND.b #$0F                  
                    STA.w $0302,x               
CODE_128C56:        STA.w $030A,x               
                    REP   #$20                  
                    LDA.w #$0300                
                    STA.w $0304,x               
                    STA.w $030C,x               
                    SEP   #$20                  
                    PLA                         
                    PHA                         
                    AND.b #$C0                  
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDA   DATA_11AD64,y       ; \ Prepare pointer for the Layer 1 tilemap, page 0.
                    STA.b $00                 ;  |
                    LDA   DATA_11AD68,y       ;  |
                    STA.b $01                 ; /
                    PLA                         
                    REP   #$30                  
                    AND.w #$003F                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b ($00),y               
                    STA.w $0306,x               
                    INY                         
                    INY                         
                    LDA.b ($00),y               
                    STA.w $0308,x               
                    INY                         
                    INY                         
                    LDA.b ($00),y               
                    STA.w $030E,x               
                    INY                         
                    INY                         
                    LDA.b ($00),y               
                    STA.w $0310,x               
                    SEP   #$30                  
                    LDA.b #$FF                  
                    STA.w $0312,x               
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0300                 
                    LDX.w $0210                 
                    RTL
                       
CODE_128CAE:        STZ.w $0228                 
                    LDA.b $EB                   
                    BNE   CODE_128CFD           
                    LDA.w $0535                 
                    BEQ   CODE_128CFD           
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.w $0303,x               
                    CLC                         
                    ADC   DATA_119C14,y               
                    STA.w $0303,x               
                    BCC   CODE_128CCC           
                    INC.w $0302,x               
CODE_128CCC:        CLC                         
                    ADC.b #$20                  
                    STA.w $030B,x               
                    LDA.w $0302,x               
                    CLC                         
                    ADC   DATA_119C11,y               
                    CMP.b #$04                  
                    BMI   CODE_128CFA           
                    CMP.b #$08                  
                    BMI   CODE_128CE7           
                    CMP.b #$0C                  
                    BPL   CODE_128CF7           
                    BRA   CODE_128CFA           

CODE_128CE7:        CLC                         
                    ADC.b #$04                  
                    CMP.b #$0C                  
                    BPL   CODE_128CFA           
                    PHX                         
                    LDX.b #$01                  
                    STX.w $0228                 
                    PLX                         
                    BRA   CODE_128CFA           

CODE_128CF7:        SEC                         
                    SBC.b #$0C                  
CODE_128CFA:        STA.w $0302,x               
CODE_128CFD:        RTS
                       
CODE_128CFE:        LDA.b $EB                   
                    ASL   A                     
                    TAY                         
                    BEQ   CODE_128D0D           
                    LDA.b $01                   
                    AND.b #$10                  
                    BNE   CODE_128D70           
                    INY                         
                    BRA   CODE_128D70           

CODE_128D0D:        JSR.w CODE_128F33           
                    LDY.b #$00                  
                    REP   #$20                  
                    LDA.w $E7                 
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $01                   
                    AND.w #$0FF0                
                    STA.w $0226                 
                    LDA.w $0535                 
                    AND.w #$00FF                
                    BEQ   CODE_128D2F           
                    LSR   A                     
                    LSR   A                     
                    INC   A                     
                    ASL   A                     
CODE_128D2F:        TAX                         
                    LDA.w $0226                 
                    CMP.w DATA_119C09,x               
                    BCS   CODE_128D41                   
                    CLC                         
                    ADC.w #$0200                
                    STA.w $0226                 
                    BRA   CODE_128D4F
           
CODE_128D41:        CMP.w DATA_119C01,x               
                    BMI   CODE_128D4F           
                    SEC                         
                    SBC.w #$0200                
                    STA.w $0226                 
                    BRA   CODE_128D41           

CODE_128D4F:        TXA                         
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDA.w $0226                 
CODE_128D5A:        CMP.w DATA_119BC1,x               
                    BMI   CODE_128D64           
                    INX                         
                    INX                         
                    INY                         
                    BRA   CODE_128D5A           

CODE_128D64:        TYA                         
                    AND.w #$00FF                
                    LSR   A                     
                    LSR   A                     
                    EOR.w #$0001                
                    TAY                         
                    SEP   #$20                  
CODE_128D70:        RTS
                       
CODE_128D71:        LDA.w $0511                 
                    STA.b $14                   
                    LDA.w $0513                 
                    STA.b $28                   
                    LDA.w $0512                 
                    STA.b $1E                   
                    LDA.w $0514                 
                    STA.b $32                   
                    LDA.b $28                   
                    SEC                         
                    SBC.w $04C1                 
                    STA.w $0428                 
                    LDA.b $32                   
                    SEC                         
                    SBC.b $CB                   
                    STA.w $042B                 
                    LDA.b $1E                   
                    SBC.b $CA                   
                    STA.w $042A                 
                    LDA.w $0536                 
                    SEC                         
                    SBC.b #$04                  
                    BNE   CODE_128DB5           
                    STA.b $50                   
                    STA.w $041B                 
                    STA.w $04B7                 
                    JSR.w CODE_1298DD           
                    LDA.b #$0A                  
                    STA.w $04B3                 
CODE_128DB5:        RTL
                       
CODE_128DB6:        LDA.w $0536                 
                    CMP.b #$02                  
                    BNE   CODE_128DC9           
                    LDA.w $04EF                 
                    BNE   CODE_128DC9           
                    JSL.l CODE_128D71           
                    JMP.w CODE_128E0D           

CODE_128DC9:        LDA.w $0535                 
                    LDY.b #$00                  
                    LDX.b $EB                   
                    BNE   CODE_128DD8           
                    STY.b $14                   
                    STA.b $1E                   
                    BEQ   CODE_128DDC           
CODE_128DD8:        STA.b $14                   
                    STY.b $1E                   
CODE_128DDC:        JSR.w CODE_128E15           
                    LDY.b $1E                   
                    LDA.b $32                   
                    JSL.l CODE_128F1F           
                    STY.b $1E                   
                    STA.b $32                   
                    LDA.b $28                   
                    SEC                         
                    SBC.w $04C1                 
                    STA.w $0428                 
                    LDA.b $32                   
                    SEC                         
                    SBC.b $CB                   
                    STA.w $042B                 
                    LDA.b $1E                   
                    SBC.b $CA                   
                    STA.w $042A                 
                    LDA.w $0536                 
                    CMP.b #$04                  
                    BNE   CODE_128E0D           
                    JSR.w CODE_1298DD           
CODE_128E0D:        LDA.b $28                   
                    SEC                         
                    SBC.b #$78                  
                    STA.b $BA                   
                    RTL
                       
CODE_128E15:        LDA.w $0536                 
                    JSL.l CODE_118776   

                    dw CODE_128E28
                    dw CODE_128E60
                    dw CODE_128ECD
                    dw CODE_128EDA
                    dw CODE_128EFC
                    dw CODE_128F17
             
CODE_128E28:        LDA.b #$01                  
                    STA.b $9D                   
                    JSR.w CODE_128ED1           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $E5                   
                    LDA.b #$D0                ; \ Player Y position = #$D0.
                    STA.b $32                 ; /
                    STA.b $E6                   
                    LDA.w $0535                 
                    STA.b $E9                   
                    LDA.b #$0C                  
                    STA.b $04                   
CODE_128E44:        JSR.w CODE_1299DB           
                    LDY.b $E7                   
                    LDA.b [$01],y             ; \ If tile is...
                    CMP.b #$40                ;  | a blank tile...
                    BEQ   CODE_128E58         ; / Skip, don't JSR.
                    JSR.w CODE_128E58           
                    STA.b $E6                   
                    DEC.b $04                   
                    BNE   CODE_128E44           
CODE_128E58:        LDA.b $32                   
                    SEC                         
                    SBC.b #$10                  
                    STA.b $32                   
                    RTS
                       
CODE_128E60:        LDA.b $28                   
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    EOR.b #$F0                  
                    STA.b $28                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $E5                   
                    LDA.b #$E0                  
                    STA.b $32                   
                    STA.b $E6                   
                    LDA.w $0535                 
                    STA.b $E9                   
                    LDA.b #$0D                  
                    STA.w $0715                 
CODE_128E81:        JSR.w CODE_1299DB           
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$7000                
                    STA.b $C4                   
                    SEP   #$20                  
                    LDA.b $03                   
                    STA.b $C6                   
                    LDY.b $E7                   
                    LDA.b [$C4],y               
                    STA.w $0712                 
                    LDA.b [$01],y               
                    LDY.b #$08                  
CODE_128E9F:        CMP.w DATA_119BAD,y               
                    BNE   CODE_128EB1           
                    CMP.b #$2A                  
                    BEQ   CODE_128EAC           
                    CMP.b #$2B                  
                    BNE   CODE_128EC4           
CODE_128EAC:        LDA.w $0712                 
                    BNE   CODE_128EC4           
CODE_128EB1:        DEY                         
                    BNE   CODE_128E9F           
                    DEC.w $0715                 
                    BEQ   CODE_128EC1           
                    JSR.w CODE_128E58           
                    STA.b $E6                   
                    JMP.w CODE_128E81           

CODE_128EC1:        JSR.w CODE_128ED1           
CODE_128EC4:        JSR.w CODE_128E58           
                    LDA.b #$00                  
                    STA.w $041B                 
                    RTS
                       
CODE_128ECD:        LDA.b #$00                  
                    STA.b $32                   
CODE_128ED1:        LDA.b #$01                  
                    STA.b $99                   
                    LDA.b #$78                  
                    STA.b $28                   
                    RTS
                       
CODE_128EDA:        LDA.b $28                   
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    EOR.b #$F0                  
                    STA.b $28                   
                    LDA.w $042B                 
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    EOR.b #$10                  
                    STA.b $32                   
                    CMP.b #$F0                  
                    BEQ   CODE_128EF7           
                    DEC.b $1E                   
CODE_128EF7:        LDA.b #$0A                  
                    STA.b $C7                   
                    RTS
                       
CODE_128EFC:        LDA.w $0428                 
                    SEC                         
                    SBC.b $BA                   
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$F1                  
                    STA.b $28                   
                    LDA.w $042B                 
                    STA.b $32                   
                    DEC.w $041B                 
                    LDA.b #$60                ; \ How long the potion room lasts.
                    STA.w $04B7               ; /
                    RTS
                       
CODE_128F17:        JSR.w CODE_128ED1           
                    LDA.b #$60                  
                    STA.b $32                   
                    RTS
                       
CODE_128F1F:        CPY.b #$00                  
                    BMI   CODE_128F32           
                    PHA                         
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $0F                   
                    PLA                         
                    SEC                         
                    SBC.b $0F                   
                    BCS   CODE_128F32                   
                    DEY                         
CODE_128F32:        RTL
                       
CODE_128F33:        LDX.b $E9                   
                    LDA.w $0534                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    RTS
                       
CODE_128F48:        JSL.l CODE_1387D8           
                    JSL.l CODE_138846           
CODE_128F50:        LDA.b #$FF                  
                    STA.w $0302                 
                    STA.l $7F0002               
                    LDA.b #$13                  
                    STA.w $0243                 
                    LDA.b #$03                  
                    STA.w $024C                 
                    LDA.b #$02                  
                    STA.w $0775                 
                    JSL.l CODE_14F953           
                    JSL.l CODE_13DC5E           
                    LDA.b #$40                  
                    STA.w $0100                 
                    LDA.b #$80                  
                    STA.b $FF                   
                    STA.b $FE                   
                    LDA.b #$81                  
                    STA.w $4200                 
                    JSL.l CODE_14F908           
                    LDA.b #$01                ; \ Load border of the 'Super Mario Bros 2.' intro screen.
                    STA.b $11                 ;  |
                    JSL.l CODE_14F908         ; /
                    LDA.b #$02                ; \ Load 'Super Mario Bros. 2' and '?1988-1992 Nintendo.'
                    STA.b $11                 ;  |
                    JSL.l CODE_14F908         ; /
                    JSL.l CODE_14D84E           
                    LDA.b #$11                ; \ Story music.
                    STA.w $1DE2               ; /
                    JSL.l CODE_1195D1           
                    LDA.b #$03                  
                    STA.b $10                   
                    LDA.b #$25                  
                    STA.w $0210                 
                    LDA.b #$0C                  
                    STA.b $14                   
                    LDA.b #$A7                  
                    STA.b $15                   
                    LDA.b #$62                  
                    STA.b $16                   
                    STZ.b $19                   
                    STZ.b $17                   
                    STZ.b $18                   
                    STZ.b $1A                   
CODE_128FBE:        JSL.l CODE_14F908           
                    LDA.b $17                   
                    BNE   CODE_12900E           
CODE_128FC6:        INC.b $10                   
                    LDA.b $10                   
                    AND.b #$0F                  
                    BEQ   CODE_128FD1           
CODE_128FCE:        BRL   CODE_129069
           
CODE_128FD1:        DEC.w $0210                 
                    LDA.w $0210                 
                    CMP.b #$06                  
                    BNE   CODE_128FCE           
                    INC.b $17                   
                    LDA.b $14                   
                    STA.w $0302                 
                    LDA.b $15                   
                    STA.w $0303                 
                    LDA.b $16                   
                    AND.b #$C0                  
                    STA.w $0304                 
                    LDA.b $16                   
                    AND.b #$3F                  
                    STA.w $0305                 
                    LDA.b #$C6                  
                    STA.b $15                   
                    LDA.b #$66                  
                    STA.b $16                   
                    LDA.b #$BD                  
                    STA.w $0306                 
                    LDA.b #$09                  
                    STA.w $0307                 
                    LDA.b #$FF                  
                    STA.w $0308                 
                    BRA   CODE_129069           

CODE_12900E:        LDA.b $14                   
                    STA.w $0302                 
                    LDA.b $15                   
                    STA.w $0303                 
                    LDA.b $16                   
                    AND.b #$C0                  
                    STA.w $0304                 
                    LDA.b $16                   
                    AND.b #$3F                  
                    STA.w $0305                 
                    LDA.b #$BD                  
                    STA.w $0306                 
                    LDA.b #$09                  
                    STA.w $0307                 
                    LDA.b #$FF                  
                    STA.w $0308                 
                    LDA.b $14                   
                    CMP.b #$0D                  
                    BNE   CODE_129046           
                    LDA.b $15                   
                    CMP.b #$E0                  
                    BCS   CODE_129046                   
                    LDA.b #$28                  
                    STA.w $0305                 
CODE_129046:        LDA.b $15                   
                    CLC                         
                    ADC.b #$20                  
                    STA.b $15                   
                    LDA.b $14                   
                    ADC.b #$00                  
                    STA.b $14                   
                    CMP.b #$0E                  
                    BNE   CODE_129069           
                    LDA.b $15                   
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BNE   CODE_129069           
                    LDA.b #$20                  
                    STA.b $10                   
                    JSL.l CODE_14F908           
                    BRA   CODE_12908D           

CODE_129069:        LDA.b $FA                   
                    AND.b #$10                  
                    BEQ   CODE_129072           
                    BRL   CODE_12916C           

CODE_129072:        LDA.b $FC                   
                    AND.b #$40                  
                    STA.w $0712                 
                    LDA.b $FA                   
                    AND.b #$40                  
                    ORA.w $0712                 
                    BEQ   CODE_12908A           
                    JSL.l CODE_1195C0           
                    JML.l CODE_0080DE           

CODE_12908A:        BRL   CODE_128FBE           

CODE_12908D:        JSL.l CODE_14F908           
                    LDA.b $19                   
                    BEQ   CODE_129098           
                    BRL   CODE_129166           

CODE_129098:        LDA.b $18                   
                    CMP.b #$09                  
                    BEQ   CODE_1290D1           
                    LDA.b $18                   
                    BNE   CODE_1290E2           
                    DEC.b $10                   
                    BMI   CODE_1290A9           
                    BRL   CODE_129166           

CODE_1290A9:        LDA.b #$0C                  
                    STA.w $0302                 
                    LDA.b #$8E                  
                    STA.w $0303                 
                    STZ.w $0304                 
                    LDA.b #$09                  
                    STA.w $0305                 
                    LDX.b #$08                  
CODE_1290BD:        REP   #$20                  
                    LDA.l DATA_15E835,x             
                    STA.w $0306,x               
                    SEP   #$20                  
                    DEX                         
                    DEX                         
                    BPL   CODE_1290BD           
                    LDA.b #$FF                  
                    STA.w $0310                 
CODE_1290D1:        INC.b $18                   
                    LDA.b #$0C                  
                    STA.b $14                   
                    LDA.b #$E6                  
                    STA.b $15                   
                    LDA.b #$40                  
                    STA.b $1A                   
CODE_1290DF:        BRL   CODE_129166           

CODE_1290E2:        DEC.b $1A                 ; \ If timer is not positive (00-7F)...
                    BPL   CODE_1290DF         ; / Load next line.
                    LDA.b #$40                ; \ Amount of frames to wait for next line = #$40
                    STA.b $1A                 ; /
                    LDA.b $14                   
                    STA.w $0302                 
                    LDA.b $15                   
                    STA.w $0303                 
                    STZ.w $0304                 
                    LDA.b #$27                  
                    STA.w $0305                 
                    LDX.b $18                   
                    DEX                         
                    LDA.b #$15                ; \ Bank num = $15.
                    STA.b $05                 ;  |
                    LDA   PNTR_15E83F,x       ;  | Get address of tables...
                    STA.b $04                 ;  | ...which contain the 'Story' data...
                    LDA   PNTR_15E850,x       ;  | into [$03]
                    STA.b $03                 ; /
                    LDY.b #$00                  
                    LDX.b #$13                  
CODE_129113:        REP   #$20                  
                    LDA.b [$03],y               
                    STA.w $0306,y               
                    SEP   #$20                  
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_129113           
                    LDA.b #$FF                  
                    STA.w $0306,y               
                    INC.b $18                   
                    LDA.b $15                   
                    CLC                         
                    ADC.b #$40                  
                    STA.b $15                   
                    LDA.b $14                   
                    ADC.b #$00                  
                    STA.b $14                   
                    LDA.b $18                   
                    CMP.b #$09                  
                    BCC   CODE_129166           
                    BNE   CODE_129157           
                    LDA.b #$09                  
                    STA.w $0210                 
                    LDA.b #$03                  
                    STA.b $10                   
                    LDA.b #$0C                  
                    STA.b $14                   
                    LDA.b #$A7                  
                    STA.b $15                   
                    LDA.b #$62                  
                    STA.b $16                   
                    STZ.b $17                   
                    BRL   CODE_128FC6           

CODE_129157:        CMP.b #$12                  
                    BCC   CODE_129166           
                    INC.b $19                   
                    LDA.b #$25                  
                    STA.w $0210                 
                    LDA.b #$03                  
                    STA.b $10                   
CODE_129166:        LDA.b $FA                   
                    AND.b #$10                  
                    BEQ   CODE_129192           
CODE_12916C:        LDA.b #$80                  
                    STA.w $1DE2                 
                    JSL.l CODE_14F908           
                    LDA.l $701FF2               
                    BEQ   CODE_12917D           
                    BRA   CODE_1291A2           

CODE_12917D:        LDA.b #$29                  
                    STA.w $1DE3                 
                    LDA.b #$00                  
                    TAY                         
CODE_129185:        STA.w $00,y               
                    INY                         
                    CPY.b #$F0                  
                    BCC   CODE_129185           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    RTL
                       
CODE_129192:        LDA.b $FC                   
                    AND.b #$40                  
                    STA.w $0712                 
                    LDA.b $FA                   
                    AND.b #$40                  
                    ORA.w $0712                 
                    BEQ   CODE_1291AA           
CODE_1291A2:        JSL.l CODE_1195C0           
                    JML.l CODE_0080DE           

CODE_1291AA:        LDA.b $19                   
                    BEQ   CODE_1291C2           
                    INC.b $10                   
                    LDA.b $10                   
                    AND.b #$0F                  
                    BNE   CODE_1291C2           
                    DEC.w $0210                 
                    LDA.w $0210                 
                    CMP.b #$14                  
                    BNE   CODE_1291C2           
                    BEQ   CODE_1291C5           
CODE_1291C2:        BRL   CODE_12908D           

CODE_1291C5:        JSL.l CODE_1195C0           
                    JSL.l CODE_14F900           
                    STZ.w $4200                 
                    LDA.l $701FF2               
                    BEQ   CODE_1291DA           
                    JML.l CODE_008139           

CODE_1291DA:        BRL   CODE_128F50           

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF          ; Empty data.
             
CODE_1291E4:        LDA.b #$80                ; Force blank.
                    BRA   CODE_1291EA           

                    LDA.b #$0F                ; \ Full brightness.
CODE_1291EA:        STA.b $FE                 ; /
CODE_1291EC:        LDA.b $11               
                    ASL   A              
                    TAX                         
                    LDA.w PNTR_119C17,x               
                    STA.b $F0                   
                    LDA.w PNTR_119C17+1,x               
                    STA.b $F1                   
                    LDA.b #$11                  
                    STA.b $F2                   
                    STZ.w $0154                 
CODE_129201:        LDA.w $0154                 
                    BPL   CODE_129201           
                    JSL.l CODE_14FA99           
                    CLI                         
                    RTS
                       
CODE_12920C:        STZ.b $E6                   
CODE_12920E:        JSR.w CODE_1291EC           
                    JSR.w CODE_129510           
                    LDA.b $E6                   
                    BEQ   CODE_12920E           
                    JSL.l CODE_14F92E           
                    JSL.l CODE_14F953           
                    JSL.l CODE_138887           
                    JSL.l CODE_13E25B           
                    JSL.l CODE_14D9CD           
                    LDA.b #$40                  
                    STA.w $0100                 
                    LDA.b #$B0                  
                    STA.b $FF                   
                    JSR.w CODE_1291EC           
                    LDA.b #$01                  
                    STA.b $11                   
                    JSR.w CODE_1291EC           
                    LDA.b #$01                  
                    STA.b $E5                   
                    LDA.b #$60                ; \ Amount of frames the 'pulling fairies out of jar' cutscene is going to take.
                    STA.b $83                 ; /
                    LDA.b #$01                ; \ Player direction to face.
                    STA.b $9D                 ; /
                    STA.w $078D                 
                    STZ.b $50                   
                    STZ.b $8E                   
                    STZ.w $04CB                 
                    STZ.b $E6                   
                    STZ.w $0400                 
                    LDX.b #$09                  
CODE_12925C:        LDA.w DATA_11A3EC,x               
                    STA.b $28,x                 
                    LDA.w DATA_11A3F6,x               
                    STA.b $32,x                 
                    LDA.w DATA_11A400,x               
                    STA.b $3C,x                 
                    LDA.w DATA_11A40A,x               
                    STA.b $46,x                 
                    LDA.w DATA_11A414,x               
                    STA.b $85,x                 
                    LDA.w DATA_11A41E,x               
                    STA.b $64,x                 
                    DEX                         
                    BPL   CODE_12925C           
                    STZ.b $FE                   
CODE_12927F:        JSR.w CODE_1291EC           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSR.w CODE_1292C5           
                    JSR.w CODE_1293D8           
                    JSR.w CODE_129526           
                    LDA.b $E6                   
                    BEQ   CODE_12927F           
                    STZ.b $E6                   
CODE_129295:        JSR.w CODE_1291EC           
                    INC.b $10                   
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSR.w CODE_1292C5           
                    JSR.w CODE_1293D8           
                    LDA.b $83                   
                    BEQ   CODE_1292BD           
                    LDA.b $10                   
                    AND.b #$07                  
                    BNE   CODE_129295           
                    DEC.b $83                   
                    LDA.b $83                   
                    CMP.b #$25                  
                    BNE   CODE_129295           
                    LDY.b #$0E                ; \ Credits song.
                    STY.w $1DE2               ; /
                    BNE   CODE_129295           
CODE_1292BD:        JSR.w CODE_129510           
                    LDA.b $E6                   
                    BEQ   CODE_129295           
                    RTL
                       
CODE_1292C5:        LDA.b $84                   
                    BEQ   CODE_1292CB           
                    DEC.b $84                   
CODE_1292CB:        LDA.b $82                   
                    BEQ   CODE_1292D1           
                    DEC.b $82                   
CODE_1292D1:        LDA.b $28                   
                    STA.w $0428                 
                    LDA.b $32                   
                    STA.w $042B                 
                    JSL.l CODE_14E14A           
                    LDA.b $50                   
                    JSL.l CODE_118776 

                    dw CODE_1292EF
                    dw CODE_12930B
                    dw CODE_129337
                    dw CODE_129354
                    dw CODE_129376             

CODE_1292EF:        JSR.w CODE_1283D1                
                    JSR.w CODE_1280D2           
                    LDA.b $28                   
                    CMP.b #$3E                  
                    BCC   CODE_129336           
                    INC.b $50                   
                    INC.b $99                   
                    LDA.b #$06                  
                    STA.b $C7                   
CODE_129303:        LDA.b #$01                  
                    STA.w $1DE1                 
                    JMP.w CODE_12830B           

CODE_12930B:        JSR.w CODE_1283D1           
                    JSR.w CODE_1280D2           
                    JSR.w CODE_129390           
                    JSR.w CODE_128523           
                    LDA.b $46                   
                    BMI   CODE_129336           
                    LDA.b $32                   
                    CMP.b #$A0                  
                    BCC   CODE_129328           
                    LDA.b #$0C                  
                    STA.b $3C                   
                    JMP.w CODE_129303           

CODE_129328:        CMP.b #$75                  
                    BCC   CODE_129336           
                    LDA.b $28                   
                    CMP.b #$70                  
                    BCC   CODE_129336           
                    INC.b $50                   
                    DEC.b $99                   
CODE_129336:        RTS
                       
CODE_129337:        JSR.w CODE_1283D1           
                    JSR.w CODE_1280D2           
                    LDA.b $28                   
                    CMP.b #$80                  
                    BCC   CODE_129336           
                    INC.b $50                   
                    INC.b $9C                   
                    LDA.b #$08                  
                    STA.b $C7                   
                    LDA.b #$05                  
                    STA.b $8E                   
                    LDA.b #$28                  
                    STA.b $82                   
                    RTS
                       
CODE_129354:        LDA.b $82                   
                    BNE   CODE_129375           
                    DEC.b $8E                   
                    BNE   CODE_12936E           
                    INC.b $50                   
                    INC.b $99                   
                    LDA.b #$06                  
                    STA.b $C7                   
                    LDA.b #$2B                  
                    STA.w $1DE0                 
                    LDA.b #$A0                  
                    STA.b $4F                   
                    RTS
                       
CODE_12936E:        LDY.b $8E                   
                    LDA   DATA_11A427,y               
                    STA.b $82                   
CODE_129375:        RTS
                       
CODE_129376:        JSR.w CODE_12939B           
                    JSR.w CODE_129390           
                    JSR.w CODE_1283D1           
                    JSR.w CODE_128523           
                    LDA.b $46                   
                    BMI   CODE_12938F           
                    LDA.b $32                   
                    CMP.b #$80                  
                    BCC   CODE_12938F           
                    JMP.w CODE_12830B           

CODE_12938F:        RTS
                       
CODE_129390:        LDY.b $8F                   
                    LDA   DATA_11A431,y               
                    CLC                         
                    ADC.b $46                   
                    STA.b $46                   
                    RTS
                       
CODE_12939B:        LDX.b #$07                  
CODE_12939D:        STX.b $12                   
                    LDA.b $86,x                 
                    BEQ   CODE_1293AE           
                    CMP.b #$01                  
                    BNE   CODE_1293D2           
                    LDA.b #$31                  
                    STA.w $1DE0                 
                    BNE   CODE_1293D2           
CODE_1293AE:        JSR.w CODE_1298C1           
                    LDA.b $47,x                 
                    CMP.b #$08                  
                    BMI   CODE_1293C6           
                    LDA.b #$00                  
                    STA.b $3D,x                 
                    LDA.b #$F9                  
                    STA.b $47,x                 
                    LDA.w DATA_11A41F,x               
                    EOR.b #$40                  
                    STA.b $65,x                 
CODE_1293C6:        LDA.b $10                   
                    ASL   A                     
                    AND.b #$02                  
                    STA.b $0F                   
                    JSR.w CODE_1293FD           
                    INC.b $86,x                 
CODE_1293D2:        DEC.b $86,x                 
                    DEX                         
                    BPL   CODE_12939D           
                    RTS
                       
CODE_1293D8:        LDA.b #$04                  
                    STA.b $0F                   
                    LDX.b #$08                  
                    STX.b $12                   
                    JSR.w CODE_1293FD           
                    LDY.b $8E                   
                    BNE   CODE_1293F4           
                    LDA.b $3B                   
                    CMP.b #$A0                  
                    BCC   CODE_1293F1           
                    CMP.b #$E0                  
                    BCC   CODE_1293FC           
CODE_1293F1:        JMP.w CODE_129880           

CODE_1293F4:        LDA   DATA_11A42B,y               
                    CLC                         
                    ADC.b $32                   
                    STA.b $3B                   
CODE_1293FC:        RTS         
                
CODE_1293FD:        LDY.w DATA_11A43B,x               
                    LDA.b $33,x                 
                    STA.w $0801,y               
                    LDA.b $29,x                 
                    STA.w $0800,y               
                    LDA.b $65,x                 
                    AND.b #$C0                  
                    ORA.b #$17                  
                    STA.w $0803,y               
                    LDX.b $0F                   
                    AND.b #$40                  
                    BNE   CODE_12941E           
                    LDA.w DATA_11A435,x               
                    BRA   CODE_129421           

CODE_12941E:        LDA.w DATA_11A436,x               
CODE_129421:        STA.w $0802,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    LDX.b $12                   
                    RTS             
            
CODE_129432:        JSR.w CODE_1291E4           
                    JSL.l CODE_14D194           
                    JSL.l CODE_14F953           
                    LDA.b #$40                  
                    STA.w $0100                 
                    JSR.w CODE_12953D           
                    JSR.w CODE_1291EC           
                    LDA.b #$02                  
                    STA.b $11                   
                    JSR.w CODE_1291EC           
                    LDA.b #$03                  
                    STA.b $11                   
                    JSR.w CODE_1291EC           
                    JSL.l CODE_13DD8E           
                    JSR.w CODE_1296BA           
                    JSR.w CODE_1291EC           
                    LDA.b #$00                  
                    STA.b $F4                   
                    STA.b $E6                   
                    JSR.w CODE_129694           
                    LDA.b #$FF                  
                    STA.b $14                   
                    LDA.b #$A0                  
                    STA.b $28                   
                    LDA.b #$08                  
                    STA.b $3C                   
                    LDA.b #$01                  
                    STA.b $EB                   
                    LDA.b #$BE                  
                    STA.w $024B                 
                    STZ.w $024F                 
                    STZ.w $024C                 
                    STZ.b $FE                   
CODE_129486:        JSR.w CODE_1291EC           
                    CLI                         
                    INC.b $F4                   
                    INC.b $10                   
                    JSR.w CODE_1297FE           
                    JSR.w CODE_129546           
                    LDA.b $E6                   
                    CMP.b #$03                  
                    BCS   CODE_1294AE                   
                    LDA.b $F4                   
                    CMP.b #$0A                  
                    BCC   CODE_1294AB           
                    LDA.b #$00                  
                    STA.b $F4                   
                    LDA.b $F3                   
                    SEC                         
                    SBC.b #$30                  
                    STA.b $F3                   
CODE_1294AB:        BRL   CODE_129486           

CODE_1294AE:        LDA.b #$03                  
                    STA.w $024C                 
                    STZ.b $F3                   
                    STZ.b $F4                   
                    STZ.w $0242                 
                    LDA.b #$04                  
                    STA.b $11                   
CODE_1294BE:        JSR.w CODE_1291EC           
                    JSR.w CODE_12953D           
                    INC.b $F4                   
                    JSR.w CODE_1297FE           
                    JSR.w CODE_12965D           
                    LDX.b #$02                  
CODE_1294CE:        LDY.b #$00                  
CODE_1294D0:        LDA.b $00                   
                    LDA.b $00                   
                    DEY                         
                    BNE   CODE_1294D0           
                    DEX                         
                    BNE   CODE_1294CE           
                    LDA.b #$B0                  
                    ORA.b $F3                   
                    STA.b $FF                   
                    LDA.b $F4                   
                    CMP.b #$14                  
                    BCC   CODE_1294F5           
                    LDA.b #$00                  
                    STA.b $F4                   
                    INC.w $0242                 
                    LDA.w $024F                 
                    EOR.b #$01                  
                    STA.w $024F                 
CODE_1294F5:        LDA.w $0242                 
                    CMP.b #$2C                  
                    BCC   CODE_1294BE           
                    JSR.w CODE_129510           
                    LDA.b $E6                   
                    CMP.b #$04                  
                    BCC   CODE_1294BE           
                    LDA.b #$FF                  
                    STA.w $024B                 
                    LDA.b #$01                  
                    STA.w $024F                 
                    RTL
                       
CODE_129510:        DEC.b $E5                   
                    BPL   CODE_129525           
                    LDA.b #$01                  
                    STA.b $E5                   
                    LDA.b $FE                   
                    AND.b #$0F                  
                    DEC   A                     
                    BMI   CODE_129523           
                    STA.b $FE                   
                    BRA   CODE_129525           

CODE_129523:        INC.b $E6                   
CODE_129525:        RTS
                       
CODE_129526:        DEC.b $E5                   
                    BPL   CODE_129525           
                    LDA.b #$01                  
                    STA.b $E5                   
                    LDA.b $FE                   
                    INC   A                     
                    CMP.b #$10                  
                    BEQ   CODE_129523           
                    STA.w $FE                 
                    RTS
                       
CODE_129539:        JSR.w CODE_129526           
                    RTL
                       
CODE_12953D:        LDA.b #$B0                  
                    BRA   CODE_129543           

                    LDA.b #$30                  
CODE_129543:        STA.b $FF                   
                    RTS
                       
CODE_129546:        JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSR.w CODE_12965D           
                    LDA.b $E6                   
                    JSL.l CODE_118776  

                    dw CODE_129526
                    dw CODE_129559
                    dw CODE_1295D8
           
CODE_129559:        JSR.w CODE_1280D2                        
                    LDA.b $14                   
                    CMP.b #$01                  
                    BNE   CODE_129586           
                    LDA.b $28                   
                    CMP.b #$20                  
                    BCC   CODE_129586           
                    INC.w $00E6                 
                    LDA.b #$A0                  
                    STA.b $10                   
                    LDX.b #$05                  
CODE_129571:        LDA.b #$20                  
                    STA.b $29,x                 
                    LDA.b #$A8                  
                    STA.b $33,x                 
                    LDA.w DATA_11AA5E,x               
                    STA.b $3D,x                 
                    LDA.w DATA_11AA64,x               
                    STA.b $47,x                 
                    DEX                         
                    BPL   CODE_129571           
CODE_129586:        LDY.b #$A0                  
                    LDA.b $10                   
                    AND.b #$38                  
                    BNE   CODE_12958F           
                    DEY                         
CODE_12958F:        AND.b #$08                  
                    BNE   CODE_129594           
                    DEY                         
CODE_129594:        STY.b $32                   
                    LDX.b #$05                  
                    LDY.b #$70                  
CODE_12959A:        STZ.b $00                   
                    LDA.b $32                   
                    CLC                         
                    ADC.w DATA_11AA76,x               
                    STA.w $0801,y               
                    LDA.w DATA_11AA6A,x               
                    STA.w $0802,y               
                    LDA.b #$2B                  
                    STA.w $0803,y               
                    LDA.b $28                   
                    CLC                         
                    ADC.w DATA_11AA70,x               
                    STA.w $0800,y               
                    LDA.b $14                   
                    ADC.b #$00                  
                    BEQ   CODE_1295C3           
                    LDA.b #$01                  
                    STA.b $00                   
CODE_1295C3:        PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    ORA.b $00                   
                    STA.w $0A20,y               
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_12959A           
                    RTS
                       
CODE_1295D8:        LDA.b $10                   
                    BNE   CODE_1295F5           
                    STA.w $040E                 
                    STA.w $0418                 
                    STA.b $2F                   
                    STA.b $10                   
                    LDA.b #$6F                  
                    STA.b $39                   
                    LDA.b #$E6                  
                    STA.b $43                   
                    LDA.b #$DA                  
                    STA.b $4D                   
                    INC.w $00E6                 
CODE_1295F5:        LDX.b #$05                  
CODE_1295F7:        STX.b $12                   
                    JSR.w CODE_129885           
                    JSR.w CODE_129880           
                    LDY.b #$F0                  
                    LDA.b $10                   
                    BEQ   CODE_129612           
                    AND.b #$0F                  
                    CMP.w DATA_11AA82,x               
                    BNE   CODE_129614           
                    LDA.b #$20                  
                    STA.b $29,x                 
                    LDY.b #$A8                  
CODE_129612:        STY.b $33,x                 
CODE_129614:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b $29,x                 
                    CMP.b #$80                  
                    BCS   CODE_129623                   
                    LDA.b #$F0                  
                    BNE   CODE_12962B           
CODE_129623:        STA.w $0870,y               
                    STA.w $0874,y               
                    LDA.b $33,x                 
CODE_12962B:        STA.w $0871,y               
                    CMP.b #$F0                  
                    BEQ   CODE_129638           
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0875,y               
CODE_129638:        LDA.w DATA_11AA7C,x               
                    STA.w $0872,y               
                    ORA.b #$10                  
                    STA.w $0876,y               
                    LDA.b #$23                  
                    STA.w $0873,y               
                    STA.w $0877,y               
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A3C,y               
                    STA.w $0A3D,y               
                    PLY                         
                    DEX                         
                    BPL   CODE_1295F7           
                    RTS
                       
CODE_12965D:        JSR.w CODE_129694           
                    INC.b $9B                   
                    LDA.b #$03                  
                    STA.b $00                   
                    LDA.b $9B                   
                    STA.b $01                   
                    LDY.b #$1C                  
CODE_12966C:        LDX.b $00                   
                    LDA.w DATA_11AA98,x               
                    TAX                         
                    INC.b $01                   
                    LDA.b $01                   
                    AND.b #$10                  
                    BEQ   CODE_12967B           
                    INX                         
CODE_12967B:        LDA.b #$01                  
                    STA.b $02                   
CODE_12967F:        LDA.w DATA_11AA88,x               
                    STA.w $0812,y               
                    DEX                         
                    DEX                         
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    DEC.b $02                   
                    BPL   CODE_12967F           
                    DEC.b $00                   
                    BPL   CODE_12966C           
                    RTS
                       
CODE_129694:        LDY.b #$1F                  
CODE_129696:        LDA   DATA_11AA3E,y               
                    STA.w $0810,y               
                    DEY                         
                    BPL   CODE_129696           
                    LDA.b #$02                  
                    STA.w $0A24                 
                    STA.w $0A25                 
                    STA.w $0A26                 
                    STA.w $0A27                 
                    STA.w $0A28                 
                    STA.w $0A29                 
                    STA.w $0A2A                 
                    STA.w $0A2B                 
                    RTS
                       
CODE_1296BA:        LDA.b #$00                  
                    STA.w $0631                 
                    LDY.b #$03                  
CODE_1296C1:        LDA.w $062D,y               
                    CMP.w $0631                 
                    BCC   CODE_1296CF           
                    LDA.w $062D,y               
                    STA.w $0631                 
CODE_1296CF:        DEY                         
                    BPL   CODE_1296C1           
                    LDX.b #$00                  
                    LDY.b #$03                  
CODE_1296D6:        LDA.w $062D,y               
                    CMP.w $0631                 
                    BNE   CODE_1296E3           
                    TYA                         
                    STA.w $0597,x               
                    INX                         
CODE_1296E3:        DEY                         
                    BPL   CODE_1296D6           
                    DEX                         
                    STX.w $059B                 
                    LDX.b #$00                  
                    LDA.b #$01                  
                    STA.w $0302,x               
                    INX                         
                    LDA.b #$29                  
                    STA.w $0302,x               
                    INX                         
                    LDA.b #$00                  
                    STA.w $0302,x               
                    INX                         
                    LDA.b #$1B                  
                    STA.w $0302,x               
                    INX                         
                    LDY.b #$00                  
                    LDA.w $062D,y               
                    JSR.w CODE_129820           
                    TYA                         
                    REP   #$20                  
                    AND.w #$00FF                
                    CMP.w #$00BF                
                    BEQ   CODE_12971C           
                    ORA.w #$1500                
                    BRA   CODE_12971F           

CODE_12971C:        LDA.w #$14BE                
CODE_12971F:        STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.b $01                   
                    AND.w #$00FF                
                    ORA.w #$1500                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$15FF                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$15EF                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$14BE                
                    STA.w $0302,x               
                    SEP   #$20                  
                    LDY.b #$03                  
                    LDA.w $062D,y               
                    JSR.w CODE_129820           
                    TYA                         
                    REP   #$20                  
                    AND.w #$00FF                
                    CMP.w #$00BF                
                    BEQ   CODE_129762           
                    ORA.w #$1500                
                    STA.w $0302,x               
CODE_129762:        INX                         
                    INX                         
                    LDA.b $01                   
                    AND.w #$00FF                
                    ORA.w #$1500                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$15FF                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$15EF                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$14BE                
                    STA.w $0302,x               
                    SEP   #$20                  
                    LDY.b #$02                  
                    LDA.w $062D,y               
                    JSR.w CODE_129820           
                    TYA                         
                    REP   #$20                  
                    AND.w #$00FF                
                    CMP.w #$00BF                
                    BEQ   CODE_1297A2           
                    ORA.w #$1500                
                    STA.w $0302,x               
CODE_1297A2:        INX                         
                    INX                         
                    LDA.b $01                   
                    AND.w #$00FF                
                    ORA.w #$1500                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$15FF                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$15EF                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    LDA.w #$14BE                
                    STA.w $0302,x               
                    SEP   #$20                  
                    LDY.b #$01                  
                    LDA.w $062D,y               
                    JSR.w CODE_129820           
                    TYA                         
                    REP   #$20                  
                    AND.w #$00FF                
                    CMP.w #$00BF                
                    BEQ   CODE_1297E2           
                    ORA.w #$1500                
                    STA.w $0302,x               
CODE_1297E2:        INX                         
                    INX                         
                    LDA.b $01                   
                    AND.w #$00FF                
                    ORA.w #$1500                
                    STA.w $0302,x               
                    INX                         
                    INX                         
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $0302,x               
                    LDA.b #$3C                  
                    STA.w $059D                 
                    RTS
                       
CODE_1297FE:        DEC.w $059D                 
                    BPL   CODE_12981F           
                    LDA.b #$3C                  
                    STA.w $059D                 
                    LDY.w $059C                 
                    LDA.w $0597,y               
                    CLC                         
                    ADC.b #$06                  
                    STA.w $11                 
                    DEC.w $059C                 
                    BPL   CODE_12981F           
                    LDA.w $059B                 
                    STA.w $059C                 
CODE_12981F:        RTS
                       
CODE_129820:        LDY.b #$C0                  
CODE_129822:        CMP.b #$0A                  
                    BCC   CODE_12982B           
                    SBC.b #$0A                  
                    INY                         
                    BRA   CODE_129822           

CODE_12982B:        ORA.b #$C0                  
                    CPY.b #$C0                  
                    BNE   CODE_129833           
                    LDY.b #$BF                  
CODE_129833:        CPY.b #$CA                  
                    BCC   CODE_12983B           
                    LDY.b #$C9                  
                    LDA.b #$C9                  
CODE_12983B:        STA.b $01                   
                    RTS
                       
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty data.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |      
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF                              ; /

CODE_129880:        TXA
                    CLC            
                    ADC.b #$0A                  
                    TAX                         
CODE_129885:        LDA.b $3D,x                 
                    CLC                         
                    ADC.w $04CD,x               
                    PHA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $01                   
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_12989D           
                    ORA.b #$F0                  
CODE_12989D:        STA.b $00                   
                    LDY.b #$00                  
                    ASL   A                     
                    BCC   CODE_1298A5           
                    DEY                         
CODE_1298A5:        STY.b $02                   
                    LDA.w $0408,x               
                    CLC                         
                    ADC.b $01                   
                    STA.w $0408,x               
                    LDA.b $29,x                 
                    ADC.b $00                   
                    STA.b $29,x                 
                    LSR.b $01                   
                    LDA.b $15,x                 
                    ADC.b $02                   
                    STA.b $15,x                 
                    LDX.b $12                   
                    RTS
                       
CODE_1298C1:        LDA.w $044A,x               
                    BNE   CODE_1298C9           
                    JSR.w CODE_129885           
CODE_1298C9:        JSR.w CODE_129880           
                    LDA.b $47,x                 
                    BMI   CODE_1298D4           
                    CMP.b #$3E                  
                    BCS   CODE_1298D8                   
CODE_1298D4:        INC.b $47,x                 
                    INC.b $47,x                 
CODE_1298D8:        RTS
                       
CODE_1298D9:        LDA.b #$01                  
                    BNE   CODE_1298DF           
CODE_1298DD:        LDA.b #$00                  
CODE_1298DF:        PHA                         
                    LDY.b #$08                  
CODE_1298E2:        LDA.w $51,y               
                    BEQ   CODE_1298F8           
                    LDA.w $90,y               
                    CMP.b #$3C                  
                    BNE   CODE_1298F8           
                    LDA.b #$05                  
                    STA.w $51,y               
                    LDA.b #$20                  
                    STA.w $86,y               
CODE_1298F8:        DEY                         
                    BPL   CODE_1298E2           
                    JSR.w CODE_129AA5           
                    BPL   CODE_129905           
                    LDY.b #$08                  
                    JSR.w CODE_129AB4           
CODE_129905:        LDA.b #$00                  
                    STA.w $04BE                 
                    STA.w $04B3                 
                    LDX.b $00                   
                    PLA                         
                    STA.w $0477,x               
                    LDA.b #$3C                  
                    STA.b $90,x                 
                    LDA.b $28                   
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $29,x                 
                    LDA.b $14                   
                    ADC.b #$00                  
                    STA.b $15,x                 
                    LDY.b #$00                  
                    LDA.w $0536                 
                    CMP.b #$01                  
                    BEQ   CODE_129930           
                    LDY.b #$01                  
CODE_129930:        TYA                         
                    CLC                         
                    ADC.b $32                   
                    STA.b $33,x                 
                    LDA.b $1E                   
                    ADC.b #$00                  
                    STA.b $1F,x                 
                    LDA.b #$41                  
                    STA.b $65,x                 
                    LDX.b $12                   
                    RTS
                       
                    PLA                         
                    RTS
                       
CODE_129945:        JSR.w CODE_129AA9           
                    BMI   CODE_12996F           
                    LDX.b $00                   
                    LDA.b #$45                  
                    STA.b $90,x                 
                    LDA.w $04C1                 
                    ADC.b #$D0                  
                    STA.b $29,x                 
                    LDA.w $04BF                 
                    ADC.b #$00                  
                    STA.b $15,x                 
                    LDA.b $CB                   
                    ADC.b #$E0                  
                    STA.b $33,x                 
                    LDA.b $CA                   
                    ADC.b #$00                  
                    STA.b $1F,x                 
                    JSR.w CODE_1299A4           
                    LDX.b $12                   
CODE_12996F:        RTS
                       
CODE_129970:        LDA.b #$00                  
                    STA.b $86,x                 
                    LDA.b #$00                  
                    STA.b $79,x                 
CODE_129978:        LDA.b #$00                  
                    STA.b $B1,x                 
                    STA.w $042F,x               
                    STA.b $A8,x                 
                    STA.b $9F,x                 
                    STA.w $044A,x               
                    STA.b $5B,x                 
                    STA.w $0438,x               
                    STA.w $0453,x               
                    STA.w $04CD,x               
                    STA.w $04D7,x               
                    STA.w $045C,x               
                    STA.w $0477,x               
                    STA.w $0480,x               
                    STA.w $0465,x               
                    STA.b $47,x                 
                    STA.b $3D,x                 
CODE_1299A4:        LDY.b $90,x                 
                    LDA   DATA_11CC45,y               
                    AND.b #$7F                  
                    STA.b $65,x                 
                    LDA   DATA_11CC8C,y               
                    STA.w $046E,x               
                    LDA   DATA_11CD1A,y               
                    STA.w $0489,x               
                    LDA   DATA_11CCD3,y               
                    STA.w $0492,x               
                    RTS
                       
CODE_1299C0:        LDA.b $65,x                 
                    AND.b #$FC                  
                    ORA.b #$01                  
                    STA.b $65,x                 
                    LDA.b #$05                  
                    STA.b $51,x                 
                    STA.b $9F,x                 
                    LDA.b #$1F                  
                    STA.b $86,x                 
                    LDX.b $12                   
                    RTS
                       
CODE_1299D5:        LDA.b #$FF                  
                    STA.w $0441,x               
                    RTS
                       
CODE_1299DB:        LDX.b $E9                   
                    JSR.w CODE_1299E8           
                    LDA.b $E6                   
                    CLC                         
                    ADC.b $E5                   
                    STA.b $E7                   
                    RTS
                       
CODE_1299E8:        STY.w $02F5                 
                    LDA.w $0628                 
                    BEQ   CODE_1299F4           
                    LDA.b #$00                  
                    BRA   CODE_1299FA           

CODE_1299F4:        LDY.w $0534                 
                    LDA   DATA_11AB11,y               
CODE_1299FA:        CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.w DATA_11AB06,x               
                    STA.b $03                   
                    LDY.w $02F5                 
                    RTS
                       
CODE_129A0E:        LDA.b #$01                  
                    LDY.b $00                   
                    CPY.b #$92                  
                    BEQ   CODE_129A1F           
                    CPY.b #$93                  
                    BEQ   CODE_129A1D           
                    LDA.b #$00                  
                    RTS
                       
CODE_129A1D:        LDA.b #$08                  
CODE_129A1F:        STA.b $46                   
                    LDA.w $04E0                 
                    BNE   CODE_129A2D           
                    LDA.b $32                   
                    AND.b #$10                  
                    STA.w $04EC                 
CODE_129A2D:        LDA.b $32                   
                    AND.b #$0F                  
                    TAY                         
                    LDA.w $04EC                 
                    EOR.b $32                   
                    AND.b #$10                  
                    BEQ   CODE_129A49           
                    CPY.b #$0C                  
                    BCC   CODE_129A47           
                    LDA.b #$00                ; \ Don't remain in air.
                    STA.b $82                 ; /
                    JSL.l CODE_14E39F         ; Die.
CODE_129A47:        LDY.b #$04                  
CODE_129A49:        CPY.b #$04                  
                    BCS   CODE_129A4F                   
                    LDY.b #$01                  
CODE_129A4F:        TYA                         
                    DEX                         
                    RTS
                       
CODE_129A52:        LDA.b $85                   
                    BNE   CODE_129A7F           
                    LDA.w $04C3                 
                    SEC                         
                    SBC.b #$10                  
                    BCC   CODE_129A80           
                    STA.w $04C3                 
                    LDA.b #$7F                  
                    STA.b $85                   
                    LDA.w $0428                 
                    SEC                         
                    SBC.w $0429                 
                    ASL   A                     
                    ASL   A                     
                    STA.b $3C                   
                    LDA.b #$C0                  
                    LDY.b $46                   
                    BPL   CODE_129A78           
                    LDA.b #$00                  
CODE_129A78:        STA.b $46                   
                    LDA.b #$04                  
                    STA.w $1DE0                 
CODE_129A7F:        RTS
                       
CODE_129A80:        LDA.b #$C0                ; \ Rise for a bit while dying.
                    STA.b $46                 ; /
                    LDA.b #$20                ; \ Remain in air for a couple of frames.
                    STA.b $82                 ; /
                    LDY.b $12                   
                    BMI   CODE_129A90           
                    LSR   A                     
                    STA.w $0438,y               
CODE_129A90:        JSL.l CODE_14E39F         ; Die.
                    RTS
                       
                    LDY.w $0441,x               
                    BMI   CODE_129AA0           
                    LDA.b ($CC),y               
                    AND.b #$7F                  
                    STA.b ($CC),y               
CODE_129AA0:        LDA.b #$00                  
                    STA.b $51,x                 
                    RTS
                       
CODE_129AA5:        LDY.b #$08                  
                    BNE   CODE_129AAB           
CODE_129AA9:        LDY.b #$05                  
CODE_129AAB:        LDA.w $51,y               
                    BEQ   CODE_129AB4           
                    DEY                         
                    BPL   CODE_129AAB           
                    RTS
                       
CODE_129AB4:        LDA.b #$01                  
                    STA.w $51,y               
                    LSR   A                     
                    STA.w $049B,y               
                    LDA.b #$01                  
                    STA.w $90,y               
                    LDA.b $29,x                 
                    ADC.b #$05                  
                    STA.w $29,y               
                    LDA.b $15,x                 
                    ADC.b #$00                  
                    STA.w $15,y               
                    LDA.b $33,x                 
                    STA.w $33,y               
                    LDA.b $1F,x                 
                    STA.w $1F,y               
                    STY.b $00                   
                    TYA                         
                    TAX                         
                    JSR.w CODE_129970           
                    JSR.w CODE_1299D5           
                    LDX.b $12                   
                    RTS
                       
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF                                  ; /

CODE_129B00:        LDA.w $04AE             
                    BEQ   CODE_129B09           
                    JSR.w CODE_129C64           
                    RTL
                       
CODE_129B09:        INC.w $04AE                 
                    STA.w $0593                 
                    STA.w $04C5                 
                    STA.w $04C7                 
                    STA.w $04B5                 
                    STA.w $04B4                 
                    STA.w $04B9                 
                    STA.w $04B6                 
                    STA.w $04FB                 
                    STA.w $0425                 
                    STA.b $3C                   
                    STA.b $85                   
                    STA.b $9C                   
                    STA.b $82                   
                    STA.w $04C6                 
                    STA.w $04FE                 
                    STA.w $04CB                 
                    STA.w $04CA                 
                    STA.w $04E0                 
                    STA.w $04B8                 
                    LDY.b #$1B                  
CODE_129B43:        LDA   DATA_11AB47,y               
                    STA.w $1F00,y               
                    DEY                         
                    BPL   CODE_129B43           
                    LDY.b $8F                   
                    LDA   DATA_119780,y               
                    STA.w $1F00                 
                    LDA   DATA_119788,y               
                    STA.w $1F07                 
                    LDA   DATA_119784,y               
                    STA.w $1F0E                 
                    LDA   DATA_11978C,y               
                    STA.w $1F15                 
                    LDA.b #$B6                  
                    STA.w $0585                 
                    LDA.w $0536               ; \ If the current room is the first room...
                    ORA.w $0533               ;  | of the first level...
                    BNE   CODE_129B78         ; / ...don't branch, otherwise do branch.
                    LDA.b #$23                ; \ Falling sound.
                    STA.w $1DE0               ; /
CODE_129B78:        LDA.w $04AF                 
                    BNE   CODE_129B80           
                    JMP.w CODE_129BFF           

CODE_129B80:        PHA                         
                    LDX.b #$08                  
CODE_129B83:        LDA.b #$00                  
                    STA.b $A8,x                 
                    DEX                         
                    BPL   CODE_129B83           
                    PLA                         
                    LDX.b #$05                  
                    STX.b $12                   
                    CMP.b #$3F                  
                    BEQ   CODE_129BFF           
                    STA.b $90,x                 
                    LDY.b #$01                  
                    STY.b $56                   
                    LDY.b #$FF                  
                    STY.w $0446                 
                    CMP.b #$38                  
                    BNE   CODE_129BC0           
                    STA.b $B1,x                 
                    STA.w $04C8,x               
                    STA.w $0477,x               
                    LDA.b #$00                  
                    STA.b $15,x                 
                    STA.b $1F,x                 
                    JSR.w CODE_129F7A           
                    LDA.b #$F0                  
                    STA.b $47,x                 
                    ASL   A                     
                    STA.b $33,x                 
                    LDA.b #$78                  
                    STA.b $29,x                 
                    BNE   CODE_129BFF           
CODE_129BC0:        PHA                         
                    STX.w $042D                 
                    JSR.w CODE_129F96           
                    LDA.b #$01                  
                    STA.b $A8,x                 
                    STA.b $9C                   
                    JSR.w CODE_12B692           
                    PLA                         
                    CMP.b #$3D                  
                    BNE   CODE_129BFF           
                    INC.b $79,x                 
                    DEX                         
                    STX.b $12                   
                    LDA.b #$01                  
                    STA.b $51,x                 
                    LDA.b #$17                  
                    STA.b $90,x                 
                    JSR.w CODE_129F96           
                    LDA.b #$00                  
                    STA.w $0595                 
                    LDA.b $CB                   
                    STA.b $33,x                 
                    LDA.b $CA                   
                    STA.b $1F,x                 
                    LDA.w $04C1                 
                    STA.b $29,x                 
                    LDA.w $04BF                 
                    STA.b $15,x                 
                    JSR.w CODE_12A09C           
CODE_129BFF:        STZ.b $CC                   
                    LDA.b #$1B                  
                    STA.b $CD                   
                    LDA.b $EB                   
                    BNE   CODE_129C3B           
                    LDA.b #$14                  
                    STA.b $09                   
                    LDA.b $CB                   
                    SBC.b #$30                  
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.b $CA                   
                    SBC.b #$00                  
                    STA.b $06                   
CODE_129C1B:        LDA.b $06                   
                    CMP.b #$0B                  
                    BCS   CODE_129C27                   
                    JSR.w CODE_129E26           
                    JSR.w CODE_129E26           
CODE_129C27:        JSR.w CODE_129C2F           
                    DEC.b $09                   
                    BPL   CODE_129C1B           
                    RTL
                       
CODE_129C2F:        LDA.b $05                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $05                   
                    BCC   CODE_129C3A           
                    INC.b $06                   
CODE_129C3A:        RTS
                       
CODE_129C3B:        LDA.w $04C1                 
                    SEC                         
                    SBC.b #$30                  
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.w $04BF                 
                    SBC.b #$00                  
                    STA.b $06                   
                    LDA.b #$17                  
                    STA.b $09                   
CODE_129C50:        LDA.b $06                   
                    CMP.b #$0B                  
                    BCS   CODE_129C5C                   
                    JSR.w CODE_129D92           
                    JSR.w CODE_129D92           
CODE_129C5C:        JSR.w CODE_129C2F           
                    DEC.b $09                   
                    BPL   CODE_129C50           
                    RTL
                       
CODE_129C64:        JSR.w CODE_129D6A           
                    LDA.w $0500                 
                    BEQ   CODE_129C82           
                    LDA.b $10                   
                    AND.b #$1F                  
                    BNE   CODE_129C7C           
                    LDY.w $079C                 
                    BNE   CODE_129C7C           
                    LDY.b #$2F                  
                    STY.w $1DE0                 
CODE_129C7C:        LSR   A                     
                    BCC   CODE_129C82           
                    DEC.w $0500                 
CODE_129C82:        LDA.w $04C1                 
                    CLC                         
                    ADC.b #$FF                  
                    STA.w $04C2                 
                    LDA.w $04BF                 
                    ADC.b #$00                  
                    STA.w $04C0                 
                    LDX.b #$08                  
CODE_129C95:        STX.b $12                   
                    TXA                         
                    CLC                         
                    ADC.w $0400                 
                    ASL   A                     
                    TAY                         
                    REP   #$20                  
                    LDA   DATA_11CC23,y               
                    LDY.b $A8,x                 
                    BEQ   CODE_129CBB           
                    LDY.w $04BE                 
                    CPY.b #$19                  
                    BCS   CODE_129CBB                   
                    LDA.w #$0070                
                    LDY.b $90,x                 
                    CMP.w #$0038                
                    BNE   CODE_129CBB           
                    LDA.w #$0020                
CODE_129CBB:        STA.w $02F6                 
                    SEP   #$20                  
                    LDA.b $51,x                 
                    CMP.b #$02                  
                    BCS   CODE_129CD1                   
                    LDA.b $90,x                 
                    CMP.b #$32                  
                    BCS   CODE_129CD1                   
                    LDA.w $0500                 
                    BNE   CODE_129CDF           
CODE_129CD1:        LDA.b $86,x                 
                    BEQ   CODE_129CD7           
                    DEC.b $86,x                 
CODE_129CD7:        LDA.w $0453,x               
                    BEQ   CODE_129CDF           
                    DEC.w $0453,x               
CODE_129CDF:        LDA.w $045C,x               
                    BEQ   CODE_129CE7           
                    DEC.w $045C,x               
CODE_129CE7:        LDA.w $0438,x               
                    BEQ   CODE_129CF4           
                    LDA.b $10                   
                    LSR   A                     
                    BCC   CODE_129CF4           
                    DEC.w $0438,x               
CODE_129CF4:        JSR.w CODE_129D21           
                    JSR.w CODE_12BB60           
                    JSR.w CODE_129D50           
                    LDX.b $12                   
                    DEX                         
                    BPL   CODE_129C95           
                    LDA.w $0628                 
                    BNE   CODE_129D20           
                    LDA.w $04B9                 
                    BEQ   CODE_129D20           
                    SEC                         
                    SBC.b #$47                  
                    JSL.l CODE_118776  

                    dw CODE_12AA48
                    dw CODE_12AA79
                    dw CODE_129D1B
                    dw CODE_12DAF6          

CODE_129D1B:        LDA.b #$00                  
                    STA.w $04B9                 
CODE_129D20:        RTS
                       
CODE_129D21:        LDY.b #$00                  
                    JSR.w CODE_129D27           
                    INY                         
CODE_129D27:        LDA.w $0585                 
                    ASL   A                     
                    ASL   A                     
                    SEC                         
                    ADC.w $0585                 
                    STA.w $0585                 
                    ASL.w $0586                 
                    LDA.b #$20                  
                    BIT.w $0586                 
                    BCC   CODE_129D41           
                    BEQ   CODE_129D46           
                    BNE   CODE_129D43           
CODE_129D41:        BNE   CODE_129D46           
CODE_129D43:        INC.w $0586                 
CODE_129D46:        LDA.w $0586                 
                    EOR.w $0585                 
                    STA.w $0587,y               
                    RTS
                       
CODE_129D50:        LDA.b $51,x               ; \ Load sprite status.
                    JSL.l CODE_118776         ; / Execute pointer.

                    dw CODE_129D20                          ; 00 - Non-existant sprite, init. (Return.)
                    dw CODE_12A84C                          ; 01 - Main routine.
                    dw CODE_12A024                          ; 02 - Sprite falling off screen.
                    dw CODE_12A164                          ; 03 - Flat
                    dw CODE_12A2BF                          ; 04 - Explode
                    dw CODE_12A483                          ; 05 - Disappear in a puff of smoke
                    dw CODE_12A6AB                          ; 06 - Dissolving sand
                    dw CODE_12A276                          ; 07 - Stop interacting
                    dw CODE_12A1AC                          ; 08 - Disappear in two puffs of smoke
                    dw CODE_12A0C2                          ; 09 - Disappear abruptly

CODE_129D6A:        LDA.w $04B8                 
                    BNE   CODE_129DC0           
                    LDA.b $EB                   
                    JSL.l CODE_118776           

                    dw CODE_129E02
                    dw CODE_129D79       

CODE_129D79:        LDY.b $6E                   
                    LDA.w $04C1                 
                    CLC                         
                    ADC   DATA_11978F,y         
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.w $04BF                 
                    ADC   DATA_119791,y         
                    STA.b $06                   
                    CMP.b #$0A                  
                    BCS   CODE_129DC0           
CODE_129D92:        LDA.w $0628                 
                    CMP.b #$02                  
                    BEQ   CODE_129DC0           
                    LDX.b #$00                  
                    STX.b $00                   
CODE_129D9D:        CPX.b $06                   
                    BEQ   CODE_129DAD           
                    LDA.b $00                   
                    TAY                         
                    CLC                         
                    ADC.b ($CC),y               
                    STA.b $00                   
                    INX                         
                    JMP.w CODE_129D9D           

CODE_129DAD:        LDY.b $00                   
                    LDA.b ($CC),y               
                    STA.b $01                   
                    LDX.b #$FF                  
                    DEY                         
CODE_129DB6:        INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.b $01                   
                    BCC   CODE_129DC1           
                    LDX.b $12                   
CODE_129DC0:        RTS
                       
CODE_129DC1:        LDA.b ($CC),y               
                    BMI   CODE_129DB6           
                    INY                         
                    LDA.b ($CC),y               
                    DEY                         
                    AND.b #$F0                  
                    CMP.b $05                   
                    BNE   CODE_129DB6           
                    LDA.b ($CC),y               
                    CMP.b #$5C                  
                    BCS   CODE_129DDD                   
                    CMP.b #$47                  
                    BCC   CODE_129DDD           
                    STA.w $04B9                 
                    RTS
                       
CODE_129DDD:        LDX.b #$04                  
CODE_129DDF:        LDA.b $51,x                 
                    BEQ   CODE_129DE7           
                    DEX                         
                    BPL   CODE_129DDF           
                    RTS
                       
CODE_129DE7:        STX.b $12                   
                    LDA.b $05                   
                    STA.b $29,x                 
                    LDA.b $06                   
                    STA.b $15,x                 
                    INY                         
                    LDA.b ($CC),y               
                    DEY                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $33,x                 
                    LDA.b #$00                  
                    STA.b $1F,x                 
                    JMP.w CODE_129E8C           

CODE_129E02:        LDA.b $10                   
                    AND.b #$01                  
                    TAY                         
                    INY                         
                    LDA.b $D8                   
                    BEQ   CODE_129E11           
                    AND.b #$03                  
                    EOR.b #$03                  
                    TAY                         
CODE_129E11:        LDA.b $CB                   
                    CLC                         
                    ADC   DATA_11978F,y               
                    AND.b #$F0                  
                    STA.b $05                   
                    LDA.b $CA                   
                    ADC   DATA_119791,y               
                    STA.b $06                   
                    CMP.b #$0A                  
                    BCS   CODE_129DC0                   
CODE_129E26:        LDX.b #$00                  
                    STX.b $00                   
CODE_129E2A:        CPX.b $06                   
                    BEQ   CODE_129E3A           
                    LDA.b $00                   
                    TAY                         
                    CLC                         
                    ADC.b ($CC),y               
                    STA.b $00                   
                    INX                         
                    JMP.w CODE_129E2A           

CODE_129E3A:        LDY.b $00                   
                    LDA.b ($CC),y               
                    STA.b $01                   
                    LDX.b #$FF                  
                    DEY                         
CODE_129E43:        INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.b $01                   
                    BCC   CODE_129E4E           
                    LDX.b $12                   
CODE_129E4D:        RTS
                       
CODE_129E4E:        LDA.b ($CC),y               
                    BMI   CODE_129E43           
                    INY                         
                    LDA.b ($CC),y               
                    DEY                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CMP.b $05                   
                    BNE   CODE_129E43           
                    LDA.b ($CC),y               
                    CMP.b #$5C                  
                    BCS   CODE_129E6C                   
                    CMP.b #$47                  
                    BCC   CODE_129E6C           
                    STA.w $04B9                 
                    RTS
                       
CODE_129E6C:        LDX.b #$04                  
CODE_129E6E:        LDA.b $51,x                 
                    BEQ   CODE_129E76           
                    DEX                         
                    BPL   CODE_129E6E           
                    RTS
                       
CODE_129E76:        STX.b $12                   
                    LDA.b $05                   
                    STA.b $33,x                 
                    LDA.b $06                   
                    STA.b $1F,x                 
                    INY                         
                    LDA.b ($CC),y               
                    DEY                         
                    AND.b #$F0                  
                    STA.b $29,x                 
                    LDA.b #$00                  
                    STA.b $15,x                 
CODE_129E8C:        STA.w $049B,x               
                    STY.b $0C                   
                    LDA.b ($CC),y               
                    AND.b #$3F                  
                    CMP.b #$32                  
                    BCS   CODE_129EA8                   
                    LDA.b $EB                   
                    BEQ   CODE_129EA8           
                    JSR.w CODE_12C1DA           
                    LDA.b $0F                   
                    ADC.b #$18                  
                    CMP.b #$30                  
                    BCC   CODE_129E4D           
CODE_129EA8:        LDY.b $0C                   
                    LDA.b ($CC),y               
                    ORA.b #$80                  
                    STA.b ($CC),y               
                    CMP.b #$DC                  
                    AND.b #$7F                  
                    BCC   CODE_129EBB           
                    AND.b #$3F                  
                    STA.w $049B,x               
CODE_129EBB:        CMP.b #$1C                  
                    BNE   CODE_129EC7           
                    LDX.w $04B5                 
                    BEQ   CODE_129EC7           
                    LDX.b $12                   
                    RTS
                       
CODE_129EC7:        CMP.b #$17                  
                    BEQ   CODE_129ECF           
                    CMP.b #$1D                  
                    BNE   CODE_129EDC           
CODE_129ECF:        LDX.b #$05                  
CODE_129ED1:        CMP.b $90,x                 
                    BEQ   CODE_129EDA           
                    DEX                         
                    BPL   CODE_129ED1           
                    BRA   CODE_129EDC           

CODE_129EDA:        STZ.b $51,x                 
CODE_129EDC:        LDX.b $12                   
                    STA.b $90,x                 
                    TYA                         
                    STA.w $0441,x               
                    INC.b $51,x               ; Sprite status = init routine.
                    LDA.b $90,x               ; Jump to routine based on sprite number.
                    JSL.l CODE_118776           

                    dw CODE_129F96                          ; 00 - Heart                          
                    dw CODE_129F96                          ; 01 - Shy Guy, red
                    dw CODE_129F96                          ; 02 - Tweeter
                    dw CODE_129F96                          ; 03 - Shy Guy, blue
                    dw CODE_129F96                          ; 04 - Porcupo
                    dw CODE_129F96                          ; 05 - Snifit, red
                    dw CODE_12AC85                          ; 06 - Snifit, grey
                    dw CODE_129F96                          ; 07 - Snifit, blue
                    dw CODE_129F96                          ; 08 - Ostro with red Shyguy
                    dw CODE_12A01C                          ; 09 - Bob-Omb
                    dw CODE_129F96                          ; 0A - Albatoss with Bob-Omb
                    dw CODE_12B27D                          ; 0B - Albatoss, coming from left
                    dw CODE_12B276                          ; 0C - Albatoss, coming from right
                    dw CODE_129F96                          ; 0D - Ninji, running
                    dw CODE_12AC85                          ; 0E - Ninji, jumping
                    dw CODE_129FE3                          ; 0F - Beezo, gold
                    dw CODE_129F96                          ; 10 - Beezo, red.
                    dw CODE_129F96                          ; 11 - Wart Bubble.
                    dw CODE_129F96                          ; 12 - Pidgit, carpet.
                    dw CODE_12AE10                          ; 13 - Trouter.
                    dw CODE_129F96                          ; 14 - Hoopster.
                    dw CODE_12A9CB                          ; 15 - Shyguy generator.
                    dw CODE_12A9CB                          ; 16 - Bob-omb Generator
                    dw CODE_12A00F                          ; 17 - Phanto
                    dw CODE_12CCBA                          ; 18 - Cobrat, jar
                    dw CODE_12CCBA                          ; 19 - Cobrat, sand
                    dw CODE_12CDE8                          ; 1A - Pokey
                    dw CODE_129F96                          ; 1B - Bullet
                    dw CODE_12AF2D                          ; 1C - Birdo
                    dw CODE_12C7F8                          ; 1D - Mouser
                    dw CODE_129F96                          ; 1E - Egg
                    dw CODE_12CA80                          ; 1F - Triclyde
                    dw CODE_129F96                          ; 20 - Fireball
                    dw CODE_12C270                          ; 21 - Clawglip
                    dw CODE_129F96                          ; 22 - Rock
                    dw CODE_12AC85                          ; 23 - Panser, red
                    dw CODE_129F96                          ; 24 - Panser, blue
                    dw CODE_12AC85                          ; 25 - Panser, green
                    dw CODE_129F96                          ; 26 - Autobomb with Shyguy
                    dw CODE_129F96                          ; 27 - Autobomb fire
                    dw CODE_12D595                          ; 28 - Whale spout
                    dw CODE_129F96                          ; 29 - Flurry
                    dw CODE_12D2FD                          ; 2A - Fryguy
                    dw CODE_12D2FD                          ; 2B - Small Fryguy.
                    dw CODE_12DB43                          ; 2C - Wart.
                    dw CODE_12D800                          ; 2D - Hawkmouth boss.
                    dw CODE_12A9D3                          ; 2E - Sparky, right, slow.
                    dw CODE_12A9D3                          ; 2F - Sparky, right, fast.
                    dw CODE_12A9D3                          ; 30 - Sparky, left, slow.
                    dw CODE_12A9D3                          ; 31 - Sparky, left, fast.
                    dw CODE_129F96                          ; 32 - Small vegetable.
                    dw CODE_129F96                          ; 33 - Fresh vegetable.
                    dw CODE_129F96                          ; 34 - Vegetable thrower vegetable.
                    dw CODE_129F96                          ; 35 - Shell
                    dw CODE_129F96                          ; 36 - Coin
                    dw CODE_129F96                          ; 37 - Bomb
                    dw CODE_129F96                          ; 38 - Rocket
                    dw CODE_129F96                          ; 39 - Mushroom block
                    dw CODE_129F96                          ; 3A - POW block
                    dw CODE_12BA59                          ; 3B - Rolling log
                    dw CODE_129F96                          ; 3C - Door to dark room
                    dw CODE_12ABAA                          ; 3D - Key
                    dw CODE_129F96                          ; 3E - Potion
                    dw CODE_12AC85                          ; 3F - Mushroom
                    dw CODE_12AC85                          ; 40 - 1-Up
                    dw CODE_129F96                          ; 41 - Pidgit's carpet
                    dw CODE_12AC78                          ; 42 - Hawkmouth, face to the right
                    dw CODE_12AC78                          ; 43 - Hawkmouth, face to the left
                    dw CODE_12ABCA                          ; 44 - Crystal ball
                    dw CODE_12ABCA                          ; 45 - Star
                    dw CODE_12ABCA                          ; 46 - Stopwatch
                       
CODE_129F7A:        LDY.b $90,x                 
                    LDA   DATA_11CC45,y         
                    AND.b #$7F                  
                    STA.b $65,x                 
                    LDA   DATA_11CC8C,y         
                    STA.w $046E,x               
                    LDA   DATA_11CD1A,y         
                    STA.w $0489,x               
                    LDA   DATA_11CCD3,y         
                    STA.w $0492,x               
                    RTS
                       
CODE_129F96:        STZ.b $86,x                 
CODE_129F98:        STZ.b $79,x                 
                    LDA.b #$00                  
                    STA.b $B1,x                 
                    STA.w $042F,x               
                    STA.b $A8,x                 
                    STA.b $9F,x                 
                    STA.w $044A,x               
                    STA.b $5B,x                 
                    STA.w $0438,x               
                    STA.w $0453,x               
                    STA.w $04CD,x               
                    STA.w $04D7,x               
                    STA.w $045C,x               
                    STA.w $0477,x               
                    STA.w $0480,x               
                    STA.w $0465,x               
                    STA.w $0702,x               
                    STA.w $0D00,x               
                    STA.b $47,x                 
CODE_129FCA:        JSR.w CODE_129F7A           
CODE_129FCD:        JSR.w CODE_12C1DA           
CODE_129FD0:        INY                         
                    TYA                         
                    STA.b $6F,x                 
                    LDA   DATA_1197B0,y               
                    STA.b $3D,x                 
                    LDA.w $046E,x               
                    AND.b #$40                  
                    BEQ   CODE_129FE2           
                    ASL.b $3D,x                 
CODE_129FE2:        RTS
                       
CODE_129FE3:        JSR.w CODE_129F96           
                    LDY.b $6E                   
                    LDA.w $04C1                 
                    ADC   DATA_119793,y               
                    STA.b $29,x                 
                    LDA.w $04BF                 
                    ADC.b #$00                  
                    STA.b $15,x                 
CODE_129FF7:        LDA.b $1E                   
                    BPL   CODE_129FFF           
                    LDY.b #$00                  
                    BEQ   CODE_12A009           
CODE_129FFF:        LDA.b $32                   
                    SEC                         
                    SBC.b $CB                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_12A009:        LDA   DATA_119796,y               
                    STA.b $47,x                 
                    RTS
                       
CODE_12A00F:        JSR.w CODE_129F96           
                    LDA.b #$0C                ; \ X speed = #$0C.
                    STA.b $3D,x               ; /
                    LDA.b #$A0                ; \Phanto takeoff timer
                    STA.w $0595               ; /
                    RTS
                       
CODE_12A01C:        JSR.w CODE_129F96           
                    LDA.b #$FF                  
                    STA.b $86,x                 
                    RTS
                       
CODE_12A024:        JSR.w CODE_12DE6A           
                    JSR.w CODE_12A745           
                    LDA.b $D8                   
                    AND.b #$04                  
                    BEQ   CODE_12A033           
                    JMP.w CODE_12BD29           

CODE_12A033:        LDA.b $51,x                 
                    BNE   CODE_12A0A2           
                    LDA.w $049B,x               
                    BEQ   CODE_12A06C           
CODE_12A03C:        STA.w $04B8                 
                    JSR.w CODE_12BAB4           
                    JSR.w CODE_129D1B           
                    LDA.b #$0B                ; \ Boss is cleared.
                    STA.w $1DE2               ; /
                    LDA.w $04F0,x               
                    STA.b $15,x                 
                    LDA.b #$80                  
                    STA.b $29,x                 
                    ASL   A                     
                    STA.b $1F,x                 
                    LDA.b #$B0                  
                    LDY.b $90,x                 
                    CPY.b #$21                  
                    BNE   CODE_12A060           
                    LDA.b #$70                  
CODE_12A060:        STA.b $33,x                 
                    LDA.b #$41                  
                    STA.b $65,x                 
                    STA.w $046E,x               
                    JMP.w CODE_12B1F9           

CODE_12A06C:        LDA.b $90,x                 
                    CMP.b #$1B                  
                    BEQ   CODE_12A0A2           
                    INC.w $04AD                 
                    LDY.w $04AD                 
                    CPY.b #$08                  
                    BCC   CODE_12A0A2           
                    LDA.b #$00                  
                    STA.w $04AD                 
                    LDA.b #$01                  
                    STA.b $51,x                 
                    STA.b $65,x                 
                    LDA.b #$07                  
                    STA.w $046E,x               
                    LDA.b #$00                  
                    STA.b $90,x                 
                    LDA.b $33,x                 
                    SBC.b #$60                  
                    STA.b $33,x                 
                    LDA.b $1F,x                 
                    SBC.b #$00                  
                    STA.b $1F,x                 
CODE_12A09C:        LDA.b #$FF                  
                    STA.w $0441,x               
                    RTS
                       
CODE_12A0A2:        ASL.b $65,x                 
                    SEC                         
                    ROR.b $65,x                 
CODE_12A0A7:        JSR.w CODE_12BD29           
CODE_12A0AA:        LDA.w $044A,x               
                    BNE   CODE_12A0B2           
                    JSR.w CODE_12C1EF           
CODE_12A0B2:        JSR.w CODE_12C1EA           
                    LDA.b $47,x               ; \ Check if negative Y speed (rise up).
                    BMI   CODE_12A0BD         ; / If so, decrease rising speed.
                    CMP.b #$3E                ; \ Check if falling at maximum speed.
                    BCS   CODE_12A0C1         ; / If so, return, and don't fall any faster.
CODE_12A0BD:        INC.b $47,x               ; \ Gravity.
                    INC.b $47,x               ; /
CODE_12A0C1:        RTS                       ; Return.
                       
CODE_12A0C2:        JSR.w CODE_12A745           
                    LDA.b $86,x                 
                    BNE   CODE_12A0CC           
                    JMP.w CODE_12A5B2           

CODE_12A0CC:        JSR.w CODE_12A0DA           
                    JMP.w CODE_12A4A1           

DATA_12A0D2:        db $00,$00,$EC,$EA

DATA_12A0D6:        db $00,$00,$F6,$00
                 
CODE_12A0DA:        LDA.b $86,x                  
                    AND.b #$18           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12A0D2,x             
                    BEQ   CODE_12A15F           
                    STA.w $0712                 
                    LDA.l DATA_12A0D6,x             
                    STA.w $0713                 
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0429                 
                    STA.w $0800,y               
                    LDA.w $042C                 
                    CLC                         
                    ADC.w $0713                 
                    STA.w $0801,y               
                    LDA.w $0712                 
                    STA.w $0802,y               
                    LDA.b #$2B                  
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $0A20,y               
                    LDA.w $0429                 
                    CMP.b #$F0                  
                    BCC   CODE_12A15F           
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDX.w $02F8                 
                    LDA.w $0800,y               
                    STA.w $0800,x               
                    LDA.w $0801,y               
                    STA.w $0801,x               
                    LDA.w $0802,y               
                    STA.w $0802,x               
                    LDA.w $0803,y               
                    STA.w $0803,x               
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
                    LDA.b #$03                  
                    STA.w $0A20,y               
                    DEC   A                     
                    STA.w $0A21,y               
CODE_12A15F:        SEP   #$10                  
                    LDX.b $12                   
                    RTS
                       
CODE_12A164:        JSR.w CODE_12A745           
                    LDA.b $86,x                 
                    BEQ   CODE_12A1A0           
                    TAY                         
                    LSR   A                     
                    LSR   A                     
                    AND.b #$01                  
                    STA.b $6F,x                 
                    LDA.b #$01                  
                    STA.b $65,x                 
                    STA.w $046E,x               
                    LDA.b #$3C                  
                    CPY.b #$0C                  
                    BCC   CODE_12A181           
                    LDA.b #$3E                  
CODE_12A181:        JSR.w CODE_12BDD5           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.b $90,x               ; \ If not a POW sprite, then...
                    CMP.b #$3A                ;  | have regular properties...
                    BNE   CODE_12A193         ; /
                    LDA.b #$22                ; YXPPCCCT of flat POW sprite. Highest priority bit set, palette 9, GFX page 0.
                    BRA   CODE_12A19A           

CODE_12A193:        LDA.w $0803,y               
                    AND.b #$F0                  
                    ORA.b #$04                  
CODE_12A19A:        STA.w $0803,y               
                    SEP   #$10                  
                    RTS
                       
CODE_12A1A0:        LDA.b #$00                  
                    JSL.l CODE_13FBC2           
                    JMP.w CODE_12A83B           

DATA_12A1A9:        db $40,$2E,$2C
             
CODE_12A1AC:        JSR.w CODE_12A745                   
                    LDA.b $86,x                 
                    BEQ   CODE_12A1A0           
                    PHX                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12A1A9,x             
                    STA.w $0711                 
                    TXY                         
                    PLX                         
                    LDA.b #$01                  
                    STA.b $65,x                 
                    STA.w $046E,x               
                    STA.b $6F,x                 
                    LDA.w $02F6                 
                    STA.w $02F8                 
                    LDA.w $02F7                 
                    STA.w $02F9                 
                    CPY.b #$02                  
                    BNE   CODE_12A1E3           
                    LDA.b #$CA                  
                    JSR.w CODE_12A181           
                    JSL.l CODE_14E483           
CODE_12A1E3:        LDA.b $33,x                 
                    STA.w $0716                 
                    LDA.b $1F,x                 
                    STA.w $0717                 
                    LDA.b $CB                   
                    STA.w $070F                 
                    LDA.b $CA                   
                    STA.w $0710                 
                    LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$30                  
                    CLC                         
                    ADC.w #$FFF4                
                    STA.w $0712                 
                    CLC                         
                    ADC.w #$0018                
                    STA.w $0714                 
                    LDA.w $0716                 
                    SEC                         
                    SBC.w $070F                 
                    CLC                         
                    ADC.w #$FFFC                
                    STA.w $0716                 
                    SEP   #$20                  
                    LDA.w $0717                 
                    BNE   CODE_12A26A           
                    LDY.w $02F8                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    LDA.w $0714                 
                    STA.w $0804,y               
                    LDA.w $0716                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    LDA.w $0711                 
                    STA.w $0802,y               
                    STA.w $0806,y               
                    LDA.b #$66                  
                    STA.w $0803,y               
                    AND.b #$BF                  
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0713                 
                    AND.b #$01                  
                    ORA.b #$02                  
                    STA.w $0A20,y               
                    LDA.w $0715                 
                    AND.b #$01                  
                    ORA.b #$02                  
                    STA.w $0A21,y               
CODE_12A26A:        SEP   #$10                  
                    RTS
                       
CODE_12A26D:        LDA.b #$00                  
                    JSL.l CODE_13FBC2           
                    JMP.w CODE_12A83B           

CODE_12A276:        JSR.w CODE_12A745           
                    JSR.w CODE_12BB16           
                    LDA.w $042F,x               
                    BEQ   CODE_12A284           
                    STZ.w $042F,x               
CODE_12A284:        LDA.b $A8,x                 
                    BEQ   CODE_12A28D           
                    LDA.b #$01                  
                    STA.b $51,x                 
                    RTS
                       
CODE_12A28D:        LDA.b $86,x                 
                    BEQ   CODE_12A26D           
                    LDA.b $90,x                 
                    CMP.b #$32                  
                    BCS   CODE_12A2AD                   
                    JSR.w CODE_12AA43           
                    LDA.b $10                   
                    AND.b #$03                  
                    STA.w $044A,x               
                    LDA.b $10                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ADC.b #$01                  
                    STA.b $6F,x                 
CODE_12A2AD:        JSR.w CODE_12B4EA           
                    JMP.w CODE_12DE6A  
         
DATA_12A2B3:        db $C6,$C8,$E6,$E8                      ; Tilemap of "BOMB"

DATA_12A2B7:        db $F8,$08,$F8,$08                      ; XDisp of "BOMB"

DATA_12A2BB:        db $F0,$F0,$00,$00                      ; YDisp of "BOMB"
                 
CODE_12A2BF:        JSR.w CODE_12A745           
                    LDA.b $ED                   
                    ORA.b $EE                   
                    BNE   CODE_12A26D           
                    LDA.b $86,x                 
                    BEQ   CODE_12A26D           
                    CMP.b #$1A                  
                    BCS   CODE_12A2D8           
                    SBC.b #$11                  
                    BMI   CODE_12A2D8           
                    TAY                         
                    JSR.w CODE_12A32D           
CODE_12A2D8:        LDA.b #$01                ; \ A != 00 so the following routine has effect.
                    JSL.l CODE_13FBC2         ; / Background colour effect.
                    REP   #$10                  
                    LDX.w #$0000                
                    LDY.w #$0020                
CODE_12A2E6:        LDA.w $0429               ; \ Get sprite's original X pos...
                    CLC                       ;  | and add the XDisp to it...
                    ADC   DATA_12A2B7,x       ;  | per tile.
                    STA.w $0800,y             ; /
                    LDA.w $042C               ; \ Same goes for Y pos...
                    CLC                       ;  | but then with YDisp instead.
                    ADC   DATA_12A2BB,x       ;  |
                    STA.w $0801,y             ; /
                    LDA.l DATA_12A2B3,x         ; \ Transfer tilemap. 
                    STA.w $0802,y             ; /
                    LDA.b $10                 ; \ Palette animation and more fancy YXPPCCCT properties data...
                    AND.b #$06                ;  | right here.
                    ORA.b #$20                ;  |
                    STA.w $0803,y             ; /
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$02                ; \ Size of all tiles = 16x16
                    STA.w $0A20,y             ; /
                    PLY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.w #$0004                
                    BNE   CODE_12A2E6           
                    SEP   #$10                  
                    LDX.b $12                   
                    JMP.w CODE_12DE6A           

CODE_12A32C:        RTS
                       
CODE_12A32D:        LDA.b $29,x                 
                    CLC                         
                    ADC   DATA_1197B6,y               
                    STA.b $0C                   
                    LDA.b $15,x                 
                    ADC   DATA_1197BF,y               
                    STA.b $0D                   
                    CMP.b #$0B                  
                    BCS   CODE_12A32C                   
                    LDA.b $33,x                 
                    ADC   DATA_1197C8,y               
                    AND.b #$F0                  
                    STA.b $0E                   
                    STA.b $0B                   
                    LDA.b $1F,x                 
                    ADC   DATA_1197D1,y               
                    STA.b $0F                   
                    CMP.b #$0A                  
                    BCS   CODE_12A32C                   
                    LDY.b $EB                   
                    BNE   CODE_12A37A           
                    LSR   A                     
                    ROR.b $0E                   
                    LSR   A                     
                    ROR.b $0E                   
                    LSR   A                     
                    ROR.b $0E                   
                    LSR   A                     
                    ROR.b $0E                   
                    LDA.b $0E                   
                    LDY.b #$FF                  
CODE_12A36A:        SEC                         
                    SBC.b #$0F                  
                    INY                         
                    BCS   CODE_12A36A                   
                    STY.b $0D                   
                    ADC.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $0E                   
CODE_12A37A:        LDA.b $0C                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $04                   
                    ORA.b $0E                   
                    STA.b $05                   
                    LDA.b #$7E                  
                    STA.b $09                   
                    LDY.b #$00                  
                    LDA.w $04BF                 
                    CMP.b #$0A                  
                    BNE   CODE_12A398           
                    STY.b $0D                   
                    STZ.b $09                   
                    INY                         
CODE_12A398:        LDA.b #$10                  
                    STA.b $07                   
                    LDA   DATA_1197DA,y               
                    STA.b $08                   
                    LDY.w $0534                 
                    LDA   DATA_11AB11,y               
                    CLC                         
                    ADC.b $08                   
                    STA.b $08                   
                    LDY.b $0D                   
CODE_12A3AE:        LDA.b $07                   
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $07                   
                    LDA.b $08                   
                    ADC.b #$00                  
                    STA.b $08                   
                    DEY                         
                    BPL   CODE_12A3AE           
                    REP   #$20                  
                    LDA.b $07                   
                    CLC                         
                    ADC.w #$7000                
                    STA.b $00                   
                    SEP   #$20                  
                    LDA.b $09                   
                    STA.b $02                   
                    LDY.b $05                   
                    LDA.b [$00],y               
                    BNE   CODE_12A3E2           
                    LDA.b [$07],y               
                    CMP.b #$AB                  
                    BEQ   CODE_12A3E3           
                    CMP.b #$9D                  
                    BEQ   CODE_12A3E3           
                    CMP.b #$6D                  
                    BEQ   CODE_12A3E3           
CODE_12A3E2:        RTS
                       
CODE_12A3E3:        LDA.b #$40                  
                    STA.b [$07],y               
                    LDA.b $0D                   
                    AND.b #$01                  
                    EOR.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    LDY.b $EB                   
                    BNE   CODE_12A3F4           
                    ASL   A                     
CODE_12A3F4:        PHA                         
                    LDA.b $0E                   
                    STA.b $02                   
                    LDA.b $0C                   
                    AND.b #$F0                  
                    STA.b $03                   
                    LDA.b #$08                  
                    STA.b $00                   
                    LDA.b $02                   
                    ASL   A                     
                    ROL.b $00                   
                    ASL   A                     
                    ROL.b $00                   
                    AND.b #$E0                  
                    STA.b $01                   
                    LDX.w $0300                 
                    LDA.b $03                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.b $01                   
                    STA.w $0303,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $030B,x               
                    PLA                         
                    ORA.b $00                   
                    AND.b #$0F                  
                    STA.w $0302,x               
                    ADC.b #$00                  
                    STA.w $030A,x               
                    REP   #$20                  
                    LDA.w #$0300                
                    STA.w $0304,x               
                    STA.w $030C,x               
                    LDA.w #$00BF                
                    STA.w $0306,x               
                    STA.w $0308,x               
                    STA.w $030E,x               
                    STA.w $0310,x               
                    TXA                         
                    CLC                         
                    ADC.w #$0010                
                    STA.w $0300                 
                    SEP   #$20                  
                    LDA.b #$FF                  
                    STA.w $0312,x               
                    LDX.b #$08                  
CODE_12A45A:        LDA.b $51,x                 
                    BEQ   CODE_12A463           
                    DEX                         
                    BPL   CODE_12A45A           
                    BMI   CODE_12A480           
CODE_12A463:        LDA.b $0C                   
                    AND.b #$F0                  
                    STA.b $29,x                 
                    LDA.b $0D                   
                    LDY.b $EB                   
                    BNE   CODE_12A470           
                    TYA                         
CODE_12A470:        STA.b $15,x                 
                    LDA.b $0B                   
                    STA.b $33,x                 
                    LDA.b $0F                   
                    STA.b $1F,x                 
                    JSR.w CODE_129F98           
                    JSR.w CODE_12BA3D           
CODE_12A480:        LDX.b $12                   
CODE_12A482:        RTS
                       
CODE_12A483:        JSR.w CODE_12A745           
                    LDA.b $65,x                 
                    ORA.b #$10                  
                    STA.b $65,x                 
                    AND.b #$40                  
                    STA.b $0E                   
                    LDA.b $86,x                 
                    BNE   CODE_12A497           
                    JMP.w CODE_12A5B2           

CODE_12A497:        LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA   DATA_1197DC,y               
                    JSR.w CODE_12A5CC           
CODE_12A4A1:        LDA.w $049B,x               
                    BEQ   CODE_12A482           
                    LDA.b $86,x                 
                    CMP.b #$03                  
                    BNE   CODE_12A482           
                    LDY.b #$02                  
                    LDA.b $90,x                 
                    CMP.b #$21                  
                    BNE   CODE_12A4C4           
                    DEY                         
                    LDA.b #$49                  
                    STA.w $1486                 
                    STA.w $1490                 
                    INC   A                     
                    STA.w $149C                 
                    STA.w $14AA                 
CODE_12A4C4:        STY.w $144E                 
                    STY.w $145A                 
                    INY                         
                    STY.w $1466                 
                    STY.w $1476                 
                    LDY.b #$03                  
CODE_12A4D3:        LDA.w $04F0,x               
                    AND.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    EOR.b #$04                  
                    LDX.b $EB                   
                    BNE   CODE_12A4E1           
                    ASL   A                     
CODE_12A4E1:        LDX.w $CE40,y               
                    ORA.w $144E,x               
                    STA.w $144E,x               
                    LDX.b $12                   
                    DEY                         
                    BPL   CODE_12A4D3           
                    LDA.b $EB                   
                    BNE   CODE_12A504           
                    LDA.b #$52                  
                    STA.w $1486                 
                    STA.w $1490                 
                    INC   A                     
                    STA.w $149C                 
                    STA.w $14AA                 
                    BRA   CODE_12A51A           

CODE_12A504:        LDA.w $0635                 
                    CMP.b #$06                  
                    BNE   CODE_12A51A           
                    LDA.b #$4E                  
                    STA.w $1486                 
                    STA.w $1490                 
                    INC   A                     
                    STA.w $149C                 
                    STA.w $14AA                 
CODE_12A51A:        LDA.b #$14                  
                    STA.b $11                   
                    LDY.w $04F0,x               
                    LDA.b #$7E                  
                    STA.b $02                   
                    LDA.b #$1F                  
                    STA.b $01                   
                    PHY                         
                    LDY.w $0534                 
                    LDA   DATA_11AB11,y               
                    CLC                         
                    ADC.b $01                   
                    STA.b $01                   
                    PLY                         
                    LDA.b #$10                  
                    STA.b $00                   
CODE_12A53A:        LDA.b $00                   
                    CLC                         
                    ADC.b #$F0                  
                    STA.b $00                   
                    LDA.b $01                   
                    ADC.b #$00                  
                    STA.b $01                   
                    DEY                         
                    BPL   CODE_12A53A           
                    LDA.b $90,x                 
                    CMP.b #$21                  
                    BNE   CODE_12A55D           
                    LDA.b $00                   
                    SEC                         
                    SBC.b #$40                  
                    STA.b $00                   
                    LDA.b $01                   
                    SBC.b #$00                  
                    STA.b $01                   
CODE_12A55D:        LDA.b #$7F                  
                    STA.b $05                   
                    LDA.w $04F0,x               
                    TAX                         
                    LDA.l DATA_11AB25,x             
                    STA.b $04                   
                    LDA.l DATA_11AB1B,x             
                    STA.b $03                   
                    LDA.w $0635                 
                    CMP.b #$04                  
                    BNE   CODE_12A57F           
                    LDA.b $03                   
                    SEC                         
                    SBC.b #$40                  
                    STA.b $03                   
CODE_12A57F:        LDY.b #$B8                  
                    LDA.b #$56                  
                    STA.b [$00],y               
                    LDA.b #$00                  
                    STA.b [$03],y               
                    LDA.b #$56                  
                    LDY.b #$C8                  
                    STA.b [$00],y               
                    LDA.b #$02                  
                    STA.b [$03],y               
                    LDA.b #$40                  
                    LDY.b #$B9                  
                    STA.b [$00],y               
                    LDA.b #$01                  
                    STA.b [$03],y               
                    LDA.b #$40                  
                    LDY.b #$C9                  
                    STA.b [$00],y               
                    LDA.b #$03                  
                    STA.b [$03],y               
                    LDA.b #$40                  
                    LDY.b #$CA                  
                    STA.b [$00],y               
                    LDA.b #$01                  
                    STA.b [$03],y               
                    RTS
                       
CODE_12A5B2:        LDA.b $90,x                 
                    CMP.b #$2B                  
                    BNE   CODE_12A5C5           
                    DEC.w $04F9                 
                    BPL   CODE_12A5C5           
                    INC.w $049B,x               
                    INC.b $90,x                 
                    JMP.w CODE_12A03C           

CODE_12A5C5:        JMP.w CODE_12A83B           


DATA_12A5C8:                      db $86,$A1,$A0,$87   

               
CODE_12A5CC:        PHX                         
                    PHA                         
                    LDA.b $29,x                 
                    STA.b $08                   
                    LDA.b $15,x                 
                    STA.b $09                   
                    LDA.w $04C1                 
                    STA.b $0A                   
                    LDA.w $04BF                 
                    STA.b $0B                   
                    STZ.b $ED                   
                    REP   #$20                  
                    LDA.b $08                   
                    SEC                         
                    SBC.b $0A                   
                    AND.w #$FF00                
                    BEQ   CODE_12A5F3           
                    LDA.w #$0001                
                    TSB.b $ED                   
CODE_12A5F3:        LDA.b $08                   
                    CLC                         
                    ADC.w #$0008                
                    SEC                         
                    SBC.b $0A                   
                    AND.w #$FF00                
                    BEQ   CODE_12A606           
                    LDA.w #$0002                
                    TSB.b $ED                   
CODE_12A606:        SEP   #$20                  
                    PLA                         
                    STA.b $0F                   
                    TYX                         
                    REP   #$30                  
                    TXA                         
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDY.w $02F6                 
CODE_12A618:        LDA.w $042C                 
                    STA.w $0713                 
                    LDA.l DATA_12A5C8,x             
                    STA.w $0712                 
                    JSR.w CODE_12A66B           
                    PHX                         
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    PLX                         
                    LDY.w $02F8                 
                    LDA.l DATA_12A5C8,x             
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0712                 
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0713                 
                    JSR.w CODE_12A66B           
                    PHX                         
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDY.w $02F8                 
                    PLX                         
                    LDA.b $0E                   
                    EOR.b #$40                  
                    STA.b $0E                   
                    BNE   CODE_12A667           
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$11                  
                    STA.w $042C                 
                    BRA   CODE_12A618           

CODE_12A667:        SEP   #$10                  
                    PLX                         
                    RTS
                       
CODE_12A66B:        LDA.w $0429                 
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    LDA.w $0713                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    LDA.w $0712                 
                    STA.w $0802,y               
                    STA.w $0806,y               
                    LDA.b #$26                  
                    STA.w $0803,y               
                    ORA.b #$40                  
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $ED                   
                    AND.b #$01                  
                    STA.w $0A20,y               
                    LDA.b $ED                   
                    LSR   A                     
                    AND.b #$01                  
                    STA.w $0A21,y               
                    RTS
                       
CODE_12A6AB:        JSR.w CODE_12A745           
                    LDA.b #$12                  
                    STA.b $65,x                 
                    LDA.b $86,x               ; \ If timer is up...
                    BEQ   CODE_12A6ED         ; / branch.
                    LDA.b #$F8                ; \ Y speed of sand = #$F8.
                    STA.b $47,x               ; /
                    JSR.w CODE_12C1EA           
                    LDA.b #$B2                ; Tile number of sand tile for the first 16 frames.
                    LDY.b $86,x               ; \ Check if halfway...
                    CPY.b #$10                ;  | (16 frames done)
                    BCS   CODE_12A6D8         ; / If not, branch, and keep this tile.
                    LDA.b #$80                  
                    STA.w $046E,x               
                    LDA.b #$01                  
                    STA.b $65,x                 
                    ASL   A                     
                    STA.b $6F,x                 
                    INC.b $9F,x                 
                    JSR.w CODE_12AA43           
                    LDA.b #$B4                ; Tile number of sand tile for the last 16 frames.
CODE_12A6D8:        JSR.w CODE_12BDD5           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0803,y               
                    AND.b #$F0                  
                    ORA.b #$02                  
                    STA.w $0803,y               
                    SEP   #$10                  
                    RTS
                       
CODE_12A6ED:        CPX.w $042D                 
                    BNE   CODE_12A6F6           
                    LDA.b #$00                  
                    STA.b $9C                   
CODE_12A6F6:        JMP.w CODE_12A83B           

CODE_12A6F9:        LDA.b #$00                  
                    STA.b $ED                   
                    LDA.b $65,x                 
                    LDY.b #$01                  
                    AND.b #$04                  
                    BNE   CODE_12A71E           
                    LDA.b $90,x                 
                    CMP.b #$1A                  
                    BEQ   CODE_12A71E           
                    CMP.b #$08                  
                    BEQ   CODE_12A71E           
                    CMP.b #$2D                  
                    BEQ   CODE_12A71E           
                    CMP.b #$21                  
                    BEQ   CODE_12A71E           
                    LDA.w $046E,x               
                    AND.b #$20                  
                    BEQ   CODE_12A720           
CODE_12A71E:        LDY.b #$03                  
CODE_12A720:        LDA.b $29,x                 
                    CLC                         
                    ADC   DATA_1197E4,y               
                    STA.b $0E                   
                    LDA.b $15,x                 
                    ADC.b #$00                  
                    STA.b $0F                   
                    LDA.b $0E                   
                    CMP.w $04C1                 
                    LDA.b $0F                   
                    SBC.w $04BF                 
                    BEQ   CODE_12A741           
                    LDA.b $ED                   
                    ORA   DATA_1197E0,y               
                    STA.b $ED                   
CODE_12A741:        DEY                         
                    BPL   CODE_12A720           
CODE_12A744:        RTS
                       
CODE_12A745:        JSR.w CODE_12A6F9           
                    LDA.b #$30                  
                    LDY.b $90,x                 
                    CPY.b #$2C                  
                    BEQ   CODE_12A78B           
                    LDA.b #$1E                  
                    CPY.b #$38                  
                    BEQ   CODE_12A78B           
                    CPY.b #$12                  
                    BEQ   CODE_12A78B           
                    CPY.w $0041                 
                    BEQ   CODE_12A78B           
                    LDA.b #$22                  
                    CPY.b #$1F                  
                    BEQ   CODE_12A78B           
                    CPY.b #$18                  
                    BEQ   CODE_12A78B           
                    CPY.b #$19                  
                    BEQ   CODE_12A78B           
                    CPY.b #$1C                  
                    BEQ   CODE_12A78B           
                    CPY.b #$1D                  
                    BEQ   CODE_12A78B           
                    CPY.b #$21                  
                    BEQ   CODE_12A78B           
                    CPY.b #$08                  
                    BEQ   CODE_12A78B           
                    CPY.b #$26                  
                    BEQ   CODE_12A78B           
                    CPY.b #$2D                  
                    BEQ   CODE_12A78B           
                    CPY.b #$35                  
                    BEQ   CODE_12A78B           
                    LDA.b #$10                  
CODE_12A78B:        ADC.b $33,x                 
                    STA.b $00                   
                    LDA.b $1F,x                 
                    ADC.b #$00                  
                    STA.b $01                   
                    LDA.b $00                   
                    CMP.b $CB                   
                    LDA.b $01                   
                    SBC.b $CA                   
                    STA.b $EE                   
                    CPY.b #$17                  
                    BEQ   CODE_12A744           
                    CPY.b #$41                  
                    BEQ   CODE_12A744           
                    CPY.b #$43                  
                    BEQ   CODE_12A744           
                    CPY.b #$2D                  
                    BEQ   CODE_12A744           
                    TXA                         
                    AND.b #$01                  
                    STA.b $00                   
                    LDA.b $10                   
                    AND.b #$01                  
                    EOR.b $00                   
                    BNE   CODE_12A744           
                    LDA.b $CB                   
                    SBC.b #$30                  
                    STA.b $01                   
                    LDA.b $CA                   
                    SBC.b #$00                  
                    STA.b $00                   
                    INC.b $00                   
                    LDA.b $CB                   
                    ADC.b #$FF                  
                    PHP                         
                    ADC.b #$30                  
                    STA.b $03                   
                    LDA.b $CA                   
                    ADC.b #$00                  
                    PLP                         
                    ADC.b #$00                  
                    STA.b $02                   
                    INC.b $02                   
                    LDA.b $33,x                 
                    CMP.b $01                   
                    LDY.b $1F,x                 
                    INY                         
                    TYA                         
                    SBC.b $00                   
                    BMI   CODE_12A837           
                    LDA.b $33,x                 
                    CMP.b $03                   
                    LDY.b $1F,x                 
                    INY                         
                    TYA                         
                    SBC.b $02                   
                    BPL   CODE_12A837           
                    LDA.w $04C1                 
                    SBC.b #$30                  
                    STA.b $01                   
                    LDA.w $04BF                 
                    SBC.b #$00                  
                    STA.b $00                   
                    INC.b $00                   
                    LDA.w $04C2                 
                    ADC.b #$30                  
                    STA.b $03                   
                    LDA.w $04C0                 
                    ADC.b #$00                  
                    STA.b $02                   
                    INC.b $02                   
                    LDA.b $29,x                 
                    CMP.b $01                   
                    LDY.b $15,x                 
                    INY                         
                    TYA                         
                    SBC.b $00                   
                    BMI   CODE_12A82E           
                    LDA.b $29,x                 
                    CMP.b $03                   
                    LDY.b $15,x                 
                    INY                         
                    TYA                         
                    SBC.b $02                   
                    BMI   CODE_12A84B           
CODE_12A82E:        LDY.b $90,x                 
                    LDA   DATA_11CC8C,y               
                    AND.b #$08                  
                    BNE   CODE_12A84B           
CODE_12A837:        LDA.b $A8,x                 
                    BNE   CODE_12A84B           
CODE_12A83B:        LDY.w $0441,x               
                    BMI   CODE_12A846           
                    LDA.b ($CC),y               
                    AND.b #$7F                  
                    STA.b ($CC),y               
CODE_12A846:        STZ.b $51,x                 
                    STZ.w $042F,x               
CODE_12A84B:        RTS
                       
CODE_12A84C:        LDA.b #$01                  
                    STA.w $04A4,x               
                    LDY.w $042F,x               
                    DEY                         
                    CPY.b #$1F                  
                    BCS   CODE_12A85C                   
                    INC.w $042F,x               
CODE_12A85C:        JSR.w CODE_12A745           
                    LDA.b $50                   
                    CMP.b #$08                  
                    BEQ   CODE_12A881           
                    LDA.b $D8                   
                    AND.b #$04                  
                    BNE   CODE_12A8B0           
                    LDA.w $0500                 
                    BEQ   CODE_12A87C           
                    LDA.b $90,x                 
                    CMP.b #$1A                  
                    BEQ   CODE_12A8C0           
                    CMP.b #$08                  
                    BEQ   CODE_12A8C0           
                    BRA   CODE_12A881           

CODE_12A87C:        LDA.w $0438,x               
                    BEQ   CODE_12A8C0           
CODE_12A881:        LDA.b $90,x                 
                    CMP.b #$2B                  
                    BEQ   CODE_12A8C0           
                    CMP.b #$00                  
                    BEQ   CODE_12A8C0           
                    CMP.b #$41                  
                    BEQ   CODE_12A893           
                    CMP.b #$32                  
                    BCS   CODE_12A8C0                   
CODE_12A893:        JSR.w CODE_12BB16           
                    LDA.w $042F,x               
                    BEQ   CODE_12A8A4           
                    LDA.b $50                   
                    CMP.b #$08                  
                    BEQ   CODE_12A8A4           
                    JSR.w CODE_12A0AA           
CODE_12A8A4:        LDA.b $A8,x                 
                    BEQ   CODE_12A8AD           
                    DEC.b $9F,x                 
                    JMP.w CODE_12B692           

CODE_12A8AD:        JSR.w CODE_12DE6A           
CODE_12A8B0:        LDA.b $90,x                 
                    CMP.b #$18                  
                    BNE   CODE_12A8BD           
                    LDA.b $5B,x                 
                    AND.b #$08                  
                    BEQ   CODE_12A8BD           
                    RTS
                       
CODE_12A8BD:        JMP.w CODE_12BD29           

CODE_12A8C0:        LDY.b #$01                  
                    LDA.b $3D,x                 
                    BEQ   CODE_12A8CC           
                    BPL   CODE_12A8C9           
                    INY                         
CODE_12A8C9:        TYA                         
                    STA.b $6F,x                 
CODE_12A8CC:        LDY.b $90,x                 
                    LDA   DATA_11CC45,y               
                    AND.b #$20                  
                    BNE   CODE_12A914           
                    LDA.b $65,x                 
                    AND.b #$DF                  
                    STA.b $65,x                 
                    LDA.b #$06                  
                    STA.w $0712                 
                    LDA.w $06C2                 
                    BEQ   CODE_12A8EA           
                    LDA.b #$04                  
                    STA.w $0712                 
CODE_12A8EA:        LDA.b $A8,x                 
                    CMP.w $0712                 
                    BCC   CODE_12A914           
                    LDA.w $0D00,x               
                    BNE   CODE_12A914           
                    LDA.b $90,x                 
                    CMP.b #$09                  
                    BNE   CODE_12A902           
                    LDA.b $5B,x                 
                    AND.b #$04                  
                    BNE   CODE_12A907           
CODE_12A902:        LDA   DATA_11CC45,y               
                    BPL   CODE_12A914           
CODE_12A907:        LDA.w $04EF                 
                    BNE   CODE_12A914           
                    LDA.b $65,x                 
                    ORA.b #$20                  
                    AND.b #$EF                  
                    STA.b $65,x                 
CODE_12A914:        JSR.w CODE_12A937           
                    LDA.b $EB                   
                    BNE   CODE_12A928           
                    LDA.b $90,x                 
                    CMP.b #$0F                  
                    BNE   CODE_12A928           
                    LDA.w $0429                 
                    CMP.b #$F4                  
                    BCS   CODE_12A933                   
CODE_12A928:        LDA.b $1F,x                 
                    BMI   CODE_12A934           
                    LDA.w $042C                 
                    CMP.b #$E8                  
                    BCC   CODE_12A934           
CODE_12A933:        RTS
                       
CODE_12A934:        JMP.w CODE_12DE6A     
      
CODE_12A937:        LDA.b $90,x                 
                    JSL.l CODE_118776   

                    dw CODE_12AEC3                          ; 00 - Heart.
                    dw CODE_12B4D1                          ; 01 - Red Shyguy.
                    dw CODE_12B4D1                          ; 02 - Tweeter.
                    dw CODE_12B4D1                          ; 03 - Blue Shyguy.
                    dw CODE_12B4D1                          ; 04 - Porcupo.
                    dw CODE_12B4D1                          ; 05 - Red Snifit.
                    dw CODE_12B4D1                          ; 06 - Grey snifit.
                    dw CODE_12B4D1                          ; 07 - Blue snifit.
                    dw CODE_12C97A                          ; 08 - Ostro with Red Shyguy.
                    dw CODE_12B4A3                          ; 09 - Bob-Omb
                    dw CODE_12B29D                          ; 0A - Albatoss with Bob-Omb
                    dw CODE_12B29D                          ; 0B - Albatoss, coming from left.
                    dw CODE_12B29D                          ; 0C - Albatoss, coming from right.
                    dw CODE_12B43E                          ; 0D - Ninji, walking.
                    dw CODE_12B41A                          ; 0E - Ninji, jumping.
                    dw CODE_12B46E                          ; 0F - Beezo, gold
                    dw CODE_12B46E                          ; 10 - Beezo, red
                    dw CODE_12DC1C                          ; 11 - Wart's bubble
                    dw CODE_12C613                          ; 12 - Pidgit, carpet.
                    dw CODE_12AE26                          ; 13 - Trouter
                    dw CODE_12AE5D                          ; 14 - Hoopster
                    dw CODE_12AC25                          ; 15 - Shyguy generator
                    dw CODE_12AC25                          ; 16 - Bob-omb generator
                    dw CODE_12B373                          ; 17 - Phanto 
                    dw CODE_12CD44                          ; 18 - Cobrat, jar
                    dw CODE_12CCC5                          ; 19 - Cobrat, sand
                    dw CODE_12CDF0                          ; 1A - Pokey
                    dw CODE_12B2F3                          ; 1B - Bullet
                    dw CODE_12AF56                          ; 1C - Birdo
                    dw CODE_12C808                          ; 1D - Mouser
                    dw CODE_12B2F3                          ; 1E - Egg
                    dw CODE_12CA91                          ; 1F - Triclyde
                    dw CODE_12AACE                          ; 20 - Fireball
                    dw CODE_12C286                          ; 21 - Clawglip
                    dw CODE_12C469                          ; 22 - Rock
                    dw CODE_12AB21                          ; 23 - Panser, red
                    dw CODE_12AB19                          ; 24 - Panser, blue
                    dw CODE_12AB21                          ; 25 - Panser, green
                    dw CODE_12D440                          ; 26 - Autobomb with Shyguy
                    dw CODE_12B2E6                          ; 27 - Autobomb fire
                    dw CODE_12D59D                          ; 28 - Whale spout
                    dw CODE_12D796                          ; 29 - Flurry
                    dw CODE_12D30A                          ; 2A - Fryguy
                    dw CODE_12D3C4                          ; 2B - Small Fryguy,
                    dw CODE_12DB51                          ; 2C - Wart.
                    dw CODE_12D809                          ; 2D - Hawkmouth boss.
                    dw CODE_12A9E3                          ; 2E - Sparky, right, slow.
                    dw CODE_12A9E3                          ; 2F - Sparky, right, fast.
                    dw CODE_12A9E3                          ; 30 - Sparky, left, slow.
                    dw CODE_12A9E3                          ; 31 - Sparky, left, fast.
                    dw CODE_12B13D                          ; 32 - Small vegetable.
                    dw CODE_12B13D                          ; 33 - Fresh vegetable.
                    dw CODE_12B13D                          ; 34 - Vegetable thrower vegetable.
                    dw CODE_12B9E9                          ; 35 - Shell
                    dw CODE_12B027                          ; 36 - Coin
                    dw CODE_12B0D6                          ; 37 - Bomb
                    dw CODE_12CFC3                          ; 38 - Rocket
                    dw CODE_12B717                          ; 39 - Mushroom block
                    dw CODE_12B717                          ; 3A - POW block
                    dw CODE_12BA64                          ; 3B - Rolling log
                    dw CODE_12B7BA                          ; 3C - Door to dark room
                    dw CODE_12B0D3                          ; 3D - Key
                    dw CODE_12B151                          ; 3E - Potion
                    dw CODE_12B064                          ; 3F - Mushroom
                    dw CODE_12B038                          ; 40 - 1-Up
                    dw CODE_12C4F6                          ; 41 - Pidgit's carpet
                    dw CODE_12AC8D                          ; 42 - Hawkmouth, face to the right
                    dw CODE_12AC8D                          ; 43 - Hawkmouth, face to the left
                    dw CODE_12B05E                          ; 44 - Crystal ball
                    dw CODE_12AC11                          ; 45 - Star
                    dw CODE_12B064                          ; 46 - Stopwatch

CODE_12A9CB:        JSR.w CODE_129F96           
                    LDA.b #$50                  
                    STA.b $9F,x                 
                    RTS
                       
CODE_12A9D3:        JSR.w CODE_129F96           
                    LDY.b $90,x                 
                    LDA   DATA_1197BA,y               
                    STA.b $3D,x                 
                    LDA   DATA_1197BC,y               
                    STA.b $47,x                 
                    RTS
                       
CODE_12A9E3:        JSR.w CODE_12BB16           
                    JSR.w CODE_12AA43           
                    LDY.b #$0A                  
                    LDA.b $10                   
                    AND.b #$04                  
                    BEQ   CODE_12A9F3           
                    LDY.b #$06                  
CODE_12A9F3:        STY.w $0248                 
                    JSR.w CODE_12BD29           
                    LDA.b $29,x                 
                    ORA.b $33,x                 
                    AND.b #$0F                  
                    BNE   CODE_12AA38           
                    JSR.w CODE_12DDA7           
                    LDY.w $0477,x               
                    LDA.b $5B,x                 
                    AND   DATA_1197EE,y               
                    BEQ   CODE_12AA2F           
                    LDA   DATA_1197EE,y               
                    EOR.b #$0F                  
                    AND.b $5B,x                 
                    BEQ   CODE_12AA38           
                    TYA                         
                    EOR.b #$01                  
                    STA.w $0477,x               
                    TAY                         
CODE_12AA1E:        TXA                         
                    CLC                         
                    ADC   DATA_1197F0,y               
                    TAY                         
                    LDA.w $3D,y               
                    EOR.b #$FF                  
                    ADC.b #$01                  
                    STA.w $3D,y               
                    RTS                         

CODE_12AA2F:        TYA                         
                    EOR.b #$01                  
                    STA.w $0477,x               
                    JSR.w CODE_12AA1E           
CODE_12AA38:        LDA.w $0477,x               
                    BNE   CODE_12AA40           
                    JMP.w CODE_12C1EF   
        
CODE_12AA40:        JMP.w CODE_12C1EA   
        
CODE_12AA43:        INC.b $9F,x                 
                    INC.b $9F,x                 
                    RTS                         
                       
CODE_12AA48:        JSR.w CODE_12AAA7           
                    ADC   DATA_1197F2,y               
                    STA.b $29,x                 
                    LDA.w $04BF                 
                    ADC   DATA_1197F4,y               
                    STA.b $15,x                 
                    STY.b $01                   
                    LDA.b #$0A                  
                    STA.b $90,x                 
                    JSR.w CODE_129F7A           
                    LDA.w $0587                 
                    AND.b #$1F                  
                    ADC.b #$20                  
                    STA.b $33,x                 
                    LDA.w $CA                 
                    ADC.b #$00                  
                    STA.b $1F,x                 
                    LDY.b $01                   
                    JSR.w CODE_129FD0           
                    ASL.b $3D,x                 
                    RTS                         

CODE_12AA79:        JSR.w CODE_12AAA7           
                    CLC                         
                    ADC   DATA_1197F6,y               
                    STA.b $29,x                 
                    LDA.b $EB                   
                    BEQ   CODE_12AA8B           
                    LDA.w $04BF                 
                    ADC.b #$00                  
CODE_12AA8B:        STA.b $15,x                 
                    LDA.b $CB                   
                    STA.b $33,x                 
                    LDA.b $CA                   
                    STA.b $1F,x                 
                    STY.b $01                   
                    LDA.b #$0F                  
                    STA.b $90,x                 
                    JSR.w CODE_129F7A           
                    LDY.b $01                   
                    JSR.w CODE_129FD0           
                    JSR.w CODE_129FF7           
                    RTS                         
                       
CODE_12AAA7:        LDA.w $0500                 
                    BNE   CODE_12AACB           
                    LDA.w $0623                 
                    CLC                         
                    ADC.b #$03
                    STA.w $0623                                 
                    BCC   CODE_12AACB           
                    JSR.w CODE_12B335           
                    BMI   CODE_12AACB           
                    LDY.b #$00                  
                    LDA.b $10                   
                    AND.b #$40                
                    BNE   CODE_12AAC5
                    INY                 
CODE_12AAC5:        LDX.b $00                   
                    LDA.w $04C1                 
                    RTS
                       
CODE_12AACB:        PLA                         
                    PLA                         
                    RTS
                       
CODE_12AACE:        JSR.w CODE_12DDAB           
                    JSR.w CODE_12BB16           
                    LDA.w $0453,x               
                    BNE   CODE_12AAE1           
                    LDA.b #$04
                    STA.w $0453,x               
                    INC.w $0480,x               
CODE_12AAE1:        LDA.w $0480,x               
                    CMP.b #$03
                    BCC   CODE_12AAED                
                    LDA.b #$00                   
                    STA.w $0480,x                  
           
CODE_12AAED:        LDA.b $65,x                 
                    AND.b #$EF
                    STA.b $65,x       
                    LDA.w $0480,x                              
                    ASL   A                     
                    STA.w $0712                 
                    LDY.b $90,x                 
                    LDA   DATA_11993B,y               
                    CLC                         
                    ADC.w $0712                 
                    JSR.w CODE_12BDD5           
                    LDA.b $79,x                 
                    BNE   CODE_12AB0D           
                    JMP.w CODE_12A0AA           

CODE_12AB0D:        LDA.b $5B,x                 
                    AND.b #$03
                    BEQ   $03
                    JSR.w CODE_12B1F9  
                    JMP.w CODE_12B497               
           
CODE_12AB19:        LDA.b $9F,x                 
                    ASL   A                     
                    BNE   CODE_12AB21           
                    JSR.w CODE_129FCD           
CODE_12AB21:        JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    PHA                         
                    AND.b #$04                  
                    BEQ   CODE_12AB2E           
                    JSR.w CODE_12B659           
CODE_12AB2E:        PLA                         
                    AND.b #$03                  
                    BEQ   CODE_12AB36           
                    JSR.w CODE_12C248           
CODE_12AB36:        JSR.w CODE_12A0AA           
                    LDA.b #$83                  
                    STA.w $046E,x               
                    LDA.b #$02                  
                    STA.b $6F,x                 
                    JSR.w CODE_12BB16           
                    INC.b $9F,x                 
                    LDA.b $9F,x                 
                    AND.b #$2F                  
                    BNE   CODE_12AB51           
                    LDA.b #$10                  
                    STA.b $86,x                 
CODE_12AB51:        LDY.b $86,x                 
                    BEQ   CODE_12ABA7           
                    CPY.b #$06                  
                    BNE   CODE_12AB95           
                    JSR.w CODE_12B335           
                    BMI   CODE_12AB95           
                    LDA.b $90,x                 
                    PHA                         
                    LDX.b $00                   
                    LDA.w $0587                 
                    AND.b #$0F                  
                    ORA.b #$BC                  
                    STA.b $47,x                 
                    JSR.w CODE_12C1DA           
                    PLA                         
                    CMP.b #$25                  
                    LDA   DATA_1197F8,y               
                    BCC   CODE_12AB79           
                    LDA.b #$00                  
CODE_12AB79:        STA.b $3D,x                 
                    LDA.b $29,x                 
                    SBC.b #$05                  
                    STA.b $29,x                 
                    LDA.b $15,x                 
                    SBC.b #$00                  
                    STA.b $15,x                 
                    LDA.b #$20                  
                    STA.b $90,x                 
                    LDA.b #$27                  
                    STA.w $1DE3                 
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12AB95:        LDA.b $65,x                 
                    ORA.b #$10                  
                    STA.b $65,x                 
                    LDA.b #$AE                  
                    JSR.w CODE_12BDD5           
                    LDA.b $65,x                 
                    AND.b #$EF                  
                    STA.b $65,x                 
                    RTS                         

CODE_12ABA7:        JMP.w CODE_12BD29           

CODE_12ABAA:        LDY.b #$05                  
CODE_12ABAC:        LDA.w $51,y               
                    BEQ   CODE_12ABBC           
                    CPY.b $12                   
                    BEQ   CODE_12ABBC           
                    LDA.w $90,y               
                    CMP.b #$3D                  
                    BEQ   CODE_12ABC7           
CODE_12ABBC:        DEY                         
                    BPL   CODE_12ABAC           
                    LDA.w $04B0                 
                    BNE   CODE_12ABC7           
CODE_12ABC4:        JMP.w CODE_12AC85           

CODE_12ABC7:        JMP.w CODE_12A83B           

CODE_12ABCA:        LDY.b #$05                  
CODE_12ABCC:        LDA.w $51,y               
                    BEQ   CODE_12ABDC           
                    CPY.b $12                   
                    BEQ   CODE_12ABDC           
                    LDA.w $90,y               
                    CMP.b #$44                  
                    BEQ   CODE_12ABC7           
CODE_12ABDC:        DEY                         
                    BPL   CODE_12ABCC           
                    LDA.w $04B5                 
                    BNE   CODE_12ABC7           
                    BEQ   CODE_12ABC4           
                    JSR.w CODE_12B335           
                    BMI   CODE_12AC10           
                    LDX.b $00                   
                    LDA.b #$45                  
                    STA.b $90,x                 
                    LDA.w $04C1                 
                    ADC.b #$D0                  
                    STA.b $29,x                 
                    LDA.w $04BF                 
                    ADC.b #$00                  
                    STA.b $15,x                 
                    LDA.b $CB                   
                    ADC.b #$E0                  
                    STA.b $33,x                 
                    LDA.b $CA                   
                    ADC.b #$00                  
                    STA.b $1F,x                 
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12AC10:        RTS                         

CODE_12AC11:        LDA.b #$FC                ; \ Star Y speed = #$FC.
                    STA.b $47,x               ; / (Rise up slightly.)
                    LDY.b #$F8                ; \ X speed is #$F8 or #$08.
                    LDA.b $10                 ;  | Switches every 128 frames.
                    STA.w $045C,x             ;  |
                    BPL   CODE_12AC20         ;  |
                    LDY.b #$08                ;  | <--
CODE_12AC20:        STY.b $3D,x               ; /
                    JMP.w CODE_12A0A7           

CODE_12AC25:        JSR.w CODE_12DDAB           
                    AND.b #$03                  
                    BNE   CODE_12AC2F           
                    JMP.w CODE_12A83B           

CODE_12AC2F:        INC.b $9F,x                 
                    LDA.b $9F,x                 
                    ASL   A                     
                    BNE   CODE_12AC77           
                    JSR.w CODE_12B335           
                    BMI   CODE_12AC77           
                    LDY.b $00                   
                    LDA.w $29,y             ; \ X position of new sprite = 6 pixels to the left from the generator.
                    SEC                       ;  |
                    SBC.b #$06                ;  |
                    STA.w $29,y             ; /
                    LDA.w $33,y             ; \ Y position of new sprite = 4 pixels upwards from the generator.
                    SBC.b #$04                ;  |
                    STA.w $33,y             ; /
                    LDA.w $1F,y               
                    SBC.b #$00                  
                    STA.w $1F,y               
                    LDA.b #$1A                  
                    STA.w $0480,y               
                    LDA.b #$F8                  
                    STA.w $47,y               
                    LDA.b $90,x               ; \ Check if Bob-Omb generator.
                    CMP.b #$16                ;  |
                    BNE   CODE_12AC77         ; / If not, return.
                    LDA.b #$09                ; \ Spawn Bob-Omb.
                    STA.w $90,y             ; /
                    LDA.w $3D,y               
                    ASL   A                     
                    STA.w $3D,y               
                    LDA.b #$FF                  
                    STA.w $86,y               
CODE_12AC77:        RTS                         

CODE_12AC78:        DEC.b $33,x                 
                    DEC.b $33,x                 
                    LDY.b #$01                  
                    STY.w $111F                 
                    INY                         
                    STY.w $110B                 
CODE_12AC85:        JSR.w CODE_129F96           
                    LDA.b #$00                ; \ No X-speed.
                    STA.b $3D,x               ; /
                    RTS                         

CODE_12AC8D:        LDA.b $ED                   
                    BEQ   CODE_12AC94           
CODE_12AC91:        JMP.w CODE_12AD30           

CODE_12AC94:        LDA.w $04B6               ; \ If time to wait before Hawkmouth opens his mouth is 0...
                    BEQ   CODE_12ACA3         ; / Branch.
                    DEC.w $04B6               ; \ Decrease that timer. If not hitting 0, branch.
                    BNE   CODE_12AC91         ; /
                    LDA.b #$2C                ; \ Opening mouth sound effect.
                    STA.w $1DE0               ; /
CODE_12ACA3:        LDA.w $04B4                 
                    BEQ   CODE_12ACDD           
                    DEC.w $04B5                 
                    BNE   CODE_12AC91           
                    LDA.b #$00                  
                    STA.w $04B4                 
                    LDA.b #$01                  
                    STA.w $0536                 
                    LDA.b #$01                  
                    JSR.w CODE_12AD41           
                    LDA.b #$F0                  
                    STA.w $0881                 
                    STA.w $0885                 
                    LDY.w $0629                 
                    LDA.w $0635                 
                    CMP.b #$06                  
                    BNE   CODE_12ACCF           
                    INY                         
CODE_12ACCF:        CPY.b #$02                  
                    BCC   CODE_12ACD7           
                    INC.w $0627                 
                    RTS                         

CODE_12ACD7:        LDA.b #$03                  
                    STA.w $04ED                 
                    RTS                         

CODE_12ACDD:        LDA.w $04B5                 
                    BEQ   CODE_12AD30           
                    CMP.b #$30                  
                    BEQ   CODE_12ACFE           
                    LDA.b $ED                   
                    AND.b #$04                  
                    BNE   CODE_12AD30           
                    INC.w $04B5                 
                    LDA.b $10                   
                    AND.b #$03                  
                    BNE   CODE_12ACFB           
                    DEC.w $111F                 
                    INC.w $110B                 
CODE_12ACFB:        JMP.w CODE_12AD30           

CODE_12ACFE:        LDA.b $5B,x                 
                    AND.b #$40                  
                    BEQ   CODE_12AD30           
                    LDA.b $33,x                 
                    CMP.b $32                   
                    BCS   CODE_12AD30                   
                    LDA.b $5A                   
                    AND.b #$04                  
                    BEQ   CODE_12AD30           
                    LDA.b $9C                   
                    BNE   CODE_12AD30           
                    LDA.b #$06                ; \ Enter Hawkmouth.
                    STA.b $50                 ; /
                    LDA.b #$30                ; \ Amount of frames to keep walking.
                    STA.b $82                 ; /
                    LDA.b #$FC                ; \ Y speed of player when entering Hawkmouth.
                    STA.b $46                 ; / Rise up slightly.
                    LDA.b #$80                ; \ Fade music.
                    STA.w $1DE2               ; /
                    STA.w $0547                 
                    LDA.b #$2D                ; \ Entering Hawkmouth sound effect.
                    STA.w $1DE0               ; /
                    INC.w $04B4                 
CODE_12AD30:        LDA.b $EE                   
                    BEQ   CODE_12AD37           
                    BRL   CODE_12AE0D           

CODE_12AD37:        LDA.b $90,x                 
                    SEC                         
                    SBC.b #$41                  
                    STA.b $6F,x                 
                    LDA.w $04B5                 
CODE_12AD41:        STA.b $07                   
                    LSR   A                     
                    LSR   A                     
                    EOR.b #$FF                  
                    SEC                         
                    ADC.w $042C                 
                    STA.w $042C                 
                    LDA.b $07                   
                    BNE   CODE_12AD57           
                    LDA.w $04B4                 
                    BEQ   CODE_12AD65           
CODE_12AD57:        LDY.b #$60                  
                    STY.w $02F6                 
                    STY.w $02F8                 
                    STZ.w $02F7                 
                    STZ.w $02F9                 
CODE_12AD65:        LDA.b #$8C                  
                    LDY.b $07                   
                    BEQ   CODE_12AD6D           
                    LDA.b #$90                  
CODE_12AD6D:        JSR.w CODE_12BDD5           
                    LDA.b $07                   
                    TAY                         
                    LSR   A                     
                    CLC                         
                    ADC.w $042C                 
                    ADC.b #$08                  
                    CPY.b #$00                  
                    BNE   CODE_12AD80           
                    ADC.b #$07                  
CODE_12AD80:        STA.b $00                   
                    JSL.l CODE_14E483           
                    LDX.b #$98                  
                    LDA.b $07                   
                    BNE   CODE_12AD91           
                    LDA.w $04B4                 
                    BEQ   CODE_12AD9B           
CODE_12AD91:        LDY.b #$68                  
                    STY.w $02F8                 
                    STZ.w $02F9                 
                    LDX.b #$94                  
CODE_12AD9B:        JSR.w CODE_12C03B           
                    JSR.w CODE_12C03B           
                    LDX.b $12                   
                    LDA.b $90,x                 
                    CMP.b #$2D                  
                    BEQ   CODE_12AE0D           
                    LDA.b $6F,x                 
                    CMP.b #$01                  
                    BEQ   CODE_12AE0D           
                    LDA.b $33,x                 
                    STA.w $0714                 
                    LDA.b $1F,x                 
                    STA.w $0715                 
                    LDA.b $CB                   
                    STA.w $0716                 
                    LDA.b $CA                   
                    STA.w $0717                 
                    LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$20                  
                    CLC                         
                    ADC.w #$0010                
                    STA.w $0712                 
                    LDA.w $0714                 
                    SEC                         
                    SBC.w $0716                 
                    CLC                         
                    ADC.w #$000A                
                    SEP   #$20                  
                    STA.w $042C                 
                    LDA.w $0712                 
                    STA.w $0429                 
                    LDA.w $0713                 
                    STA.w $021F                 
                    AND.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $ED                   
                    LDA.b $65,x                 
                    PHA                         
                    ORA.b #$20                  
                    STA.b $65,x                 
                    LDA.b #$38                  
                    STA.w $02F6                 
                    STZ.w $02F7                 
                    LDA.b #$78                  
                    JSR.w CODE_12BDD5           
                    PLA                         
                    STA.b $65,x                 
CODE_12AE0D:        LDX.b $12                   
                    RTS                         

CODE_12AE10:        JSR.w CODE_12AC85           
                    LDA.b $29,x                 
                    ADC.b #$08                  
                    STA.b $29,x                 
                    LDA.b $33,x                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $B1,x                 
                    LDA.b #$80                  
                    STA.b $86,x                 
CODE_12AE25:        RTS
                       
CODE_12AE26:        JSR.w CODE_12BB16           
                    INC.b $9F,x                 
                    JSR.w CODE_12BA4F           
                    JSR.w CODE_12BA46           
                    LDA.b #$09                  
                    LDY.b $47,x                 
                    BMI   CODE_12AE39           
                    LDA.b #$89                  
CODE_12AE39:        STA.b $65,x                 
                    LDY.b $EB                   
                    LDA.b $33,x                 
                    CMP.w DATA_119806,y               
                    BCC   CODE_12AE55           
                    LDY.b $86,x                 
                    BNE   CODE_12AE25           
                    STA.b $33,x                 
                    LDY.b $B1,x                 
                    LDA   DATA_1197FA,y               
                    STA.b $47,x                 
                    LDA.b #$C0                  
                    STA.b $86,x                 
CODE_12AE55:        JSR.w CODE_12B497           
                    INC.b $47,x                 
                    JMP.w CODE_12BD29           

CODE_12AE5D:        LDA.w $0628                 
                    CMP.b #$02                  
                    BNE   CODE_12AE70           
                    LDA.w $0702,x               
                    BEQ   CODE_12AE6A           
                    RTS
                       
CODE_12AE6A:        INC.w $0702,x               
                    JMP.w CODE_12BD29           

CODE_12AE70:        JSR.w CODE_12BB16           
                    INC.b $9F,x                 
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12BD29           
                    JSR.w CODE_12BA4F           
                    LDA.b #$00                  
                    STA.b $3D,x                 
                    JSR.w CODE_12DD90           
                    LDY.w $0477,x               
                    BCC   CODE_12AE9E           
                    LDA.b $86,x                 
                    BNE   CODE_12AEA9           
                    LDA.b $33,x                 
                    CMP.b $CB                   
                    LDA.b $1F,x                 
                    SBC.b $CA                   
                    BEQ   CODE_12AEA9           
                    ASL   A                     
                    ROL   A                     
                    AND.b #$01                  
                    BRA   CODE_12AEA5           

CODE_12AE9E:        LDA.b #$20                  
                    STA.b $86,x                 
                    TYA                         
                    EOR.b #$01                  
CODE_12AEA5:        STA.w $0477,x               
                    TAY                         
CODE_12AEA9:        LDA   DATA_119808,y               
                    STA.b $47,x                 
                    LDA   DATA_11980A,y               
                    STA.b $65,x                 
                    JSR.w CODE_12C1DA           
                    LDA.b $0F                   
                    ADC.b #$10                  
                    CMP.b #$20                  
                    BCS   CODE_12AEC0                   
                    ASL.b $47,x                 
CODE_12AEC0:        JMP.w CODE_12C1EA           

CODE_12AEC3:        LDA.b $EE                   
                    BEQ   CODE_12AECA           
                    JMP.w CODE_12A83B           

CODE_12AECA:        LDY.b #$FC                ; \ X speed = #$FC...
                    LDA.b $10                 ;  | For $20 consecutive frames.
                    AND.b #$20                ;  |
                    BEQ   CODE_12AED4         ;  |
                    LDY.b #$04                ;  | The other $20 consecutive frames, X speed = #$04.
CODE_12AED4:        STY.b $3D,x               ; /
                    LDA.b #$F8                ; \ Y speed = #$F8.
                    STA.b $47,x               ; /
                    JSR.w CODE_12B497           
CODE_12AEDD:        LDA.b $ED                   
                    AND.b #$08                  
                    ORA.b $EE                   
                    BNE   CODE_12AF2C           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0429                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $042C                 
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b #$8A                ; \ Upper tile number of heart.
                    STA.w $0802,y             ; /
                    LDA.b #$9A                ; \ Lower tile number of heart.
                    STA.w $0806,y             ; /
                    LDA.b $10                 ; \ X-Flip tile every $20 frames.
                    AND.b #$20                ;  |
                    EOR.b #$20                ;  |
                    ASL   A                   ;  |
                    ORA.b #$22                ;  | Palette 9, tile page 0. Priority 2.
                    STA.w $0803,y             ;  |
                    STA.w $0807,y             ; /
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                ; \ Tiles are 8x8.
                    STA.w $0A20,y             ;  |
                    STA.w $0A21,y             ; /
                    PLY                         
                    SEP   #$10                  
CODE_12AF2C:        RTS
                       
CODE_12AF2D:        JSR.w CODE_129F96           
                    LDA.b #$FF                  
                    STA.w $0702,x               
                    LDY.b #$00                  
                    LDA.b $29,x                 
                    CMP.b #$A0                  
                    BEQ   CODE_12AF43           
                    INY                         
                    CMP.b #$B0                  
                    BEQ   CODE_12AF43           
                    INY                         
CODE_12AF43:        TYA                         
                    STA.b $79,x                 
                    LDA   DATA_11980C,y               
                    STA.b $65,x                 
                    LDA.b #$02                  
                    STA.w $0465,x               
CODE_12AF50:        LDA.b $15,x                 
                    STA.w $04F0,x               
                    RTS
                       
CODE_12AF56:        LDA.w $0702,x               
                    BMI   CODE_12AF86           
                    BEQ   CODE_12AF6F           
                    DEC.w $0702,x               
                    LDA.w $0702,x               
                    BNE   CODE_12AF7D           
                    LDA.b $5B,x                 
                    ORA.b #$10                  
                    STA.b $5B,x                 
                    JSR.w CODE_12BB16           
                    RTS
                       
CODE_12AF6F:        LDA.b $5B,x                 
                    AND.b #$10                  
                    BEQ   CODE_12AF86           
                    LDA.b #$11                  
                    STA.w $045C,x               
                    STA.w $0702,x               
CODE_12AF7D:        LDA.b $6F,x                 
                    EOR.b #$03                  
                    STA.b $6F,x                 
                    JMP.w CODE_12B024           

CODE_12AF86:        JSR.w CODE_12BB16           
                    JSR.w CODE_12DDAB           
                    LDA.b #$00                  
                    STA.b $3D,x                 
                    JSR.w CODE_12C1DA           
                    INY                         
                    STY.b $6F,x                 
                    JSR.w CODE_12BD29           
                    LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12AFDB           
                    JSR.w CODE_12B659           
                    LDA.b $10                   
                    BNE   CODE_12AFAC           
                    LDA.b #$E0                  
                    STA.b $47,x                 
                    BNE   CODE_12AFDB           
CODE_12AFAC:        LDY.b $79,x                 
                    LDA   DATA_119811,y               
                    AND.b $10                   
                    BNE   CODE_12AFBF           
                    LDA.b $ED                   
                    AND.b #$0C                  
                    BNE   CODE_12AFBF           
                    LDA.b #$1C                  
                    STA.b $86,x                 
CODE_12AFBF:        LDY.b $86,x                 
                    BNE   CODE_12AFDE           
                    INC.b $B1,x                 
                    LDA.b $B1,x                 
                    AND.b #$40                  
                    BEQ   CODE_12B024           
                    JSR.w CODE_12AA43           
                    LDA.b #$0A                  
                    LDY.b $B1,x                 
                    BMI   CODE_12AFD6           
                    LDA.b #$F6                  
CODE_12AFD6:        STA.b $3D,x                 
                    JMP.w CODE_12C1EF           

CODE_12AFDB:        JMP.w CODE_12A0B2           

CODE_12AFDE:        CPY.b #$08                  
                    BNE   CODE_12B024           
                    LDA.b #$20                  
                    STA.w $1DE0                 
                    JSR.w CODE_12B670           
                    BMI   CODE_12B024           
                    LDY.w $0465,x               
                    LDA.b $79,x                 
                    LDX.b $00                   
                    CMP.b #$02                  
                    BEQ   CODE_12B005           
                    CMP.b #$01                  
                    BNE   CODE_12B00B           
                    LDA.w $0587                 
                    AND.b #$1F                  
                    CMP.w DATA_119814,y               
                    BCS   CODE_12B00B               
CODE_12B005:        INC.b $79,x                 
                    LDA.b #$20                  
                    BNE   CODE_12B00D           
CODE_12B00B:        LDA.b #$1E                      
CODE_12B00D:        STA.b $90,x                 
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$03                  
                    STA.b $33,x                 
                    LDY.b $6F,x                 
                    LDA.b $29,x                 
                    ADC   DATA_11980E,y               
                    STA.b $29,x                 
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12B024:        JMP.w CODE_12BD29           

CODE_12B027:        JSR.w CODE_12AA43           
                    LDA.b $47,x                 
                    CMP.b #$EA                  
                    BNE   CODE_12B038           
                    LDA.b #$01                  
                    STA.w $1DE3                 
                    INC.w $062B                 
CODE_12B038:        LDA.b $47,x                 
                    CMP.b #$10                  
                    BMI   CODE_12B064           
                    JSR.w CODE_12B1F9           
                    LDA.b $90,x               ; \ If sprite is 1-Up...
                    CMP.b #$40                ;  | ...
                    BEQ   CODE_12B048         ; / ...branch.
                    RTS                       ; Return.
                       
CODE_12B048:        INC.w $0620               ; 1-Up collected flag, next time 1-Up object is picked up, a vegetable is spawned.
                    LDA.w $04EE               ; \ Increment lives by 1 unless lives >= 99.
                    INC   A                   ;  |
                    CMP.b #$64                ;  |
                    BCC   CODE_12B055         ;  |
                    LDA.b #$63                ;  |
CODE_12B055:        STA.w $04EE               ; /
                    LDA.b #$05                ; \ 1-Up get sound effect.
                    STA.w $1DE3               ; /
                    RTS                       ; Return.
                       
CODE_12B05E:        INC.w $042C                 
                    JSR.w CODE_12B20E           
CODE_12B064:        LDA.b $A8,x               ;\If crystal ball is completely picked up
                    CMP.b #$01                ;/
                    BNE   CODE_12B06E           
                    LDA.b $9A                   
                    BEQ   CODE_12B071           
CODE_12B06E:        JMP.w CODE_12B0D6           

CODE_12B071:        JSR.w CODE_12B692           
                    LDA.b #$00                  
                    STA.b $9C                   
                    STA.b $A8,x                 
                    JSR.w CODE_12B1F9           
                    LDA.b $90,x               ; \ If not Crystal Ball, branch.
                    CMP.b #$44                ;  |
                    BNE   CODE_12B09B         ; /
                    LDA.w $04B5               ; \ If Crystal ball already collected, return.
                    BNE   CODE_12B09A         ; /
                    LDA.b #$10                ; \ Bonus get music.
                    STA.w $1DE2               ; / (When Crystal ball is collected.)
                    LDA.b #$60                ; \ Amount of time to wait before Hawkmouth opens his mouth.
                    STA.w $04B6               ; /
                    LDA.b #$A4                ; \ Amount of time to wait before changing music back to normal one.
                    STA.w $078A               ; /
                    INC.w $04B5               ; Set 'Crystal ball has been collected' flag.
CODE_12B09A:        RTS                       ; Return.
                       
CODE_12B09B:        CMP.b #$40                ; \ If 1-Up, branch.
                    BEQ   CODE_12B0C0         ; /
                    CMP.b #$46                ; \ If Stopwatch, branch.
                    BEQ   CODE_12B0CD         ; /
                    CMP.b #$3F                ; \ If not Mushroom, branch.
                    BNE   CODE_12B0C4         ; /
                    LDX.b $79                   
                    INC.w $04FC,x               
                    LDX.b $12                   
                    INC.w $04C4               ; Increase maximum amount of hearts.
                    JSL.l CODE_14E098         ; Fill all hearts. (NOPing this out only increases the maximum, but won't actually make the hearts red.)
                    LDA.b #$0C                ; \ Bonus game music.
                    STA.w $1DE2               ; / (Mushroom collected.)
                    LDA.b #$58                  
                    STA.w $079B                 
                    RTS
                       
CODE_12B0C0:        LDA.b #$09                  
                    STA.b $65,x                 
CODE_12B0C4:        LDA.b #$E0                ; \ Y speed of 1-Up mushroom when collected.
                    STA.b $47,x               ; /
                    LDA.b #$01                  
                    STA.b $51,x                 
                    RTS
                       
CODE_12B0CD:        LDA.b #$FF                ; \ Set sprite freeze timer to #$FF. (For stopwatch.)
                    STA.w $0500               ; /
                    RTS                       ; Return.
                       
CODE_12B0D3:        JSR.w CODE_12B20E           
CODE_12B0D6:        JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    PHA                         
                    AND.b $6F,x                 
                    BEQ   CODE_12B0EC           
                    JSR.w CODE_12C248           
                    JSR.w CODE_12B63B           
                    JSR.w CODE_12B63B           
                    JSR.w CODE_12B63B           
CODE_12B0EC:        PLA                         
                    AND.b #$04                  
                    BEQ   CODE_12B10E           
                    LDA.b $47,x                 
                    CMP.b #$09                  
                    BCC   CODE_12B105           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA   DATA_119819,y               
                    JSR.w CODE_12B635           
                    JMP.w CODE_12B10E           

CODE_12B105:        JSR.w CODE_12B659           
                    LDA.b $0B                   
                    BNE   CODE_12B10E           
                    STA.b $3D,x                 
CODE_12B10E:        LDA.b $90,x                 
                    CMP.b #$37                  
                    BNE   CODE_12B13D           
                    LDA.b $86,x                 
                    BNE   CODE_12B134           
                    LDY.b $A8,x                 
                    BEQ   CODE_12B120           
                    STA.b $9C                   
                    STA.b $A8,x                 
CODE_12B120:        LDA.b #$04                  
                    STA.b $51,x                 
                    LDA.b #$20                  
                    STA.b $86,x                
                    LDA.b #$4A                  
                    STA.w $1DE3                 
                    LDA.b #$01                  
                    LSR   A                     
                    STA.w $042F,x               
                    RTS
                       
CODE_12B134:        CMP.b #$40                  
                    BCS   CODE_12B13D                   
                    LDA.b $10                   
                    STA.w $045C,x               
CODE_12B13D:        JSR.w CODE_12BA46           
                    JSR.w CODE_12A0AA           
                    JSL.l CODE_139210           
CODE_12B147:        LDA.b $B1,x                 
                    BNE   CODE_12B14E           
                    JMP.w CODE_12BDC9           

CODE_12B14E:        JMP.w CODE_12BDD5           

CODE_12B151:        JSR.w CODE_12BA46           
                    JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    PHA                         
                    AND.b #$03                  
                    BEQ   CODE_12B167           
                    JSR.w CODE_12C248           
                    JSR.w CODE_12B63B           
                    JSR.w CODE_12B63B           
CODE_12B167:        PLA                         
                    AND.b #$04                  
                    BEQ   CODE_12B13D           
                    JSR.w CODE_12B659           
                    PHX                         
                    LDX.b #$08                  
CODE_12B172:        LDA.b $51,x                 
                    CMP.b #$01                  
                    BNE   CODE_12B181           
                    LDA.b $90,x                 
                    CMP.b #$3C                  
                    BNE   CODE_12B181           
                    JSR.w CODE_12B1F9           
CODE_12B181:        DEX                         
                    BPL   CODE_12B172           
                    PLX                         
                    LDA.b $29,x                 
                    ADC.b #$07                  
                    AND.b #$F0                  
                    STA.b $29,x                 
                    LDA.b $15,x                 
                    ADC.b #$00                  
                    STA.b $15,x                 
                    PHX                         
                    JSR.w CODE_12DDAB           
                    PLX                         
                    LDA.b $33,x                 
                    SEC                         
                    SBC.b #$10                  
                    STA.b $33,x                 
                    CMP.b #$E0                  
                    BCC   CODE_12B1AB           
                    LDA.b $EB                   
                    BEQ   CODE_12B1AB           
                    JSR.w CODE_12A83B           
                    RTS
                       
CODE_12B1AB:        LDA.b #$10                  
                    STA.w $0453,x               
                    LDA.b #$10                  
                    STA.w $1DE0                 
                    INC.b $B1,x                 
                    LDA.b #$3C                  
                    STA.b $90,x                 
                    PHX                         
                    LDX.b #$05                  
CODE_12B1BE:        LDA.l DATA_119BAE,x             
                    CMP.b $00                   
                    BEQ   CODE_12B1CC           
                    DEX                         
                    BPL   CODE_12B1BE           
                    PLX                         
                    BRA   CODE_12B1D2           

CODE_12B1CC:        PLX                         
                    LDA.b #$05                  
                    STA.w $51,x               
CODE_12B1D2:        JSR.w CODE_129F7A           
                    LDA.b #$10                  
                    STA.w $0594                 
                    LDA.b $EB                   
                    BNE   CODE_12B1E1           
                    JSR.w CODE_12A83B           
CODE_12B1E1:        JSR.w CODE_12B335           
                    BMI   CODE_12B20D           
                    LDY.b $00                   
                    LDA.b $29,x                 
                    STA.w $29,y               
                    LDA.b $15,x                 
                    STA.w $15,y               
                    LDA.b #$41                  
                    STA.w $65,y               
                    TYA                         
                    TAX                         
CODE_12B1F9:        LDA.b $65,x                 
                    AND.b #$FC                  
                    ORA.b #$01                  
                    STA.b $65,x                 
                    LDA.b #$05                  
                    STA.b $51,x                 
                    STA.b $9F,x                 
                    LDA.b #$1F                  
                    STA.b $86,x                 
                    LDX.b $12                   
CODE_12B20D:        RTS
                       
CODE_12B20E:        LDA.b $79,x                 
                    BNE   CODE_12B21E           
                    LDY.b #$05                  
CODE_12B214:        LDA.w $90,y               
                    CMP.b #$1C                  
                    BEQ   CODE_12B225           
                    DEY                         
                    BPL   CODE_12B214           
CODE_12B21E:        LDA.b #$01                  
                    STA.b $79,x                 
                    JMP.w CODE_129F7A           

CODE_12B225:        LDA.w $15,y               
                    CMP.b $15,x                 
                    BNE   CODE_12B21E           
                    LDA.w $0702,y               
                    BPL   CODE_12B236           
                    LDA.b #$00                  
                    STA.w $0702,y               
CODE_12B236:        PHX                         
                    LDX.b #$08                  
                    LDA.w $6F,y               
                    CMP.b #$01                  
                    BEQ   CODE_12B242           
                    LDX.b #$F8                  
CODE_12B242:        TXA                         
                    PLX                         
                    STA.b $3D,x                 
                    LDA.w $51,y               
                    CMP.b #$02                  
                    BNE   CODE_12B256           
                    LDA.w $47,y               
                    BMI   CODE_12B256           
                    CMP.b #$12                  
                    BCS   CODE_12B21E                   
CODE_12B256:        LDA.w $29,y               
                    STA.b $29,x                 
                    LDA.w $33,y               
                    ADC.b #$00                  
                    STA.b $33,x                 
                    JSR.w CODE_12C1DA           
                    LDA   DATA_11981D,y               
                    STA.b $3D,x                 
                    LDA.b #$E0                  
                    STA.b $47,x                 
                    PLA                         
                    PLA                         
                    LDA.b #$07                  
                    STA.w $046E,x               
                    RTS
                       
CODE_12B276:        JSR.w CODE_129F96           
                    LDA.b #$F0                ; \ Init X speed = #$F0 (left).
                    BNE   CODE_12B282         ; / More convenient than BRA. (Because the zero bit is clear, anyway.)

CODE_12B27D:        JSR.w CODE_129F96           
                    LDA.b #$10                ; \ Init X speed = #$10 (right).
CODE_12B282:        STA.b $3D,x               ; /
                    INC.b $B1,x                 
                    LDA.b $90,x                 
                    SEC                         
                    SBC.b #$0B                  
                    TAY                         
                    LDA.w $04C1                 
                    ADC   DATA_11981F,y               
                    STA.b $29,x                 
                    LDA.w $04BF                 
                    ADC   DATA_119820,y               
                    STA.b $15,x                 
                    RTS
                       
CODE_12B29D:        LDA.b $10                   
                    AND.b #$07                  
                    BNE   CODE_12B2A5           
                    INC.b $9F,x                 
CODE_12B2A5:        LDA.b $9F,x                 
                    CMP.b #$07                  
                    BCC   CODE_12B2AD           
                    STZ.b $9F,x                 
CODE_12B2AD:        JSR.w CODE_12BCE9           
                    LDA.b $B1,x                 
                    BNE   CODE_12B2E0           
                    LDA.b $5B,x                 
                    AND.b #$10                  
                    BNE   CODE_12B2C5           
                    JSR.w CODE_12C1DA           
                    LDA.b $0F                   
                    ADC.b #$30                  
                    CMP.b #$60                  
                    BCS   CODE_12B2DD                   
CODE_12B2C5:        JSR.w CODE_12B335           
                    BMI   CODE_12B2DD           
                    LDX.b $00                   
                    LDA.b #$09                ; \ Spawn Bob-Omb.
                    STA.b $90,x               ; /
                    LDA.b $33,x                 
                    ADC.b #$10                  
                    STA.b $33,x                 
                    JSR.w CODE_12A01C           
                    LDX.b $12                   
                    INC.b $B1,x                 
CODE_12B2DD:        JMP.w CODE_12B2E3           

CODE_12B2E0:        JSR.w CODE_12BB16           
CODE_12B2E3:        JMP.w CODE_12C1EF           

CODE_12B2E6:        JSR.w CODE_12B2F6           
                    ASL.b $65,x                 
                    LDA.b $10                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ROR.b $65,x                 
                    RTS
                       
CODE_12B2F3:        JSR.w CODE_12DDAB           
CODE_12B2F6:        JSR.w CODE_12BB16           
                    JSR.w CODE_12BA46           
                    LDA.b $B1,x                 
                    ORA.w $042F,x               
                    BEQ   CODE_12B306           
                    JMP.w CODE_12A0A7           

CODE_12B306:        LDA.b $47,x                 
                    BPL   CODE_12B30C           
                    STA.b $B1,x                 
CODE_12B30C:        LDA.b $5B,x                 
                    AND.b #$03                  
                    BEQ   CODE_12B32B           
                    STA.b $B1,x                 
                    LDA.b $90,x                 
                    CMP.b #$1B                  
                    BNE   CODE_12B322           
                    LDA.b #$02                  
                    STA.b $51,x                 
                    INC.b $33,x                 
                    INC.b $33,x                 
CODE_12B322:        JSR.w CODE_12C248           
                    JSR.w CODE_12B63B           
                    JSR.w CODE_12B63B           
CODE_12B32B:        JSR.w CODE_12C1EF           
                    JMP.w CODE_12BD29           

CODE_12B331:        LDY.b #$08                ; \ Start loop, maximum index.
                    BNE   CODE_12B337         ; / 

CODE_12B335:        LDY.b #$05                ; Start loop with a lower index.

CODE_12B337:        LDA.w $51,y             ; \ Check if there's a free sprite slot somewhere.
                    BEQ   CODE_12B340         ;  | $51,y - 00 = free slot.
                    DEY                       ;  | If not, get to next index.
                    BPL   CODE_12B337         ;  | Loop
                    RTS                       ; / If all slots full, return.
                        
CODE_12B340:        LDA.b #$01                  
                    STA.w $51,y               
                    LSR   A                     
                    STA.w $049B,y               
                    LDA.b #$01                  
                    STA.w $90,y               
                    LDA.b $29,x                 
                    ADC.b #$05                  
                    STA.w $29,y               
                    LDA.b $15,x                 
                    ADC.b #$00                  
                    STA.w $15,y               
                    LDA.b $33,x                 
                    STA.w $33,y               
                    LDA.b $1F,x                 
                    STA.w $1F,y               
                    STY.b $00                 ; Use $00 as index for new sprite.
                    TYA                         
                    TAX                         
                    JSR.w CODE_129F96           
                    JSR.w CODE_12A09C           
                    LDX.b $12                   
                    RTS
                       
CODE_12B373:        LDA.w $044A,x             ; \
                    BEQ   CODE_12B37B         ;  | Phanto shake animation timer (upon takeoff)
                    DEC.w $044A,x             ; /
CODE_12B37B:        JSR.w CODE_12BD29         ; Draw GFX?
                    LDY.b #$01                ; Y = #$01.
                    LDA.b $9C                 ; \ Check if player is holding something.
                    BEQ   CODE_12B39E         ; / If not, branch.
                    LDX.w $042D               ; Get index of carried sprite.
                    LDA.b $90,x               ; \ Check if carried sprite = #$3D. (Key)
                    LDX.b $12                 ;  | (Get Phanto's index back again)
                    CMP.b #$3D                ;  |
                    BCC   CODE_12B39E         ;  | If not, branch.
                    CMP.b #$3E                ;  | (Why not simply use BNE?)
                    BCS   CODE_12B39E         ; /
                    LDA.w $0595               ; \
                    CMP.b #$A0                ;  |Decrease takeoff timer until it hits 0
                    BNE   CODE_12B39D         ;  |
                    DEC.w $0595               ; /
CODE_12B39D:        DEY                         
CODE_12B39E:        LDA.b $1F,x                 
                    CLC                         
                    ADC.b #$01                  
                    STA.b $05                   
                    LDA.b $32                   
                    CMP.b $33,x                 
                    LDX.b $1E                   
                    INX                         
                    TXA                         
                    LDX.b $12                   
                    SBC.b $05                   
                    BPL   CODE_12B3B4           
                    INY                         
CODE_12B3B4:        LDA.b $47,x                 
                    CMP.w DATA_119829,y         ;Phanto maximum Y speed
                    BEQ   CODE_12B3C1           
                    CLC                         
                    ADC.w DATA_119826,y         ;Phanto acceleration rate
                    STA.b $47,x                 
CODE_12B3C1:        LDA.w $0480,x               
                    CLC                         
                    ADC.b #$A0                  
                    STA.w $0480,x               
                    BCC   CODE_12B3E2           
                    LDA.w $0477,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.b $3D,x                 
                    CLC                         
                    ADC.w DATA_119822,y               
                    STA.b $3D,x                 
                    CMP.w DATA_119824,y               
                    BNE   CODE_12B3E2           
                    INC.w $0477,x               
CODE_12B3E2:        LDA.b $EB                   
                    BEQ   CODE_12B3EB           
                    LDA.b $3C                   
                    STA.w $04CD,x               
CODE_12B3EB:        LDY.w $0595                 
                    BEQ   CODE_12B417           
                    CPY.b #$A0                  
                    BEQ   CODE_12B40E           
                    CPY.b #$80                  
                    BNE   CODE_12B3FD           
                    LDA.b #$40                  
                    STA.w $045C,x               
CODE_12B3FD:        CPY.b #$40                  
                    BNE   CODE_12B40B           
                    LDA.b #$40                  
                    STA.w $044A,x               
                    LDA.b #$2E                  
                    STA.w $1DE0                 
CODE_12B40B:        DEC.w $0595                 
CODE_12B40E:        LDA.b #$00                  
                    STA.w $04CD,x               
                    STA.b $3D,x                 
                    STA.b $47,x                 
CODE_12B417:        JMP.w CODE_12B497           

CODE_12B41A:        LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12B46B           
                    LDA.w $042F,x               
                    BNE   CODE_12B427           
                    STA.b $3D,x                 
CODE_12B427:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b $10                   
                    AND.b #$3F                  
                    BNE   CODE_12B46B           
                    LDA.b $9F,x                 
                    AND.b #$C0                  
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    TAY                         
                    LDA   DATA_11982C,y               
                    BNE   CODE_12B460           
CODE_12B43E:        LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12B46B           
                    LDA.b $32                   
                    CLC                         
                    ADC.b #$10                  
                    CMP.b $33,x                 
                    BNE   CODE_12B46B           
                    JSR.w CODE_12C1DA           
                    INY                         
                    TYA                         
                    CMP.b $6F,x                 
                    BNE   CODE_12B46B           
                    LDA.b $0F                   
                    ADC.b #$28                  
                    CMP.b #$50                  
                    BCS   CODE_12B46B                   
                    LDA.b #$D8                  
CODE_12B460:        STA.b $47,x                 
                    LDA.b $9F,x                 
                    AND.b #$F0                  
                    STA.b $9F,x                 
                    JSR.w CODE_12C1EA           
CODE_12B46B:        JMP.w CODE_12B4D1           

CODE_12B46E:        LDA.w $0628                 
                    CMP.b #$02                  
                    BNE   CODE_12B476           
                    RTS
                       
CODE_12B476:        JSR.w CODE_12BB16           
                    JSR.w CODE_12BD29           
                    INC.b $9F,x                 
                    JSR.w CODE_12BA4F           
                    JSR.w CODE_12AA43           
                    JSR.w CODE_12BA46           
                    LDA.b $47,x                 
                    BEQ   CODE_12B49D           
                    BPL   CODE_12B490           
                    STA.w $042F,x               
CODE_12B490:        LDA.b $10                   
                    LSR   A                     
                    BCC   CODE_12B497           
                    DEC.b $47,x                 
CODE_12B497:        JSR.w CODE_12C1EF           
                    JMP.w CODE_12C1EA           

CODE_12B49D:        JSR.w CODE_12C1EF           
                    JMP.w CODE_12B497           

CODE_12B4A3:        LDY.b $86,x                 
                    CPY.b #$3A                  
                    BCS   CODE_12B4D1                   
                    LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12B4B1           
                    STZ.b $3D,x                 
CODE_12B4B1:        DEC.b $9F,x                 
                    TYA                         
                    BNE   CODE_12B4C1           
                    LDA.b $A8,x                 
                    BEQ   CODE_12B4BE           
                    STY.b $9C                   
                    STY.b $A8,x                 
CODE_12B4BE:        JMP.w CODE_12B120           

CODE_12B4C1:        CMP.b #$30                  
                    BCS   CODE_12B4D1                   
                    LSR   A                     
                    BCC   CODE_12B4D1           
                    LDA.b $10                   
                    STA.w $045C,x               
                    LDA.b #$01                  
                    STA.b $9F,x                 
CODE_12B4D1:        JSR.w CODE_12DDAB           
CODE_12B4D4:        JSR.w CODE_12BB16           
                    LDA.w $0480,x               
                    BEQ   CODE_12B4F8           
                    LDA.b $5B,x                 
                    AND.b #$08                  
                    BEQ   CODE_12B4E5           
                    JMP.w CODE_12A83B           

CODE_12B4E5:        DEC.w $0480,x               
                    INC.b $86,x                 
CODE_12B4EA:        LDA.b $65,x                 
                    AND.b #$EF                  
                    ORA.b #$20                  
                    STA.b $65,x                 
                    JSR.w CODE_12C1EA           
                    JMP.w CODE_12BD29           

CODE_12B4F8:        LDA.b $5B,x                 
                    AND.b $6F,x                 
                    BEQ   CODE_12B50C           
                    JSR.w CODE_12C248           
                    LDA.w $042F,x               
                    BEQ   CODE_12B50C           
                    JSR.w CODE_12B63B           
                    JSR.w CODE_12B63B           
CODE_12B50C:        INC.b $9F,x                 
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12BD29           
                    LDA.b $90,x                 
                    CMP.b #$06                  
                    BNE   CODE_12B521           
                    LDA.w $042F,x               
                    BNE   CODE_12B521           
                    STA.b $3D,x                 
CODE_12B521:        JSR.w CODE_12A0AA           
                    LDA.b $5B,x                 
                    LDY.b $47,x                 
                    BPL   CODE_12B58E           
                    AND.b #$08                  
                    BEQ   CODE_12B533           
                    LDA.b #$00                  
                    STA.b $47,x                 
                    RTS
                       
CODE_12B533:        LDA.w $042F,x               
                    BNE   CODE_12B571           
                    LDA.b $90,x                 
                    CMP.b #$02                  
                    BNE   CODE_12B55F           
                    DEC.b $9F,x                 
                    LDA.b $47,x                 
                    BMI   CODE_12B548           
                    STZ.b $9F,x                 
                    BRA   CODE_12B573           

CODE_12B548:        LDY.b #$03                  
                    LDA.b $79,x                 
                    AND.b #$03                  
                    BNE   CODE_12B552           
                    LDY.b #$01                  
CODE_12B552:        TYA                         
                    AND.b $10                   
                    BNE   CODE_12B573           
                    LDA.b $9F,x                 
                    EOR.b #$08                  
                    STA.b $9F,x                 
                    BRA   CODE_12B573           

CODE_12B55F:        CMP.b #$06                  
                    BNE   CODE_12B571           
                    LDA.b $47,x                 
                    CMP.b #$FE                  
                    BNE   CODE_12B571           
                    LDA.w $0587                 
                    BPL   CODE_12B571           
                    JSR.w CODE_12B676           
CODE_12B571:        DEC.b $9F,x                 
CODE_12B573:        LDA.b $90,x                 
                    CMP.b #$07                  
                    BEQ   CODE_12B57D           
                    CMP.b #$03                  
                    BNE   CODE_12B58D           
CODE_12B57D:        LDA.w $042F,x               
                    BNE   CODE_12B58D           
                    LDA.w $0477,x               
                    BNE   CODE_12B58D           
                    INC.w $0477,x               
                    JMP.w CODE_12C248           

CODE_12B58D:        RTS
                       
CODE_12B58E:        AND.b #$04                  
                    BEQ   CODE_12B533           
                    LDA.b #$00                  
                    STA.w $0477,x               
                    LDY.b $90,x                 
                    CPY.b #$02                  
                    BNE   CODE_12B5B3           
                    LDA.b #$3F                  
                    JSR.w CODE_12B624           
                    INC.b $79,x                 
                    LDY.b #$F0                  
                    LDA.b $79,x                 
                    AND.b #$03                  
                    BNE   CODE_12B5AE           
                    LDY.b #$E0                  
CODE_12B5AE:        STY.b $47,x                 
                    JMP.w CODE_12C1EA           

CODE_12B5B3:        LDA.b #$1F                  
                    CPY.b #$09                  
                    BEQ   CODE_12B624           
                    CPY.b #$29                  
                    BEQ   CODE_12B624           
                    LDA.b #$3F                  
                    CPY.b #$0D                  
                    BEQ   CODE_12B624           
                    LDA.b #$7F                  
                    CPY.b #$05                  
                    BEQ   CODE_12B5ED           
                    CPY.b #$05                  
                    BEQ   CODE_12B5ED           
                    CPY.b #$07                  
                    BEQ   CODE_12B5ED           
                    CPY.b #$06                  
                    BNE   CODE_12B628           
                    LDA.w $042F,x               
                    BNE   CODE_12B628           
                    JSR.w CODE_12C1DA           
                    INY                         
                    STY.b $6F,x                 
                    LDA.b $9F,x                 
                    AND.b #$3F                  
                    BNE   CODE_12B5ED           
                    LDA.b #$E8                  
                    STA.b $47,x                 
                    JMP.w CODE_12C1EA           

CODE_12B5ED:        LDA.w $044A,x               
                    BEQ   CODE_12B5FF           
                    DEC.b $9F,x                 
                    DEC.w $044A,x               
                    BNE   CODE_12B5FF           
                    JSR.w CODE_12B676           
                    JMP.w CODE_12B646           

CODE_12B5FF:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b $10                   
                    ASL   A                     
                    BNE   CODE_12B622           
                    LDA.b $90,x                 
                    CMP.b #$06                  
                    BNE   CODE_12B614           
                    JSR.w CODE_12B676           
                    JMP.w CODE_12B655           

CODE_12B614:        LDA.b $33,x                 
                    SEC                         
                    SBC.b #$10                  
                    CMP.b $32                   
                    BNE   CODE_12B622           
                    LDA.b #$30                  
                    STA.w $044A,x               
CODE_12B622:        LDA.b #$7F                  
CODE_12B624:        AND.b $9F,x                 
                    BEQ   CODE_12B643           
CODE_12B628:        LDA.w $042F,x               
                    BEQ   CODE_12B646           
                    LDA.b $47,x                 
                    CMP.b #$1A                  
                    BCC   CODE_12B643           
                    LDA.b #$F0                  
CODE_12B635:        JSR.w CODE_12B65B           
                    JSR.w CODE_12C1EA           
CODE_12B63B:        LDA.b $3D,x                 
                    STA.b $00                   
                    ASL   A                     
                    ROR.b $3D,x                 
                    RTS
                       
CODE_12B643:        JSR.w CODE_129F98           
CODE_12B646:        LDA.b $90,x                 
                    CMP.b #$01                  
                    BNE   CODE_12B655           
                    LDA.b $47,x                 
                    CMP.b #$04                  
                    BCC   CODE_12B655           
                    JSR.w CODE_129F98           
CODE_12B655:        ASL.b $65,x                 
                    LSR.b $65,x                 
CODE_12B659:        LDA.b #$00                  
CODE_12B65B:        STA.b $47,x                 
                    LDA.b $90,x                 
                    CMP.b #$32                  
                    LDA.b $33,x                 
                    BCS   CODE_12B66B                   
                    ADC.b #$08                  
                    BCC   CODE_12B66B           
                    INC.b $1F,x                 
CODE_12B66B:        AND.b #$F0                  
                    STA.b $33,x                 
                    RTS
                       
CODE_12B670:        JSR.w CODE_12B331           
                    JMP.w CODE_12B679           

CODE_12B676:        JSR.w CODE_12B335           
CODE_12B679:        BMI   CODE_12B691           
                    LDY.b $6F,x                 
                    LDX.b $00                   
                    LDA   DATA_11982F,y       ; \ Set X speed.       
                    STA.b $3D,x               ; /
                    LDA.b #$00                ; \ No Y speed.
                    STA.b $47,x               ; /
                    LDA.b #$1B                ; \ Spawn Bullet.
                    STA.b $90,x               ; /
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12B691:        RTS
                       
CODE_12B692:        LDA.b $9D                   
                    EOR.b #$01                  
                    TAY                         
                    INY                         
                    STY.b $6F,x                 
                    LDA.b $28                   
                    STA.b $29,x                 
                    LDA.b $14                   
                    STA.b $15,x                 
                    LDA.b $1E                   
                    STA.b $07                   
                    LDA.b $32                   
                    LDY.w $0489,x               
                    CPY.b #$03                  
                    BEQ   CODE_12B6B9           
                    CPY.b #$02                  
                    BEQ   CODE_12B6B9           
                    SBC.b #$0E                  
                    BCS   CODE_12B6B9                   
                    DEC.b $07                   
CODE_12B6B9:        LDY.b $C7                   
                    CPY.b #$04                  
                    CLC                         
                    BNE   CODE_12B6D0           
                    LDY.w $06C2                 
                    CPY.b #$01                  
                    LDY.b $8F                   
                    BCC   CODE_12B6CD           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_12B6CD:        ADC   DATA_119832,y               
CODE_12B6D0:        PHP                         
                    LDY.b $A8,x                 
                    CLC                         
                    LDX.w $06C2                 
                    BEQ   CODE_12B6E0           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_12B6E0:        ADC.w $1EFF,y               
                    LDX.b $12                   
                    STA.b $33,x                 
                    LDA.b $07                   
                    ADC.w $1F0D,y               
                    PLP                         
                    ADC.b #$00                  
                    STA.b $1F,x                 
                    LDY.b $A8,x                 
                    CPY.b #$05                  
                    BCS   CODE_12B70D                   
                    LDA.b $90,x                 
                    CMP.b #$22                  
                    BEQ   CODE_12B70D           
                    CMP.b #$32                  
                    BCS   CODE_12B70D                   
                    LDA.w $0438,x               
                    BNE   CODE_12B708           
                    INC.b $9F,x                 
CODE_12B708:        ASL.b $65,x                 
                    SEC                         
                    ROR.b $65,x                 
CODE_12B70D:        JSR.w CODE_12BB60           
                    JSL.l CODE_139210           
                    JMP.w CODE_12BD29           

CODE_12B717:        JSR.w CODE_12B71B         ; \ Wrapper.
CODE_12B71A:        RTS                       ; /
                       
CODE_12B71B:        LDA.b $A8,x                 
                    BEQ   CODE_12B724           
                    PLA                         
                    PLA                         
                    JMP.w CODE_12B692           

CODE_12B724:        JSR.w CODE_12BD29           
                    LDA.b $90,x               ; \ Check if sprite = POW
                    CMP.b #$3A                ;  | (#$3A)
                    BCS   CODE_12B732         ; / If that is the case, branch. Otherwise it's a mushroom block.
                    JSR.w CODE_12DDA7           
                    BRA   CODE_12B735
           
CODE_12B732:        JSR.w CODE_12DDAB           
CODE_12B735:        LDA.w $042F,x               
                    BEQ   CODE_12B71A           
                    JSR.w CODE_12A0AA           
                    PLA                         
                    PLA                         
                    LDA.b $5B,x                 
                    PHA                         
                    AND.b #$03                  
                    BEQ   CODE_12B75C           
                    LDA.b #$00                  
                    STA.b $3D,x                 
                    LDA.b $29,x                 
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $29,x                 
                    LDA.b $EB                   
                    BEQ   CODE_12B75C           
                    LDA.b $15,x                 
                    ADC.b #$00                  
                    STA.b $15,x                 
CODE_12B75C:        PLA                         
                    LDY.b $47,x                 
                    BMI   CODE_12B7B9           
                    AND.b #$04                  
                    BEQ   CODE_12B7B9           
                    LDA.b $0E                   
                    CMP.b #$26                  
                    BNE   CODE_12B774           
                    LDA.b $3D,x                 
                    BEQ   CODE_12B774           
                    LDA.b #$14                  
                    JMP.w CODE_12B65B           

CODE_12B774:        LDA.b $90,x               ; \ Check if sprite = POW
                    CMP.b #$3A                ;  | If that is the case, kill sprites and make a sound effect.
                    BNE   CODE_12B789         ; / Otherwise it's a mushroom block.
                    LDA.b #$20                ; \ Shake screen and kill all enemies on-screen for #$20 frames.
                    STA.w $04C5               ; /
                    LDA.b #$09                ; \ POW SFX.
                    STA.w $1DE3               ; /
                    LDA.b #$08                ; \ Disappear in two puffs of smoke.
                    JMP.w CODE_12BA3F         ; /

CODE_12B789:        LDA.b $47,x               ; \ If Y speed of mushroom block is too great (=> #$16)...
                    CMP.b #$16                ;  |
                    BCS   CODE_12B7A5         ; / branch. Don't lock block in place yet.
                    LDA.b $3D,x               ; \ Check if X speed of mushroom blocks is too great (=> #$30 on either sides...
                    BPL   CODE_12B796         ;  |
                    EOR.b #$FF                ;  |
                    INC   A                   ;  |
CODE_12B796:        CMP.b #$30                ;  |
                    BCC   CODE_12B7AD         ;  | If that is not the case, branch.
                    LDA.b #$2F                ;  | If it is, set the speed value to a value lower than #$30.
                    BIT.b $3D,x               ;  | So #$2F or #$D1, depending on the direction.
                    BPL   CODE_12B7A2         ;  |
                    LDA.b #$D1                ;  |
CODE_12B7A2:        STA.b $3D,x               ; /
                    RTS                       ; Return.
                       
CODE_12B7A5:        JSR.w CODE_12B659           
                    LDA.b #$F5                ; New Y speed (bouncing off ground).
                    JMP.w CODE_12B635           

CODE_12B7AD:        JSR.w CODE_12B659           
                    LDA.b $79,x               ; \ Change into the tile $79,x is holding.
                    JSL.l CODE_13FA0D         ; / (Should be #$64.)
                    JMP.w CODE_12A83B         ; Terminate mushroom block sprite.

CODE_12B7B9:        RTS                       ; Return.
                       
CODE_12B7BA:        LDA.b #$04                  
                    STA.w $0489,x               
                    LDA.b #$02                  
                    STA.b $6F,x                 
                    LDY.w $04B7                 
                    BEQ   CODE_12B7E8           
                    LDA.b $10                   
                    AND.b #$03                  
                    BNE   CODE_12B7E8           
                    LDY.b $50                   
                    CPY.b #$07                  
                    BEQ   CODE_12B7E8           
                    LDA.w $04BE                 
                    BNE   CODE_12B7E8           
                    DEC.w $04B7               ; Decrease amount of time you stay in the dark potion room.
                    BNE   CODE_12B7E8           
                    STA.w $0628                 
                    JSL.l CODE_14E35A           
                    JMP.w CODE_12B8D9           

CODE_12B7E8:        LDA.w $0453,x               
                    BNE   CODE_12B7B9           
                    LDA.w $04B3                 
                    BEQ   CODE_12B7FA           
                    DEC.w $04B3                 
                    BNE   CODE_12B7FA           
                    JMP.w CODE_12B1F9           

CODE_12B7FA:        LDA.b $65,x                 
                    ORA.b #$40                  
                    STA.b $65,x                 
                    LDY.w $04BE                 
                    LDA   DATA_11983C,y               
                    LDY.b #$00                  
                    ASL   A                     
                    BCC   CODE_12B80E           
                    INY                         
                    STY.b $6F,x                 
CODE_12B80E:        LDA.w $04BE                 
                    BEQ   CODE_12B844           
                    LDY.b #$F8                  
                    LDA.w $04BE                 
                    CMP.b #$09                  
                    BCC   CODE_12B81E           
                    LDY.b #$D8                  
CODE_12B81E:        STY.w $02F6                 
                    LDY.b #$01                  
                    STY.w $02F7                 
                    LDA.w $02F6                 
                    STA.w $02F8                 
                    LDA.w $02F7                 
                    STA.w $02F9                 
                    LDA.b #$78                  
                    JSR.w CODE_12BDD5           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0800,y               
                    STA.w $0804,y               
                    SEP   #$10                  
CODE_12B844:        LDY.b #$E0                  
                    LDA.w $02F6                 
                    CMP.b #$D8                  
                    BEQ   CODE_12B84F           
                    LDY.b #$D8                  
CODE_12B84F:        STY.w $02F6                 
                    LDY.b #$01                  
                    STY.w $02F7                 
                    LDA.w $04BE                 
                    CMP.b #$19                  
                    BCC   CODE_12B86F           
                    CMP.b #$30                  
                    BNE   CODE_12B867           
                    LDA.b #$10                  
                    STA.w $1DE3                 
CODE_12B867:        LDY.b #$40                  
                    STY.w $02F6                 
                    STZ.w $02F7                 
CODE_12B86F:        LDA.b #$74                  
                    LDY.w $0477,x               
                    BEQ   CODE_12B878           
                    LDA.b #$7C                  
CODE_12B878:        JSR.w CODE_12B904           
                    LDX.w $04BE                 
                    BEQ   CODE_12B8D9           
                    INC.w $04BE                 
                    LDY.w $02F6                 
                    LDA.w DATA_11983C,x               
                    BMI   CODE_12B8D9           
                    REP   #$10                  
                    LDY.w $02F6                 
                    CLC                         
                    ADC.w $0800,y               
                    STA.w $0800,y               
                    STA.w $0804,y               
                    STA.w $0808,y               
                    STA.w $080C,y               
                    SEP   #$10                  
                    CPX.b #$30                  
                    BNE   CODE_12B8D9           
                    STZ.w $04BE                 
                    LDX.b #$08                  
CODE_12B8AB:        LDA.b $90,x                 
                    CMP.b #$3C                  
                    BNE   CODE_12B8C0           
                    STZ.b $90,x                 
                    STZ.b $51,x                 
                    LDY.w $0441,x               
                    BMI   CODE_12B8C0           
                    LDA.b ($CC),y               
                    AND.b #$7F                  
                    STA.b ($CC),y               
CODE_12B8C0:        DEX                         
                    BPL   CODE_12B8AB           
                    LDX.b $12                   
                    LDA.w $0536                 
                    CMP.b #$01                  
                    BNE   CODE_12B8D1           
                    INC.w $0627                 
                    BNE   CODE_12B8D9           
CODE_12B8D1:        LDA.w $0628                 
                    EOR.b #$02                  
                    STA.w $0628                 
CODE_12B8D9:        LDX.b $12                   
                    RTS

DATA_12B8DC:        db $A2,$B2,$A4,$B4,$A3,$B3,$A5,$B5
      
DATA_12B8E4:        db $A2,$B2,$8B,$9B,$A3,$B3,$A5,$B5

DATA_12B8EC:        db $00,$00,$00,$00,$08,$08,$08,$08

DATA_12B8F4:        db $00,$08,$10,$18,$00,$08,$10,$18
                       
DATA_12B8FC:        db $22,$22,$26,$26,$22,$22,$22,$22
        
CODE_12B904:        AND.b #$08                  
                    STA.b $00                   
                    REP   #$10                  
                    LDX.w #$0000                
                    LDY.w $02F6                 
                    LDA.b #$07                  
                    STA.b $02                   
CODE_12B914:        LDA.w $0429                 
                    STA.b $04                   
                    LDA.w $021F                 
                    STA.b $05                   
                    REP   #$20                  
                    LDA.l DATA_12B8EC,x             
                    AND.w #$00FF                
                    CLC                         
                    ADC.b $04                   
                    STZ.b $04                   
                    AND.w #$FF00                
                    BEQ   CODE_12B936           
                    LDA.w #$0100                
                    STA.b $04                   
CODE_12B936:        SEP   #$20                  
                    LDA.l DATA_12B8EC,x             
                    CLC                         
                    ADC.w $0429                 
                    STA.w $0800,y               
                    LDA.l DATA_12B8F4,x             
                    CLC                         
                    ADC.w $042C                 
                    STA.w $0801,y               
                    LDA.b $00                   
                    BNE   CODE_12B95B           
                    LDA.l DATA_12B8DC,x             
                    PHA                         
                    LDA.b #$22                  
                    BRA   CODE_12B964           

CODE_12B95B:        LDA.l DATA_12B8E4,x             
                    PHA                         
                    LDA.l DATA_12B8FC,x             
CODE_12B964:        STA.w $0803,y               
                    PLA                         
                    STA.w $0802,y               
                    PHY                         
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $05                   
                    STA.w $0A20,y               
                    PLY                         
                    INX                         
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    DEC.b $02                   
                    BPL   CODE_12B914           
                    SEP   #$10                  
                    RTS
                       
                    LDA.b #$02                  
                    BNE   CODE_12B990           
                    LDA.b #$01                  
                    BNE   CODE_12B990           
                    LDA.b #$00                  
CODE_12B990:        PHA                         
                    LDY.b #$08                  
CODE_12B993:        LDA.w $51,y               
                    BEQ   CODE_12B9A9           
                    LDA.w $90,y               
                    CMP.b #$3C                  
                    BNE   CODE_12B9A9           
                    LDA.b #$05                  
                    STA.w $51,y               
                    LDA.b #$20                  
                    STA.w $86,y               
CODE_12B9A9:        DEY                         
                    BPL   CODE_12B993           
                    JSR.w CODE_12B331           
                    BMI   CODE_12B9E3           
                    LDA.b #$00                  
                    STA.w $04BE                 
                    STA.w $04B3                 
                    LDX.b $00                   
                    PLA                         
                    STA.w $0477,x               
                    LDA.b #$3C                  
                    STA.b $90,x                 
                    JSR.w CODE_129F7A           
                    LDA.b $28                   
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $29,x                 
                    LDA.b $14                   
                    ADC.b #$00                  
                    STA.b $15,x                 
                    LDA.b $32                   
                    STA.b $33,x                 
                    LDA.b $1E                   
                    STA.b $1F,x                 
                    LDA.b #$41                  
                    STA.b $65,x                 
                    LDX.b $12                   
                    RTS
                       
CODE_12B9E3:        PLA                         
                    RTS
                       
DATA_12B9E5:        db $2E,$C6,$C8,$C6

CODE_12B9E9:        JSR.w CODE_12DDAB                   
                    JSR.w CODE_12BA46                                 
                    LDA.b #$01                  
                    STA.w $0D00,x               
                    LDA.b $5B,x                 
                    AND.b #$03                  
                    BEQ   CODE_12BA02           
CODE_12B9FA:        LDA.b #$0F                  
                    STA.w $1DE0                 
                    JMP.w CODE_12B1F9           

CODE_12BA02:        LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12BA0B           
                    JSR.w CODE_12B659           
CODE_12BA0B:        LDA.b $6F,x                 
                    PHA                         
                    PHX                         
                    LDA.b #$02                  
                    STA.b $6F,x                 
                    LDA.b $10                   
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    CPX.b #$03                  
                    BNE   CODE_12BA28           
                    PHX                         
                    LDX.b $12                   
                    LDA.b $6F,x                 
                    EOR.b #$03                  
                    STA.b $6F,x                 
                    PLX                         
CODE_12BA28:        LDA.l DATA_12B9E5,x             
                    PLX                         
                    JSR.w CODE_12BDD5           
                    PLA                         
                    STA.b $6F,x                 
                    LDY.b $6F,x                 
                    LDA   DATA_11986C,y               
                    STA.b $3D,x                 
                    JMP.w CODE_12A0AA           

CODE_12BA3D:        LDA.b #$03                  
CODE_12BA3F:        STA.b $51,x                 
                    LDA.b #$18                  
                    STA.b $86,x                 
CODE_12BA45:        RTS
                       
CODE_12BA46:        LDA.b $A8,x                 
                    BEQ   CODE_12BA45           
                    PLA                         
                    PLA                         
                    JMP.w CODE_12B692           

CODE_12BA4F:        LDA.w $042F,x               
                    BEQ   CODE_12BA63           
                    PLA                         
                    PLA                         
                    JMP.w CODE_12A0A7           

CODE_12BA59:        JSR.w CODE_12AC85           
                    STA.w $0438,x               
                    LDA.b $33,x                 
                    STA.b $79,x                 
CODE_12BA63:        RTS
                       
CODE_12BA64:        ASL.b $65,x                 
                    LDA.b $10                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ROR.b $65,x                 
                    LDY.b $B1,x                 
                    BNE   CODE_12BA92           
                    LDA.b $65,x                 
                    ORA.b #$20                  
                    STA.b $65,x                 
                    LDA.b $79,x                 
                    SEC                         
                    SBC.b #$0C                  
                    CMP.b $33,x                 
                    LDA.b #$FE                  
                    BCC   CODE_12BA8D           
                    LDA.b $65,x                 
                    AND.b #$DF                  
                    STA.b $65,x                 
                    INC.b $B1,x                 
                    LDA.b #$04                  
CODE_12BA8D:        STA.b $47,x                 
                    JMP.w CODE_12BA9A           

CODE_12BA92:        LDA.b $10                   
                    AND.b #$07                  
                    BNE   CODE_12BA9A           
                    INC.b $47,x                 
CODE_12BA9A:        JSR.w CODE_12C1EA           
                    LDA.b $33,x                 
                    CMP.b #$F0                  
                    BCC   CODE_12BAAB           
                    LDA.b #$00                  
                    STA.b $B1,x                 
                    LDA.b $79,x                 
                    STA.b $33,x                 
CODE_12BAAB:        JMP.w CODE_12BD29           

CODE_12BAAE:        LDA.b #$00                  
                    JSR.w CODE_12BAB4           
                    RTL
                       
CODE_12BAB4:        STA.b $00                   
                    LDX.b #$08                  
CODE_12BAB8:        LDA.b $51,x                 
                    CMP.b #$01                  
                    BNE   CODE_12BB10           
                    LDA.b $00                   
                    BEQ   CODE_12BB02           
                    LDA.b $90,x                 
                    CMP.b #$39                  
                    BEQ   CODE_12BAD0           
                    CMP.b #$37                  
                    BEQ   CODE_12BAD0           
                    CMP.b #$32                  
                    BCS   CODE_12BB10                   
CODE_12BAD0:        LDA.b $9C                   
                    BEQ   CODE_12BADD           
                    CPX.w $042D                 
                    BNE   CODE_12BADD           
                    LDA.b #$00                  
                    STA.b $9C                   
CODE_12BADD:        STX.b $0E                   
                    JSR.w CODE_12B1F9           
                    LDX.b $0E                   
                    LDA.b $33,x                 
                    SEC                         
                    SBC.b $CB                   
                    STA.w $0797                 
                    LDA.b $1F,x                 
                    SBC.b $CA                   
                    STA.w $0798                 
                    BNE   CODE_12BAFC           
                    LDA.w $0797                 
                    CMP.b #$F0                  
                    BCC   CODE_12BAFF           
CODE_12BAFC:        STZ.w $0051,x               
CODE_12BAFF:        JMP.w CODE_12BB10           

CODE_12BB02:        LDA.b $5B,x                 
                    BEQ   CODE_12BB10           
                    LDA.b #$D8                  
                    STA.b $47,x                 
                    LDA.b $5B,x                 
                    ORA.b #$10                  
                    STA.b $5B,x                 
CODE_12BB10:        DEX                         
                    BPL   CODE_12BAB8           
                    LDX.b $12                   
                    RTS
                       
CODE_12BB16:        LDA.b $5B,x                 
                    AND.b #$10                  
                    BEQ   CODE_12BB5F           
                    LDA.b $A8,x                 
                    BEQ   CODE_12BB24           
                    LDA.b #$00                ; \ Player is not holding anything.
                    STA.b $9C                 ; /
CODE_12BB24:        LDY.b $90,x                 
                    LDA   DATA_11CC8C,y               
                    AND.b #$08                  
                    ASL   A                     
                    BNE   CODE_12BB3A           
                    LDA.w $1DE1                 
                    BNE   CODE_12BB3D           
                    LDA.b #$34                  
                    STA.w $1DE0                 
                    BNE   CODE_12BB3D           
CODE_12BB3A:        STA.w $1DE0                 
CODE_12BB3D:        CPY.b #$12                  
                    BNE   CODE_12BB49           
                    LDA.w $042F,x             ; \ Generate another sprite when picked up.
                    BNE   CODE_12BB49         ;  | (If not the correct value, don't generate that sprite)
                    JSR.w CODE_12C5D8         ; / Pidgit's carpet.
CODE_12BB49:        LDA.b #$02                ; \ Fall down.
                    STA.b $51,x               ; /
                    STZ.w $00A8,x               
                    LDA.b $65,x                 
                    AND.b #$DF                  
                    STA.b $65,x                 
                    PHX                         
                    PHY                         
                    JSR.w CODE_12BD29           
                    PLY                         
                    PLX                         
                    PLA                         
                    PLA                         
CODE_12BB5F:        RTS
                       
CODE_12BB60:        LDA.b $33,x                 
                    CLC                         
                    SBC.b $CB                   
                    LDY.b $A8,x                 
                    BEQ   CODE_12BB75           
                    LDY.b $C7                   
                    BNE   CODE_12BB75           
                    LDY.b $8F                   
                    DEY                         
                    BEQ   CODE_12BB75           
                    SEC                         
                    SBC.b #$01                  
CODE_12BB75:        STA.w $042C                 
                    LDA.w $04C1                 
                    STA.b $0E                   
                    LDA.w $04BF                 
                    STA.b $0F                   
                    LDA.b $15,x                 
                    XBA                         
                    LDA.b $29,x                 
                    REP   #$20                  
                    SEC                         
                    SBC.b $0E                   
                    SEP   #$20                  
                    STA.w $0429                 
                    XBA                         
                    STA.w $021F                 
                    STZ.w $0248                 
                    STZ.w $0249                 
                    RTS
           
DATA_12BB9C:        db $68,$BA,$BE,$C2
                              
CODE_12BBA0:        LDA.b $51,x            
                    CMP.b #$01
                    BNE   CODE_12BBAF
                    LDA.w $045C,x
                    BEQ   CODE_12BC02          
                    LDA.b #$68                  
                    BRA   CODE_12BC08           

CODE_12BBAF:        LDY.b #$02                  
                    LDA.b $3D,x                 
                    BPL   CODE_12BBB6           
                    DEY                         
CODE_12BBB6:        STY.b $6F,x                 
                    LDA.b $47,x                 
                    BPL   CODE_12BBC6           
CODE_12BBBC:        LDA.b $65,x                 
                    AND.b #$3F                  
                    ORA.b #$40                  
                    STA.b $65,x                 
                    BRA   CODE_12BBD6           

CODE_12BBC6:        CMP.b #$18                  
                    BCC   CODE_12BBBC           
                    LDA.b $6F,x                 
                    EOR.b #$03                  
                    STA.b $6F,x                 
                    LDA.b $65,x                 
                    ORA.b #$80                  
                    STA.b $65,x                 
CODE_12BBD6:        LDY.b #$00                  
                    LDA.w $0702,x               
                    BMI   CODE_12BBF7           
                    LDA.b $47,x                 
                    BPL   CODE_12BBE8           
                    CMP.b #$F8                  
                    BCC   CODE_12BBF7           
                    INY                         
                    BRA   CODE_12BBF7           

CODE_12BBE8:        CMP.b #$18                  
                    BCS   CODE_12BBF7                   
                    INY                         
                    CMP.b #$08                  
                    BCC   CODE_12BBF7           
                    INY                         
                    CMP.b #$10                  
                    BCC   CODE_12BBF7           
                    INY                         
CODE_12BBF7:        PHX                         
                    TYX                         
                    LDA.l DATA_12BB9C,x             
                    PLX                         
                    STZ.b $9F,x                 
                    BRA   CODE_12BC08           

CODE_12BC02:        LDA.b $86,x                 
                    BEQ   CODE_12BC0F           
                    LDA.b #$60                  
CODE_12BC08:        PHA                         
                    JSR.w CODE_12BDD5           
                    PLA                         
                    BRA   CODE_12BC25           

CODE_12BC0F:        JSR.w CODE_12BDC9           
                    LDA.b #$00                  
                    BRA   CODE_12BC25           

DATA_12BC16:        db $26,$26,$28

DATA_12BC19:        db $F8,$F8,$FB,$18,$18,$15

DATA_12BC1F:        db $02,$03,$06,$FE,$FD,$FA
             
CODE_12BC25:        LDY.b #$00                  
                    CMP.b #$00                  
                    BEQ   CODE_12BC31           
                    INY                         
                    CMP.b #$60                  
                    BEQ   CODE_12BC31           
                    INY                         
CODE_12BC31:        PHY                         
                    LDA.b $6F,x                 
                    AND.b #$01                  
                    LSR   A                     
                    ROR   A                     
                    ROR   A                     
                    STA.w $0712                 
                    LDA.b $65,x                 
                    AND.b #$80                  
                    STA.w $0713                 
                    JSL.l CODE_13FC5B           
                    PLY                         
                    LDA.b $EE                   
                    BEQ   CODE_12BC4D           
                    RTS
                       
CODE_12BC4D:        TYX                         
                    PHX                         
                    LDA.w $0713                 
                    BEQ   CODE_12BC59           
                    TXA                         
                    CLC                         
                    ADC.b #$03                  
                    TAX                         
CODE_12BC59:        LDA.l DATA_12BC19,x             
                    CLC                         
                    ADC.w $042C                 
                    STA.b $00                   
                    PLX                         
                    PHX                         
                    LDA.w $0712                 
                    BEQ   CODE_12BC6F           
                    TXA                         
                    CLC                         
                    ADC.b #$03                  
                    TAX                         
CODE_12BC6F:        REP   #$20                  
                    LDA.l DATA_12BC1F,x             
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_12BC80           
                    ORA.w #$FF00                
CODE_12BC80:        STA.w $0716                 
                    SEP   #$20                  
                    LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$20                  
                    CLC                         
                    ADC.w $0716                 
                    CMP.w #$0180                
                    BCC   CODE_12BC9F           
                    CMP.w #$FF80                
                    BCS   CODE_12BC9F                   
                    PLX                         
                    BRA   CODE_12BCE4
           
CODE_12BC9F:        SEP   #$20                  
                    STA.b $01                   
                    XBA                         
                    STA.b $02                   
                    PLX                         
                    LDA.l DATA_12BC16,x             
                    STA.w $0714                 
                    REP   #$10                  
                    LDY.w $02F8                 
                    LDA.b $01                   
                    STA.w $0800,y               
                    LDA.b $00                   
                    STA.w $0801,y               
                    LDA.w $0714                 
                    STA.w $0802,y               
                    LDA.w $0713                 
                    ORA.w $0712                 
                    ORA.b #$2A                  
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDX.w #$0000                
                    LDA.b $02                   
                    BEQ   CODE_12BCDE           
                    INX                         
CODE_12BCDE:        TXA                         
                    ORA.b #$02                  
                    STA.w $0A20,y               
CODE_12BCE4:        SEP   #$30                  
                    LDX.b $12                   
                    RTS
                       
CODE_12BCE9:        LDA.b $ED                   
                    PHA                         
                    JSL.l CODE_139110           
                    PLA                         
                    ASL   A                     
                    STA.b $ED                   
                    LDA.b $B1,x                 
                    ORA.b $EE                   
                    BNE   CODE_12BD4E           
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    LDA.w $0429                 
                    CLC                         
                    ADC.b #$08                  
                    STA.b $01                   
                    LDA.b $6F,x                 
                    STA.b $02                   
                    LDA.b #$03                  
                    STA.b $03                   
                    STA.b $05                   
                    LDA.w $0213                 
                    AND.b #$71                  
                    ORA.b #$01                  
                    STA.w $0213                 
                    JSL.l CODE_14E483           
                    STZ.b $0B                   
                    LDX.b #$14                  
                    JMP.w CODE_12BEF7           

CODE_12BD29:        LDY.b $90,x                 
                    LDA   DATA_11993B,y               
                    CMP.b #$FF                  
                    BEQ   CODE_12BD4E           
                    CPY.b #$1D                  
                    BNE   CODE_12BD39           
                    JMP.w CODE_12C885           

CODE_12BD39:        CPY.b #$21                  
                    BNE   CODE_12BD40           
                    JMP.w CODE_12C331           

CODE_12BD40:        CPY.b #$22                  
                    BNE   CODE_12BD47           
                    JMP.w CODE_12C4A2           

CODE_12BD47:        CPY.b #$2D                  
                    BNE   CODE_12BD4F           
                    JMP.w CODE_12D8FE           

CODE_12BD4E:        RTS
                       
CODE_12BD4F:        CPY.b #$12                  
                    BNE   CODE_12BD56           
                    JMP.w CODE_12C68E           

CODE_12BD56:        CPY.b #$04                  
                    BNE   CODE_12BD5D           
                    JMP.w CODE_12C1A1           

CODE_12BD5D:        CPY.b #$33                  
                    BNE   CODE_12BD64           
                    JMP.w CODE_12B147           

CODE_12BD64:        CPY.b #$26                  
                    BNE   CODE_12BD6B           
                    JMP.w CODE_12D50D           

CODE_12BD6B:        CPY.b #$2A                  
                    BNE   CODE_12BD72           
                    JMP.w CODE_12D209           

CODE_12BD72:        CPY.b #$43                  
                    BNE   CODE_12BD79           
                    JMP.w CODE_12AD30           

CODE_12BD79:        CPY.b #$2C                  
                    BNE   CODE_12BD80           
                    JMP.w CODE_12DC2A           

CODE_12BD80:        CPY.b #$28                  
                    BNE   CODE_12BD87           
                    JMP.w CODE_12D5D6           

CODE_12BD87:        CPY.b #$1A                  
                    BNE   CODE_12BD8E           
                    JMP.w CODE_12CED0           

CODE_12BD8E:        CPY.b #$00                  
                    BNE   CODE_12BD95           
                    JMP.w CODE_12AEDD           

CODE_12BD95:        CPY.b #$08                  
                    BNE   CODE_12BD9C           
                    JMP.w CODE_12C8FD           

CODE_12BD9C:        CPY.b #$1F                  
                    BNE   CODE_12BDA3           
                    JMP.w CODE_12CAB7           

CODE_12BDA3:        CPY.b #$1C                  
                    BNE   CODE_12BDAA           
                    JMP.w CODE_12BBA0           

CODE_12BDAA:        CPY.b #$0A                  
                    BCC   CODE_12BDB5           
                    CPY.b #$0D                  
                    BCS   CODE_12BDB5                   
                    JMP.w CODE_12BCE9           

CODE_12BDB5:        CPY.b #$41                  
                    BNE   CODE_12BDC9           
                    LDA.w $02F6                 
                    STA.w $02F8                 
                    LDA.w $02F7                 
                    STA.w $02F9                 
                    JMP.w CODE_12C6E5           

CODE_12BDC8:        RTS
                       
CODE_12BDC9:        LDY.b $90,x                 
                    CPY.b #$38                  
                    BNE   CODE_12BDD2           
                    JMP.w CODE_12D1A8           

CODE_12BDD2:        LDA   DATA_11993B,y               
CODE_12BDD5:        STA.b $0F                   
                    LDA.b $EE                   
                    BNE   CODE_12BDC8           
                    LDA.w $046E,x               
                    AND.b #$10                  
                    STA.b $0B                   
                    LDY.b $6F,x                 
                    LDA.b $65,x                 
                    AND.b #$18                  
                    BEQ   CODE_12BDFA           
                    LDY.b #$02                  
                    LDA.w $0628                 
                    CMP.b #$02                  
                    BNE   CODE_12BDFA           
                    LDA.b $90,x                 
                    CMP.b #$3D                  
                    BEQ   CODE_12BDFA           
                    DEY                         
CODE_12BDFA:        STY.b $02                   
                    LDA.b $65,x                 
                    AND.b #$44                  
                    STA.b $05                   
                    LDA.w $042C                 
                    STA.b $00                   
                    STZ.w $0700                 
                    STZ.w $0701                 
                    LDA.w $044A,x               
                    AND.b #$02                  
                    LSR   A                     
                    LDY.b $ED                   
                    BEQ   CODE_12BE19           
                    LDA.b #$00                  
CODE_12BE19:        ADC.w $0429                 
                    STA.b $01                   
                    PHX                         
                    LDA.b $90,x                 
                    TAX                         
                    LDA.l DATA_15EBA5,x             
                    PHA                         
                    AND.b #$0F                  
                    ORA.w $0249                 
                    CPX.b #$17                  
                    BNE   CODE_12BE32           
                    ORA.b #$10                  
CODE_12BE32:        STA.w $0213                 
                    STZ.w $0218                 
                    PLA                         
                    PHA                         
                    AND.b #$40                  
                    BEQ   CODE_12BE49           
                    LDA.w $0213                 
                    AND.b #$F1                  
                    ORA.w $0248                 
                    STA.w $0213                 
CODE_12BE49:        PLA                         
                    ASL   A                     
                    ROL.w $0218                 
                    ASL.w $0218                 
                    LDA.l DATA_15EBEC,x             
                    CLC                         
                    ADC.b $00                   
                    STA.b $00                   
                    PLX                         
                    LDA.b $65,x                 
                    AND.b #$A0                  
                    LDY.w $045C,x               
                    BEQ   CODE_12BE7A           
                    STA.b $08                   
                    JSL.l CODE_1391DC           
                    BCS   CODE_12BE7A                   
                    LDA.w $0213                 
                    AND.b #$F1                  
                    STA.w $0213                 
                    TYA                         
                    LSR   A                     
                    AND.b #$03                  
                    ORA.b $08                   
CODE_12BE7A:        STA.b $03                   
                    LDA.w $046E,x               
                    STA.b $0C                   
                    ASL   A                     
                    LDA.b $9F,x                 
                    LDX.b $0F                   
                    AND.b #$08                  
                    BEQ   CODE_12BEA4           
                    BCC   CODE_12BE92           
                    LDA.b #$01                  
                    STA.b $02                   
                    BNE   CODE_12BEA4           
CODE_12BE92:        INX                         
                    INX                         
                    LDA.b $05                   
                    AND.b #$40                  
                    BEQ   CODE_12BEA4           
                    INX                         
                    INX                         
                    LDA.b $0C                   
                    AND.b #$20                  
                    BEQ   CODE_12BEA4           
                    INX                         
                    INX                         
CODE_12BEA4:        LDA.w $02F6                 
                    STA.w $02F8                 
                    LDA.w $02F7                 
                    STA.w $02F9                 
                    LDA.b $05                   
                    AND.b #$40                  
                    BEQ   CODE_12BEF7           
                    LDA.b $05                   
                    AND.b #$04                  
                    BEQ   CODE_12BED0           
                    LDA.b $ED                   
                    STA.b $08                   
                    LDA.b $02                   
                    CMP.b #$01                  
                    BNE   CODE_12BED0           
                    LDA.b $01                   
                    ADC.b #$0F                  
                    STA.b $01                   
                    ASL.b $ED                   
                    ASL.b $ED                   
CODE_12BED0:        JSR.w CODE_12C03B           
                    LDA.b $05                   
                    AND.b #$04                  
                    BEQ   CODE_12BEF7           
                    LDA.w $042C                 
                    STA.b $00                   
                    LDA.w $0429                 
                    STA.b $01                   
                    LDA.b $08                   
                    STA.b $ED                   
                    LDA.b $02                   
                    CMP.b #$01                  
                    BEQ   CODE_12BEF7           
                    LDA.b $01                   
                    ADC.b #$0F                  
                    STA.b $01                   
                    ASL.b $ED                   
                    ASL.b $ED                   
CODE_12BEF7:        JSR.w CODE_12C03B           
                    LDA.b $05                   
                    CMP.b #$40                  
                    BNE   CODE_12BF47           
                    LDA.b $03                   
                    BPL   CODE_12BF47           
                    LDA.b $0C                   
                    AND.b #$20                  
                    BEQ   CODE_12BF32           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDX.w $0700                 
                    LDA.w $0801,x               
                    PHA                         
                    LDA.w $0801,y               
                    STA.w $0801,x               
                    PLA                         
                    STA.w $0801,y               
                    LDA.w $0805,x               
                    PHA                         
                    LDA.w $0805,y               
                    STA.w $0805,x               
                    PLA                         
                    STA.w $0805,y               
                    SEP   #$10                  
                    BCS   CODE_12BF47                   
CODE_12BF32:        REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0801,y               
                    PHA                         
                    LDA.w $0805,y               
                    STA.w $0801,y               
                    PLA                         
                    STA.w $0805,y               
                    SEP   #$10                  
CODE_12BF47:        LDX.b $12                   
                    LDA.b $65,x                 
                    AND.b #$10                  
                    BEQ   CODE_12BF68           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.b $03                   
                    ASL   A                     
                    ORA.w $0213                 
                    AND.b #$3F                  
                    ORA.b #$20                  
                    STA.w $0803,y               
                    ORA.b #$40                  
                    STA.w $0807,y               
                    SEP   #$10                  
CODE_12BF68:        REP   #$10                  
                    LDA.b $EB                   
                    BNE   CODE_12BF98           
                    REP   #$20                  
                    LDA.w $02F8                 
                    SEC                         
                    SBC.w #$0004                
                    STA.w $0700                 
                    SEP   #$20                  
                    LDA.b $90,x                 
                    CMP.b #$0F                  
                    BEQ   CODE_12BF98           
                    CMP.b #$10                  
                    BEQ   CODE_12BF98           
                    CMP.b #$1B                  
                    BEQ   CODE_12BF98           
                    CMP.b #$20                  
                    BEQ   CODE_12BF98           
                    LDY.w $02F6                 
                    LDA.w $0800,y               
                    CMP.b #$F0                  
                    BCS   CODE_12BF9B                   
CODE_12BF98:        BRL   CODE_12C036           

CODE_12BF9B:        LDA.b $90,x                 
                    CMP.b #$2A                  
                    BNE   CODE_12BFAD           
                    LDA.w $02F7                 
                    BNE   CODE_12BFAD           
                    LDA.w $02F6                 
                    CMP.b #$20                  
                    BEQ   CODE_12BFBC           
CODE_12BFAD:        LDA.b $A8,x                 
                    BEQ   CODE_12BFB8           
                    LDA.w $04BE                 
                    CMP.b #$19                  
                    BCC   CODE_12BFBC           
CODE_12BFB8:        JSL.l CODE_14E483           
CODE_12BFBC:        REP   #$10                  
                    LDY.w $02F6                 
                    LDX.w $02F8                 
                    LDA.w $0800,y               
                    STA.w $0800,x               
                    LDA.w $0801,y               
                    STA.w $0801,x               
                    LDA.w $0802,y               
                    STA.w $0802,x               
                    LDA.w $0803,y               
                    STA.w $0803,x               
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
                    LDA.w $0218                 
                    ORA.b #$01                  
                    STA.w $0A20,y               
                    DEC   A                     
                    STA.w $0A20,x               
                    LDA.b $05                   
                    AND.b #$40                  
                    BEQ   CODE_12C036           
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDY.w $0700                 
                    LDX.w $02F8                 
                    LDA.w $0800,y               
                    STA.w $0800,x               
                    LDA.w $0801,y               
                    STA.w $0801,x               
                    LDA.w $0802,y               
                    STA.w $0802,x               
                    LDA.w $0803,y               
                    STA.w $0803,x               
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
                    LDA.w $0218                 
                    ORA.b #$01                  
                    STA.w $0A20,y               
                    DEC   A                     
                    STA.w $0A20,x               
CODE_12C036:        SEP   #$10                  
                    LDX.b $12                   
                    RTS
                       
CODE_12C03B:        LDA.w $0429                 
                    STA.w $0712                 
                    LDA.w $021F                 
                    STA.w $0713                 
                    REP   #$20                  
                    LDA.w $0712                 
                    BPL   CODE_12C055           
                    CMP.w #$FF80                
                    BCS   CODE_12C05F                   
                    BRA   CODE_12C05A           

CODE_12C055:        CMP.w #$0180                
                    BCC   CODE_12C05F           
CODE_12C05A:        SEP   #$20                  
                    JMP.w CODE_12C0FE
           
CODE_12C05F:        SEP   #$20                  
                    LDA.b $0C                   
                    AND.b #$20                  
                    BEQ   CODE_12C06A           
                    JMP.w CODE_12C0FF           

CODE_12C06A:        LDA.b $0B                   
                    BNE   CODE_12C073           
                    LDA.w DATA_11986F,x               
                    BRA   CODE_12C076           

CODE_12C073:        LDA.w DATA_119992,x               
CODE_12C076:        STA.w $0712                 
                    LDA.b $02                   
                    LSR   A                     
                    PHP                         
                    LDA.b $03                   
                    AND.b #$C0                  
                    TSB.w $0213                 
                    PHX                         
                    LDX.b $12                   
                    LDA.b $A8,x                 
                    BEQ   CODE_12C09D           
                    LDA.b $90,x                 
                    CMP.b #$19                  
                    BNE   CODE_12C09D           
                    LDA.b $65,x                 
                    AND.b #$DF                  
                    STA.b $65,x                 
                    LDA.b $03                   
                    AND.b #$DF                  
                    STA.b $03                   
CODE_12C09D:        PLX                         
                    LDA.b $03                   
                    AND.b #$20                  
                    EOR.b #$20                  
                    TSB.w $0213                 
                    LDA.b $03                   
                    AND.b #$03                  
                    ASL   A                     
                    PLP                         
                    BCC   CODE_12C0B1           
                    ORA.b #$40                  
CODE_12C0B1:        ORA.w $0213                 
                    STA.w $0713                 
                    JSL.l CODE_15D007           
                    REP   #$10                  
                    LDY.w $02F8                 
                    LDA.b $00                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    LDA.b $01                   
                    STA.w $0800,y               
                    LDA.w $0712                 
                    STA.w $0802,y               
                    LDA.w $0713                 
                    STA.w $0803,y               
                    REP   #$20                  
                    LDA.w $02F8                 
                    CLC                         
                    ADC.w #$0004                
                    STA.w $02F8                 
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $ED                   
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.w $0218                 
                    STA.w $0A20,y               
                    SEP   #$10                  
                    INX                         
                    INX                         
CODE_12C0FE:        RTS
                       
CODE_12C0FF:        LDA.b $02                   
                    LSR   A                     
                    PHP                         
                    LDA.b $03                   
                    AND.b #$C0                  
                    TSB.w $0213                 
                    LDA.b $03                   
                    AND.b #$03                  
                    ASL   A                     
                    PLP                         
                    BCC   CODE_12C114           
                    ORA.b #$40                  
CODE_12C114:        ORA.b #$20                  
                    ORA.w $0213                 
                    STA.w $0712                 
                    AND.b #$40                  
                    BNE   CODE_12C129           
                    LDA.w DATA_119992,x               
                    PHA                         
                    LDA.w DATA_119992+1,x               
                    BRA   CODE_12C130           

CODE_12C129:        LDA.w DATA_119992+1,x               
                    PHA                         
                    LDA.w DATA_119992,x               
CODE_12C130:        REP   #$10                  
                    LDY.w $02F8                 
                    STA.w $0806,y               
                    PLA                         
                    STA.w $0802,y               
                    LDA.b $00                   
                    STA.w $0801,y               
                    STA.w $0805,y               
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    LDA.b $01                   
                    STA.w $0800,y               
                    ADC.b #$08                  
                    STA.w $0804,y               
                    LDA.w $0712                 
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $ED                   
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    ORA.w $0218                 
                    STA.w $0A20,y               
                    LDA.b $ED                   
                    AND.b #$04                  
                    LSR   A                     
                    LSR   A                     
                    ORA.w $0218                 
                    STA.w $0A21,y               
                    SEP   #$10                  
                    TXA                         
                    PHA                         
                    JSL.l CODE_14E483           
                    PLA                         
                    TAX                         
                    LDA.w $0700                 
                    BNE   CODE_12C19D           
                    LDA.w $0701                 
                    BNE   CODE_12C19D           
                    LDY.w $02F8                 
                    STY.w $0700                 
                    LDY.w $02F9                 
                    STY.w $0701                 
CODE_12C19D:        INX                         
                    INX                         
                    INX                         
                    RTS
                       
CODE_12C1A1:        JSR.w CODE_12BDC9           
                    LDA.b $ED                   
                    AND.b #$0C                  
                    BNE   CODE_12C1D9           
                    LDA.b $9F,x                 
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    STA.b $00                   
                    REP   #$30                  
                    LDA.b $6F,x                 
                    ASL   A                     
                    ASL   A                     
                    ADC.b $00                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDY.w $02F6                 
                    LDA.w $0801,y               
                    ADC.w DATA_11998A-4,x               
                    STA.w $0801,y               
                    LDA.w $0800,y               
                    ADC.w DATA_119982-4,x               
                    STA.w $0800,y               
                    SEP   #$10                  
                    LDX.b $12                   
CODE_12C1D9:        RTS
                       
CODE_12C1DA:        LDA.b $28                   
                    SBC.b $29,x                 
                    STA.b $0F                   
                    LDA.b $14                   
                    LDY.b #$00                  
                    SBC.b $15,x                 
                    BCS   CODE_12C1E9                   
                    INY                         
CODE_12C1E9:        RTS
                       
CODE_12C1EA:        TXA                         
                    CLC                         
                    ADC.b #$0A                  
                    TAX                         
CODE_12C1EF:        LDA.b $3D,x                 
                    CLC                         
                    ADC.w $04CD,x               
                    PHA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $01                   
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    CMP.b #$08                  
                    BCC   CODE_12C207           
                    ORA.b #$F0                  
CODE_12C207:        STA.b $00                   
                    LDY.b #$00                  
                    ASL   A                     
                    BCC   CODE_12C20F           
                    DEY                         
CODE_12C20F:        STY.b $02                   
                    LDA.w $0408,x               
                    CLC                         
                    ADC.b $01                   
                    STA.w $0408,x               
                    LDA.b $29,x                 
                    ADC.b $00                   
                    STA.b $29,x                 
                    ROL.b $01                   
                    CPX.b #$0A                  
                    BCS   CODE_12C23D                   
                    LDA.b #$00                  
                    STA.w $04A4,x               
                    LDA.b $90,x                 
                    CMP.b #$1B                  
                    BEQ   CODE_12C23D           
                    CMP.b #$0F                  
                    BEQ   CODE_12C23D           
                    CMP.b #$10                  
                    BEQ   CODE_12C23D           
                    LDY.b $EB                   
                    BEQ   CODE_12C245           
CODE_12C23D:        LSR.b $01                   
                    LDA.b $15,x                 
                    ADC.b $02                   
                    STA.b $15,x                 
CODE_12C245:        LDX.b $12                   
                    RTS
                       
CODE_12C248:        LDA.b $3D,x                 
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    STA.b $3D,x                 
                    BEQ   CODE_12C259           
                    LDA.b $6F,x                 
                    EOR.b #$03                  
                    STA.b $6F,x                 
CODE_12C259:        JMP.w CODE_12C1EF           

                    JSR.w CODE_12B1F9           
                    RTL
                       
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; /
          
CODE_12C270:        JSR.w CODE_12AF2D           
                    LDA.b #$04                  
                    STA.w $0465,x               
                    LDA.b #$00                  
                    STA.b $3D,x                 
                    LDA.b $29,x                 
                    CLC                         
                    ADC.b #$04                  
                    STA.b $29,x                 
                    JMP.w CODE_129F7A           

CODE_12C286:        LDA.w $045C,x               
                    ORA.w $0438,x               
                    BEQ   CODE_12C291           
                    JMP.w CODE_12BD29           

CODE_12C291:        JSR.w CODE_12BB16           
                    LDA.b $33,x                 
                    CMP.b #$70                  
                    BCC   CODE_12C29D           
                    JSR.w CODE_12B659           
CODE_12C29D:        LDA.b $86,x                 
                    BNE   CODE_12C2CF           
                    LDA.b $79,x                 
                    AND.b #$3F                  
                    BNE   CODE_12C2BE           
                    LDA.w $0587                 
                    AND.b #$03                  
                    BEQ   CODE_12C2BE           
                    LDY.w $04C1                 
                    DEY                         
                    CPY.b #$80                  
                    BCC   CODE_12C2BE           
                    LDA.b #$7F                  
                    STA.b $86,x                 
                    LDY.b #$00                  
                    BEQ   CODE_12C2CA           
CODE_12C2BE:        INC.b $79,x                 
                    LDY.b #$F0                  
                    LDA.b $79,x                 
                    AND.b #$20                  
                    BEQ   CODE_12C2CA           
                    LDY.b #$10                  
CODE_12C2CA:        STY.b $3D,x                 
                    JMP.w CODE_12C328           

CODE_12C2CF:        CMP.b #$50                  
                    BNE   CODE_12C2D3           
CODE_12C2D3:        CMP.b #$20                  
                    BNE   CODE_12C328           
                    LDA.w $0587                 
                    AND.b #$07                  
                    TAY                         
                    LDA   DATA_119A8C,y               
                    STA.b $47,x                 
                    DEC.b $33,x                 
                    JSR.w CODE_12B335           
                    BMI   CODE_12C328           
                    LDY.b $00                   
                    LDA.b $33,x                 
                    SEC                         
                    SBC.b #$00                  
                    STA.w $33,y               
                    LDA.b $1F,x                 
                    SBC.b #$00                  
                    STA.w $1F,y               
                    LDA.b $29,x                 
                    CLC                         
                    ADC.b #$08                  
                    STA.w $29,y               
                    LDA.b $15,x                 
                    ADC.b #$00                  
                    STA.w $15,y               
                    LDX.b $00                   
                    LDA.b #$22                  
                    STA.b $90,x                 
                    LDA.b #$37                  
                    STA.w $1DE0                 
                    LDA.w $0587                 
                    AND.b #$07                  
                    TAY                         
                    LDA   DATA_119A84,y               
                    STA.b $47,x                 
                    LDA.b #$D0                  
                    STA.b $3D,x                 
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12C328:        JSR.w CODE_12C1EF           
                    JSR.w CODE_12A0B2           
                    JMP.w CODE_12BD29           

CODE_12C331:        LDY.b $51,x                 
                    DEY                         
                    TYA                         
                    ORA.w $045C,x               
                    BEQ   CODE_12C342           
                    LDY.b #$D0                  
                    LDA.b #$00                  
                    STA.b $86,x                 
                    BEQ   CODE_12C364           
CODE_12C342:        LDY.b #$C0                  
                    LDA.b $10                   
                    AND.b #$10                  
                    BNE   CODE_12C34C           
                    LDY.b #$C4                  
CODE_12C34C:        LDA.b $86,x                 
                    BEQ   CODE_12C364           
                    LDY.b #$C8                  
                    CMP.b #$60                  
                    BCS   CODE_12C364                   
                    LDY.b #$C0                  
                    CMP.b #$40                  
                    BCS   CODE_12C364                   
                    LDY.b #$C4                  
                    CMP.b #$20                  
                    BCS   CODE_12C364                   
                    LDY.b #$C0                  
CODE_12C364:        LDA.b #$02                  
                    STA.b $6F,x                 
                    TYA                         
                    JSR.w CODE_12BDD5           
                    LDY.b #$C4                  
                    LDA.b $10                   
                    AND.b #$10                  
                    BNE   CODE_12C376           
                    LDY.b #$C0                  
CODE_12C376:        LDA.b $86,x                 
                    BEQ   CODE_12C38E           
                    LDY.b #$CC                  
                    CMP.b #$60                  
                    BCS   CODE_12C38E                   
                    LDY.b #$C0                  
                    CMP.b #$40                  
                    BCS   CODE_12C38E                   
                    LDY.b #$C4                  
                    CMP.b #$20                  
                    BCS   CODE_12C38E                   
                    LDY.b #$C0                  
CODE_12C38E:        LDA.w $045C,x               
                    BEQ   CODE_12C395           
                    LDY.b #$D0                  
CODE_12C395:        LDA.w $0429                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0429                 
                    ASL.b $ED                   
                    ASL.b $ED                   
                    LDA.b $86,x                 
                    CMP.b #$60                  
                    BCS   CODE_12C3AA                   
                    LSR.b $6F,x                 
CODE_12C3AA:        TYA                         
                    PHA                         
                    JSL.l CODE_14E483           
                    LDA.w $02F8                 
                    STA.w $02F6                 
                    LDA.w $02F9                 
                    STA.w $02F7                 
                    PLA                         
                    JSR.w CODE_12BDD5           
                    LDA.w $045C,x               
                    BEQ   CODE_12C3ED           
                    LDA.b $6F,x                 
                    PHA                         
                    LDA.b $10                   
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $6F,x                 
                    LDA.b #$50                  
                    STA.w $02F6                 
                    STZ.w $02F7                 
                    LSR.b $ED                   
                    LDA.w $0429                 
                    SEC                         
                    SBC.b #$08                  
                    STA.w $0429                 
                    LDY.b #$D4                  
                    TYA                         
                    JSR.w CODE_12BDD5           
                    PLA                         
                    STA.b $6F,x                 
CODE_12C3ED:        LDA.b $86,x                 
                    BEQ   CODE_12C466           
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    BEQ   CODE_12C465           
                    TAY                         
                    LDA.b $29,x                 
                    PHA                         
                    CLC                         
                    ADC   DATA_119A93,y               
                    STA.b $29,x                 
                    SEC                         
                    SBC.w $04C1                 
                    STA.w $0429                 
                    LDA.b $33,x                 
                    CLC                         
                    ADC   DATA_119A96,y               
                    STA.w $042C                 
                    LDA.b $86,x                 
                    CMP.b #$30                  
                    BCC   CODE_12C42A           
                    CMP.b #$40                  
                    BCS   CODE_12C42A                   
                    LSR   A                     
                    AND.b #$07                  
                    TAY                         
                    LDA.w $042C                 
                    SEC                         
                    SBC   DATA_119A9A,y               
                    STA.w $042C                 
CODE_12C42A:        JSR.w CODE_12A6F9           
                    LDY.b #$40                  
                    STY.w $02F6                 
                    STZ.w $02F7                 
                    LDA.b $65,x                 
                    PHA                         
                    LDA.b #$02                  
                    STA.b $65,x                 
                    LDA.w $046E,x               
                    PHA                         
                    LDA.b #$10                  
                    STA.w $046E,x               
                    LDA.b #$D8                  
                    JSR.w CODE_12BDD5           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0803,y               
                    AND.b #$F1                  
                    ORA.b #$06                  
                    STA.w $0803,y               
                    SEP   #$10                  
                    PLA                         
                    STA.w $046E,x               
                    PLA                         
                    STA.b $65,x                 
                    PLA                         
                    STA.b $29,x                 
CODE_12C465:        RTS
                       
CODE_12C466:        LDX.b $12                   
                    RTS
                       
CODE_12C469:        LDA.b #$00                  
                    STA.w $045C,x               
                    JSR.w CODE_12BB16           
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12C1EF           
                    JSR.w CODE_12A0B2           
                    JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    AND.b #$03                  
                    BEQ   CODE_12C489           
                    JSR.w CODE_12C248           
                    JSR.w CODE_12B63B           
CODE_12C489:        LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12C49F           
                    LDA.b $33,x                 
                    AND.b #$F0                  
                    STA.b $33,x                 
                    LDA.b $47,x                 
                    LSR   A                     
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    STA.b $47,x                 
CODE_12C49F:        JMP.w CODE_12BD29           

CODE_12C4A2:        LDA.w $A8,x               
                    ORA.w $0438,x               
                    BNE   CODE_12C4E1           
                    LDA.b $10                   
                    STA.b $00                   
                    LDA.b $3D,x                 
                    BPL   CODE_12C4B7           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
CODE_12C4B7:        CMP.b #$20                  
                    BCS   CODE_12C4C3                   
                    LSR.b $00                   
                    CMP.b #$08                  
                    BCS   CODE_12C4C3                   
                    LSR.b $00                   
CODE_12C4C3:        LDA.b $00                   
                    CLC                         
                    ADC.b #$04                  
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LDY.b $3D,x                 
                    BPL   CODE_12C4D3           
                    EOR.b #$01                  
CODE_12C4D3:        STA.b $6F,x                 
                    LDA.b $00                   
                    AND.b #$08                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ORA.b #$02                  
                    STA.b $65,x                 
CODE_12C4E1:        JSR.w CODE_12BDC9           
                    REP   #$10                  
                    LDY.w $02F6                 
                    LDA.w $0803,y               
                    AND.b #$F1                  
                    ORA.b #$06                  
                    STA.w $0803,y               
                    SEP   #$10                  
                    RTS
                       
CODE_12C4F6:        JSR.w CODE_12DDAB           
                    LDA.b $10                   
                    AND.b #$03                  
                    BNE   CODE_12C509           
                    DEC.b $B1,x                 
                    BNE   CODE_12C509           
                    STA.w $04B2                 
                    JMP.w CODE_12A83B           

CODE_12C509:        LDA.w $04B2                 
                    BEQ   CODE_12C51C           
                    LDA.b $46                   
                    BPL   CODE_12C51C           
                    LDA.b #$00                  
                    STA.b $47,x                 
                    STA.w $04B2                 
                    JMP.w CODE_12C5C9           

CODE_12C51C:        LDA.b $5B,x                 
                    AND.b #$20                  
                    STA.w $04B2                 
                    BNE   CODE_12C528           
                    JMP.w CODE_12C5B6           

CODE_12C528:        LDA.b $3D,x                 
                    BEQ   CODE_12C532           
                    LDA.b $6F,x                 
                    AND.b #$01                  
                    STA.b $9D                   
CODE_12C532:        LDA.b $33,x                 
                    SEC                         
                    SBC.b #$1A                  
                    STA.b $32                   
                    LDA.b $1F,x                 
                    SBC.b #$00                  
                    STA.b $1E                   
                    LDA.b $28                   
                    SEC                         
                    SBC.b #$08                  
                    STA.b $29,x                 
                    LDA.b $14                   
                    SBC.b #$00                  
                    STA.b $15,x                 
                    LDY.b #$01                  
                    LDA.b $3D,x                 
                    BMI   CODE_12C554           
                    LDY.b #$FF                  
CODE_12C554:        STY.w $1206                 
                    LDA.b $F6                   
                    AND.b #$03                  
                    TAY                         
                    AND.b $5A                   
                    BNE   CODE_12C572           
                    LDA   DATA_119AA2,y               
                    CMP.b $3D,x                 
                    BEQ   CODE_12C56F           
                    LDA.b $3D,x                 
                    CLC                         
                    ADC.w $1206,y               
                    STA.b $3D,x                 
CODE_12C56F:        JMP.w CODE_12C576           

CODE_12C572:        LDA.b #$00                  
                    STA.b $3D,x                 
CODE_12C576:        LDY.b #$01                  
                    LDA.b $47,x                 
                    BMI   CODE_12C57E           
                    LDY.b #$FF                  
CODE_12C57E:        STY.w $1206                 
                    LDA.b #$20                  
                    CMP.w $042C                 
                    LDA.b #$00                  
                    ROL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    AND.b $F6                   
                    BNE   CODE_12C5A3           
                    LDA.b $5B,x                 
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    STA.b $00                   
                    LDA.b $F6                   
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    TAY                         
                    AND.b $00                   
                    BEQ   CODE_12C5A7           
CODE_12C5A3:        LDA.b #$00                  
                    BEQ   CODE_12C5B4           
CODE_12C5A7:        LDA   DATA_119AA2,y               
                    CMP.b $47,x                 
                    BEQ   CODE_12C5B6           
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w $1206,y               
CODE_12C5B4:        STA.b $47,x                 
CODE_12C5B6:        JSR.w CODE_12C1EF           
                    JSR.w CODE_12C1EA           
                    LDA.b $B1,x                 
                    CMP.b #$20                  
                    BCS   CODE_12C5C9                   
                    LDA.b $10                   
                    AND.b #$02                  
                    BNE   CODE_12C5C9           
                    RTS
                       
CODE_12C5C9:        LDA.w $02F6                 
                    STA.w $02F8                 
                    LDA.w $02F7                 
                    STA.w $02F9                 
                    JMP.w CODE_12C6E5           

CODE_12C5D8:        JSR.w CODE_12B331         ; \ Check if free sprite slot is available.
                    BMI   CODE_12C610         ; / If not, return.
                    LDX.b $00                 ; New sprite index.
                    LDY.b $12                 ; Old sprite index.
                    LDA.b #$00                ; \ Zero X speed.
                    STA.b $3D,x               ;  | Zero Y speed.
                    STA.b $47,x               ; / (Why not simply use STZ $3D,x STZ $47,x?)
                    LDA.b #$41                ; \ Generate carpet sprite.
                    STA.b $90,x               ; /
                    LDA.w $29,y             ; \ Generate carpet 8 pixels to the left from Pidgit.
                    SEC                       ;  |
                    SBC.b #$08                ;  |
                    STA.b $29,x               ;  |
                    LDA.w $15,y             ;  |
                    SBC.b #$00                ;  |
                    STA.b $15,x               ; /
                    LDA.w $33,y             ; \ ...and 14 pixels below Pidgit.
                    CLC                       ;  |
                    ADC.b #$0E                ;  |
                    STA.b $33,x               ;  |
                    LDA.w $1F,y             ;  |
                    ADC.b #$00                ;  |
                    STA.b $1F,x               ; /
                    JSR.w CODE_129F7A           
                    LDA.b #$A0                ; \ Amount of time carpet will remain.
                    STA.b $B1,x               ; /
CODE_12C610:        LDX.b $12                 ; X = old sprite index.
                    RTS                       ; Return.
                       
CODE_12C613:        JSR.w CODE_12BB16           
                    INC.b $9F,x                 
                    LDA.w $042F,x               
                    BEQ   CODE_12C629           
                    LDA.b $65,x                 
                    ORA.b #$80                  
                    STA.b $65,x                 
                    JSR.w CODE_12C68E           
                    JMP.w CODE_12A0AA           

CODE_12C629:        JSR.w CODE_12BA46           
                    LDA.b $B1,x                 
                    BEQ   CODE_12C647           
                    DEC.b $47,x                 
                    BPL   CODE_12C644           
                    LDA.b $33,x                 
                    CMP.b #$30                  
                    BCS   CODE_12C644                   
                    LDA.b #$00                  
                    STA.b $B1,x                 
                    STA.b $3D,x                 
                    STA.b $47,x                 
                    DEC.b $86,x                 
CODE_12C644:        JMP.w CODE_12C688           

CODE_12C647:        LDA.b $86,x                 
                    BNE   CODE_12C65C           
                    LDA.b #$30                  
                    STA.b $47,x                 
                    JSR.w CODE_12C1DA           
                    LDA   DATA_119ABA,y               
                    STA.b $3D,x                 
                    INC.b $B1,x                 
                    JMP.w CODE_12C68E           

CODE_12C65C:        LDA.w $0480,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.b $47,x                 
                    CLC                         
                    ADC.w DATA_119AB2,y               
                    STA.b $47,x                 
                    CMP.w DATA_119AB4,y               
                    BNE   CODE_12C672           
                    INC.w $0480,x               
CODE_12C672:        LDA.w $0477,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.b $3D,x                 
                    CLC                         
                    ADC   DATA_119AB6,y               
                    STA.b $3D,x                 
                    CMP   DATA_119AB8,y               
                    BNE   CODE_12C688           
                    INC.w $0477,x               
CODE_12C688:        JSR.w CODE_12C1EA           
                    JSR.w CODE_12C1EF           
CODE_12C68E:        JSR.w CODE_12BDC9           
                    LDA.b $51,x                 
                    SEC                         
                    SBC.b #$01                  
                    ORA.w $042F,x               
                    ORA.b $A8,x                 
                    BNE   CODE_12C6E2           
                    JSL.l CODE_14E483           
                    LDA.b #$45                  
                    STA.b $65,x                 
                    LDA.b $29,x                 
                    PHA                         
                    SEC                         
                    SBC.b #$08                  
                    STA.b $29,x                 
                    LDA.b $15,x                 
                    PHA                         
                    SBC.b #$00                  
                    STA.b $15,x                 
                    JSR.w CODE_12A6F9           
                    PLA                         
                    STA.b $15,x                 
                    PLA                         
                    STA.b $29,x                 
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$0C                  
                    STA.w $042C                 
                    LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$20                  
                    SBC.w #$0007                
                    SEP   #$20                  
                    STA.w $0429                 
                    XBA                         
                    STA.w $021F                 
                    JSR.w CODE_12C6E5           
                    LDA.b #$0D                  
                    STA.b $65,x                 
CODE_12C6E2:        SEP   #$20                  
                    RTS
                       
CODE_12C6E5:        JSL.l CODE_15D21F           
                    BCS   CODE_12C6E2                   
                    REP   #$30                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STY.w $0712                 
                    LDY.w $070B                 
                    LDA.w $0429                 
                    STA.b $0E                   
                    LDA.w $021F                 
                    STA.b $0F                   
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b $12                   
                    AND.w #$00FF                
                    TAX                         
                    LDA.b $ED                   
                    AND.w #$00FF                
                    STA.w $0716                 
                    SEP   #$20                  
                    LDA.w $044A,x               
                    AND.b #$02                  
                    LSR   A                     
                    LDX.w $0716                 
                    BEQ   CODE_12C72E           
                    LDA.b #$00                  
CODE_12C72E:        STA.w $0714                 
                    STZ.w $0715                 
                    REP   #$20                  
                    LDA.b $0E                   
                    ADC.w $0714                 
                    STA.b $04                   
                    CLC                         
                    ADC.w #$0008                
                    STA.b $06                   
                    LDA.b $04                   
                    CLC                         
                    ADC.w #$0010                
                    STA.b $08                   
                    LDA.b $04                   
                    CLC                         
                    ADC.w #$0018                
                    STA.b $0A                   
                    SEP   #$20                  
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    LDA.b $EB                   
                    BEQ   CODE_12C789           
                    LDX.w #$0001                
                    LDA.b $05                   
                    BEQ   CODE_12C76C           
                    TXA                         
                    STA.w $0A20,y               
CODE_12C76C:        LDA.b $07                   
                    BEQ   CODE_12C774           
                    TXA                         
                    STA.w $0A21,y               
CODE_12C774:        LDY.w $0712                 
                    LDA.b $09                   
                    BEQ   CODE_12C77F           
                    TXA                         
                    STA.w $0A20,y               
CODE_12C77F:        LDA.b $0B                   
                    BEQ   CODE_12C787           
                    TXA                         
                    STA.w $0A21,y               
CODE_12C787:        BRA   CODE_12C7B3           

CODE_12C789:        LDX.w $070B                 
                    JSR.w CODE_12C7B8           
                    LDX.w $070D                 
                    JSR.w CODE_12C7B8           
                    REP   #$20                  
                    LDA.w $070B                 
                    CLC                         
                    ADC.w #$0004                
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_12C7B8           
                    REP   #$20                  
                    LDA.w $070D                 
                    CLC                         
                    ADC.w #$0004                
                    TAX                         
                    SEP   #$20                  
                    JSR.w CODE_12C7B8           
CODE_12C7B3:        SEP   #$30                  
                    LDX.b $12                   
                    RTS
                       
CODE_12C7B8:        LDA.w $0800,x               
                    CMP.b #$F8                  
                    BCC   CODE_12C7F7           
                    PHX                         
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    PLX                         
                    LDY.w $02F8                 
                    LDA.w $0800,x               
                    STA.w $0800,y               
                    LDA.w $0801,x               
                    STA.w $0801,y               
                    LDA.w $0802,x               
                    STA.w $0802,y               
                    LDA.w $0803,x               
                    STA.w $0803,y               
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
                    LDA.b #$01                  
                    STA.w $0A20,x               
                    DEC   A                     
                    STA.w $0A20,y               
CODE_12C7F7:        RTS
                       
CODE_12C7F8:        JSR.w CODE_12AF2D           
                    LDA.b #$02                  
                    LDY.w $0635                 
                    BEQ   CODE_12C804           
                    LDA.b #$04                  
CODE_12C804:        STA.w $0465,x               
                    RTS
                       
CODE_12C808:        JSR.w CODE_12BB16           
                    LDA.w $045C,x               
                    BEQ   CODE_12C813           
                    JMP.w CODE_12BD29           

CODE_12C813:        JSR.w CODE_12DDAB           
                    LDA.b #$02                  
                    STA.b $6F,x                 
                    JSR.w CODE_12BD29           
                    LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12C882           
                    JSR.w CODE_12B659           
                    LDA.b $10                   
                    AND.b #$FF                  
                    BNE   CODE_12C832           
                    LDA.b #$D8                  
                    STA.b $47,x                 
                    BNE   CODE_12C882           
CODE_12C832:        LDA.b $10                   
                    AND.b #$3F                  
                    BNE   CODE_12C83C           
                    LDA.b #$20                  
                    STA.b $86,x                 
CODE_12C83C:        LDY.b $86,x                 
                    BNE   CODE_12C85B           
                    INC.b $B1,x                 
                    LDA.b $B1,x                 
                    AND.b #$20                  
                    BEQ   CODE_12C881           
                    INC.b $9F,x                 
                    INC.b $9F,x                 
                    LDY.b #$18                  
                    LDA.b $B1,x                 
                    AND.b #$40                  
                    BNE   CODE_12C856           
                    LDY.b #$E8                  
CODE_12C856:        STY.b $3D,x                 
                    JMP.w CODE_12C1EF           

CODE_12C85B:        CPY.b #$10                  
                    BNE   CODE_12C881           
                    JSR.w CODE_12B331           
                    BMI   CODE_12C881           
                    LDX.b $00                   
                    LDA.b #$37                  
                    STA.b $90,x                 
                    LDA.b $33,x                 
                    ADC.b #$03                  
                    STA.b $33,x                 
                    LDA.b #$E0                  
                    STA.b $47,x                 
                    JSR.w CODE_129F7A           
                    LDA.b #$FF                  
                    STA.b $86,x                 
                    LDA.b #$E0                  
                    STA.b $3D,x                 
                    LDX.b $12                   
CODE_12C881:        RTS                         

CODE_12C882:        JMP.w CODE_12A0B2           

CODE_12C885:        LDA.b $51,x                 
                    CMP.b #$01                  
                    BNE   CODE_12C896           
                    LDA.w $045C,x               
                    BEQ   CODE_12C89F           
                    INC.b $9F,x                 
                    LDA.b #$4A                  
                    STA.b $65,x                 
CODE_12C896:        LDA.b #$B3                  
                    STA.w $046E,x               
                    LDA.b #$2C                  
                    BNE   CODE_12C8A8           
CODE_12C89F:        LDY.b $86,x                 
                    DEY                         
                    CPY.b #$10                  
                    BCS   CODE_12C8AD                   
                    LDA.b #$20                  
CODE_12C8A8:        JSR.w CODE_12BDD5           
                    BRA   CODE_12C8F3           

CODE_12C8AD:        JSR.w CODE_12BDC9           
                    LDA.b $86,x                 
                    CMP.b #$10                  
                    BCC   CODE_12C8F3           
                    LDA.b #$01                  
                    STA.b $65,x                 
                    LDA.b #$10                  
                    STA.w $046E,x               
                    LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$20                  
                    CLC                         
                    ADC.w #$000B                
                    SEP   #$20                  
                    STA.w $0429                 
                    XBA                         
                    STA.w $021F                 
                    AND.b #$01                  
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $ED                   
                    LDY.b #$5C             
                    STY.w $02F6                
                    STZ.w $02F7                 
                    LDA.b $90,x                 
                    PHA                         
                    LDA.b #$37                  
                    STA.b $90,x                 
                    LDA.b #$38                  
                    JSR.w CODE_12BDD5           
                    PLA                         
                    STA.b $90,x                 
CODE_12C8F3:        LDA.b #$43                  
                    STA.b $65,x                 
                    LDA.b #$33                  
                    STA.w $046E,x               
                    RTS
                       
CODE_12C8FD:        JSR.w CODE_12BDD2           
                    LDA.b $EE                   
                    ORA.b $B1,x                 
                    BNE   CODE_12C935           
                    LDA.b $33,x                 
                    SEC                         
                    SBC.b #$02                  
                    STA.b $00                   
                    JSR.w CODE_12C936           
                    JSL.l CODE_14E483           
                    LDA.w $0213                 
                    PHA                         
                    AND.b #$F1                  
                    ORA.b #$02                  
                    STA.w $0213                 
                    CMP.b #$A3                  
                    BNE   CODE_12C92A           
                    LDA.b $00                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
CODE_12C92A:        LDX.b #$78
                    JSR.w CODE_12C03B                
                    PLA
                    STA.w $0213                 
                    LDX.b $12                   
CODE_12C935:        RTS
                       
CODE_12C936:        LDY.b $6F,x                 
                    STZ.b $ED                   
                    LDA.b $29,x                 
                    STA.w $0712                 
                    LDA.b $15,x                 
                    STA.w $0713                 
                    LDA.w $04C1                 
                    STA.w $0714                 
                    LDA.w $04BF                 
                    STA.w $0715                 
                    REP   #$20                  
                    LDA   DATA_119ABB,y               
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_12C960           
                    ORA.w #$FF00                
CODE_12C960:        CLC                         
                    ADC.w $0712                 
                    SEC                         
                    SBC.w $0714                 
                    SEP   #$20                  
                    STA.w $0429                 
                    STA.b $01                   
                    XBA                         
                    STA.w $021F                 
                    BEQ   CODE_12C979           
                    LDA.b #$08                  
                    STA.b $ED                   
CODE_12C979:        RTS
                       
CODE_12C97A:        LDA.b $B1,x                 
                    BEQ   CODE_12C981           
                    BRL   CODE_12CA20           

CODE_12C981:        LDA.b $A8,x                 
                    BEQ   CODE_12CA03           
                    LDA.b #$01                  
                    STA.b $90,x                 
                    JSR.w CODE_129F7A           
                    LDA.w $0429                 
                    STA.w $0716                 
                    LDA.w $021F                 
                    STA.w $0717                 
                    LDA.b $ED                   
                    PHA                         
                    JSR.w CODE_12C936           
                    LDY.b $90,x                 
                    JSR.w CODE_12BDD2           
                    PLA                         
                    STA.b $ED                   
                    LDA.w $0717                 
                    STA.w $021F                 
                    LDA.w $0716                 
                    STA.w $0429                 
                    JSR.w CODE_12B331           
                    BMI   CODE_12CA02           
                    LDY.b $00                   
                    LDA.b #$08                  
                    STA.w $90,y               
                    STA.w $B1,y               
                    LDA.b $9F,x                 
                    STA.w $9F,y               
                    LDA.b $29,x                 
                    STA.w $29,y               
                    LDA.b $15,x                 
                    STA.w $15,y               
                    LDA.b $6F,x                 
                    STA.w $6F,y               
                    LDA.w $0441,x               
                    STA.w $0441,y               
                    LDA.b #$FF                  
                    STA.w $0441,x               
                    LDA.b $3D,x                 
                    STA.w $3D,y               
                    TYX                         
                    JSR.w CODE_129F7A           
                    PHX                         
                    JSL.l CODE_14E483           
                    PLX                         
                    LDY.b $90,x                 
                    JSR.w CODE_12C8FD           
                    LDA.w $02F6                 
                    STA.w $02F8                 
                    LDA.w $02F7                 
                    STA.w $02F9                 
                    LDX.b $12                   
CODE_12CA02:        RTS
                       
CODE_12CA03:        LDA.b $5B,x                 
                    AND.b #$10                  
                    BEQ   CODE_12CA20           
                    INC.b $B1,x                 
                    STA.b $9F,x                 
                    JSR.w CODE_12B335           
                    BMI   CODE_12CA20           
                    LDY.b $00                   
                    LDA.b $3D,x                 
                    STA.w $3D,y               
                    LDA.b #$20                  
                    STA.w $0453,y               
                    BRA   CODE_12CA31           

CODE_12CA20:        LDA.b $A8,x                 
                    BEQ   CODE_12CA2B           
                    LDA.w $0500                 
                    BEQ   CODE_12CA2B           
                    DEC.b $9F,x                 
CODE_12CA2B:        JSR.w CODE_12BA46           
                    JSR.w CODE_12BB16           
CODE_12CA31:        LDA.w $0500                 
                    BEQ   CODE_12CA3D           
                    LDA.w $042F,x               
                    BEQ   CODE_12CA7D           
                    BRA   CODE_12CA40           

CODE_12CA3D:        JSR.w CODE_12DDAB           
CODE_12CA40:        LDA.b $5B,x                 
                    AND.b $6F,x                 
                    BEQ   CODE_12CA49           
                    JSR.w CODE_12C248           
CODE_12CA49:        LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12CA69           
                    LDA.w $042F,x               
                    BEQ   CODE_12CA5C           
                    LDA.b #$00                  
                    STA.w $042F,x               
                    JSR.w CODE_129FCA           
CODE_12CA5C:        LDA.b $9F,x                 
                    EOR.b #$08                  
                    STA.b $9F,x                 
                    JSR.w CODE_12B659           
                    LDA.b #$F0                  
                    STA.b $47,x                 
CODE_12CA69:        INC.w $0477,x               
                    LDA.b $B1,x                 
                    BNE   CODE_12CA7A           
                    LDA.w $0477,x               
                    AND.b #$3F                  
                    BNE   CODE_12CA7A           
                    JSR.w CODE_129FCD           
CODE_12CA7A:        JSR.w CODE_12A0AA           
CODE_12CA7D:        JMP.w CODE_12BD29           

CODE_12CA80:        JSR.w CODE_129F96           
                    LDA.b #$40                  
                    STA.w $0477,x               
                    LDA.b #$02                  
                    STA.w $0465,x               
                    JMP.w CODE_12AF50    
       
CODE_12CA90:        RTS
                       
CODE_12CA91:        JSR.w CODE_12BB16           
                    LDY.b #$00                  
                    LDA.w $0477,x               
                    ASL   A                     
                    BCC   CODE_12CAA3           
                    LDY.b #$02                  
                    ASL   A                     
                    BCC   CODE_12CAA3           
                    LDY.b #$FE                  
CODE_12CAA3:        STY.b $3D,x                 
                    JSR.w CODE_12C1EF           
                    INC.w $0477,x               
                    LDA.b $B1,x                 
                    CLC                         
                    ADC.b #$D0                  
                    STA.b $B1,x                 
                    BCC   CODE_12CAB7           
                    INC.w $0480,x               
CODE_12CAB7:        LDA.b $EE                   
                    BNE   CODE_12CA90           
                    LDA.b #$49                  
                    STA.b $65,x                 
                    LDY.b #$44                  
                    LDA.b $51,x                 
                    SEC                         
                    SBC.b #$01                  
                    ORA.w $045C,x               
                    STA.b $07                   
                    BEQ   CODE_12CACF           
                    LDY.b #$48                  
CODE_12CACF:        TYA                         
                    LDY.b #$60                  
                    STY.w $02F6                 
                    STZ.w $02F7                 
                    JSR.w CODE_12BDD5           
                    LDA.b $1F,x                 
                    XBA                         
                    LDA.b $33,x                 
                    REP   #$20                  
                    CLC                         
                    ADC.w #$0020                
                    CMP.w #$00F0                
                    SEP   #$20                  
                    BCS   CODE_12CB1A                   
                    LDA.b #$09                  
                    STA.b $65,x                 
                    LDA.b #$33                  
                    STA.w $046E,x               
                    JSR.w CODE_12CC87           
                    LDX.b #$4C                  
                    LDA.b $10                   
                    AND.b #$20                  
                    BNE   CODE_12CB09           
                    LDA.b #$04                  
                    AND.b $10                   
                    BEQ   CODE_12CB09           
                    LDX.b #$4F                  
CODE_12CB09:        LDA.b #$20                  
                    STA.b $0C                   
                    LDY.b #$E0                  
                    STY.w $02F8                 
                    LDY.b #$01                  
                    STY.w $02F9                 
                    JSR.w CODE_12C03B           
CODE_12CB1A:        LDX.b $12                   
                    LDA.b #$13                  
                    STA.w $046E,x               
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$FF                  
                    STA.b $00                   
                    LDA.w $0477,x               
                    AND.b #$78                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA   DATA_119ABE,y               
                    ADC.w $0429                 
                    ADC.b #$F0                  
                    STA.b $01                   
                    JSR.w CODE_12CC4C           
                    LDX.b #$52                  
                    LDA.b $07                   
                    BNE   CODE_12CB50           
                    LDX.b #$54                  
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    CPY.b #$07                  
                    BCS   CODE_12CB50                   
                    LDX.b #$56                  
CODE_12CB50:        LDY.b #$50                  
                    STY.w $02F8                 
                    STZ.w $02F9                 
                    JSR.w CODE_12C03B           
                    LDX.b $12                   
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    LDA.w $0480,x               
                    AND.b #$78                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA   DATA_119ABE,y               
                    ADC.w $0429                 
                    ADC.b #$F0                  
                    STA.b $01                   
                    JSR.w CODE_12CC4C           
                    LDX.b #$52                  
                    LDA.b $07                   
                    BNE   CODE_12CB8C           
                    LDX.b #$54                  
                    DEY                         
                    DEY                         
                    DEY                         
                    DEY                         
                    CPY.b #$07                  
                    BCS   CODE_12CB8C                   
                    LDX.b #$56                  
CODE_12CB8C:        LDY.b #$68                  
                    STY.w $02F8                 
                    STZ.w $02F9                 
                    JSR.w CODE_12C03B           
                    LDX.b $12                   
                    LDA.b #$13                  
                    STA.w $046E,x               
                    LDA.b $01                   
                    CLC                         
                    ADC.b #$08                  
                    STA.w $09C0                 
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $09C1                 
                    LDA.b #$C1                  
                    STA.w $09C2                 
                    LDA.w $0863                 
                    STA.w $09C3                 
                    STA.w $0823                 
                    LDA.b $ED                   
                    AND.b #$04                  
                    LSR   A                     
                    LSR   A                     
                    ORA.b #$02                  
                    STA.w $0A90                 
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$FF                  
                    STA.w $0821                 
                    LDA.w $0862                 
                    STA.w $0822                 
                    LDA.w $0429                 
                    STA.w $0820                 
                    LDA.b #$02                  
                    LDY.w $021F                 
                    BEQ   CODE_12CBE4           
                    ORA.b #$01                  
CODE_12CBE4:        STA.w $0A28                 
                    STZ.b $05                   
                    LDA.w $0477,x               
                    JSR.w CODE_12CBF4           
                    INC.b $05                   
                    LDA.w $0480,x               
CODE_12CBF4:        AND.b #$67                  
                    CMP.b #$40                  
                    BNE   CODE_12CC4B           
                    LDA.w $045C,x               
                    BNE   CODE_12CC4B           
                    JSR.w CODE_12B335           
                    BMI   CODE_12CC4B           
                    LDA.b #$17                  
                    STA.w $1DE3                 
                    LDY.b $00                   
                    LDA.b #$20                  
                    STA.w $90,y               
                    STA.w $79,y               
                    STA.w $B1,y               
                    LDA.b $29,x                 
                    SBC.b #$18                  
                    STA.w $29,y               
                    LDA.b $05                   
                    BEQ   CODE_12CC29           
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $33,y               
CODE_12CC29:        LDA.b $28                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$0F                  
                    CMP.b #$0B                  
                    BCC   CODE_12CC37           
                    LDA.b #$0B                  
CODE_12CC37:        TAX                         
                    LDA.w DATA_119ACE,x               
                    STA.w $47,y               
                    LDA.w DATA_119ADA,x               
                    STA.w $3D,y               
CODE_12CC44:        TYA                         
                    TAX                         
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12CC4B:        RTS                         
                       
CODE_12CC4C:        LDA.w $0429                 
                    STA.b $08                   
                    LDA.w $021F                 
                    STA.b $09                   
                    STZ.b $ED                   
                    REP   #$20                  
                    LDA   DATA_119ABE,y               
                    AND.w #$00FF                
                    ORA.w #$FF00                
                    ADC.b $08                   
                    ADC.w #$FFF0                
                    STA.b $08                   
                    AND.w #$FF00                
                    BEQ   CODE_12CC74           
                    LDA.w #$0008                
                    TSB.b $ED                   
CODE_12CC74:        LDA.b $08                   
                    CLC                         
                    ADC.w #$0008                
                    AND.w #$FF00                
                    BEQ   CODE_12CC84           
                    LDA.w #$0004                
                    TSB.b $ED                   
CODE_12CC84:        SEP   #$20                  
                    RTS
                       
CODE_12CC87:        LDA.w $0429                 
                    STA.b $08                   
                    LDA.w $021F                 
                    STA.b $09                   
                    STZ.b $ED                   
                    REP   #$20                  
                    LDA.b $08                   
                    AND.w #$FF00                
                    BEQ   CODE_12CCA1           
                    LDA.w #$0004                
                    TSB.b $ED                   
CODE_12CCA1:        LDA.b $08                   
                    SEC                         
                    SBC.w #$0008                
                    STA.b $08                   
                    AND.w #$FF00                
                    BEQ   CODE_12CCB3           
                    LDA.w #$0008                
                    TSB.b $ED                   
CODE_12CCB3:        SEP   #$20                  
                    LDA.b $08                   
                    STA.b $01                   
                    RTS
                       
CODE_12CCBA:        JSR.w CODE_129F96           
                    LDA.b $33,x                 
                    SEC                         
                    SBC.b #$08                  
                    STA.b $79,x                 
                    RTS
                       
CODE_12CCC5:        JSR.w CODE_12BB16           
                    JSR.w CODE_12BA4F           
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12DDAB           
                    LDA.w $0480,x             ; \ Check if Cobrat needs to remain in sand.
                    BNE   CODE_12CD06         ; / If not, branch.
                    STA.b $3D,x               ; X speed = #$00.
                    JSR.w CODE_12C1DA         
                    LDA.b $0F                 ; \ Check if player is near enough to Cobrat.  
                    ADC.b #$40                ;  |
                    CMP.b #$80                ;  |
                    BCS   CODE_12CCEC         ; / If not, do regular routine. (Remain in sand)      
                    INC.w $0480,x             ; Don't retreat into sand anymore.
                    LDA.b #$C0                ; \ Jump up.
                    STA.b $47,x               ; /
                    BNE   CODE_12CD06         ; Branch. 

CODE_12CCEC:        INC.w $0477,x             ; Increase every frame.  
                    LDY.b #$FC                ; \ Y speed = #$FC for $20 frames.
                    LDA.w $0477,x             ;  |
                    AND.b #$20                ;  |
                    BEQ   CODE_12CCFA         ;  |
                    LDY.b #$04                ;  | The other $20 frames, Y speed = #$04.
CODE_12CCFA:        STY.b $47,x               ; /
                    JSR.w CODE_12C1EA           
                    LDA.b #$61                  
                    STA.b $65,x                 
                    JMP.w CODE_12BD29           

CODE_12CD06:        LDA.b $47,x               ; \ If Y speed is negative, branch.
                    BMI   CODE_12CD19         ; /
                    LDA.b $79,x                 
                    SEC                         
                    SBC.b #$18                  
                    CMP.b $33,x                 
                    BCS   CODE_12CD19                   
                    STA.b $33,x                 
                    LDA.b #$00                  
                    STA.b $47,x                 
CODE_12CD19:        JSR.w CODE_12A0AA         ; Gravity.
                    INC.b $9F,x                 
                    LDA.b $9F,x                 
                    PHA                         
                    AND.b #$3F                  
                    BNE   CODE_12CD28           
                    JSR.w CODE_129FCD           
CODE_12CD28:        PLA                         
                    BNE   CODE_12CD30           
                    LDA.b #$18                  
                    STA.w $0453,x               
CODE_12CD30:        LDA.b $5B,x                 
                    AND.b #$03                  
                    BEQ   CODE_12CD39           
                    JSR.w CODE_12C248           
CODE_12CD39:        LDA.b #$41                  
                    LDY.b $47,x                 
                    BPL   CODE_12CD41           
                    LDA.b #$61                  
CODE_12CD41:        JMP.w CODE_12CDD2           

CODE_12CD44:        LDA.b $A8,x                 
                    CMP.b #$05                  
                    BNE   CODE_12CD50           
                    LDA.b $65,x                 
                    AND.b #$DF                  
                    STA.b $65,x                 
CODE_12CD50:        JSR.w CODE_12BB16           
                    JSR.w CODE_12BA4F           
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    AND.b #$08                  
                    BEQ   CODE_12CD67           
                    LDA.b $79,x                 
                    STA.b $33,x                 
                    RTS
                       
CODE_12CD67:        JSR.w CODE_12C1DA           
                    INY                         
                    STY.b $6F,x                 
                    LDA.b $B1,x                 
                    BNE   CODE_12CD90           
                    LDA.b $86,x                 
                    BNE   CODE_12CD7E           
                    LDA.b #$D0                  
                    STA.b $47,x                 
                    INC.b $B1,x                 
                    JMP.w CODE_12CDCD           

CODE_12CD7E:        LDY.b #$FC
                    LDA.b $10                
                    AND.b #$20
                    BEQ   CODE_12CD88          
                    LDY.b #$04                  
CODE_12CD88:        STY.b $47,x                 
                    JSR.w CODE_12C1EA           
                    JMP.w CODE_12CDD0           

CODE_12CD90:        INC.b $9F,x                 
                    LDA.b $47,x                 
                    BMI   CODE_12CDCD           
                    BNE   CODE_12CD9D           
                    LDA.b #$10                  
                    STA.w $0453,x               
CODE_12CD9D:        LDA.b $47,x                 
                    BMI   CODE_12CDBD           
                    LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12CDBD           
                    LDA.b $0E                   
                    SEC                         
                    SBC.b #$6A                  
                    CMP.b #$06                  
                    BCC   CODE_12CDBD           
                    LDA.b #$02                  
                    STA.b $51,x                 
                    LDA.b #$E0                  
                    STA.b $47,x                 
                    LDA.b #$40                  
                    STA.w $0601                 
CODE_12CDBD:        LDA.b $79,x                 
                    CMP.b $33,x                 
                    BCS   CODE_12CDCD                   
                    STA.b $33,x                 
                    LDA.b #$00                  
                    STA.b $B1,x                 
                    LDA.b #$A0                  
                    STA.b $86,x                 
CODE_12CDCD:        JSR.w CODE_12A0B2           
CODE_12CDD0:        LDA.b #$61                  
CODE_12CDD2:        STA.b $65,x                 
                    LDA.w $0453,x               
                    BEQ   CODE_12CDE5           
                    CMP.b #$05                  
                    BNE   CODE_12CDE0           
                    JSR.w CODE_12B676           
CODE_12CDE0:        LDA.b #$60                  
                    JMP.w CODE_12BDD5           

CODE_12CDE5:        JMP.w CODE_12BD29           

CODE_12CDE8:        JSR.w CODE_129F96           
                    LDA.b #$03                  
                    STA.b $79,x                 
                    RTS                         

CODE_12CDF0:        LDA.b $79,x                 
                    BNE   CODE_12CDFD           
                    JSR.w CODE_12BB16           
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12BA4F           
CODE_12CDFD:        LDA.b $5B,x                 
                    AND.b #$10                  
                    BEQ   CODE_12CE0A           
                    JSR.w CODE_12CE11           
                    INC.w $042F,x               
                    RTS                         

CODE_12CE0A:        LDA.b $A8,x                 
                    BNE   CODE_12CE11           
CODE_12CE0E:        BRL   CODE_12CEBA           

CODE_12CE11:        LDA.b $79,x                 
                    BEQ   CODE_12CE0E           
                    STA.w $0477,x               
                    LDA.b #$00                  
                    STA.b $79,x                 
                    LDA.b #$02                  
                    STA.w $0489,x               
                    LDA.w $0441,x               
                    STA.b $06                   
                    LDA.b #$FF                  
                    STA.w $0441,x               
                    JSR.w CODE_12B331           
                    BMI   CODE_12CE0E           
                    LDY.b $00                   
                    LDA.b #$1A                  
                    STA.w $90,y               
                    JSR.w CODE_12CC44           
                    LDY.b $00                   
                    LDA.b $06                   
                    STA.w $0441,y               
                    LDA.w $0477,x               
                    SEC                         
                    SBC.b #$01                  
                    STA.w $79,y               
                    TAY                         
                    LDA   DATA_119AE6,y               
                    LDY.b $00                   
                    STA.w $0489,y               
                    LDA.b $29,x                 
                    STA.w $29,y               
                    LDA.b $15,x                 
                    STA.w $15,y               
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $33,y               
                    LDA.b $1F,x                 
                    ADC.b #$00                  
                    STA.w $1F,y               
                    LDA.w $02F6                 
                    STA.w $071E                 
                    LDA.w $02F7                 
                    STA.w $071F                 
                    PHX                         
                    PHY                         
                    JSL.l CODE_14E483           
                    PLY                         
                    PLX                         
                    LDA.w $02F8                 
                    STA.w $02F6                 
                    LDA.w $02F9                 
                    STA.w $02F7                 
                    LDA.b $12                   
                    STA.w $0720                 
                    STY.b $12                   
                    LDA.w $042C                 
                    STA.w $0721                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $042C                 
                    TYX                         
                    JSR.w CODE_12CED0           
                    LDA.w $0721                 
                    STA.w $042C                 
                    LDX.w $0720                 
                    STX.b $12                   
                    LDA.w $071E                 
                    STA.w $02F6                 
                    LDA.w $071F                 
                    STA.w $02F7                 
CODE_12CEBA:        LDA.w $0500                 
                    BNE   CODE_12CECD           
                    INC.b $9F,x                 
                    LDA.b $9F,x                 
                    AND.b #$3F                  
                    BNE   CODE_12CECA           
                    JSR.w CODE_129FCD           
CODE_12CECA:        JSR.w CODE_12C1EF           
CODE_12CECD:        JMP.w CODE_12BD29           

CODE_12CED0:        LDY.b #$00                  
                    LDA.b $ED                   
                    BNE   CODE_12CEDE           
                    LDA.b $10                   
                    AND.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAY                         
CODE_12CEDE:        STY.b $07                   
                    STZ.w $0712                 
                    STZ.w $0713                 
                    LDA.w $021F                 
                    STA.w $0715                 
                    LDA.w $0429                 
                    STA.w $0714                 
                    LDA   DATA_119AEA,y               
                    JSR.w CODE_12CF55           
                    JSR.w CODE_12BDC9           
                    LDA.b $79,x                 
                    STA.b $09                   
                    BEQ   CODE_12CF52           
                    LDA.b #$10                  
                    STA.w $0712                 
                    STZ.w $0713                 
                    LDX.b $07                   
                    LDA.w DATA_119AEB,x               
                    JSR.w CODE_12CF55           
                    BNE   CODE_12CF18           
                    LDX.b #$6C                  
                    JSR.w CODE_12C03B           
CODE_12CF18:        DEC.b $09                   
                    BEQ   CODE_12CF52           
                    JSL.l CODE_14E483           
                    LDA.b #$20                  
                    STA.w $0712                 
                    STZ.w $0713                 
                    LDX.b $07                   
                    LDA.w DATA_119AEC,x               
                    JSR.w CODE_12CF55           
                    BNE   CODE_12CF37           
                    LDX.b #$6C                  
                    JSR.w CODE_12C03B           
CODE_12CF37:        DEC.b $09                   
                    BEQ   CODE_12CF52           
                    LDA.b #$30                  
                    STA.w $0712                 
                    STZ.w $0713                 
                    LDX.b $07                   
                    LDA.w DATA_119AED,x               
                    JSR.w CODE_12CF55           
                    BNE   CODE_12CF52           
                    LDX.b #$6C                  
                    JSR.w CODE_12C03B           
CODE_12CF52:        LDX.b $12                   
                    RTS                         
                       
CODE_12CF55:        STZ.b $ED                   
                    REP   #$20                  
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_12CF64           
                    ORA.w #$FF00                
CODE_12CF64:        CLC                         
                    ADC.w $0714                 
                    SEP   #$20                  
                    STA.b $01                   
                    STA.w $0429                 
                    XBA                         
                    STA.w $021F                 
                    BEQ   CODE_12CF79           
                    LDA.b #$08                  
                    STA.b $ED                   
CODE_12CF79:        LDX.b $12                   
                    LDA.b $CB                   
                    STA.w $0716                 
                    LDA.b $CA                   
                    STA.w $0717                 
                    LDA.b $1F,x                 
                    XBA                         
                    LDA.b $33,x                 
                    REP   #$20                  
                    CLC                         
                    ADC.w $0712                 
                    SEC                         
                    SBC.w $0716                 
                    XBA                         
                    AND.w #$00FF                
                    SEP   #$20                  
                    RTS
                       
DATA_12CF9B:        db $FF

DATA_12CF9C:        db $FF

DATA_12CF9D:        db $FF

DATA_12CF9E:        db $FF,$88,$88,$88,$FF,$98,$98,$98
                    db $FF,$84,$94,$85,$94,$94,$85,$95
                    db $85,$85,$95,$84,$95,$95,$84,$94
                    db $84

DATA_12CFB7:        db $00,$01,$00,$01,$01,$02,$01,$02
                    db $03,$04,$05,$06            
                 
CODE_12CFC3:        LDA.b $B1,x                   
                    BNE   CODE_12CFCA               
                    JMP.w CODE_12D191                 
            
CODE_12CFCA:        LDY.b #$03    
                    LDA.b $47,x            
                    BEQ   CODE_12CFD4          
                    CMP.b #$FD                   
                    BCC   CODE_12CFE5               
CODE_12CFD4:        LDY.b #$3F                
                    INC.w $0429                  
                    LDA.b $10                   
                    AND.b #$02                  
                    BNE   CODE_12CFE5           
                    DEC.w $0429                 
                    DEC.w $0429                 
CODE_12CFE5:        TYA                         
                    AND.b $10                   
                    BNE   CODE_12CFF7           
                    DEC.b $47,x                 
                    LDA.b $47,x                 
                    CMP.b #$FA                  
                    BNE   CODE_12CFF7           
                    LDA.b #$45                  
                    STA.w $1DE3                 
CODE_12CFF7:        JSR.w CODE_12C1EA           
                    LDA.w $0477,x               
                    BNE   CODE_12D023           
                    LDY.b $1F,x                 
                    BPL   CODE_12D047           
                    LDA.b $33,x                 
                    CMP.b #$D0                  
                    BCS   CODE_12D047                   
                    JSL.l CODE_14E35A           
                    LDA.b #$38                  
                    STA.w $04AF                 
                    INC.w $0627                 
                    INC.w $02B8                 
                    LDA.b #$05                  
                    STA.w $0536                 
                    LDA.b #$00                  
                    STA.w $50                 
                    RTS
                       
CODE_12D023:        LDA.b $33,x                 
                    CMP.b #$30                  
                    BCS   CODE_12D047                   
                    LDY.w $04C8                 
                    BNE   CODE_12D035           
                    CMP.b #$18                  
                    BCS   CODE_12D047                   
                    JMP.w CODE_12B120           

CODE_12D035:        LDA.b #$00                  
                    STA.w $04C8                 
                    STA.b $9C                   
                    STA.b $3C                   
                    LDA.b $33,x                 
                    ADC.b #$20                  
                    STA.b $32                   
                    STA.w $042B                 
CODE_12D047:        JSR.w CODE_12D1A8           
                    LDA.b $33,x                 
                    STA.w $0712                 
                    LDA.b $1F,x                 
                    STA.w $0713                 
                    LDY.b #$00                  
                    LDA.b $47,x                 
                    CMP.b #$FE                  
                    BCS   CODE_12D062                   
                    INY                         
                    CMP.b #$FD                  
                    BEQ   CODE_12D062           
                    INY                         
CODE_12D062:        STY.w $0714                 
                    LDA.w $0429                 
                    CLC                         
                    ADC.b #$FD                  
                    STA.w $09A0                 
                    STA.w $09B0                 
                    CLC                         
                    ADC.b #$07                  
                    STA.w $09A4                 
                    STA.w $09B4                 
                    STA.w $09AC                 
                    CLC                         
                    ADC.b #$07                  
                    STA.w $09A8                 
                    STA.w $09B8                 
                    LDA.b #$1E                  
                    CLC                         
                    ADC.w $0712                 
                    STA.w $09A1                 
                    STA.w $09A5                 
                    STA.w $09A9                 
                    CPY.b #$02                  
                    BNE   CODE_12D0AB           
                    CLC                         
                    ADC.b #$07                  
                    STA.w $09B1                 
                    STA.w $09B5                 
                    STA.w $09B9                 
                    CLC                         
                    ADC.b #$07                  
                    STA.w $09AD                 
CODE_12D0AB:        REP   #$20                  
                    LDA.w $0712                 
                    CLC                         
                    ADC.w #$0020                
                    CMP.w #$00EA                
                    BCC   CODE_12D0D7           
                    CMP.w #$FFD0                
                    BCS   CODE_12D0D7                   
                    SEP   #$20                  
                    LDA.b #$F0                  
                    STA.w $09A1                 
                    STA.w $09A5                 
                    STA.w $09A9                 
                    STA.w $09AD                 
                    STA.w $09B1                 
                    STA.w $09B5                 
                    STA.w $09B9                 
CODE_12D0D7:        SEP   #$20                  
                    LDA.b #$22                  
                    STA.w $09A3                 
                    STA.w $09A7                 
                    STA.w $09AB                 
                    STA.w $09AF                 
                    ORA.b #$40                  
                    STA.w $09B3                 
                    STA.w $09B7                 
                    STA.w $09BB                 
                    LDA.b #$00                  
                    STA.w $0A88                 
                    STA.w $0A89                 
                    STA.w $0A8A                 
                    STA.w $0A8B                 
                    STA.w $0A8C                 
                    STA.w $0A8D                 
                    STA.w $0A8E                 
                    LDX.b #$06                  
                    CPY.b #$02                  
                    BEQ   CODE_12D111           
                    LDX.b #$0C                  
CODE_12D111:        TXA                         
                    AND.b $10                   
                    LSR   A                     
                    CPY.b #$02                  
                    BEQ   CODE_12D11A           
                    LSR   A                     
CODE_12D11A:        STA.b $00                   
                    TYA                         
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    LDA.l DATA_12CFB7,x             
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDA.l DATA_12CF9B,x             
                    CMP.b #$FF                  
                    BNE   CODE_12D13A           
                    LDA.b #$F0                  
                    STA.w $09A1                 
                    STA.w $09B9                 
CODE_12D13A:        STA.w $09A2                 
                    STA.w $09BA                 
                    LDA.l DATA_12CF9C,x             
                    CMP.b #$FF                  
                    BNE   CODE_12D150           
                    LDA.b #$F0                  
                    STA.w $09A5                 
                    STA.w $09B5                 
CODE_12D150:        STA.w $09A6                 
                    STA.w $09B6                 
                    LDA.l DATA_12CF9D,x             
                    CMP.b #$FF                  
                    BNE   CODE_12D166           
                    LDA.b #$F0                  
                    STA.w $09A9                 
                    STA.w $09B1                 
CODE_12D166:        STA.w $09AA                 
                    STA.w $09B2                 
                    LDA.l DATA_12CF9E,x             
                    CMP.b #$FF                  
                    BNE   CODE_12D179           
                    LDA.b #$F0                  
                    STA.w $09AD                 
CODE_12D179:        STA.w $09AE                 
                    CPY.b #$02                  
                    BEQ   CODE_12D18E           
                    LDA.b #$F0                  
                    STA.w $09AD                 
                    STA.w $09B1                 
                    STA.w $09B5                 
                    STA.w $09B9                 
CODE_12D18E:        LDX.b $12                   
                    RTS                         
                       
CODE_12D191:        LDA.b $A8,x                 
                    CMP.b #$01                  
                    BNE   CODE_12D1A5           
                    STA.b $B1,x                 
                    STA.w $04C8                 
                    LDA.b #$35                  
                    STA.w $1DE3                 
                    LDA.b #$FE                  
                    STA.b $47,x                 
CODE_12D1A5:        JSR.w CODE_12B692           
CODE_12D1A8:        LDA.b $EE                   
                    BNE   CODE_12D18E           
                    LDA.w $042C                 
                    STA.b $00                   
                    LDA.w $0429                 
                    SEC                         
                    SBC.b #$08                  
                    STA.b $01                   
                    LDA.b #$02                  
                    STA.b $02                   
                    STA.b $05                   
                    STA.b $0C                   
                    PHX                         
                    LDA.b $90,x                 
                    TAX                         
                    LDA.l DATA_15EBA5,x             
                    AND.b #$0F                  
                    STA.w $0213                 
                    PLX                         
                    LDA.b $65,x                 
                    AND.b #$20                  
                    STA.b $03                   
                    LDA.b #$40                  
                    STA.w $02F8                 
                    STZ.w $02F9                 
                    LDX.b #$94                  
                    JSR.w CODE_12BED0           
                    LDA.b $01                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $01                   
                    DEC.b $02                   
                    LDA.w $042C                 
                    STA.b $00                   
                    LDA.b #$50                  
                    STA.w $02F8                 
                    STZ.w $02F9                 
                    LDX.b #$94                  
                    JMP.w CODE_12BED0           
 
DATA_12D1FD:        db $7C,$DC,$80,$E0

DATA_12D201:        db $80,$E0,$7C,$DC

DATA_12D205:        db $EC,$EE,$EC,$EE
              
CODE_12D209:        LDA.w $046E,x
                    STA.w $071E                
                    STZ.b $ED
                    LDA.b #$10                
                    STA.w $071A                 
                    LDA.w $045C,x               
                    BEQ   CODE_12D222           
                    INC.b $9F,x                 
                    LDA.b #$08                  
                    STA.w $071A                 
CODE_12D222:        LDA.b $9F,x                 
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $07                   
                    LDY.b $07                   
                    LDA.w $0429                 
                    STA.w $0720                 
                    PHA                         
                    CLC                         
                    ADC   DATA_119AF1,y               
                    STA.w $0429                 
                    LDA.b $9F,x                 
                    PHA                         
                    AND.b #$18                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0718                 
                    PLA                         
                    AND.b #$0C                  
                    LSR   A                     
                    LSR   A                     
                    STA.w $0719                 
                    LDA.w $046E,x               
                    AND.b #$7F                  
                    STA.w $046E,x               
                    LDY.b #$00                  
                    LDA.b $9F,x                 
                    AND.w $071A                 
                    BEQ   CODE_12D261           
                    LDY.b #$40                  
CODE_12D261:        STY.w $0249                 
                    LDA.w $0718                 
                    LDY.w $045C,x               
                    BEQ   CODE_12D26F           
                    LDA.w $0719                 
CODE_12D26F:        PHX                         
                    TAX                         
                    LDA.l DATA_12D1FD,x             
                    PLX                         
                    JSR.w CODE_12BDD5           
                    JSL.l CODE_14E483           
                    LDA.w $02F8                 
                    STA.w $02F6                 
                    LDA.w $02F9                 
                    STA.w $02F7                 
                    PLA                         
                    CLC                         
                    LDY.b $07                   
                    ADC   DATA_119AF2,y               
                    STA.w $0429                 
                    LDA.w $0718                 
                    LDY.w $045C,x               
                    BEQ   CODE_12D29E           
                    LDA.w $0719                 
CODE_12D29E:        PHX                         
                    TAX                         
                    LDA.l DATA_12D201,x             
                    PLX                         
                    JSR.w CODE_12BDD5           
                    LDA.b $9F,x                 
                    STA.w $0721                 
                    LDA.b $65,x                 
                    PHA                         
                    AND.b #$BF                  
                    STA.b $65,x                 
                    STZ.b $9F,x                 
                    LDA.w $0720                 
                    CLC                         
                    ADC.b #$F8                  
                    STA.w $0429                 
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$0E                  
                    STA.w $042C                 
                    LDA.b #$20                  
                    STA.w $02F8                 
                    STA.w $02F6                 
                    STZ.w $02F9                 
                    STZ.w $02F7                 
                    LDY.w $045C,x               
                    BEQ   CODE_12D2DF           
                    LDA.b #$F0                  
                    BRA   CODE_12D2EB           
      
CODE_12D2DF:        STZ.w $0249                 
                    PHX                         
                    LDX.w $0718                 
                    LDA.l DATA_12D205,x             
                    PLX                         
CODE_12D2EB:        JSR.w CODE_12BDD5           
                    PLA                         
                    STA.b $65,x                 
                    LDA.w $0721                 
                    STA.b $9F,x                 
                    LDA.w $071E                 
                    STA.w $046E,x               
                    RTS
                       
CODE_12D2FD:        JSR.w CODE_129F96           
                    LDA.b #$04                  
                    STA.w $0465,x               
                    LDA.b #$00                  
                    STA.b $79,x                 
                    RTS
                       
CODE_12D30A:        LDA.b #$02                  
                    STA.b $6F,x                 
                    INC.b $9F,x                 
                    LDY.w $0465,x               
                    DEY                         
                    BNE   CODE_12D366           
                    LDA.b #$03                  
                    STA.b $09                   
                    STA.w $04F9                 
                    JSR.w CODE_12A83B           
CODE_12D320:        JSR.w CODE_12B335           
                    BMI   CODE_12D362           
                    LDY.b $00                   
                    LDA.b $1F,x                 
                    STA.w $04F0,y               
                    LDA.b #$F0                  
                    STA.w $47,y               
                    LDA.b #$2B                  
                    STA.w $90,y               
                    LDA.b #$30                  
                    STA.w $0453,y               
                    LDA.b $33,x                 
                    PHA                         
                    LDX.b $09                   
                    LDA.w DATA_119AF4,x               
                    STA.w $3D,y               
                    LDA.w $0429                 
                    ADC.w DATA_119AF8,x               
                    STA.w $29,y               
                    PLA                         
                    ADC.w DATA_119AFC,x               
                    STA.w $33,y               
                    LDA.b #$00                  
                    STA.w $15,y               
                    TYA                         
                    TAX                         
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12D362:        DEC.b $09                   
                    BPL   CODE_12D320           
CODE_12D366:        LDA.b $10                   
                    AND.b #$1F                  
                    BNE   CODE_12D38B           
                    JSR.w CODE_12B335           
                    LDX.b $00                   
                    LDA.b #$20                  
                    STA.b $90,x                 
                    LDA.b #$27                  
                    STA.w $1DE3                 
                    LDA.b $29,x                 
                    SBC.b #$08                  
                    STA.b $29,x                 
                    LDA.b $33,x                 
                    ADC.b #$18                  
                    STA.b $33,x                 
                    JSR.w CODE_129FCA           
                    LDX.b $12                   
CODE_12D38B:        LDA.b $10                   
                    AND.b #$01                  
                    BNE   CODE_12D3BB           
                    LDA.b $79,x                 
                    AND.b #$01                  
                    TAY                         
                    LDA.b $47,x                 
                    CLC                         
                    ADC   DATA_119B04,y               
                    STA.b $47,x                 
                    CMP   DATA_119B06,y               
                    BNE   CODE_12D3A5           
                    INC.b $79,x                 
CODE_12D3A5:        LDA.w $0477,x               
                    AND.b #$01                  
                    TAY                         
                    LDA.b $3D,x                 
                    CLC                         
                    ADC   DATA_119B00,y               
                    STA.b $3D,x                 
                    CMP   DATA_119B02,y               
                    BNE   CODE_12D3BB           
                    INC.w $0477,x               
CODE_12D3BB:        JSR.w CODE_12D209           
                    JSR.w CODE_12C1EA           
                    JMP.w CODE_12C1EF           

CODE_12D3C4:        LDA.b $5B,x                 
                    AND.b #$10                  
                    BEQ   CODE_12D3DB           
                    JSR.w CODE_12E352           
                    STZ.w $046E,x               
                    STZ.b $9F,x                 
                    LDA.b #$09                  
                    STA.b $51,x                 
                    LDA.b #$1F                  
                    STA.b $86,x                 
                    RTS
                       
CODE_12D3DB:        LDA.b #$02                  
                    STA.b $6F,x                 
                    LDA.b $10                   
                    STA.w $044A,x               
                    INC.b $9F,x                 
                    LDA.b $9F,x                 
                    AND.b #$10                  
                    BEQ   CODE_12D3EE           
                    DEC.b $6F,x                 
CODE_12D3EE:        JSR.w CODE_12DDAB           
                    JSR.w CODE_12BD29           
                    LDA.b $5B,x                 
                    PHA                         
                    AND.b #$04                  
                    BEQ   CODE_12D402           
                    JSR.w CODE_12B659           
                    LDA.b #$00                  
                    STA.b $3D,x                 
CODE_12D402:        PLA                         
                    AND.b #$03                  
                    BEQ   CODE_12D40D           
                    JSR.w CODE_12C248           
                    JSR.w CODE_12B63B           
CODE_12D40D:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b $10                   
                    LDY.w $04F9                 
                    AND   DATA_119B08,y               
                    ORA.b $47,x                 
                    BNE   CODE_12D433           
                    LDA.w $0587                 
                    AND.b #$1F                  
                    ORA   DATA_119B0C,y               
                    STA.b $47,x                 
                    JSR.w CODE_129FCD           
                    LDA.w $04F9                 
                    CMP.b #$02                  
                    BCS   CODE_12D433                   
                    ASL.b $3D,x                 
CODE_12D433:        LDA.b $50                   
                    CMP.b #$08                  
                    BEQ   CODE_12D43F           
                    JSR.w CODE_12C1EF           
                    JMP.w CODE_12A0B2           

CODE_12D43F:        RTS
                       
CODE_12D440:        LDA.b $B1,x                 
                    BNE   CODE_12D4B6           
                    LDA.b $5B,x                 
                    AND.b #$10                  
                    ORA.b $A8,x                 
                    BEQ   CODE_12D4B6           
                    LDA.b #$01                  
                    STA.b $90,x                 
                    JSR.w CODE_129F7A           
                    LDA.w $0441,x               
                    STA.b $06                   
                    LDA.b #$FF                  
                    STA.w $0441,x               
                    JSR.w CODE_12B335           
                    BMI   CODE_12D4B6           
                    LDY.b $00                   
                    LDA.b $06                   
                    STA.w $0441,y               
                    LDA.b $29,x                 
                    STA.w $29,y               
                    LDA.b $15,x                 
                    STA.w $15,y               
                    LDX.b $00                   
                    LDA.b #$26                  
                    STA.b $90,x                 
                    JSR.w CODE_129FCA           
                    INC.b $B1,x                 
                    JSR.w CODE_129F7A           
                    LDA.b #$04                  
                    STA.w $0489,x               
                    LDA.w $02F6                 
                    PHA                         
                    LDA.w $02F7                 
                    PHA                         
                    PHX                         
                    JSL.l CODE_14E483           
                    PLX                         
                    LDA.w $02F8                 
                    STA.w $02F6                 
                    LDA.w $02F9                 
                    STA.w $02F7                 
                    JSR.w CODE_12D50D           
                    PLA                         
                    STA.w $02F7                 
                    PLA                         
                    STA.w $02F6                 
                    LDX.b $12                   
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$E5                  
                    STA.w $042C                 
CODE_12D4B6:        JSR.w CODE_12BB16           
                    JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    PHA                         
                    AND.b #$04                  
                    BEQ   CODE_12D4C6           
                    JSR.w CODE_12B659           
CODE_12D4C6:        PLA                         
                    AND.b #$03                  
                    BEQ   CODE_12D4D1           
                    JSR.w CODE_12C248           
                    JSR.w CODE_12C1EF           
CODE_12D4D1:        INC.b $9F,x                 
                    LDA.b $B1,x                 
                    BNE   CODE_12D507           
                    TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ADC.b $10                   
                    AND.b #$7F                  
                    BNE   CODE_12D4E5           
                    JSR.w CODE_129FCD           
CODE_12D4E5:        LDA.b $9F,x                 
                    AND.b #$7F                  
                    BNE   CODE_12D507           
                    JSR.w CODE_129FCD           
                    JSR.w CODE_12B676           
                    BMI   CODE_12D507           
                    LDA.b #$17                  
                    STA.w $1DE3                 
                    LDX.b $00                   
                    LDA.b #$27                  
                    JSR.w CODE_12B00D           
                    LDX.b $00                   
                    DEC.b $33,x                 
                    DEC.b $33,x                 
                    LDX.b $12                   
CODE_12D507:        JSR.w CODE_12A0AA           
                    JMP.w CODE_12BD29           

CODE_12D50D:        LDA.b $51,x                 
                    CMP.b #$01                  
                    BEQ   CODE_12D51E           
                    LDA.b #$C1                  
                    STA.b $65,x                 
                    STA.b $9F,x                 
                    LDA.b #$72                  
                    JMP.w CODE_12BDD5           

CODE_12D51E:        LDA.b $B1,x                 
                    BNE   CODE_12D55C           
                    LDA.w $02F6                 
                    PHA                         
                    LDA.w $02F7                 
                    PHA                         
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$F5                  
                    STA.w $042C                 
                    PHX                         
                    JSL.l CODE_14E483           
                    PLX                         
                    LDA.w $02F8                 
                    STA.w $02F6                 
                    LDA.w $02F9                 
                    STA.w $02F7                 
                    LDA.b #$02                  
                    STA.w $045C,x               
                    PHX                         
                    LDA.b #$78                  
                    JSR.w CODE_12BDD5           
                    PLX                         
                    STZ.w $045C,x               
                    PLA                         
                    STA.w $02F7                 
                    PLA                         
                    STA.w $02F6                 
CODE_12D55C:        LDA.b $33,x                 
                    STA.w $042C                 
                    PHX                         
                    JSR.w CODE_12BDC9           
                    PLX                         
                    LDA.b #$02                  
                    STA.b $6F,x                 
                    REP   #$20                  
                    LDA.w $02F6                 
                    CLC                         
                    ADC.w #$0004                
                    STA.w $02F6                 
                    SEP   #$20                  
                    LDA.b $00                   
                    STA.w $042C                 
                    LDA.b #$D0                  
                    STA.w $046E,x               
                    PHX                         
                    LDA.b #$74                  
                    JSR.w CODE_12BDD5           
                    PLX                         
                    LDA.b #$50                  
                    LDY.b $B1,x                 
                    BEQ   CODE_12D591           
                    LDA.b #$52                  
CODE_12D591:        STA.w $046E,x               
                    RTS
                       
CODE_12D595:        JSR.w CODE_129F96           
                    LDA.b $33,x                 
                    STA.b $B1,x                 
                    RTS
                       
CODE_12D59D:        INC.b $9F,x                 
                    INC.b $9F,x                 
                    INC.b $79,x                 
                    LDA.b $79,x                 
                    CMP.b #$40                  
                    BCS   CODE_12D5AE                   
                    LDA.b #$E0                  
                    STA.b $33,x                 
CODE_12D5AD:        RTS

CODE_12D5AE:        BNE   CODE_12D5BD           
                    LDA.b #$D0                  
                    STA.b $47,x                 
                    LDA.b $B1,x                 
                    STA.b $33,x                 
                    LDA.b #$49                  
                    STA.w $1DE3                 
CODE_12D5BD:        LDA.b $79,x                 
                    CMP.b #$80                  
                    BCC   CODE_12D5D1           
                    CMP.b #$DC                  
                    BCS   CODE_12D5D1                   
                    LDY.b #$03                  
                    AND.b #$10                  
                    BEQ   CODE_12D5CF           
                    LDY.b #$FB                  
CODE_12D5CF:        STY.b $47,x                 
CODE_12D5D1:        INC.b $47,x                 
                    JSR.w CODE_12C1EA           
CODE_12D5D6:        LDA.b $79,x                 
                    STA.b $07                   
                    LDA.b #$29                  
                    STA.b $65,x                 
                    LDY.b $79,x                 
                    CPY.b #$DC                  
                    BCC   CODE_12D5FC           
                    LDA.b #$9E                  
                    CPY.b #$F4                  
                    BCC   CODE_12D5EC           
                    LDA.b #$9F                  
CODE_12D5EC:        STA.b $04                   
                    JSL.l CODE_14E483           
                    JSR.w CODE_12D73A           
                    REP   #$10                  
                    LDX.w $02F8                 
                    BRA   CODE_12D612           
CODE_12D5FC:        STZ.b $04                   
                    LDA.b #$90                  
                    JSR.w CODE_12BDD5           
                    REP   #$10                  
                    LDX.w $02F6                 
                    LDA.w $0803,x               
                    AND.b #$CF                  
                    ORA.b #$20                  
                    STA.w $0803,x               
CODE_12D612:        LDA.w $0803,x               
                    STA.b $05                   
                    SEP   #$10                  
                    LDX.b $12                   
                    LDA.b $EE                   
                    BNE   CODE_12D5AD           
                    STZ.b $ED                   
                    LDA.w $0429                 
                    CLC                         
                    ADC.b #$04                  
                    LDA.w $021F                 
                    ADC.b #$00                  
                    BEQ   CODE_12D632           
                    LDA.b #$04                  
                    STA.b $ED                   
CODE_12D632:        JSL.l CODE_14E483           
                    LDA.b #$E0                  
                    STA.b $02                   
                    LDA.b #$E4                  
                    STA.b $03                   
                    LDX.b $12                   
                    LDA.b $33,x                 
                    STA.w $0712                 
                    LDA.b $1F,x                 
                    STA.w $0713                 
                    REP   #$20                  
                    LDA.w $0712                 
                    CLC                         
                    ADC.w #$000F                
                    STA.w $0712                 
                    ADC.w #$0008                
                    STA.w $0714                 
                    SEP   #$20                  
                    PHP                         
                    JSR.w CODE_12D6D6           
                    JSL.l CODE_14E483           
                    LDA.b #$E8                  
                    STA.b $02                   
                    LDA.b #$EC                  
                    STA.b $03                   
                    LDX.b $12                   
                    PLP                         
                    REP   #$20                  
                    LDA.w $0714                 
                    ADC.w #$0008                
                    STA.w $0712                 
                    ADC.w #$0008                
                    STA.w $0714                 
                    SEP   #$20                  
                    PHP                         
                    JSR.w CODE_12D6D6           
                    JSL.l CODE_14E483           
                    LDA.b #$F0                  
                    STA.b $02                   
                    LDA.b #$F4                  
                    STA.b $03                   
                    LDX.b $12                   
                    PLP                         
                    REP   #$20                  
                    LDA.w $0714                 
                    ADC.w #$0008                
                    STA.w $0712                 
                    ADC.w #$0008                
                    STA.w $0714                 
                    SEP   #$20                  
                    PHP                         
                    JSR.w CODE_12D6D6           
                    JSL.l CODE_14E483           
                    LDA.b #$F8                  
                    STA.b $02                   
                    LDA.b #$FC                  
                    STA.b $03                   
                    LDX.b $12                   
                    PLP                         
                    REP   #$20                  
                    LDA.w $0714                 
                    ADC.w #$0008                
                    STA.w $0712                 
                    ADC.w #$0008                
                    STA.w $0714                 
                    SEP   #$20                  
                    JSR.w CODE_12D6D6           
                    LDX.b $12                   
CODE_12D6D5:        RTS
                       
CODE_12D6D6:        REP   #$20                  
                    LDA.w $0712                 
                    CMP.w #$00F0                
                    SEP   #$20                  
                    BCS   CODE_12D6D5                   
                    LDA.b #$8E                  
                    LDX.b $07                   
                    CPX.b $02                   
                    BCC   CODE_12D6EC           
                    LDA.b $04                   
CODE_12D6EC:        PHA                         
                    LDA.b #$8E                  
                    CPX.b $03                   
                    BCC   CODE_12D6F5           
                    LDA.b $04                   
CODE_12D6F5:        PHA                         
                    REP   #$10                  
                    LDY.w $02F8                 
                    PLA                         
                    STA.w $0806,y               
                    PLA                         
                    STA.w $0802,y               
                    LDA.b $05                   
                    STA.w $0803,y               
                    STA.w $0807,y               
                    LDA.w $0429                 
                    CLC                         
                    ADC.b #$04                  
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0712                 
                    STA.w $0801,y               
                    LDA.w $0714                 
                    STA.w $0805,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $ED                   
                    AND.b #$04                  
                    LSR   A                     
                    LSR   A                     
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    SEP   #$10                  
                    RTS
                       
CODE_12D73A:        JSR.w CODE_12D741           
                    JSL.l CODE_14E483           
CODE_12D741:        REP   #$10                  
                    LDY.w $02F8                 
                    LDA.w $0429                 
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0804,y               
                    LDA.w $042C                 
                    STA.w $0801,y               
                    STA.w $0805,y               
                    LDA.b $04                   
                    STA.w $0802,y               
                    STA.w $0806,y               
                    LDX.w #$0000                
                    LDA.b $10                   
                    AND.b #$04                  
                    BEQ   CODE_12D76F           
                    LDX.w #$0040                
CODE_12D76F:        TXA                         
                    ORA.b #$03                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $ED                   
                    AND.b #$08                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0A20,y               
                    LDA.b $ED                   
                    AND.b #$04                  
                    LSR   A                     
                    LSR   A                     
                    STA.w $0A21,y               
                    SEP   #$10                  
                    RTS
                       
CODE_12D796:        INC.b $9F,x                 
                    JSR.w CODE_12BB16           
                    JSR.w CODE_12BA46           
                    JSR.w CODE_12DDAB           
                    LDA.b $5B,x                 
                    AND.b #$03                  
                    BEQ   CODE_12D7AA           
                    JSR.w CODE_12C248           
CODE_12D7AA:        LDA.b $5B,x                 
                    AND.b #$04                  
                    BEQ   CODE_12D7D1           
                    LDA.b $47,x                 
                    PHA                         
                    JSR.w CODE_12B659           
                    PLA                         
                    LDY.w $042F,x               
                    BEQ   CODE_12D7D1           
                    CMP.b #$18                  
                    BMI   CODE_12D7C9           
                    JSR.w CODE_12B63B           
                    LDA.b #$F0                  
                    STA.b $47,x                 
                    BNE   CODE_12D7F7           
CODE_12D7C9:        LDA.b #$00                  
                    STA.w $042F,x               
                    JSR.w CODE_129F7A           
CODE_12D7D1:        LDA.b $0E                   
                    CMP.b #$26                  
                    BEQ   CODE_12D7DC           
                    DEC.b $9F,x                 
                    JMP.w CODE_12B4D4           

CODE_12D7DC:        JSR.w CODE_12C1DA           
                    INY                         
                    STY.b $6F,x                 
                    LDA.b $10                   
                    AND.b #$01                  
                    BNE   CODE_12D7F7           
                    LDA.b $3D,x                 
                    CMP   DATA_119B0F,y               
                    BEQ   CODE_12D7F7           
                    CLC                         
                    ADC   DATA_119B11,y               
                    STA.b $3D,x                 
                    INC.b $9F,x                 
CODE_12D7F7:        JSR.w CODE_12A0AA           
                    INC.w $04A4,x               
                    JMP.w CODE_12BD29           

CODE_12D800:        JSR.w CODE_12AC78           
                    LDA.b #$03                  
                    STA.w $0465,x               
                    RTS
                       
CODE_12D809:        JSR.w CODE_12D8FE           
                    LDA.b #$06                  
                    STA.w $046E,x               
                    LDA.b #$02                  
                    STA.w $1238                 
                    LDA.w $04B5                 
                    BEQ   CODE_12D875           
                    CMP.b #$01                  
                    BNE   CODE_12D831           
                    STA.w $0480,x               
                    LDA.b #$90                  
                    STA.b $86,x                 
                    LDA.b #$40                  
                    STA.w $0438,x               
                    STA.w $045C,x               
                    STA.w $04B5                 
CODE_12D831:        LDA.w $0480,x               
                    CMP.b #$02                  
                    BCC   CODE_12D8B1           
                    LDA.b $B1,x                 
                    BNE   CODE_12D850           
                    INC.w $0480,x               
                    LDA.w $0480,x               
                    CMP.b #$31                  
                    BNE   CODE_12D876           
                    LDA.w $0453,x               
                    BNE   CODE_12D850           
                    INC.b $B1,x                 
                    JSR.w CODE_12D8AB           
CODE_12D850:        DEC.w $0480,x               
                    LDY.w $0480,x               
                    DEY                         
                    BNE   CODE_12D876           
                    DEC.b $B1,x                 
                    LDA.b $50                   
                    CMP.b #$06                  
                    BNE   CODE_12D876           
                    LDA.b #$01                  
                    STA.w $0536                 
                    JSL.l CODE_14E35A           
                    LDA.b #$09                  
                    STA.b $14                   
                    INC.w $0627                 
                    PLA                         
                    PLA                         
                    PLA                         
                    PLA                         
CODE_12D875:        RTS
                       
CODE_12D876:        LDA.w $0480,x               
                    CMP.b #$30                  
                    BNE   CODE_12D8B0           
                    LDA.b $5B,x                 
                    AND.b #$40                  
                    BEQ   CODE_12D8B0           
                    LDA.b $9C                   
                    BNE   CODE_12D8B0           
                    STA.b $5A                   
                    INC.b $B1,x                 
                    INC.w $04B4                 
                    DEC.w $0480,x               
                    LDA.b $29,x                 
                    STA.b $28                   
                    LDA.b $15,x                 
                    STA.b $14                   
                    LDA.b $33,x                 
                    ADC.b #$10                  
                    STA.b $32                   
                    LDA.b #$06                  
                    STA.b $50                   
                    LDA.b #$60                  
                    STA.b $82                   
                    LDA.b #$FC                  
                    STA.b $46                   
CODE_12D8AB:        LDA.b #$2D                  
                    STA.w $1DE0                 
CODE_12D8B0:        RTS
                       
CODE_12D8B1:        LDA.b #$03                  
                    STA.w $046E,x               
                    LDA.b #$00                  
                    STA.w $1238                 
                    LDA.w $0465,x               
                    BNE   CODE_12D8D2           
                    LDA.b #$03                  
                    STA.w $0465,x               
                    LDA.b #$2C                  
                    STA.w $1DE0                 
                    INC.w $0480,x               
                    LDA.b #$FF                  
                    STA.w $0453,x               
CODE_12D8D2:        LDA.b $10                   
                    LSR   A                     
                    BCC   CODE_12D8FB           
                    LDA.b $79,x                 
                    AND.b #$01                  
                    TAY                         
                    LDA.b $47,x                 
                    CLC                         
                    ADC   DATA_119826,y               
                    STA.b $47,x                 
                    CMP   DATA_119B16,y               
                    BNE   CODE_12D8EB           
                    INC.b $79,x                 
CODE_12D8EB:        JSR.w CODE_12C1DA           
                    LDA.b $3D,x                 
                    CMP   DATA_119B14,y               
                    BEQ   CODE_12D8FB           
                    CLC                         
                    ADC   DATA_119822,y               
                    STA.b $3D,x                 
CODE_12D8FB:        JMP.w CODE_12B497           

CODE_12D8FE:        LDA.w $0480,x               
                    JSR.w CODE_12AD41           
                    LDA.w $04B5               ;\If crystal ball has not been collected
                    BEQ   CODE_12D90F         ;/
                    CMP.b #$01                ;\If collected
                    BEQ   CODE_12D90F         ;/
                    BRA   CODE_12D912           

CODE_12D90F:        BRL   CODE_12DAF1           

CODE_12D912:        LDA.w $02F8                 
                    STA.w $02F6                 
                    LDA.w $02F9                 
                    STA.w $02F7                 
                    LDA.b $86,x                 
                    STA.b $07                   
                    JSL.l CODE_14E483           
                    LDX.b $02                   
                    LDA.w $021F                 
                    XBA                         
                    LDA.w $0429                 
                    REP   #$20                  
                    STA.w $0712                 
                    LDA.w DATA_119B17,x               
                    AND.w #$00FF                
                    CMP.w #$0080                
                    BCC   CODE_12D942           
                    ORA.w #$FF00                
CODE_12D942:        CLC                         
                    ADC.w $0712                 
                    STA.w $0714                 
                    SEP   #$20                  
                    PHA                         
                    PHP                         
                    DEX                         
                    BEQ   CODE_12D954           
                    PLA                         
                    EOR.b #$01                  
                    PHA                         
CODE_12D954:        PLP                         
                    PLA                         
                    REP   #$10                  
                    LDY.w $02F8                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    STA.w $0712                 
                    LDX.w #$0060                
                    LDA.w $0801,x               
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $0803,x               
                    STA.w $0716                 
                    LDA.b $07                   
                    BEQ   CODE_12D987           
                    LDA.w $0716                 
                    AND.b #$CF                  
                    ORA.b #$10                  
                    STA.w $0716                 
CODE_12D987:        LDA.w $0716                 
                    ORA.b #$01                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    LDA.b #$AE                  
                    STA.w $0802,y               
                    LDA.b #$BE                  
                    STA.w $0806,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0715                 
                    BEQ   CODE_12D9AB           
                    LDA.b #$01                  
CODE_12D9AB:        STA.w $0A20,y               
                    STA.w $0A21,y               
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDX.w #$0060                
                    LDY.w $02F8                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0801,x               
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.w $0716                 
                    ORA.b #$01                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    LDA.b #$AF                  
                    STA.w $0802,y               
                    LDA.b #$BF                  
                    STA.w $0806,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0715                 
                    BEQ   CODE_12D9F9           
                    LDA.b #$01                  
CODE_12D9F9:        STA.w $0A20,y               
                    STA.w $0A21,y               
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDX.w #$0060                
                    LDY.w $02F8                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    LDA.w $0801,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $0801,y               
                    LDA.b #$BF                  
                    STA.w $0802,y               
                    LDA.w $0716                 
                    ORA.b #$01                  
                    STA.w $0803,y               
                    REP   #$20                  
                    LDA.b $12                   
                    AND.w #$00FF                
                    TAX                         
                    SEP   #$20                  
                    LDA.w $0480,x               
                    CMP.b #$02                  
                    BCS   CODE_12DA3D                   
                    LDA.b #$F0                  
                    STA.w $0801,y               
CODE_12DA3D:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0715                 
                    BEQ   CODE_12DA4C           
                    LDA.b #$01                  
CODE_12DA4C:        STA.w $0A20,y               
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDX.w #$0060                
                    LDY.w $02F8                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    STA.w $0804,y               
                    LDA.w $0803,x               
                    STA.w $0716                 
                    LDA.b $07                   
                    BEQ   CODE_12DA78           
                    LDA.w $0803,x               
                    AND.b #$CF                  
                    ORA.b #$10                  
                    STA.w $0716                 
CODE_12DA78:        LDA.w $0716                 
                    ORA.b #$01                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $0716                 
                    LDX.w #$0068                
                    LDA.w $0801,x               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$08                  
                    STA.w $0805,y               
                    LDA.b #$AF                  
                    STA.w $0802,y               
                    LDA.b #$BF                  
                    STA.w $0806,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0715                 
                    BEQ   CODE_12DAB1           
                    LDA.b #$01                  
CODE_12DAB1:        STA.w $0A20,y               
                    STA.w $0A21,y               
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDX.w #$0068                
                    LDY.w $02F8                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    LDA.w $0801,x               
                    CLC                         
                    ADC.b #$18                  
                    STA.w $0801,y               
                    LDA.b #$8F                  
                    STA.w $0802,y               
                    LDA.w $0716                 
                    ORA.b #$01                  
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0715                 
                    BEQ   CODE_12DAEE           
                    LDA.b #$01                  
CODE_12DAEE:        STA.w $0A20,y               
CODE_12DAF1:        SEP   #$10                  
                    LDX.b $12                   
                    RTS
                       
CODE_12DAF6:        LDA.b $9C                   
                    BNE   CODE_12DB42           
                    LDA.b $10                   
                    AND.b #$FF                  
                    BNE   CODE_12DB42           
                    INC.w $04FA                 
                    JSR.w CODE_12B331           
                    BMI   CODE_12DB42           
                    LDX.b $00                   
                    LDA.w $04FA                 
                    AND.b #$07                  
                    TAY                         
                    LDA   DATA_119B22,y               
                    STA.b $3D,x                 
                    TYA                         
                    AND.b #$03                  
                    TAY                         
                    LDA.b #$02                  
                    STA.b $15,x                 
                    LDA   DATA_119B1A,y               
                    STA.b $29,x                 
                    LDA   DATA_119B1E,y               
                    STA.b $33,x                 
                    LDA.b #$00                  
                    STA.b $1F,x                 
                    LDA.w $0587                 
                    AND.b #$03                  
                    CMP.b #$02                  
                    BCC   CODE_12DB37           
                    ASL   A                     
                    STA.b $B1,x                 
CODE_12DB37:        LDY.b #$33                  
                    STY.b $90,x                 
                    JSR.w CODE_129F7A           
                    LDA.b #$D0                  
                    STA.b $47,x                 
CODE_12DB42:        RTS
                       
CODE_12DB43:        JSR.w CODE_129F96           
                    LDA.b #$06                  
                    STA.w $0465,x               
                    LDA.b $15,x                 
                    STA.w $04F0,x               
                    RTS
                       
CODE_12DB51:        LDA.b $B1,x                 
                    BNE   CODE_12DBC8           
                    LDA.w $0465,x               
                    BNE   CODE_12DB62           
                    LDA.b #$80                  
                    STA.b $86,x                 
                    STA.b $B1,x                 
                    BNE   CODE_12DBC5           
CODE_12DB62:        INC.b $79,x                 
                    LDA.b $10                   
                    AND.b #$FF                  
                    BNE   CODE_12DB71           
                    LDA.b #$5F                  
                    STA.b $86,x                 
                    INC.w $0480,x               
CODE_12DB71:        LDA.b #$00                  
                    STA.b $3D,x                 
                    LDA.b $79,x                 
                    AND.b #$40                  
                    BEQ   CODE_12DB88           
                    INC.w $0477,x               
                    LDA.b #$F8                  
                    LDY.b $79,x                 
                    BPL   CODE_12DB86           
                    LDA.b #$08                  
CODE_12DB86:        STA.b $3D,x                 
CODE_12DB88:        JSR.w CODE_12C1EF           
                    LDA.w $045C,x               
                    BNE   CODE_12DBC5           
                    LDA.b $86,x                 
                    BEQ   CODE_12DBC5           
                    AND.b #$0F                  
                    BNE   CODE_12DBC5           
                    JSR.w CODE_12B335           
                    BMI   CODE_12DBC5           
                    LDA.b #$46                  
                    STA.w $1DE3                 
                    LDA.w $0480,x               
                    AND.b #$03                  
                    TAY                         
                    LDA.b $86,x                 
                    LDX.b $00                   
                    LSR   A                     
                    EOR.b #$FF                  
                    STA.b $3D,x                 
                    LDA   DATA_119B2A,y               
                    STA.b $47,x                 
                    LDA.b #$11                  
                    STA.b $90,x                 
                    LDA.b $33,x                 
                    ADC.b #$08                  
                    STA.b $33,x                 
                    JSR.w CODE_129F7A           
                    LDX.b $12                   
CODE_12DBC5:        JMP.w CODE_12BD29           

CODE_12DBC8:        LDA.b $86,x                 
                    BEQ   CODE_12DBE3           
                    STA.w $045C,x               
                    CMP.b #$01                  
                    BNE   CODE_12DBD7           
                    JSL.l CODE_13DCC2           
CODE_12DBD7:        INC.w $0477,x               
                    INC.w $0477,x               
                    LDA.b #$F0                  
                    STA.b $47,x                 
                    BNE   CODE_12DC19           
CODE_12DBE3:        LDA.b #$04                  
                    STA.b $3D,x                 
                    JSR.w CODE_12C1EF           
                    JSR.w CODE_12C1EA           
                    LDA.b $10                   
                    LSR   A                     
                    BCS   CODE_12DC0F                   
                    INC.b $47,x                 
                    BMI   CODE_12DC0F           
                    LDA.b $10                   
                    AND.b #$1F                  
                    BNE   CODE_12DC0F           
                    JSR.w CODE_12B335           
                    LDX.b $00                   
                    LDA.b $33,x                 
                    ADC.b #$08                  
                    STA.b $33,x                 
                    JSR.w CODE_12B1F9           
                    LDA.b #$20                  
                    STA.w $1DE3                 
CODE_12DC0F:        LDA.b $33,x                 
                    CMP.b #$D0                  
                    BCC   CODE_12DC19           
                    LDA.b #$02                  
                    STA.b $51,x                 
CODE_12DC19:        JMP.w CODE_12BD29           

CODE_12DC1C:        INC.b $9F,x                 
                    JSR.w CODE_12C1EF           
                    JSR.w CODE_12C1EA           
                    INC.b $47,x                 
                    JMP.w CODE_12BD29           

CODE_12DC29:        RTS
                       
CODE_12DC2A:        REP   #$20                  
                    LDA.w $02F6                 
                    STA.w $126C                 
                    STA.w $1274                 
                    SEP   #$20                  
                    LDA.b $10                   
                    AND.b #$03                  
                    ASL   A                     
                    STA.b $07                   
                    TAY                         
                    REP   #$20                  
                    LDA.w $1268,y               
                    STA.w $02F6                 
                    SEP   #$20                  
                    LDA.b $EE                   
                    BNE   CODE_12DC29           
                    LDY.w $0465,x               
                    BNE   CODE_12DC56           
                    LDA.b #$4E                  
                    STA.b $65,x                 
CODE_12DC56:        LDA.b $ED                   
                    PHA                         
                    PHA                         
                    LDY.b #$AC                  
                    LDA.b $B1,x                 
                    BNE   CODE_12DC6F           
                    LDA.w $045C,x               
                    BEQ   CODE_12DC72           
                    CMP.b #$30                  
                    BCS   CODE_12DC6F                   
                    AND.b #$08                  
                    BNE   CODE_12DC6F           
                    LDY.b #$9C                  
CODE_12DC6F:        TYA                         
                    BNE   CODE_12DC7A           
CODE_12DC72:        LDA.b #$9C                  
                    LDY.b $86,x                 
                    BEQ   CODE_12DC7A           
                    LDA.b #$A0                  
CODE_12DC7A:        JSR.w CODE_12BDD5           
                    LDA.b $00                   
                    STA.w $042C                 
                    REP   #$20                  
                    LDY.b $07                   
                    LDA.w $126A,y               
                    STA.w $02F6                 
                    SEP   #$20                  
                    LDY.b #$A4                  
                    LDA.b $B1,x                 
                    BNE   CODE_12DCA7           
                    LDA.w $045C,x               
                    BEQ   CODE_12DCA3           
                    CMP.b #$30                  
                    BCS   CODE_12DCA7                   
                    AND.b #$08                  
                    BNE   CODE_12DCA7           
                    BEQ   CODE_12DCA9           
CODE_12DCA3:        LDA.b $86,x                 
                    BEQ   CODE_12DCA9           
CODE_12DCA7:        LDY.b #$A8                  
CODE_12DCA9:        PLA                         
                    STA.b $ED                   
                    TYA                         
                    JSR.w CODE_12BDD5           
                    LDA.b $00                   
                    STA.w $042C                 
                    REP   #$20                  
                    LDY.b $07                   
                    LDA.w $126C,y               
                    STA.w $02F6                 
                    SEP   #$20                  
                    LDY.b #$B8                  
                    LDA.b $3D,x                 
                    BEQ   CODE_12DCD2           
                    LDY.b #$B0                  
                    LDA.w $0477,x               
                    AND.b #$10                  
                    BEQ   CODE_12DCD2           
                    LDY.b #$B4                  
CODE_12DCD2:        PLA                         
                    STA.b $ED                   
                    TYA                         
                    JSR.w CODE_12BDD5           
                    LDA.b $ED                   
                    BEQ   CODE_12DCE0           
                    BRL   CODE_12DD70           

CODE_12DCE0:        REP   #$30                  
                    LDA.b $07                   
                    AND.w #$00FF                
                    TAY                         
                    LDX.w $126C,y               
                    LDA.w $126E,y               
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0429                 
                    CLC                         
                    ADC.b #$20                  
                    BCS   CODE_12DD70                   
                    STA.w $0800,y               
                    STA.w $0804,y               
                    STA.w $0712                 
                    LDA.b $00                   
                    SBC.b #$2F                  
                    STA.w $0801,y               
                    ADC.b #$0F                  
                    STA.w $0805,y               
                    ADC.b #$10                  
                    STA.w $0713                 
                    LDA.w $0803,x               
                    STA.w $0803,y               
                    STA.w $0807,y               
                    STA.w $0714                 
                    LDA.b #$C4                  
                    STA.w $0802,y               
                    LDA.b #$CA                  
                    STA.w $0806,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.b $ED                   
                    AND.b #$04                  
                    LSR   A                     
                    LSR   A                     
                    ORA.b #$02                  
                    STA.w $0A20,y               
                    STA.w $0A21,y               
                    STA.w $0715                 
                    JSL.l CODE_14E483           
                    REP   #$10                  
                    LDY.w $02F8                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    LDA.w $0713                 
                    STA.w $0801,y               
                    LDA.b #$E0                  
                    STA.w $0802,y               
                    LDA.w $0714                 
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0715                 
                    STA.w $0A20,y               
CODE_12DD70:        SEP   #$10                  
                    LDX.b $12                   
                    RTS
                       
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF                          ; /
          
CODE_12DD90:        JSR.w CODE_12DE5A             
                    TAY                         
                    LDA.b $46,x              
                    BMI   CODE_12DD99                   
                    INY                 
CODE_12DD99:        JSR.w CODE_12E445           
                    BCS   CODE_12DDA5                   
                    LDA.b $00                   
                    CMP.b #$82                  
                    BEQ   CODE_12DDA5           
                    CLC                         
CODE_12DDA5:        DEX                         
                    RTS
                       
CODE_12DDA7:        LDA.b #$04                  
                    BNE   CODE_12DDAD           

CODE_12DDAB:        LDA.b #$00                  
CODE_12DDAD:        STA.b $07                   
                    STZ.b $0B                   
                    STZ.b $0E                   
                    JSR.w CODE_12DE5A           
                    STA.b $08                   
                    LDA.b $46,x                 
                    BPL   CODE_12DDC5           
                    JSR.w CODE_12DE38           
                    INC.b $07                   
                    INC.b $08                   
                    BNE   CODE_12DE27           
CODE_12DDC5:        INC.b $07                   
                    INC.b $08                   
                    JSR.w CODE_12DE38           
                    LDA.b $8F,x                 
                    CMP.b #$18                  
                    BEQ   CODE_12DDEC           
                    CMP.b #$19                  
                    BEQ   CODE_12DDEC           
                    LDA.b $00                   
                    SEC                         
                    SBC.b #$92                  
                    CMP.b #$02                  
                    BCS   CODE_12DDEC                   
                    ASL   A                     
                    ADC.b #$01                  
                    STA.b $46,x                 
                    LDA.b #$07                  
                    STA.b $50,x                 
                    LDA.b #$FF                  
                    STA.b $85,x                 
CODE_12DDEC:        LDA.b $00                   
                    STA.b $0E                   
                    SEC                         
                    SBC.b #$60                  
                    CMP.b #$02                  
                    BCS   CODE_12DE27                   
                    LDY.w $0437,x               
                    BNE   CODE_12DE27           
                    LDY.b $8F,x                 
                    CPY.b #$32                  
                    BCC   CODE_12DE18           
                    TAY                         
                    LDA.b $46,x                 
                    CMP.b #$03                  
                    BCS   CODE_12DE27                   
                    LDA.b $0D                   
                    AND.b #$03                  
                    BNE   CODE_12DE27           
                    LDA   DATA_11AB2F,y               
                    STA.b $3C,x                 
                    STA.b $0B                   
                    BNE   CODE_12DE27           
CODE_12DE18:        LDY.b $3C,x                 
                    BEQ   CODE_12DE25           
                    EOR.b $6E,x                 
                    LSR   A                     
                    BCS   CODE_12DE25                   
                    DEC.b $9E,x                 
                    DEC.b $9E,x                 
CODE_12DE25:        INC.b $9E,x                 
CODE_12DE27:        LDA.b $3C,x                 
                    CLC                         
                    ADC.w $04CC,x               
                    BMI   CODE_12DE33           
                    INC.b $07                   
                    INC.b $08                   
CODE_12DE33:        JSR.w CODE_12DE38           
                    DEX                         
                    RTS
                       
CODE_12DE38:        LDY.b $08                   
                    JSL.l CODE_13F900           
                    LDY.b $07                   
                    LDA   DATA_11AB31,y               
                    TAY                         
                    LDA.b $00                   
                    JSL.l CODE_13F99C           
                    BCC   CODE_12DE55           
                    LDY.b $07                   
                    LDA   DATA_11AB39,y               
                    ORA.b $5A,x                 
                    STA.b $5A,x                 
CODE_12DE55:        INC.b $07                   
                    INC.b $08                   
                    RTS
                       
CODE_12DE5A:        INX                         
                    LDA.b $5A,x                 
                    STA.b $0D                   
                    AND.b #$F0                  
                    STA.b $5A,x                 
                    LDY.w $0491,x               
                    LDA   DATA_11CAFD,y               
CODE_12DE69:        RTS
                       
CODE_12DE6A:        LDA.b #$00                  
                    STA.w $04CD,x               
                    LDA.b $5B,x                 
                    AND.b #$0F                  
                    STA.b $5B,x                 
                    LDA.b $51,x                 
                    CMP.b #$04                  
                    BNE   CODE_12DE7F           
                    LDY.b #$06                  
                    BNE   CODE_12DE9D           
CODE_12DE7F:        CMP.b #$07                  
                    BEQ   CODE_12DE96           
                    LDY.b $90,x                 
                    CPY.b #$1E                  
                    BEQ   CODE_12DE92           
                    CPY.b #$1A                  
                    BEQ   CODE_12DE92           
                    LDY.w $042F,x               
                    BNE   CODE_12DE96           
CODE_12DE92:        CMP.b #$01                  
                    BNE   CODE_12DE69           
CODE_12DE96:        LDA.b $A8,x                 
                    BNE   CODE_12DE69           
                    LDY.w $0489,x               
CODE_12DE9D:        LDA.w $1128,y               
                    STA.b $09                   
                    LDA.b #$00                  
                    STA.b $00                   
                    LDA.w $1100,y               
                    BPL   CODE_12DEAD           
                    DEC.b $00                   
CODE_12DEAD:        CLC                         
                    ADC.b $29,x                 
                    STA.b $05                   
                    LDA.b $15,x                 
                    ADC.b $00                   
                    STA.b $01                   
                    LDA.b $EB                   
                    BNE   CODE_12DEBE           
                    STA.b $01                   
CODE_12DEBE:        LDA.w $113C,y               
                    STA.b $0B                   
                    LDA.b #$00                  
                    STA.b $00                   
                    LDA.w $1114,y               
                    BPL   CODE_12DECE           
                    DEC.b $00                   
CODE_12DECE:        CLC                         
                    ADC.b $33,x                 
                    STA.b $07                   
                    LDA.b $1F,x                 
                    ADC.b $00                   
                    STA.b $03                   
CODE_12DED9:        STX.b $EC                   
                    TXA                         
                    BNE   CODE_12DEFF           
                    LDA.w $04C8                 
                    ORA.w $041B                 
                    BNE   CODE_12DEEC           
                    LDA.b $50,x                 
                    CMP.b #$02                  
                    BCC   CODE_12DEEF           
CODE_12DEEC:        JMP.w CODE_12DF8D           

CODE_12DEEF:        LDY.b $12                   
                    LDA.w $042F,y               
                    BEQ   CODE_12DEFA           
                    CMP.b #$20                  
                    BCC   CODE_12DEEC           
CODE_12DEFA:        LDY.b $9A                   
                    JMP.w CODE_12DF44           

CODE_12DEFF:        LDY.b $12                   
                    LDA.w $51,y               
                    CMP.b #$04                  
                    BEQ   CODE_12DF0F           
                    LDA.w $046E,y               
                    AND.b #$04                  
                    BNE   CODE_12DF2E           
CODE_12DF0F:        LDA.b $50,x                 
                    CMP.b #$04                  
                    BNE   CODE_12DF19           
                    LDY.b #$06                  
                    BNE   CODE_12DF44           
CODE_12DF19:        CMP.b #$07                  
                    BEQ   CODE_12DF30           
                    LDY.b $8F,x                 
                    CPY.b #$1E                  
                    BEQ   CODE_12DF2C           
                    CPY.b #$1A                  
                    BEQ   CODE_12DF2C           
                    LDY.w $042E,x               
                    BNE   CODE_12DF30           
CODE_12DF2C:        CMP.b #$01                  
CODE_12DF2E:        BNE   CODE_12DF8D           
CODE_12DF30:        LDA.b $A7,x                 
                    BNE   CODE_12DF8D           
                    LDA.b $5A,x                 
                    AND.b #$10                  
                    BNE   CODE_12DF8D           
                    LDA.w $046D,x               
                    AND.b #$04                  
                    BNE   CODE_12DF8D           
                    LDY.w $0488,x               
CODE_12DF44:        LDA.w $1128,y               
                    STA.b $0A                   
                    LDA.b #$00                  
                    STA.b $00                   
                    LDA.w $1100,y               
                    BPL   CODE_12DF54           
                    DEC.b $00                   
CODE_12DF54:        CLC                         
                    ADC.b $28,x                 
                    STA.b $06                   
                    LDA.b $14,x                 
                    ADC.b $00                   
                    STA.b $02                   
                    LDA.b $EB                   
                    BNE   CODE_12DF65           
                    STA.b $02                   
CODE_12DF65:        LDA.w $113C,y               
                    STA.b $0C                   
                    STZ.b $00                   
                    LDA.w $1114,y               
                    BPL   CODE_12DF73           
                    DEC.b $00                   
CODE_12DF73:        CLC                         
                    ADC.b $32,x                 
                    STA.b $08                   
                    LDA.b $1E,x                 
                    ADC.b $00                   
                    STA.b $04                   
                    JSL.l CODE_13FAE9           
                    BCS   CODE_12DF8D                   
                    LDA.b $0B                   
                    PHA                         
                    JSR.w CODE_12DF96           
                    PLA                         
                    STA.b $0B                   
CODE_12DF8D:        DEX                         
                    BMI   CODE_12DF93           
                    JMP.w CODE_12DED9           

CODE_12DF93:        LDX.b $12                   
CODE_12DF95:        RTS
                       
CODE_12DF96:        TXA                         
                    BNE   CODE_12DFA4           
                    LDA.b $9C                   
                    BEQ   CODE_12DFA4           
                    LDA.w $042D                 
                    CMP.b $12                   
                    BEQ   CODE_12DF95           
CODE_12DFA4:        LDY.b $12                   
                    LDA.w $90,y               
                    TAY                         
                    LDA.w $120B,y               
                    JSL.l CODE_118776

                    dw CODE_12E018
                    dw CODE_12E22F
                    dw CODE_12E1A2
                    dw CODE_12E229
                    dw CODE_12DFBB            

CODE_12DFBB:        TXA
                    BNE   CODE_12E017           
                    LDA.b $FA                   
                    AND.b #$08                  
                    BEQ   CODE_12E017           
                    LDA.b $5A                   
                    AND.b #$04                  
                    BEQ   CODE_12E017           
                    LDA.w $0426                 
                    CMP.b #$FA                  
                    BCS   CODE_12E017                   
                    LDA.w $04BE                 
                    ORA.w $04B3                 
                    BNE   CODE_12E017           
                    LDA.b $9C                   
                    BEQ   CODE_12DFE7           
                    LDY.w $042D                 
                    LDA.w $90,y               
                    CMP.b #$3D                  
                    BNE   CODE_12E017           
CODE_12DFE7:        LDA.w $0627                 
                    BNE   CODE_12E017           
                    LDY.b $12                   
                    LDA.w $29,y               
                    STA.b $28                   
                    LDA.w $15,y               
                    STA.b $14                   
                    JSL.l CODE_13FA42           
                    LDA.b #$04                  
                    STA.w $0536                 
                    LDA.w $0628                 
                    BNE   CODE_12E014           
                    LDA.w $0500                 
                    STA.w $079D                 
                    LDA.b #$80                  
                    STA.w $0500                 
                    STA.w $079C                 
CODE_12E014:        JMP.w CODE_128B20           

CODE_12E017:        RTS
                       
CODE_12E018:        LDY.b $12                   
                    TXA                         
                    BNE   CODE_12E020           
                    BRL   CODE_12E0A3           

CODE_12E020:        LDA.w $045C,y               
                    ORA.w $045B,x               
                    BNE   CODE_12E017           
                    LDA.w $042F,y               
                    BNE   CODE_12E04C           
                    LDA.w $51,y               
                    CMP.b #$04                  
                    BEQ   CODE_12E04C           
                    TXA                         
                    TAY                         
                    DEY                         
                    LDX.b $12                   
                    INX                         
                    LDA.w $51,y               
                    CMP.b #$04                  
                    BEQ   CODE_12E04C           
                    LDA.w $042F,y               
                    BEQ   CODE_12E0A0           
                    LDA.b $5A,x                 
                    AND.b #$10                  
                    BNE   CODE_12E0A0           
CODE_12E04C:        LDA.w $0453,y               
                    ORA.w $045C,y               
                    BNE   CODE_12E091           
                    LDA.w $046E,y               
                    AND.b #$08                  
                    BEQ   CODE_12E05E           
                    JSR.w CODE_12E352           
CODE_12E05E:        LDA.w $0465,y               
                    SEC                         
                    SBC.b #$01                  
                    STA.w $0465,y               
                    BMI   CODE_12E077           
                    JSR.w CODE_12E352           
                    LDA.b #$21                  
                    STA.w $045C,y               
                    LSR   A                     
                    STA.w $0438,y               
                    BNE   CODE_12E091           
CODE_12E077:        LDA.w $5B,y               
                    ORA.b #$10                  
                    STA.w $5B,y               
                    LDA.b #$E0                  
                    STA.w $47,y               
                    LDA.w $3D,y               
                    STA.b $00                   
                    ASL   A                     
                    ROR.b $00                   
                    LDA.b $00                   
                    STA.w $3D,y               
CODE_12E091:        LDA.b $8F,x                 
                    CMP.b #$32                  
                    BCS   CODE_12E0A0                   
                    LDA.b $50,x                 
                    CMP.b #$02                  
                    BEQ   CODE_12E0A0           
                    JSR.w CODE_12E332           
CODE_12E0A0:        LDX.b $EC                   
                    RTS
                       
CODE_12E0A3:        LDA.b $ED                   
                    AND.b #$08                  
                    BNE   CODE_12E0F5           
                    LDA.b $50                   
                    CMP.b #$04                  
                    BEQ   CODE_12E0F5           
                    LDA.w $90,y               
                    BNE   CODE_12E0D9           
                    STA.w $51,y               
                    LDA.w $04C3                 
                    CMP.b #$0F                  
                    BEQ   CODE_12E0C3           
                    LDA.b #$3B                  
                    STA.w $1DE3                 
CODE_12E0C3:        LDY.w $04C4                 
                    LDA.w $04C3                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $04C3                 
                    CMP   DATA_11CBEE,y               
                    BCC   CODE_12E0F5           
                    JSL.l CODE_14E098           
                    RTS
                       
CODE_12E0D9:        CMP.b #$17                  
                    BNE   CODE_12E0E2           
                    LDY.w $0595                 
                    BNE   CODE_12E0F5           
CODE_12E0E2:        CMP.b #$45                ; \ If in contact with star...
                    BNE   CODE_12E0F6         ; / Make player invincible.
                    LDA.b #$3F                ; \ Flashing timer = #$3F.
                    STA.w $04E1               ; /
                    LDA.b #$0D                ; \ Star music.
                    STA.w $1DE2               ; /
                    LDA.b #$00                ; \ Remove sprite.
                    STA.w $51,y             ; /
CODE_12E0F5:        RTS                       ; Return.
                       
CODE_12E0F6:        CMP.b #$28                  
                    BNE   CODE_12E111           
                    LDA.w $79,y               
                    CMP.b #$DC                  
                    BCS   CODE_12E110                   
                    LDA.w $04E1                 
                    BEQ   CODE_12E14A           
                    LDA.b #$DC                  
                    STA.w $79,y               
                    LDA.b #$00                  
                    STA.w $47,y               
CODE_12E110:        RTS
                       
CODE_12E111:        CMP.b #$2C                  
                    BNE   CODE_12E119           
                    LDA.b $B1,x                 
                    BNE   CODE_12E110           
CODE_12E119:        LDY.w $04E1                 
                    BEQ   CODE_12E14A           
                    LDX.b $12                   
                    CMP.b #$27                  
                    BEQ   CODE_12E128           
                    CMP.b #$20                  
                    BNE   CODE_12E133           
CODE_12E128:        LDA.b #$00                  
                    STA.w $046E,x               
                    JSR.w CODE_12B9FA           
                    JMP.w CODE_12E145           

CODE_12E133:        JSR.w CODE_12C1DA           
                    LDA   DATA_11AB41,y               
                    STA.b $3D,x                 
                    LDA.b #$E0                  
                    STA.b $47,x                 
                    LDA.b $5B,x                 
                    ORA.b #$10                  
                    STA.b $5B,x                 
CODE_12E145:        LDX.b $EC                   
                    LDY.b $12                   
                    RTS                         
CODE_12E14A:        LDY.b $12                   
                    LDA.w $51,y               
                    CMP.b #$04                  
                    BEQ   CODE_12E166           
                    LDA.w $046E,y               
                    AND.b #$01                  
                    BNE   CODE_12E166           
                    JSR.w CODE_12E37E           
                    LDA.b $0F                   
                    BNE   CODE_12E162           
                    RTS
                       
CODE_12E162:        AND.b #$0B                  
                    BEQ   CODE_12E169           
CODE_12E166:        JMP.w CODE_12E2CD           

CODE_12E169:        LDA.b #$00                  
                    STA.b $99                   
                    LDX.b $12                   
                    LDA.b $5B,x                 
                    ORA.b #$20                  
                    STA.b $5B,x                 
                    LDA.w $046E,x               
                    AND.b #$02                  
                    BNE   CODE_12E19F           
                    BIT.b $FA                 ; \ Don't pick enemy up if not pressing X nor Y.
                    BVC   CODE_12E19F         ; /     
                    LDA.b $9C                   
                    ORA.b $9A                   
                    BNE   CODE_12E19F           
                    STA.b $5B,x                 
                    STX.w $042D                 
                    STA.w $044A,x               
                    LDA.b #$07                  
                    STA.b $A8,x                 
                    JSL.l CODE_13F9D7         ; Handle player animation and sound effect.
                    LDA.b $90,x               ; \ Handle JSR if Pidgit.
                    CMP.b #$12                ;  |
                    BNE   CODE_12E19F         ; /
                    JSR.w CODE_12C5D8         ; Generate carpet.
CODE_12E19F:        LDX.b $EC                   
                    RTS
                       
CODE_12E1A2:        LDY.b $12                   
                    TXA                         
                    BEQ   CODE_12E1D4           
                    LDA.w $90,y               
                    CMP.b #$3D                  
                    BNE   CODE_12E1B5           
                    LDA.w $5B,y               
                    AND.b #$04                  
                    BNE   CODE_12E1D3           
CODE_12E1B5:        LDA.w $042F,y               
                    BNE   CODE_12E1D0           
                    JSR.w CODE_12E37E           
                    LDA.b $0F                   
                    AND.b $6E,x                 
                    BEQ   CODE_12E1C9           
                    DEX                         
                    JSR.w CODE_12C248           
                    LDX.b $EC                   
CODE_12E1C9:        JSR.w CODE_12E42C           
                    CPY.b #$00                  
                    BEQ   CODE_12E1D3           
CODE_12E1D0:        JMP.w CODE_12E2BD           

CODE_12E1D3:        RTS
                       
CODE_12E1D4:        LDA.w $5B,y               
                    ORA.b #$40                  
                    STA.w $5B,y               
                    JSR.w CODE_12E37E           
                    LDA.b $0F                   
                    AND.b $6E                   
                    BEQ   CODE_12E1E9           
                    JSL.l CODE_13F9BB           
CODE_12E1E9:        LDA.b $0F                   
                    AND.b #$04                  
                    BEQ   CODE_12E1F2           
                    JSR.w CODE_12E169           
CODE_12E1F2:        JSR.w CODE_12E42C           
                    CPY.b #$01                  
                    BNE   CODE_12E228           
                    LDY.b $12                   
                    LDA.w $47,y               
                    BEQ   CODE_12E228           
                    AND.b #$80                  
                    ASL   A                     
                    ROL   A                     
                    TAY                         
                    LDA.b $0F                   
                    AND   DATA_11AB43,y               
                    BEQ   CODE_12E228           
                    LDY.b $12                   
                    LDA.w $47,y               
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    STA.w $47,y               
                    LDA.b #$01                  
                    STA.b $9A                   
                    LDA.b #$04                  
                    STZ.w $078C                 
                    STA.b $C7                   
                    LDA.b #$10                  
                    STA.b $82                   
CODE_12E228:        RTS
                       
CODE_12E229:        TXA                         
                    BEQ   CODE_12E228           
                    JMP.w CODE_12E2BD           

CODE_12E22F:        LDY.b $12                   
                    TXA                         
                    BNE   CODE_12E266           
                    LDA.w $51,y               
                    CMP.b #$04                  
                    BNE   CODE_12E241           
                    LDA.w $04E1                 
                    BEQ   CODE_12E263           
CODE_12E240:        RTS
                       
CODE_12E241:        JSR.w CODE_12E37E           
                    LDA.b $0F                   
                    AND.b #$08                  
                    BEQ   CODE_12E25A           
                    LDA.b $9C                   
                    BNE   CODE_12E240           
                    LDY.b $12                   
                    STY.w $042D                 
                    LDA.b #$01                  
                    STA.w $A8,y               
                    INC.b $9C                   
CODE_12E25A:        LDA.b $0F                   
                    AND.b #$04                  
                    BEQ   CODE_12E240           
                    JMP.w CODE_12E169           

CODE_12E263:        JMP.w CODE_12E2CD           

CODE_12E266:        LDA.b $8F,x                 
                    CMP.b #$2C                  
                    BNE   CODE_12E28A           
                    LDA.b $85,x                 
                    BEQ   CODE_12E2CC           
                    LDA.b #$00                  
                    STA.w $51,y               
                    JSR.w CODE_12E332           
                    LDA.b #$60                  
                    STA.w $045B,x               
                    LSR   A                     
                    STA.w $0437,x               
                    LDA.w $0464,x               
                    BNE   CODE_12E289           
                    INC.w $04FB                 
CODE_12E289:        RTS
                       
CODE_12E28A:        CMP.b #$32                  
                    BCS   CODE_12E289                   
                    CMP.b #$11                  
                    BNE   CODE_12E29D           
                    LDA.b #$05                  
                    STA.w $51,y               
                    LDA.b #$1E                  
                    STA.w $86,y               
                    RTS
                       
CODE_12E29D:        LDA.w $51,y               
                    CMP.b #$04                  
                    BEQ   CODE_12E2BF           
                    LDA.w $90,y               
                    CMP.b #$35                  
                    BEQ   CODE_12E2BD           
                    LDA.b #$E8                  
                    STA.w $47,y               
                    STX.b $00                   
                    LDX.b $3D,y                 
                    BMI   CODE_12E2B8           
                    LDA.b #$18                  
CODE_12E2B8:        STA.w $3D,y               
                    LDX.b $00                   
CODE_12E2BD:        LDY.b $12                   
CODE_12E2BF:        JSR.w CODE_12E332           
                    BNE   CODE_12E2CC           
                    LDA.b $3C,x                 
                    ASL   A                     
                    ROR.b $3C,x                 
                    ASL   A                     
                    ROR.b $3C,x                 
CODE_12E2CC:        RTS
                       
CODE_12E2CD:        LDA.b $85                   
                    BNE   CODE_12E304           
                    LDA.w $04C3                 
                    SEC                         
                    SBC.b #$10                  
                    BCC   CODE_12E305           
                    STA.w $04C3                 
                    LDY.b #$7F                  
                    STY.b $85                   
                    LDY.b #$00                  
                    STY.b $46                   
                    STY.b $3C                   
                    CMP.b #$10                  
                    BCC   CODE_12E2FF           
                    LDA.w $0428                 
                    SEC                         
                    SBC.w $0429                 
                    ASL   A                     
                    ASL   A                     
                    STA.b $3C                   
                    LDA.b #$C0                  
                    LDY.b $46                   
                    BPL   CODE_12E2FD           
                    LDA.b #$00                  
CODE_12E2FD:        STA.b $46                   
CODE_12E2FF:        LDA.b #$33                  
                    STA.w $1DE0                 
CODE_12E304:        RTS
                       
CODE_12E305:        TXA                         
                    PHA                         
                    LDX.b $12                   
                    LDA.b $90,x                 
                    CMP.b #$0F                  
                    BCS   CODE_12E31B                   
                    JSR.w CODE_12C1DA           
                    INY                         
                    TYA                         
                    CMP.b $6F,x                 
                    BEQ   CODE_12E31B           
                    JSR.w CODE_12C248           
CODE_12E31B:        PLA                         
                    TAX                         
                    LDA.b #$C0                ; \ Rise in air.
                    STA.b $46                 ; /
                    LDA.b #$20                ; \ Remain mid-air for some time.
                    STA.b $82                 ; /
                    LDY.b $12                   
                    BMI   CODE_12E32D           
                    LSR   A                     
                    STA.w $0438,y               
CODE_12E32D:        JSL.l CODE_14E39F         ; Kill player.
                    RTS
                       
CODE_12E332:        LDA.w $0452,x               
                    ORA.w $045B,x               
                    BNE   CODE_12E37D           
                    LDA.w $046D,x               
                    AND.b #$08                  
                    BEQ   CODE_12E344           
                    JSR.w CODE_12E352           
CODE_12E344:        DEC.w $0464,x               
                    BMI   CODE_12E36C           
                    LDA.b #$21                  
                    STA.w $045B,x               
                    LSR   A                     
                    STA.w $0437,x               
CODE_12E352:        LDA.b $8F,x                 
                    CMP.b #$2C                  
                    BNE   CODE_12E366           
                    LDA.w $0464,x               
                    BNE   CODE_12E366           
                    LDA.b #$F0                  
                    STA.w $1DE2                 
                    LDA.b #$47                  
                    BRA   CODE_12E368           

CODE_12E366:        LDA.b #$28                  
CODE_12E368:        STA.w $1DE3                 
                    RTS
                       
CODE_12E36C:        LDA.b $5A,x                 
                    ORA.b #$10                  
                    STA.b $5A,x                 
                    LDA.b #$E0                  
                    STA.b $46,x                 
                    LDA.w $3D,y               
                    STA.b $3C,x                 
                    LDA.b #$00                  
CODE_12E37D:        RTS
                       
CODE_12E37E:        LDA.b #$00                  
                    STA.b $0F                   
                    LDY.b $12                   
                    LDA.w $0427                 
                    CMP.b #$F4                  
                    BCS   CODE_12E3AB                   
                    LDA.w $29,y               
                    LDY.b #$02                  
                    CMP.b $28,x                 
                    BMI   CODE_12E396           
                    LDY.b #$01                  
CODE_12E396:        STY.b $0F                   
                    TYA                         
                    AND.b $6E,x                 
                    BEQ   CODE_12E3AA           
                    LDY.b $12                   
                    LDA.w $04A4,y               
                    BNE   CODE_12E3AA           
                    LDA.w $3D,y               
                    STA.w $04CC,x               
CODE_12E3AA:        RTS
                       
CODE_12E3AB:        LDA.w $33,y               
                    CPX.b #$01                  
                    BCS   CODE_12E3BA                   
                    PHA                         
                    LDY.b $9A                   
                    PLA                         
                    SEC                         
                    SBC   DATA_11AB45,y               
CODE_12E3BA:        CMP.b $32,x                 
                    BMI   CODE_12E3F5           
                    LDA.b $46,x                 
                    BPL   CODE_12E3CB           
                    LDY.b $12                   
                    LDA.w $47,y               
                    BMI   CODE_12E3D8           
                    BRA   CODE_12E42B           

CODE_12E3CB:        LDY.b $12                   
                    LDA.w $04A4,y               
                    BNE   CODE_12E3D8           
                    LDA.w $3D,y               
                    STA.w $04CC,x               
CODE_12E3D8:        LDY.b #$00                  
                    INC.w $0427                 
                    BPL   CODE_12E3E0           
                    DEY                         
CODE_12E3E0:        LDA.w $0427                 
                    CLC                         
                    ADC.b $32,x                 
                    STA.b $32,x                 
                    TYA                         
                    ADC.b $1E,x                 
                    STA.b $1E,x                 
                    LDA.b $46,x                 
                    BMI   CODE_12E42B           
                    LDY.b #$04                  
                    BNE   CODE_12E413           
CODE_12E3F5:        LDA.b $46,x                 
                    BEQ   CODE_12E404           
                    BPL   CODE_12E42B           
                    LDY.b $12                   
                    LDA.w $90,y               
                    CMP.b #$36                  
                    BEQ   CODE_12E42B           
CODE_12E404:        LDY.b $12                   
                    LDA.w $90,y               
                    CMP.b #$44                  
                    BEQ   CODE_12E42B           
                    CMP.b #$39                  
                    BEQ   CODE_12E42B           
                    LDY.b #$08                  
CODE_12E413:        STY.b $0F                   
                    LDY.b $12                   
                    LDA.w $04A4,y               
                    BNE   CODE_12E422           
                    LDA.w $47,y               
                    STA.w $04D6,x               
CODE_12E422:        LDA.b #$10                  
                    STA.b $46,x                 
                    STZ.w $0411,x               
                    INC.b $9E,x                 
CODE_12E42B:        RTS
                       
CODE_12E42C:        LDY.b #$00                  
                    LDA.b $5A,x                 
                    ORA.b $0F                   
                    AND.b #$0C                  
                    CMP.b #$0C                  
                    BEQ   CODE_12E443           
                    LDA.b $5A,x                 
                    ORA.b $0F                   
                    AND.b #$03                  
                    CMP.b #$03                  
                    BNE   CODE_12E444           
                    INY                         
CODE_12E443:        INY                         
CODE_12E444:        RTS
                       
CODE_12E445:        JSL.l CODE_13F900           
                    LDA.b $00                   
                    LDY.b #$09                  
CODE_12E44D:        CMP   DATA_119B50,y               
                    BEQ   CODE_12E456           
                    DEY                         
                    BPL   CODE_12E44D           
                    CLC                         
CODE_12E456:        RTS
                       
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF                                  ; /
           
CODE_12E460:        ASL   A
                    TAX               
                    JMP.w (PNTR_12E465,x)                   

PNTR_12E465:        dw CODE_12E7E9                          ; 30-3F - Horizontal bricks.
                    dw CODE_12E7E9                          ; 40-4F - Horizontal X-blocks.
                    dw CODE_12E7E9                          ; 50-5F - Horizontal multiple vegetables.
                    dw CODE_12E7E9                          ; 60-6F - Horizontal bridge.
                    dw CODE_12E7E9                          ; 70-7F - Horizontal spikes.
                    dw CODE_12E89A                          ; 80-8F - Vertical bricks.
                    dw CODE_12E89A                          ; 90-9F - Vertical bricks.
                    dw CODE_12E89A                          ; A0-AF - Vertical ladders.
                    dw CODE_12EDA1                          ; B0-BF - Horizontal whales.
                    dw CODE_12E994                          ; C0-CF - Horizontal green platforms.
                    dw CODE_12E958                          ; D0-DF - Horizontal logs.
                    dw CODE_12E958                          ; E0-EF - Horizontal clouds.
                    dw CODE_12EC18                          ; F0-FF - Horizontal waterfalls.
                  
CODE_12E47F:        ASL   A
                    TAX                 
                    JMP.w (PNTR_12E484,x)

PNTR_12E484:        dw CODE_12E921
                    dw CODE_12E921
                    dw CODE_12E921
                    dw CODE_12E921
                    dw CODE_12E921
                    dw CODE_12E921
                    dw CODE_12EB07
                    dw CODE_12EB07
                    dw CODE_12EB07
                    dw CODE_12EF72
                    dw CODE_12EF72
                    dw CODE_12EF72
                    dw CODE_12EB32
                    dw CODE_12EB32
                    dw CODE_12ED1C
                    dw CODE_12F040        
                     
CODE_12E4A4:        LDA.w $050F           
                    ASL   A
                    TAX              
                    JMP.w (PNTR_12E4AC,x)

PNTR_12E4AC:        dw CODE_12EACF
                    dw CODE_12EAEF
                    dw CODE_12EB7F
                    dw CODE_12E7F7
                    dw CODE_12E870
                    dw CODE_12EA71
                    dw CODE_12EA71
                    dw CODE_12EC63
                    dw CODE_12EBC6
                    dw CODE_12EBC6
                    dw CODE_12F06A
                    dw CODE_12F091
                    dw CODE_12EF72
                    dw CODE_12EF72
                    dw CODE_12EF23
                    dw CODE_12EE90

DATA_12E4CC:        db $3D,$3C          
                           
CODE_12E4CE:        LDA.w $050F               ; \ Get object type number (0 = bricks, 1 = X-blocks, etc. C = waterfalls) * 4 into $0F.
                    ASL                       ;  |
                    ASL   A                   ;  |
                    STA.b $0F                 ; /
                    LDA.w $0545                 
                    LDX.w $050F                 
                    CPX.b #$07                  
                    BCS   CODE_12E4E2                   
                    LDA.w $0544                 
CODE_12E4E2:        CLC                         
                    ADC.b $0F                   
                    TAX                         
                    LDA.w $050F                 
                    CMP.b #$03                  
                    BNE   CODE_12E51A           
                    LDA.b [$01],y               
                    CMP.b #$1C                  
                    BNE   CODE_12E4F8           
                    LDA.b #$2A                  
                    BRL   CODE_12E5A8           

CODE_12E4F8:        CMP.b #$20                  
                    BNE   CODE_12E501           
                    LDA.b #$29                  
                    BRL   CODE_12E5A8           

CODE_12E501:        CMP.b #$21                  
                    BNE   CODE_12E50A           
                    LDA.b #$2B                  
                    BRL   CODE_12E5A8           

CODE_12E50A:        LDA.w $0533                 
                    CMP.b #$02                  
                    BEQ   CODE_12E515           
                    CMP.b #$0B                  
                    BNE   CODE_12E51A           
CODE_12E515:        LDA.b #$28                  
                    BRL   CODE_12E5A8           

CODE_12E51A:        STX.b $07                   
                    STY.b $08                   
                    LDX.w $0635                 
                    LDA.w PNTR_11B564,x               
                    STA.b $0C                   
                    LDA.w PNTR_11B56B,x               
                    STA.b $0D                   
                    LDA.b #$11                  
                    STA.b $0E                   
                    LDY.b $07                   
                    LDA.b [$0C],y               
                    STZ.w $0762                 
                    LDX.w $0533                 
                    CPX.b #$11                  
                    BNE   CODE_12E546           
                    LDX.w $0534                 
                    CPX.b #$03                  
                    BNE   CODE_12E546           
                    BRA   CODE_12E55C    
       
CODE_12E546:        LDX.w $0533                 
                    CPX.b #$0D                  
                    BNE   CODE_12E558           
                    LDX.w $0534                 
                    CPX.b #$02                  
                    BEQ   CODE_12E55C           
                    CPX.b #$03                  
                    BEQ   CODE_12E55C           
CODE_12E558:        LDX.b $EB                   
                    BEQ   CODE_12E564           
CODE_12E55C:        JSR.w CODE_12E5B4           
                    LDX.w $0762                 
                    BNE   CODE_12E5AD           
CODE_12E564:        JSR.w CODE_12E7A6           
                    LDY.b $08                   
                    LDX.b $07                   
                    CMP.b #$B0                  
                    BNE   CODE_12E589           
                    LDX.w $0533                 
                    CPX.b #$0B                  
                    BNE   CODE_12E589           
                    LDX.w $0534                 
                    CPX.b #$04                  
                    BNE   CODE_12E589           
                    JSR.w CODE_12F1F3           
                    LDX.w $050E                 
                    LDA.l DATA_12E4CC,x             
                    BRA   CODE_12E5A4
           
CODE_12E589:        CMP.b #$B0                  
                    BNE   CODE_12E5A4           
                    LDX.w $0533                 
                    CPX.b #$02                  
                    BNE   CODE_12E59B           
                    LDX.w $0534                 
                    CPX.b #$03                  
                    BEQ   CODE_12E5A2           
CODE_12E59B:        LDX.w $0533                 
                    CPX.b #$08                  
                    BNE   CODE_12E5A4           
CODE_12E5A2:        LDA.b #$3E                  
CODE_12E5A4:        STA.b [$01],y               
                    BRA   CODE_12E5AA           

CODE_12E5A8:        STA.b [$01],y               
CODE_12E5AA:        JSR.w CODE_12F13A           
CODE_12E5AD:        RTS
           
DATA_12E5AE:        db $04,$10

DATA_12E5B0:        db $07,$13

DATA_12E5B2:        db $09,$18            
              
CODE_12E5B4:        STA.w $0721                 
                    CMP.b #$AE                  
                    BEQ   CODE_12E5BC           
                    RTS
                       
CODE_12E5BC:        LDA.w $0768                 
                    BNE   CODE_12E5C4           
                    BRL   CODE_12E690           

CODE_12E5C4:        LDA.b $01                   
                    STA.w $0713                 
                    LDA.b $02                   
                    STA.w $0714                 
                    LDA.b $08                   
                    AND.b #$0F                  
                    BNE   CODE_12E5D7           
                    BRL   CODE_12E65C           

CODE_12E5D7:        LDY.b $08                   
                    DEY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12E610           
                    INY                         
                    INY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_12E65C           
                    JSR.w CODE_12E763           
                    LDA.b $08                   
                    AND.b #$F0                  
                    BEQ   CODE_12E601           
                    LDA.b $08                   
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12E601           
                    LDA.b #$00                  
                    BRA   CODE_12E67F           

CODE_12E601:        LDA.b $08                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12E5AE,x             
                    BRA   CODE_12E67F           

CODE_12E610:        LDA.b $08                   
                    AND.b #$0F                  
                    BEQ   CODE_12E619           
                    JSR.w CODE_12E6BE           
CODE_12E619:        LDA.b $08                   
                    AND.b #$F0                  
                    BEQ   CODE_12E63F           
                    LDA.b $08                   
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_12E63B           
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$7000                
                    STA.b $01                   
                    SEP   #$20                  
                    LDA.b [$01],y               
                    BNE   CODE_12E63F           
CODE_12E63B:        LDA.b #$03                  
                    BRA   CODE_12E67F           

CODE_12E63F:        LDA.w $0714                 
                    STA.b $02                   
                    LDY.b $08                   
                    DEY                         
                    LDA.b [$01],y               
                    CMP.b #$C2                  
                    BEQ   CODE_12E601           
                    LDA.b $08                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12E5B0,x             
                    BRA   CODE_12E67F           

CODE_12E65C:        LDA.b $08                   
                    AND.b #$F0                  
                    BEQ   CODE_12E672           
                    LDA.b $08                   
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12E672           
                    LDA.b #$08                  
                    BRA   CODE_12E67F           

CODE_12E672:        LDA.b $08                   
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12E5B2,x             
CODE_12E67F:        LDX.w $0713                 
                    STX.b $01                   
                    LDX.w $0714                 
                    STX.b $02                   
                    LDY.b $08                   
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
CODE_12E690:        INC.w $0762                 
                    LDA.w $0721                 
                    RTS
           
                     db $01,$02,$05,$06,$11,$12,$00,$04
                     db $10,$03,$07,$13

DATA_12E6A3:         db $02,$01,$06,$05,$12,$11,$01,$05
                     db $11,$02,$06,$12

                     db $08,$09,$18

DATA_12E6B2:         db $00,$10,$04

DATA_12E6B5:         db $01,$06,$12

                     db $03,$07,$13

DATA_12E6BB:         db $01,$05,$11
                            
CODE_12E6BE:        LDY.b $08                   
                    DEY                         
                    LDA.b $02                   
                    STA.w $0714                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b [$01],y               
                    BNE   CODE_12E6D2           
                    BRL   CODE_12E75D           

CODE_12E6D2:        LDA.w $0714                 
                    STA.b $02                   
                    LDA.w $0533                 
                    CMP.b #$0C                  
                    BNE   CODE_12E6FA           
                    LDA.w $0534                 
                    CMP.b #$01                  
                    BNE   CODE_12E6FA           
                    LDX.b #$02                  
                    LDA.b [$01],y               
CODE_12E6E9:        CMP.l $12E6AF,x             
                    BEQ   CODE_12E6F4           
                    DEX                         
                    BPL   CODE_12E6E9           
                    BRA   CODE_12E713           

CODE_12E6F4:        LDA.l DATA_12E6B5,x             
                    BRA   CODE_12E758           

CODE_12E6FA:        LDA.b [$01],y               
                    BEQ   CODE_12E75D           
                    CMP.b #$04                  
                    BEQ   CODE_12E75D           
                    CMP.b #$10                  
                    BEQ   CODE_12E75D           
                    LDX.b #$02                  
                    LDA.b [$01],y               
CODE_12E70A:        CMP.l $12E6AF,x             
                    BEQ   CODE_12E754           
                    DEX                         
                    BPL   CODE_12E70A           
CODE_12E713:        DEY                         
                    LDA.b $02                   
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b [$01],y               
                    BNE   CODE_12E73A           
                    LDA.w $0714                 
                    STA.b $02                   
                    LDX.b #$02                  
                    INY                         
                    LDA.b [$01],y               
CODE_12E729:        CMP.l $12E6B8,x             
                    BEQ   CODE_12E734           
                    DEX                         
                    BPL   CODE_12E729           
                    BRA   CODE_12E75D           

CODE_12E734:        LDA.l DATA_12E6BB,x             
                    BRA   CODE_12E758           

CODE_12E73A:        LDA.w $0714                 
                    STA.b $02                   
                    LDX.b #$0B                  
                    LDA.b [$01],y               
CODE_12E743:        CMP.l $12E697,x             
                    BEQ   CODE_12E74E           
                    DEX                         
                    BPL   CODE_12E743           
                    BRA   CODE_12E75D           

CODE_12E74E:        LDA.l DATA_12E6A3,x             
                    BRA   CODE_12E758           

CODE_12E754:        LDA.l DATA_12E6B2,x             
CODE_12E758:        LDY.b $08                   
                    DEY                         
                    STA.b [$01],y               
CODE_12E75D:        LDA.w $0714                 
                    STA.b $02                   
                    RTS
                       
CODE_12E763:        LDY.b $08                   
                    INY                         
                    LDA.b $02                   
                    STA.w $0714                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b [$01],y               
                    BEQ   CODE_12E7A0           
                    LDA.w $0714                 
                    STA.b $02                   
                    LDA.b [$01],y               
                    CMP.b #$03                  
                    BEQ   CODE_12E7A0           
                    CMP.b #$07                  
                    BEQ   CODE_12E7A0           
                    CMP.b #$13                  
                    BEQ   CODE_12E7A0           
                    LDX.b #$05                  
                    INY                         
                    LDA.b [$01],y               
CODE_12E78C:        CMP.l $12E697,x             
                    BEQ   CODE_12E797           
                    DEX                         
                    BPL   CODE_12E78C           
                    BRA   CODE_12E75D           

CODE_12E797:        LDA.l DATA_12E6A3,x             
                    LDY.b $08                   
                    INY                         
                    STA.b [$01],y               
CODE_12E7A0:        LDA.w $0714                 
                    STA.b $02                   
                    RTS
                       
CODE_12E7A6:        CMP.b #$07                  
                    BNE   CODE_12E7BC           
                    LDY.b $08                   
                    BMI   CODE_12E7B5           
                    CPY.b #$10                  
                    BPL   CODE_12E7B5           
                    JSR.w CODE_12E7BD           
CODE_12E7B5:        LDX.w $050E                 
                    BNE   CODE_12E7BC           
                    LDA.b #$18                  
CODE_12E7BC:        RTS
                       
CODE_12E7BD:        STA.w $02C6                 
                    REP   #$20                  
                    LDA.b $01                   
                    STA.w $02C9                 
                    SEC                         
                    SBC.w #$0010                
                    STA.b $01                   
                    SEP   #$20                  
                    LDA.b [$01],y               
                    CMP.b #$18                  
                    BNE   CODE_12E7DC           
                    LDA.b #$07                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12E7DC:        REP   #$20                  
                    LDA.w $02C9                 
                    STA.b $01                   
                    SEP   #$20                  
                    LDA.w $02C6                 
                    RTS
                       
CODE_12E7E9:        LDY.b $E7                  
CODE_12E7EB:        JSR.w CODE_12E4CE           
                    JSR.w CODE_12F8D6           
                    DEC.w $050E               ; \ If amount of Map16 blocks to transfer is negative, terminate.
                    BPL   CODE_12E7EB         ; /
                    RTS                       ; Return.
                       
CODE_12E7F7:        LDA.w $0635                 
                    CMP.b #$05                  
                    BEQ   CODE_12E827           
                    LDY.b $E7                   
                    LDA.b #$52                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b #$52                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDA.w $0635                 
                    CMP.b #$05                  
                    BEQ   CODE_12E822           
                    CMP.b #$06                  
                    BEQ   CODE_12E822           
                    JSR.w CODE_12F928           
CODE_12E822:        JSL.l CODE_14F7B2           
                    RTS
                       
CODE_12E827:        LDA.w $0533                 
                    CMP.b #$11                  
                    BNE   CODE_12E835           
                    LDA.w $0534                 
                    CMP.b #$02                  
                    BEQ   CODE_12E851           
CODE_12E835:        LDY.b $E7                   
                    LDA.b #$52                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDA.b $08                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b #$52                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSL.l CODE_14F7B2           
                    RTS
                       
CODE_12E851:        LDY.b $E7                   
                    DEY                         
                    LDA.b #$52                  
                    STA.b [$01],y               
                    INY                         
                    LDA.b #$52                  
                    STA.b [$01],y               
                    LDX.b #$02                  
CODE_12E85F:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b #$52                  
                    STA.b [$01],y               
                    DEX                         
                    BPL   CODE_12E85F           
                    JSL.l CODE_14F7FC           
                    RTS
                       
CODE_12E870:        LDY.b $E7                   
                    LDA.b #$52                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDY.b $E7                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b #$52                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDA.w $0635                 
                    CMP.b #$05                  
                    BEQ   CODE_12E895           
                    CMP.b #$06                  
                    BEQ   CODE_12E895           
                    JSR.w CODE_12F928           
CODE_12E895:        JSL.l CODE_14F7D7           
                    RTS
                       
CODE_12E89A:        LDA.w $0533                 
                    CMP.b #$0B                  
                    BNE   CODE_12E8A8           
                    LDA.w $0534                 
                    CMP.b #$01                  
                    BEQ   CODE_12E902           
CODE_12E8A8:        LDA.w $0533                 
                    CMP.b #$0E                  
                    BNE   CODE_12E8B6           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BEQ   CODE_12E8FF           
CODE_12E8B6:        LDY.b $E7                   
                    LDA.w $050F                 
                    CMP.b #$06                  
                    BNE   CODE_12E8DD           
                    LDA.w $0533                 
                    CMP.b #$0E                  
                    BNE   CODE_12E8DD           
                    LDA.w $0534                 
                    CMP.b #$05                  
                    BNE   CODE_12E8DD           
CODE_12E8CD:        LDA.b #$36                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F914           
                    DEC.w $050E                 
                    BPL   CODE_12E8CD           
                    RTS
                       
CODE_12E8DD:        LDA.w $050F                 
                    CMP.b #$06                  
                    BNE   CODE_12E8F4           
                    LDA.b #$00                  
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
                    STY.b $08                   
                    JSR.w CODE_12E763           
                    LDY.b $08                   
                    BRA   CODE_12E8F7           

CODE_12E8F4:        JSR.w CODE_12E4CE           
CODE_12E8F7:        JSR.w CODE_12F914           
                    DEC.w $050E                 
                    BPL   CODE_12E8F4           
CODE_12E8FF:        RTS
                       
DATA_12E900:        db $07,$13
                 
CODE_12E902:        LDY.b $E7                   
CODE_12E904:        TYA                         
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12E900,x             
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$B0                  
                    BCS   CODE_12E920                   
                    TAY                         
                    BRA   CODE_12E904           

CODE_12E920:        RTS
                       
CODE_12E921:        LDX.w $050F                 
                    CPX.b #$05                  
                    BNE   CODE_12E92E           
                    LDA.w $0545                 
                    BEQ   CODE_12E92E           
                    INX                         
CODE_12E92E:        LDA.w DATA_11B675,x               
                    LDY.w $0635                 
                    CPY.b #$06                  
                    BEQ   CODE_12E93B           
                    LDA.w DATA_11B66E,x               
CODE_12E93B:        LDY.w $00E7                 
                    PHA                         
                    DEY                         
                    JSR.w CODE_12F0BF           
                    JSL.l CODE_159895           
                    INY                         
                    INY                         
                    JSR.w CODE_12F0FC           
                    JSL.l CODE_1598DF           
                    DEY                         
                    PLA                         
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    RTS
                       
CODE_12E958:        LDA.w $0635                 
                    CMP.b #$04                  
                    BNE   CODE_12E962           
                    JMP.w CODE_12EE3F           

CODE_12E962:        LDY.b $E7                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$0A                  
                    TAX                         
                    LDA.w DATA_11B67C,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    BEQ   CODE_12E988           
CODE_12E978:        JSR.w CODE_12F8D6           
                    LDA.w DATA_11B67E,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    BNE   CODE_12E978           
CODE_12E988:        JSR.w CODE_12F8D6           
                    LDA.w DATA_11B680,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    RTS
                       
CODE_12E994:        LDA.w $0635                 
                    CMP.b #$06                  
                    BNE   CODE_12E99E           
                    JMP.w CODE_12EFF7           

CODE_12E99E:        LDA.w $0533                 
                    BNE   CODE_12E9B8           
                    LDA.w $0534                 
                    CMP.b #$02                  
                    BNE   CODE_12E9B8           
                    LDA.w $E9                 
                    CMP.b #$09                  
                    BNE   CODE_12E9B8           
                    LDA.w $E7                 
                    CMP.b #$0F                  
                    BEQ   CODE_12E9F0           
CODE_12E9B8:        LDX.b #$00                  
CODE_12E9BA:        STX.b $0B                   
                    LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    LDX.b $0B                   
                    LDY.b $E7                   
                    LDA.w $050E                 
                    STA.b $07                   
                    JSR.w CODE_12E9F1           
                    INX                         
                    LDA.b $07                   
                    BEQ   CODE_12E9DA           
CODE_12E9D2:        JSR.w CODE_12F8D6           
                    JSR.w CODE_12E9F1           
                    BNE   CODE_12E9D2           
CODE_12E9DA:        JSR.w CODE_12F8D6           
                    INX                         
                    JSR.w CODE_12E9F1           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$F0                  
                    BCS   CODE_12E9F0                   
                    LDX.b #$03                  
                    STA.b $E7                   
                    BRA   CODE_12E9BA
           
CODE_12E9F0:        RTS
                       
CODE_12E9F1:        STX.b $08                   
                    LDA.b $02                   
                    STA.w $0714                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b [$01],y               
                    BEQ   CODE_12EA08           
                    LDA.w $0714                 
                    STA.b $02                   
                    BRA   CODE_12EA6C           

CODE_12EA08:        LDA.w $0714                 
                    STA.b $02                   
                    TXA                         
                    BNE   CODE_12EA2A           
                    LDX.b #$02                  
                    LDA.b [$01],y               
                    CMP.w DATA_11B68B,x               
                    BEQ   CODE_12EA25           
                    DEX                         
                    CMP.w DATA_11B68B,x               
                    BEQ   CODE_12EA25           
                    DEX                         
                    CMP.w DATA_11B68B,x               
                    BNE   CODE_12EA48           
CODE_12EA25:        LDA.w DATA_11B68E,x               
                    BNE   CODE_12EA5B           
CODE_12EA2A:        LDX.b $08                   
                    CPX.b #$02                  
                    BNE   CODE_12EA48           
                    LDA.b [$01],y               
                    CMP.w DATA_11B68B,x               
                    BEQ   CODE_12EA43           
                    DEX                         
                    CMP.w DATA_11B68B,x               
                    BEQ   CODE_12EA43           
                    DEX                         
                    CMP.w DATA_11B68B,x               
                    BNE   CODE_12EA48           
CODE_12EA43:        LDA.w DATA_11B691,x               
                    BNE   CODE_12EA5B           
CODE_12EA48:        LDX.b #$08                  
CODE_12EA4A:        LDA.b [$01],y               
                    CMP.w DATA_11B682,x               
                    BEQ   CODE_12EA56           
                    DEX                         
                    BPL   CODE_12EA4A           
                    BRA   CODE_12EA6C           

CODE_12EA56:        LDX.b $08                   
                    LDA.w DATA_11B682,x               
CODE_12EA5B:        PHA                         
                    DEY                         
                    JSR.w CODE_12F0BF           
                    INY                         
                    PLA                         
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INY                         
                    JSR.w CODE_12F0FC           
                    DEY                         
CODE_12EA6C:        LDX.b $08                   
                    DEC.b $07                   
                    RTS
                       
CODE_12EA71:        LDA.w $0635                 
                    CMP.b #$04                  
                    BEQ   CODE_12EAA1           
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$05                  
                    STA.b $07                   
                    TAX                         
                    LDY.b $E7                   
                    LDA.w DATA_11B694,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12EA8B:        JSR.w CODE_12F914           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EAA0           
                    LDX.b $07                   
                    LDA.w DATA_11B696,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    BNE   CODE_12EA8B           
CODE_12EAA0:        RTS
                       
CODE_12EAA1:        LDX.b #$00                  
                    LDA.w $050F                 
                    CMP.b #$05                  
                    BEQ   CODE_12EAAB           
                    INX                         
CODE_12EAAB:        STX.b $07                   
                    LDY.b $E7                   
                    LDA.w DATA_11B698,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12EAB7:        JSR.w CODE_12F914           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EACE           
                    LDX.b $07                   
                    LDA.w DATA_11B69A,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    CPY.b #$E0                  
                    BCC   CODE_12EAB7           
CODE_12EACE:        RTS
                       
CODE_12EACF:        LDA.w $0533                 
                    CMP.b #$06                  
                    BNE   CODE_12EAEE           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BNE   CODE_12EAEE           
                    LDY.b $E7                   
                    LDA.b #$01                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INY                         
                    LDA.b #$02                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12EAEE:        RTS
                       
CODE_12EAEF:        LDA.w $0533                 
                    CMP.b #$06                  
                    BNE   CODE_12EB06           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BNE   CODE_12EB06           
                    LDY.b $E7                   
                    LDA.b #$03                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12EB06:        RTS
                       
CODE_12EB07:        LDY.b $E7                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$06                  
                    TAX                         
                    LDA.w DATA_11B69C,x               
CODE_12EB13:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F914           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EB25           
                    LDA.b #$6B                  
                    BRA   CODE_12EB13           

CODE_12EB25:        TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b #$6C                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    RTS
                       
CODE_12EB32:        LDY.b $E7                   
                    LDA.w $050F                 
                    CMP.b #$0D                  
                    BEQ   CODE_12EB57           
                    DEY                         
                    JSR.w CODE_12F0BF           
                    JSL.l CODE_159895           
                    INY                         
                    LDA.b #$C1                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INY                         
                    JSR.w CODE_12F0FC           
                    JSL.l CODE_1598DF           
                    DEY                         
CODE_12EB54:        JSR.w CODE_12F914           
CODE_12EB57:        LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EB7E           
                    DEY                         
                    JSR.w CODE_12F0BF           
                    JSL.l CODE_159895           
                    INY                         
                    LDA.b #$C2                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INY                         
                    JSR.w CODE_12F0FC           
                    JSL.l CODE_1598DF           
                    DEY                         
                    LDA.b $EB                   
                    BEQ   CODE_12EB54           
                    CPY.b #$E0                  
                    BCC   CODE_12EB54           
CODE_12EB7E:        RTS
                       
CODE_12EB7F:        LDY.b $E7                   
                    DEY                         
                    JSL.l CODE_159895           
                    INY                         
                    LDA.b #$C3                  
CODE_12EB89:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INY                         
                    JSL.l CODE_1598DF           
                    DEY                         
                    TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    CMP.b #$F0                  
                    BCS   CODE_12EBA7                   
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EBA7           
                    LDA.b #$C2                  
                    BRA   CODE_12EB89
           
CODE_12EBA7:        RTS
                       
CODE_12EBA8:        LDX.w $050F                 
                    LDA.w DATA_11B69F,x               
                    CMP.b #$5A                  
                    BNE   CODE_12EBBC           
                    LDA.w DATA_11B69F,x               
                    LDY.w $0242                 
                    BNE   CODE_12EBBC           
                    LDA.b #$EB                  
CODE_12EBBC:        LDY.b $E7                   
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    RTS
                       
CODE_12EBC4:        STA.b $E7                   
CODE_12EBC6:        LDA.w $0533                 
                    CMP.b #$02                  
                    BEQ   CODE_12EBD5           
                    CMP.b #$08                  
                    BEQ   CODE_12EBD5           
                    CMP.b #$0B                  
                    BNE   CODE_12EBD8           
CODE_12EBD5:        BRL   CODE_12F174           

CODE_12EBD8:        LDA.w $050F                 
                    SEC                         
                    SBC.b #$08                  
                    STA.b $08                   
                    LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    LDY.b $E7                   
                    LDA.b #$05                  
                    STA.b $07                   
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EC17           
CODE_12EBF1:        LDX.b $08                   
                    LDA.w $0635                 
                    CMP.b #$06                  
                    BNE   CODE_12EBFF           
                    JSL.l CODE_15A090           
                    RTS
                       
CODE_12EBFF:        LDA.w DATA_11B6AE,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F8D6           
                    DEC.b $07                   
                    BPL   CODE_12EBF1           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$F0                  
                    BCC   CODE_12EBC4           
CODE_12EC17:        RTS
                       
CODE_12EC18:        STZ.b $08                   
                    LDA.w $0635                 
                    CMP.b #$03                  
                    BNE   CODE_12EC28           
                    JSL.l CODE_159DCA           
                    RTS
                       
CODE_12EC26:        STA.b $E7                   
CODE_12EC28:        LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    LDY.b $E7                   
                    DEY                         
                    JSR.w CODE_12F0BF           
                    JSL.l CODE_159895           
                    INY                         
                    LDA.w $050E                 
                    STA.b $07                   
                    LDX.b $08                   
CODE_12EC3F:        LDA.w DATA_11B6B2,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F8D6           
                    DEC.b $07                   
                    BPL   CODE_12EC3F           
                    JSR.w CODE_12F0FC           
                    JSL.l CODE_1598DF           
                    LDA.b #$01                  
                    STA.b $08                   
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$F0                  
                    BCC   CODE_12EC26           
                    RTS
                       
CODE_12EC63:        LDY.b $E7                   
                    STZ.b $08                   
                    STZ.w $0242                 
CODE_12EC6A:        PHY                         
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_12EC79           
                    INC.w $0242                 
CODE_12EC79:        PLY                         
                    LDA.w $0242                 
                    BEQ   CODE_12EC83           
                    LDA.b #$8A                  
                    BRA   CODE_12EC85           

CODE_12EC83:        LDA.b #$84                  
CODE_12EC85:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDX.b $08                   
                    BEQ   CODE_12ECDF           
                    INY                         
                    LDA.w $0242                 
                    BEQ   CODE_12EC98           
                    LDA.b #$8B                  
                    BRA   CODE_12EC9A           

CODE_12EC98:        LDA.b #$88                  
CODE_12EC9A:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEX                         
                    BEQ   CODE_12ECCE           
CODE_12ECA2:        INY                         
                    LDA.w $0242                 
                    BEQ   CODE_12ECAC           
                    LDA.b #$8C                  
                    BRA   CODE_12ECAE           

CODE_12ECAC:        LDA.b #$85                  
CODE_12ECAE:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEX                         
                    BNE   CODE_12ECA2           
                    LDX.b $08                   
CODE_12ECB8:        INY                         
                    LDA.w $0242                 
                    BEQ   CODE_12ECC2           
                    LDA.b #$8D                  
                    BRA   CODE_12ECC4           

CODE_12ECC2:        LDA.b #$86                  
CODE_12ECC4:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEX                         
                    CPX.b #$01                  
                    BNE   CODE_12ECB8           
CODE_12ECCE:        INY                         
                    LDA.w $0242                 
                    BEQ   CODE_12ECD8           
                    LDA.b #$8E                  
                    BRA   CODE_12ECDA           

CODE_12ECD8:        LDA.b #$89                  
CODE_12ECDA:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12ECDF:        INY                         
                    LDA.w $0242                 
                    BEQ   CODE_12ECE9           
                    LDA.b #$8F                  
                    BRA   CODE_12ECEB           

CODE_12ECE9:        LDA.b #$87                  
CODE_12ECEB:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    CMP.b #$8F                  
                    BNE   CODE_12ECF5           
                    RTS
                       
CODE_12ECF5:        INC.b $08                   
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    SEC                         
                    SBC.b $08                   
                    TAY                         
                    JMP.w CODE_12EC6A           

                    LDY.b $E7                   
                    LDA.b #$31                  
CODE_12ED09:        STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F914           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_12ED18           
                    RTS
                       
CODE_12ED18:        LDA.b #$32                  
                    BRA   CODE_12ED09           

CODE_12ED1C:        RTS
                       
CODE_12ED1D:        LDY.b $E7                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$0C                  
                    TAX                         
                    CMP.b #$03                  
                    BEQ   CODE_12ED2F           
                    LDA.w $0246                 
                    BEQ   CODE_12ED41           
CODE_12ED2F:        PHX                         
                    TAX                         
                    DEX                         
                    JSR.w CODE_12F0A5           
                    LDA.w DATA_11B6D7,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F8D6           
                    PLX                         
CODE_12ED41:        LDA.w DATA_11B6C3,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    JSR.w CODE_12F8D6           
                    LDA.w DATA_11B6C7,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
CODE_12ED5A:        JSR.w CODE_12F8D6           
                    LDA.w DATA_11B6CB,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    LDA.w $050E                 
                    CMP.b #$01                  
                    BNE   CODE_12ED5A           
                    JSR.w CODE_12F8D6           
                    LDA.w DATA_11B6CF,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    JSR.w CODE_12F8D6           
                    LDA.w DATA_11B6D3,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    CPX.b #$03                  
                    BEQ   CODE_12ED91           
                    LDX.w $0246                 
                    BEQ   CODE_12EDA0           
CODE_12ED91:        DEX                         
                    JSR.w CODE_12F8D6           
                    LDA.w DATA_11B6DA,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F0A5           
CODE_12EDA0:        RTS
                       
CODE_12EDA1:        STZ.w $0242                 
                    STZ.w $0246                 
                    LDA.w $0635                 
                    CMP.b #$06                  
                    BNE   CODE_12EDB1           
                    JMP.w CODE_12F091           

CODE_12EDB1:        LDA.w $050E                 
                    STA.b $07                   
                    LDA.b #$0C                  
                    STA.w $050F                 
                    JSR.w CODE_12ED1D           
                    INC.w $050F                 
                    LDA.b $07                   
                    STA.w $050E                 
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    INC.w $0246                 
                    JSR.w CODE_12ED1D           
                    INC.w $050F                 
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$B0                  
                    BNE   CODE_12EDED           
                    LDA.b $07                   
                    CMP.b #$0D                  
                    BMI   CODE_12EE15           
                    INC.w $0242                 
                    BRA   CODE_12EE15           

CODE_12EDED:        INC.w $0242                 
CODE_12EDF0:        STZ.w $0247                 
                    LDA.b $07                   
                    STA.w $050E                 
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    CMP.b #$B0                  
                    BCC   CODE_12EE03           
CODE_12EE03:        LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    INC.w $0246                 
                    JSR.w CODE_12ED1D           
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$B0                  
                    BNE   CODE_12EE2A           
CODE_12EE15:        INC.w $0247                 
                    JSR.w CODE_12F8D6           
                    JSR.w CODE_12F8D6           
                    LDA.b #$E1                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INC.w $050F                 
                    BRA   CODE_12EDF0           

CODE_12EE2A:        LDA.w $050F                 
                    CMP.b #$0E                  
                    BCC   CODE_12EDF0           
                    JSR.w CODE_12F8D6           
                    JSR.w CODE_12F8D6           
                    LDA.b #$11                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    RTS
                       
CODE_12EE3F:        LDY.b $E7                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$0A                  
                    TAX                         
                    JSR.w CODE_12EE85           
                    LDA.w DATA_11B6DF,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSL.l CODE_159D4B           
                    LDX.b $07                   
                    DEC.w $050E                 
                    BEQ   CODE_12EE72           
CODE_12EE5E:        JSR.w CODE_12F8D6           
                    LDA.w DATA_11B6E2,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSL.l CODE_159D4B           
                    DEC.w $050E                 
                    BNE   CODE_12EE5E           
CODE_12EE72:        JSR.w CODE_12F8D6           
                    JSR.w CODE_12EE85           
                    LDA.w DATA_11B6E4,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSL.l CODE_159D4B           
                    RTS
                       
CODE_12EE85:        STX.b $07                   
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_12EE8F           
                    LDX.b #$02                  
CODE_12EE8F:        RTS
                       
CODE_12EE90:        STZ.b $07                   
CODE_12EE92:        STZ.w $024A                 
CODE_12EE95:        LDY.b $E7                   
                    LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12EED5           
CODE_12EEA2:        LDA.w $024A                 
                    CLC                         
                    ADC.b #$5C                  
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
                    INC.w $024A                 
                    LDA.w $024A                 
                    AND.b #$0F                  
                    CMP.b #$0C                  
                    BEQ   CODE_12EEBE           
                    JSR.w CODE_12F8D6           
                    BRA   CODE_12EEA2           

CODE_12EEBE:        LDY.b $E7                   
                    JSR.w CODE_12F914           
                    STY.b $E7                   
                    INC.b $07                   
                    LDA.w $024A                 
                    CMP.b #$1C                  
                    BEQ   CODE_12EE92           
                    LDA.b #$10                  
                    STA.w $024A                 
                    BRA   CODE_12EE95           

CODE_12EED5:        LDA.b $07                   
                    CMP.b #$0F                  
                    BEQ   CODE_12EF22           
                    LDA.w $0533                 
                    CMP.b #$0E                  
                    BNE   CODE_12EEEF           
                    LDA.w $0534                 
                    CMP.b #$01                  
                    BNE   CODE_12EEEF           
                    LDA.b $E9                   
                    CMP.b #$08                  
                    BNE   CODE_12EF22           
CODE_12EEEF:        TYA                         
                    SEC                         
                    SBC.b #$11                  
                    TAY                         
                    LDA.b #$0E                  
                    CLC                         
                    ADC.b #$5C                  
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
                    INY                         
                    LDA.b #$0F                  
                    CLC                         
                    ADC.b #$5C                  
                    STA.b [$01],y               
                    LDX.b #$0A                  
CODE_12EF08:        JSR.w CODE_12F8D6           
                    DEX                         
                    BPL   CODE_12EF08           
                    LDA.b #$0C                  
                    CLC                         
                    ADC.b #$5C                  
                    STA.b [$01],y               
                    JSR.w CODE_12F8D6           
                    LDA.b #$0D                  
                    CLC                         
                    ADC.b #$5C                  
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
CODE_12EF22:        RTS
                       
CODE_12EF23:        LDA.b $E7                   
                    STA.w $0721                 
                    LDX.b #$00                  
CODE_12EF2A:        LDY.b $E7                   
                    LDA.w DATA_11B6ED,x               
                    STA.b [$01],y               
                    CMP.b #$83                  
                    BEQ   CODE_12EF3A           
                    JSR.w CODE_12F154           
                    BRA   CODE_12EF3D           

CODE_12EF3A:        JSR.w CODE_12F13A           
CODE_12EF3D:        INX                         
                    INY                         
                    LDA.w DATA_11B6ED,x               
                    STA.b [$01],y               
                    CMP.b #$83                  
                    BEQ   CODE_12EF4D           
                    JSR.w CODE_12F154           
                    BRA   CODE_12EF50           

CODE_12EF4D:        JSR.w CODE_12F13A           
CODE_12EF50:        INX                         
                    INY                         
                    LDA.w DATA_11B6ED,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F154           
                    INX                         
                    INY                         
                    LDY.b $E7                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    CPX.b #$1B                  
                    BNE   CODE_12EF2A           
                    LDA.w $0721                 
                    STA.b $E7                   
                    JSL.l CODE_15A2A7           
                    RTS
                       
CODE_12EF72:        LDY.b $E7                   
                    LDA.w $050F                 
                    CMP.b #$09                  
                    BNE   CODE_12EF83           
                    LDA.w $04B0                 
                    BEQ   CODE_12EF83           
                    INC.w $050F                 
CODE_12EF83:        LDA.w $0533                 
                    CMP.b #$13                  
                    BNE   CODE_12EF9C           
                    LDA.w $0534                 
                    CMP.b #$00                  
                    BNE   CODE_12EF9C           
                    LDA.w $050F                 
                    CMP.b #$0B                  
                    BNE   CODE_12EF9C           
                    LDX.b #$05                  
                    BRA   CODE_12EFA3           

CODE_12EF9C:        LDA.w $050F                 
                    SEC                         
                    SBC.b #$09                  
                    TAX                         
CODE_12EFA3:        LDA.w DATA_11B708,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    JSR.w CODE_12F914           
                    LDA.w DATA_11B70E,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    LDA.w $0635                 
                    CMP.b #$05                  
                    BEQ   CODE_12EFC4           
                    CMP.b #$06                  
                    BEQ   CODE_12EFC4           
                    JSR.w CODE_12F928           
CODE_12EFC4:        RTS
                       
CODE_12EFC5:        LDY.b $E7                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$0A                  
                    TAX                         
                    LDA.w DATA_11B714,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    BEQ   CODE_12EFEB           
CODE_12EFDB:        JSR.w CODE_12F8D6           
                    LDA.w DATA_11B719,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    DEC.w $050E                 
                    BNE   CODE_12EFDB           
CODE_12EFEB:        JSR.w CODE_12F8D6           
                    LDA.w DATA_11B71E,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    RTS
                       
CODE_12EFF7:        LDA.w $050E                 
                    STA.b $07                   
                    LDA.b #$0C                  
                    STA.w $050F                 
                    JSR.w CODE_12EFC5           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    TAY                         
                    LDA.b #$0D                  
                    STA.w $050F                 
                    LDA.b $07                   
                    STA.w $050E                 
                    JSR.w CODE_12EFC5           
CODE_12F019:        LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    TAY                         
                    LDA.b #$0E                  
                    STA.w $050F                 
                    LDA.b $07                   
                    STA.w $050E                 
                    LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12F03F           
                    JSR.w CODE_12EFC5           
                    LDA.b $E7                   
                    CMP.b #$E0                  
                    BCC   CODE_12F019           
CODE_12F03F:        RTS
                       
CODE_12F040:        LDX.w $0635                 
                    LDY.b $E7                   
                    LDA.w DATA_11B723,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12F04D:        JSR.w CODE_12F914           
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12F069           
                    LDX.w $0635                 
                    LDA.w DATA_11B72A,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    CPX.b #$04                  
                    BNE   CODE_12F04D           
                    CPY.b #$E0                  
                    BCC   CODE_12F04D           
CODE_12F069:        RTS
                       
CODE_12F06A:        DEC.b $E7                   
                    DEC.b $E7                   
                    LDX.b #$00                  
CODE_12F070:        LDY.b $E7                   
                    LDA.b #$05                  
                    STA.w $0712                 
CODE_12F077:        LDA.w DATA_11D04C,x               
                    STA.b [$01],y               
                    INX                         
                    CPX.b #$18                  
                    BEQ   CODE_12F090           
                    INY                         
                    DEC.w $0712                 
                    BPL   CODE_12F077           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    BRA   CODE_12F070           

CODE_12F090:        RTS
                       
CODE_12F091:        LDY.b $E7                   
CODE_12F093:        LDA.b #$58                  
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    TYA                         
                    CLC                         
                    ADC.b #$0F                  
                    TAY                         
                    DEC.w $050E                 
                    BNE   CODE_12F093           
                    RTS
                       
CODE_12F0A5:        DEY                         
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$0F                  
                    BNE   CODE_12F0BE           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    STX.b $0B                   
                    LDX.b $E9                   
                    DEX                         
                    STX.b $0D                   
                    JSR.w CODE_12F8B0           
                    LDX.b $0B                   
CODE_12F0BE:        RTS
                       
CODE_12F0BF:        PHX                         
                    STY.w $02C7                 
                    TYA                         
                    AND.b #$0F                  
                    CMP.b #$0F                  
                    BEQ   CODE_12F0F7           
                    TYA                         
                    BMI   CODE_12F0D1           
                    CMP.b #$10                  
                    BMI   CODE_12F0F7           
CODE_12F0D1:        SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDX.b #$03                  
                    LDA.b [$01],y               
                    CMP.w $B731,x               
                    BEQ   CODE_12F0F7           
                    LDX.b #$03                  
                    LDY.w $02C7                 
                    LDA.b [$01],y               
CODE_12F0E5:        CMP.w $B731,x               
                    BNE   CODE_12F0F4           
                    LDA.w DATA_11B735,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    BRA   CODE_12F0F7           

CODE_12F0F4:        DEX                         
                    BPL   CODE_12F0E5           
CODE_12F0F7:        LDY.w $02C7                 
                    PLX                         
                    RTS
                       
CODE_12F0FC:        PHX                         
                    STY.w $02C7                 
                    TYA                         
                    AND.b #$0F                  
                    BEQ   CODE_12F135           
                    TYA                         
                    BMI   CODE_12F10C           
                    CMP.b #$10                  
                    BMI   CODE_12F135           
CODE_12F10C:        SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDX.b #$03                  
                    LDA.b [$01],y               
CODE_12F114:        CMP.w $B739,x               
                    BEQ   CODE_12F135           
                    DEX                         
                    BPL   CODE_12F114           
                    LDX.b #$03                  
                    LDY.w $02C7                 
                    LDA.b [$01],y               
CODE_12F123:        CMP.w $B739,x               
                    BNE   CODE_12F132           
                    LDA.w DATA_11B73D,x               
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    BRA   CODE_12F135           

CODE_12F132:        DEX                         
                    BPL   CODE_12F123           
CODE_12F135:        LDY.w $02C7                 
                    PLX                         
                    RTS
                       
CODE_12F13A:        STA.w $076E                 
                    LDA.b $02                   
                    STA.w $076F                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDA.b #$00                  
                    STA.b [$01],y               
                    LDA.w $076F                 
                    STA.b $02                   
                    LDA.w $076E                 
                    RTS
                       
CODE_12F154:        STA.w $076E                 
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
                    
   
DATA_12F16E:        db $20,$1C,$1C,$1C,$1C,$21     

           
CODE_12F174:        STZ.b $08                   
                    LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    JSR.w CODE_12F1C5           
                    LDY.b $E7                   
                    LDA.b #$05                  
                    STA.b $07                   
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BEQ   CODE_12F194           
                    CMP.b #$1B                  
                    BEQ   CODE_12F1AE           
                    CMP.b #$1D                  
                    BEQ   CODE_12F1AE           
                    BRA   CODE_12F1C4           

CODE_12F194:        LDX.b $08                   
                    LDA.w $0719                 
                    BEQ   CODE_12F19F           
                    TAX                         
                    STZ.w $0719                 
CODE_12F19F:        LDA.b [$01],y               
                    CMP.b #$1D                  
                    BEQ   CODE_12F1AE           
                    LDA.l DATA_12F16E,x             
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
CODE_12F1AE:        JSR.w CODE_12F8D6           
                    INC.b $08                   
                    DEC.b $07                   
                    BPL   CODE_12F194           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$F0                  
                    BCS   CODE_12F1C4                  
                    STA.b $E7                   
                    BRA   CODE_12F174           

CODE_12F1C4:        RTS
                       
CODE_12F1C5:        STZ.w $0719                 
                    LDY.b $E7                   
                    JSR.w CODE_12F0A5           
                    LDA.b [$01],y               
                    CMP.b #$21                  
                    BEQ   CODE_12F1DB           
                    CMP.b #$2B                  
                    BNE   CODE_12F1E2           
                    LDA.b #$2A                  
                    BRA   CODE_12F1DD           

CODE_12F1DB:        LDA.b #$1C                  
CODE_12F1DD:        STA.b [$01],y               
                    INC.w $0719                 
CODE_12F1E2:        RTS
           
DATA_12F1E3:        db $00,$02,$02,$02,$04,$00,$02,$02
                    db $02,$04

DATA_12F1ED:        db $1B,$1A,$1D,$1D,$1F,$1E
                          
CODE_12F1F3:        LDA.w $0768               
                    BEQ   CODE_12F22F                
                    LDA.b $01               
                    STA.w $0715                
                    LDA.b $02                   
                    STA.w $0716                 
                    STY.w $0717                 
                    JSR.w CODE_12F914           
                    LDA.w $076A                 
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_12F1E3,x             
                    CLC                         
                    ADC.w $050E                 
                    TAX                         
                    LDA.l DATA_12F1ED,x             
                    STA.b [$01],y               
                    JSR.w CODE_12F13A           
                    INC.w $076A                 
                    LDA.w $0715                 
                    STA.b $01                   
                    LDA.w $0716                 
                    STA.b $02                   
                    LDY.w $0717                 
CODE_12F22F:        RTS

DATA_12F230:        dw $4040,$4040,$0000,$0000              ; Tiles with which the level is blanked out. $40 = low byte, $00 = high byte. Blank tile.

DATA_12F238:        dw $2000,$5800,$9000,$C800              ; Which area of the Layer 1 tables is affected. $7E2000-$7E8FFF = low bytes, $7E9000-$7EFFFF = high bytes.
                          
CODE_12F240:        LDA.w $FE               ; \ Use brightness as an index.
                    EOR.b #$0F                ;  | But only values #$0F, #$0D, #$0B and #$09 are used as brightness. (And there are XORd with #$0F)
                    TAX                       ; / Resulting value (#$00, #$02, #$04 or #$06) goes in X.
                    REP   #$20                ; A = 16-bit.
                    LDA.w #$3800              ; \ Amount of bytes to clear = #$3800.
                    STA.b $00                 ;  |
                    LDA.l DATA_12F230,x         ;  | Map16 Tile to use = $40 (low byte) and $00 (high byte).  
                    STA.b $02                 ;  |
                    LDA.l DATA_12F238,x         ;  | Which area in the Layer 1 Map16 table to affect.  
                    LDY.b #$7E                ;  | Bank num = $7E.
                    JSL.l CODE_008690         ; / DMA all data via the math registers at $211B/C.
                    SEP   #$20                ; A = 8-bit.
                    RTS                       ; Return.
                       
                    SEP   #$20                ; A = 8-bit. Unused?
                    RTS                       ; Return. Unused?
                       
CODE_12F263:        LDA.w $0776                 
                    BNE   CODE_12F299           
                    STZ.w $0200                 
                    STZ.w $0206                 
                    STZ.w $0202                 
                    STZ.w $0208                 
                    STZ.w $0204                 
                    STZ.w $020A                 
                    STZ.w $0538                 
                    STZ.w $026C                 
                    STZ.w $0750                 
                    STZ.b $D5                   
                    STZ.w $02C1                 
                    STZ.w $074F                 
                    STZ.b $E6                   
                    STZ.b $CA                   
                    STZ.b $CB                   
                    STZ.w $04BF                 
                    STZ.w $04C1                 
                    STZ.b $D8                   
CODE_12F299:        RTS
                       
CODE_12F29A:        REP   #$20                ; \ A = 16-bit.
                    LDA.w #$A000              ;  | Amount of bytes to clear = #$A000.
                    STA.b $00                 ;  |
                    LDA.w #$00FF              ;  | Value to transfer is #$FFFF.
                    XBA                       ;  | Why not simply LDA #$FFFF?
                    ORA.w #$00FF              ;  |
                    STA.b $02                 ;  |
                    LDA.w #$2000              ;  | Starting address of table = $7F2000 (Layer 2 Map16 table)
                    LDY.b #$7F                ;  |
                    JSL.l CODE_008690         ; / DMA all data via the math registers at $211B/C.
                    SEP   #$20                ; A = 8-bit.
                    RTS                       ; Return.
                       
CODE_12F2B6:        STY.b $0E                   
                    STX.b $0D                   
                    LDX.w $0635               ; \ Load index to palettes...
                    LDA.l DATA_148000,x         ;  | per world.
                    STA.b $07                 ;  | [$07] = pal pointer.
                    LDA.l DATA_14800E,x         ;  |
                    STA.b $08                 ;  |
                    LDA.b #$14                ;  |
                    STA.b $09                 ; /
                    BRA   CODE_12F2E6           

CODE_12F2CF:        STY.b $0E                   
                    STX.b $0D                   
                    LDX.w $0635               ; \ Load index to palettes...
                    LDA.l DATA_148007,x         ;  | per world.
                    STA.b $07                 ;  | [$07] = pal pointer.
                    LDA.l DATA_148015,x         ;  |
                    STA.b $08                 ;  |
                    LDA.b #$14                ;  |
                    STA.b $09                 ; /
CODE_12F2E6:        LDY.b $0D                   
                    LDA.b [$07],y               
                    LDY.b $0E                   
                    LDX.b $0D                   
                    RTS
                       
CODE_12F2EF:        JSL.l CODE_12F5CE         ; Prepare ($D9) pointer to load the Layer 1 room data.
                    LDY.b #$00                ; Start off at the very start of the table.
                    LDA.b ($D9),y             ; \ Load first byte.
                    PHA                       ;  | Preserve A first.
                    JSR.w CODE_12F2B6         ;  | Prepare palette pointer.
                    PLA                       ; / 
                    STA.b $0E                   
                    STZ.b $0F                   
                    REP   #$30                  
                    LDA.b $0E                   
                    PHA                         
                    AND.w #$0038                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.w $04EF                 
                    AND.w #$00FF                
                    BEQ   CODE_12F31A           
                    LDA.b [$07],y               
                    BRA   CODE_12F31D           

CODE_12F31A:        LDA.w #$0000                
CODE_12F31D:        STA.w $04BC                 
                    LDX.w #$0000                
CODE_12F323:        LDA.b [$07],y               
                    STA.w $0B00,x               
                    INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.w #$0100                
                    BNE   CODE_12F323           
                    SEP   #$30                  
                    LDA.b $0E                   
                    CMP.b #$30                  
                    BEQ   CODE_12F33D           
                    JSL.l CODE_13DD50           
CODE_12F33D:        JSR.w CODE_12F2CF           
                    REP   #$20                  
                    PLA                         
                    AND.w #$0003                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDX.b #$00                  
CODE_12F34F:        LDA.b [$07],y               
                    STA.w $0CC0,x               
                    INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.b #$40                  
                    BNE   CODE_12F34F           
                    SEP   #$20                  
                    JSL.l CODE_13DC00           
                    REP   #$20                  
                    LDY.b #$1E                  
CODE_12F366:        LDA.w $12D0,y               
                    STA.w $0C00,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_12F366           
                    LDX.b #$7E                  
CODE_12F372:        LDA.w DATA_11BB1C,x               
                    STA.w $0C20,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_12F372           
                    LDA.w $04BC                 
                    STA.w $0B00                 
                    STA.w $0B20                 
                    SEP   #$20                  
                    JSL.l CODE_13E457           
                    JSR.w CODE_12FF4F           
                    LDA.b #$01                  
                    STA.w $02A9                 
                    RTL
                       
CODE_12F394:        JSR.w CODE_12FFAC           
                    LDA.w $0534                 
                    STA.w $051B                 
                    LDA.b #$30                  
                    STA.b $0F                   
                    JSL.l CODE_13DEE2           
                    LDA.w $04BF                 
                    STA.b $E9                   
                    LDA.w $04C1                 
                    CLC                         
                    ADC.b #$08                  
                    BCC   CODE_12F3B4           
                    INC.b $E9                   
CODE_12F3B4:        AND.b #$F0                  
                    PHA                         
                    SEC                         
                    SBC.w $04C1                 
                    STA.b $BA                   
                    PLA                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $E5                   
                    LDA.b #$00                  
                    STA.b $E6                   
                    LDA.b $E9                   
                    STA.b $0D                   
                    JSR.w CODE_12FF82           
                    JSR.w CODE_12F8A3           
                    LDY.b $E7                   
                    LDX.b #$0F                  
CODE_12F3D6:        LDA.b [$01],y               
                    JSR.w CODE_12F427           
                    STY.w $0713                 
                    TXY                         
                    STA.b [$C4],y               
                    LDA.b $02                   
                    STA.w $0714                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $02                   
                    LDY.w $0713                 
                    LDA.b [$01],y               
                    BEQ   CODE_12F406           
                    LDA.b $C5                   
                    STA.w $0715                 
                    CLC                         
                    ADC.b #$70                  
                    STA.b $C5                   
                    TXY                         
                    LDA.b #$01                  
                    STA.b [$C4],y               
                    LDA.w $0715                 
                    STA.b $C5                   
CODE_12F406:        LDA.w $0714                 
                    STA.b $02                   
                    LDY.w $0713                 
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    TXA                         
                    CLC                         
                    ADC.b #$10                  
                    TAX                         
                    AND.b #$F0                  
                    BNE   CODE_12F3D6           
                    TYA                         
                    AND.b #$0F                  
                    TAY                         
                    JSR.w CODE_12F8D6           
                    DEX                         
                    BPL   CODE_12F3D6           
                    RTL
                       
CODE_12F427:        STY.b $08                   
                    STX.b $07                   
                    CMP.b #$41                  
                    BEQ   CODE_12F435           
                    CMP.b #$42                  
                    BEQ   CODE_12F435           
                    BRA   CODE_12F44A           

CODE_12F435:        SEC                         
                    SBC.b #$41                  
                    TAY                         
                    LDA.w $04FC,y               
                    BNE   CODE_12F443           
                    LDX.b $07                   
                    JSR.w CODE_12F95F           
CODE_12F443:        LDA.b #$41                  
                    BRA   CODE_12F44A           

                    LDA.w DATA_11B839,x               
CODE_12F44A:        LDX.b $07                   
                    LDY.b $08                   
                    RTS
                       
CODE_12F44F:        LDX.b #$00                  
                    STX.b $EB                   
                    JSR.w CODE_12FFAC           
                    JSR.w CODE_12FF82           
                    LDY.b #$00                  
                    LDA.b #$40                  
CODE_12F45D:        STA.b [$C4],y               
                    INY                         
                    BNE   CODE_12F45D           
                    LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.b #$04                  
                    TAX                         
                    LDA.l DATA_15A400,x             
                    DEC   A                     
                    DEC   A                     
                    STA.w $076B                 
                    JSL.l CODE_159B05           
                    LDA.w $0534                 
                    STA.w $051B                 
                    LDA.b #$04                  
                    STA.w $0534                 
                    LDA.b #$0A                  
                    JSR.w CODE_12F5E4           
                    LDY.b #$02                  
                    LDA.b ($D9),y               
                    AND.b #$03                  
                    STA.w $0544                 
                    LDA.b ($D9),y               
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    STA.w $0545                 
                    JSR.w CODE_12F5E4           
                    LDA.b #$0A                  
                    STA.b $E9                   
                    LDA.b #$00                  
                    STA.b $E6                   
                    STA.b $E5                   
                    LDA.b #$03                  
                    STA.b $04                   
                    JSR.w CODE_12F60C           
                    LDA.b #$01                  
                    STA.b $EB                   
                    RTL
                       
                    LDY.b #$03                  
                    LDA.b ($05),y               
                    AND.b #$03                  
                    STA.w $0546                 
                    CMP.w $0547                 
                    BEQ   CODE_12F4CF           
                    LDA.w $04E1                 
                    CMP.b #$08                  
                    BCS   CODE_12F4CF                   
                    LDA.b #$80                  
                    STA.w $0603                 
CODE_12F4CF:        RTS
                       
CODE_12F4D0:        STZ.w $02B7                 
CODE_12F4D3:        JSL.l CODE_118014           
                    LDA.b $FE                 ; \ Don't run following routine routine if screen is too dark.
                    CMP.b #$09                ;  | Brightness < #$09.
                    BCC   CODE_12F4E0         ; /
                    JSR.w CODE_12F240         ; Clear Layer 1 RAM table.
CODE_12F4E0:        JSL.l CODE_14D1B2           
                    LDA.w $02B7                 
                    BEQ   CODE_12F4D3           
                    JSR.w CODE_12F4ED           
                    RTL
                       
CODE_12F4ED:        LDA.w $0534                 
                    PHA                         
                    LDX.w $0533                 
                    LDA.l DATA_11CF30,x             
                    STA.w $02E5                 
                    STA.w $0534                 
CODE_12F4FE:        LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.w $0534                 
                    TAX                         
                    LDA.l DATA_11D0AD,x             
                    STA.b $D9                   
                    LDA.l DATA_11D17F,x             
                    STA.b $DA                   
                    JSR.w CODE_12F55B           
                    JSL.l CODE_15A123           
                    JSL.l CODE_159C8C           
                    DEC.w $0534                 
                    BPL   CODE_12F4FE           
                    PLA                         
                    STA.w $0534                 
                    JSL.l CODE_159C53           
                    JSL.l CODE_15A1A3           
                    JSR.w CODE_12F536           
                    RTS
                       
CODE_12F536:        LDA.w $0533                 
                    BNE   CODE_12F55A           
                    LDA.b #$7F                  
                    STA.b $01                   
                    LDA.b #$3E                  
                    STA.b $02                   
                    LDA.b #$7E                  
                    STA.b $03                   
                    LDY.b #$00                  
                    LDA.b #$CA                  
CODE_12F54B:        STA.b [$01],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$D0                  
                    BEQ   CODE_12F55A           
                    TAY                         
                    LDA.b #$C7                  
                    BRA   CODE_12F54B           

CODE_12F55A:        RTS
                       
CODE_12F55B:        LDY.b #$03                  
                    LDA.b ($D9),y               
                    LSR   A                     
                    AND.b #$1C                  
                    STA.w $0560                 
                    LDY.b #$00                ; \ Bit 7 of byte 1...
                    LDA.b ($D9),y             ;  | ... of level header of object data...
                    ASL   A                   ;  | Goes into carry.
                    LDA.b #$00                ;  | All bits are clear.
                    ROL   A                   ;  | Carry into bit 0.
                    STA.b $EB                 ; / Store into horizontal level flag. So that depends on bit 7 of the first header byte.
                    STZ.b $E9                   
                    LDY.b #$02                  
                    LDA.b ($D9),y               
                    TAX                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0541                 
                    TXA                         
                    AND.b #$03                  
                    STA.w $0544                 
                    TXA                         
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    STA.w $0545                 
                    DEY                         
                    LDA.b ($D9),y               
                    AND.b #$1F                  
                    CMP.b #$1F                  
                    BEQ   CODE_12F5BD           
                    STA.w $0543                 
                    INY                         
                    INY                         
                    INY                         
                    STZ.b $E5                   
                    STZ.b $E6                   
                    LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.w $0534                 
                    TAX                         
                    LDA.l DATA_15A400,x             
                    BEQ   CODE_12F5BA           
                    CMP.b #$01                  
                    BNE   CODE_12F5BD           
                    JSL.l CODE_159400           
                    BRA   CODE_12F5BD           

CODE_12F5BA:        JSR.w CODE_12F71C           
CODE_12F5BD:        STZ.b $E6                   
                    LDA.b #$03                  
                    STA.b $04                   
                    JSR.w CODE_12F60A           
                    LDA.b #$22                  
                    ORA.b $10                   
                    STA.w $0585                 
                    RTS
                       
CODE_12F5CE:        LDY.w $0533               ; \ Get 16-bit address of Layer 1 room data in 16-bit pointer ($D9)
                    LDA   DATA_11D098,y       ;  |
                    CLC                       ;  |
                    ADC.w $0534               ;  |
                    TAY                       ;  |
                    LDA   DATA_11D0AD,y       ;  |   
                    STA.b $D9                 ;  |
                    LDA   DATA_11D17F,y       ;  |   
                    STA.b $DA                 ; /
                    RTL                       ; Return.
                       
CODE_12F5E4:        LDA.b #$1A                  
                    STA.b $DA                   
                    STZ.b $D9                   
                    RTS
                       
CODE_12F5EB:        LDX.w $0533                 
                    LDA.l DATA_139E00,x             
                    CLC                         
                    ADC.w $0534                 
                    TAX                         
                    LDA.l DATA_139E16,x             
                    STA.b $05                   
                    LDA.l DATA_139EE8,x             
                    STA.b $06                   
                    LDA.l DATA_139E15               
                    STA.b $07                   
CODE_12F609:        RTS
                       
CODE_12F60A:        STZ.b $E9                   
CODE_12F60C:        LDY.b $04                   
CODE_12F60E:        INY                         
                    LDA.b ($D9),y             ; \ Check if position byte inside the object tables is $FF...
                    CMP.b #$FF                ;  |
                    BEQ   CODE_12F609         ; / If so, terminate.
                    AND.b #$0F                ; \ Get X position of object.
                    STA.b $E5                 ; /
                    LDA.b ($D9),y             ; \ Get relative Y position....
                    AND.b #$F0                ;  |
                    CMP.b #$F0                ;  | ... if $F0 (special object), don't branch.
                    BNE   CODE_12F62C         ; /
                    LDA.b $E5                 ;  Load X position of object...
                    STY.b $0F                   
                    JSR.w CODE_12F68C           
                    LDY.b $0F                   
                    BRA   CODE_12F60E           

CODE_12F62C:        JSR.w CODE_12F678           
                    INY                         
                    STY.b $04                   
                    JSR.w CODE_12F8A3           
                    LDA.b ($D9),y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $050F                 
                    CMP.b #$03                  
                    BCS   CODE_12F65B                   
                    PHA                         
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    STA.w $050F                 
                    PLA                         
                    BEQ   CODE_12F670           
                    CMP.b #$01                  
                    BNE   CODE_12F656           
                    JSR.w CODE_12E4A4           
                    BRA   CODE_12F60C           

CODE_12F656:        JSR.w CODE_12EBA8           
                    BRA   CODE_12F60C          
 
CODE_12F65B:        LDA.b ($D9),y               
                    AND.b #$0F                  
                    STA.w $050E                 
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$03                  
                    STA.w $050F                 
                    JSR.w CODE_12E460           
                    BRA   CODE_12F60C           

CODE_12F670:        LDA.w $050F                 
                    JSR.w CODE_12E47F           
                    BRA   CODE_12F60C           

CODE_12F678:        CLC                         
                    ADC.b $E6                   
                    BCC   CODE_12F681           
                    ADC.b #$0F                  
                    BRA   CODE_12F687           

CODE_12F681:        CMP.b #$F0                  
                    BNE   CODE_12F689           
                    LDA.b #$00                  
CODE_12F687:        INC.b $E9                   
CODE_12F689:        STA.b $E6                   
                    RTS
                       
CODE_12F68C:        ASL   A                   ; \ Jump to code, dependant on...
                    TAX                       ;  | ... X position of special object.
                    JMP.w (PNTR_12F691,x)     ; /

PNTR_12F691:        dw CODE_12F6C6
                    dw CODE_12F6C6
                    dw CODE_12F6B4
                    dw CODE_12F6B2
                    dw CODE_12F704
                    dw CODE_12F6C9
                    dw CODE_12F6C6                

CODE_12F69F:        ASL   A                     
                    TAX                         
                    JMP.w (PNTR_12F6A4,x)             

PNTR_12F6A4:        dw CODE_12F6EA
                    dw CODE_12F6EF
                    dw CODE_12F6BC
                    dw CODE_12F6B9
                    dw CODE_12F709
                    dw CODE_12F70E
                    dw CODE_12F70F
               
CODE_12F6B2:        INC.b $E9
CODE_12F6B4:        INC.b $E9
                    STZ.b $E6
                    RTS
                 
CODE_12F6B9:        INC.w $0542                 
CODE_12F6BC:        INC.w $0542                 
                    STZ.b $0E                   
                    STZ.b $09                   
                    RTL
                       
                    INC.b $0F                   
CODE_12F6C6:        INC.b $0F                   
                    RTS
                       
CODE_12F6C9:        LDY.b $0F                   
                    INY                         
                    LDA.b $E9                   
                    ASL   A                     
                    TAX                         
                    LDA.b ($D9),y               
                    STA.w $051F,x               
                    INY                         
                    INX                         
                    LDA.b ($D9),y               
                    STA.w $051F,x               
                    STY.b $0F                   
                    RTS
                       
CODE_12F6DF:        LDY.b $0F                   
                    INY                         
                    LDA.b ($D9),y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    RTS
                       
CODE_12F6EA:        JSR.w CODE_12F6DF           
                    BRA   CODE_12F6F5           

CODE_12F6EF:        JSR.w CODE_12F6DF           
                    CLC                         
                    ADC.b #$08                  
CODE_12F6F5:        STA.b $0E                   
                    LDA.b $EB                   
                    BNE   CODE_12F703           
                    LDA.b $0E                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $0E                   
CODE_12F703:        RTL
                       
CODE_12F704:        STZ.b $E9                   
                    STZ.b $E6                   
                    RTS
                       
CODE_12F709:        STZ.w $0542                 
                    STZ.b $0E                   
CODE_12F70E:        RTL
                       
CODE_12F70F:        LDY.b $0F                   
                    INY                         
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    ASL   A                     
                    ASL   A                     
                    STA.w $0560                 
                    RTL
                       
CODE_12F71C:        STZ.w $0542                 
                    STZ.b $09                   
CODE_12F721:        LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BNE   CODE_12F733           
                    LDA.w $0541                 
                    INC   A                     
                    INC   A                     
                    STA.w $0542                 
                    STZ.b $0E                   
                    BRA   CODE_12F779           

CODE_12F733:        LDA.b ($D9),y               
                    AND.b #$F0                  
                    BEQ   CODE_12F75D           
                    CMP.b #$F0                  
                    BNE   CODE_12F761           
                    STZ.w $02C8                 
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    STY.b $0F                   
                    JSL.l CODE_12F69F           
                    LDY.b $0F                   
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    CMP.b #$02                  
                    BCC   CODE_12F779           
                    CMP.b #$06                  
                    BEQ   CODE_12F75D           
                    CMP.b #$05                  
                    BNE   CODE_12F75E           
                    INY                         
CODE_12F75D:        INY                         
CODE_12F75E:        INY                         
                    BRA   CODE_12F721           

CODE_12F761:        CLC                         
                    ADC.b $09                   
                    BCC   CODE_12F76A           
                    ADC.b #$0F                  
                    BRA   CODE_12F770           

CODE_12F76A:        CMP.b #$F0                  
                    BNE   CODE_12F773           
                    LDA.b #$00                  
CODE_12F770:        INC.w $0542                 
CODE_12F773:        STA.b $09                   
                    INY                         
                    INY                         
                    BRA   CODE_12F721           

CODE_12F779:        JSR.w CODE_12F8A3           
                    JSL.l CODE_12F7CE           
                    LDA.b $EB                   
                    BEQ   CODE_12F792           
                    INC.b $E5                   
                    LDA.b $E5                   
                    CMP.b #$10                  
                    BNE   CODE_12F797           
                    INC.b $E9                   
                    STZ.b $E5                   
                    BRA   CODE_12F797           

CODE_12F792:        LDA.b #$10                  
                    JSR.w CODE_12F678           
CODE_12F797:        LDA.b $E9                   
                    CMP.w $0542                 
                    BNE   CODE_12F779           
                    LDA.b $EB                   
                    BEQ   CODE_12F7AA           
                    LDA.b $E5                   
                    CMP.b $0E                   
                    BCC   CODE_12F779           
                    BCS   CODE_12F7B0                   
CODE_12F7AA:        LDA.b $E6                   
                    CMP.b $0E                   
                    BCC   CODE_12F779           
CODE_12F7B0:        LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BEQ   CODE_12F7CD           
                    INY                         
                    LDA.b ($D9),y               
                    AND.b #$1F                  
                    STA.w $0543                 
                    INY                         
                    JMP.w CODE_12F721           

                    LDA.b $EB                   
                    BNE   CODE_12F7CA           
                    LDA.w DATA_11B7BD,x               
                    RTS

CODE_12F7CA:        LDA.w DATA_11B741,x               
CODE_12F7CD:        RTS

CODE_12F7CE:        STY.b $04                   
                    LDA.w $0543                 
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDY.b $E7                   
CODE_12F7D8:        LDA.b $EB                   
                    BNE   CODE_12F7E2           
                    LDA.l DATA_11B7BD,x             
                    BRA   CODE_12F7E6           

CODE_12F7E2:        LDA.l DATA_11B741,x             
CODE_12F7E6:        STA.w $0717                 
                    JSR.w CODE_12F811           
                    LDA.w $0717                 
                    JSR.w CODE_12F813           
                    LDA.w $0717                 
                    JSR.w CODE_12F815           
                    LDA.w $0717                 
                    JSR.w CODE_12F817           
                    LDA.b $EB                   
                    BEQ   CODE_12F808           
                    INX                         
                    BCC   CODE_12F7D8           
                    LDY.b $04                   
                    RTL
                       
CODE_12F808:        INX                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_12F7D8           
                    LDY.b $04                   
                    RTL
                       
CODE_12F811:        LSR   A                     
                    LSR   A                     
CODE_12F813:        LSR   A                     
                    LSR   A                     
CODE_12F815:        LSR   A                     
                    LSR   A                     
CODE_12F817:        AND.b #$03                  
                    STX.w $0210                 
                    BEQ   CODE_12F888           
                    CLC                         
                    ADC.w $0560                 
                    TAX                         
                    STX.b $0C                   
                    STY.b $0D                   
                    LDX.w $0635                 
                    LDA.b $EB                   
                    BNE   CODE_12F83E           
                    LDA.w PNTR_11AB8F,x               
                    STA.b $DC                   
                    LDA.w PNTR_11AB9D,x               
                    STA.b $DD                   
                    LDA.b #$11                  
                    STA.b $DE                   
                    BRA   CODE_12F84C           

CODE_12F83E:        LDA.w PNTR_11AB88,x               
                    STA.b $DC                   
                    LDA.w PNTR_11AB96,x               
                    STA.b $DD                   
                    LDA.b #$11                  
                    STA.b $DE                   
CODE_12F84C:        LDY.b $0C                   
                    LDA.b [$DC],y               
                    PHA                         
                    LDA.b $E9                   
                    BNE   CODE_12F85E           
                    LDA.b $0D                   
                    AND.b #$0F                  
                    BNE   CODE_12F85E           
                    PLA                         
                    BRA   CODE_12F87C           

CODE_12F85E:        LDA.b $0D                   
                    AND.b #$F0                  
                    BNE   CODE_12F867           
                    PLA                         
                    BRA   CODE_12F87F           

CODE_12F867:        PLA                         
                    JSR.w CODE_12FEF0           
                    CPY.b #$00                  
                    BEQ   CODE_12F87C           
                    LDX.w $02C8                 
                    BNE   CODE_12F879           
                    JSR.w CODE_12FE30           
                    BRA   CODE_12F87C           

CODE_12F879:        JSR.w CODE_12FE80           
CODE_12F87C:        JSR.w CODE_12FF2B           
CODE_12F87F:        JSR.w CODE_12FFC2           
                    LDX.b $0C                   
                    LDY.b $0D                   
                    STA.b [$01],y               
CODE_12F888:        LDX.w $0210                 
                    LDA.b $EB                   
                    BNE   CODE_12F891           
                    INY                         
                    RTS
                       
CODE_12F891:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    AND.b #$F0                  
                    BNE   CODE_12F8A2           
                    LDA.w $02C8                 
                    BNE   CODE_12F8A2           
                    INC.w $02C8                 
CODE_12F8A2:        RTS
                       
CODE_12F8A3:        LDX.b $E9                   
                    JSR.w CODE_12F8B0           
                    LDA.b $E6                   
                    CLC                         
                    ADC.b $E5                   
                    STA.b $E7                   
                    RTS
                       
CODE_12F8B0:        STY.w $02F5                 
                    LDA.w $0628                 
                    DEC   A                     
                    BEQ   CODE_12F8C2           
                    PHX                         
                    LDX.w $0534                 
                    LDA.l DATA_11AB11,x             
                    PLX                         
CODE_12F8C2:        CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.w DATA_11AB06,x               
                    STA.b $03                   
                    LDY.w $02F5                 
                    RTS
                       
CODE_12F8D6:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BNE   CODE_12F913           
                    TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    STX.b $0B                   
                    LDX.b $E9                   
                    CPX.b #$06                  
                    BNE   CODE_12F90B           
                    LDA.w $0246                 
                    CMP.b #$01                  
                    BEQ   CODE_12F8F6           
                    CMP.b #$02                  
                    BEQ   CODE_12F8FC           
                    BRA   CODE_12F90B           

CODE_12F8F6:        CPY.b #$B0                  
                    BNE   CODE_12F90B           
                    BRA   CODE_12F900           

CODE_12F8FC:        CPY.b #$C0                  
                    BNE   CODE_12F90B           
CODE_12F900:        LDA.b $07                   
                    CMP.b #$04                  
                    BNE   CODE_12F90B           
                    LDA.w $0247                 
                    BEQ   CODE_12F90C           
CODE_12F90B:        INX                         
CODE_12F90C:        STX.b $0D                   
                    JSR.w CODE_12F8B0           
                    LDX.b $0B                   
CODE_12F913:        RTS
                       
CODE_12F914:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    CMP.b #$F0                  
                    BCC   CODE_12F927           
                    LDX.b $E9                   
                    INX                         
                    JSR.w CODE_12F8B0           
                    TYA                         
                    AND.b #$0F                  
                    TAY                         
CODE_12F927:        RTS
                       
CODE_12F928:        LDY.b $04                   
                    INY                         
                    LDA.b ($D9),y               
                    STA.b $07                   
                    INY                         
                    LDA.b ($D9),y               
                    STA.b $08                   
                    STY.b $04                   
                    LDA.b $E9                   
                    ASL   A                     
                    TAY                         
                    LDA.b $07                   
                    STA.w $051F,y               
                    INY                         
                    LDA.b $08                   
                    STA.w $051F,y               
                    RTS
                       
                    LSR   A                     
                    BCS   CODE_12F954                   
                    LDA.b #$01                  
                    STA.b $C9                   
                    ASL   A                     
                    STA.b $C8                   
                    LDA.b #$00                  
                    BRA   CODE_12F95B           

CODE_12F954:        STZ.b $C9                   
                    STZ.b $C8                   
                    LDA   DATA_119B3C,y               
CODE_12F95B:        STA.w $0507                 
                    RTS
                       
CODE_12F95F:        TXA                         
                    PHA                         
                    AND.b #$F0                  
                    STA.b $33                   
                    TXA                         
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $29                   
                    LDA.b #$0A                  
                    STA.b $15                   
                    LDX.b #$00                  
                    STX.b $12                   
                    STX.b $1F                   
                    LDA.b #$3F                  
                    STA.b $90                   
                    LDA.b #$01                  
                    STA.b $51                   
                    STY.b $79                   
                    LDA.b #$00                  
                    STA.b $86,x                 
                    STA.b $B1,x                 
                    STA.b $A8,x                 
                    STA.b $9F,x                 
                    STA.w $044A,x               
                    STA.b $5B,x                 
                    STA.w $0438,x               
                    STA.w $0453,x               
                    STA.w $045C,x               
                    STA.b $47,x                 
                    STA.b $3D,x                 
                    LDY.b $90,x                 
                    LDA   DATA_11CC45,y               
                    AND.b #$7F                  
                    STA.b $65,x                 
                    LDA   DATA_11CC8C,y               
                    STA.w $046E,x               
                    LDA   DATA_11CD1A,y               
                    STA.w $0489,x               
                    LDA   DATA_11CCD3,y               
                    STA.w $0492,x               
                    LDA.b #$FF                  
                    STA.w $0441,x               
                    PLA                         
                    TAX                         
                    RTS
                       
CODE_12F9BF:        LDA.w $0635               ; \ Get world number * 3 into X index.
                    AND.b #$0F                ;  |
                    STA.w $0635               ;  |
                    ASL   A                   ;  |
                    CLC                       ;  |
                    ADC.w $0635               ;  |
                    TAX                       ;  |
                    LDA   PNTR_15EF00,x    ;  | [$02] = Pointer to the miniature level during the 'World x-x' screen.
                    STA.b $02                 ;  |
                    LDA   PNTR_15EF00+1,x  ;  |   
                    STA.b $03                 ;  |
                    LDA   PNTR_15EF00+2,x  ;  |   
                    STA.b $04                 ; /
                    LDA.b #$80                ; \ Increase VRAM destination by 1 if written to $2119.
                    STA.w $2115               ; /
                    REP   #$30                ; Accumulator and Index = 16-bit
                    LDA.w #$0566              ; \ Image on Layer 1 tilemap.
                    STA.b $00                 ; /
                    LDY.w #$0000              ; Start with first byte of image table.
CODE_12F9EE:        LDX.w #$0026              ; Amount of bytes to write per line = #$28.
                    LDA.b $00                 ; \ $00 into VRAM destination address.
                    STA.w $2116               ; /
CODE_12F9F6:        LDA.b [$02],y             ; \ Transfer image over to VRAM.
                    STA.w $2118               ;  |
                    INY                       ;  |
                    INY                       ;  |
                    DEX                       ;  |
                    DEX                       ;  |
                    BPL   CODE_12F9F6         ; / If line not completed, loop.
                    LDA.b $00                 ; \ Go to next line.
                    ADC.w #$0020              ;  |
                    STA.b $00                 ;  |
                    CMP.w #$06A6              ;  | If result does not go beyond the miniature level's position in the tile map...
                    BNE   CODE_12F9EE         ; / Loop and transfer next line.
                    SEP   #$30                ; Accumulator and Index = 8-bit.
                    RTL                       ; Return.
                       
CODE_12FA10:        LDA.b $8F                   
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    REP   #$30                  
                    AND.w #$00FF                
                    TAY                         
                    LDX.w #$0000                
CODE_12FA20:        PHX                         
                    TYX                         
                    LDA.l DATA_11BA9C,x             
                    PLX                         
                    STA.w $12D0,x               
                    INY                         
                    INY                         
                    INX                         
                    INX                         
                    CPX.w #$0020                
                    BCC   CODE_12FA20           
                    SEP   #$30                  
CODE_12FA35:        LDX.b $8F                   
                    LDA.l DATA_11BA3C,x             
                    TAY                         
                    LDX.b #$00                  
CODE_12FA3E:        PHX                         
                    TYX                         
                    LDA.l DATA_11BA40,x             
                    PLX                         
                    STA.w $0548,x               
                    INY                         
                    INX                         
                    CPX.b #$17                  
                    BCC   CODE_12FA3E           
                    PHD                         
                    REP   #$20                  
                    LDX.b #$2F                  
CODE_12FA53:        LDA.l DATA_11BCB6,x             
                    STA.w $0680,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_12FA53           
                    LDA.w #$1100                
                    TCD                         
                    LDX.b #$9C                  
CODE_12FA64:        LDA.l DATA_11BCE6,x             
                    STA.b $68,x                 
                    DEX                         
                    DEX                         
                    CPX.b #$FE                  
                    BNE   CODE_12FA64           
                    SEP   #$20                  
                    LDX.b #$17                  
CODE_12FA74:        LDA.l DATA_11BB9C,x             
                    STA.b $50,x                 
                    DEX                         
                    BPL   CODE_12FA74           
                    LDX.b #$4F                  
CODE_12FA7F:        LDA.l DATA_11CB9E,x             
                    STA.b $00,x                 
                    DEX                         
                    BPL   CODE_12FA7F           
                    LDA.b #$12                  
                    XBA                         
                    LDA.b #$00                  
                    TCD                         
                    LDX.b #$03                  
CODE_12FA90:        LDA.l DATA_11BBB4,x             
                    STA.b $06,x                 
                    DEX                         
                    BPL   CODE_12FA90           
                    LDX.b #$49                  
CODE_12FA9B:        LDA.l DATA_11CD61,x             
                    STA.b $0B,x                 
                    DEX                         
                    BPL   CODE_12FA9B           
                    REP   #$20                  
                    LDX.b #$0C                  
CODE_12FAA8:        LDA.l DATA_11BBB8,x             
                    STA.b $68,x                 
                    DEX                         
                    BPL   CODE_12FAA8           
                    SEP   #$20                  
                    PLD                         
                    LDX.b #$6C                  
CODE_12FAB6:        LDA.l DATA_11CDD3,x             
                    STA.w $144E,x               
                    DEX                         
                    BPL   CODE_12FAB6           
                    RTL
       
DATA_12FAC1:        db $03,$04,$05,$0D,$0F,$0F,$0F,$01

DATA_12FAC9:        db $01,$03,$03,$04,$03,$05,$06,$03
                      
CODE_12FAD1:        JSR.w CODE_12F263           
                    LDX.w $0533               ; \ Get index to object data...
                    LDA.l DATA_11D098,x         ;  | Per room, per level.
                    CLC                       ;  |
                    ADC.w $0534               ;  |
                    TAX                       ;  |
                    LDA.w DATA_11D0AD,x         ;  | Forms pointer ($D9).  
                    STA.b $D9                 ;  |
                    LDA.w DATA_11D17F,x         ;  |  
                    STA.b $DA                 ; /
                    LDY.b #$00                  
                    LDA.b ($D9),y               
                    ASL   A                     
                    LDA.b #$00                  
                    ROL   A                     
                    STA.b $EB                   
                    LDY.b #$02                  
                    LDA.b ($D9),y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0541                 
                    LDA.b ($D9),y               
                    AND.b #$03                  
                    STA.w $0544                 
                    LDA.b ($D9),y               
                    LSR   A                     
                    LSR   A                     
                    AND.b #$03                  
                    STA.w $0545                 
                    LDX.b #$08                  
CODE_12FB11:        LDA.w $0533                 
                    DEX                         
                    BMI   CODE_12FB77           
                    CMP.l DATA_12FAC1,x             
                    BNE   CODE_12FB11           
                    LDA.w $0534                 
                    CMP.l DATA_12FAC9,x             
                    BNE   CODE_12FB11           
                    LDY.b #$03                  
                    LDA.b ($D9),y               
                    LSR   A                     
                    AND.b #$1C                  
                    STA.w $0560                 
                    DEY                         
                    DEY                         
                    LDA.b ($D9),y               
                    AND.b #$1F                  
                    CMP.b #$1F                  
                    BEQ   CODE_12FB77           
                    STA.w $0543                 
                    STZ.b $E9                   
                    STZ.b $E5                   
                    STZ.b $E6                   
                    INY                         
                    INY                         
                    INY                         
                    LDA.b $EB                   
                    BNE   CODE_12FB74           
                    LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.w $0534                 
                    TAX                         
                    LDA.l DATA_15A400,x             
                    BEQ   CODE_12FB74           
                    CMP.b #$01                  
                    BNE   CODE_12FB66           
                    JSL.l CODE_159400           
                    BRA   CODE_12FB77          
 
CODE_12FB66:        DEC   A                     
                    DEC   A                     
                    STA.w $076B                 
                    JSR.w CODE_12FF94           
                    JSL.l CODE_159B05           
                    BRA   CODE_12FB77          
 
CODE_12FB74:        JSR.w CODE_12F71C           
CODE_12FB77:        JSR.w CODE_12FC41           
                    JSR.w CODE_12FCA1           
                    STZ.b $E9                   
                    STZ.b $E6                   
                    STZ.b $E5                   
                    STZ.b $04                   
                    JSR.w CODE_12FBA4           
                    RTL
                       
DATA_12FB89:        db $09,$0A,$0B,$13,$14,$1C,$1D,$05
                    db $03,$2B,$2D,$21,$26,$27,$22,$25
                    db $2A,$23,$24,$28,$50,$00,$01,$29
                    db $04,$02,$12

CODE_12FBA4:        LDY.b #$03
                    STY.b $04
CODE_12FBA8:        LDY.b $04
CODE_12FBAA:        INY                    
                    LDA.b ($D9),y               
                    CMP.b #$FF                  
                    BNE   CODE_12FBB2           
                    RTS
                       
CODE_12FBB2:        LDA.b ($D9),y               
                    AND.b #$0F                  
                    STA.b $E5                   
                    LDA.b ($D9),y               
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_12FBCB           
                    LDA.b $E5                   
                    STY.b $0F                   
                    JSR.w CODE_12F68C           
                    LDY.b $0F                   
                    BRA   CODE_12FBAA          
 
CODE_12FBCB:        JSR.w CODE_12F678           
                    INY                         
                    STY.b $04                   
                    LDX.b #$1A                  
                    LDA.b ($D9),y               
CODE_12FBD5:        CMP.l DATA_12FB89,x             
                    BEQ   CODE_12FBF6           
                    DEX                         
                    BPL   CODE_12FBD5           
                    AND.b #$F0                  
                    CMP.b #$50                  
                    BEQ   CODE_12FBF6           
                    CMP.b #$80                  
                    BEQ   CODE_12FBF6           
                    CMP.b #$30                  
                    BEQ   CODE_12FBF6           
                    CMP.b #$40                  
                    BEQ   CODE_12FBF6           
                    CMP.b #$A0                  
                    BEQ   CODE_12FBF6           
                    BRA   CODE_12FBA8  
         
CODE_12FBF6:        STY.b $04                   
                    JSR.w CODE_12F8A3           
                    LDA.b ($D9),y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $050F                 
                    CMP.b #$03                  
                    BCS   CODE_12FC22                   
                    PHA                         
                    LDA.b ($D9),y               
                    AND.b #$0F                  
                    STA.w $050F                 
                    PLA                         
                    BEQ   CODE_12FC38           
                    CMP.b #$01                  
                    BNE   CODE_12FC1C           
                    JSR.w CODE_12E4A4           
                    BRA   CODE_12FBA8           

CODE_12FC1C:        JSR.w CODE_12EBA8           
                    BRL   CODE_12FBA8           

CODE_12FC22:        LDA.b ($D9),y               
                    AND.b #$0F                  
                    STA.w $050E                 
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$03                  
                    STA.w $050F                 
                    JSR.w CODE_12E460           
                    BRL   CODE_12FBA8           

CODE_12FC38:        LDA.w $050F                 
                    JSR.w CODE_12E47F           
                    BRL   CODE_12FBA8           

CODE_12FC41:        LDA.w $0776                 
                    BNE   CODE_12FCA0           
                    LDX.b #$00                  
                    JSR.w CODE_12F8B0           
                    LDY.w $0541                 
                    REP   #$30                  
                    LDA.w #$00F0                
CODE_12FC53:        DEY                         
                    BMI   CODE_12FC5C           
                    CLC                         
                    ADC.w #$00F0                
                    BRA   CODE_12FC53      
     
CODE_12FC5C:        DEC   A                     
                    STA.w $02C9                 
                    TAY                         
                    SEP   #$20                  
CODE_12FC63:        LDA.b [$01],y               
                    CMP.b #$64                  
                    BNE   CODE_12FC9B           
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
                    BNE   CODE_12FC91           
                    LDA.w $0713                 
                    STA.b $01                   
                    LDA.w $0714                 
                    STA.b $02                   
                    LDA.b #$40                  
                    STA.b [$01],y               
CODE_12FC91:        LDA.w $0713                 
                    STA.b $01                   
                    LDA.w $0714                 
                    STA.b $02                   
CODE_12FC9B:        DEY                         
                    BPL   CODE_12FC63           
                    SEP   #$10                  
CODE_12FCA0:        RTS
                       
CODE_12FCA1:        LDX.b #$06                  
                    LDA.w $0533                 
CODE_12FCA6:        CMP.l DATA_11CF44,x             
                    BEQ   CODE_12FCB1           
                    DEX                         
                    BPL   CODE_12FCA6           
                    BRA   CODE_12FCEA      
     
CODE_12FCB1:        LDA.w $0534                 
                    CMP.l DATA_11CF4B,x             
                    BNE   CODE_12FCEA           
                    LDX.b #$00                  
                    JSR.w CODE_12F8B0           
                    REP   #$10                  
                    LDY.w $02C9                 
CODE_12FCC4:        LDA.b [$01],y               
                    CMP.b #$56                  
                    BNE   CODE_12FCCE           
                    LDA.b #$40                  
                    STA.b [$01],y               
CODE_12FCCE:        DEY                         
                    BPL   CODE_12FCC4           
                    SEP   #$10                  
                    LDA.w $0635                 
                    CMP.b #$06                  
                    BNE   CODE_12FCEA           
                    LDX.b #$59                  
                    STX.b $02                   
                    LDX.b #$98                  
                    STX.b $01                   
                    LDA.b #$B9                  
                    STA.b [$01]                 
                    LDY.b #$10                  
                    STA.b [$01],y               
CODE_12FCEA:        RTS
                       
DATA_12FCEB:        db $03,$0D,$0D,$0D,$11,$11             ; 2-1, 5-2, 5-2, 5-2, 6-3, 6-3.

DATA_12FCF1:        db $00,$02,$03,$04,$03,$04             ; First room, third room, fourth room, fifth room, fourth room, fifth room.
                
CODE_12FCF7:        JSR.w CODE_12F5EB
                    LDY.b #$00                    
                    LDA.b [$05],y                 
                    AND.b #$01                  
                    STA.w $02C3                 
                    LDA.b [$05],y               
                    AND.b #$02                  
                    STA.w $02C4                 
                    LDA.b [$05],y             ; \ Check if bit 2 from first byte is set...
                    AND.b #$04                ;  |
                    BEQ   CODE_12FD15         ;  |
                    LDA.b #$4F                ;  | If so, put up IRQ and the starry BG.
                    STA.w $024B               ; /
CODE_12FD15:        LDA.b [$05],y             ; \ Get bit 4...
                    AND.b #$10                ;  | Divide by 16...
                    LSR   A                   ;  |
                    LSR   A                   ;  |
                    LSR   A                   ;  |
                    LSR   A                   ;  |
                    STA.w $0772               ; / And store result into Layer 3 transparency flag.
                    LDA.b [$05],y             ; \ Enable Layer 3 background if applicable.
                    ROL   A                   ;  |
                    ROL   A                   ;  |
                    ROL   A                   ;  |
                    AND.b #$03                ;  |
                    STA.w $074E               ; /
                    LDA.b [$05],y               
                    AND.b #$08                  
                    STA.w $077C                 
                    LDA.b [$05],y               
                    AND.b #$20                  
                    STA.w $077F                 
                    STZ.b $E9                   
                    STZ.b $E6                   
                    STZ.b $04                   
                    STZ.w $0784                 
                    LDA.w $0533               ; \ If not in 4-2...
                    CMP.b #$0A                ;  |
                    BNE   CODE_12FD53         ;  | Branch.
                    LDA.w $0534               ;  | If in first room of 4-2...
                    BEQ   CODE_12FD60         ;  | Branch.
                    CMP.b #$04                ;  | If in fifth room of 4-2...
                    BEQ   CODE_12FD60         ;  | Branch.
                    BRA   CODE_12FD63         ; / Otherwise, branch further.
        
CODE_12FD53:        CMP.b #$0B                ; \ Check if in 4-3...
                    BNE   CODE_12FD63         ;  | If not, branch.
                    LDA.w $0534               ;  | Check if in first room..
                    BEQ   CODE_12FD60         ;  | If so, branch.
                    CMP.b #$06                ;  | If in second-sixth room...
                    BCC   CODE_12FD63         ; / Branch further.
CODE_12FD60:        INC.w $0784                 
CODE_12FD63:        STZ.w $0787                 
                    LDA.w $0533               ; \ Check if in 3-1.
                    CMP.b #$06                ;  |
                    BNE   CODE_12FD77         ;  | If not, branch.
                    LDA.w $0534               ;  | Check if in second room.
                    CMP.b #$01                ;  |
                    BNE   CODE_12FD77         ; / If not, branch.
                    INC.w $0787                 
CODE_12FD77:        STZ.w $0791                 
                    LDX.b #$05                  
CODE_12FD7C:        LDA.w $0533                 
                    CMP.l DATA_12FCEB,x             
                    BNE   CODE_12FD92           
                    LDA.w $0534                 
                    CMP.l DATA_12FCF1,x             
                    BNE   CODE_12FD92           
                    INC.w $0791                 
                    RTL
                       
CODE_12FD92:        DEX                         
                    BPL   CODE_12FD7C           
                    RTL
                       
CODE_12FD96:        JSR.w CODE_12F29A         ; Clear Layer 2 Map16 tables.
                    LDA.w $0534                 
                    PHA                         
                    LDX.w $0533                 
                    LDA.l DATA_11CF30,x             
                    STA.w $0534                 
CODE_12FDA7:        LDX.w $0533                 
                    LDA.l DATA_139E00,x             
                    CLC                         
                    ADC.w $0534                 
                    TAX                         
                    LDA.l DATA_139E16,x             
                    STA.b $05                   
                    LDA.l DATA_139EE8,x             
                    STA.b $06                   
                    LDA   DATA_139E15               
                    STA.b $07                   
                    STZ.b $E9                   
                    STZ.b $E6                   
                    STZ.b $E5                   
                    STZ.b $04                   
                    JSL.l CODE_139729           
                    DEC.w $0534                 
                    BPL   CODE_12FDA7           
                    PLA                         
                    STA.w $0534                 
                    RTL                         

CODE_12FDDB:        LDA.b $0D                   
                    BMI   CODE_12FDE3           
                    CMP.b #$10                  
                    BMI   CODE_12FE2F           
CODE_12FDE3:        REP   #$20                  
                    LDA.b $01                   
                    STA.w $02C9                 
                    SEP   #$20                  
                    LDA.b $0D                   
                    AND.b #$0F                  
                    BNE   CODE_12FDFE           
                    REP   #$20                  
                    LDA.b $01                   
                    SEC                         
                    SBC.w #$00E0                
                    STA.b $01                   
                    SEP   #$20                  
CODE_12FDFE:        LDA.b $0D                   
                    SEC                         
                    SBC.b #$11                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$A7                  
                    BEQ   CODE_12FE0E           
                    CMP.b #$40                  
                    BNE   CODE_12FE26           
CODE_12FE0E:        LDY.b $0D                   
                    DEY                         
                    LDX.b #$03                  
                    LDA.b [$01],y               
CODE_12FE15:        CMP.l DATA_11B735,x             
                    BEQ   CODE_12FE20           
                    DEX                         
                    BPL   CODE_12FE15           
                    BRA   CODE_12FE26     
      
CODE_12FE20:        LDA.l DATA_11B731,x             
                    STA.b [$01],y               
CODE_12FE26:        REP   #$20                  
                    LDA.w $02C9                 
                    STA.b $01                   
                    SEP   #$20                  
CODE_12FE2F:        RTS
                       
CODE_12FE30:        STA.w $02C5                 
                    JSR.w CODE_12FDDB           
                    LDA.b $0D                   
                    BMI   CODE_12FE3E           
                    CMP.b #$10                  
                    BMI   CODE_12FE7C           
CODE_12FE3E:        LDA.w $02C5                 
                    CMP.b #$A7                  
                    BEQ   CODE_12FE5D           
                    LDA.b $0D                   
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDX.b #$03                  
                    LDA.b [$01],y               
CODE_12FE4F:        CMP.l DATA_11B73D,x             
                    BEQ   CODE_12FE7C           
                    DEX                         
                    BPL   CODE_12FE4F           
                    CMP.w $02C5                 
                    BEQ   CODE_12FE7C           
CODE_12FE5D:        LDY.b $0D                   
                    DEY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12FE7C           
                    LDX.b #$03                  
                    LDA.w $02C5                 
CODE_12FE6B:        CMP.l $11B739,x             
                    BEQ   CODE_12FE76           
                    DEX                         
                    BPL   CODE_12FE6B           
                    BRA   CODE_12FE7C
           
CODE_12FE76:        LDA.l DATA_11B73D,x             
                    BRA   CODE_12FE7F
           
CODE_12FE7C:        LDA.w $02C5                 
CODE_12FE7F:        RTS
                       
CODE_12FE80:        STA.w $02C5                 
                    REP   #$20                  
                    LDA.b $01                   
                    STA.w $02C9                 
                    SEP   #$20                  
                    LDA.b $0D                   
                    AND.b #$0F                  
                    BNE   CODE_12FE9E           
                    REP   #$20                  
                    LDA.b $01                   
                    SEC                         
                    SBC.w #$00E0                
                    STA.b $01                   
                    SEP   #$20                  
CODE_12FE9E:        LDX.b #$03                  
                    LDY.b $0D                   
                    DEY                         
                    LDA.b [$01],y               
CODE_12FEA5:        CMP.l DATA_11B735,x             
                    BEQ   CODE_12FEB0           
                    DEX                         
                    BPL   CODE_12FEA5           
                    BRA   CODE_12FEB6
           
CODE_12FEB0:        LDA.l DATA_11B731,x             
                    STA.b [$01],y               
CODE_12FEB6:        REP   #$20                  
                    LDA.w $02C9                 
                    STA.b $01                   
                    SEP   #$20                  
                    LDA.w $02C5                 
                    CMP.b #$A7                  
                    BNE   CODE_12FECA           
                    LDA.b #$3A                  
                    BRA   CODE_12FEEF
           
CODE_12FECA:        LDA.b $0D                   
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$40                  
                    BNE   CODE_12FEEC           
                    LDX.b #$03                  
                    LDA.w $02C5                 
CODE_12FEDB:        CMP.l $11B731,x             
                    BEQ   CODE_12FEE6           
                    DEX                         
                    BPL   CODE_12FEDB           
                    BRA   CODE_12FEEC
           
CODE_12FEE6:        LDA.l DATA_11B735,x             
                    BRA   CODE_12FEEF           

CODE_12FEEC:        LDA.w $02C5                 
CODE_12FEEF:        RTS
                       
CODE_12FEF0:        STA.w $02C5                 
                    LDY.b #$00                  
                    LDX.b #$07                  
CODE_12FEF7:        LDA.w $02C5                 
                    CMP.l $11CF12,x             
                    BNE   CODE_12FF12           
                    LDA.w $0533                 
                    CMP.l $11CF1A,x             
                    BNE   CODE_12FF12           
                    LDA.w $0534                 
                    CMP.l $11CF22,x             
                    BEQ   CODE_12FF16           
CODE_12FF12:        DEX                         
                    BPL   CODE_12FEF7           
                    INY                         
CODE_12FF16:        LDA.w $02C5                 
                    RTS
                       
CODE_12FF1A:        JSL.l CODE_15A244           
                    JSL.l CODE_159EB9           
                    JSL.l CODE_15993E           
                    JSL.l CODE_15A1F9           
                    RTL
                       
CODE_12FF2B:        LDX.w $0533                 
                    CPX.b #$0B                  
                    BNE   CODE_12FF4A           
                    LDX.w $0534                 
                    CPX.b #$01                  
                    BNE   CODE_12FF4A           
                    LDX.b #$02                  
CODE_12FF3B:        CMP.l $11CF2A,x             
                    BNE   CODE_12FF47           
                    LDA.l DATA_11CF2D,x             
                    BRA   CODE_12FF4A           

CODE_12FF47:        DEX                         
                    BPL   CODE_12FF3B           
CODE_12FF4A:        RTS
                       
                    db $03,$0D

                    db $04,$04
                
CODE_12FF4F:        LDX.b #$01                  
CODE_12FF51:        LDA.w $0533                 
                    CMP.l $12FF4B,x             
                    BNE   CODE_12FF63           
                    LDA.w $0534                 
                    CMP.l $12FF4D,x             
                    BEQ   CODE_12FF67           
CODE_12FF63:        DEX                         
                    BPL   CODE_12FF51           
                    RTS
                       
CODE_12FF67:        REP   #$20                  
                    LDA   DATA_14BF80               
                    STA.w $04BC                 
                    LDX.b #$00                  
CODE_12FF72:        LDA.l DATA_14BF80,x             
                    STA.w $0B00,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_12FF72           
                    SEP   #$20                  
                    RTS
                       
CODE_12FF82:        LDX.b #$0A                  
                    LDA.w DATA_11AAF0,x               
                    STA.b $C4                   
                    LDA.w DATA_11AAFB,x               
                    STA.b $C5                   
                    LDA.w DATA_11AB06,x               
                    STA.b $C6                   
                    RTS
                       
CODE_12FF94:        LDX.w $0534                 
                    LDA.l DATA_11AB11,x             
                    CLC                         
                    ADC.w DATA_11AAFB                 
                    STA.b $C5                   
                    LDA.w DATA_11AAF0                 
                    STA.b $C4                   
                    LDA.w DATA_11AB06                 
                    STA.b $C6                   
                    RTS
                       
CODE_12FFAC:        PHB                         
                    LDA.b #$7E                  
                    PHA                         
                    PLB                         
                    REP   #$20                  
                    LDX.b #$FE                  
CODE_12FFB5:        STZ.w $9960,x               
                    DEX                         
                    DEX                         
                    CPX.b #$FE                  
                    BNE   CODE_12FFB5           
                    SEP   #$20                  
                    PLB                         
                    RTS
                       
CODE_12FFC2:        CMP.b #$B0                  
                    BNE   CODE_12FFF1           
                    LDX.w $0533                 
                    CPX.b #$02                  
                    BEQ   CODE_12FFD9           
                    CPX.b #$08                  
                    BEQ   CODE_12FFD9           
                    CPX.b #$0B                  
                    BEQ   CODE_12FFD9           
                    CPX.b #$11                  
                    BNE   CODE_12FFF1           
CODE_12FFD9:        LDX.b $EB                   
                    BNE   CODE_12FFEF           
                    LDA.b $0D                   
                    AND.b #$0F                  
                    BNE   CODE_12FFE7           
                    LDA.b #$3F                  
                    BRA   CODE_12FFF1           

CODE_12FFE7:        CMP.b #$0F                  
                    BNE   CODE_12FFEF           
                    LDA.b #$76                  
                    BRA   CODE_12FFF1
           
CODE_12FFEF:        LDA.b #$3E                  
CODE_12FFF1:        RTS
