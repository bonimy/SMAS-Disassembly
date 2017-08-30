; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $118000
    fillbyte $FF : fill $8000

ORG $118000
CODE_118000:        JMP.w CODE_11803C

CODE_118003:        JMP.w CODE_1191C2           

CODE_118006:        JMP.w CODE_11956C           

CODE_118009:        STZ.w $023A               ; No HDMA enable.
                    LDA.b #$80                ; Force blank
                    BRA   CODE_118012         ; Jump to $118012.
           
CODE_118010:        LDA.b #$0F                ; Full brightness.
CODE_118012:        STA.b $FE                 ; $FE = $2100 mirror.
CODE_118014:        LDA.b $11                 ; \ $11 = Image upload
                    ASL   A                   ;  | Multiply by 2...
                    CLC                       ;  | ... add with $11...
                    ADC.b $11                 ;  | (Result = Multiply by 3)
                    TAX                       ; / Into X.
                    LDA.w PNTR_11C1D0,x       ; \ Get low byte of image.
                    STA.b $F0                 ; / <-- $F0 (Low byte of image pointer)
                    LDA.w PNTR_11C1D0+1,x     ; \ Get middle byte of image.
                    STA.b $F1                 ; / <-- $F1 (Middle byte of image pointer)
                    LDA.w PNTR_11C1D0+2,x     ; \ Get high byte of image.
                    STA.b $F2                 ; / <-- $F2 (High byte of image pointer)
                    STZ.w $0154                 
CODE_11802D:        LDA.w $0154                 
                    BPL   CODE_11802D           
                    JSL.l CODE_14FA99           
                    CLI                       ; Clear interrupt disable flag.
                    RTL                       ; Return.

CODE_118038:        JML.l CODE_009641         ; ROM is pirated.

CODE_11803C:        NOP                       ; \ Two useless bytes...
                    NOP                       ; /
                    LDA.b #$AA                ; \ Anti-piracy check.
                    STA.l $702000             ;  |
                    CMP.l $700000             ;  |
                    BNE   CODE_118038         ;  | Prevents SRAM from being expanded.
                    LDA.b #$55                ;  |
                    STA.l $702000             ;  |
                    CMP.l $700000             ;  |
                    BNE   CODE_118038         ; /
                    SEI                       ; Set interrupt disable
                    STZ.w $4200               ; NMI disabled, IRQ disabled, Auto-Joypad Read disabled.
                    STZ.w $420C               ; No HDMA
                    STZ.w $420B               ; No DMA.
                    STZ.w $2140               ; \ Clear SPC ports.
                    STZ.w $2141               ;  |
                    STZ.w $2142               ;  |
                    STZ.w $2143               ; /
                    LDA.b #$80                ; \ Force blank.
                    STA.w $2100               ; /
                    PHK                       ; \ PBR into DBR.
                    PLB                       ; /
                    CLC                       ; Clear carry.
                    PHD                       ; Preserve DP register.
                    LDA.b #$21                ; \ New DP = $2100
                    XBA                       ;  |
                    LDA.b #$00                ;  |
                    TCD                       ; /
                    LDA.b #$03                ; \ Character data = $C000-$FFFF for sprites.
                    STA.b $01                 ; /
                    LDA.b #$01                ; \ BG Mode = 01
                    STA.b $05                 ; / <-- $2105
                    STA.w $0775               ; $0775 = $2105 mirror.
                    STZ.b $06                   
                    LDA.b #$03                ; \ Tilemap Layer 1 = $0000-$1FFF.
                    STA.b $07                 ;  |
                    STA.w $024C               ; /
                    LDA.b #$13                ; \ Tilemap Layer 2 = $2000-$3FFF.
                    STA.b $08                 ; /
                    LDA.b #$4B                ; \ Tilemap Layer 3 = $9000-$9FFF.
                    STA.b $09                 ; /
                    STZ.b $0A                 ; No tilemap Layer 4.
                    LDA.b #$22                ; \ Character data = $4000-$8FFF for Layers 1 and 2.
                    STA.b $0B                 ; /
                    LDA.b #$05                ; \ Character data = $A000-$BFFF for Layer 3, no character data Layer 4.
                    STA.b $0C                 ; /
                    LDA.b #$13                ; \ Layers 1, 2 and object layer on main screen designation.
                    STA.b $2C                 ;  |
                    STA.w $0243               ; /
                    STZ.b $2D                 ; None on subscreen designation.
                    STZ.b $2E                   
                    STZ.b $2F                   
                    STZ.b $23                   
                    STZ.b $24                   
                    STZ.b $25                   
                    STZ.b $30                 ; Color addition select = #$00.
                    STZ.b $31                 ; CGADSUB = #$00 ($2131).
                    LDA.b #$E0                ; \ No intensity for fixed colour data ($2132)
                    STA.b $32                 ; /
                    STZ.b $33                   
                    STZ.w $0235                 
                    STZ.w $0236                 
                    STZ.w $0237                 
                    STZ.w $0238               ; Color addition select mirror = #$00.
                    STZ.w $0239               ; CGADSUB mirror = #$00.
                    STZ.w $023A               ; HDMA Enable mirror = #$00.
                    STZ.w $023B                 
                    STZ.w $023C                 
                    LDA.b #$20                ; \ No intensity for red colour.
                    STA.w $023D               ; / <-- $023D (One of three mirrors for $2132)
                    LDA.b #$40                ; \ No intensity for green colour.
                    STA.w $023E               ; / <-- $023E (One of three mirrors for $2132)
                    LDA.b #$80                ; \ No intensity for blue colour.
                    STA.w $023F               ; / <-- $023F (One of three mirrors for $2132)
                    PLD                       ; Get old DP register back.
                    LDA.b #$FF                ; \ No upload through VRAM tables.
                    STA.w $0302               ;  |
                    STA.l $7F0002             ;  |
                    STA.l $7F0802             ; /
                    STZ.w $024B               ; V-Count mirror = #$00.
                    STZ.w $1DE8                 
                    STZ.w $1DE9                 
                    STZ.w $1DEE                 
                    STZ.w $1DEF                 
                    STZ.w $1DEA                 
                    STZ.w $1DEB                 
                    STA.w $1DED                 
                    LDA.b #$01                  
                    STA.w $1DEC                 
                    LDA.b #$00                  
                    STA.w $06BF                 
                    STA.w $0217                 
                    STA.w $0722                 
                    STA.w $0D0B                 
                    JSL.l CODE_14D78D           
                    LDA.l $7FFB00             ; \ $7FFB00...
                    STA.w $0635               ; / into World number.
                    ASL   A                   ; \ 
                    CLC                       ;  | *3
                    ADC.l $7FFB00             ;  |
                    CLC                       ;  | Add $7FFB01 to it...
                    ADC.l $7FFB01             ;  | (preserved level num?)
                    STA.w $0533               ; / Into accumulative level number.
                    DEC   A                   ; $0533 - 1...
                    STA.w $04E8               ; Into $04E8 (level number after death?)
                    LDA.l $7FFB02             ; \ Get preserved live count?
                    STA.w $04EE               ; / Into live counter.
                    LDX.b #$03                  
CODE_118144:        LDA.l $7FFB03,x             
                    STA.w $062D,x               
                    DEX                         
                    BPL   CODE_118144           
                    LDA.w $0533                 
                    STA.w $04E8                 
                    JSL.l CODE_0086B5           
                    JSL.l CODE_128F48           
                    INC.w $06BF                 
                    LDA.b #$02                  
                    STA.w $059E                 
                    LDA.b #$FF                  
                    STA.w $02E6                 
                    BRA   CODE_11817F
           
CODE_11816B:        LDA.b #$05                ; \ Amount of lives...
                    STA.w $04EE               ; / after Game Over.
                    BRA   CODE_11817F
           
CODE_118172:        LDX.w $0635               ; \ Get world number into index...
                    LDA.l DATA_11C9B4,x         ;  | Get accumulative level number of x-1, where x = world number.
                    STA.w $0533               ;  | Store into accumulative level number.
                    STA.w $04E8               ; / And here.
CODE_11817F:        STZ.w $0217                 
                    JSR.w CODE_118927           
                    JSR.w CODE_11883A           
                    JSR.w CODE_1188C5           
                    LDA.b #$FF                  
                    STA.w $0547                 
                    BRA   CODE_1181A8
           
CODE_118192:        STZ.w $0217                 
                    JSR.w CODE_118927           
                    JSR.w CODE_1188C5           
                    BRA   CODE_1181A8
           
                    STZ.w $0217                 
                    LDA.b #$80                  
                    STA.w $1DE2                 
                    JSR.w CODE_11885E           
CODE_1181A8:        LDA.b $FE                 ; \ Check if force blank...
                    AND.b #$80                ;  | <--
                    BNE   CODE_1181B5         ; / If on, branch.
                    JSR.w CODE_118AD2           
                    JSL.l CODE_118009           
CODE_1181B5:        LDA.b #$B0                  
                    ORA.w $0201                 
                    LDY.b $EB                 ; \ If horizontal level...
                    BNE   CODE_1181C3         ; / ...branch, do not run the following two lines.
                    AND.b #$FE                  
                    ORA.w $0207                 
CODE_1181C3:        STA.b $FF                   
                    STZ.w $4200                 
                    PHA                         
                    LDA.w $02B8                 
                    BNE   CODE_1181D2           
                    JSL.l CODE_14E35A           
CODE_1181D2:        LDA.w $079C                 
                    BEQ   CODE_1181E0           
                    LDA.w $079D                 
                    STA.w $0500                 
                    STZ.w $079C                 
CODE_1181E0:        STZ.w $02B8                 
                    STZ.w $0776                 
                    STZ.w $078A                 
                    STZ.w $0779                 
                    STZ.w $0778                 
                    LDA.b #$80                  
                    STA.w $0100                 
                    STA.w $0217                 
                    JSL.l CODE_13873D         ; \ Load tiles 200-27F (FG/BG slots).
                    JSL.l CODE_1385DA         ;  | Load tiles C0-1FF (FG/BG slots).
                    JSL.l CODE_14E3DE         ;  | Get sprite data per room into buffer at $1B00.
                    JSL.l CODE_14F64A         ;  | Clear Layer 3 tilemap.
                    JSL.l CODE_12FAD1         ;  |
                    JSL.l CODE_12FCF7         ;  |
                    JSL.l CODE_12FF1A         ;  |
                    JSL.l CODE_14F500         ; /
                    LDA.w $0772               ; \ If $0772 is any non-zero value...
                    BEQ   CODE_118220         ;  |
                    LDA.b #$09                ;  | Make Layer 3 have full priority.
                    BRA   CODE_118222         ; /
           
CODE_118220:        LDA.b #$01                ; \ BG Mode 1.
CODE_118222:        STA.w $0775               ; / No Layer 3 priority.
                    JSL.l CODE_12F2EF           
                    JSL.l CODE_14D0F2           
                    JSL.l CODE_138780           
                    JSL.l CODE_14F9F0         ; Clear all OAM.       
                    JSL.l CODE_14F9A0           
                    PLA                         
                    AND.b #$80                  
                    ORA.b #$01                  
                    STA.w $4200                 
                    JSL.l CODE_118014           
                    JSR.w CODE_118834           
                    LDA.b #$B0                  
                    STA.b $FF                   
                    JSL.l CODE_1389A3           
                    LDA.b $EB                   
                    BNE   CODE_118257           
                    BRL   CODE_118329
           
CODE_118257:        STZ.w $420C                 
                    STZ.w $4200                 
                    JSR.w CODE_1193F5           
                    JSR.w CODE_11945A           
                    JSL.l CODE_158419           
                    LDA.b #$00                  
                    STA.w $0300                 
                    STA.w $0301                 
                    STA.l $7F0000               
                    STA.l $7F0001               
                    STA.l $7F0800               
                    STA.l $7F0801               
                    DEC   A                     
                    STA.w $0302                 
                    STA.l $7F0002               
                    STA.l $7F0802               
                    JSL.l CODE_14ED60           
                    JSL.l CODE_13F000           
                    JSL.l CODE_158000           
                    JSL.l CODE_14E32E           
                    LDA.b $13                   
                    BEQ   CODE_118257           
                    LDA.b #$81                  
                    STA.w $4200                 
                    STZ.b $13                   
                    STZ.w $04ED               ; Don't go to a special screen.                 
                    STZ.w $02AB                 
                    STZ.w $0724                 
                    LDA.w $024B               ; \ If IRQ V-counter is 00...
                    BEQ   CODE_1182C1         ; / Branch.
                    LDA.b #$18                ; \ Load starry BG.
                    STA.b $11                 ; /
                    LDA.w $0533               ; \ If level 5-2...
                    CMP.b #$0D                ;  | Use a different starry BG (different palette)
                    BNE   CODE_1182C1         ;  |
                    INC.b $11                 ; / <--
CODE_1182C1:        JSL.l CODE_13FC89         ; HDMA BG handler.
                    INC.w $0D13                 
                    JSR.w CODE_118AFE           
                    STZ.w $0D13                 
CODE_1182CE:        JSL.l CODE_118014           
                    LDA.l $700007               
                    BEQ   CODE_1182EE           
                    LDA.b $FC                   
                    AND.b #$20                  
                    BEQ   CODE_1182E1           
                    INC.w $021D                 
CODE_1182E1:        LDA.b $FC                   
                    AND.b #$10                  
                    BNE   CODE_1182EE           
                    LDA.w $021D                 
                    AND.b #$01                  
                    BNE   CODE_11830F           
CODE_1182EE:        LDA.b $FA                   
                    AND.b #$10                  
                    BEQ   CODE_1182F7           
                    JMP.w CODE_11846B
           
CODE_1182F7:        LDA.w $0628                 
                    BEQ   CODE_1182FF           
                    JMP.w CODE_1185A0
           
CODE_1182FF:        JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_14DF1F           
                    LDY.w $04ED                 
                    BEQ   CODE_11830F           
                    JMP.w CODE_118B31
           
CODE_11830F:        LDA.w $0627                 
                    BEQ   CODE_1182CE           
                    JSR.w CODE_118AD2           
                    JSL.l CODE_14E30F           
                    JSL.l CODE_14E02E           
                    STZ.w $0627                 
                    JSL.l CODE_118009           
                    JMP.w CODE_1181B5
           
CODE_118329:        STZ.w $420C               ; HDMA channels off.
                    STZ.w $4200               ; No NMI/IRQ.
                    JSR.w CODE_1193F5           
                    JSR.w CODE_11945A           
                    JSL.l CODE_158419           
                    LDA.b #$00                  
                    STA.w $0300                 
                    STA.w $0301                 
                    STA.l $7F0000               
                    STA.l $7F0001               
                    STA.l $7F0800               
                    STA.l $7F0801               
                    DEC   A                     
                    STA.w $0302                 
                    STA.l $7F0002               
                    STA.l $7F0802               
                    JSL.l CODE_14E6B0           
                    JSL.l CODE_13F500           
                    JSL.l CODE_158500           
                    JSL.l CODE_14E32E           
                    LDA.b $13                   
                    BEQ   CODE_118329           
                    LDA.b #$81                  
                    STA.w $4200                 
                    STZ.b $13                   
                    STZ.w $04ED                 
                    STZ.w $02AB                 
                    STZ.w $0724                 
                    STZ.w $0206                 
                    LDA.b #$01                  
                    STA.w $0207                 
                    LDA.w $04EF                 
                    CMP.b #$02                  
                    BNE   CODE_11839A           
                    STZ.w $0D09                 
                    LDA.b #$00                  
                    STA.b $50                   
                    JSR.w CODE_11876D           
CODE_11839A:        LDA.w $02C3                 
                    BNE   CODE_1183B0           
                    LDA.w $0535                 
                    AND.b #$01                  
                    BEQ   CODE_1183B0           
                    LDA.b #$F8                  
                    STA.w $0208                 
                    STZ.w $0209                 
                    BRA   CODE_1183B8
           
CODE_1183B0:        STZ.w $0208                 
                    LDA.b #$01                  
                    STA.w $0209                 
CODE_1183B8:        LDA.w $0772                 
                    BNE   CODE_1183CE           
                    LDA.w $0535                 
                    AND.b #$01                  
                    BEQ   CODE_1183CE           
                    LDA.b #$F8                  
                    STA.w $020A                 
                    STZ.w $020B                 
                    BRA   CODE_1183D6
           
CODE_1183CE:        STZ.w $020A                 
                    LDA.b #$01                  
                    STA.w $020B                 
CODE_1183D6:        JSL.l CODE_13FC89           
                    JSL.l CODE_14D874           
                    INC.w $0D13                 
                    JSR.w CODE_118AFE           
                    STZ.w $0D13                 
CODE_1183E7:        JSL.l CODE_118014           
                    LDA.l $700007               
                    BEQ   CODE_118407           
                    LDA.b $FC                   
                    AND.b #$20                  
                    BEQ   CODE_1183FA           
                    INC.w $021D                 
CODE_1183FA:        LDA.b $FC                   
                    AND.b #$10                  
                    BNE   CODE_118407           
                    LDA.w $021D                 
                    AND.b #$01                  
                    BNE   CODE_118421           
CODE_118407:        LDA.b $FA                   
                    AND.b #$10                  
                    BNE   CODE_11846B           
CODE_11840D:        JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_14DFCB           
                    JSL.l CODE_14D8A2           
                    LDY.w $04ED                 
                    BEQ   CODE_118421           
                    JMP.w CODE_118B31
           
CODE_118421:        LDA.w $0627                 
                    BEQ   CODE_1183E7           
                    JSR.w CODE_118AD2           
                    LDA.w $04EF                 
                    CMP.b #$02                  
                    BNE   CODE_118446           
                    LDA.b #$20                  
                    STA.w $0239                 
                    STZ.w $0235                 
                    STZ.w $0236                 
                    STZ.w $0237                 
                    LDA.b #$05                  
                    STA.b $50                   
                    LDA.b #$04                  
                    STA.b $C7                   
CODE_118446:        STZ.w $04EF                 
                    STZ.w $078C                 
                    JSL.l CODE_14E30F           
                    JSL.l CODE_14E02E           
                    LDA.w $0627                 
                    CMP.b #$02                  
                    BNE   CODE_11845E           
                    INC.w $02B8                 
CODE_11845E:        STZ.w $0627                 
                    STZ.w $0D0B                 
                    JSL.l CODE_118009           
                    JMP.w CODE_1181B5
           
CODE_11846B:        LDA.w $2142                 
                    CMP.b #$0B                  
                    BEQ   CODE_118492           
                    LDA.b $D8                   
                    AND.b #$04                  
                    BNE   CODE_118492           
                    LDA.w $04EF                 
                    BNE   CODE_118492           
                    LDA.b $50                   
                    CMP.b #$07                  
                    BEQ   CODE_118492           
                    LDA.w $04C8                 
                    BNE   CODE_118492           
                    LDA.w $04B4                 
                    BNE   CODE_118492           
                    LDA.w $041B                 
                    BEQ   CODE_11849C           
CODE_118492:        LDA.b $EB                   
                    BEQ   CODE_118499           
                    JMP.w CODE_1182F7
           
CODE_118499:        JMP.w CODE_11840D
           
CODE_11849C:        STZ.w $0D0B                 
                    STZ.w $078E                 
                    JSL.l CODE_138FD5           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_13FB47           
                    JSL.l CODE_138E3B           
                    STZ.w $0231                 
                    INC.w $0722                 
                    LDA.b #$F1                  
                    STA.w $1DE2                 
                    LDA.b #$43                  
                    STA.w $1DE0                 
                    LDA.w $0775                 
                    STA.w $0774                 
                    LDA.b #$01                  
                    STA.w $0775                 
CODE_1184CD:        JSL.l CODE_118014           
                    JSL.l CODE_14D269           
                    JSL.l CODE_138EEB           
                    LDA.w $0232                 
                    BEQ   CODE_1184CD           
                    LDA.b #$10                  
                    STA.w $0210                 
                    STZ.w $0211                 
                    LDA.b #$04                  
                    STA.w $022B                 
CODE_1184EB:        JSL.l CODE_118014           
                    JSL.l CODE_138EEB           
                    LDA.b $F8                   
                    CMP.b #$30                  
                    BNE   CODE_118505           
                    LDA.b $FA                   
                    AND.b #$20                  
                    BEQ   CODE_118505           
                    JSL.l CODE_14E39F           
                    BRA   CODE_11852C
           
CODE_118505:        JSL.l CODE_14DAB8           
                    JSL.l CODE_14D2FA           
                    LDA.b $FA                   
                    AND.b #$10                  
                    BNE   CODE_118523           
                    DEC.w $0210                 
                    BPL   CODE_1184EB           
                    LDA.b #$10                  
                    STA.w $0210                 
                    INC.w $0211                 
                    JMP.w CODE_1184EB
           
CODE_118523:        JSL.l CODE_14DAF4           
                    LDA.b #$F2                  
                    STA.w $1DE2                 
CODE_11852C:        LDA.b #$01                  
                    STA.w $0231                 
                    STZ.w $0232                 
CODE_118534:        JSL.l CODE_118014           
                    JSL.l CODE_138EEB           
                    LDA.w $0232                 
                    BEQ   CODE_118534           
                    JSL.l CODE_14D0F2           
                    LDA.w $04EF                 
                    BEQ   CODE_118550           
                    JSL.l CODE_14D8EC           
                    BRA   CODE_118574           

CODE_118550:        LDY.w $0533                 
                    LDA   DATA_11D098,y               
                    CLC                         
                    ADC.w $0534                 
                    TAY                         
                    LDA   DATA_11CF52,y               
                    CMP.b #$FF                  
                    BNE   CODE_118566           
                    LDA.b #$00                  
                    BRA   CODE_118568           

CODE_118566:        LDA.b #$70                  
CODE_118568:        STA.w $023A                 
                    STZ.w $0235                 
                    STZ.w $0236                 
                    STZ.w $0237                 
CODE_118574:        JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_13FB47           
                    JSL.l CODE_118014           
                    JSL.l CODE_138FD5           
                    JSL.l CODE_14D874           
                    LDA.w $0774                 
                    STA.w $0775                 
                    LDA.w $0628                 
                    BEQ   CODE_118596           
                    BRL   CODE_11867C
           
CODE_118596:        LDA.b $EB                   
                    BNE   CODE_11859D           
                    JMP.w CODE_1183E7
           
CODE_11859D:        JMP.w CODE_1182CE
           
CODE_1185A0:        JSR.w CODE_118AD2           
                    STZ.w $023A                 
                    STZ.w $4200                 
                    STZ.w $025F                 
                    STZ.w $0773                 
                    JSL.l CODE_14F953           
                    STZ.w $0622                 
                    LDA.w $0628                 
                    CMP.b #$02                  
                    BEQ   CODE_1185DC           
                    JSR.w CODE_11876D           
                    JSL.l CODE_14E425           
                    JSL.l CODE_14E3DE           
                    JSL.l CODE_12F44F           
                    LDA.b #$06                  
                    STA.w $0546                 
                    JSL.l CODE_14E32E           
                    LDA.b #$01                  
                    STA.w $0776                 
                    BRA   CODE_118606           

CODE_1185DC:        JSL.l CODE_12F394           
                    LDA.w $079C                 
                    BEQ   CODE_1185EE           
                    LDA.w $079D                 
                    STA.w $0500                 
                    STZ.w $079C                 
CODE_1185EE:        LDA.b #$05                ; \ Potion room music.
                    STA.w $0546               ; /
                    JSL.l CODE_14E341           
                    JSL.l CODE_14E35A           
                    STZ.w $0244                 
                    LDA.b #$02                  
                    STA.w $0776                 
                    STZ.w $079B                 
CODE_118606:        JSL.l CODE_14F0F7           
                    JSL.l CODE_13F143           
                    JSL.l CODE_158141           
                    JSR.w CODE_1190DF           
CODE_118615:        JSL.l CODE_118014           
                    JSL.l CODE_14F19A           
                    LDA.w $0539                 
                    BEQ   CODE_118615           
                    STZ.w $4200                 
                    LDA.w $0628                 
                    CMP.b #$01                  
                    BNE   CODE_118646           
                    JSL.l CODE_138AAB           
                    JSL.l CODE_139D53           
                    JSL.l CODE_1385DA           
                    JSL.l CODE_14F666           
                    JSL.l CODE_13FC89           
                    STZ.w $0770                 
                    STZ.w $04AE                 
CODE_118646:        STZ.w $02B0                 
                    STZ.w $0736                 
                    STZ.b $3C                   
                    STZ.w $0407                 
                    STZ.w $0D09                 
                    LDA.w $0628                 
                    CMP.b #$02                  
                    BEQ   CODE_11866E           
                    JSL.l CODE_12F2EF           
                    JSL.l CODE_14D0F2           
                    INC.w $0D09                 
                    JSL.l CODE_14D874           
                    LDA.b #$00                  
                    STA.b $50                   
CODE_11866E:        INC.w $0D13                 
                    LDA.b #$81                  
                    STA.w $4200                 
                    JSR.w CODE_118AFE           
                    STZ.w $0D13                 
CODE_11867C:        JSL.l CODE_118014           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_14DEBC           
                    LDY.w $04ED                 
                    BEQ   CODE_118690           
                    JMP.w CODE_118B31
           
CODE_118690:        LDA.w $0628                 
                    BNE   CODE_11867C           
                    LDA.w $0622                 
                    BEQ   CODE_11869D           
                    INC.w $0621                 
CODE_11869D:        LDA.w $051B                 
                    STA.w $0534                 
                    JSR.w CODE_118AD2           
                    LDA.w $04EF                 
                    BEQ   CODE_1186B1           
                    JSL.l CODE_14E35A           
                    BRA   CODE_1186B5           

CODE_1186B1:        JSL.l CODE_14D965           
CODE_1186B5:        STZ.w $0D0B                 
                    JSL.l CODE_118009           
                    JSL.l CODE_1385DA           
                    JSL.l CODE_12F2EF           
                    JSL.l CODE_14D0F2           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    STZ.w $04AE                 
                    LDA.w $0D09                 
                    BEQ   CODE_1186EB           
                    STZ.w $0D09                 
                    LDA.b #$05                  
                    STA.b $50                   
                    LDA.b #$04                  
                    STA.b $C7                   
                    STZ.w $04EF                 
                    STZ.w $078C                 
                    STZ.w $04BC                 
                    STZ.w $04BD                 
CODE_1186EB:        LDY.w $0546                 
                    STY.w $0547                 
                    JSL.l CODE_14E32E           
                    STZ.b $3C                   
                    STZ.w $0407                 
                    STZ.w $020B                 
                    LDA.w $0776                 
                    CMP.b #$02                  
                    BEQ   CODE_118708           
                    JSL.l CODE_12FAD1         ; Handle 'simple' objects (such as vegetables). Obj -> M16.
CODE_118708:        JSL.l CODE_12FCF7           
                    JSL.l CODE_12FF1A           
                    JSL.l CODE_14F139           
                    JSL.l CODE_13F184           
                    JSL.l CODE_158182           
                    STZ.w $0776                 
CODE_11871F:        JSL.l CODE_118014           
                    JSL.l CODE_14F19A           
                    JSL.l CODE_13F1BF           
                    JSL.l CODE_1581BD           
                    LDA.w $0539                 
                    BEQ   CODE_11871F           
                    LDA.w $0772                 
                    BEQ   CODE_11873D           
                    LDA.b #$64                  
                    BRA   CODE_11873F           

CODE_11873D:        LDA.b #$20                ; \ Colour layer affects backdrop.
CODE_11873F:        STA.w $0239               ; / (CGADSUB)
                    LDA.w $024B               ; \ If IRQ V-counter is 00, branch.
                    BEQ   CODE_118754         ; /
                    LDA.b #$18                ; \ Load starry BG image.
                    STA.b $11                 ; /
                    LDA.w $0533               ; \ Check if in 5-2.
                    CMP.b #$0D                ;  |
                    BNE   CODE_118754         ;  |
                    INC.b $11                 ; / If so, load starry BG with a different palette.
CODE_118754:        JSL.l CODE_13FC89         ; HDMA Handler.
                    INC.w $0D13                 
                    STZ.w $0235                 
                    STZ.w $0236                 
                    STZ.w $0237                 
                    JSR.w CODE_118AFE           
                    STZ.w $0D13                 
                    JMP.w CODE_1182CE
           
CODE_11876D:        LDX.b #$08                  
CODE_11876F:        STZ.w $042F,x               
                    DEX                         
                    BPL   CODE_11876F           
                    RTS
                       
CODE_118776:        STY.b $0D                   
                    PLY                         
                    STY.b $0A                   
                    REP   #$30                  
                    AND.w #$00FF                
                    ASL   A                     
                    TAY                         
                    PLA                         
                    STA.b $0B                   
                    INY                         
                    LDA.b [$0A],y               
                    STA.b $0A                   
                    SEP   #$30                  
                    LDY.b $0D                   
                    JML.w [$000A]
               
CODE_118791:        JSR.w CODE_1190DF           
                    JSL.l CODE_118009           
                    JSL.l CODE_118014           
                    JSL.l CODE_14F9A0           
                    RTS
                       
                    JSR.w CODE_1190DF           
                    JSL.l CODE_118009           
                    LDA.b #$40                  
                    STA.w $0100                 
                    LDA.b #$03                  
                    STA.b $11                   
                    JSL.l CODE_118014           
                    RTS
                       
CODE_1187B6:        TXA                         
                    INC   A                     
                    ORA.b #$80                  
                    STA.w $118E                 
                    LDA.b #$0C                  
                    STA.w $118F                 
                    LDY.w $04EE                 
                    TYA                         
                    JSR.w CODE_11917F           
                    STY.w $11B4                 
                    STA.w $11B6                 
                    LDA.b #$0C                  
                    STA.w $11B7                 
                    TAX                         
                    CPY.b #$BF                  
                    BNE   CODE_1187DB           
                    LDX.b #$00                  
CODE_1187DB:        STA.w $11B5                 
                    LDY.b #$0C                  
CODE_1187E0:        LDA.b #$BF                  
                    STA.w $116C,y               
                    LDA.b #$00                  
                    STA.w $116D,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_1187E0           
                    LDX.w $0635                 
                    LDA.w $0533                 
                    SEC                         
                    SBC   DATA_11C9B4,x             
                    STA.w $0629                 
                    CLC                         
                    ADC.b #$81                  
                    STA.w $1192                 
                    LDA.b #$0C                  
                    STA.w $1193                 
                    LDA.l DATA_11C9B4+1,x             
                    SEC                         
                    SBC   DATA_11C9B4,x             
                    STA.b $03                   
                    LDX.b #$00                  
                    TXY                         
CODE_118815:        LDA.b #$EB                  
                    CPX.w $0629                 
                    BNE   CODE_11881E           
                    LDA.b #$EC                  
CODE_11881E:        STA.w $116C,y               
                    LDA.b #$1C                  
                    STA.w $116D,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.b $03                   
                    BCC   CODE_118815           
                    LDA.b #$08                  
                    STA.b $11                   
                    RTL
                       
CODE_118834:        LDA.b #$C0                  
                    STA.w $0100                 
                    RTS
                       
CODE_11883A:        STZ.w $0534                 
                    STZ.w $04E9                 
                    STZ.w $0535                 
                    STZ.w $04EA                 
                    STZ.w $0536                 
                    STZ.w $04EB                 
                    STZ.b $50                   
                    STZ.w $04E7                 
                    STZ.w $0628                 
                    STZ.w $04EF                 
                    STZ.w $0500                 
                    STZ.w $06C2                 
                    RTS
                       
CODE_11885E:        LDA.b $FE                   
                    AND.b #$80                  
                    BNE   CODE_11886B           
                    JSR.w CODE_118AD2           
                    JSL.l CODE_118009           
CODE_11886B:        JSR.w CODE_1190A2           
                    JSL.l CODE_138936           
                    JSL.l CODE_14D194           
                    JSL.l CODE_12FA10           
                    JSL.l CODE_14F953           
                    JSR.w CODE_1190DF           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_13DCF6           
                    JSL.l CODE_14D856           
                    JSL.l CODE_118014           
                    LDX.w $0635                 
                    LDY.w $0533                 
                    JSL.l CODE_1187B6           
                    JSL.l CODE_118014           
                    LDA.b #$01                  
                    STA.w $0243                 
                    JSL.l CODE_14F92E           
                    LDA.b #$01                  
                    STA.w $0201                 
                    STA.w $0203                 
                    INC.w $0217                 
                    STZ.w $2111                 
                    STZ.w $2111                 
                    STZ.w $2112                 
                    STZ.w $2112                 
                    STZ.w $0D13                 
                    JSR.w CODE_118AFE           
CODE_1188C5:        LDA.b #$80                  
                    STA.w $1DE2                 
                    JSL.l CODE_14E098           
                    LDA.w $0533                 
                    CMP.w $02E6                 
                    BEQ   CODE_1188E0           
                    STA.w $02E6                 
                    INC.w $0768                 
                    JSL.l CODE_12FD96           
CODE_1188E0:        LDA.b #$80                  
                    STA.w $0210                 
CODE_1188E5:        JSL.l CODE_118014           
                    LDA.b $FA                   
                    AND.b #$90                  
                    STA.w $0712                 
                    LDA.b $FC                   
                    AND.b #$80                  
                    ORA.w $0712                 
                    BNE   CODE_1188FE           
                    DEC.w $0210                 
                    BPL   CODE_1188E5           
CODE_1188FE:        LDA.w $0768                 
                    BEQ   CODE_11890C           
                    JSL.l CODE_12F4D0         ; Handle object -> M16. (Does not apply to objects that only contain 1 M16 tile, like vegetables.)
                    STZ.w $0768                 
                    BRA   CODE_11890F           

CODE_11890C:        JSR.w CODE_118AD2           
CODE_11890F:        JSL.l CODE_118009           
                    JSR.w CODE_1190A2           
                    JSL.l CODE_138062           
                    LDA.b #$17                  
                    STA.w $0243                 
                    JSL.l CODE_12FA10           
                    JSR.w CODE_1190DF           
                    RTS
                       
CODE_118927:        JSL.l CODE_12FA35           
                    LDX.w $0635                 
                    LDY.w $0533                 
                    JSL.l CODE_1187B6           
                    JSL.l CODE_138D67           
                    LDY.w $04EE                 
                    TYA                         
                    JSR.w CODE_119155           
                    STA.w $11B6                 
                    LDA.b #$15                  
                    STA.w $11B7                 
                    LDX.b #$BD                  
                    CPY.b #$BF                  
                    BEQ   CODE_118953           
                    TYX                         
                    LDA.b #$15                  
                    BRA   CODE_118955           

CODE_118953:        LDA.b #$09                  
CODE_118955:        STX.w $11B4                 
                    STA.w $11B5                 
                    JSL.l CODE_118014           
                    JSL.l CODE_118A84           
                    JSL.l CODE_118014           
                    JSL.l CODE_14D1D3           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
CODE_11896F:        JSL.l CODE_118014           
                    JSL.l CODE_14D7CF           
                    LDA.l $7FF804               
                    DEC   A                     
                    STA.l $7FF804               
                    BPL   CODE_11896F           
                    JSL.l CODE_118014           
                    LDA.b #$00                  
                    STA.l $7FF800               
                    STA.l $7FF801               
CODE_118990:        LDA.b #$10                  
                    STA.w $0759                 
                    INC.w $0217                 
                    JSL.l CODE_13DCF6           
                    JSL.l CODE_14D194           
                    JSL.l CODE_14F92E           
                    LDA.w $0636                 
                    CMP.b #$A5                  
                    BEQ   CODE_1189B0           
                    LDA.b #$A5                  
                    STA.w $0636                 
CODE_1189B0:        LDA.b #$04                ; \ Character select music.
                    STA.w $1DE2               ; /
                    LDA.b $8F                   
                    STA.w $0404                 
                    LDA.w $0635                 
                    STA.w $0405                 
CODE_1189C0:        JSL.l CODE_118014           
                    LDA.b $FA                   
                    AND.b #$23                  
                    BNE   CODE_1189CD           
                    JMP.w CODE_1189FB
           
CODE_1189CD:        LDA.b $FA                 ; \ Check if pressing Right or Select.
                    AND.b #$21                ;  |
                    BEQ   CODE_1189DD         ; / If neither, branch.
                    JSR.w CODE_118AAB         ; Remove the highlight from previous player.
                    DEC.b $8F                 ; Move to next character. (Move to the right.)
                    LDA.b #$01                ; \ 'Coin get' sound (when you select between players).
                    STA.w $1DE3               ; /
CODE_1189DD:        LDA.b $FA                 ; \ Check if pressing Left.
                    AND.b #$02                ;  |
                    BEQ   CODE_1189ED         ; / If not, branch.
                    JSR.w CODE_118AAB         ; Remove the highlight from previous player.
                    INC.b $8F                 ; Move to previous character. (Move to the left.)
                    LDA.b #$01                ; \ 'Coin get' sound (when you select between players).
                    STA.w $1DE3               ; /
CODE_1189ED:        LDA.b $8F                 ; \ Only 4 options.
                    AND.b #$03                ;  |
                    STA.b $8F                 ; /
                    JSL.l CODE_14D1D3           
                    JSL.l CODE_118A84           
CODE_1189FB:        LDA.b $FA                   
                    AND.b #$90                  
                    STA.w $0712                 
                    LDA.b $FC                   
                    AND.b #$80                  
                    ORA.w $0712                 
                    BNE   CODE_118A0E           
                    JMP.w CODE_1189C0
           
CODE_118A0E:        LDA.b #$3C                  
                    STA.w $1DE0                 
                    LDA.b #$40                  
                    STA.w $0210                 
                    JSL.l CODE_118014           
                    LDY.b #$00                  
                    LDX.b $8F                   
                    LDA.l DATA_15EBA1,x             
                    TAX                         
CODE_118A25:        LDA.l DATA_15EB41,x             
                    STA.w $0302,y               
                    INX                         
                    INY                         
                    CPY.b #$18                  
                    BNE   CODE_118A25           
                    LDA.b #$FF                  
                    STA.w $031A                 
CODE_118A37:        JSL.l CODE_118014           
                    DEC.w $0210                 
                    BPL   CODE_118A37           
                    JSL.l CODE_118A84           
                    LDA.b #$40                  
                    STA.w $0210                 
CODE_118A49:        JSL.l CODE_118014           
                    DEC.w $0210                 
                    BPL   CODE_118A49           
                    LDA.b #$02                  
                    JSL.l CODE_14D78D           
                    LDA.b #$01                  
                    STA.w $0201                 
CODE_118A5D:        JSL.l CODE_118014           
                    JSL.l CODE_14D7CF           
                    LDA.l $7FF804               
                    DEC   A                     
                    STA.l $7FF804               
                    BPL   CODE_118A5D           
                    JSL.l CODE_118014           
                    LDA.b #$00                  
                    STA.l $7FF800               
                    STA.l $7FF801               
                    LDA.b #$01                  
                    STA.w $0775                 
                    RTS
                       
CODE_118A84:        LDA.b #$17                ; \ Load byte into VRAM table at $0302 #$17 times.
                    STA.w $0712               ; /
                    LDY.w $0300               ; \ Get to free area in VRAM table.
                    LDX.b $8F                 ;  | Get player into index.
                    LDA.l DATA_15EBA1,x         ;  |
                    TAX                       ;  | X = position for the table at which the tilemap for each player starts at.
CODE_118A93:        LDA.l DATA_15EAE1,x         ;  | Load tilemap byte into table at $0302,y.
                    STA.w $0302,y             ;  |
                    INX                       ;  | Get to next byte in both tables.
                    INY                       ;  |
                    DEC.w $0712               ;  | Loop until $0712 is sub-zero.
                    BPL   CODE_118A93         ; /
                    LDA.b #$FF                ; \ End table.
                    STA.w $0302,y             ; /
                    TYA                       ; \ Amount of bytes the table covers up...
                    STA.w $0300               ; / Into $0300. (Header byte)
                    RTL                                  ; Return.
                       
CODE_118AAB:        LDA.b #$17                ; \ Load byte into VRAM table at $0302 #$17 times.
                    STA.w $0712               ; /
                    LDY.w $0300               ; \ Get to free area in VRAM table.
                    LDX.b $8F                 ;  | Get player into index.
                    LDA.l DATA_15EBA1,x         ;  |
                    TAX                       ;  | X = position for the table at which the tilemap for each player starts at.
CODE_118ABA:        LDA.l DATA_11C6AB,x         ;  | Load tilemap byte into table at $0302,y.
                    STA.w $0302,y             ;  |
                    INX                       ;  | Get to next byte in both tables.
                    INY                       ;  |
                    DEC.w $0712               ;  | Loop until $0712 is sub-zero.
                    BPL   CODE_118ABA         ; /
                    LDA.b #$FF                ; \ End table.
                    STA.w $0302,y             ; /
                    TYA                       ; \ Amount of bytes the table covers up...
                    STA.w $0300               ; / Into $0300. (Header byte)
                    RTS                       ; Return.
                       
CODE_118AD2:        STZ.w $02B7                 
CODE_118AD5:        JSL.l CODE_118014           
                    JSL.l CODE_14D1B2           
                    LDA.w $02B7                 
                    BEQ   CODE_118AD5           
                    LDA.w $04EF                 
                    BEQ   CODE_118AEF           
                    CMP.b #$01                  
                    BEQ   CODE_118AEF           
                    JSL.l CODE_14E35A           
CODE_118AEF:        LDA.w $024B                 
                    BEQ   CODE_118AFD           
                    CMP.b #$BE                  
                    BEQ   CODE_118AFD           
                    LDA.b #$FF                  
                    STA.w $024B                 
CODE_118AFD:        RTS
                       
CODE_118AFE:        STZ.w $02B7                 
                    STZ.b $FE                   
                    STZ.w $04AE                 
CODE_118B06:        JSL.l CODE_118014           
                    JSL.l CODE_14D1C2           
                    JSR.w CODE_118B1F           
                    LDA.b $1E                   
                    BNE   CODE_118B19           
                    JSL.l CODE_15D11D           
CODE_118B19:        LDA.w $02B7                 
                    BEQ   CODE_118B06           
                    RTS
                       
CODE_118B1F:        LDA.w $0D13                 
                    BEQ   CODE_118B2C           
                    JSL.l CODE_13FB12           
                    JSL.l CODE_129B00           
CODE_118B2C:        RTS
                       
CODE_118B2D:        JSR.w CODE_11945A           
                    RTL
                       
CODE_118B31:        LDY.w $04ED                 
                    STZ.w $04ED                 
                    STZ.w $04E1                 
                    STZ.w $062C                 
                    STZ.w $062A                 
                    STZ.w $0500                 
                    DEY                         
                    BNE   CODE_118B91           
                    STY.w $06C2                 
                    JSL.l CODE_14E061           
                    LDA.b #$FF                  
                    STA.w $0547                 
                    LDA.b #$69                  
                    STA.w $1194                 
                    LDA.b #$48                  
                    STA.w $1195                 
                    LDA.b #$15                  
                    STA.w $0596                 
                    JSR.w CODE_118AD2           
                    LDA.b #$80                  
                    STA.b $FE                   
                    STZ.w $0239                 
                    JSR.w CODE_118791           
                    JSL.l CODE_118014           
                    JSL.l CODE_14F953           
                    JSL.l CODE_14DA0A           
                    JSR.w CODE_118AFE           
                    LDA.b #$0F                  
                    STA.b $FE                   
                    STZ.w $0217                 
                    JSR.w CODE_118990           
                    JSR.w CODE_1188C5           
                    JMP.w CODE_1181A8
           
DATA_118B8D:        db $EE,$1C,$BD,$09

CODE_118B91:        LDA.b #$1F                
                    STA.w $04C3                              
                    LDA.b #$00                  
                    STA.w $04C4                 
                    STA.w $04B0                 
                    STA.w $0620                 
                    STA.w $04FC                 
                    STA.w $04FD                 
                    STA.w $0621                 
                    STA.w $04AD                 
                    DEY                         
                    BEQ   CODE_118BB3           
                    JMP.w CODE_118CB8
           
CODE_118BB3:        STY.w $06C2                 
                    LDA.b #$0A                ; \ Game over music.
                    STA.w $1DE2               ; /
                    JSR.w CODE_118AD2           
                    JSL.l CODE_118009           
                    STZ.w $0217                 
                    JSL.l CODE_14D194           
                    JSL.l CODE_14F953           
                    JSL.l CODE_14F92E           
                    JSL.l CODE_1387D8           
                    JSL.l CODE_138846           
                    JSL.l CODE_13DC5E           
                    JSL.l CODE_13882D           
                    LDA.b #$01                  
                    STA.b $11                   
                    JSL.l CODE_14F908           
                    LDA.b #$02                  
                    STA.b $11                   
                    JSL.l CODE_14F908           
                    LDA.b #$03                  
                    STA.b $11                   
                    JSL.l CODE_14F908           
                    JSL.l CODE_14D84E           
                    LDA.b #$05                  
                    STA.b $11                   
                    JSL.l CODE_118014           
                    REP   #$20                  
                    LDA.w #$09BD                
                    STA.w $11C8                 
                    STA.w $11CE                 
                    LDA.w #$1CEE                
                    STA.w $11C8                 
                    SEP   #$20                  
                    LDA.b #$13                  
                    STA.b $11                   
                    LDA.b #$01                  
                    STA.w $0207                 
                    LDA.b #$01                  
                    STA.w $0243                 
                    STZ.w $0211                 
                    STZ.w $078E                 
                    JSR.w CODE_1190DF           
                    STZ.w $0D13                 
                    INC.w $078F                 
                    JSR.w CODE_118AFE           
CODE_118C38:        JSL.l CODE_118014           
                    LDA.b $FA                   
                    AND.b #$2C                  
                    BEQ   CODE_118C46           
                    JSL.l CODE_14DAB8           
CODE_118C46:        LDA.w $078E                 
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w $078E                 
                    CLC                         
                    ADC.w $078E                 
                    TAY                         
                    REP   #$20                  
                    LDA.w #$09BD                
                    STA.w $11C8                 
                    STA.w $11CE                 
                    STA.w $11D4                 
                    SEP   #$20                  
                    INC.w $0790                 
                    LDA.w $0790                 
                    AND.b #$10                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_118B8D,x             
                    STA.w $11C8,y               
                    SEP   #$20                  
                    LDA.b #$13                  
                    STA.b $11                   
                    LDA.b $FA                   
                    AND.b #$10                  
                    BEQ   CODE_118C38           
                    JSL.l CODE_14DAF4           
                    LDA.w $078E                 
                    BNE   CODE_118C93           
                    LDA.b #$29                  
                    STA.w $1DE3                 
CODE_118C93:        LDA.b #$04                  
                    JSL.l CODE_14D78D           
                    STZ.w $0207                 
                    STZ.w $062B                 
                    LDA.b #$13                  
                    STA.w $0243                 
                    STZ.w $078F                 
                    LDA.w $0635                 
                    ASL   A                     
                    CLC                         
                    ADC.w $0635                 
                    STA.w $0533                 
                    STA.w $04E8                 
                    JMP.w CODE_11816B
           
CODE_118CB8:        DEY                         
                    BNE   CODE_118CBE           
                    BRL   CODE_118D9D
           
CODE_118CBE:        LDA.b #$13                ; \ Warp Jar music.
                    STA.w $1DE2               ; /
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    LDX.b #$00                  
                    JSL.l CODE_14D345           
CODE_118CCD:        JSL.l CODE_118014           
                    JSL.l CODE_14D3A4           
                    LDA.w $022B                 
                    CMP.b #$80                  
                    BCC   CODE_118CCD           
                    STZ.w $023A                 
                    STZ.b $FE                   
                    JSL.l CODE_14D4C4           
                    LDY.w $0635               ; \ Store original world number into $0405.
                    STY.w $0405               ; /
                    LDA   DATA_11CDB4,y       ; \ Get new world number to warp to.       
                    STA.w $0635               ; /
                    TAY                       ; Into Y.
                    LDX.b $8F                 ; Player number into X.
                    LDA   DATA_11C9B4,y       ; \ Get appropiate level number. (x-1)
                    STA.w $0533               ;  |
                    STA.w $04E8               ; /
                    TYA                       ; World number to warp to into Y.
                    SEC                       ; \ Subtract 3 from the value. (There are no 'World X' graphics for Worlds 1-3)
                    SBC.b #$03                ;  |
                    ASL   A                   ;  | Multiply by 2 since we're going to read from a 16-bit table.
                    TAY                       ; / And back into Y again.
                    REP   #$20                ; A = 16-bit.
                    LDA   DATA_11CDBB,y       ; \ $11BD-$11C2 = Tilemap of number in 'World X'.
                    STA.w $11BD               ;  | TTTTTTTT YXPCCCTT format.
                    LDA   DATA_11CDC3,y       ;  |
                    STA.w $11BF               ;  |
                    LDA   DATA_11CDCB,y       ;  |   
                    STA.w $11C1               ; /
                    SEP   #$20                ; A = 8-bit.
                    JSL.l CODE_118009           
                    JSL.l CODE_14D194           
                    JSL.l CODE_138A68           
                    JSL.l CODE_138846           
                    JSL.l CODE_138A92           
                    STZ.w $0217                 
                    JSL.l CODE_14F92E           
                    LDA.b #$01                  
                    STA.w $0201                 
                    STA.w $0207                 
                    JSL.l CODE_14F953           
                    JSL.l CODE_13DE8C           
                    LDA.b #$01                  
                    STA.w $0243                 
                    JSR.w CODE_1190DF           
                    JSL.l CODE_14D84E           
                    LDA.b #$01                  
                    STA.b $11                   
                    JSL.l CODE_14F908           
                    LDA.b #$04                  
                    STA.b $11                   
                    JSL.l CODE_14F908           
                    LDA.b #$12                  
                    STA.b $11                   
                    LDA.b #$0F                ; \ Bonus game music.
                    STA.w $1DE2               ; /
                    LDX.b #$01                  
                    JSL.l CODE_14D345           
CODE_118D6F:        JSL.l CODE_118014           
                    JSL.l CODE_14D3A4           
                    LDA.w $022B                 
                    CMP.b #$F0                  
                    BCC   CODE_118D6F           
                    STZ.w $023A                 
                    JSL.l CODE_14D4C4           
                    LDA.b #$00                  
                    JSL.l CODE_14D78D           
                    JSL.l CODE_14F92E           
                    JSR.w CODE_11904D           
                    JSR.w CODE_11883A           
                    LDA.b #$13                  
                    STA.w $0243                 
                    JMP.w CODE_118192
           
CODE_118D9D:        LDA.b #$80                  
                    STA.w $1DE2                 
                    LDX.b $8F                 ; \ Indexed by character.
                    LDA.w $062D,x             ;  | Check if 'Amount of levels completed', indexed by character...
                    CMP.b #$63                ;  | Is 99.
                    BEQ   CODE_118DAE         ; / If so, branch, don't increment further.
                    INC.w $062D,x             ;| Otherwise, increment amount of levels cleared.
CODE_118DAE:        LDA.w $0533               ; \ Level to trigger ending sequence = 7-2.
                    CMP.b #$13                ;  |
                    BNE   CODE_118DB8         ; / If not 7-2, branch.
                    JMP.w CODE_11905A
           
CODE_118DB8:        STY.w $06C2                 
                    STZ.w $0217                 
                    JSR.w CODE_118AD2           
                    JSL.l CODE_118009           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSL.l CODE_14F953           
                    JSR.w CODE_1190DF           
                    JSL.l CODE_14D194           
                    JSL.l CODE_118014           
                    LDA.b #$00                  
                    JSL.l CODE_14D78D           
                    JSL.l CODE_14F92E           
                    JSL.l CODE_138A68           
                    JSL.l CODE_138846           
                    STZ.w $0D08                 
                    LDY.w $0635                 
                    LDA   DATA_11C9B4+1,y               
                    SEC                         
                    SBC.b #$01                  
                    CMP.w $0533                 
                    BNE   CODE_118E03           
                    INC.w $0635                 
                    INC.w $0D08                 
                    BRA   CODE_118E23           

CODE_118E03:        JSL.l CODE_14E30F           
                    LDA.w $0533                 
                    LDY.b #$00                  
CODE_118E0C:        INY                         
                    CMP   DATA_11C9B4,y               
                    BCS   CODE_118E0C                   
                    DEY                         
                    STY.w $0635                 
                    LDY.w $0635                 
                    LDA.w $0533                 
                    SEC         
                
                    SBC   DATA_11C9B4,y               
                    STA.w $0629                 
CODE_118E23:        JSL.l CODE_14D84E           
                    STZ.w $0796                 
                    LDA.b #$01                  
                    STA.b $11                   
                    JSL.l CODE_14F908           
                    LDA.b #$17                  
                    STA.b $11                   
                    LDA.b #$40                  
                    STA.w $0100                 
                    JSR.w CODE_1190DF           
                    JSL.l CODE_118014           
                    LDA.b #$C0                  
                    STA.w $0100                 
                    JSR.w CODE_1190A2           
                    STZ.w $0789                 
                    JSR.w CODE_1190E5           
                    LDA.b #$0C                ; \ Bonus game music.
                    STA.w $1DE2               ; /
                    LDA.w $062B                 
                    BNE   CODE_118E5D           
                    JMP.w CODE_119015
           
CODE_118E5D:        JSL.l CODE_14CD7D           
                    JSL.l CODE_118014           
                    STZ.w $0D13                 
                    INC.w $0789                 
                    JSR.w CODE_118AFE           
CODE_118E6E:        LDA.w $062B                 
                    BNE   CODE_118EBE           
CODE_118E73:        LDX.b #$5C                  
                    LDA.b #$00                  
CODE_118E77:        STA.w $00,x               
                    DEX                         
                    CPX.b #$28                  
                    BNE   CODE_118E77           
                    LDA.w $0D08                 
                    BEQ   CODE_118E8F           
                    JSR.w CODE_118834           
                    LDA.b #$FF                  
                    STA.w $0547                 
                    JMP.w CODE_118172
           
CODE_118E8F:        LDA.w $0533                 
                    STA.w $04E8                 
                    LDA.w $0534                 
                    STA.w $04E9                 
                    LDA.w $0535                 
                    STA.w $04EA                 
                    LDY.b #$00                  
                    STY.w $04E7                 
                    STY.w $0536                 
                    STY.w $04EB                 
                    DEY                         
                    STY.w $0547                 
                    JSR.w CODE_118834           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JMP.w CODE_118192
           
DATA_118EBA:        db $07,$0A,$0E,$12
 
CODE_118EBE:        DEC.w $062B                       
                    STZ.w $0793
                    STZ.w $078A 
                    STZ.w $079A                 
                    JSL.l CODE_118014           
                    JSR.w CODE_1190ED           
                    JSL.l CODE_14CD50           
CODE_118ED5:        JSL.l CODE_118014           
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    INC.b $10                   
                    INC.w $079A                 
                    LDA.b $3D                   
                    AND.b #$70                  
                    CMP.b #$40                  
                    BCS   CODE_118EF1                   
                    EOR.b #$30                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    INC   A                     
CODE_118EF1:        AND.b #$03                  
                    TAX                         
                    LDA.w $079A                 
                    CMP   DATA_118EBA,x             
                    BNE   CODE_118F05           
                    LDA.b #$42                  
                    STA.w $1DE0                 
                    STZ.w $079A                 
CODE_118F05:        JSL.l CODE_14CDA7           
                    JSL.l CODE_14CE08           
                    JSL.l CODE_14CDD4           
                    JSL.l CODE_14CF46           
                    STZ.b $33                   
                    JSL.l CODE_14D012           
                    LDA.w DATA_11CAF5                 
                    STA.b $11                   
                    INC.b $06                   
                    LDA.b $29                   
                    ORA.b $2A                   
                    ORA.b $2B                   
                    BNE   CODE_118ED5           
                    LDA.b #$01                  
                    STA.b $33                   
                    JSL.l CODE_14D021           
                    LDA.b #$10                  
                    STA.b $11                   
                    JSL.l CODE_118014           
                    LDY.b #$00                  
                    LDX.b $2F                   
                    BNE   CODE_118F61           
                    INY                         
                    LDA.b $30                   
                    BNE   CODE_118F4D           
                    INY                         
                    LDA.b $31                   
                    BNE   CODE_118F4D           
                    INY                         
                    BRA   CODE_118F71           

CODE_118F4D:        LDA.b $30                   
                    CMP.b $31                   
                    BNE   CODE_118F61           
                    CMP.b #$04                  
                    BNE   CODE_118F61           
                    LDA.w $0796                 
                    BNE   CODE_118F61           
                    LDA.b #$01                  
                    STA.w $0796                 
CODE_118F61:        CPX.b $30                   
                    BNE   CODE_118F71           
                    CPX.b $31                   
                    BNE   CODE_118F71           
                    INY                         
                    INY                         
                    CPX.b #$04                  
                    BNE   CODE_118F71           
                    LDY.b #$0A                  
CODE_118F71:        TYA                         
                    CLC                         
                    ADC.w $04EE                 
                    BCC   CODE_118F7A           
                    LDA.b #$FF                  
CODE_118F7A:        CMP.b #$64                  
                    BCC   CODE_118F80           
                    LDA.b #$63                  
CODE_118F80:        STA.w $04EE                 
                    TYA                         
                    BEQ   CODE_118FE5           
                    JSR.w CODE_119155           
                    STA.w $0698                 
                    STY.w $0696                 
                    LDA.b #$15                  
                    STA.w $0699                 
                    CPY.b #$BF                  
                    BNE   CODE_118F9F           
                    LDA.b #$BD                  
                    STA.w $0696                 
                    LDA.b #$09                  
CODE_118F9F:        STA.w $0697                 
                    LDA.b #$10                ; \ Bonus get music.
                    STA.w $1DE2               ; /
                    LDA.b #$A0                  
                    STA.b $56                   
                    JSL.l CODE_118014           
                    JSR.w CODE_1190ED           
CODE_118FB2:        JSL.l CODE_118014           
                    STZ.b $33                   
                    LDA.b #$01                  
                    STA.w $0793                 
                    JSL.l CODE_14D021           
                    JSL.l CODE_14D0C7           
                    LDA.b $56                   
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$01                  
                    TAY                         
                    LDA   DATA_11CAF9,y               
                    STA.b $11                   
                    DEC.b $56                   
                    BNE   CODE_118FB2           
                    LDA.b #$01                  
                    STA.b $33                   
                    JSL.l CODE_14D021           
                    JSL.l CODE_14D0C7           
                    BRA   CODE_118FF4           

CODE_118FE5:        LDA.b #$09                ; \ Death music.
                    STA.w $1DE2               ; /
                    JSL.l CODE_118014           
                    JSR.w CODE_1190ED           
                    JSR.w CODE_11904D           
CODE_118FF4:        LDA.w $0796                 
                    CMP.b #$01                  
                    BNE   CODE_118FFF           
                    JSL.l CODE_15A2E6           
CODE_118FFF:        LDA.b #$11                  
                    STA.b $11                   
                    JSL.l CODE_118014           
                    JMP.w CODE_118E6E
           
                    LDA.w $0210                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.b #$01                  
                    TAY                         
                    RTS
                       
CODE_119015:        STZ.w $0D13                 
                    JSR.w CODE_118AFE           
                    JSR.w CODE_119049           
                    LDA.b #$09                ; \ Death music.
                    STA.w $1DE2               ; /
                    LDA.b #$0A                  
                    STA.w $0782                 
CODE_119028:        LDA.w $0782                 
                    AND.b #$01                  
                    TAY                         
                    LDA   DATA_11CAF7,y               
                    STA.b $11                   
                    LDA.b #$0A                  
                    STA.w $0783                 
CODE_119038:        JSL.l CODE_118014           
                    DEC.w $0783                 
                    BNE   CODE_119038           
                    DEC.w $0782                 
                    BPL   CODE_119028           
                    JMP.w CODE_118E73
           
CODE_119049:        LDA.b #$50                  
                    BRA   CODE_11904F           

CODE_11904D:        LDA.b #$A0                  
CODE_11904F:        STA.b $07                   
CODE_119051:        JSL.l CODE_118010           
                    DEC.b $07                   
                    BNE   CODE_119051           
                    RTS
                       
CODE_11905A:        STZ.w $0607                 
                    LDA.b #$01                  
                    STA.w $0217                 
                    JSL.l CODE_12920C           
                    JSL.l CODE_118009           
                    STZ.w $0217                 
                    JSR.w CODE_1190A2           
                    JSL.l CODE_1388A0           
                    JSR.w CODE_1190DF           
                    JSL.l CODE_118014           
                    INC.w $06BF                 
                    STZ.w $023B                 
                    STZ.w $023C                 
                    JSL.l CODE_129432           
                    JSL.l CODE_118009           
                    JSR.w CODE_1190A2           
                    JSL.l CODE_1388F5         ; Load layer and sprite graphics for credits.
                    JSR.w CODE_1190DF           
                    JSL.l CODE_118014           
                    INC.w $06BF                 
                    JSL.l CODE_13E731           
                    RTS
                       
CODE_1190A2:        LDA.b #$30                  
                    STA.b $FF                   
                    STZ.w $4200                 
                    RTS
                       
                    JSR.w CODE_118AD2           
                    LDA.b #$80                  
                    STA.b $FE                   
                    JSR.w CODE_118791           
                    JSL.l CODE_118014           
                    LDA.b #$04                  
                    STA.b $11                   
                    JSL.l CODE_118014           
                    LDX.w $0635                 
                    LDY.w $0533                 
                    JSL.l CODE_1187B6           
                    JSL.l CODE_138CF2           
                    JSL.l CODE_118014           
                    JSL.l CODE_138D25           
                    LDA.w $0596                 
                    STA.b $11                   
                    JSL.l CODE_118014           
CODE_1190DF:        LDA.b #$81                  
                    STA.w $4200                 
                    RTS
                       
CODE_1190E5:        JSL.l CODE_14F92E           
                    JSL.l CODE_13DE8C           
CODE_1190ED:        JSL.l CODE_138D56           
                    LDY.w $04EE                 
                    TYA                         
                    JSR.w CODE_119155           
                    STY.w $142A                 
                    STA.w $142C                 
                    LDA.b #$15                  
                    STA.w $142D                 
                    CPY.b #$BF                  
                    BNE   CODE_11910E           
                    LDA.b #$BD                  
                    STA.w $142A                 
                    LDA.b #$09                  
CODE_11910E:        STA.w $142B                 
                    LDA.w $062B                 
                    JSR.w CODE_119155           
                    CPY.b #$BF                  
                    BNE   CODE_11911E           
                    TAX                         
                    TYA                         
                    TXY                         
CODE_11911E:        STY.w $1408                 
                    STA.w $140A                 
                    LDX.b #$15                  
                    CMP.b #$BF                  
                    BNE   CODE_119131           
                    LDA.b #$BD                  
                    STA.w $140A                 
                    LDX.b #$09                  
CODE_119131:        STX.w $140B                 
                    LDA.b #$15                  
                    CPY.b #$BF                  
                    BNE   CODE_119141           
                    LDA.b #$BD                  
                    STA.w $1408                 
                    LDA.b #$09                  
CODE_119141:        STA.w $1409                 
                    LDA.b #$01                  
                    STA.b $11                   
                    LDA.b #$40                  
                    STA.w $0100                 
                    JSR.w CODE_1190DF           
                    JSL.l CODE_118014           
                    RTS
                       
CODE_119155:        LDY.b #$C0                  
CODE_119157:        CMP.b #$0A                  
                    BCC   CODE_119161           
                    SBC.b #$0A                  
                    INY                         
                    JMP.w CODE_119157
           
CODE_119161:        ORA.b #$C0                  
                    CPY.b #$C0                  
                    BNE   CODE_119169           
                    LDY.b #$BF                  
CODE_119169:        RTS
                      
                    LDY.b #$D0                  
CODE_11916C:        CMP.b #$0A                  
                    BCC   CODE_119176           
                    SBC.b #$0A                  
                    INY                         
                    JMP.w CODE_11916C
           
CODE_119176:        ORA.b #$D0                  
                    CPY.b #$D0                  
                    BNE   CODE_11917E           
                    LDY.b #$FB                  
CODE_11917E:        RTS
                       
CODE_11917F:        LDY.b #$80                  
CODE_119181:        CMP.b #$0A                  
                    BCC   CODE_11918B           
                    SBC.b #$0A                  
                    INY                         
                    JMP.w CODE_119181
           
CODE_11918B:        ORA.b #$80                  
                    CPY.b #$80                  
                    BNE   CODE_119193           
                    LDY.b #$BF                  
CODE_119193:        RTS
                       
CODE_119194:        LDA.b $FE                   
                    STA.w $2100                 
                    LDA.b $FF                   
                    AND.b #$80                  
                    ORA.b #$01                  
                    STA.w $4200                 
                    DEC.w $0154                 
                    JMP.w CODE_11925B
           
CODE_1191A8:        JSR.w CODE_1194C7           
                    STZ.w $0206                 
                    STZ.w $0207                 
                    STZ.w $04C6                 
                    STZ.w $04C7                 
                    JMP.w CODE_11922C
           
CODE_1191BA:        LDA.b $FE                   
                    STA.w $2100                 
                    JMP.w CODE_11925B
           
CODE_1191C2:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $4210                 
                    LDA.b #$80                  
                    STA.w $2100                 
                    STZ.w $420C                 
                    JSL.l CODE_138B2A           
                    LDA.w $0154                 
                    BNE   CODE_1191BA           
                    JSR.w CODE_119321           
                    JSL.l CODE_138A10           
                    BIT.w $0100                 
                    BPL   CODE_1191A8           
                    BVS   CODE_1191E9           
                    BRA   CODE_119194           

CODE_1191E9:        LDA.b $EB                   
                    BEQ   CODE_119201           
                    LDA.w $051E                 
                    BEQ   CODE_119201           
                    STZ.w $051E                 
                    LDA.w $D2                 
                    STA.b $00                   
                    LDA.w $D1                 
                    STA.b $01                   
                    STZ.b $02                   
CODE_119201:        JSR.w CODE_1194C7           
                    JSR.w CODE_11945A           
                    JSL.l CODE_158419           
                    LDA.b #$B0                  
                    ORA.w $0201                 
                    LDY.b $EB                   
                    BNE   CODE_119219           
                    AND.b #$FE                  
                    ORA.w $0207                 
CODE_119219:        AND.b #$80                  
                    STA.b $FF                   
                    INC.b $10                   
                    INC.w $0254                 
                    LDA.w $0254                 
                    CMP.b #$06                  
                    BCC   CODE_11922C           
                    STZ.w $0254                 
CODE_11922C:        LDA.b #$00                  
                    STA.l $7F0000               
                    STA.l $7F0001               
                    STA.l $7F0800               
                    STA.l $7F0801               
                    DEC   A                     
                    STA.l $7F0002               
                    STA.l $7F0802               
                    LDA.b $11                   
                    BNE   CODE_119256           
                    STZ.w $0300                 
                    STZ.w $0301                 
                    LDA.b #$FF                  
                    STA.w $0302                 
CODE_119256:        STZ.b $11                   
                    DEC.w $0154                 
CODE_11925B:        PHD                       ; \ Preserve direct page.
                    LDA.b #$21                ;  | Direct page = #$2100.
                    XBA                       ;  |
                    LDA.b #$00                ;  |
                    TCD                       ; /
                    LDA.w $0200               ; \ $0200-$0201 = Layer 1 X mirror.
                    STA.b $0D                 ;  |
                    LDA.w $0201               ;  |
                    STA.b $0D                 ; /
                    LDA.w $0206               ; \ $0206-$0207 + $04C6 = Layer 1 Y mirror.
                    CLC                       ;  |
                    ADC.w $04C6               ;  |
                    STA.b $0E                 ;  |
                    LDA.w $0207               ;  |
                    STA.b $0E                 ; /
                    LDA.w $0202               ; \ $0202-$0203 = Layer 2 X mirror.
                    STA.b $0F                 ;  |
                    LDA.w $0203               ;  |
                    STA.b $0F                 ; /
                    LDA.w $0208               ; \ $0208-$0209 = Layer 2 Y mirror.
                    STA.b $10                 ;  |
                    LDA.w $0209               ;  |
                    STA.b $10                 ; /
                    LDA.w $0204               ; \ $0204-$0205 = Layer 3 X mirror.
                    STA.b $11                 ;  |
                    LDA.w $0205               ;  |
                    STA.b $11                 ; /
                    LDA.w $020A               ; \ $020A-$020B = Layer 3 Y mirror.
                    STA.b $12                 ;  |
                    LDA.w $020B               ;  |
                    STA.b $12                 ; /
                    REP   #$10                ; Index = 16-bit.
                    LDX.w $0235                 
                    STX.b $23                   
                    LDA.w $0237                 
                    STA.b $25                   
                    LDX.w $0238                 
                    STX.b $30                   
                    LDX.w $023B                 
                    STX.b $2E                   
                    LDA.w $023D               ; \ $023D-$023F = Colour layer mirror.
                    STA.b $32                 ;  |
                    LDA.w $023E               ;  |
                    STA.b $32                 ;  |
                    LDA.w $023F               ;  |
                    STA.b $32                 ; /
                    LDX.w $0243               ; \ $0243-$0244 = Main and Sub Screen Designation.
                    STX.b $2C                 ; /
                    LDA.w $024C                 
                    STA.b $07                   
                    LDA.w $0775               ; \ $0775 = BG mode mirror.
                    STA.w $2105               ; /
                    SEP   #$10                ; Index = 8-bit.
                    LDA.w $024B                 
                    BEQ   CODE_11930B           
                    CMP.b #$BE                  
                    BEQ   CODE_1192F4           
                    LDA.w $04BF               ; \ Make starry BG scroll slower than the rest of the background.
                    XBA                       ;  | (Four times as slow as Layer 1)
                    LDA.w $0200               ;  |
                    REP   #$20                ;  | Accumulator = 16-bit.
                    LSR   A                   ;  |
                    LSR   A                   ;  |
                    SEP   #$20                ;  | Accumulator = 8-bit.
                    STA.b $0F                 ;  |
                    XBA                       ;  |
                    STA.b $0F                 ; /
CODE_1192F4:        LDX.w $4211                 
                    LDA.w $024B                 
                    STA.w $4209                 
                    STZ.w $420A                 
                    STZ.w $4207                 
                    STZ.w $4208                 
                    LDA.b #$A1                  
                    STA.w $4200                 
CODE_11930B:        PLD                       ; Pull normal direct page back.
                    LDA.b $FE                 ; \ $FE = Brightness + Force blank mirror.
                    STA.w $2100               ; /
                    LDA.w $023A               ; \ $023A = HDMA enable mirror.
                    STA.w $420C               ; /
                    JSL.l CODE_138C0B           
                    JSR.w CODE_1195E4           
                    PLB                         
                    RTL
                       
                    RTS
                       
CODE_119321:        JSR.w CODE_11939C           
                    PHD                         
                    LDX.b #$80                  
                    STX.w $2115                 
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
                    LDX.w $0D0B                 
                    BEQ   CODE_119353           
                    LDA.w #$0D0C                
                    STA.b $72                   
CODE_119353:        LDA.l $7FF800               
                    BEQ   CODE_119373           
                    STA.w $2116                 
                    LDA.w #$1801                
                    STA.b $00                   
                    LDA.w #$F600                
                    STA.b $02                   
                    LDX.b #$7F                  
                    STX.b $04                   
                    LDA.l $7FF802               
                    STA.b $05                   
                    STY.w $420B                 
CODE_119373:        SEP   #$20                  
                    LDA.w $02A9                 
                    BEQ   CODE_119395           
                    STZ.w $2121                 
                    REP   #$20                  
                    LDA.w #$2200                
                    STA.b $00                   
                    LDA.w #$0B00                
                    STA.b $02                   
                    LDX.b #$00                  
                    STX.b $04                   
                    LDA.w #$0200                
                    STA.b $05                   
                    STY.w $420B                 
CODE_119395:        SEP   #$20                  
                    STZ.w $02A9                 
                    PLD                         
                    RTS
                       
CODE_11939C:        PHD                       ; Preserve DP.
                    LDA.b #$0A                ; \ Direct page = #$0A00.
                    XBA                       ;  |
                    LDA.b #$00                ;  |
                    TCD                       ; /
                    LDY.b #$1C                ; \ Y starts out as #$1C, X as #$70.
CODE_1193A5:        TYA                       ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    TAX                       ; /
                    LDA.b $23,x               ; \ Get general sprite tile sizes from $0A20-$0A9F into $0A00-$0A1F.
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $22,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $21,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $20,x               ;  |
                    STA.w $0A00,y             ;  |
                    LDA.b $27,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $26,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $25,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $24,x               ;  |
                    STA.w $0A01,y             ;  |
                    LDA.b $2B,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $2A,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $29,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $28,x               ;  |
                    STA.w $0A02,y             ;  |
                    LDA.b $2F,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $2E,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $2D,x               ;  |
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    ORA.b $2C,x               ;  |
                    STA.w $0A03,y             ; /
                    DEY                       ; \ Decrement Y by 4 and loop until transfer done.
                    DEY                       ;  |
                    DEY                       ;  |
                    DEY                       ;  |
                    BPL   CODE_1193A5         ; /
                    PLD                       ; Get DP register back.
                    RTS                       ; Return.
                       
CODE_1193F5:        LDX.b #$44                  
                    LDY.b #$00                  
                    LDA.w $0628                 
                    CMP.b #$01                  
                    BEQ   CODE_119407           
                    LDA.b $EB                   
                    BEQ   CODE_119407           
                    LDX.b #$40                  
                    INY                         
CODE_119407:        STX.b $03                   
                    STZ.b $04                   
                    TYA                         
                    ORA.b #$80                  
                    STA.w $2115                 
                    LDA.b #$00                  
                    STA.w $4314                 
                    REP   #$10                  
                    LDX.w #$1801                
                    STX.w $4310                 
                    LDX.w #$0002                
                    LDA.w $0300,x               
                    BMI   CODE_119457           
CODE_119426:        REP   #$20                  
                    LDA.w $0300,x               
                    XBA                         
                    STA.w $2116                 
                    LDA.w $0302,x               
                    XBA                         
                    AND.w #$3FFF                
                    INC   A                     
                    STA.w $4315                 
                    TXA                         
                    CLC                         
                    ADC.w #$0004                
                    CLC                         
                    ADC.w #$0300                
                    STA.w $4312                 
                    TXA                         
                    CLC                         
                    ADC.b $03                   
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $420B                 
                    LDA.w $0300,x               
                    BPL   CODE_119426           
CODE_119457:        SEP   #$30                  
                    RTS
                       
CODE_11945A:        LDX.b #$44                  
                    LDY.b #$80                  
                    LDA.w $0628                 
                    CMP.b #$01                  
                    BNE   CODE_119469           
                    LDX.b #$84                  
                    BRA   CODE_119477           

CODE_119469:        LDA.b $EB                   
                    BEQ   CODE_119477           
                    LDX.b #$2C                  
                    LDA.w $024B                 
                    BNE   CODE_119476           
                    LDX.b #$40                  
CODE_119476:        INY                         
CODE_119477:        STX.b $03                   
                    STZ.b $04                   
                    STY.w $2115                 
                    LDA.b #$7F                  
                    STA.w $4314                 
                    REP   #$10                  
                    LDX.w #$1801                
                    STX.w $4310                 
                    LDX.w #$0002                
                    LDA.l $7F0000,x             
                    BMI   CODE_1194C4           
CODE_119494:        REP   #$20                  
                    LDA.l $7F0000,x             
                    XBA                         
                    STA.w $2116                 
                    LDA.l $7F0002,x             
                    XBA                         
                    STA.w $4315                 
                    TXA                         
                    CLC                         
                    ADC.w #$0004                
                    CLC                         
                    ADC.w #$0000                
                    STA.w $4312                 
                    TXA                         
                    CLC                         
                    ADC.b $03                   
                    TAX                         
                    SEP   #$20                  
                    LDA.b #$02                  
                    STA.w $420B                 
                    LDA.l $7F0000,x             
                    BPL   CODE_119494           
CODE_1194C4:        SEP   #$30                  
                    RTS
                       
CODE_1194C7:        LDA.b $F2                   
                    STA.w $4314                 
                    REP   #$10                  
                    LDY.w #$0000                
                    LDA.b [$F0],y               
                    BMI   CODE_1194C4           
                    STZ.b $06                   
CODE_1194D7:        STA.b $04                   
                    INY                         
                    LDA.b [$F0],y               
                    STA.b $03                   
                    INY                         
                    LDA.b [$F0],y               
                    AND.b #$80                  
                    ASL   A                     
                    ROL   A                     
                    STA.b $07                   
                    LDA.b [$F0],y               
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
                    LDA.b [$F0],y               
                    XBA                         
                    AND.w #$3FFF                
                    TAX                         
                    INX                         
                    STX.w $4315                 
                    INY                         
                    INY                         
                    TYA                         
                    CLC                         
                    ADC.b $F0                   
                    STA.w $4312                 
                    LDA.b $05                   
                    BEQ   CODE_11954D           
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
                    ADC.b $F0                   
                    INC   A                     
                    STA.w $4312                 
                    LDA.b $03                   
                    STA.w $2116                 
                    STX.w $4315                 
                    LDX.w #$0002                
CODE_11954D:        STX.b $03                   
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
                    LDA.b [$F0],y               
                    BMI   CODE_119569           
                    JMP.w CODE_1194D7
           
CODE_119569:        SEP   #$30                  
                    RTS
                       
CODE_11956C:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.w $4211                 
                    BPL   CODE_1195A5           
                    LDA.w $024B                 
                    BEQ   CODE_1195A5           
                    CMP.b #$BE                  
                    BEQ   CODE_119580           
                    BRL   CODE_1195A7
           
CODE_119580:        BIT.w $4212                 
                    BVC   $FB                   
                    LDA.b $F3                   
                    STA.w $210D                 
                    LDA.w $024F                 
                    STA.w $210D                 
                    STZ.w $210E                 
                    STZ.w $210E                 
CODE_119596:        LDA.w $024B                 
                    CMP.b #$FF                  
                    BNE   CODE_1195A5           
                    STZ.w $024B                 
                    LDA.b #$81                  
                    STA.w $4200                 
CODE_1195A5:        PLB                         
                    RTL
                       
CODE_1195A7:        BIT.w $4212                 
                    BVC   $FB                   
                    LDA.w $0202                 
                    STA.w $210F                 
                    LDA.w $0203                 
                    STA.w $210F                 
                    STZ.w $2110                 
                    STZ.w $2110                 
                    BRA   CODE_119596           

CODE_1195C0:        STZ.w $02B7                 
CODE_1195C3:        JSL.l CODE_14F908           
                    JSL.l CODE_14D1B2           
                    LDA.w $02B7                 
                    BEQ   CODE_1195C3           
                    RTL
                       
CODE_1195D1:        STZ.w $02B7                 
                    STZ.b $FE                   
CODE_1195D6:        JSL.l CODE_14F908           
                    JSL.l CODE_14D1C2           
                    LDA.w $02B7                 
                    BEQ   CODE_1195D6           
                    RTL
                       
CODE_1195E4:        LDA.w $1DE0                 
                    BNE   CODE_1195FD           
                    LDA.w $2140                 
                    CMP.w $1DE4                 
                    BEQ   CODE_1195FB           
                    INC.w $1DEA                 
                    LDA.w $1DEA                 
                    CMP.b #$03                  
                    BCC   CODE_119606           
CODE_1195FB:        LDA.b #$00                  
CODE_1195FD:        STA.w $2140                 
                    STA.w $1DE4                 
                    STZ.w $1DEA                 
CODE_119606:        LDA.w $1DE1                 
                    BNE   CODE_119621           
                    LDA.w $2141                 
                    AND.b #$0F                  
                    CMP.w $1DE5                 
                    BEQ   CODE_11961F           
                    INC.w $1DEB                 
                    LDA.w $1DEB                 
                    CMP.b #$03                  
                    BCC   CODE_11962C           
CODE_11961F:        LDA.b #$00                  
CODE_119621:        STA.w $2141                 
                    AND.b #$0F                  
                    STA.w $1DE5                 
                    STZ.w $1DEB                 
CODE_11962C:        LDA.w $1DE2                 
                    BEQ   CODE_1196A7           
                    LDY.b #$04                  
                    STY.w $1DEC                 
                    STA.w $2142                 
                    CMP.b #$F0                  
                    BCS   CODE_119640                   
                    STA.w $1DE6                 
CODE_119640:        LDA.w $1DE3                 
                    BNE   CODE_119666           
                    LDA.w $2143                 
                    AND.b #$7F                  
                    CMP.w $1DE7                 
                    BEQ   CODE_119659           
                    INC.w $1DED                 
                    LDA.w $1DED                 
                    CMP.b #$03                  
                    BCC   CODE_11968A           
CODE_119659:        LDA.b #$00                  
                    STA.w $2143                 
                    STA.w $1DE7                 
                    STZ.w $1DED                 
                    BRA   CODE_11968A           

CODE_119666:        STA.w $1DE7                 
                    CMP.b #$01                  
                    BEQ   CODE_119679           
                    CMP.b #$05                  
                    BEQ   CODE_119679           
                    CMP.b #$06                  
                    BEQ   CODE_119679           
                    CMP.b #$4A                  
                    BNE   CODE_119697           
CODE_119679:        ORA.w $1DEF                 
                    STA.w $2143                 
                    LDA.w $1DEF                 
                    EOR.b #$80                  
                    STA.w $1DEF                 
                    STZ.w $1DED                 
CODE_11968A:        STZ.w $1DE0                 
                    STZ.w $1DE1                 
                    STZ.w $1DE2                 
                    STZ.w $1DE3                 
                    RTS
                       
CODE_119697:        STA.w $2143                 
                    STZ.w $1DE0                 
                    STZ.w $1DE1                 
                    STZ.w $1DE2                 
                    STZ.w $1DE3                 
                    RTS
                       
CODE_1196A7:        LDY.w $2142                 
                    CPY.w $1DE6                 
                    BNE   CODE_119640           
                    DEC.w $1DEC                 
                    LDA.w $1DEC                 
                    BNE   CODE_119640           
                    INC.w $1DEC                 
                    STA.w $2142                 
                    BRA   CODE_119640
                   
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
                    db $FF                                  ; /

DATA_119780:        db $FA,$F6,$FC,$F7

DATA_119784:        db $FF,$FF,$FF,$FF

DATA_119788:        db $02,$FE,$04,$FF

DATA_11978C:        db $00,$FF,$00
                                            
DATA_11978F:        db $FF,$18

DATA_119791:        db $E0,$01

DATA_119793:        db $FF,$FE,$00
            
DATA_119796:        db $12,$16,$1A,$1E,$22,$26,$2A,$2D
                    db $30,$32,$34,$37,$39,$3B,$3D,$3E
                    db $F8,$00,$F8,$00,$08,$10,$08,$10
                    db $F8,$F8

DATA_1197B0:        db $08,$08,$F8,$F8,$08,$08

DATA_1197B6:        db $FB,$08,$15,$FB

DATA_1197BA:        db $08,$15

DATA_1197BC:        db $FB,$08,$15

DATA_1197BF:        db $FF,$00,$00,$FF,$00,$00,$FF,$00
                    db $00

DATA_1197C8:        db $FC,$FC,$FC,$08,$08,$08,$14,$14
                    db $14

DATA_1197D1:        db $FF,$FF,$FF,$00,$00,$00,$00,$00
                    db $00

DATA_1197DA:        db $1F,$06

DATA_1197DC:        db $44,$48,$4C,$50
                    
DATA_1197E0:        db $08,$04,$02,$01

DATA_1197E4:        db $00,$08,$10,$18,$F0,$E0,$F0,$E0
                    db $10,$20
          
DATA_1197EE:        db $0C,$03

DATA_1197F0:        db $00,$0A

DATA_1197F2:        db $E0,$00
 
DATA_1197F4:        db $FF,$01
         
DATA_1197F6:        db $00,$FF

DATA_1197F8:        db $10,$F0

DATA_1197FA:        db $AC,$AE,$B1,$B5,$B8,$BC,$C0,$C4
                    db $C8,$CC,$D2,$D8

DATA_119806:        db $92,$EA

DATA_119808:        db $FA,$0C

DATA_11980A:        db $81,$11

DATA_11980C:        db $43,$41

DATA_11980E:        db $42,$FE,$F8

DATA_119811:        db $7F,$3F,$3F

DATA_119814:        db $08,$06,$04,$18,$E8

DATA_119819:        db $FE,$F8,$F0,$E8

DATA_11981D:        db $F8,$08

DATA_11981F:        db $F0

DATA_119820:        db $FF,$00

DATA_119822:        db $01,$FF
 
DATA_119824:        db $30,$D0

DATA_119826:        db $01,$FF,$01

DATA_119829:        db $18,$E8,$18

DATA_11982C:        db $E8,$D0,$D8

DATA_11982F:        db $D0,$20,$E0

DATA_119832:        db $0A,$0E,$0A,$0D,$04,$07,$04,$06
                    db $10,$F0

DATA_11983C:        db $00,$01,$01,$02,$02,$03,$04,$06
                    db $08,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$08,$06,$04,$03,$02,$02,$02
                    db $02,$01,$01,$01,$01,$01,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
           
DATA_11986C:        db $00,$1C,$E4

DATA_11986F:        db $00,$D2,$02,$D6,$86,$00,$80,$00
                    db $0A,$CE,$26,$CE,$8A,$CA,$8C,$CA
                    db $0C,$72,$0E,$76,$66,$00,$68,$00
                    db $E1,$E3,$E5,$E7,$E1,$E3,$E5,$E7
                    db $20,$7A,$22,$7E,$04,$DA,$06,$DE
                    db $4C,$FE,$4E,$FC,$94,$94,$20,$FF
                    db $8C,$98,$A6,$9A,$AE,$DD,$AE,$DD
                    db $64,$7F,$06,$C3,$E2,$8C,$C2,$8E
                    db $80,$6D,$82,$6F,$87,$87,$97,$97
                    db $A0,$A0,$B0,$B0,$A1,$A1,$B1,$B1
                    db $86,$86,$96,$96,$D5,$FB,$D5,$FB
                    db $40,$82,$42,$86,$40,$82,$46,$AC
                    db $44,$8A,$42,$86,$44,$8A,$46,$AC
                    db $48,$BE,$46,$AC,$48,$BE,$46,$AC
                    db $4A,$B9,$4A,$B9,$A2,$83,$A4,$87
                    db $E4,$FF,$E4,$FF,$A2,$83,$A4,$87
                    db $8E,$C7,$08,$CB,$24,$94,$2E,$29
                    db $08,$2B,$2C,$3F,$CA,$4E,$EA,$52
                    db $CA,$4E,$CE,$58,$EE,$5C,$EC,$5A
                    db $EA,$FB,$CC,$54,$04,$CF,$28,$A5
                    db $AC,$B2,$AA,$90,$2A,$CD,$42,$A8
                    db $44,$A8,$46,$A8,$84,$A2,$86,$A4
                    db $86,$A4,$C0,$00,$E0,$00,$62,$A6
                    db $62,$AB,$6C,$FF,$42,$FF,$6A,$FF
                    db $42,$FF,$6E,$FF,$42,$FF,$22,$FF
                    db $24,$FF,$2A,$FF               

DATA_11993B:        db $00,$00,$08,$00,$0C,$10,$10,$10
                    db $3C,$14,$18,$18,$18,$20,$20,$24
                    db $24,$BC,$00,$84,$86,$FF,$FF,$8A
                    db $58,$58,$68,$54,$58,$14,$70,$00
                    db $A6,$00,$D8,$AC,$AC,$AC,$70,$76
                    db $90,$98,$7C,$8C,$00,$00,$B6,$B6
                    db $B6,$B6,$28,$2A,$2C,$2E,$30,$34
                    db $00,$38,$3A,$40,$80,$80,$82,$9E
                    db $A0,$04,$8C,$8C,$9C,$A4,$A2

DATA_119982:        db $FF,$FF,$00,$00,$01,$01,$00,$00

DATA_11998A:        db $01,$00,$00,$01,$01,$00,$00,$01
     
DATA_119992:        db $88,$2F,$88,$2F,$A6,$A7,$A8,$A9
                    db $A9,$A8,$A7,$A6,$B6,$B7,$B8,$B9
                    db $B9,$B8,$B7,$B6,$C0,$C1,$09,$E0
                    db $E1,$0B,$C3,$C4,$15,$E3,$E4,$17
                    db $C0,$C1,$09,$C9,$CA,$1B,$C0,$C1
                    db $09,$C9,$CA,$1B,$C6,$C7,$25,$E6
                    db $E7,$27,$C6,$C7,$25,$E6,$E7,$27
                    db $AE,$9E,$AE,$9E,$A0,$F2,$A2,$F6
                    db $A0,$F2,$A4,$FA,$C3,$11,$C5,$15
                    db $E4,$11,$C5,$15,$C7,$C8,$1B,$C7
                    db $CA,$1D,$E2,$C1,$C0,$C1,$E0,$C1
                    db $8A,$59,$AA,$5D,$8C,$F2,$AC,$F6
                    db $8E,$59,$AA,$5D,$8E,$59,$AC,$5D
                    db $88,$EA,$A8,$EE,$A8,$EE,$A8,$EE
                    db $88,$F2,$88,$F2,$A8,$F6,$84,$FA
                    db $00,$D2,$02,$D6,$C0,$03,$E0,$07
                    db $C2,$0B,$E2,$0F,$C0,$0B,$E0,$0F
                    db $C2,$0B,$E2,$0F,$CE,$1B,$E8,$1B
                    db $86,$2F,$3A,$3A,$A0,$E2,$A4,$E6
                    db $AA,$EA,$AC,$EE,$C0,$00,$C2,$00
                    db $88,$00,$8A,$00,$C6,$00,$C8,$00
                    db $EC,$00,$EE,$00,$E6,$00,$E8,$00
                    db $CC,$00,$CE,$00,$E2,$00,$E4,$00
                    db $E2,$00,$E4,$00,$A0,$00,$A2,$00
                    db $C4,$C4,$E4,$E4,$C6,$C6,$C8,$C8
                    db $C0,$C2,$E0,$E2,$C2,$C0,$E2,$E0
                    db $C4,$1F,$E4,$23,$CA,$00,$CC,$00
                    db $CE,$00,$CE,$00,$C4,$03,$E4,$07
                    db $C6,$0B,$E6,$0F,$C4,$0B,$E4,$0F
                    db $C6,$0B,$E6,$0F,$C8,$00,$CA,$00
                    db $CC,$00

DATA_119A84:        db $C8,$D0,$E0,$F0,$00,$10,$20,$C8

DATA_119A8C:        db $DC,$E2,$E8,$F0,$F8,$E8,$DC

DATA_119A93:        db $DC,$08,$08

DATA_119A96:        db $1C,$F4,$11,$0F

DATA_119A9A:        db $04,$06,$08,$08,$08,$08,$06,$04

DATA_119AA2:        db $00,$15,$EB,$00

DATA_119AA6:        db $02,$02,$02,$02,$01,$01,$01,$01
                    db $04,$0C,$0C,$04

DATA_119AB2:        db $01,$FF

DATA_119AB4:        db $08,$F8

DATA_119AB6:        db $01,$FF

DATA_119AB8:        db $20,$E0

DATA_119ABA:        db $14

DATA_119ABB:        db $EC,$F9,$07

DATA_119ABE:        db $FD,$FD,$FD,$FC,$FB,$FA,$F9,$F8
                    db $F7,$F8,$F9,$FA,$FB,$FC,$FD,$FD

DATA_119ACE:        db $0B,$0C,$0D,$0F,$10,$12,$14,$17
                    db $1A,$1D,$1F,$20

DATA_119ADA:        db $E2,$E2,$E2,$E3,$E4,$E5,$E7,$E9
                    db $ED,$F1,$F8,$00

DATA_119AE6:        db $02,$04,$0D,$0E

DATA_119AEA:        db $00

DATA_119AEB:        db $01

DATA_119AEC:        db $00

DATA_119AED:        db $FF,$00,$01,$00

DATA_119AF1:        db $F0

DATA_119AF2:        db $00,$F0

DATA_119AF4:        db $E0,$20,$F0,$10

DATA_119AF8:        db $04,$0C,$04,$0C

DATA_119AFC:        db $04,$04,$0C,$0C

DATA_119B00:        db $01,$FF

DATA_119B02:        db $2A,$D6

DATA_119B04:        db $01,$FF

DATA_119B06:        db $18,$E8

DATA_119B08:        db $3F,$3F,$3F,$7F

DATA_119B0C:        db $D4,$D8,$DA

DATA_119B0F:        db $DE,$1C

DATA_119B11:        db $E4,$01,$FF

DATA_119B14:        db $28,$D8

DATA_119B16:        db $10

DATA_119B17:        db $F0,$F8,$10

DATA_119B1A:        db $08,$28,$48,$28

DATA_119B1E:        db $94,$84,$94,$84

DATA_119B22:        db $F8,$08,$F8,$08,$08,$F8,$08,$F8

DATA_119B2A:        db $E0,$F0,$E8,$E4,$FF,$FF

DATA_119B30:        db $FE,$FB,$F8

DATA_119B33:        db $30,$60,$90

DATA_119B36:        db $03,$06,$09

DATA_119B39:        db $D0,$A0,$70

DATA_119B3C:        db $00,$04

DATA_119B3E:        db $0A

DATA_119B3F:        db $04,$0A,$00,$01,$01,$01

DATA_119B45:        db $01,$02,$04,$04,$04,$04,$08,$08

DATA_119B4D:        db $00,$10,$F0     

DATA_119B50:        db $C2,$D4,$C3,$C4,$07,$80,$81,$9E
                    db $9F,$27,$18,$19

DATA_119B5C:        db $00,$FF
    
DATA_119B5E:        db $EE,$DE
 
DATA_119B60:        db $09,$A1

DATA_119B62:        db $05,$0A,$0F,$14,$19

DATA_119B67:        db $FE,$02

DATA_119B69:        db $FC,$00,$04,$00

DATA_119B6D:        db $FD,$03

DATA_119B6F:        db $0C,$0A,$08,$05,$03,$02,$02,$02
                    db $02,$02

DATA_119B79:        db $02,$00,$09

DATA_119B7C:        db $00,$00,$D0,$30,$D0,$30,$D0,$30

DATA_119B84:        db $18,$00,$18,$F8

DATA_119B88:        db $F0,$10

DATA_119B8A:        db $02,$02,$01,$01,$02,$02,$02,$02

DATA_119B92:        db $08,$08,$04,$04,$02,$02,$01,$01

DATA_119B9A:        db $F0,$10

DATA_119B9C:        db $00,$04,$08

DATA_119B9F:        db $39,$39,$39,$3A,$36,$33,$32,$38
                    db $35,$37,$3E,$40,$3A,$09

DATA_119BAD:        db $39

DATA_119BAE:        db $51

DATA_119BAF:        db $50,$83,$52,$56,$91,$2A,$2B

DATA_119BB6:        db $0A

DATA_119BB7:        db $01

DATA_119BB8:        db $0B,$01

DATA_119BBA:        db $02,$80,$00

DATA_119BBD:        db $00,$08,$00,$04

DATA_119BC1:        db $40,$00,$80,$00,$C0,$00,$00,$01
                    db $40,$01,$80,$01,$C0,$01,$00,$02
                    db $10,$01,$50,$01,$90,$01,$D0,$01
                    db $10,$02,$50,$02,$90,$02,$D0,$02
                    db $E0,$01,$20,$02,$60,$02,$A0,$02
                    db $E0,$02,$20,$03,$60,$03,$A0,$03
                    db $B0,$00,$F0,$00,$30,$01,$70,$01
                    db $B0,$01,$F0,$01,$30,$02,$70,$02

DATA_119C01:        db $00,$02,$D0,$02,$A0,$03,$70,$02

DATA_119C09:        db $00,$00,$D0,$00,$A0,$01,$70,$00

DATA_119C11:        db $00,$01,$02

DATA_119C14:        db $C0,$80,$40

PNTR_119C17:        dw $0302                ; 00 - RAM table.
                    dw DATA_119C2D          ; 01 - Layer 1 data for the 'fairies getting out of jar' room.
                    dw DATA_11A444          ; 02 - Layer 1 data ('Contributor' box and fairy crowd) during the "dragging off Wart" scene.
                    dw DATA_11A869          ; 03 - Layer 2 data (the windows) during the "dragging off Wart" scene.
                    dw DATA_11A9A2
                    dw DATA_11AA2B
                    dw DATA_11AA9C
                    dw DATA_11AAB1
                    dw DATA_11AAC6
                    dw DATA_11AADB
                    dw DATA_11A3EC

DATA_119C2D:        db $00,$00,$80,$3B,$0E,$11,$1E,$11
                    db $26,$11,$36,$11,$0E,$11,$1E,$11
                    db $26,$11,$36,$11,$0E,$11,$1E,$11
                    db $26,$11,$36,$11,$0E,$11,$1E,$11
                    db $26,$11,$36,$11,$0A,$11,$1A,$11
                    db $22,$11,$32,$11,$0A,$11,$1A,$11
                    db $22,$11,$32,$11,$0A,$11,$1A,$11
                    db $22,$11,$32,$11,$0A,$11,$1A,$11
                    db $00,$01,$80,$3B,$0F,$11,$1F,$11
                    db $27,$11,$37,$11,$0F,$11,$1F,$11
                    db $27,$11,$37,$11,$0F,$11,$1F,$11
                    db $27,$11,$37,$11,$0F,$11,$1F,$11
                    db $27,$11,$37,$11,$0B,$11,$1B,$11
                    db $23,$11,$33,$11,$0B,$11,$1B,$11
                    db $23,$11,$33,$11,$0B,$11,$1B,$11
                    db $23,$11,$33,$11,$0B,$11,$1B,$11
                    db $02,$02,$80,$1B,$06,$11,$16,$11
                    db $26,$11,$36,$11,$0E,$11,$1E,$11
                    db $26,$11,$36,$11,$0E,$11,$1E,$11
                    db $24,$11,$34,$11,$0C,$11,$1C,$11
                    db $02,$03,$80,$1B,$07,$11,$17,$11
                    db $27,$11,$37,$11,$0F,$11,$1F,$11
                    db $27,$11,$37,$11,$0F,$11,$1F,$11
                    db $25,$11,$35,$11,$0D,$11,$1D,$11
                    db $03,$44,$00,$2F,$02,$11,$03,$11
                    db $04,$11,$05,$11,$02,$11,$03,$11
                    db $04,$11,$05,$11,$02,$11,$03,$11
                    db $04,$11,$05,$11,$02,$11,$03,$11
                    db $04,$11,$05,$11,$02,$11,$03,$11
                    db $04,$11,$05,$11,$02,$11,$03,$11
                    db $04,$11,$05,$11,$03,$64,$00,$2F
                    db $12,$11,$13,$11,$14,$11,$15,$11
                    db $12,$11,$13,$11,$14,$11,$15,$11
                    db $12,$11,$13,$11,$14,$11,$15,$11
                    db $12,$11,$13,$11,$14,$11,$15,$11
                    db $12,$11,$13,$11,$14,$11,$15,$11
                    db $12,$11,$13,$11,$14,$11,$15,$11
                    db $03,$84,$00,$2F,$0A,$11,$0B,$11
                    db $0C,$11,$0D,$11,$0A,$11,$0B,$11
                    db $0C,$11,$0D,$11,$0A,$11,$0B,$11
                    db $0C,$11,$0D,$11,$0A,$11,$0B,$11
                    db $0C,$11,$0D,$11,$0A,$11,$0B,$11
                    db $0C,$11,$0D,$11,$0A,$11,$0B,$11
                    db $0C,$11,$0D,$11,$03,$A4,$00,$2F
                    db $1A,$11,$1B,$11,$1C,$11,$1D,$11
                    db $1A,$11,$1B,$11,$1C,$11,$1D,$11
                    db $1A,$11,$1B,$11,$1C,$11,$1D,$11
                    db $1A,$11,$1B,$11,$1C,$11,$1D,$11
                    db $1A,$11,$1B,$11,$1C,$11,$1D,$11
                    db $1A,$11,$1B,$11,$1C,$11,$1D,$11
                    db $02,$1C,$80,$1B,$00,$11,$10,$11
                    db $20,$11,$30,$11,$08,$11,$18,$11
                    db $20,$11,$30,$11,$08,$11,$18,$11
                    db $22,$11,$32,$11,$0A,$11,$1A,$11
                    db $02,$1D,$80,$1B,$01,$11,$11,$11
                    db $21,$11,$31,$11,$09,$11,$19,$11
                    db $21,$11,$31,$11,$09,$11,$19,$11
                    db $23,$11,$33,$11,$0B,$11,$1B,$11
                    db $00,$1E,$80,$3B,$08,$11,$18,$11
                    db $20,$11,$30,$11,$08,$11,$18,$11
                    db $20,$11,$30,$11,$08,$11,$18,$11
                    db $20,$11,$30,$11,$08,$11,$18,$11
                    db $20,$11,$30,$11,$0C,$11,$1C,$11
                    db $24,$11,$34,$11,$0C,$11,$1C,$11
                    db $24,$11,$34,$11,$0C,$11,$1C,$11
                    db $24,$11,$34,$11,$0C,$11,$1C,$11
                    db $00,$1F,$80,$3B,$09,$11,$19,$11
                    db $21,$11,$31,$11,$09,$11,$19,$11
                    db $21,$11,$31,$11,$09,$11,$19,$11
                    db $21,$11,$31,$11,$09,$11,$19,$11
                    db $21,$11,$31,$11,$0D,$11,$1D,$11
                    db $25,$11,$35,$11,$0D,$11,$1D,$11
                    db $25,$11,$35,$11,$0D,$11,$1D,$11
                    db $25,$11,$35,$11,$0D,$11,$1D,$11
                    db $02,$C6,$00,$03,$AC,$08,$AD,$08
                    db $02,$E6,$C0,$04,$AB,$08,$02,$E7
                    db $C0,$04,$AB,$08,$02,$90,$80,$07
                    db $88,$14,$89,$14,$89,$14,$8C,$14
                    db $02,$91,$80,$07,$8A,$14,$8B,$14
                    db $8B,$14,$8D,$14,$03,$0E,$00,$0B
                    db $74,$18,$76,$18,$74,$18,$76,$18
                    db $74,$18,$76,$18,$03,$2E,$00,$0B
                    db $75,$18,$77,$18,$75,$18,$77,$18
                    db $75,$18,$77,$18,$02,$C6,$80,$07
                    db $A0,$14,$A3,$14,$B0,$14,$B1,$14
                    db $02,$C7,$80,$07,$A0,$54,$A3,$54
                    db $B0,$54,$B1,$54,$10,$02,$00,$37
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $10,$23,$40,$34,$70,$1D,$10,$22
                    db $00,$01,$71,$5D,$10,$27,$00,$03
                    db $71,$1D,$71,$5D,$10,$2D,$00,$03
                    db $71,$1D,$71,$5D,$10,$33,$00,$03
                    db $71,$1D,$71,$5D,$10,$39,$00,$03
                    db $71,$1D,$71,$5D,$10,$47,$C0,$06
                    db $5F,$5D,$10,$4D,$C0,$06,$5F,$5D
                    db $10,$53,$C0,$06,$5F,$5D,$10,$59
                    db $C0,$06,$5F,$5D,$10,$42,$C0,$06
                    db $5F,$1D,$10,$48,$C0,$06,$5F,$1D
                    db $10,$4E,$C0,$06,$5F,$1D,$10,$54
                    db $C0,$06,$5F,$1D,$10,$5A,$C0,$06
                    db $5F,$1D,$10,$C3,$40,$34,$70,$9D
                    db $10,$C2,$00,$01,$71,$DD,$10,$C7
                    db $00,$03,$71,$9D,$71,$DD,$10,$CD
                    db $00,$03,$71,$9D,$71,$DD,$10,$D3
                    db $00,$03,$71,$9D,$71,$DD,$10,$D9
                    db $00,$03,$71,$9D,$71,$DD,$10,$43
                    db $00,$07,$43,$05,$44,$05,$45,$05
                    db $46,$05,$10,$4F,$00,$07,$43,$05
                    db $44,$05,$45,$05,$46,$05,$10,$5B
                    db $00,$05,$43,$05,$44,$05,$45,$05
                    db $10,$63,$00,$07,$53,$05,$54,$05
                    db $55,$05,$56,$05,$10,$6F,$00,$07
                    db $53,$05,$54,$05,$55,$05,$56,$05
                    db $10,$7B,$00,$05,$53,$05,$54,$05
                    db $55,$05,$10,$83,$00,$07,$63,$05
                    db $64,$05,$65,$05,$66,$05,$10,$8F
                    db $00,$07,$63,$05,$64,$05,$65,$05
                    db $66,$05,$10,$9B,$00,$05,$63,$05
                    db $64,$05,$65,$05,$10,$A3,$00,$07
                    db $73,$05,$74,$05,$75,$05,$76,$05
                    db $10,$AF,$00,$07,$73,$05,$74,$05
                    db $75,$05,$76,$05,$10,$BB,$00,$05
                    db $73,$05,$74,$05,$75,$05,$10,$49
                    db $00,$07,$47,$05,$48,$05,$49,$05
                    db $4A,$05,$10,$55,$00,$07,$47,$05
                    db $48,$05,$49,$05,$4A,$05,$10,$69
                    db $00,$07,$57,$05,$58,$05,$59,$05
                    db $5A,$05,$10,$75,$00,$07,$57,$05
                    db $58,$05,$59,$05,$5A,$05,$10,$89
                    db $00,$07,$67,$05,$68,$05,$69,$05
                    db $6A,$05,$10,$95,$00,$07,$67,$05
                    db $68,$05,$69,$05,$6A,$05,$10,$A9
                    db $00,$07,$77,$05,$78,$05,$79,$05
                    db $7A,$05,$10,$B5,$00,$07,$77,$05
                    db $78,$05,$79,$05,$7A,$05,$10,$E2
                    db $80,$13,$41,$1D,$40,$1D,$60,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$60,$1D,$40,$1D,$10,$E3
                    db $80,$13,$40,$1D,$41,$1D,$61,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$61,$1D,$41,$1D,$10,$E4
                    db $80,$25,$41,$1D,$50,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $40,$1D,$51,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $10,$E5,$80,$25,$40,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $40,$1D,$60,$1D,$40,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$10,$E6,$80,$25,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$61,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$51,$1D,$10,$E7,$80,$25
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$41,$1D,$40,$1D,$60,$1D
                    db $40,$1D,$51,$1D,$50,$1D,$41,$1D
                    db $40,$1D,$51,$1D,$40,$1D,$10,$E8
                    db $80,$25,$41,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$51,$1D,$40,$1D,$41,$1D
                    db $61,$1D,$41,$1D,$40,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $10,$E9,$80,$25,$40,$1D,$41,$1D
                    db $40,$1D,$51,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$10,$EA,$80,$11,$41,$1D
                    db $40,$1D,$60,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$4E,$1D,$5C,$1D,$5E,$1D
                    db $10,$EB,$80,$11,$40,$1D,$41,$1D
                    db $61,$1D,$41,$1D,$40,$1D,$4B,$1D
                    db $4F,$1D,$5D,$1D,$6B,$1D,$10,$EC
                    db $80,$0D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$7C,$1D,$4C,$1D,$4D,$1D
                    db $10,$ED,$80,$0B,$40,$1D,$41,$1D
                    db $40,$1D,$42,$1D,$7D,$1D,$4D,$1D
                    db $10,$EE,$80,$09,$41,$1D,$40,$1D
                    db $41,$1D,$52,$1D,$7E,$1D,$10,$EF
                    db $80,$09,$40,$1D,$41,$1D,$40,$1D
                    db $62,$1D,$7F,$1D,$10,$F0,$80,$07
                    db $41,$1D,$40,$1D,$41,$1D,$72,$1D
                    db $12,$0A,$C0,$12,$7B,$1D,$12,$17
                    db $C0,$12,$7B,$5D,$10,$F7,$80,$11
                    db $40,$1D,$40,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$4E,$5D,$5C,$5D
                    db $5E,$5D,$10,$F6,$80,$11,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $4B,$5D,$4F,$5D,$5D,$5D,$6B,$5D
                    db $10,$F5,$80,$0D,$40,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$7C,$5D,$4C,$5D
                    db $4D,$5D,$10,$F4,$80,$0B,$41,$1D
                    db $50,$1D,$41,$1D,$42,$5D,$7D,$5D
                    db $4D,$5D,$10,$F3,$80,$09,$40,$1D
                    db $41,$1D,$40,$5D,$52,$5D,$7E,$5D
                    db $10,$F2,$80,$09,$41,$1D,$40,$1D
                    db $41,$1D,$62,$5D,$7F,$5D,$10,$F1
                    db $80,$07,$40,$1D,$41,$1D,$40,$1D
                    db $72,$5D,$10,$F8,$80,$25,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$10,$F9,$80,$25
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$10,$FA
                    db $80,$25,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $10,$FB,$80,$25,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$60,$1D
                    db $50,$1D,$51,$1D,$40,$1D,$41,$1D
                    db $50,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$41,$1D,$40,$1D,$51,$1D
                    db $40,$1D,$10,$FC,$80,$13,$41,$1D
                    db $50,$1D,$41,$1D,$40,$1D,$41,$1D
                    db $61,$1D,$51,$1D,$40,$1D,$41,$1D
                    db $40,$1D,$10,$FD,$80,$13,$40,$1D
                    db $51,$1D,$40,$1D,$41,$1D,$50,$1D
                    db $41,$1D,$40,$1D,$41,$1D,$40,$1D
                    db $41,$1D,$12,$4B,$00,$17,$6C,$1D
                    db $6D,$1D,$6C,$1D,$6D,$1D,$6C,$1D
                    db $6D,$1D,$6C,$1D,$6D,$1D,$6C,$1D
                    db $6D,$1D,$6C,$1D,$6D,$1D,$12,$6B
                    db $00,$17,$6E,$1D,$6F,$1D,$6F,$5D
                    db $6E,$5D,$6E,$1D,$6F,$1D,$6F,$5D
                    db $6E,$5D,$6E,$1D,$6F,$1D,$6F,$5D
                    db $6E,$5D,$12,$8B,$40,$16,$5B,$1D
                    db $12,$AB,$40,$16,$5B,$1D,$12,$CB
                    db $40,$16,$5B,$1D,$12,$EB,$40,$16
                    db $5B,$1D,$13,$0B,$40,$16,$5B,$1D
                    db $13,$2B,$40,$16,$5B,$1D,$FF     

DATA_11A3EC:        db $30,$80,$80,$80,$80,$80,$80,$80
                    db $80,$80

DATA_11A3F6:        db $B0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
                    db $A0,$95             

DATA_11A400:        db $10,$F4,$0C,$E8,$18,$EC,$14,$F8
                    db $08,$00

DATA_11A40A:        db $00,$C4,$C4,$B8,$B8,$A8,$A8,$A0
                    db $A0,$00

DATA_11A414:        db $00,$F0,$E0,$C0,$A0,$80,$60,$40
                    db $20,$00

DATA_11A41E:        db $00

DATA_11A41F:        db $21,$61,$21,$61,$21,$61,$21
                    db $61

DATA_11A427:        db $22,$14,$0A,$14

DATA_11A42B:        db $0A,$1C,$1B,$1E,$1D,$1F

DATA_11A431:        db $04,$04
                    db $04,$01

DATA_11A435:        db $A4
 
DATA_11A436:        db $A6,$A6,$A4,$8E,$8E

DATA_11A43B:        db $90,$98,$A0,$A8,$B0,$B8,$C0,$C8
                    db $00
               
DATA_11A444:        db $00,$00,$00,$3F,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$1A,$1D,$1B,$1D
                    db $1A,$1D,$1B,$1D,$00,$20,$00,$3F
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $2A,$1D,$2B,$1D,$2A,$1D,$2B,$1D
                    db $00,$40,$00,$3F,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$3A,$1D,$3B,$1D
                    db $3A,$1D,$3B,$1D,$00,$68,$00,$01
                    db $F8,$14,$00,$69,$40,$1A,$F9,$14
                    db $00,$77,$00,$01,$FA,$14,$00,$88
                    db $C0,$04,$FB,$14,$00,$89,$40,$1A
                    db $BE,$14,$00,$A9,$40,$1A,$BE,$14
                    db $00,$C9,$40,$1A,$BE,$14,$00,$97
                    db $C0,$04,$FC,$14,$00,$E8,$00,$01
                    db $FD,$14,$00,$E9,$40,$1A,$FE,$14
                    db $00,$F7,$00,$01,$FF,$14,$00,$8B
                    db $00,$15,$CC,$15,$D8,$15,$D7,$15
                    db $DD,$15,$DB,$15,$D2,$15,$CB,$15
                    db $DE,$15,$DD,$15,$D8,$15,$DB,$15
                    db $01,$08,$00,$1F,$EC,$15,$ED,$15
                    db $ED,$15,$EE,$15,$EC,$15,$ED,$15
                    db $ED,$15,$EE,$15,$EC,$15,$ED,$15
                    db $ED,$15,$EE,$15,$EC,$15,$ED,$15
                    db $ED,$15,$EE,$15,$01,$28,$00,$01
                    db $EF,$15,$01,$37,$00,$01,$FF,$15
                    db $01,$48,$00,$1F,$FC,$15,$FD,$15
                    db $FD,$15,$FE,$15,$FC,$15,$FD,$15
                    db $FD,$15,$FE,$15,$FC,$15,$FD,$15
                    db $FD,$15,$FE,$15,$FC,$15,$FD,$15
                    db $FD,$15,$FE,$15,$03,$00,$00,$3F
                    db $C0,$18,$C1,$18,$C2,$18,$C3,$18
                    db $C4,$18,$C5,$18,$C6,$18,$C7,$18
                    db $C0,$18,$C1,$18,$C2,$18,$C3,$18
                    db $C4,$18,$C5,$18,$C8,$18,$C9,$18
                    db $C0,$18,$C1,$18,$C2,$18,$C3,$18
                    db $C4,$18,$C5,$18,$C6,$18,$C7,$18
                    db $C0,$18,$C1,$18,$C8,$18,$C9,$18
                    db $C4,$18,$C5,$18,$C6,$18,$C7,$18
                    db $03,$20,$00,$3F,$D0,$18,$D1,$18
                    db $D2,$18,$D3,$18,$D4,$18,$D5,$18
                    db $D6,$18,$D7,$18,$D0,$18,$D1,$18
                    db $D2,$18,$D3,$18,$D4,$18,$D5,$18
                    db $D8,$18,$D9,$18,$D0,$18,$D1,$18
                    db $D2,$18,$D3,$18,$D4,$18,$D5,$18
                    db $D6,$18,$D7,$18,$D0,$18,$D1,$18
                    db $D8,$18,$D9,$18,$D4,$18,$D5,$18
                    db $D6,$18,$D7,$18,$07,$00,$00,$3F
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $CA,$18,$CB,$18,$CA,$18,$CB,$18
                    db $07,$20,$00,$3F,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$DA,$18,$DB,$18
                    db $DA,$18,$DB,$18,$03,$40,$00,$3F
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $03,$60,$00,$3F,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$03,$80,$00,$3F
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $07,$40,$00,$3F,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$04,$1D,$05,$1D
                    db $04,$1D,$05,$1D,$07,$60,$00,$3F
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $14,$1D,$15,$1D,$14,$1D,$15,$1D
                    db $07,$80,$00,$3F,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$0A,$1D,$0B,$1D
                    db $0A,$1D,$0B,$1D,$FF

DATA_11A869:        db $12,$80,$40,$3F,$E2,$10,$12,$A0
                    db $40,$3F,$E3,$10,$12,$C0,$40,$3F
                    db $E3,$10,$12,$E0,$40,$3F,$E3,$10
                    db $13,$00,$40,$3F,$E3,$10,$13,$20
                    db $40,$3F,$E4,$10,$10,$C3,$00,$07
                    db $E5,$10,$E7,$10,$E9,$10,$EB,$10
                    db $10,$E3,$00,$07,$E6,$10,$E8,$10
                    db $EA,$10,$EC,$10,$11,$03,$00,$07
                    db $ED,$10,$F0,$10,$F3,$10,$F5,$10
                    db $11,$23,$C0,$0C,$EE,$10,$11,$24
                    db $C0,$0C,$F1,$10,$11,$25,$C0,$0C
                    db $F4,$10,$11,$26,$C0,$0C,$F6,$10
                    db $12,$03,$00,$07,$EF,$10,$F2,$10
                    db $F2,$10,$F7,$10,$10,$D9,$00,$07
                    db $E5,$10,$E7,$10,$E9,$10,$EB,$10
                    db $10,$F9,$00,$07,$E6,$10,$E8,$10
                    db $EA,$10,$EC,$10,$11,$19,$00,$07
                    db $ED,$10,$F0,$10,$F3,$10,$F5,$10
                    db $11,$39,$C0,$0C,$EE,$10,$11,$3A
                    db $C0,$0C,$F1,$10,$11,$3B,$C0,$0C
                    db $F4,$10,$11,$3C,$C0,$0C,$F6,$10
                    db $12,$19,$00,$07,$EF,$10,$F2,$10
                    db $F2,$10,$F7,$10,$11,$C9,$40,$1A
                    db $E0,$08,$11,$E9,$40,$1A,$E1,$08
                    db $12,$09,$00,$1B,$CE,$08,$CF,$08
                    db $CE,$08,$CF,$08,$CE,$08,$CF,$08
                    db $CE,$08,$CF,$08,$CE,$08,$CF,$08
                    db $CE,$08,$CF,$08,$CE,$08,$CF,$08
                    db $12,$29,$00,$1B,$DE,$08,$DF,$08
                    db $DE,$08,$DF,$08,$DE,$08,$DF,$08
                    db $DE,$08,$DF,$08,$DE,$08,$DF,$08
                    db $DE,$08,$DF,$08,$DE,$08,$DF,$08
                    db $12,$4A,$00,$03,$CC,$08,$CD,$08
                    db $12,$6A,$C0,$0A,$DC,$08,$12,$6B
                    db $C0,$0A,$DD,$08,$13,$2A,$00,$03
                    db $CC,$88,$CD,$88,$12,$54,$00,$03
                    db $CC,$08,$CD,$08,$12,$74,$C0,$0A
                    db $DC,$08,$12,$75,$C0,$0A,$DD,$08
                    db $13,$34,$00,$03,$CC,$88,$CD,$88
                    db $FF

DATA_11A9A2:        db $03,$00,$00,$3F,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$C8,$18,$C9,$18
                    db $C8,$18,$C9,$18,$03,$20,$00,$3F
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $D8,$18,$D9,$18,$D8,$18,$D9,$18
                    db $FF

DATA_11AA2B:        db $01,$AC,$00,$0D,$ED,$00,$E1,$00
                    db $DE,$00,$FB,$00,$DE,$00,$E7,$00
                    db $DD,$00,$FF

DATA_11AA3E:        db $50,$4F,$CA,$21,$50,$5F,$CC,$21
                    db $68,$4F,$CE,$23,$68,$5F,$E6,$23
                    db $88,$4F,$EC,$27,$88,$5F,$EE,$27
                    db $A0,$4F,$E8,$25,$A0,$5F,$EA,$25

DATA_11AA5E:        db $C0,$C8,$B8,$B8,$C8,$C0

DATA_11AA64:        db $C0,$08,$E0,$F0,$D0,$E8

DATA_11AA6A:        db $C0,$C2,$C4,$E0,$E2,$E4

DATA_11AA70:        db $00,$10,$20,$00,$10,$20

DATA_11AA76:        db $00,$00,$00,$10,$10,$10

DATA_11AA7C:        db $C8,$C6,$C7,$C6,$C7,$C8

DATA_11AA82:        db $00,$06,$03,$09,$0F,$0C

DATA_11AA88:        db $CA,$8A,$CC,$8C,$CE,$8E,$E6,$A0
                    db $EC,$EC,$EE,$A4,$E8,$A2,$EA,$EA

DATA_11AA98:        db $02,$06,$0A,$0E

DATA_11AA9C:        db $00,$CC,$00,$0F,$BE,$14,$D6,$15
                    db $CA,$15,$DB,$15,$D2,$15,$D8,$15
                    db $BE,$14,$BE,$14,$FF

DATA_11AAB1:        db $00,$CC,$00,$0F,$D9,$15,$DB,$15
                    db $D2,$15,$D7,$15,$CC,$15,$CE,$15
                    db $DC,$15,$DC,$15,$FF

DATA_11AAC6:        db $00,$CC,$00,$0F,$BE,$14,$BE,$14
                    db $DD,$15,$D8,$15,$CA,$15,$CD,$15
                    db $BE,$14,$BE,$14,$FF

DATA_11AADB:        db $00,$CC,$00,$0F,$BE,$14,$D5,$15
                    db $DE,$15,$D2,$15,$D0,$15,$D2,$15
                    db $BE,$14,$BE,$14,$FF

DATA_11AAF0:        db $00,$F0,$E0,$D0,$C0,$B0,$A0,$90
                    db $80,$70,$60

DATA_11AAFB:        db $20,$20,$21,$22,$23,$24,$25,$26
                    db $27,$28,$29

DATA_11AB06:        db $7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E
                    db $7E,$7E,$7E

DATA_11AB11:        db $00,$0B,$16,$21,$2C,$37,$42,$4D
                    db $58,$63                

DATA_11AB1B:        db $00,$F0,$E0,$D0,$C0,$B0,$A0,$90
                    db $80,$70

DATA_11AB25:        db $C0,$C0,$C1,$C2,$C3,$C4,$C5,$C6
                    db $C7,$C8
                 
DATA_11AB2F:        db $F0,$10

DATA_11AB31:        db $02,$01,$02,$02,$00,$00,$00,$00

DATA_11AB39:        db $08,$04,$02,$01,$08,$04,$02,$01

DATA_11AB41:        db $F8,$08

DATA_11AB43:        db $08,$04

DATA_11AB45:        db $0C,$11

DATA_11AB47:        db $F9,$FF,$00,$00,$0C,$18,$1A,$01
                    db $06,$0A,$0C,$18,$1A,$1C,$FF,$FF
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00

DATA_11AB63:        db $80,$80,$80,$80,$82,$80,$80,$80
                    db $82,$82,$80,$80,$82,$82,$82,$80
                    db $82,$82,$82,$82

DATA_11AB77:        db $00,$03,$00,$FD

DATA_11AB7B:        db $1F,$02,$E0,$13,$51,$7E,$1F,$02

DATA_11AB83:        db $08,$77,$FF,$7F,$18

PNTR_11AB88:        db $A4,$E4,$24,$64,$A4,$E4,$24

PNTR_11AB8F:        db $C4,$04,$44,$84,$C4,$04,$44

PNTR_11AB96:        db $AB,$AB,$AC,$AC,$AC,$AC,$AD

PNTR_11AB9D:        db $AB,$AC,$AC,$AC,$AC,$AD,$AD

                    db $00,$A7,$DB,$00,$00,$A7,$A7,$A7
                    db $00,$AE,$AE,$AE,$00,$B0,$B0,$B0
                    db $00,$DC,$A9,$2C,$00,$AE,$AE,$A7
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$AB,$AC,$C6,$00,$05,$AE,$00
                    db $00,$00,$00,$00,$00,$00,$B0,$00
                    db $00,$00,$C2,$00,$00,$00,$AE,$00
                    db $00,$9D,$AC,$C6,$00,$40,$AC,$C6

                    db $00,$A7,$A7,$A7,$00,$92,$92,$92
                    db $00,$93,$93,$93,$00,$AE,$AE,$AE
                    db $00,$B0,$B0,$B0,$00,$DC,$A9,$2C
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$AB,$AC,$C6,$00,$9D,$AE,$00
                    db $00,$40,$A9,$40,$00,$9D,$AC,$C6
                    db $00,$40,$AC,$C6,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$A7,$DB,$00,$00,$A7,$A7,$A7
                    db $00,$AE,$AE,$AE,$00,$B0,$B0,$B0
                    db $00,$DC,$A9,$2C,$00,$AE,$AE,$A7
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$C6,$AC,$AB,$00,$05,$AE,$00
                    db $00,$9D,$AC,$C6,$00,$00,$B0,$00
                    db $00,$00,$C2,$00,$00,$00,$AE,$00
                    db $00,$40,$AC,$C6,$00,$06,$AE,$00

                    db $00,$A7,$DB,$00,$00,$A7,$26,$00
                    db $00,$AE,$AE,$AE,$00,$B0,$B0,$B0
                    db $00,$DC,$A9,$2C,$00,$0A,$0A,$08
                    db $00,$33,$33,$33,$00,$00,$00,$00

                    db $00,$C6,$A7,$AB,$00,$B0,$B0,$B0
                    db $00,$A9,$A9,$A9,$00,$AE,$AE,$AE
                    db $00,$DC,$DC,$DC,$00,$2C,$2C,$2C
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$A7,$DB,$40,$00,$A7,$A7,$A7
                    db $00,$AE,$AE,$AE,$00,$B0,$B0,$B0
                    db $00,$DC,$A9,$2C,$00,$AE,$AE,$A7
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$AB,$AC,$C6,$00,$05,$AE,$00
                    db $00,$40,$00,$00,$00,$00,$B0,$00
                    db $00,$00,$C2,$00,$00,$00,$AE,$00
                    db $00,$9D,$AC,$C6,$00,$40,$AC,$C6

                    db $00,$A7,$A7,$A7,$00,$92,$92,$92
                    db $00,$93,$93,$93,$00,$AE,$AE,$AE
                    db $00,$B0,$B0,$B0,$00,$DC,$A9,$2C
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$AB,$AC,$C6,$00,$9D,$AE,$00
                    db $00,$40,$2C,$40,$00,$9D,$AC,$C6
                    db $00,$40,$AC,$C6,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$AA,$AA,$AA,$00,$DD,$AA,$2D
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00

                    db $00,$AA,$AA,$AA,$00,$05,$AE,$00
                    db $00,$00,$00,$00,$00,$00,$AA,$00
                    db $00,$00,$C2,$00,$00,$00,$AE,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00

DATA_11AD64:        db $6C,$6C,$6C,$6C

DATA_11AD68:        db $AD,$AF,$B1,$B3

                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$B4,$0C,$BF,$00,$B5,$0C
                    db $B6,$0C,$B8,$0C,$B7,$0C,$B9,$0C
                    db $B2,$0C,$B3,$0C,$BF,$00,$BF,$00
                    db $0B,$0C,$0B,$0C,$0C,$0C,$0C,$4C
                    db $0C,$0C,$0C,$4C,$0C,$0C,$0C,$4C
                    db $24,$0C,$26,$0C,$25,$0C,$27,$0C
                    db $9E,$08,$9F,$08,$9E,$08,$9F,$08
                    db $0F,$2C,$0F,$2C,$0A,$2C,$0A,$2C
                    db $46,$14,$3A,$14,$46,$14,$3A,$14
                    db $0A,$2C,$0A,$2C,$0A,$2C,$0A,$2C
                    db $3A,$14,$3A,$14,$3A,$14,$3A,$14
                    db $10,$2C,$10,$2C,$0A,$2C,$0A,$2C
                    db $3A,$14,$48,$14,$3A,$14,$48,$14
                    db $44,$14,$45,$14,$46,$14,$3A,$14
                    db $45,$14,$45,$14,$3A,$14,$3A,$14
                    db $45,$14,$48,$14,$3A,$14,$48,$14
                    db $0F,$2C,$12,$2C,$0A,$2C,$0A,$2C
                    db $BF,$04,$D6,$04,$BF,$04,$DD,$04
                    db $BF,$04,$BF,$04,$E2,$04,$BF,$04
                    db $BF,$04,$EE,$04,$BF,$04,$E3,$04
                    db $F2,$04,$BF,$04,$E9,$04,$BF,$04
                    db $0F,$2C,$23,$2C,$0A,$2C,$0A,$2C
                    db $11,$2C,$0F,$2C,$0A,$2C,$0A,$2C
                    db $9E,$08,$9F,$08,$A6,$08,$A7,$08
                    db $A6,$88,$A7,$88,$9E,$08,$9F,$08
                    db $C0,$18,$C1,$18,$BF,$00,$BF,$00
                    db $CA,$10,$CB,$10,$D0,$10,$D1,$10
                    db $C6,$10,$C7,$10,$C7,$10,$C6,$10
                    db $CC,$10,$CD,$10,$C7,$10,$C6,$10
                    db $CE,$10,$CF,$10,$D2,$10,$D3,$10
                    db $C2,$18,$C3,$18,$BF,$00,$BF,$00
                    db $C4,$10,$C5,$10,$D0,$10,$D1,$10
                    db $C8,$10,$C9,$10,$D2,$10,$D3,$10
                    db $74,$18,$76,$18,$75,$18,$77,$18
                    db $1B,$0C,$1D,$0C,$1C,$0C,$1E,$0C
                    db $1F,$0C,$1D,$0C,$20,$0C,$1E,$0C
                    db $1F,$0C,$21,$0C,$1E,$0C,$22,$0C
                    db $58,$0C,$5A,$0C,$59,$0C,$5B,$0C
                    db $9E,$08,$9F,$08,$9E,$08,$9F,$08
                    db $DA,$10,$DB,$10,$BF,$00,$BF,$00
                    db $D8,$10,$D9,$10,$D4,$10,$D5,$10
                    db $D8,$10,$D9,$10,$CD,$10,$CC,$10
                    db $D8,$10,$D9,$10,$CE,$10,$CF,$10
                    db $8E,$10,$8F,$10,$8F,$10,$8E,$10
                    db $72,$08,$73,$08,$73,$08,$72,$08
                    db $19,$18,$19,$18,$1A,$18,$1A,$18
                    db $92,$00,$93,$00,$93,$00,$92,$00
                    db $74,$18,$76,$18,$75,$18,$77,$18
                    db $70,$10,$72,$10,$71,$10,$73,$10
                    db $71,$10,$73,$10,$71,$10,$73,$10
                    db $6C,$08,$6E,$08,$6D,$08,$6F,$08
                    db $32,$10,$34,$10,$33,$10,$35,$10
                    db $33,$10,$35,$10,$33,$10,$35,$10
                    db $4A,$08,$4B,$08,$4C,$08,$4D,$08
                    db $30,$10,$72,$10,$31,$10,$73,$10
                    db $70,$10,$3E,$10,$71,$10,$3F,$10
                    db $3C,$10,$AF,$10,$3D,$10,$AE,$10
                    db $AE,$10,$5E,$10,$AF,$10,$5F,$10
                    db $4F,$10,$A3,$10,$4E,$10,$4F,$10
                    db $C9,$D0,$C8,$D0,$D3,$D0,$D2,$D0
                    db $C5,$D0,$C4,$D0,$D1,$D0,$D0,$D0
                    db $C6,$10,$C7,$10,$C7,$10,$C6,$10
                    db $C4,$10,$C5,$10,$D0,$10,$D1,$10

                    db $BF,$04,$BF,$04,$BF,$04,$BF,$04
                    db $BF,$04,$BF,$04,$BF,$04,$BF,$04
                    db $BF,$04,$BF,$04,$BF,$04,$BF,$04
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $BF,$04,$BF,$04,$00,$14,$01,$14
                    db $15,$14,$17,$14,$16,$14,$18,$14
                    db $80,$14,$82,$14,$81,$14,$83,$14
                    db $A9,$18,$86,$14,$AA,$18,$87,$14
                    db $84,$14,$86,$14,$85,$14,$87,$14
                    db $AB,$08,$AB,$08,$AB,$08,$AB,$08
                    db $AD,$08,$BF,$00,$AC,$08,$AD,$08
                    db $AC,$08,$AC,$08,$AC,$08,$AC,$08
                    db $BF,$08,$3B,$08,$3B,$08,$AC,$08
                    db $AB,$08,$AB,$08,$AB,$08,$AB,$08
                    db $F4,$04,$86,$04,$F5,$04,$87,$04
                    db $BF,$04,$49,$04,$49,$04,$BF,$04
                    db $E4,$24,$E4,$24,$E4,$24,$E4,$24
                    db $E4,$04,$E4,$04,$E4,$04,$E5,$04
                    db $98,$14,$9A,$14,$99,$14,$9B,$14
                    db $CB,$24,$CB,$24,$E4,$24,$E4,$24
                    db $6E,$14,$6F,$14,$70,$14,$71,$14
                    db $57,$08,$57,$08,$BF,$00,$BF,$00
                    db $57,$08,$57,$08,$93,$10,$92,$10
                    db $2E,$54,$2E,$54,$BF,$04,$BF,$04
                    db $2E,$14,$2E,$14,$BF,$04,$BF,$04
                    db $C4,$10,$C5,$10,$D0,$10,$D1,$10
                    db $C8,$10,$C9,$10,$D2,$10,$D3,$10
                    db $7C,$14,$7E,$14,$7D,$14,$7F,$14
                    db $CA,$04,$CC,$04,$CB,$04,$CD,$04
                    db $CA,$04,$CC,$04,$CB,$04,$CD,$04
                    db $02,$14,$04,$14,$03,$14,$05,$14
                    db $2C,$04,$2E,$04,$2D,$04,$2F,$04
                    db $8E,$04,$8F,$04,$8F,$04,$8E,$04
                    db $88,$14,$8A,$14,$89,$14,$8B,$14
                    db $89,$14,$8B,$14,$89,$14,$8B,$14
                    db $89,$14,$8B,$14,$8C,$14,$8D,$14
                    db $88,$14,$8A,$14,$8C,$14,$8D,$14
                    db $88,$14,$8A,$14,$89,$14,$8B,$14
                    db $88,$14,$8A,$14,$89,$14,$8B,$14
                    db $6A,$18,$6C,$18,$6B,$18,$6D,$18
                    db $6C,$18,$6C,$18,$6D,$18,$6D,$18
                    db $6C,$18,$6E,$18,$6D,$18,$6F,$18
                    db $6C,$18,$54,$18,$6D,$18,$55,$18
                    db $32,$10,$34,$10,$33,$10,$35,$10
                    db $33,$10,$35,$10,$33,$10,$35,$10
                    db $C8,$10,$C9,$10,$D2,$10,$D3,$10
                    db $10,$12,$11,$12,$10,$12,$11,$12
                    db $12,$12,$11,$12,$10,$12,$11,$12
                    db $10,$12,$13,$12,$10,$12,$11,$12
                    db $10,$12,$11,$12,$14,$12,$11,$12
                    db $10,$12,$11,$12,$10,$12,$15,$12
                    db $1A,$12,$1B,$12,$1A,$12,$1B,$12
                    db $16,$12,$17,$12,$1A,$12,$11,$12
                    db $18,$12,$19,$12,$10,$12,$1B,$12
                    db $1A,$12,$11,$12,$1C,$12,$1D,$12

                    db $94,$08,$95,$08,$94,$08,$95,$08
                    db $94,$08,$95,$08,$94,$08,$95,$08
                    db $48,$08,$49,$08,$48,$08,$49,$08
                    db $BE,$08,$BE,$08,$BE,$08,$BE,$08
                    db $BF,$00,$32,$0C,$32,$0C,$33,$0C
                    db $44,$0C,$44,$0C,$44,$0C,$44,$0C
                    db $45,$0C,$45,$0C,$45,$0C,$45,$0C
                    db $34,$0C,$BF,$00,$35,$0C,$34,$0C
                    db $33,$0C,$44,$0C,$44,$0C,$44,$0C
                    db $45,$0C,$35,$0C,$45,$0C,$45,$0C
                    db $BF,$00,$32,$0C,$C0,$0C,$C1,$0C
                    db $33,$0C,$44,$0C,$C2,$0C,$C2,$0C
                    db $44,$0C,$44,$0C,$C2,$0C,$C2,$0C
                    db $45,$0C,$45,$0C,$C3,$0C,$C3,$0C
                    db $45,$0C,$35,$0C,$C3,$0C,$C3,$0C
                    db $34,$0C,$BF,$00,$C4,$0C,$C5,$0C
                    db $A0,$14,$A0,$54,$A3,$14,$A3,$54
                    db $B0,$14,$B0,$54,$B1,$14,$B1,$54
                    db $0D,$10,$0D,$10,$0D,$10,$0D,$10
                    db $0E,$10,$0E,$10,$0E,$10,$0E,$10
                    db $64,$00,$66,$00,$65,$00,$67,$00
                    db $68,$00,$6A,$00,$69,$00,$6B,$00
                    db $BF,$00,$6C,$00,$5C,$00,$5D,$00
                    db $6D,$00,$BF,$00,$5E,$00,$5F,$00
                    db $BF,$00,$6C,$00,$BF,$00,$54,$00
                    db $6D,$00,$BF,$00,$55,$00,$BF,$00
                    db $92,$10,$93,$10,$93,$10,$92,$10
                    db $AE,$18,$AF,$18,$AE,$18,$AF,$18
                    db $78,$18,$7A,$18,$79,$18,$7B,$18
                    db $58,$10,$59,$10,$AE,$10,$AF,$10
                    db $94,$08,$95,$08,$94,$08,$95,$08
                    db $94,$08,$95,$08,$94,$08,$95,$08
                    db $5A,$08,$5C,$08,$5B,$08,$5D,$08
                    db $C6,$10,$C7,$10,$C7,$10,$C6,$10
                    db $C0,$00,$C1,$00,$D0,$00,$D1,$00
                    db $C2,$00,$C3,$00,$D2,$00,$D3,$00
                    db $37,$08,$62,$08,$61,$08,$63,$08
                    db $64,$08,$38,$08,$65,$08,$67,$08
                    db $50,$08,$51,$08,$50,$08,$51,$08
                    db $AF,$10,$AE,$10,$AE,$10,$AF,$10
                    db $50,$08,$51,$08,$50,$08,$51,$08
                    db $8E,$08,$8F,$08,$8F,$08,$8E,$08
                    db $72,$18,$73,$18,$73,$18,$72,$18
                    db $50,$18,$52,$18,$51,$18,$53,$18
                    db $5A,$08,$5C,$08,$5B,$08,$5D,$08
                    db $96,$10,$4E,$10,$4E,$10,$4F,$10
                    db $4F,$10,$4E,$10,$4E,$10,$4F,$10
                    db $4E,$10,$4F,$10,$4F,$10,$4E,$10
                    db $92,$10,$93,$10,$93,$10,$92,$10
                    db $8E,$08,$8F,$08,$8F,$08,$8E,$08
                    db $54,$58,$6C,$58,$55,$58,$6D,$58
                    db $4F,$10,$37,$10,$4E,$10,$A0,$10
                    db $4F,$10,$3A,$10,$4E,$10,$A0,$10
                    db $4F,$10,$4E,$10,$37,$10,$38,$10
                    db $4A,$18,$4B,$18,$BE,$18,$BE,$18
                    db $72,$18,$73,$18,$4A,$18,$4B,$18
                    db $40,$10,$42,$10,$41,$10,$43,$10
                    db $41,$10,$43,$10,$41,$10,$43,$10
                    db $8E,$10,$8F,$10,$9D,$10,$A1,$10
                    db $8F,$10,$9C,$10,$A1,$10,$A2,$10
                    db $8E,$08,$8F,$08,$9D,$08,$A1,$08
                    db $8F,$08,$9C,$08,$A1,$08,$A2,$08
                    db $8E,$0C,$8F,$0C,$9D,$0C,$A1,$0C
                    db $8F,$0C,$9C,$0C,$A1,$0C,$A2,$0C

                    db $40,$08,$42,$08,$41,$08,$43,$08
                    db $40,$08,$42,$08,$41,$08,$43,$08
                    db $06,$08,$08,$08,$07,$08,$09,$08
                    db $06,$08,$08,$08,$90,$08,$91,$08
                    db $FA,$0C,$FA,$0C,$FA,$0C,$FA,$0C
                    db $BF,$0C,$BF,$0C,$BF,$0C,$BF,$0C
                    db $BA,$10,$BC,$10,$BB,$10,$BD,$10
                    db $61,$08,$63,$08,$61,$08,$63,$08
                    db $65,$08,$63,$08,$65,$08,$63,$08
                    db $65,$08,$67,$08,$65,$08,$67,$08
                    db $60,$08,$62,$08,$61,$08,$63,$08
                    db $32,$08,$34,$08,$33,$08,$35,$08
                    db $64,$08,$62,$08,$65,$08,$63,$08
                    db $36,$08,$34,$08,$37,$08,$35,$08
                    db $64,$08,$66,$08,$65,$08,$67,$08
                    db $36,$08,$38,$08,$37,$08,$39,$08
                    db $68,$08,$62,$08,$61,$08,$63,$08
                    db $64,$08,$69,$08,$65,$08,$67,$08
                    db $46,$08,$62,$08,$61,$08,$63,$08
                    db $64,$08,$47,$08,$65,$08,$67,$08
                    db $06,$08,$08,$08,$07,$08,$09,$08
                    db $C4,$00,$C5,$00,$D4,$00,$D5,$00
                    db $C6,$00,$C7,$00,$D6,$00,$D7,$00
                    db $C8,$00,$C9,$00,$D8,$00,$D9,$00
                    db $CA,$00,$CB,$00,$DA,$00,$DB,$00
                    db $CC,$00,$C5,$00,$DC,$00,$D5,$00
                    db $C6,$00,$CD,$00,$D6,$00,$DD,$00
                    db $70,$10,$72,$10,$71,$10,$73,$10
                    db $8E,$0C,$8F,$0C,$8F,$0C,$8E,$0C
                    db $72,$0C,$73,$0C,$73,$0C,$72,$0C
                    db $44,$0C,$45,$0C,$45,$0C,$44,$0C
                    db $C9,$04,$CA,$04,$D0,$04,$D1,$04
                    db $CE,$04,$CF,$04,$D4,$04,$D5,$04
                    db $28,$04,$29,$04,$2A,$04,$2B,$04
                    db $CB,$04,$CB,$04,$D2,$04,$E4,$04
                    db $CC,$04,$CD,$04,$E4,$04,$D3,$04
                    db $D7,$04,$D8,$04,$DE,$04,$E4,$04
                    db $D9,$04,$E4,$04,$E4,$04,$E4,$04
                    db $E4,$04,$DA,$04,$E4,$04,$DF,$04
                    db $DB,$04,$DC,$04,$E0,$04,$E1,$04
                    db $DE,$04,$E4,$04,$DE,$04,$E4,$04
                    db $E4,$04,$EF,$04,$E4,$04,$E6,$04
                    db $F0,$04,$F1,$04,$E7,$04,$E8,$04
                    db $D9,$04,$E4,$04,$E4,$04,$E5,$04
                    db $70,$18,$72,$18,$71,$18,$73,$18
                    db $30,$18,$72,$18,$31,$18,$73,$18
                    db $70,$18,$3E,$18,$71,$18,$3F,$18
                    db $7A,$08,$7B,$08,$78,$08,$79,$08
                    db $79,$CC,$78,$CC,$7B,$CC,$7A,$CC
                    db $7A,$10,$7B,$10,$78,$10,$79,$10
                    db $79,$C8,$78,$C8,$7B,$C8,$7A,$C8
                    db $7A,$0C,$7B,$0C,$78,$0C,$79,$0C
                    db $79,$D0,$78,$D0,$7B,$D0,$7A,$D0
                    db $A4,$18,$6C,$18,$A5,$18,$6D,$18
                    db $10,$12,$1B,$12,$1E,$12,$1F,$12
                    db $18,$12,$17,$12,$10,$12,$11,$12
                    db $10,$12,$11,$12,$1E,$12,$1D,$12
                    db $1A,$12,$11,$12,$1A,$12,$11,$12
                    db $10,$12,$1B,$12,$10,$12,$1B,$12
                    db $1A,$12,$11,$12,$1A,$12,$15,$12
                    db $1A,$12,$13,$12,$1A,$12,$11,$12
                    db $6C,$58,$6C,$58,$6D,$58,$6D,$58
                    db $6C,$58,$6A,$58,$6D,$58,$6B,$58

PNTR_11B564:        db $72,$96,$BA,$DE,$02,$26,$4A
 
PNTR_11B56B:        db $B5,$B5,$B5,$B5,$B6,$B6,$B6

                    db $A1,$9C,$22,$22,$30,$A7,$30,$30
                    db $45,$45,$45,$45,$5E,$5E,$5E,$5E
                    db $2E,$2E,$2E,$2E,$AE,$00,$AB,$B0
                    db $AE,$AE,$AE,$AE,$80,$07,$81,$80
                    db $81,$81,$81,$81

                    db $A0,$9C,$9D,$22,$30,$30,$30,$30
                    db $45,$45,$45,$45,$5E,$5E,$5E,$5E
                    db $2E,$2E,$2E,$2E,$AE,$40,$AB,$2C
                    db $AE,$AE,$AE,$AE,$80,$07,$81,$80
                    db $81,$81,$81,$81

                    db $A1,$9C,$22,$22
                    db $30,$A7,$AE,$30,$45,$45,$45,$45
                    db $5E,$5E,$5E,$5E,$2E,$2E,$2E,$2E
                    db $AE,$00,$AB,$B0,$AE,$AE,$AE,$AE
                    db $80,$07,$81,$80,$81,$81,$81,$81

                    db $26,$9C,$26,$22,$30,$A7,$B0,$2C
                    db $45,$45,$45,$45,$5E,$5E,$5E,$5E
                    db $2E,$2E,$2E,$2E,$AE,$33,$AB,$2C
                    db $AE,$AE,$AE,$AE,$80,$07,$81,$80
                    db $81,$81,$81,$81

                    db $A1,$9C,$22,$22
                    db $30,$A7,$30,$30,$45,$45,$45,$45
                    db $5E,$5E,$5E,$5E,$2E,$2E,$2E,$2E
                    db $AE,$00,$AB,$2C,$AE,$AE,$AE,$AE
                    db $80,$07,$81,$80,$81,$81,$81,$81

                    db $A0,$9C,$9D,$22,$30,$30,$30,$30
                    db $45,$45,$45,$45,$5E,$5E,$5E,$5E
                    db $2E,$2E,$2E,$2E,$AE,$40,$AB,$2C
                    db $AE,$AE,$AE,$AE,$80,$07,$81,$80
                    db $81,$81,$81,$81

                    db $22,$61,$22,$AB
                    db $AA,$60,$5D,$64,$45,$45,$45,$45
                    db $5E,$5E,$5E,$5E,$2E,$2E,$2E,$2E
                    db $AA,$AA,$AA,$AA,$AE,$AE,$AE,$AE
                    db $80,$07,$81,$80,$81,$81,$81,$81


DATA_11B66E:        db $64,$67,$AB,$D4,$6D,$9E,$9F

DATA_11B675:        db $64,$67,$AB,$27,$6D,$9E,$9F

DATA_11B67C:        db $70,$23

DATA_11B67E:        db $71,$24

DATA_11B680:        db $72,$25

DATA_11B682:        db $CA,$CC,$CE,$C7,$C8,$C9,$40,$04
                    db $05

DATA_11B68B:        db $C7,$C8,$C9

DATA_11B68E:        db $D2,$D0,$D0

DATA_11B691:        db $D1,$D1,$D3

DATA_11B694:        db $52,$C0

DATA_11B696:        db $52,$82

DATA_11B698:        db $C0,$C0

DATA_11B69A:        db $82,$82

DATA_11B69C:        db $6A,$6E,$6F

DATA_11B69F:        db $43,$44,$45,$46,$47,$48,$49,$4A
                    db $4B,$4E,$4C,$41,$5B,$42,$5A

DATA_11B6AE:        db $9A,$B1,$AA,$AA

DATA_11B6B2:        db $04,$05,$00,$23,$DF,$59,$0C,$00
                    db $24,$5C,$59,$0C,$00,$25,$E0,$59
                    db $0C

DATA_11B6C3:        db $DF,$E4,$E8,$0C

DATA_11B6C7:        db $E2,$E5,$59,$0C

DATA_11B6CB:        db $5C,$59,$59,$0C

DATA_11B6CF:        db $E3,$E6,$E9,$0C

DATA_11B6D3:        db $E0,$E7,$EA,$0C

DATA_11B6D7:        db $12,$14,$16

DATA_11B6DA:        db $13,$15,$17,$0C,$33

DATA_11B6DF:        db $70,$23,$71

DATA_11B6E2:        db $71,$24

DATA_11B6E4:        db $72,$25,$73,$52,$31,$C0,$52,$32
                    db $82

DATA_11B6ED:        db $00,$05,$06,$10,$11,$12,$04,$05
                    db $06,$10,$11,$12,$04,$05,$06,$83
                    db $83,$12,$83,$83,$06,$83,$83,$12
                    db $83,$83,$06

DATA_11B708:        db $4F,$4F,$90,$83,$83,$83

DATA_11B70E:        db $50,$51,$91,$83,$83,$83

DATA_11B714:        db $00,$23,$CB,$0E,$09

DATA_11B719:        db $00,$24,$CD,$0F,$0B

DATA_11B71E:        db $00,$25,$CF,$10,$0D

DATA_11B723:        db $74,$31,$74,$34,$74,$31,$B8

DATA_11B72A:        db $75,$32,$75,$35,$75,$32,$B9

DATA_11B731:        db $DB,$A7,$AE,$EC

DATA_11B735:        db $38,$3A,$3B,$EE,$DB,$A7,$AE,$AD

DATA_11B73D:        db $37,$39,$AD,$AE

DATA_11B741:        db $00,$00,$00,$24,$00,$00,$02,$54
                    db $00,$02,$55,$54,$00,$02,$7F,$54
                    db $00,$02,$7F,$D4,$00,$03,$FF,$54
                    db $00,$02,$5F,$FC,$00,$03,$FF,$FC
                    db $00,$00,$00,$00,$55,$55,$55,$7C
                    db $E7,$9E,$79,$E4,$00,$0E,$79,$E4
                    db $00,$00,$09,$E4,$00,$00,$00,$24
                    db $E0,$0E,$79,$E4,$E4,$00,$09,$E4
                    db $E4,$00,$00,$24,$E7,$90,$09,$E4
                    db $E7,$9E,$70,$24,$E7,$9E,$40,$24
                    db $E7,$9C,$00,$24,$E0,$0E,$40,$24
                    db $00,$00,$00,$E4,$E4,$00,$00,$00
                    db $E7,$9E,$79,$E4,$E7,$90,$01,$E4
                    db $E0,$00,$01,$E4,$E7,$90,$00,$24
                    db $E0,$00,$00,$24,$00,$00,$00,$24
                    db $00,$00,$00,$24

DATA_11B7BD:        db $AA,$AA,$AA,$AA,$80,$00,$00,$02
                    db $AA,$00,$00,$AA,$FA,$00,$00,$AF
                    db $FE,$00,$00,$BF,$FA,$80,$02,$AF
                    db $E8,$00,$00,$2B,$E0,$00,$00,$0B
                    db $FA,$95,$56,$AF,$95,$00,$00,$56
                    db $A5,$55,$55,$5A,$A5,$5A,$A5,$5A
                    db $55,$55,$55,$55,$95,$55,$55,$56
                    db $95,$5A,$A5,$56,$A9,$55,$55,$6A
                    db $81,$55,$55,$42,$AA,$A5,$55,$5A
                    db $A5,$55,$5A,$AA,$00,$00,$00,$00
                    db $80,$00,$00,$02,$A0,$00,$00,$0A
                    db $AA,$00,$00,$AA,$AA,$A0,$0A,$AA
                    db $80,$00,$0A,$AA,$80,$0A,$AA,$AA
                    db $AA,$AA,$A0,$02,$AA,$A0,$00,$02
                    db $A0,$0A,$A0,$0A,$A0,$00,$00,$00
                    db $00,$00,$00,$0A

DATA_11B839:        db $01,$01,$01,$06,$06,$08,$00,$00
                    db $00,$00,$01,$06,$08,$06,$06,$00
                    db $00,$00,$00,$00,$01,$06,$06,$06
                    db $08,$00,$00,$00,$00,$00,$01,$06
                    db $08,$06,$06,$00,$00,$00,$00,$00
                    db $06,$01,$06,$06,$06,$08,$00,$00
                    db $00,$00,$06,$01,$06,$06,$06,$06
                    db $08,$06,$00,$00,$01,$01,$06,$01
                    db $08,$00,$00,$00,$00,$00,$01,$06
                    db $08,$00,$00,$00,$00,$00,$00,$00
                    db $06,$01,$06,$06,$06,$06,$06,$01
                    db $08,$00,$01,$08,$00,$00,$00,$00
                    db $00,$00,$00,$00,$06,$01,$01,$01
                    db $08,$00,$00,$00,$00,$00,$06,$01
                    db $06,$06,$01,$06,$06,$08,$00,$00
                    db $01,$06,$08,$00,$00,$00,$00,$00
                    db $00,$00,$06,$01,$01,$01,$06,$08
                    db $00,$00,$00,$00,$06,$01,$06,$06
                    db $08,$08,$00,$00,$00,$00,$01,$06
                    db $08,$06,$06,$06,$06,$00,$00,$00
                    db $06,$01,$08,$00,$00,$00,$00,$00
                    db $00,$00,$06,$01,$06,$01,$01,$08
                    db $08,$00,$00,$00,$01,$01,$01,$01
                    db $08,$06,$00,$00,$00,$00,$01,$06
                    db $06,$06,$08,$07,$06,$06,$06,$01

DATA_11B901:        db $0C,$A9,$00,$1B,$40,$08,$46,$08
                    db $4A,$08,$4E,$08,$51,$08,$54,$08
                    db $BD,$08,$56,$08,$58,$08,$5B,$08
                    db $5E,$08,$61,$08,$65,$08,$40,$48
                    db $0C,$C8,$00,$1F,$41,$08,$42,$08
                    db $47,$08,$4B,$08,$4F,$08,$52,$08
                    db $55,$08,$BD,$08,$57,$08,$59,$08
                    db $5C,$08,$5F,$08,$62,$08,$66,$08
                    db $42,$48,$41,$48,$0C,$E8,$00,$0B
                    db $43,$08,$44,$08,$48,$08,$4C,$08
                    db $50,$08,$53,$08,$0C,$F1,$00,$0D
                    db $5A,$08,$5D,$08,$60,$08,$63,$08
                    db $67,$08,$44,$48,$43,$48,$0D,$09
                    db $00,$05,$45,$08,$49,$08,$4D,$08
                    db $0D,$14,$00,$05,$64,$08,$68,$08
                    db $45,$48,$0D,$68,$40,$1E,$BF,$00
                    db $0D,$88,$40,$1E,$BF,$00,$0D,$A8
                    db $40,$1E,$BF,$00,$0D,$C8,$40,$1E
                    db $BF,$00,$0D,$47,$00,$23,$38,$08
                    db $39,$08,$39,$08,$39,$08,$39,$08
                    db $3A,$08,$38,$08,$39,$08,$39,$08
                    db $39,$08,$39,$08,$3A,$08,$38,$08
                    db $39,$08,$39,$08,$39,$08,$39,$08
                    db $3A,$08,$0D,$E7,$00,$23,$3D,$08
                    db $99,$08,$99,$08,$99,$08,$3E,$08
                    db $3F,$08,$3D,$08,$99,$08,$99,$08
                    db $99,$08,$3E,$08,$3F,$08,$3D,$08
                    db $99,$08,$99,$08,$99,$08,$3E,$08
                    db $3F,$08,$0D,$67,$C0,$06,$3B,$08
                    db $0D,$6C,$C0,$04,$9A,$08,$0D,$CC
                    db $00,$01,$3C,$08,$0D,$6D,$C0,$06
                    db $3B,$08,$0D,$72,$C0,$04,$9A,$08
                    db $0D,$D2,$00,$01,$3C,$08,$0D,$73
                    db $C0,$06,$3B,$08,$0D,$78,$C0,$04
                    db $9A,$08,$0D,$D8,$00,$01,$3C,$08
                    db $0E,$08,$40,$1E,$BD,$08,$0E,$28
                    db $40,$1E,$BD,$08,$0E,$48,$40,$1E
                    db $BD,$08,$0E,$2D,$00,$03,$9B,$04
                    db $9D,$04,$0E,$4D,$00,$03,$9C,$04
                    db $9E,$04,$FF

DATA_11BA3C:        db $00,$45,$17,$2E

DATA_11BA40:        db $00,$04,$02,$01,$04,$07,$B0,$B0
                    db $98,$98,$A6,$AA,$E0,$00,$07,$04
                    db $08,$18,$18,$04,$E8,$E8,$FC

                    db $00,$01,$01,$01,$01,$02,$B2,$B2
                    db $98,$98,$AD,$AD,$E0,$00,$07,$04
                    db $08,$18,$1D,$04,$E8,$E3,$FC

                    db $00,$04,$02,$01,$04,$07,$D6,$D6
                    db $C9,$C9,$D0,$D4,$E0,$00,$02,$01
                    db $08,$18,$16,$04,$E8,$EA,$FC

                    db $00,$06,$04,$02,$06,$0C,$B3,$B3
                    db $98,$98,$AC,$B3,$E0,$3C,$07,$04
                    db $08,$18,$15,$04,$E8,$EB,$FC
                         
DATA_11BA9C:        db $BC,$45,$FF,$7F,$63,$0C,$F2,$00      ; \ Mario palette.
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A      ;  | 32 bytes - 16 colours, 2 bytes per colour.
                    db $00,$00,$2F,$15,$A3,$40,$C6,$45      ;  |
                    db $EC,$56,$DC,$14,$96,$10,$0F,$00      ; /
                    db $BC,$45,$FF,$7F,$63,$0C,$F2,$00      ; \ Peach palette.
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A      ;  | 32 bytes - 16 colours, 2 bytes per colour.
                    db $00,$00,$57,$0C,$72,$01,$59,$02      ;  |
                    db $1F,$1F,$9F,$6E,$5F,$49,$96,$28      ; /
                    db $BC,$45,$FF,$7F,$63,$0C,$00,$59      ; \ Toad palette.
                    db $E8,$69,$CF,$7E,$9C,$2D,$BF,$3A      ;  | 32 bytes - 16 colours, 2 bytes per colour.
                    db $00,$00,$2F,$0D,$73,$09,$7B,$2A      ;  |
                    db $5F,$4B,$1F,$19,$D9,$18,$12,$00      ; /
                    db $BC,$45,$FF,$7F,$63,$0C,$F2,$00      ; \ Luigi palette.
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A      ;  | 32 bytes - 16 colours, 2 bytes per colour.
                    db $00,$00,$2F,$15,$88,$50,$6F,$6D      ;  |
                    db $56,$7E,$92,$5B,$AB,$42,$E5,$21      ; /

DATA_11BB1C:        db $BC,$45,$FF,$7F,$A5,$14,$37,$08
                    db $BF,$10,$1F,$06,$9E,$36,$5F,$4F
                    db $00,$00,$0F,$11,$AD,$4C,$34,$5D
                    db $FA,$6D,$FF,$06,$39,$06,$94,$0D

DATA_11BB3C:        db $BC,$45,$FF,$7F,$A5,$14,$86,$49
                    db $2B,$62,$D0,$72,$9E,$36,$5F,$4F
                    db $00,$00,$03,$3D,$55,$09,$D9,$19
                    db $5D,$2A,$DF,$3A,$97,$11,$F2,$00
                    db $BC,$45,$FF,$7F,$A5,$14,$29,$29
                    db $31,$46,$18,$63,$9E,$36,$5F,$4F
                    db $00,$00,$0F,$11,$3C,$09,$FF,$1D
                    db $FF,$3A,$BF,$4D,$7D,$10,$15,$00
                    db $BC,$45,$FF,$7F,$A5,$14,$A5,$11
                    db $C4,$1A,$CC,$3F,$9E,$36,$5F,$4F
                    db $00,$00,$0F,$11,$B8,$30,$7E,$45
                    db $5F,$62,$00,$00,$00,$00,$00,$00

DATA_11BB9C:        db $DF,$EF,$F7,$FB,$00,$FF,$FF,$FF
                    db $AF,$D7,$EB,$F5,$FB,$F7,$EF,$DF
                    db $00,$FF,$FF,$FF,$F5,$EB,$D7,$AF

DATA_11BBB4:        db $00,$01,$FF,$00

DATA_11BBB8:        db $40,$00,$C0,$01,$00,$00,$50,$00
                    db $40,$00,$C0,$01,$00,$00


DATA_11BBC6:        db $0E,$50,$00,$07,$DA,$15,$BD,$09
                    db $C1,$15,$BD,$09,$0E,$C9,$00,$1D
                    db $CE,$15,$E1,$15,$DD,$15,$DB,$15
                    db $CA,$15,$BD,$09,$D5,$15,$D2,$15
                    db $CF,$15,$CE,$15,$E8,$15,$E8,$15
                    db $E8,$15,$BD,$09,$C1,$15,$FF

                    db $E0,$02,$BF,$46,$9F,$21,$96,$0C
                    db $E0,$02,$5F,$63,$1F,$00,$E0,$7D
                    db $E0,$02,$FF,$7F,$D6,$5A,$31,$46
                    db $E0,$02,$00,$7F,$20,$7D,$00,$61
                    db $0C,$08,$04,$08,$0C,$04,$00,$08
                    db $04,$0C,$00,$0C,$08,$04,$0C,$08
                    db $04,$0C,$04,$08,$04,$00,$08,$0C
                    db $F0,$60,$82,$23,$CB,$B0,$00,$A0
                    db $CB,$B0,$40,$A8,$CB,$B2,$00,$A0
                    db $CB,$B2,$40,$A8,$CB,$B6,$00,$A0
                    db $CB,$B6,$40,$A8,$CB,$B4,$00,$A0
                    db $CB,$B4,$40,$A8

DATA_11BC51:        db $00,$C6,$40,$26,$FB,$00,$FF

DATA_11BC58:        db $0E,$86,$00,$27,$BD,$09,$BD,$09
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09
                    db $D7,$15,$D8,$15,$BD,$09,$CB,$15
                    db $D8,$15,$D7,$15,$DE,$15,$DC,$15
                    db $BD,$09,$BD,$09,$BD,$09,$BD,$09
                    db $BD,$09,$BD,$09,$FF

DATA_11BC85:        db $0E,$8B,$00,$15,$D9,$15,$DE,$15
                    db $DC,$15,$D1,$15,$BD,$09,$CB,$15
                    db $DE,$15,$DD,$15,$DD,$15,$D8,$15
                    db $D7,$15,$FF

DATA_11BCA0:        db $55,$6D,$00,$09,$19,$21,$0A,$21
                    db $1E,$21,$1C,$21,$0E,$21,$FF

DATA_11BCAF:        db $0E,$86,$40,$26,$BD,$09,$FF

DATA_11BCB6:        db $0E,$89,$00,$1B,$BD,$09,$BD,$09
                    db $D9,$15,$D5,$15,$CA,$15,$E2,$15
                    db $CE,$15,$DB,$15,$BD,$09,$BD,$09
                    db $C1,$15,$DE,$15,$D9,$15,$BD,$09
                    db $FF

DATA_11BCD7:        db $0E,$AA,$40,$18,$BD,$09,$FF

DATA_11BCDE:        db $FF

DATA_11BCDF:        db $55,$6D,$40,$08,$2F,$21,$FF

DATA_11BCE6:        db $04,$EE,$00,$0D,$BF,$01,$BF,$01
                    db $BF,$01,$BF,$01,$BF,$01,$BF,$01
                    db $BF,$01,$04,$CA,$00,$15,$FF,$00
                    db $A0,$0C,$98,$0C,$9B,$0C,$95,$0C
                    db $8D,$0C,$FF,$00,$FF,$00,$C2,$0C
                    db $A4,$0C,$81,$0C,$05,$28,$00,$1F
                    db $8E,$0C,$A1,$0C,$9D,$0C,$9B,$0C
                    db $8A,$0C,$BF,$00,$95,$0C,$92,$0C
                    db $8F,$0C,$8E,$0C,$A8,$0C,$A8,$0C
                    db $A8,$0C,$FF,$00,$FF,$00,$80,$1C
                    db $FF,$0D,$D1,$80,$05,$BD,$08,$BD
                    db $08,$BD,$08,$FF,$0A,$2A,$00,$01
                    db $BD,$09,$0A,$6A,$00,$01,$BD,$09
                    db $0A,$AA,$00,$01,$BD,$09,$FF,$01
                    db $97,$C0,$10,$FB,$00,$FF,$01,$C0
                    db $00,$21,$ED,$00,$E1,$00,$3A,$00
                    db $E7,$00,$E4,$00,$FB,$00,$F2,$00
                    db $E8,$00,$EE,$00,$01,$4D,$00,$11
                    db $FB,$00,$FB,$00,$FB,$00,$FB,$00
                    db $FB,$00,$FB,$00,$FF    

DATA_11BD83:        db $0E,$89,$00,$1D,$C3,$01,$BD,$01
                    db $CC,$01,$D8,$01,$D2,$01,$D7,$01
                    db $DC,$01,$BD,$01,$DC,$01,$CE,$01
                    db $DB,$01,$DF,$01,$D2,$01,$CC,$01
                    db $CE,$01,$FF

PNTR_11BDA6:        dw $0302
                    dw DATA_11BDBB
                    dw DATA_11C0E4
                    dw DATA_11C0E5
                    dw DATA_11C0E6
                    dw DATA_11C0F3
                    dw DATA_11C100
                    dw DATA_11C10D
                    dw DATA_11C11A
                    dw DATA_11BDBA

DATA_11BDBA:        db $FF

DATA_11BDBB:        db $10,$00,$40,$3E,$BE,$24,$10,$20
                    db $40,$3E,$BE,$24,$10,$40,$40,$3E
                    db $BE,$24,$13,$00,$40,$3E,$BE,$24
                    db $13,$20,$40,$3E,$BE,$24,$13,$40
                    db $40,$3E,$BE,$24,$13,$60,$40,$3E
                    db $BE,$24,$13,$80,$40,$3E,$BE,$24
                    db $13,$A0,$40,$3E,$BE,$24,$13,$C0
                    db $40,$3E,$BE,$24,$10,$60,$C0,$28
                    db $BE,$24,$10,$61,$C0,$28,$BE,$24
                    db $10,$62,$C0,$28,$BE,$24,$10,$63
                    db $C0,$28,$BE,$24,$10,$64,$C0,$28
                    db $BE,$24,$10,$7B,$C0,$28,$BE,$24
                    db $10,$7C,$C0,$28,$BE,$24,$10,$7D
                    db $C0,$28,$BE,$24,$10,$7E,$C0,$28
                    db $BE,$24,$10,$7F,$C0,$28,$BE,$24
                    db $00,$6E,$80,$07,$C4,$18,$D4,$18
                    db $C5,$18,$D5,$18,$00,$CF,$80,$07
                    db $DE,$18,$CF,$18,$DF,$18,$D9,$18
                    db $01,$50,$00,$09,$C7,$18,$C8,$18
                    db $C9,$18,$CA,$18,$CB,$18,$01,$74
                    db $00,$0D,$DB,$18,$D6,$18,$C0,$18
                    db $C1,$18,$C2,$18,$C3,$18,$D7,$18
                    db $01,$96,$00,$07,$D0,$18,$D1,$18
                    db $D2,$18,$D3,$18,$01,$B6,$00,$05
                    db $CC,$18,$CD,$18,$CE,$0C,$01,$D5
                    db $00,$03,$DC,$18,$DD,$18,$00,$6F
                    db $40,$16,$C1,$18,$00,$8F,$40,$16
                    db $C1,$18,$00,$AF,$40,$16,$C1,$18
                    db $00,$D0,$40,$14,$C1,$18,$00,$F0
                    db $40,$14,$C1,$18,$01,$10,$40,$14
                    db $C1,$18,$01,$30,$40,$14,$C1,$18
                    db $01,$55,$40,$0A,$C1,$18,$01,$0D
                    db $80,$05,$E8,$10,$F8,$10,$F6,$10
                    db $01,$0E,$80,$05,$E9,$10,$F9,$10
                    db $F7,$10,$01,$6B,$00,$07,$BB,$10
                    db $BC,$10,$EA,$10,$EB,$10,$01,$89
                    db $00,$11,$4B,$10,$4C,$10,$4D,$10
                    db $4E,$10,$4F,$10,$06,$10,$07,$10
                    db $08,$10,$09,$10,$01,$A7,$00,$1B
                    db $BB,$10,$4C,$10,$5B,$10,$5C,$10
                    db $5D,$10,$5E,$08,$5F,$08,$16,$08
                    db $17,$08,$18,$08,$19,$08,$1A,$08
                    db $1B,$08,$1C,$08,$01,$C5,$00,$1F
                    db $BB,$10,$4C,$10,$5B,$10,$70,$10
                    db $6B,$10,$6C,$10,$6D,$08,$6E,$08
                    db $20,$08,$21,$08,$22,$08,$23,$08
                    db $24,$08,$25,$08,$26,$08,$27,$08
                    db $01,$E5,$00,$1F,$5B,$10,$70,$10
                    db $70,$10,$70,$10,$7B,$10,$7C,$08
                    db $7D,$08,$7E,$08,$30,$08,$31,$08
                    db $32,$08,$33,$08,$34,$08,$35,$08
                    db $36,$08,$37,$08,$02,$05,$00,$2B
                    db $70,$10,$70,$10,$70,$10,$70,$10
                    db $44,$10,$45,$08,$46,$08,$47,$08
                    db $48,$08,$49,$08,$0B,$08,$0C,$08
                    db $0E,$08,$0F,$08,$1E,$08,$1F,$08
                    db $00,$14,$01,$14,$02,$14,$03,$14
                    db $04,$14,$05,$14,$02,$25,$00,$2B
                    db $70,$10,$70,$10,$70,$10,$70,$10
                    db $54,$10,$55,$08,$56,$08,$57,$08
                    db $58,$08,$59,$08,$5A,$08,$28,$08
                    db $29,$08,$2A,$08,$2B,$08,$2C,$14
                    db $10,$14,$11,$14,$12,$14,$13,$14
                    db $14,$14,$15,$14,$02,$45,$00,$1F
                    db $70,$10,$70,$10,$70,$10,$63,$10
                    db $64,$10,$65,$08,$66,$08,$67,$08
                    db $68,$08,$69,$08,$6A,$08,$38,$08
                    db $39,$08,$3A,$08,$3B,$14,$3C,$14
                    db $02,$65,$00,$1D,$70,$10,$71,$10
                    db $72,$10,$73,$0C,$74,$0C,$75,$08
                    db $76,$08,$77,$08,$78,$08,$79,$08
                    db $7A,$08,$2D,$08,$2E,$08,$2F,$14
                    db $0D,$14,$02,$85,$00,$1D,$80,$10
                    db $81,$10,$82,$0C,$83,$0C,$84,$0C
                    db $85,$0C,$86,$0C,$87,$0C,$88,$08
                    db $89,$08,$8A,$08,$3D,$14,$3E,$14
                    db $3F,$14,$1D,$14,$02,$A5,$00,$2B
                    db $90,$0C,$91,$0C,$92,$0C,$93,$0C
                    db $94,$0C,$95,$0C,$96,$0C,$97,$0C
                    db $98,$0C,$99,$0C,$9A,$0C,$0A,$14
                    db $AB,$14,$8B,$14,$8C,$14,$8D,$14
                    db $8D,$14,$8D,$14,$8D,$14,$E6,$14
                    db $E7,$14,$8D,$14,$02,$C5,$00,$2B
                    db $A0,$0C,$A1,$0C,$A2,$0C,$A3,$0C
                    db $A4,$0C,$A5,$0C,$A6,$0C,$A7,$0C
                    db $A8,$0C,$A9,$0C,$AA,$14,$AB,$14
                    db $BD,$14,$9B,$14,$9C,$14,$9D,$14
                    db $E0,$14,$E1,$14,$E2,$14,$E3,$14
                    db $E4,$14,$E5,$14,$02,$E5,$00,$2B
                    db $B0,$0C,$B1,$0C,$B2,$0C,$B3,$0C
                    db $B4,$0C,$B5,$0C,$B6,$0C,$B7,$0C
                    db $B8,$0C,$B9,$14,$BA,$14,$BD,$14
                    db $BD,$14,$BD,$14,$AC,$14,$AD,$14
                    db $F0,$14,$F1,$14,$F2,$14,$F3,$14
                    db $F4,$14,$F5,$14,$02,$55,$40,$0A
                    db $8D,$14,$02,$74,$40,$0C,$8D,$14
                    db $02,$94,$40,$0C,$8D,$14,$00,$D3
                    db $00,$0D,$EC,$18,$ED,$18,$ED,$18
                    db $ED,$18,$ED,$18,$EE,$18,$EF,$18
                    db $00,$F4,$80,$03,$FD,$14,$FC,$14
                    db $00,$F7,$80,$03,$FD,$14,$FC,$14
                    db $FF

DATA_11C0E4:        db $FF

DATA_11C0E5:        db $FF

DATA_11C0E6:        db $00,$6E,$40,$18,$BF,$00,$00,$8E
                    db $40,$18,$BF,$00,$FF

DATA_11C0F3:        db $00,$AE,$40,$18,$BF,$00,$00,$CE
                    db $40,$18,$BF,$00,$FF

DATA_11C100:        db $00,$EF,$40,$16,$BF,$00,$01,$0F
                    db $40,$16,$BF,$00,$FF

DATA_11C10D:        db $01,$2F,$40,$16,$BF,$00,$01,$50
                    db $40,$14,$BF,$00,$FF

DATA_11C11A:        db $01,$74,$40,$0C,$BF,$00,$01,$96
                    db $40,$06,$BF,$00,$01,$B6,$40,$04
                    db $BF,$00,$01,$D5,$40,$02,$BF,$00
                    db $FF

DATA_11C133:        db $A0,$20,$E0,$20,$A0,$28,$F0,$20
                    db $A8,$20,$E1,$22,$A8,$28,$F1,$22
                    db $B0,$20,$E3,$26,$B0,$28,$F3,$26
                    db $B8,$20,$E2,$24,$B8,$28,$F2,$24

DATA_11C153:        db $A0,$20,$E4,$20,$A0,$28,$F4,$20
                    db $A8,$20,$E5,$22,$A8,$28,$F5,$22
                    db $B0,$20,$E7,$26,$B0,$28,$F7,$26
                    db $B8,$20,$E6,$24,$B8,$28,$F6,$24

DATA_11C173:        db $98,$47,$F8,$20,$A0,$47,$E8,$20
                    db $A8,$47,$F8,$20,$B0,$47,$E8,$20
                    db $B8,$47,$F8,$20,$C0,$47,$E8,$20

DATA_11C18B:        db $98,$47,$E8,$20,$A0,$47,$F8,$20
                    db $A8,$47,$E8,$20,$B0,$47,$F8,$20
                    db $B8,$47,$E8,$20,$C0,$47,$F8,$20

DATA_11C1A3:        db $20,$0A,$0A,$0A,$0A,$0A,$0A,$20
                    db $0A,$0A,$0A,$0A,$0A,$0A

DATA_11C1B1:        db $08,$08,$50,$40,$30,$10,$10

DATA_11C1B8:        db $50,$54,$58,$5C,$60,$64,$68,$6C
                    db $68,$64,$60,$5C,$58,$54

DATA_11C1C6:        db $78,$74,$70,$7C,$70,$74,$78,$22
                    db $32,$30

PNTR_11C1D0:        dl $000302                              ; 00 - RAM upload table, used for 8x8 tile upload on layer 1
                    dl $001400                              ; 01 - RAM upload table, used for various texts in the bonus game and other
                    dl $000561                              ;
                    dl DATA_11C221                          ; 03 - Character select screen
                    dl DATA_11C70C                          ; 04 - Shy Guy border between character select screen and level load
                    dl DATA_11C9FC                          ; 05 - Game over screen without border
                    dl $000637                              ;
                    dl DATA_11CAAA                          ; 07 - 'Continue, Save & Continue, Save & Quit'
                    dl $001168                              ; 08 - RAM upload table, used for 'World X-X', 'Extra Lifes.'
                    dl DATA_11BC51                          ;
                    dl DATA_11BC58                          ; 0A - 'No Bonus'
                    dl DATA_11BC85                          ; 0B - 'Push Button'
                    dl $000680                              ;
                    dl DATA_11BCA0                          ; 0D - Probably 'Pause'. Only used in NES SMB2, not SMAS. More proof that Nintendo ported the games to SNES directly and edited them?
                    dl DATA_11BCDF                          ;
                    dl DATA_11BCAF                          ; 0F - Blank line.
                    dl DATA_11BCD7                          ;
                    dl DATA_11BCDE                          ; 11 - Nothing.
                    dl $0011B9                              ;
                    dl $0011C4                              ; 13 - RAM upload table, used for small moveable vegetable at 'Game Over'
                    dl $00144E                              ;
                    dl DATA_11C88D                          ;
                    dl DATA_11C88D                          ;
                    dl DATA_11B901                          ;
                    dl DATA_11C89A                          ; 18 - Stars with palette 2 (used everywhere except for 5-2)
                    dl DATA_11C927                          ; 19 - Stars with palette 1 (used only in 5-2)
                    dl DATA_11BD83                          ; 1A - '3 Coins Service'

DATA_11C221:        db $00,$00,$47,$FE,$BD,$09,$00,$00
                    db $00,$3D,$BD,$09,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $0F,$09,$0F,$49,$1F,$09,$1F,$49
                    db $00,$20,$00,$3D,$BD,$09,$1F,$89
                    db $4F,$09,$5F,$C9,$5F,$89,$6F,$C9
                    db $6F,$89,$5F,$C9,$5F,$89,$6F,$C9
                    db $6F,$89,$5F,$C9,$5F,$89,$6F,$C9
                    db $6F,$89,$5F,$C9,$5F,$89,$6F,$C9
                    db $6F,$89,$5F,$C9,$5F,$89,$6F,$C9
                    db $6F,$89,$5F,$C9,$5F,$89,$6F,$C9
                    db $6F,$89,$5F,$C9,$5F,$89,$4F,$49
                    db $1F,$C9,$00,$40,$C0,$32,$BD,$09
                    db $00,$41,$80,$33,$0F,$09,$0F,$89
                    db $1F,$09,$1F,$89,$0F,$09,$0F,$89
                    db $1F,$09,$1F,$89,$0F,$09,$0F,$89
                    db $1F,$09,$1F,$89,$0F,$09,$0F,$89
                    db $1F,$09,$1F,$89,$0F,$09,$0F,$89
                    db $1F,$09,$1F,$89,$0F,$09,$0F,$89
                    db $1F,$09,$1F,$89,$0F,$09,$0F,$89
                    db $00,$42,$80,$33,$2F,$09,$2F,$89
                    db $3F,$09,$3F,$89,$2F,$09,$2F,$89
                    db $3F,$09,$3F,$89,$2F,$09,$2F,$89
                    db $3F,$09,$3F,$89,$2F,$09,$2F,$89
                    db $3F,$09,$3F,$89,$2F,$09,$2F,$89
                    db $3F,$09,$3F,$89,$2F,$09,$2F,$89
                    db $3F,$09,$3F,$89,$2F,$09,$2F,$89
                    db $00,$5D,$80,$33,$2F,$49,$2F,$C9
                    db $3F,$49,$3F,$C9,$2F,$49,$2F,$C9
                    db $3F,$49,$3F,$C9,$2F,$49,$2F,$C9
                    db $3F,$49,$3F,$C9,$2F,$49,$2F,$C9
                    db $3F,$49,$3F,$C9,$2F,$49,$2F,$C9
                    db $3F,$49,$3F,$C9,$2F,$49,$2F,$C9
                    db $3F,$49,$3F,$C9,$2F,$49,$2F,$C9
                    db $00,$5E,$80,$33,$0F,$49,$0F,$C9
                    db $1F,$49,$1F,$C9,$0F,$49,$0F,$C9
                    db $1F,$49,$1F,$C9,$0F,$49,$0F,$C9
                    db $1F,$49,$1F,$C9,$0F,$49,$0F,$C9
                    db $1F,$49,$1F,$C9,$0F,$49,$0F,$C9
                    db $1F,$49,$1F,$C9,$0F,$49,$0F,$C9
                    db $1F,$49,$1F,$C9,$0F,$49,$0F,$C9
                    db $00,$43,$00,$33,$00,$05,$01,$05
                    db $02,$05,$03,$05,$04,$05,$05,$05
                    db $06,$05,$07,$05,$08,$05,$09,$05
                    db $7F,$05,$7F,$05,$7F,$05,$7F,$45
                    db $7F,$45,$7F,$45,$09,$45,$08,$45
                    db $07,$45,$06,$45,$05,$45,$04,$45
                    db $03,$45,$02,$45,$01,$45,$00,$45
                    db $00,$63,$00,$33,$10,$05,$11,$05
                    db $12,$05,$13,$05,$14,$05,$15,$05
                    db $16,$05,$17,$05,$18,$05,$19,$05
                    db $1A,$05,$7F,$05,$7F,$05,$7F,$45
                    db $7F,$45,$1A,$45,$19,$45,$18,$45
                    db $17,$45,$16,$45,$15,$45,$14,$45
                    db $13,$45,$12,$45,$11,$45,$10,$45
                    db $00,$83,$00,$33,$20,$05,$21,$05
                    db $22,$05,$23,$05,$24,$05,$25,$05
                    db $26,$05,$27,$05,$28,$05,$29,$05
                    db $2A,$05,$2B,$05,$2C,$05,$2C,$45
                    db $2B,$45,$2A,$45,$29,$45,$28,$45
                    db $27,$45,$26,$45,$25,$45,$24,$45
                    db $23,$45,$22,$45,$21,$45,$20,$45
                    db $00,$A3,$00,$33,$30,$05,$31,$05
                    db $32,$05,$33,$05,$34,$05,$BD,$09
                    db $BD,$09,$BD,$09,$38,$05,$39,$05
                    db $3A,$05,$3B,$05,$3C,$05,$3C,$45
                    db $3B,$45,$3A,$45,$39,$45,$38,$45
                    db $BD,$09,$BD,$09,$BD,$09,$34,$45
                    db $33,$45,$32,$45,$31,$45,$30,$45
                    db $00,$C3,$80,$0D,$40,$05,$50,$05
                    db $60,$05,$70,$05,$35,$05,$45,$05
                    db $55,$05,$01,$A3,$C0,$26,$7F,$05
                    db $00,$C4,$80,$2B,$41,$05,$51,$05
                    db $61,$05,$71,$05,$36,$05,$46,$05
                    db $56,$05,$66,$05,$76,$05,$49,$05
                    db $59,$05,$0D,$05,$1D,$05,$2D,$05
                    db $3D,$05,$4D,$05,$5D,$05,$6D,$05
                    db $7D,$05,$79,$05,$7B,$05,$6D,$05
                    db $00,$C5,$80,$2B,$42,$05,$52,$05
                    db $62,$05,$72,$05,$37,$05,$47,$05
                    db $57,$05,$67,$05,$77,$05,$4A,$05
                    db $5A,$05,$0E,$05,$1E,$05,$2E,$05
                    db $3E,$05,$4E,$05,$5E,$05,$6E,$05
                    db $7E,$05,$7A,$05,$7C,$05,$6E,$05
                    db $00,$C6,$80,$17,$43,$05,$BD,$09
                    db $BD,$09,$44,$05,$BD,$09,$BD,$09
                    db $58,$05,$68,$05,$78,$05,$4B,$05
                    db $5B,$05,$6B,$05,$00,$C7,$C0,$16
                    db $0B,$05,$02,$47,$80,$03,$1B,$05
                    db $0C,$05,$00,$DC,$80,$0D,$40,$45
                    db $50,$45,$60,$45,$70,$45,$35,$45
                    db $45,$45,$55,$45,$01,$BC,$C0,$26
                    db $7F,$45,$00,$DB,$80,$2B,$41,$45
                    db $51,$45,$61,$45,$71,$45,$36,$45
                    db $46,$45,$56,$45,$66,$45,$76,$45
                    db $49,$45,$59,$45,$0D,$45,$1D,$45
                    db $2D,$45,$3D,$45,$4D,$45,$5D,$45
                    db $6D,$45,$7D,$45,$79,$45,$7B,$45
                    db $6D,$45,$00,$DA,$80,$2B,$42,$45
                    db $52,$45,$62,$45,$72,$45,$37,$45
                    db $47,$45,$57,$45,$67,$45,$77,$45
                    db $4A,$45,$5A,$45,$0E,$45,$1E,$45
                    db $2E,$45,$3E,$45,$4E,$45,$5E,$45
                    db $6E,$45,$7E,$45,$7A,$45,$7C,$45
                    db $6E,$45,$00,$D9,$80,$17,$43,$45
                    db $BD,$09,$BD,$09,$44,$45,$BD,$09
                    db $BD,$09,$58,$45,$68,$45,$78,$45
                    db $4B,$45,$5B,$45,$6B,$45,$00,$D8
                    db $C0,$16,$0B,$45,$02,$58,$80,$03
                    db $1B,$45,$0C,$45,$03,$40,$00,$3D
                    db $BD,$09,$0F,$09,$0F,$49,$6F,$49
                    db $6F,$09,$5F,$49,$5F,$09,$6F,$49
                    db $6F,$09,$5F,$49,$5F,$09,$6F,$49
                    db $6F,$09,$5F,$49,$5F,$09,$6F,$49
                    db $6F,$09,$5F,$49,$5F,$09,$6F,$49
                    db $6F,$09,$5F,$49,$5F,$09,$6F,$49
                    db $6F,$09,$5F,$49,$5F,$09,$6F,$49
                    db $6F,$09,$0F,$09,$0F,$49,$03,$60
                    db $00,$3D,$BD,$09,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $1F,$89,$1F,$C9,$0F,$89,$0F,$C9
                    db $03,$80,$00,$3D,$BD,$09,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$0F,$09,$0F,$49,$1F,$09
                    db $1F,$49,$01,$49,$00,$0B,$D9,$15
                    db $D5,$15,$CE,$15,$CA,$15,$DC,$15
                    db $CE,$15,$01,$50,$00,$0B,$DC,$15
                    db $CE,$15,$D5,$15,$CE,$15,$CC,$15
                    db $DD,$15,$01,$8C,$00,$0B,$D9,$15
                    db $D5,$15,$CA,$15,$E2,$15,$CE,$15
                    db $DB,$15

DATA_11C6AB:        db $02,$49,$80,$07,$80,$01,$90,$01
                    db $81,$01,$91,$01,$02,$4A,$80,$07
                    db $80,$41,$90,$41,$81,$41,$91,$41
                    db $02,$4D,$80,$07,$82,$01,$92,$01
                    db $83,$01,$93,$01,$02,$4E,$80,$07
                    db $82,$41,$92,$41,$83,$41,$93,$41
                    db $02,$51,$80,$07,$BD,$09,$94,$01
                    db $85,$01,$95,$01,$02,$52,$80,$07
                    db $BD,$09,$94,$41,$85,$41,$95,$41
                    db $02,$55,$80,$07,$86,$01,$96,$01
                    db $87,$01,$97,$01,$02,$56,$80,$07
                    db $86,$41,$96,$41,$87,$41,$97,$41
                    db $FF

DATA_11C70C:        db $04,$00,$47,$FE,$C8,$1C,$04,$00
                    db $C0,$3E,$FE,$1C,$04,$1F,$C0,$3E
                    db $FE,$1C,$04,$DA,$C0,$1C,$D8,$1C
                    db $06,$A7,$40,$24,$C9,$1C,$06,$BA
                    db $00,$01,$D9,$1C,$04,$A6,$40,$26
                    db $FF,$00,$04,$C6,$40,$26,$FF,$00
                    db $04,$E6,$40,$26,$FF,$00,$05,$06
                    db $40,$26,$FF,$00,$05,$26,$40,$26
                    db $FF,$00,$05,$46,$40,$26,$FF,$00
                    db $06,$D2,$00,$09,$CA,$1C,$CB,$1C
                    db $CC,$1C,$CD,$1C,$CE,$1C,$06,$F2
                    db $00,$15,$DA,$1C,$DB,$1C,$DC,$1C
                    db $DD,$1C,$DE,$1C,$CF,$1C,$CF,$1C
                    db $DF,$1C,$DF,$1C,$E9,$1C,$EA,$1C
                    db $07,$12,$00,$15,$E0,$1C,$E1,$1C
                    db $E2,$1C,$E3,$1C,$E4,$1C,$E5,$1C
                    db $E6,$1C,$E7,$1C,$E8,$1C,$F9,$1C
                    db $FA,$1C,$07,$32,$00,$15,$F0,$1C
                    db $F1,$1C,$F2,$1C,$F3,$1C,$F4,$1C
                    db $F5,$1C,$F6,$1C,$F7,$1C,$F8,$1C
                    db $FB,$1C,$FC,$1C,$04,$3C,$00,$03
                    db $C4,$1C,$C5,$1C,$04,$5C,$00,$03
                    db $D4,$1C,$D5,$1C,$04,$47,$00,$03
                    db $C0,$1C,$C1,$1C,$04,$67,$00,$03
                    db $D0,$1C,$D1,$1C,$04,$54,$00,$03
                    db $C6,$1C,$C7,$1C,$04,$74,$00,$03
                    db $D6,$1C,$D7,$1C,$04,$6C,$00,$03
                    db $C4,$1C,$C5,$1C,$04,$8C,$00,$03
                    db $D4,$1C,$D5,$1C,$04,$82,$00,$03
                    db $C2,$1C,$C3,$1C,$04,$A2,$00,$03
                    db $D2,$1C,$D3,$1C,$04,$9B,$00,$03
                    db $C0,$1C,$C1,$1C,$04,$BB,$00,$03
                    db $D0,$1C,$D1,$1C,$05,$1E,$00,$01
                    db $C6,$1C,$05,$3E,$00,$01,$D6,$1C
                    db $05,$81,$80,$03,$C7,$1C,$D7,$1C
                    db $05,$DC,$00,$03,$C2,$1C,$C3,$1C
                    db $05,$FC,$00,$03,$D2,$1C,$D3,$1C
                    db $06,$22,$00,$03,$C4,$1C,$C5,$1C
                    db $06,$42,$00,$03,$D4,$1C,$D5,$1C
                    db $06,$9D,$00,$03,$C0,$1C,$C1,$1C
                    db $06,$BD,$00,$03,$D0,$1C,$D1,$1C
                    db $06,$E1,$80,$03,$C5,$1C,$D5,$1C
                    db $07,$05,$00,$03,$C0,$1C,$C1,$1C
                    db $07,$25,$00,$03,$D0,$1C,$D1,$1C
                    db $07,$2C,$00,$03,$C4,$1C,$C5,$1C
                    db $07,$4C,$00,$03,$D4,$1C,$D5,$1C
                    db $07,$90,$00,$03,$C6,$1C,$C7,$1C
                    db $07,$B0,$00,$03,$D6,$1C,$D7,$1C
                    db $FF

DATA_11C88D:        db $68,$1E,$C0,$3A,$FF,$00,$68,$1F
                    db $C0,$3A,$FF,$00,$FF

DATA_11C89A:        db $10,$00,$42,$7E,$BF,$00,$14,$00
                    db $42,$7E,$BF,$00,$10,$06,$00,$01
                    db $2C,$08,$10,$1D,$00,$01,$14,$08
                    db $10,$42,$00,$01,$13,$08,$10,$55
                    db $00,$01,$2C,$08,$10,$6D,$00,$01
                    db $13,$08,$10,$C1,$00,$01,$2C,$08
                    db $11,$08,$00,$01,$13,$08,$11,$13
                    db $00,$01,$14,$08,$14,$08,$00,$01
                    db $2C,$08,$14,$20,$00,$01,$13,$08
                    db $14,$30,$00,$01,$14,$08,$14,$4C
                    db $00,$01,$13,$08,$14,$55,$00,$01
                    db $2C,$08,$14,$7A,$00,$01,$13,$08
                    db $14,$84,$00,$01,$13,$08,$14,$9F
                    db $00,$01,$8F,$09,$14,$BE,$00,$03
                    db $9E,$09,$9F,$09,$14,$C9,$00,$01
                    db $14,$08,$14,$D1,$00,$01,$13,$08
                    db $15,$2D,$00,$01,$2C,$08,$15,$37
                    db $00,$01,$14,$08,$FF

DATA_11C927:        db $10,$00,$42,$7E,$BF,$00,$14,$00
                    db $42,$7E,$BF,$00,$10,$06,$00,$01
                    db $2C,$04,$10,$1D,$00,$01,$13,$04
                    db $10,$42,$00,$01,$14,$04,$10,$55
                    db $00,$01,$2C,$04,$10,$6D,$00,$01
                    db $14,$04,$10,$C1,$00,$01,$2C,$04
                    db $11,$08,$00,$01,$13,$04,$11,$14
                    db $00,$01,$14,$04,$14,$08,$00,$01
                    db $2C,$04,$14,$20,$00,$01,$14,$04
                    db $14,$30,$00,$01,$13,$04,$14,$4C
                    db $00,$01,$14,$04,$14,$55,$00,$01
                    db $2C,$04,$14,$7A,$00,$01,$14,$04
                    db $14,$84,$00,$01,$14,$04,$14,$9F
                    db $00,$01,$8F,$09,$14,$BE,$00,$03
                    db $9E,$09,$9F,$09,$14,$C9,$00,$01
                    db $13,$04,$14,$D1,$00,$01,$14,$04
                    db $15,$2D,$00,$01,$2C,$04,$15,$37
                    db $00,$01,$13,$04,$FF

DATA_11C9B4:        db $00,$03,$06,$09,$0C,$0F,$12,$14

                    db $58,$57,$82,$23,$58,$57,$80,$23
                    db $58,$57,$84,$23,$58,$57,$86,$29
                    db $00,$00,$5F,$63,$1F,$00,$00,$00
                    db $00,$00,$5F,$63,$1F,$00,$00,$00
                    db $00,$00,$5F,$63,$1F,$00,$00,$00
                    db $00,$00,$5F,$63,$1F,$00,$00,$00

DATA_11C9EC:        db $00,$00,$FF,$7F,$FF,$7F,$00,$00

DATA_11C9F4:        db $C9,$D5,$D1,$CD

DATA_11C9F8:        db $E9,$F5,$F1,$ED

DATA_11C9FC:        db $08,$8E,$00,$05,$FE,$00,$FF,$00
                    db $EF,$00,$08,$AE,$00,$07,$EA,$00
                    db $EB,$00,$EC,$00,$ED,$00,$08,$CE
                    db $00,$07,$FA,$00,$FB,$00,$FC,$00
                    db $FD,$00,$08,$EE,$00,$07,$E6,$00
                    db $E7,$00,$E8,$00,$E9,$00,$09,$0D
                    db $00,$0B,$F5,$00,$F6,$00,$F7,$00
                    db $F8,$00,$F9,$00,$F0,$00,$09,$2D
                    db $00,$0B,$E0,$00,$E1,$00,$E2,$00
                    db $E3,$00,$E4,$00,$F4,$00,$09,$4E
                    db $00,$05,$F1,$00,$F2,$00,$F3,$00
                    db $09,$8B,$00,$01,$CB,$08,$09,$AA
                    db $00,$15,$C0,$08,$C1,$08,$C2,$08
                    db $C3,$08,$C4,$08,$C5,$08,$C6,$08
                    db $C7,$08,$C8,$08,$C9,$08,$CA,$08
                    db $09,$CA,$00,$15,$D0,$08,$D1,$08
                    db $D2,$08,$D3,$08,$D4,$08,$D5,$08
                    db $D6,$08,$D7,$08,$D8,$08,$D9,$08
                    db $DA,$08,$09,$EA,$00,$17,$CC,$08
                    db $CD,$08,$CE,$08,$CF,$08,$BD,$09
                    db $BD,$09,$BD,$09,$DB,$08,$DC,$08
                    db $DD,$08,$DE,$08,$DF,$08

DATA_11CAAA:        db $0A,$2C,$00,$0F,$CC,$15,$D8,$15
                    db $D7,$15,$DD,$15,$D2,$15,$D7,$15
                    db $DE,$15,$CE,$15,$0A,$6C,$00,$19
                    db $DC,$15,$CA,$15,$DF,$15,$CE,$15
                    db $EB,$15,$CC,$15,$D8,$15,$D7,$15
                    db $DD,$15,$D2,$15,$D7,$15,$DE,$15
                    db $CE,$15,$0A,$AC,$00,$11,$DC,$15
                    db $CA,$15,$DF,$15,$CE,$15,$EB,$15
                    db $EA,$15,$DE,$15,$D2,$15,$DD,$15
                    db $FF

                    db $09,$0F

DATA_11CAF5:        db $0B,$10

DATA_11CAF7:        db $0A,$0F

DATA_11CAF9:        db $0C,$0F

DATA_11CAFB:        db $0F

                    db $1A

DATA_11CAFD:        db $00,$08,$10,$18,$20,$24,$28              ; TODO!
                    db $2C,$2A,$2E,$30,$32,$34,$38,$3C
                    db $40,$44

DATA_11CB0E:        db $06,$09,$06,$09,$01,$01,$0E,$0E
                    db $06,$09,$06,$09,$01,$01,$0E,$0E
                    db $06,$09,$06,$09,$01,$01,$0E,$0E
                    db $06,$09,$06,$09,$01,$01,$0E,$0E
                    db $08,$08,$00,$0F,$08,$08,$03,$0C
                    db $F8,$05,$18,$0B,$F8,$05,$18,$0B
                    db $08,$08,$08,$08,$08,$08,$03,$0C
                    db $03,$03,$02,$05,$08,$08,$03,$0C
                    db $08,$08,$FF,$10,$10,$10,$02,$1E

DATA_11CB56:        db $07,$07,$20,$20,$0D,$1C,$0D,$1C
                    db $FF,$FF,$20,$20,$04,$1C,$04,$1C
                    db $0F,$0F,$20,$20,$1C,$1C,$1C,$1C
                    db $07,$07,$20,$20,$0D,$1C,$0D,$1C
                    db $00,$10,$09,$09,$03,$10,$09,$09
                    db $FF,$00,$FF,$00,$0F,$10,$0F,$10
                    db $0C,$14,$07,$20,$FE,$20,$10,$10
                    db $09,$0A,$08,$08,$03,$30,$18,$18
                    db $FF,$10,$08,$08,$09,$0A,$08,$08

DATA_11CB9E:        db $02,$02,$03,$00,$03,$03,$F8,$00
                    db $03,$01,$F3,$04,$03,$03,$03,$F2
                    db $03,$03,$05,$03,$0B,$10,$03,$00
                    db $04,$03,$F8,$00,$09,$04,$03,$03
                    db $0E,$03,$03,$03,$F6,$0C,$02,$03
                    db $0B,$0B,$09,$10,$09,$19,$20,$20
                    db $03,$1E,$19,$08,$09,$09,$09,$18
                    db $09,$1A,$06,$15,$16,$11,$0D,$10
                    db $19,$19,$24,$10,$03,$04,$2D,$30
                    db $0F,$2E,$3E,$1E,$28,$13,$48,$26

DATA_11CBEE:        db $1F,$2F,$3F

DATA_11CBF1:        db $00

DATA_11CBF2:        db $20

DATA_11CBF3:        db $F0

                    db $00,$00,$00,$00,$FB,$FB,$00,$FB
                    db $FB,$00,$FB,$D5,$D9,$FB,$D7,$00
                    db $02,$06,$08,$00,$04,$06,$0A,$26
                    db $26,$26,$28,$06,$08,$2A,$2C,$20
                    db $22,$00,$24,$0C,$0E,$00,$2E,$01
                    db $01,$01,$02,$02,$04,$04,$04

DATA_11CC23:        db $E8,$00,$C8,$00,$D0,$00,$A8,$00
                    db $F0,$00,$98,$00,$00,$01,$B8,$00
                    db $E0,$00,$10,$01,$C0,$00,$D8,$00
                    db $A0,$00,$F8,$00,$90,$00,$08,$01
                    db $B0,$00

DATA_11CC45:        db $01,$01,$01,$03,$02,$01,$02,$03      ; Format : xxxxxxxx
                    db $41,$01,$45,$45,$45,$01,$01,$01
                    db $02,$11,$0D,$09,$11,$00,$00,$09
                    db $E1,$61,$0A,$0A,$42,$43,$09,$0A
                    db $11,$41,$02,$01,$03,$02,$01,$01
                    db $09,$01,$41,$01,$4F,$41,$11,$11
                    db $11,$11,$91,$91,$92,$91,$91,$81
                    db $81,$09,$89,$4D,$09,$09,$89,$11
                    db $89,$45,$41,$41,$11,$12,$92

DATA_11CC8C:        db $04,$00,$00,$00,$03,$00,$00,$00      ; Format : xxxxxixx. i = Invincible to bombs and shells.
                    db $50,$40,$42,$42,$42,$40,$40,$40
                    db $40,$13,$D0,$80,$00,$06,$06,$07
                    db $10,$50,$90,$07,$0A,$3B,$40,$18
                    db $07,$1B,$10,$07,$07,$07,$50,$53
                    db $96,$50,$9B,$53,$1B,$0B,$03,$03
                    db $03,$03,$00,$00,$00,$00,$04,$04
                    db $04,$00,$00,$06,$04,$00,$04,$04
                    db $04,$16,$06,$06,$0C,$04,$04

DATA_11CCD3:        db $00,$05,$05,$05,$05,$05,$05,$05      ; Format : xxxxxxxx
                    db $0C,$05,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$0D,$0D,$05
                    db $0C,$0C,$05,$0D,$0C,$0C,$05,$0E
                    db $0D,$0C,$05,$05,$05,$05,$0C,$05
                    db $05,$05,$05,$05,$05,$00,$0F,$0F
                    db $0F,$0F,$05,$05,$05,$05,$05,$05
                    db $05,$04,$04,$04,$04,$04,$04,$04
                    db $04,$10,$00,$00,$05,$05,$05

DATA_11CD1A:        db $08,$02,$02,$02,$02,$02,$02,$02      ; Format : xxxxxxxx
                    db $04,$02,$09,$09,$09,$02,$02,$02
                    db $02,$02,$02,$02,$02,$08,$08,$02
                    db $04,$04,$0E,$08,$04,$04,$02,$0F
                    db $02,$13,$02,$02,$02,$02,$10,$02
                    db $12,$02,$0F,$02,$11,$0B,$02,$02
                    db $02,$02,$02,$02,$02,$02,$02,$02
                    db $04,$03,$03,$07,$04,$03,$03,$03
                    db $03,$09,$0B,$0B,$02,$02,$02

DATA_11CD61:        db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$01,$01,$01,$01,$02,$01
                    db $00,$02,$03,$02,$04,$02,$02,$02
                    db $02,$02,$02,$02,$02,$00,$02

DATA_11CDA8:        db $01,$43,$80,$C0,$22,$5C,$9B,$CA
                    db $2C,$64,$A6,$DB

DATA_11CDB4:        db $03,$01,$04,$05,$06,$05,$06

DATA_11CDBB:        db $EE,$08,$EF,$08,$AC,$09,$AE,$09

DATA_11CDC3:        db $FE,$08,$FF,$08,$AD,$09,$AF,$09

DATA_11CDCB:        db $FC,$08,$FD,$08,$FD,$08,$BC,$09

DATA_11CDD3:        db $02,$D0,$00,$07,$AB,$08,$AB,$08
                    db $BF,$00,$BF,$00,$02,$F0,$00,$07
                    db $AB,$08,$AB,$08,$BF,$00,$BF,$00
                    db $03,$10,$00,$0B,$AB,$08,$AB,$08
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $03,$30,$00,$0B,$AB,$08,$AB,$08
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $4A,$D0,$00,$05,$3C,$21,$3C,$21
                    db $2C,$21,$4A,$F0,$00,$07,$3C,$21
                    db $3C,$21,$3C,$21,$2C,$21,$4B,$10
                    db $00,$09,$3C,$21,$3C,$21,$3C,$21
                    db $3C,$21,$2C,$21,$4B,$30,$00,$0B
                    db $3C,$21,$3C,$21,$3C,$21,$3C,$21
                    db $3C,$21,$2C,$21,$FF,$00,$0C,$18
                    db $28,$38,$42,$4E,$5C,$00,$00,$06
                    db $06,$0A,$0A,$0B,$0D,$0E,$11,$11
                    db $12,$12,$12,$12,$13,$01,$05,$01
                    db $03,$01,$02,$04,$02,$04,$03,$04
                    db $00,$01,$02,$03,$00

DATA_11CE68:        db $07,$07,$07,$07,$09,$07,$05,$0B

DATA_11CE70:        db $7F,$1B,$9F,$03,$CF,$7E

DATA_11CE76:        db $FF,$12,$9F,$03,$CF,$7E

DATA_11CE7C:        db $5F,$12,$9F,$03,$CF,$7E

DATA_11CE82:        db $BF,$15,$9F,$03,$CF,$7E

DATA_11CE88:        db $9F,$03,$DF,$76,$1B,$00

DATA_11CE8E:        db $B9,$30,$B0,$31,$B1,$32,$B2,$33
                    db $B3,$34

DATA_11CE98:        db $D9,$50,$D0,$51,$D1,$52,$D2,$53
                    db $D3,$54

DATA_11CEA2:        db $11,$91,$12,$92,$13,$93,$14,$94
                    db $15,$95
                  
DATA_11CEAC:        db $79,$00,$70,$01,$71,$02,$72,$03
                    db $73,$04

DATA_11CEB6:        db $31,$B1,$32,$B2,$33,$B3,$34,$B4
                    db $35,$B5,$E0,$20,$D0,$21,$C0,$22
                    db $B0,$23,$A0,$24,$90,$25,$80,$26
                    db $70,$27,$60,$28,$C0,$05,$C1,$05
                    db $C2,$05,$C3,$05,$D0,$05,$D1,$05
                    db $D2,$05,$D3,$05,$E0,$05,$E1,$05
                    db $E2,$05,$E3,$05,$F0,$05,$F1,$05
                    db $F2,$05,$F3,$05,$D2,$CE,$DA,$CE
                    db $E2,$CE,$EA,$CE,$00,$01,$01,$03
                    db $04,$04,$08,$09,$0C,$0C,$0F,$10
                    db $05,$00,$02,$02,$00,$01,$00,$01
                    db $00,$01,$02,$01,$A7,$A7,$A7,$A7
                    db $A7,$A7,$AE,$AE,$04,$05,$07,$11
                    db $11,$0F,$0F,$03,$01,$00,$00,$00
                    db $01,$00,$02,$01,$DB,$37,$38

DATA_11CF2D:        db $EE,$ED,$EE

DATA_11CF30:        db $05,$04,$04,$04,$05,$07,$04,$02
                    db $08,$01,$04,$07,$02,$05,$05,$06
                    db $02,$06,$05,$09

DATA_11CF44:        db $02,$05,$08,$0B,$0E,$11,$13

DATA_11CF4B:        db $04,$06,$08,$07,$05,$06,$05

DATA_11CF52:        db $03,$03,$00,$FF,$FF,$03,$00,$00
                    db $00,$00,$00,$FF,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$FF,$FF,$FF
                    db $FF,$00,$00,$00,$00,$00,$01,$FF
                    db $FF,$FF,$01,$00,$00,$00,$00,$00
                    db $FF,$00,$FF,$FF,$00,$FF,$00,$00
                    db $00,$00,$FF,$01,$FF,$FF,$FF,$FF
                    db $FF,$FF,$00,$00,$00,$03,$FF,$03
                    db $FF,$00,$00,$00,$00,$00,$00,$FF
                    db $FF,$00,$00,$00,$00,$00,$00,$00
                    db $FF,$00,$FF,$FF,$FF,$FF,$FF,$00
                    db $FF,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$FF,$00,$00,$00
                    db $FF,$00,$00,$00,$00,$00,$FF,$00
                    db $FF,$FF,$03,$FF,$FF,$FF,$00,$00
                    db $00,$FF,$FF,$00,$00,$00,$00,$00
                    db $00,$00,$FF,$01,$01,$01,$01,$01
                    db $00,$00,$00,$00,$FF,$00,$FF,$FF
                    db $03,$FF,$00,$00,$00,$00,$00,$FF
                    db $FF,$00,$FF,$FF,$00,$00,$00,$00
                    db $FF,$01,$FF,$00,$00,$00,$00,$00
                    db $00,$00,$FF,$01,$FF,$01,$01,$FF
                    db $FF,$00,$00,$00,$FF,$03,$03,$03
                    db $FF,$FF,$00,$00,$00,$00,$03,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$03

DATA_11D01A:        db $B9,$00,$30,$70,$B0,$01,$31,$71
                    db $B1,$02

DATA_11D024:        db $D9,$10,$50,$90,$D0,$11,$51,$91
                    db $D1,$12

DATA_11D02E:        db $11,$51,$91,$D1,$12,$52,$92,$D2
                    db $13,$53

DATA_11D038:        db $79,$00,$70,$01,$71,$02,$72,$03
                    db $73,$04

DATA_11D042:        db $31,$B1,$32,$B2,$33,$B3,$34,$B4
                    db $35,$B5

DATA_11D04C:        db $40,$40,$94,$95,$40,$40,$94,$95
                    db $96,$97,$94,$95,$98,$99,$A2,$A3
                    db $98,$99,$D5,$D6,$D7,$D8,$D9,$DA
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF

DATA_11D098:        db $00,$0A,$14,$1E,$28,$32,$3C,$46
                    db $50,$5A,$64,$6E,$78,$82,$8C,$96
                    db $A0,$AA,$B4,$BE,$C8

DATA_11D0AD:        db $51,$72,$C2,$6B,$9D,$BD,$BD,$BD       ; \ Low byte of locations...
                    db $BD,$BD,$FA,$79,$CC,$13,$37,$58       ;  | ... of the object + level header data.
                    db $58,$58,$58,$58,$58,$09,$20,$A5       ;  | This table has 210 slots.
                    db $1A,$1A,$1A,$1A,$1A,$1A,$41,$CF       ;  | 10 for each level (10 rooms) - 21 levels (1-1 through 7-2 and unused 7-3)
                    db $F9,$F9,$1D,$F9,$F9,$F9,$F9,$F9       ;  | Many slots in this pointer table point to the same data.
                    db $46,$5D,$FD,$45,$90,$B9,$B9,$B9       ;  | That usually implies that those slots (except for the first of the bunch) are unused rooms.
                    db $B9,$B9,$E4,$F6,$AD,$C5,$1A,$41       ;  |
                    db $A5,$CE,$CE,$CE,$E9,$0A,$60,$7B       ;  |
                    db $F0,$22,$22,$22,$22,$22,$22,$C7       ;  |
                    db $71,$97,$97,$97,$97,$97,$97,$97       ;  |
                    db $97,$AD,$DC,$22,$EF,$4C,$AB,$BE       ;  |
                    db $01,$01,$19,$86,$05,$05,$05,$05       ;  |
                    db $05,$05,$05,$05,$05,$17,$77,$07       ;  |
                    db $3A,$3A,$3A,$3A,$3A,$3A,$62,$75       ;  |
                    db $E7,$64,$B7,$EE,$01,$25,$5C,$5C       ;  |
                    db $5C,$A4,$40,$56,$56,$56,$56,$56       ;  |
                    db $56,$56,$56,$67,$0E,$56,$C3,$F9       ;  |
                    db $23,$23,$23,$23,$23,$34,$DE,$2B       ;  |
                    db $CE,$32,$32,$32,$32,$32,$56,$F7       ;  |
                    db $5E,$82,$AB,$CA,$02,$02,$02,$02       ;  |
                    db $26,$39,$7A,$7A,$7A,$7A,$7A,$7A       ;  |
                    db $7A,$7A,$A6,$B4,$2A,$E7,$C1,$0A       ;  |
                    db $27,$27,$27,$27,$53,$69,$E1,$2A       ;  |
                    db $92,$B4,$B4,$B4,$B4,$B4,$D6,$0E       ;  |
                    db $70,$25,$5D,$D4,$07,$90,$D9,$5E       ;  |
                    db $AD,$AD,$AD,$AD,$AD,$AD,$AD,$AD       ;  |
                    db $AD,$AD                               ; /

DATA_11D17F:        db $D2,$D2,$D2,$D3,$D3,$D3,$D3,$D3       ; \ High byte of locations...
                    db $D3,$D3,$D3,$D4,$D4,$D5,$D5,$D5       ;  |... of the object + level header data.
                    db $D5,$D5,$D5,$D5,$D5,$D6,$D6,$D6       ;  | This pointer table also has 210 slots.
                    db $D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7       ;  | 10 rooms per level, 21 levels.
                    db $D7,$D7,$D8,$D7,$D7,$D7,$D7,$D7       ;  | As with the above table, many slots point to the same data.
                    db $D8,$D8,$D8,$D9,$D9,$D9,$D9,$D9       ;  | Those slots (except the first of them) are very likely unused.
                    db $D9,$D9,$D9,$D9,$DA,$DA,$DB,$DB       ;  |
                    db $DB,$DB,$DB,$DB,$DB,$DC,$DC,$DC       ;  | Note: All object data resides in bank 11!
                    db $DC,$DD,$DD,$DD,$DD,$DD,$DD,$DD       ;  |
                    db $DE,$DE,$DE,$DE,$DE,$DE,$DE,$DE       ;  |
                    db $DE,$DE,$DE,$DF,$DF,$E0,$E0,$E0       ;  |
                    db $E1,$E1,$E1,$E1,$E2,$E2,$E2,$E2       ;  |
                    db $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E3       ;  |
                    db $E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3       ;  |
                    db $E3,$E4,$E4,$E4,$E5,$E5,$E5,$E5       ;  |
                    db $E5,$E5,$E6,$E6,$E6,$E6,$E6,$E6       ;  |
                    db $E6,$E6,$E6,$E6,$E7,$E7,$E7,$E7       ;  |
                    db $E8,$E8,$E8,$E8,$E8,$E8,$E8,$E9       ;  |
                    db $E9,$EA,$EA,$EA,$EA,$EA,$EA,$EA       ;  |
                    db $EB,$EB,$EB,$EB,$EC,$EC,$EC,$EC       ;  |
                    db $EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC       ;  |
                    db $EC,$EC,$EC,$EC,$ED,$ED,$EE,$EF       ;  |
                    db $EF,$EF,$EF,$EF,$EF,$EF,$EF,$F0       ;  |
                    db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F1       ;  |
                    db $F1,$F2,$F2,$F2,$F3,$F3,$F3,$F4       ;  |
                    db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4       ;  |
                    db $F4,$F4                               ; /

                    db $01,$F3,$30,$00,$B7,$0A,$00,$00
                    db $56,$10,$1A,$10,$D6,$C2,$29,$10
                    db $75,$C4,$5A,$21,$12,$C9,$75,$C7
                    db $1E,$C1,$3E,$0A,$00,$20,$20,$CF
                    db $FF

                    db $00,$F3,$30,$00,$F5,$00,$50,$34
                    db $E1,$19,$E2,$B5,$12,$0A,$12,$17
                    db $12,$16,$E5,$32,$E1,$26,$E3,$57
                    db $E5,$38,$C2,$27,$22,$0C,$E2,$17
                    db $C1,$11,$E2,$16,$22,$16,$C3,$2B
                    db $21,$18,$C4,$37,$C2,$36,$C7,$12
                    db $E2,$35,$C8,$3B,$C3,$24,$22,$12
                    db $0C,$F5,$00,$29,$04,$C4,$30,$E1
                    db $02,$03,$03,$EC,$F4,$07,$0D,$45
                    db $0D,$1A,$0D,$26,$E3,$BA,$0C,$FF

                    db $80,$E0,$92,$00,$79,$16,$10,$C2
                    db $07,$16,$31,$0A,$00,$03,$15,$21
                    db $08,$22,$0F,$22,$8A,$2B,$0B,$52
                    db $0E,$26,$10,$10,$0A,$C5,$63,$21
                    db $60,$0C,$44,$29,$3E,$0F,$14,$0F
                    db $09,$01,$19,$0F,$78,$51,$17,$DC
                    db $15,$C2,$14,$22,$10,$29,$03,$C2
                    db $18,$FA,$15,$C3,$21,$22,$F0,$C8
                    db $5A,$10,$1E,$10,$33,$C2,$16,$F9
                    db $B8,$27,$0A,$01,$17,$C3,$11,$22
                    db $0F,$29,$10,$C2,$17,$C5,$33,$22
                    db $07,$C6,$11,$C3,$1F,$25,$F0,$E0
                    db $8D,$21,$0F,$27,$43,$C1,$06,$29
                    db $0A,$29,$31,$24,$06,$21,$0A,$51
                    db $51,$CF,$06,$F3,$30,$22,$75,$D5
                    db $51,$CB,$28,$0B,$00,$32,$1E,$26
                    db $1A,$CD,$9F,$C0,$50,$21,$01,$21
                    db $03,$2D,$08,$54,$0D,$12,$F5,$00
                    db $13,$18,$C6,$F4,$F3,$F3,$DF,$C6
                    db $F3,$6D,$C8,$F2,$6A,$CF,$5E,$0B
                    db $00,$41,$F4,$F3,$F3,$F3,$2E,$16
                    db $FF

                    db $91,$EA,$22,$11,$47,$A8,$19,$25
                    db $0B,$25,$16,$83,$24,$0A,$00,$54
                    db $13,$25,$F0,$71,$F0,$FC,$F0,$0E
                    db $F1,$8F,$F1,$B1,$F1,$F4,$64,$F3
                    db $98,$0C,$F5,$00,$40,$48,$03,$18
                    db $03,$C7,$13,$00,$28,$F0,$B2,$F1
                    db $4A,$FF

                    db $91,$EA,$22,$11,$03,$F3,$97,$12
                    db $F5,$00,$31,$34,$80,$05,$80,$0E
                    db $21,$0F,$21,$F0,$EC,$F1,$0F,$F1
                    db $50,$E1,$13,$00,$27,$F0,$8A,$FF

                    db $80,$E8,$40,$12,$7C,$10,$18,$0C
                    db $F5,$00,$10,$12,$10,$15,$11,$30
                    db $E7,$08,$03,$09,$E6,$9C,$10,$1F
                    db $11,$50,$E7,$0A,$91,$F1,$60,$7E
                    db $10,$43,$48,$F5,$01,$00,$F0,$4C
                    db $F1,$EB,$F2,$F0,$2A,$F2,$24,$83
                    db $25,$81,$4B,$0B,$00,$30,$F0,$8B
                    db $F1,$8C,$F1,$CA,$FF

                    db $80,$EA,$70,$10,$8E,$C3,$3B,$C1
                    db $F0,$CD,$F1,$48,$DD,$10,$13,$C2
                    db $EB,$10,$10,$11,$06,$10,$0E,$11
                    db $2E,$C1,$7F,$29,$5D,$16,$0E,$16
                    db $2A,$07,$0F,$06,$F5,$01,$30,$18
                    db $26,$0C,$2B,$12,$C2,$F0,$E0,$F6
                    db $00,$43,$10,$15,$11,$1A,$CD,$35
                    db $16,$31,$16,$08,$29,$1D,$09,$01
                    db $10,$10,$22,$02,$51,$40,$29,$0B
                    db $10,$1C,$11,$12,$26,$18,$CC,$F0
                    db $08,$F1,$C2,$F2,$3C,$16,$1D,$16
                    db $13,$0B,$01,$13,$15,$56,$0E,$51
                    db $9C,$8C,$0D,$8C,$0E,$8C,$0F,$8C
                    db $27,$10,$15,$11,$4A,$16,$14,$16
                    db $0C,$0B,$01,$20,$26,$16,$09,$82
                    db $0A,$82,$0B,$82,$F0,$00,$FF

                    db $91,$EA,$32,$11,$99,$29,$16,$29
                    db $0C,$29,$12,$13,$01,$04,$1A,$25
                    db $0C,$21,$0E,$21,$F0,$30,$F1,$F7
                    db $7D,$A8,$1C,$25,$0E,$26,$1D,$05
                    db $3A,$83,$32,$25,$03,$25,$06,$25
                    db $07,$25,$09,$80,$0F,$21,$F0,$30
                    db $F0,$97,$F0,$D0,$F1,$35,$80,$25
                    db $02,$25,$17,$82,$1E,$29,$24,$83
                    db $37,$2D,$F0,$F0,$F1,$1B,$F1,$51
                    db $7C,$14,$01,$06,$F0,$0F,$F1,$4E
                    db $F1,$CA,$FF

                    db $80,$E0,$20,$02,$00,$8C,$01,$8C
                    db $02,$8C,$03,$8C,$28,$10,$1B,$11
                    db $53,$0B,$01,$07,$1F,$16,$14,$82
                    db $05,$82,$0D,$16,$79,$11,$16,$10
                    db $36,$16,$31,$16,$04,$48,$13,$82
                    db $04,$82,$05,$82,$06,$82,$07,$82
                    db $08,$82,$09,$82,$0A,$82,$0B,$82
                    db $0C,$82,$F2,$F0,$01,$F6,$02,$F0
                    db $59,$F0,$8A,$F5,$02,$00,$FF

                    db $18,$E3,$01,$01,$64,$32,$09,$32
                    db $32,$32,$0B,$32,$14,$2C,$06,$32
                    db $0A,$2C,$F0,$44,$F0,$65,$F0,$86
                    db $F0,$A7,$F1,$66,$F1,$83,$F1,$A0
                    db $F5,$01,$03,$FF

                    db $18,$E3,$01,$01,$64,$32,$09,$32
                    db $32,$32,$0B,$32,$24,$31,$0A,$31
                    db $17,$27,$F0,$44,$F0,$65,$F0,$86
                    db $F0,$A7,$F1,$86,$F1,$A8,$F1,$C4
                    db $FF

                    db $80,$E1,$90,$00,$00,$8A,$01,$8A
                    db $02,$8A,$2D,$29,$1A,$29,$28,$C5
                    db $2E,$F2,$F1,$C8,$A6,$29,$0E,$10
                    db $13,$29,$21,$C2,$07,$C5,$24,$F2
                    db $0D,$F2,$26,$C7,$20,$C4,$79,$29
                    db $0B,$29,$18,$2B,$11,$22,$02,$26
                    db $03,$DB,$10,$C3,$0E,$C1,$14,$F9
                    db $3E,$C4,$1A,$C3,$10,$C6,$56,$10
                    db $1A,$11,$4C,$D3,$15,$D3,$0D,$C1
                    db $16,$C1,$0F,$F3,$18,$F4,$13,$F2
                    db $64,$10,$28,$D3,$19,$C1,$12,$D3
                    db $0B,$FE,$13,$C1,$15,$F3,$A7,$11
                    db $11,$29,$05,$29,$0B,$21,$0C,$21
                    db $0D,$21,$0E,$21,$0F,$21,$1A,$C6
                    db $60,$C1,$04,$C1,$08,$CA,$80,$2D
                    db $0A,$10,$42,$29,$43,$F9,$F1,$A1
                    db $3E,$18,$23,$11,$18,$10,$16,$29
                    db $24,$22,$06,$21,$08,$22,$13,$D5
                    db $12,$C1,$08,$C1,$24,$26,$06,$22
                    db $2B,$F1,$F1,$68,$F1,$A1,$34,$18
                    db $0A,$18,$9C,$0A,$02,$23,$98,$10
                    db $55,$C1,$12,$08,$10,$51,$F0,$E8
                    db $FF

                    db $20,$E0,$03,$19,$55,$2C,$0B,$2C
                    db $33,$2C,$0D,$2C,$16,$34,$27,$0A
                    db $02,$20,$F0,$54,$F1,$A0,$FF

                    db $20,$E0,$67,$19,$58,$0A,$02,$10
                    db $23,$39,$32,$32,$0B,$32,$35,$33
                    db $0A,$30,$1A,$AF,$F0,$54,$34,$31
                    db $0C,$30,$1C,$AC,$12,$31,$34,$31
                    db $32,$31,$34,$31,$F0,$5C,$32,$31
                    db $0C,$30,$34,$37,$62,$37,$18,$A9
                    db $0D,$00,$0E,$00,$1D,$00,$0E,$00
                    db $14,$31,$09,$35,$F0,$14,$6A,$33
                    db $3C,$31,$13,$13,$02,$08,$2C,$31
                    db $27,$32,$F1,$5B,$F1,$74,$44,$35
                    db $36,$35,$34,$35,$19,$A6,$27,$31
                    db $0A,$31,$17,$AF,$08,$AD,$F0,$16
                    db $49,$AE,$65,$A9,$0B,$AB,$51,$33
                    db $0C,$32,$12,$AC,$0D,$A8,$F0,$17
                    db $F0,$D4,$63,$31,$14,$A7,$2C,$09
                    db $02,$30,$26,$31,$51,$73,$06,$73
                    db $F1,$18,$F1,$C0,$FF

                    db $A0,$EA,$57,$19,$39,$29,$13,$13
                    db $02,$26,$6B,$32,$28,$77,$F0,$4B
                    db $F1,$0D,$7F,$30,$16,$31,$0A,$32
                    db $23,$31,$0F,$30,$20,$31,$1F,$30
                    db $F0,$08,$90,$66,$07,$31,$17,$31
                    db $09,$66,$20,$66,$07,$30,$08,$01
                    db $17,$31,$09,$66,$20,$66,$07,$31
                    db $17,$31,$09,$66,$80,$29,$10,$30
                    db $0A,$29,$20,$29,$10,$30,$09,$82
                    db $0A,$82,$0B,$82,$0E,$82,$0F,$82
                    db $20,$29,$10,$30,$F0,$4D,$F0,$A8
                    db $F0,$CC,$F1,$08,$93,$29,$32,$81
                    db $03,$81,$06,$81,$F0,$B0,$F1,$0F
                    db $F0,$31,$F2,$99,$42,$F1,$0F,$F1
                    db $CA,$F5,$02,$40,$FF

                    db $AA,$F8,$16,$22,$6E,$25,$0F,$25
                    db $1E,$32,$3F,$25,$F0,$50,$F0,$BD
                    db $F1,$5B,$F1,$9A,$B0,$25,$04,$84
                    db $33,$81,$0A,$33,$11,$25,$05,$80
                    db $F0,$99,$F0,$DC,$F1,$F8,$FF

                    db $80,$EC,$90,$00,$00,$0E,$14,$11
                    db $12,$10,$1C,$10,$4A,$17,$12,$17
                    db $8A,$10,$27,$17,$E2,$10,$14,$11
                    db $4A,$07,$0F,$D3,$11,$D5,$0E,$D1
                    db $10,$D1,$06,$D1,$0D,$D1,$77,$10
                    db $19,$11,$48,$29,$1C,$D3,$12,$D1
                    db $0B,$D1,$0F,$D1,$13,$D1,$0A,$D1
                    db $B8,$26,$0A,$22,$0B,$2B,$0C,$22
                    db $0D,$22,$17,$36,$14,$07,$08,$34
                    db $17,$36,$10,$D1,$08,$34,$8E,$10
                    db $39,$29,$37,$0F,$0A,$0F,$1D,$D2
                    db $F0,$0C,$F6,$01,$93,$11,$47,$0F
                    db $0F,$37,$1E,$39,$1D,$3B,$F1,$8C
                    db $F6,$00,$89,$10,$10,$29,$05,$29
                    db $1F,$29,$11,$33,$10,$35,$1C,$0F
                    db $F2,$7D,$0F,$F0,$0C,$F6,$01,$F1
                    db $8C,$F6,$00,$A3,$10,$11,$11,$07
                    db $17,$59,$0B,$03,$10,$FF

                    db $09,$F6,$31,$09,$66,$13,$03,$09
                    db $7D,$29,$F0,$55,$F1,$1C,$F1,$4D
                    db $83,$29,$F2,$72,$29,$1D,$29,$32
                    db $A3,$32,$05,$F1,$C0,$12,$AA,$AC
                    db $0A,$03,$20,$F0,$F4,$F1,$98,$F1
                    db $A0,$FF

                    db $89,$EA,$20,$1A,$97,$80,$23,$0A
                    db $03,$13,$F0,$4D,$F0,$CC,$F1,$02
                    db $F2,$F0,$48,$F0,$8C,$F2,$84,$86
                    db $05,$86,$F0,$48,$F1,$0B,$F1,$CA
                    db $F5,$04,$00,$FF

                    db $18,$E3,$01,$01,$54,$32,$09,$32
                    db $15,$30,$0A,$30,$27,$31,$14,$31
                    db $0A,$31,$15,$31,$09,$31,$16,$33
                    db $1B,$24,$F0,$44,$F0,$65,$F0,$86
                    db $F0,$A7,$F1,$86,$F1,$A3,$F1,$C8
                    db $FF

                    db $89,$EA,$10,$19,$8E,$81,$0F,$81
                    db $F0,$B0,$F1,$6F,$BD,$14,$04,$10
                    db $40,$81,$F0,$2E,$F1,$CA,$FF

                    db $80,$EA,$90,$18,$2D,$10,$1B,$11
                    db $56,$16,$0D,$16,$32,$0B,$04,$01
                    db $F0,$6D,$F0,$8D,$F6,$00,$7C,$10
                    db $8F,$0F,$11,$D1,$0C,$0F,$F0,$8D
                    db $F6,$01,$5A,$10,$26,$11,$33,$29
                    db $10,$29,$22,$0F,$0F,$07,$F0,$8D
                    db $F6,$00,$74,$10,$45,$29,$09,$29
                    db $34,$26,$08,$21,$0C,$21,$0D,$2B
                    db $F0,$0C,$AC,$0F,$17,$0F,$19,$0F
                    db $13,$07,$04,$97,$30,$07,$F0,$0D
                    db $F0,$A2,$F6,$01,$68,$10,$41,$07
                    db $3F,$0B,$04,$22,$F0,$A2,$F6,$02
                    db $F1,$C2,$F6,$03,$F2,$7E,$07,$15
                    db $07,$0A,$07,$F0,$0C,$F5,$04,$22
                    db $F6,$00,$83,$11,$10,$10,$4D,$0F
                    db $15,$07,$09,$07,$12,$07,$86,$11
                    db $12,$10,$4A,$37,$19,$39,$18,$3B
                    db $17,$3D,$9D,$0C,$F5,$04,$30,$4A
                    db $87,$0B,$87,$0C,$87,$0D,$03,$0E
                    db $87,$0F,$87,$7D,$03,$F1,$48,$FF

                    db $91,$EA,$20,$19,$8B,$28,$0D,$26
                    db $0E,$2D,$0F,$22,$1A,$36,$19,$21
                    db $0A,$36,$19,$38,$18,$3A,$F0,$B7
                    db $F0,$F0,$5D,$02,$1D,$02,$1D,$02
                    db $1D,$02,$3C,$02,$1C,$02,$11,$22
                    db $F0,$97,$F0,$D0,$F1,$4F,$F1,$AE
                    db $F5,$04,$15,$90,$13,$04,$15,$24
                    db $29,$33,$25,$04,$25,$05,$25,$37
                    db $27,$F0,$6F,$F0,$D4,$F1,$4A,$FF

                    db $09,$F2,$31,$09,$02,$8A,$03,$8A
                    db $04,$8A,$05,$8A,$06,$8A,$07,$8A
                    db $08,$8A,$09,$8A,$62,$12,$77,$80
                    db $07,$29,$F5,$04,$19,$AC,$80,$0C
                    db $29,$54,$80,$04,$29,$F0,$51,$F1
                    db $6D,$3B,$80,$0B,$29,$52,$82,$03
                    db $82,$04,$82,$05,$82,$23,$29,$F1
                    db $6E,$F2,$9A,$83,$0B,$83,$0C,$83
                    db $0D,$83,$0E,$83,$2C,$0A,$04,$50
                    db $F1,$A0,$FF

                    db $18,$E3,$01,$01,$54,$32,$09,$32
                    db $15,$30,$0A,$30,$27,$31,$14,$31
                    db $0A,$31,$15,$31,$09,$31,$16,$33
                    db $1B,$24,$F0,$44,$F0,$65,$F0,$86
                    db $F0,$A7,$F1,$86,$F1,$A3,$F1,$C8
                    db $FF

                    db $89,$EA,$22,$1A,$43,$0A,$04,$33
                    db $F0,$4E,$F1,$4F,$F1,$BC,$F2,$64
                    db $4E,$64,$00,$07,$00,$08,$00,$F0
                    db $13,$F0,$8D,$70,$46,$10,$42,$F0
                    db $88,$F0,$EC,$F1,$2B,$F1,$8A,$F5
                    db $05,$00,$FF,$89,$EA,$00,$01,$09
                    db $A9,$F5,$05,$11,$F0,$2F,$F0,$CC
                    db $F1,$8F,$F1,$EA,$FF

                    db $80,$EC,$90,$00,$00,$89,$01,$89
                    db $02,$89,$03,$89,$25,$29,$1C,$29
                    db $18,$2B,$16,$C4,$2B,$21,$1A,$C2
                    db $95,$11,$08,$10,$66,$A6,$F5,$05
                    db $00,$12,$32,$09,$32,$0D,$26,$0E
                    db $21,$0F,$21,$14,$31,$06,$05,$07
                    db $32,$14,$31,$07,$32,$14,$31,$07
                    db $32,$14,$31,$07,$32,$14,$31,$06
                    db $05,$07,$32,$53,$29,$31,$0F,$0F
                    db $29,$23,$21,$05,$21,$71,$C2,$1E
                    db $29,$02,$0B,$05,$20,$16,$22,$09
                    db $22,$11,$C2,$05,$C3,$09,$C2,$0E
                    db $C3,$DD,$11,$5D,$0F,$C3,$29,$39
                    db $0F,$13,$0F,$0E,$0F,$F1,$4C,$F6
                    db $01,$F1,$CC,$F6,$00,$90,$10,$0E
                    db $10,$12,$11,$52,$0F,$06,$0F,$0A
                    db $0F,$1E,$D1,$F0,$6C,$F6,$01,$F0
                    db $CC,$F6,$00,$86,$11,$31,$29,$08
                    db $29,$43,$D2,$0A,$D1,$F0,$0C,$F6
                    db $02,$F0,$6C,$F6,$00,$F0,$CC,$F6
                    db $02,$F1,$4C,$F6,$00,$84,$10,$52
                    db $0F,$0E,$0F,$C8,$17,$47,$0B,$05
                    db $30,$F4,$26,$16,$09,$16,$FF

                    db $91,$EA,$10,$19,$8A,$2D,$0D,$13
                    db $05,$13,$18,$54,$0B,$21,$F1,$0F
                    db $F2,$90,$26,$01,$52,$F0,$8A,$FF

                    db $09,$E1,$61,$09,$68,$14,$05,$19
                    db $5C,$31,$13,$31,$F0,$35,$F1,$1C
                    db $6B,$29,$9D,$29,$A8,$28,$3A,$34
                    db $F0,$75,$F1,$1C,$F1,$75,$82,$2C
                    db $06,$2C,$09,$2C,$0D,$2C,$24,$2C
                    db $0B,$2C,$5C,$09,$05,$50,$F1,$33
                    db $F1,$92,$BB,$29,$54,$29,$F0,$6F
                    db $92,$29,$5D,$29,$F0,$0D,$B6,$83
                    db $07,$83,$08,$83,$09,$83,$28,$0A
                    db $05,$70,$1B,$29,$F0,$0E,$F0,$CD
                    db $F1,$4E,$F1,$A0,$FF

                    db $18,$E3,$01,$01,$54,$31,$0A,$31
                    db $15,$31,$09,$31,$26,$33,$15,$31
                    db $09,$31,$14,$30,$0B,$30,$28,$28
                    db $F0,$44,$F0,$65,$F0,$86,$F0,$A7
                    db $F1,$66,$F1,$84,$F1,$A0,$FF

                    db $89,$EA,$62,$1A,$43,$0A,$05,$33
                    db $2C,$35,$1C,$35,$1C,$35,$1C,$35
                    db $0D,$29,$F0,$4E,$F1,$8F,$C2,$3F
                    db $12,$3F,$12,$3F,$0B,$29,$12,$3F
                    db $10,$3F,$03,$29,$10,$3F,$10,$3F
                    db $08,$29,$F0,$1C,$62,$29,$2F,$34
                    db $1F,$34,$1F,$34,$1E,$36,$1D,$38
                    db $1C,$3A,$1B,$3C,$1A,$3E,$F0,$0F
                    db $F0,$4E,$F0,$CF,$F1,$0D,$F2,$F1
                    db $CC,$F2,$73,$0F,$06,$07,$11,$0F
                    db $F1,$2D,$F2,$A0,$07,$06,$07,$22
                    db $42,$F0,$10,$F2,$F0,$CF,$F1,$4A
                    db $F5,$05,$60,$FF

                    db $AA,$EA,$13,$2A,$8E,$30,$F0,$CD
                    db $F1,$52,$F1,$CD,$E4,$32,$1A,$33
                    db $1C,$83,$0D,$83,$10,$00,$01,$00
                    db $02,$00,$03,$33,$10,$00,$01,$00
                    db $02,$00,$F0,$16,$F0,$6D,$F1,$CA
                    db $FF

                    db $21,$E0,$03,$11,$32,$2C,$0D,$2C
                    db $22,$2C,$0D,$2C,$22,$2C,$0D,$2C
                    db $15,$35,$27,$0A,$05,$36,$F0,$41
                    db $F1,$80,$FF

                    db $80,$EA,$10,$10,$13,$10,$14,$11
                    db $1A,$16,$0B,$16,$F0,$42,$EA,$C2
                    db $16,$C1,$18,$F1,$0C,$C3,$14,$C4
                    db $0D,$0B,$06,$16,$F1,$28,$F1,$42
                    db $FF

                    db $00,$F3,$90,$08,$6C,$10,$52,$10
                    db $18,$12,$F5,$06,$31,$C3,$10,$46
                    db $10,$9C,$10,$34,$10,$70,$FF,$B4
                    db $E2,$F0,$6C,$34,$E2,$38,$E1,$3A
                    db $E1,$3C,$E2,$3A,$E1,$38,$E1,$35
                    db $E1,$32,$E3,$37,$E1,$37,$E4,$3B
                    db $E2,$10,$C2,$2B,$E2,$20,$C3,$1B
                    db $E2,$20,$C4,$12,$0B,$06,$01,$08
                    db $E3,$F1,$91,$F2,$F1,$8A,$F3,$76
                    db $C1,$27,$C2,$18,$0B,$06,$20,$F1
                    db $8B,$F1,$AB,$F6,$07,$FF

                    db $91,$EA,$20,$11,$87,$13,$06,$19
                    db $F0,$D1,$F2,$94,$5E,$0D,$26,$F2
                    db $BB,$08,$0D,$0A,$06,$16,$F1,$10
                    db $F1,$CA,$FF

                    db $80,$E8,$53,$10,$56,$10,$2A,$11
                    db $2E,$10,$12,$0A,$06,$43,$17,$11
                    db $10,$E4,$08,$10,$1C,$10,$7C,$00
                    db $1C,$E2,$27,$0C,$F5,$06,$10,$1F
                    db $E2,$2F,$00,$10,$E6,$07,$03,$08
                    db $EA,$60,$E2,$26,$E2,$12,$2B,$26
                    db $26,$07,$22,$0D,$E2,$16,$C1,$20
                    db $00,$01,$00,$0A,$E3,$79,$E3,$22
                    db $00,$10,$E3,$07,$E3,$36,$E2,$34
                    db $C1,$0A,$E2,$50,$2D,$29,$A8,$18
                    db $21,$19,$05,$31,$21,$3D,$26,$0E
                    db $21,$0F,$21,$F0,$0C,$F0,$4B,$F0
                    db $95,$F2,$4E,$0B,$06,$40,$80,$21
                    db $01,$21,$02,$21,$F0,$8B,$F1,$28
                    db $F1,$8B,$F1,$CA,$FF

                    db $91,$EA,$32,$12,$41,$13,$06,$35
                    db $F0,$2E,$F2,$67,$36,$3D,$00,$1D
                    db $00,$14,$35,$10,$31,$F0,$08,$F1
                    db $59,$F1,$CA,$F5,$07,$00,$F3,$26
                    db $83,$20,$81,$0D,$14,$06,$30,$18
                    db $25,$09,$25,$F0,$0B,$F0,$4E,$F1
                    db $EA,$FF

                    db $80,$EA,$98,$10,$2F,$16,$9C,$0A
                    db $07,$23,$F0,$82,$F6,$00,$F1,$04
                    db $66,$16,$0D,$16,$2A,$0F,$17,$0F
                    db $53,$A4,$33,$05,$F5,$07,$11,$F0
                    db $62,$44,$16,$1C,$CD,$11,$0F,$16
                    db $0F,$09,$C4,$52,$A4,$32,$05,$F5
                    db $07,$12,$F0,$64,$7C,$0F,$1E,$51
                    db $42,$A4,$32,$05,$F5,$07,$13,$F0
                    db $42,$46,$16,$0B,$16,$31,$0F,$52
                    db $A4,$32,$05,$F5,$07,$14,$F0,$64
                    db $40,$16,$05,$16,$92,$A3,$22,$05
                    db $F5,$07,$15,$F0,$C6,$F2,$2A,$16
                    db $1D,$16,$44,$01,$05,$01,$F0,$04
                    db $F0,$85,$F0,$C4,$F1,$03,$F1,$44
                    db $A3,$16,$0C,$16,$26,$0F,$11,$0F
                    db $0A,$0F,$F1,$83,$F1,$C4,$F2,$25
                    db $16,$17,$16,$3E,$25,$52,$A3,$22
                    db $05,$F5,$07,$17,$57,$26,$09,$22
                    db $0B,$22,$0C,$2B,$16,$C6,$20,$25
                    db $12,$02,$03,$02,$F0,$45,$F0,$82
                    db $F1,$AA,$F6,$02,$FF

                    db $81,$EA,$72,$11,$97,$25,$09,$21
                    db $0B,$21,$0D,$26,$13,$02,$04,$02
                    db $05,$02,$06,$02,$0E,$02,$0F,$02
                    db $2F,$2D,$F0,$70,$F0,$EF,$F1,$D0
                    db $3C,$AC,$F5,$07,$01,$6C,$05,$40
                    db $02,$01,$02,$0C,$05,$F0,$4F,$F0
                    db $8E,$F1,$B1,$5D,$AC,$F5,$07,$02
                    db $56,$25,$08,$25,$0A,$25,$14,$83
                    db $0D,$05,$F0,$BC,$F0,$D5,$9D,$A9
                    db $F5,$07,$03,$F0,$17,$F1,$8F,$F1
                    db $F7,$F2,$0D,$A9,$F5,$07,$04,$86
                    db $41,$16,$41,$F0,$2F,$F0,$97,$F0
                    db $CF,$F1,$17,$F1,$4F,$F1,$CA,$6D
                    db $A5,$F5,$07,$05,$65,$32,$3F,$83
                    db $F0,$4F,$F0,$BC,$F1,$15,$F1,$D3
                    db $89,$83,$23,$A8,$0E,$A8,$11,$01
                    db $05,$25,$06,$25,$0C,$25,$0D,$25
                    db $13,$05,$0E,$05,$32,$83,$05,$83
                    db $0D,$83,$37,$25,$09,$25,$F0,$15
                    db $3D,$A5,$50,$25,$F5,$07,$08,$F0
                    db $7C,$F0,$88,$F0,$CC,$F1,$0E,$F1
                    db $CA,$FF

                    db $81,$EA,$30,$12,$83,$00,$04,$00
                    db $05,$00,$06,$00,$07,$00,$08,$49
                    db $F0,$7C,$D8,$47,$F0,$55,$F1,$1C
                    db $F5,$08,$00,$F2,$F0,$0E,$F2,$43
                    db $0A,$07,$00,$F0,$CA,$FF

                    db $91,$EA,$10,$11,$F0,$94,$F2,$48
                    db $13,$08,$10,$54,$83,$13,$82,$F0
                    db $50,$F0,$AE,$F1,$8A,$FF

                    db $80,$E1,$30,$00,$35,$10,$29,$11
                    db $36,$C2,$17,$0B,$08,$01,$1E,$0F
                    db $8B,$11,$17,$10,$32,$2B,$12,$0F
                    db $10,$0F,$13,$01,$05,$52,$08,$26
                    db $5C,$18,$45,$10,$49,$0F,$72,$18
                    db $08,$18,$96,$0A,$08,$23,$FF

                    db $A0,$EA,$33,$19,$55,$01,$0B,$2D
                    db $6C,$09,$08,$39,$F0,$5C,$F0,$75
                    db $F1,$1C,$F1,$55,$82,$A8,$22,$05
                    db $55,$0A,$08,$46,$F1,$9C,$F1,$D5
                    db $AC,$0A,$08,$53,$0D,$82,$19,$81
                    db $1A,$80,$0B,$80,$0C,$80,$F0,$5C
                    db $F0,$95,$F0,$FC,$F2,$B9,$14,$08
                    db $13,$11,$2A,$03,$26,$05,$24,$0C
                    db $28,$F0,$14,$F1,$CA,$FF

                    db $20,$E0,$93,$19,$15,$AB,$18,$0A
                    db $08,$70,$26,$80,$07,$80,$08,$80
                    db $09,$80,$0A,$80,$F0,$35,$C4,$31
                    db $36,$33,$3A,$32,$34,$29,$16,$33
                    db $33,$32,$36,$33,$3A,$33,$36,$33
                    db $42,$34,$12,$30,$03,$29,$05,$29
                    db $06,$30,$0D,$29,$12,$30,$F0,$14
                    db $12,$30,$04,$28,$09,$32,$12,$34
                    db $1A,$29,$16,$29,$0C,$84,$0D,$84
                    db $28,$83,$09,$83,$24,$81,$05,$81
                    db $42,$38,$0D,$0A,$08,$40,$0E,$A8
                    db $2E,$05,$F1,$B7,$87,$2C,$69,$AF
                    db $F0,$54,$F1,$D6,$76,$AE,$99,$A5
                    db $F0,$57,$83,$00,$0C,$00,$17,$31
                    db $16,$33,$15,$35,$16,$33,$1D,$0A
                    db $08,$43,$3D,$AC,$F0,$56,$F0,$94
                    db $F1,$B6,$F1,$D5,$16,$33,$45,$35
                    db $15,$30,$0A,$30,$15,$30,$0A,$30
                    db $15,$35,$46,$33,$38,$82,$11,$A9
                    db $07,$80,$09,$80,$3B,$84,$29,$80
                    db $0A,$80,$0C,$80,$0D,$80,$37,$84
                    db $25,$80,$06,$80,$08,$80,$09,$80
                    db $32,$31,$F0,$14,$3C,$82,$1B,$80
                    db $0D,$80,$3D,$31,$3C,$82,$1B,$80
                    db $0D,$80,$23,$0A,$08,$20,$F0,$1A
                    db $F1,$74,$F1,$A0,$FF

                    db $20,$E0,$67,$19,$AE,$30,$12,$0A
                    db $08,$33,$0E,$AE,$2A,$87,$0B,$87
                    db $F0,$94,$F1,$BA,$2C,$31,$1C,$A9
                    db $52,$AF,$04,$A4,$06,$A4,$08,$A4
                    db $0A,$A4,$F0,$D4,$93,$3B,$AA,$31
                    db $3A,$32,$F1,$5A,$3C,$32,$68,$31
                    db $36,$33,$12,$0A,$08,$36,$F0,$1B
                    db $F0,$98,$F1,$BB,$A6,$31,$48,$31
                    db $36,$33,$F0,$F8,$66,$31,$36,$33
                    db $68,$31,$F0,$3B,$F1,$58,$36,$33
                    db $66,$31,$36,$33,$1A,$0A,$08,$21
                    db $F0,$9B,$F1,$A0,$FF

                    db $20,$E0,$37,$19,$A0,$37,$1B,$0A
                    db $08,$60,$27,$38,$F0,$9E,$F0,$F3
                    db $F1,$5E,$F1,$D3,$26,$04,$10,$37
                    db $37,$38,$26,$04,$10,$37,$37,$38
                    db $26,$04,$10,$37,$F0,$3E,$F0,$B3
                    db $F0,$FE,$F1,$73,$F1,$BE,$37,$38
                    db $26,$04,$10,$37,$37,$38,$26,$04
                    db $10,$37,$37,$38,$F0,$53,$F0,$9E
                    db $F1,$13,$F1,$5E,$F1,$D3,$26,$04
                    db $10,$37,$37,$38,$26,$04,$10,$37
                    db $43,$0A,$08,$22,$F0,$3E,$F0,$B3
                    db $F0,$FE,$F1,$59,$F1,$A0,$FF

                    db $20,$E0,$07,$19,$54,$2C,$0C,$2C
                    db $57,$32,$14,$0A,$08,$50,$F0,$41
                    db $F1,$A0,$FF

                    db $88,$FD,$40,$1A,$3A,$10,$27,$11
                    db $35,$34,$15,$34,$15,$34,$15,$34
                    db $07,$0A,$08,$30,$15,$31,$08,$31
                    db $0E,$24,$6A,$10,$25,$11,$54,$40
                    db $05,$6B,$8A,$10,$2E,$11,$50,$6F
                    db $F0,$08,$98,$10,$60,$63,$06,$68
                    db $0F,$40,$F2,$29,$10,$14,$10,$95
                    db $42,$F0,$4D,$F1,$6B,$F1,$E8,$F5
                    db $08,$80,$FF

                    db $AA,$F8,$17,$22,$6E,$A4,$F0,$5C
                    db $F0,$DD,$F1,$5C,$F1,$D9,$F2,$65
                    db $A4,$2A,$33,$F0,$DC,$F1,$F8,$FF

                    db $88,$EA,$90,$10,$2C,$10,$1E,$11
                    db $44,$39,$0E,$3F,$F0,$82,$F1,$D6
                    db $F6,$05,$9A,$10,$6E,$32,$A8,$11
                    db $1B,$10,$43,$34,$31,$32,$08,$3F
                    db $6B,$11,$68,$3F,$38,$36,$7C,$11
                    db $4E,$2D,$1E,$37,$2A,$3C,$F2,$84
                    db $26,$0A,$54,$18,$39,$72,$10,$16
                    db $11,$45,$3A,$0A,$3B,$32,$3F,$78
                    db $10,$57,$3F,$CE,$10,$37,$33,$1A
                    db $31,$1B,$31,$1B,$32,$1B,$33,$5E
                    db $8B,$0F,$8B,$21,$11,$27,$26,$08
                    db $21,$16,$F3,$0A,$32,$24,$21,$11
                    db $2B,$03,$F6,$10,$32,$0B,$23,$F5
                    db $09,$10,$1A,$F2,$FF

                    db $80,$E8,$90,$12,$22,$10,$17,$11
                    db $52,$39,$F1,$82,$B8,$10,$2C,$11
                    db $F0,$C1,$F6,$01,$E1,$10,$3B,$0F
                    db $F1,$A2,$F6,$02,$A3,$10,$1A,$11
                    db $1E,$0F,$2A,$0F,$18,$0F,$0D,$0F
                    db $26,$0F,$F0,$81,$F6,$01,$99,$10
                    db $1E,$11,$3E,$0F,$B0,$10,$1A,$10
                    db $4A,$0F,$28,$0F,$F0,$80,$83,$11
                    db $17,$10,$4D,$83,$0E,$83,$0F,$83
                    db $1C,$82,$1B,$81,$1A,$80,$F1,$4D
                    db $F6,$02,$6B,$10,$F0,$02,$F1,$40
                    db $F6,$01,$F2,$47,$10,$1A,$11,$4E
                    db $80,$0F,$80,$35,$80,$06,$80,$07
                    db $80,$F0,$A0,$F6,$02,$F1,$01,$F1
                    db $6C,$65,$11,$37,$42,$30,$80,$F0
                    db $22,$F1,$CA,$F5,$0A,$00,$FF

                    db $90,$EA,$10,$10,$AC,$3C,$F0,$8C
                    db $F1,$88,$C8,$12,$F5,$0A,$10,$F1
                    db $2A,$FF

                    db $80,$E8,$90,$10,$32,$10,$14,$11
                    db $17,$0C,$F5,$0A,$01,$0C,$10,$4F
                    db $38,$2B,$34,$23,$33,$07,$03,$08
                    db $33,$4C,$10,$78,$3F,$22,$10,$0A
                    db $11,$7C,$10,$68,$3F,$A0,$11,$58
                    db $3F,$26,$10,$74,$10,$12,$11,$58
                    db $3F,$2C,$10,$76,$10,$3E,$10,$38
                    db $3F,$88,$10,$1A,$11,$96,$3F,$74
                    db $10,$52,$3F,$3C,$10,$54,$10,$17
                    db $11,$62,$3A,$19,$34,$1A,$34,$1B
                    db $35,$62,$10,$0B,$10,$1A,$11,$27
                    db $0A,$0A,$21,$26,$E2,$33,$37,$FF

                    db $88,$F6,$90,$28,$4C,$10,$1E,$11
                    db $49,$26,$0A,$21,$0B,$21,$18,$B5
                    db $0F,$2B,$19,$2E,$78,$0A,$0A,$19
                    db $26,$E4,$1F,$34,$42,$BD,$15,$2E
                    db $67,$29,$0B,$29,$2A,$32,$20,$33
                    db $45,$B4,$0D,$B4,$16,$2E,$0E,$2E
                    db $63,$29,$22,$33,$3B,$52,$16,$52
                    db $0B,$F2,$16,$F2,$9D,$29,$12,$26
                    db $10,$F2,$14,$30,$14,$31,$15,$31
                    db $27,$31,$0B,$B4,$1C,$2E,$56,$29
                    db $12,$10,$0E,$10,$18,$11,$19,$34
                    db $54,$B6,$25,$2E,$6F,$11,$1B,$29
                    db $0C,$10,$70,$B4,$09,$B5,$11,$2E
                    db $0A,$2E,$65,$34,$2C,$33,$52,$B8
                    db $25,$2E,$80,$3F,$43,$08,$18,$B5
                    db $12,$F3,$19,$2E,$75,$10,$2C,$10
                    db $18,$23,$F5,$0A,$30,$0B,$11,$10
                    db $31,$07,$42,$15,$46,$15,$F6,$FF

                    db $80,$E8,$30,$30,$28,$10,$1C,$11
                    db $52,$39,$F1,$87,$A6,$10,$53,$0F
                    db $12,$29,$0D,$26,$3E,$7F,$F0,$4C
                    db $F1,$CD,$C3,$29,$06,$29,$09,$29
                    db $0C,$29,$3E,$77,$F0,$33,$BE,$0B
                    db $0A,$40,$18,$2D,$F0,$5B,$F0,$D1
                    db $F1,$CA,$FF

                    db $91,$EA,$20,$32,$81,$13,$0A,$33
                    db $F0,$4C,$F0,$AB,$F1,$E8,$F2,$A3
                    db $3B,$F0,$0D,$F0,$48,$F0,$70,$F1
                    db $F7,$F2,$F0,$30,$F0,$77,$F0,$8F
                    db $F1,$10,$F1,$8A,$F5,$0B,$00,$FF

                    db $91,$EA,$02,$11,$4B,$14,$0B,$11
                    db $0D,$A8,$F0,$54,$F0,$D3,$F1,$15
                    db $F1,$CA,$FF

                    db $88,$E1,$91,$00,$00,$8A,$2A,$10
                    db $1D,$11,$14,$2B,$14,$0F,$33,$0F
                    db $05,$0F,$AA,$CB,$27,$21,$16,$C8
                    db $12,$26,$04,$21,$11,$C6,$14,$0B
                    db $0B,$00,$AC,$10,$F1,$16,$F6,$05
                    db $E0,$11,$25,$10,$D4,$10,$0C,$10
                    db $18,$11,$F2,$57,$51,$0A,$50,$16
                    db $F4,$14,$51,$14,$F1,$13,$50,$12
                    db $F1,$0E,$64,$53,$18,$09,$18,$8B
                    db $0A,$0B,$26,$23,$69,$F0,$68,$F1
                    db $F6,$54,$18,$0A,$18,$89,$0A,$0B
                    db $36,$28,$6C,$F0,$88,$55,$18,$0B
                    db $18,$89,$0A,$0B,$60,$25,$6B,$F0
                    db $16,$F0,$A8,$51,$18,$A1,$62,$F0
                    db $D6,$FF

                    db $20,$E0,$60,$09,$44,$0A,$0B,$41
                    db $21,$34,$0A,$34,$27,$31,$31,$35
                    db $08,$36,$21,$33,$06,$32,$0A,$34
                    db $F0,$54,$24,$3A,$31,$3A,$25,$35
                    db $2B,$33,$37,$33,$34,$34,$31,$34
                    db $08,$36,$2A,$34,$11,$32,$1C,$32
                    db $12,$33,$23,$34,$31,$39,$2C,$32
                    db $39,$32,$34,$32,$31,$33,$0B,$33
                    db $37,$31,$0D,$31,$21,$78,$1D,$31
                    db $F1,$BA,$F1,$D4,$36,$35,$31,$3A
                    db $34,$3A,$31,$33,$33,$33,$1D,$31
                    db $25,$33,$0C,$32,$38,$33,$35,$33
                    db $33,$32,$0D,$31,$21,$36,$2A,$32
                    db $35,$32,$0C,$31,$23,$32,$21,$31
                    db $09,$33,$14,$0A,$0B,$16,$66,$78
                    db $F1,$3B,$F1,$C0,$FF

                    db $20,$E0,$62,$09,$37,$0A,$0B,$42
                    db $26,$33,$44,$3A,$31,$78,$F0,$41
                    db $F1,$BA,$F1,$C1,$5A,$74,$37,$29
                    db $99,$29,$F0,$77,$68,$29,$D9,$29
                    db $88,$0A,$0B,$50,$12,$29,$15,$35
                    db $F0,$D3,$20,$35,$0A,$35,$45,$35
                    db $32,$3B,$41,$3A,$F0,$21,$44,$3A
                    db $41,$3A,$34,$3A,$31,$3A,$3C,$32
                    db $38,$33,$34,$33,$31,$32,$16,$09
                    db $0B,$17,$0B,$33,$21,$38,$F1,$7A
                    db $F1,$C0,$FF

                    db $80,$E8,$32,$18,$5D,$E2,$4F,$E1
                    db $91,$41,$04,$41,$07,$41,$0A,$41
                    db $0D,$41,$12,$18,$08,$18,$5B,$0A
                    db $0B,$20,$1F,$26,$13,$6C,$6F,$2D
                    db $12,$41,$05,$41,$08,$41,$0B,$41
                    db $0E,$41,$13,$18,$09,$18,$58,$0A
                    db $0B,$30,$11,$22,$10,$6C,$FF

                    db $20,$E0,$02,$09,$56,$32,$34,$36
                    db $27,$0A,$0B,$33,$21,$3D,$F0,$21
                    db $F1,$A0,$FF

                    db $90,$EA,$10,$1A,$62,$3D,$46,$0A
                    db $0B,$18,$22,$3D,$F0,$50,$90,$34
                    db $51,$42,$10,$34,$F0,$B7,$F0,$EF
                    db $F1,$2E,$F1,$6F,$F1,$97,$F1,$CA
                    db $F5,$0B,$70,$FF

                    db $2A,$F5,$0F,$12,$54,$32,$09,$32
                    db $07,$00,$08,$00,$43,$31,$0B,$31
                    db $32,$40,$07,$00,$08,$00,$09,$00
                    db $0D,$40,$F0,$35,$F6,$04,$F0,$53
                    db $F0,$D5,$F6,$02,$F0,$F5,$F6,$04
                    db $F1,$13,$F1,$95,$F6,$05,$F1,$A0
                    db $F6,$02,$F1,$C0,$F6,$04,$FF

                    db $81,$E2,$20,$00,$00,$86,$01,$86
                    db $02,$86,$1B,$10,$25,$16,$1C,$C5
                    db $E8,$16,$4A,$C8,$3C,$0B,$0C,$10
                    db $2B,$82,$0C,$82,$0D,$82,$0E,$82
                    db $0F,$82,$F1,$48,$41,$10,$0E,$10
                    db $13,$11,$53,$C8,$50,$82,$01,$82
                    db $04,$82,$05,$82,$06,$82,$09,$82
                    db $0A,$82,$0B,$82,$0C,$82,$0D,$82
                    db $F4,$F2,$3C,$16,$F2,$37,$16,$FF

                    db $91,$EA,$80,$11,$83,$13,$0C,$01
                    db $1B,$2A,$0D,$26,$3E,$54,$F0,$71
                    db $F1,$D4,$73,$FC,$38,$87,$09,$87
                    db $0A,$87,$35,$84,$06,$84,$07,$84
                    db $F0,$68,$90,$FF,$F2,$40,$FF,$62
                    db $84,$03,$84,$04,$84,$05,$84,$06
                    db $84,$07,$84,$90,$FF,$2D,$88,$0E
                    db $88,$0F,$88,$24,$86,$05,$86,$06
                    db $86,$07,$86,$B0,$FF,$20,$88,$01
                    db $88,$4F,$84,$79,$2B,$11,$27,$02
                    db $26,$10,$FF,$00,$81,$01,$81,$02
                    db $81,$2D,$88,$0E,$88,$0F,$88,$40
                    db $84,$01,$84,$02,$84,$03,$84,$26
                    db $82,$07,$82,$08,$82,$09,$82,$70
                    db $FF,$23,$88,$04,$88,$05,$88,$9A
                    db $2D,$36,$00,$0A,$00,$10,$F0,$32
                    db $80,$03,$82,$04,$80,$08,$81,$4E
                    db $0B,$0C,$20,$14,$26,$06,$53,$F0
                    db $34,$F0,$CD,$F0,$F4,$F1,$4D,$F1
                    db $74,$F1,$92,$FF 
          
                    db $91,$F0,$13,$12,$6B,$32,$51,$0B
                    db $0C,$18,$D1,$00,$F0,$0F,$F0,$B0
                    db $F1,$AA,$F5,$0D,$00,$FF

                    db $91,$EA,$10,$11,$F0,$5B,$F2,$F0
                    db $11,$F1,$AA,$0C,$A9,$F5,$0D,$10
                    db $FF 

                    db $89,$E0,$90,$00,$24,$10,$17,$11
                    db $59,$2A,$0A,$52,$18,$C5,$13,$A4
                    db $33,$05,$F5,$0D,$01,$52,$10,$09
                    db $16,$27,$16,$08,$16,$1B,$16,$F1
                    db $21,$AD,$16,$0F,$16,$15,$10,$0E
                    db $16,$88,$21,$F1,$A2,$5D,$2B,$3C
                    db $10,$1F,$11,$17,$06,$F5,$0D,$40
                    db $15,$2A,$08,$22,$09,$22,$0A,$21
                    db $F1,$88,$F1,$A0,$C7,$11,$0B,$10
                    db $1A,$10,$F2,$18,$16,$1B,$16,$2F
                    db $11,$22,$16,$14,$16,$5C,$2A,$F0
                    db $01,$F1,$28,$F1,$60,$F1,$A8,$F1
                    db $E2,$49,$16,$22,$10,$05,$16,$5F
                    db $86,$55,$81,$09,$81,$F0,$48,$F1
                    db $62,$F1,$C8,$3C,$10,$1F,$11,$21
                    db $16,$05,$16,$0B,$21,$0C,$2A,$0D
                    db $21,$0E,$2D,$1A,$C4,$43,$85,$15
                    db $84,$21,$82,$F0,$E2,$95,$22,$06
                    db $28,$F1,$88,$9D,$8A,$0E,$8A,$0F
                    db $8A,$22,$10,$25,$11,$1B,$16,$27
                    db $12,$F5,$0D,$23,$F0,$01,$FF

                    db $09,$F3,$30,$28,$0F,$85,$48,$0C
                    db $4E,$0B,$0D,$30,$29,$E2,$0C,$84
                    db $0D,$84,$32,$10,$F0,$DE,$24,$11
                    db $2F,$85,$1A,$10,$52,$E1,$F0,$53
                    db $F1,$1E,$78,$0D,$1D,$8C,$23,$10
                    db $24,$11,$39,$10,$0C,$83,$12,$E1
                    db $55,$E1,$52,$10,$6A,$10,$25,$11
                    db $10,$E7,$08,$03,$09,$E4,$F5,$0D
                    db $19,$F4,$46,$0C,$F3,$06,$0D,$FF

                    db $09,$F5,$60,$29,$14,$10,$2C,$11
                    db $11,$0B,$0D,$20,$22,$6B,$07,$01
                    db $36,$10,$29,$11,$32,$70,$0D,$70
                    db $12,$8E,$0D,$8E,$E3,$70,$0C,$70
                    db $2B,$70,$1B,$83,$4B,$8F,$17,$70
                    db $17,$86,$18,$70,$18,$87,$04,$70
                    db $14,$81,$3A,$70,$F0,$16,$1A,$89
                    db $74,$70,$0B,$82,$14,$81,$15,$70
                    db $36,$70,$16,$85,$F1,$57,$99,$70
                    db $19,$88,$48,$70,$18,$83,$F2,$F0
                    db $96,$F0,$D5,$F1,$14,$F2,$3E,$70
                    db $1E,$85,$2D,$81,$2D,$0B,$0D,$50
                    db $11,$70,$14,$60,$07,$60,$0A,$60
                    db $24,$F7,$F1,$56,$FF

                    db $08,$E3,$11,$01,$F5,$0D,$13,$64
                    db $31,$0A,$31,$13,$30,$06,$30,$09
                    db $30,$0C,$30,$35,$35,$28,$25,$F0
                    db $44,$F0,$65,$F0,$86,$F0,$A7,$F1
                    db $86,$F1,$A8,$F1,$C4,$45,$35,$23
                    db $32,$0A,$32,$25,$21,$08,$26,$F0
                    db $02,$F0,$21,$F0,$C0,$FF

                    db $89,$EA,$20,$12,$82,$0B,$0D,$36
                    db $2A,$67,$2A,$FF,$F0,$6C,$F1,$48
                    db $53,$10,$26,$11,$3E,$6D,$34,$69
                    db $2A,$F3,$F1,$CC,$55,$10,$A0,$F9
                    db $F0,$08,$F1,$4C,$F1,$8A,$F5,$0E
                    db $00,$FF

                    db $91,$EA,$10,$11,$F0,$70,$F2,$09
                    db $A9,$F5,$0E,$10,$F0,$0F,$F1,$8A
                    db $FF

                    db $81,$E8,$92,$00,$22,$10,$16,$11
                    db $28,$08,$15,$21,$06,$21,$0B,$26
                    db $46,$A4,$F5,$0E,$01,$26,$05,$F0
                    db $82,$F0,$C3,$F1,$84,$F1,$C0,$7D
                    db $11,$3F,$29,$1D,$29,$13,$16,$04
                    db $16,$18,$29,$0C,$82,$0D,$82,$27
                    db $26,$08,$21,$09,$21,$52,$10,$16
                    db $11,$55,$29,$21,$82,$04,$82,$0A
                    db $82,$0C,$29,$0F,$26,$17,$81,$09
                    db $29,$1C,$2B,$F1,$C1,$58,$10,$1B
                    db $11,$1C,$10,$60,$21,$01,$21,$02
                    db $21,$03,$21,$0C,$D2,$17,$29,$0D
                    db $0F,$F0,$C0,$44,$1F,$9C,$D5,$6C
                    db $1F,$32,$10,$18,$11,$3B,$21,$11
                    db $21,$0A,$D3,$25,$C2,$F0,$88,$F1
                    db $20,$F2,$9A,$16,$0B,$16,$90,$10
                    db $13,$11,$08,$10,$5D,$83,$3F,$25
                    db $F1,$C4,$3C,$1F,$63,$2A,$05,$26
                    db $07,$2A,$34,$83,$0C,$DC,$28,$A3
                    db $F5,$0E,$24,$11,$2D,$18,$05,$F1
                    db $80,$5B,$10,$1E,$11,$5A,$16,$F1
                    db $88,$FF

                    db $91,$EA,$42,$11,$04,$1F,$7E,$D7
                    db $18,$0B,$0E,$33,$F0,$4C,$7C,$1F
                    db $6A,$21,$18,$DB,$F0,$88,$F1,$2C
                    db $F2,$7D,$32,$12,$D2,$13,$D2,$09
                    db $21,$3E,$24,$F1,$68,$F1,$8D,$C2
                    db $83,$35,$25,$08,$21,$0A,$21,$0C
                    db $21,$0E,$21,$F0,$15,$37,$A5,$F5
                    db $0E,$18,$4A,$00,$1A,$04,$12,$80
                    db $03,$80,$60,$26,$F0,$5A,$F0,$95
                    db $F0,$EE,$F1,$CA,$FF

                    db $18,$E0,$61,$11,$68,$13,$0E,$40
                    db $28,$33,$12,$31,$24,$31,$26,$31
                    db $F0,$8A,$F0,$B3,$F1,$2A,$F1,$D3
                    db $29,$31,$2C,$31,$12,$31,$25,$31
                    db $27,$32,$22,$32,$0C,$31,$35,$31
                    db $28,$32,$F0,$4A,$F0,$D3,$F1,$2A
                    db $F1,$B3,$2C,$31,$12,$32,$25,$32
                    db $38,$32,$3B,$32,$14,$34,$F0,$2A
                    db $F0,$F3,$F1,$4A,$4C,$00,$0D,$00
                    db $1A,$33,$33,$31,$26,$81,$07,$13
                    db $0E,$20,$23,$32,$23,$32,$33,$32
                    db $0A,$33,$0D,$00,$16,$85,$07,$85
                    db $F0,$99,$F0,$CA,$F1,$0B,$F1,$D5
                    db $23,$32,$1B,$32,$23,$31,$28,$04
                    db $14,$38,$0D,$00,$33,$31,$1A,$00
                    db $0B,$32,$23,$31,$F1,$0B,$33,$31
                    db $06,$86,$07,$86,$08,$34,$0D,$00
                    db $33,$31,$1B,$32,$23,$31,$28,$04
                    db $14,$39,$0B,$00,$32,$00,$12,$00
                    db $F0,$2A,$12,$00,$16,$33,$F0,$36
                    db $F0,$80,$FF

                    db $81,$E8,$90,$12,$02,$1F,$67,$0B
                    db $0E,$30,$1F,$21,$16,$DF,$7A,$1F
                    db $21,$10,$15,$11,$38,$D9,$10,$21
                    db $01,$21,$02,$21,$AD,$10,$63,$D6
                    db $E3,$11,$50,$10,$0D,$11,$3A,$1F
                    db $B4,$10,$C7,$21,$09,$21,$0B,$21
                    db $14,$D9,$98,$E2,$49,$E2,$13,$E3
                    db $0F,$E2,$30,$E1,$A4,$E3,$1A,$D3
                    db $1C,$0F,$38,$10,$0E,$D2,$1F,$0F
                    db $54,$10,$28,$11,$52,$DE,$1A,$0F
                    db $5C,$89,$0D,$89,$0E,$89,$0F,$89
                    db $8A,$81,$0B,$81,$F0,$8D,$F1,$0C
                    db $F5,$0E,$50,$FF

                    db $AA,$EA,$12,$22,$F0,$4F,$F0,$CC
                    db $F1,$4F,$F1,$D7,$F1,$EF,$F2,$F0
                    db $16,$F0,$88,$F0,$B6,$F0,$C1,$F0
                    db $EC,$F1,$EA,$7D,$91,$0E,$91,$1C
                    db $90,$18,$37,$FF

                    db $80,$ED,$90,$18,$00,$8C,$01,$8C
                    db $02,$8C,$03,$8C,$4C,$10,$59,$16
                    db $F1,$6D,$F6,$01,$AD,$10,$2C,$11
                    db $64,$D1,$09,$D1,$68,$2B,$2A,$10
                    db $55,$06,$2A,$D1,$F5,$0F,$60,$F1
                    db $CD,$F6,$00,$66,$10,$79,$0F,$10
                    db $0F,$11,$0F,$07,$0F,$F1,$8D,$F6
                    db $02,$64,$11,$6F,$16,$32,$D1,$07
                    db $D1,$F1,$CD,$F6,$00,$68,$10,$7E
                    db $07,$2A,$D1,$F0,$4D,$F6,$01,$72
                    db $11,$14,$10,$51,$07,$0E,$94,$26
                    db $D1,$F0,$0D,$F6,$00,$F1,$EC,$F6
                    db $03,$56,$10,$43,$0F,$09,$0F,$16
                    db $0F,$11,$0F,$07,$0F,$14,$21,$08
                    db $26,$05,$0F,$0A,$0F,$F0,$0C,$F6
                    db $00,$94,$10,$2D,$0F,$2F,$0F,$17
                    db $0F,$0B,$0F,$7C,$89,$0D,$89,$0E
                    db $89,$0F,$89,$44,$10,$17,$54,$09
                    db $2D,$17,$34,$18,$33,$17,$34,$09
                    db $0B,$F5,$0F,$10,$16,$32,$0A,$31
                    db $FF

                    db $89,$EA,$30,$19,$46,$13,$F5,$0F
                    db $09,$2D,$81,$0E,$81,$0F,$80,$3B
                    db $81,$F0,$4E,$F1,$75,$F1,$BC,$C0
                    db $80,$01,$80,$44,$00,$09,$06,$0F
                    db $00,$10,$07,$02,$07,$04,$06,$05
                    db $08,$06,$08,$07,$07,$0A,$07,$0B
                    db $08,$0C,$06,$0D,$07,$0E,$07,$0F
                    db $08,$F5,$0F,$50,$E7,$00,$10,$07
                    db $01,$07,$02,$08,$03,$06,$04,$07
                    db $05,$07,$06,$08,$07,$08,$F5,$0F
                    db $30,$F1,$71,$AB,$32,$1B,$32,$1B
                    db $32,$0C,$09,$F5,$0F,$20,$1B,$30
                    db $0D,$30,$F1,$4F,$F1,$CA,$FF

                    db $89,$EA,$20,$1A,$83,$13,$F5,$0F
                    db $13,$F0,$51,$B7,$83,$26,$81,$25
                    db $32,$12,$00,$03,$00,$04,$00,$05
                    db $32,$F0,$0C,$F2,$F0,$0F,$F0,$6A
                    db $F5,$10,$00,$FF

                    db $18,$E3,$21,$19,$F5,$0F,$12,$65
                    db $31,$09,$31,$36,$33,$24,$31,$0A
                    db $31,$F0,$44,$F0,$65,$F0,$86,$F0
                    db $A7,$F1,$86,$F1,$A8,$F1,$CF,$F2
                    db $F0,$4A,$F0,$CD,$F1,$6B,$F1,$A0
                    db $FF

                    db $18,$E3,$01,$01,$64,$32,$09,$32
                    db $34,$30,$0B,$30,$15,$35,$28,$24
                    db $F0,$44,$F0,$65,$F0,$86,$F0,$A7
                    db $F1,$66,$F1,$83,$F1,$A0,$FF

                    db $18,$E3,$21,$19,$F5,$0F,$11,$65
                    db $31,$09,$31,$36,$33,$24,$31,$0A
                    db $31,$F0,$44,$F0,$65,$F0,$86,$F0
                    db $A7,$F1,$86,$F1,$A8,$F1,$CF,$C6
                    db $82,$07,$82,$08,$82,$09,$82,$26
                    db $27,$07,$22,$08,$22,$09,$27,$F0
                    db $4A,$F0,$CD,$F1,$6B,$F1,$A0,$FF

                    db $18,$E3,$01,$01,$65,$31,$09,$31
                    db $33,$31,$0B,$31,$17,$31,$26,$26
                    db $F5,$0F,$02,$F0,$44,$F0,$65,$F0
                    db $86,$F0,$A7,$F1,$86,$F1,$A8,$F1
                    db $CF,$F6,$04,$FF

                    db $91,$EA,$10,$19,$F0,$54,$F1,$8F
                    db $F2,$4C,$14,$F5,$10,$10,$F0,$CE
                    db $F1,$EA,$FF

                    db $A1,$EA,$90,$18,$00,$0E,$93,$0B
                    db $F5,$10,$01,$19,$21,$F0,$81,$F1
                    db $88,$F1,$E0,$F2,$F0,$88,$F2,$C9
                    db $82,$0A,$82,$0B,$82,$F3,$8F,$86
                    db $F2,$70,$26,$01,$21,$04,$2B,$10
                    db $86,$01,$86,$04,$86,$05,$86,$F3
                    db $F3,$4C,$0B,$F5,$10,$20,$40,$21
                    db $10,$85,$01,$85,$F0,$8B,$F1,$8A
                    db $FF

                    db $91,$EA,$20,$1A,$43,$13,$F5,$10
                    db $19,$F0,$4E,$F2,$6A,$00,$18,$32
                    db $0E,$31,$34,$31,$28,$00,$09,$44
                    db $F0,$90,$AA,$82,$0B,$82,$0C,$82
                    db $0D,$82,$F5,$11,$00,$F0,$0E,$F1
                    db $0F,$F1,$CA,$FF

                    db $89,$EA,$00,$01,$07,$A9,$F5,$11
                    db $11,$F0,$50,$F1,$CA,$FF

                    db $80,$EC,$40,$00,$00,$89,$01,$89
                    db $0A,$89,$0B,$89,$0C,$89,$0D,$89
                    db $0E,$89,$0F,$89,$75,$0A,$F5,$11
                    db $44,$24,$42,$F1,$0C,$F6,$01,$60
                    db $89,$01,$89,$02,$89,$03,$89,$28
                    db $10,$1A,$11,$3E,$0F,$28,$A6,$0C
                    db $0F,$0F,$0F,$F5,$11,$00,$1A,$26
                    db $18,$05,$38,$05,$F0,$CC,$F6,$00
                    db $48,$11,$1D,$11,$14,$10,$54,$D1
                    db $08,$D1,$0D,$0F,$F0,$4C,$F6,$02
                    db $8A,$10,$14,$10,$0D,$11,$50,$2B
                    db $10,$0F,$04,$D1,$0B,$D1,$0F,$2A
                    db $F1,$CC,$F6,$00,$6B,$89,$0C,$89
                    db $0D,$89,$0E,$89,$0F,$89,$0A,$97
                    db $19,$1E,$F5,$11,$20,$FF

                    db $91,$EA,$72,$19,$65,$15,$06,$13
                    db $F5,$11,$14,$F0,$8F,$C4,$A4,$13
                    db $29,$05,$29,$2D,$A1,$34,$04,$0F
                    db $04,$1A,$39,$1A,$39,$1A,$39,$F1
                    db $5B,$95,$A1,$0A,$A1,$3C,$04,$18
                    db $36,$18,$36,$18,$36,$02,$29,$0E
                    db $29,$F0,$91,$F1,$1B,$F1,$F1,$5D
                    db $83,$36,$25,$07,$25,$12,$31,$12
                    db $31,$12,$31,$10,$41,$02,$31,$04
                    db $83,$12,$31,$07,$29,$12,$31,$05
                    db $3A,$12,$31,$05,$3A,$F0,$5C,$F0
                    db $95,$90,$37,$10,$37,$10,$37,$10
                    db $37,$08,$83,$09,$83,$0F,$83,$10
                    db $37,$10,$37,$1A,$54,$00,$37,$F0
                    db $1C,$F1,$15,$34,$88,$0D,$88,$50
                    db $25,$02,$25,$06,$26,$0A,$25,$0C
                    db $25,$0E,$25,$38,$80,$19,$83,$0A
                    db $83,$32,$25,$0F,$25,$F0,$88,$F0
                    db $B5,$F1,$1C,$F1,$35,$F1,$A8,$F1
                    db $D5,$7D,$A8,$17,$25,$1D,$05,$12
                    db $81,$23,$83,$31,$25,$00,$2D,$04
                    db $52,$08,$52,$F0,$5C,$F0,$75,$F1
                    db $BC,$F1,$D1,$B8,$12,$F1,$0C,$F1
                    db $2A,$F5,$11,$39,$FF

                    db $00,$F3,$90,$08,$34,$E1,$48,$E1
                    db $67,$12,$F5,$11,$40,$32,$E1,$09
                    db $E4,$54,$12,$18,$12,$09,$12,$0A
                    db $12,$0B,$12,$0C,$12,$84,$E1,$3A
                    db $E2,$22,$12,$1D,$12,$16,$E1,$54
                    db $12,$3C,$12,$2B,$12,$26,$12,$0A
                    db $12,$44,$E7,$34,$12,$05,$12,$16
                    db $12,$27,$12,$08,$12,$0C,$E1,$24
                    db $00,$0A,$00,$13,$E1,$0A,$E2,$55
                    db $E4,$36,$E2,$21,$E1,$4A,$12,$0D
                    db $12,$34,$12,$16,$E2,$52,$12,$04
                    db $E1,$40,$EB,$0C,$03,$0D,$E2,$51
                    db $EA,$0C,$03,$0D,$E1,$32,$12,$03
                    db $12,$04,$12,$05,$12,$08,$12,$09
                    db $12,$0A,$12,$2C,$12,$17,$12,$87
                    db $E1,$11,$12,$0D,$12,$32,$E2,$09
                    db $E2,$36,$E1,$18,$12,$59,$E1,$55
                    db $12,$46,$12,$29,$12,$F0,$34,$F2
                    db $07,$0C,$F5,$11,$27,$F0,$18,$F0
                    db $57,$F4,$44,$0D,$48,$0D,$92,$0D
                    db $0D,$0D,$F2,$4A,$0D,$0B,$0D,$0C
                    db $0D,$46,$0D,$B3,$0C,$BD,$0D,$34
                    db $0D,$0A,$0D,$A2,$0D,$BC,$0C,$6C
                    db $0D,$51,$0D,$0D,$0D,$B5,$0C,$19
                    db $0C,$0A,$0C,$0B,$0C,$96,$0D,$CE
                    db $86,$2D,$84,$2B,$82,$0C,$82,$59
                    db $8C,$26,$8A,$08,$8A,$97,$03,$17
                    db $03,$FF

                    db $80,$E8,$40,$00,$24,$10,$28,$0C
                    db $F5,$11,$30,$0E,$11,$90,$E7,$08
                    db $03,$09,$EF,$50,$10,$28,$11,$6C
                    db $3F,$1A,$3E,$1E,$3F,$40,$10,$22
                    db $11,$07,$17,$59,$0B,$F5,$11,$50
                    db $2C,$37,$19,$3C,$1E,$33,$13,$39
                    db $48,$11,$19,$E2,$12,$10,$F2,$2A
                    db $0A,$F5,$11,$10,$20,$E1,$04,$E1
                    db $09,$E2,$4D,$11,$13,$10,$28,$11
                    db $FF

                    db $90,$EA,$13,$22,$86,$13,$F5,$11
                    db $42,$F0,$AF,$C3,$32,$07,$36,$46
                    db $00,$F0,$11,$F0,$6C,$F1,$4B,$F1
                    db $CA,$F5,$11,$60,$FF

                    db $AA,$F8,$13,$2A,$F0,$50,$F0,$CD
                    db $F1,$0C,$F1,$4F,$F1,$8E,$F2,$8B
                    db $81,$15,$32,$32,$00,$03,$00,$04
                    db $00,$05,$00,$06,$00,$07,$00,$08
                    db $00,$F0,$50,$F1,$37,$F1,$6F,$F1
                    db $97,$F1,$CA,$FF

                    db $00,$F3,$00,$00,$03,$A3,$F5,$12
                    db $12,$43,$E5,$20,$86,$01,$86,$18
                    db $E3,$3A,$E3,$30,$EF,$FF

                    db $80,$E8,$63,$00,$27,$A9,$74,$23
                    db $F5,$12,$20,$13,$81,$04,$81,$05
                    db $81,$0A,$E3,$22,$E9,$64,$E3,$B6
                    db $80,$0C,$80,$3E,$11,$6C,$A6,$F5
                    db $12,$00,$2D,$E2,$36,$E5,$0C,$05
                    db $0D,$E4,$41,$10,$7E,$01,$31,$3C
                    db $0F,$33,$2E,$80,$34,$10,$17,$11
                    db $76,$52,$07,$2B,$0A,$22,$15,$C6
                    db $1E,$3A,$23,$80,$0D,$80,$3D,$10
                    db $69,$26,$1D,$00,$1C,$E7,$49,$80
                    db $57,$21,$33,$04,$13,$00,$11,$EE
                    db $F4,$42,$0F,$06,$0F,$DC,$0F,$26
                    db $0F,$E7,$0F,$F2,$90,$0F,$1E,$0F
                    db $E3,$0F,$1D,$0F,$E9,$0F,$B6,$C4
                    db $1D,$0F,$18,$0A,$F5,$12,$50,$FF

                    db $80,$E8,$30,$00,$3C,$11,$19,$10
                    db $5F,$EB,$34,$E7,$0C,$E9,$54,$10
                    db $1B,$29,$5C,$E6,$31,$29,$02,$E8
                    db $19,$EA,$5C,$29,$43,$ED,$23,$04
                    db $06,$EA,$10,$EE,$18,$E7,$12,$EF
                    db $23,$EC,$2C,$A7,$F5,$12,$33,$71
                    db $29,$12,$EB,$20,$29,$02,$E5,$28
                    db $E5,$10,$E3,$F4,$95,$0F,$DB,$0F
                    db $CF,$0F,$12,$0F,$AB,$0F,$81,$0F
                    db $FF

                    db $00,$F3,$30,$00,$64,$A6,$0A,$A6
                    db $22,$E1,$04,$05,$05,$E4,$0A,$05
                    db $0B,$E1,$37,$AA,$21,$E5,$07,$05
                    db $08,$E5,$66,$AB,$08,$AB,$14,$AA
                    db $0A,$AA,$21,$E2,$0B,$E2,$80,$EF
                    db $76,$00,$07,$00,$08,$00,$09,$00
                    db $12,$A7,$05,$00,$0A,$00,$15,$00
                    db $0A,$00,$10,$E1,$02,$05,$03,$EC
                    db $85,$00,$0A,$00,$0C,$00,$10,$EF
                    db $30,$EF,$3A,$E3,$13,$A3,$F5,$12
                    db $23,$20,$E2,$03,$05,$04,$EB,$F4
                    db $35,$C4,$23,$0F,$0B,$0F,$17,$0A
                    db $F5,$12,$40,$C2,$0F,$0C,$0F,$FF

                    db $89,$EA,$10,$02,$48,$0A,$F5,$12
                    db $30,$0C,$33,$F0,$8B,$F1,$6C,$F2
                    db $74,$39,$1A,$43,$1A,$43,$00,$00
                    db $F0,$8D,$F1,$4C,$F1,$CA,$F5,$13
                    db $00,$FF

                    db $89,$EA,$00,$01,$4C,$00,$21,$2D
                    db $02,$21,$03,$21,$04,$21,$05,$21
                    db $06,$26,$07,$51,$11,$38,$3A,$32
                    db $17,$0A,$F5,$12,$16,$F0,$3C,$F1
                    db $EA,$FF

                    db $80,$FF,$20,$00,$80,$E5,$0D,$E5
                    db $2A,$E5,$36,$E5,$52,$10,$1A,$10
                    db $1C,$10,$63,$E6,$0B,$E6,$62,$10
                    db $47,$B5,$52,$65,$27,$E8,$F5,$13
                    db $10,$F4,$20,$C4,$4F,$0F,$F2,$95
                    db $0F,$0E,$0F,$68,$19,$3B,$1D,$0E
                    db $1D,$27,$40,$28,$1C,$28,$0B,$FF

                    db $A1,$EA,$65,$01,$87,$13,$F5,$13
                    db $02,$22,$3D,$F0,$50,$85,$84,$0B
                    db $84,$6F,$04,$10,$3E,$F0,$34,$F0
                    db $70,$F1,$14,$F1,$50,$F1,$94,$F1
                    db $B0,$F1,$EF,$D1,$4E,$42,$7D,$F0
                    db $17,$F0,$50,$CD,$04,$10,$4C,$0D
                    db $82,$0E,$43,$20,$7C,$0E,$75,$F1
                    db $14,$F1,$50,$A2,$3D,$27,$80,$17
                    db $A4,$F5,$13,$60,$0E,$4F,$14,$81
                    db $27,$03,$90,$35,$3E,$46,$24,$76
                    db $0C,$78,$38,$A6,$F5,$13,$22,$86
                    db $84,$07,$84,$08,$84,$45,$80,$F1
                    db $2A,$FF

                    db $A1,$EA,$95,$01,$88,$0A,$F5,$13
                    db $93,$13,$2B,$05,$0F,$0B,$0F,$13
                    db $0F,$0D,$0F,$24,$2A,$0C,$26,$F0
                    db $50,$F0,$EF,$F1,$50,$F1,$EA,$38
                    db $A9,$F5,$13,$86,$3C,$81,$0D,$80
                    db $3A,$A3,$5C,$81,$1D,$80,$F0,$10
                    db $F0,$91,$F1,$90,$62,$80,$03,$81
                    db $35,$A3,$07,$A8,$F5,$13,$16,$47
                    db $03,$13,$81,$12,$80,$17,$03,$F0
                    db $91,$F1,$0A,$28,$A9,$F5,$13,$73
                    db $3C,$81,$0D,$80,$3A,$A3,$5C,$81
                    db $1D,$80,$F1,$11,$F1,$90,$62,$80
                    db $03,$81,$35,$A3,$53,$81,$08,$0A
                    db $F5,$13,$66,$12,$80,$F0,$91,$F0
                    db $FB,$F1,$4A,$38,$A7,$F5,$13,$41
                    db $98,$4E,$F1,$11,$F1,$CF,$97,$AB
                    db $F5,$13,$70,$A7,$03,$F0,$F0,$F1
                    db $CA,$98,$0A,$F5,$13,$43,$25,$3D
                    db $F0,$AF,$62,$A7,$F5,$13,$44,$86
                    db $2D,$16,$0F,$19,$0F,$0F,$0F,$1C
                    db $0F,$1B,$26,$0D,$2A,$F0,$6A,$F0
                    db $DC,$7C,$0A,$F5,$13,$32,$52,$0F
                    db $F0,$6E,$F1,$CA,$FF

                    db $A1,$EA,$34,$01,$5C,$40,$1C,$A4
                    db $25,$0A,$F5,$13,$63,$24,$33,$F0
                    db $50,$80,$4F,$10,$A7,$05,$A7,$0C
                    db $A7,$80,$4F,$60,$4F,$10,$4F,$10
                    db $A5,$35,$35,$13,$0A,$F5,$13,$29
                    db $20,$4F,$10,$4F,$90,$A3,$28,$0A
                    db $F5,$13,$69,$F0,$11,$F1,$4A,$FF

                    db $A1,$EA,$95,$02,$3F,$A7,$36,$80
                    db $16,$A3,$43,$0A,$F5,$13,$80,$19
                    db $01,$F0,$50,$80,$87,$01,$87,$02
                    db $3D,$47,$80,$0B,$81,$0E,$81,$0F
                    db $81,$17,$A4,$F5,$13,$25,$37,$03
                    db $70,$3F,$55,$0F,$0B,$0F,$14,$0F
                    db $08,$09,$F5,$13,$47,$0C,$0F,$90
                    db $3F,$52,$80,$05,$80,$17,$0A,$F5
                    db $13,$27,$7A,$A6,$0D,$AB,$20,$37
                    db $08,$87,$09,$87,$8D,$03,$F5,$13
                    db $28,$F1,$CA,$F3,$F2,$B7,$0A,$F5
                    db $13,$42,$F0,$50,$E3,$00,$08,$00
                    db $13,$0F,$08,$0F,$F2,$A4,$0F,$12
                    db $0F,$03,$0F,$05,$0F,$06,$0F,$F1
                    db $4F,$F1,$8A,$F5,$13,$50,$FF

                    db $AA,$EA,$22,$0B,$3D,$2C,$62,$48
                    db $F0,$4F,$F0,$AC,$F1,$6E,$90,$2C
                    db $03,$2C,$06,$2C,$1D,$2C,$4F,$32
                    db $29,$44,$F1,$3A,$F1,$DC,$90,$2C
                    db $03,$2C,$06,$2C,$09,$2C,$34,$32
                    db $22,$1A,$18,$0F,$09,$44,$F1,$7A
                    db $F1,$D8,$FF

                    db $21,$E0,$97,$01,$08,$A5,$F5,$13
                    db $14,$92,$4B,$42,$4B,$F0,$55,$F1
                    db $DC,$33,$29,$22,$4B,$42,$4B,$3C
                    db $29,$22,$4B,$F0,$75,$F1,$1C,$F1
                    db $95,$42,$4B,$3C,$29,$22,$4B,$42
                    db $4B,$33,$29,$F0,$5C,$F0,$D5,$F1
                    db $7C,$22,$4B,$37,$29,$12,$4B,$7A
                    db $0A,$F5,$13,$30,$F0,$15,$F1,$A0
                    db $F3,$F2,$48,$AA,$27,$0A,$F5,$13
                    db $24,$28,$03,$F0,$97,$F1,$00,$78
                    db $AE,$5A,$29,$15,$29,$38,$03,$3A
                    db $29,$16,$29,$F0,$76,$F1,$20,$F1
                    db $56,$28,$A4,$18,$03,$3B,$29,$14
                    db $29,$18,$A5,$28,$03,$46,$29,$0A
                    db $29,$18,$AB,$F0,$20,$F0,$56,$F1
                    db $00,$F1,$36,$28,$03,$B7,$0A,$F5
                    db $13,$33,$F0,$00,$F1,$17,$F1,$A0
                    db $FF

                    db $21,$E0,$35,$01,$08,$A4,$F5,$13
                    db $26,$76,$33,$34,$37,$31,$33,$0B
                    db $43,$F0,$54,$35,$36,$15,$46,$25
                    db $46,$15,$36,$22,$42,$33,$44,$38
                    db $33,$F0,$F5,$3B,$42,$26,$73,$0C
                    db $31,$46,$35,$33,$39,$36,$33,$F0
                    db $9C,$F0,$B4,$33,$49,$32,$49,$2C
                    db $42,$24,$37,$17,$80,$11,$32,$07
                    db $A4,$F5,$13,$23,$37,$03,$F1,$A0
                    db $FF

                    db $21,$E0,$64,$01,$28,$A8,$2C,$0A
                    db $F5,$13,$40,$29,$45,$F0,$54,$95
                    db $35,$52,$32,$45,$33,$48,$34,$34
                    db $37,$32,$33,$2C,$31,$46,$32,$38
                    db $33,$F0,$95,$35,$35,$52,$33,$15
                    db $AD,$07,$33,$12,$0A,$F5,$13,$90
                    db $22,$32,$05,$03,$0A,$31,$1A,$A9
                    db $2A,$03,$0B,$32,$F1,$5C,$81,$86
                    db $14,$30,$06,$33,$0B,$30,$34,$36
                    db $31,$AF,$04,$36,$F0,$D4,$31,$03
                    db $74,$A6,$06,$A6,$07,$82,$08,$A6
                    db $0A,$A6,$0D,$AE,$F0,$20,$F1,$14
                    db $7D,$03,$4E,$A8,$37,$40,$17,$A6
                    db $F5,$13,$21,$57,$03,$F0,$00,$F0
                    db $94,$F1,$A0,$F4,$D6,$0F,$09,$0F
                    db $53,$0F,$46,$0F,$3A,$0F,$B7,$0F
                    db $2A,$0F,$B6,$0F,$FF

                    db $01,$FE,$30,$00,$28,$10,$4D,$81
                    db $2B,$AD,$0D,$0A,$F5,$13,$83,$2B
                    db $05,$0C,$41,$22,$10,$46,$10,$4C
                    db $AA,$2B,$80,$0C,$05,$11,$10,$28
                    db $11,$4B,$AA,$15,$10,$1B,$05,$0C
                    db $80,$7C,$AA,$11,$10,$1B,$80,$0C
                    db $05,$24,$35,$14,$35,$14,$35,$14
                    db $35,$14,$33,$08,$AB,$14,$33,$14
                    db $33,$18,$05,$77,$0A,$F5,$13,$20
                    db $F0,$80,$F1,$57,$F1,$A0,$FF

                    db $FF                                   ; Empty level, clear level. NOT empty data.

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF       ; \ Empty data.
                    db $FF,$FF,$FF,$FF,$FF                   ; /

DATA_11F4BB:        db $F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5       ; \ High byte of pointer to high byte of room pointers of sprite data, indexed by level number.
                    db $F5,$F5,$F5,$F5,$F5,$F6,$F6,$F6       ;  | ...or basically, a pointer to 20 different kinds of pointers. (Each which has 10 bytes, one per room.)
                    db $F6,$F6,$F6,$F6,$F6                   ; / Somewhat confusing at first, but after looking a bit at it you will get it.

DATA_11F4D0:        db $0F,$23,$37,$4B,$5F,$73,$87,$9B       ; \
                    db $AF,$C3,$D7,$EB,$FF,$13,$27,$3B       ;  | Low byte of pointer to high byte of room pointers of sprite data, indexed by level number.
                    db $4F,$63,$77,$8B,$9F                   ; /

DATA_11F4E5:        db $F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5       ; \
                    db $F5,$F5,$F5,$F5,$F6,$F6,$F6,$F6       ;  | High byte of pointer to low byte of room pointers of sprite data, indexed by level number.
                    db $F6,$F6,$F6,$F6,$F6                   ; /

DATA_11F4FA:        db $19,$2D,$41,$55,$69,$7D,$91,$A5       ; \
                    db $B9,$CD,$E1,$F5,$09,$1D,$31,$45       ;  | Low byte of pointer to low byte of room pointers of sprite data, indexed by level number.
                    db $59,$6D,$81,$95,$A9                   ; /

                    db $F6,$F6,$F6,$F7,$F7,$F7,$F7,$F7       ; \ High byte of pointers, indexed per room, level 1-1.
                    db $F7,$F7                               ; /

                    db $B3,$BC,$D1,$0E,$14,$19,$19,$19       ; \ Low byte of pointers, indexed per room, level 1-1.
                    db $19,$19                               ; /

                    db $F7,$F7,$F7,$F7,$F7,$F7,$F7,$F7       ; \ High byte of pointers, indexed per room, level 1-2.
                    db $F7,$F7                               ; /

                    db $25,$45,$54,$5E,$64,$71,$71,$71       ; \ Low byte of pointers, indexed per room, level 1-2.
                    db $71,$71                               ; /

                    db $F7,$F7,$F7,$F7,$F7,$F7,$F7,$F7       ; \ High byte of pointers, indexed per room, level 1-3.
                    db $F7,$F7                               ; /

                    db $74,$A9,$B1,$CB,$EE,$EE,$EE,$EE       ; \ Low byte of pointers, indexed per room, level 1-3.
                    db $EE,$EE                               ; /

                    db $F7,$F8,$F8,$F8,$F8,$F8,$F8,$F8       ; \ High byte of pointers, indexed per room, level 2-1.
                    db $F8,$F8                               ; /

                    db $F5,$14,$25,$25,$2F,$25,$25,$25       ; \ Low byte of pointers, indexed per room, level 2-1.
                    db $25,$25                               ; /

                    db $F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8       ; \ High byte of pointers, indexed per room, level 2-2.
                    db $F8,$F8                               ; /

                    db $3C,$47,$76,$85,$98,$A5,$A5,$A5       ; \ Low byte of pointers, indexed per room, level 2-2.
                    db $A5,$A5                               ; /

                    db $F8,$F8,$F8,$F8,$F8,$F9,$F9,$F9       ; \ High byte of pointers, indexed per room, level 2-3.
                    db $F9,$F9                               ; /

                    db $AF,$B3,$CE,$D1,$F3,$00,$20,$27       ; \ Low byte of pointers, indexed per room, level 2-3.
                    db $27,$27                               ; /

                    db $F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9       ; \ High byte of pointers, indexed per room, level 3-1.
                    db $F9,$F9                               ; /

                    db $30,$33,$4E,$52,$63,$6E,$6E,$6E       ; \ Low byte of pointers, indexed per room, level 3-1.
                    db $6E,$6E                               ; /

                    db $F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9       ; \ High byte of pointers, indexed per room, level 3-2.
                    db $F9,$F9                               ; /

                    db $6E,$91,$AA,$B5,$BA,$BA,$BA,$BA       ; \ Low byte of pointers, indexed per room, level 3-2.
                    db $BA,$BA                               ; /

                    db $F9,$F9,$F9,$F9,$FA,$FA,$FA,$FA       ; \ High byte of pointers, indexed per room, level 3-3.
                    db $FA,$FA                               ; /

                    db $BA,$BF,$CE,$E1,$14,$30,$3D,$49       ; \ Low byte of pointers, indexed per room, level 3-3.
                    db $5D,$5D                               ; /

                    db $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA       ; \ High byte of pointers, indexed per room, level 4-1.
                    db $FA,$FA                               ; /

                    db $67,$96,$B7,$B7,$B7,$B7,$B7,$B7       ; \ Low byte of pointers, indexed per room, level 4-1.
                    db $B7,$B7                               ; /

                    db $FA,$FA,$FB,$FB,$FB,$FB,$FB,$FB       ; \ High byte of pointers, indexed per room, level 4-2.
                    db $FB,$FB                               ; /

                    db $E5,$EA,$31,$58,$63,$63,$63,$63       ; \ Low byte of pointers, indexed per room, level 4-2.
                    db $63,$63                               ; /

                    db $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB       ; \ High byte of pointers, indexed per room, level 4-3.
                    db $FC,$FC                               ; /

                    db $72,$76,$85,$AC,$C5,$D0,$E3,$F6       ; \ Low byte of pointers, indexed per room, level 4-3.
                    db $03,$0E                               ; /

                    db $FC,$FC,$FC,$FC,$FC,$FC,$FC,$FC       ; \ High byte of pointers, indexed per room, level 5-1.
                    db $FC,$FC                               ; /

                    db $19,$23,$4C,$55,$55,$55,$55,$55       ; \ Low byte of pointers, indexed per room, level 5-1.
                    db $55,$55                               ; /

                    db $FC,$FC,$FC,$FC,$FC,$FC,$FC,$FC       ; \ High byte of pointers, indexed per room, level 5-2.
                    db $FC,$FC                               ; /

                    db $55,$5A,$91,$AA,$B6,$BF,$CB,$CB       ; \ Low byte of pointers, indexed per room, level 5-2.
                    db $CB,$CB                               ; /

                    db $FC,$FC,$FC,$FD,$FD,$FD,$FD,$FD       ; \ High byte of pointers, indexed per room, level 5-3.
                    db $FD,$FD                               ; /

                    db $CB,$D0,$EF,$01,$1F,$40,$40,$40       ; \ Low byte of pointers, indexed per room, level 5-3.
                    db $40,$40                               ; /

                    db $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD       ; \ High byte of pointers, indexed per room, level 6-1.
                    db $FD,$FD                               ; /

                    db $45,$70,$7F,$89,$96,$A5,$AE,$AE       ; \ Low byte of pointers, indexed per room, level 6-1.
                    db $AE,$AE                               ; /

                    db $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD       ; \ High byte of pointers, indexed per room, level 6-2.
                    db $FD,$FD                               ; /

                    db $B2,$B7,$EC,$EC,$EC,$EC,$EC,$EC       ; \ Low byte of pointers, indexed per room, level 6-2.
                    db $EC,$EC                               ; /

                    db $FD,$FD,$FE,$FE,$FE,$FE,$FE,$FE       ; \ High byte of pointers, indexed per room, level 6-3.
                    db $FE,$FE                               ; /

                    db $F6,$FA,$08,$23,$50,$55,$5E,$5E       ; \ Low byte of pointers, indexed per room, level 6-3.
                    db $5E,$5E                               ; /

                    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE       ; \ High byte of pointers, indexed per room, level 7-1.
                    db $FE,$FE                               ; /

                    db $63,$67,$93,$A8,$BD,$C6,$C6,$C6       ; \ Low byte of pointers, indexed per room, level 7-1.
                    db $C6,$C6                               ; /

                    db $FE,$FE,$FE,$FF,$FF,$FF,$FF,$FF       ; \ High byte of pointers, indexed per room, level 7-2.
                    db $FF,$FF                               ; /

                    db $CC,$D8,$F4,$15,$2E,$53,$5B,$86       ; \ Low byte of pointers, indexed per room, level 7-2.
                    db $A5,$CB                               ; /

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF       ; \ High byte of pointers, indexed per room, level 7-3. (Unused.)
                    db $FF,$FF                               ; /

                    db $D6,$D7,$D8,$D9,$DA,$DA,$DA,$DA       ; \ Low byte of pointers, indexed per room, level 7-3. (Unused.)
                    db $DA,$DA                               ; /

                    db $01,$01,$05,$03,$76,$03,$6C,$01       ; \ Sprite data. First room, level 1-1. (Vertical room where you fall from one door.)
                    db $01                                   ; / Total amount of sprites: 2.

                    db $05,$14,$56,$14,$AD,$03,$03,$9D       ; \ Sprite data.
                    db $07,$0E,$83,$0E,$79,$03,$BC,$05       ;  | Vertical room leading up to Birdo, level 1-1.
                    db $0E,$90,$0E,$75,$01                   ; / Total amount of sprites: 8.

                    db $03,$01,$EC,$07,$01,$1C,$02,$5C       ; \ Sprite data.
                    db $03,$E5,$07,$01,$6C,$02,$8C,$01       ;  | Main room, level 1-1.
                    db $CC,$05,$03,$79,$01,$D4,$09,$01       ;  | Total amount of sprites: 25.
                    db $04,$02,$34,$3B,$87,$3B,$C7,$07       ;  |
                    db $03,$A9,$03,$BC,$03,$C6,$05,$01       ;  |
                    db $9C,$03,$E5,$05,$01,$2C,$02,$4C       ;  |
                    db $07,$01,$1C,$03,$45,$02,$4C,$05       ;  |
                    db $01,$95,$14,$D1,$01                   ; /

                    db $03,$03,$85,$01,$01,$01               ; Sprite data. Top room inside cave, level 1-1. Total amount of sprites: 1.

                    db $03,$0E,$BC,$01,$01                   ; Sprite data. Bottom room inside cave, level 1-1. Total amount of sprites: 1.

                    db $01,$01,$07,$1C,$A7,$44,$A8,$43       ; \ Sprite data. Birdo room, level 1-1.
                    db $E7,$01,$01,$01                       ; / Total amount of sprites: 3.

                    db $03,$42,$6A,$03,$12,$22,$09,$0F       ; \ Sprite data.
                    db $00,$0F,$40,$0F,$90,$0F,$E0,$01       ;  | Main room (outside), level 1-2.
                    db $05,$0E,$3C,$0E,$6C,$05,$06,$53       ;  | Total amount of sprites: 12.
                    db $0D,$83,$05,$01,$B6,$01,$F6,$01       ; /

                    db $03,$01,$DC,$03,$07,$3C,$03,$06       ; \ Sprite data. Cave room, level 1-2.
                    db $2C,$05,$0D,$79,$0D,$89,$01           ; / Total amount of sprites: 5.

                    db $01,$05,$1C,$A7,$44,$A8,$03,$43       ; \ Sprite data. Birdo room, level 1-2.
                    db $38,$01                               ; / Total amount of sprites: 3.

                    db $05,$3D,$79,$17,$77,$01               ; Sprite data. Jar room with key, level 1-2. Total amount of sprites: 2.

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Jar room with 1-Up, level 1-2.
                    db $01,$01,$03,$02,$28                   ; / Total amount of sprites: 1.

                    db $01,$01,$01                           ; Unused.

                    db $03,$42,$38,$05,$07,$94,$07,$B4       ; \ Sprite data.
                    db $03,$01,$74,$05,$13,$34,$13,$A4       ;  | Main room, level 1-3.
                    db $07,$13,$02,$13,$62,$3B,$E6,$05       ;  | Total amount of sprites: 21.
                    db $3B,$26,$3B,$66,$09,$13,$4A,$3B       ;  |
                    db $5C,$13,$8A,$3B,$9C,$05,$03,$2A       ;  |
                    db $03,$7A,$09,$0D,$29,$0D,$49,$02       ;  |
                    db $7A,$02,$9A,$01,$01                   ; /

                    db $07,$17,$83,$3D,$88,$2E,$8A,$01       ; Sprite data. Room with key, level 1-3. Total amount of sprites: 3.

                    db $07,$2E,$4B,$30,$7C,$30,$C9,$01       ; \ Sprite data.
                    db $07,$30,$61,$31,$5A,$03,$BA,$03       ;  | First (vertical) castle chamber, level 1-3.
                    db $01,$DB,$03,$06,$4A,$03,$03,$35       ;  | Total amount of sprites: 9.
                    db $01,$01                               ; /

                    db $03,$31,$C9,$03,$2F,$C6,$09,$02       ; \ Sprite data.
                    db $56,$07,$D4,$07,$D7,$07,$DA,$05       ;  | Second (horizontal) castle chamber, level 1-3.
                    db $30,$A7,$30,$F7,$05,$2E,$3A,$2E       ;  | Total amount of sprites: 14.
                    db $6A,$09,$0D,$09,$0D,$29,$44,$A8       ;  |
                    db $43,$D7,$01                           ; /

                    db $03,$30,$F6,$03,$5D,$D7,$01           ; Sprite data. Mouser/boss room, level 1-3. Total amount of sprites: 2.

                    db $01,$03,$19,$FA,$03,$18,$A7,$05       ; \ Sprite data.
                    db $01,$69,$03,$99,$03,$18,$47,$03       ;  | Main room (outside in the desert), level 2-1.
                    db $03,$F8,$01,$07,$23,$24,$01,$27       ;  | Total amount of sprites: 10.
                    db $01,$49,$03,$19,$4A,$01,$01           ; /

                    db $05,$01,$49,$01,$6D,$03,$01,$D3       ; \ Sprite data.
                    db $07,$01,$40,$06,$16,$01,$C8,$01       ;  | Inside the pyramid, level 2-1.
                    db $01                                   ; / Total amount of sprites: 6.

                    db $01,$05,$1C,$A8,$44,$A9,$03,$43       ; \ Sprite data. Birdo room, level 2-1.
                    db $D3,$01                               ; / Total amount of sprites: 3.

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Jar room (Snifit), level 2-1.
                    db $01,$01,$03,$06,$6C                   ; / Total amount of sprites: 1.

                    db $03,$42,$5A,$01,$01,$01,$01,$01       ; \ Sprite data. First room, level 2-2.
                    db $01,$01,$01                           ; / Total amount of sprites: 1.

                    db $01,$03,$19,$8D,$05,$0F,$50,$18       ; \ Sprite data.
                    db $FA,$03,$01,$99,$05,$18,$0A,$18       ;  | Main room (outside in the desert), level 2-2.
                    db $37,$07,$0F,$10,$18,$15,$3B,$97       ;  | Total amount of sprites: 18.
                    db $07,$18,$58,$18,$A8,$18,$E7,$09       ;  |
                    db $18,$28,$18,$57,$1A,$86,$18,$97       ;  |
                    db $03,$23,$B5,$03,$23,$05,$01           ; /

                    db $07,$03,$B8,$03,$F8,$03,$FB,$01       ; \ Sprite data. Cave room with extras, level 2-2.
                    db $01,$01,$01,$01,$01,$01,$01           ; / Total amount of sprites: 3.

                    db $03,$01,$8A,$05,$01,$C2,$01,$67       ; \ Sprite data.
                    db $07,$0E,$A0,$01,$78,$01,$BD,$03       ;  | Inside the pyramid, level 2-2.
                    db $06,$E2,$01                           ; / Total amount of sprites: 7.

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Jar room, level 2-2.
                    db $01,$01,$03,$01,$B9                   ; / Total amount of sprites: 1.

                    db $01,$05,$1C,$B4,$44,$B4,$03,$43       ; \ Sprite data. Birdo room, level 2-2.
                    db $B3,$01                               ; / Total amount of sprites: 3.

                    db $03,$42,$17,$01                       ; Sprite data. Trapped in the sand (first room), level 2-3. Total amount of sprites: 1.

                    db $03,$03,$C7,$03,$49,$20,$05,$0F       ; \ Sprite data.
                    db $20,$48,$A0,$01,$01,$03,$48,$80       ;  | Main room, level 2-3.
                    db $01,$03,$49,$00,$05,$19,$7A,$1A       ;  | Total amount of sprites: 8.
                    db $D6,$01,$01                           ; /

                    db $01,$01,$01                           ; Cave room with extras, level 2-3. No sprites used.

                    db $03,$03,$4B,$05,$01,$D5,$01,$AA       ; \ Sprite data.
                    db $05,$03,$D2,$01,$D5,$03,$02,$88       ;  | Inside the pyramid, level 2-3.
                    db $07,$01,$83,$01,$A9,$01,$1D,$07       ;  | Total amount of sprites: 13.
                    db $01,$B1,$01,$89,$01,$3D,$03,$01       ;  |
                    db $E3,$01                               ; /

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Jar room, level 2-3.
                    db $01,$01,$03,$01,$B9                   ; / Total amount of sprites: 1.

                    db $01,$09,$01,$15,$01,$08,$01,$F8       ; \ Sprite data.
                    db $01,$CB,$01,$07,$23,$14,$03,$39       ;  | Room leading to the boss, level 2-3.
                    db $03,$7B,$03,$18,$67,$07,$18,$0A       ;  | Total amount of sprites: 12
                    db $44,$3B,$18,$6A,$03,$43,$97,$01       ; /

                    db $01,$05,$5F,$C5,$02,$D0,$01           ; Sprite data. Triclyde boss room, level 2-3. Total amount of sprites: 2.

                    db $07,$17,$83,$3D,$87,$2F,$A9,$01       ; \ Sprite data. Key room, level 2-3.
                    db $01                                   ; /

                    db $01,$01,$01                           ; First room, level 3-1. No sprites used.

                    db $03,$49,$08,$03,$48,$0E,$03,$48       ; \ Sprite data.
                    db $02,$05,$12,$92,$49,$09,$03,$03       ;  | Big waterfall room, level 3-1.
                    db $E5,$05,$03,$21,$03,$87,$01,$01       ;  | Total amount of sprites: 8.
                    db $01,$01,$01

                    db $01,$01,$01,$01                       ; Secret warp room, level 3-1. No sprites used.

                    db $01,$03,$03,$2B,$03,$25,$12,$03       ; \ Sprite data.
                    db $23,$95,$03,$03,$65,$03,$24,$05       ;  | Up in the clouds, level 3-1.
                    db $01                                   ; / Total amount of sprites: 5.

                    db $01,$07,$43,$93,$1C,$B9,$44,$BA       ; \ Sprite data. Birdo room, level 3-1.
                    db $01,$01,$01                           ; / Total amount of sprites: 3.

                    db $05,$42,$42,$49,$40,$05,$08,$25       ; \ Sprite data.
                    db $48,$C0,$01,$03,$48,$00,$05,$25       ;  | Main room (outside), level 3-2.
                    db $E6,$49,$80,$01,$05,$08,$35,$08       ;  | Total amount of sprites: 12.
                    db $55,$05,$06,$A4,$06,$CB,$01,$03       ;  |
                    db $06,$96,$01                           ; /

                    db $07,$04,$3C,$04,$6C,$04,$EC,$03       ; \ Sprite data.
                    db $04,$1C,$01,$01,$03,$03,$29,$07       ;  | Main room (underground), level 3-2.
                    db $02,$29,$02,$49,$02,$6C,$01,$01       ;  | Total amount of sprites: 8.
                    db $01                                   ; /

                    db $05,$1C,$B6,$44,$B6,$03,$43,$FA       ; \ Sprite data. Birdo room, level 3-2.
                    db $01,$01,$01                           ; / Total amount of sprites: 3.

                    db $01,$03,$5C,$C7,$01                   ; Sprite data. Unused room (belonging to level 3-2). Total amount of sprites: 1.

                    db $03,$42,$4A,$01,$01                   ; Sprite data. First room, level 3-3. Total amount of sprites: 1.

                    db $01,$01,$07,$0A,$14,$08,$58,$0A       ; \ Sprite data. Outside the fort, level 3-3.
                    db $84,$01,$01,$01,$01,$01,$01           ; / Total amount of sprites: 3.

                    db $03,$31,$65,$05,$0E,$75,$0E,$95       ; \ Sprite data.
                    db $09,$30,$05,$31,$55,$0D,$AC,$0D       ;  | Fort hall, first chamber, level 3-3.
                    db $CC,$01,$01                           ; / Total amount of sprites: 7.

                    db $01,$09,$31,$72,$2E,$84,$2E,$B7       ; \ Sprite data.
                    db $30,$4C,$07,$2E,$81,$2F,$1A,$31       ;  | Vertical room #1 (the one which is not directly suitable for advancing to a higher part), level 3-3.
                    db $DF,$07,$2E,$35,$2E,$96,$2E,$18       ;  | Total amount of sprites: 20.
                    db $03,$31,$71,$03,$31,$CF,$07,$2F       ;  |
                    db $20,$31,$70,$2E,$7E,$07,$2F,$71       ;  |
                    db $30,$8D,$31,$7F,$05,$30,$34,$30       ;  |
                    db $C7,$01,$01                           ; /

                    db $03,$06,$6C,$05,$23,$8D,$23,$CD       ; \ Sprite data.
                    db $05,$02,$57,$02,$ED,$01,$05,$05       ;  | Vertical room #2 (leading to the outside part), level 3-3.
                    db $C2,$07,$3B,$05,$07,$C4,$03,$3D       ;  | Total amount of sprites: 10.
                    db $03,$0E,$D6,$01                       ; /
 
                    db $03,$15,$6F,$03,$15,$6B,$03,$15       ; \ Sprite data. Vertical room #3 with Shy Guy generators, level 3-3.
                    db $67,$03,$15,$63,$01                   ; / Total amount of sprites: 4.

                    db $0B,$31,$73,$2F,$84,$31,$79,$17       ; \ Sprite data. Key room, level 3-3.
                    db $87,$3D,$89,$01                       ; / Total amount of sprites: 5.

                    db $01,$05,$0E,$C9,$0E,$E9,$03,$0D       ; \ Sprite data.
                    db $E9,$05,$0D,$09,$0D,$29,$05,$44       ;  | Outside on roof part, level 3-3.
                    db $6B,$43,$AA,$01                       ; / Total amount of sprites: 7.

                    db $03,$2F,$22,$05,$2F,$62,$5D,$D6       ; \ Sprite data. Mouser boss room, level 3-3.
                    db $01,$01                               ; / Total amount of sprites: 3.

                    db $01,$05,$29,$96,$13,$B2,$03,$13       ; \ Sprite data.
                    db $22,$0B,$29,$09,$29,$29,$13,$35       ;  | First icy room, level 4-1.
                    db $29,$D9,$29,$F6,$01,$09,$29,$46       ;  | Total amount of sprites: 18.
                    db $29,$98,$29,$A6,$29,$F8,$05,$13       ;  |
                    db $13,$29,$B8,$05,$29,$08,$29,$B5       ;  |
                    db $05,$29,$35,$13,$41,$01,$01           ; /

                    db $01,$01,$03,$26,$58,$01,$07,$29       ; \ Sprite data.
                    db $0A,$26,$58,$29,$9A,$05,$29,$3A       ;  | Second icy room, level 4-1.
                    db $29,$DC,$03,$26,$F6,$01,$05,$29       ;  | Total amount of sprites: 11.
                    db $3C,$26,$D7,$05,$44,$85,$43,$D4       ;  |
                    db $01                                   ; /

                    db $01,$03,$5C,$B8,$01,$01,$01,$01       ; \ Sprite data.
                    db $01,$01,$01,$01,$01,$01,$01,$01       ;  | Unused (4-1). Perhaps intended for a Birdo fight?
                    db $01,$01,$01,$01,$01,$01,$01,$01       ;  | Would be feasible because 4-1 normally lacks a Birdo fight.
                    db $01,$01,$01,$01,$01,$01,$01,$01       ;  | Total amount of sprites: 1.
                    db $01,$01,$01,$01,$01,$01,$01,$01       ;  |
                    db $01,$01,$01,$01,$01,$01               ; /

                    db $03,$42,$47,$01,$01                   ; Sprite data. First room, 4-2. Total amount of sprites: 1.

                    db $05,$10,$D3,$10,$F5,$03,$10,$D8       ; \ Sprite data.
                    db $09,$10,$16,$10,$37,$10,$44,$10       ;  | Detestable Beezo-fest room, level 4-2.
                    db $78,$0B,$10,$67,$10,$98,$10,$C7       ;  | Total amount of sprites: 30.
                    db $10,$E4,$10,$F8,$07,$29,$C8,$29       ;  |
                    db $E8,$10,$F3,$05,$10,$A6,$10,$D8       ;  |
                    db $0B,$10,$37,$10,$53,$10,$95,$10       ;  |
                    db $D8,$10,$F4,$0B,$10,$3A,$10,$56       ;  |
                    db $10,$7B,$10,$84,$10,$F7,$07,$10       ;  |
                    db $23,$10,$66,$29,$B8,$01,$01           ; /

                    db $01,$03,$28,$6A,$05,$28,$7A,$28       ; \ Sprite data.
                    db $FA,$01,$03,$28,$DA,$05,$28,$69       ;  | Whale room, level 4-2.
                    db $07,$98,$09,$28,$2A,$03,$39,$28       ;  | Total amount of sprites: 14.
                    db $BA,$03,$C9,$05,$28,$69,$03,$88       ;  |
                    db $05,$28,$A9,$29,$D3,$01,$01           ; /

                    db $01,$03,$26,$C7,$01,$05,$04,$99       ; \ Sprite data. Spikes, level 4-2.
                    db $04,$C9,$01                           ; / Total amount of sprites: 3.

                    db $01,$05,$1C,$B8,$44,$B9,$03,$43       ; \ Sprite data. Birdo room, level 4-2.
                    db $BA,$01,$01,$01,$01,$01,$01           ; / Total amount of sprites: 3.

                    db $03,$42,$2A,$01                       ; Sprite data. First room, level 4-3. Total amount of sprites: 1.

                    db $01,$03,$1C,$A9,$01,$01,$01,$01       ; \ Sprite data. Outside room, level 4-3.
                    db $01,$01,$01,$03,$10,$18,$01           ; / Total amount of sprites: 2.

                    db $09,$29,$EA,$29,$EC,$29,$DE,$29       ; \ Sprite data.
                    db $EE,$03,$29,$EE,$05,$29,$E0,$29       ;  | Vertical room up, level 4-3.
                    db $E2,$03,$29,$8C,$09,$29,$92,$29       ;  | Total amount of sprites: 14.
                    db $B2,$29,$E9,$29,$EB,$05,$29,$71       ;  |
                    db $29,$E4,$01,$01,$01,$01,$01           ; /

                    db $07,$01,$C8,$03,$D8,$02,$E8,$01       ; \ Sprite data.
                    db $01,$01,$07,$29,$72,$29,$82,$29       ;  | Vertical room down, level 4-3.
                    db $7E,$01,$03,$29,$C1,$01,$01,$01       ;  | Total amount of sprites: 7.
                    db $01                                   ; /

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ High up the castle outside, level 4-3.
                    db $01,$01,$01                           ; / No sprites used.

                    db $09,$17,$72,$3D,$74,$29,$57,$29       ; \ Sprite data.
                    db $97,$01,$01,$01,$01,$01,$01,$01       ;  | Key room, level 4-3.
                    db $01,$01,$01                           ; / Total amount of sprites: 4.

                    db $05,$29,$65,$29,$95,$05,$44,$2A       ; \ Sprite data.
                    db $43,$87,$01,$01,$01,$01,$01,$01       ;  | Penultimate room, level 4-3.
                    db $01,$01,$01                           ; / Total amount of sprites: 4.

                    db $03,$6A,$24,$01,$01,$01,$01,$01       ; \ Sprite data. Fryguy boss room, level 4-3.
                    db $01,$01,$01,$01,$01                   ; / Total amount of sprites: 1.

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Unused (4-3).
                    db $01,$01,$01                           ; /

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Unused (4-3).
                    db $01,$01,$01                           ; /

                    db $03,$42,$31,$03,$08,$45,$03,$23       ; \ Sprite data. Outside room, level 5-1.
                    db $56,$01                               ; / Total amount of sprites: 3.

                    db $01,$03,$3B,$E4,$09,$3B,$34,$3B       ; \ Sprite data.
                    db $84,$13,$B2,$3B,$D4,$05,$13,$82       ;  | Cave room, level 5-1.
                    db $13,$C2,$05,$13,$02,$3B,$A4,$07       ;  | Total amount of sprites: 15.
                    db $13,$42,$13,$82,$13,$C2,$03,$13       ;  |
                    db $B2,$05,$3B,$94,$3B,$E4,$01,$01       ;  |
                    db $01                                   ; /

                    db $05,$1C,$C4,$44,$C5,$03,$43,$CA       ; \ Sprite data. Birdo room, level 5-1.
                    db $01                                   ; / Total amount of sprites: 3.

                    db $03,$42,$2A,$01,$01                   ; Sprite data. First room, level 5-2. Total amount of sprites: 1.

                    db $01,$07,$14,$78,$14,$96,$14,$B8       ; \ Sprite data.
                    db $09,$08,$29,$14,$D6,$14,$E6,$14       ;  | Main room, level 5-2.
                    db $F6,$01,$09,$04,$8C,$04,$9C,$08       ;  | Total amount of sprites: 22.
                    db $AB,$04,$BC,$05,$14,$89,$14,$B9       ;  |
                    db $05,$14,$55,$14,$95,$07,$14,$17       ;  |
                    db $25,$38,$14,$57,$05,$0D,$26,$0D       ;  |
                    db $46,$05,$04,$6A,$08,$99,$01           ; /

                    db $03,$14,$8B,$09,$10,$F2,$14,$68       ; \ Sprite data.
                    db $14,$8E,$06,$DE,$0B,$10,$02,$06       ;  | Going up into the sky, level 5-2.
                    db $C5,$06,$36,$10,$8E,$10,$DE,$01       ;  | Total amount of sprites: 11.
                    db $01                                   ; /

                    db $01,$01,$01,$01,$01,$01,$05,$13       ; \ Sprite data. Falling from the sky, level 5-2.
                    db $55,$13,$85,$01                       ; / Total amount of sprites: 2.

                    db $03,$01,$2B,$05,$04,$24,$04,$B4       ; \ Sprite data. Jar room, level 5-2.
                    db $01                                   ; / Total amount of sprites: 3.

                    db $01,$07,$13,$73,$1C,$B8,$44,$B9       ; \ Sprite data. Birdo room, level 5-2.
                    db $03,$43,$B4,$01                       ; / Total amount of sprites: 4.

                    db $03,$42,$3A,$01,$01                   ; Sprite data. First room, level 5-2. Total amount of sprites: 1.

                    db $03,$49,$80,$01,$03,$47,$00,$01       ; \ Sprite data.
                    db $03,$47,$40,$03,$49,$C0,$03,$49       ;  | Main room outside, level 5-3.
                    db $C0,$07,$09,$2C,$09,$7C,$09,$AC       ;  | Total amount of sprites: 10.
                    db $01,$05,$09,$58,$09,$78,$01           ; /

                    db $01,$05,$23,$36,$09,$C6,$03,$09       ; \ Sprite data.
                    db $36,$05,$09,$25,$09,$45,$03,$16       ;  | First chamber of fort (with the huge tree), level 5-3.
                    db $A5,$01                               ; / Total amount of sprites: 6.

                    db $01,$05,$24,$52,$24,$3D,$01,$09       ; \ Sprite data.
                    db $09,$90,$09,$B0,$2F,$D5,$30,$4F       ;  | Second chamber of fort (vertical part), level 5-3.
                    db $05,$15,$82,$2F,$A8,$07,$30,$41       ;  | Total amount of sprites: 11.
                    db $15,$84,$31,$8A,$01,$01               ; /

                    db $01,$01,$05,$07,$67,$12,$D2,$01       ; \ Sprite data.
                    db $03,$12,$F2,$01,$07,$0F,$60,$03       ;  | Hopping from tree to tree, penultimate room, level 5-3.
                    db $92,$03,$A6,$05,$03,$07,$03,$55       ;  | Total amount of sprites: 11.
                    db $05,$1C,$B7,$44,$B8,$03,$43,$B5       ;  |
                    db $01                                   ; /

                    db $01,$03,$61,$A7,$01                   ; Sprite data. Clawgrip boss room, level 5-3. Total amount of sprites: 1.

                    db $03,$42,$4A,$07,$19,$1D,$03,$AB       ; \ Sprite data.
                    db $19,$DD,$03,$18,$5A,$03,$1A,$49       ;  | Main room in the desert, level 6-1.
                    db $07,$19,$1D,$19,$5D,$03,$7B,$03       ;  | Total amount of sprites: 16.
                    db $18,$EA,$07,$18,$1A,$19,$AD,$19       ;  |
                    db $BD,$03,$1A,$E6,$05,$1A,$36,$24       ;  |
                    db $99,$01,$01                           ; /

                    db $01,$07,$18,$4B,$18,$9A,$15,$FB       ; \ Sprite data. Inside the jar building, level 6-1. (The one with those sneaky Cobrats.)
                    db $05,$18,$2B,$18,$7B,$01,$01           ; / Total amount of sprites: 5.

                    db $01,$05,$1C,$C8,$44,$C8,$03,$43       ; \ Sprite data. Birdo room, level 6-1.
                    db $27,$01                               ; / Total amount of sprites: 3.

                    db $03,$01,$5A,$09,$01,$41,$01,$B4       ; \ Sprite data. Jar room with key, level 6-1.
                    db $17,$85,$3D,$69,$01                   ; / Total amount of sprites: 5.

                    db $01,$01,$01,$01,$01,$01,$01,$01       ; \ Sprite data. Jar room with turtle shell, level 6-1.
                    db $01,$01,$05,$01,$2A,$01,$DA           ; / Total amount of sprites: 2.

                    db $03,$01,$5A,$05,$01,$41,$01,$B4       ; \ Sprite data. Jar room with 1-Up, level 6-1.
                    db $01                                   ; / Total amount of sprites: 3.

                    db $03,$01,$B8,$01                       ; Sprite data. Jar room with potion, level 6-1. Total amount of sprites: 1.

                    db $03,$42,$2A,$01,$01                   ; Sprite data. First room, level 6-2. Total amount of sprites: 1.

                    db $05,$0B,$0C,$0B,$26,$07,$0C,$AB       ; \ Sprite data.
                    db $0C,$C9,$0C,$E7,$03,$25,$AB,$07       ;  | Air room, level 6-2.
                    db $10,$55,$10,$85,$10,$A5,$05,$0C       ;  | Total amount of sprites: 21.
                    db $98,$0C,$C8,$03,$10,$A3,$07,$0C       ;  |
                    db $63,$0C,$65,$0C,$67,$07,$0C,$65       ;  |
                    db $0C,$93,$0C,$C4,$03,$0C,$EB,$05       ;  |
                    db $0C,$29,$0C,$A9,$01                   ; /

                    db $01,$05,$1C,$CA,$44,$CB,$03,$43       ; \ Sprite data. Birdo room, level 6-2.
                    db $D4,$01                               ; / Total amount of sprites: 3.

                    db $03,$42,$2A,$01                       ; Sprite data. Trapped in the sand, level 6-3. Total amount of sprites: 1.

                    db $01,$01,$03,$03,$98,$07,$03,$48       ; \ Sprite data. Outside, level 6-3.
                    db $1A,$66,$19,$AA,$01,$01               ; / Total amount of sprites: 4.

                    db $01,$05,$16,$49,$16,$F9,$05,$09       ; \ Sprite data.
                    db $A9,$16,$C9,$03,$0D,$F5,$07,$0D       ;  | Inside the Bob-Omb room, level 6-3.
                    db $27,$0D,$38,$0D,$56,$01,$01,$01       ;  | Total amount of sprites: 8.
                    db $01,$01,$01                           ; /

                    db $01,$09,$14,$95,$14,$A4,$14,$B3       ; \ Sprite data.
                    db $14,$C2,$07,$14,$A7,$14,$BA,$14       ;  | Gigantic vines (vertical), level 6-3.
                    db $C8,$03,$14,$34,$07,$14,$4A,$06       ;  | Total amount of sprites: 17.
                    db $75,$06,$7E,$03,$01,$28,$07,$14       ;  |
                    db $9C,$14,$AD,$14,$BE,$03,$14,$5C       ;  |
                    db $03,$14,$93,$01,$01                   ; /

                    db $01,$01,$01,$01,$01                   ; In the clouds, level 6-3. No sprites used.

                    db $01,$07,$43,$97,$1C,$B3,$44,$B4       ; \ Sprite data. Birdo room, level 6-3.
                    db $01                                   ; / Total amount of sprites: 3.

                    db $01,$03,$5F,$B5,$01                   ; Sprite data. Triclyde boss room, level 6-3. Total amount of sprites: 1.

                    db $03,$42,$2A,$01                       ; Sprite data. First room, level 7-1. Total amount of sprites: 1.

                    db $01,$01,$01,$0D,$09,$8B,$0C,$94       ; \ Sprite data.
                    db $09,$94,$0D,$B8,$0C,$E4,$09,$E4       ;  | Main room in the sky (with Albatosses), level 7-1.
                    db $07,$09,$2B,$0C,$E4,$09,$E4,$0D       ;  | Total amount of sprites: 18.
                    db $0E,$3B,$0C,$54,$09,$54,$09,$6B       ;  |
                    db $0C,$94,$09,$94,$07,$15,$37,$0C       ;  |
                    db $F3,$09,$F3,$01                       ; /

                    db $01,$07,$02,$A8,$06,$B6,$06,$CB       ; \ Sprite data.
                    db $07,$15,$38,$03,$DC,$06,$F3,$05       ;  | Cloud maze, level 7-1.
                    db $0D,$59,$06,$AB,$01                   ; / Total amount of sprites: 8.

                    db $01,$07,$06,$21,$14,$66,$14,$8B       ; \ Sprite data.
                    db $07,$31,$87,$31,$D7,$2F,$D9,$05       ;  | Vertical room to Birdo, level 7-1.
                    db $31,$E0,$31,$63,$01                   ; / Total amount of sprites: 8.

                    db $01,$07,$43,$9A,$1C,$C5,$44,$C6       ; \ Sprite data. Birdo room, level 7-1.
                    db $01                                   ; / Total amount of sprites: 3.

                    db $05,$31,$B9,$31,$C3,$01               ; Sprite data. Room with extras, level 7-1. Total amount of sprites: 2.

                    db $03,$06,$F5,$05,$06,$58,$06,$E8       ; \ Sprite data. Outside, level 7-2.
                    db $03,$0E,$74,$01                       ; / Total amount of sprites: 4.

                    db $01,$07,$01,$99,$01,$D9,$15,$F9       ; \ Sprite data.
                    db $07,$0E,$77,$0E,$A7,$0E,$C7,$03       ;  | First chamber with conveyor belts, level 7-2.
                    db $16,$D9,$01,$05,$25,$1C,$25,$BC       ;  | Total amount of sprites: 10.
                    db $03,$25,$5B,$01                       ; /

                    db $01,$05,$31,$99,$31,$EC,$05,$31       ; \ Sprite data.
                    db $24,$31,$69,$05,$2F,$96,$2F,$E3       ;  | Upper path, horizontal room with Sparkies and chains (also contains a mushroom), level 7-2.
                    db $03,$2F,$3A,$03,$1C,$B7,$01,$07       ;  | Total amount of sprites: 11.
                    db $1C,$B7,$17,$A4,$3D,$B8,$01,$01       ;  | This room is in fact "two" rooms, the part with the mushroom is semi-hidden.
                    db $01                                   ; /

                    db $07,$2F,$B8,$30,$F3,$2E,$FC,$09       ; \ Sprite data.
                    db $2F,$34,$2F,$74,$2F,$A4,$30,$AB       ;  | Bottom path, horizontal room with Sparkies and chains, level 7-2.
                    db $07,$30,$1A,$2F,$79,$30,$F5,$01       ;  | Total amount of sprites: 10.
                    db $01                                   ; /

                    db $09,$2F,$23,$2F,$83,$2F,$E3,$31       ; \ Sprite data.
                    db $CC,$05,$2F,$BB,$2F,$FB,$03,$2F       ;  | Room with locked door leading to the penultimate room, level 7-2.
                    db $53,$09,$31,$29,$2E,$43,$2F,$A3       ;  | Total amount of sprites: 13.
                    db $31,$59,$01,$01,$01,$01,$01,$05       ;  |
                    db $44,$49,$2D,$B7,$01                   ; /

                    db $01,$01,$05,$4A,$1A,$6C,$A7,$01       ; Sprite data. Wart room, level 7-2. Total amount of sprites: 2.

                    db $03,$2F,$8A,$07,$2E,$73,$31,$85       ; \ Sprite data.
                    db $2F,$8C,$05,$31,$87,$2F,$8E,$05       ;  | Bottom path, vertical room with mushroom blocks and Sparkies, level 7-2.
                    db $31,$50,$30,$A0,$01,$01,$01,$0D       ;  | Total amount of sprites: 16.
                    db $31,$61,$31,$A1,$2F,$A3,$31,$68       ;  |
                    db $2F,$5A,$2F,$AA,$05,$2F,$61,$2F       ;  |
                    db $A1,$01,$01                           ; /

                    db $09,$03,$76,$07,$69,$07,$99,$30       ; \ Sprite data.
                    db $8F,$09,$2F,$A2,$31,$73,$31,$68       ;  | Bottom path, vertical conveyor room, level 7-2.
                    db $2E,$AD,$07,$31,$80,$31,$97,$2E       ;  | Total amount of sprites: 13.
                    db $7F,$05,$07,$80,$01,$84,$01           ; /

                    db $05,$31,$9C,$30,$7E,$07,$2F,$35       ; \ Sprite data.
                    db $30,$77,$31,$A8,$05,$31,$67,$31       ;  | Upper path, vertical chain room with Sparkies, level 7-2.
                    db $BA,$01,$09,$30,$42,$31,$82,$30       ;  | Total amount of sprites: 15.
                    db $B2,$2F,$74,$09,$2F,$53,$2F,$93       ;  |
                    db $30,$54,$2F,$76,$01,$01               ; /

                    db $01,$01,$03,$23,$79,$05,$02,$20       ; \ Sprite data. Semi-secret outside room.
                    db $02,$D0,$01                           ; / Total amount of sprites: 3.

                    db $01                                   ; Unused.

                    db $01                                   ; Unused.

                    db $01                                   ; Unused.

                    db $01                                   ; Unused.

                    db $01,$01,$01,$01,$01,$01               ; Unused.